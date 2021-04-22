Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E85923685B5
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 19:19:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3AF36E544;
	Thu, 22 Apr 2021 17:19:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2089.outbound.protection.outlook.com [40.107.243.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4726F6E544
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 17:19:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=it/S5Qeytbgvh0vrNYmyE8AhT04++FRQK4dUAYud5JRRAf9C47r0bFyKhEFXIA0ZGPjWHoggxP79I9E7tbokfswgAJ0B5aygZ3hN3Rbc7E7LoB/z73jeYT7MMJwLu4s84FLb0GP8ZChVV3avK1KXFrWD1En3etPVE42AuQIkhM5oSCjMtqULnlW9tKHkHk1zFCled95v8LNf9yMa3cnNlVSFkdvIxKHijl/rgpl5XP7VvsrUd88pozGNYWs6ivjR+XOczJc2J8U+ltCtRzpaYrpKblHAtZ8GPK2B2R1UWUU+t8uYAgmCb+5UocZDoOpSphbQoHUo+rq2BKWUOfIBuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TCCOJYCUX76us8XjHYI6opo+WD8E9F4Bi1KRM/R1kE8=;
 b=ZpRF3HZ9Flk7S7TWgWgc4W83CaQGtvGa2pbK/jDSXiFJCcrjXF3AUUL1JG/8W7U1LOAH8QNPjX6/7n2wLS0eOdxyBTYfQA7i4a0rfIZGLVMW7iiTdOiGlvbMUTSqw5XdO5Ahog3pzZnpJx+bIb5cvdCkjJY0U/OA2WsaqFPrSHXQrXBGhUC8n7yPwq3S2BD6v9tVc5PsdH4HTAUEr/gWf1vJLfwTpkaOdsyG4HNnc239KTq1S/7DIp/D2PmgCuOOBoayrm98V3CAUc4S/cditFRJKYpwAHb3PHGnM++cL08p9d/C99qjyBXX7MxcE3TAnY1JKAc7JcTT/mQCTo02fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TCCOJYCUX76us8XjHYI6opo+WD8E9F4Bi1KRM/R1kE8=;
 b=Oo8SV2P7bF+0s7A+hLmOhEbYJohtPxHPH9rbTIM9zpDWZ07fDNnAw3mX5cPc3BQpb/XikxYxwgDenFFB2N8Xtx+P4P5E2k64BkSFNaknhIS5ZxH+1XaKbFeruqQZYOHI9czUSvkgXic3jNkRFpwdxKIkifvtSNhDRoV+FtKkhWI=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=vmware.com;
Received: from MN2PR05MB6624.namprd05.prod.outlook.com (2603:10b6:208:d8::18)
 by MN2PR05MB6256.namprd05.prod.outlook.com (2603:10b6:208:cb::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.19; Thu, 22 Apr
 2021 17:19:46 +0000
Received: from MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::603b:4954:dbec:c02]) by MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::603b:4954:dbec:c02%7]) with mapi id 15.20.4065.023; Thu, 22 Apr 2021
 17:19:46 +0000
Subject: Re: [PATCH] drm/ttm: fix error handling if no BO can be swapped out v4
To: dri-devel@lists.freedesktop.org
References: <20210422115757.3946-1-christian.koenig@amd.com>
From: Zack Rusin <zackr@vmware.com>
Message-ID: <477a579a-3f4e-0dd8-f8d0-38e4126bbb65@vmware.com>
Date: Thu, 22 Apr 2021 13:19:44 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210422115757.3946-1-christian.koenig@amd.com>
Content-Language: en-US
X-Originating-IP: [108.36.85.85]
X-ClientProxiedBy: BL1PR13CA0104.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::19) To MN2PR05MB6624.namprd05.prod.outlook.com
 (2603:10b6:208:d8::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.193] (108.36.85.85) by
 BL1PR13CA0104.namprd13.prod.outlook.com (2603:10b6:208:2b9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.16 via Frontend
 Transport; Thu, 22 Apr 2021 17:19:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e4282e5a-c505-4a19-9052-08d905b2d380
X-MS-TrafficTypeDiagnostic: MN2PR05MB6256:
X-Microsoft-Antispam-PRVS: <MN2PR05MB62564287306A8F3653EAF544CE469@MN2PR05MB6256.namprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D67yRmsJFhHboqRXRUys8eSP6u8tBq8qWwNtpF3rLVS3ODVougGIA7Z74RIAsmuvF2xzPJHvKLz5JT5PhrVIoCUnGVLmiS3b/AiwqA2UDrTCvb4dxxjdHmxeTgWuyZSGxL6BJzzQx6mBzBO5h8WVzvmbmgBILPxipduKPrQDm7xxH1aBJ5Ms7SNEVh+08p6spTJdAFsRnanvcVHLVc6pbeGukRRIirH+GvhqTNyU8x6KO1BU0XUHkczLMLG3/vBJ6nglg9eljHZlcKhDcmknjMmvIjKBpqX3sllyR5Dr4gXwwwBafmAY8x5OUu0nqc77WhQ39Fd1NUrG89nH+WpM4lCmIQcoIXUszdmAY9eEnZ4fO6PutAlQPb1BcvNRt4byiUvhoCx6fDdnK9hYQyD1xqf9sPObsAWGPlCf1+4+TF9pW3l/IrWh9lpwuuQfNYOoWrnklh55L6dSYBIYBMaJ40wecdwk4lMaHmQvYZQ0l2rezGEPaB3mPIEJk5+B4nNXRZAKL5Ye/b3ZmeEoqioOySzXgHX/l7hMX9dK1NmN6ztgqzTeebE2LfooFOYPQLzixv+lpqwHMi6m1uHivARujro34W09oXMy5QVE4vVaP6lRLQvvboNpRzdaUsui+YINHiiH4shitLfWuZXvPyuImQ/1fdvanFW2Sl2oGEHFHAx3xa1V/qcb62iGBQ18gk3K
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR05MB6624.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(39860400002)(136003)(366004)(66946007)(66556008)(2906002)(8676002)(66476007)(6486002)(31696002)(5660300002)(38100700002)(86362001)(31686004)(316002)(83380400001)(16576012)(53546011)(6916009)(36756003)(478600001)(8936002)(2616005)(26005)(186003)(16526019)(956004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?N0RGQlE2Zkl5a1Yxd09zc2VXNG9zZVhIYXE2b3BaN3pqa2pLbm0vcDdSaXFI?=
 =?utf-8?B?RmtITUNsejZrK3VVTDEzZThPaC9OZEh5K0JlVkJZRHlNNG9IZmhpQS8zamEv?=
 =?utf-8?B?T3hzbHU5NjBLQldXZjg2NURieGpsdmFsVjlGeHM5a2dXaVgvK2NkT21DenFX?=
 =?utf-8?B?VFZBMzdiTDFEcXA5UFVURk5Oem5IdDhZek1mTGNPSW9saFpkNzVDbElZM2Ux?=
 =?utf-8?B?LzJoZ3pDZFJGUW4zM3ZYYmtqNGVmTEFTbFZRQWp3RExBNlY2V3ZnM2s4TUtt?=
 =?utf-8?B?REV0czhvUEVqUU13Z0hkZlVzUWxJcXRMSnJKM3FGa1FBTktnUHMvSXFaVnhW?=
 =?utf-8?B?RFlDb0RvTUdvTDNmQlIvRnVpclc1S0NraHFuOHlYTXNSSkdrRXlqWDJUYW91?=
 =?utf-8?B?SDUvdzRwZ2VPM3ZlUjBpT1FYay94L01qajlMM2pqT09BKzdzRHVjWVVjZnhP?=
 =?utf-8?B?NEJ6N3lDWm1MT29KU0FpTjlMem9pUW5EV1doYitJMEpucGxSaS8vUmlvSnJF?=
 =?utf-8?B?eXNhYzZhZVdMcmFsRDE4VU5WcjZYNFh3dTk5aXRCNG9MOVJsNVV0WEMrK2xP?=
 =?utf-8?B?d2dJQkVkbENvTG9iRjNmNGpOVFZPcmo4YktDMTB4c1JNc1FRWE1uVmVLbmw3?=
 =?utf-8?B?dFB4WFVUdVpVYWwzZEhxazNxNlFsbE41RU5WMDF2WlFJSWs4UnJLSFdIR0NI?=
 =?utf-8?B?MWN6aWtXdnZaREpFM3o5SDdRWjVxNW1oNk02MGE0QkoySWRFWnZkUzhNWkpt?=
 =?utf-8?B?c2xKb2U2V3lObUU0aEI3MnlsZjIvWG9BYTVsREpuL2dlWk9PeEZ2dk13dmFQ?=
 =?utf-8?B?Uzl5c0dzOGU4eUVRRDlBSE5ENW5PbDRaNnZ3YmJZY0tZSzFqTk5UVFYwSU84?=
 =?utf-8?B?eDdrb0l2cWlBQ3ZxZjlUVjJBdzVRTDZJcEZ3RnJYTk94aW9XWWErRlQ0cUhr?=
 =?utf-8?B?a3Btd0ZEb0RjQ0VSWDJZS1JvdU1LMEZRTDNFa29rMThEMk9LMThyZnROeTZX?=
 =?utf-8?B?TXlFK1Fscytjd2dnMG5LUkVJZjY0RWd3VjlEUTVJckg2WFVDWTRhYkJQYUZY?=
 =?utf-8?B?d3E5cGxvdjU4bDNEVG56dytWOURFTjg2UDBENEdYVmFOem5YK3hycE93K3M1?=
 =?utf-8?B?ZHlxdUxPV3lLR3o0TFo4dXpvKzhlU1ZVcERDaytsQ0RaWTNwcDN0VURWd0hN?=
 =?utf-8?B?Zjh4TUROSnZGRzJBMnhzMHNFeFl5dktRYndMTWkxR2N2bFFoK3AvdEVCdUJC?=
 =?utf-8?B?TUNXSVEwSUV5bWxEQXR2a2x1YjJlRzFpSFd6czJINXR4KzhVb0MvYnpjbTY4?=
 =?utf-8?B?d0hzSXJ0N2tMemhNTSs5VlVtLzFHL1FPQUYxWVNGYWtVQUYzcnpFTytWN25o?=
 =?utf-8?B?aEMwN1pvd2JUQTVxbW8vVzZES1MxSFRDSDJSbXNhall3blhnUXlpalNNdUxB?=
 =?utf-8?B?S1EyYVBlVGlFdm41UXhHUEdjQXFmRGtkb3VHOWtUd2xhaWd6Q0MxeGRTVW9l?=
 =?utf-8?B?SHkvZ3B4RXREOTRKNXR4WldJc3BORmthK1Z3OWZydUlwaVpmejRSWndVeXRR?=
 =?utf-8?B?a01vdlB4SmIvbG5SQ2NZSWwyM2cxd2h5M1VxZElpM090c3VzaE5kSVNVYkZU?=
 =?utf-8?B?SnZhL1dqL1hJRmxNS1JKUyt2cGxOVXRFa1JLWjBybXM2YUltL2laeDNxbnpw?=
 =?utf-8?B?YnB3c090R0psNkxDQlcwc00xNXlkZ1Bzb0M1M0ZBKzFSMTZXZnNKVWVnNmhv?=
 =?utf-8?Q?inIkgW22zoEBMFXJwG/kGBjTAO1sV65SXAMaWXt?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4282e5a-c505-4a19-9052-08d905b2d380
X-MS-Exchange-CrossTenant-AuthSource: MN2PR05MB6624.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 17:19:46.2440 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bLU+oo4j7JVdX/fZeqPsFb+2G/BTNMQLlnpMQz55Giryu4LNSYEkry4HwbN/neM/p0gnXsXGEpBXX9v4EyX1sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6256
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

T24gNC8yMi8yMSA3OjU3IEFNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+IEZyb206IFNoaXd1
IFpoYW5nIDxzaGl3dS56aGFuZ0BhbWQuY29tPgo+IAo+IEluIGNhc2UgdGhhdCBhbGwgcHJlLWFs
bG9jYXRlZCBCT3MgYXJlIGJ1c3ksIGp1c3QgY29udGludWUgdG8gcG9wdWxhdGUKPiBCT3Mgc2lu
Y2UgbGlrZWx5IGhhbGYgb2Ygc3lzdGVtIG1lbW9yeSBpbiB0b3RhbCBpcyBzdGlsbCBmcmVlLgo+
IAo+IHY0IChjaGspOiBmaXggY29kZSBtb3ZlZCB0byBWTVdHRlggYXMgd2VsbAo+IAo+IFNpZ25l
ZC1vZmYtYnk6IFNoaXd1IFpoYW5nIDxzaGl3dS56aGFuZ0BhbWQuY29tPgo+IFJldmlld2VkLWJ5
OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gU2lnbmVkLW9m
Zi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IC0tLQo+
ICAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fZGV2aWNlLmMgICAgfCAyICstCj4gICBkcml2ZXJz
L2dwdS9kcm0vdHRtL3R0bV90dC5jICAgICAgICB8IDIgKysKPiAgIGRyaXZlcnMvZ3B1L2RybS92
bXdnZngvdHRtX21lbW9yeS5jIHwgMiArLQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90
dG0vdHRtX2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fZGV2aWNlLmMKPiBpbmRl
eCAxZjIwMjQxNjRkNzIuLjVkYzkyYjA1NmYwYSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vdHRtL3R0bV9kZXZpY2UuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2Rldmlj
ZS5jCj4gQEAgLTExMiw3ICsxMTIsNyBAQCBpbnQgdHRtX2dsb2JhbF9zd2Fwb3V0KHN0cnVjdCB0
dG1fb3BlcmF0aW9uX2N0eCAqY3R4LCBnZnBfdCBnZnBfZmxhZ3MpCj4gICB7Cj4gICAJc3RydWN0
IHR0bV9nbG9iYWwgKmdsb2IgPSAmdHRtX2dsb2I7Cj4gICAJc3RydWN0IHR0bV9kZXZpY2UgKmJk
ZXY7Cj4gLQlpbnQgcmV0ID0gLUVCVVNZOwo+ICsJaW50IHJldCA9IDA7CgpMb29rcyBnb29kIHRv
IG1lLiBVcGRhdGluZyB0aGUgY29tbWVudCBhYm92ZSB0aGF0IGZ1bmN0aW9uIHRvIG5vdGUgaXQg
cmV0dXJucyBlaXRoZXIgdGdlIG51bWJlciBvZiBwYWdlcyBzd2FwcGVkIG91dCBvciBhbiBlcnJv
ciBtaWdodCBiZSBhIGdvb2QgaWRlYSBiZWNhdXNlIGl0J3Mgbm90IG9idmlvdXMgZnJvbSB0aGUg
bmFtZS4KClJldmlld2VkLWJ5OiBaYWNrIFJ1c2luIDx6YWNrckB2bXdhcmUuY29tPgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
