Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D8E97D36E
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 11:10:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B2C010E7F3;
	Fri, 20 Sep 2024 09:10:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0hvUOiP+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2053.outbound.protection.outlook.com [40.107.93.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9084210E7EE;
 Fri, 20 Sep 2024 09:10:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UG3EVYm6QZbHw79wAY8MEUKmxB45bsywNn6k65VSg+FDTnlsbjiAt7p2rM1fqcmKDHlwkMMJOXbkdwSIs9OoOhyOIelpxz80aqARY7UmV3AaqpoBfVK9urDdAxbWwM2MYCY1OsH94fGylWq2qFKNnOwkgZOlaNH2fIdm7xeke8Rnj4S4iPeS9eni/vFN+nP910Ns/pBp/PdPRHkuxRAdGAML4oWsKVqb87T+QVeYL47JLNRh6Y+aKm31L/Bicov/ZWKZlqQpNjzHqcTi2MBCTry+DOdq/4hhtyjrmh1vaBryP5ziIgRsaitoJVc29LO0Q7RxnSLia8JvaBl8o1lA9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eCKYioUh/xSi+FChhIX5m+ewWmMbpsGmqYyWM4vHzGY=;
 b=YgmVOcjrofEhf500jWDjfvlABz1SyE3vEy+Fnz2fAQUg2KloVGeILjbv/SQWAfSgO6HCDA0fhQa33V4eVETgdg31zzpcv7jr/3h5DpLcho7Q9wAAfhTnT3y/mThwU2r1s1+jMvG0FB5UfhPCVctlrdTSy3C2oMhaeqvVd3qh2lyyLHeJMXNKb4ECcIb6Rom4YOkrrRS3XWEM628aMJDU3BO9NrF/HZ5lLBGkRa2v1XU6Z4i4pKkO5N1mR+4+E2M1AVZrZLNkG5MKPSeeXMXek8hZubxJEI/pb+3ZCNR6QC9ka2P5MOmgtXYbCMeqSLLEN/gRGw1lAe+lroi9Stq9QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eCKYioUh/xSi+FChhIX5m+ewWmMbpsGmqYyWM4vHzGY=;
 b=0hvUOiP+TbuoZ/hbjKow0BvUJnvPFeB7U7ThtIbBtYyMwslb7FO9Q+rRC+e4LTeT/5fq/mS0C+ts4tbcrCB0MbQnUn0X1nh5x6udTU61G5yzeLnvTOVrEM6Lvlhji2y+FgHxvN5/AV03SyLTosqBwJ7j1VvXFWmiNEaIkywyz8Q=
Received: from CH2PR18CA0020.namprd18.prod.outlook.com (2603:10b6:610:4f::30)
 by CH3PR12MB8996.namprd12.prod.outlook.com (2603:10b6:610:170::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.21; Fri, 20 Sep
 2024 09:09:58 +0000
Received: from DS3PEPF000099D3.namprd04.prod.outlook.com
 (2603:10b6:610:4f:cafe::9a) by CH2PR18CA0020.outlook.office365.com
 (2603:10b6:610:4f::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.30 via Frontend
 Transport; Fri, 20 Sep 2024 09:09:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D3.mail.protection.outlook.com (10.167.17.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Fri, 20 Sep 2024 09:09:58 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Sep
 2024 04:09:55 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: <dri-devel@lists.freedesktop.org>, <christian.koenig@amd.com>,
 <tursulin@igalia.com>, <simona.vetter@ffwll.ch>, <robdclark@gmail.com>,
 <alexander.deucher@amd.com>, <amd-gfx@lists.freedesktop.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Tvrtko
 Ursulin" <tvrtko.ursulin@igalia.com>
Subject: [PATCH v3 2/6] drm: use drm_file name in fdinfo
Date: Fri, 20 Sep 2024 11:06:44 +0200
Message-ID: <20240920090920.1342694-3-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240920090920.1342694-1-pierre-eric.pelloux-prayer@amd.com>
References: <20240920090920.1342694-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D3:EE_|CH3PR12MB8996:EE_
X-MS-Office365-Filtering-Correlation-Id: ea85149f-1ca4-4b0f-2ca7-08dcd9540036
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T1NzWEFmT3VWYXhySzJVc0pUZE1na1JKSkQrZlNJSkZibi8rcVlPWlJqN0Uy?=
 =?utf-8?B?OTJMdXhkRElPWmtvcTlKYlJqUHBYNkZCdFRWWkxPdUJEa29NR1dwQmhER3Ra?=
 =?utf-8?B?NGZCem1VUlhJbWlndXV4ZEVNYXczb3NKN1pkV3hCQm5hbWJMVlRnZi9lczFw?=
 =?utf-8?B?Yy9CNWhQZVkyNTdtcTJkQm0zVUF3aG1EMjVWUExzT3g2TTlxZys2Nkhsdkd4?=
 =?utf-8?B?STRFcWVqYnVRUTNCRDl0UDB2UXBoTmdHbXF2N3lUcFE2enRJTzY3SmJlSlpn?=
 =?utf-8?B?ZkhCVTNjQ1lQTitCeUt3ZTN3S3ZFUWpKUXBZd1NVd2JMRmI3N0o5WU1idjlO?=
 =?utf-8?B?SG9QUWh6ZWk1aGRmSDI1cS9LbGZhRy8yYU1HcGtqeWpQWjhGczl5N3p2VXJ0?=
 =?utf-8?B?SjBOdW1FOXBlQXliRDNzMmRYcVl5WGZ4VTU4T25yV0FBbEdmdFR0Wm1UNVky?=
 =?utf-8?B?Z1VwSUdJTXREZGV5Q0JOdkZTZjRBQnphQmdsc0Q1SEhYcVAvZ3hxY2pNQlFq?=
 =?utf-8?B?VHdRd2VPV3ppY3d2aHdWRTMxVkZ6RGM1YnZRK09UYVBMN0ZsSmdFc2V2WUND?=
 =?utf-8?B?MWtHUnFDaVRnOTVDYU94NFIyYXVjTWpsKzZUQU4rdVI2Q1hCSndaQ0ZycDNY?=
 =?utf-8?B?SHNIL21RZzlLd2QxMng2emtMQ1JTWXdMZGZJNTBlSWxZdDg1WkE4a1hTd1E4?=
 =?utf-8?B?bkVhUFZSTU53SWVLN3h6ZWdLWU56VVRocjRpRU1UN3B6RGhNd29IN0F5M2Uy?=
 =?utf-8?B?SGM5Nk16QVQzNXRjZ3FKWU1IUTJaTWtoWTBhSi8rSXdkeWRUcDg4YUlmd21R?=
 =?utf-8?B?OFpnQmFxdEpMQk1LUGp1RTAybHg2bDBDMnFnU2pZcW1GbDRiZGVrR3JzSUow?=
 =?utf-8?B?S2RwV25nb253UU5XRnB5cXBwbDk4dTUxYkxwYytzaXdPV0VtRkdDVjNpZmpJ?=
 =?utf-8?B?QkN2bDBvZHM3blE4d0VHaWtTVnkxbEZlWDQrUkxnOVY2VGhHTmwzK3ovdkRD?=
 =?utf-8?B?aEpCdm1PRlk0bDlsMEpwcnkxWU5JOW0yYXNSejlkNFIwOG9lUUhteHNndUtI?=
 =?utf-8?B?WU4zZm42UVUvb1d0RWF0QlVwSnc5UHdUaE5tT252ZEFyMm51SVhTZFM5NlR5?=
 =?utf-8?B?L1FMOXRwZENjQU1ENER3aUs5eTBONkZ2U0orR0QxUG1XTHRoU2xYZnZVRzBx?=
 =?utf-8?B?L0w1WUZlelZTQnNPZVdkRDdDMkFpOUdQdnpWZDJYTGNiMlVienoxZWFCdDNO?=
 =?utf-8?B?SG1rU3dPT1UyOUt3VkRwcVowb21XLzVmWlhQN0lCSUFBejVjelViRVJjZWZY?=
 =?utf-8?B?c3lLMG5zMi8wUjd4MHVTRWpRUE5QSkFBUC9WSFYrQkZaSjVkQWNZbkZRbWpu?=
 =?utf-8?B?U0xFN0xTc0pqUjJnMUxRbHlHZTZYa3ZpNUxrdDlBeUIvMmxDWDl2QWRWTWlU?=
 =?utf-8?B?L0d6UkNBalpCK2U2aHZvQ0sxcG1ZN3ZrdmcwUTZZMlduY1owejBaVllDUnln?=
 =?utf-8?B?ZzNTa3NnaTZIWTBDYjhOemY3R2l6bjhVbkRTZjYrOVBTK255ZHRFaWZrRUxj?=
 =?utf-8?B?TVdPd0h6YXZIcUs1QnhCME5DTWVkQ1J0bmJRTFgrVUxzelFNQmJDZHM4VWpK?=
 =?utf-8?B?UXNzcFhkR1FDTjUxV1FIUmtmWTFCY2lwYUhCRU9vRUh5L2FUampFd1Zka05t?=
 =?utf-8?B?NGdPekpQejdFWTRwWXlLSHBna0JINUh5bnlZSGh2VFNPVEsyd256Y0RXK3pE?=
 =?utf-8?B?Y1p5b1JMREtZU3paUmtpY3dZbGdnNkNTcklOUk9OOWpLeDlZZXBGZzVKZUJz?=
 =?utf-8?B?cjBjSFE2NjJucjg3OXdyZ1dmYUMveFJtc3ExRG9KWk1IUzlieFVVSW00VXBw?=
 =?utf-8?B?TWpuT0V5Rmh3NGNCbFN4NWlrNlYxNk1BU2xub3VDcGF0d3ozRmlQMlJoLy9U?=
 =?utf-8?Q?hEt6RMsGq4kRiOqvmHb60ekENyXbT+3K?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 09:09:58.2704 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea85149f-1ca4-4b0f-2ca7-08dcd9540036
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8996
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
index a80f95ca1b2f..ed1d7edbbc5f 100644
--- a/Documentation/gpu/drm-usage-stats.rst
+++ b/Documentation/gpu/drm-usage-stats.rst
@@ -73,6 +73,11 @@ scope of each device, in which case `drm-pdev` shall be present as well.
 Userspace should make sure to not double account any usage statistics by using
 the above described criteria in order to associate data to individual clients.
 
+- drm-client-name: <valstr>
+
+String optionally set by userspace using DRM_IOCTL_SET_NAME.
+
+
 Utilization
 ^^^^^^^^^^^
 
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index e9dd0e90a1f9..6a3621f50784 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -955,6 +955,11 @@ void drm_show_fdinfo(struct seq_file *m, struct file *f)
 			   PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn));
 	}
 
+	mutex_lock(&file->name_lock);
+	if (file->name)
+		drm_printf(&p, "drm-client-name:\t%s\n", file->name);
+	mutex_unlock(&file->name_lock);
+
 	if (dev->driver->show_fdinfo)
 		dev->driver->show_fdinfo(&p, file);
 }
-- 
2.40.1

