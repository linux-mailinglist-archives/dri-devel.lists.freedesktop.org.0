Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C26677BFDC0
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 15:38:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 681E910E374;
	Tue, 10 Oct 2023 13:38:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34DC010E36C
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 13:38:37 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 39ACSosc008503; Tue, 10 Oct 2023 14:38:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :content-transfer-encoding:content-type:mime-version; s=
 dk201812; bh=SWulkRh5piq82U81/z0a4vAjT+FfK7VRfpgJWBpZt0Y=; b=X3N
 aa6FQ1IozvKh7SOPozlDOVlfDYX1KbnwDkZcWZZ/18Sk56iRgu60D2F4WGbmaXs1
 zxzrt5Tt/ryoq6yR2OabOoES84zswtqA/k2D8gyZqUO3aNp8rG9tK+NS9iplMpZl
 iFdgvKFiw/OEM4iW8qa9ibwT6YUjx3QeqjQGUAi0XxryruS+W/3qFYbneG9vjlpG
 V0AZYKM34qlQDBO+e0JBYBrUV0YEGEmC62AZDnP5FUeMmXt4dbtRg8EBdKYAYk5D
 Ok89SH/FdWuZiUx0lPC50Hja7yAyZtCV07vg0cbzjHANxYbkdS2ROzH/C+3cvY8U
 t3p5G1BDf6ozJjU4ESw==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3tjwkq2a69-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 10 Oct 2023 14:38:20 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 10 Oct 2023 14:38:19 +0100
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (104.47.85.104)
 by email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31 via Frontend Transport; Tue, 10 Oct 2023 14:38:19 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q6FIHg7854pehFVPfCCb0b1HdR6dsgdnjs3GS6R2AmlnplkYuddCBdkQibcdwtVmmMyvpC23QlSdX4+LSmL4qfJuHf7SPCL7TgSRiXq+Ng9u2VGDZ81FmLtK+bY9Yq6NygXrqC5uw3JrvHqo15xfhVNeL7w8TXFL1WiNNiH9LHpJWDTFdKFNtwe3hx2B2Z/1+aYwGfAnv69ePOKYFj7hpDpwD71EzDyLe+fZ01w9XeufeiBv5kK43KJ46j6CZx08QoxdkYI26azsul69FU1IU+HQGae9OrwCqpKIgtno7rUaWBzqXs2+DZSIXYdZ+XYfNV5fpiRBiTBESVjK9NJnNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SWulkRh5piq82U81/z0a4vAjT+FfK7VRfpgJWBpZt0Y=;
 b=ehvfWdE5v3p/8BfoSYp5XRckl6zq66a6GLpGzDs2Cq1EOCsDLoScL4d9yaDjBPkiRfV6s+3VRN5F86endv4z8ZFg79Rbax3fwroOVBkynrlp7RcHa9eGmtB3cx+hQ8eLO+tn6viSGko5MeQWbmIBYQkB4NcK5JTVyidEOnJzAd5EXTu5bCeKY+GkA8M2a5vkYqpKRt6htf/P5bSyzR2j0VZQXP2LQrG30fbNt+JA4Y+Ds4Mr7tUc9tJexsacfVSl22aIADGsQOoRtofQ9nJp0bxqtNL9vFtM4tz8r5jNC5gEDou7Gb+IuAmE/B2v0lLXqb7QQBHz3HzfDbhgSgnhgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SWulkRh5piq82U81/z0a4vAjT+FfK7VRfpgJWBpZt0Y=;
 b=F6+JVBgnxpwXc9OoCMtBO3jdMtDBczJu5QkMWmgEIK8D7VQ2mVyTDffmMMuKHPVSZ+qeCWHBvN/4GVsBn7cTBPTmMdE7DE+Z1RBSICMdN2hVukXXpvynU5sVk8krjJnlXCT0RQ0qFGP1JBEZdkE8nyKpmOKnS6lNBu0ZMNHJ+tI=
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:170::9)
 by CWLP265MB6168.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:182::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 10 Oct
 2023 13:38:18 +0000
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1f14:8c15:179d:7afc]) by CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1f14:8c15:179d:7afc%4]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 13:38:18 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v7 20/20] drm/imagination: Add driver documentation
Date: Tue, 10 Oct 2023 14:37:38 +0100
Message-Id: <20231010133738.35274-21-sarah.walker@imgtec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231010133738.35274-1-sarah.walker@imgtec.com>
References: <20231010133738.35274-1-sarah.walker@imgtec.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0183.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::8) To CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:170::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB4817:EE_|CWLP265MB6168:EE_
X-MS-Office365-Filtering-Correlation-Id: a2aa019f-9ddb-4128-a794-08dbc9962972
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s2Uk9Pb6BlzolM1daSMr1TBGXi5FyobMMcKdqypeHjORz/XMi/g9uTHHMS3uccQZx4FGUIq/QByEP9vZRDd4CNAjRiYBDPp6pFc6w/pcLWTLxKO5SP14utSy7e7i/yAMsRrWRdSztIBFWPvgvo566hsjzvBdBhhDkQ+1pN1HmVGhklrt9+9ZuBidtmoyOmco2Pu9RW61yyGvF9ALV/ZP+hGrYT0lUiNIKJqEX2ug5PAemTbkVnUYGlROMj4noFQ9lO/RpL618krrJW/C1qaZSOuJMtvaNrQVl3yB5ELM1hVt92reCTvwtwCd65FZ1eTFLpmvO9L3nXy+3/NBCvfaNLRmr6vECrMqs2BxUeuflvNhJfnWEawH5nvvede7vnd//pnsOOzsC2ccw3U97i9dLn2DZ7XA8P784/A9zgrYLeBLrr8L7bGY7b2CvofdM6V72bNv3iaj/LgM/tlCJOYQN/pJGurJjgVhsi1ya413GKphxJZNPCW3Z+DxIVdlMAQXO7sUjOP2PK8B1Y/QNFnIBXEiFwwmPi1Z5PtZMRYqF//9Dy3SDZaTDQWgEs/14nb7P3rBdIqU9u4PrbKKkUay5sinkU/z04rWo+gFe2YZqHFYqPwtMJmMDEtOun3smG86
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39850400004)(366004)(396003)(376002)(346002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(52116002)(478600001)(6506007)(6666004)(6486002)(6512007)(107886003)(38100700002)(38350700002)(86362001)(36756003)(2906002)(2616005)(1076003)(26005)(7416002)(66946007)(8676002)(66556008)(6916009)(316002)(66476007)(5660300002)(41300700001)(8936002)(4326008)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ok7VZP909PAuAakUN2m99qCXUkZeZnT/UQOOwhxNrSfMdNxDMQkjmr4uQyJO?=
 =?us-ascii?Q?ptdscqjj+CPP+Ha8h2UeYeNUZSOQ/jQztVE710zWJ5JsCQpsCgcIoYxySRzq?=
 =?us-ascii?Q?iNngPe1387iSzP8sA/dea4hXevrILfWcEPhro4LflHxOSAsicL/Ru1bDrpdt?=
 =?us-ascii?Q?8h1PAm7xB4C+Y/W99q6bk+zNGpjjssI327ZejWnyIIeaWBqgZFQmnqcMvX6C?=
 =?us-ascii?Q?JPDtiDhd8o4a+KEtbM9R+Ul9TOwywanBjJHwMjapXjY728bAtWc9Om7ncDXs?=
 =?us-ascii?Q?g6hafkFDRksaLXf3qyWKg4LzL/S0n70yckOcLAs0BnLg+g768x8uFwuGVsUT?=
 =?us-ascii?Q?0khTuEEB3MIkzJA7nyTARI9vQMC0eIaVolGqcrWG1DYgNwUDJBKR41xh0MP3?=
 =?us-ascii?Q?7GBStvAiFRnEQdoBqu+zRGp7OzY+tjlJU3ec/jDuIfIiXKzTfAVApNR4hxj9?=
 =?us-ascii?Q?l7/p+ffh0c4eulwSTlNNP6CH3XIjZthVWZ3BWzjxLAcYcoJqmEklUcdBRa9I?=
 =?us-ascii?Q?Eqr31H6S+zWue7usaO/G0I6fcEUvcp9aXYOSMbwl9m/C16gnqPqhDJ9nFr6+?=
 =?us-ascii?Q?IgoTB2GPmZJdWNUOQahqT+JviyAMEo0xf484lEk+nOjPHmHnmWDHaUNK11wV?=
 =?us-ascii?Q?eFfu4Llrghut72FUmHyPhcvFILcrEjESBMmfJmFB8ZQ5xYSMnz5+5j436pLK?=
 =?us-ascii?Q?g0P85CcJHU9V13zUssDo2FCaGstvm+KdmqoNdDRRnNPMOb+GRmmAJkLyzVCu?=
 =?us-ascii?Q?s76H2cbmt28ctlN9DNIAev+a3KnXMsqrHVSNvpH+DBDmw4UM9//y3pVynPBG?=
 =?us-ascii?Q?JIr5pf4+E8UVnReqE7M/lXiMxeGFFAT0wbmp8OAd11CMA9yfDKkFGc4XKfQj?=
 =?us-ascii?Q?94ON/FyNjoGISlUce5VJNpMklI/qM4DTDXGulAspb9BJi59svsSilWFTFFAi?=
 =?us-ascii?Q?7itXJLhISJv9YkvsvwjCxTcWl75kEGZF13p/nSzniUEQA3iN3motVvuVDZxI?=
 =?us-ascii?Q?JGFDWuJDGJwEFdB3zdGoVQ7MBjkUeoZ1Tg7hk9J979oVR7qFmDZcGKoyVVI9?=
 =?us-ascii?Q?C46G6mFPSfit70SeO4lQumtRS84Gqv1Q8xa4MtFKZM4Gu5XTRb5uFigRwYYg?=
 =?us-ascii?Q?GqcGdgblNLNFbko6srRRSUa+nmU64MQVIkT57oDCcBX9F6aeeJXG0WY35h70?=
 =?us-ascii?Q?wtb/JYFCu3mE158uhQ08a7vPiQII/FuRrSV0Nk1yPA6+BEzj9GsdMAlidWsy?=
 =?us-ascii?Q?8p9Mb7hi06JZrRt8iNCmNxcjEngFz7ATqIMckOuesVeQT7YGrD2iZgmK24Lo?=
 =?us-ascii?Q?53kOC3f43p3EYjAEXIv5QMBExTxUxiOyuNM2eTWgf0H6TR7af9thtnnm1/Dg?=
 =?us-ascii?Q?zKOR4qPj6UiEuynvYENnlzMdF9nAh+JvZ3uW0gUseLp82l+TW8rzVqEbdDHW?=
 =?us-ascii?Q?iZD34OYuot/la+MhpmFFYbuMlO4MUrWJb/CvZrrPiijIiG2U2aSQaSXGunbu?=
 =?us-ascii?Q?Knnuj4/k6GJkTkK+d9qcMZ5J8sRGVTdTbXlVl3QgqAzR//cn+HRW6gEKL4Dy?=
 =?us-ascii?Q?ZBT3naoKZ7Jv0VrXFtlyi4cO5qPiu8z/qA5I/qBY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a2aa019f-9ddb-4128-a794-08dbc9962972
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 13:38:18.2035 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7jsoAwmVeV8Aa9s1oKAvnCTdvuxQWCgxgr7NvlTbhu+EFRVgt490npAL14xBcNCUU43qYV7Kaig0+CzSLj6mPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6168
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: KC6qOPrpzKOMyUl9_74j8mNVrGiEMW_H
X-Proofpoint-ORIG-GUID: KC6qOPrpzKOMyUl9_74j8mNVrGiEMW_H
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
Cc: linux-doc@vger.kernel.org, hns@goldelico.com,
 krzysztof.kozlowski+dt@linaro.org, matthew.brost@intel.com, corbet@lwn.net,
 luben.tuikov@amd.com, dakr@redhat.com, donald.robson@imgtec.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, mripard@kernel.org,
 Matt Coster <matt.coster@imgtec.com>, robh+dt@kernel.org,
 faith.ekstrand@collabora.com, linux-kernel@vger.kernel.org, afd@ti.com,
 boris.brezillon@collabora.com, tzimmermann@suse.de, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add documentation for the UAPI.

Changes since v5:
- Remove obsolete VM documentation

Co-developed-by: Matt Coster <matt.coster@imgtec.com>
Signed-off-by: Matt Coster <matt.coster@imgtec.com>
Co-developed-by: Donald Robson <donald.robson@imgtec.com>
Signed-off-by: Donald Robson <donald.robson@imgtec.com>
Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
---
 Documentation/gpu/drivers.rst           |   2 +
 Documentation/gpu/imagination/index.rst |  13 ++
 Documentation/gpu/imagination/uapi.rst  | 174 ++++++++++++++++++++++++
 MAINTAINERS                             |   1 +
 4 files changed, 190 insertions(+)
 create mode 100644 Documentation/gpu/imagination/index.rst
 create mode 100644 Documentation/gpu/imagination/uapi.rst

diff --git a/Documentation/gpu/drivers.rst b/Documentation/gpu/drivers.rst
index 3a52f48215a3..5487deb218a3 100644
--- a/Documentation/gpu/drivers.rst
+++ b/Documentation/gpu/drivers.rst
@@ -3,9 +3,11 @@ GPU Driver Documentation
 ========================
 
 .. toctree::
+   :maxdepth: 3
 
    amdgpu/index
    i915
+   imagination/index
    mcde
    meson
    pl111
diff --git a/Documentation/gpu/imagination/index.rst b/Documentation/gpu/imagination/index.rst
new file mode 100644
index 000000000000..dc9579e758c3
--- /dev/null
+++ b/Documentation/gpu/imagination/index.rst
@@ -0,0 +1,13 @@
+=======================================
+drm/imagination PowerVR Graphics Driver
+=======================================
+
+.. kernel-doc:: drivers/gpu/drm/imagination/pvr_drv.c
+   :doc: PowerVR Graphics Driver
+
+Contents
+========
+.. toctree::
+   :maxdepth: 2
+
+   uapi
diff --git a/Documentation/gpu/imagination/uapi.rst b/Documentation/gpu/imagination/uapi.rst
new file mode 100644
index 000000000000..2227ea7e6222
--- /dev/null
+++ b/Documentation/gpu/imagination/uapi.rst
@@ -0,0 +1,174 @@
+====
+UAPI
+====
+The sources associated with this section can be found in ``pvr_drm.h``.
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :doc: PowerVR UAPI
+
+OBJECT ARRAYS
+=============
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_obj_array
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: DRM_PVR_OBJ_ARRAY
+
+IOCTLS
+======
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :doc: PowerVR IOCTL interface
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: PVR_IOCTL
+
+DEV_QUERY
+---------
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :doc: PowerVR IOCTL DEV_QUERY interface
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_dev_query
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_ioctl_dev_query_args
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_dev_query_gpu_info
+                 drm_pvr_dev_query_runtime_info
+                 drm_pvr_dev_query_hwrt_info
+                 drm_pvr_dev_query_quirks
+                 drm_pvr_dev_query_enhancements
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_heap_id
+                 drm_pvr_heap
+                 drm_pvr_dev_query_heap_info
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :doc: Flags for DRM_PVR_DEV_QUERY_HEAP_INFO_GET.
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_static_data_area_usage
+                 drm_pvr_static_data_area
+                 drm_pvr_dev_query_static_data_areas
+
+CREATE_BO
+---------
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :doc: PowerVR IOCTL CREATE_BO interface
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_ioctl_create_bo_args
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :doc: Flags for CREATE_BO
+
+GET_BO_MMAP_OFFSET
+------------------
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :doc: PowerVR IOCTL GET_BO_MMAP_OFFSET interface
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_ioctl_get_bo_mmap_offset_args
+
+CREATE_VM_CONTEXT and DESTROY_VM_CONTEXT
+----------------------------------------
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :doc: PowerVR IOCTL CREATE_VM_CONTEXT and DESTROY_VM_CONTEXT interfaces
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_ioctl_create_vm_context_args
+                 drm_pvr_ioctl_destroy_vm_context_args
+
+VM_MAP and VM_UNMAP
+-------------------
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :doc: PowerVR IOCTL VM_MAP and VM_UNMAP interfaces
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_ioctl_vm_map_args
+                 drm_pvr_ioctl_vm_unmap_args
+
+CREATE_CONTEXT and DESTROY_CONTEXT
+----------------------------------
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :doc: PowerVR IOCTL CREATE_CONTEXT and DESTROY_CONTEXT interfaces
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_ioctl_create_context_args
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_ctx_priority
+                 drm_pvr_ctx_type
+                 drm_pvr_static_render_context_state
+                 drm_pvr_static_render_context_state_format
+                 drm_pvr_reset_framework
+                 drm_pvr_reset_framework_format
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_ioctl_destroy_context_args
+
+CREATE_FREE_LIST and DESTROY_FREE_LIST
+--------------------------------------
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :doc: PowerVR IOCTL CREATE_FREE_LIST and DESTROY_FREE_LIST interfaces
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_ioctl_create_free_list_args
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_ioctl_destroy_free_list_args
+
+CREATE_HWRT_DATASET and DESTROY_HWRT_DATASET
+--------------------------------------
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :doc: PowerVR IOCTL CREATE_HWRT_DATASET and DESTROY_HWRT_DATASET interfaces
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_ioctl_create_hwrt_dataset_args
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_create_hwrt_geom_data_args
+                 drm_pvr_create_hwrt_rt_data_args
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_ioctl_destroy_hwrt_dataset_args
+
+SUBMIT_JOBS
+-----------
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :doc: PowerVR IOCTL SUBMIT_JOBS interface
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :doc: Flags for the drm_pvr_sync_op object.
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_ioctl_submit_jobs_args
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :doc: Flags for SUBMIT_JOB ioctl geometry command.
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :doc: Flags for SUBMIT_JOB ioctl fragment command.
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :doc: Flags for SUBMIT_JOB ioctl compute command.
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :doc: Flags for SUBMIT_JOB ioctl transfer command.
+
+.. kernel-doc:: include/uapi/drm/pvr_drm.h
+   :identifiers: drm_pvr_sync_op
+                 drm_pvr_job_type
+                 drm_pvr_hwrt_data_ref
+                 drm_pvr_job
+
+Internal notes
+==============
+.. kernel-doc:: drivers/gpu/drm/imagination/pvr_device.h
+   :doc: IOCTL validation helpers
+
+.. kernel-doc:: drivers/gpu/drm/imagination/pvr_device.h
+   :identifiers: PVR_STATIC_ASSERT_64BIT_ALIGNED PVR_IOCTL_UNION_PADDING_CHECK
+                 pvr_ioctl_union_padding_check
diff --git a/MAINTAINERS b/MAINTAINERS
index 6bcd86fb44ee..f341f577f695 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10233,6 +10233,7 @@ M:	Frank Binns <frank.binns@imgtec.com>
 M:	Donald Robson <donald.robson@imgtec.com>
 S:	Supported
 F:	Documentation/devicetree/bindings/gpu/img,powervr.yaml
+F:	Documentation/gpu/imagination/
 F:	drivers/gpu/drm/imagination/
 F:	include/uapi/drm/pvr_drm.h
 
-- 
2.42.0

