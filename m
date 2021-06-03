Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4771939A570
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 18:10:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36C7F6E1CE;
	Thu,  3 Jun 2021 16:10:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46B8E6E1CE;
 Thu,  3 Jun 2021 16:10:00 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 153Fx6h0191502;
 Thu, 3 Jun 2021 16:09:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=corp-2020-01-29;
 bh=NxXgDMs+kTpR6ygD/tA+fXr7QsXk6B7xBB8fE24SViM=;
 b=E2Pyj6X0sEBPtj1vFwEUtKpzVgHwBne56FwVxuOuysw87jldFhYrwm44FpfO3r40pSPc
 PtcW6cVuYZSsV9TMP3xbvQTeEUnLR36oaU3f5O5OV+ac2Lx8g0VN0UQg3B9LHruHUCsd
 WeH4WluiWyTg8AIbekiD/DkmWXj9T/w9rv3mWB6bG8PKKzETkin5iP9Xfa+i0hdTHBAr
 s1FuPwwY9rUNv6kSdDCcE0yicB4wmKFCcsSHn2LlCiCo1Bgbj0DZ88oVDrywn/9/aV+7
 TUq6fwJ2xtv/m4Y1AjmEVfY79rpiZFNrW6NJWYCYABZkmcz0MYH1EgRdTCq2TQ6JE0vr NA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 38ub4cuvme-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 03 Jun 2021 16:09:50 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 153G65A8011554;
 Thu, 3 Jun 2021 16:09:50 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
 by userp3030.oracle.com with ESMTP id 38uaqyem0c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 03 Jun 2021 16:09:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y7v+dDls7Te9Qo7KTLmD8xyPYjaBV2Dc2w0p6J3JpjrD0hCpPdcgPMngV5X5qFqnMCy3+cJk/2GYiVNOuj9AGAvjaLnEPdJIUpEgMDbXNwyRdFv8GW3xpN5sfjOqS9+opJ10Wn/Pb4317owH9i2W5n1p93NaMfZc4j69B8bZ3B2/9LzT/mvc4BtIboxlvjmU2Jg7+h5560ZUvR0Ipesnl0EEq9FTMIOXIdzwRznGqAwLVM/ZqKbYHwaMvU/rMsfdyV9LiyqOsfLZJOhQCDkJU4UZDjxipAFBHfYyBfQUhMwZisdTp/WhGqX5BzKiaOjKSRXZodE0hLfeYWcwRGMiOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NxXgDMs+kTpR6ygD/tA+fXr7QsXk6B7xBB8fE24SViM=;
 b=JQLju6Zq2x/jnyT6D0DExjyzTaVAjWumsjYVdWwYpWtUoHjksmkzCrke/xnvRt6oYEQuCFok9cBc++6trb6vut3p14Wxz1hAh/9q3THjKYuNiLl+yrqLQV3n6VKwufPay+eogA7rw/sWNU+ddUMZw7kTMMtSvx2/GvvEAvLvS7bvl7h4Z/GT2jFpuvsug1p0WALHPq1wtd03dgCVygaFWrVty7G/Adtbbx3O1b0VGUf6UGr8kLHpawljFKKC7tsLhOiF8ViE1N3p/i76ibwpm4XCJKBXoSqylqiq5aZqRzbtCDw1WwA0NHhGMsw1rlJElrJbJHjLwf3ESUIFx/L3Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NxXgDMs+kTpR6ygD/tA+fXr7QsXk6B7xBB8fE24SViM=;
 b=evdD4OLwaTqdovpa2lDpreOsPD6hD5ZTZqjWuA2gh+2YLEtJJU/FqR3CfHdjlYMMvF067Zdxmn7t47gzWzOiPDMH+qvZDVgd0PYACTET0O+oMsf6HS6FSnwu6bn8n2m/B7jBltqsW9jSMu3J8mQbk/8MmHHfnkH38JO35Ltmy8o=
Received: from DM6PR10MB4380.namprd10.prod.outlook.com (2603:10b6:5:223::19)
 by DM6PR10MB2698.namprd10.prod.outlook.com (2603:10b6:5:b9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.29; Thu, 3 Jun
 2021 16:09:47 +0000
Received: from DM6PR10MB4380.namprd10.prod.outlook.com
 ([fe80::b8b4:5900:668b:c9c2]) by DM6PR10MB4380.namprd10.prod.outlook.com
 ([fe80::b8b4:5900:668b:c9c2%5]) with mapi id 15.20.4195.024; Thu, 3 Jun 2021
 16:09:47 +0000
From: Liam Howlett <liam.howlett@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>, "linux-mm@kvack.org"
 <linux-mm@kvack.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Use vma_lookup() in amdgpu_ttm_tt_get_user_pages()
Thread-Topic: [PATCH] drm/amdgpu: Use vma_lookup() in
 amdgpu_ttm_tt_get_user_pages()
Thread-Index: AQHXWJLf9LBXqSSmAk626hIUEgtUSQ==
Date: Thu, 3 Jun 2021 16:09:46 +0000
Message-ID: <20210603160928.3854180-1-Liam.Howlett@Oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.30.2
authentication-results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=oracle.com;
x-originating-ip: [23.233.25.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ee600703-100a-4d5e-cf9b-08d926aa0212
x-ms-traffictypediagnostic: DM6PR10MB2698:
x-microsoft-antispam-prvs: <DM6PR10MB269891319BFDF5125E8FDE6EFD3C9@DM6PR10MB2698.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RVrCi9oAeNHqQC2WjGJjoMfg1dBMfjVFnC+VjTzn/gwF4lIM/f5iunI3g/NDVsWlXBCEThXBBQN4h4jDFhxwpNFJ51KbPgK/IyU3SXv/GoufZFIOvLBPxUpdXxzaH1PCmii0XGwr/33qII5nvSxHHpurZNL1Qp6ZiEBBphZaTpzRgrdU13Fs1MSX4/ekNj2nCm4XRkUGUPiJjNl/BGM17JfFU+Dn5jDms9vj+C9XkVFXJStaWyHrUNRHGg23/9JUL3hQq66gcy4agj1VgkwRN30cYwd2AsCNitUQiUDMjADgFHOiM93OxEzOLGKQ++Kts49sflNT2BlDj7z6SmomJlVyrRYzF9aTWKuFLl36lfUbm52/VOA6jcL0dHYM7by5deMsKdz2QvTEehvWg0ri6rGh3YwBXzEBoOINpFrIycSSb/lDkWmgzuR5DQvwMiX1x9ZsCdQ+BZG1aUlle7W6jDlkhkutHZTQKukA+jxJt4fOsJecdHEfXSF4s1UgHs27/C9O/AYHBPsuyJZ2gQVC4Y4VYX6dzKnfYvdLWLvuW5r2eucbG3qo6PZuUaAAAU6t9NBkXek+/5oF/VaXDXZQR4gokjt//SuoB5zV5IwtmkM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB4380.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(366004)(136003)(396003)(376002)(346002)(2616005)(2906002)(71200400001)(6486002)(44832011)(478600001)(6506007)(316002)(4744005)(186003)(26005)(5660300002)(38100700002)(76116006)(122000001)(8936002)(110136005)(66946007)(66556008)(1076003)(66446008)(64756008)(66476007)(91956017)(8676002)(4326008)(83380400001)(54906003)(6512007)(36756003)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?16jtmFU4dyJPhZx4URK59JEZ4mgMZ1WxTrCaeLIwdspwma+jhvCTFjO3HS?=
 =?iso-8859-1?Q?fvsPEOG8fP6qGFIgeW57xC7tHkZupnga14RcnZglwPLEEKwO7J5841dwk8?=
 =?iso-8859-1?Q?PDs12woWz3v2cNK7WkCpw/YSIgOpwzqDzF/kpEwTp13TLCYWKUpljm/Bxi?=
 =?iso-8859-1?Q?aVN8iz1y4+aaFgCKaTz1AjTsZT3YEFxX2+T5hUmow7hWIb3g5rspuPw4wE?=
 =?iso-8859-1?Q?f97dgvLqqPEFfnE48fWIrLgqw9gDYVBtc2BrxPRVspzg842CD2N9pDouhG?=
 =?iso-8859-1?Q?W484f9N1ptlDcUWX4xTLIdul1i2FecuQYAylPuhmHjDBRZkK5F1gPENFSv?=
 =?iso-8859-1?Q?BD6t8qoWx5nGDrgSm3tZqiochHDNy+9j65LzreV5rp0z3ryh3dDS16qvYl?=
 =?iso-8859-1?Q?fv7FEzPg5DjOlmYRCgpg31DqdG6wmLSPoqtd8x3e4ALRZ8viwi6ek76P9h?=
 =?iso-8859-1?Q?t9ovFGaZS2le2ZGYs+RXQ0uEcW5FhDUmf/Pc+bxtLWDSgrY4LJqeXtF7xP?=
 =?iso-8859-1?Q?JdRSNbp5CeqkfZN4n10ivM2OTx6R+Xx++9ZpSuvgu2GMra1cBC2kC9/IzX?=
 =?iso-8859-1?Q?Rg/IR3IanZm5XRbjBf22vtXnbj86Mur+2KWcxk94OcQTGHO2OHgUrc8p8E?=
 =?iso-8859-1?Q?y886CUg9veAyU8qMbAkz86/mSN9J5x3a74aSKMlTgNf0skDgWrxvIy5v5Y?=
 =?iso-8859-1?Q?4qtmScfsJk7kDa+MrBfAu0cRrwMCwgJ4UbjJDDAOjZPd3SI1d26SZDuWF6?=
 =?iso-8859-1?Q?C19tlRHpTN2vGIuOrXYOJveg7LopxdJZG95jkmErHwghQES3YbfRBvajsf?=
 =?iso-8859-1?Q?co9vfGF8tJJAFWyP26oc7+44XYzfVOgg5i92N6aEfnqmis6xwTfaIg4vw/?=
 =?iso-8859-1?Q?PFNVIqiVF4DrZP+RkbC9IfDj8FNuk1HwQa8CN8QeHetx+MkuN+aJbJi/Aj?=
 =?iso-8859-1?Q?8wrtRTGgB8e9vUn5f1zX4XxRcBfrp3ZPtZ5QXaw/ELDHUD/ZUf1i6j9g34?=
 =?iso-8859-1?Q?qQJR2AsRm0rW5mbJoQttLV17JzfpTI8Nxs4pd6luAsWXi2LqgvmrasVRKS?=
 =?iso-8859-1?Q?+O8M5S9708UWxfKmULD25vHIvoHITYqBbFVKKcTMTMgZG02voh/UEGr951?=
 =?iso-8859-1?Q?bHWNhxS+ONdg/OkWq6ahQa7vnj71ywQQXkTOFUc63M63Yw+kiL7ckHhcsP?=
 =?iso-8859-1?Q?Ab0h1y/0zHsnDCQ26KMY8sitFRGLPv+WgqWbQE6wdW19RftoK4rxL6jXgd?=
 =?iso-8859-1?Q?lr2YESUyyCa6GTCAzNNzUrfEPYQ7S6faMNUWSm07mvswJg2CwoEZZoZOZ+?=
 =?iso-8859-1?Q?m7LZDLM5sRpn24pHuyfOufL6gaoALw4z54t7j/KFxQy15jwlKNJUtoANvW?=
 =?iso-8859-1?Q?J35aeuvGWR?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4380.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee600703-100a-4d5e-cf9b-08d926aa0212
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2021 16:09:46.9354 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vMe25u+Np4vastpZWwkI0cawWhiMUw3Vl9eL9xSlzWXH7L84vA2t8ddeKgftObU2Y+QMXVoY883IrU9MMuEOXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB2698
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10004
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 mlxscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106030109
X-Proofpoint-GUID: kFdw7T7TwsMuP7JuaI__mHg_Kc-hUo4T
X-Proofpoint-ORIG-GUID: kFdw7T7TwsMuP7JuaI__mHg_Kc-hUo4T
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10004
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 mlxscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1011 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106030108
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
Cc: David Airlie <airlied@linux.ie>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use vma_lookup() to find the VMA at a specific address.  As vma_lookup()
will return NULL if the address is not within any VMA, the start address
no longer needs to be validated.

Signed-off-by: Liam R. Howlett <Liam.Howlett@Oracle.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_ttm.c
index 7cb7ffdd1900..dfb5ca3f8da8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -680,9 +680,9 @@ int amdgpu_ttm_tt_get_user_pages(struct amdgpu_bo *bo, =
struct page **pages)
 		return -ESRCH;
=20
 	mmap_read_lock(mm);
-	vma =3D find_vma(mm, start);
+	vma =3D vma_lookup(mm, start);
 	mmap_read_unlock(mm);
-	if (unlikely(!vma || start < vma->vm_start)) {
+	if (unlikely(!vma)) {
 		r =3D -EFAULT;
 		goto out_putmm;
 	}
--=20
2.30.2
