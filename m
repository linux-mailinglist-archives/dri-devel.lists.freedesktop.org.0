Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EAB77DC27
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 10:27:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F07B10E2BF;
	Wed, 16 Aug 2023 08:27:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA7F210E2F3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 08:27:01 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37G7djRe002497; Wed, 16 Aug 2023 09:26:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :content-transfer-encoding:content-type:mime-version; s=
 dk201812; bh=fTJxwLXDyppVkFOA4BNwFcD9q0OTGGU3WGvF74+tfh0=; b=HEQ
 npXspiho3h1r0bKLF38jQ6wOVzdk3ui45NNRkR4DviaLFJKTmRxbOdy3o3mYLSn7
 rJTIywPs/9/m5fDWZH/b6IPveiVkyo4odPbq6LwHsJ5X876gq9DFQMFkjH7nUvdo
 afw5tkPndGxg53LzCoOgc/yoQVeJ8CdnZaxfnoozMoNOUGR+QBlayVbtIO2PvgrS
 Z2m/GdvMFnakhoVe69J7bAS8IEUMVLQYcucfMPtovknMR3faxhRgqkYdZx3PZZCz
 pLajgMfbVvXdWGXUEFBEi9OYrbOMUVFX4iLjLM/usWtuYCoD4gT3nZXYYXsVrHR3
 c1r+4L5L39HlFa+JaIw==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3se25ttutw-10
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 16 Aug 2023 09:26:41 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 16 Aug 2023 09:26:30 +0100
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (104.47.85.112)
 by email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 16 Aug 2023 09:26:30 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TL0NEKOsYA24RJSg7tDmfO3TUr6Q402E9XZzZBLaT/Y20JajwtomqnxxrTf92yjnoUOTrAumLrSTC1zfvjbmbgQgqwoj3VQvDZMbTKQUr4f5TXe2mySppcRiTZSVfJjXUGYw6pdDTB655cEkaojuQ4e5iKOKiGDSYU8xqZk9JU4vacE8WYyvLHJOC0qw4KnlG66dpOmDUDmkUWcThiZtwUOgAZyPfCfJVKQR9Bct9WGycF5PWiVoDwDzi3SE/lGUYRWVOa7c7RJrBZD3zAZWyLswbTqh9jnBu/JGirofARPIC1gZPCGMbdTr8GTJRLfDMxXDTxaL/7xpvd8uRWapxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fTJxwLXDyppVkFOA4BNwFcD9q0OTGGU3WGvF74+tfh0=;
 b=gHcypHudqf7WXjWWkOvOrtEkKUzVc1c2mZui7H7fAL8wt2Krzwj4FFMlnMsLxEG1QRwx4nIuN38OKxYVwOxtUyTHwbGkaoLgcjCa0n16/8qKncZu2mXsueufffRGBpuJkV8ahTJMNsrjh2ml71ZOq4MfMKNGV1NsU9Lh8K4BJh7p/k9Aqxt0kWwAUeyRk+DqbQdljiyj2gxMVIzMQxJcsx3QHUvWxDzA/wzLrz/CmS6Pn5p/7tsBBugaOOKKWZp7bL28NvjVbozX3Hle1EUJXm1q7rB46VQSZPT/jVH+QblXxaLlEBUqp20auOldfzVUkiIKl725MvNBjgCrEtPFng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fTJxwLXDyppVkFOA4BNwFcD9q0OTGGU3WGvF74+tfh0=;
 b=LM/YIY/WbMJ5zHKwKnE/WU2/Se3bsFWpAzlNfyq6DsiVHa28H0EnLd2KvWzaBluonAJO3z/GJbO9CRiAOGGIOG1fZo1VMSWWDq81AV3pRNC2utjeQHUZyB0j8fdRlR/yUFS9o6Icabs9Kj256QrDPQacralBKhQtxXknf7GohPs=
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:170::9)
 by LNXP265MB2491.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:130::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Wed, 16 Aug
 2023 08:26:27 +0000
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ee4f:2d71:fe8a:ffdf]) by CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ee4f:2d71:fe8a:ffdf%7]) with mapi id 15.20.6678.022; Wed, 16 Aug 2023
 08:26:27 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v5 16/17] drm/imagination: Add driver documentation
Date: Wed, 16 Aug 2023 09:25:31 +0100
Message-Id: <20230816082531.164695-17-sarah.walker@imgtec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230816082531.164695-1-sarah.walker@imgtec.com>
References: <20230816082531.164695-1-sarah.walker@imgtec.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO3P265CA0023.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::10) To CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:170::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB4817:EE_|LNXP265MB2491:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a849469-f490-4eba-a8b2-08db9e327c48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CGVNZiFlcl3Y7oJ2zH5UePq1yB60/c35fyKETvBeRavAkh+Lx0vxwhY4Rpy3imJXnf03TtomKXa3SysuNgSBrhBkHaBzVAQYSE1Pv7WZG5UQHzLZfgIyP4elOajxdvdvfmA17buVrGX9QyoV2maC4HBuAJggLZ5Fn5VPKcWyiK7P42HN6WnZfOOYw/bleH2OJLjsRWq6GXQDI0+BD4GV2MYLZ1y//Kwx0CqItni15Pko+gUVTzeBAxzIH3Rc9mBNWmsM30a9be1brim6LggWRXrXV8+PYHyx16KD1w6+PluS5ER5OJAjEzKWDVFIehT600ajCNh1vQr+W4lWvmuO6xAy96Yawc83S3YgoJtE4y9Jz0W0K+9szBTaWRZfVw6jROxVWk47RGqHDdRPrd+Srqzx8yty4o1x3cNIK9oIyQqNSiTGsHy3dadREinBGt0SK9pKgZhLIq9uuTJCbb2SDOyCdLVgE8Aq8euV9Mu+QX+pky9oNJAg1D+JW/mvMikmfGscTGiVTIBrTP2hkmhiQtI6b6ySz0KsAVEZdRJWvaB9ja9GBiYqO+k66az1S3qYfFTI8SAu/Rq03tz4cMw+wNovgOL4HBilO1tz9tFxywfbg9/kbJ6SYWFKGAK9Oh2h
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(396003)(39850400004)(346002)(136003)(1800799009)(451199024)(186009)(6666004)(66476007)(66556008)(66946007)(6512007)(6486002)(6506007)(30864003)(2906002)(478600001)(1076003)(26005)(6916009)(7416002)(107886003)(5660300002)(2616005)(83380400001)(41300700001)(316002)(44832011)(52116002)(8936002)(4326008)(8676002)(38350700002)(38100700002)(36756003)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zV3nEfVT5Si7uUSu+LaWRVMynUEE7MjBwsm3lMGvgY+M5OkzQJEunCUAjsBF?=
 =?us-ascii?Q?UK69wjBr7LwjkzAhbihL2I2ccUX26+zxvbERM9djAcidO3XQXwOR+e2ghWx4?=
 =?us-ascii?Q?QLlIjcfi6RtruS+a2EHEsd3j74zoYU7+36PM33doEGKbcUQYmmVJUshDaH6w?=
 =?us-ascii?Q?8ivh2zyhlkrFBon9NvE/GnzLBsQRWFJP5JANb84+N2LH4j1MEuZcbaUQH83q?=
 =?us-ascii?Q?r0QuyYBzsKK9ZtA7AxTTh/dR8ET2atzudvYz0uALuiceSm5BOVAkT01DZJu8?=
 =?us-ascii?Q?yevYTD8potttSRNLo1+Te2UTaeAM+H4LN/x8Xd3cH1QjziZ9YeMXw5z42omT?=
 =?us-ascii?Q?bp1Ow6rxGoG+2NWkiQz5m32X5o8i/t5+ZE5N6r04szX439Rlfo4WKeL7eSlJ?=
 =?us-ascii?Q?JxNSzY5qQ68QhWaGIMKpIuwRajDe5/z08RePGy+R162heMQ3M5GRdG9LH/S/?=
 =?us-ascii?Q?Fn67CT3i1laG1MG9fj/AVAjFHnqB7BH7M+gZ79RGh4cQlHbECXO0/BCnvJ/m?=
 =?us-ascii?Q?ev+h0ZGSHb2WLL6eCoKzyfiJSfaED+KoXnnFWaQYu/blySKxlqOUhJPB5ZKz?=
 =?us-ascii?Q?Yx351oAVIxqsq8L/jWuhf9S3afC98SJv0WDxKnG3q6cgzKdrbyc4zCS6lqzg?=
 =?us-ascii?Q?XehF11o82xuTnSHQ7iZcWzhwy8PagUD7pjPNeyjBUINoMAy2gFdP7jsERx4j?=
 =?us-ascii?Q?i0mmL8mm/dtys8Vy7seKzEa6RFwMSbDXl58rBQr5loNQjPFma0Svek04cXAN?=
 =?us-ascii?Q?vHp70SUjbI6i6jaNpxj6oVi3fWpu2tQSIOQKyLNS1Int+mqmSA+DTRbIUrX0?=
 =?us-ascii?Q?WdEyjZX/rbFkPGzrxiLjsecpKeH2HDpqHOI2EgeeNp8GTCGHnj//gn9CzBPS?=
 =?us-ascii?Q?vni/WpmjEjjwT6fEpPzDl3XhBGA4lGxuVZWNZg93maUws1XI7QUaaBNiar2d?=
 =?us-ascii?Q?UAEmUE+XJpfckY3hcAqH9OXsnzrmI27ewnB3aa3/XSBkrZXi0PhqlHRdWj7C?=
 =?us-ascii?Q?bdjyzaxabsIPa1MHIEMOTf++5hqBMdQYvwaauuZzqHVOt6hSiXunBapMRYRV?=
 =?us-ascii?Q?NnRczbULczGdXhaEGm5ea0uhJG+xePUXcubRpaUI1TkVX2w/zUp8D+bwEfSJ?=
 =?us-ascii?Q?qgHiMD51IcBI7BuCqTxXBL8jo1q+lqoJ81l+9gHvOkZ1pYhowV2E7I5AZe18?=
 =?us-ascii?Q?tcLXhk7lkdLIFXLjqfR6XXNPt33yqK5IcPmu/KhRq2Nrw6gZw24Lcrky3rPA?=
 =?us-ascii?Q?MDO/p8tvM8TOXNmLbLIvdKjDYh2YfvTgVmnrXn5ZTRp2KL7ayDU8eCKdrMKk?=
 =?us-ascii?Q?klO+K2RyrQKMWzNH03H7sLRt1ufQcdWUuBNUb+DAi1Se74HUlLpj8+L411xB?=
 =?us-ascii?Q?3Pz3LaTgApq+I0TA5JmMpN10JOMNSCaTMf9P/ATNPUP4wcP82/epo4Ou7Fvd?=
 =?us-ascii?Q?8QntYlGP4L6z7JZQoFoFRnFCnh7giY40hFJn/Psd8l9masn8Wd8qfDs3iNih?=
 =?us-ascii?Q?l5SFEIx32zPniuV8owaHSQ3SUXux72lPG3fbNOEO4Qw2S8U470xg5oeed7SY?=
 =?us-ascii?Q?xW2SMD5YtFDUUPrLHGL4b1hEmw8QtYIhfCUYSFQIx04lLxCMRC/hZOLRTZh7?=
 =?us-ascii?Q?tQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a849469-f490-4eba-a8b2-08db9e327c48
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 08:26:27.5102 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nk4/KH5O2ehzDL+OSVC0LEcXUIm4oGJfG8wepNqlPkgKr42TkZEQKhYa/jKOyTTexOnDQcWX7n9KXrpblfXCtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LNXP265MB2491
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: b0OE0UjKJmurFriZX3B3VRDer7tG9f_8
X-Proofpoint-GUID: b0OE0UjKJmurFriZX3B3VRDer7tG9f_8
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
Cc: matthew.brost@intel.com, luben.tuikov@amd.com, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org, mripard@kernel.org, afd@ti.com,
 Matt Coster <matt.coster@imgtec.com>, boris.brezillon@collabora.com,
 dakr@redhat.com, donald.robson@imgtec.com, hns@goldelico.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add documentation for the UAPI and for the virtual memory design.

Co-developed-by: Matt Coster <matt.coster@imgtec.com>
Signed-off-by: Matt Coster <matt.coster@imgtec.com>
Co-developed-by: Donald Robson <donald.robson@imgtec.com>
Signed-off-by: Donald Robson <donald.robson@imgtec.com>
Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
---
 Documentation/gpu/drivers.rst                 |   2 +
 Documentation/gpu/imagination/index.rst       |  14 +
 Documentation/gpu/imagination/uapi.rst        | 174 +++++++
 .../gpu/imagination/virtual_memory.rst        | 462 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 5 files changed, 653 insertions(+)
 create mode 100644 Documentation/gpu/imagination/index.rst
 create mode 100644 Documentation/gpu/imagination/uapi.rst
 create mode 100644 Documentation/gpu/imagination/virtual_memory.rst

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
index 000000000000..57f28e460a03
--- /dev/null
+++ b/Documentation/gpu/imagination/index.rst
@@ -0,0 +1,14 @@
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
+   virtual_memory
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
diff --git a/Documentation/gpu/imagination/virtual_memory.rst b/Documentation/gpu/imagination/virtual_memory.rst
new file mode 100644
index 000000000000..aab58e12a24e
--- /dev/null
+++ b/Documentation/gpu/imagination/virtual_memory.rst
@@ -0,0 +1,462 @@
+===========================
+GPU Virtual Memory Handling
+===========================
+The sources associated with this section can be found in ``pvr_vm.c`` and
+``pvr_vm.h``.
+
+There's a lot going on in this section, so it's broken down into several parts;
+beginning with the public-facing API surface.
+
+.. admonition:: Note on page table naming
+
+   This file uses a different naming convention for page table levels than the
+   generated hardware defs. Since page table implementation details are not
+   exposed outside this file, the description of the name mapping exists here
+   in its normative form:
+
+   * Level 0 page table => Page table
+   * Level 1 page table => Page directory
+   * Level 2 page table => Page catalog
+
+   The variable/function naming convention in this file is ``page_table_lx_*``
+   where x is either ``0``, ``1`` or ``2`` to represent the level of the page
+   table structure. The name ``page_table_*`` without the ``_lx`` suffix is
+   used for references to the entire tree structure including all three levels,
+   or an operation or value which is level-agnostic.
+
+.. contents::
+   :local:
+   :depth: 1
+
+
+Public API
+==========
+The public-facing API of our virtual memory management is exposed as a
+collection of functions associated with an opaque handle type.
+
+The opaque handle is :c:type:`pvr_vm_context`. This holds a "global state",
+including a complete page table tree structure. You do not need to consider
+this internal structure (or anything else in :c:type:`pvr_vm_context`) when
+using this API; it is designed to operate as a black box.
+
+Usage
+-----
+Begin by calling :c:func:`pvr_vm_create_context` to obtain a VM context. It is
+bound to a PowerVR device (:c:type:`pvr_device`) and holds a reference to it.
+This binding is immutable.
+
+Once you're finished with a VM context, call :c:func:`pvr_vm_destroy_context`
+to release it. This should be done before freeing or otherwise releasing the
+PowerVR device to which the VM context is bound.
+
+It is an error to destroy a VM context which has already been destroyed. If a
+VM context still contains valid memory mappings at the point it is destroyed,
+these will be unmapped, and (optionally) warnings will be printed.
+
+Functions
+---------
+* :c:func:`pvr_vm_create_context`
+* :c:func:`pvr_vm_destroy_context`
+* :c:func:`pvr_vm_map`
+* :c:func:`pvr_vm_map_partial`
+* :c:func:`pvr_vm_unmap`
+
+Helper functions
+----------------
+* :c:func:`pvr_device_addr_is_valid`
+* :c:func:`pvr_device_addr_and_size_are_valid`
+* :c:func:`pvr_vm_get_root_page_table_addr`
+
+Constants
+---------
+* :c:macro:`PVR_VM_BACKING_PAGE_SIZE`
+
+
+Memory mappings
+===============
+Physical memory is exposed to the device via **mappings**. Mappings may never
+overlap, although any given region of physical memory may be referenced by
+multiple mappings.
+
+Use :c:func:`pvr_vm_map` to create a mapping, providing a
+:c:type:`pvr_gem_object` holding the physical memory to be mapped. The physical
+memory behind the object (or each "section" if it's not contiguous) must be
+device page-aligned. This restriction is checked by :c:func:`pvr_vm_map`, which
+returns -``EINVAL`` if the check fails.
+
+If only part of the :c:type:`pvr_gem_object` must be mapped, use
+:c:func:`pvr_vm_map_partial` instead. In addition to the parameters accepted by
+:c:func:`pvr_vm_map`, this also takes an offset into the object and the size of
+the mapping to be created. The restrictions regarding alignment on
+:c:func:`pvr_vm_map` also apply here, with the exception that only the region
+of the object within the bounds specified by the offset and size must satisfy
+them. These are checked by :c:func:`pvr_vm_map_partial`, along with the offset
+and size values to ensure that the region they specify falls entirely within
+the bounds of the provided object.
+
+Both of these mapping functions call :c:func:`pvr_gem_object_get` to ensure the
+underlying physical memory is not freed until *after* the mapping is released.
+
+Although :c:func:`pvr_vm_map_partial` could technically always be used in place
+of :c:func:`pvr_vm_map`, the latter should be preferred when possible since it
+is a more efficient operation.
+
+Mappings are tracked internally so that it is theoretically impossible to
+accidentally create overlapping mappings. No handle is returned after a
+mapping operation succeeds; callers should instead use the start device
+virtual address of the mapping as its handle.
+
+When mapped memory is no longer required by the device, it should be
+unmapped using :c:func:`pvr_vm_unmap`. In addition to making the memory
+inaccessible to the device, this will call :c:func:`pvr_gem_object_put` to
+release the underlying physical memory. If the mapping held the last reference,
+the physical memory will automatically be freed. Attempting to unmap an invalid
+mapping (or one that has already been unmapped) will result in an -``ENOENT``
+error.
+
+Types
+-----
+* :c:type:`pvr_vm_mapping`
+
+Functions
+---------
+* :c:func:`pvr_vm_mapping_init_partial`
+* :c:func:`pvr_vm_mapping_init`
+* :c:func:`pvr_vm_mapping_fini`
+* :c:func:`pvr_vm_mapping_map`
+* :c:func:`pvr_vm_mapping_unmap`
+* :c:func:`pvr_vm_mapping_page_flags_raw`
+
+Constants
+---------
+* :c:macro:`PVR_VM_MAPPING_COMPLETE`
+
+
+VM backing pages
+================
+While the page tables hold memory accessible to the rest of the driver, the
+page tables themselves must have memory allocated to back them. We call this
+memory "VM backing pages". Conveniently, each page table is (currently) exactly
+4KiB, as defined by ``PVR_VM_BACKING_PAGE_SIZE``. We currently support any CPU
+page size of this size or greater.
+
+Usage
+-----
+To add this functionality to a structure which wraps a raw page table, embed
+an instance of :c:type:`pvr_vm_backing_page` in the wrapper struct. Call
+:c:func:`pvr_vm_backing_page_init` to allocate and map the backing page, and
+:c:func:`pvr_vm_backing_page_fini` to perform the reverse operations when
+you're finished with it. Use :c:func:`pvr_vm_backing_page_sync` to flush the
+memory from the host to the device. As this is an expensive operation (calling
+out to :c:func:`dma_sync_single_for_device`), be sure to perform all necessary
+changes to the backing memory before calling it.
+
+Between calls to :c:func:`pvr_vm_backing_page_init` and
+:c:func:`pvr_vm_backing_page_fini`, the public fields of
+:c:type:`pvr_vm_backing_page` can be used to access the allocated page. To
+access the memory from the CPU, use :c:member:`pvr_vm_backing_page.host_ptr`.
+For an address which can be passed to the device, use
+:c:member:`pvr_vm_backing_page.dma_addr`.
+
+It is expected that the embedded :c:type:`pvr_vm_backing_page` will be zeroed
+before calling :c:func:`pvr_vm_backing_page_init`. In return,
+:c:func:`pvr_vm_backing_page_fini` will re-zero it before returning. You can
+therefore compare the value of either :c:member:`pvr_vm_backing_page.dma_addr`
+or :c:member:`pvr_vm_backing_page.host_ptr` to zero or ``NULL`` to check if the
+backing page is ready for use.
+
+.. note:: This API is not expected to be exposed outside ``pvr_vm.c``.
+
+Types
+-----
+* :c:type:`pvr_vm_backing_page`
+
+Functions
+---------
+* :c:func:`pvr_vm_backing_page_init`
+* :c:func:`pvr_vm_backing_page_fini`
+* :c:func:`pvr_vm_backing_page_sync`
+
+Constants
+---------
+* :c:macro:`PVR_VM_BACKING_PAGE_SIZE`
+
+
+Raw page tables
+===============
+These types define the lowest level representation of the page table structure.
+This is the format which a PowerVR device's MMU can interpret directly. As
+such, their definitions are taken directly from hardware documentation.
+
+To store additional information required by the driver, we use
+`mirror page tables`_. In most cases, the mirror types are the ones you want to
+use for handles.
+
+Types
+-----
+* :c:type:`pvr_page_table_l2_entry_raw`
+* :c:type:`pvr_page_table_l1_entry_raw`
+* :c:type:`pvr_page_table_l0_entry_raw`
+* :c:type:`pvr_page_table_l2_raw`
+* :c:type:`pvr_page_table_l1_raw`
+* :c:type:`pvr_page_table_l0_raw`
+
+Functions
+---------
+* :c:func:`pvr_page_table_l2_entry_raw_is_valid`
+* :c:func:`pvr_page_table_l2_entry_raw_set`
+* :c:func:`pvr_page_table_l2_entry_raw_clear`
+* :c:func:`pvr_page_table_l1_entry_raw_is_valid`
+* :c:func:`pvr_page_table_l1_entry_raw_set`
+* :c:func:`pvr_page_table_l1_entry_raw_clear`
+* :c:func:`pvr_page_table_l0_entry_raw_is_valid`
+* :c:func:`pvr_page_table_l0_entry_raw_set`
+* :c:func:`pvr_page_table_l0_entry_raw_clear`
+
+
+Mirror page tables
+==================
+These structures hold additional information required by the driver that cannot
+be stored in `raw page tables`_ (since those are defined by the hardware).
+
+In most cases, you should hold a handle to these types instead of the raw types
+directly.
+
+Types
+-----
+* :c:type:`pvr_page_table_l2`
+* :c:type:`pvr_page_table_l1`
+* :c:type:`pvr_page_table_l0`
+
+Functions
+---------
+* :c:func:`pvr_page_table_l2_init`
+* :c:func:`pvr_page_table_l2_fini`
+* :c:func:`pvr_page_table_l2_sync`
+* :c:func:`pvr_page_table_l2_get_raw`
+* :c:func:`pvr_page_table_l2_get_entry_raw`
+* :c:func:`pvr_page_table_l2_insert`
+* :c:func:`pvr_page_table_l2_remove`
+* :c:func:`pvr_page_table_l1_init`
+* :c:func:`pvr_page_table_l1_fini`
+* :c:func:`pvr_page_table_l1_sync`
+* :c:func:`pvr_page_table_l1_get_raw`
+* :c:func:`pvr_page_table_l1_get_entry_raw`
+* :c:func:`pvr_page_table_l1_insert`
+* :c:func:`pvr_page_table_l1_remove`
+* :c:func:`pvr_page_table_l0_init`
+* :c:func:`pvr_page_table_l0_fini`
+* :c:func:`pvr_page_table_l0_sync`
+* :c:func:`pvr_page_table_l0_get_raw`
+* :c:func:`pvr_page_table_l0_get_entry_raw`
+* :c:func:`pvr_page_table_l0_insert`
+* :c:func:`pvr_page_table_l0_remove`
+
+
+Page table index utilities
+==========================
+These utilities are not tied to the raw or mirror page tables since they
+operate only on device-virtual addresses which are identical between the two
+structures.
+
+Functions
+---------
+* :c:func:`pvr_page_table_l2_idx`
+* :c:func:`pvr_page_table_l1_idx`
+* :c:func:`pvr_page_table_l0_idx`
+
+Constants
+---------
+* :c:macro:`PVR_PAGE_TABLE_ADDR_SPACE_SIZE`
+* :c:macro:`PVR_PAGE_TABLE_ADDR_BITS`
+* :c:macro:`PVR_PAGE_TABLE_ADDR_MASK`
+
+
+High-level page table operations
+================================
+We designate any functions which operate on our wrappers for page tables as
+"high-level".
+
+.. note::
+
+    This section contains functions prefixed with ``__`` that should never be
+    called directly, even internally.
+
+The two primary functions in this section are consumed by the page table
+pointer operations; that API is the expected method of performing operations
+on the page table tree structure
+
+The ``__`` functions noted previously are triggered when the refcount
+(implemented as the number of valid entries in the target page table) reaches
+zero.
+
+Functions
+---------
+* :c:func:`pvr_page_table_l1_get_or_create`
+* :c:func:`pvr_page_table_l0_get_or_create`
+
+Internal functions
+------------------
+* :c:func:`pvr_page_table_l1_create_unchecked`
+* :c:func:`__pvr_page_table_l1_destroy`
+* :c:func:`pvr_page_table_l0_create_unchecked`
+* :c:func:`__pvr_page_table_l0_destroy`
+
+
+Page table pointer
+==================
+Traversing the page table tree structure is not a straightforward operation
+since there are multiple layers, each with different properties. To contain and
+attempt to reduce this complexity, it's mostly encompassed in a "heavy pointer"
+type (:c:type:`pvr_page_table_ptr`) and its associated functions.
+
+Usage
+-----
+To start using a :c:type:`pvr_page_table_ptr` instance (a "pointer"), you must
+first initialize it to the starting address of your traversal using
+:c:func:`pvr_page_table_ptr_init`. Once finished, destroy it with
+:c:func:`pvr_page_table_ptr_fini`.
+
+You can advance the pointer using :c:func:`pvr_page_table_ptr_next_page`. If
+you're writing to the page table structure, you'll want to set the
+``should_create`` argument to ``true``. This will ensure the pointer doesn't
+dangle after advancing. See the function doc for more details.
+
+The pointer cannot be iterated in reverse; if you need to backtrack (e.g. in
+case of an error), keep a copy using :c:func:`pvr_page_table_ptr_copy`. The
+copy must be destroyed in the same fashion as the original (using
+:c:func:`pvr_page_table_ptr_fini`). There are no restrictions on the lifetime
+of the copy; it may outlive its original. Pending sync operations are not
+copied, so they will only be executed by operations on the original. This
+prevents some sync duplication, but it should be considered when working with
+copies.
+
+To avoid a free/alloc pair, you can reuse an existing pointer for a completely
+different range. This is achieved by calling :c:func:`pvr_page_table_ptr_set`
+to effectively re-initialize the pointer.
+
+We've mentioned sync operations in passing, but here are some actual details
+about how the pointer performs them. When a pointer is "initialized" (either by
+:c:func:`pvr_page_table_ptr_init`, :c:func:`pvr_page_table_ptr_copy` or
+:c:func:`pvr_page_table_ptr_set`), it's marked as "synced". If the pointer was
+destroyed at this point, no sync operation would occur. As the page table
+hierarchy is traversed (using :c:func:`pvr_page_table_ptr_next_page`), you
+should call :c:func:`pvr_page_table_ptr_require_sync` to indicate which levels
+of the hierarchy have been touched. This is a very cheap operation which just
+marks the pointer as "unsynced" up to and including the specified page table
+level.
+
+At the *next* call to :c:func:`pvr_page_table_ptr_next_page`, this "unsynced"
+level will be compared against the maximum level in the tree structure at which
+the pointer has changed. This information will then be used to perform the
+(somewhat expensive) DMA sync operation (:c:func:`pvr_vm_backing_page_sync`) on
+only the touched tables. Remember this decision relies on the user (you)
+reporting this status correctly, so always call
+:c:func:`pvr_page_table_ptr_require_sync`! In addition to
+:c:func:`pvr_page_table_ptr_next_page`, this "smart sync" will be performed by
+:c:func:`pvr_page_table_ptr_fini`. It can also be triggered manually by calling
+:c:func:`pvr_page_table_sync_partial`, or the simpler
+:c:func:`pvr_page_table_sync`. The former will only perform sync operations up
+to a specified level, while the latter always leaves the pointer in the
+"synced" state.
+
+Types
+-----
+* :c:type:`pvr_page_table_ptr`
+
+Functions
+---------
+* :c:func:`pvr_page_table_ptr_init`
+* :c:func:`pvr_page_table_ptr_fini`
+* :c:func:`pvr_page_table_ptr_next_page`
+* :c:func:`pvr_page_table_ptr_set`
+* :c:func:`pvr_page_table_ptr_require_sync`
+* :c:func:`pvr_page_table_ptr_copy`
+* :c:func:`pvr_page_table_ptr_sync`
+* :c:func:`pvr_page_table_ptr_sync_partial`
+
+Internal functions
+------------------
+* :c:func:`pvr_page_table_ptr_sync_manual`
+* :c:func:`pvr_page_table_ptr_load_tables`
+
+Constants
+---------
+* :c:macro:`PVR_PAGE_TABLE_PTR_IN_SYNC`
+
+
+Single page operations
+======================
+These functions operate on single device-virtual pages, as addressed by a
+:c:type:`pvr_page_table_ptr`. They keep the page table hierarchy updated.
+
+They are distinct from the High-level page table operations because they are
+used by consumers of the page table pointer, rather than the page table pointer
+functions themselves.
+
+Functions
+---------
+* :c:func:`pvr_page_create`
+* :c:func:`pvr_page_destroy`
+
+
+Interval tree base implementation
+=================================
+There is a note in ``<linux/interval_tree_generic.h>`` which says:
+
+   Note - before using this, please consider if generic version
+   (``interval_tree.h``) would work for you...
+
+Here, then, is our justification for using the generic version, instead of the
+generic version (naming is hard, okay!):
+
+The generic version of :c:type:`interval_tree_node` (from
+``<linux/interval_tree.h>``) uses unsigned long. We always need the elements to
+be 64 bits wide, regardless of host pointer size. We could gate this
+implementation on ``BITS_PER_LONG``, but it's better for us to store ``start``
+and ``size`` then derive ``last`` rather than the way
+:c:type:`interval_tree_node` does it, storing ``start`` and ``last`` then
+deriving ``size``.
+
+Types
+-----
+* :c:type:`pvr_vm_interval_tree_node`
+
+Functions
+---------
+* :c:func:`pvr_vm_interval_tree_compute_last`
+* :c:func:`pvr_vm_interval_tree_insert`
+* :c:func:`pvr_vm_interval_tree_iter_first`
+* :c:func:`pvr_vm_interval_tree_iter_next`
+* :c:func:`pvr_vm_interval_tree_init`
+* :c:func:`pvr_vm_interval_tree_fini`
+* :c:func:`pvr_vm_interval_tree_node_init`
+* :c:func:`pvr_vm_interval_tree_node_fini`
+* :c:func:`pvr_vm_interval_tree_node_start`
+* :c:func:`pvr_vm_interval_tree_node_size`
+* :c:func:`pvr_vm_interval_tree_node_last`
+* :c:func:`pvr_vm_interval_tree_node_is_inserted`
+* :c:func:`pvr_vm_interval_tree_node_mark_removed`
+
+
+Reference
+=========
+.. kernel-doc:: drivers/gpu/drm/imagination/pvr_vm.c
+   :identifiers:
+
+Constants
+---------
+.. kernel-doc:: drivers/gpu/drm/imagination/pvr_vm.h
+   :doc: Public API (constants)
+
+.. kernel-doc:: drivers/gpu/drm/imagination/pvr_vm.c
+   :doc: Memory mappings (constants)
+
+.. kernel-doc:: drivers/gpu/drm/imagination/pvr_vm.c
+   :doc: VM backing pages (constants)
+
+.. kernel-doc:: drivers/gpu/drm/imagination/pvr_vm.c
+   :doc: Page table index utilities (constants)
+
+.. kernel-doc:: drivers/gpu/drm/imagination/pvr_vm.c
+   :doc: Page table pointer (constants)
diff --git a/MAINTAINERS b/MAINTAINERS
index 82b82cbdb22a..7f99999ceabb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10144,6 +10144,7 @@ M:	Sarah Walker <sarah.walker@imgtec.com>
 M:	Donald Robson <donald.robson@imgtec.com>
 S:	Supported
 F:	Documentation/devicetree/bindings/gpu/img,powervr.yaml
+F:	Documentation/gpu/imagination/
 F:	drivers/gpu/drm/imagination/
 F:	include/uapi/drm/pvr_drm.h
 
-- 
2.41.0

