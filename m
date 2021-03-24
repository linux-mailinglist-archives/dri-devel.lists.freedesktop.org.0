Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 720EE3477DE
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 13:07:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CAA46E9DF;
	Wed, 24 Mar 2021 12:07:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2053.outbound.protection.outlook.com [40.107.223.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C3036E9E1;
 Wed, 24 Mar 2021 12:07:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QtGkQ7mumxqL2v4MT4MXFv/7Sriv7YMnZ4Kwmj2dxrJ/UmAndXcXjvEjrrY9SFuVk8baXKjVAOMKyNG0jotya5yRbIvKHuXTAY0RO16j6CB2t6nrnxV6VqIPrvMscASiy1ihCxAievwGgn+LJJeiXfnxkg8Ci5mhWmnQPvygLIT5Qr1LcLJ9v94RJ0i0N7yMb9xDvTh3kiZf5EGiTMjenLmFYhXBgMdjiQZStRS6x5PucOkANywB3DgiRZ91XJFMmNKpl8wswYsVw/U4pK22kHEAYJNQKjzjL/CNNgPnW0vvI77tEJIUy8+pQgj5fb49QROlb1ScdslaD06d3vGonw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cvFgveJ2Po7U6S4+J/zubrPhN4AnXEh5YFH36me8VN8=;
 b=LNPjst1h9xfcpA/hm535oD3nbqPH5ehZFmeR6y0TgpwvLXQJdpDi0p3FKy4KetDfeYMhCdRn3kp12e9wOs7y46YbFQvp43RBB+LZ1WKFav9B6Vy6AqnRn6VHpPUhuoQoteHr1k/KbjRT+/8/UsczOEj5wrtonCSsTrbvf37ZPWVXfXym4No2rdSZaOAivSrf6SD3G7+eVkTKEWPdnf+r8m7uAONS/CYwpwsiJCh5HGIn1qJta0hBEr6WRIRjII0XB+jKi8b5ci+2D/bmHYZUTu8/onM8IXBDq/sCn/zNuR/d4GUGf2cgr1gFpyBTAsX97948DLERk87tD+BHsivu0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cvFgveJ2Po7U6S4+J/zubrPhN4AnXEh5YFH36me8VN8=;
 b=x2lHFdTamlznouzv/EOWphGZhE1iUjA93BNzQM90GVZ4sX+17mHi13dSrVbxerJR30mFcanuMxgT5b7t4B6covokVyA38K8DCX7LN6tRLjy+iMaIIPfhvDjpE3AaNs0tY2BF6aTvTY+WMb4ir0rTHeelqLdSZvaDU05Zpl1Lj3Q=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3885.namprd12.prod.outlook.com (2603:10b6:208:16c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 24 Mar
 2021 12:07:49 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3955.027; Wed, 24 Mar 2021
 12:07:48 +0000
Subject: Re: [PATCH] drm/ttm: stop warning on TT shrinker failure
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 Michal Hocko <mhocko@suse.com>, Matthew Wilcox <willy@infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Linux MM <linux-mm@kvack.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Dave Chinner <dchinner@redhat.com>, Leo Liu <Leo.Liu@amd.com>
References: <75ff80c5-a054-d13d-85c1-0040addb45d2@gmail.com>
 <YFng9qXM3NdrGHTx@dhcp22.suse.cz>
 <20808d08-b66c-13c3-f672-ebce216b2fa2@gmail.com>
 <YFnwBTF0YntCXFeG@dhcp22.suse.cz>
 <e5659cd0-61b2-82bd-64c3-76bd631b4522@amd.com>
 <YFoFdOtYDAezpSLv@dhcp22.suse.cz>
 <03889c00-bb5d-ef20-12c6-7e77df073dd9@amd.com>
 <762c4597-e9bd-6d8d-51b5-16b04f913eb8@shipmail.org>
 <YFsotY3HXmLNGF7p@phenom.ffwll.local>
 <488c8996-1dd2-4928-a98a-4e72f3e0af64@amd.com>
 <YFsqN7068vUL8rAM@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <31a52f86-e4af-f1d3-90b2-6eff8ec5f300@amd.com>
Date: Wed, 24 Mar 2021 13:07:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <YFsqN7068vUL8rAM@phenom.ffwll.local>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:4ff1:6377:7c5c:81d9]
X-ClientProxiedBy: AM4PR05CA0018.eurprd05.prod.outlook.com (2603:10a6:205::31)
 To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:4ff1:6377:7c5c:81d9]
 (2a02:908:1252:fb60:4ff1:6377:7c5c:81d9) by
 AM4PR05CA0018.eurprd05.prod.outlook.com (2603:10a6:205::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25 via Frontend Transport; Wed, 24 Mar 2021 12:07:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cd680673-e4b4-4f32-014f-08d8eebd710a
X-MS-TrafficTypeDiagnostic: MN2PR12MB3885:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB38851C6189C8BFAB5A0B0D2083639@MN2PR12MB3885.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hpWaS9TkIHO6tYe46fXEpbYofoMYSkDClfLmJAYWM2UHJuBLaI89olJiOjHtb0I5qULrgKYUz40BfFJiRzLNRKKUIN0jz/zXhcCsw4fYlgqME76gKMpoTwROIvar0Z09BRWzKG8LTs3IM8CaXS+qa40xyzVficZGGujvi0RqFPvC820XEZLqPblveyRD6aJDREEPjpbKcNT3+2l4Wy7qQf5WcyuCswxlaDSv1kHJf7xnkRS6V282Ov0b7nWIRYcAYuiPZCyiPId5yfpZ45s9MZRCF2A2zaICnZ2pDp2uI/Dn96/rea0FP1lsY02vY3a9tNFK7ZAASCGXzVAeVufePL9fnbqNAmYP0q9z9IWeeQ66rS5pj2QRYzpC8bTwFDpv+GhRQbsVLQx/8hCw5pcAGwEOwdykASWcCRHGBU5sz59/k4kuJOEB/MjdR3tv+mZcH9leWWMwY0w3wJiPDHqqUa8GUaneg10y70kBAqZRjqcxKDJwabOj3hSR/qvER3X7dgGDT2/ImEs2CfUzCkHxy88pGB9oYh8+uxpnBEljCkMoU7/UtOuVg7kb3WXpkS8rAwe8jBJm7iDPwXK7AUynOKp3HegWaDm/75xW3awd5e/b68lCOG0BhsbhlZSZkRd764ywRLPrs2Q/513F9BPaQBEb3FQOM4IyvUpmUxyH/35F1hP3KZ1Lne8ei8tIR4XTjLUPRYd3rjtDSyp/mNs1fXy1BHlKjgorGz8KDcWpEOo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(31686004)(478600001)(36756003)(6666004)(8676002)(16526019)(110136005)(5660300002)(316002)(6636002)(53546011)(186003)(6486002)(86362001)(83380400001)(38100700001)(66476007)(52116002)(8936002)(31696002)(66574015)(66946007)(2906002)(2616005)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ckEwUVhMdHRuQ3Y4YmtvWEZRbzBLUmlwOFNtSHFhb0U2NW9EM2lJdFNxUkJu?=
 =?utf-8?B?bEFsV1lEQ2xLTDhaWjlJK3NGazBaSFJ6Q1h4WnlaUU5wZnZyM25lYmxnZVM4?=
 =?utf-8?B?K0ZEbkNFOVhzc2wyTnBTdlBhWnY0Q2lWM0JHL3FRL3hTaXpEWjYxZ0JZeE9o?=
 =?utf-8?B?dTdQS2h3V2lmM1Y4OGx1V0szcE95MklsMkd4MUpjZWNPcUxCOXRrb0RYcVhP?=
 =?utf-8?B?bUp4SGxaU25VSjBzMHJ3amExelJOWDVncGppT2xvMXdxSlVXNkYybEY2amhL?=
 =?utf-8?B?TG5xTDJrUTJvaWdwQTlCZ3ZYVzlyMW1IYmpoSVMxRm9Nb2YwSk5pL28vWW5B?=
 =?utf-8?B?WUxHd0dGK1QvMWIvUFFEYmtvRDRCOS94SmlIelB0T3h2TzZBYVUrdkZGUVVN?=
 =?utf-8?B?WU9Hb0VONmFFdSsrcWJ4cWs2WlcvQTFkRk82alUrMUlxM1NobkxVTm8rSjcz?=
 =?utf-8?B?R2w1TFJmclVQUjA1ZXhUTWlKK0xyeGl4bGJYTXFqMjNpSEo2U016Z0RhRTV3?=
 =?utf-8?B?Y3MzUitHbDBwN3ZPSG9XTmxmSkVJWUVuZGd1QjF0SXc5ZkJES1NkMGd1enBM?=
 =?utf-8?B?N1ZEcFg4anV0ZU1IMmJPakx4K1F2L2RCTmh6Z3BNY2FaT3NjMyttZFNia1Bo?=
 =?utf-8?B?c1Q2SHRtSTRuNWE5YjRYSXplSDVPSkV4ejdqclVTcnhBTjFncG1SOUVuZVcy?=
 =?utf-8?B?WWF2NmhJd2VhRGNOWTBEMXh4NG1VbC95SnhZQThreEkwM1Q1VmZxYzBHYlhi?=
 =?utf-8?B?YllYYjl1Wis5eGdJeUxBZWZod0lObDN1L0h4L29nQTdZaUhLdnhtQkJXR3Bt?=
 =?utf-8?B?YjNCT213NVNGS2pQeUc3RVZLSXdHTUgrc04xTkpheHRHUkQ5YnFTcXdiUkdk?=
 =?utf-8?B?ZUNBTUF5d2RxcU14YWxGSU9BYnBzTlpSZ0hsM2tYaVYrMkpZNUdNRUkwK0ZS?=
 =?utf-8?B?SnM5MmRmdGNLZVkxMXpSL3hQdzBzYjdVUzkvaWlXSWRQbWN0cnZNR1QwWjYy?=
 =?utf-8?B?Nkk0YXNFbGZkVTcyT1paSEkrcE5DYkltazZuQTIwZVBsbEdQcEVNK2Y1Yktp?=
 =?utf-8?B?UXkzY1d2elFocHRXNlVBWnNmWWVUaWJmZzdYbzBRSzZRMGhMLzdBRnRVM3Qr?=
 =?utf-8?B?dGtaRXVubjVqRXUyR0NuMlRlc0w4NEFodlYvbVp4b1pDN0ZucGtaOEZHSDFk?=
 =?utf-8?B?K2FZaUNNc2h5MURyZUFKZWJrUFpBNStKdldmWXJ1V0Q5aHhEaW9pQkczcjJt?=
 =?utf-8?B?ZnlTc2lIbEM1em5YcmtVWGNSR1dhSWJBZUxTcE4za21wOWJvNVJycXlKTWl2?=
 =?utf-8?B?Ymw4cjdGNkpGQnllSTNEcXUzamx5QmQ2UHFVa0lUSkJRQUtscVNSTFpPbFk4?=
 =?utf-8?B?RHpOSnhDZ2J4WjVWQlZZNExqYlp0d0xZdEFlS2duNnduLzRRa1JSMUZzSTNU?=
 =?utf-8?B?MnFRZTk0YUg3dVN3aVdIQ0tBc3NKZjRkckZ2eElEbzFQdHFMMllVVFh2dzhV?=
 =?utf-8?B?alZJWDlaQlFtQzVGMzJLbkJnWHY3WDdOdjFid0JZd0xWR1J2bGQ5MDQ5Q2E5?=
 =?utf-8?B?RllmRlJzVmg2dTFidjFNTzg1OFpTWUxEQ2t5cWh4bVlzNS9aSDBnVFNpTTZ4?=
 =?utf-8?B?aWtkNStPSUlmWldFYXBiQ1hWZGR5ZndkbjhXcUlXS1NmTVVvVUhXUnBtUlpQ?=
 =?utf-8?B?VnE3Q1BhT0p2NmZPWWpjQ2UxTlUvYXI1TFdMeklLUWwxVlVIMCtkN0xOZnk1?=
 =?utf-8?B?Q2dNVDFhZFJoczZHTWtVb0gwTDRGTlRNejF3SmNmVDFoUDBhSEc5d3BwWU1a?=
 =?utf-8?B?Vmk2WlBxbS9DY1hhSVE1NkVxVWhDSDJXRTM3MUIxczFkMUJYTVZUelFVdkZX?=
 =?utf-8?Q?Bxu/5C0Wtp2vc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd680673-e4b4-4f32-014f-08d8eebd710a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 12:07:48.8824 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WgiojhdAhIb9Vis0S3BJNx+GrG279dm+oLy3W7XzVyyp0fXQKdq1FXqx9TNE7kN7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3885
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

CgpBbSAyNC4wMy4yMSB1bSAxMzowMSBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4gT24gV2VkLCBN
YXIgMjQsIDIwMjEgYXQgMDE6MDA6MjhQTSArMDEwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToK
Pj4gQW0gMjQuMDMuMjEgdW0gMTI6NTUgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+Pj4gT24gV2Vk
LCBNYXIgMjQsIDIwMjEgYXQgMTE6MTk6MTNBTSArMDEwMCwgVGhvbWFzIEhlbGxzdHLDtm0gKElu
dGVsKSB3cm90ZToKPj4+PiBPbiAzLzIzLzIxIDQ6NDUgUE0sIENocmlzdGlhbiBLw7ZuaWcgd3Jv
dGU6Cj4+Pj4+IEFtIDIzLjAzLjIxIHVtIDE2OjEzIHNjaHJpZWIgTWljaGFsIEhvY2tvOgo+Pj4+
Pj4gT24gVHVlIDIzLTAzLTIxIDE0OjU2OjU0LCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4+
Pj4+IEFtIDIzLjAzLjIxIHVtIDE0OjQxIHNjaHJpZWIgTWljaGFsIEhvY2tvOgo+Pj4+Pj4gWy4u
Ll0KPj4+Pj4+Pj4gQW55d2F5LCBJIGFtIHdvbmRlcmluZyB3aGV0aGVyIHRoZSBvdmVyYWxsIGFw
cHJvYWNoIGlzCj4+Pj4+Pj4+IHNvdW5kLiBXaHkgZG9uJ3QKPj4+Pj4+Pj4geW91IHNpbXBseSB1
c2Ugc2htZW0gYXMgeW91ciBiYWNraW5nIHN0b3JhZ2UgZnJvbSB0aGUKPj4+Pj4+Pj4gYmVnaW5u
aW5nIGFuZCBwaW4KPj4+Pj4+Pj4gdGhvc2UgcGFnZXMgaWYgdGhleSBhcmUgdXNlZCBieSB0aGUg
ZGV2aWNlPwo+Pj4+Pj4+IFllYWgsIHRoYXQgaXMgZXhhY3RseSB3aGF0IHRoZSBJbnRlbCBndXlz
IGFyZSBkb2luZyBmb3IgdGhlaXIKPj4+Pj4+PiBpbnRlZ3JhdGVkCj4+Pj4+Pj4gR1BVcyA6KQo+
Pj4+Pj4+Cj4+Pj4+Pj4gUHJvYmxlbSBpcyBmb3IgVFRNIEkgbmVlZCB0byBiZSBhYmxlIHRvIGhh
bmRsZSBkR1BVcyBhbmQgdGhvc2UgaGF2ZSBhbGwKPj4+Pj4+PiBraW5kcyBvZiBmdW5ueSBhbGxv
Y2F0aW9uIHJlc3RyaWN0aW9ucy4gSW4gb3RoZXIgd29yZHMgSSBuZWVkIHRvCj4+Pj4+Pj4gZ3Vh
cmFudGVlCj4+Pj4+Pj4gdGhhdCB0aGUgYWxsb2NhdGVkIG1lbW9yeSBpcyBjb2hlcmVudCBhY2Nl
c3NpYmxlIHRvIHRoZSBHUFUKPj4+Pj4+PiB3aXRob3V0IHVzaW5nCj4+Pj4+Pj4gU1dJT1RMQi4K
Pj4+Pj4+Pgo+Pj4+Pj4+IFRoZSBzaW1wbGUgY2FzZSBpcyB0aGF0IHRoZSBkZXZpY2UgY2FuIG9u
bHkgZG8gRE1BMzIsIGJ1dCB5b3UgYWxzbyBnb3QKPj4+Pj4+PiBkZXZpY2Ugd2hpY2ggY2FuIG9u
bHkgZG8gNDBiaXRzIG9yIDQ4Yml0cy4KPj4+Pj4+Pgo+Pj4+Pj4+IE9uIHRvcCBvZiB0aGF0IHlv
dSBhbHNvIGdvdCBBR1AsIENNQSBhbmQgc3R1ZmYgbGlrZSBDUFUgY2FjaGUgYmVoYXZpb3IKPj4+
Pj4+PiBjaGFuZ2VzICh3cml0ZSBiYWNrIHZzLiB3cml0ZSB0aHJvdWdoLCB2cy4gdW5jYWNoZWQp
Lgo+Pj4+Pj4gT0ssIHNvIHRoZSB1bmRlcmx5aW5nIHByb2JsZW0gc2VlbXMgdG8gYmUgdGhhdCBn
ZnAgbWFzayAodGh1cwo+Pj4+Pj4gbWFwcGluZ19nZnBfbWFzaykgY2Fubm90IHJlYWxseSByZWZs
ZWN0IHlvdXIgcmVxdWlyZW1lbnRzLCByaWdodD/CoCBXb3VsZAo+Pj4+Pj4gaXQgaGVscCBpZiBz
aG1lbSB3b3VsZCBhbGxvdyB0byBwcm92aWRlIGFuIGFsbG9jYXRpb24gY2FsbGJhY2sgdG8KPj4+
Pj4+IG92ZXJyaWRlIGFsbG9jX3BhZ2Vfdm1hIHdoaWNoIGlzIHVzZWQgY3VycmVudGx5PyBJIGFt
IHByZXR0eSBzdXJlIHRoZXJlCj4+Pj4+PiB3aWxsIGJlIG1vcmUgdG8gaGFuZGxlIGJ1dCBnb2lu
ZyB0aHJvdWdoIHNobWVtIGZvciB0aGUgd2hvbGUgbGlmZSB0aW1lCj4+Pj4+PiBpcyBqdXN0IHNv
IG11Y2ggZWFzaWVyIHRvIHJlYXNvbiBhYm91dCB0aGFuIHNvbWUgdHJpY2tzIHRvIGFidXNlIHNo
bWVtCj4+Pj4+PiBqdXN0IGZvciB0aGUgc3dhcG91dCBwYXRoLgo+Pj4+PiBXZWxsIGl0J3MgYSBz
dGFydCwgYnV0IHRoZSBwYWdlcyBjYW4gaGF2ZSBzcGVjaWFsIENQVSBjYWNoZSBzZXR0aW5ncy4g
U28KPj4+Pj4gZGlyZWN0IElPIGZyb20vdG8gdGhlbSB1c3VhbGx5IGRvZXNuJ3Qgd29yayBhcyBl
eHBlY3RlZC4KPj4+Pj4KPj4+Pj4gQWRkaXRpb25hbCB0byB0aGF0IGZvciBBR1AgYW5kIENNQSBJ
IG5lZWQgdG8gbWFrZSBzdXJlIHRoYXQgSSBnaXZlIHRob3NlCj4+Pj4+IHBhZ2VzIGJhY2sgdG8g
dGhlIHJlbGV2YW50IHN1YnN5c3RlbXMgaW5zdGVhZCBvZiBqdXN0IGRyb3BwaW5nIHRoZSBwYWdl
Cj4+Pj4+IHJlZmVyZW5jZS4KPj4+Pj4KPj4+Pj4gU28gSSB3b3VsZCBuZWVkIHRvIGJsb2NrIGZv
ciB0aGUgc3dhcGlvIHRvIGJlIGNvbXBsZXRlZC4KPj4+Pj4KPj4+Pj4gQW55d2F5IEkgcHJvYmFi
bHkgbmVlZCB0byByZXZlcnQgdGhvc2UgcGF0Y2hlcyBmb3Igbm93IHNpbmNlIHRoaXMgaXNuJ3QK
Pj4+Pj4gd29ya2luZyBhcyB3ZSBob3BlZCBpdCB3b3VsZC4KPj4+Pj4KPj4+Pj4gVGhhbmtzIGZv
ciB0aGUgZXhwbGFuYXRpb24gaG93IHN0dWZmIHdvcmtzIGhlcmUuCj4+Pj4gQW5vdGhlciBhbHRl
cm5hdGl2ZSBoZXJlIHRoYXQgSSd2ZSB0cmllZCBiZWZvcmUgd2l0aG91dCBiZWluZyBzdWNjZXNz
ZnVsCj4+Pj4gd291bGQgcGVyaGFwcyBiZSB0byBkcm9wIHNobWVtIGNvbXBsZXRlbHkgYW5kLCBp
ZiBpdCdzIGEgbm9ybWFsIHBhZ2UgKG5vIGRtYQo+Pj4+IG9yIGZ1bm55IGNhY2hpbmcgYXR0cmli
dXRlcykganVzdCB1c2UgYWRkX3RvX3N3YXBfY2FjaGUoKT8gSWYgaXQncyBzb21ldGhpbmcKPj4+
PiBlbHNlLCB0cnkgYWxsb2MgYSBwYWdlIHdpdGggcmVsZXZhbnQgZ2ZwIGF0dHJpYnV0ZXMsIGNv
cHkgYW5kCj4+Pj4gYWRkX3RvX3N3YXBfY2FjaGUoKT8gT3IgcGVyaGFwcyB0aGF0IGRvZXNuJ3Qg
d29yayB3ZWxsIGZyb20gYSBzaHJpbmtlcgo+Pj4+IGVpdGhlcj8KPj4+IFNvIGJlZm9yZSB3ZSB0
b3NzIGV2ZXJ5dGhpbmcgYW5kIGdvIGFuIGEgZ3JlYXQgcmV3cml0ZS10aGUtd29ybGQgdG91ciwK
Pj4+IHdoYXQgaWYgd2UganVzdCB0cnkgdG8gc3BsaXQgdXAgYmlnIG9iamVjdHMuIFNvIGZvciBv
YmplY3RzIHdoaWNoIGFyZQo+Pj4gYmlnZ2VyIHRoYW4gZS5nLiAxMG1iCj4+Pgo+Pj4gLSBtb3Zl
IHRoZW0gdG8gYSBzcGVjaWFsICJ1bmRlciBldmljdGlvbiIgbGlzdAo+Pj4gLSBrZWVwIGEgbm90
ZSBob3cgZmFyIHdlIGV2aWN0ZWQgdGh1cyBmYXIKPj4+IC0gaW50ZXJsZWF2ZSBhbGxvY2F0aW5n
IHNobWVtIHBhZ2VzLCBjb3B5aW5nIGRhdGEgYW5kIHJlbGVhc2luZyB0aGUgdHRtCj4+PiAgICAg
YmFja2luZyBzdG9yZSBvbiBhIGNodW5rIGJhc2lzIChtYXliZSAxMG1iIG9yIHdoYXRldmVyLCB0
dW5pbmcgdGJoKQo+Pj4KPj4+IElmIHRoYXQncyBub3QgZW5vdWdoLCBvY2Nhc2lvbmFsbHkgYnJl
YWsgb3V0IG9mIHRoZSBzaHJpbmtlciBlbnRpcmVseSBzbwo+Pj4gb3RoZXIgcGFydHMgb2YgcmVj
bGFpbSBjYW4gcmVjbGFpbSB0aGUgc2htZW0gc3R1ZmYuIEJ1dCBqdXN0IHJlbGVhc2luZyBvdXIK
Pj4+IG93biBwYWdlcyBhcyB3ZSBnbyBzaG91bGQgaGVscCBhIGxvdCBJIHRoaW5rLgo+PiBZZWFo
LCB0aGUgbGF0ZXIgaXMgZXhhY3RseSB3aGF0IEkgd2FzIGN1cnJlbnRseSBwcm90b3R5cGluZy4K
Pj4KPj4gSSBqdXN0IGRpZG4ndCB1c2VkIGEgbGltaXQgYnV0IHJhdGhlciBhIG9ubHkgcGFydGlh
bGx5IGV2aWN0ZWQgQk9zIGxpc3QKPj4gd2hpY2ggaXMgdXNlZCB3aGVuIHdlIGZhaWwgdG8gYWxs
b2NhdGUgYSBwYWdlLgo+Pgo+PiBGb3IgdGhlIDUuMTIgY3ljbGUgSSB0aGluayB3ZSBzaG91bGQg
anVzdCBnbyBiYWNrIHRvIGEgaGFyZCA1MCUgbGltaXQgZm9yCj4+IG5vdyBhbmQgdGhlbiByZXN1
cnJlY3QgdGhpcyB3aGVuIHdlIGhhdmUgc29sdmVkIHRoZSBpc3N1ZXMuCj4gQ2FuIHdlIGRvIHRo
ZSA1MCUgbGltaXQgd2l0aG91dCB0b3NzaW5nIG91dCBhbGwgdGhlIGNvZGUgd2UndmUgZG9uZSB0
aHVzCj4gZmFyPyBKdXN0IHNvIHRoaXMgZG9lc24ndCBnZXQgdG9vIGRpc3J1cHRpdmUuCgpZZWFo
LCBJIGp1c3QgbmVlZCB0byBnZXQgYmFjayB0byB2MSBvZiB0aGlzIHBhdGNoLiBCZWZvcmUgeW91
IGNvbnZpbmNlZCAKbWUgdGhhdCB0aGUgc2hyaW5rZXIgaXMgdGhlIGJldHRlciBhcHByb2FjaCAu
KQoKQ2hlZXJzLApDaHJpc3RpYW4uCgo+IC1EYW5pZWwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
