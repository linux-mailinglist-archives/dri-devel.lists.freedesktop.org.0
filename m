Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 842B06B65C1
	for <lists+dri-devel@lfdr.de>; Sun, 12 Mar 2023 13:02:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEA0010E382;
	Sun, 12 Mar 2023 12:02:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2064.outbound.protection.outlook.com [40.107.93.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE23610E38A;
 Sun, 12 Mar 2023 12:02:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cIEhsH3FHzzJszUchQXJL8zIXdNQDpnDrw5YR1iWhf3JqSb+npnGL8KY/s7Tz9moHKDljXjF6FhlkjS4tcJN4LjdZcxNMWqeK4szu3dRwx6GY/EkhfK8yHP6ai1MFrplsxRpgrz+VqtbsMv/ZZh9PXM8SMdcp5MkiPIj//Yqt8yULPljJAo4kCveWET2gOT8DEf94mkm+HQX7PZjF5W0XBJ/5W/4qu8Hvh+B6EqQhunOOy92o1stDx3JUnWOESXCaILxy2LcYJ/gUbsz3Zg6laBFmM43pWvBqFg+XLQUejBjKocp+WARpp8MO5IeyZB2CWYXOH7Nrpbl2Glmg1YzPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MS43mNiSDBnUD+5Kh3C9BXVuF+iauADexFTUQZ11670=;
 b=mOEp3D8NQjGlqFH+HmOeBi++mMyqWq9VaOyVADASll39IzSzPbWRFRwF3Xka/uKxW7gcku/cil5NZvTO2Mgw4pC4ETnAwtSiaDnVWqY9tjmKPHw+pWp5arRAQM9Qlp0v2IH1S6wg+CdVIAJaKEgZfaY59YK7OI0SYRpy318GZGp+ZuCWi7eZUs0fMbwxF4gHvhm51zdGPLXpyDBI7hLfzYZ2GCDwxzdd+oqEvdpDcszKvr9Kq7BxFAK0oWMuBIKbVIkvHp3Qr25QI2sjFvB2svbqg6j0G/7yqKMFlwg4l35ZYczhNWFoerYcoOVbT2SnmXwukAkpERTfDRQWGmuh/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MS43mNiSDBnUD+5Kh3C9BXVuF+iauADexFTUQZ11670=;
 b=Hs2pDP9E3kWxAQCCJAcQP1FV+/2g4JLujIAyL33KTb+XQ9szn3dQ3H3lWB9WBPoFzM247lyxuPxe+Fuy/SONBEmJmrw7r5cXsnti2t/z1ReENZRTwH/ynVeR4DozNZ4fBGtaLsIw4754DKiXzI4DTcHp+dkmrZ6Mb+UEsBcuQy0=
Received: from MW3PR05CA0012.namprd05.prod.outlook.com (2603:10b6:303:2b::17)
 by CY8PR12MB7194.namprd12.prod.outlook.com (2603:10b6:930:5a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.23; Sun, 12 Mar
 2023 12:02:41 +0000
Received: from CO1NAM11FT049.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2b:cafe::c3) by MW3PR05CA0012.outlook.office365.com
 (2603:10b6:303:2b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.25 via Frontend
 Transport; Sun, 12 Mar 2023 12:02:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT049.mail.protection.outlook.com (10.13.175.50) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.24 via Frontend Transport; Sun, 12 Mar 2023 12:02:40 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 12 Mar
 2023 07:02:35 -0500
From: Huang Rui <ray.huang@amd.com>
To: Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
 <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [RFC PATCH 5/5] xen/privcmd: add IOCTL_PRIVCMD_GSI_FROM_IRQ
Date: Sun, 12 Mar 2023 20:01:57 +0800
Message-ID: <20230312120157.452859-6-ray.huang@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230312120157.452859-1-ray.huang@amd.com>
References: <20230312120157.452859-1-ray.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT049:EE_|CY8PR12MB7194:EE_
X-MS-Office365-Filtering-Correlation-Id: 16c46202-8a5e-45eb-c067-08db22f1ae6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KcLg3hFsSzECn1tAEfGEEV/+r3fQgsh4/cphmQrp/dlmbIp1CaY3Y+XaB4ohSHvzCNUf1EGPLMzvQLbLbgoDVTIiMEIL2XkIfkAcCaInm2XuSatPgwgqKn1Kt3oTqNMtvDPffM+mpV0NKRD/TKPbWXqN+Fjx8nadhVkDQOeSgnwtpw/QxTqlTZmBkjQCnPij5RBH3pubLdTcQS4WwoViXIg0aYamzOvuFpMmzS+FVJwE8hwL/LO5Wh8By7URW6c5C9ohN+uzCLOiBY5KTm029pGblscwNF9HUqFmRLX/Sx8/CeIr/KJ4fqG8C1EWCnqVhwKUg7kGXRGp8oBxjuda3sPkPIU1QNrYm00Nzb0rBgVcFpjgwTemfE3TPdI68H/Qj6QqYQdKpNp7VZzl9i08PS9Rr9xLD28qZEjcn4v9WqpgZSkO5B5tFfKvYfN60j1yj6tEk1osXsKHQrs0UoX17rwCY+/fRuy442utGwGMYj4VfXZu2vTdHBWqd6uBcEadebv9ttP/OgaPHiczDZQ+rKsDjIHxJ0Jf8fwHcsQJ5/zZI+15xoE95lwLkcb+yCHno3qR/pFnn3YDkqNIisVTSYTl21BQ5eWQPk1jHVGzTrLbtRYU2xlN6ZtHG9TWBQfkD5SmR3kco+/zge6kBRtuMKFKtnX52NWfl8lgZiOSdxWztd+VCfmQRq/b4E/NyKXBWyZx7odLThOPV2zKFc59HyqbbF1gddaEXOkVSX1OK48=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(396003)(346002)(376002)(39860400002)(451199018)(40470700004)(46966006)(36840700001)(40460700003)(4326008)(5660300002)(8936002)(7416002)(41300700001)(2906002)(86362001)(36860700001)(82740400003)(81166007)(356005)(36756003)(7696005)(70586007)(70206006)(6666004)(8676002)(40480700001)(82310400005)(426003)(47076005)(110136005)(478600001)(54906003)(316002)(186003)(26005)(1076003)(16526019)(336012)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2023 12:02:40.9513 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16c46202-8a5e-45eb-c067-08db22f1ae6e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT049.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7194
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
Cc: Honglei Huang <honglei1.huang@amd.com>, Stewart
 Hildebrand <Stewart.Hildebrand@amd.com>, Huang Rui <ray.huang@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>, Xenia Ragiadakou <burzalodowa@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, Julia Zhang <julia.zhang@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chen Jiqian <Jiqian.Chen@amd.com>

When hypervisor get an interrupt, it needs interrupt's
gsi number instead of irq number. Gsi number is unique
in xen, but irq number is only unique in one domain.
So, we need to record the relationship between irq and
gsi when dom0 initialized pci devices, and provide syscall
IOCTL_PRIVCMD_GSI_FROM_IRQ to translate irq to gsi. So
that, we can map pirq successfully in hypervisor side.

Signed-off-by: Chen Jiqian <Jiqian.Chen@amd.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
---
 arch/x86/pci/xen.c               |  4 ++++
 drivers/xen/events/events_base.c | 37 ++++++++++++++++++++++++++++++++
 drivers/xen/privcmd.c            | 20 +++++++++++++++++
 include/uapi/xen/privcmd.h       |  7 ++++++
 include/xen/events.h             |  5 +++++
 5 files changed, 73 insertions(+)

diff --git a/arch/x86/pci/xen.c b/arch/x86/pci/xen.c
index 43b8b6d7147b..3237961c7640 100644
--- a/arch/x86/pci/xen.c
+++ b/arch/x86/pci/xen.c
@@ -143,6 +143,10 @@ static int acpi_register_gsi_xen_pvh(struct device *dev, u32 gsi,
 	else if (rc)
 		printk(KERN_ERR "Failed to setup GSI :%u, err_code:%d\n", gsi, rc);
 
+	rc = xen_pvh_add_gsi_irq_map(gsi, irq);
+	if (rc == -EEXIST)
+		printk(KERN_INFO "Already map the GSI :%u and IRQ: %d\n", gsi, irq);
+
 	return irq;
 }
 
diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
index 48dff0ed9acd..39a57fed2de3 100644
--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -967,6 +967,43 @@ int xen_irq_from_gsi(unsigned gsi)
 }
 EXPORT_SYMBOL_GPL(xen_irq_from_gsi);
 
+int xen_gsi_from_irq(unsigned irq)
+{
+	struct irq_info *info;
+
+	list_for_each_entry(info, &xen_irq_list_head, list) {
+		if (info->type != IRQT_PIRQ)
+			continue;
+
+		if (info->irq == irq)
+			return info->u.pirq.gsi;
+	}
+
+	return -1;
+}
+EXPORT_SYMBOL_GPL(xen_gsi_from_irq);
+
+int xen_pvh_add_gsi_irq_map(unsigned gsi, unsigned irq)
+{
+	int tmp_irq;
+	struct irq_info *info;
+
+	tmp_irq = xen_irq_from_gsi(gsi);
+	if (tmp_irq != -1)
+		return -EEXIST;
+
+	info = kzalloc(sizeof(*info), GFP_KERNEL);
+	if (info == NULL)
+		panic("Unable to allocate metadata for GSI%d\n", gsi);
+
+	info->type = IRQT_PIRQ;
+	info->irq = irq;
+	info->u.pirq.gsi = gsi;
+	list_add_tail(&info->list, &xen_irq_list_head);
+
+	return 0;
+}
+
 static void __unbind_from_irq(unsigned int irq)
 {
 	evtchn_port_t evtchn = evtchn_from_irq(irq);
diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index e88e8f6f0a33..830e84451731 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -37,6 +37,7 @@
 #include <xen/page.h>
 #include <xen/xen-ops.h>
 #include <xen/balloon.h>
+#include <xen/events.h>
 
 #include "privcmd.h"
 
@@ -833,6 +834,21 @@ static long privcmd_ioctl_mmap_resource(struct file *file,
 	return rc;
 }
 
+static long privcmd_ioctl_gsi_from_irq(struct file *file, void __user *udata)
+{
+	struct privcmd_gsi_from_irq kdata;
+
+	if (copy_from_user(&kdata, udata, sizeof(kdata)))
+		return -EFAULT;
+
+	kdata.gsi = xen_gsi_from_irq(kdata.irq);
+
+	if (copy_to_user(udata, &kdata, sizeof(kdata)))
+		return -EFAULT;
+
+	return 0;
+}
+
 static long privcmd_ioctl(struct file *file,
 			  unsigned int cmd, unsigned long data)
 {
@@ -868,6 +884,10 @@ static long privcmd_ioctl(struct file *file,
 		ret = privcmd_ioctl_mmap_resource(file, udata);
 		break;
 
+	case IOCTL_PRIVCMD_GSI_FROM_IRQ:
+		ret = privcmd_ioctl_gsi_from_irq(file, udata);
+		break;
+
 	default:
 		break;
 	}
diff --git a/include/uapi/xen/privcmd.h b/include/uapi/xen/privcmd.h
index d2029556083e..55fe748bbfd7 100644
--- a/include/uapi/xen/privcmd.h
+++ b/include/uapi/xen/privcmd.h
@@ -98,6 +98,11 @@ struct privcmd_mmap_resource {
 	__u64 addr;
 };
 
+struct privcmd_gsi_from_irq {
+	__u32 irq;
+	__u32 gsi;
+};
+
 /*
  * @cmd: IOCTL_PRIVCMD_HYPERCALL
  * @arg: &privcmd_hypercall_t
@@ -125,5 +130,7 @@ struct privcmd_mmap_resource {
 	_IOC(_IOC_NONE, 'P', 6, sizeof(domid_t))
 #define IOCTL_PRIVCMD_MMAP_RESOURCE				\
 	_IOC(_IOC_NONE, 'P', 7, sizeof(struct privcmd_mmap_resource))
+#define IOCTL_PRIVCMD_GSI_FROM_IRQ				\
+	_IOC(_IOC_NONE, 'P', 8, sizeof(struct privcmd_gsi_from_irq))
 
 #endif /* __LINUX_PUBLIC_PRIVCMD_H__ */
diff --git a/include/xen/events.h b/include/xen/events.h
index 344081e71584..8377d8dfaa71 100644
--- a/include/xen/events.h
+++ b/include/xen/events.h
@@ -133,6 +133,11 @@ int xen_pirq_from_irq(unsigned irq);
 /* Return the irq allocated to the gsi */
 int xen_irq_from_gsi(unsigned gsi);
 
+/* Return the gsi from irq */
+int xen_gsi_from_irq(unsigned irq);
+
+int xen_pvh_add_gsi_irq_map(unsigned gsi, unsigned irq);
+
 /* Determine whether to ignore this IRQ if it is passed to a guest. */
 int xen_test_irq_shared(int irq);
 
-- 
2.25.1

