Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4FC26D50D
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 09:48:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22BEF6EADF;
	Thu, 17 Sep 2020 07:48:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2071.outbound.protection.outlook.com [40.107.220.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3DC36EADD
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 07:48:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GNoW7SekG3OYizi6VbVCL1cKeuM004lhyqiGbWtRJE3vmT3eB3aUJLRhPMUEzbbmTAAdFMocPzcRWbIcumdD+2t0jayLwTsYisns20D7dfmxf5dgme1vUD6Ru4ZHDK1ZzesECcAwT7Q12yaSkkDKlCC86WF6hxd/OIS7pjGvFMpikbIcFG/WWeYx6xNrifFQsug0Qej4pZ4j4VnAopnTxiDTnZozvWCZijKefH5rZ0U3BBUKO5qLuHNNLwSFWrv4AxPt4Ng8bl3Fza46jSArFPpuJR5q+FY1g6iHxl/xX4Ro/Asfnk/kMRB1z4AbC/F1n3ilC3v2w2c9He3lWAdadw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n93pF3KjmYJ5bndigGKU3104TSRz+62ZP2assKi/Gbg=;
 b=SYNNOyawUGQ4k69fQqzM8fGG8u5UgsUGta6rdRgRyslJhy10LHnVpDfyFCci+z0DzU0QKjXj3k3TPCSGVmTiPA9brC5L8C8ufW+SXbmdOXanvuXYsVMq5J8JUyD6PzqA+WUokTS4eBoaG1eFfA5qk85p/NaPhUszrQSglnjJM0zM7bRosl6rofcRzTpv3D3/lUoLAm94zBugs4KsRHn4MSgKd3QMduNnQ1FcO2SAFzcMe/CyN15gAf25gcpzf1GbyHI3dTkOydFccL32C/P5Isw5ubR8yIluRY3p6yRYc2nqdCA63cv16fugmcoIYCTEoJQyaiyPBslzlCMrU7YPVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n93pF3KjmYJ5bndigGKU3104TSRz+62ZP2assKi/Gbg=;
 b=YE7bCKY7GEHm93FRpKyDePDuiPtwAPvxQR5CtED8HHuaxfIucMdopatmiAZ8iaIL9E9/p9W9HOmu0hhrmLkMMnOS4tfqRaEjtwcv5xWQN5IO9tUmmtDB7SptTZL8/u3lbNQXczpuv7rSdfu5PpEpDQuxBMn2sa5FR/5rvkBE0+Q=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4518.namprd12.prod.outlook.com (2603:10b6:208:266::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Thu, 17 Sep
 2020 07:48:09 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3391.014; Thu, 17 Sep 2020
 07:48:09 +0000
Subject: Re: [PATCH 3/7] drm/ttm: move unbind into the tt destroy.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200917043040.146575-1-airlied@gmail.com>
 <20200917043040.146575-4-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <bf32a07e-4823-9a18-2808-334c892dd8ab@amd.com>
Date: Thu, 17 Sep 2020 09:48:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200917043040.146575-4-airlied@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM4PR0701CA0005.eurprd07.prod.outlook.com
 (2603:10a6:200:42::15) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0701CA0005.eurprd07.prod.outlook.com (2603:10a6:200:42::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.4 via Frontend
 Transport; Thu, 17 Sep 2020 07:48:08 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9c5dcbd1-cae5-49e5-12ef-08d85ade04f9
X-MS-TrafficTypeDiagnostic: MN2PR12MB4518:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4518A12FECF724BF07D0C7B2833E0@MN2PR12MB4518.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3Ipp3OGfxcRCpyupCoDbGZg3sAOyu+89KpnJXB1bayV1yivWnu0x8Y0we7+dkSqyjd9f5BCc8x2DXupW2jBpclVyL3q9uPsOL6WrEICjO+i2wGa8s04A1Rh2Lmyz9oqAF3mkWIAAuOcx7bDGdCumY5AFHBcOe+DnudcTemuwcNvPIDZ02zxVv+Tmd+BO99TEDVb4xpfPwxCbPsN0xJ0McnslDZtPi87ptpHIK2IHxvZV0dchbrjxsdlXymwTqve9S8y7gvW79XSniFAEYc3hqqa90b9cGBJyRQcLt4Iz9U/brcmdRL8ExtyBzFbG/L3U48Wyb5RzUKQIBcKvCjt1gADSwIgSKKHpdX2YMWVawwAu+avr4ae/b8MKdgCeEAKy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(346002)(376002)(366004)(136003)(6666004)(8936002)(86362001)(16526019)(316002)(8676002)(31696002)(186003)(52116002)(83380400001)(2906002)(36756003)(5660300002)(66946007)(66574015)(6486002)(66556008)(31686004)(478600001)(2616005)(66476007)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: vX1s/5lj9ktpbdxG0OwZUFMBZmM/cx1alU8H50h1iMq8TtAR09cQzcYS3ekJpG8Tbzi4I8AwAxxEGfXhPB1le5Bo3c79G0EHGni2tP4+RunqiC/32nWOZFOin5pIfQ+4EPpO39O2PDP0/MNIAhOb/Uxdjp1wtC/KSkbDRN06HTg2lenzJMa1km/OF011jSYKXF/M4V35qFmYthgOuugzqwNlMsnSZi/8rLOfKFriLVeoTOR1/7vUdxbM2574Y3G9YNRL8yRLJCs+h50qS46RO6XStyDPqRl3UA/5zkeAA6HUiQ/vWAd+g4dTjF+HSFJ24s+nIJWb/NxW9E2uBLfM4nP4VX9bwBHL6HeUX0NM2q9fd0f13xAmLC64tVFhIRYZI5ZQI5QK0mLlUCXkc1vtVl34ETXduQDeHPrRvsIQY9OEckRboTGtu0F3L0DOol5qKg4Wh9cyBO9s8A7iwMKCEx866ZpNwMHv2LvXPPF3T4H740WjaBHelECTi4j1GjQNRuclMY96yEUKjDrZSGDEaYDJzzxtDso7HcEbeh+pkxYFs/CZxmVIJyMw2gSfDjqW1bQzKVoYPt7Hzh0ybBxkQc2pdp2Q9rS0rAbKrZ47X77oFRfKBVAMV2dILsMXSlW4H/NEDiybbk/OLZbTiH+68cNWuws8DUeR/E+/rR5kQnX5YwvQwwJDax6EQc7qI2Q3D9dfwV/hbsIJEdt5n4sDJw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c5dcbd1-cae5-49e5-12ef-08d85ade04f9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2020 07:48:08.8745 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 19STh+EoZyf1PvvpmrZCE/KZP5sax/RayCrz4bmgLLE19e/Pre6rHohHk4N9hbTr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4518
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

QW0gMTcuMDkuMjAgdW0gMDY6MzAgc2NocmllYiBEYXZlIEFpcmxpZToKPiBGcm9tOiBEYXZlIEFp
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gVGhpcyBtb3ZlcyB1bmJpbmQgaW50byB0aGUg
ZHJpdmVyIHNpZGUgb24gZGVzdHJveSBwYXRocy4KPgo+IFNpZ25lZC1vZmYtYnk6IERhdmUgQWly
bGllIDxhaXJsaWVkQHJlZGhhdC5jb20+CgpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8
Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV90dG0uYyAgICB8IDEgKwo+ICAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
bm91dmVhdV9iby5jICAgICAgIHwgMSArCj4gICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2
ZWF1X3NnZG1hLmMgICAgfCAxICsKPiAgIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3R0
bS5jICAgICAgICB8IDIgKysKPiAgIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgICAgICAg
ICAgICAgICB8IDEgLQo+ICAgZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfdHRtX2J1ZmZl
ci5jIHwgMSArCj4gICA2IGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90
dG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwo+IGluZGV4IGRi
ZTNmOTBhMGNmNi4uMjAyOGI5ZTRjMjVjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV90dG0uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV90dG0uYwo+IEBAIC0xMjY3LDYgKzEyNjcsNyBAQCBzdGF0aWMgdm9pZCBhbWRncHVf
dHRtX2JhY2tlbmRfZGVzdHJveShzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwKPiAgIHsKPiAg
IAlzdHJ1Y3QgYW1kZ3B1X3R0bV90dCAqZ3R0ID0gKHZvaWQgKil0dG07Cj4gICAKPiArCWFtZGdw
dV90dG1fYmFja2VuZF91bmJpbmQoYmRldiwgdHRtKTsKPiAgIAl0dG1fdHRfZGVzdHJveV9jb21t
b24oYmRldiwgdHRtKTsKPiAgIAlpZiAoZ3R0LT51c2VydGFzaykKPiAgIAkJcHV0X3Rhc2tfc3Ry
dWN0KGd0dC0+dXNlcnRhc2spOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9ub3V2ZWF1X2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKPiBp
bmRleCBiMjM5MzgxNDk4YzMuLjRhMDIwYTNkYTNkZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9ub3V2ZWF1X2JvLmMKPiBAQCAtMTM3Miw2ICsxMzcyLDcgQEAgbm91dmVhdV90dG1fdHRfZGVz
dHJveShzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwKPiAgICNpZiBJU19FTkFCTEVEKENPTkZJ
R19BR1ApCj4gICAJc3RydWN0IG5vdXZlYXVfZHJtICpkcm0gPSBub3V2ZWF1X2JkZXYoYmRldik7
Cj4gICAJaWYgKGRybS0+YWdwLmJyaWRnZSkgewo+ICsJCXR0bV9hZ3BfdW5iaW5kKHR0bSk7Cj4g
ICAJCXR0bV90dF9kZXN0cm95X2NvbW1vbihiZGV2LCB0dG0pOwo+ICAgCQl0dG1fYWdwX2Rlc3Ry
b3kodHRtKTsKPiAgIAkJcmV0dXJuOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91
dmVhdS9ub3V2ZWF1X3NnZG1hLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3Nn
ZG1hLmMKPiBpbmRleCAwZGZhYTZmYjUzNmUuLjgwNmQ5ZWMzMTBmNSAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3NnZG1hLmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9ub3V2ZWF1X3NnZG1hLmMKPiBAQCAtMjAsNiArMjAsNyBAQCBub3V2ZWF1
X3NnZG1hX2Rlc3Ryb3koc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsIHN0cnVjdCB0dG1fdHQg
KnR0bSkKPiAgIAlzdHJ1Y3Qgbm91dmVhdV9zZ2RtYV9iZSAqbnZiZSA9IChzdHJ1Y3Qgbm91dmVh
dV9zZ2RtYV9iZSAqKXR0bTsKPiAgIAo+ICAgCWlmICh0dG0pIHsKPiArCQlub3V2ZWF1X3NnZG1h
X3VuYmluZChiZGV2LCB0dG0pOwo+ICAgCQl0dG1fdHRfZGVzdHJveV9jb21tb24oYmRldiwgdHRt
KTsKPiAgIAkJdHRtX2RtYV90dF9maW5pKCZudmJlLT50dG0pOwo+ICAgCQlrZnJlZShudmJlKTsK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMgYi9kcml2
ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYwo+IGluZGV4IDc2ZTI0YzYwNThmZi4uMDNl
NWFlNGUzYmY2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3R0
bS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMKPiBAQCAtNTc2
LDYgKzU3Niw3IEBAIHN0YXRpYyB2b2lkIHJhZGVvbl90dG1fYmFja2VuZF9kZXN0cm95KHN0cnVj
dCB0dG1fYm9fZGV2aWNlICpiZGV2LCBzdHJ1Y3QgdHRtX3R0Cj4gICB7Cj4gICAJc3RydWN0IHJh
ZGVvbl90dG1fdHQgKmd0dCA9ICh2b2lkICopdHRtOwo+ICAgCj4gKwlyYWRlb25fdHRtX2JhY2tl
bmRfdW5iaW5kKGJkZXYsIHR0bSk7Cj4gICAJdHRtX3R0X2Rlc3Ryb3lfY29tbW9uKGJkZXYsIHR0
bSk7Cj4gICAKPiAgIAl0dG1fZG1hX3R0X2ZpbmkoJmd0dC0+dHRtKTsKPiBAQCAtNzU3LDYgKzc1
OCw3IEBAIHN0YXRpYyB2b2lkIHJhZGVvbl90dG1fdHRfZGVzdHJveShzdHJ1Y3QgdHRtX2JvX2Rl
dmljZSAqYmRldiwKPiAgIAlzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldiA9IHJhZGVvbl9nZXRf
cmRldihiZGV2KTsKPiAgIAo+ICAgCWlmIChyZGV2LT5mbGFncyAmIFJBREVPTl9JU19BR1ApIHsK
PiArCQl0dG1fYWdwX3VuYmluZCh0dG0pOwo+ICAgCQl0dG1fdHRfZGVzdHJveV9jb21tb24oYmRl
diwgdHRtKTsKPiAgIAkJdHRtX2FncF9kZXN0cm95KHR0bSk7Cj4gICAJCXJldHVybjsKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyBiL2RyaXZlcnMvZ3B1L2RybS90
dG0vdHRtX2JvLmMKPiBpbmRleCA2NDlhN2QwYTA3NjYuLjJjNTI3Y2QyMGRmYSAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3R0bS90dG1fYm8uYwo+IEBAIC0xNjIwLDcgKzE2MjAsNiBAQCB2b2lkIHR0bV9ib190dF9kZXN0
cm95KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8pCj4gICAJaWYgKGJvLT50dG0gPT0gTlVM
TCkKPiAgIAkJcmV0dXJuOwo+ICAgCj4gLQl0dG1fYm9fdHRfdW5iaW5kKGJvKTsKPiAgIAl0dG1f
dHRfZGVzdHJveShiby0+YmRldiwgYm8tPnR0bSk7Cj4gICAJYm8tPnR0bSA9IE5VTEw7Cj4gICB9
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3R0bV9idWZmZXIu
YyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3R0bV9idWZmZXIuYwo+IGluZGV4IGQ0
NjQyNjE2NDU3Ny4uNzQ1NGY3OTdkMzdiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92
bXdnZngvdm13Z2Z4X3R0bV9idWZmZXIuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngv
dm13Z2Z4X3R0bV9idWZmZXIuYwo+IEBAIC02MzYsNiArNjM2LDcgQEAgc3RhdGljIHZvaWQgdm13
X3R0bV9kZXN0cm95KHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LCBzdHJ1Y3QgdHRtX3R0ICp0
dG0pCj4gICAJc3RydWN0IHZtd190dG1fdHQgKnZtd19iZSA9Cj4gICAJCWNvbnRhaW5lcl9vZih0
dG0sIHN0cnVjdCB2bXdfdHRtX3R0LCBkbWFfdHRtLnR0bSk7Cj4gICAKPiArCXZtd190dG1fdW5i
aW5kKGJkZXYsIHR0bSk7Cj4gICAJdHRtX3R0X2Rlc3Ryb3lfY29tbW9uKGJkZXYsIHR0bSk7Cj4g
ICAJdm13X3R0bV91bm1hcF9kbWEodm13X2JlKTsKPiAgIAlpZiAodm13X2JlLT5kZXZfcHJpdi0+
bWFwX21vZGUgPT0gdm13X2RtYV9hbGxvY19jb2hlcmVudCkKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
