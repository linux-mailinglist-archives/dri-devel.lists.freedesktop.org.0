Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2652C2F6CF0
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 22:13:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 874256E14F;
	Thu, 14 Jan 2021 21:13:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2066.outbound.protection.outlook.com [40.107.92.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E43406E14C;
 Thu, 14 Jan 2021 21:13:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aKf/cRh8xrJoXkCpZXD+4WuUdFvQRdVBdOVgkyvJVX37oE9HUvmH2UQBKeyR6stZaN19Gp3hHiin77R/Qgf4RVY2+u/yoE+sDZ/Ad7jgPy7zsERogKSLLtOZ1zZ1wRarLxmYtc/NSX2ukyzOFSadI5SeTWgvVv+Ac6tYZxyOqIMYC+SaYVJeMAgU2cYmwG3tvdqh6FKGwdvXDEUf+IQr9/AJ0D6bNm2Wc/MAwl3+23MRBQACQTtAEQKWuBaNHARs47D2e7TO1NP3K/oC7PlFfvcczhhGjKh746emvFvaSEaXLQmunEbUVMKjaiB1rOeS7DdIgX9R9ihQx/OVRXz/ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VMcFXVq9q4zij3EbWlfRf+KUgcR4rR5UtaM72TPExYA=;
 b=cGp9RGuccxWboSRnqsdyHbPIXbx2a3a6dA9zBD9E4IWHY71mSMkZGtVKc0h/TS2PirsKncQXd5vXwzjbqzvlNKCuaI/ZXfDB91/7v0mpIkTVE4HRzIk5G4Mg4ASn84xTpe/RrjMcMTTXlG8Ul4iFLVg/X7wTxYuT8tgtircIzvDtHR+vClecpaIvHbERPWCM4QpUpB6dSbJNhyLWDhfyO6yH40lAqcXBWpa4nL38y4MrvVNBO3eXGPyvM/ZYgQ8FKBdSYjYPtkd6TzBzzt7loTxPciHuTa+Rdap7NNESbQiUg8w1DkedhSOUjrk5QsRi7KXDbaZ18ggqPgmnTy/bWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VMcFXVq9q4zij3EbWlfRf+KUgcR4rR5UtaM72TPExYA=;
 b=k3Dn7w50fWG9++0q77yc3+tsgyJ7wmRR9jRZI6h9gClZWv5dSyjgzoMIIBuA26w0xrv0ZZU6wAxHkSCPO3Ffdi+Fzh0JNnd2/eZ1FDohHx3qMzOVvLRD+tfG0Mq8gpWZpT7FrZ4Ya+xEtzLhovwTpFox5mO/iSdxD0IY4LH4WiY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4208.namprd12.prod.outlook.com (2603:10b6:208:1d0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Thu, 14 Jan
 2021 21:13:36 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b%9]) with mapi id 15.20.3742.012; Thu, 14 Jan 2021
 21:13:36 +0000
Subject: Re: HMM fence (was Re: [PATCH 00/35] Add HMM-based SVM memory manager
 to KFD)
To: Jerome Glisse <jglisse@redhat.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20210107030127.20393-1-Felix.Kuehling@amd.com>
 <X/bTFWL3HYVc8LEF@phenom.ffwll.local>
 <6daf9ebc-507e-6e83-04dd-d7c5fc6998d6@amd.com>
 <X/hux3eX8Ywf61h7@phenom.ffwll.local> <20210113165646.GB521755@redhat.com>
 <c1ecb381-20cc-850b-4491-99c6b413f7df@gmail.com>
 <CAKMK7uHXRwE7tgHM0K921pEyrpZWz7G5q_OcrS4tBPAN-f3k-g@mail.gmail.com>
 <5267b98d-05f4-9e8a-e424-b226f72ce066@amd.com>
 <20210114165128.GB10147@redhat.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <db1f8cef-a60a-9860-c43b-f1ef6b9b6463@amd.com>
Date: Thu, 14 Jan 2021 16:13:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210114165128.GB10147@redhat.com>
Content-Language: en-US
X-Originating-IP: [142.117.121.176]
X-ClientProxiedBy: YT1PR01CA0055.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::24) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.117.121.176) by
 YT1PR01CA0055.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.9 via Frontend Transport; Thu, 14 Jan 2021 21:13:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4251d6b7-d207-4f0e-207d-08d8b8d141ac
X-MS-TrafficTypeDiagnostic: MN2PR12MB4208:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB42080DD958197B17D68684AC92A80@MN2PR12MB4208.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wjq3DfaXovJnlt//ImvrX6VrQ3u2QHOeZRx3xfI/fv6nk7O2x44UFFKTvmWJjnasGJtatmX+uV88oAAlR7wFb3T6oqtEg6TDllXB/as/IVRPWAkabkXN701QH3TabPC9k+WK7Gv5b/6RRNAr9rLELg1/tpNrtiCcCSe0xHGFa3HQe6PLxTXY7DTPy5Rjwxad45qI9ADtfazy2kF+jcR4UbToziR9vIWRA1ttqhuI3MUY8I68sehIAjLFn7MG0UC15QaMVPykijCubv0j+84Kl7ppM55g/1ii4YLDGKORvNtDgHZlqpE492uTZXTXXXFHt0ZO+K9QZsmgojgXiPfLSM+wsqRn++CZfNQKBFb1Op1rvl+OyIZlNUajxGmjWVyYNIylLz9Ys2CxzAR+lXzmS9A5hq39LXtGZJ2m47jAhxuj+UFOlJdz6X28eEHHeF0baR48DU5oI+RFRXWtjDFaqEb99YnSdqlHVVnHIPaf8x4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39860400002)(396003)(366004)(376002)(66946007)(2906002)(66556008)(478600001)(316002)(52116002)(2616005)(8936002)(956004)(36756003)(66476007)(31686004)(16576012)(186003)(26005)(110136005)(5660300002)(86362001)(8676002)(16526019)(4326008)(83380400001)(6636002)(54906003)(31696002)(44832011)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NHBZL2drVEZNVGI4cDVyOVpBS1lIQS9MOXFSRTAwaUFzb2JJdk5xUlVMVWYz?=
 =?utf-8?B?WmM1YnhjbmoxTDVLLzhIMUtyZG1KMWRzeENXUFA4SHBocWwwbEVMNkpIMUZt?=
 =?utf-8?B?ekdZdE5YMDUrcVFFRnJtejAxeFBGeVRBUEtyTkR4TTFldWdXWUFSV1FmeVBM?=
 =?utf-8?B?TzVUbzV1ZEZHc09UT0tSVTFQektZQ0NZSzJOWlFISWRMUU1FeXI3T29ROUg4?=
 =?utf-8?B?ejBoTUJjaitUQU1qY2dCaHJ6aWVxeFduMFFMdHZDY3loT0l0VGhDd1pmVzg2?=
 =?utf-8?B?aWU4OWUwRFJLVi81Vk85T2U3Z0VYamFVYmpYMHl6Mm0rZmFodDEwQ2xudnNr?=
 =?utf-8?B?Wm9kb2RMVC9EU1Y3UnlBYVhFR0Z1d0F5Y0dCMFpyWGxVL0d4VW43MnJRdVBR?=
 =?utf-8?B?SVl1VEpuUytzR3ZlTEZsRGIwUGh6RE8xeWVzK3FRTFZYRVAwWkVkT1VoSDlW?=
 =?utf-8?B?Z3hveDBLM3FoWDUwOElTejU5Y1lsTHptTVNGS1p4R0h3dzNieFNybmtIdkVn?=
 =?utf-8?B?bzdGcURrUE5uL1czZjBqbUVQN3ordnprcUFOTFdjdlMvR08xZVpXd1d1Z1hY?=
 =?utf-8?B?ZXpWWE1Gc21WYVVIYWxwN1dGTGgzcTAwYk52bEFiMVB6WnJQZm4rSkZlMWhJ?=
 =?utf-8?B?RlRNQmVBajRCcCtrbFVtOXdMWGFyemZKd1pnSnRqdVYxdU8yVXhBcGNLbER6?=
 =?utf-8?B?WGt2cWY2Vk5uRC9SRi9naWI1TUVxanh4Tm50QUUxL2lJRm9kSnh6MkpacEVK?=
 =?utf-8?B?ejUwQ1h6aXVUNnpBZU16clNIVmM4N2twY3YzY2FlOGNUQ2prQXJSandXNlVB?=
 =?utf-8?B?Y1ROZXlzSkdkeURmRnZXM1doNFkxM1BpSHhyUzZaMGluYmpFV3dBbFhLc3ZQ?=
 =?utf-8?B?aUlNNzd0QVZpamJzbzJpYzMzVVRiNTBKeUdkMk8xTzdCWjQxY0xNSnhETm9r?=
 =?utf-8?B?RzVXTGxmNk11Q29zWkRGYXZZaU1RNXpqYUdQWHFpVEtoNDZXTFZYcFVUSDJC?=
 =?utf-8?B?LzJvZXliRzZIR2hQdVhBUnozZk0xRDBUNmhtUjhqU0JOMWgyeUFYaTZRNHdI?=
 =?utf-8?B?UENIdStEcmdSN0l0Q3pod1lKVFJyeTAycUFlNHFrenJkSGpMaDMxSkFDKzQy?=
 =?utf-8?B?Z0dROWc0cUVXOVZ1RWJsQWp2TCtxLzZnWHIzTW44ZXcwc0Y5dERmb3hia2VR?=
 =?utf-8?B?L1RZcklqdWc3Y3pMSFBjYXdKMWpZdkZVZHJNdzR2eFJnTEdtcENOekVqRHV1?=
 =?utf-8?B?WWxiVkQ2blpxZEZPYnNSZHM1WjJzMVBKdnNYWHBkZzRjeG1EUXNLRVBwT01Q?=
 =?utf-8?Q?3YeNkrVGPVPD6qlKe3zGEMw6ZCoiCGoPoL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 21:13:36.1076 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 4251d6b7-d207-4f0e-207d-08d8b8d141ac
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OzhZhZrLyM1AEvVS0K3UNis//UFc+s5OeVsxgMh/lBJbHkLTcqwgu5Orxh5EibedCC0E9MVvXdd+xOL2TFTG3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4208
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
Cc: Alex Sierra <alex.sierra@amd.com>, "Yang, Philip" <philip.yang@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjAyMS0wMS0xNCB1bSAxMTo1MSBhLm0uIHNjaHJpZWIgSmVyb21lIEdsaXNzZToKPiBPbiBU
aHUsIEphbiAxNCwgMjAyMSBhdCAwMjozNzozNlBNICswMTAwLCBDaHJpc3RpYW4gS8ODwrZuaWcg
d3JvdGU6Cj4+IEFtIDE0LjAxLjIxIHVtIDEyOjUyIHNjaHJpZWIgRGFuaWVsIFZldHRlcjoKPj4+
IFtTTklQXQo+Pj4+PiBJIGhhZCBhIG5ldyBpZGVhLCBpIHdhbnRlZCB0byB0aGluayBtb3JlIGFi
b3V0IGl0IGJ1dCBoYXZlIG5vdCB5ZXQsCj4+Pj4+IGFueXdheSBoZXJlIGl0IGlzLiBBZGRpbmcg
YSBuZXcgY2FsbGJhY2sgdG8gZG1hIGZlbmNlIHdoaWNoIGFzayB0aGUKPj4+Pj4gcXVlc3Rpb24g
Y2FuIGl0IGRlYWQgbG9jayA/IEFueSB0aW1lIGEgR1BVIGRyaXZlciBoYXMgcGVuZGluZyBwYWdl
Cj4+Pj4+IGZhdWx0IChpZSBzb21ldGhpbmcgY2FsbGluZyBpbnRvIHRoZSBtbSkgaXQgYW5zd2Vy
IHllcywgb3RoZXJ3aXNlCj4+Pj4+IG5vLiBUaGUgR1BVIHNocmlua2VyIHdvdWxkIGFzayB0aGUg
cXVlc3Rpb24gYmVmb3JlIHdhaXRpbmcgb24gYW55Cj4+Pj4+IGRtYS1mZW5jZSBhbmQgYmFjayBv
ZiBpZiBpdCBnZXRzIHllcy4gU2hyaW5rZXIgY2FuIHN0aWxsIHRyeSBtYW55Cj4+Pj4+IGRtYSBi
dWYgb2JqZWN0IGZvciB3aGljaCBpdCBkb2VzIG5vdCBnZXQgYSB5ZXMgb24gYXNzb2NpYXRlZCBm
ZW5jZS4KPj4+Pj4KPj4+Pj4gVGhpcyBkb2VzIG5vdCBzb2x2ZSB0aGUgbW11IG5vdGlmaWVyIGNh
c2UsIGZvciB0aGlzIHlvdSB3b3VsZCBqdXN0Cj4+Pj4+IGludmFsaWRhdGUgdGhlIGdlbSB1c2Vy
cHRyIG9iamVjdCAod2l0aCBhIGZsYWcgYnV0IG5vdCByZWxlYXNpbmcgdGhlCj4+Pj4+IHBhZ2Ug
cmVmY291bnQpIGJ1dCB5b3Ugd291bGQgbm90IHdhaXQgZm9yIHRoZSBHUFUgKGllIG5vIGRtYSBm
ZW5jZQo+Pj4+PiB3YWl0IGluIHRoYXQgY29kZSBwYXRoIGFueW1vcmUpLiBUaGUgdXNlcnB0ciBB
UEkgbmV2ZXIgcmVhbGx5IG1hZGUKPj4+Pj4gdGhlIGNvbnRyYWN0IHRoYXQgaXQgd2lsbCBhbHdh
eXMgYmUgaW4gc3luYyB3aXRoIHRoZSBtbSB2aWV3IG9mIHRoZQo+Pj4+PiB3b3JsZCBzbyBpZiBk
aWZmZXJlbnQgcGFnZSBnZXQgcmVtYXBwZWQgdG8gc2FtZSB2aXJ0dWFsIGFkZHJlc3MKPj4+Pj4g
d2hpbGUgR1BVIGlzIHN0aWxsIHdvcmtpbmcgd2l0aCB0aGUgb2xkIHBhZ2VzIGl0IHNob3VsZCBu
b3QgYmUgYW4KPj4+Pj4gaXNzdWUgKGl0IHdvdWxkIG5vdCBiZSBpbiBvdXIgdXNhZ2Ugb2YgdXNl
cnB0ciBmb3IgY29tcG9zaXRvciBhbmQKPj4+Pj4gd2hhdCBub3QpLgo+Pj4+IFRoZSBjdXJyZW50
IHdvcmtpbmcgaWRlYSBpbiBteSBtaW5kIGdvZXMgaW50byBhIHNpbWlsYXIgZGlyZWN0aW9uLgo+
Pj4+Cj4+Pj4gQnV0IGluc3RlYWQgb2YgYSBjYWxsYmFjayBJJ20gYWRkaW5nIGEgY29tcGxldGUg
bmV3IGNsYXNzIG9mIEhNTSBmZW5jZXMuCj4+Pj4KPj4+PiBXYWl0aW5nIGluIHRoZSBNTVUgbm90
Zmllciwgc2NoZWR1bGVyLCBUVE0gZXRjIGV0YyBpcyBvbmx5IGFsbG93ZWQgZm9yCj4+Pj4gdGhl
IGRtYV9mZW5jZXMgYW5kIEhNTSBmZW5jZXMgYXJlIGlnbm9yZWQgaW4gY29udGFpbmVyIG9iamVj
dHMuCj4+Pj4KPj4+PiBXaGVuIHlvdSBoYW5kbGUgYW4gaW1wbGljaXQgb3IgZXhwbGljaXQgc3lu
Y2hyb25pemF0aW9uIHJlcXVlc3QgZnJvbQo+Pj4+IHVzZXJzcGFjZSB5b3UgbmVlZCB0byBibG9j
ayBmb3IgSE1NIGZlbmNlcyB0byBjb21wbGV0ZSBiZWZvcmUgdGFraW5nIGFueQo+Pj4+IHJlc291
cmNlIGxvY2tzLgo+Pj4gSXNudCcgdGhhdCB3aGF0IEkgY2FsbCBnYW5nIHNjaGVkdWxpbmc/IEku
ZS4geW91IGVpdGhlciBydW4gaW4gSE1NCj4+PiBtb2RlLCBvciBpbiBsZWdhY3kgZmVuY2luZyBt
b2RlICh3aGV0aGVyIGltcGxpY2l0IG9yIGV4cGxpY2l0IGRvZXNuJ3QKPj4+IHJlYWxseSBtYXR0
ZXIgSSB0aGluaykuIEJ5IGZvcmNpbmcgdGhhdCBzcGxpdCB3ZSBhdm9pZCB0aGUgcHJvYmxlbSwK
Pj4+IGJ1dCBpdCBtZWFucyBvY2Nhc2lvbmFsbHkgZnVsbCBzdGFsbHMgb24gbWl4ZWQgd29ya2xv
YWRzLgo+Pj4KPj4+IEJ1dCB0aGF0J3Mgbm90IHdoYXQgSmVyb21lIHdhbnRzIChhZmFpdWkgYXQg
bGVhc3QpLCBJIHRoaW5rIGhpcyBpZGVhCj4+PiBpcyB0byB0cmFjayB0aGUgcmV2ZXJzZSBkZXBl
bmRlbmNpZXMgb2YgYWxsIHRoZSBmZW5jZXMgZmxvYXRpbmcKPj4+IGFyb3VuZCwgYW5kIHRoZW4g
c2tpcCBldmljdGluZyBhbiBvYmplY3QgaWYgeW91IGhhdmUgdG8gd2FpdCBmb3IgYW55Cj4+PiBm
ZW5jZSB0aGF0IGlzIHByb2JsZW1hdGljIGZvciB0aGUgY3VycmVudCBjYWxsaW5nIGNvbnRleHQu
IEFuZCBJIGRvbid0Cj4+PiB0aGluayB0aGF0J3MgdmVyeSBmZWFzaWJsZSBpbiBwcmFjdGljZS4K
Pj4+Cj4+PiBTbyB3aGF0IGtpbmQgb2YgaG1tIGZlbmNlcyBkbyB5b3UgaGF2ZSBpbiBtaW5kIGhl
cmU/Cj4+IEl0J3MgYSBiaXQgbW9yZSByZWxheGVkIHRoYW4geW91ciBnYW5nIHNjaGVkdWxlLgo+
Pgo+PiBTZWUgdGhlIHJlcXVpcmVtZW50cyBhcmUgYXMgZm9sbG93Ogo+Pgo+PiAxLiBkbWFfZmVu
Y2VzIG5ldmVyIGRlcGVuZCBvbiBobW1fZmVuY2VzLgo+PiAyLiBobW1fZmVuY2VzIGNhbiBuZXZl
ciBwcmVlbXB0IGRtYV9mZW5jZXMuCj4+IDMuIGRtYV9mZW5jZXMgbXVzdCBiZSBhYmxlIHRvIHBy
ZWVtcHQgaG1tX2ZlbmNlcyBvciB3ZSBhbHdheXMgcmVzZXJ2ZSBlbm91Z2gKPj4gaGFyZHdhcmUg
cmVzb3VyY2VzIChDVXMpIHRvIGd1YXJhbnRlZSBmb3J3YXJkIHByb2dyZXNzIG9mIGRtYV9mZW5j
ZXMuCj4+Cj4+IENyaXRpY2FsIHNlY3Rpb25zIGFyZSBNTVUgbm90aWZpZXJzLCBwYWdlIGZhdWx0
cywgR1BVIHNjaGVkdWxlcnMgYW5kCj4+IGRtYV9yZXNlcnZhdGlvbiBvYmplY3QgbG9ja3MuCj4+
Cj4+IDQuIEl0IGlzIHZhbGlkIHRvIHdhaXQgZm9yIGEgZG1hX2ZlbmNlcyBpbiBjcml0aWNhbCBz
ZWN0aW9ucy4KPj4gNS4gSXQgaXMgbm90IHZhbGlkIHRvIHdhaXQgZm9yIGhtbV9mZW5jZXMgaW4g
Y3JpdGljYWwgc2VjdGlvbnMuCj4+Cj4+IEZlbmNlIGNyZWF0aW9uIGVpdGhlciBoYXBwZW5zIGR1
cmluZyBjb21tYW5kIHN1Ym1pc3Npb24gb3IgYnkgYWRkaW5nCj4+IHNvbWV0aGluZyBsaWtlIGEg
YmFycmllciBvciBzaWduYWwgY29tbWFuZCB0byB5b3VyIHVzZXJzcGFjZSBxdWV1ZS4KPj4KPj4g
Ni4gSWYgd2UgaGF2ZSBhbiBobW1fZmVuY2UgYXMgaW1wbGljaXQgb3IgZXhwbGljaXQgZGVwZW5k
ZW5jeSBmb3IgY3JlYXRpbmcgYQo+PiBkbWFfZmVuY2Ugd2UgbXVzdCB3YWl0IGZvciB0aGF0IGJl
Zm9yZSB0YWtpbmcgYW55IGxvY2tzIG9yIHJlc2VydmluZwo+PiByZXNvdXJjZXMuCj4+IDcuIElm
IHdlIGhhdmUgYSBkbWFfZmVuY2UgYXMgaW1wbGljaXQgb3IgZXhwbGljaXQgZGVwZW5kZW5jeSBm
b3IgY3JlYXRpbmcgYW4KPj4gaG1tX2ZlbmNlIHdlIGNhbiB3YWl0IGxhdGVyIG9uLiBTbyBidXN5
IHdhaXRpbmcgb3Igc3BlY2lhbCBXQUlUIGhhcmR3YXJlCj4+IGNvbW1hbmRzIGFyZSB2YWxpZC4K
Pj4KPj4gVGhpcyBwcmV2ZW50cyBoYXJkIGN1dHMsIGUuZy4gY2FuIG1peCBobW1fZmVuY2VzIGFu
ZCBkbWFfZmVuY2VzIGF0IHRoZSBzYW1lCj4+IHRpbWUgb24gdGhlIGhhcmR3YXJlLgo+Pgo+PiBJ
biBvdGhlciB3b3JkcyB3ZSBjYW4gaGF2ZSBhIGhpZ2ggcHJpb3JpdHkgZ2Z4IHF1ZXVlIHJ1bm5p
bmcgam9icyBiYXNlZCBvbgo+PiBkbWFfZmVuY2VzIGFuZCBhIGxvdyBwcmlvcml0eSBjb21wdXRl
IHF1ZXVlIHJ1bm5pbmcgam9icyBiYXNlZCBvbgo+PiBobW1fZmVuY2VzLgo+Pgo+PiBPbmx5IHdo
ZW4gd2Ugc3dpdGNoIGZyb20gaG1tX2ZlbmNlIHRvIGRtYV9mZW5jZSB3ZSBuZWVkIHRvIGJsb2Nr
IHRoZQo+PiBzdWJtaXNzaW9uIHVudGlsIGFsbCB0aGUgbmVjZXNzYXJ5IHJlc291cmNlcyAoYm90
aCBtZW1vcnkgYXMgd2VsbCBhcyBDVXMpCj4+IGFyZSBhdmFpbGFibGUuCj4+Cj4+IFRoaXMgaXMg
c29tZXdoYXQgYW4gZXh0ZW5zaW9uIHRvIHlvdXIgZ2FuZyBzdWJtaXQgaWRlYS4KPiBXaGF0IGlz
IGhtbV9mZW5jZSA/IFlvdSBzaG91bGQgbm90IGhhdmUgZmVuY2Ugd2l0aCBobW0gYXQgYWxsLgo+
IFNvIGkgYW0ga2luZCBvZiBzY2FyZSBub3cuCgpJIGtpbmQgb2YgaGFkIHRoZSBzYW1lIHF1ZXN0
aW9uIHRyeWluZyB0byBmb2xsb3cgQ2hyaXN0aWFuIGFuZCBEYW5pZWwncwpkaXNjdXNzaW9uLiBJ
IHRoaW5rIGFuIEhNTSBmZW5jZSB3b3VsZCBiZSBhbnkgZmVuY2UgcmVzdWx0aW5nIGZyb20gdGhl
CmNvbXBsZXRpb24gb2YgYSB1c2VyIG1vZGUgb3BlcmF0aW9uIGluIGEgY29udGV4dCB3aXRoIEhN
TS1iYXNlZCBtZW1vcnkKbWFuYWdlbWVudCB0aGF0IG1heSBzdGFsbCBpbmRlZmluaXRlbHkgZHVl
IHRvIHBhZ2UgZmF1bHRzLgoKQnV0IG9uIGEgaGFyZHdhcmUgZW5naW5lIHRoYXQgY2Fubm90IHBy
ZWVtcHQgcGFnZS1mYXVsdGluZyB3b3JrIGFuZCBoYXMKbm90IHJlc2VydmVkIHJlc291cmNlcyB0
byBndWFyYW50ZWUgZm9yd2FyZCBwcm9ncmVzcyBmb3Iga2VybmVsIGpvYnMsIEkKdGhpbmsgYWxs
IGZlbmNlcyB3aWxsIG5lZWQgdG8gYmUgSE1NIGZlbmNlcywgYmVjYXVzZSBhbnkgd29yayBzdWJt
aXR0ZWQKdG8gc3VjaCBhbiBlbmdpbmUgY2FuIHN0YWxsIGJ5IGdldHRpbmcgc3R1Y2sgYmVoaW5k
IGEgc3RhbGxlZCB1c2VyIG1vZGUKb3BlcmF0aW9uLgoKU28gZm9yIGV4YW1wbGUsIHlvdSBoYXZl
IGEgRE1BIGVuZ2luZSB0aGF0IGNhbiBwcmVlbXB0IGR1cmluZyBwYWdlCmZhdWx0cywgYnV0IGEg
Z3JhcGhpY3MgZW5naW5lIHRoYXQgY2Fubm90LiBUaGVuIHdvcmsgc3VibWl0dGVkIHRvIHRoZQpE
TUEgZW5naW5lIGNhbiB1c2UgZG1hX2ZlbmNlLiBCdXQgd29yayBzdWJtaXR0ZWQgdG8gdGhlIGdy
YXBoaWNzIGVuZ2luZQptdXN0IHVzZSBobW1fZmVuY2UuIFRvIGF2b2lkIGRlYWRsb2NrcywgZG1h
X2ZlbmNlcyBtdXN0IG5ldmVyIGRlcGVuZCBvbgpobW1fZmVuY2VzIGFuZCByZXNvbHV0aW9uIG9m
IHBhZ2UgZmF1bHRzIG11c3QgbmV2ZXIgZGVwZW5kIG9uIGhtbV9mZW5jZXMuCgpSZWdhcmRzLArC
oCBGZWxpeAoKCj4KPiBDaGVlcnMsCj4gSsODwqlyw4PCtG1lCj4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
