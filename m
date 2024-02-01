Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A07846333
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 23:12:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C12A10E852;
	Thu,  1 Feb 2024 22:11:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Js6cK/Dt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2050.outbound.protection.outlook.com [40.107.220.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B545810E7D5;
 Thu,  1 Feb 2024 22:11:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q/airV7S0FJJywzjVAYU6wIZswLIY6W46Z+gGyDdKnqavApzL3+2pN8cQ1GqJb818dW9ic5Z20fVm244HT5efYO7Qt3oZj48cXuOO1W/FziZt43zVVcGLN8rSm0T2Q9jWL10NbLLpiGKY/f+Jc430opVOO5IsokU+RU0aPK+V9IACibH8au+wOjMKejSzMxdX9WO/GHp5BhY21g0gtX9izl0HdtbbfbUc/t4kiNtoTTgWbx6qOY2h3IxqKEYUtyWsDIzVHZzQHYL3JJXjnohElWuIwKymwfgDAMceUhsWeGAKMykc3DXq2JDICm7Sus/CuocPXyJLnhhklJRvddFng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=arYU9KbThtvNV2wNGKkgSsiAiUqqY3/0QJfFUcsdB6c=;
 b=l0sjp18lp/tDA+gav+J90qv9iqREoWoA6vt1M3E/uhkwQxm8WO5pOj9Y61CKr5rNk+dZV1oBLT4Olw/8KHBTsK9mSQHLCkcBPAwlGbfKbxH33FRfyhKhXTlEjTz4r0gQJzYc8xuWT5jfgefbEUiK/H+4JQGiEAYue3kny/M3mK61zLLUO4Xel8zgc+UVb0+HOh9O6aT0BxD9zGxqsJZhJH2+50zyvpmbOtBi5Nbd8WZjx8crUJvgMw++WSSXwlLpYqKRaE2upZR2e6Gi6menPEBXzqts2a33jDxR8Gh8z+piqWq83vb2OoqcmZ4KdG8oSB7ipa5NJTtevYCcl4IlKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=arYU9KbThtvNV2wNGKkgSsiAiUqqY3/0QJfFUcsdB6c=;
 b=Js6cK/DtuG78W6WDQ7fEHcFmChpyqq1axoO2yN2lfUfkCOIdz/mDqFYW2wOjkcPaNym9cBcHyT/K/LEHD9WObQaqH3FNQTPaPnNXGD9luqwesJ8HeIThOUqYxDHVgjHEPNPMT3Hjwflx5uH4+gx0vHuRSw12AmeHr0trtkh3bso=
Received: from DM6PR05CA0040.namprd05.prod.outlook.com (2603:10b6:5:335::9) by
 SA1PR12MB8888.namprd12.prod.outlook.com (2603:10b6:806:38a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22; Thu, 1 Feb
 2024 22:11:38 +0000
Received: from DS1PEPF00017090.namprd03.prod.outlook.com
 (2603:10b6:5:335:cafe::45) by DM6PR05CA0040.outlook.office365.com
 (2603:10b6:5:335::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.24 via Frontend
 Transport; Thu, 1 Feb 2024 22:11:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017090.mail.protection.outlook.com (10.167.17.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Thu, 1 Feb 2024 22:11:38 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 1 Feb
 2024 16:11:37 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: <amd-gfx@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, 
 Harry Wentland <harry.wentland@amd.com>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Hans de Goede <hdegoede@redhat.com>
CC: "open list:ACPI" <linux-acpi@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>, Melissa Wen <mwen@igalia.com>, "Mark
 Pearson" <mpearson-lenovo@squebb.ca>, Mario Limonciello
 <mario.limonciello@amd.com>
Subject: [PATCH v3 1/5] ACPI: video: Handle fetching EDID that is longer than
 256 bytes
Date: Thu, 1 Feb 2024 16:11:15 -0600
Message-ID: <20240201221119.42564-2-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240201221119.42564-1-mario.limonciello@amd.com>
References: <20240201221119.42564-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017090:EE_|SA1PR12MB8888:EE_
X-MS-Office365-Filtering-Correlation-Id: 441c21cb-945f-461b-9163-08dc2372c33a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y2qOF4lDTqANR7iT/MIaXQDonRr4LOqRXwfURf4hc4uo9H4Oaesct5aBkPvOjWUchbsGNJSTnM/cLDAFxVS3VwUXaHuiopoKmTGTRVRiWwLM/O3maNPzTnOZlKMv/wMYmkjG4+LybOhpAv4JIxgEdm3mcwJPyjsxUxiqpd2ViFlmeAneq0+hQDePQ1sCAyw+11EXPR7I/HGWYsVi2k6NF1/2Wlt9LXqDE8h2qrVgqn89u/P60k7qQ8trtmSUntB354YuhOOF4CDZfBahXEMUNYriTL2lsQ5lmwJvHaCyApTuyaIWFdmOdQIyq6oxjDM1aLKdTepPmtc8HUXES8SgUBs0IpkFALYpxNVkfT/ZIAbmnovwe060jGnpWJyhRNLoW3aNVs/MJCBSncU1AV7lrXbfxAuaLsK0X52na/KLacncNnN302PaKzhvxFxJcUoOPQd03ciWRxgigCACf2Pf2wmA9NDT7tQRnzacgCKGf1WfHgcj7wu0iz7e4AqcsAnz1MvSBUkhF86nwULofwtTPaP4RiCkQ+hsq0pTlKkyCm2Gigfxikg6HZXzQ/4tuFDtb51KIAQznCMF5z0zJ2KivUS+E7+HZ2Zc5eWPbqr+51XlYk7rWkkSA6VQ9dU0ka+0DB9fxwQlB6hmbqeWxPqhOl2nrJWu06wZrAN9Q3R/GsiB/ttDICeMrKD5F8MpB6Fvhrd0iMWdnT+w4UrxPhWTqaMS/0dU7mOzQDdCMKESpc0vY8vPzPRYtyyYqR8F4tA7KCWdrqkhKNYMtTaBlbYHls2epMcWqgdvWThboOQnqUA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(136003)(396003)(346002)(376002)(230922051799003)(64100799003)(82310400011)(186009)(451199024)(1800799012)(40470700004)(46966006)(36840700001)(336012)(2616005)(26005)(426003)(16526019)(1076003)(40480700001)(40460700003)(41300700001)(36860700001)(54906003)(966005)(478600001)(36756003)(83380400001)(7696005)(47076005)(6666004)(316002)(356005)(82740400003)(81166007)(8936002)(2906002)(86362001)(110136005)(5660300002)(70206006)(70586007)(4326008)(8676002)(44832011)(148743002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2024 22:11:38.7625 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 441c21cb-945f-461b-9163-08dc2372c33a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017090.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8888
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

The ACPI specification allows for an EDID to be up to 512 bytes but
the _DDC EDID fetching code will only try up to 256 bytes.

Modify the code to instead start at 512 bytes and work it's way
down instead.

As _DDC is now called up to 4 times on a machine debugging messages
are noisier than necessary.  Decrease from info to debug.

Link: https://uefi.org/htmlspecs/ACPI_Spec_6_4_html/Apx_B_Video_Extensions/output-device-specific-methods.html#ddc-return-the-edid-for-this-device
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v1->v2:
 * Use for loop for acpi_video_get_edid()
 * Use one of Rafael's suggestions for acpi_video_device_EDID()
 * Decrease message level too
---
 drivers/acpi/acpi_video.c | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/drivers/acpi/acpi_video.c b/drivers/acpi/acpi_video.c
index 4afdda9db019..3bfd013e09d2 100644
--- a/drivers/acpi/acpi_video.c
+++ b/drivers/acpi/acpi_video.c
@@ -625,12 +625,9 @@ acpi_video_device_EDID(struct acpi_video_device *device,
 
 	if (!device)
 		return -ENODEV;
-	if (length == 128)
-		arg0.integer.value = 1;
-	else if (length == 256)
-		arg0.integer.value = 2;
-	else
+	if (!length || (length % 128))
 		return -EINVAL;
+	arg0.integer.value = length / 128;
 
 	status = acpi_evaluate_object(device->dev->handle, "_DDC", &args, &buffer);
 	if (ACPI_FAILURE(status))
@@ -641,7 +638,8 @@ acpi_video_device_EDID(struct acpi_video_device *device,
 	if (obj && obj->type == ACPI_TYPE_BUFFER)
 		*edid = obj;
 	else {
-		acpi_handle_info(device->dev->handle, "Invalid _DDC data\n");
+		acpi_handle_debug(device->dev->handle,
+				 "Invalid _DDC data for length %ld\n", length);
 		status = -EFAULT;
 		kfree(obj);
 	}
@@ -1447,7 +1445,6 @@ int acpi_video_get_edid(struct acpi_device *device, int type, int device_id,
 
 	for (i = 0; i < video->attached_count; i++) {
 		video_device = video->attached_array[i].bind_info;
-		length = 256;
 
 		if (!video_device)
 			continue;
@@ -1478,18 +1475,14 @@ int acpi_video_get_edid(struct acpi_device *device, int type, int device_id,
 			continue;
 		}
 
-		status = acpi_video_device_EDID(video_device, &buffer, length);
-
-		if (ACPI_FAILURE(status) || !buffer ||
-		    buffer->type != ACPI_TYPE_BUFFER) {
-			length = 128;
+		for (length = 512; length > 0; length -= 128) {
 			status = acpi_video_device_EDID(video_device, &buffer,
 							length);
-			if (ACPI_FAILURE(status) || !buffer ||
-			    buffer->type != ACPI_TYPE_BUFFER) {
-				continue;
-			}
+			if (ACPI_SUCCESS(status))
+				break;
 		}
+		if (!length)
+			continue;
 
 		*edid = buffer->buffer.pointer;
 		return length;
-- 
2.34.1

