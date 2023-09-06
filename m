Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E457C793918
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 11:56:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EEE710E5CE;
	Wed,  6 Sep 2023 09:56:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86FC310E5C9
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 09:56:46 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3866KYCR026978; Wed, 6 Sep 2023 10:56:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :content-transfer-encoding:content-type:mime-version; s=
 dk201812; bh=sjijGMQLYQ+no8/N0/BDFGbXANQWobBb/adZMNvmdK0=; b=whg
 ovvsozJ35vAypZunCH/DJ0IpXknNjcmQ3Fh85pukGyxqrytOY51oEnVjkVO9e8Gn
 XrDnj2yw4ZHqBAOOjfHNUmNRmZiIMOdYh6U81BnKv/AxCwMmVx4w1lXf4nHK6IAz
 XswS4FqHY6JrfRuMF4uNIYtoVo6PrqqGrMqEHwsV+ZKLODLwLLxKPTmSj5tg3yqE
 k7ypDGVKtxwaYC1mTq02ayTSlqJ1d4hHSQLJrb5aruymWHQ58TY/3Xlz+yerjr1a
 A8YWcynjHBAMIhU7XzuqtRLaXRaF5mhd36MqTt0NWYU25BgXfWLIUCKrrlBkFxSm
 x0+JY0Ww/X6ZoP+h4ng==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3suwpqu26e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 06 Sep 2023 10:56:27 +0100 (BST)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Wed, 6 Sep 2023 10:56:26 +0100
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (104.47.85.107)
 by email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31 via Frontend Transport; Wed, 6 Sep 2023 10:56:26 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HE4gf3wtjohw9e3G+jdAXVYmKcLM8p7ykAKchKpQfXxbefdmR5/gxcgNoeH44Rh7j7UoCX2exyNPwD9mB+mI+Y3eQhnU49XIKlqNMEbUchZcw0+0yKM3rk8WRWRXjAOOycwVfBdJGYY2xbdkRzULTdGGinZdjYVv3zF99AHauPntKGM3Bm2jozNQqOK8Eqz8KvVYNhloc2v2+A1WwTjCnnne1Pio2yqGATosoQnhu2dS5KgT8WGS2rePsENX9iJghfbUFKJGe1hkZ5FkfeV7RN9JeSA+rTwWYpdS7XkdA+odT+ukYNnjDK6q51vuU/XcuSBgmhry/ICzSmmRZQbWuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sjijGMQLYQ+no8/N0/BDFGbXANQWobBb/adZMNvmdK0=;
 b=dWbaT5aIhz1uUMGwQgs3GwFPL85NtvrmmBw3liyM805rMSbT7X4r1+AucK90k81H42H7u/qPlWT+mzEl4Rt9MiaSBUFiCAmWRgBIE16GKSPJhqdNUOJOwWisoImkifSkql3y0+cCpLEUKfDxZtueaMk9p3FdKVgXzUeULez/R7rriIEQ5q7CfOMeYDfDe/qfnHwBGHZUREOwGkrh70OzCAd2E9rUMyz1mqnwVQJg6tJ5lI8XjUbPny1YDd48lX6giDKbpu07QaL0DJZuyBRSiYqyy9CScEnSx6paJ6ANd6PrC80Imvfr9j4xE2RJd7Kvnw3ITjxoUNZeXGTekWuEvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sjijGMQLYQ+no8/N0/BDFGbXANQWobBb/adZMNvmdK0=;
 b=CUcM3F293yx7alHsYMFW5hSk39rvQZh1g5B1mxf2gsNxjja3O9p6y7LshuhlT2kQVo2hn35EITvrj4DbaIWUsLv0EAdRIpDr/r+8PO94S0Vr4Kl/uE622bWlAPj/b6M1mLPMK46ILS0KD7s1lctmXnpxAeFLSefVHf8AjT0veLQ=
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:170::9)
 by CWLP265MB2436.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:96::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 09:56:21 +0000
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::b3c:3f6:e3d0:a81b]) by CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::b3c:3f6:e3d0:a81b%6]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 09:56:21 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 20/20] drm/imagination: Add driver documentation
Date: Wed,  6 Sep 2023 10:55:42 +0100
Message-Id: <20230906095542.3280699-21-sarah.walker@imgtec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230906095542.3280699-1-sarah.walker@imgtec.com>
References: <20230906095542.3280699-1-sarah.walker@imgtec.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0279.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::18) To CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:170::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB4817:EE_|CWLP265MB2436:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ef8564b-6a1d-4887-a393-08dbaebf8618
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +r3XzRXGHSzr4zE3lpEZkTTQpoHeYGtG02ioK8j9nwbNNKUi13qIhKEuoILDBSdKe2WSmOpIML8xrxCOGgCjR0EnOt/SQXfTv0WFay28tNdAmNLMbDvjh6XdcZpY5OUcGD4Hb6mVAGvThB1weRyzKiqDHckVEQ56FdQatXeZIqIj+h4Ov5sv62cGaXnSBJqZ72LATX1lQrvJnKgtuq6YWPxowlY5msgFxSfeu5RuZavnw/CWLDV2CoKR2xv3EGz4+VjDMIKOWCK2xotmeV0mJDZwokSUspFIHfnWPIufW+AwShWfoOEPOx+VbWqC6fnm9mM+ef8bodOn8TICXMlts28DpqwA/QsVSGk7svP7mbupHLTePBYgSG58dpG7PkOotz03n6+eOLSXpgVEXB//TkNrt4SGTVMK3UqFwFni1FoNMa5tNjJ8ncnaw7Hf83Ax4fTWX9WsBvndwtrrndbk93jk7aim7KhLhK/R4CYtDFZKMd6+WdekNIywT1V0DdqFqDLYvnNMwYFrqBzK4nfNBOhhXtwrFfLA8WqRCRX8uV7J/rlV6iH0sbsg489BW12/3NZ7FoMhZin8Ide61p+NduRCG+ZCYXDcF0hv51s9/9y/AML8sm2SdvDxl9rPgbvLKa7k8UUuDpFmrlbQ4WcAPYoPiBqKBv6drKFc8FaK+8U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(136003)(346002)(39850400004)(376002)(451199024)(186009)(1800799009)(52116002)(6506007)(6512007)(6666004)(6486002)(36756003)(38350700002)(38100700002)(86362001)(1076003)(2616005)(2906002)(26005)(478600001)(66946007)(8936002)(8676002)(5660300002)(44832011)(4326008)(41300700001)(66476007)(7416002)(6916009)(66556008)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wxTcU9vM/4tX0yNZBYT5cl4rAiMpXCoEjErVxVwz3JT52B1qJ0jV5Z6etquA?=
 =?us-ascii?Q?GM/EdcgcBf53OdItpjn7zOwwRbA2Fm86iEtw/SjjlQipoV06W1YnMnbgEF6I?=
 =?us-ascii?Q?02INeqRWnSpENaYaOXkgFXh6n7L+twP+P38K1dPGVAFoglOfa6dtvZLINe7t?=
 =?us-ascii?Q?yT0mzc+7Ly95ne+RARTjHjFwnigaKXnzX1T01RM1cjhpRt/TRopAFfdG8Hgk?=
 =?us-ascii?Q?S8ShpfUD6rQiCu+AEJu5YGlIyoMN1Zo38wNPRAwSyIzWTMHhT/rdJo9+3FBx?=
 =?us-ascii?Q?RHBfk/QqzEYY/TqATygZd/Fu8iY1k41jLXYZXov+XP5P8dap2QNGFPkt5EPO?=
 =?us-ascii?Q?rA9DxcLPs+DkY01MEV8lQO6NmWz49bJjkBkiBYuwUMN+tj6X+JN73jmXJ1Og?=
 =?us-ascii?Q?+PN15KHSi7P2yRwoK/yZhyixAvIcEqya/lpBHVRBOsp2/Ihe7A+AIJRd/MiN?=
 =?us-ascii?Q?1rI4Usce97rQaTASkqq2pTKfDiubDEZrjs/10QwFc5r/oXGYeUHDrraH06Sx?=
 =?us-ascii?Q?YhoCcsO0v81DYKnJDzxYoFvW6ILNKLhpKtJmcxyadptuoH1lVulHt0NgFMua?=
 =?us-ascii?Q?6kBnZKHftMeJ56eE3SmJIgtvjnYPmlUgd/SdZaqor3F8taD3xbK4jOKM9B4k?=
 =?us-ascii?Q?Ed3aFgIDjFsQ7AHvv8B6Y3unxOi+f0y/Ne6+6yuUrbATtMfS0TGb6Fh8mZYN?=
 =?us-ascii?Q?ZamVJmKPCpvvi7kpDpuyJo7Du3qBJKOdoL+evE0bhhw/ljBu5TjpGm2JF210?=
 =?us-ascii?Q?rXES/q2BjUqa/zVNqhBPpDZSHIYyYRJDp5vvBE8JOQ8KGj9EttJUDJ6BRCz2?=
 =?us-ascii?Q?0QYYhHbNYwaPboHda14upepDX3AMiuiPe+uXmY2zWPmv66iBwTFwNFMo8pTd?=
 =?us-ascii?Q?QIsAIEfE/5vlcNAOWFYpeIeZ7gr0WPKERDcqqpMtlIUkSWuRJbdvCnGb3Eds?=
 =?us-ascii?Q?CKxvEGdlsbYMppLyE/6tNpHYyjgSdG8g3B57NKs0OIdssufuJ1GOkUjkfSaw?=
 =?us-ascii?Q?mDX09BV4VX6akXFemHp8gA+vxtuCIZvDvsuQDgi6c1DUpr1TQthbzY+5B4tv?=
 =?us-ascii?Q?S/TB3ShycvtMlD/bmpxj5yPWbz7pxSmAswPqd5eevtHmUunt4QsY2AGBlwNQ?=
 =?us-ascii?Q?3/zGDms9UAhIKDjuQpBYV5buZ/b5d5ApEk904FXVDpUOKR2WwNvvNWfkeDYM?=
 =?us-ascii?Q?wcIEuDmPzw2cEWXmtE06RZGvy4Eo5SFqZqYDZYVRaqP5q46Tgry27aCDJbmF?=
 =?us-ascii?Q?W+aUyCMRSW2Xl0qkMY0onDJ1d5q5VUPusQd66RONhrPAU7M2muGRDboenC28?=
 =?us-ascii?Q?cZfo9uTm13M6uYyY6B0LrFzvNjPbau6L31e16yoMteyxLX3kv+2d+45RGCO6?=
 =?us-ascii?Q?4YY+//jI8EAVoba+/4mApu2gIixZvQNrss0rlUP0oEjypRlRpgaLnQNQkDN+?=
 =?us-ascii?Q?LTl4+spKYkV1YTtqTQz91eB6K1OcrqXzQN6PQs7pXNLoHuBlOb20AvstK0xZ?=
 =?us-ascii?Q?zAzmi4aIs3w+x2qFLrdbs6IM0boyZLi2HZV/vyuNOnZUyqyS5aQDrzNSq5ov?=
 =?us-ascii?Q?z5yb8U7EGG9TRma9V9TTBEnVJNQLjiWgXPcZxorvYP7/s72nnqDYY5XQ+CSM?=
 =?us-ascii?Q?xg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ef8564b-6a1d-4887-a393-08dbaebf8618
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 09:56:21.7207 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yE4RCTrBpWEuI6yzqX7w/3R81pygKSkFEjrnGW3af/X5XFfSigtl1l17fls16CpLN4PNIXFBOiZ/SWymulwcfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2436
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: AuFekKQ_x9o2OrnGp8rp7eRcU_t6e3iD
X-Proofpoint-GUID: AuFekKQ_x9o2OrnGp8rp7eRcU_t6e3iD
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
 matt.coster@imgtec.com, robh+dt@kernel.org, faith.ekstrand@collabora.com,
 linux-kernel@vger.kernel.org, afd@ti.com, boris.brezillon@collabora.com,
 tzimmermann@suse.de, christian.koenig@amd.com
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
index 9b2144511a5b..89a9c32cd56a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10146,6 +10146,7 @@ M:	Sarah Walker <sarah.walker@imgtec.com>
 M:	Donald Robson <donald.robson@imgtec.com>
 S:	Supported
 F:	Documentation/devicetree/bindings/gpu/img,powervr.yaml
+F:	Documentation/gpu/imagination/
 F:	drivers/gpu/drm/imagination/
 F:	include/uapi/drm/pvr_drm.h
 
-- 
2.42.0

