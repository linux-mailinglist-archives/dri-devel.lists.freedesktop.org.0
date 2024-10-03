Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B5E98EF8E
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 14:45:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AC1510E832;
	Thu,  3 Oct 2024 12:45:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mkaiZE1a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F55B10E832;
 Thu,  3 Oct 2024 12:45:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G5nUOloyKY/jZKxDIhEl3+3zW/oNeVA/aF88xZ2zD7GkES3as74UlC0Lr76dxR2MqqPX3zXzSbw9szbMBPFwUL41Z71JacMthrCA02gYtJYOSdbFIX18LElip6PiYjqbhUaoF0SpqaJlHpBMtkMPtp1NDrHBcA16gO63NR1kHkBJa3vwyoEKkdc17XExoJ4wGBtjB0FsiP9KCVmb7FYKRY56QH4xPogZy8Q8TVsPBtATpf6kL99LcwfGANvmoXtqcXtmj+Nm5auwHRyAQ+WSZjM3iAsuSRuaXnzT/4Cc3sA91Y3v7Xy9J7vj4H8HSTqHmBght49jNsRniYjf8JCi+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9f+kHca6uPX+a7qhLf96OaSWInnJjf7xkV4/At6HyT8=;
 b=JxMp8TxKBCPeMwYqX7UCYmFR95dvH0PoMhAxZvhhVp+XZ29q3nGbAlxevsKeFuo/F46GBZ5ifvtITnW9BC2OH/WYZPMSA4ZGZzZq6hOYksf5IZODLA0J8ih9EDPv20nSf1ILLbpd01GfZlJJYCUeBTsfurq50WEWCgEIedtjGfaUHVWlgNrRSBpCytAwg0OceP8R3QTe17znjfbh41b278MoZ1CNJmHf1PYext6Avyda+Ibt1RoZI3oNMKKtspyYQVmEz/kDdRaY6rJSllhD0cN6FMu4cHncidRb2iqItfBAuK+8mhD4R9raeYFbwVnJ7NYyKphW3XQs5QdNMGqBjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9f+kHca6uPX+a7qhLf96OaSWInnJjf7xkV4/At6HyT8=;
 b=mkaiZE1aSRcUu8lsTNFi6CTaaVN0YBttUByRWZgZJjyIHGUgTx61tP7Fc7kc9ClRUbkvBUVx7cHsRDEAqJ9i3iLNJVh7wD9dOhDgqi5klYeKbXK2kd/NDU/Trj6DwtKbhBMI/ZGH1vTsxyg/rw21rS/YhZBNdnTFUNSwxb5AB78=
Received: from SN4PR0501CA0021.namprd05.prod.outlook.com
 (2603:10b6:803:40::34) by SN7PR12MB6886.namprd12.prod.outlook.com
 (2603:10b6:806:262::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 12:45:39 +0000
Received: from SA2PEPF00003F68.namprd04.prod.outlook.com
 (2603:10b6:803:40:cafe::85) by SN4PR0501CA0021.outlook.office365.com
 (2603:10b6:803:40::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16 via Frontend
 Transport; Thu, 3 Oct 2024 12:45:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003F68.mail.protection.outlook.com (10.167.248.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Thu, 3 Oct 2024 12:45:39 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 07:45:36 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <dmitry.osipenko@collabora.com>, <jani.nikula@linux.intel.com>,
 <christian.koenig@amd.com>, <tursulin@igalia.com>, <simona.vetter@ffwll.ch>,
 <robdclark@gmail.com>, <alexander.deucher@amd.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Tvrtko
 Ursulin" <tvrtko.ursulin@igalia.com>
Subject: [PATCH v5 2/6] drm: use drm_file client_name in fdinfo
Date: Thu, 3 Oct 2024 14:43:10 +0200
Message-ID: <20241003124506.470931-3-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241003124506.470931-1-pierre-eric.pelloux-prayer@amd.com>
References: <20241003124506.470931-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F68:EE_|SN7PR12MB6886:EE_
X-MS-Office365-Filtering-Correlation-Id: 37efc26b-75d6-45eb-4a16-08dce3a94935
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OHlMZUFPaXZrem82MGJvem4xV294MEtzaTlodHNIUGhiOGlpNnliSmptay9F?=
 =?utf-8?B?TlM0c1ZwZVJYSDFDUkRPOTZhNHBPSk4rR2pRSUlxV2ZqVUR1emlseXRzVnYv?=
 =?utf-8?B?d05aUlhadXgzcncrZkRVQXQ3UE5xSDBSUzNlV3JkV001V1VxaFlKSjRjY2h5?=
 =?utf-8?B?M1RFUkx1TU9Dc1ZuUWNROWttM0UyQWVBb2tjNWsxZC9CaFhxOUJqL3hZZGxD?=
 =?utf-8?B?NEptUFRxazcxem90RjIybktRcXl1K1pPVW1Yc3Z5Mmw2c1NDMy9rRzd1SytF?=
 =?utf-8?B?T3FHR0lBNzkvbEZpZi9WMHdkTktid0JOSFd1a1BLYTVrUmY2MHRRRFZ1K3Ri?=
 =?utf-8?B?YXo1SXNGWW8rMlIzZUpzRjBOd0NWRFdXK0MzZGFFNXpCQjNTeFZyQ2ZKM1Ev?=
 =?utf-8?B?c0VFVjlaRk9uNlhYUStWMUVVazhURDU4NjdIcW9wRjI5RmEzcit6R3VYWWRH?=
 =?utf-8?B?TjB4OU5YQzZzVHhHcUREbzk1Y3pOVTBtdEJpb0Y1enhwc3ZKUE9GYll0OHdD?=
 =?utf-8?B?NHV1NVIzRFV4cHgwNDBoYjFEVWVpV0N0dmlpZWlodGxrK1FLWkVPaUhFNTF0?=
 =?utf-8?B?ZVlMNzQ1d2dZandQZ2g2dGdYWHVxaGh0MTNKZm5IdDhTbCthZ2ZCcmRvNDNq?=
 =?utf-8?B?OTREQkpVM0NtTHBsOVQ3b1FUZ0Z6ejMwN3Via29jY1oyYnQ5a1dlVVNPcUxw?=
 =?utf-8?B?ck80Y0xwakNyNHk3NnExem5aeVpuVGFyMyt6QUdJREo4SGx4VDk0WWhTelYx?=
 =?utf-8?B?eWd1c0RJMzQ3NGJjTi9HY05zamVKQzY5cmkyQ2JhbXQyalJhZHU3ak83elg3?=
 =?utf-8?B?dmpvRmRkeWFFK3cydHJ0UW1WU3ROKzZhWHFJNm9sb1Jjb0FCTUVXdDQzcXRz?=
 =?utf-8?B?MVlQbjYxS3RIaFdESGsrZnBQU2tRbUYrTlBzWFlKTkV3ZXdxQ1dIUzlpeHFB?=
 =?utf-8?B?WUVyckxwS3Q3anFuVGhnSFd6Q056bmtWY3RHWlVzcjgzdS9ZYXhFczdXQW00?=
 =?utf-8?B?UXpCWFRCbVprVHhvSlR5NHI3dVlwVG4vNVBWcXVPbWpzdVZjOWNJUmJvQnMr?=
 =?utf-8?B?d3RWblo2QVpQUnh4Y1NtWTFPZEdqRGxIQUt4Tm9LUFdXVDNCdDRIdUo0YU9u?=
 =?utf-8?B?TDQ5bS9qNjQ2MEZUT1dVenlacHhCSThKd2FKVlJnZHBoeVZiNDViVWI2VVgr?=
 =?utf-8?B?R0pERjRSeUFoV1pQeUt4b0FTeUdINStrSWIzYi9pMEpzYjZnN1JCY045ZkxW?=
 =?utf-8?B?MEVTQ3ZPQXRpK05ZR1c5TjFFa3V3Q2Y0anY2RHErV1dLdlBPelBQaGZVS1NE?=
 =?utf-8?B?YWVESU00cUpoV1JxbFZ3eExaNmJsTytJc3dPaTNzSnFsdHBxZkVzcnZveE1o?=
 =?utf-8?B?ZDVqbENBcHJlOENnMWkvOHRWcU0rSXVweWd6M01pWnBabGpKQXUvc0lLOTNQ?=
 =?utf-8?B?ZWJDa1JTekhHYTdKanVTRktZNm1HcUNiUGZjWGdvZ1JSWmVpY1NoSE8zSmND?=
 =?utf-8?B?eGVzYVdWMDVrU0wvbm1QR0VwTmNSN3dOUkMwb2lqaVpjbkY5RGQxQTVzS1lo?=
 =?utf-8?B?Tlo5cktPUkd5a2xoN29lK01idlAwWkkvSXRUcmZxL1lXaUQzK2NPeTI5UUJK?=
 =?utf-8?B?alU2UDhsY3JzM0psbUVMdDNwRU5yU3lad3VONVdLSStRQk1tZjRORmlMZzQ4?=
 =?utf-8?B?WnpyTVdsVGRocitTZ0ZWUkd4dk5jNERSb0ZMbmxUcTl5eklJMDdXRXhSK1hN?=
 =?utf-8?B?QkdCZlIxd3VtZmI4RTFnTTN4b08wY0pjN3EvUThMOGhGNFU5NitNZDBIVzdM?=
 =?utf-8?B?eHJQT2J0UmR6MWxQTG0xM01OaUxmN0ZqUnV1QnRrUndyRHpwRjVNeGYyeXNZ?=
 =?utf-8?Q?05jcfR3SLIElZ?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 12:45:39.6193 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37efc26b-75d6-45eb-4a16-08dce3a94935
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F68.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6886
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

