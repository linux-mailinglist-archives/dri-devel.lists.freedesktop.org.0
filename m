Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 697373252F5
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 17:03:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2C846ECCD;
	Thu, 25 Feb 2021 16:03:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2054.outbound.protection.outlook.com [40.107.236.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F8826ECAC;
 Thu, 25 Feb 2021 16:03:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mhBDBGdwt6ufEJA6ha1VGmXA40EZze6BM8HhIiMI4g6AKAStTYThBFkeBAUu1tQMb1/btrUVFXm7p8eVLjVwcPIJxktx496T+08SIfByXMZn5akIuKJLFLLLj770hahdpOdTtxOUClbkxYAdb7Pud+JrlQ9anbgsVU6ezVgzw1bYz20hTXdJcst9KTkvQxVbHriFtyL8zTik4/IOT9tlq/rOGI5OVIwRcsMPExa5kIhzF5ufe9HP7fv0TqBWRHNEH/hdYQ9teH8qSrCpa4wzr0iF//31y14kH+hb525UX3p4QzSYymuWfUbdR4B7JXDS6nd1WQ5iTG6Yial6hX5mTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fDdnBtQnDDwB9V5P7Lj/JWdJN0yb7HDYLvInr9lCFfo=;
 b=R6b4OpkuWYdgLIs3MbdVghvkTY2uDzQsDJ/AWXir9bermYt5QMdPel5ZOJ1Ua96KwXtlL6oHjWhhjsJnFa4TwhJD0TG3TVVeS02vI0uxLIPOTX9BbNUsV1zsa1yRx1/7fKHwaG0iqX117p1h/E4JdZ2aUdXwixNzBJmPkz7OQP1LVsA9+yXQ5LcIjyL7C70fKaef4KVG8P967KOsDQDgLPNz8VkdscEOiUfnLApuw7BTZl2Wm9yKuyfvpk0C3ZlkUk4wKgDa6gVKQEt8LwW0a1TcD1amC0La99jsM7QRBtpNoCOJziqdvCIzuMSrwpQq8Slbgvjgh2oHgyIBEG93rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fDdnBtQnDDwB9V5P7Lj/JWdJN0yb7HDYLvInr9lCFfo=;
 b=Pk8GLwJp5g2y1QXF8/M/tTWrdMdQ9K+yVl99MHYcPn0quOBDVSfZAsf5tDjGqEPTrqrY7V49RcIdPwuG8k5nDqbYq7K2fFNC5G81LxOWyjcVAi44pAPh/wvSBE6EiD/MS48X45sIhChD08wSnFghRJ1p/L1uHbYRiU4CSjqLjoQ=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4615.namprd12.prod.outlook.com (2603:10b6:a03:96::21)
 by BYAPR12MB3110.namprd12.prod.outlook.com (2603:10b6:a03:d7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.33; Thu, 25 Feb
 2021 16:03:18 +0000
Received: from BYAPR12MB4615.namprd12.prod.outlook.com
 ([fe80::5cbd:c5a8:779:9672]) by BYAPR12MB4615.namprd12.prod.outlook.com
 ([fe80::5cbd:c5a8:779:9672%7]) with mapi id 15.20.3868.033; Thu, 25 Feb 2021
 16:03:18 +0000
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
 <e0e05866-ac73-0534-f0b0-60c3fa211eee@amd.com>
 <85d4cf33-b8b9-23f6-7ca4-abdb98f0cd5e@gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <c6e9ed57-fb7f-8dec-ce2a-187d5bd7b1a9@amd.com>
Date: Thu, 25 Feb 2021 11:03:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <85d4cf33-b8b9-23f6-7ca4-abdb98f0cd5e@gmail.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:4771:7d48:3bd5:98a]
X-ClientProxiedBy: YTBPR01CA0017.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::30) To BYAPR12MB4615.namprd12.prod.outlook.com
 (2603:10b6:a03:96::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:4771:7d48:3bd5:98a]
 (2607:fea8:3edf:49b0:4771:7d48:3bd5:98a) by
 YTBPR01CA0017.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.20 via Frontend Transport; Thu, 25 Feb 2021 16:03:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 56c5c0dd-8c18-4e86-43f3-08d8d9a6dd8d
X-MS-TrafficTypeDiagnostic: BYAPR12MB3110:
X-Microsoft-Antispam-PRVS: <BYAPR12MB3110CB752BB63D7DB0FFCEC7EA9E9@BYAPR12MB3110.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1060;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zGH4JbqWfYESyG5c6sgxNUQSiEy89KPlbcoYiJDdqk0hygYUbc+c/+JPhaVh5nBrVQtGSHZjdYvzyo9My0a3J5nVJ3OALsPqSe56f4oPA1Emxuu505LGVMTQihFmztvskxFxxul0bzCMotfi1pH9PqpNeA7YqWfJuFBmxyZvcpIzI07G7xdCNMb7Wg5LmDoizc0Fpz33GLxC9JgHJt2uesMfujZ28L5MvUN9NTfKYoOBp2OtYiGoo85oWACmB1zXpBdTyTXRif0y8eEDXdnIhTvFifrg2b8f5TWYh4wlRnMRuVSD3DBCQIKCleOJ9XJm592nHWS+DPSHXgMH/eLzBkBqIj15+AS9DnknV8/q1h2BRprNswT+8kgljvF+iBOmWJ3+YWAng8J2vlj0wPL8+sFtFho4qZwzY5Q+G+zf5PCNCTVbQFcrh8aufocDi78vjjxcxSQqfdHaNFo59ykbzqHVU+/m0y7/rgMvxZrjJjvWZYlIBh84beLjvXhXvVVvQqCC6Fg3uVLBNCjdxPe47FZqm6z5jzLa3xTFyAAkkz13cjf8dRbPkx4dcoIDzHCJ6msdI2RzyMwYYt2jjo9lBqIaxsOLybV0eJtbqklKHZc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(39860400002)(346002)(366004)(136003)(6486002)(8936002)(2906002)(66946007)(16526019)(31686004)(8676002)(186003)(31696002)(86362001)(316002)(66574015)(83380400001)(66556008)(44832011)(36756003)(478600001)(53546011)(2616005)(66476007)(5660300002)(52116002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VzVVZGxEUi9KcnVXTzFRWEF1QXZhdGFnYlRpSGJyNzBCU3lxRVppd1VUbnZN?=
 =?utf-8?B?SmpxNnRqMHhzTnVmcFhUWEZLWGdCNkNYaWZBbXU3WVdLWHkyYjMyOHBiWXFr?=
 =?utf-8?B?NmVrQWVuREpGU3lwVWc2T1ZXY0wrWXYySjE4cWJSZEFuNlpPV0ZTT1pCTHow?=
 =?utf-8?B?V1NGYlIrYzcva0RNQlVCM1hkZ3g1Q2FrQVFUM2RUUE1jbEVkQ2wyaklhUXg3?=
 =?utf-8?B?TGt5V3F5aXNvdG5LcjArNmVZZzBVUG4xeGpOVnJWd0N3QkxnSGZwaVdjdXgx?=
 =?utf-8?B?Q213elI0RGJuSmszUjJadVhHYTA2YVZVTi9nVGt6S3FtWjhlcnlEbXY1a0h5?=
 =?utf-8?B?bXN6SzJnSDRMZWJZYzVZR1NmbEx4QTh0bk04V0d3Mko4SjUvdmZiK3VaVWpQ?=
 =?utf-8?B?cXVyOUx2TXlEWk53d0JmWkpaVUhsQ0ZmRXF3bzFFWTBxL21hempPY3IyWmU0?=
 =?utf-8?B?WTVhc2RXQ2ZSZmV3aDJNVGdZZ0wwbG16TzBqU0hVTkI4cUV5TStBQ0JOTDRB?=
 =?utf-8?B?dkp6amlMci9hS3BTWDIwTjhjc1RMTW4vaGwvaHJKQ1BLU3plak52ZXo0ZGh4?=
 =?utf-8?B?Z3Bwak1abVJpNDdUVjVuNHRaMDd5REFuUm1TSzVIOVZVL04vd2N1UXRWY3ZP?=
 =?utf-8?B?YjlhdVNScm9JR3BienR5ZTZCTjVIVkdreTIwN2JYVFNOR0J4OFJ6bEdFbjRN?=
 =?utf-8?B?d283VEVLNVB5U081Ulk0dkZyT0plSXRFamUwRkR2bnNJOHBuSHdIQUk0V1J0?=
 =?utf-8?B?WGpUczRidUpJRmVyY055ajF6Q09TSStyUmFnalJVTG9wcnZ1RWl3QVJ3R3BX?=
 =?utf-8?B?aURYdjk3V0J6a2tEY241YlZNQWdHeklObWhpSitqMVRXK0w2SCs4YkR2S282?=
 =?utf-8?B?M20rckx1c1JWRWdqTXZFRHRwMmVmTnRON3AvZnd2SnFZQkpCbHd3NUNLMGda?=
 =?utf-8?B?VnJrMTlQZWU0T1lETGlERUhkWUxVcE1kRldldVNDWHFCZTNCLzBjOUZaa3d6?=
 =?utf-8?B?QWMxWVVLNU9WRjgrSUtHRTdrcGcyUTZnaHowTmhoZ2hRQ240UFNaNGhPMm9T?=
 =?utf-8?B?QmdLK1dUUStoejNlWG84ZEo5c0VjMlRVMTdVOFp4d0VNc3BYOHlxZ3pCVC9u?=
 =?utf-8?B?d1ZEWFJyUUpMSGpmWitvTkpDaGZMVWUxUzhXRUtlWjRGSVZLb2t3VmJjNkRV?=
 =?utf-8?B?RjVkNzlRWDAvYjRPKzdlYmJvTS83aGw0UEpwWkNKc2gyaDFVNTVxWHVyQ3lK?=
 =?utf-8?B?TGRGZ2E5VHBiZnV0RTFNeHpJYUZTcEFES0xkSTRVdFZ6bHlycDExZjJKbFkv?=
 =?utf-8?B?cHJUTkNRWG5SdGFYd3BYMWFEU0pHVDNXUFVIVGNlaE9IaTRFQ1JNbUErMVRY?=
 =?utf-8?B?Njd3bElsRkpOaGVGMVI3RU9EM09IYlovdEJjWjRTQy85ZGxHUEErTFg5aWJG?=
 =?utf-8?B?UzdMVlA3Z01ta0NyNS9BbjlyZll4djZ5aER2TzJHZlUwdWVJS3JVVVF0UDlB?=
 =?utf-8?B?cVlGV1I0VDhnaVZUU3RUdDZBUmViN01WSVc4MEZFUDVET2FpZ25vMk1PTE9E?=
 =?utf-8?B?QzgxS3RReTFtSWQ3aW1MMEM1VmZXemd3VzEwQzdOZ3p0dEw3RnNQN3EvblFN?=
 =?utf-8?B?RitXVmVjME5OTFJUNG9tMGhjaTJZVllNVHdiak1Yc0NlNlRwVGt5VmVUMGoz?=
 =?utf-8?B?alZ1Y0x6cFVwSDB0ZzcwV3JXYWJFUzBLUjlwN1FzOEFmdWVFTzA5NWFEcWR3?=
 =?utf-8?B?Z1pzVldtOUF3ZkJNVnhTdVFVenlrTmZDK2ptUitPaW9yV3Z3TjV2SVE4UVFN?=
 =?utf-8?B?WUNHK25YNktTT29ONitzRmtqQkJ6Q1RJeUpyQjJhMUMvOE5YOGxsdUxPd3ls?=
 =?utf-8?Q?3obr4xTAWBPpF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56c5c0dd-8c18-4e86-43f3-08d8d9a6dd8d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2021 16:03:17.9925 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o+VqG6xZBVZ1EpFKi2BFylfmgvl9er9qkJXHFfTB3izZaIP21QYXhx/sa8i1MamA+Ei6zp4tU+uni5UijrAFuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3110
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

Ck9uIDIwMjEtMDItMjUgMjo1MyBhLm0uLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+IEFtIDI0
LjAyLjIxIHVtIDE2OjEzIHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+IFBpbmcKPgo+IFNv
cnJ5LCBJJ3ZlIGJlZW4gb24gdmFjYXRpb24gdGhpcyB3ZWVrLgo+Cj4+Cj4+IEFuZHJleQo+Pgo+
PiBPbiAyMDIxLTAyLTIwIDc6MTIgYS5tLiwgQW5kcmV5IEdyb2R6b3Zza3kgd3JvdGU6Cj4+Pgo+
Pj4gT24gMi8yMC8yMSAzOjM4IEFNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4+Cj4+Pj4K
Pj4+PiBBbSAxOC4wMi4yMSB1bSAxNzo0MSBzY2hyaWViIEFuZHJleSBHcm9kem92c2t5Ogo+Pj4+
Pgo+Pj4+PiBPbiAyLzE4LzIxIDEwOjE1IEFNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4+
Pj4gQW0gMTguMDIuMjEgdW0gMTY6MDUgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPj4+Pj4+
Pgo+Pj4+Pj4+IE9uIDIvMTgvMjEgMzowNyBBTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+
Pj4+Pj4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gQW0gMTcuMDIuMjEgdW0gMjI6NTkgc2NocmllYiBBbmRy
ZXkgR3JvZHpvdnNreToKPj4+Pj4+Pj4+IFByb2JsZW06IElmIHNjaGVkdWxlciBpcyBhbHJlYWR5
IHN0b3BwZWQgYnkgdGhlIHRpbWUgc2NoZWRfZW50aXR5Cj4+Pj4+Pj4+PiBpcyByZWxlYXNlZCBh
bmQgZW50aXR5J3Mgam9iX3F1ZXVlIG5vdCBlbXB0eSBJIGVuY291bnRyZWQKPj4+Pj4+Pj4+IGEg
aGFuZyBpbiBkcm1fc2NoZWRfZW50aXR5X2ZsdXNoLiBUaGlzIGlzIGJlY2F1c2UgCj4+Pj4+Pj4+
PiBkcm1fc2NoZWRfZW50aXR5X2lzX2lkbGUKPj4+Pj4+Pj4+IG5ldmVyIGJlY29tZXMgZmFsc2Uu
Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gRml4OiBJbiBkcm1fc2NoZWRfZmluaSBkZXRhY2ggYWxsIHNj
aGVkX2VudGl0aWVzIGZyb20gdGhlCj4+Pj4+Pj4+PiBzY2hlZHVsZXIncyBydW4gcXVldWVzLiBU
aGlzIHdpbGwgc2F0aXNmeSAKPj4+Pj4+Pj4+IGRybV9zY2hlZF9lbnRpdHlfaXNfaWRsZS4KPj4+
Pj4+Pj4+IEFsc28gd2FrZXVwIGFsbCB0aG9zZSBwcm9jZXNzZXMgc3R1Y2sgaW4gc2NoZWRfZW50
aXR5IGZsdXNoaW5nCj4+Pj4+Pj4+PiBhcyB0aGUgc2NoZWR1bGVyIG1haW4gdGhyZWFkIHdoaWNo
IHdha2VzIHRoZW0gdXAgaXMgc3RvcHBlZCBieSAKPj4+Pj4+Pj4+IG5vdy4KPj4+Pj4+Pj4+Cj4+
Pj4+Pj4+PiB2MjoKPj4+Pj4+Pj4+IFJldmVyc2Ugb3JkZXIgb2YgZHJtX3NjaGVkX3JxX3JlbW92
ZV9lbnRpdHkgYW5kIG1hcmtpbmcKPj4+Pj4+Pj4+IHNfZW50aXR5IGFzIHN0b3BwZWQgdG8gcHJl
dmVudCByZWluc2VyaW9uIGJhY2sgdG8gcnEgZHVlCj4+Pj4+Pj4+PiB0byByYWNlLgo+Pj4+Pj4+
Pj4KPj4+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3Jv
ZHpvdnNreUBhbWQuY29tPgo+Pj4+Pj4+Pj4gLS0tCj4+Pj4+Pj4+PiDCoCBkcml2ZXJzL2dwdS9k
cm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYyB8IDMxIAo+Pj4+Pj4+Pj4gKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKwo+Pj4+Pj4+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDMxIGluc2VydGlv
bnMoKykKPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Nj
aGVkdWxlci9zY2hlZF9tYWluLmMgCj4+Pj4+Pj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVs
ZXIvc2NoZWRfbWFpbi5jCj4+Pj4+Pj4+PiBpbmRleCA5MDhiMGI1Li5jNmI3OTQ3IDEwMDY0NAo+
Pj4+Pj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMKPj4+
Pj4+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jCj4+Pj4+
Pj4+PiBAQCAtODk3LDkgKzg5Nyw0MCBAQCBFWFBPUlRfU1lNQk9MKGRybV9zY2hlZF9pbml0KTsK
Pj4+Pj4+Pj4+IMKgwqAgKi8KPj4+Pj4+Pj4+IMKgIHZvaWQgZHJtX3NjaGVkX2Zpbmkoc3RydWN0
IGRybV9ncHVfc2NoZWR1bGVyICpzY2hlZCkKPj4+Pj4+Pj4+IMKgIHsKPj4+Pj4+Pj4+ICvCoMKg
wqAgaW50IGk7Cj4+Pj4+Pj4+PiArwqDCoMKgIHN0cnVjdCBkcm1fc2NoZWRfZW50aXR5ICpzX2Vu
dGl0eTsKPj4+Pj4+Pj4KPj4+Pj4+Pj4gQlRXOiBQbGVhc2Ugb3JkZXIgdGhhdCBzbyB0aGF0IGkg
aXMgZGVjbGFyZWQgbGFzdC4KPj4+Pj4+Pj4KPj4+Pj4+Pj4+IMKgwqDCoMKgwqAgaWYgKHNjaGVk
LT50aHJlYWQpCj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAga3RocmVhZF9zdG9wKHNjaGVk
LT50aHJlYWQpOwo+Pj4+Pj4+Pj4gwqAgK8KgwqDCoCAvKiBEZXRhY2ggYWxsIHNjaGVkX2VudGl0
ZXMgZnJvbSB0aGlzIHNjaGVkdWxlciBvbmNlIAo+Pj4+Pj4+Pj4gaXQncyBzdG9wcGVkICovCj4+
Pj4+Pj4+PiArwqDCoMKgIGZvciAoaSA9IERSTV9TQ0hFRF9QUklPUklUWV9DT1VOVCAtIDE7IGkg
Pj0gCj4+Pj4+Pj4+PiBEUk1fU0NIRURfUFJJT1JJVFlfTUlOOyBpLS0pIHsKPj4+Pj4+Pj4+ICvC
oMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX3NjaGVkX3JxICpycSA9ICZzY2hlZC0+c2NoZWRfcnFb
aV07Cj4+Pj4+Pj4+PiArCj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCFycSkKPj4+Pj4+
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnRpbnVlOwo+Pj4+Pj4+Pj4gKwo+Pj4+Pj4+
Pj4gK8KgwqDCoMKgwqDCoMKgIC8qIExvb3AgdGhpcyB3YXkgYmVjYXVzZSBycS0+bG9jayBpcyB0
YWtlbiBpbiAKPj4+Pj4+Pj4+IGRybV9zY2hlZF9ycV9yZW1vdmVfZW50aXR5ICovCj4+Pj4+Pj4+
PiArwqDCoMKgwqDCoMKgwqAgc3Bpbl9sb2NrKCZycS0+bG9jayk7Cj4+Pj4+Pj4+PiArwqDCoMKg
wqDCoMKgwqAgd2hpbGUgKChzX2VudGl0eSA9IAo+Pj4+Pj4+Pj4gbGlzdF9maXJzdF9lbnRyeV9v
cl9udWxsKCZycS0+ZW50aXRpZXMsCj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGRybV9zY2hlZF9l
bnRpdHksCj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbGlzdCkpKSB7Cj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBzcGluX3VubG9jaygmcnEtPmxvY2spOwo+Pj4+Pj4+Pj4gKwo+Pj4+Pj4+Pj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogUHJldmVudCByZWluc2VydGlvbiBhbmQgcmVtb3Zl
ICovCj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzcGluX2xvY2soJnNfZW50aXR5
LT5ycV9sb2NrKTsKPj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNfZW50aXR5LT5z
dG9wcGVkID0gdHJ1ZTsKPj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRybV9zY2hl
ZF9ycV9yZW1vdmVfZW50aXR5KHJxLCBzX2VudGl0eSk7Cj4+Pj4+Pj4+PiArIHNwaW5fdW5sb2Nr
KCZzX2VudGl0eS0+cnFfbG9jayk7Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFdlbGwgdGhpcyBzcGluX3Vu
bG9jay9sb2NrIGRhbmNlIGhlcmUgZG9lc24ndCBsb29rIGNvcnJlY3QgYXQgCj4+Pj4+Pj4+IGFs
bCBub3cuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IENocmlzdGlhbi4KPj4+Pj4+Pgo+Pj4+Pj4+Cj4+Pj4+
Pj4gSW4gd2hhdCB3YXkgPyBJdCdzIGluIHRoZSBzYW1lIHNhbWUgb3JkZXIgYXMgaW4gb3RoZXIg
Y2FsbCBzaXRlcyAKPj4+Pj4+PiAoc2VlIGRybV9zY2hlZF9lbnRpdHlfcHVzaF9qb2IgYW5kIGRy
bV9zY2hlZF9lbnRpdHlfZmx1c2gpLgo+Pj4+Pj4+IElmIGkganVzdCBsb2NrZWQgcnEtPmxvY2sg
YW5kIGRpZCBsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUgd2hpbGUgCj4+Pj4+Pj4gbWFudWFsbHkg
ZGVsZXRpbmcgZW50aXR5LT5saXN0IGluc3RlYWQgb2YgY2FsbGluZwo+Pj4+Pj4+IGRybV9zY2hl
ZF9ycV9yZW1vdmVfZW50aXR5IHRoaXMgc3RpbGwgd291bGQgbm90IGJlIHBvc3NpYmxlIGFzIAo+
Pj4+Pj4+IHRoZSBvcmRlciBvZiBsb2NrIGFjcXVpc2l0aW9uIGJldHdlZW4gc19lbnRpdHktPnJx
X2xvY2sKPj4+Pj4+PiBhbmQgcnEtPmxvY2sgd291bGQgYmUgcmV2ZXJzZSBjb21wYXJlZCB0byB0
aGUgY2FsbCBzaXRlcyAKPj4+Pj4+PiBtZW50aW9uZWQgYWJvdmUuCj4+Pj4+Pgo+Pj4+Pj4gQWgs
IG5vdyBJIHVuZGVyc3RhbmQuIFlvdSBuZWVkIHRoaXMgYmVjYXVzZSAKPj4+Pj4+IGRybV9zY2hl
ZF9ycV9yZW1vdmVfZW50aXR5KCkgd2lsbCBncmFiIHRoZSBycSBsb2NrIGFnYWluIQo+Pj4+Pj4K
Pj4+Pj4+IFByb2JsZW0gaXMgbm93IHdoYXQgcHJldmVudHMgdGhlIGVudGl0eSBmcm9tIGJlaW5n
IGRlc3Ryb3llZCAKPj4+Pj4+IHdoaWxlIHlvdSByZW1vdmUgaXQ/Cj4+Pj4+Pgo+Pj4+Pj4gQ2hy
aXN0aWFuLgo+Pj4+Pgo+Pj4+PiBSaWdodCwgd2VsbCwgc2luY2UgKHVuZm9ydHVuYXRlbHkpIHNj
aGVkX2VudGl0eSBpcyBwYXJ0IG9mIAo+Pj4+PiBhbWRncHVfY3R4X2VudGl0eSBhbmQgYW1kZ3B1
X2N0eF9lbnRpdHkgaXMgcmVmY291bnRlZAo+Pj4+PiB0aGVyZSBpcyBhIHByb2JsZW0gaGVyZSB0
aGF0IHdlIGRvbid0IGluY3JlbWVudCAKPj4+Pj4gYW1kZ3B1X2N0eC5yZWZjb3VudCB3aGVuIGFz
c2lnbmluZ8KgIHNjaGVkX2VudGl0eQo+Pj4+PiB0byBuZXcgcnEgKGUuZy4gYmVmb3JlIGRybV9z
Y2hlZF9ycV9hZGRfZW50aXR5KSBhbmQgbm90IGRlY3JlbWVudCAKPj4+Pj4gYmVmb3JlIHJlbW92
aW5nLiBXZSBkbyBpdCBmb3IKPj4+Pj4gYW1kZ3B1X2NzX3BhcnNlci5lbnRpdHkgZm9yIGV4YW1w
bGUgKGluIGFtZGdwdV9jc19wYXJzZXJfaW5pdCBhbmQgCj4+Pj4+IGFtZGdwdV9jc19wYXJzZXJf
ZmluaSBieQo+Pj4+PiBjYWxsaW5nIGFtZGdwdV9jdHhfZ2V0IGFuZCBhbWRncHVfY3R4X3B1dCku
IEJ1dCB0aGlzIHNlZW1zIGEgYml0IAo+Pj4+PiB0cmlja3kgZHVlIHRvIGFsbCB0aGUgZHJtX3Nj
aGVkX2VudGl0eV9zZWxlY3RfcnEKPj4+Pj4gbG9naWMuCj4+Pj4+Cj4+Pj4+IEFub3RoZXIsIGtp
bmQgb2YgYSBiYW5kIGFpZCBmaXgsIHdvdWxkIHByb2JhYmx5IGJlIGp1c3QgbG9ja2luZyAKPj4+
Pj4gYW1kZ3B1X2N0eF9tZ3IubG9jayBhcm91bmQgZHJtX3NjaGVkX2ZpbmkKPj4+Pj4gd2hlbiBm
aW5hbGl6aW5nIHRoZSBmZW5jZSBkcml2ZXIgYW5kIGFyb3VuZCBpZHIgaXRlcmF0aW9uIGluIAo+
Pj4+PiBhbWRncHVfY3R4X21ncl9maW5pICh3aGljaCBzaG91bGQgYmUgbG9jayBwcm90ZWN0ZWQK
Pj4+Pj4gYW55d2F5IGFzIEkgc2VlIGZyb20gb3RoZXIgaWRyIHVzYWdlcyBpbiB0aGUgY29kZSkg
Li4uIFRoaXMgc2hvdWxkIAo+Pj4+PiBwcmV2ZW50IHRoaXMgdXNlIGFmdGVyIGZyZWUuCj4+Pj4K
Pj4+PiBQdWgsIHRoYXQncyByYXRoZXIgY29tcGxpY2F0ZWQgYXMgd2VsbC4gT2sgbGV0J3MgbG9v
ayBhdCBpdCBmcm9tIAo+Pj4+IHRoZSBvdGhlciBzaWRlIGZvciBhIG1vbWVudC4KPj4+Pgo+Pj4+
IFdoeSBkbyB3ZSBoYXZlIHRvIHJlbW92ZSB0aGUgZW50aXRpZXMgZnJvbSB0aGUgcnEgaW4gdGhl
IGZpcnN0IHBsYWNlPwo+Pj4+Cj4+Pj4gV291bGRuJ3QgaXQgYmUgc3VmZmljaWVudCB0byBqdXN0
IHNldCBhbGwgb2YgdGhlbSB0byBzdG9wcGVkPwo+Pj4+Cj4+Pj4gQ2hyaXN0aWFuLgo+Pj4KPj4+
Cj4+PiBBbmQgYWRkaW5nIGl0IGFzIGFub3RoZXLCoCBjb25kaXRpb24gaW4gZHJtX3NjaGVkX2Vu
dGl0eV9pc19pZGxlID8KPgo+IFllcywgSSB0aGluayB0aGF0IHNob3VsZCB3b3JrLgoKCkluIHRo
aXMgY2FzZSByZXZlcnNlIGxvY2tpbmcgb3JkZXIgaXMgY3JlYXRlZCwgSW4gCmRybV9zY2hlZF9l
bnRpdHlfcHVzaF9qb2IgYW5kIGRybV9zY2hlZF9lbnRpdHlfZmx1c2ggbG9jayAKZW50aXR5LT5y
cV9sb2NrIGxvY2tlZCBmaXJzdCBhbmQgcnEtPmxvY2sgbG9ja2VkIHNlY29uZC4gSW4gCmRybV9z
Y2hlZF9maW5pIG9uIHRoZSBvdGhlciBoYW5kLCBJIG5lZWQgdG8gbG9jayBycS0+bG9jayBmaXJz
dCB0byAKaXRlcmF0ZSBycS0+ZW50aXRpZXMgYW5kIHRoZW4gbG9jayBzX2VudGl0eS0+cnFfbG9j
ayBmb3IgZWFjaCBlbnRpdHkgdG8gCm1vZGlmeSBzX2VudGl0eS0+c3RvcHBlZC4gSSBndWVzcyB3
ZSBjb3VsZCBjaGFuZ2Ugc19lbnRpdHktPnN0b3BwZWQgdG8gCmF0b21pYyA/CgpBbmRyZXkKCgo+
Cj4gQ2hyaXN0aWFuLgo+Cj4KPj4+Cj4+PiBBbmRyZXkKPj4+Cj4+Pgo+Pj4+Cj4+Pj4+Cj4+Pj4+
IEFuZHJleQo+Pj4+Pgo+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+Pgo+Pj4+Pj4+IEFuZHJleQo+Pj4+Pj4+
Cj4+Pj4+Pj4KPj4+Pj4+Pgo+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gKwo+Pj4+Pj4+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgc3Bpbl9sb2NrKCZycS0+bG9jayk7Cj4+Pj4+Pj4+PiArwqDCoMKgwqDC
oMKgwqAgfQo+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHNwaW5fdW5sb2NrKCZycS0+bG9jayk7
Cj4+Pj4+Pj4+PiArCj4+Pj4+Pj4+PiArwqDCoMKgIH0KPj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4+ICvC
oMKgwqAgLyogV2FrZXVwIGV2ZXJ5b25lIHN0dWNrIGluIGRybV9zY2hlZF9lbnRpdHlfZmx1c2gg
Zm9yIAo+Pj4+Pj4+Pj4gdGhpcyBzY2hlZHVsZXIgKi8KPj4+Pj4+Pj4+ICvCoMKgwqAgd2FrZV91
cF9hbGwoJnNjaGVkLT5qb2Jfc2NoZWR1bGVkKTsKPj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4+IMKgwqDC
oMKgwqAgLyogQ29uZmlybSBubyB3b3JrIGxlZnQgYmVoaW5kIGFjY2Vzc2luZyBkZXZpY2UgCj4+
Pj4+Pj4+PiBzdHJ1Y3R1cmVzICovCj4+Pj4+Pj4+PiBjYW5jZWxfZGVsYXllZF93b3JrX3N5bmMo
JnNjaGVkLT53b3JrX3Rkcik7Cj4+Pj4+Pj4+Cj4+Pj4+Pgo+Pj4+Cj4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
