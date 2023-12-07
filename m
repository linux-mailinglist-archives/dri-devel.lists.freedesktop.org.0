Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06039808F55
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 19:03:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D76C10E941;
	Thu,  7 Dec 2023 18:03:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2086.outbound.protection.outlook.com [40.107.220.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B51B10E20F;
 Thu,  7 Dec 2023 18:03:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IfUXgKTejQA4jstSuFLc744GgJhGrxaUe7mP3xop4ipVew4lMwFR/4ilJUAf9MFYJVdSepnJuuKCW1WJtSFS54cvjfQ1fTEslFm4ze6VeFXcyABqOKq4mwzm6YpvMzlqMKnv2sucyrzUVAqqvvegiTf92X0QJ1QXrd2i+Gz1bmBzTiAzAjhZcR7x/6LqOpzI5X7C4zKbjndkhpwMMOFILCu0nLn9LyKbLLW/vchLBCu4/mrG+6d8r0DFemLrIvgOBpPvrbT/xSbK5NUv2P0T9BHaE+D/jkwgg5gpF8b3bUOymg5i1npuxcbsDWEYDW6JU5zhsDTPd8uoHxws1JRWhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yWIwmEuWImSSTmwf8ViG61yiRK9AiGEml5HPWK2cQs0=;
 b=Chc+EJHUTTELTAbhADfMsUMD83wFo8IqDtgz+XNuX8NPXzCn40XpM25UeCwh6n9J8dtzoF2IlfQ/Bl2a/MHB1qFN4m3mMxJs90TfnZWDMBn3WW16Ff1gIh6gfB7Fnd8Ho5uolEwfuqelsVAx+f+AyW3OhjJ63SuLXnyWrfde5pPFv5Y0xPZm8Oe9k/lw33+eI5jNsfMQVw2k5DXF/2OB20Vpuyxd2TmRYo3twFOBY3+Aodi77NboIpcQm9eq+zZ8tWtx4pBpbCuViWvEtxPMevgsZFZ5k8CHZxWJcvmlBNzncTuiVxtVkAn+L5SvVcL0fq/XwjODbskHg6tEl5M8cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yWIwmEuWImSSTmwf8ViG61yiRK9AiGEml5HPWK2cQs0=;
 b=uHEngP5w8zYof4h2unuFsqucwK2tsSWdiFdDX3qls4z80PAFFikZNSYd6GR4P/sf1pkWL8Is0bHRGaNmRUQT9sRt6kel7z7N5Vtdi+J+owwBosNHR8o+sBEMUaj+FgIvwDQzErJzdkD4IWQbJ0iBUB9/lXhruNoX9drvrWSDd2ffGSrz2DcH8QItTny3zpzblCHOP8oxrJcAEUdQHtoXP/14QzzWEfdpCmTniZz/RXbVVXrp0+3kXCo+k8aIFOjsgnd9xu1kijpn+L5blTGLAcO4p0orIZkQ+waa0rlprzK/aDe54qaaYtZ81AMG/378M33JYlzPxWk4Qfr7XVsshA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CH3PR12MB7667.namprd12.prod.outlook.com (2603:10b6:610:14f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Thu, 7 Dec
 2023 18:03:16 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93%4]) with mapi id 15.20.7046.038; Thu, 7 Dec 2023
 18:03:16 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Airlie <airlied@gmail.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev,
 Catalin Marinas <catalin.marinas@arm.com>,
 Danilo Krummrich <dakr@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dexuan Cui <decui@microsoft.com>, devicetree@vger.kernel.org,
 dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Woodhouse <dwmw2@infradead.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, iommu@lists.linux.dev,
 Jon Hunter <jonathanh@nvidia.com>, Joerg Roedel <joro@8bytes.org>,
 Karol Herbst <kherbst@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Laxman Dewangan <ldewangan@nvidia.com>, Len Brown <lenb@kernel.org>,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-hyperv@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-snps-arc@lists.infradead.org,
 linux-tegra@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 Lyude Paul <lyude@redhat.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 nouveau@lists.freedesktop.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Sven Peter <sven@svenpeter.dev>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vineet Gupta <vgupta@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Wei Liu <wei.liu@kernel.org>, Will Deacon <will@kernel.org>
Subject: [PATCH v2 3/7] iommu/of: Use -ENODEV consistently in
 of_iommu_configure()
Date: Thu,  7 Dec 2023 14:03:10 -0400
Message-ID: <3-v2-16e4def25ebb+820-iommu_fwspec_p1_jgg@nvidia.com>
In-Reply-To: <0-v2-16e4def25ebb+820-iommu_fwspec_p1_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0054.namprd03.prod.outlook.com
 (2603:10b6:208:32d::29) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CH3PR12MB7667:EE_
X-MS-Office365-Filtering-Correlation-Id: 280d834f-15e4-4df5-fae8-08dbf74ec8c0
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bsgQUSXxN7dCltll6CjCkPlMZFIgFP7i1IrAkFYOQMVFC7IAU7ROSWiqBU9TBTNZQWUmJ8GJTYiqJilPdokzYIGTy//9L/hV2oNoe8tBth2tYj662qSVgnamip6Wy+4wnmYuRC0lW+8Ut6DdhiXPXVzWky7ikqxjVjTgCCtWKVEcjmDUPQoL/EsAqsrDTD3jJJFGxIjOpWVN94f7q+VgTW44PuyklRxjLGduIyBGZe3oZ78CzU1C2A+edex6zFb+6s3zL5+nGiIOc9f/vA9sNQJANqHgcnPBcfxfVjObprbTLyDyF4uWheNNXh8HLv2zxkLzZ2LMxKme3G6b0MnXbUn2QSQFNThL5KxByBcqY6+mbESFuXp6BfgHtU+HJ3vc059zfwjoLJLG0vvR80uyT8lZxRnsL1Olelfrisa6PMspkDJ5XzmWh7sdcTLdBtx3Up0apHWIR5RFRbjp4zz+POXt2GW7kmeoitagUj4Q72YLuuwQhyYyWVi5dWE654OV+2GEmVSHf2yDEdPf3YQNtYfSGQ83Yn4zzckOnou24PCRQH/vzPznhWhbvVnapkkT8QX93UFO7NUHHye/vCncn1w/RGPH2VmzANHXozZSq8YeCg7VvSTje3lXv3c9ERfD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(376002)(346002)(136003)(396003)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(7366002)(7416002)(2906002)(7406005)(5660300002)(41300700001)(86362001)(8676002)(4326008)(8936002)(36756003)(316002)(66946007)(66556008)(66476007)(54906003)(110136005)(921008)(38100700002)(6486002)(478600001)(107886003)(83380400001)(6666004)(6506007)(26005)(6512007)(2616005)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vgb+bYitXAtHpG90YCWagwRP5QvBeBpZ01DOmL5P1g23eVNewd2V6mjfmt5g?=
 =?us-ascii?Q?9e6l1t2iZecRN8strjkmEZQztMs7daHHsKlD3dOlJXlk+HhiDv5gghNec7Lu?=
 =?us-ascii?Q?Ro3bms0Ey87u32Angc2Ephaqe+TqTY9ayu5PkL9s+/cndRXR3e7FpLuXGZIp?=
 =?us-ascii?Q?6bl13anXW2Ffb9mZzyXMPopDZqArIzHMGjh4NX9VIKAwMJGf7+HnbPpDe0/z?=
 =?us-ascii?Q?TwcOsLdKvhZEacQ6Tt5VDk2jZu9or0MO/PrBR3gZpR+n8j4125RgEQcZ5q4R?=
 =?us-ascii?Q?zh7zK1n3GmEFoEheNWNUd5n8wQkEgreQ/39ULs+aP8AIv8ZHEXRZQv/73Vst?=
 =?us-ascii?Q?22ZoYdKYXRFqEOrUIQ7bCcB1CpqBMaGzyuy6u7YY3PSbLMHbX6cDdclkf7Dr?=
 =?us-ascii?Q?P4yl1yufwEfewllkATw2WDtQFslFbD+vDkV9r8XqivGQNqbA+dRWnP90X5oz?=
 =?us-ascii?Q?iJiWAKRfiwGIvPeLQcsB8toP/a9i7VzWklscUE5WzTLJnoLQvTg/yyg2Dh5k?=
 =?us-ascii?Q?hDISqYkb2vQ4HjXCd/a5nw0rbZp9LowN03buCFoktl5VBXghbUbbB5oZqpSH?=
 =?us-ascii?Q?vphsbFCtw0gyM/x8aKUoEXF+CeBBbtttkt8kIaxDh1/ZX5Fg68047kWdJDE4?=
 =?us-ascii?Q?87gSz90aAUjAtnFJxSDQ8NKN757VRIkUWbPh7+UTlZyVO+uNYR9DM68Jj4tz?=
 =?us-ascii?Q?bbo8a3f2WWIWdyZWaUnMc6gPMHTRwJUeUOlEfW2+kxelV8lE87H/Ta36gPyO?=
 =?us-ascii?Q?m/6951DH8yv/K6cvvCa6gQ4ivkTREzG/xbr/0PdYL5WklhoHVJBEI6McGnaq?=
 =?us-ascii?Q?rRyrOFK6rI0NdzD5bVLu+1aO2AcZxzxhGCZf2MThgvwzn6gF3I+0qtX7TtvM?=
 =?us-ascii?Q?894T+T5UKcunPsOW0bUcYyotxIU2+zWiizqoBsKeR0NWLFo2QRV7Z0DA88I8?=
 =?us-ascii?Q?KNQpwmNulSRMysP/oILWcamkPXOFXR7Z4AHOdHJ7r4/UsMdjDOxYMfajAEyo?=
 =?us-ascii?Q?X+SBUNo6rYfUxtfDyp9nq6Jen8T13uPRkqMLSrFzhU0UNdtKYFGygUerK3aS?=
 =?us-ascii?Q?j+mJ/h0Ej/SoH3tZz3PiC/w4gn0LrTc40B7u5ipEtbsPJIqPjfkJW+kXPWfi?=
 =?us-ascii?Q?M66TUNV/LrKEfw3nQWAgFhHTfegRCcY5Zz0gdCsc8PTBHrmivc7yP9PYDqIp?=
 =?us-ascii?Q?dsp+Bf5VDj+DU3Qv28n5wzkeY7DN9DlPPhrAzYDSYnAP2bzGBw/fdBE0E1tK?=
 =?us-ascii?Q?6S9Aot5IUv494NNqW0HHBkX6foNDhKXFvwShb0m3K3bDZMlUmrZNkRuoUJUz?=
 =?us-ascii?Q?b0rFqUddJgsHgbHkAFoxUvtF2fXDtkUvWCdDXOrSd5wrT9F3KcVqCni1+KSG?=
 =?us-ascii?Q?8c+UiiKmZtLKmGpJTE267NGuJxf2cP4NCnDB7K9rPLV/x2A7LgX4vvCCbOQ2?=
 =?us-ascii?Q?QwX/9idxt30rPZkXMX3pON7+qrCKhCAdVTGtNHG1X54IrkhkIE973VhPsN6/?=
 =?us-ascii?Q?P5dup5WuFa6kJL+ffU+l33+CSFgYM1PtUMhiGnTRPAqoMT0Y/cwHNqpXZSt2?=
 =?us-ascii?Q?rIqgR5dPkeZDxPXeYQ/uugmKOXCUWuTE6W0I+rpD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 280d834f-15e4-4df5-fae8-08dbf74ec8c0
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 18:03:15.2272 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: umm7RhHZZ7XK2vJf6srTrWIFnDAVscDE7SbqOUMWZws5Px3ErVnmvG8pQpff4vPw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7667
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
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Hector Martin <marcan@marcan.st>, Jerry Snitselaar <jsnitsel@redhat.com>,
 patches@lists.linux.dev, Thierry Reding <thierry.reding@gmail.com>,
 Moritz Fischer <mdf@kernel.org>, Moritz Fischer <moritzf@google.com>,
 Thierry Reding <treding@nvidia.com>, Christoph Hellwig <hch@lst.de>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of returning 1 and trying to handle positive error codes just
stick to the convention of returning -ENODEV. Remove references to ops
from of_iommu_configure(), a NULL ops will already generate an error code.

There is no reason to check dev->bus, if err=0 at this point then the
called configure functions thought there was an iommu and we should try to
probe it. Remove it.

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>
Reviewed-by: Moritz Fischer <moritzf@google.com>
Tested-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/of_iommu.c | 49 ++++++++++++----------------------------
 1 file changed, 15 insertions(+), 34 deletions(-)

diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
index c6510d7e7b241b..164317bfb8a81f 100644
--- a/drivers/iommu/of_iommu.c
+++ b/drivers/iommu/of_iommu.c
@@ -17,8 +17,6 @@
 #include <linux/slab.h>
 #include <linux/fsl/mc.h>
 
-#define NO_IOMMU	1
-
 static int of_iommu_xlate(struct device *dev,
 			  struct of_phandle_args *iommu_spec)
 {
@@ -29,7 +27,7 @@ static int of_iommu_xlate(struct device *dev,
 	ops = iommu_ops_from_fwnode(fwnode);
 	if ((ops && !ops->of_xlate) ||
 	    !of_device_is_available(iommu_spec->np))
-		return NO_IOMMU;
+		return -ENODEV;
 
 	ret = iommu_fwspec_init(dev, &iommu_spec->np->fwnode, ops);
 	if (ret)
@@ -61,7 +59,7 @@ static int of_iommu_configure_dev_id(struct device_node *master_np,
 			 "iommu-map-mask", &iommu_spec.np,
 			 iommu_spec.args);
 	if (err)
-		return err == -ENODEV ? NO_IOMMU : err;
+		return err;
 
 	err = of_iommu_xlate(dev, &iommu_spec);
 	of_node_put(iommu_spec.np);
@@ -72,7 +70,7 @@ static int of_iommu_configure_dev(struct device_node *master_np,
 				  struct device *dev)
 {
 	struct of_phandle_args iommu_spec;
-	int err = NO_IOMMU, idx = 0;
+	int err = -ENODEV, idx = 0;
 
 	while (!of_parse_phandle_with_args(master_np, "iommus",
 					   "#iommu-cells",
@@ -117,9 +115,8 @@ static int of_iommu_configure_device(struct device_node *master_np,
 int of_iommu_configure(struct device *dev, struct device_node *master_np,
 		       const u32 *id)
 {
-	const struct iommu_ops *ops = NULL;
 	struct iommu_fwspec *fwspec;
-	int err = NO_IOMMU;
+	int err;
 
 	if (!master_np)
 		return -ENODEV;
@@ -153,37 +150,21 @@ int of_iommu_configure(struct device *dev, struct device_node *master_np,
 	} else {
 		err = of_iommu_configure_device(master_np, dev, id);
 	}
-
-	/*
-	 * Two success conditions can be represented by non-negative err here:
-	 * >0 : there is no IOMMU, or one was unavailable for non-fatal reasons
-	 *  0 : we found an IOMMU, and dev->fwspec is initialised appropriately
-	 * <0 : any actual error
-	 */
-	if (!err) {
-		/* The fwspec pointer changed, read it again */
-		fwspec = dev_iommu_fwspec_get(dev);
-		ops    = fwspec->ops;
-	}
 	mutex_unlock(&iommu_probe_device_lock);
 
-	/*
-	 * If we have reason to believe the IOMMU driver missed the initial
-	 * probe for dev, replay it to get things in order.
-	 */
-	if (!err && dev->bus)
-		err = iommu_probe_device(dev);
-
-	/* Ignore all other errors apart from EPROBE_DEFER */
-	if (err < 0) {
-		if (err == -EPROBE_DEFER)
-			return err;
-		dev_dbg(dev, "Adding to IOMMU failed: %pe\n", ERR_PTR(err));
+	if (err == -ENODEV || err == -EPROBE_DEFER)
 		return err;
-	}
-	if (!ops)
-		return -ENODEV;
+	if (err)
+		goto err_log;
+
+	err = iommu_probe_device(dev);
+	if (err)
+		goto err_log;
 	return 0;
+
+err_log:
+	dev_dbg(dev, "Adding to IOMMU failed: %pe\n", ERR_PTR(err));
+	return err;
 }
 
 static enum iommu_resv_type __maybe_unused
-- 
2.43.0

