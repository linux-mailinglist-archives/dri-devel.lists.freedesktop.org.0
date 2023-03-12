Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BEE6B65BA
	for <lists+dri-devel@lfdr.de>; Sun, 12 Mar 2023 13:02:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F11710E380;
	Sun, 12 Mar 2023 12:02:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2083.outbound.protection.outlook.com [40.107.92.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB3A610E37A;
 Sun, 12 Mar 2023 12:02:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JOLw+zJbV2FVEn/CRXPcoiqhK+8aszOPmYLLtrtsCkCO9scCqGheMmntQB8iYKWgJPERv/bMFbL8BEz2zzVQvm0kg1qE0RWoLkj9a7OfvdET/HwXRlWlG/Po0exOkcZFk4/dhCFoK39Ks/cUmPHDJAy4B8KERgcp9qgqsdeKaUB//kL4FpWNZSJLOi1m6OP0qsO356ICYXfAdGEMTQa7FZ+u2bXPs6hGRtdT11uOS7aPcsOR3fhbiWIrP9kS9XQWruAlmVkQkYfIvNhRSHgNcp3Vt3EJzShFVL2X+EljH6FoVTB/S9X1O3O0KaNeyVsr6xqGyenC7YJDI61k20Lraw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o1LTPviXnOuA67LUwfQ8VmQyJX+Ek2+mzQI53Xd33fQ=;
 b=lo+BAP3t6ahfhlMHnHbPS9lKFeeqr//WUdxkn9KVsFaUes7VKHGuy9GfRYJYyvuknnP8KPIQSFaxQszsjd0DScCnn9ojh9DNP52GfMpkE8fdleKelJvP6W9gp7QbYMhKVmt/H8NGFf1mSgQqY43CCA/wLA8Z8WAw4ibcaS+zPGAGN4ilrv86yU9CEGin7jsrr7XuMwRCiixs02gy8q8D4WDr5R42/XQMAMYCARf/vn9PlYFQreBeD2ww8qP7KT6XSBOkrSw70V8nTtGmQYNLEvIk/V9Z2iZSBAdtC/5hiPXJnGp44bv52mWf46Y3lWR9FsdOYjBvEuqrci/fOYqpmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o1LTPviXnOuA67LUwfQ8VmQyJX+Ek2+mzQI53Xd33fQ=;
 b=apLkSwvlLv4S0d2LgwwVWLZwflU5fqa0u35tKzPBEJE9QAPndFgc8fFr0pPcvQWv1LBfkYf4j7O8fZTB8/RXs51/HnkxsoVz5Wbuq359gwsj1Ghfd1wHIwXNxjnpEahII5hgl4pzfZBVyMVHi7BgkhubuzXzwotBlaxGCZGF890=
Received: from MW4PR03CA0299.namprd03.prod.outlook.com (2603:10b6:303:b5::34)
 by SJ1PR12MB6242.namprd12.prod.outlook.com (2603:10b6:a03:457::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Sun, 12 Mar
 2023 12:02:38 +0000
Received: from CO1NAM11FT018.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b5:cafe::1) by MW4PR03CA0299.outlook.office365.com
 (2603:10b6:303:b5::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24 via Frontend
 Transport; Sun, 12 Mar 2023 12:02:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT018.mail.protection.outlook.com (10.13.175.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.24 via Frontend Transport; Sun, 12 Mar 2023 12:02:37 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 12 Mar
 2023 07:02:31 -0500
From: Huang Rui <ray.huang@amd.com>
To: Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
 <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [RFC PATCH 4/5] x86/xen: acpi registers gsi for xen pvh
Date: Sun, 12 Mar 2023 20:01:56 +0800
Message-ID: <20230312120157.452859-5-ray.huang@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT018:EE_|SJ1PR12MB6242:EE_
X-MS-Office365-Filtering-Correlation-Id: 66cf7cd0-10df-4759-3ca8-08db22f1ac78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f1z1c9tVrHYdtAG0verCKEhF7xH6Tfjics7QhI5chbFrWcqJ83K8UdiC841x/UQ14cPWiJTLAPAyFWTn/jjOelpzR/E+7hxBkNQzNHn/d2EQj7sB3q38Z6fJ/UIarbCzPBdDbxf2a8iktpmuXCuraduM/84Xglv6rzDyrPJ4iHfA87QC7yf85SfYYg/0sGjIRYpTj35/txoEyl1Z0L5ZZ/dfK7PD13kzdrfxEGjMjDOPCd1xR4rJ2M5HbCrKyHw4GxcSvq7jAjwdZa/PP+pQJ2HgdHK0wsF/eegLNoM461tpNviG8an/R9scPzbM9wiWwQp9Ir3bKe994kriaotln1bV9zB/ysPFP0fR9vZXex07QeW+3SIEQlnVrSSglh+ufds8jFUMTyIqB/v+RVVaRmTibXu7XZDmYDUN4IwTLUobtaDzPHyUFPN/P0ud3t+aQtyKN8ecYQbvLvffhBegeXFs8J5G2Cu/zpbK5t2BcFDN/++sSiEg3T354ncRO6G8iE4n2zk9GjDSd57xUSFMpAvM+1j0H7z6Bh+fEbgew69rS+pOS//6PimyEJq80QxsZgY7IQYMxMt68gplW7JdUYWqfIr6BI24IMnn65BWcm/MXp/sLXWeUDl+mJ9KSs2k+RVOW+DCTFcemQMCwEGYDAsUeFr7MdEZL/DQCOC+2vI9CCELc9X5j+Ms6b6ETF5vheyMCuWXkHL3NbD8PRGloSCl5ctgBVhXvamfz9IbpB8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(39860400002)(346002)(396003)(451199018)(36840700001)(40470700004)(46966006)(40460700003)(110136005)(54906003)(41300700001)(478600001)(8936002)(8676002)(70206006)(4326008)(70586007)(82310400005)(86362001)(36756003)(356005)(40480700001)(36860700001)(81166007)(82740400003)(1076003)(7696005)(186003)(16526019)(6666004)(26005)(5660300002)(7416002)(2906002)(316002)(83380400001)(426003)(336012)(47076005)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2023 12:02:37.7362 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66cf7cd0-10df-4759-3ca8-08db22f1ac78
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT018.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6242
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

Add acpi_register_gsi_xen_pvh() to register gsi for PVH mode.
In addition to call acpi_register_gsi_ioapic(), it also setup
a map between gsi and vector in hypervisor side. So that,
when dgpu create an interrupt, hypervisor can correctly find
which guest domain to process interrupt by vector.

Signed-off-by: Chen Jiqian <Jiqian.Chen@amd.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
---
 arch/x86/include/asm/apic.h      |  7 ++++++
 arch/x86/include/asm/xen/pci.h   |  5 ++++
 arch/x86/kernel/acpi/boot.c      |  2 +-
 arch/x86/pci/xen.c               | 39 ++++++++++++++++++++++++++++++++
 drivers/xen/events/events_base.c |  2 ++
 5 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/apic.h b/arch/x86/include/asm/apic.h
index 3415321c8240..f3bc5de1f1d4 100644
--- a/arch/x86/include/asm/apic.h
+++ b/arch/x86/include/asm/apic.h
@@ -179,6 +179,8 @@ extern bool apic_needs_pit(void);
 
 extern void apic_send_IPI_allbutself(unsigned int vector);
 
+extern int acpi_register_gsi_ioapic(struct device *dev, u32 gsi,
+				    int trigger, int polarity);
 #else /* !CONFIG_X86_LOCAL_APIC */
 static inline void lapic_shutdown(void) { }
 #define local_apic_timer_c2_ok		1
@@ -193,6 +195,11 @@ static inline void apic_intr_mode_init(void) { }
 static inline void lapic_assign_system_vectors(void) { }
 static inline void lapic_assign_legacy_vector(unsigned int i, bool r) { }
 static inline bool apic_needs_pit(void) { return true; }
+static inline int acpi_register_gsi_ioapic(struct device *dev, u32 gsi,
+				    int trigger, int polarity)
+{
+	return (int)gsi;
+}
 #endif /* !CONFIG_X86_LOCAL_APIC */
 
 #ifdef CONFIG_X86_X2APIC
diff --git a/arch/x86/include/asm/xen/pci.h b/arch/x86/include/asm/xen/pci.h
index 9015b888edd6..aa8ded61fc2d 100644
--- a/arch/x86/include/asm/xen/pci.h
+++ b/arch/x86/include/asm/xen/pci.h
@@ -5,6 +5,7 @@
 #if defined(CONFIG_PCI_XEN)
 extern int __init pci_xen_init(void);
 extern int __init pci_xen_hvm_init(void);
+extern int __init pci_xen_pvh_init(void);
 #define pci_xen 1
 #else
 #define pci_xen 0
@@ -13,6 +14,10 @@ static inline int pci_xen_hvm_init(void)
 {
 	return -1;
 }
+static inline int pci_xen_pvh_init(void)
+{
+	return -1;
+}
 #endif
 #ifdef CONFIG_XEN_PV_DOM0
 int __init pci_xen_initial_domain(void);
diff --git a/arch/x86/kernel/acpi/boot.c b/arch/x86/kernel/acpi/boot.c
index 907cc98b1938..25ec48dd897e 100644
--- a/arch/x86/kernel/acpi/boot.c
+++ b/arch/x86/kernel/acpi/boot.c
@@ -718,7 +718,7 @@ static int acpi_register_gsi_pic(struct device *dev, u32 gsi,
 }
 
 #ifdef CONFIG_X86_LOCAL_APIC
-static int acpi_register_gsi_ioapic(struct device *dev, u32 gsi,
+int acpi_register_gsi_ioapic(struct device *dev, u32 gsi,
 				    int trigger, int polarity)
 {
 	int irq = gsi;
diff --git a/arch/x86/pci/xen.c b/arch/x86/pci/xen.c
index b94f727251b6..43b8b6d7147b 100644
--- a/arch/x86/pci/xen.c
+++ b/arch/x86/pci/xen.c
@@ -114,6 +114,38 @@ static int acpi_register_gsi_xen_hvm(struct device *dev, u32 gsi,
 				 false /* no mapping of GSI to PIRQ */);
 }
 
+static int acpi_register_gsi_xen_pvh(struct device *dev, u32 gsi,
+				    int trigger, int polarity)
+{
+	int irq;
+	int rc;
+	struct physdev_map_pirq map_irq;
+	struct physdev_setup_gsi setup_gsi;
+
+	irq = acpi_register_gsi_ioapic(dev, gsi, trigger, polarity);
+
+	map_irq.domid = DOMID_SELF;
+	map_irq.type = MAP_PIRQ_TYPE_GSI;
+	map_irq.index = gsi;
+	map_irq.pirq = gsi;
+
+	rc = HYPERVISOR_physdev_op(PHYSDEVOP_map_pirq, &map_irq);
+	if (rc)
+		printk(KERN_ERR "xen map GSI: %u failed %d\n", gsi, rc);
+
+	setup_gsi.gsi = gsi;
+	setup_gsi.triggering = (trigger == ACPI_EDGE_SENSITIVE ? 0 : 1);
+	setup_gsi.polarity = (polarity == ACPI_ACTIVE_HIGH ? 0 : 1);
+
+	rc = HYPERVISOR_physdev_op(PHYSDEVOP_setup_gsi, &setup_gsi);
+	if (rc == -EEXIST)
+		printk(KERN_INFO "Already setup the GSI :%u\n", gsi);
+	else if (rc)
+		printk(KERN_ERR "Failed to setup GSI :%u, err_code:%d\n", gsi, rc);
+
+	return irq;
+}
+
 #ifdef CONFIG_XEN_PV_DOM0
 static int xen_register_gsi(u32 gsi, int triggering, int polarity)
 {
@@ -554,6 +586,13 @@ int __init pci_xen_hvm_init(void)
 	return 0;
 }
 
+int __init pci_xen_pvh_init(void)
+{
+	__acpi_register_gsi = acpi_register_gsi_xen_pvh;
+	__acpi_unregister_gsi = NULL;
+	return 0;
+}
+
 #ifdef CONFIG_XEN_PV_DOM0
 int __init pci_xen_initial_domain(void)
 {
diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
index c443f04aaad7..48dff0ed9acd 100644
--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -2317,6 +2317,8 @@ void __init xen_init_IRQ(void)
 	xen_init_setup_upcall_vector();
 	xen_alloc_callback_vector();
 
+	if (xen_pvh_domain())
+		pci_xen_pvh_init();
 
 	if (xen_hvm_domain()) {
 		native_init_IRQ();
-- 
2.25.1

