Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E5387CD22
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 13:19:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2247111223A;
	Fri, 15 Mar 2024 12:19:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="E1Hqm1SM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2045.outbound.protection.outlook.com [40.107.92.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FEFC112234;
 Fri, 15 Mar 2024 12:19:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nqnLzInJoEwHQ9QTTndc/KyLhEdOzzCaN8MsbnOIoQMduvVRMBrKYROYsaz0gOJNnKnlaeavrXCgUmS+Y7s1YyoLMHe1f9sRbikCGhhKp/HM3LfH2MfsZvsGNtQl3o/L1FrCuc66pawHhKnb8IGXohy6GvWJoq1q/gJ8QPME13yHyYNOlnk5GzZgYENKik3+xp4eCPt9WA1GfckntS5G9LQ9qi7BCUSYsKHJPahRxNlgPfEa6ZGV3qL2lYjBysdBFzmDM0Kbr3AvOy3Z8ovKn/Bw52WrCZ+bIkQlMTHPQi0vCAQ/WC8XR5aW/Mv9aZRcUaPmgGZ/zw65Jf8i/NhPng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+oSeLddBIoKzA2DVHW4I2H1li+8DOEEZqzrVIxqYA2g=;
 b=NCOO2c71YiLKThJ+7SfUtqLUgOlGJkOJdUhC5Zy4TV5zIUbvfpTWZ4QanROwFsI1AxHXuCJpfK8I/ddanltc9w8myA7Yyi4UnRSzMCaj7u7g/putB79VBcxI2QxugO2bOVX7u00ClBSrMEz9YkuFxwbRDJ8pmKI8lGSf2tTA38fWEIt6sMkeS6aFGliJ/IEBDTRsJlshUpe8x1/y/IF25lfBBehMfRladNL4QEbC1BCZCcuBqHiCpDw1EU3iEtYQVdbz9mQAbyejLfqD62w+JAxCSD8PSlayTQ+c7gtYh6aMV/bx8NPQO++Z9yi0OOfzfh64BfVzbKVdajBBw7kzjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+oSeLddBIoKzA2DVHW4I2H1li+8DOEEZqzrVIxqYA2g=;
 b=E1Hqm1SMwFVK1eEIY6haC0pUCp+46wRCjKeAN8HAFJy0nhv+zCxBT33HEqMBnOP5pfVtiitVBUXd46vhoDvBZHHqYbgMSmsl1Sz6x5QzVli33p2F1PZ5II4/iOYwHrP94wXkdP9W0y2nsZp5qNkZUmXnSJJLdXzXzncRp1TXH1A=
Received: from PH7PR12MB5596.namprd12.prod.outlook.com (2603:10b6:510:136::13)
 by SN7PR12MB7978.namprd12.prod.outlook.com (2603:10b6:806:34b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.22; Fri, 15 Mar
 2024 12:19:06 +0000
Received: from PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6974:3875:ed0:7033]) by PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6974:3875:ed0:7033%3]) with mapi id 15.20.7386.017; Fri, 15 Mar 2024
 12:19:06 +0000
From: "Khatri, Sunil" <Sunil.Khatri@amd.com>
To: "Khatri, Sunil" <Sunil.Khatri@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Sharma, Shashank" <Shashank.Sharma@amd.com>
CC: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drm/amdgpu: add the hw_ip version of all IP's
Thread-Topic: [PATCH] drm/amdgpu: add the hw_ip version of all IP's
Thread-Index: AQHadtIuMm0zyRtrYUG6y9aQQf0c6rE4ttBw
Date: Fri, 15 Mar 2024 12:19:06 +0000
Message-ID: <PH7PR12MB5596A1DD75348ECC68EBBEFE93282@PH7PR12MB5596.namprd12.prod.outlook.com>
References: <20240315121315.406601-1-sunil.khatri@amd.com>
In-Reply-To: <20240315121315.406601-1-sunil.khatri@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=50ad0f7c-6b61-485f-9c12-0adebb3ba1ae;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2024-03-15T12:13:45Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB5596:EE_|SN7PR12MB7978:EE_
x-ms-office365-filtering-correlation-id: eeb49984-3449-4278-9678-08dc44ea1c1f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6kvwopHamLb9NuVhxGM6qwnNvBlR399OOZwdDedyCmjK2ZwRQkmrzqlZw+E+5KXroHfvJu2G4oyBqzUu75DneQd1rS7CHUX+t6OfFTtbESVm7DJYtGcS31nh891UsDbuzNMndj3Fyk7ZzT9QbDdfDUzb09JovJlGsU8hSJvfSCa+OaROYNldbCsmHnAevPPAAknm+106OxNbKLwjfJBpxbFwcEJwCKsn05HO67s3JuaTY/p9CfoT6hqOsgh1b+NjeCn5XLgi/mbM/QImsIr+ogvDRnv6TLWMZ5KWCTFO2kxkZa8Ux4AhoZsKvIyv+QHbI2J5k4kJGob0wMmgrJbdwMC4PAePTIWL4ktzXNE4bUVpsCl3XWfHVnxXQauDDvmV/wxOVjRqfKLX+eGh+mO6QrkZMhSv50riIaTVqFCEFQxoaO4qo80la999cPpiQjOZj0cTFfPid+NcEPA8EYFf/8/iUQYNULhywUVxJ+Iar6OFWWEqrcEqiYOb1N0MIhvDfA9DB6VaeOnMdc+AxIXKi8ayR6URiUzG57ovIlFHCCloZiLKtSDsbsWoaruBrYm0sWTFWDHxgitNNxkSf/ny0Y5zbeFWZPJb3+0OlZBejcJnhgmTwGk/bUBDMWpVnV7eNQleSIf/wc2uX8pGyTRszAdp5yk7f+MPgsRLoX1fpyo4wNYY+hGTM+5ivJ4sppeZdT8rZ1NkxiltbI37n2TsLwe3Kveo1OpZZXmu6nxuHOI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5596.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hrnbf57vaAGBr7YezbMhqv8XGmZMytlzi7juymKrQ57XpmgyGFcvG8CcFx6v?=
 =?us-ascii?Q?B+FE539JRXmzzEENO2NGjmFvRvyhWiJA7ciIbHvlzYEai/bZdli1OiM6Yjus?=
 =?us-ascii?Q?TDvDoMkh7/A232hEuYEAiqciqfd8jjCeHiAOFPIq+uEr9QBBEJ6qiW6ycUmn?=
 =?us-ascii?Q?Eb6Xx84BnmAJoozkYKhcNMBRr8t4JyGKLXllaNL1UN815Kjr4dBOvl65xBbo?=
 =?us-ascii?Q?BVgoxKG72ZiUoRZACwyy+uv7CY4+ug6/CogAOAQH93tP1BRspCgdObn6e7i4?=
 =?us-ascii?Q?WfGZ4Ov60SZmXRk1YBs+yQt9gvS9NzoZn1lLTdbNArcIB8Ni+YoA2FWygrfC?=
 =?us-ascii?Q?iyPBubcaD/7DYB4R+k1DBpWrwQcQiulVc9u5CYjpeapeE/MGyL4Oy11HALKq?=
 =?us-ascii?Q?gTDWxdrsmfkbN+OX6eS9ZTA6MLCXVEaQXJP5YDIdBNDQ7nUVFp6yHckZNPWu?=
 =?us-ascii?Q?HmAh/BrNgfJDmTQARaiIU/BqbxKDYPIvG2WtlsFQxnpgCxVWM/cASoCkpkTg?=
 =?us-ascii?Q?td2d34bWjqJvGX/CEbXOYudR7/W49R8RYZeRfZpjZIhzJr0LtEsncb4kn0CJ?=
 =?us-ascii?Q?b8kx06nVvVPG26qfSe1bUdKI9pei6hmxmbgun5Qbnv/B9dlg+J8b4xZFitjQ?=
 =?us-ascii?Q?/t6g01Pg0BflyKMQ5X7K++K7a0l93h+p3CH6uWeiiqaAXjyZRWkBRjzppEW9?=
 =?us-ascii?Q?zqOFdKSVM9jk4ochQ6Ox2Wambdvai3wkek0gymicqjl1RpEUrqsUjgcZ38VY?=
 =?us-ascii?Q?NOr78yCpIv8w8VGtIbOldkrnBkJzhq1WkKQQe74JzpMwCTbpTLAZAtmq3jRe?=
 =?us-ascii?Q?8H3B6yWnVq8gP/x1r4jxYvdDgAHPDuu2lCU4NAGX8ISGEAiQIFOgREbw0GDc?=
 =?us-ascii?Q?T+c3hVCgvR2+dUPAT3BIoHfFfsy/lKnmd350AwzlZneV0ccXwPOB+OU/M3il?=
 =?us-ascii?Q?KMcy6fOzWPPo23FSF0m+Ow660XkP5yJZxB5rqWwwadxpEontliyNUXvg3oT9?=
 =?us-ascii?Q?TeVkzKzxuhjEctlHKy7dD2WvFy4by7ETbn+iP/5OKUTJvLtmiSOxF/Hb1giM?=
 =?us-ascii?Q?0xftXv4lxWQUukuPH6IK0UvDfhIdFM+XC7u/HLAJVTMnRZO1NGlclaqVzzYL?=
 =?us-ascii?Q?JVIGnufQM7JHlxcJDFXnSxdBZEQJYSGRnSx88LZx1ouyf9FIjbLKA4vjCDLJ?=
 =?us-ascii?Q?U/1gReVY4AYxkTprGWFBow0ZC3zjUnFKIHsMIBwFzqeNfFjNQh+MdIxqpSXD?=
 =?us-ascii?Q?NoLBsseBp/B4HnXsehdz6joiasoIaZ5L/SUQ0fZjA/gbW7RfD6QNH6LCBKUt?=
 =?us-ascii?Q?AJ7wl+hiOe1wkIJ+EzvLaRQyavNJqD/uCVsLGWGMF/oamtB/uCwpav0zcRM8?=
 =?us-ascii?Q?Hb1hpIRhNjwPPBUP2UUoh6mu/8EIb6Day7595ZTUaa9Xdu2qNsQ8Y6X0x4i+?=
 =?us-ascii?Q?orpcPjjNJM7u2BRpwoCExBQjw9+mT8yG1VcJ9MLW6iErJSCE8Gd4QQ44kFJd?=
 =?us-ascii?Q?pLBhqMJPfAGCG+Y9pxxTBwc5jAjmK0+mVLh7VduwpRkSjDqi7kYKaLpHtYJE?=
 =?us-ascii?Q?ofhbglOIYwNd1YN/+NU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5596.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eeb49984-3449-4278-9678-08dc44ea1c1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2024 12:19:06.4221 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LT19ghsE22bkq8nCVQNL6Lg5e1PZrGjNggYgrCYpCNDOUxEmyxN4ZjSKWjTa+aBYizOyKii3Y5LXEzM6HjDrnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7978
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - General]

Hello Alex

Added the information directly from the ip_version and also added names for=
 each ip so the version information makes more sense to the user.

Below is the output in devcoredump now:
IP Information
SOC Family: 143
SOC Revision id: 0
SOC External Revision id: 50
HWIP: GC[1][0]: v10.3.2.0.0
HWIP: HDP[2][0]: v5.0.3.0.0
HWIP: SDMA0[3][0]: v5.2.2.0.0
HWIP: SDMA1[4][0]: v5.2.2.0.0
HWIP: MMHUB[12][0]: v2.1.0.0.0
HWIP: ATHUB[13][0]: v2.1.0.0.0
HWIP: NBIO[14][0]: v3.3.1.0.0
HWIP: MP0[15][0]: v11.0.11.0.0
HWIP: MP1[16][0]: v11.0.11.0.0
HWIP: UVD/JPEG/VCN[17][0]: v3.0.0.0.0
HWIP: UVD/JPEG/VCN[17][1]: v3.0.1.0.0
HWIP: DF[21][0]: v3.7.3.0.0
HWIP: DCE[22][0]: v3.0.0.0.0
HWIP: OSSSYS[23][0]: v5.0.3.0.0
HWIP: SMUIO[24][0]: v11.0.6.0.0
HWIP: NBIF[26][0]: v3.3.1.0.0
HWIP: THM[27][0]: v11.0.5.0.0
HWIP: CLK[28][0]: v11.0.3.0.0
HWIP: CLK[28][1]: v11.0.3.0.0
HWIP: CLK[28][2]: v11.0.3.0.0
HWIP: CLK[28][3]: v11.0.3.0.0
HWIP: CLK[28][4]: v11.0.3.0.0
HWIP: CLK[28][5]: v11.0.3.0.0
HWIP: CLK[28][6]: v11.0.3.0.0
HWIP: CLK[28][7]: v11.0.3.0.0
HWIP: UMC[29][0]: v8.7.1.0.0
HWIP: UMC[29][1]: v8.7.1.0.0
HWIP: UMC[29][2]: v8.7.1.0.0
HWIP: UMC[29][3]: v8.7.1.0.0
HWIP: UMC[29][4]: v8.7.1.0.0
HWIP: UMC[29][5]: v8.7.1.0.0
HWIP: PCIE[33][0]: v6.5.0.0.0


-----Original Message-----
From: Sunil Khatri <sunil.khatri@amd.com>
Sent: Friday, March 15, 2024 5:43 PM
To: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Chri=
stian.Koenig@amd.com>; Sharma, Shashank <Shashank.Sharma@amd.com>
Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-k=
ernel@vger.kernel.org; Khatri, Sunil <Sunil.Khatri@amd.com>
Subject: [PATCH] drm/amdgpu: add the hw_ip version of all IP's

Add all the IP's version information on a SOC to the devcoredump.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c | 62 +++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_reset.c
index a0dbccad2f53..3d4bfe0a5a7c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
@@ -29,6 +29,43 @@
 #include "sienna_cichlid.h"
 #include "smu_v13_0_10.h"

+const char *hw_ip_names[MAX_HWIP] =3D {
+       [GC_HWIP]               =3D "GC",
+       [HDP_HWIP]              =3D "HDP",
+       [SDMA0_HWIP]            =3D "SDMA0",
+       [SDMA1_HWIP]            =3D "SDMA1",
+       [SDMA2_HWIP]            =3D "SDMA2",
+       [SDMA3_HWIP]            =3D "SDMA3",
+       [SDMA4_HWIP]            =3D "SDMA4",
+       [SDMA5_HWIP]            =3D "SDMA5",
+       [SDMA6_HWIP]            =3D "SDMA6",
+       [SDMA7_HWIP]            =3D "SDMA7",
+       [LSDMA_HWIP]            =3D "LSDMA",
+       [MMHUB_HWIP]            =3D "MMHUB",
+       [ATHUB_HWIP]            =3D "ATHUB",
+       [NBIO_HWIP]             =3D "NBIO",
+       [MP0_HWIP]              =3D "MP0",
+       [MP1_HWIP]              =3D "MP1",
+       [UVD_HWIP]              =3D "UVD/JPEG/VCN",
+       [VCN1_HWIP]             =3D "VCN1",
+       [VCE_HWIP]              =3D "VCE",
+       [VPE_HWIP]              =3D "VPE",
+       [DF_HWIP]               =3D "DF",
+       [DCE_HWIP]              =3D "DCE",
+       [OSSSYS_HWIP]           =3D "OSSSYS",
+       [SMUIO_HWIP]            =3D "SMUIO",
+       [PWR_HWIP]              =3D "PWR",
+       [NBIF_HWIP]             =3D "NBIF",
+       [THM_HWIP]              =3D "THM",
+       [CLK_HWIP]              =3D "CLK",
+       [UMC_HWIP]              =3D "UMC",
+       [RSMU_HWIP]             =3D "RSMU",
+       [XGMI_HWIP]             =3D "XGMI",
+       [DCI_HWIP]              =3D "DCI",
+       [PCIE_HWIP]             =3D "PCIE",
+};
+
+
 int amdgpu_reset_init(struct amdgpu_device *adev)  {
        int ret =3D 0;
@@ -196,6 +233,31 @@ amdgpu_devcoredump_read(char *buffer, loff_t offset, s=
ize_t count,
                           coredump->reset_task_info.process_name,
                           coredump->reset_task_info.pid);

+       /* GPU IP's information of the SOC */
+       if (coredump->adev) {
+
+               drm_printf(&p, "\nIP Information\n");
+               drm_printf(&p, "SOC Family: %d\n", coredump->adev->family);
+               drm_printf(&p, "SOC Revision id: %d\n", coredump->adev->rev=
_id);
+               drm_printf(&p, "SOC External Revision id: %d\n",
+                          coredump->adev->external_rev_id);
+
+               for (int i =3D 1; i < MAX_HWIP; i++) {
+                       for (int j =3D 0; j < HWIP_MAX_INSTANCE; j++) {
+                               int ver =3D coredump->adev->ip_versions[i][=
j];
+
+                               if (ver)
+                                       drm_printf(&p, "HWIP: %s[%d][%d]: v=
%d.%d.%d.%d.%d\n",
+                                                  hw_ip_names[i], i, j,
+                                                  IP_VERSION_MAJ(ver),
+                                                  IP_VERSION_MIN(ver),
+                                                  IP_VERSION_REV(ver),
+                                                  IP_VERSION_VARIANT(ver),
+                                                  IP_VERSION_SUBREV(ver));
+                       }
+               }
+       }
+
        if (coredump->ring) {
                drm_printf(&p, "\nRing timed out details\n");
                drm_printf(&p, "IP Type: %d Ring Name: %s\n",
--
2.34.1

