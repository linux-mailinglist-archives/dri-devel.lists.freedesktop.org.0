Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE789880C3
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 10:50:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7A7610EC88;
	Fri, 27 Sep 2024 08:49:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="I7URn1Wx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2049.outbound.protection.outlook.com [40.107.223.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4AFD10EC8C;
 Fri, 27 Sep 2024 08:49:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dipxB55kousNSj3V/ImvgHlz3jMc66kLenEvzVQgWsL51LNGSxkrU0rF6sAun48APkGUDs7gPBYkSdLRdyTzP/YlVpgurW+HOd+nTtI5z4IZSj2hHYkFP4K+TY8dY5MYJ1gQvSO3ZOlfUYfIHeQCYJQpi7P4/dAfuPKlF2gNxotqW8p97iKvOLThfp3n+lPAzxEKmY46dYhyjmU4mIGuwuI6MckzX/wuwD0LoprDEA9olOeBFfL2W9FAyTbBZVYUEUxZAs61ADnCEDi0Y7uOt5fIp5Q6ct1qDH9fpST3RNLOTY7iwacgw6t43gAhrUGIgkr9LXPXLaxuD+olDDm1Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9f+kHca6uPX+a7qhLf96OaSWInnJjf7xkV4/At6HyT8=;
 b=TSL4RoJFg3UMdlJ77f4EyTfIoedLysvohnqyX3bsGIrTvAtPOfu9gUdo2a4js1OleNk1gdAH8Zq5AIpLl3v+jaJ/H3D/AplS3tJfrh0CMkmsbvlfmWjDTeBFRjiwm47+17ZkJAQLm4mJBLNmIzZtHAbIsU0gprosskl1VI5nUbGPsuQl0ch0C6Qoa4vA1TwcCqxGaWwIETS1KvZWKFM6BNTOj1YKlh3QFWyPcczdgeJMnj4M0aIrjDNd1yolzKZFeZhE2sv0yOufBUN4UR2g/IZR4T/eKwS7ns0l80Tevpc4bccXg0hN4MxLBUrbfseo0HqVmzxtY31FMlNUFgmCOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9f+kHca6uPX+a7qhLf96OaSWInnJjf7xkV4/At6HyT8=;
 b=I7URn1WxWgAed35KCQV4GsVpuUdUZNAbdQ5JE80OjCM0aN1SNk91S4Al2tT6gJKsCN3WZLDzS8NuKoiD2j44OXhgE4WxuVjd4LqK+Y9jCXcLpawBf79QjmnwRCmEOUWyFtwAQrHSv+Kfac++s8s55TM4v3jmWJtpsef1W4BPY6Q=
Received: from BL6PEPF0001641D.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:12) by SA3PR12MB7950.namprd12.prod.outlook.com
 (2603:10b6:806:31c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Fri, 27 Sep
 2024 08:49:35 +0000
Received: from BL6PEPF0001AB53.namprd02.prod.outlook.com
 (2a01:111:f403:f903::3) by BL6PEPF0001641D.outlook.office365.com
 (2603:1036:903:4::a) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28 via Frontend
 Transport; Fri, 27 Sep 2024 08:49:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB53.mail.protection.outlook.com (10.167.241.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8005.15 via Frontend Transport; Fri, 27 Sep 2024 08:49:34 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 27 Sep
 2024 03:49:31 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: <dri-devel@lists.freedesktop.org>, <christian.koenig@amd.com>,
 <tursulin@igalia.com>, <simona.vetter@ffwll.ch>, <robdclark@gmail.com>,
 <alexander.deucher@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dmitry.osipenko@collabora.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Tvrtko
 Ursulin" <tvrtko.ursulin@igalia.com>
Subject: [PATCH v4 2/6] drm: use drm_file client_name in fdinfo
Date: Fri, 27 Sep 2024 10:48:38 +0200
Message-ID: <20240927084848.263718-3-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240927084848.263718-1-pierre-eric.pelloux-prayer@amd.com>
References: <20240927084848.263718-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB53:EE_|SA3PR12MB7950:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d037905-6e09-4d54-832a-08dcded14f9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U0Q4bGZLVXBld2MrQk5hRjhyUWgyQWl4KzU0cGNtM3dDR3BSZkF4bHcrOFdV?=
 =?utf-8?B?dWRzNGtxc0p6clBuVjR1TTRjc0QwQ0pFU0tZT1NudWYrL3VGUGZkVUQvTEw4?=
 =?utf-8?B?TXhtcDVkOGpaSW0zeXRhN3B3anBUM0MrbitDM0Z5ejlHNXJ3OXAyb0piRnZ2?=
 =?utf-8?B?cy82TWFoYno1bXJIYTdZcy91VEhHeGRpek5aWC9SQmE0b1NaNXhjazlta3g5?=
 =?utf-8?B?clRyNUdJNi83dWh0eXhXL09nM1JTWjZIclJkU1c1ZGRBNEI4amsrQWlYUkN6?=
 =?utf-8?B?cExQRUV3d0l4QVhvY05xRU84MXExeE00czgyTEpFRnNwNE1laW1ycklSdzJo?=
 =?utf-8?B?d3N0NE1oWWhDUE81ZFQxcXZTbFFDaTdmUVg5Sk9kZHFYUkVPL09WTURKTjRn?=
 =?utf-8?B?WE1tUE50Vk8zS2tPd2Y1L3lCRDV3eXMyeWlhVzBVUUVudmRWM1RQbUxsaXhk?=
 =?utf-8?B?R3NaQW1zUnRJTkZaRHJVRlJ3QWpwOFRjQVRQZ3lRT05wMFdsRCszK1VSK29Z?=
 =?utf-8?B?Kzl5MkdwVkdLYXdSNE1GUVUwdm4zcEZHUUZ6N2l2dVFVbEZXU1MzZEhxMGVl?=
 =?utf-8?B?Unl4WTkvcXlabTF2eC9DOFFhMTVFdHRkYmRpSzZidEx0dS83VDJWMjJMaDQw?=
 =?utf-8?B?cFgwaEI3Vk5WWThmQ09jZUJIbDNRdlI1NlFoWnZ5Y3U4T0xzZXVqeGUzMUJK?=
 =?utf-8?B?dkpHZXVZbmdmVEVBaUNOMGljZFIwdXlTZnJGMTd2V0JrVitzeG1zQkVmMDg4?=
 =?utf-8?B?Wm9rNW44WVdGZ1BUMHRjRFcrdURrSnVYWGhYa1hQUUFQQlcyWmZBSXZvbU1p?=
 =?utf-8?B?T1dTSWd4RGN6cFFtdWRScmZiRzRLdG1lTWdFOFByb3VLOU9FYU9oSFBIMGkz?=
 =?utf-8?B?M21pOEswQ1VyZy8wZkp2bklrK09QS28zVWVlc3Z6TGo2NENxQTFBSThvVXVt?=
 =?utf-8?B?SHRabDhaZG9USWZ0V0pZSzhJNmlhc2h6K1AvdmZhMmZJM2VrcGlFT0Q5STdu?=
 =?utf-8?B?alpQWVZTSVVyVXRMTjlLTlZDc09GcWxCcDlOUHhTaWVPemNERXdCNndRUW5V?=
 =?utf-8?B?cGJiYXNuMVVBYWVPQnAzcytpUWd2c0pIZUsyYmtlQm1kcnpKNXR1cW45Wm5p?=
 =?utf-8?B?TmE1WmgzV3RUZjM1U0FRdkxUdWRINFZxMXFYOTl6enUxRXdGdFkyNUhNMTND?=
 =?utf-8?B?RUhneEJ0Z2hveFVGQ0lia3BxeHJwQWVuc2MwNVZ6eFNjZ3RiOVgwM2ZURmc3?=
 =?utf-8?B?dDIzTWFlczAyVGs3KzljdjJSWTdReVNUODkxNDZEUHd3dGl1VEZUVTBwQVdl?=
 =?utf-8?B?ZXNyRTFhY2VTKzBwZEM0OHp5b2lBRWFIODhHcDEvYWRPY01hT2lXc3dZeGg0?=
 =?utf-8?B?Zk1KMTZVdzF3QUhsd0N5YUdOTDc3WFVqVkRUUFNsWDU5TnhnVjMrcGtrcTM3?=
 =?utf-8?B?bW9xbE5RSVI1bE9wQmZJd2J3MlJhNUY2S0ZzRkhLZ2g0RjY3V0pORmhsNDZo?=
 =?utf-8?B?VzBjdHB0d2hvZ0FkY2pNeVRKL25NMjRuNXJYRmV4RzR5WW5CRE90U2ZETEI1?=
 =?utf-8?B?Nk9OWURnL2VBcDl6cHBkbjAzdTVUQ0cyK0FNdEUxdHpBREtRMDhuMVNLSUlC?=
 =?utf-8?B?UGNrV0VkcmZabWZIYldkb2FyYjIrQmNjazJzZlRad3pyNzdnME1Za2JFZXkv?=
 =?utf-8?B?QXJzSkE4a0xjRUdjRllpdkp2U0JXNExQdTBpZ2VSVnFYMTdqR053Q1BwU0lB?=
 =?utf-8?B?cDBTMTNhUlRUQmRJQnE2SEN0eHpJSUliUGE0ejVIYUhxS3VoSXJGaC83b2tE?=
 =?utf-8?B?MEhUUjVoVnZCMUlkbkY2cG1uM3FDVkNRSkNNUGdnWWF3R0FGZTZmc2ZJZEFS?=
 =?utf-8?Q?Mfzfwfw0Y1SRo?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 08:49:34.4043 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d037905-6e09-4d54-832a-08dcded14f9a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB53.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7950
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

Add an optional drm-client-name field to drm fdinfo's output.

Reviewed-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 Documentation/gpu/drm-usage-stats.rst | 5 +++++
 drivers/gpu/drm/drm_file.c            | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
index a80f95ca1b2f..566e122e6e60 100644
--- a/Documentation/gpu/drm-usage-stats.rst
+++ b/Documentation/gpu/drm-usage-stats.rst
@@ -73,6 +73,11 @@ scope of each device, in which case `drm-pdev` shall be present as well.
 Userspace should make sure to not double account any usage statistics by using
 the above described criteria in order to associate data to individual clients.
 
+- drm-client-name: <valstr>
+
+String optionally set by userspace using DRM_IOCTL_SET_CLIENT_NAME.
+
+
 Utilization
 ^^^^^^^^^^^
 
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 64f5e15304e7..1c9e03477a24 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -955,6 +955,11 @@ void drm_show_fdinfo(struct seq_file *m, struct file *f)
 			   PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn));
 	}
 
+	mutex_lock(&file->client_name_lock);
+	if (file->client_name)
+		drm_printf(&p, "drm-client-name:\t%s\n", file->client_name);
+	mutex_unlock(&file->client_name_lock);
+
 	if (dev->driver->show_fdinfo)
 		dev->driver->show_fdinfo(&p, file);
 }
-- 
2.40.1

