Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 604F4323F66
	for <lists+dri-devel@lfdr.de>; Wed, 24 Feb 2021 16:13:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3770895B6;
	Wed, 24 Feb 2021 15:13:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2044.outbound.protection.outlook.com [40.107.244.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBF6F895B6;
 Wed, 24 Feb 2021 15:13:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PCiEJ4eUiIS1MdnV7exFnZh6SPVRB8K2A39ad2ASEK9cTyHXClkwTnblqXrosU3ddGoqVS9bw40IiR4f7JyouGotNED1V/sgAUPsG5hip9NtdU4q3RpYbYzXYAvgKFS4LZmVMyH2blb9GhXmKIR1UsCpdwcXyw8uugzv61zBo+lb61xG1FMaBGzmpXqRmJper+/+RlQsjeDyHOUt1s6W6j6Cf6e02mbvVK6/IMRU17nPE9d4aM2NP+BcWSzgnPfnDWforgMUdEOx6ndUC7Ew2U+EB+N/NZea/Wfhz9OsbRdd81HtaO3CcEGRnAlM65GxKP4aRkuNlKYOr8phkMC1qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NIZTfBV2tABRp53ZUhrL8ptYcW/zFIqGDNLPELrKl/8=;
 b=Bg5xhl96tx5DcuzKUyDePCmE76lJ6DgpUzKpUwwfSBTIuLquS0cgreoDzMgp9orTKkktHMILSSdinr0Tb1INCtGE7D2mbCQKPBZRemf09V3tAKIh1QYOjkwgob2tMq59otzpireqjWpts2VtRBi5icy2czW2cGIMlDClPNjrsaknIyHhftB3HbjbYStM5VguSjCDxnZYs4CwjKz7y/9oUKmU8J5UWLXG3CY4BUyUJcilmOCV+FVGraRuBQmEmJjR7n66lTmtOje5kU60dr01R3iLaQHlZLBi6lT3EFiFLl+2D0YyeXYh2VjaQSjuLCu7EynwRI8nBgEc7PG6xQ5EZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NIZTfBV2tABRp53ZUhrL8ptYcW/zFIqGDNLPELrKl/8=;
 b=jYMjYgSyfaupZf5euwBDVlBAgIwji7yWe80GfOG2/1wXVkpx1EPKo0W37HCPKdFpO+0z/+trvK4zH+7QckPiucI2CS6jWjSUjXQjI1S7UGtLTLuiWcqV2xDlc2sgydXO5m6eND2VHzNH9EZWG8dHVA/jfYxsgkpv/JP+BCud9fE=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN1PR12MB2479.namprd12.prod.outlook.com (2603:10b6:802:29::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.30; Wed, 24 Feb
 2021 15:13:35 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::41b1:11f5:fd1e:fc5f]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::41b1:11f5:fd1e:fc5f%5]) with mapi id 15.20.3868.033; Wed, 24 Feb 2021
 15:13:35 +0000
Subject: Re: [PATCH v2] drm/scheduler: Fix hang when sched_entity released
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <1613599181-9492-1-git-send-email-andrey.grodzovsky@amd.com>
 <bc2c5ce4-a641-8a5e-bd7b-11174c883e99@gmail.com>
 <6f8dac3e-99eb-1b84-60f9-ee9b24210fbc@amd.com>
 <abcb8ea9-fcb4-a781-bf87-d12f3910e484@gmail.com>
 <74c4a9e1-f1e0-03e5-3c99-755f3cf1b60f@amd.com>
 <bf874237-033c-8eb2-336c-ec79ae9ef941@gmail.com>
 <5e52bd1b-107c-ffea-8d29-aae474047859@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <e0e05866-ac73-0534-f0b0-60c3fa211eee@amd.com>
Date: Wed, 24 Feb 2021 10:13:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <5e52bd1b-107c-ffea-8d29-aae474047859@amd.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:994a:4dd2:59a:30]
X-ClientProxiedBy: YT1PR01CA0043.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::12) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:994a:4dd2:59a:30]
 (2607:fea8:3edf:49b0:994a:4dd2:59a:30) by
 YT1PR01CA0043.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.31 via Frontend Transport; Wed, 24 Feb 2021 15:13:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3e87150e-d91b-4d65-edb0-08d8d8d6c116
X-MS-TrafficTypeDiagnostic: SN1PR12MB2479:
X-Microsoft-Antispam-PRVS: <SN1PR12MB2479EC4039BC2A1FA30A348FEA9F9@SN1PR12MB2479.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:663;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BpTS6DOy1x+e6MBhH831URZMLyqqe6zY73IL6vs0ol3mtDC7fsrdx1WLWSB1V26OAV82qs69Irf7oDwxPppELtkubCSdw5H0G2hSaeA03ptlMJIxRLNjyoGoD8gPDgszB+GFyttjTyqj/bIz99mLCPvBgVbHvKQD3INsgNvxjzhPrshpY22ygFtN0vpHVj5jAGbRvrbkafOPjZRiWpyivGs8my/mQ8QFTTshFK0b5bxjqZdxPtKnFKF4ZjewDAG9KIdwcMmMByo73EVXb2lGu07VoZ09XxC0i0je4pSYMvJPBz1WRxh7DOouZTl+DISxiNfz0QkVH44y+EMo+3bEC+pXxQ4AGQBuX++zOD4AkjXhWdWbITlDW9jmakPftGc8dul36e8eGRFt3pyUp4M4afLa70bi+WcUjya5Zw6Q8uEFRo2U/WNlLkF8WXPWF+TWIsvVQsUf56dN7yfzvjqNPcE3reroJyOXCBDoL5uzJwV04pSEgN+JSOs+yjXfFTBpKgbqvkLU/oTgCnUnQsH6KkZH1UC5vl695L6XurDUR4Cnk8t7gUWe+EYGRMgvhm9xcWuGoIZF4VesoqLidMNEpIybG2UgvraIQdZ7UTfm69k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(346002)(376002)(136003)(396003)(316002)(66574015)(66476007)(8676002)(5660300002)(86362001)(31696002)(44832011)(83380400001)(66946007)(31686004)(36756003)(478600001)(66556008)(6486002)(8936002)(53546011)(16526019)(2616005)(186003)(52116002)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VElHQ2FXRXpOU3JvTE13TnZlL2dYM1pSRWNqMFNkR21vUDg1NnczdWNCRHdE?=
 =?utf-8?B?M2lTNDgxSzl3TlpoQ3ZtRmNtN3VjUEpETmFKZEt3eFJ2OTZlZ1l2MWk1L2ZF?=
 =?utf-8?B?MDJCWmxRY3VsbktUWVJuQkVRSzVJcWVvTDZxZmhMMnJtZmZTYWtOQ0k0WElm?=
 =?utf-8?B?YjRWNUJYUVJOM2xUSW9kTy8xcXBBeDVOT0JzSDJUSlVnWmhCN0lNcUJpK2hy?=
 =?utf-8?B?eXVqdnhKTXVsRHppNitxNEhESHZFWTVoZVNNRlJWVlhCT2pwRjROTUZEdkVD?=
 =?utf-8?B?WVRBdTVtY0g1SGVYMmZiYlZKRnRVbEpjUnZaa1hiemptazNING5ITkJFajNT?=
 =?utf-8?B?dUEyZFU0M2JCWkhVSlVicnNETDJ0R0xQWmxFV2hhcVlwb0lMUXpDYndteW5Q?=
 =?utf-8?B?RzZvRzdPRVhwZ04xam9FMEJEWDMxVGNGMUtXd0FEVlJnNGZpZC9KaEFrTWY0?=
 =?utf-8?B?VGZhY01IUFplY3NoL2RMU05RRlA5aHFObjR2NGwrbHFsSW9sQWZRZVlrZmpz?=
 =?utf-8?B?MmhhY3RaaE9hd1hhVVlwcG5DTkJyVWpkZ2hLTGREMHl3ajhCekJScDFZVlY5?=
 =?utf-8?B?MnU0V3ZUMWFQblFZYWZoMEQrZ1YzdXF5N2o2NFV1RXVwK2hnWmtwcTgyZVJQ?=
 =?utf-8?B?V3RzaW5mSG1jT1BpL3BodHowMUNVNXMyU2F4NWRXR25oVFFYbkhFbzQxbCtF?=
 =?utf-8?B?bmNuWVZtbGU1RDJzTFRPWmc2Y1BTV0EwSVFtQTZEQjFVdS9IT3RCcDNWblBR?=
 =?utf-8?B?MEE1RG5pUHgydVVld2ExbnJHVWMrRDZHMVFzY29INDh0dXFLeUpiWXFzblNW?=
 =?utf-8?B?NGloOTE2aiszSG40RVB4MmFnZXJHSEg0N0JIdnVtQjBxWWtYdnNScytkeFZs?=
 =?utf-8?B?YlhVaGl1Tm1YYTN1enNEeEtaQlc4MUdDMENRWW51WjAxOFBoeUs2ZU1yU1RV?=
 =?utf-8?B?cTFQMTU5SFVKODVPTjVFcVk4ZWZTU3JIMmlSUmpzWGk5OWlCU0I4SzdxTTh4?=
 =?utf-8?B?UzFCaW15Zlcwd1lwaEpacmdJT2c2RVdLSy95WVhHa3ZLS3VILzZZUmlFcGxD?=
 =?utf-8?B?ZlNNVk1lZ2hPdU91TkVjd1BKUFBFYXgwM01iM2tOZS9RRXJvMHVmdHMzU1Vl?=
 =?utf-8?B?UXI4Uk91ODVPVWlSaGI3QzdJa1VFYkpOc0FMQlZYaEhlMkM0V1Q5dWlVY3BJ?=
 =?utf-8?B?QklScFVHVmVRZzg3M2wyZFE5ZUxJNjVjWjhiU21FYWRNTENUeGp4YnVBQUpR?=
 =?utf-8?B?YU95YjE5WXFKMnJWbDQ2SmNEa24xMENZUlI4WXJGRmhRczFVcEh3ZGdaSGdL?=
 =?utf-8?B?cEd3eFJwb2VTYVV0MUVuYTJkVW96clhwbFNFSlE4ZG9vSmtmYjhLVmJBMVI1?=
 =?utf-8?B?ZXJ4azRJQVhnNktzWDV5YVZaYU1henBjWGRkMGdUclhGOTdHekk5S0hRUE9E?=
 =?utf-8?B?dUU4NjZJZzdTT1dCUjRJbW5aREQyWnkyZTMwV1BWN2VlOWZxOTByWExzQS9m?=
 =?utf-8?B?WXFjdjBkMFY3TFBISTJVUldxZk84eFBCbVdoNUlQZ2xScmpQR0l4QTVwemFm?=
 =?utf-8?B?ZkY2QlFGeU93NlQ0eTVwRGVuT1JiRjIzY2RJS2tpOTRQalQ2YnhsTHBzKytU?=
 =?utf-8?B?Uk00cE4xUEtSS1NqekFHazRtSW1UM2pZdUorNWJ4MCswR0trMi9BcVYxRmdS?=
 =?utf-8?B?MHIvTXIwTm96WWVpRlpreXJsZ2JlTk11cEdaZUJRcytvV0VySjFnM296eHN1?=
 =?utf-8?B?Q1FNcG9hbWtHTjNJRVNtRVpBN0xLaEVhQ0ZIL3ZXR2RtaFd3ZGdKaWJ4aU9n?=
 =?utf-8?B?RWtvY3RvSUQ0UzZSNmVBUjNIb3lZSktkK1BTR0Q3Q1JQTGE0NU5lMzgzSGNF?=
 =?utf-8?Q?mmn5yZb9v6I8Q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e87150e-d91b-4d65-edb0-08d8d8d6c116
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 15:13:35.2638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bD18HI2pY7ImfeaKTnc5+fn1wKn2PNPplNooInCRLjvidSu6rtFVhb3WeK2vx6mUccJR3MYxMzXyDr9/0eweBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2479
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UGluZwoKQW5kcmV5CgpPbiAyMDIxLTAyLTIwIDc6MTIgYS5tLiwgQW5kcmV5IEdyb2R6b3Zza3kg
d3JvdGU6Cj4KPiBPbiAyLzIwLzIxIDM6MzggQU0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+
Cj4+Cj4+IEFtIDE4LjAyLjIxIHVtIDE3OjQxIHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+
Pgo+Pj4gT24gMi8xOC8yMSAxMDoxNSBBTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+PiBB
bSAxOC4wMi4yMSB1bSAxNjowNSBzY2hyaWViIEFuZHJleSBHcm9kem92c2t5Ogo+Pj4+Pgo+Pj4+
PiBPbiAyLzE4LzIxIDM6MDcgQU0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+Pj4+Pgo+Pj4+
Pj4KPj4+Pj4+IEFtIDE3LjAyLjIxIHVtIDIyOjU5IHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6
Cj4+Pj4+Pj4gUHJvYmxlbTogSWYgc2NoZWR1bGVyIGlzIGFscmVhZHkgc3RvcHBlZCBieSB0aGUg
dGltZSBzY2hlZF9lbnRpdHkKPj4+Pj4+PiBpcyByZWxlYXNlZCBhbmQgZW50aXR5J3Mgam9iX3F1
ZXVlIG5vdCBlbXB0eSBJIGVuY291bnRyZWQKPj4+Pj4+PiBhIGhhbmcgaW4gZHJtX3NjaGVkX2Vu
dGl0eV9mbHVzaC4gVGhpcyBpcyBiZWNhdXNlIAo+Pj4+Pj4+IGRybV9zY2hlZF9lbnRpdHlfaXNf
aWRsZQo+Pj4+Pj4+IG5ldmVyIGJlY29tZXMgZmFsc2UuCj4+Pj4+Pj4KPj4+Pj4+PiBGaXg6IElu
IGRybV9zY2hlZF9maW5pIGRldGFjaCBhbGwgc2NoZWRfZW50aXRpZXMgZnJvbSB0aGUKPj4+Pj4+
PiBzY2hlZHVsZXIncyBydW4gcXVldWVzLiBUaGlzIHdpbGwgc2F0aXNmeSBkcm1fc2NoZWRfZW50
aXR5X2lzX2lkbGUuCj4+Pj4+Pj4gQWxzbyB3YWtldXAgYWxsIHRob3NlIHByb2Nlc3NlcyBzdHVj
ayBpbiBzY2hlZF9lbnRpdHkgZmx1c2hpbmcKPj4+Pj4+PiBhcyB0aGUgc2NoZWR1bGVyIG1haW4g
dGhyZWFkIHdoaWNoIHdha2VzIHRoZW0gdXAgaXMgc3RvcHBlZCBieSBub3cuCj4+Pj4+Pj4KPj4+
Pj4+PiB2MjoKPj4+Pj4+PiBSZXZlcnNlIG9yZGVyIG9mIGRybV9zY2hlZF9ycV9yZW1vdmVfZW50
aXR5IGFuZCBtYXJraW5nCj4+Pj4+Pj4gc19lbnRpdHkgYXMgc3RvcHBlZCB0byBwcmV2ZW50IHJl
aW5zZXJpb24gYmFjayB0byBycSBkdWUKPj4+Pj4+PiB0byByYWNlLgo+Pj4+Pj4+Cj4+Pj4+Pj4g
U2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5j
b20+Cj4+Pj4+Pj4gLS0tCj4+Pj4+Pj4gwqAgZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hl
ZF9tYWluLmMgfCAzMSAKPj4+Pj4+PiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+
Pj4+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKykKPj4+Pj4+Pgo+Pj4+Pj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYyAKPj4+
Pj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jCj4+Pj4+Pj4gaW5k
ZXggOTA4YjBiNS4uYzZiNzk0NyAxMDA2NDQKPj4+Pj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
c2NoZWR1bGVyL3NjaGVkX21haW4uYwo+Pj4+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hl
ZHVsZXIvc2NoZWRfbWFpbi5jCj4+Pj4+Pj4gQEAgLTg5Nyw5ICs4OTcsNDAgQEAgRVhQT1JUX1NZ
TUJPTChkcm1fc2NoZWRfaW5pdCk7Cj4+Pj4+Pj4gwqDCoCAqLwo+Pj4+Pj4+IMKgIHZvaWQgZHJt
X3NjaGVkX2Zpbmkoc3RydWN0IGRybV9ncHVfc2NoZWR1bGVyICpzY2hlZCkKPj4+Pj4+PiDCoCB7
Cj4+Pj4+Pj4gK8KgwqDCoCBpbnQgaTsKPj4+Pj4+PiArwqDCoMKgIHN0cnVjdCBkcm1fc2NoZWRf
ZW50aXR5ICpzX2VudGl0eTsKPj4+Pj4+Cj4+Pj4+PiBCVFc6IFBsZWFzZSBvcmRlciB0aGF0IHNv
IHRoYXQgaSBpcyBkZWNsYXJlZCBsYXN0Lgo+Pj4+Pj4KPj4+Pj4+PiDCoMKgwqDCoMKgIGlmIChz
Y2hlZC0+dGhyZWFkKQo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBrdGhyZWFkX3N0b3Aoc2No
ZWQtPnRocmVhZCk7Cj4+Pj4+Pj4gwqAgK8KgwqDCoCAvKiBEZXRhY2ggYWxsIHNjaGVkX2VudGl0
ZXMgZnJvbSB0aGlzIHNjaGVkdWxlciBvbmNlIGl0J3MgCj4+Pj4+Pj4gc3RvcHBlZCAqLwo+Pj4+
Pj4+ICvCoMKgwqAgZm9yIChpID0gRFJNX1NDSEVEX1BSSU9SSVRZX0NPVU5UIC0gMTsgaSA+PSAK
Pj4+Pj4+PiBEUk1fU0NIRURfUFJJT1JJVFlfTUlOOyBpLS0pIHsKPj4+Pj4+PiArwqDCoMKgwqDC
oMKgwqAgc3RydWN0IGRybV9zY2hlZF9ycSAqcnEgPSAmc2NoZWQtPnNjaGVkX3JxW2ldOwo+Pj4+
Pj4+ICsKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCFycSkKPj4+Pj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBjb250aW51ZTsKPj4+Pj4+PiArCj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKg
IC8qIExvb3AgdGhpcyB3YXkgYmVjYXVzZSBycS0+bG9jayBpcyB0YWtlbiBpbiAKPj4+Pj4+PiBk
cm1fc2NoZWRfcnFfcmVtb3ZlX2VudGl0eSAqLwo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBzcGlu
X2xvY2soJnJxLT5sb2NrKTsKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgd2hpbGUgKChzX2VudGl0
eSA9IGxpc3RfZmlyc3RfZW50cnlfb3JfbnVsbCgmcnEtPmVudGl0aWVzLAo+Pj4+Pj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBzdHJ1Y3QgZHJtX3NjaGVkX2VudGl0eSwKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbGlzdCkpKSB7Cj4+Pj4+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3Bpbl91bmxvY2soJnJxLT5sb2NrKTsKPj4+Pj4+
PiArCj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogUHJldmVudCByZWluc2VydGlv
biBhbmQgcmVtb3ZlICovCj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3Bpbl9sb2Nr
KCZzX2VudGl0eS0+cnFfbG9jayk7Cj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc19l
bnRpdHktPnN0b3BwZWQgPSB0cnVlOwo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRy
bV9zY2hlZF9ycV9yZW1vdmVfZW50aXR5KHJxLCBzX2VudGl0eSk7Cj4+Pj4+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgc3Bpbl91bmxvY2soJnNfZW50aXR5LT5ycV9sb2NrKTsKPj4+Pj4+Cj4+
Pj4+PiBXZWxsIHRoaXMgc3Bpbl91bmxvY2svbG9jayBkYW5jZSBoZXJlIGRvZXNuJ3QgbG9vayBj
b3JyZWN0IGF0IGFsbCAKPj4+Pj4+IG5vdy4KPj4+Pj4+Cj4+Pj4+PiBDaHJpc3RpYW4uCj4+Pj4+
Cj4+Pj4+Cj4+Pj4+IEluIHdoYXQgd2F5ID8gSXQncyBpbiB0aGUgc2FtZSBzYW1lIG9yZGVyIGFz
IGluIG90aGVyIGNhbGwgc2l0ZXMgCj4+Pj4+IChzZWUgZHJtX3NjaGVkX2VudGl0eV9wdXNoX2pv
YiBhbmQgZHJtX3NjaGVkX2VudGl0eV9mbHVzaCkuCj4+Pj4+IElmIGkganVzdCBsb2NrZWQgcnEt
PmxvY2sgYW5kIGRpZCBsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUgd2hpbGUgCj4+Pj4+IG1hbnVh
bGx5IGRlbGV0aW5nIGVudGl0eS0+bGlzdCBpbnN0ZWFkIG9mIGNhbGxpbmcKPj4+Pj4gZHJtX3Nj
aGVkX3JxX3JlbW92ZV9lbnRpdHkgdGhpcyBzdGlsbCB3b3VsZCBub3QgYmUgcG9zc2libGUgYXMg
dGhlIAo+Pj4+PiBvcmRlciBvZiBsb2NrIGFjcXVpc2l0aW9uIGJldHdlZW4gc19lbnRpdHktPnJx
X2xvY2sKPj4+Pj4gYW5kIHJxLT5sb2NrIHdvdWxkIGJlIHJldmVyc2UgY29tcGFyZWQgdG8gdGhl
IGNhbGwgc2l0ZXMgbWVudGlvbmVkIAo+Pj4+PiBhYm92ZS4KPj4+Pgo+Pj4+IEFoLCBub3cgSSB1
bmRlcnN0YW5kLiBZb3UgbmVlZCB0aGlzIGJlY2F1c2UgCj4+Pj4gZHJtX3NjaGVkX3JxX3JlbW92
ZV9lbnRpdHkoKSB3aWxsIGdyYWIgdGhlIHJxIGxvY2sgYWdhaW4hCj4+Pj4KPj4+PiBQcm9ibGVt
IGlzIG5vdyB3aGF0IHByZXZlbnRzIHRoZSBlbnRpdHkgZnJvbSBiZWluZyBkZXN0cm95ZWQgd2hp
bGUgCj4+Pj4geW91IHJlbW92ZSBpdD8KPj4+Pgo+Pj4+IENocmlzdGlhbi4KPj4+Cj4+PiBSaWdo
dCwgd2VsbCwgc2luY2UgKHVuZm9ydHVuYXRlbHkpIHNjaGVkX2VudGl0eSBpcyBwYXJ0IG9mIAo+
Pj4gYW1kZ3B1X2N0eF9lbnRpdHkgYW5kIGFtZGdwdV9jdHhfZW50aXR5IGlzIHJlZmNvdW50ZWQK
Pj4+IHRoZXJlIGlzIGEgcHJvYmxlbSBoZXJlIHRoYXQgd2UgZG9uJ3QgaW5jcmVtZW50IGFtZGdw
dV9jdHgucmVmY291bnQgCj4+PiB3aGVuIGFzc2lnbmluZ8KgIHNjaGVkX2VudGl0eQo+Pj4gdG8g
bmV3IHJxIChlLmcuIGJlZm9yZSBkcm1fc2NoZWRfcnFfYWRkX2VudGl0eSkgYW5kIG5vdCBkZWNy
ZW1lbnQgCj4+PiBiZWZvcmUgcmVtb3ZpbmcuIFdlIGRvIGl0IGZvcgo+Pj4gYW1kZ3B1X2NzX3Bh
cnNlci5lbnRpdHkgZm9yIGV4YW1wbGUgKGluIGFtZGdwdV9jc19wYXJzZXJfaW5pdCBhbmQgCj4+
PiBhbWRncHVfY3NfcGFyc2VyX2ZpbmkgYnkKPj4+IGNhbGxpbmcgYW1kZ3B1X2N0eF9nZXQgYW5k
IGFtZGdwdV9jdHhfcHV0KS4gQnV0IHRoaXMgc2VlbXMgYSBiaXQgCj4+PiB0cmlja3kgZHVlIHRv
IGFsbCB0aGUgZHJtX3NjaGVkX2VudGl0eV9zZWxlY3RfcnEKPj4+IGxvZ2ljLgo+Pj4KPj4+IEFu
b3RoZXIsIGtpbmQgb2YgYSBiYW5kIGFpZCBmaXgsIHdvdWxkIHByb2JhYmx5IGJlIGp1c3QgbG9j
a2luZyAKPj4+IGFtZGdwdV9jdHhfbWdyLmxvY2sgYXJvdW5kIGRybV9zY2hlZF9maW5pCj4+PiB3
aGVuIGZpbmFsaXppbmcgdGhlIGZlbmNlIGRyaXZlciBhbmQgYXJvdW5kIGlkciBpdGVyYXRpb24g
aW4gCj4+PiBhbWRncHVfY3R4X21ncl9maW5pICh3aGljaCBzaG91bGQgYmUgbG9jayBwcm90ZWN0
ZWQKPj4+IGFueXdheSBhcyBJIHNlZSBmcm9tIG90aGVyIGlkciB1c2FnZXMgaW4gdGhlIGNvZGUp
IC4uLiBUaGlzIHNob3VsZCAKPj4+IHByZXZlbnQgdGhpcyB1c2UgYWZ0ZXIgZnJlZS4KPj4KPj4g
UHVoLCB0aGF0J3MgcmF0aGVyIGNvbXBsaWNhdGVkIGFzIHdlbGwuIE9rIGxldCdzIGxvb2sgYXQg
aXQgZnJvbSB0aGUgCj4+IG90aGVyIHNpZGUgZm9yIGEgbW9tZW50Lgo+Pgo+PiBXaHkgZG8gd2Ug
aGF2ZSB0byByZW1vdmUgdGhlIGVudGl0aWVzIGZyb20gdGhlIHJxIGluIHRoZSBmaXJzdCBwbGFj
ZT8KPj4KPj4gV291bGRuJ3QgaXQgYmUgc3VmZmljaWVudCB0byBqdXN0IHNldCBhbGwgb2YgdGhl
bSB0byBzdG9wcGVkPwo+Pgo+PiBDaHJpc3RpYW4uCj4KPgo+IEFuZCBhZGRpbmcgaXQgYXMgYW5v
dGhlcsKgIGNvbmRpdGlvbiBpbiBkcm1fc2NoZWRfZW50aXR5X2lzX2lkbGUgPwo+Cj4gQW5kcmV5
Cj4KPgo+Pgo+Pj4KPj4+IEFuZHJleQo+Pj4KPj4+Cj4+Pj4KPj4+Pj4KPj4+Pj4gQW5kcmV5Cj4+
Pj4+Cj4+Pj4+Cj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4+ICsKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBzcGluX2xvY2soJnJxLT5sb2NrKTsKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgfQo+
Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBzcGluX3VubG9jaygmcnEtPmxvY2spOwo+Pj4+Pj4+ICsK
Pj4+Pj4+PiArwqDCoMKgIH0KPj4+Pj4+PiArCj4+Pj4+Pj4gK8KgwqDCoCAvKiBXYWtldXAgZXZl
cnlvbmUgc3R1Y2sgaW4gZHJtX3NjaGVkX2VudGl0eV9mbHVzaCBmb3IgdGhpcyAKPj4+Pj4+PiBz
Y2hlZHVsZXIgKi8KPj4+Pj4+PiArwqDCoMKgIHdha2VfdXBfYWxsKCZzY2hlZC0+am9iX3NjaGVk
dWxlZCk7Cj4+Pj4+Pj4gKwo+Pj4+Pj4+IMKgwqDCoMKgwqAgLyogQ29uZmlybSBubyB3b3JrIGxl
ZnQgYmVoaW5kIGFjY2Vzc2luZyBkZXZpY2Ugc3RydWN0dXJlcyAqLwo+Pj4+Pj4+IGNhbmNlbF9k
ZWxheWVkX3dvcmtfc3luYygmc2NoZWQtPndvcmtfdGRyKTsKPj4+Pj4+Cj4+Pj4KPj4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
