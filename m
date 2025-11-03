Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E274DC2A6B6
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 08:54:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28AE910E37D;
	Mon,  3 Nov 2025 07:54:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="MSjKow7H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010012.outbound.protection.outlook.com
 [52.101.193.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC5E110E383;
 Mon,  3 Nov 2025 07:54:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I/GWCETAiBulFC5TV74ZUQI3NBssLdgGa/zsHhDpGYYdCGOqW1fjp+2fxPxj3XaA0CiNEsCqeknaU5BwhP4X4KhP3JZhkcT2rMDjJI37YtZsRDpPfrAoiY99/J6vfLhOgTOyMccxblriKl1y4zwqk4v9+wh4OqlnVBqX1Rpco+q37NicKNWKVwbw1r081ftLQrCOLOusndEIGsePMqsGYjYT9odF7lNZl2kdfA5S39a2JwJJwW1yQrNRr+ktcXq6ijimFJXYi3P0ekLCY9y/5+JbLXpypGLyYjqNREb7gjra/zmMj5C6R5EcAZikLlwYTj/fpIJaNBhFtmZzN34z+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P45SyX+S9aeJckBLwfrZZSIMp/FztSN/rn5FSYdZdR0=;
 b=cpmoniU8xI5V/Fnc+xfXgmEiJMcp0sQ2Uc0yOLZAYNEfD6HmYPSwvwBlRr2nyM9SBfhcJ+lW2M92cxe091POji8loqkYiQ4O5V/CAy9Uv+fq01ZWz8wA3N//vnfx3IhEMENBTTBM27aKhjMyPnMZAaLoLQI376WzQmx536LMNfq/TB+WLMDwYjiWy0SDhuGXqXQ6Jox9P4neqfXGq3Q3ADSfFv5+4zL+BACvJUqyq5l/QnJFU/kP3gilY7UqrTYipm1TcHlBHV8eZ0UcZMPyrKDRXx/SUtMEC4I+K4LML0itJLyukC6uWO5fJlPdFh1jcojpA+36diY3L921ls9wQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P45SyX+S9aeJckBLwfrZZSIMp/FztSN/rn5FSYdZdR0=;
 b=MSjKow7HYiGCG19yW5hh3+7Y/loI3v229L+RIQcLNRn/nDJPJPeJ/SNMXxR5o+86oevfVSszhbGIhMYuOvd6IzhA3mf7bGCJr5HPMeSMAzb65+zQlTTBTTmTKGts69dUTySvPETVLicI9ZjQWaqirjCkAZxKB0y5JXzF57q2EVY=
Received: from DS7PR05CA0021.namprd05.prod.outlook.com (2603:10b6:5:3b9::26)
 by SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 07:54:16 +0000
Received: from DS1PEPF00017093.namprd03.prod.outlook.com
 (2603:10b6:5:3b9:cafe::9b) by DS7PR05CA0021.outlook.office365.com
 (2603:10b6:5:3b9::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.7 via Frontend Transport; Mon, 3
 Nov 2025 07:54:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF00017093.mail.protection.outlook.com (10.167.17.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Mon, 3 Nov 2025 07:54:15 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sun, 2 Nov
 2025 23:54:11 -0800
From: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
Date: Mon, 3 Nov 2025 15:51:08 +0800
Subject: [PATCH 5/5] Documentation/amdgpu: Add UMA carveout details
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251103-vram-carveout-tuning-for-upstream-v1-5-17e2a72639c5@amd.com>
References: <20251103-vram-carveout-tuning-for-upstream-v1-0-17e2a72639c5@amd.com>
In-Reply-To: <20251103-vram-carveout-tuning-for-upstream-v1-0-17e2a72639c5@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>
CC: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>, "Yo-Jung Leo Lin
 (AMD)" <Leo.Lin@amd.com>, <anson.tsao@amd.com>, <superm1@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2809; i=Leo.Lin@amd.com;
 h=from:subject:message-id; bh=qCBX8mmzd8QBvkys4Z3v211HugS1s3SzrXl9HURiq6s=;
 b=owEBbQKS/ZANAwAKAV8XsZZKKe6GAcsmYgBpCF8MzGvkI+THYq3CQNYbycQoBkQ2axPjbG02L
 wUjmleGfoSJAjMEAAEKAB0WIQQzqV4kW+yguuqHrw5fF7GWSinuhgUCaQhfDAAKCRBfF7GWSinu
 hqt6EACkM3KtVkKdLDxifZuLs7SNq52Dnhyi1x4eOqoLsKnq82g+z+sbgl2DFWSbYWRVSPJVf+p
 OPBIY6RWh9hmel/vKf+/aXunlwfFR3/2+K2MoqPmEwWcpx+5hgqjOjNVgTj70RQm/UhvF4TmUwY
 ClLERcfuW3vof7G/Tb2DbIjHvH+XRrffl7v3fmwVTqm/sGnZtBQhYeWaaC7ndMXwt7/S7sW1hwZ
 fOT6KSQy5Nk+oz3RLz9aHgFkKoNx6kpcDruxZZeDHdK+PBknWNU+NMORHvxNJUilyLqa+wj5Ro5
 V/lzMjvL9FQdy5QnOKilt9ppq2i1F3/jB7QDgvInG3p0MPQkHy0C27ceq64rnPP69wI5tdtW7NZ
 gJaAUHL/9B8oUA8Wvqg/K0JtsO1zFE5DXw6yCZa5L4EPIKKGYm1yvIBbOw7mYZ8O+rwDcDFX7iP
 y3kNqpp4/+U2NyziCBTfFXfiZy4HQPsU5rhqrjDb5LC+ST+eIQn1GeXUZb7mhFVsczsN1Z6WLJN
 3hqMVhfL26a/n62Oo2EBOXWsB/W89i8BXmjeyxvBMVltbuP8p9emyQ4MLRA/EqETDtOr63MiqGa
 XrJIkCsUHvNltKCj8mOTSF5y1e5t2JsCLi+JtEwvbXr7bIlTPUS4b4+tMDPMdQ1MnYb8cmOeHlu
 1XNSYsTYtEBDxHQ==
X-Developer-Key: i=Leo.Lin@amd.com; a=openpgp;
 fpr=33A95E245BECA0BAEA87AF0E5F17B1964A29EE86
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017093:EE_|SJ2PR12MB8784:EE_
X-MS-Office365-Filtering-Correlation-Id: a3335280-7cd3-4537-ceb5-08de1aae2f5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NmorTUtOajZKK2c2Y05qbldkREEzUkhJdGE0QTR1VS9CU25lNVFVSzNBUjc0?=
 =?utf-8?B?ckgrbFZJeGJkNGM0NXVwNm5oTFdqMXd6Tyt2UVRxVUZJUHVpcGg1WTVBeVd6?=
 =?utf-8?B?ODV5ZEx5Mi9iUzV0c1UrTzcxS1h4aGFBZUcyNXplSDJERktIQmRYa2ZneGJx?=
 =?utf-8?B?S3VpdThUS0JVbW1VOVVxTS90Vk1lSVY3N1U2VkdqbWtWcmg3THl5cGZUOHdZ?=
 =?utf-8?B?bEdJOEkvWFhkN2g4L25NZ1l2VWNGMVVaQTM3S0FRc1VKUHVTQVFTQ0hVUEMx?=
 =?utf-8?B?VUUyYVl2UDM5alYrbUhsRmhyMFUvYmlOZDlXdjdwNG9XSFdoM1IvbURWU2tV?=
 =?utf-8?B?dXhkajF5T1o3RnM0R240dVl1c2VCMDFzKzBrL3VnSjNxRG1vVEdRMDhYMTVF?=
 =?utf-8?B?bFUvWXcvV0NMT3ZYQVlGQi83QkNRaVFreklYV2NhUEYyM1hMS1hrNlVnNjlZ?=
 =?utf-8?B?MitaQ0tqYklqaDdjSGI3d2NqcGNESDNhTEFZMTJqS3VzSkZYNUZSY3ZzdGU0?=
 =?utf-8?B?ZElvMkhYR1kwbDBnV2Q0VTk4bXRPdXhNVCtLbGxLeHlxVWZEazJTT0xDYlhU?=
 =?utf-8?B?WXhwcFNMaVdXRDlqOUxLbEFQUEk4SW5Ydm4weUswZzRwZWRVZ1hRUVoveEJK?=
 =?utf-8?B?emMrVC9Nd3VMb3ZIVkd5ZDY4RDNMYlZGM0k5Y3MrWkhpcjRnTkxlRGplUFBz?=
 =?utf-8?B?UVNUTXQvc3JqOFp6L0VIaVNvbHlkalBvU1dtZ01ZbTRyRDZVSUVJT1NVR3Uy?=
 =?utf-8?B?RFFZZ3lUelhESFhncHBCS0pMZGRaa2Z3TnM3TENVTnk4bTUzemVBSk43UE5J?=
 =?utf-8?B?TTRpdVRkUXpUalJvUm80VlNtanRwMTNONTFRbEg2RElsMWRRS0xBNDdXRFN6?=
 =?utf-8?B?eWVCdXplTTRNMnFZazF4SzVnWDlyTXczNlg5ZStTd3dlMkQ3UGZOeHlBRURC?=
 =?utf-8?B?dkdNVWpkY21lUm5jQUo1VVY3VEx3SGh4VHRvbExMa2U4ZjhnNnRZNTc0dnVG?=
 =?utf-8?B?RkpkY002c2JvSUh1Ri9KVUZLa25lNVlhek9ib2kveUVESzhhVjFhZExuanAy?=
 =?utf-8?B?R2dyUnhjRFVSZG1VTzNXTTE3UloraHkxU0I1ZHFsdDZKTXVHZk5YNmlvUUVZ?=
 =?utf-8?B?S1BFOUs4MzJkdU9CSlAzNm9lWTRkY1c2VU4yRXlQakUrNWFheDZPRTdJNDB0?=
 =?utf-8?B?enRCYXdqMENkSTRDTEFKLy9EK2JTSjNkY3h3Y0ZrVzF6cXBIUWx4Ty9kT01r?=
 =?utf-8?B?WDlxYUJiTGoycG85U1FVc1lxTVpXQ0s1Q1BMV0FteDJsM0Q4UTlkU09wa2JY?=
 =?utf-8?B?dk5ZeWtpM2diUjN0OXkvOVI4S3JOSHJUZk5QWHh6aVh0bXI0ZXNmdXRDSjAr?=
 =?utf-8?B?aFkxRkNmTGJJMVc1YUdOaGdoZW13WFo4ZHR3SHN5bm5Dak1pMUpTV3pVVWZr?=
 =?utf-8?B?bzlXcmJyQjNRWGxLNkJYTkxsYTRETVBPeEVuWFBSNm9zSUE4Um1Lckc3dVdn?=
 =?utf-8?B?aVFwTzVHc1F5QXBmdnVWNDkwR1hXS0JQTGYxYk1MTjZuajNCMm14d0xoeVNy?=
 =?utf-8?B?TGFzMVo1K3ZtRzFsWjd3a2twYklNcG9rbUNiQlU3MFFyckowWlBVM09iakNF?=
 =?utf-8?B?ZHFEbmFzdysvdi9JME1MR0xUcHhXbjNJTnRZcldYczhNQVcvYTJlVHZEaWpS?=
 =?utf-8?B?ZmU5UGxtdjZDTzZGNHVuMVFrNzVkUUsraFFuR1kycTB4VTlkZFo2blF1WitS?=
 =?utf-8?B?Vzl3WVh4Z1AzcE5jL2xzdzFhS3lWdkZYeW00SC9SNzJGeVAvVjBXMUF4Wi9N?=
 =?utf-8?B?c0VUQTNLVS83V0prSjBuQ2g4ampvV0JBOGM2MnJ2cUsxa2g1U2FhdGN4azRX?=
 =?utf-8?B?MXRmMVpNekZCUWZKd284UDI3K1BhZHlKZE81Sk44S0VaT1RDSHJOZU9jbXVK?=
 =?utf-8?B?Rmk1cmNkM0dhblREWG41R3R5UCtjY2h4SENsT2pubzlva1VFeDlXeUViMWtG?=
 =?utf-8?B?RFJwM0NMdlZ6aG82V2I1UUVieFZCTktJMW5DN0pOY1hBUS9jZEdxcGZmZkIv?=
 =?utf-8?B?aEMxc0U0Vzc1ck9sK0Z5bmtTa0hHSkFVMWE5YTA3ZzFRcE5wQVpaUkVXOEdw?=
 =?utf-8?Q?G+7E=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 07:54:15.3735 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3335280-7cd3-4537-ceb5-08de1aae2f5f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017093.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8784
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

Add documentation for the uma_carveout_options and uma_carveout
attributes in sysfs

Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
---
 Documentation/gpu/amdgpu/driver-misc.rst     | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c | 17 +++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/Documentation/gpu/amdgpu/driver-misc.rst b/Documentation/gpu/amdgpu/driver-misc.rst
index 25b0c857816e..5a71fa9c6782 100644
--- a/Documentation/gpu/amdgpu/driver-misc.rst
+++ b/Documentation/gpu/amdgpu/driver-misc.rst
@@ -128,3 +128,29 @@ smartshift_bias
 
 .. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
    :doc: smartshift_bias
+
+UMA Carveout
+============
+
+Some versions of Atom ROM expose available options for the VRAM carveout sizes,
+and allow changes to the carveout size via the ATCS function code 0xA on supported
+BIOS implementation.
+
+For those platforms, users can use the following file to set the carveout size,
+in a way similar to what Windows users can do in the "Tuning" tab in AMD
+Adrenalin.
+
+Note that for BIOS implementations that don't support this, these files will not
+get created at all.
+
+uma_carveout_options
+--------------------
+
+.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
+   :doc: uma_carveout_options
+
+uma_carveout
+--------------------
+
+.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
+   :doc: uma_carveout
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
index 1ebfd925b761..e9f71888ce57 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
@@ -1855,6 +1855,17 @@ const struct attribute_group amdgpu_vbios_version_attr_group = {
 	.is_visible = amdgpu_vbios_version_attrs_is_visible,
 };
 
+/**
+ * DOC: uma_carveout
+ *
+ * This file is both readable and writable. When read, it shows the
+ * index of the current setting. Writing a valid index to this file
+ * allows users to change the UMA carveout size to the selected option
+ * on the next boot.
+ *
+ * The available options and their corresponding indices can be read
+ * from the uma_carveout_options file.
+ */
 static ssize_t uma_carveout_show(struct device *dev,
 				 struct device_attribute *attr,
 				 char *buf)
@@ -1904,6 +1915,12 @@ static ssize_t uma_carveout_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(uma_carveout);
 
+/**
+ * DOC: uma_carveout_options
+ *
+ * This is a read-only file that lists all available UMA allocation
+ * options and their corresponding indices.
+ */
 static ssize_t uma_carveout_options_show(struct device *dev,
 					 struct device_attribute *attr,
 					 char *buf)

-- 
2.43.0

