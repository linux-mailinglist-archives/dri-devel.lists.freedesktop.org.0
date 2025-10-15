Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25430BE07B9
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 21:39:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E906110E8CE;
	Wed, 15 Oct 2025 19:39:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="cPRbD0xu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011037.outbound.protection.outlook.com [52.101.70.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7101010E8CE
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 19:39:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bI8K399FAqb8CrQJZfrn6RZsppst2jpF+/7+/LasT58ra+41h6u8SCzvKzquVzVUemKfvIpS9O2Olad/YbIeaG7hhrYiTzpxoR28LTVk2AgB9NXOTr1VUucFJlrqS8a5HfJ+LtGjyIFU+UhHIdTz2K1R2WtAw8d93HmD2aNONtgMNwZ/752XCDQKgiJfREcSgbEZnQJlyYYM7jFDCv/LjQyfTWwFl++hRsNVRTKdBGKurHACqQqDXAClwDOX3bv+Vm5TTjQjksO8yHyDWgW1Srf0QnXaZkKXM1mKVLmcA5/gB95CnEbVbfcraAbjDe8h6EabFAQ0eSwzC9AqRfU1yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sNSIcqNpp3+JnXXMU5/AxDj31l1sCqCfc6bCHPZvNsY=;
 b=pZeDcHiE1PgQfhV9ssiNEB00HmQR0EPgZKktd3MG5koW67kqSdKiAyu4wjU+93gA/EgHl/BxGbYYl2uR+JFk79T9VSxWPLREOBRDoNTCyX4fHYO8nSF/KBnAJYn9xa+dHOBZy+uFhSmk6AvrZyDZqfDq73xfavcCglxGD5IFBFuYC2SnrDI/xTYODmthpsFLubBeGImGjhyCMGY84GE4TUz6h+YhaBsaQwrC5UIsZ5W2luMo4MG+NBSAfvxuBcFy0HRLwAKs0Ibs8TDGJK2cK82E10o8B3urTkxRvUYqYwQrV+SerwQrKu5F+zzcn99/vkkyx/jhaU3UOMx+6BXsxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sNSIcqNpp3+JnXXMU5/AxDj31l1sCqCfc6bCHPZvNsY=;
 b=cPRbD0xuJtmXjp7wXWaCTNqUG2VUIWYlqkUA9uO/mfGruoC9U1i8iYyvJ2soeKgyL8jbtSHxooLPzAOiMN3hLfDl65FZ9IvCI+YYJrrS/m4haSYZEriBXNBEqWlptE65T7+w2C/L4PItxs0pkJuMxLurlPTw2q3wxOyoPj+t6XqCR86gDTITrvkmraojAXXglmsxLo9EofydBq1R1IZNEGceZRtNiiczQyrG9AYXU14Lx4t1sYBeWf+/a90UP+GmMBE2qXevSafoQIG3FSJVsoIiAJrXwZoE1x/Q1lKrZy7xMbaEW68pVDGhs4jcu9+jS07C8Dv32V796zkO/c2aCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by AM0PR04MB7074.eurprd04.prod.outlook.com (2603:10a6:208:196::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Wed, 15 Oct
 2025 19:39:39 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9228.010; Wed, 15 Oct 2025
 19:39:39 +0000
Date: Wed, 15 Oct 2025 15:39:29 -0400
From: Frank Li <Frank.li@nxp.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Robin Murphy <robin.murphy@arm.com>, Steven Price <steven.price@arm.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Sui Jingfeng <sui.jingfeng@linux.dev>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v4 2/2] accel: Add Arm Ethos-U NPU driver
Message-ID: <aO/4cQ8+eLnwqFSh@lizhi-Precision-Tower-5810>
References: <20251015-ethos-v4-0-81025a3dcbf3@kernel.org>
 <20251015-ethos-v4-2-81025a3dcbf3@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015-ethos-v4-2-81025a3dcbf3@kernel.org>
X-ClientProxiedBy: SJ0PR13CA0042.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::17) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|AM0PR04MB7074:EE_
X-MS-Office365-Filtering-Correlation-Id: a2d0450b-8c1e-4311-d114-08de0c22944d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|19092799006|52116014|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8F1B14K/XdUi5Zr/WgJ1ps/vZBhganDL8TfCLIUvyFcPxYQlzY2W1Sl+AebK?=
 =?us-ascii?Q?9C7atrw94bHEKgHxtQSB86IT7oswhfdL3v+eIrjywe0ksqwtMx22Kv9/Dolw?=
 =?us-ascii?Q?zM8+eBAt5YViepRM7qgvuupnQZS+HrrQeS70kXjXrD3JbWgcbAHlP29dSWwz?=
 =?us-ascii?Q?2Mb2NYP2B7mxf1DIvuco0J8eUB/bMokgEQHv2kEUDF3ckrKlpX9PafjlIAje?=
 =?us-ascii?Q?4DW3XoB2c/leRpIa58VK2KZng+cX2WJEJwgburCGctrvnIZqojnRkbfQ4906?=
 =?us-ascii?Q?p6my/BVxNn1QHvoZ2RipKNdV8psDyd5S5mwG2DE79UoOVmOYii00W+uOW1u1?=
 =?us-ascii?Q?T5kNAVUBco6yDwRKHzvFMu5xH2ZaE7L+c1k0NB3S9NCq4HutPKBaFjB/nBlq?=
 =?us-ascii?Q?6GarleBri7hBkX3KrPFFDmHuqYTWRrHxiFgw6DExMNZlOyHs1+BVq7qFysGp?=
 =?us-ascii?Q?GllzBvZcceSZFNdnWH7XQTM4tF2q5FBq7/QERl0XGaTqC4niMU2InNKx884r?=
 =?us-ascii?Q?09xw4tvd22PG2p+aNiGKLgCXXrY0W4EByBMm0sPMZhPDYKPRJKjwURzp4B5n?=
 =?us-ascii?Q?BiufTf7+bh6g200zKe6q/zGjAV5aF9adEdsfOENK4VsHDrieMQRIFZ7MorU2?=
 =?us-ascii?Q?BuIkyGTy5AIFvXIwEiTGfhhJnIRv7t8UILbr7tcJCcJnBLKFKM/FInWFNRmJ?=
 =?us-ascii?Q?XNNaN3LCwZ3udS/+WbK9/zXIGbA03KSKDYbgjdet6JmmG5LvHXYRLXPE1zDt?=
 =?us-ascii?Q?iv55VmgnQkFN7tnn5Ga71OPVZuy8kNowgARK8wsgS3GyU60y9ckCALqCDSmI?=
 =?us-ascii?Q?MUIh4jvHCR22yTAbyksaKP4oIrv1f6vOMUIUrs/uL187nC2NUR4I0lnRDYvV?=
 =?us-ascii?Q?GeIzhqLF7yGFu7iBLEgmRLcy92Y09WK81cJV8CxoHVh+TwrrQazpQvJhiia7?=
 =?us-ascii?Q?6BwdQPa/7rgAHbcwT1YT/xAqOoVrpUg4VsbgT0gHk1TnnHevNWAcs8UkoF1L?=
 =?us-ascii?Q?ART3TFyHQNP493sDw37JJw7sLvBIw4tXdBEPFI9qqJx/cJS6zahsr39ufUHi?=
 =?us-ascii?Q?z2BEXvOa08V1xpoUMpCa74LSre3p+lxVDOmm+DHt8P0nZpzWKSRw/NjmCt/q?=
 =?us-ascii?Q?vphtnnYlL/CcA+NYj6t8payp9y9uhn/xd31iFu9kKfNNIEVinxU5Nchw7/br?=
 =?us-ascii?Q?p/p+VAkwPVoEkCwS1DaiZqQR9EpjhfJUdwwLK+jt1r9pqOfOVX/FWCxP9T4q?=
 =?us-ascii?Q?ANDS1KMyjdr5yBTtvnevuFbglMWn/UNAZmP57bW+gsSs4fn2YK0A8/QjXuFd?=
 =?us-ascii?Q?PzkBPKlVYqhMasYvPJ7x7N2285psyy+IWVncj0lf+3Klcl8jTMqw94XPOkic?=
 =?us-ascii?Q?ebZNMRN+GlVauEzQShb65B920df5S1veoevshyW3VYc/JoCPMSsu3KLU5S3G?=
 =?us-ascii?Q?NoiYyV/atshLPrDQdrXL1+oIefj+sdhaOse1Haer6yK3BSAOeOqjCcu2ID5G?=
 =?us-ascii?Q?ejOQ9bOmkvRQ3SNsgUyAeyqYT6Q0GXeLwUTJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXSPRMB0053.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(19092799006)(52116014)(376014)(38350700014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ScfM1BrVMVf+TOzyiIBEhOozXKpuCoMFp1NJzkppfS31NsdEMz/LgB3lZ6Gb?=
 =?us-ascii?Q?tseIjXZUuDbaTWAXrk8hxuT3oIoEhyk0LuwljLnJ9sINp7WPi7Rc97+O/gOG?=
 =?us-ascii?Q?wsBzpMkBTbfR3IWsfxJhZ/aha/LWporCyL8YsOhAl5T4Y3rmlP7EFAYuNyga?=
 =?us-ascii?Q?r6iLZJpOtwN42efmMzllKz1zs2nx/vMXyOE1nraq0Q2Lzfyc58nw/tc1epCD?=
 =?us-ascii?Q?UXgw9+Z/fdTu8miSpm21Y1eTCibMSZieH6v8iebg0XbMsolQtsjRFp9SmUq2?=
 =?us-ascii?Q?l66m/wmJF8SqoKCGf7VnYcFtyaQEK7A1+pfqYD9KUCOociiyuiUxHMuu67KV?=
 =?us-ascii?Q?uUPZxoN4AczS2Wzw8v3LfJFwMgymfJ+IC+97JvdrB7MtBOP2/UM7pWEL0ky0?=
 =?us-ascii?Q?GM7Rbv6hJsjIcr+Oouvkagiav03ERLtQ4nxAYWsnPt3PQKjoS/UOd9zUEbf7?=
 =?us-ascii?Q?EfOk10d4fMIOcnljfDXCnYuPVi3PsC995QGPsIOKza2dXaAOCVRNN19rHYFr?=
 =?us-ascii?Q?U3JdHo21rgussYVIfR1d5ZRPduv4uPG4xuHnnM8ib2UYS61XSTXYyl58zwAs?=
 =?us-ascii?Q?LMXvMfDWfSoSWSc+2LcVcQI9qCHwnM05AW8/uTspwxZBqaCd63myux1H9+Gr?=
 =?us-ascii?Q?V80oSwS0XmvuQFxb5eV+ymdOsvHPLotlNIzjqE8DiPxStzJwgaQZd1zSGLdE?=
 =?us-ascii?Q?YW45BltLTkio5/xtUrXMxoSs5fXQQLYSWvKXfEyFXGH4Ge9d9NoKx45IMXtg?=
 =?us-ascii?Q?oAPZjyIjMe2+cvmoCkOszALUNV2G1x2tIVbS6nJ359iriOTZe4dRvo+K3vix?=
 =?us-ascii?Q?m2QaRANBosf68yea1AplwBKAuIVoAyTaaacrQ642NpjxJd82WHYktbwCp95S?=
 =?us-ascii?Q?TkyYDijG8C2ILqqDl7k8+0HDINZsSjBiRbrrBx6NUoTEzH2/uCNTa2yUPehr?=
 =?us-ascii?Q?0lOFOls98YLDP0E7Y6U6mL0rvOgGAsEXUX9e4aoH01nBAcyvco8FZZd9ifyG?=
 =?us-ascii?Q?OpFQQjsAmNz+zJYa5yNalnRF1wDxOURyMdC7J98UKV/IeGZeMn33qeyVhGFz?=
 =?us-ascii?Q?OyYYfQpbiYQ02o6yijEzHi/LJd0WctkNm6hrP+2U+KahsNM0oxhFMgSXlDIN?=
 =?us-ascii?Q?2/teBzMz9rGNarOl3n+3C2B4IBSZQvbcFeowCo60+DiMuawwGi6w5b99XnDt?=
 =?us-ascii?Q?9w5BSx6BoR19qCUyJFV4DL+u/mKI6FqqXzvQRovuWKJ3lqCsFYi+TAsAT1Uu?=
 =?us-ascii?Q?pNoDczhSQ03yjtr33v3G/qHHvSIi162wFVcV7SK15S79qeqh8HbvgOl43sQ+?=
 =?us-ascii?Q?h9ISRpE7bx5GBi/DYAF9jdeDriSS2xCpb5f7r1vEccrv75u8ZhlQE0Sd5Bep?=
 =?us-ascii?Q?LL/7se/kfSe8z91wT7y8aSf/KMQIV0VrbPsxjzMTpNTCMwQvIx/kdXpcBItl?=
 =?us-ascii?Q?9sqGUGU//VcyI9WgjVTTJrkz2NRPSqgYOGhUYrs5mIkL801Z4azyU7RggbES?=
 =?us-ascii?Q?UkNX9Fpn+QaO07ooTVNBQpmp0wSNCi7+6z5MkpxfaKGW8NCBf1Plg/24xb3Z?=
 =?us-ascii?Q?JOIzhfM6SCOOcbJJdYc=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2d0450b-8c1e-4311-d114-08de0c22944d
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 19:39:39.2555 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nDufS5W8AYozxzN2eJ/T34el2YWOaGTZA6TZqoErPRt4UkC8Ebc9U+hiKm2vqX3Hu0URi3/cwTtqfiVy0iW8eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7074
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

On Wed, Oct 15, 2025 at 12:47:40PM -0500, Rob Herring (Arm) wrote:
> Add a driver for Arm Ethos-U65/U85 NPUs. The Ethos-U NPU has a
> relatively simple interface with single command stream to describe
> buffers, operation settings, and network operations. It supports up to 8
> memory regions (though no h/w bounds on a region). The Ethos NPUs
> are designed to use an SRAM for scratch memory. Region 2 is reserved
> for SRAM (like the downstream driver stack and compiler). Userspace
> doesn't need access to the SRAM.
>
> The h/w has no MMU nor external IOMMU and is a DMA engine which can
> read and write anywhere in memory without h/w bounds checks. The user
> submitted command streams must be validated against the bounds of the
> GEM BOs. This is similar to the VC4 design which validates shaders.
>
> The job submit is based on the rocket driver for the Rockchip NPU
> utilizing the GPU scheduler. It is simpler as there's only 1 core rather
> than 3.
>
> Tested on i.MX93 platform (U65) and FVP (U85) with WIP Mesa Teflon
> support.
>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

How to test this driver?

> v4:
> - Use bulk clk API
> - Various whitespace fixes mostly due to ethos->ethosu rename
> - Drop error check on dma_set_mask_and_coherent()
> - Drop unnecessary pm_runtime_mark_last_busy() call
> - Move variable declarations out of switch (a riscv/clang build failure)
> - Use lowercase hex in all defines
> - Drop unused ethosu_device.coherent member
> - Add comments on all locks
>
...
> diff --git a/drivers/accel/ethosu/ethosu_device.h b/drivers/accel/ethosu/ethosu_device.h
> new file mode 100644
> index 000000000000..69d610c5c2d7
> --- /dev/null
> +++ b/drivers/accel/ethosu/ethosu_device.h
> @@ -0,0 +1,190 @@
> +/* SPDX-License-Identifier: GPL-2.0-only or MIT */
> +/* Copyright 2025 Arm, Ltd. */
> +
> +#ifndef __ETHOSU_DEVICE_H__
> +#define __ETHOSU_DEVICE_H__
> +
> +#include <linux/types.h>
> +
> +#include <drm/drm_device.h>
> +#include <drm/gpu_scheduler.h>
> +
> +#include <drm/ethosu_accel.h>
> +
> +struct clk;
> +struct gen_pool;

Supposed should include clk.h instead declear a struct.

...
> +
> +static int ethosu_open(struct drm_device *ddev, struct drm_file *file)
> +{
> +	int ret = 0;
> +	struct ethosu_file_priv *priv;
> +
> +	if (!try_module_get(THIS_MODULE))
> +		return -EINVAL;
> +
> +	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
> +	if (!priv) {
> +		ret = -ENOMEM;
> +		goto err_put_mod;
> +	}
> +	priv->edev = to_ethosu_device(ddev);
> +
> +	ret = ethosu_job_open(priv);
> +	if (ret)
> +		goto err_free;
> +
> +	file->driver_priv = priv;

slice simple.

struct ethosu_file_priv __free(kfree) *priv = NULL;
...
priv = kzalloc(sizeof(*priv), GFP_KERNEL);

...

file->driver_priv = no_free_ptr(priv);


> +	return 0;
> +
> +err_free:
> +	kfree(priv);
> +err_put_mod:
> +	module_put(THIS_MODULE);
> +	return ret;
> +}
> +
...
> +
> +
> +static int ethosu_init(struct ethosu_device *ethosudev)
> +{
> +	int ret;
> +	u32 id, config;
> +
> +	ret = devm_pm_runtime_enable(ethosudev->base.dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = pm_runtime_resume_and_get(ethosudev->base.dev);
> +	if (ret)
> +		return ret;
> +
> +	pm_runtime_set_autosuspend_delay(ethosudev->base.dev, 50);
> +	pm_runtime_use_autosuspend(ethosudev->base.dev);
> +
> +	/* If PM is disabled, we need to call ethosu_device_resume() manually. */
> +	if (!IS_ENABLED(CONFIG_PM)) {
> +		ret = ethosu_device_resume(ethosudev->base.dev);
> +		if (ret)
> +			return ret;
> +	}

I think it should call ethosu_device_resume() unconditional before
devm_pm_runtime_enable();

ethosu_device_resume();
pm_runtime_set_active();
pm_runtime_set_autosuspend_delay(ethosudev->base.dev, 50);
devm_pm_runtime_enable();

....

return 0;

//pm_runtime_autosuspend(); /* you already call it at caller probe() */

if not CONFIG_PM,  ethosu_device_resume() will enable clk unconditional.

If CONFIG_PM, pm_runtime_autosuspend() will turn off clock later.


> +
> +	ethosudev->npu_info.id = id = readl_relaxed(ethosudev->regs + NPU_REG_ID);
> +	ethosudev->npu_info.config = config = readl_relaxed(ethosudev->regs + NPU_REG_CONFIG);
> +
> +	ethosu_sram_init(ethosudev);
> +
> +	dev_info(ethosudev->base.dev,
> +		 "Ethos-U NPU, arch v%ld.%ld.%ld, rev r%ldp%ld, cmd stream ver%ld, %d MACs, %dKB SRAM\n",
> +		 FIELD_GET(ID_ARCH_MAJOR_MASK, id),
> +		 FIELD_GET(ID_ARCH_MINOR_MASK, id),
> +		 FIELD_GET(ID_ARCH_PATCH_MASK, id),
> +		 FIELD_GET(ID_VER_MAJOR_MASK, id),
> +		 FIELD_GET(ID_VER_MINOR_MASK, id),
> +		 FIELD_GET(CONFIG_CMD_STREAM_VER_MASK, config),
> +		 1 << FIELD_GET(CONFIG_MACS_PER_CC_MASK, config),
> +		 ethosudev->npu_info.sram_size / 1024);
> +
> +	return 0;
> +}
> +
> +static int ethosu_probe(struct platform_device *pdev)
> +{
> +	int ret;
> +	struct ethosu_device *ethosudev;
> +
> +	ethosudev = devm_drm_dev_alloc(&pdev->dev, &ethosu_drm_driver,
> +				       struct ethosu_device, base);
> +	if (IS_ERR(ethosudev))
> +		return -ENOMEM;
> +	platform_set_drvdata(pdev, ethosudev);
> +
> +	dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(40));
> +
> +	ethosudev->regs = devm_platform_ioremap_resource(pdev, 0);
> +
> +	ethosudev->num_clks = devm_clk_bulk_get_all(&pdev->dev, &ethosudev->clks);
> +	if (ethosudev->num_clks < 0)
> +		return ethosudev->num_clks;
> +
> +	ret = ethosu_job_init(ethosudev);
> +	if (ret)
> +		return ret;
> +
> +	ret = ethosu_init(ethosudev);
> +	if (ret)
> +		return ret;
> +
> +	ret = drm_dev_register(&ethosudev->base, 0);
> +	if (ret)
> +		pm_runtime_dont_use_autosuspend(ethosudev->base.dev);
> +
> +	pm_runtime_put_autosuspend(ethosudev->base.dev);
> +	return ret;
> +}
> +
...
> +
> +static int ethosu_gem_cmdstream_copy_and_validate(struct drm_device *ddev,
> +						  u32 __user *ucmds,
> +						  struct ethosu_gem_object *bo,
> +						  u32 size)
> +{
> +	struct ethosu_validated_cmdstream_info *info;
> +	u32 *bocmds = bo->base.vaddr;
> +	struct cmd_state st;
> +	int i, ret;
> +
> +	cmd_state_init(&st);
> +
> +	info = kzalloc(sizeof(*info), GFP_KERNEL);
> +	if (!info)
> +		return -ENOMEM;

this one use cleanup will simple code much

struct ethosu_validated_cmdstream_info __free(free) * info = kzalloc(sizeof(*info), GFP_KERNEL);

> +	info->cmd_size = size;
> +
> +	for (i = 0; i < size / 4; i++) {
> +		bool use_ifm, use_ifm2, use_scale;
> +		u64 dstlen, srclen;
> +		u16 cmd, param;
> +		u32 cmds[2];
> +		u64 addr;
> +
> +		if (get_user(cmds[0], ucmds++)) {
> +			ret = -EFAULT;
> +			goto fault;

so all goto, can be use

return ret;

> +		}
> +		bocmds[i] = cmds[0];
> +
> +		cmd = cmds[0];
> +		param = cmds[0] >> 16;
> +
> +		if (cmd & 0x4000) {
> +			if (get_user(cmds[1], ucmds++)) {
> +				ret = -EFAULT;
> +				goto fault;
> +			}
> +			i++;
> +			bocmds[i] = cmds[1];
> +			addr = cmd_to_addr(cmds);
> +		}
> +
> +		switch (cmd) {
> +		case NPU_OP_DMA_START:
> +			srclen = dma_length(info, &st.dma, &st.dma.src);
> +			dstlen = dma_length(info, &st.dma, &st.dma.dst);
> +
> +			if (st.dma.dst.region >= 0)
> +				info->output_region[st.dma.dst.region] = true;
> +			dev_dbg(ddev->dev, "cmd: DMA SRC:%d:0x%llx+0x%llx DST:%d:0x%llx+0x%llx\n",
> +				st.dma.src.region, st.dma.src.offset, srclen,
> +				st.dma.dst.region, st.dma.dst.offset, dstlen);
> +			break;
> +		case NPU_OP_CONV:
> +		case NPU_OP_DEPTHWISE:
> +			use_ifm2 = param & 0x1;  // weights_ifm2
> +			use_scale = !(st.ofm.precision & 0x100);
> +			ret = calc_sizes(ddev, info, cmd, &st, true, use_ifm2,
> +					 !use_ifm2, use_scale);
> +			if (ret)
> +				goto fault;
> +			break;
> +		case NPU_OP_POOL:
> +			use_ifm = param != 0x4;  // pooling mode
> +			use_scale = !(st.ofm.precision & 0x100);
> +			ret = calc_sizes(ddev, info, cmd, &st, use_ifm, false,
> +					 false, use_scale);
> +			if (ret)
> +				goto fault;
> +			break;
> +		case NPU_OP_ELEMENTWISE:
> +			use_ifm2 = !((st.ifm2.broadcast == 8) || (param == 5) ||
> +				(param == 6) || (param == 7) || (param == 0x24));
> +			use_ifm = st.ifm.broadcast != 8;
> +			ret = calc_sizes_elemwise(ddev, info, cmd, &st, use_ifm, use_ifm2);
> +			if (ret)
> +				goto fault;
> +			break;
> +		case NPU_OP_RESIZE: // U85 only
> +			WARN_ON(1); // TODO
> +			break;
> +		case NPU_SET_KERNEL_WIDTH_M1:
> +			st.ifm.width = param;
> +			break;
> +		case NPU_SET_KERNEL_HEIGHT_M1:
> +			st.ifm.height[2] = param;
> +			break;
> +		case NPU_SET_KERNEL_STRIDE:
> +			st.ifm.stride_kernel = param;
> +			break;
> +		case NPU_SET_IFM_PAD_TOP:
> +			st.ifm.pad_top = param & 0x7f;
> +			break;
> +		case NPU_SET_IFM_PAD_LEFT:
> +			st.ifm.pad_left = param & 0x7f;
> +			break;
> +		case NPU_SET_IFM_PAD_RIGHT:
> +			st.ifm.pad_right = param & 0xff;
> +			break;
> +		case NPU_SET_IFM_PAD_BOTTOM:
> +			st.ifm.pad_bottom = param & 0xff;
> +			break;
> +		case NPU_SET_IFM_DEPTH_M1:
> +			st.ifm.depth = param;
> +			break;
> +		case NPU_SET_IFM_PRECISION:
> +			st.ifm.precision = param;
> +			break;
> +		case NPU_SET_IFM_BROADCAST:
> +			st.ifm.broadcast = param;
> +			break;
> +		case NPU_SET_IFM_REGION:
> +			st.ifm.region = param & 0x7f;
> +			break;
> +		case NPU_SET_IFM_WIDTH0_M1:
> +			st.ifm.width0 = param;
> +			break;
> +		case NPU_SET_IFM_HEIGHT0_M1:
> +			st.ifm.height[0] = param;
> +			break;
> +		case NPU_SET_IFM_HEIGHT1_M1:
> +			st.ifm.height[1] = param;
> +			break;
> +		case NPU_SET_IFM_BASE0:
> +		case NPU_SET_IFM_BASE1:
> +		case NPU_SET_IFM_BASE2:
> +		case NPU_SET_IFM_BASE3:
> +			st.ifm.base[cmd & 0x3] = addr;
> +			break;
> +		case NPU_SET_IFM_STRIDE_X:
> +			st.ifm.stride_x = addr;
> +			break;
> +		case NPU_SET_IFM_STRIDE_Y:
> +			st.ifm.stride_y = addr;
> +			break;
> +		case NPU_SET_IFM_STRIDE_C:
> +			st.ifm.stride_c = addr;
> +			break;
> +
> +		case NPU_SET_OFM_WIDTH_M1:
> +			st.ofm.width = param;
> +			break;
> +		case NPU_SET_OFM_HEIGHT_M1:
> +			st.ofm.height[2] = param;
> +			break;
> +		case NPU_SET_OFM_DEPTH_M1:
> +			st.ofm.depth = param;
> +			break;
> +		case NPU_SET_OFM_PRECISION:
> +			st.ofm.precision = param;
> +			break;
> +		case NPU_SET_OFM_REGION:
> +			st.ofm.region = param & 0x7;
> +			break;
> +		case NPU_SET_OFM_WIDTH0_M1:
> +			st.ofm.width0 = param;
> +			break;
> +		case NPU_SET_OFM_HEIGHT0_M1:
> +			st.ofm.height[0] = param;
> +			break;
> +		case NPU_SET_OFM_HEIGHT1_M1:
> +			st.ofm.height[1] = param;
> +			break;
> +		case NPU_SET_OFM_BASE0:
> +		case NPU_SET_OFM_BASE1:
> +		case NPU_SET_OFM_BASE2:
> +		case NPU_SET_OFM_BASE3:
> +			st.ofm.base[cmd & 0x3] = addr;
> +			break;
> +		case NPU_SET_OFM_STRIDE_X:
> +			st.ofm.stride_x = addr;
> +			break;
> +		case NPU_SET_OFM_STRIDE_Y:
> +			st.ofm.stride_y = addr;
> +			break;
> +		case NPU_SET_OFM_STRIDE_C:
> +			st.ofm.stride_c = addr;
> +			break;
> +
> +		case NPU_SET_IFM2_BROADCAST:
> +			st.ifm2.broadcast = param;
> +			break;
> +		case NPU_SET_IFM2_PRECISION:
> +			st.ifm2.precision = param;
> +			break;
> +		case NPU_SET_IFM2_REGION:
> +			st.ifm2.region = param & 0x7;
> +			break;
> +		case NPU_SET_IFM2_WIDTH0_M1:
> +			st.ifm2.width0 = param;
> +			break;
> +		case NPU_SET_IFM2_HEIGHT0_M1:
> +			st.ifm2.height[0] = param;
> +			break;
> +		case NPU_SET_IFM2_HEIGHT1_M1:
> +			st.ifm2.height[1] = param;
> +			break;
> +		case NPU_SET_IFM2_BASE0:
> +		case NPU_SET_IFM2_BASE1:
> +		case NPU_SET_IFM2_BASE2:
> +		case NPU_SET_IFM2_BASE3:
> +			st.ifm2.base[cmd & 0x3] = addr;
> +			break;
> +		case NPU_SET_IFM2_STRIDE_X:
> +			st.ifm2.stride_x = addr;
> +			break;
> +		case NPU_SET_IFM2_STRIDE_Y:
> +			st.ifm2.stride_y = addr;
> +			break;
> +		case NPU_SET_IFM2_STRIDE_C:
> +			st.ifm2.stride_c = addr;
> +			break;
> +
> +		case NPU_SET_WEIGHT_REGION:
> +			st.weight[0].region = param & 0x7;
> +			break;
> +		case NPU_SET_SCALE_REGION:
> +			st.scale[0].region = param & 0x7;
> +			break;
> +		case NPU_SET_WEIGHT_BASE:
> +			st.weight[0].base = addr;
> +			break;
> +		case NPU_SET_WEIGHT_LENGTH:
> +			st.weight[0].length = cmds[1];
> +			break;
> +		case NPU_SET_SCALE_BASE:
> +			st.scale[0].base = addr;
> +			break;
> +		case NPU_SET_SCALE_LENGTH:
> +			st.scale[0].length = cmds[1];
> +			break;
> +		case NPU_SET_WEIGHT1_BASE:
> +			st.weight[1].base = addr;
> +			break;
> +		case NPU_SET_WEIGHT1_LENGTH:
> +			st.weight[1].length = cmds[1];
> +			break;
> +		case NPU_SET_SCALE1_BASE: // NPU_SET_WEIGHT2_BASE (U85)
> +			if (0 /*U85*/)
> +				st.weight[2].base = addr;
> +			else
> +				st.scale[1].base = addr;
> +			break;
> +		case NPU_SET_SCALE1_LENGTH: // NPU_SET_WEIGHT2_LENGTH (U85)
> +			if (0 /*U85*/)
> +				st.weight[1].length = cmds[1];
> +			else
> +				st.scale[1].length = cmds[1];
> +			break;
> +		case NPU_SET_WEIGHT3_BASE:
> +			st.weight[3].base = addr;
> +			break;
> +		case NPU_SET_WEIGHT3_LENGTH:
> +			st.weight[3].length = cmds[1];
> +			break;
> +
> +		case NPU_SET_DMA0_SRC_REGION:
> +			if (param & 0x100)
> +				st.dma.src.region = -1;
> +			else
> +				st.dma.src.region = param & 0x7;
> +			st.dma.mode = (param >> 9) & 0x3;
> +			break;
> +		case NPU_SET_DMA0_DST_REGION:
> +			if (param & 0x100)
> +				st.dma.dst.region = -1;
> +			else
> +				st.dma.dst.region = param & 0x7;
> +			break;
> +		case NPU_SET_DMA0_SIZE0:
> +			st.dma.size0 = param;
> +			break;
> +		case NPU_SET_DMA0_SIZE1:
> +			st.dma.size1 = param;
> +			break;
> +		case NPU_SET_DMA0_SRC_STRIDE0:
> +			st.dma.src.stride[0] = ((s64)addr << 24) >> 24;
> +			break;
> +		case NPU_SET_DMA0_SRC_STRIDE1:
> +			st.dma.src.stride[1] = ((s64)addr << 24) >> 24;
> +			break;
> +		case NPU_SET_DMA0_DST_STRIDE0:
> +			st.dma.dst.stride[0] = ((s64)addr << 24) >> 24;
> +			break;
> +		case NPU_SET_DMA0_DST_STRIDE1:
> +			st.dma.dst.stride[1] = ((s64)addr << 24) >> 24;
> +			break;
> +		case NPU_SET_DMA0_SRC:
> +			st.dma.src.offset = addr;
> +			break;
> +		case NPU_SET_DMA0_DST:
> +			st.dma.dst.offset = addr;
> +			break;
> +		case NPU_SET_DMA0_LEN:
> +			st.dma.src.len = st.dma.dst.len = addr;
> +			break;
> +		default:
> +			break;
> +		}
> +	}
> +
> +	for (i = 0; i < NPU_BASEP_REGION_MAX; i++) {
> +		if (!info->region_size[i])
> +			continue;
> +		dev_dbg(ddev->dev, "region %d max size: 0x%llx\n",
> +			i, info->region_size[i]);
> +	}
> +
> +	bo->info = info;

bo->info = no_free_ptr(info);

> +	return 0;
> +
> +fault:
> +	kfree(info);
> +	return ret;
> +}
...

> +
> +static const struct drm_sched_backend_ops ethosu_sched_ops = {
> +	.run_job = ethosu_job_run,
> +	.timedout_job = ethosu_job_timedout,
> +	.free_job = ethosu_job_free
> +};
> +
> +int ethosu_job_init(struct ethosu_device *dev)
> +{
> +	struct drm_sched_init_args args = {
> +		.ops = &ethosu_sched_ops,
> +		.num_rqs = DRM_SCHED_PRIORITY_COUNT,
> +		.credit_limit = 1,
> +		.timeout = msecs_to_jiffies(JOB_TIMEOUT_MS),
> +		.name = dev_name(dev->base.dev),
> +		.dev = dev->base.dev,
> +	};
> +	int ret;
> +
> +	spin_lock_init(&dev->fence_lock);
> +	mutex_init(&dev->job_lock);
> +	mutex_init(&dev->sched_lock);

use devm_mutex_init();

> +
> +	dev->irq = platform_get_irq(to_platform_device(dev->base.dev), 0);
> +	if (dev->irq < 0)
> +		return dev->irq;
> +
> +	ret = devm_request_threaded_irq(dev->base.dev, dev->irq,
> +					ethosu_job_irq_handler,
> +					ethosu_job_irq_handler_thread,
> +					IRQF_SHARED, KBUILD_MODNAME,
> +					dev);
> +	if (ret) {
> +		dev_err(dev->base.dev, "failed to request irq");
> +		return ret;
> +	}
> +
> +	dev->fence_context = dma_fence_context_alloc(1);
> +
> +	ret = drm_sched_init(&dev->sched, &args);
> +	if (ret) {
> +		dev_err(dev->base.dev, "Failed to create scheduler: %d.", ret);
> +		goto err_sched;
> +	}
> +
> +	return 0;
> +
> +err_sched:
> +	drm_sched_fini(&dev->sched);
> +	return ret;
> +}
> +
> +void ethosu_job_fini(struct ethosu_device *dev)
> +{
> +	drm_sched_fini(&dev->sched);
> +}
> +
> +int ethosu_job_open(struct ethosu_file_priv *ethosu_priv)
> +{
> +	struct ethosu_device *dev = ethosu_priv->edev;
> +	struct drm_gpu_scheduler *sched = &dev->sched;
> +	int ret;
> +
> +	ret = drm_sched_entity_init(&ethosu_priv->sched_entity,
> +				    DRM_SCHED_PRIORITY_NORMAL,
> +				    &sched, 1, NULL);
> +	return WARN_ON(ret);
> +}
> +
> +void ethosu_job_close(struct ethosu_file_priv *ethosu_priv)
> +{
> +	struct drm_sched_entity *entity = &ethosu_priv->sched_entity;
> +
> +	drm_sched_entity_destroy(entity);
> +}
> +
> +int ethosu_job_is_idle(struct ethosu_device *dev)
> +{
> +	/* If there are any jobs in this HW queue, we're not idle */
> +	if (atomic_read(&dev->sched.credit_count))
> +		return false;
> +
> +	return true;
> +}
> +
> +static int ethosu_ioctl_submit_job(struct drm_device *dev, struct drm_file *file,
> +				   struct drm_ethosu_job *job)
> +{
> +	struct ethosu_device *edev = to_ethosu_device(dev);
> +	struct ethosu_file_priv *file_priv = file->driver_priv;
> +	struct ethosu_job *ejob = NULL;
> +	struct ethosu_validated_cmdstream_info *cmd_info;
> +	int ret = 0;
> +
> +	/* BO region 2 is reserved if SRAM is used */
> +	if (job->region_bo_handles[ETHOSU_SRAM_REGION] && job->sram_size)
> +		return -EINVAL;
> +
> +	if (edev->npu_info.sram_size < job->sram_size)
> +		return -EINVAL;
> +
> +	ejob = kzalloc(sizeof(*ejob), GFP_KERNEL);
> +	if (!ejob)
> +		return -ENOMEM;
> +
> +	kref_init(&ejob->refcount);
> +
> +	ejob->dev = edev;
> +	ejob->sram_size = job->sram_size;
> +
> +	ret = drm_sched_job_init(&ejob->base,
> +				 &file_priv->sched_entity,
> +				 1, NULL, file->client_id);
> +	if (ret)
> +		goto out_put_job;
> +
> +	ejob->cmd_bo = drm_gem_object_lookup(file, job->cmd_bo);
> +	if (!ejob->cmd_bo) {
> +		ret = -ENOENT;
> +		goto out_cleanup_job;
> +	}
> +	cmd_info = to_ethosu_bo(ejob->cmd_bo)->info;
> +	if (!cmd_info) {
> +		ret = -EINVAL;
> +		goto out_cleanup_job;
> +	}
> +
> +	for (int i = 0; i < NPU_BASEP_REGION_MAX; i++) {
> +		struct drm_gem_object *gem;
> +
> +		/* Can only omit a BO handle if the region is not used or used for SRAM */
> +		if (!job->region_bo_handles[i] &&
> +		    (!cmd_info->region_size[i] || (i == ETHOSU_SRAM_REGION && job->sram_size)))
> +			continue;
> +
> +		if (job->region_bo_handles[i] && !cmd_info->region_size[i]) {
> +			dev_err(dev->dev,
> +				"Cmdstream BO handle %d set for unused region %d\n",
> +				job->region_bo_handles[i], i);
> +			ret = -EINVAL;
> +			goto out_cleanup_job;
> +		}
> +
> +		gem = drm_gem_object_lookup(file, job->region_bo_handles[i]);
> +		if (!gem) {
> +			dev_err(dev->dev,
> +				"Invalid BO handle %d for region %d\n",
> +				job->region_bo_handles[i], i);
> +			ret = -ENOENT;
> +			goto out_cleanup_job;
> +		}
> +
> +		ejob->region_bo[ejob->region_cnt] = gem;
> +		ejob->region_bo_num[ejob->region_cnt] = i;
> +		ejob->region_cnt++;
> +
> +		if (to_ethosu_bo(gem)->info) {
> +			dev_err(dev->dev,
> +				"Cmdstream BO handle %d used for region %d\n",
> +				job->region_bo_handles[i], i);
> +			ret = -EINVAL;
> +			goto out_cleanup_job;
> +		}
> +
> +		/* Verify the command stream doesn't have accesses outside the BO */
> +		if (cmd_info->region_size[i] > gem->size) {
> +			dev_err(dev->dev,
> +				"cmd stream region %d size greater than BO size (%llu > %zu)\n",
> +				i, cmd_info->region_size[i], gem->size);
> +			ret = -EOVERFLOW;
> +			goto out_cleanup_job;
> +		}
> +	}
> +	ret = ethosu_job_push(ejob);
> +
> +out_cleanup_job:
> +	if (ret)
> +		drm_sched_job_cleanup(&ejob->base);
> +out_put_job:
> +	ethosu_job_put(ejob);
> +
> +	return ret;
> +}
> +
> +int ethosu_ioctl_submit(struct drm_device *dev, void *data, struct drm_file *file)
> +{
> +	struct drm_ethosu_submit *args = data;
> +	struct drm_ethosu_job *jobs;
> +	int ret = 0;
> +	unsigned int i = 0;
> +
> +	if (args->pad) {
> +		drm_dbg(dev, "Reserved field in drm_ethosu_submit struct should be 0.\n");
> +		return -EINVAL;
> +	}
> +
> +	jobs = kvmalloc_array(args->job_count, sizeof(*jobs), GFP_KERNEL);

here use _free() can remote all goto

Frank
> +	if (!jobs)
> +		return -ENOMEM;
> +
> +	if (copy_from_user(jobs,
> +			   (void __user *)(uintptr_t)args->jobs,
> +			   args->job_count * sizeof(*jobs))) {
> +		ret = -EFAULT;
> +		drm_dbg(dev, "Failed to copy incoming job array\n");
> +		goto exit;
> +	}
> +
> +	for (i = 0; i < args->job_count; i++) {
> +		ret = ethosu_ioctl_submit_job(dev, file, &jobs[i]);
> +		if (ret)
> +			break;
> +	}
> +
> +exit:
> +	kfree(jobs);
> +
> +	return ret;
> +}
> diff --git a/drivers/accel/ethosu/ethosu_job.h b/drivers/accel/ethosu/ethosu_job.h
> new file mode 100644
> index 000000000000..80358fcbdad7
> --- /dev/null
> +++ b/drivers/accel/ethosu/ethosu_job.h
> @@ -0,0 +1,41 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
> +/* Copyright 2024-2025 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
> +/* Copyright 2025 Arm, Ltd. */
> +
> +#ifndef __ETHOSU_JOB_H__
> +#define __ETHOSU_JOB_H__
> +
> +#include <linux/kref.h>
> +#include <drm/gpu_scheduler.h>
> +
> +struct ethosu_device;
> +struct ethosu_file_priv;
> +
> +struct ethosu_job {
> +	struct drm_sched_job base;
> +	struct ethosu_device *dev;
> +
> +	struct drm_gem_object *cmd_bo;
> +	struct drm_gem_object *region_bo[NPU_BASEP_REGION_MAX];
> +	u8 region_bo_num[NPU_BASEP_REGION_MAX];
> +	u8 region_cnt;
> +	u32 sram_size;
> +
> +	/* Fence to be signaled by drm-sched once its done with the job */
> +	struct dma_fence *inference_done_fence;
> +
> +	/* Fence to be signaled by IRQ handler when the job is complete. */
> +	struct dma_fence *done_fence;
> +
> +	struct kref refcount;
> +};
> +
> +int ethosu_ioctl_submit(struct drm_device *dev, void *data, struct drm_file *file);
> +
> +int ethosu_job_init(struct ethosu_device *dev);
> +void ethosu_job_fini(struct ethosu_device *dev);
> +int ethosu_job_open(struct ethosu_file_priv *ethosu_priv);
> +void ethosu_job_close(struct ethosu_file_priv *ethosu_priv);
> +int ethosu_job_is_idle(struct ethosu_device *dev);
> +
> +#endif
> diff --git a/include/uapi/drm/ethosu_accel.h b/include/uapi/drm/ethosu_accel.h
> new file mode 100644
> index 000000000000..af78bb4686d7
> --- /dev/null
> +++ b/include/uapi/drm/ethosu_accel.h
> @@ -0,0 +1,261 @@
> +/* SPDX-License-Identifier: MIT */
> +/* Copyright (C) 2025 Arm, Ltd. */
> +#ifndef _ETHOSU_DRM_H_
> +#define _ETHOSU_DRM_H_
> +
> +#include "drm.h"
> +
> +#if defined(__cplusplus)
> +extern "C" {
> +#endif
> +
> +/**
> + * DOC: IOCTL IDs
> + *
> + * enum drm_ethosu_ioctl_id - IOCTL IDs
> + *
> + * Place new ioctls at the end, don't re-order, don't replace or remove entries.
> + *
> + * These IDs are not meant to be used directly. Use the DRM_IOCTL_ETHOSU_xxx
> + * definitions instead.
> + */
> +enum drm_ethosu_ioctl_id {
> +	/** @DRM_ETHOSU_DEV_QUERY: Query device information. */
> +	DRM_ETHOSU_DEV_QUERY = 0,
> +
> +	/** @DRM_ETHOSU_BO_CREATE: Create a buffer object. */
> +	DRM_ETHOSU_BO_CREATE,
> +
> +	/** @DRM_ETHOSU_BO_WAIT: Wait on a buffer object's fence. */
> +	DRM_ETHOSU_BO_WAIT,
> +
> +	/**
> +	 * @DRM_ETHOSU_BO_MMAP_OFFSET: Get the file offset to pass to
> +	 * mmap to map a GEM object.
> +	 */
> +	DRM_ETHOSU_BO_MMAP_OFFSET,
> +
> +	/**
> +	 * @DRM_ETHOSU_CMDSTREAM_BO_CREATE: Create a command stream buffer
> +	 * object.
> +	 */
> +	DRM_ETHOSU_CMDSTREAM_BO_CREATE,
> +
> +	/** @DRM_ETHOSU_SUBMIT: Submit a job and BOs to run. */
> +	DRM_ETHOSU_SUBMIT,
> +};
> +
> +/**
> + * DOC: IOCTL arguments
> + */
> +
> +/**
> + * enum drm_ethosu_dev_query_type - Query type
> + *
> + * Place new types at the end, don't re-order, don't remove or replace.
> + */
> +enum drm_ethosu_dev_query_type {
> +	/** @DRM_ETHOSU_DEV_QUERY_NPU_INFO: Query NPU information. */
> +	DRM_ETHOSU_DEV_QUERY_NPU_INFO = 0,
> +};
> +
> +/**
> + * struct drm_ethosu_gpu_info - NPU information
> + *
> + * Structure grouping all queryable information relating to the NPU.
> + */
> +struct drm_ethosu_npu_info {
> +	/** @id : NPU ID. */
> +	__u32 id;
> +#define DRM_ETHOSU_ARCH_MAJOR(x)			((x) >> 28)
> +#define DRM_ETHOSU_ARCH_MINOR(x)			(((x) >> 20) & 0xff)
> +#define DRM_ETHOSU_ARCH_PATCH(x)			(((x) >> 16) & 0xf)
> +#define DRM_ETHOSU_PRODUCT_MAJOR(x)		(((x) >> 12) & 0xf)
> +#define DRM_ETHOSU_VERSION_MAJOR(x)		(((x) >> 8) & 0xf)
> +#define DRM_ETHOSU_VERSION_MINOR(x)		(((x) >> 4) & 0xff)
> +#define DRM_ETHOSU_VERSION_STATUS(x)		((x) & 0xf)
> +
> +	/** @gpu_rev: GPU revision. */
> +	__u32 config;
> +
> +	__u32 sram_size;
> +};
> +
> +/**
> + * struct drm_ethosu_dev_query - Arguments passed to DRM_ETHOSU_IOCTL_DEV_QUERY
> + */
> +struct drm_ethosu_dev_query {
> +	/** @type: the query type (see drm_ethosu_dev_query_type). */
> +	__u32 type;
> +
> +	/**
> +	 * @size: size of the type being queried.
> +	 *
> +	 * If pointer is NULL, size is updated by the driver to provide the
> +	 * output structure size. If pointer is not NULL, the driver will
> +	 * only copy min(size, actual_structure_size) bytes to the pointer,
> +	 * and update the size accordingly. This allows us to extend query
> +	 * types without breaking userspace.
> +	 */
> +	__u32 size;
> +
> +	/**
> +	 * @pointer: user pointer to a query type struct.
> +	 *
> +	 * Pointer can be NULL, in which case, nothing is copied, but the
> +	 * actual structure size is returned. If not NULL, it must point to
> +	 * a location that's large enough to hold size bytes.
> +	 */
> +	__u64 pointer;
> +};
> +
> +/**
> + * enum drm_ethosu_bo_flags - Buffer object flags, passed at creation time.
> + */
> +enum drm_ethosu_bo_flags {
> +	/**
> +	 * @DRM_ETHOSU_BO_NO_MMAP: The buffer object will never be CPU-mapped
> +	 * in userspace.
> +	 */
> +	DRM_ETHOSU_BO_NO_MMAP = (1 << 0),
> +};
> +
> +/**
> + * struct drm_ethosu_bo_create - Arguments passed to DRM_IOCTL_ETHOSU_BO_CREATE.
> + */
> +struct drm_ethosu_bo_create {
> +	/**
> +	 * @size: Requested size for the object
> +	 *
> +	 * The (page-aligned) allocated size for the object will be returned.
> +	 */
> +	__u64 size;
> +
> +	/**
> +	 * @flags: Flags. Must be a combination of drm_ethosu_bo_flags flags.
> +	 */
> +	__u32 flags;
> +
> +	/**
> +	 * @handle: Returned handle for the object.
> +	 *
> +	 * Object handles are nonzero.
> +	 */
> +	__u32 handle;
> +};
> +
> +/**
> + * struct drm_ethosu_bo_mmap_offset - Arguments passed to DRM_IOCTL_ETHOSU_BO_MMAP_OFFSET.
> + */
> +struct drm_ethosu_bo_mmap_offset {
> +	/** @handle: Handle of the object we want an mmap offset for. */
> +	__u32 handle;
> +
> +	/** @pad: MBZ. */
> +	__u32 pad;
> +
> +	/** @offset: The fake offset to use for subsequent mmap calls. */
> +	__u64 offset;
> +};
> +
> +/**
> + * struct drm_ethosu_wait_bo - ioctl argument for waiting for
> + * completion of the last DRM_ETHOSU_SUBMIT on a BO.
> + *
> + * This is useful for cases where multiple processes might be
> + * rendering to a BO and you want to wait for all rendering to be
> + * completed.
> + */
> +struct drm_ethosu_bo_wait {
> +	__u32 handle;
> +	__u32 pad;
> +	__s64 timeout_ns;	/* absolute */
> +};
> +
> +struct drm_ethosu_cmdstream_bo_create {
> +	/* Size of the data argument. */
> +	__u32 size;
> +
> +	/* Flags, currently must be 0. */
> +	__u32 flags;
> +
> +	/* Pointer to the data. */
> +	__u64 data;
> +
> +	/** Returned GEM handle for the BO. */
> +	__u32 handle;
> +
> +	/* Pad, must be 0. */
> +	__u32 pad;
> +};
> +
> +/**
> + * struct drm_ethosu_job - A job to be run on the NPU
> + *
> + * The kernel will schedule the execution of this job taking into account its
> + * dependencies with other jobs. All tasks in the same job will be executed
> + * sequentially on the same core, to benefit from memory residency in SRAM.
> + */
> +struct drm_ethosu_job {
> +	/** Input: BO handle for cmdstream. */
> +	__u32 cmd_bo;
> +
> +	/** Input: Amount of SRAM to use. */
> +	__u32 sram_size;
> +
> +#define ETHOSU_MAX_REGIONS	8
> +	/** Input: Array of BO handles for each region. */
> +	__u32 region_bo_handles[ETHOSU_MAX_REGIONS];
> +};
> +
> +/**
> + * struct drm_ethosu_submit - ioctl argument for submitting commands to the NPU.
> + *
> + * The kernel will schedule the execution of these jobs in dependency order.
> + */
> +struct drm_ethosu_submit {
> +	/** Input: Pointer to an array of struct drm_ethosu_job. */
> +	__u64 jobs;
> +
> +	/** Input: Number of jobs passed in. */
> +	__u32 job_count;
> +
> +	/** Reserved, must be zero. */
> +	__u32 pad;
> +};
> +
> +/**
> + * DRM_IOCTL_ETHOSU() - Build a ethosu IOCTL number
> + * @__access: Access type. Must be R, W or RW.
> + * @__id: One of the DRM_ETHOSU_xxx id.
> + * @__type: Suffix of the type being passed to the IOCTL.
> + *
> + * Don't use this macro directly, use the DRM_IOCTL_ETHOSU_xxx
> + * values instead.
> + *
> + * Return: An IOCTL number to be passed to ioctl() from userspace.
> + */
> +#define DRM_IOCTL_ETHOSU(__access, __id, __type) \
> +	DRM_IO ## __access(DRM_COMMAND_BASE + DRM_ETHOSU_ ## __id, \
> +			   struct drm_ethosu_ ## __type)
> +
> +enum {
> +	DRM_IOCTL_ETHOSU_DEV_QUERY =
> +		DRM_IOCTL_ETHOSU(WR, DEV_QUERY, dev_query),
> +	DRM_IOCTL_ETHOSU_BO_CREATE =
> +		DRM_IOCTL_ETHOSU(WR, BO_CREATE, bo_create),
> +	DRM_IOCTL_ETHOSU_BO_WAIT =
> +		DRM_IOCTL_ETHOSU(WR, BO_WAIT, bo_wait),
> +	DRM_IOCTL_ETHOSU_BO_MMAP_OFFSET =
> +		DRM_IOCTL_ETHOSU(WR, BO_MMAP_OFFSET, bo_mmap_offset),
> +	DRM_IOCTL_ETHOSU_CMDSTREAM_BO_CREATE =
> +		DRM_IOCTL_ETHOSU(WR, CMDSTREAM_BO_CREATE, cmdstream_bo_create),
> +	DRM_IOCTL_ETHOSU_SUBMIT =
> +		DRM_IOCTL_ETHOSU(WR, SUBMIT, submit),
> +};
> +
> +#if defined(__cplusplus)
> +}
> +#endif
> +
> +#endif /* _ETHOSU_DRM_H_ */
>
> --
> 2.51.0
>
