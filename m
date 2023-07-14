Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F10D3753D70
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 16:30:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DBD210E88D;
	Fri, 14 Jul 2023 14:30:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0860B10E88D
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 14:30:51 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36EBU21G000769; Fri, 14 Jul 2023 15:30:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:content-transfer-encoding
 :content-type:mime-version; s=dk201812; bh=t/7mEI2qkqxAtT7vT3evh
 0CHr4POstVCROC/5rKrARY=; b=PQKZXRc+ggEAnHKxHS39DvYAVC/65Ghdsoqqj
 bgaoEEhr81x2cIXUhi2drYriHVAwo1Vpez+URcbDSLlpINXMbdNv9/whsEU6CTcX
 Z8ST9goFLBWHX2L7c/dcJQzfLeoePxYkDgkI7rlQmuGXVoPOAAOSXym5Advb68i0
 y+X0m2fNy0m4OlcnHDHVg5C4swH3uKg0YN/wf+CoSJZIB5q86HmPesd0vL0olKMS
 0OW3ZMs44bluBXWy4GR5i522fQR6CRCCCairEv660rIr0gM/4p44EJyhGqEBI07i
 H/bbpqMWFB2IqxZ3Vx2xyMNT/vREoK0DFDvg4A9/jIvc/PpMg==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3rtpu8gmfq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 14 Jul 2023 15:30:32 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 14 Jul 2023 15:30:31 +0100
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (104.47.21.55) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Fri, 14 Jul 2023 15:30:30 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QMjNsiSJEZmIQweVgxricB2qhJ+MvRlgep/UBhUAiWNnm3pNHPufIU8/QqKqhwKL1dTZCDlGvGfXBov6HDn3QeQzr4pPldDjHfe2iUWP1rKgbSd9ZydLXDbfsyEPQfZX5aJwm4CuvRZDaUFpne2gvtfxab2Tt+t5o7jvt5Imcw/HZr8mnhZFrYfxX8veC14borXVwk2TAtxJXtfV5PyxYXqcRtnpF6OO3Kb0RsV5jUSdiy0vdBx1gqhB0iA691OmLgWteW89WUvFAAbSHaPzBc8egvy3YQ//gZTOeGL9QfUmCdKjIGXt7ZDbElcsU2dTRw0L38JV8WQcZibN5xbsUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t/7mEI2qkqxAtT7vT3evh0CHr4POstVCROC/5rKrARY=;
 b=R2obJjeiaJmgBJtk+fhj9/JxRwKRkuXQ28KAsubnyNtJrCwTdweFWCtelKVeTpGVfTWZUdcaJJr7UXFEg7Fhfbr6ri6KL+7kEVkZpXGZdMiF9erzG5bQpviB+9n4TN1ObqmdBwk7+ftcNCeCzZukutRPjzPj1WWPznOQiv042Ev5vhAb3zjkbjkAu/+r/ldGE2vHQXaEF3YlEzOQJprYOKaoTvzupGoZXzke64PS6KkI6hNZUfQJvJKPK2iqpx9jMesqHSi1CpUpBzXxQpw+u51bemE6FeLT9sjLUTVQJAQs5DOrZdcqdfXFUQoLLuGVV278Lgt2Hfw2IM+BeGuk9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t/7mEI2qkqxAtT7vT3evh0CHr4POstVCROC/5rKrARY=;
 b=YQ/lTJPrwx/PyeE3iVxOY49jr4pMdGLyTPIs2Orc2btFeDDufN/8mwCtB6cgizhZVTM25FpXNDTS7Wu37RPUYp6mcf00usv5szF/o4EroeZ0PMKApkKXAUcLGkJnqeTU5+9g1tVVFGz44BfI+Aw4lhrdfx1fMk+opyOcHCxBKxk=
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:170::9)
 by LO0P265MB7123.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2d6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 14:30:26 +0000
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f042:5122:eb28:4131]) by CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f042:5122:eb28:4131%5]) with mapi id 15.20.6588.027; Fri, 14 Jul 2023
 14:30:26 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 16/17] drm/imagination: Add driver documentation
Date: Fri, 14 Jul 2023 15:30:15 +0100
Message-Id: <20230714143015.112562-1-sarah.walker@imgtec.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0695.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::20) To CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:170::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB4817:EE_|LO0P265MB7123:EE_
X-MS-Office365-Filtering-Correlation-Id: e649b9e1-84f4-4e20-ebd4-08db8476ddbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gBqc++lj3UXnWZxJFr0oAlR6mye03uMGxwbNMFsBa388YV10P1yZHh089DSBCejgia4LHSSd6iAqHEPe09vHPvbu73hgL9hRIGwmkEO/IVhk5DejFs2WipB9DwOe8PbIejvt7geisqnOGa7x69ywtEukb/oqcKgdI6eGVxwbSkOEUYkU63xAtZ74HgMEgqaeEHscPUcesNqrMsKJhcE31kgN1HDEhhAyQARsebjkqTb4USh0vI6LHyV40ggCtPTzJPxPp3TOWtzM1PJc2QLSnKYyUCqDwiPZ1ldmtY7U+/Pc0vRUFJI/jDGAgBHphxHzW+r6Lk8JRFOP2huf7ohmUKjlTFJ69fgVrJ3FMW50VrUm3wCcU42wQldpRPnZsMZU05QJzBlrTbWkzDktA73m6q8V/a9tMCFXyQ4TL88VVpL9qYMG5NuXAH+pSGDo80uCSHpbMCvO0edyhlMz/NBJcB6Ftz+2cyKu1vEZUKddznGWQS9rJQob8fgLDRsd1P/4t3IKaPsknOAOENGcB0VW6mR9xZ0mMhqZ1eSwbqmYbA0CY1IWxF8bcYs3Ew2lkRCp2xJhrhmhGmItGefJP1m5ZXyQO0KjmXTdPZojvntzs75bnBkjHtkiK+noA4FGZDC6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(39850400004)(396003)(376002)(366004)(136003)(346002)(451199021)(6512007)(52116002)(6486002)(6666004)(83380400001)(186003)(2616005)(36756003)(38100700002)(38350700002)(86362001)(26005)(1076003)(6506007)(66556008)(66476007)(4326008)(66946007)(7416002)(44832011)(41300700001)(6916009)(5660300002)(316002)(8936002)(8676002)(2906002)(478600001)(30864003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Hni6LS/CJAjTwN/ScpOh8I3Jbn9Lu3tFblDD73/DkLgimvom9QeaqxAnoI9u?=
 =?us-ascii?Q?PTCSjz8M9TAf52R90ashvwrUxmyx9NWSBdd1VQUC6JaBhYpLGvAP6/LvLQN9?=
 =?us-ascii?Q?FyHTTaxeXcBlITBsoRvSiIzJ7dDsEc1XAeCUHrQkpPSLqa86oDtcL/3qOHZ6?=
 =?us-ascii?Q?muj9kNUgeAtt5xDdLbXY9G00kox6Ju9rLRTps7oifiwPrWvHEYikKOUjZ+YQ?=
 =?us-ascii?Q?Ei8LwsG1yROsB81dklEpUvwDqwCGtORfor3dIupzTpxrwiphI51qLFJhyxYr?=
 =?us-ascii?Q?xmGx37VE/8/fcm3RiIC2O7Glb8a/NQDdDfs4lIgIvNKdNDoosamGkuqdAen6?=
 =?us-ascii?Q?HUrvWNjZRQjuznkUVIxTUJWLk0jTAN/WUF2WndC2dRfefp25L+jDiGw6mnaO?=
 =?us-ascii?Q?mlQPjGmpCjy6dHyLcu5Pn/Fv+G90JxOjvCPVUyNjGt17HX/UGweW+3QeLNkS?=
 =?us-ascii?Q?8EwiLNvbEhnDDiawE9XabaB/NB5fwFNFyWe0gicft7b9+4ClNiHQHWRX2eBC?=
 =?us-ascii?Q?77PdJZQjwT+WMEZvjH3Su6EBbf6FUm2YhTfcJdmUD7eTZxHHXtzCbS3YFXPh?=
 =?us-ascii?Q?suU6CbvWpjjccwQQdBD0xTWccujo6YF9d/v0PHZwQTg0fq/Qye4xXWXYt23I?=
 =?us-ascii?Q?Rz+Sw2lsvshYSnDvxrDg2XiPeCktbHwxY2J7+fLEHTTbMK2MxUfzzbOAI/+b?=
 =?us-ascii?Q?iN1dLn4boX6cgKXtb1d7ZmYXU1fVqzgl/tbcDYtyzq2WSeTaftr7ezOLRP9v?=
 =?us-ascii?Q?Mwc2/J0561g/fuYvgtxtUQstt8Muj54cDnmOM7UggVyQxkW7ypj53rW8YlLP?=
 =?us-ascii?Q?finw2ZpbTAI+BEXIW+K66rhDUZrkt1UktZTSPQ4tNvpquw/cWxBHC+poNmeP?=
 =?us-ascii?Q?RF5DYzIGQM9aOiKcr+FzQQCYvCLGWXZk6IaZcgsGzCiGTGzdiVjReqJEUNRr?=
 =?us-ascii?Q?MNvWaRCSDcMZ/rGieWT+lbA57wQStlaoS9n/I158am+jcSthvv2Tq/vLwIm5?=
 =?us-ascii?Q?kD7UfLvjKQIeXTheiCuhYsmNiEaInCqPwimvJJUXPw7YJtdi5p0hLd4ROkKV?=
 =?us-ascii?Q?VrXfvP4uyVtqc2u0PA8vYsesKwdHea1CN5xLOnkHyEtrDKzV6ABsr9QseeQa?=
 =?us-ascii?Q?u15VV/lCPn67111gQn0IkJq2nU9+tOSDs3jdif4g/XXLwStxpwUswAJ37ZY6?=
 =?us-ascii?Q?DcpUw0aGYWRuW4aNS8cZMswzBuizp2kCtlH9/yZ1t9OtWYEpvUKDH7mKBJEy?=
 =?us-ascii?Q?j8fqQ3R6TJaJ7+8zm+12E+0F4nvXkMTmBsWoDqeDo2ClpEp6JtG2ApeQwspp?=
 =?us-ascii?Q?hANzhDdIDlG78s/EGHXrnVoaPfH45vUQwMkths6r5TUtLKM1UgwR9XqY3v0+?=
 =?us-ascii?Q?2I34x+po4cRPuBs2q/B6Bh4eRI2Gxf90bYv4dJA7f6uxI3X8Zvng/nxHwjkJ?=
 =?us-ascii?Q?OFLDvIFj1VDHdvJQSUB3/QfzvRwZT4XN7a4n5KZo77wf4f+0GXlADw3qfFTe?=
 =?us-ascii?Q?GXdDXwtcoXT7lc7HRfOzGYFg3/K4Zck2aauzYydWX23WpY51w1kybZP0FG2C?=
 =?us-ascii?Q?hSRCNfxx96WUIgoj0lE0LbWtyeYrvns8nY+dZ2obRdKzmUPQPTVeqdcrnsPe?=
 =?us-ascii?Q?Pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e649b9e1-84f4-4e20-ebd4-08db8476ddbc
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 14:30:26.5778 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BnCjECkNncNCf5aHhwGreYzsgFCLvM+ofZl/c5FKeuqegfvrKB8Nr87+NQ8I7eblJ2Ip1t1szGS3OmiDcdizxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB7123
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: pG9sPZOht8xxsF3x29vcC9MLdr8irqto
X-Proofpoint-ORIG-GUID: pG9sPZOht8xxsF3x29vcC9MLdr8irqto
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
 corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 mripard@kernel.org, afd@ti.com, boris.brezillon@collabora.com, dakr@redhat.com,
 donald.robson@imgtec.com, hns@goldelico.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add documentation for the UAPI and for the virtual memory design.

Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
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
index 9371dc92e6b5..f7539924d486 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10105,6 +10105,7 @@ M:	Sarah Walker <sarah.walker@imgtec.com>
 M:	Donald Robson <donald.robson@imgtec.com>
 S:	Supported
 F:	Documentation/devicetree/bindings/gpu/img,powervr.yaml
+F:	Documentation/gpu/imagination/
 F:	drivers/gpu/drm/imagination/
 F:	include/uapi/drm/pvr_drm.h
 
-- 
2.41.0

