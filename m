Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEFD1DB43B
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 14:55:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82D4D8975F;
	Wed, 20 May 2020 12:55:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2085.outbound.protection.outlook.com [40.107.237.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B5248975F
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 12:55:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KSFitqEtYgdB58dj/BQrtT2A3xrNa/gr7a6KgewrBZ6DOLdjyUhsHhYZWsEiHgmclo4hK/resQB0jvn0mvA6JcjFFzQL+UkIjju1xg5JGa/IIKDWJTd480L+1raneX6BchbSqAWgC6zuiXx/3jG5CHmcZZM+/ga1zCyiFU+SonM89fyIHv3Kpc96nY38LPpZRjZQEGHuR0p8ndYqNTInZlcAa8CyjrRsg6c7bVTPOXfOfsevHjhUMK3Ky9JElla/4i1oKd1UYZfRwtQ5/32l2LvO97pKG/0YgE2R/Nz4lGBODVKl8ZF6TpH7DPyQwRKjgQ/DtnzRX8MbwWzXfQhfPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OkTeTJdMbMEgEIjxgd2Mjh809Whe/eHrWSiZXwGJTaA=;
 b=CvKdL0Kj3n7NN+Sfo46w8/XpInqeyyLVNA9nt7NJZVLkGVLNpPlmwJYFHxvMz0y3m0p0LQAQG37mFDTJpBFUtf5f4ORYjd2vdqn+9srrfhFmO/NW+h+UolzMxk7kUKLZk+RMtv3UOHOpFCLkL78MDXOCV260A/bQBfELl5WXazbRYnNf80768AOMX8atDny5jE5f4n3i8SFLpgtF7ZlfAaydVA5FpBO4/lgdWeUzz2U5KrGO3msMRzpQuiubDNI+3FzOIKEsk2g5R/e9CIdOqoFCJY+UPA1KjRmjLOQmlfq/ibpj1wGbRdTmDrB2u0CdcnqqtiELlzzpTbu1DlzfAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OkTeTJdMbMEgEIjxgd2Mjh809Whe/eHrWSiZXwGJTaA=;
 b=oRZzMxQYV3mlvWCZ55516q+mEwLZGE39Pef0/HW0sluB+hqh2mAU8tdeAAagVFwqEfFJJl5AI7yWLlgV/sPMww61XBl422X9zwyvtckGUm2pPMvc69CnEAvfBOBR9JE7O98qsujJTeR6IEi4AtCe0/7BOlnuobbChDgrcNzYqfk=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB3067.namprd12.prod.outlook.com (2603:10b6:5:115::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.26; Wed, 20 May
 2020 12:55:00 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766%3]) with mapi id 15.20.3021.020; Wed, 20 May 2020
 12:55:00 +0000
Subject: Re: [PATCH 1/1] drm: check for NULL pointer in drm_gem_object_put
To: Chris Wilson <chris@chris-wilson.co.uk>,
 Nirmoy Das <nirmoy.aiemd@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200520121450.79340-1-nirmoy.das@amd.com>
 <96a01388-7d91-56b5-4cd4-16052aba7a60@amd.com>
 <158997895740.8153.16875812670855148581@build.alporthouse.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <b2284cd6-56cb-847a-1b6f-e4825c4ec1d3@amd.com>
Date: Wed, 20 May 2020 14:54:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <158997895740.8153.16875812670855148581@build.alporthouse.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR10CA0045.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::25) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR10CA0045.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.24 via Frontend
 Transport; Wed, 20 May 2020 12:54:59 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cca4bb78-d62e-49bb-5288-08d7fcbd019c
X-MS-TrafficTypeDiagnostic: DM6PR12MB3067:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3067004604F00CBD82CB33B183B60@DM6PR12MB3067.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 04097B7F7F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XeK2QB8wI2MltF7W455+aH5eBTH29BKU1HP7HlGYcFfFpfDD5UvEEUERZNUsxHFd8K/4Cr2O8BxEprjUTxovuahtPXe0I2A6l/o2ndPRmioOXswcy+HUa8F3x2AYYFSTjJ55cS/qngIKzF/WKhGHIYTvCD1QDSUjaboL1TdGwj78nZoAlAGJsoG06Yiysc5MXeTleIQbQgihLOAKN6y97AirR6mejAtWRy5NE/y13TldNS0SdhMGKBjgscoUEyMQoA3gTfh/dRuv5dXIK/fR/i4Yz5Cw7cPzt+S/i8qHU/+EHQ9iPVkegH1Kxfn1129T/dJVP+MmYAWhPGLJtl7QW3cxX/MAjtWAvUz8ZnFvaAYnppfvu4UYTyfVrCm7LwWQID7OqzehvFS37G9xoWNfv4Ayk/LnIfyFyNK3wzdRZuBj8ZArso+wpt0sfZYvygOS+sakm/u9vf3f/RqxxSyOchmGKfHPINih+P6lK7e07l3zAotGiFn9YKziXbg8W4Gy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(376002)(366004)(39860400002)(396003)(136003)(2906002)(2616005)(16526019)(186003)(316002)(36756003)(54906003)(31686004)(110136005)(6666004)(6486002)(66574014)(4326008)(5660300002)(31696002)(8936002)(478600001)(66476007)(66556008)(66946007)(52116002)(8676002)(86362001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: EBCcF3PU0+aqaeZQRcrvSSXfbHwS+WjqEvUsRkZfc19trA7whSNx9KMg1VIHUaQxXgStOuJ1CU9oVStO0LlmSsMAFS/sVX+bjGhhretDnyNbXY5MgzxoVN2kHNuwUkLjKmgT1Vv9vD4z1K3hX1guUDs2PHvwfz/xekAC5IqGevcf4QqoME8dAnxkasRs260xuTLxnjpi5bjKZiBo23ac9d5SfLBrnLrxTympR1HxECC+/DACbH3TyocRQ0wsf4bTjK7goa12op7uN/ZZscZxGWar4b1wv4WtvnUwuaxbqWl/t+IJz9SOUlFT+DIokxgQ3c16Kq476NKIe0KTD8QcTLUxI5B7eXfW/VMVx4xip8kSn+F9NT9B0+/HHC67pRcGwCFB3vRwO2TXTjF3S981znRfeR5Gkhm664SGjZiLb9yv0zwwQhfmVLbkF/UO3EVauKaqyJJvq9Ju+cIXUaQzyCYiLZih2GkOzqOREYxNrzHgPyI8oEM5gqCTriJ9rj5rqkkAuInY4K2xE3EaN3lsOpxt+N8pLeg32uz72vHFY6+fF70O+xcTtAsHFxK4HRx9
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cca4bb78-d62e-49bb-5288-08d7fcbd019c
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2020 12:55:00.3370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UBINgBd+KwoNkcXe1CWwILbqe0zNZbSMha6wQ9/Q/nfYqI6pCsDfVPbo2Ng9EDIw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3067
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
Cc: Nirmoy Das <nirmoy.das@amd.com>, Emil Velikov <emil.l.velikov@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjAuMDUuMjAgdW0gMTQ6NDkgc2NocmllYiBDaHJpcyBXaWxzb246Cj4gUXVvdGluZyBDaHJp
c3RpYW4gS8O2bmlnICgyMDIwLTA1LTIwIDEzOjE5OjQyKQo+PiBBbSAyMC4wNS4yMCB1bSAxNDox
NCBzY2hyaWViIE5pcm1veSBEYXM6Cj4+PiBkcm1fZ2VtX2ZiX2Rlc3Ryb3koKSBjYWxscyBkcm1f
Z2VtX29iamVjdF9wdXQoKSB3aXRoIE5VTEwgb2JqIGNhdXNpbmc6Cj4+PiBbICAgMTEuNTg0MjA5
XSBCVUc6IGtlcm5lbCBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UsIGFkZHJlc3M6IDAwMDAwMDAw
MDAwMDAwMDAKPj4+IFsgICAxMS41ODQyMTNdICNQRjogc3VwZXJ2aXNvciB3cml0ZSBhY2Nlc3Mg
aW4ga2VybmVsIG1vZGUKPj4+IFsgICAxMS41ODQyMTVdICNQRjogZXJyb3JfY29kZSgweDAwMDIp
IC0gbm90LXByZXNlbnQgcGFnZQo+Pj4gWyAgIDExLjU4NDIxNl0gUEdEIDAgUDREIDAKPj4+IFsg
ICAxMS41ODQyMjBdIE9vcHM6IDAwMDIgWyMxXSBTTVAgTk9QVEkKPj4+IFsgICAxMS41ODQyMjNd
IENQVTogNyBQSUQ6IDE1NzEgQ29tbTogZ25vbWUtc2hlbGwgVGFpbnRlZDogRyAgICAgICAgICAg
IEUgICAgIDUuNy4wLXJjMS0xLWRlZmF1bHQrICMyNwo+Pj4gWyAgIDExLjU4NDIyNV0gSGFyZHdh
cmUgbmFtZTogTWljcm8tU3RhciBJbnRlcm5hdGlvbmFsIENvLiwgTHRkLiBNUy03QTMxL1gzNzAg
WFBPV0VSIEdBTUlORyBUSVRBTklVTSAoTVMtN0EzMSksIEJJT1MgMS5NUiAxMi8wMy8yMDE5Cj4+
PiBbICAgMTEuNTg0MjM3XSBSSVA6IDAwMTA6ZHJtX2dlbV9mYl9kZXN0cm95KzB4MjgvMHg3MCBb
ZHJtX2ttc19oZWxwZXJdCj4+PiA8c25pcD4KPj4+IFsgICAxMS41ODQyNTZdIENhbGwgVHJhY2U6
Cj4+PiBbICAgMTEuNTg0Mjc5XSAgZHJtX21vZGVfcm1mYisweDE4OS8weDFjMCBbZHJtXQo+Pj4g
WyAgIDExLjU4NDI5OV0gID8gZHJtX21vZGVfcm1mYisweDFjMC8weDFjMCBbZHJtXQo+Pj4gWyAg
IDExLjU4NDMxNF0gIGRybV9pb2N0bF9rZXJuZWwrMHhhYS8weGYwIFtkcm1dCj4+PiBbICAgMTEu
NTg0MzI5XSAgZHJtX2lvY3RsKzB4MWZmLzB4M2IwIFtkcm1dCj4+PiBbICAgMTEuNTg0MzQ3XSAg
PyBkcm1fbW9kZV9ybWZiKzB4MWMwLzB4MWMwIFtkcm1dCj4+PiBbICAgMTEuNTg0NDIxXSAgYW1k
Z3B1X2RybV9pb2N0bCsweDQ5LzB4ODAgW2FtZGdwdV0KPj4+IFsgICAxMS41ODQ0MjddICBrc3lz
X2lvY3RsKzB4ODcvMHhjMAo+Pj4gWyAgIDExLjU4NDQzMF0gIF9feDY0X3N5c19pb2N0bCsweDE2
LzB4MjAKPj4+IFsgICAxMS41ODQ0MzRdICBkb19zeXNjYWxsXzY0KzB4NWYvMHgyNDAKPj4+IFsg
ICAxMS41ODQ0MzhdICBlbnRyeV9TWVNDQUxMXzY0X2FmdGVyX2h3ZnJhbWUrMHg0NC8weGE5Cj4+
PiBbICAgMTEuNTg0NDQwXSBSSVA6IDAwMzM6MHg3ZjBlZjgwZjcyMjcKPj4+Cj4+PiBTaWduZWQt
b2ZmLWJ5OiBOaXJtb3kgRGFzIDxuaXJtb3kuZGFzQGFtZC5jb20+Cj4+IEZpeGVzOiAuLi4uIG1p
c3NpbmcgaGVyZS4gQXBhcnQgZnJvbSB0aGF0IFJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmln
Cj4+IDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Lgo+Pgo+PiBQbGVhc2UgcmVzZW5kIHdpdGgg
dGhlIHRhZyBhZGRlZCwgdGhlbiBJJ20gZ29pbmcgdG8gcHVzaCB0aGlzIHRvCj4+IGRybS1taXNj
LW5leHQgYXNhcC4KPj4KPj4gQ2hyaXN0aWFuLgo+Pgo+Pj4gLS0tCj4+PiAgICBpbmNsdWRlL2Ry
bS9kcm1fZ2VtLmggfCAzICsrKwo+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZ2VtLmggYi9pbmNsdWRlL2Ry
bS9kcm1fZ2VtLmgKPj4+IGluZGV4IDUyMTczYWJkZjUwMC4uYTEzNTEwMzQ2YTliIDEwMDY0NAo+
Pj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2dlbS5oCj4+PiArKysgYi9pbmNsdWRlL2RybS9kcm1f
Z2VtLmgKPj4+IEBAIC0zNzIsNiArMzcyLDkgQEAgc3RhdGljIGlubGluZSB2b2lkIGRybV9nZW1f
b2JqZWN0X2dldChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaikKPj4+ICAgIHN0YXRpYyBpbmxp
bmUgdm9pZAo+Pj4gICAgZHJtX2dlbV9vYmplY3RfcHV0KHN0cnVjdCBkcm1fZ2VtX29iamVjdCAq
b2JqKQo+Pj4gICAgewo+Pj4gKyAgICAgaWYgKCFvYmopCj4+PiArICAgICAgICAgICAgIHJldHVy
bjsKPj4+ICsKPiBUaGlzIGFkZHMgc2V2ZXJhbCB0aG91c2FuZCBOVUxMIGNoZWNrcyB3aGVyZSB0
aGVyZSB3ZXJlIHByZXZpb3VzbHkgbm9uZS4KPiBJIGRvdWJ0IHRoZSBjb21waWxlciBlbGltaW5h
dGVzIHRoZW0gYWxsLgo+Cj4gSSdkIHN1Z2dlc3QgcmV2ZXJ0aW5nCj4gYjVkMjUwNzQ0Y2NjICgi
ZHJtL2dlbTogZm9sZCBkcm1fZ2VtX29iamVjdF9wdXRfdW5sb2NrZWQgYW5kIF9fZHJtX2dlbV9v
YmplY3RfcHV0KCkiKQoKSSBkaWRuJ3QgbG9va2VkIGludG8gdGhpcyBwYXRjaCBpbiBkZXRhaWws
IGJ1dCBhbGxvd2luZyB0byBjYWxsICpfcHV0KCkgCmZ1bmN0aW9ucyB3aXRoIE5VTEwgYW5kIG5v
dGhpbmcgYmFkIGhhcHBlbnMgaXMgcmF0aGVyIGNvbW1vbiBwcmFjdGljZS4KCk9uIHRoZSBvdGhl
ciBoYW5kIEkgYWdyZWUgdGhhdCB0aGlzIG1pZ2h0IGNhdXNlIGEgcGVyZm9ybWFuY2UgcHJvYmxl
bS4gCkhvdyBtYW55IHNpdGVzIGRvIHdlIGhhdmUgd2hpY2ggY291bGQgY2FsbCBkcm1fZ2VtX29i
amVjdF9wdXQoKSB3aXRoIE5VTEw/CgpDaHJpc3RpYW4uCgo+IC1DaHJpcwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
