Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BA8847C3D
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 23:26:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C394710EBC2;
	Fri,  2 Feb 2024 22:26:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="MxYdA9Bb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2045.outbound.protection.outlook.com [40.107.102.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E1C10EBC2;
 Fri,  2 Feb 2024 22:26:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K6ycfbkXDjp3sXqp7nZjrZerCIAWixZ11psn52gZAG2CmG3NurqsGkSuXAMIzN9V0MRuXgYbOzav3uv89uFCE0juZLDxnu9Tc0maQNebbEWJbHRj6aensHz1dIS/mC0w/i+aS+WsH5m/qSMDXRN1WaGkpg6XUIZAbEfVFGiPf5RDFI+mfFlOaUrNtJ5IbqJdGze/QlogBBZhWImEN4o6n1Nol0x9MXyZxVVtkxRpETryztVoQk2gmvAUbMuFrm3PlgI/uW7tSAUoxo30UrObgk+Z9hj433gIWJznDpkCzYT5HU17LnPNnQKjlvnu3TRUlJ3RFZnDWS/2UQeT3CXBKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P81v5G7zBPiTwN6St3VYTvaErPmQ4ZxmantP7vYOP00=;
 b=kP+iWeW8EwbPmMNgverndu23ewJ9aPPWxhrilC/kxT89c1WXku3UQSMfwUtE7WhOPVHnHqHbNnT51EopfL27NiGIxoAaFAgptZeT/1m36uPNvfsSdNL7TJbSCDO9s/MVqkkLve8VT/7eXPFaxS0o8Hoa6zE1mTPnOzXMkRg5D1k+XkxDQYmp7rBRNirWL/yqWT+CmsCFgqQt/pI5ZR48nxEhqZTJD6YAMF6fX+GaahkVZO2yYuRT3/zFI0brnwt7vjTIkplMUaunNdJhYiEuOA+WAyfbZJHGsrqis8OR4ZaCrbZ65oamjeJ0GF99ckUcmCJ9T+NL2hTTUpK2OKvksw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P81v5G7zBPiTwN6St3VYTvaErPmQ4ZxmantP7vYOP00=;
 b=MxYdA9Bb77S0wiKtwUSYoXee9ZNG6GFwr/VVGl1yMdLUtNDlA5HDAFBKvzcGdFQJSxbkqdEnGFTqjh40BuMqb5QTfKSHE5ETo4Z3GT1F6yonlvjFA5ChnM/S4q7qmcfZR67iqNAjSLyasNvZkZopMAZ0HkJsvSLxw3HSuZSgaPk=
Received: from CY5PR18CA0049.namprd18.prod.outlook.com (2603:10b6:930:13::17)
 by CH3PR12MB7714.namprd12.prod.outlook.com (2603:10b6:610:14e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.12; Fri, 2 Feb
 2024 22:26:24 +0000
Received: from CY4PEPF0000EE35.namprd05.prod.outlook.com
 (2603:10b6:930:13:cafe::6d) by CY5PR18CA0049.outlook.office365.com
 (2603:10b6:930:13::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.26 via Frontend
 Transport; Fri, 2 Feb 2024 22:26:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE35.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Fri, 2 Feb 2024 22:26:24 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 2 Feb
 2024 16:26:22 -0600
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <linux-kernel@vger.kernel.org>
CC: Hamza Mahfooz <hamza.mahfooz@amd.com>, <stable@vger.kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, Mario Limonciello
 <mario.limonciello@amd.com>, Lijo Lazar <lijo.lazar@amd.com>, "Srinivasan
 Shanmugam" <srinivasan.shanmugam@amd.com>, Le Ma <le.ma@amd.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>, James Zhu
 <James.Zhu@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>, "Joerg
 Roedel" <jroedel@suse.de>, Iwona Winiarska <iwona.winiarska@intel.com>,
 "Robin Murphy" <robin.murphy@arm.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-pci@vger.kernel.org>
Subject: [PATCH 1/3] driver core: bus: introduce can_remove()
Date: Fri, 2 Feb 2024 17:25:54 -0500
Message-ID: <20240202222603.141240-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE35:EE_|CH3PR12MB7714:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ee22a2a-0b2d-4df5-03b1-08dc243dfd9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vxya4GWHqRY8KdRp4AaJ9XPsT0VO4DYdHXtLHCINLCUwd/x+E1lREXa+ND5kEectVUNalYWcAHWk8Za4G3kQm7059Gv6B5U/W/otqfEK3r+dro6ezheyNKiRBmwxKEykqsct01sVSEHvpqmAl6qK+gzPbM5jcqChztkypsFg7Iq4yWx2wBq3SIAuKmUYiEvPCWT4Ve/kNHqM2d2m4N3738LIgYDHhYhrHY9ZR9BMRgm4jUfN1Lo6SQbbhv2SGDTD2SgmpsflvCW/5AFIfX1e4gkDkn6uIbWjWL/E5W6ZgvqjdvIdAM4zpXjcDfNh72kkGZi0j+SZdqzK2shi6tOrY2/N0s2cc0ScnB+6FIAH6wGaHOuqRYxwE70vid4i7Rqb4xzj44Bjvv5BchTDwz2qJSj3nLrLfd0+xkTFrhq4NpHnoUM8rnuQvDTSMYj+w+v7Pl+uvjhpLU5DECjUkZsNVmzBk1PaL/+gUBvjNRxzrDSUsCTxUx7ZYVDKPjwa5nwlytgVwGyqSuVLeb9umhuBKnhCQir8W0/Iz8m9LoG585E2vFp7r/+ba4JiGDh5R30f8s0ZgN9FPFAnGXtcoPBSM9mi6MhMDF9D/QeJ654b9+F7LG/JxktK+KmNkhsgcI8/tkA9BJVIx0XW1JrRm+Iu9ePggvpw9mo2Pm9Lye/IU9hyTwgWFyj9dFWuX4zmrRNUX0XOw3LjfvMjWeLqO6LbTMZQsFRbcVmd+oiFEj/9+QTB4dfzijhnRflxLUrAWru87MiVlrEv+q3yqUUjpTQnxCbf//B8eFrBUKixFocdYQu8NrWa9fU1v27s9+CYRJew
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(136003)(39860400002)(396003)(346002)(230922051799003)(64100799003)(82310400011)(186009)(1800799012)(451199024)(36840700001)(40470700004)(46966006)(478600001)(41300700001)(82740400003)(83380400001)(40480700001)(36860700001)(40460700003)(81166007)(356005)(47076005)(336012)(16526019)(6666004)(6916009)(54906003)(5660300002)(36756003)(316002)(44832011)(8676002)(8936002)(4326008)(426003)(70206006)(7416002)(26005)(70586007)(2906002)(86362001)(2616005)(1076003)(16060500005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 22:26:24.5426 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ee22a2a-0b2d-4df5-03b1-08dc243dfd9e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE35.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7714
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

Currently, drivers have no mechanism to block requests to unbind
devices. However, this can cause resource leaks and leave the device in
an inconsistent state, such that rebinding the device may cause a hang
or otherwise prevent the device from being rebound. So, introduce
the can_remove() callback to allow drivers to indicate if it isn't
appropriate to remove a device at the given time.

Cc: stable@vger.kernel.org
Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 drivers/base/bus.c         | 4 ++++
 include/linux/device/bus.h | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/drivers/base/bus.c b/drivers/base/bus.c
index daee55c9b2d9..7c259b01ea99 100644
--- a/drivers/base/bus.c
+++ b/drivers/base/bus.c
@@ -239,6 +239,10 @@ static ssize_t unbind_store(struct device_driver *drv, const char *buf,
 
 	dev = bus_find_device_by_name(bus, NULL, buf);
 	if (dev && dev->driver == drv) {
+		if (dev->bus && dev->bus->can_remove &&
+		    !dev->bus->can_remove(dev))
+			return -EBUSY;
+
 		device_driver_detach(dev);
 		err = count;
 	}
diff --git a/include/linux/device/bus.h b/include/linux/device/bus.h
index 5ef4ec1c36c3..c9d4af0ed3b8 100644
--- a/include/linux/device/bus.h
+++ b/include/linux/device/bus.h
@@ -46,6 +46,7 @@ struct fwnode_handle;
  *		be called at late_initcall_sync level. If the device has
  *		consumers that are never bound to a driver, this function
  *		will never get called until they do.
+ * @can_remove: Called before attempting to remove a device from this bus.
  * @remove:	Called when a device removed from this bus.
  * @shutdown:	Called at shut-down time to quiesce the device.
  *
@@ -85,6 +86,7 @@ struct bus_type {
 	int (*uevent)(const struct device *dev, struct kobj_uevent_env *env);
 	int (*probe)(struct device *dev);
 	void (*sync_state)(struct device *dev);
+	bool (*can_remove)(struct device *dev);
 	void (*remove)(struct device *dev);
 	void (*shutdown)(struct device *dev);
 
-- 
2.43.0

