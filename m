Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69560316EB6
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 19:33:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A28FC6ECC5;
	Wed, 10 Feb 2021 18:33:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061.outbound.protection.outlook.com [40.107.92.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 640406ECC5
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 18:32:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U0pkMxWR8Gw/uchjrJ2VdcSoJkfm3FBil4Xz2obBQRoWpZORPr5MF6IOjrSg58o9XRIxBX1R6C5HfIBzaINaG4NtIL4kld/QLBmAGqpZi50Q6UqwXSZh3Pwd8aTSgE0fj+a/LRaVtEFqtzwt9WOwOqUeXPFMzIVePBOMtAAliMvXu9AaMZE/7AQ/lXYUz/3XyrhiLdRQRAUfOBD9hxP7/u8YXOd8m6LVdIRrzQgFg3kfkZCY9+sIRl8a+CFiw3ykCtnACFfLFy8sHD3lxwg9+nZyPooA5xn4dih5iQU+EOz0MBG4WrOZkod/aqFjPH7ZFnkaPLiVV017rk0ENZ+qyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fMHIhMx+Sdpi6s8Ayg75PiGK3mpumtwYVDELYmx0Y4k=;
 b=IRJL9vAKih3hQwl7iIiv5j5LgNWRw1keLy7UpJYOM4MZ8n7b/JCuwu7ib55cSZZj2j9PfnUHiKBCP+HXFxq+0l7IRQLSiIVgI2v9PsbEpd8kGVSb9FL8I/lzRtdMgCDV8khj5kK2az1fMiXrSDNvW470M9DXVngw6IfaNna2q4L1Xl8mkNcrxsaZ7nM5SXHfCOBoC/yoFuPeLmE6O/dew2HPj2fP2G+VJRjkEVoWD28NdmIJcXFb9wH1Z/kcf+piZ1pIrIhAFnUOEygMPwAGInaeZHKsuXk0JJ41EukqXBtVWQyoENHaUWRbCsfFVcHAGyNIxY2H6IycuuTv0MEimQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fMHIhMx+Sdpi6s8Ayg75PiGK3mpumtwYVDELYmx0Y4k=;
 b=sz2k7x9gTkho7a7Engc8AUiQpadCj/tpwqmLk86ewPUC5VbmLnjADALpjrg+3v/Bb9IjiIAdrjyrhwtZJT9kQeH5HJF/zxWzhp0NM8CcFHAA4vVEsBESk91MuOqMhU9F+yMhsvmIkx3wpencb04YnNaczgxC4ERrG8yI7wiZoCw=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4566.namprd12.prod.outlook.com (2603:10b6:208:26a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Wed, 10 Feb
 2021 18:32:56 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3846.027; Wed, 10 Feb 2021
 18:32:56 +0000
Subject: Re: [RFC][PATCH v6 1/7] drm: Add a sharable drm page-pool
 implementation
To: Suren Baghdasaryan <surenb@google.com>,
 John Stultz <john.stultz@linaro.org>, lkml <linux-kernel@vger.kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Liam Mark <lmark@codeaurora.org>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Laura Abbott <labbott@kernel.org>, Brian Starkey <Brian.Starkey@arm.com>,
 Hridya Valsaraju <hridya@google.com>, Sandeep Patil <sspatil@google.com>,
 Daniel Mentz <danielmentz@google.com>, =?UTF-8?Q?=c3=98rjan_Eide?=
 <orjan.eide@arm.com>, Robin Murphy <robin.murphy@arm.com>,
 Ezequiel Garcia <ezequiel@collabora.com>, Simon Ser <contact@emersion.fr>,
 James Jones <jajones@nvidia.com>, linux-media <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20210205080621.3102035-1-john.stultz@linaro.org>
 <20210205080621.3102035-2-john.stultz@linaro.org>
 <4471b3b0-603e-6dbb-8064-ff4a95afbba9@amd.com>
 <CALAqxLWZkUFvJX5r2OU2erW4tU3j=+u==VTyzYkt+95LwwVCUA@mail.gmail.com>
 <48225879-2fe1-22ac-daae-c61d52465aea@amd.com>
 <a9dd7f8a-ef30-9eb4-4834-37801d43b96f@amd.com>
 <CAJuCfpE-T4Cs_h6LfrgHE+T_iOVywU2oNzLquYETudOaBMauMQ@mail.gmail.com>
 <c7df099f-27f7-adc6-4e87-9903ac00cbea@amd.com>
 <CAKMK7uFu27RRpwPdNFuhd-Y5R8XiCNosET9BYtCnr3u30UDs0g@mail.gmail.com>
 <CAJuCfpF2Q1qVkv75czc2AFRrp25eNz7hqmeO9Wx8e5VY7PvyJw@mail.gmail.com>
 <YCPaZc0+F+5C7FG4@phenom.ffwll.local>
 <CAJuCfpG+nOwZJcJAXuvv=P=17vWdw2AFT7+WHfpwfmjAfefM2g@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d085aaf7-8414-3efa-404b-1595abfb6da7@amd.com>
Date: Wed, 10 Feb 2021 19:32:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAJuCfpG+nOwZJcJAXuvv=P=17vWdw2AFT7+WHfpwfmjAfefM2g@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:78b9:aa01:2f51:becf]
X-ClientProxiedBy: AM3PR03CA0075.eurprd03.prod.outlook.com
 (2603:10a6:207:5::33) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:78b9:aa01:2f51:becf]
 (2a02:908:1252:fb60:78b9:aa01:2f51:becf) by
 AM3PR03CA0075.eurprd03.prod.outlook.com (2603:10a6:207:5::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.25 via Frontend Transport; Wed, 10 Feb 2021 18:32:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3d8c909c-4afc-4427-3159-08d8cdf24890
X-MS-TrafficTypeDiagnostic: MN2PR12MB4566:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4566688C1C1BE7B7F9064E37838D9@MN2PR12MB4566.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nu4DSIZcR54MUd8UCkR2vU56NLqIvj6Anm1SLIzCfLrw2DQqW6e7o+l7md76XHUIbK7Y8ySHECfcfHiNX+APGPkxDN0ZDVM5aMOmGTawp5wcnXMS13zbBBxABfZmVCW29r3/i72VAAVAHdZXTcY8ib5+XZWLnIJZmckyr121YmkYxh2l+A3vNiLcQaLSUSi9o53CpvevDHu2P5kCFQc/jhZk9dg1dDgJDj+6WQyhw667k2TJWfxHPWQ/U62GJV5Fd9oFwhJsNSuwNaV+MowFRkyKiQ7tQoCdcdFOXMutYSPFeoS3j/TggsVGm3z7BrwULNOscNdYfKui67/J0SUb6QdB6au4fxzKd4iuhD132GvwmQWZjRWb0qDZt/18qVxCaX7QF/QQtrFq+3tYSSQeFs3segnP66Vd0NdGDHEppBUBQow8AsFT0oLx/Oll56slXQjwoehBXFiJAiZFgJeyvaEUasLQ76dCA78dp6tPzX8WZ4CcwJKfXztBzFKVKmb3H23niTWNufgs8BYdT1jkSN83BLTKW+On4ju9ZzuJPjOOC0gOoIAcLYgJMor0XADke0JSwMIIIJui2rPtGYw35Nia6xmviHaZp44v2cpP/OE9kIRHWUNZcWUdLSkQyXBRTP8EijdEmAXPTJbPxOi/obKQUbIDGxquMYVR/2XoIptLtuAqQoKw9QnD1nc+pJeDrPhmrDxTLRqUnQdYdnd0W3b7oxLDWBt9ZFayuVH3Bks=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(136003)(396003)(346002)(366004)(2906002)(7416002)(36756003)(86362001)(6486002)(6666004)(31696002)(2616005)(53546011)(186003)(16526019)(83380400001)(66574015)(52116002)(921005)(83080400002)(5660300002)(4326008)(478600001)(110136005)(45080400002)(316002)(966005)(8676002)(8936002)(66476007)(66946007)(31686004)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RXJiaWZ0ZDVLZ01rOVdpdlVyalJNUDVIVzBxd1Q1dlF6QThHM1JYblFBN0cw?=
 =?utf-8?B?Y1RTcm1sbWgzQndpRkhRZ00xa3Jic3VVTDREK2krdGZOdG1xbjV3Z3VWY2Zk?=
 =?utf-8?B?Q0ZmWUw0T0hjWmVtaXZhWUcwcmYwYzNXWjVNQ2ViVjZOYmY0L1hNVERFdWc2?=
 =?utf-8?B?aExkdUdQSVFseFJ1MzgrS2N0Vk05RDVSU3NPMGdMc2o2UVBtVHNod1pud0hS?=
 =?utf-8?B?UFV1T2J3WFcyNU9mOWYvMlp5dWtaS3c5Zm1MSFk5RWxLbzU4Vy9DZVdGb0RD?=
 =?utf-8?B?dVFnZ2ZyZFNEblRWOU13TGFLMzRqSW5SMzN2VWlRSkhnZWhOR1QxeEEySFFZ?=
 =?utf-8?B?S29tWlRYNi9jNzAzakdGYWl2dVV5blVINkhyTFN1clZHWGg0WlhpNjFRcHBl?=
 =?utf-8?B?aWhqNlh4VlJnSXZraExkUjl6OHBFQXE1SHVleEgwdXlTWmdLNklCeFZ1MENw?=
 =?utf-8?B?NnhOUmFlaktnT3gvdXV6TkZkdFpUNjBmS2xuLytiUHRUYU5VMnNmelRPb2du?=
 =?utf-8?B?bkowWnVFZDJWQU1OWm01YStqWGlab2dGblFmdk4rR2JGQit6cWd1S1h6UWFj?=
 =?utf-8?B?MTgxb0Vya2RvakN3cU1XclJ1NURWQkN1czB3WVVkK3dySWxHNVZrZ3NSK2lY?=
 =?utf-8?B?T0NjMzNDMVVENTE1NnpYaDhrWDNoeUl6MWtDaWFzNXBNaS9uZU01U21QUnJM?=
 =?utf-8?B?ZzRpR2RIbUUyRDVkWWFZMnpjbVBtM0xGQkhlSjN5RERvSXd1NFJtSk5KM0dU?=
 =?utf-8?B?bC9kazZtd3FkS2E2WElRSGtSbnViUURFOWQwSDhXY2xpZEhjaGtxeXhDSkJU?=
 =?utf-8?B?UVF3ek15QmlQYzc4MzFmcXMyK2NWRE9INFMrMTEyQzR1U3U3a3pFNWlkSE9Q?=
 =?utf-8?B?VE1qTlpvcVpMc1J0QkE1WG9obzdxKzl0a3U5NmYzTXdQalhBaXJSK2FpMkJ6?=
 =?utf-8?B?ZE9YTmc4YmdVMEFQOTVCNm9uOEo1WllvcTdUOXY1WjBDNjNuVld4SklMOGZT?=
 =?utf-8?B?TmVkK1lucjQ5YktqWDUxVTJtV2dNNHJWeWdObXFidGhJWXZzSSszd1NRalpW?=
 =?utf-8?B?SnZWeUkvV3F4QlVnNm8ybWVXYU0rbVVyandVVi9YZE0weVJMMFM5cS9jdTdZ?=
 =?utf-8?B?c295Wko5YWJtYzZOTXE1amwzZFgwSElHK1R5WnhJeUJuSUMwM3BVMDVYZDVK?=
 =?utf-8?B?VWltM1d0ODFqVHp4VjhrK0pVc0dTZEpLNnVrYVE2Q1c3cGp6aWNQZjJJQnZU?=
 =?utf-8?B?VHJFdkN6UncyZEptVVhnaWNtMm5hTUc2NFl5MTF5bGNVZm1MZDRIcndoQjU0?=
 =?utf-8?B?dmhleVNHWmdZZ3pUSVo4bEVFbG50VWFIRTlNRE5hL0pja2Y2Z3NhSTFIRjRo?=
 =?utf-8?B?clhBM3E1a1JZR3BuR1JVS1g0aURVenZJVnQxVEFtY0xXcER6dzkxdHVla2lF?=
 =?utf-8?B?d2dzZDBEdTUwM3ZOa1dVUHhRQWIrczNhUmhiY2hVQlhVQmxpYkduRDZSNXhV?=
 =?utf-8?B?MVNlelJ0YktqakNsd0FYeGppVDdqY2xGMU5lZXc1c1E4TDFDT3lZRDFwSW5V?=
 =?utf-8?B?cm9LcGNpSE1lTXVrdVV1d0VHcmV3d2cxUDZOdEVMWHRPYXNWQXlOMWxMZ1Y3?=
 =?utf-8?B?WWt0YUtlRzhTY3lLQ1hmS1F0YXFXK1RaTWNoUS9ueWlMeTkzOHVsdUpldXV1?=
 =?utf-8?B?S1ZQS1MxRzhqdkt3Z0gwRUprbDJ2WjJKMmsxeUdBaCthRkljZVdOK0FjcEJD?=
 =?utf-8?B?dEoxUHJKeG8vMGNIdUY4Uy9oOVVpTGNwdnNzS3pMSkNrd21GWEZJY0prNGZY?=
 =?utf-8?B?TzUra3hxQTlseTc4ZmM2eGQzbStkK2RWbGdqMUVlOW5YQXUvb3RtUlgxb1My?=
 =?utf-8?Q?U2Nzr+aCQJjKC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d8c909c-4afc-4427-3159-08d8cdf24890
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2021 18:32:55.9052 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JNYzjAq3GS45SroBTeOIUapBX2nsIvrq7dm4hTjvp75/A6wQiT7hv6jy0MDKHFR7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4566
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

CgpBbSAxMC4wMi4yMSB1bSAxNzozOSBzY2hyaWViIFN1cmVuIEJhZ2hkYXNhcnlhbjoKPiBPbiBX
ZWQsIEZlYiAxMCwgMjAyMSBhdCA1OjA2IEFNIERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5j
aD4gd3JvdGU6Cj4+IE9uIFR1ZSwgRmViIDA5LCAyMDIxIGF0IDEyOjE2OjUxUE0gLTA4MDAsIFN1
cmVuIEJhZ2hkYXNhcnlhbiB3cm90ZToKPj4+IE9uIFR1ZSwgRmViIDksIDIwMjEgYXQgMTI6MDMg
UE0gRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPiB3cm90ZToKPj4+PiBPbiBUdWUsIEZl
YiA5LCAyMDIxIGF0IDY6NDYgUE0gQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0Bh
bWQuY29tPiB3cm90ZToKPj4+Pj4KPj4+Pj4KPj4+Pj4gQW0gMDkuMDIuMjEgdW0gMTg6MzMgc2No
cmllYiBTdXJlbiBCYWdoZGFzYXJ5YW46Cj4+Pj4+PiBPbiBUdWUsIEZlYiA5LCAyMDIxIGF0IDQ6
NTcgQU0gQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPiB3cm90ZToK
Pj4+Pj4+PiBBbSAwOS4wMi4yMSB1bSAxMzoxMSBzY2hyaWViIENocmlzdGlhbiBLw7ZuaWc6Cj4+
Pj4+Pj4+IFtTTklQXQo+Pj4+Pj4+Pj4+PiArdm9pZCBkcm1fcGFnZV9wb29sX2FkZChzdHJ1Y3Qg
ZHJtX3BhZ2VfcG9vbCAqcG9vbCwgc3RydWN0IHBhZ2UgKnBhZ2UpCj4+Pj4+Pj4+Pj4+ICt7Cj4+
Pj4+Pj4+Pj4+ICsgICAgIHNwaW5fbG9jaygmcG9vbC0+bG9jayk7Cj4+Pj4+Pj4+Pj4+ICsgICAg
IGxpc3RfYWRkX3RhaWwoJnBhZ2UtPmxydSwgJnBvb2wtPml0ZW1zKTsKPj4+Pj4+Pj4+Pj4gKyAg
ICAgcG9vbC0+Y291bnQrKzsKPj4+Pj4+Pj4+Pj4gKyAgICAgYXRvbWljX2xvbmdfYWRkKDEgPDwg
cG9vbC0+b3JkZXIsICZ0b3RhbF9wYWdlcyk7Cj4+Pj4+Pj4+Pj4+ICsgICAgIHNwaW5fdW5sb2Nr
KCZwb29sLT5sb2NrKTsKPj4+Pj4+Pj4+Pj4gKwo+Pj4+Pj4+Pj4+PiArICAgICBtb2Rfbm9kZV9w
YWdlX3N0YXRlKHBhZ2VfcGdkYXQocGFnZSksCj4+Pj4+Pj4+Pj4+IE5SX0tFUk5FTF9NSVNDX1JF
Q0xBSU1BQkxFLAo+Pj4+Pj4+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgIDEgPDwgcG9v
bC0+b3JkZXIpOwo+Pj4+Pj4+Pj4+IEh1aSB3aGF0PyBXaGF0IHNob3VsZCB0aGF0IGJlIGdvb2Qg
Zm9yPwo+Pj4+Pj4+Pj4gVGhpcyBpcyBhIGNhcnJ5b3ZlciBmcm9tIHRoZSBJT04gcGFnZSBwb29s
IGltcGxlbWVudGF0aW9uOgo+Pj4+Pj4+Pj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVj
dGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGZ2l0Lmtlcm5lbC5vcmclMkZwdWIl
MkZzY20lMkZsaW51eCUyRmtlcm5lbCUyRmdpdCUyRnRvcnZhbGRzJTJGbGludXguZ2l0JTJGdHJl
ZSUyRmRyaXZlcnMlMkZzdGFnaW5nJTJGYW5kcm9pZCUyRmlvbiUyRmlvbl9wYWdlX3Bvb2wuYyUz
RmglM0R2NS4xMCUyM24yOCZhbXA7ZGF0YT0wNCU3QzAxJTdDY2hyaXN0aWFuLmtvZW5pZyU0MGFt
ZC5jb20lN0NiYjcxNTU0NDdlZTE0OWE0OWYzYTA4ZDhjZGUyNjg1ZCU3QzNkZDg5NjFmZTQ4ODRl
NjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2Mzc0ODU3MTk2MTgzMzk0MTMlN0NVbmtub3du
JTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRp
STZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMTAwMCZhbXA7c2RhdGE9SVlzSm9BZDdTVW8xMlY3
dFMzQ0NScU5WbTU2OWl5JTJGdG9YUXFtMk1kQzFnJTNEJmFtcDtyZXNlcnZlZD0wCj4+Pj4+Pj4+
Pgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IE15IHNlbnNlIGlzIGl0IGhlbHBzIHdpdGggdGhlIHZtc3Rh
dC9tZW1pbmZvIGFjY291bnRpbmcgc28gZm9sa3MgY2FuCj4+Pj4+Pj4+PiBzZWUgdGhlIGNhY2hl
ZCBwYWdlcyBhcmUgc2hyaW5rYWJsZS9mcmVlYWJsZS4gVGhpcyBtYXliZSBmYWxscyB1bmRlcgo+
Pj4+Pj4+Pj4gb3RoZXIgZG1hYnVmIGFjY291bnRpbmcvc3RhdHMgZGlzY3Vzc2lvbnMsIHNvIEkn
bSBoYXBweSB0byByZW1vdmUgaXQKPj4+Pj4+Pj4+IGZvciBub3csIG9yIGxldCB0aGUgZHJpdmVy
cyB1c2luZyB0aGUgc2hhcmVkIHBhZ2UgcG9vbCBsb2dpYyBoYW5kbGUKPj4+Pj4+Pj4+IHRoZSBh
Y2NvdW50aW5nIHRoZW1zZWx2ZXM/Cj4+Pj4+Pj4gSW50ZW50aW9uYWxseSBzZXBhcmF0ZWQgdGhl
IGRpc2N1c3Npb24gZm9yIHRoYXQgaGVyZS4KPj4+Pj4+Pgo+Pj4+Pj4+IEFzIGZhciBhcyBJIGNh
biBzZWUgdGhpcyBpcyBqdXN0IGJsdW50bHkgaW5jb3JyZWN0Lgo+Pj4+Pj4+Cj4+Pj4+Pj4gRWl0
aGVyIHRoZSBwYWdlIGlzIHJlY2xhaW1hYmxlIG9yIGl0IGlzIHBhcnQgb2Ygb3VyIHBvb2wgYW5k
IGZyZWVhYmxlCj4+Pj4+Pj4gdGhyb3VnaCB0aGUgc2hyaW5rZXIsIGJ1dCBuZXZlciBldmVyIGJv
dGguCj4+Pj4+PiBJSVJDIHRoZSBvcmlnaW5hbCBtb3RpdmF0aW9uIGZvciBjb3VudGluZyBJT04g
cG9vbGVkIHBhZ2VzIGFzCj4+Pj4+PiByZWNsYWltYWJsZSB3YXMgdG8gaW5jbHVkZSB0aGVtIGlu
dG8gL3Byb2MvbWVtaW5mbydzIE1lbUF2YWlsYWJsZQo+Pj4+Pj4gY2FsY3VsYXRpb25zLiBOUl9L
RVJORUxfTUlTQ19SRUNMQUlNQUJMRSBkZWZpbmVkIGFzICJyZWNsYWltYWJsZQo+Pj4+Pj4gbm9u
LXNsYWIga2VybmVsIHBhZ2VzIiBzZWVtcyBsaWtlIGEgZ29vZCBwbGFjZSB0byBhY2NvdW50IGZv
ciB0aGVtIGJ1dAo+Pj4+Pj4gSSBtaWdodCBiZSB3cm9uZy4KPj4+Pj4gWWVhaCwgdGhhdCdzIHdo
YXQgSSBzZWUgaGVyZSBhcyB3ZWxsLiBCdXQgZXhhY3RseSB0aGF0IGlzIHV0dGVybHkgbm9uc2Vu
c2UuCj4+Pj4+Cj4+Pj4+IFRob3NlIHBhZ2VzIGFyZSBub3QgImZyZWUiIGluIHRoZSBzZW5zZSB0
aGF0IGdldF9mcmVlX3BhZ2UgY291bGQgcmV0dXJuCj4+Pj4+IHRoZW0gZGlyZWN0bHkuCj4+Pj4g
V2VsbCBvbiBBbmRyb2lkIHRoYXQgaXMga2luZGEgdHJ1ZSwgYmVjYXVzZSBBbmRyb2lkIGhhcyBp
dCdzCj4+Pj4gb29tLWtpbGxlciAod2F5IGJhY2sgaXQgd2FzIGp1c3QgYSBzaHJpbmtlciBjYWxs
YmFjaywgbm90IHN1cmUgaG93IGl0Cj4+Pj4gd29ya3Mgbm93KSwgd2hpY2gganVzdCBzaG90IGRv
d24gYWxsIHRoZSBiYWNrZ3JvdW5kIGFwcHMuIFNvIGF0IGxlYXN0Cj4+Pj4gc29tZSBvZiB0aGF0
IChldmVyeXRoaW5nIHVzZWQgYnkgYmFja2dyb3VuZCBhcHBzKSBpcyBpbmRlZWQKPj4+PiByZWNs
YWltYWJsZSBvbiBBbmRyb2lkLgo+Pj4+Cj4+Pj4gQnV0IHRoYXQgZG9lc24ndCBob2xkIG9uIExp
bnV4IGluIGdlbmVyYWwsIHNvIHdlIGNhbid0IHJlYWxseSBkbyB0aGlzCj4+Pj4gZm9yIGNvbW1v
biBjb2RlLgo+Pj4+Cj4+Pj4gQWxzbyBJIGhhZCBhIGxvbmcgbWVldGluZyB3aXRoIFN1cmVuLCBK
b2huIGFuZCBvdGhlciBnb29nbGVzCj4+Pj4geWVzdGVyZGF5LCBhbmQgdGhlIGFpbSBpcyBub3cg
dG8gdHJ5IGFuZCBzdXBwb3J0IGFsbCB0aGUgQW5kcm9pZCBncHUKPj4+PiBtZW1vcnkgYWNjb3Vu
dGluZyBuZWVkcyB3aXRoIGNncm91cHMuIFRoYXQgc2hvdWxkIHdvcmssIGFuZCBpdCB3aWxsCj4+
Pj4gYWxsb3cgQW5kcm9pZCB0byBoYW5kbGUgYWxsIHRoZSBBbmRyb2lkLWlzbSBpbiBhIGNsZWFu
IHdheSBpbiB1cHN0cmVhbQo+Pj4+IGNvZGUuIE9yIHRoYXQncyBhdCBsZWFzdCB0aGUgcGxhbi4K
Pj4+Pgo+Pj4+IEkgdGhpbmsgdGhlIG9ubHkgdGhpbmcgd2UgaWRlbnRpZmllZCB0aGF0IEFuZHJv
aWQgc3RpbGwgbmVlZHMgb24gdG9wCj4+Pj4gaXMgdGhlIGRtYS1idWYgc3lzZnMgc3R1ZmYsIHNv
IHRoYXQgc2hhcmVkIGJ1ZmZlcnMgKHdoaWNoIG9uIEFuZHJvaWQKPj4+PiBhcmUgYWx3YXlzIGRt
YS1idWYsIGFuZCBhbHdheXMgc3RheSBhcm91bmQgYXMgZG1hLWJ1ZiBmZCB0aHJvdWdob3V0Cj4+
Pj4gdGhlaXIgbGlmZXRpbWUpIGNhbiBiZSBsaXN0ZWQvYW5hbHl6ZWQgd2l0aCBmdWxsIGRldGFp
bC4KPj4+Pgo+Pj4+IEJ1dCBhc2lkZSBmcm9tIHRoaXMgdGhlIHBsYW4gZm9yIGFsbCB0aGUgcGVy
LXByb2Nlc3Mgb3IgcGVyLWhlYXAKPj4+PiBhY2NvdW50LCBvb20ta2lsbGVyIGludGVncmF0aW9u
IGFuZCBldmVyeXRoaW5nIGVsc2UgaXMgcGxhbm5lZCB0byBiZQo+Pj4+IGRvbmUgd2l0aCBjZ3Jv
dXBzLgo+Pj4gVW50aWwgY2dyb3VwcyBhcmUgcmVhZHkgd2UgcHJvYmFibHkgd2lsbCBuZWVkIHRv
IGFkZCBhIHN5c2ZzIG5vZGUgdG8KPj4+IHJlcG9ydCB0aGUgdG90YWwgZG1hYnVmIHBvb2wgc2l6
ZSBhbmQgSSB0aGluayB0aGF0IHdvdWxkIGNvdmVyIG91cgo+Pj4gY3VycmVudCBhY2NvdW50aW5n
IG5lZWQgaGVyZS4KPj4+IEFzIEkgbWVudGlvbmVkLCBub3QgaW5jbHVkaW5nIGRtYWJ1ZiBwb29s
cyBpbnRvIE1lbUF2YWlsYWJsZSB3b3VsZAo+Pj4gYWZmZWN0IHRoYXQgc3RhdCBhbmQgSSdtIHdv
bmRlcmluZyBpZiBwb29scyBzaG91bGQgYmUgY29uc2lkZXJlZCBhcwo+Pj4gcGFydCBvZiBNZW1B
dmFpbGFibGUgb3Igbm90LiBTaW5jZSBNZW1BdmFpbGFibGUgaW5jbHVkZXMgU1JlY2xhaW1hYmxl
Cj4+PiBJIHRoaW5rIGl0IG1ha2VzIHNlbnNlIHRvIGluY2x1ZGUgdGhlbSBidXQgbWF5YmUgdGhl
cmUgYXJlIG90aGVyCj4+PiBjb25zaWRlcmF0aW9ucyB0aGF0IEknbSBtaXNzaW5nPwo+PiBPbiBB
bmRyb2lkLCB5ZXMsIG9uIHVwc3RyZWFtLCBub3Qgc28gbXVjaC4gQmVjYXVzZSB1cHN0cmVhbSBk
b2Vzbid0IGhhdmUKPj4gdGhlIGFuZHJvaWQgbG93IG1lbW9yeSBraWxsZXIgY2xlYW51cCB1cCBh
bGwgdGhlIGFwcHMsIHNvIGVmZmVjdGl2ZWx5IHdlCj4+IGNhbid0IHJlY2xhaW0gdGhhdCBtZW1v
cnksIGFuZCB3ZSBzaG91bGRuJ3QgcmVwb3J0IGl0IGFzIHN1Y2guCj4+IC1EYW5pZWwKPiBIbW0u
IFNvcnJ5LCBJIGZhaWwgdG8gc2VlIHdoeSBBbmRyb2lkJ3MgbG93IG1lbW9yeSBraWxsZXIgbWFr
ZXMgYQo+IGRpZmZlcmVuY2UgaGVyZS4gSW4gbXkgbWluZCwgdGhlIHBhZ2VzIGluIHRoZSBwb29s
cyBhcmUgbm90IHVzZWQgYnV0Cj4ga2VwdCB0aGVyZSBpbiBjYXNlIGhlYXBzIG5lZWQgdGhlbSAo
bWF5YmUgdGhhdCdzIHRoZSBwYXJ0IEknbSB3cm9uZz8pLgo+IFRoZXNlIHBhZ2VzIGNhbiBiZSBm
cmVlZCBieSB0aGUgc2hyaW5rZXIgaWYgbWVtb3J5IHByZXNzdXJlIHJpc2VzLgoKQW5kIGV4YWN0
bHkgdGhhdCdzIHRoZSBkaWZmZXJlbmNlLiBUaGV5ICpjYW4qIGJlIGZyZWVkIGlzIG5vdCB0aGUg
c2FtZSAKdGhpbmcgYXMgdGhleSAqYXJlKiBmcmVlLgoKPiBJbiB0aGF0IHNlbnNlIEkgdGhpbmsg
aXQncyB2ZXJ5IHNpbWlsYXIgdG8gcmVjbGFpbWFibGUgc2xhYnMgd2hpY2ggYXJlCj4gYWxyZWFk
eSBhY2NvdW50ZWQgYXMgcGFydCBvZiBNZW1BdmFpbGFibGUuIFNvIGl0IHNlZW1zIGxvZ2ljYWwg
dG8gbWUKPiB0byBpbmNsdWRlIHVudXNlZCBwYWdlcyBpbiB0aGUgcG9vbHMgaGVyZSBhcyB3ZWxs
LiBXaGF0IGFtIEkgbWlzc2luZz8KClNlZSB0aGUgc2hyaW5rZXJzIGFyZSB0aGVyZSBiZWNhdXNl
IHlvdSBuZWVkIHRvIGRvIHNvbWUgYWN0aW9uIGJlZm9yZSAKeW91IGNhbiByZS11c2UgdGhlIG1l
bW9yeS4KCkluIHRoZSBjYXNlIG9mIHRoZSBUVE0vRFJNIHBvb2wgZm9yIGV4YW1wbGUgeW91IG5l
ZWQgdG8gY2hhbmdlIHRoZSAKY2FjaGluZyBhdHRyaWJ1dGVzIHdoaWNoIG1pZ2h0IGNhdXNlIHNs
ZWVwaW5nIGZvciBhIFRMQiBmbHVzaCB0byBmaW5pc2guCgpCeSBhY2NvdW50aW5nIHRob3NlIHBh
Z2VzIGFzIGZyZWUgeW91IG1lc3MgdXAgKGZvciBleGFtcGxlKSB0aGUgaGFuZGxpbmcgCndoaWNo
IG1ha2VzIHN1cmUgdGhhdCB0aGVyZSBhcmUgZW5vdWdoIGVtZXJnZW5jeSByZXNlcnZlcy4gSSBj
YW4gb25seSAKc3Ryb25nbHkgcmVjb21tZW5kIHRvIG5vdCBkbyB0aGF0LgoKV2hhdCB5b3UgY291
bGQgZG8gaXMgdG8gYWRkIGEgc3lzZnMgaW50ZXJmYWNlIHRvIGV4cG9zZSB0aGUgZGlmZmVyZW50
IApzaHJpbmtlcnMgYW5kIHRoZSBhbW91bnQgb2YgcGFnZXMgaW4gdGhlbSB0byB1c2Vyc3BhY2Uu
IFNpbWlsYXIgdG8gd2hhdCAKL3Byb2Mvc2xhYmluZm8gaXMgZG9pbmcuCgpSZWdhcmRzLApDaHJp
c3RpYW4uCgo+Cj4+Pj4gQW5kcm9pZCAoZm9yIG5vdykgb25seSBuZWVkcyB0byBhY2NvdW50IG92
ZXJhbGwgZ3B1Cj4+Pj4gbWVtb3J5IHNpbmNlIG5vbmUgb2YgaXQgaXMgc3dhcHBhYmxlIG9uIGFu
ZHJvaWQgZHJpdmVycyBhbnl3YXksIHBsdXMKPj4+PiBubyB2cmFtLCBzbyBub3QgbXVjaCBuZWVk
ZWQuCj4+Pj4KPj4+PiBDaGVlcnMsIERhbmllbAo+Pj4+Cj4+Pj4+IFJlZ2FyZHMsCj4+Pj4+IENo
cmlzdGlhbi4KPj4+Pj4KPj4+Pj4+PiBJbiB0aGUgYmVzdCBjYXNlIHRoaXMganVzdCBtZXNzZXMg
dXAgdGhlIGFjY291bnRpbmcsIGluIHRoZSB3b3JzdCBjYXNlCj4+Pj4+Pj4gaXQgY2FuIGNhdXNl
IG1lbW9yeSBjb3JydXB0aW9uLgo+Pj4+Pj4+Cj4+Pj4+Pj4gQ2hyaXN0aWFuLgo+Pj4+Cj4+Pj4g
LS0KPj4+PiBEYW5pZWwgVmV0dGVyCj4+Pj4gU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBv
cmF0aW9uCj4+Pj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNv
bS8/dXJsPWh0dHAlM0ElMkYlMkZibG9nLmZmd2xsLmNoJTJGJmFtcDtkYXRhPTA0JTdDMDElN0Nj
aHJpc3RpYW4ua29lbmlnJTQwYW1kLmNvbSU3Q2JiNzE1NTQ0N2VlMTQ5YTQ5ZjNhMDhkOGNkZTI2
ODVkJTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzQ4NTcx
OTYxODM0OTQwNyU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxD
SlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0MxMDAwJmFtcDtz
ZGF0YT0xMUVObDI4UElvU29VeDZGaGtFSzl1NEc2eWlMYzNZaHNZc2wxREl6c3Y4JTNEJmFtcDty
ZXNlcnZlZD0wCj4+IC0tCj4+IERhbmllbCBWZXR0ZXIKPj4gU29mdHdhcmUgRW5naW5lZXIsIElu
dGVsIENvcnBvcmF0aW9uCj4+IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0
bG9vay5jb20vP3VybD1odHRwJTNBJTJGJTJGYmxvZy5mZndsbC5jaCUyRiZhbXA7ZGF0YT0wNCU3
QzAxJTdDY2hyaXN0aWFuLmtvZW5pZyU0MGFtZC5jb20lN0NiYjcxNTU0NDdlZTE0OWE0OWYzYTA4
ZDhjZGUyNjg1ZCU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2
Mzc0ODU3MTk2MTgzNDk0MDclN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpB
d01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMTAw
MCZhbXA7c2RhdGE9MTFFTmwyOFBJb1NvVXg2RmhrRUs5dTRHNnlpTGMzWWhzWXNsMURJenN2OCUz
RCZhbXA7cmVzZXJ2ZWQ9MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
