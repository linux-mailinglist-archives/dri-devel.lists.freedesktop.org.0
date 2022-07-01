Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 150145632B4
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 13:42:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D61DC11BABE;
	Fri,  1 Jul 2022 11:42:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2062.outbound.protection.outlook.com [40.107.95.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0FB211BAC8;
 Fri,  1 Jul 2022 11:42:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IZ0wZ7vRgsg1YSqLOkoKOM/0dahC2g7x8ald5oNk50hyQlHe2s9kBlqp+n73LVC5bEs0zbsxZu4XWMadiLILZHyR3gXDGzmBcgC5i/+gbwo9+7XRWRHVUiwPV/2Hz7iDP33XPBU/T5YXu3ReaWj90RC7XaNDdndRWspCHCd4RDv3eT/wGtzXlJJruceX34j9Mg3lew6s7ByJJA9CBe7h6N1vU3aSIXVBMliRXa41gNnYsA2DyhKGyjR+qZSHZK9DYqNEh2SJJGne+wP1pN7CLPg8TqglZ+5tNockJfBKemA5ssoapzXcGeX2AnV2iKLiRWvZYbkcixitmwOhy66FDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EnXEjT7xGJkuuoOXJJaCxtZS4o8VKhWjMg8Le4FlwyQ=;
 b=LEVrmor/V8Adqo7lAw5j0zhtMPyT4rRv5nMc+v+oQFms6d/VXhQkv1lZRK4XDE+Mm3QDa7mXSIFUfI58URSArCuK93LpWdK7B2DNv3uoZs7DMSGieHV99/j40CmwK4nRiCThgXWUwMuFrP1DW5Gb1/eAAwB5BVptzalPN24AZ5W6z5ka6r2d7NaA1OCGgU9jP0v907Tpqm2Kb1v/kWh1tDHzrmcSisqZD4X2QIokElqNPpXjWaemfW6KKSvlua2nfXv+dA86qxqF/BCELpJCQLF+ZLuH3kxQWyxnkBGV2nZeoI1pSNtAXI0otnFG95kl3q6UJ9s7p1FoQmDRob2D3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EnXEjT7xGJkuuoOXJJaCxtZS4o8VKhWjMg8Le4FlwyQ=;
 b=WUSCX2h6Kz3VKz3u1bG/2dlY413JrRg7+dkKHGGoIrBqE510MfEoa4m47wDBzRoWtm32+KV8bTjGligABF9WzjIMkjwW+Bt3jI+xHBEsTNFisE+msX8xZ7aa80mKuodY0r25akfk30PWzkPFyy7JUWzOWQQzl2LEPY2S2NiTJ3Q=
Received: from DM6PR18CA0036.namprd18.prod.outlook.com (2603:10b6:5:15b::49)
 by BL0PR12MB4754.namprd12.prod.outlook.com (2603:10b6:208:8e::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Fri, 1 Jul
 2022 11:42:04 +0000
Received: from DM6NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:15b:cafe::72) by DM6PR18CA0036.outlook.office365.com
 (2603:10b6:5:15b::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15 via Frontend
 Transport; Fri, 1 Jul 2022 11:42:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT052.mail.protection.outlook.com (10.13.172.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5395.17 via Frontend Transport; Fri, 1 Jul 2022 11:42:04 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 1 Jul
 2022 06:42:03 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 1 Jul
 2022 04:42:03 -0700
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Fri, 1 Jul 2022 06:41:58 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH V2 5/5] ASoC: amd: enable machine driver build for Jadeite
 platform
Date: Fri, 1 Jul 2022 17:11:07 +0530
Message-ID: <20220701114107.1105948-6-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220701114107.1105948-1-Vijendar.Mukunda@amd.com>
References: <20220701114107.1105948-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d7775c1-dadd-460e-9b05-08da5b56b84b
X-MS-TrafficTypeDiagnostic: BL0PR12MB4754:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8hgaMMP/sxPAX/JeoDzRXwNeK5oMJ5GAi5+LOcEvT7Nfr/2kNANRc+GQMsm/FYw+Nvmz7aJDWdKGYgEkraPoUOK0Y353EkPSxNQvv2VakCmK8e+VqHQyc1J4BKVm5GEBm7Q65la1j0v7aIYUjoH3TpZ3tIchyssqmS62xrwIcizeJb33TjtDPlrXLHkkwHd6ZmuRtn3iL/v41SEraS1Mo3nWtlboTZDl1XXWctErXXYeaG6zC7+z2KNMl9nu6tZiWSrRMtRD5PT69aJoejMA42E+yWkzaUYN0u5BZRPXO2GVTTW449qkvoE6+ttItW8afztTxIJMdj8X4xYjKKoD+chbGze139I2hRa7kZMi7h+FUk6RbqURfGwKhtx0hhCJKIk4YOgt5Vo005grVjDdamsX1XD0OqZDYt8ULVxeJIWsNBp6BRmTKL5+hZekRWqgxr9BkNX3cTwd3U6bVBO6seM9J+bdpbwl5DNWFYInY3sjyNRbD2sgtnkjCa1PiHnPPLNBxecIno/EbZZ7+T4WWGF6mMf7amCv6U3k3P7WXlwmFzAPaCR1kUxVG/iSGeaF4Ui74RAICwYGIeFyPQjP/BlRF29F6zO8tq78j0CKTUaXIOdbA4anu0jOdvn7nppZUeTntTAg1o2cPeOnSvh5qaTflZYv4Dt2Q+s9+tUKbHyryIfXv6KgMyNi18pPrRCv6xThYCOXV8449V+MGtjPc306ngd8uOOpbGi4kEwFSr4mbobVPTEUT+OpJ60oAobZtFTT02vAfkoHgbqnyEAPSXKk7fq+tPyMm4DjYn08qc/wUxunHTemXtmf9HaTXCGYJBoBs5JRiCGW/+J0iMJDoSnUhO4UYNHMFjC3W4H0RAg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(39860400002)(376002)(396003)(46966006)(40470700004)(36840700001)(426003)(70206006)(70586007)(1076003)(8936002)(8676002)(81166007)(86362001)(40460700003)(36860700001)(2616005)(478600001)(5660300002)(82310400005)(36756003)(7416002)(110136005)(316002)(54906003)(4326008)(40480700001)(6666004)(2906002)(41300700001)(26005)(83380400001)(186003)(47076005)(82740400003)(336012)(7696005)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 11:42:04.2686 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d7775c1-dadd-460e-9b05-08da5b56b84b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4754
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
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sunil-kumar.Dommati@amd.com, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav
 Kysela <perex@perex.cz>, Bard Liao <bard.liao@intel.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 zhuning@everest-semi.com, Julian Braha <julianbraha@gmail.com>, Lucas
 Tanure <tanureal@opensource.cirrus.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable machine driver build for Jadeite platform using ES8336 Codec.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/Kconfig  | 13 +++++++++++++
 sound/soc/amd/Makefile |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
index 1381aec23048..c373f0823462 100644
--- a/sound/soc/amd/Kconfig
+++ b/sound/soc/amd/Kconfig
@@ -23,6 +23,19 @@ config SND_SOC_AMD_CZ_RT5645_MACH
 	help
 	 This option enables machine driver for rt5645.
 
+config SND_SOC_AMD_ST_ES8336_MACH
+	tristate "AMD ST support for ES8336"
+	select SND_SOC_ACPI
+	select SND_SOC_ES8316
+	depends on SND_SOC_AMD_ACP
+	depends on ACPI || COMPILE_TEST
+	depends on I2C || COMPILE_TEST
+	help
+	 This option enables machine driver for Jadeite platform
+	 using es8336 codec.
+	 Say m if you have such a device.
+	 If unsure select "N".
+
 config SND_SOC_AMD_ACP3x
 	tristate "AMD Audio Coprocessor-v3.x support"
 	depends on X86 && PCI
diff --git a/sound/soc/amd/Makefile b/sound/soc/amd/Makefile
index 4b1f77930a4a..8823f6f28611 100644
--- a/sound/soc/amd/Makefile
+++ b/sound/soc/amd/Makefile
@@ -2,12 +2,14 @@
 acp_audio_dma-objs := acp-pcm-dma.o
 snd-soc-acp-da7219mx98357-mach-objs := acp-da7219-max98357a.o
 snd-soc-acp-rt5645-mach-objs := acp-rt5645.o
+snd-soc-acp-es8336-mach-objs := acp-es8336.o
 snd-soc-acp-rt5682-mach-objs := acp3x-rt5682-max9836.o
 snd-acp-config-objs := acp-config.o
 
 obj-$(CONFIG_SND_SOC_AMD_ACP) += acp_audio_dma.o
 obj-$(CONFIG_SND_SOC_AMD_CZ_DA7219MX98357_MACH) += snd-soc-acp-da7219mx98357-mach.o
 obj-$(CONFIG_SND_SOC_AMD_CZ_RT5645_MACH) += snd-soc-acp-rt5645-mach.o
+obj-$(CONFIG_SND_SOC_AMD_ST_ES8336_MACH) += snd-soc-acp-es8336-mach.o
 obj-$(CONFIG_SND_SOC_AMD_ACP3x) += raven/
 obj-$(CONFIG_SND_SOC_AMD_RV_RT5682_MACH) += snd-soc-acp-rt5682-mach.o
 obj-$(CONFIG_SND_SOC_AMD_RENOIR) += renoir/
-- 
2.25.1

