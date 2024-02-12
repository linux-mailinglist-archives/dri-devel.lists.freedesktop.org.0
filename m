Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E589851F56
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 22:16:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C28AC10E5AF;
	Mon, 12 Feb 2024 21:16:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="XMIK6suj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2079.outbound.protection.outlook.com [40.107.220.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65EE010E3D2;
 Mon, 12 Feb 2024 21:16:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QpBqHRHd4m/6ss1XIOJ60I0BRl7TVLnS5Q2X1ptRhczBy5pe/adEaXzh9+OUJ4UuGRMEDxfstiAlk8lpgfQHndz/YqWa0bxv5NIrMeiPWy5BeprpISnQjl9xE3O3t8twZ1cGz0PQwUsuR1GDJEUe77XWPxckgHMtgdqOW/EvnjQ47+06EAYUgD4lI6UaGzACOgdMg9OvOARlOpEMbQz6QnWI1ehFIbHn3UrPVReDkXgcnuw1CCcd2AsP0kJWtxaHpppXuTrKIm6/BZAWseLjL5HIWTl2myIP4O8QWnr1YBjeDcp89ZMRWXu2In90Yu7y/wZGD6WxhviWI49fXrjT3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jurtFpPky2rTAr7zBd0w6oCAWMb+lT0VIckZxa/oYl4=;
 b=jfj27gdfdREKOhBJ9eyLPQ+Bpv6Jt6Cofsoc+zWzdc37C+ailVU6R9YmdulryAT+Ax5fLg5QJrGX9KYuH9HQ1we51OIwxK56YQpTKfoWfFKaw8k4baIXv5GCpqqKiXczr30eT122tLGreVH+e+s4DtJgdjErVz4O55B4W1GLxvimCTuqrwOIrJOf03eamhBwaxLvuOireR8nu7Mv1rDOzOvXQ7x6QViYqHuhwnciDNhqWKfqQ79k9TstqxB83EOKVz9SOVXXcaMWZgNW6skdhrHIdKCzeD8o0jTPkH57XOiKfnHOXOF0WeT1DXav/dCWP3t6rqDzsMTrjW1os5UDyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jurtFpPky2rTAr7zBd0w6oCAWMb+lT0VIckZxa/oYl4=;
 b=XMIK6sujvnTHbF9vkHN6x5MS1b/PA9C9HlZryF/UEkwRFNWrhGP+c/68aVVC1MVBvAMGPJz6K3xsjkytfEYfKeSOnZ5EqE1DlQo+rBAuB34ofXwoEiOtpkUcECN4+Fh8xDOjdAy/sCMjQPmENm5rHe3uapt5p8PK7/Fr/NTwjSpc4ax5y1tsfzorip0Y8Dj4SbmJsszpM+JNGMaBx9GJr6gEeRu69VoQ3hBIJu/QmyS4fJ/U1vDjixLQ6BC7EGVaUnSjckD/WwrfP/LW5+aFkKJYL6KwcD2TEAz02+HWnTHoR2+qSebK+zNBmAA2tCcjr+vGEZMH1oSfh+quwoEuhQ==
Received: from DM6PR02CA0098.namprd02.prod.outlook.com (2603:10b6:5:1f4::39)
 by MW4PR12MB7189.namprd12.prod.outlook.com (2603:10b6:303:224::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.24; Mon, 12 Feb
 2024 21:16:11 +0000
Received: from SA2PEPF000015CD.namprd03.prod.outlook.com
 (2603:10b6:5:1f4:cafe::25) by DM6PR02CA0098.outlook.office365.com
 (2603:10b6:5:1f4::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39 via Frontend
 Transport; Mon, 12 Feb 2024 21:16:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF000015CD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.19 via Frontend Transport; Mon, 12 Feb 2024 21:16:11 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Mon, 12 Feb
 2024 13:15:53 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 12 Feb
 2024 13:15:53 -0800
Received: from ttabi.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 12 Feb 2024 13:15:52 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Dave Airlie <airlied@redhat.com>, Lyude Paul <lyude@redhat.com>, "Danilo
 Krummrich" <dakr@redhat.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/2] [v3] nouveau: add command-line GSP-RM registry support
Date: Mon, 12 Feb 2024 15:15:47 -0600
Message-ID: <20240212211548.1094496-2-ttabi@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240212211548.1094496-1-ttabi@nvidia.com>
References: <20240212211548.1094496-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CD:EE_|MW4PR12MB7189:EE_
X-MS-Office365-Filtering-Correlation-Id: c5ac3e00-46fc-49d9-58c2-08dc2c0fd699
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XzGu5OhMb8EJKbpmSCxdD4rSRMVWY5vItZqJeFBKL0K5NU6Rw9bE0xjcwnkqXQbvyWtN5lx2duuxLyp5O7jdRZRRr96rubaE491adQkyJs0p78qdcjTQEhRW+XGaVB6m3KCOe2BJU0pi9zzuucbFGzPd5idh4VnT8f7Kt/wO+dEZ803RPCYpBk2+ySQtTHxcikafisa1rov2ESgNw6S/Z2oW3vNR1lksMEAM4gOY3QnYq5teeMva+CImnHmCpwJodeTslHwDPhn+UyvcTBMQRV91pQStkLJ4IE11Wkj+Zet3Xi5R8MYdLMe/qLlQwFD/9OQrkMWvV2KkZZ9vIg1zXIF4IqCI1DEIzUjvyLmmgMhG8hgv5zE9ZGgwftte8GCYOUsqGJ5gDgV1OLNCMdca+8peyU0SCKsUp9fVyIoaOayLSP0gwMupmd/M38InT/nM+ywkVWlTADh8Nb4yfXv11fc7G/MToLkV32zVp/Hb2sRJpmP06WMq3erg/jtEaC8nGr8lbh9pLIxDu5wtx83AgUvqOxcq4VPf5tUki4ZaAp8ZKrRHlA+ScCX4vmiKjTCJJyi+P9T/W8ZMOjbbc04TLK9dgBLKyKuljnWBIq52AT4=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(136003)(39860400002)(396003)(376002)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(82310400011)(36840700001)(46966006)(40470700004)(86362001)(70206006)(5660300002)(30864003)(70586007)(8676002)(8936002)(7696005)(2906002)(478600001)(336012)(7636003)(26005)(82740400003)(356005)(83380400001)(41300700001)(1076003)(2616005)(426003)(316002)(6666004)(36756003)(110136005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2024 21:16:11.4710 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5ac3e00-46fc-49d9-58c2-08dc2c0fd699
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7189
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

Add the NVreg_RegistryDwords command line parameter, which allows
specifying additional registry keys to be sent to GSP-RM.  This
allows additional configuration, debugging, and experimentation
with GSP-RM, which uses these keys to alter its behavior.

Note that these keys are passed as-is to GSP-RM, and Nouveau does
not parse them.  This is in contrast to the Nvidia driver, which may
parse some of the keys to configure some functionality in concert with
GSP-RM.  Therefore, any keys which also require action by the driver
may not function correctly when passed by Nouveau.  Caveat emptor.

The name and format of NVreg_RegistryDwords is the same as used by
the Nvidia driver, to maintain compatibility.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
v3: rebased to drm-next

 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |   6 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 279 ++++++++++++++++--
 2 files changed, 261 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
index 6f5d376d8fcc..3fbc57b16a05 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
@@ -211,6 +211,12 @@ struct nvkm_gsp {
 		struct mutex mutex;;
 		struct idr idr;
 	} client_id;
+
+	/* A linked list of registry items. The registry RPC will be built from it. */
+	struct list_head registry_list;
+
+	/* The size of the registry RPC */
+	size_t registry_rpc_size;
 };
 
 static inline bool
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 1c46e3f919be..86b62c7e1229 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -54,6 +54,8 @@
 #include <nvrm/535.113.01/nvidia/kernel/inc/vgpu/rpc_global_enums.h>
 
 #include <linux/acpi.h>
+#include <linux/ctype.h>
+#include <linux/parser.h>
 
 #define GSP_MSG_MIN_SIZE GSP_PAGE_SIZE
 #define GSP_MSG_MAX_SIZE GSP_PAGE_MIN_SIZE * 16
@@ -1082,51 +1084,280 @@ r535_gsp_rpc_unloading_guest_driver(struct nvkm_gsp *gsp, bool suspend)
 	return nvkm_gsp_rpc_wr(gsp, rpc, true);
 }
 
+struct registry_list_entry {
+	struct list_head list;
+	size_t name_len;
+	u32 type;
+	u32 data;
+	u32 length;
+	char name[];
+};
+
+/**
+ * add_registry -- adds a registry entry
+ * @gsp: gsp pointer
+ * @name: name of the registry key
+ * @type: type of data (1 = integer)
+ * @data: value
+ * @length: size of data, in bytes
+ *
+ * Adds a registry key/value pair to the registry database.
+ *
+ * Currently, only 32-bit integers (type == 1, length == 4) are supported.
+ *
+ * This function collects the registry information in a linked list.  After
+ * all registry keys have been added, build_registry() is used to create the
+ * RPC data structure.
+ *
+ * registry_rpc_size is a running total of the size of all registry keys.
+ * It's used to avoid an O(n) calculation of the size when the RPC is built.
+ *
+ * Returns 0 on success, or negative error code on error.
+ */
+static int add_registry(struct nvkm_gsp *gsp, const char *name, u32 type, u32 data, u32 length)
+{
+	struct registry_list_entry *reg;
+	size_t nlen = strlen(name) + 1;
+
+	/* Set an arbitrary limit to avoid problems with broken command lines */
+	if (strlen(name) > 64)
+		return -EFBIG;
+
+	reg = kmalloc(sizeof(struct registry_list_entry) + nlen, GFP_KERNEL);
+	if (!reg)
+		return -ENOMEM;
+
+	memcpy(reg->name, name, nlen);
+	reg->name_len = nlen;
+	reg->type = type;
+	reg->data = data;
+	reg->length = length;
+
+	nvkm_debug(&gsp->subdev, "adding GSP-RM registry '%s=%u'\n", name, data);
+	list_add_tail(&reg->list, &gsp->registry_list);
+	gsp->registry_rpc_size += sizeof(PACKED_REGISTRY_ENTRY) + nlen;
+
+	return 0;
+}
+
+static int add_registry_num(struct nvkm_gsp *gsp, const char *name, u32 value)
+{
+	return add_registry(gsp, name, 1, value, sizeof(u32));
+}
+
+/**
+ * build_registry -- create the registry RPC data
+ * @gsp: gsp pointer
+ * @registry: pointer to the RPC payload to fill
+ *
+ * After all registry key/value pairs have been added, call this function to
+ * build the RPC.
+ *
+ * The registry RPC looks like this:
+ *
+ * +-----------------+
+ * |NvU32 size;      |
+ * |NvU32 numEntries;|
+ * +-----------------+
+ * +---------------------+
+ * |PACKED_REGISTRY_ENTRY|
+ * +---------------------+
+ * |PACKED_REGISTRY_ENTRY|
+ * +---------------------+
+ * ... (one copy for each entry)
+ *
+ * +----------------------------------+
+ * |Null-terminated string for entry 0|
+ * +----------------------------------+
+ * |Null-terminated string for entry 1|
+ * +----------------------------------+
+ * ... (one copy for each entry)
+ *
+ * All memory allocated by add_registry() is released.
+ */
+static void build_registry(struct nvkm_gsp *gsp, PACKED_REGISTRY_TABLE *registry)
+{
+	struct registry_list_entry *reg, *n;
+	size_t str_offset;
+	unsigned int i = 0;
+
+	registry->numEntries = list_count_nodes(&gsp->registry_list);
+	str_offset = struct_size(registry, entries, registry->numEntries);
+
+	list_for_each_entry_safe(reg, n, &gsp->registry_list, list) {
+		registry->entries[i].type = reg->type;
+		registry->entries[i].data = reg->data;
+		registry->entries[i].length = reg->length;
+		registry->entries[i].nameOffset = str_offset;
+		memcpy((void *)registry + str_offset, reg->name, reg->name_len);
+		str_offset += reg->name_len;
+		i++;
+
+		list_del(&reg->list);
+		kfree(reg);
+	}
+
+	/* Double-check that we calculated the sizes correctly */
+	WARN_ON(gsp->registry_rpc_size != str_offset);
+
+	registry->size = gsp->registry_rpc_size;
+}
+
+/**
+ * clean_registry -- clean up registry memory in case of error
+ * @gsp: gsp pointer
+ *
+ * Call this function to clean up all memory allocated by add_registry()
+ * in case of error and build_registry() is not called.
+ */
+static void clean_registry(struct nvkm_gsp *gsp)
+{
+	struct registry_list_entry *reg, *n;
+
+	list_for_each_entry_safe(reg, n, &gsp->registry_list, list) {
+		list_del(&reg->list);
+		kfree(reg);
+	}
+
+	gsp->registry_rpc_size = sizeof(PACKED_REGISTRY_TABLE);
+}
+
+MODULE_PARM_DESC(NVreg_RegistryDwords,
+		 "A semicolon-separated list of key=integer pairs of GSP-RM registry keys");
+static char *NVreg_RegistryDwords;
+module_param(NVreg_RegistryDwords, charp, 0400);
+
 /* dword only */
 struct nv_gsp_registry_entries {
 	const char *name;
 	u32 value;
 };
 
+/**
+ * r535_registry_entries - required registry entries for GSP-RM
+ *
+ * This array lists registry entries that are required for GSP-RM to
+ * function correctly.
+ *
+ * RMSecBusResetEnable - enables PCI secondary bus reset
+ * RMForcePcieConfigSave - forces GSP-RM to preserve PCI configuration
+ *   registers on any PCI reset.
+ */
 static const struct nv_gsp_registry_entries r535_registry_entries[] = {
 	{ "RMSecBusResetEnable", 1 },
 	{ "RMForcePcieConfigSave", 1 },
 };
 #define NV_GSP_REG_NUM_ENTRIES ARRAY_SIZE(r535_registry_entries)
 
+/**
+ * strip - strips all characters in 'reject' from 's'
+ * @s: string to strip
+ * @reject: string of characters to remove
+ *
+ * 's' is modified.
+ *
+ * Returns the length of the new string.
+ */
+static size_t strip(char *s, const char *reject)
+{
+	char *p = s, *p2 = s;
+	size_t length = 0;
+	char c;
+
+	do {
+		while ((c = *p2) && strchr(reject, c))
+			p2++;
+
+		*p++ = c = *p2++;
+		length++;
+	} while (c);
+
+	return length;
+}
+
+/**
+ * r535_gsp_rpc_set_registry - build registry RPC and call GSP-RM
+ * @gsp: gsp pointer
+ *
+ * The GSP-RM registry is a set of key/value pairs that configure some aspects
+ * of GSP-RM. The keys are strings, and the values are 32-bit integers.
+ *
+ * The registry is built from a combination of a static hard-coded list (see
+ * above) and entries passed on the driver's command line.
+ */
 static int
 r535_gsp_rpc_set_registry(struct nvkm_gsp *gsp)
 {
 	PACKED_REGISTRY_TABLE *rpc;
-	char *strings;
-	int str_offset;
-	int i;
-	size_t rpc_size = struct_size(rpc, entries, NV_GSP_REG_NUM_ENTRIES);
+	unsigned int i;
+	int ret;
 
-	/* add strings + null terminator */
-	for (i = 0; i < NV_GSP_REG_NUM_ENTRIES; i++)
-		rpc_size += strlen(r535_registry_entries[i].name) + 1;
+	INIT_LIST_HEAD(&gsp->registry_list);
+	gsp->registry_rpc_size = sizeof(PACKED_REGISTRY_TABLE);
 
-	rpc = nvkm_gsp_rpc_get(gsp, NV_VGPU_MSG_FUNCTION_SET_REGISTRY, rpc_size);
-	if (IS_ERR(rpc))
-		return PTR_ERR(rpc);
+	/* Add the required registry entries first */
+	for (i = 0; i < NV_GSP_REG_NUM_ENTRIES; i++) {
+		ret = add_registry_num(gsp, r535_registry_entries[i].name,
+				 r535_registry_entries[i].value);
+		if (ret) {
+			clean_registry(gsp);
+			return ret;
+		}
+	}
+
+	/*
+	 * The NVreg_RegistryDwords parameter is a string of key=value
+	 * pairs separated by semicolons. We need to extract and trim each
+	 * substring, and then parse the substring to extract the key and
+	 * value.
+	 */
+	if (NVreg_RegistryDwords) {
+		char *p = kstrdup(NVreg_RegistryDwords, GFP_KERNEL);
+		char *start, *next = p, *equal;
+		size_t length;
+
+		/* Remove any whitespace from the parameter string */
+		length = strip(p, " \t\n");
+
+		while ((start = strsep(&next, ";"))) {
+			long value;
+
+			equal = strchr(start, '=');
+			if (!equal || (equal == start) || !isdigit(equal[1])) {
+				nvkm_error(&gsp->subdev,
+					"ignoring invalid registry string '%s'\n", start);
+				continue;
+			}
 
-	rpc->numEntries = NV_GSP_REG_NUM_ENTRIES;
+			ret = kstrtol(equal + 1, 0, &value);
+			if (ret) {
+				nvkm_error(&gsp->subdev,
+					"ignoring invalid registry value in '%s'\n", start);
+				continue;
+			}
 
-	str_offset = offsetof(typeof(*rpc), entries[NV_GSP_REG_NUM_ENTRIES]);
-	strings = (char *)&rpc->entries[NV_GSP_REG_NUM_ENTRIES];
-	for (i = 0; i < NV_GSP_REG_NUM_ENTRIES; i++) {
-		int name_len = strlen(r535_registry_entries[i].name) + 1;
-
-		rpc->entries[i].nameOffset = str_offset;
-		rpc->entries[i].type = 1;
-		rpc->entries[i].data = r535_registry_entries[i].value;
-		rpc->entries[i].length = 4;
-		memcpy(strings, r535_registry_entries[i].name, name_len);
-		strings += name_len;
-		str_offset += name_len;
+			/* Truncate the key=value string to just key */
+			*equal = 0;
+
+			ret = add_registry_num(gsp, start, value);
+			if (ret) {
+				nvkm_error(&gsp->subdev,
+					"ignoring invalid registry key/value '%s=%lu'\n",
+					start, value);
+				continue;
+			}
+		}
+
+		kfree(p);
 	}
-	rpc->size = str_offset;
+
+	rpc = nvkm_gsp_rpc_get(gsp, NV_VGPU_MSG_FUNCTION_SET_REGISTRY, gsp->registry_rpc_size);
+	if (IS_ERR(rpc)) {
+		clean_registry(gsp);
+		return PTR_ERR(rpc);
+	}
+
+	build_registry(gsp, rpc);
 
 	return nvkm_gsp_rpc_wr(gsp, rpc, false);
 }
-- 
2.34.1

