Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DA9340070
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 08:49:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E43326E89C;
	Thu, 18 Mar 2021 07:49:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2051.outbound.protection.outlook.com [40.107.236.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E7796E89A;
 Thu, 18 Mar 2021 07:49:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NKnmZMINavqPzoAz+tNCkK16CBQbajMOJ3+WBONzjui3Qn0GtBMpXYqCTJ/KcgD0i0qWAbYBRshX7kIB630GMBPcNDx683W3wuhmyg9We1qaMCdGXxpE2Gfb/PP5PvuHhBEyqeJwz7/ilRKNIewOl+Kxqke47HH88I7aM3na5ybdSdM9xZ3ujKd+9tDyjc5Y/qQwf58mBVzJ2CGvYnMg+5rg9kcViYQ5mUzpLGnCq52J9k+LjVC0ipOPsVLXi+Jim1HWm94y6cjd59KBmUI+MhRymYikVODJWmu3/fFQ6avWgcGNFfLbck7MXUGZ5igLiLWEFjJBafO3pCmfvMeRsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MSG35hspwYlyZM+ee6Tpkd8Ve7LaePnc5N6SpJD0ZK4=;
 b=LZLLIAFZoZr0g1R8CcmMv58WpbnpSi3mNutrdv1xJajr+qonZIVma6pzDwUHgkSgUg/rULcX6ruyOs0GpMXx/K35FzX7Q1ABWtlqBn3MVTpRZHKpJUwWQ7XznqXkdXnBpez8r3yaBbXzQ7eixniL33DGOZHpFHPh/RQNCVlou44qukuoFpab9llRkyeMQR9iI6z8Cg8BHqKOC6mghMReg7CCb6P1/ltzGX0svj2QNjUHQYu2Nz8+c6OnFqgrauNIEeVdITmRkoomoRnWWWik6jjGIKfhyaMObTJkuyZYBXpDmFF+DMNC0NHGXpBgEtmG0Mu/QOnLGA+b6vgdqOvIyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MSG35hspwYlyZM+ee6Tpkd8Ve7LaePnc5N6SpJD0ZK4=;
 b=qN661akNs0p95qlIs57DWzwIjn0yKQr66PSi3XhJBf5vIYquiR7g6MZT0BqgX4abwIx8zS7BPIGlZghqkDi1zDY/eJ4XKbpaDQr4lmlQxjI9J+kyt8fhmWOGKka6YI6wszIjnlFYfoz3NFsRAFYQIake4Bth2I7TgNfGjJQQ9q8=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4109.namprd12.prod.outlook.com (2603:10b6:208:1d9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Thu, 18 Mar
 2021 07:49:33 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3933.033; Thu, 18 Mar 2021
 07:49:33 +0000
Subject: Re: [PATCH] drm/amdgpu/ttm: Fix memory leak userptr pages
To: Daniel Gomez <daniel@qtec.com>
References: <20210317160840.36019-1-daniel@qtec.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <bb94b582-a720-9c4f-3d37-d1f7fd29da44@amd.com>
Date: Thu, 18 Mar 2021 08:49:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210317160840.36019-1-daniel@qtec.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:44e7:a99a:b86c:e453]
X-ClientProxiedBy: FR2P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::21) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:44e7:a99a:b86c:e453]
 (2a02:908:1252:fb60:44e7:a99a:b86c:e453) by
 FR2P281CA0011.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.9 via Frontend Transport; Thu, 18 Mar 2021 07:49:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ac835032-6be9-4c91-1098-08d8e9e25e56
X-MS-TrafficTypeDiagnostic: MN2PR12MB4109:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4109FB49431AEC71F98EAF8283699@MN2PR12MB4109.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WN4+nQeDvkQs5mRo1Tle2lpdSdpw+xOLuxJnGOWFLWhv34xeEvRzbXva/Bc/z4WbcpGcXk3w0nPXKsCSolH4ZrFpYP1yi9D94Ua18z3a8RGwj5ZrHQHB0QuYfCCOzvdN2BZXy8pIx3k/7C6NAETpi2NcIg1d4PTRmkyv6IoIV7mQD3ls27TG2eS0xUTFu2eEFgY3yiifY5HVdQlBJr3mD1r6mkssLGFHjSAG1LWrsuoHXWbuv56nEShlUqJAezggRYwYJeGElWz/W1Azwn7N6w+3DiYmSCrJQYqjZ3doXSr+NHSg/MrGKBMPJL3/ZQOdtGdynXPEIgmcfOPEwilf4suF3eb24tV1eZ7by5FTd1SFAyQnMmAMCrWj8U77HzDvWKI65f3pFiprCY4PWmuOGFmrSkJGAGZWLqeuJ83L1GCMxilY4cB14XUP8isF2adx7GyEagEZeaOGW14HK/B0D/e+RYib7s6sCR8SgmZyl1Ma7LtjcZnv4fcDFDDwZiWkOnsTBNHwVvujN8tdMfhYNuy+MFtlc2Gm4taavM1CgmWLuaMtKFtnBL96KSct+dlFLHCv30WBZRl/vxO5uTj9eEiwzR8FSa6EceJNGntaM9ikTOJ0zsozr80HeF/Rtpm4oo2e6RUYHGrql7V+qc78KlvBYVsYZWY3JQ5yQKXn1ZB3zI4lShWvSTH+3JQ2h1hp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(366004)(396003)(39860400002)(31686004)(478600001)(16526019)(54906003)(8676002)(186003)(2616005)(52116002)(66556008)(2906002)(66476007)(36756003)(6916009)(6486002)(5660300002)(66946007)(83380400001)(4326008)(31696002)(38100700001)(8936002)(86362001)(6666004)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ajlKdC9IMUpUMlQxcm9wdkMyU0VuMTU4VEtLRkVrNVdweFBlVkVDQkdUMDFz?=
 =?utf-8?B?MkRjc2tzL2QzT3p4L3U2ZVZaanVGQ2dtYUNMZ01VMEdIK1dDNVVySEtHY2tY?=
 =?utf-8?B?VytMMngwVEFpTENKTXhFM2JDeTZCK2lYMW1Xd2JXZy8zRVdSY0h4bmhlOG13?=
 =?utf-8?B?WTlXaXJBalE3VSs0eHFjc055bVF0aHRiVk1ya1VvUU5rdzBLVkVXcjlsK1JS?=
 =?utf-8?B?eGFtNFh5eWE5bTcvVnBXZDlXNXh0ZmUrN29ndXZpRVQ3ZGRHM2pyTVlJSHo1?=
 =?utf-8?B?RVdxTDR5aGRNcXgwTkVaR0huMHIzQWdQWnlGbit5VXpRUEFnNXAxYXorYVpY?=
 =?utf-8?B?QXZxOGNXdG53NlEvZXdVRFNmZDhkcUF6RXdwS3hRSjlrVTF2RzJlRlJpVVEw?=
 =?utf-8?B?dXNYODkxMXpHK0hJeXlheCtBMEF0KzlpcXZ4dmd4UzNoejJGdDd0WFp4VDU1?=
 =?utf-8?B?VE1IR2V0Q2dmRzVlOHVFQW1WTzdrbWhRL3pra05SR3REeCs3S09jUG9EZ2NN?=
 =?utf-8?B?Q2JiajJZWUp2SHVvVDN3c2tJTHNKaTFmclFuai9acEpIZ2VHSWhyN3JOY1k5?=
 =?utf-8?B?SjhVZy9UZTBoaTBXZFBrekVGWjRTRW5tVGJoWjBhVWRVbHc2OU1OcHczYmNo?=
 =?utf-8?B?RnhHaFlMQ0Y5S2t3R0xiOXRVcWJ2eXIzNHlXamwvcW9UT3ZKTGVZYmQwQ2Yy?=
 =?utf-8?B?ZUpkSUtXRGUrS3hmbGlRVTNUclBSWEYvaVQydHJ6a0ZuWWJtcmljenRIajlE?=
 =?utf-8?B?TzlKTWJCS2NHVUhEYmF6dm1FbFMrYUVuNldCZE44RVIvRkczU3pxazJadFBm?=
 =?utf-8?B?ZHM2bHpVb294dXF1cVVrdFlZR1VybmV1TlFYY0RJVFNGc2ZGQzB2b084d0xU?=
 =?utf-8?B?RUtiTkw1SWJEanUzMm1lYmZ4dmRpOHo5L2kzZzUxOWtBMG4zRHJ5Y3U3andH?=
 =?utf-8?B?OWJ6TDJrTW80K3psUW1mK1VmSnFCbFA5Mkd1cXB3aUtGQnBwMnNEUkZiWUVN?=
 =?utf-8?B?a3lhZys3bitlTVBDTmFqSm40ZHFvY282blFmVHp0Y09ZNXVRYjU2T1lLUlNl?=
 =?utf-8?B?aFhoZE5SMUJkNGtKZERrZi85bVdlZDgzTHY1SHFLVlRKT2xJYnlXOHluWmw3?=
 =?utf-8?B?YmtIeE51R3p6ck1NRDNhN0dWZW0rT1F4NjFOdzBhK0Q2VkRWZEw1MzRtc3Rk?=
 =?utf-8?B?RTBhdnV2cWFIbWxBdkU1VlBxbmN3dHJOcnlrazMvRXJxV0RMOE11UjZPbVcv?=
 =?utf-8?B?VDNUemNiVWJ5RExFY0t2TXpWK3cyelY3WFJIaVBwNnR3T3pGUU4vLzh0bjRT?=
 =?utf-8?B?bDQvSEVPVnhzYnlETE9McFBvYWdqdDljVmxPeWZMMjJOY1JkMFFwQzJzc3FS?=
 =?utf-8?B?UVhUVE9LRDF2VEcvRE1sRm1naGpnTExxWENBOFV1dCtVcEIrblVabk5KOHBK?=
 =?utf-8?B?THEzUkJLbjZpbEdCZGNzNnRBUkRXVVNPaGlsWjkzTHBUeGo0NDh2TUZWNnVP?=
 =?utf-8?B?eTM0ZCtvUDkxZWRQV1lWWk05UG5IM3Q2K0tKOVNIczYyQVp5UDY4Zk4reW42?=
 =?utf-8?B?UVRhNnhFNjhLTlo1MXF4NVJETWxWRUk2MW9qUDZ5R2E5Z0JMTzMxb0hzWjBG?=
 =?utf-8?B?UmFNN0JVc3F6VjBWNWd3NHRpS01FWkgyL21EclltMEZuTVp2RUpiNnlpU3B4?=
 =?utf-8?B?WHlLT3ovYU9pN1VZUDBtWE5pc1ZnelI5eWl1Y1g2WFdYS1hpc2x4OUlHNkgv?=
 =?utf-8?B?U2FveVZXa1VwTjgzaWROT21pQkx1Q05MZWdxVVYxeUNxRjAxVG9kbm9WdThU?=
 =?utf-8?B?SFB4bDRmSVltZDlkbE9lQnFKY0JvQkU1bUZWdDNmVDB3dDRrTGRxaEFleXpR?=
 =?utf-8?Q?jV4Q3u0Rz/SXk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac835032-6be9-4c91-1098-08d8e9e25e56
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2021 07:49:32.9343 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MRzLk4yabELiRd3PYFgfPx/oECNLDXKj5Nrfcj35J2nl2AVEl+GttB5RWbYfgWKy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4109
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
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Felix Kuehling <Felix.Kuehling@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dagmcr@gmail.com,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 Likun Gao <Likun.Gao@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTcuMDMuMjEgdW0gMTc6MDggc2NocmllYiBEYW5pZWwgR29tZXo6Cj4gSWYgdXNlcnB0ciBw
YWdlcyBoYXZlIGJlZW4gcGlubmVkIGJ1dCBub3QgYm91bmRlZCwKPiB0aGV5IHJlbWFpbiB1bmNs
ZWFyZWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgR29tZXogPGRhbmllbEBxdGVjLmNvbT4K
Ckdvb2QgY2F0Y2gsIG5vdCBzdXJlIGlmIHRoYXQgY2FuIGV2ZXIgaGFwcGVuIGluIHByYWN0aWNl
IGJ1dCBiZXR0ZXIgc2F2ZSAKdGhhbiBzb3JyeS4KClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2
bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jIHwgNiArKystLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3R0bS5jCj4gaW5kZXggOWZkMjE1N2IxMzNhLi41MGMyYjQ4MjdjMTMgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jCj4gQEAgLTExNjIsMTMgKzEx
NjIsMTMgQEAgc3RhdGljIHZvaWQgYW1kZ3B1X3R0bV9iYWNrZW5kX3VuYmluZChzdHJ1Y3QgdHRt
X2JvX2RldmljZSAqYmRldiwKPiAgIAlzdHJ1Y3QgYW1kZ3B1X3R0bV90dCAqZ3R0ID0gKHZvaWQg
Kil0dG07Cj4gICAJaW50IHI7Cj4gICAKPiAtCWlmICghZ3R0LT5ib3VuZCkKPiAtCQlyZXR1cm47
Cj4gLQo+ICAgCS8qIGlmIHRoZSBwYWdlcyBoYXZlIHVzZXJwdHIgcGlubmluZyB0aGVuIGNsZWFy
IHRoYXQgZmlyc3QgKi8KPiAgIAlpZiAoZ3R0LT51c2VycHRyKQo+ICAgCQlhbWRncHVfdHRtX3R0
X3VucGluX3VzZXJwdHIoYmRldiwgdHRtKTsKPiAgIAo+ICsJaWYgKCFndHQtPmJvdW5kKQo+ICsJ
CXJldHVybjsKPiArCj4gICAJaWYgKGd0dC0+b2Zmc2V0ID09IEFNREdQVV9CT19JTlZBTElEX09G
RlNFVCkKPiAgIAkJcmV0dXJuOwo+ICAgCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
