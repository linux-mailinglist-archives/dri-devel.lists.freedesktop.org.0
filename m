Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 297BD842CA8
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 20:26:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ACE11134CF;
	Tue, 30 Jan 2024 19:26:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2073.outbound.protection.outlook.com [40.107.223.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC3A21134C7;
 Tue, 30 Jan 2024 19:26:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J9rvqWZb8n01NdPaoMzz0VAZkMsT9remw+AUULwx45OBIwaRMJWZpMBZTkTSWGbQ4ppsdiD9SS9JSqlKMD14J+ODCtGXV7Q8neq2uKjjuSlvUvBYd176AVTSIMcao5ZyB4V6ElLZcuN+lymzaRKzLv7pc5He9R1h92SiVClso6MbealH+KGphdvov/go1U4UpyrftxzRgGcAAa0OXdVyVaNbsQIlpqJpS1cn8B1QV079bSxMe02tDMb07QjpCfodKr46J+1UGYIqWIDG/CXl2zPaqQHA8oNt0vueog7lWtYwW38k6HBFqSAVBxl9KRwJe0rTPkc3gm8y5NnCzfvg8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a3+VTX+hgPPjNjj8MiC6pwK3XabNvZpzXJgEJU5lRY0=;
 b=lgkoAZwrt2f9SVtSRdM9nsr3CEWjGDHojuZ6n2RN8AhYxwbFbpSz4iSYyGtDpAlaxGvGh2s3w6fEQfu/4k5KX4rSmwjuDu4aqZOVMugE1nwR94zIhNNUoMztmor5GTd0/Q5wI8YeusY1nE60cRHrbRHNKdnebit2if4N0ATks5/GfjpGGrZsLV4/8e3YpS1WMkk29a4z3VZuA1mk1Rva+llL5cliiBzZiQt0C4KPuEr3Dol5eaIPTEK629bop5no2Kjps14/HCF5lE09Ewtu+HdfsQ/kJmLJS5OI8gTeFBlLaYPNkg3ybZ0pd/9RNizLopnHNQEplVJEqbuorol8dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a3+VTX+hgPPjNjj8MiC6pwK3XabNvZpzXJgEJU5lRY0=;
 b=Lx7QSYTpVDFnGr1go+M5CnYFuXrSKLXClIZhYAH959CBkVJV1r0+VEJ5msG65Cx9dMaQ1VDAKbE+lj6farN2SyfzhqtjUteuQ1SDAwoOtGqIobHVKR2QTVKnHX68z4UQeiFtGwvm764ScDIu46znLsYe0/+gH18WJymg6f8ieFE=
Received: from MW3PR05CA0016.namprd05.prod.outlook.com (2603:10b6:303:2b::21)
 by CY8PR12MB8361.namprd12.prod.outlook.com (2603:10b6:930:7b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Tue, 30 Jan
 2024 19:26:39 +0000
Received: from MWH0EPF000971E7.namprd02.prod.outlook.com
 (2603:10b6:303:2b:cafe::6a) by MW3PR05CA0016.outlook.office365.com
 (2603:10b6:303:2b::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22 via Frontend
 Transport; Tue, 30 Jan 2024 19:26:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E7.mail.protection.outlook.com (10.167.243.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Tue, 30 Jan 2024 19:26:38 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 30 Jan
 2024 13:26:36 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: <amd-gfx@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, 
 Harry Wentland <harry.wentland@amd.com>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2 1/4] ACPI: video: Handle fetching EDID that is longer than
 256 bytes
Date: Tue, 30 Jan 2024 13:26:05 -0600
Message-ID: <20240130192608.11666-2-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240130192608.11666-1-mario.limonciello@amd.com>
References: <20240130192608.11666-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E7:EE_|CY8PR12MB8361:EE_
X-MS-Office365-Filtering-Correlation-Id: e2f66816-19cc-4261-f1ba-08dc21c96147
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nev1TcG/QWrnsWEnmekabktGdXD6URCIjf5I+nk/oP22X8ZTVfDynyEqhqyzfrrCl2uXD9pK6RGw5P8mq4Hibifg6bwGqlr2wTBwMrrVoR5Q1tzayJpNjtLPZt2/TAqxqliJLK8XmlYfNlNJpCIySjqA+Fl5n9+C7gslvfkmMWATdvRMUmvuDl8GB3ZoJE7UXig0a5tJh95v2wuIr52Dh1UDkyu3JOXUJYzQwgHJ9IESGkj11f8MpTucB5x9977jqfUHrlGvY96tysBiIaByhtUK59Ve+1Wf5soiA1KERkjoFexFW62DeuBe3HitPXzlLpdHgWMFpoiPQJj0cAKTpoOPQHgkPLAfHo+74fCnYSwD3/W0DQPfZreAS/SHLBPaQFm3NNihl4dXGWpNG/B2zGS3C8I9zSBoR1e0Oot0rNA3H9ZcBdsWGcqRw5EyzO1Fx/irGv6J5wtQIiZRZTixv2s7E6iOuOo6oTh2wQPxu9vDq4pKU6tSh6Y8hDO1uIdqFs70vd+A0R6aRu5WFXTJHtmCBdR96HsaxOMOG1bAeL2Motnlm0l10HFpBJ3WQlcyfKYUhC8fpM82KmYjY5y7C59PjB0wpvpm/15l1iC10wlWR8TUVrrBiRZkDxrW+QK6i21UChJ0QiJo74MdnNp4D/hu75cEwJsu9eGIE8fDeg6o8YdG2a0AkKPRFRLFEzNcex/tN4CkzMBBcViStcOI2InqfrpmmI8hXhWQmMtjFh+IKRl8C98zBPK5clQ55mHSvkydXJ63qhdcI0HtRbd5scPpF+wLM02z7sBFeh77obU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(376002)(136003)(396003)(346002)(230922051799003)(82310400011)(451199024)(64100799003)(186009)(1800799012)(36840700001)(46966006)(40470700004)(36756003)(4326008)(8676002)(8936002)(110136005)(2906002)(86362001)(5660300002)(44832011)(70206006)(54906003)(70586007)(316002)(966005)(83380400001)(36860700001)(6666004)(47076005)(356005)(82740400003)(81166007)(7696005)(478600001)(26005)(2616005)(16526019)(1076003)(336012)(426003)(41300700001)(40460700003)(40480700001)(148743002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 19:26:38.2297 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2f66816-19cc-4261-f1ba-08dc21c96147
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000971E7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8361
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
Cc: open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Melissa Wen <mwen@igalia.com>, "open list:ACPI" <linux-acpi@vger.kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>, Mark
 Pearson <mpearson-lenovo@squebb.ca>
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

I was going to split this separately, but decided to keep it in the same
series in case there is any decision to change the interface to
acpi_video_get_edid() at the same series.
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

