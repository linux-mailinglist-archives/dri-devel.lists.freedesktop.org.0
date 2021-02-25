Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A7E325411
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 17:54:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C11A6E20A;
	Thu, 25 Feb 2021 16:54:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2045.outbound.protection.outlook.com [40.107.93.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A88676E20A;
 Thu, 25 Feb 2021 16:54:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eVJvaSfIP28PY5DG4oj7k2n0U+Wi/F4nL396mXtbQkCNtbjalmrTcXOOpY5ZmLSB96+RDkVQrN20ZvDWs7pHTCbtTRkc19GjBogqkUhTnxfmzgHpSyDmio2eO7xu1W3S7bvhTK/h7V3uEVENNEDhUNxU7UooOyfblgVA7McNvfWvq58OHMCKkmdbEBgi1cRYyM92tJwCjq4txtfMkQuQhwNKo9PPx//UFaRMbSuBrIpdXiY5mMGOIQf9cvV72+D9mbT5IoUwg/xeKmaQKIfCITstbOVo6Jxx8mR9Y6tBHd7+7AXEuordz9M/cYyhIEmYLDYtfoa23fftFPf68R47Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4ZejY3bP27KNTfkq51Pp+4dspIF4imBz0MjOVQ9pB0=;
 b=H73MxkcZKww9XqEXPKyw125uab/Nzhg0W1nTPozdA+NBXslcZa8lpByKkDx7ehVuZCQ9DNhYzvYh6ZbrL7mDvsh+atJpOh0OZ0iMvC8Gf5oYPnWxAlhwPIYh9eyO65v47kyqgtQAZfN8aXvDyvYvhyubGux9VewhF63f2aWsYRLn3KsZiBzmOfGaevhp3dw9mZQGVZwQZGQ7ylbwJadCljBhZY8qf19a57kVR7KUYvjEnveKjoplkEp0tDN3uvc4oJg1SPU8fJ9kMOcayaJ0pNgQfaXIXJqiJli8Ik4Wz8l4VlB46S1ndtZ641k4dqpkcTPooHZNPPikMYw/6F+MsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4ZejY3bP27KNTfkq51Pp+4dspIF4imBz0MjOVQ9pB0=;
 b=Sjo7Uimum+NMlZRaRjhNaNEqLblf81EIC7kK5XC9D+FGLXMgYdmgLpozsfq9E7WnKMlcJsVBNPxqRRPBnph8qxZJKdCQs7N0kC5f1It+kZbcnCKTJRnVQlkEAl8wSI2YKmTNTFnzIB3tZziuspjUvVdIaOinAG10PcC7peKFv28=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4255.namprd12.prod.outlook.com (2603:10b6:208:198::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.33; Thu, 25 Feb
 2021 16:54:09 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3868.033; Thu, 25 Feb 2021
 16:54:09 +0000
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] dma-buf: Require VM_PFNMAP vma for
 mmap
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20210223105951.912577-1-daniel.vetter@ffwll.ch>
 <1a7c2295-6241-f2bf-4a78-6cadd43bc248@shipmail.org>
 <CAKMK7uHzRb6Q_LgPUrrHn18sorYo7ysTgB+PNE36LDUUsJpHDg@mail.gmail.com>
 <f43311c8-a02a-1a29-a53b-88e599c92187@shipmail.org>
 <CAKMK7uE2UrOruQPWG9KPBQ781f9Bq9xpVRNserAC9BZ2VzDutQ@mail.gmail.com>
 <b30dacb0-edea-0a3c-6163-0f329e58ba61@gmail.com>
 <YDd/hlf8uM3+lxhr@phenom.ffwll.local>
 <CAKMK7uFezcV52oTZbHeve2HFFATeCGyK6zTT6nE1KVP69QRr0A@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <432a0da0-ff0e-9b2b-4aee-13f20522fee3@amd.com>
Date: Thu, 25 Feb 2021 17:53:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAKMK7uFezcV52oTZbHeve2HFFATeCGyK6zTT6nE1KVP69QRr0A@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:7944:296:6ad0:31ef]
X-ClientProxiedBy: AM3PR07CA0099.eurprd07.prod.outlook.com
 (2603:10a6:207:6::33) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:7944:296:6ad0:31ef]
 (2a02:908:1252:fb60:7944:296:6ad0:31ef) by
 AM3PR07CA0099.eurprd07.prod.outlook.com (2603:10a6:207:6::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.9 via Frontend Transport; Thu, 25 Feb 2021 16:54:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9dbbf5a3-93c2-4635-2d79-08d8d9adf7e6
X-MS-TrafficTypeDiagnostic: MN2PR12MB4255:
X-MS-Exchange-MinimumUrlDomainAge: bootlin.com#1161
X-Microsoft-Antispam-PRVS: <MN2PR12MB4255DBA5B3B65AC8380897E0839E9@MN2PR12MB4255.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vMJTbfaJPaS1CfzChH/WR2xB3CJpR3/CC7uIUIKotORZyjl+wrbxwTvID44fSDJBGKwBN9tBJIbm93DIALwpHUv/4LlHAWfwa5E59bAqq4HzthP8XhN23ZJBP1FYZK8Ighl2kAEuTr+dAi02WT/1LB+nN8Xb+2x7PsTdgvf8soJamMY2p1xEeyMVE3ZucZfRHmtWxfFurXcUuwTelNO6DYrnt5YkW6G419HBIJn/C5cT5alcEiz+60l/3loeNw7JTwaEgSc7AZjk39znrTE9LBqSKSqCBl8kevacLvjbpBaAkP0B0lLmRbN9bjwFp56bzNuvpH3RU1de6JfK7fUr+NeJa4RuN0auaXYK3t0GT3yeOkTk0n5cWAtFYJZBeyRcUwANS1YL+NKyhpVEkTg1JjkSNw218kss88kXIvGr0L9hxdoK6/RlTcRGEPgItOTbGFPAYrPc2WUjMnUcmbtUc/4BoLk6AKmPgT6/V6tuq3cjPMUcW/4IPdAsK5tcFuYID/Ai+q/zM3vLVHsQ+SBTXGp362Mnd03+BITaeOALDJU7tJc6RP4qkyqycUpXgmUYJurgHxTMZU3up/X5cSIHOjMWZstgnmPrpJKkulRrD3Y8EEoRvXhVclg9cf/DPa6gaolgzlMNOp9fdUvpozZbUVqo8CHJe7nIOCsH8WI9x6kRaXxJSm+KsHb+ejjPmOEf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(39860400002)(396003)(366004)(110136005)(54906003)(8676002)(478600001)(5660300002)(966005)(66556008)(45080400002)(66574015)(6486002)(8936002)(36756003)(2906002)(31696002)(83380400001)(86362001)(52116002)(7416002)(186003)(6666004)(66946007)(16526019)(2616005)(66476007)(31686004)(4326008)(53546011)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UXRwY3pVTUpPOGxqMWJiK3dJbTBxQTBqdzc2a2VHdWNWRVFoN1h2ZHNxSFhX?=
 =?utf-8?B?bnYxdWpZVytpQWRWYlhseVhBSWcwU05Eb3krM1c2WDVJMWhvS0M4Y2ZDUlJn?=
 =?utf-8?B?MkNmRWxKME9QMTZLYysvVG5aNnVmREZNdld5em9pRW1kNGlkVlQ4ZDlOWHZs?=
 =?utf-8?B?QmJMOENSNEZ4dmdrQXczZmg0UHZ1WDVqNnFveEwrRnNFbzduczQ2WE9mUnhB?=
 =?utf-8?B?VFdpUGFpb2NqcXRldkpqVHlSeWpQa0xnSWF1M2FUaDh2d1FsYjBEdnVNdU1D?=
 =?utf-8?B?Q2U4Sm9ZOHVjMXV5TXI0OTZlRGMvZjhOKzhVWGM5RENaWFNGS1dqcDdPNVdI?=
 =?utf-8?B?OGR1d3RXL0RuN1hERnEvTzkveGpCaFFSWTFkQVcwWTNkb3FUSVg4NDMrR0Iv?=
 =?utf-8?B?dHM2YW9mSysvMUhteGQvOXNzWk84eks2UEdNaTNPdjZ6Q2FqSTcvMFdGenhM?=
 =?utf-8?B?d1VSL0JxdHZvSEM5UXNjQWNQN3JPUXUvVTZpblJjLzBweUxXRWVJdXdmUHZa?=
 =?utf-8?B?b3pXV3lRMnB2MC9BRGJSbUMwcS9BY1hrYUVsNFR0bzR3RzhKdkhJRHk1WjhG?=
 =?utf-8?B?WlpVejJCWHkxbHJ3bDU2NW9FL2VZbXhqeFVOSGg0bUdnQmlKQWxLbzVZQjRV?=
 =?utf-8?B?QUNTdlJHelc3cGFJVVQyeHcwdURJeDUzQmhxck8wOGtkYXJVZEhlVlNodGRO?=
 =?utf-8?B?ZElSVWxpRWZWNHZPSkZyTnZFV3dhU0FOejB3YXhlUnhOVHNCTEZvUHlabi80?=
 =?utf-8?B?QmhOcHlCL1UvS29LOXJ1VHl4b2JobHpMNGJFcjNzVmVVWlg3RkZIcFlQUnF0?=
 =?utf-8?B?WG4zY2lvUFNMVCtTU2ZWVEx2WWdvb21lM1RhWVpheEt5NGdOL0h2QTY5eG1K?=
 =?utf-8?B?T1hFVTJ5VDVsSFU5M082djgyTTJOdzBsWEdrTTdQQzVKSjZVaUlIczVGL2lD?=
 =?utf-8?B?SGJqRlAweG1uT3dlMkVXK2pKUlpyY1d1ZDJ0N1BtcGxpTVNpbE81dnFCd2h6?=
 =?utf-8?B?dXphN1UvUjlubkl1Vzd0aWdXZ3dwZUFqMGZuUHhRZ3BycnJ6RjRpeVBod1RI?=
 =?utf-8?B?Mk5Ec2pFS2R0S0I5VnJLZThYK05pTmFDb0VZaEJjcm9VVno0cXYwYWRObHRB?=
 =?utf-8?B?d0JhWDVybDkxaG1lbXJJTHJPYWY0ZFpNYk42ZDB0WHBCVGp5OThqMU5SRm81?=
 =?utf-8?B?L1lKcXhhYW9WZEx4MmhHcXpQdER1RXJFRHlJcVBOUkRSb1A0dy9BRTd6a29Z?=
 =?utf-8?B?elRDZkVtRGxRbUQraWtPeVdkbTYrRFBLcUVSTURrMGJ2ZUVFWXF6VmovT0FT?=
 =?utf-8?B?YnZPbUs2M2pHZlpDM0o3ZjZmRzJHWUdBNXdWSUhtQVlNdjJqUFJmSkdQWGlh?=
 =?utf-8?B?NVRiZnF2UGVjV2NRN0ZhYlRGcElROUx4N0dLQ3pOSGNQVWdFZlFTYjdoNFRT?=
 =?utf-8?B?SjAxV1ZjZlFadUJMVjNHL2ZuRytsOEJGbWZBTithZ1JqcDNtQ04zblF6NWVh?=
 =?utf-8?B?VmFWcWo3OWt4NG9jeEpOOFM4c1FuazlKNDZ0VkowMHZ3R28yWFdxemdYMnhT?=
 =?utf-8?B?ZHBhWWpmSW11QUVoUG5ESWMzd0tvTGQ5MXF1eDNjZ20wTlo4QjVVQUJqalE5?=
 =?utf-8?B?ZXQ2elZpZjk0R0YxNEMxQ244SVBhVmdqWVZPNGpMZ29jd3MwQUxpVGdmR0hi?=
 =?utf-8?B?VVZaYXZOOHRsbHB4ZWcrWlJDc24wc2ZJTWlDQjcrUWNWMkFlR0VWY1pIeldB?=
 =?utf-8?B?OWtBQUQ3cEcxZlA1ZEhDc09qWjJtY1BkZW50dmxncEdIdDlhMGordWdBWXkw?=
 =?utf-8?B?c01YVlcwTVVVSEFOV2JoQW41WUozTjdGc01vUUNISGNUdEdsQytYN2RJejky?=
 =?utf-8?Q?CUyK6d7ekGDj7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dbbf5a3-93c2-4635-2d79-08d8d9adf7e6
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2021 16:54:08.9829 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ZHOEu96unWEP/F+FJYtlnc6MMiTw2jS4ntwIUTjvCaNY9l/dQxAwOtTOQy/pmOn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4255
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 Matthew Wilcox <willy@infradead.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpBbSAyNS4wMi4yMSB1bSAxNjo0OSBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4gT24gVGh1LCBG
ZWIgMjUsIDIwMjEgYXQgMTE6NDQgQU0gRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPiB3
cm90ZToKPj4gT24gVGh1LCBGZWIgMjUsIDIwMjEgYXQgMTE6Mjg6MzFBTSArMDEwMCwgQ2hyaXN0
aWFuIEvDtm5pZyB3cm90ZToKPj4+IEFtIDI0LjAyLjIxIHVtIDEwOjMxIHNjaHJpZWIgRGFuaWVs
IFZldHRlcjoKPj4+PiBPbiBXZWQsIEZlYiAyNCwgMjAyMSBhdCAxMDoxNiBBTSBUaG9tYXMgSGVs
bHN0csO2bSAoSW50ZWwpCj4+Pj4gPHRob21hc19vc0BzaGlwbWFpbC5vcmc+IHdyb3RlOgo+Pj4+
PiBPbiAyLzI0LzIxIDk6NDUgQU0sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4+Pj4+PiBPbiBXZWQs
IEZlYiAyNCwgMjAyMSBhdCA4OjQ2IEFNIFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCkKPj4+Pj4+
IDx0aG9tYXNfb3NAc2hpcG1haWwub3JnPiB3cm90ZToKPj4+Pj4+PiBPbiAyLzIzLzIxIDExOjU5
IEFNLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+Pj4+Pj4+PiB0bGRyOyBETUEgYnVmZmVycyBhcmVu
J3Qgbm9ybWFsIG1lbW9yeSwgZXhwZWN0aW5nIHRoYXQgeW91IGNhbiB1c2UKPj4+Pj4+Pj4gdGhl
bSBsaWtlIHRoYXQgKGxpa2UgY2FsbGluZyBnZXRfdXNlcl9wYWdlcyB3b3Jrcywgb3IgdGhhdCB0
aGV5J3JlCj4+Pj4+Pj4+IGFjY291bnRpbmcgbGlrZSBhbnkgb3RoZXIgbm9ybWFsIG1lbW9yeSkg
Y2Fubm90IGJlIGd1YXJhbnRlZWQuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFNpbmNlIHNvbWUgdXNlcnNw
YWNlIG9ubHkgcnVucyBvbiBpbnRlZ3JhdGVkIGRldmljZXMsIHdoZXJlIGFsbAo+Pj4+Pj4+PiBi
dWZmZXJzIGFyZSBhY3R1YWxseSBhbGwgcmVzaWRlbnQgc3lzdGVtIG1lbW9yeSwgdGhlcmUncyBh
IGh1Z2UKPj4+Pj4+Pj4gdGVtcHRhdGlvbiB0byBhc3N1bWUgdGhhdCBhIHN0cnVjdCBwYWdlIGlz
IGFsd2F5cyBwcmVzZW50IGFuZCB1c2VhYmxlCj4+Pj4+Pj4+IGxpa2UgZm9yIGFueSBtb3JlIHBh
Z2VjYWNoZSBiYWNrZWQgbW1hcC4gVGhpcyBoYXMgdGhlIHBvdGVudGlhbCB0bwo+Pj4+Pj4+PiBy
ZXN1bHQgaW4gYSB1YXBpIG5pZ2h0bWFyZS4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gVG8gc3RvcCB0aGlz
IGdhcCByZXF1aXJlIHRoYXQgRE1BIGJ1ZmZlciBtbWFwcyBhcmUgVk1fUEZOTUFQLCB3aGljaAo+
Pj4+Pj4+PiBibG9ja3MgZ2V0X3VzZXJfcGFnZXMgYW5kIGFsbCB0aGUgb3RoZXIgc3RydWN0IHBh
Z2UgYmFzZWQKPj4+Pj4+Pj4gaW5mcmFzdHJ1Y3R1cmUgZm9yIGV2ZXJ5b25lLiBJbiBzcGlyaXQg
dGhpcyBpcyB0aGUgdWFwaSBjb3VudGVycGFydCB0bwo+Pj4+Pj4+PiB0aGUga2VybmVsLWludGVy
bmFsIENPTkZJR19ETUFCVUZfREVCVUcuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IE1vdGl2YXRlZCBieSBh
IHJlY2VudCBwYXRjaCB3aGljaCB3YW50ZWQgdG8gc3dpY2ggdGhlIHN5c3RlbSBkbWEtYnVmCj4+
Pj4+Pj4+IGhlYXAgdG8gdm1faW5zZXJ0X3BhZ2UgaW5zdGVhZCBvZiB2bV9pbnNlcnRfcGZuLgo+
Pj4+Pj4+Pgo+Pj4+Pj4+PiB2MjoKPj4+Pj4+Pj4KPj4+Pj4+Pj4gSmFzb24gYnJvdWdodCB1cCB0
aGF0IHdlIGFsc28gd2FudCB0byBndWFyYW50ZWUgdGhhdCBhbGwgcHRlcyBoYXZlIHRoZQo+Pj4+
Pj4+PiBwdGVfc3BlY2lhbCBmbGFnIHNldCwgdG8gY2F0Y2ggZmFzdCBnZXRfdXNlcl9wYWdlcyAo
b24gYXJjaGl0ZWN0dXJlcwo+Pj4+Pj4+PiB0aGF0IHN1cHBvcnQgdGhpcykuIEFsbG93aW5nIFZN
X01JWEVETUFQIChsaWtlIFZNX1NQRUNJQUwgZG9lcykgd291bGQKPj4+Pj4+Pj4gc3RpbGwgYWxs
b3cgdm1faW5zZXJ0X3BhZ2UsIGJ1dCBsaW1pdGluZyB0byBWTV9QRk5NQVAgd2lsbCBjYXRjaCB0
aGF0Lgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiAgICAgRnJvbSBhdWRpdGluZyB0aGUgdmFyaW91cyBmdW5j
dGlvbnMgdG8gaW5zZXJ0IHBmbiBwdGUgZW50aXJlcwo+Pj4+Pj4+PiAodm1faW5zZXJ0X3Bmbl9w
cm90LCByZW1hcF9wZm5fcmFuZ2UgYW5kIGFsbCBpdCdzIGNhbGxlcnMgbGlrZQo+Pj4+Pj4+PiBk
bWFfbW1hcF93YykgaXQgbG9va3MgbGlrZSBWTV9QRk5NQVAgaXMgYWxyZWFkeSByZXF1aXJlZCBh
bnl3YXksIHNvCj4+Pj4+Pj4+IHRoaXMgc2hvdWxkIGJlIHRoZSBjb3JyZWN0IGZsYWcgdG8gY2hl
Y2sgZm9yLgo+Pj4+Pj4+Pgo+Pj4+Pj4+IElmIHdlIHJlcXVpcmUgVk1fUEZOTUFQLCBmb3Igb3Jk
aW5hcnkgcGFnZSBtYXBwaW5ncywgd2UgYWxzbyBuZWVkIHRvCj4+Pj4+Pj4gZGlzYWxsb3cgQ09X
IG1hcHBpbmdzLCBzaW5jZSBpdCB3aWxsIG5vdCB3b3JrIG9uIGFyY2hpdGVjdHVyZXMgdGhhdAo+
Pj4+Pj4+IGRvbid0IGhhdmUgQ09ORklHX0FSQ0hfSEFTX1BURV9TUEVDSUFMLCAoc2VlIHRoZSBk
b2NzIGZvciB2bV9ub3JtYWxfcGFnZSgpKS4KPj4+Pj4+IEhtIEkgZmlndXJlZCBldmVyeW9uZSBq
dXN0IHVzZXMgTUFQX1NIQVJFRCBmb3IgYnVmZmVyIG9iamVjdHMgc2luY2UKPj4+Pj4+IENPVyBy
ZWFsbHkgbWFrZXMgYWJzb2x1dGVseSBubyBzZW5zZS4gSG93IHdvdWxkIHdlIGVuZm9yY2UgdGhp
cz8KPj4+Pj4gUGVyaGFwcyByZXR1cm5pbmcgLUVJTlZBTCBvbiBpc19jb3dfbWFwcGluZygpIGF0
IG1tYXAgdGltZS4gRWl0aGVyIHRoYXQKPj4+Pj4gb3IgYWxsb3dpbmcgTUlYRURNQVAuCj4+Pj4+
Cj4+Pj4+Pj4gQWxzbyB3b3J0aCBub3RpbmcgaXMgdGhlIGNvbW1lbnQgaW4gIHR0bV9ib19tbWFw
X3ZtYV9zZXR1cCgpIHdpdGgKPj4+Pj4+PiBwb3NzaWJsZSBwZXJmb3JtYW5jZSBpbXBsaWNhdGlv
bnMgd2l0aCB4ODYgKyBQQVQgKyBWTV9QRk5NQVAgKyBub3JtYWwKPj4+Pj4+PiBwYWdlcy4gVGhh
dCdzIGEgdmVyeSBvbGQgY29tbWVudCwgdGhvdWdoLCBhbmQgbWlnaHQgbm90IGJlIHZhbGlkIGFu
eW1vcmUuCj4+Pj4+PiBJIHRoaW5rIHRoYXQncyB3aHkgdHRtIGhhcyBhIHBhZ2UgY2FjaGUgZm9y
IHRoZXNlLCBiZWNhdXNlIGl0IGluZGVlZAo+Pj4+Pj4gc3Vja3MuIFRoZSBQQVQgY2hhbmdlcyBv
biBwYWdlcyBhcmUgcmF0aGVyIGV4cGVuc2l2ZS4KPj4+Pj4gSUlSQyB0aGUgcGFnZSBjYWNoZSB3
YXMgaW1wbGVtZW50ZWQgYmVjYXVzZSBvZiB0aGUgc2xvd25lc3Mgb2YgdGhlCj4+Pj4+IGNhY2hp
bmcgbW9kZSB0cmFuc2l0aW9uIGl0c2VsZiwgbW9yZSBzcGVjaWZpY2FsbHkgdGhlIHdiaW52ZCgp
IGNhbGwgKwo+Pj4+PiBnbG9iYWwgVExCIGZsdXNoLgo+Pj4gWWVzLCBleGFjdGx5IHRoYXQuIFRo
ZSBnbG9iYWwgVExCIGZsdXNoIGlzIHdoYXQgcmVhbGx5IGJyZWFrcyBvdXIgbmVjayBoZXJlCj4+
PiBmcm9tIGEgcGVyZm9ybWFuY2UgcGVyc3BlY3RpdmUuCj4+Pgo+Pj4+Pj4gVGhlcmUgaXMgc3Rp
bGwgYW4gaXNzdWUgZm9yIGlvbWVtIG1hcHBpbmdzLCBiZWNhdXNlIHRoZSBQQVQgdmFsaWRhdGlv
bgo+Pj4+Pj4gZG9lcyBhIGxpbmVhciB3YWxrIG9mIHRoZSByZXNvdXJjZSB0cmVlIChsb2wpIGZv
ciBldmVyeSB2bV9pbnNlcnRfcGZuLgo+Pj4+Pj4gQnV0IGZvciBpOTE1IGF0IGxlYXN0IHRoaXMg
aXMgZml4ZWQgYnkgdXNpbmcgdGhlIGlvX21hcHBpbmcKPj4+Pj4+IGluZnJhc3RydWN0dXJlLCB3
aGljaCBkb2VzIHRoZSBQQVQgcmVzZXJ2YXRpb24gb25seSBvbmNlIHdoZW4geW91IHNldAo+Pj4+
Pj4gdXAgdGhlIG1hcHBpbmcgYXJlYSBhdCBkcml2ZXIgbG9hZC4KPj4+Pj4gWWVzLCBJIGd1ZXNz
IHRoYXQgd2FzIHRoZSBpc3N1ZSB0aGF0IHRoZSBjb21tZW50IGRlc2NyaWJlcywgYnV0IHRoZQo+
Pj4+PiBpc3N1ZSB3YXNuJ3QgdGhlcmUgd2l0aCB2bV9pbnNlcnRfbWl4ZWQoKSArIFZNX01JWEVE
TUFQLgo+Pj4+Pgo+Pj4+Pj4gQWxzbyBUVE0gdXNlcyBWTV9QRk5NQVAgcmlnaHQgbm93IGZvciBl
dmVyeXRoaW5nLCBzbyBpdCBjYW4ndCBiZSBhCj4+Pj4+PiBwcm9ibGVtIHRoYXQgaHVydHMgbXVj
aCA6LSkKPj4+Pj4gSG1tLCBib3RoIDUuMTEgYW5kIGRybS10aXAgYXBwZWFycyB0byBzdGlsbCB1
c2UgTUlYRURNQVA/Cj4+Pj4+Cj4+Pj4+IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rp
b24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmVsaXhpci5ib290bGluLmNvbSUyRmxp
bnV4JTJGbGF0ZXN0JTJGc291cmNlJTJGZHJpdmVycyUyRmdwdSUyRmRybSUyRnR0bSUyRnR0bV9i
b192bS5jJTIzTDU1NCZhbXA7ZGF0YT0wNCU3QzAxJTdDY2hyaXN0aWFuLmtvZW5pZyU0MGFtZC5j
b20lN0NhOTNkMGRiYmMwNDg0ZmVjMTE4ODA4ZDhkOWE0ZmMyMiU3QzNkZDg5NjFmZTQ4ODRlNjA4
ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2Mzc0OTg2NDk5MzU0NDI1MTYlN0NVbmtub3duJTdD
VFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJ
azFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMTAwMCZhbXA7c2RhdGE9NyUyQk8wV05kQkY2MmVWRHk3
dTRoUnlkc2Z2aUY2ZEJKRURlWmlZSXpRQWNjJTNEJmFtcDtyZXNlcnZlZD0wCj4+Pj4gVWggdGhh
dCdzIGJhZCwgYmVjYXVzZSBtaXhlZCBtYXBzIHBvaW50aW5nIGF0IHN0cnVjdCBwYWdlIHdvbnQg
c3RvcAo+Pj4+IGd1cC4gQXQgbGVhc3QgYWZhaWsuCj4+PiBIdWk/IEknbSBwcmV0dHkgc3VyZSBN
SVhFRE1BUCBzdG9wcyBndXAgYXMgd2VsbC4gT3RoZXJ3aXNlIHdlIHdvdWxkIGhhdmUKPj4+IGFs
cmVhZHkgc2VlbiB0b25zIG9mIHByb2JsZW1zIHdpdGggdGhlIHBhZ2UgY2FjaGUuCj4+IE9uIGFu
eSBhcmNoaXRlY3R1cmUgd2hpY2ggaGFzIENPTkZJR19BUkNIX0hBU19QVEVfU1BFQ0lBTCB2bV9p
bnNlcnRfbWl4ZWQKPj4gYm9pbHMgZG93biB0byB2bV9pbnNlcnRfcGZuIHdydCBndXAuIEFuZCBz
cGVjaWFsIHB0ZSBzdG9wcyBndXAgZmFzdCBwYXRoLgo+Pgo+PiBCdXQgaWYgeW91IGRvbid0IGhh
dmUgVk1fSU8gb3IgVk1fUEZOTUFQIHNldCwgdGhlbiBJJ20gbm90IHNlZWluZyBob3cKPj4geW91
J3JlIHN0b3BwaW5nIGd1cCBzbG93IHBhdGguIFNlZSBjaGVja192bWFfZmxhZ3MoKSBpbiBtbS9n
dXAuYy4KPj4KPj4gQWxzbyBpZiB5b3UgZG9uJ3QgaGF2ZSBDT05GSUdfQVJDSF9IQVNfUFRFX1NQ
RUNJQUwgdGhlbiBJIGRvbid0IHRoaW5rCj4+IHZtX2luc2VydF9taXhlZCBldmVuIHdvcmtzIG9u
IGlvbWVtIHBmbnMuIFRoZXJlJ3MgdGhlIGRldm1hcCBleGNlcHRpb24sCj4+IGJ1dCB3ZSdyZSBu
b3QgZGV2bWFwLiBXb3JzZSB0dG0gYWJ1c2VzIHNvbWUgYWNjaWRlbnRhbCBjb2RlcGF0aCB0byBz
bXVnZ2xlCj4+IGluIGh1Z2VwdGUgc3VwcG9ydCBieSBpbnRlbnRpb25hbGx5IG5vdCBiZWluZyBk
ZXZtYXAuCj4+Cj4+IFNvIEknbSByZWFsbHkgbm90IHN1cmUgdGhpcyB3b3JrcyBhcyB3ZSB0aGlu
ayBpdCBzaG91bGQuIE1heWJlIGdvb2QgdG8gZG8KPj4gYSBxdWljayB0ZXN0IHByb2dyYW0gb24g
YW1kZ3B1IHdpdGggYSBidWZmZXIgaW4gc3lzdGVtIG1lbW9yeSBvbmx5IGFuZCB0cnkKPj4gdG8g
ZG8gZGlyZWN0IGlvIGludG8gaXQuIElmIGl0IHdvcmtzLCB5b3UgaGF2ZSBhIHByb2JsZW0sIGFu
ZCBhIGJhZCBvbmUuCj4gVGhhdCdzIHByb2JhYmx5IGltcG9zc2libGUsIHNpbmNlIGEgcXVpY2sg
Z2l0IGdyZXAgc2hvd3MgdGhhdCBwcmV0dHkKPiBtdWNoIGFueXRoaW5nIHJlYXNvbmFibGUgaGFz
IHNwZWNpYWwgcHRlczogYXJjLCBhcm0sIGFybTY0LCBwb3dlcnBjLAo+IHJpc2N2LCBzMzkwLCBz
aCwgc3BhcmMsIHg4Ni4gSSBkb24ndCB0aGluayB5b3UnbGwgaGF2ZSBhIHBsYXRmb3JtCj4gd2hl
cmUgeW91IGNhbiBwbHVnIGFuIGFtZGdwdSBpbiBhbmQgYWN0dWFsbHkgZXhlcmNpc2UgdGhlIGJ1
ZyA6LSkKPgo+IFNvIG1heWJlIHdlIHNob3VsZCBqdXN0IHN3aXRjaCBvdmVyIHRvIFZNX1BGTk1B
UCBmb3IgdHRtIGZvciBtb3JlIGNsYXJpdHk/CgpNYXliZSB5ZXMsIGJ1dCBub3Qgc3VyZS4KCkkn
dmUgb25jZSBoYWQgYSByZXF1ZXN0IHRvIGRvIHRoaXMgZnJvbSBzb21lIGdvb2dsZSBndXlzLCBi
dXQgcmVqZWN0ZWQgCml0IGJlY2F1c2UgSSB3YXNuJ3Qgc3VyZSBvZiB0aGUgY29uc2VxdWVuY2Vz
LgoKQ2hyaXN0aWFuLgoKPiAtRGFuaWVsCj4KPgo+Pj4gUmVnYXJkcywKPj4+IENocmlzdGlhbi4K
Pj4+Cj4+Pj4gQ2hyaXN0aWFuLCBkbyB3ZSBuZWVkIHRvIHBhdGNoIHRoaXMgdXAsIGFuZCBtYXli
ZSBmaXggdXAgdHRtIGZhdWx0Cj4+Pj4gaGFuZGxlciB0byB1c2UgaW9fbWFwcGluZyBzbyB0aGUg
dm1faW5zZXJ0X3BmbiBzdHVmZiBpcyBmYXN0Pwo+Pj4+IC1EYW5pZWwKPj4gLS0KPj4gRGFuaWVs
IFZldHRlcgo+PiBTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KPj4gaHR0cHM6
Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHAlM0ElMkYl
MkZibG9nLmZmd2xsLmNoJTJGJmFtcDtkYXRhPTA0JTdDMDElN0NjaHJpc3RpYW4ua29lbmlnJTQw
YW1kLmNvbSU3Q2E5M2QwZGJiYzA0ODRmZWMxMTg4MDhkOGQ5YTRmYzIyJTdDM2RkODk2MWZlNDg4
NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzQ5ODY0OTkzNTQ0MjUxNiU3Q1Vua25v
d24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pC
VGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0MxMDAwJmFtcDtzZGF0YT1QbWRJYllNNmtlbVhz
dFNjZjJPb1pVOVl5WEdHenpOemVXRXlMOFpEbmZvJTNEJmFtcDtyZXNlcnZlZD0wCj4KPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
