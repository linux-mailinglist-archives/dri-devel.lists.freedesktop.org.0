Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A56E47F4D99
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 17:57:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3306E10E699;
	Wed, 22 Nov 2023 16:57:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAA2410E697
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 16:56:53 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3AMG01mA020623; Wed, 22 Nov 2023 16:35:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :content-transfer-encoding:content-type:mime-version; s=
 dk201812; bh=29VnZyKrx6FzxdItxhHmlg0RxGYggTpD6CaxDzKxDAU=; b=BGe
 0t36Cw4iQnMZCJNUslNHDEqHCV8yZm5Je+Bh+FQK7qFhc5ZUHxaOMx8b/nzIMBja
 WQmpv7lhSVx+D+mPBkwlndlM9fMGVzOxfdP+L9T0JLcLUw08QT2Q5/cKN7EPTz3I
 UvLUDLpn66iS2k+e26tCvFdcwlnbHK72di65YCDGXO04gIOVFyAeNIBn25p8Qh6G
 45SEzKJswR6T39NvaIkbLLRMYt7pG2y4heptGGJN65E9m2F/b/zd9JL1i6xQUVcM
 RACt9U1L2xybkw/xLXwFxqSfkL4qkwakcsE2ZYX/feVFxQq4zfXCqoX4muMOfUVg
 0Qh4soOhUT0gOP13ITw==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3ug99gsf3d-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 22 Nov 2023 16:35:33 +0000 (GMT)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 22 Nov 2023 16:35:32 +0000
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (104.47.85.105)
 by email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 22 Nov 2023 16:35:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i3lhwbZOo3QMN8gr73bLwNVlr9ts+MBcTYqgjRWHYDceXl21ObvVMHYyeVxuFwHyetGyhWOICLW8Ra0TK1ASymcxqujgeROtOZfNzMx2rOyJsAMyl4hw2VWDYpAV5b+saC07hUjgKOJDr3QwhYNb4B/7sJoEhaKh2JBk6IB1TtiWhVzFJAInRYWl7MUcxoqu8tCipcTzNvv+tU0o71BJ5gdvpaBWhl3K6rKKP72+NJxg337koHcPv5nqG5ma0EZOVjz58rVVRyvoJ5Rm1WWxyu6jwGsWrt+K050WVj8b511NFD/VDy16Crq9LzVOi6w0TRtEawlAWFeAC5Bu7dXopg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=29VnZyKrx6FzxdItxhHmlg0RxGYggTpD6CaxDzKxDAU=;
 b=VSz/pKy2e7KMKblDOxeWDXpOHctUxrDJxmnSYI3LQ3aCB6KV56YvZBzGuA/YDb855phvEPfZsc0ePq+ymY9ElnAIGG0Y09eKXcLUC7bU9yJGG2KXXnWY/QKa/dotpHn4VRwnoVdxxwBGwcp6pcIUEq8hho2T/yGImL5/wEO9SXdpcwKKo4SKfbXQqb2cFy4woxnWwOic+NVRQukNWJpjI1a3VP2/qsM1Z7URCBfHJU4kf3MfzFRJZ7TsqHBXjftNSk11BY9ej+BfT0t3RwnVF1tzbAyZZd0YE+hMZ/x2SRX15rWBeFvz5gvl/eoc8mR1v7DvvpRJCgqz2v0isZ2jZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=29VnZyKrx6FzxdItxhHmlg0RxGYggTpD6CaxDzKxDAU=;
 b=EfTBpFV5W65NI5imUdkKTRYcbXSN0gfu06Mc9IfqzUwrrhzVZ2F30LY6XhmBpYdS6rtOOsxEo0dvIOejW4FtIQb84oe1i7GLOgC3k0aESzvhcdkqkXRTYlSCMsYYSFmlBbt+OlVz4m8TGdLrpGUlXn9ExcNfUEqXeTjffCdg7fA=
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a0::8)
 by CWLP265MB6864.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1fe::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.19; Wed, 22 Nov
 2023 16:35:29 +0000
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34]) by CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34%3]) with mapi id 15.20.7025.017; Wed, 22 Nov 2023
 16:35:29 +0000
From: Donald Robson <donald.robson@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v9 20/20] drm/imagination: Add driver documentation
Date: Wed, 22 Nov 2023 16:34:41 +0000
Message-Id: <76a7b18cfbe93066efcee3311ae795176ce7c65d.1700668843.git.donald.robson@imgtec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1700668843.git.donald.robson@imgtec.com>
References: <cover.1700668843.git.donald.robson@imgtec.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0273.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::10) To CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:1a0::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB5770:EE_|CWLP265MB6864:EE_
X-MS-Office365-Filtering-Correlation-Id: ccae1df2-facc-4d20-47f3-08dbeb7909cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: twvTto/U1a3vwVUjK/eNHYyNB+HlvizTeBRtKDGooEO+dQEXCawLPQi1LxsiuocmkcL2vSVfd1qDqX0CT/JXbKf69VJHPNNnsBLTZoSe0CDXm5zb7F5RCrtCAffxXqIGi+RjF3Aq3OoUsfw1g73TRt0cXjcGMtPGbOtZD5z7qm+bA61gKaJwY688i2DswsWgr6HmETwWkF4fiRh80V1YCqciLiSfHHBLICY1cximpckaG7OTAmwrw9RUBrPMyC5UikZNj3zkNepw0Uj5kmkEfODtQbNrcHcsEvZU6ebEY/DBgpS7zbbkoT4pts0P3t0Yik/wGmCbyR13TO3j43bUcOLkD37BkK+/2h1edaBnnV1xDo/NnfhfcJTXUqtbQXIXd4QC+81Y0wqKItRACCj9YgxX3Lp0yv9MKokX/1pI0xouaMHPa13DY0bMqFhL1y/HScK2pHze0ZCQFybLj5AIVBTXPL/Rhi86lTP3OkXv+LYXbqZiomP2yonK6FRBW73+Tb1u0g4ozLrM/ZJB7o92OeYDwg6IG/StDEgQPbK8h0BbMmpIhFvJycLeFOoQQoi/AtBvY0yKY4K2KUbVom/EPmzNwQZ8ydJvWcZy3sknxLm6VW8lbmVC5ZeYEkoBghT+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(376002)(346002)(39850400004)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(52116002)(5660300002)(38350700005)(6666004)(6506007)(6512007)(2616005)(8936002)(8676002)(4326008)(2906002)(7416002)(478600001)(66476007)(6916009)(66556008)(107886003)(316002)(26005)(66946007)(6486002)(44832011)(38100700002)(41300700001)(36756003)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KQhpw1pXXaazwT/PWjQEyQty6zb+dwuY3ctmyS0QG04KxTqkHk1NZMe/OEII?=
 =?us-ascii?Q?tBxUBvfbXfcb0jqKoIYc6d2SDMr8D1E2pj2lqix+Rpl8oMa0U6nc8cVPOyRB?=
 =?us-ascii?Q?nTPzKkaf4PctPMchFQkG3t9NkdXGorj+VEbbW/JCrzuMF3BYfUwDAuPOhfk3?=
 =?us-ascii?Q?ioPhJBhfLhLCpGZeSVG77+QKdnGUWl03CnNNlhX3X1pbcpT4XEH93ieUwbSe?=
 =?us-ascii?Q?xe6EMnvg3ZBfAjg5bpKstaQFHxrW4RK+iie+Rh7VfgOBqktp8khy6JhlPmqB?=
 =?us-ascii?Q?dMdwrMKgyrKWMud+0ryXdTse376GP3k4xiET+ivEQzEOXBgzC0wUDTC4az9o?=
 =?us-ascii?Q?NyMomBm7iBhbec+/vKcmzmLrLjjMZL1u1UiIoUYKZaZwTGmZzRx8vEokEIGb?=
 =?us-ascii?Q?zxOBbcHsqH8H0CYJJHq/U78dxlrt/yraFRPKqxzcRnLMl2u0T/YQfE+yjEra?=
 =?us-ascii?Q?0EEDYFTByJamdbwwAaJG0qVSiXdXaPoteRNLw5HFdAIXJxbaOpgL18t6pe6v?=
 =?us-ascii?Q?J6tzpXIP/AzREPjSfJrgHd7gXDAapoi7sEhvnpBkfeA/M4AxwXMq+o19hkjg?=
 =?us-ascii?Q?Nj7Utcdii5zhnW9GY8leER7i4QEbFtILrkoF/1T8YUVIZBoS9RAjSIdjUmvh?=
 =?us-ascii?Q?Cd2uv2n1Dvh+KDJXjgi0Uosfr0BcSf1MeSrYboY3+wrpyDLlytxklNLjLXw5?=
 =?us-ascii?Q?aLFAyJWRmgNhorMgzXkYjgUSsaKO/4K6k/OEzbOypvwxi+va9YBAqGZYxuVR?=
 =?us-ascii?Q?vmUNWQadsp/hjfAEMNClk8eWjkDjTVehSjorxU3mXQSPPrDz4MHQtTH/ylbd?=
 =?us-ascii?Q?AKXvGuDe9oJ/azyY8AX5/kzn1Wui2XtpqvYeAKvhwRRyjGyPqyZSwVXzAYJM?=
 =?us-ascii?Q?oVOJmNkFkdhSYlPx8RB7kn6+MIw11q+XwLi0LX/ulrlqcI9q3opmEFYnvO5T?=
 =?us-ascii?Q?1Ar6FFc8Fweu46/X6O1PUX/1+XbirDYibBYGQeOTW7pVRCm38olC6jw1gEG8?=
 =?us-ascii?Q?QzzbfqcP6XYKFEPw78GLjIQLLs9ckCRGvnab5j/n7H5HOQLfLzW2zxuVGGmg?=
 =?us-ascii?Q?JjUKzmkOgw5F9BfwE+WTt/TuLuh+EGJZe06TALdpy0TvPZmS8Ex6hGkwg0PV?=
 =?us-ascii?Q?zy6ieUQzmwOfOwD8HlDLqa7ihYINA7PeYWy8VRGMp/wKOWATJonULPz0ZjlQ?=
 =?us-ascii?Q?9DT80GaDX7Ga/KZDGjhUAnRUbmB7x9AFAUdzt+71wvBufGoIBRHCDS4n+Ft7?=
 =?us-ascii?Q?NMPHEXLcdEKArRRii3B50XyNvFNGXYUPZjP4PidqsdFVtiJualahXN2VJeJd?=
 =?us-ascii?Q?cr61hqsQAxDs1LMoJAbJH/z91R+mEOSB6H9BHjc+rpjrysGASPA7bASP/R6s?=
 =?us-ascii?Q?xDSMruqxmgu6sbQ7q9B90yFK6MX2TjGmhmmbSbJOf8YLQFDmcyQHOFHSlXb6?=
 =?us-ascii?Q?9cjUmijVVp6vZfjHYmmXJ/kG4LkcaWHsKkNmpcckZsEyLPjUB1gvo5Bq6suy?=
 =?us-ascii?Q?xdJw/4SF6neVsnIHoW/A5/CoXbOpYgxfo30qxigi489Sp+LBjACDE4fdmmaB?=
 =?us-ascii?Q?eesa7W8l36bZoylssqRkGfXRkCCpdTfv8WjlvSsgLuVoCCYz2gaE1I2Xtkhs?=
 =?us-ascii?Q?pQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ccae1df2-facc-4d20-47f3-08dbeb7909cd
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 16:35:29.2162 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r1bnNmhfgSicV0RTifU0N01oHeBs23nX6XNL8ErteBHy9igLxwWQGaH3cLZw7rj1nVo6ppBunZ1axDyt1pA6CW/nDFUrwcqWe5plFeAlk20=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6864
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: 6SN7h277s9s_anW70ov5GjkJmZOQChtn
X-Proofpoint-ORIG-GUID: 6SN7h277s9s_anW70ov5GjkJmZOQChtn
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
 luben.tuikov@amd.com, dakr@redhat.com, devicetree@vger.kernel.org,
 conor+dt@kernel.org, Sarah Walker <sarah.walker@imgtec.com>,
 mripard@kernel.org, matt.coster@imgtec.com, robh+dt@kernel.org,
 faith.ekstrand@collabora.com, linux-kernel@vger.kernel.org, afd@ti.com,
 boris.brezillon@collabora.com, tzimmermann@suse.de, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sarah Walker <sarah.walker@imgtec.com>

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
index 45a12e552091..cc6535f5f28c 100644
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
index debbc1956b8e..a6d8a15a23dd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10398,6 +10398,7 @@ M:	Donald Robson <donald.robson@imgtec.com>
 M:	Matt Coster <matt.coster@imgtec.com>
 S:	Supported
 F:	Documentation/devicetree/bindings/gpu/img,powervr.yaml
+F:	Documentation/gpu/imagination/
 F:	drivers/gpu/drm/imagination/
 F:	include/uapi/drm/pvr_drm.h
 
-- 
2.25.1

