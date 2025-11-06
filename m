Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CE4C3C1BD
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 16:39:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7800710E924;
	Thu,  6 Nov 2025 15:39:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="RJkXtwNa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010007.outbound.protection.outlook.com [52.101.85.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3917510E924;
 Thu,  6 Nov 2025 15:39:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D8gelJwNXdeNtTKMuR0I3hf9R/UEQEnM2pBUisglBumUp5hXlQ0t++18AYdNZOxO8kflYpRYwBVdAU0AT6qYon4V+eYEejJ9tm1l/Z89ieJxNmZwqRPxVBGRZqMqPWkXtLZWtDuK2/fZI28WxGA+IAtBSigoAFjR9j3dxemaBTA0oQYAj4KQAjtdusZlIonqNA4ctsuU+A/SBsREKNNEg7HzOT4jWwNtLvImuZbfM7YzfML17wbiKTP8V8QWvaDQxxgkguhUGiEJuKCOzZySiRvOac08sx/gBj3pm0smAGt/x/fRMwMCG7bO6CrNbBQZ4KN4c260OmBM/zjrqJB3dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RizJ2ypGQsX8l4ZYSm7s02osoQtztE1MHOG6d4yVDpY=;
 b=kiIM896iCYvK8LmGMCR55HWYDTrScdFzDePKT8S7LCONd39tZKexQ1MAmwKtdzi9gqL0b0LCmfs2L+rqijm/FqUwHmOv0ydfcMPFnAQWBTrqxmYS60ynon2R1EGskJmWhJEPiDL0qUZ93Lu6DpnflquGlPBlkNfkn3VCtJhAk7C0V9iOTgJBCAJTUDKUQFKZ43l0c9Tdspvv32Lv1sOW8b3s3CrJHJA5Q1mVwNolQqgRBRnaWtNZXBKXlr+scHMwUXCdP3LcKtIYpl9LV2OCl3pB2TqRVeEHEwsDolurGCx3ec9Z6TiolT6OYWm04Kc8EZUOqamt4kKGCIZj2ki31A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RizJ2ypGQsX8l4ZYSm7s02osoQtztE1MHOG6d4yVDpY=;
 b=RJkXtwNaB7LrFb1cmZyOWKPcnOHph5GJICo4zoAWdgf7c8yAUkqI3sePos0auD7M3SJ27adVS1SMtoPr0XM6bXuUOw0qqS6hOmd9EQXURixDTVEtOEIUaFHvmsW5D6lDBlxC6z7uYazW+7e68+3Gj2QJdvkCsXVr+JwhW5BY130=
Received: from DS7PR12MB6071.namprd12.prod.outlook.com (2603:10b6:8:9d::11) by
 SJ0PR12MB7006.namprd12.prod.outlook.com (2603:10b6:a03:486::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 15:39:45 +0000
Received: from DS7PR12MB6071.namprd12.prod.outlook.com
 ([fe80::be26:4c33:76bc:e1b]) by DS7PR12MB6071.namprd12.prod.outlook.com
 ([fe80::be26:4c33:76bc:e1b%5]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 15:39:45 +0000
From: "Kamal, Asad" <Asad.Kamal@amd.com>
To: Chen Ni <nichen@iscas.ac.cn>, "Feng, Kenneth" <Kenneth.Feng@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "Lazar, Lijo" <Lijo.Lazar@amd.com>,
 "Zhang, Hawking" <Hawking.Zhang@amd.com>, "Wang, Yang(Kevin)"
 <KevinYang.Wang@amd.com>, "Xie, Patrick" <Gangliang.Xie@amd.com>
CC: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drm/amd/pm: Remove unneeded semicolon
Thread-Topic: [PATCH] drm/amd/pm: Remove unneeded semicolon
Thread-Index: AQHcTstuecUec5glm0qC/78LnjAvbLTlyYZg
Date: Thu, 6 Nov 2025 15:39:44 +0000
Message-ID: <DS7PR12MB6071B9C7F07ABD527A9C043E8EC2A@DS7PR12MB6071.namprd12.prod.outlook.com>
References: <20251107165728.1365265-1-nichen@iscas.ac.cn>
In-Reply-To: <20251107165728.1365265-1-nichen@iscas.ac.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-11-06T15:39:36.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB6071:EE_|SJ0PR12MB7006:EE_
x-ms-office365-filtering-correlation-id: 6b1f701a-5b2c-487e-3dfd-08de1d4ab5f7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|921020|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?nUWnz3vsvC9CEGVS3NfBJGmS8/vpai8Su6E+bxJ0C+Q9DtpnW24HG9eJkiAH?=
 =?us-ascii?Q?+gkDgmK3JWThK6HrrKcwcPJB+ILY6HrYn90EsK7qEgV136L1x5JZoiRT3XZY?=
 =?us-ascii?Q?vbuHx5xqvmSln8mxVnAt5rpbI4kRAlZ9M4ENf5225Q7q8c54iiPNSPnxr1rb?=
 =?us-ascii?Q?GyCI9zt/jDX/rjcU25VIQcMrPrRK06fKkUXRnrjMwinK3FEt5enYvspKd/8U?=
 =?us-ascii?Q?kD78eXwQiKPmXxA87XVJYHAPM2Yog9kRVD5DUvjJve7qYFL1cpkxQIqWwpfv?=
 =?us-ascii?Q?w3IsUm2YUDJD/X5a74NK2/2HDt4iy0xgs/G0+VObd0L59brTrjkFPI/U6UdS?=
 =?us-ascii?Q?RTc3tcyd4DPCrErEoxEc5qchfCax5R2vyVgaSvJHZm/+J9u96AZp/k4sDP7f?=
 =?us-ascii?Q?q19nBSvO5YVOr2IDr+ajk4gMIwYOv8KTk758x5ANoYoYR9Rk9yhe33BGkwOO?=
 =?us-ascii?Q?GARx2Vxa8nRTKD3ss2WAVJwIEfO9pUfkrwAv+Mg83X8bC1Pxaxaq4fWd9Kn2?=
 =?us-ascii?Q?/ZWLkUkZhOoUc9B4/JT5lIzrXdDtVzXK1x2g65y50StZXXXMsg+wato90GIa?=
 =?us-ascii?Q?OWt52gdcgwKeGb5r3r6tQfgioPMHSPMvLuaKgLhmONcdqJCY5YvHSyF6xxvK?=
 =?us-ascii?Q?WuQjsZccGErmHElKSq75E8VJufPj1+GHvpqDTBGWB+Ds727Vn1pfhJ5Oq7mA?=
 =?us-ascii?Q?TVnll40WHnOGqmByYHi3WQ5tRceNO3KsR6KBdp0841YZqb/Kf/J41kj5N1WI?=
 =?us-ascii?Q?TlWVi3QuFxbLGeabcSE1TkU3od2GATdMaBi/QcNojbart1gj3zlZi0QOfEU1?=
 =?us-ascii?Q?++TdMVwyERbx5q+6AOL8Ct3yFKoLgc4ZhoBFUSFwMu0xwIXgTRf4P2m5oclo?=
 =?us-ascii?Q?K3/uD7Q1WBu39TvS7j18Ax1pPWKH+3fK9NfunvfqGDX4pmwRYR4BQXlJuFQZ?=
 =?us-ascii?Q?ysWnFVYzioA52CvuL7V4Yn63xMtz8YreYygJ8E9sg+uewwJfd+Qy3BBvE9lt?=
 =?us-ascii?Q?6rO5x7LuzzYbuM/lc/IuBm6S0mBL/Wbox0KJo+a1jqw0yy3zzx4nrL7OfnUQ?=
 =?us-ascii?Q?/6o1MSUCW0O2MsIK1Stbx92Nh7xOEf8BpAwNN5maCov/3XwnDr8rd0s/5A7S?=
 =?us-ascii?Q?Qwh4LKMiYKrPCQyM0KIpzbHIdR+C8dgVGwCXiddMP2cFfC6UvPJX0Ux/rE9R?=
 =?us-ascii?Q?cSTRB5G/qLNB6P6LuSXIo1EHyJAXfwMA0+k+qDPVQkK1MURACkxAr3U92dn+?=
 =?us-ascii?Q?hspv4xN9iBKpNwcHR5NRUtNFXmfxt1aXkv0Ald0sDAw9NbMmKpopjzAdTOQI?=
 =?us-ascii?Q?Z9fKPpPq/JvwiYcxoOCj4wwqwAf7M0XvZ96lF7mxLTgqcWbU2EYwk0xDpFMo?=
 =?us-ascii?Q?pCDOqIyh9lBc9jiTfC0WNJsRIVY9Drn9ByrlZRNN2+uK4ey7LOq04q+GF5D8?=
 =?us-ascii?Q?TOmxQ0iOajfQhWxXljTTl5LLaG11STehQVtZDz/VBD+rhaR2N6e2cGPGyzje?=
 =?us-ascii?Q?U/f6fmlC14OVBGnzWzzf6VkN77kZTF5shK55SsexUcINOHQRC3CAc8aYfQ?=
 =?us-ascii?Q?=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB6071.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(921020)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jkhejL3Dp3OVgJ6xygU/J1+n7qOogDap3b3SS0Y+scGiGNzcrf0G47Afqr1U?=
 =?us-ascii?Q?1MwgSHA+t0OJGZvNjqveuWN0YdcGJjGUTrky5gZM/y0VxvprxjqM7zn5DdGx?=
 =?us-ascii?Q?sZl25jnwC4jXrpEBeBLYg5JN7N+ADIfm/48K1FikEgr96ZYngghFmyxGc4Ji?=
 =?us-ascii?Q?BrsqtZg3V35EiiGy0eonvPfGqJd2zqCrrm59st5f+VDcrUcUQ2t+UOOrQwUT?=
 =?us-ascii?Q?TTOpL4OK0i+4RGD7d6iHdIOlYVhm3B0mig3X+HIQB7Bh21+YP17Px6Rv4yqz?=
 =?us-ascii?Q?vNDQGQRySkDmi3maSG86YzSmZHFT8oMfn60asExIQxPgfyLYlJpFPNNCNnEc?=
 =?us-ascii?Q?C7fAP06gEiIFivv48ej2MC+YQG6rD3fNVs/CL/B+g6DheO7tfi65aFyzqoPm?=
 =?us-ascii?Q?3jCAMTzyzQFQeuOjuSdWSxQQedjjfMI4+1V2o49n2D0CZ5goEY2WkF7XOdQH?=
 =?us-ascii?Q?5KG4jyDO7HpwoXW9+uv1YSNRzmFrZl74DGZjqkmcxtyc+3/yFIW/UXM6LZ/k?=
 =?us-ascii?Q?FM9K9I+Lf2ucATFpBZOZP9Aa8C7zijqJi7eBqfb+VRymoUTiuaJetunDLaY0?=
 =?us-ascii?Q?s4sJ02j/xBTas2qxAxvE7EniRHFPieM7ulvpAwndbc7f5+CZoPoGMMFtgK9a?=
 =?us-ascii?Q?Qu6zWQeozuleqf9L6Dbz9m6o+UmXZr67KcB5EQfAJunbUzeTThaDBivNqk2r?=
 =?us-ascii?Q?RKszyJCHWh7hHgZvJr1j9iGYou3HLcp3OIK0x78xGb2MQQzsj5O98JZYKjsc?=
 =?us-ascii?Q?Y/Et+h8YV/zhw3pEA4fMutiCvNDIvR7efnm792cNxL247Ub6NaExYgb5j19A?=
 =?us-ascii?Q?WIs8Ir8ADoKh12WwDMfOFniId3HNw0A8i2txwHml0urOGtqM0pVthA2WL5xz?=
 =?us-ascii?Q?ZNCAstbjI/k4HbN11Cg1ZmJtVLyZwgCQxs5xPMZPrZLv1l6iID6XlVBBRU8n?=
 =?us-ascii?Q?MeNXMqXoeGzcpPn8rpEW1jp1rL8ZajAJSm0zkpBIdm5u2ubh9p7XvJb+Rml3?=
 =?us-ascii?Q?Mp4iampOQz1kbz+pOmabvPfUvJnRIVwy45EHZD1GjjKngW09z7eOaU06v9em?=
 =?us-ascii?Q?vRi7iE0/66GSIxlxNR0dgccPkclnP+qiuak4SzaGW9OXp4cemfhRBv+IZHOu?=
 =?us-ascii?Q?C4AQBpQcmHXGI+08GsDRNdicrngTTA+x8zPQOl0LPA82T+5ZggYr149erLbM?=
 =?us-ascii?Q?/sxe98xyrZH1bWzqqyX9hbimSeIM1RGMkfA/zKMawIoxKjS3eDAmbEyGc1qR?=
 =?us-ascii?Q?/MvjxwurVu7nNGlmhxPQchMAkhKd1zWZ/Us9ZWCPrXF1s96eZw5wg1zk0NQQ?=
 =?us-ascii?Q?Gy3AFEZqFucfnMJbxP/5urMGk02EWRSzA7kSg7tAyN57jOP6u5f0ozX36Es8?=
 =?us-ascii?Q?b6s91bokADC4QKlsT2/i55pLkiXBuSFSVGa5pug5jvogd8887tndJWHDCeT9?=
 =?us-ascii?Q?yu6asbJwjloC3hn5ORnkMinAW1Hvz6QFMiVSse/en5zMplvdmdb0NrfFF650?=
 =?us-ascii?Q?74gfH/mTLcaUh3MjObgIUHj0VYM/r9xi1UQc0AFMEDPhUffas76qLn2qWqyb?=
 =?us-ascii?Q?mSOjRMqu/1ovoFz88Xc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6071.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b1f701a-5b2c-487e-3dfd-08de1d4ab5f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2025 15:39:45.0356 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: olPkoJEj5xHtr8fjrWQLFncS+Kdig8mrbO2stbsa3wZ3i8jqfHUmwThPGizXwtP+6Xh8s5+yHVdPTjwH34CLwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7006
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

[AMD Official Use Only - AMD Internal Distribution Only]

Reviewed-by: Asad Kamal <asad.kamal@amd.com>

Thanks & Regards
Asad

-----Original Message-----
From: Chen Ni <nichen@iscas.ac.cn>
Sent: Friday, November 7, 2025 10:27 PM
To: Feng, Kenneth <Kenneth.Feng@amd.com>; Deucher, Alexander <Alexander.Deu=
cher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; airlied@gmail.=
com; simona@ffwll.ch; Lazar, Lijo <Lijo.Lazar@amd.com>; Kamal, Asad <Asad.K=
amal@amd.com>; Zhang, Hawking <Hawking.Zhang@amd.com>; Wang, Yang(Kevin) <K=
evinYang.Wang@amd.com>; Xie, Patrick <Gangliang.Xie@amd.com>
Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-k=
ernel@vger.kernel.org; Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] drm/amd/pm: Remove unneeded semicolon

Remove unnecessary semicolons reported by Coccinelle/coccicheck and the sem=
antic patch at scripts/coccinelle/misc/semicolon.cocci.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_12_ppt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_12_ppt.c b/driver=
s/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_12_ppt.c
index 24aaef1494a4..3aa674d348c7 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_12_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_12_ppt.c
@@ -913,7 +913,7 @@ void smu_v13_0_12_get_gpu_metrics(struct smu_context *s=
mu, void **table,
                        gpu_metrics->gfx_below_host_limit_total_acc
                                [i] =3D SMUQ10_ROUND(
                                metrics->GfxclkBelowHostLimitTotalAcc[inst]=
);
-               };
+               }
        }

        gpu_metrics->xgmi_link_width =3D metrics->XgmiWidth;
--
2.25.1

