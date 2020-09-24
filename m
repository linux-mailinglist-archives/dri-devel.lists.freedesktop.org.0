Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 631CD276EA2
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 12:24:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 612D96E1B6;
	Thu, 24 Sep 2020 10:24:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760052.outbound.protection.outlook.com [40.107.76.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5FD86E1BB
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 10:24:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GRB80da/ey/zFjZlP+ZqGHQktFGuz3FZz7nc2eaDVhTfrrC4e75jUdg+JXB/ABQIb0cXWSaxG9KQPUJPlsPrCFNjh8OPb9giX3lw0GrcVoBCJ5qv9N4RS8odEC/9ftUciy4tfH2ZSOUfwkFmtIkH41sT8u9e3meRhZJJ9NQTZAHdFS6MS7QVnmT8slzEi8AmuPJOmFDTd13WPT0vP6yZbnSsU3ywydPZ52OAO78q2I9klwe68YR6uQKMzckQ9dt1u1zAMwptIfUfCot4jVgzlQ/B4rI0O55XvrR5rGRhztBI7rww19LJKwuoQPsCQnufvDEZcLg8jRdn0dWogjfHnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pUYoPMAZejP4ubaRONWstkdvHDMbyquKfVugtGoVpfg=;
 b=QbYVg4+i1NBs/QexqoUqoMlNCQYwmueTgrEMLd+n8+t66MaAeLYup1JNc4rJnqqqOEXVgp3WO+z7R84tQfrOyF0wVbJ3kuy32D40AxPT/0mdVq9gTdFdXcmvZHEXY+4RziErutGwKnqOL/KX5wBO9F32u60qLnxEr54sSGX5xrnXmGROBem/DqyqS67FVD6SaMwexc1OkGnfbFlVfUlsfpTzhie3QY+dYnq7GB0V3D6ChTWs4ZQt7V6jKr+awkyXwRWgpVOWJtLjyomp27C0vFqwG8cvQ7ghbvysB0ANqlYCosZu3u5B1r/ybXEmcO6oyoOH4CljcueX/EVWIWtS/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pUYoPMAZejP4ubaRONWstkdvHDMbyquKfVugtGoVpfg=;
 b=MEA5wafuxzSmfuLOGCC7QljRyu/cXNqRsfj0ZHBKk0q8nOyfszqE2m1iMIHHs5VZuY3eRCuf1kHv2TE3+Ec24gnwfMy7gCmNyFN71c/UKEuwnc20pbYuK57zDXaZ8nXDUY8wynOoZsXcry18BwAhuU+qL6MybeBcf4n4PGsy2CQ=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4334.namprd12.prod.outlook.com (2603:10b6:208:1d1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Thu, 24 Sep
 2020 10:24:27 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3412.022; Thu, 24 Sep 2020
 10:24:27 +0000
Subject: Re: [PATCH 02/45] drm/ttm: handle the SYSTEM->TT path in same place
 as others.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200924051845.397177-1-airlied@gmail.com>
 <20200924051845.397177-3-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <1333ecf0-22e6-aaca-3c62-9f7029c3521e@amd.com>
Date: Thu, 24 Sep 2020 12:24:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200924051845.397177-3-airlied@gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR03CA0081.eurprd03.prod.outlook.com
 (2603:10a6:208:69::22) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR03CA0081.eurprd03.prod.outlook.com (2603:10a6:208:69::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.20 via Frontend Transport; Thu, 24 Sep 2020 10:24:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bd32f50d-1d54-435c-1a22-08d8607403a4
X-MS-TrafficTypeDiagnostic: MN2PR12MB4334:
X-Microsoft-Antispam-PRVS: <MN2PR12MB43342496C0791A04006D9F9483390@MN2PR12MB4334.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kbQWOgY4Yeex0mpMe4oW12XLwyO+yvfvkx+v3Q+jsBQaApqmaHgTfgAQ99CiLFtmBcYWI2RtC2mkNdAnUZ1P+0fGLMMA+z/GPDgDaBOHGj+3aWy76dtAYwyiZbWt9KIuGwme7neFHn1iu1rKeJh10coJIbfA5IR+mIfq13KloUycGH9q4dCOr3lwNZuU+h9ShPc5xfUTgrvjE0mWJTmatt4/9WdF9sUyu2a6c3QTdYi4SkUgH5w/SnL8u5sZYP09HnQEui7gl1yGZ7+R3Im2LGSrqy30Fm1ShSg/OAJbF4EixRp88IdaDFYOtp3YsCs1TTdYu36/1vWw9bcfmB6W1Ut9ZQS8VQlbS3BEUUtUm5+suGQHpoKeoi5Zy0xcnBrbUiBBw7k/qkxrhVjveTq+irYF7R0JYR0Z6NU3i35Xw1M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(376002)(136003)(366004)(396003)(316002)(52116002)(5660300002)(6666004)(66946007)(83380400001)(16526019)(31696002)(66476007)(36756003)(66556008)(8676002)(6486002)(2906002)(8936002)(86362001)(186003)(478600001)(4326008)(2616005)(31686004)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: e2SH21C8ezgcd5xUHznAqYJGU/ExtjIm9/K4l9pGuHoawEFEfbUVLOO3DjLDKVqSCE0y7lE6Um53gXqwt7dQoxxKtLyMElgGgnQGnoR+TVDoWA58hi+dBxnoGlP+OFSbTChJ8t5D8+6Qul8cPUUMU9mA2Ygn/iBtBCajEccgKUXN2hiVgTxNjfYDPdVIvUM4Yll7GpjXV7s1hap9ExlTR9QgUVNYuJhm+2ZTrTUDbkbG5TYRSAneuMhCPF3Nhoyq/L6n5R47YICvVvLcTQ/SrF5vfaKC5X1mNjj9mDT2ZtIac2eI3ucpBul6CO3/t2Ij3JLHCSnbZgbdWv5lDi+Y8f0S++N3zl/cpPv56Dwuw96KJr/Y1AN7E+HQREJYWGgIiFtrcT31LclO/zeLgKmuguNRFBsqv2UwgyEW5kpz9qBnl5B6gYeJgwAtC8JItUOHwbf77yMftF/NL0dMu1Euyd3un/BUSqDsi/Kbv+Yz28Qv/SsfUNu02KMAeSfYwBHS+a53boSMPkj+RJ4bTZ6NeSNEWLi7ijIh84KkRihcjegVXyKvT+HjFTjh8bFK+i87KFBZr1eLVY+Dlf8Nx0Ytp9my4iy0ICxELdFpr2OP5VGMTsA6N/a5cnziTDQEfrrm1cLCVhMLzpel7Xu34rBznHzNgq9mCxH+Fk31I9NvtyInxQzYrT/+uxcLKq60jGrFwJeUo/ElTV3wEoI0bc1rPg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd32f50d-1d54-435c-1a22-08d8607403a4
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2020 10:24:26.9772 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ofIoSnrAGgQktbaUkSIRvpkTKcMagjIoF0mxOXtWNmZ4dtwu2D7UhWLA4GlVU0Ig
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4334
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
Cc: bskeggs@redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjQuMDkuMjAgdW0gMDc6MTggc2NocmllYiBEYXZlIEFpcmxpZToKPiBGcm9tOiBEYXZlIEFp
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gVGhpcyBqdXN0IGNvbnNvbGlkYXRlcyB0aGUg
Y29kZSBtYWtpbmcgdGhlIGZsb3cgZWFzaWVyIHRvIHVuZGVyc3RhbmQKPiBhbmQgYWxzbyBoZWxw
cyB3aGVuIG1vdmluZyBtb3ZlIHRvIHRoZSBkcml2ZXIgc2lkZS4KPgo+IFNpZ25lZC1vZmYtYnk6
IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL2dwdS9k
cm0vdHRtL3R0bV9iby5jIHwgMTcgKysrKysrKy0tLS0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2Vk
LCA3IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4g
aW5kZXggYzM0MmJmYzJiNGMxLi42ZDE1MjAyNTVmYzEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3R0bS90dG1fYm8uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMK
PiBAQCAtMjY1LDIwICsyNjUsMTggQEAgc3RhdGljIGludCB0dG1fYm9faGFuZGxlX21vdmVfbWVt
KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCj4gICAJCQlpZiAocmV0KQo+ICAgCQkJCWdv
dG8gb3V0X2VycjsKPiAgIAkJfQo+IC0KPiAtCQlpZiAoYm8tPm1lbS5tZW1fdHlwZSA9PSBUVE1f
UExfU1lTVEVNKSB7Cj4gLQkJCWlmIChiZGV2LT5kcml2ZXItPm1vdmVfbm90aWZ5KQo+IC0JCQkJ
YmRldi0+ZHJpdmVyLT5tb3ZlX25vdGlmeShibywgZXZpY3QsIG1lbSk7Cj4gLQkJCWJvLT5tZW0g
PSAqbWVtOwo+IC0JCQlnb3RvIG1vdmVkOwo+IC0JCX0KPiAgIAl9Cj4gICAKPiAgIAlpZiAoYmRl
di0+ZHJpdmVyLT5tb3ZlX25vdGlmeSkKPiAgIAkJYmRldi0+ZHJpdmVyLT5tb3ZlX25vdGlmeShi
bywgZXZpY3QsIG1lbSk7Cj4gICAKPiAtCWlmIChvbGRfbWFuLT51c2VfdHQgJiYgbmV3X21hbi0+
dXNlX3R0KQo+IC0JCXJldCA9IHR0bV9ib19tb3ZlX3R0bShibywgY3R4LCBtZW0pOwo+ICsJaWYg
KG9sZF9tYW4tPnVzZV90dCAmJiBuZXdfbWFuLT51c2VfdHQpIHsKPiArCQlpZiAoYm8tPm1lbS5t
ZW1fdHlwZSA9PSBUVE1fUExfU1lTVEVNKSB7Cj4gKwkJCXR0bV9ib19hc3NpZ25fbWVtKGJvLCBt
ZW0pOwo+ICsJCQlyZXQgPSAwOwo+ICsJCX0gZWxzZQo+ICsJCQlyZXQgPSB0dG1fYm9fbW92ZV90
dG0oYm8sIGN0eCwgbWVtKTsKPiArCX0KPiAgIAllbHNlIGlmIChiZGV2LT5kcml2ZXItPm1vdmUp
CgpUaGlzIHNob3VsZCB0aGVuIHVzZSAifSBlbHNlIGlmICguLi4pIHsiLCBhcGFydCBmcm9tIHRo
YXQgdGhlIHBhdGNoIGlzIApSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFu
LmtvZW5pZ0BhbWQuY29tPi4KCkNocmlzdGlhbi4KCj4gICAJCXJldCA9IGJkZXYtPmRyaXZlci0+
bW92ZShibywgZXZpY3QsIGN0eCwgbWVtKTsKPiAgIAllbHNlCj4gQEAgLTI5NCw3ICsyOTIsNiBA
QCBzdGF0aWMgaW50IHR0bV9ib19oYW5kbGVfbW92ZV9tZW0oc3RydWN0IHR0bV9idWZmZXJfb2Jq
ZWN0ICpibywKPiAgIAkJZ290byBvdXRfZXJyOwo+ICAgCX0KPiAgIAo+IC1tb3ZlZDoKPiAgIAlj
dHgtPmJ5dGVzX21vdmVkICs9IGJvLT5udW1fcGFnZXMgPDwgUEFHRV9TSElGVDsKPiAgIAlyZXR1
cm4gMDsKPiAgIAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
