Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A11548FAC9B
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 09:54:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAE6310E3A0;
	Tue,  4 Jun 2024 07:54:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="WLONGakP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2061.outbound.protection.outlook.com [40.107.8.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E493810E3A0
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 07:54:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rcbloe1hCIpQnXjLlY7KAtzz1ThpgVBrVLwgbEukOTzfCPb+5GpLsH8Tuc1A1Riwyqk8q9WIRBtdqkl8unuhv222rqICy8327fNAMOImYPhuQl7bxXgFmYA/o4VAA1IJUlLWSsYyVuPU2XDD1o2Di5tCbrp0ZTa52FZa/VbrjTZccQNorWUTtrHk/e+v96/KeTZMdgP3UFh5uiNriCjErAscXE+dNYfRZ7/DF/OwSKdR22F7b68nW+cJs5g2ETiE3tHYAhxgveVVMm3DaVq6dMfeTSNAFgesCTpvscXh6erRUEoJxhGfWs4UWOAHvA3O+G9UYjjYVotJ1BhbWH0V3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hteWmja6vb3IQ8GfcY3lSL1CRwcOLpAMk0QyTnGJc2M=;
 b=CGqjG/43FgZPZaWWd4Q+ImoCR4bLVNuKYwEaL/KHXvjvyvaogKmQ35Icp0JImf4NlVY4IQt5i+uPANplSphJf6OxY2RDkwjIRfKTyVi6WVW7Mop1AW3xW+mFpN9XYy9Fd+T5M3tO9xwDhYbGubmcAf2zTrGuFLJmZMlwbTFCqvt0P7O9jiZayyj+2K7r0kEzs1TSoSLZ9xWCciQ9C6xLpU1n8Xshc2MsgzfWEIF/t29fiju+bYWmvUP9yJpYjDC8se4QD35PffFLJZnHp8COrXcnV9OL1talO2jktUuu701A5lC9N6ZKPt0vR3iL4dHHwB/f9igW1cKPBT+Ugkj5eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hteWmja6vb3IQ8GfcY3lSL1CRwcOLpAMk0QyTnGJc2M=;
 b=WLONGakPgoWhUMlh5VriErVGhIJwPuILp+qugVwZVM+jn+O5msH6akhtgDp8AGcfgZ1vUKrWjLKfjnV/UgzQYfaI7kEC8oIyh4q5HojdGHxL15uPa5Ur1IR5ros5lYRdgTJ8R0jMzN7inz2KiTCysOKSOKdVMgoCRIIUdFHwSEU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DU2PR04MB9019.eurprd04.prod.outlook.com (2603:10a6:10:2d4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Tue, 4 Jun
 2024 07:54:27 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::557f:6fcf:a5a7:981c]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::557f:6fcf:a5a7:981c%7]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 07:54:27 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>
Cc: Peng Fan <peng.fan@nxp.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/fbdev-dma: fix getting smem_start
Date: Tue,  4 Jun 2024 16:03:28 +0800
Message-Id: <20240604080328.4024838-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0028.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::9)
 To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9417:EE_|DU2PR04MB9019:EE_
X-MS-Office365-Filtering-Correlation-Id: beb9456b-15e1-4151-7d85-08dc846b8eb9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|376005|52116005|1800799015|366007|38350700005; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zs47fTBrfDyH0TTfaGI6SHSZUtNJrIhEKkaN6+zilTfnKeSnTAqIkLt68TB7?=
 =?us-ascii?Q?ioMPY8k0vsbYFUCg3IR9MmlwMaccz8gTK+g8b5joToI90Mqs8MsyETdwbxUA?=
 =?us-ascii?Q?Xewf4qGVpLXtG4fwE/OJIhCrptwNKFZSvd4qfu6pu/FxWTrxzxC89Ddr7UCb?=
 =?us-ascii?Q?7VcrzaSMLlSpborRQ68/PQTj5Ymxf+FVq4A2qMW09ugg83Qmp1IdMrExGAs3?=
 =?us-ascii?Q?ROMtAhKQnYJmjnlMKTH7bjiWSDjVVZ+QLuLimp/xmi9qZRthoyuEHiTjvfSJ?=
 =?us-ascii?Q?t4QURXNv6JbRbZtec1Rk39MFihY9n0wAiu+f8uDF8R19HoGZ27UXj0a1JY3Q?=
 =?us-ascii?Q?dsswxRUPi66SHRgTHU/DjxeaSfdYz5G9v/KTtKuhbS33GwabrhDaFislaXx4?=
 =?us-ascii?Q?lyO+GyrgERYA/DxgEzHbGfzqL3TbXIHWk3dLgK0LO7uVHbV0I2YaDvn9UW3+?=
 =?us-ascii?Q?WS6BIy6a+YqSYteIls3v7qX/D+CjBc0+XKaI8KOAP/56usvJ3yxE320/NUyD?=
 =?us-ascii?Q?RZ3rhqWilddI6yQZE1O3d5Uihd++Mf4iQSA/3OxqtBuUngKOp5pA5HD0mVYG?=
 =?us-ascii?Q?9mqEJg1iBrkJ1mzRUyzymmKuRLzis5s7TuZqQYa9MdYpMFDVtuLct3X+Xzt/?=
 =?us-ascii?Q?GYHe+/5cOhQcMY8TTYk7TxoMXzTeX3x7bsMeM44Q6yMMlGxKZgHANQAbNa9q?=
 =?us-ascii?Q?YOkj5MMOtw85gj9AJpWw2AYBuzIFb+TeIf6KETJwdMwxSXUY/82ND8BR1P1e?=
 =?us-ascii?Q?LzCyejEQk8jEV2Av4hGkgYTq75lEKtb0zPTwRHEUb2TEoYkZQVNo4xC88uuL?=
 =?us-ascii?Q?m14Z4elCnjRpjk871MOQMcj1OUQEwBp4uYF/7OPREEsa7idaa8g9aviNpxvy?=
 =?us-ascii?Q?WpUmJfOTrEF6lFkW0kajQpmGkTePqy3REQyvtBOqmEFAxoJ73D5v9BlvA+OD?=
 =?us-ascii?Q?lVVnvjTxxowpyVKaqVAVviIc1T4qIX4PqxLGL+wM5A+39jV1QV6AenVbMryZ?=
 =?us-ascii?Q?Mv3Zy4UDMQGYyUnLXqpU6gFKpV8x7Uoq34pFnezCSqze/KlZmpLYEpCwW13I?=
 =?us-ascii?Q?ijGEPqp55OuwdxXgUUYFg7YEmghmhI8rv+g36drW46DE/kTvmCG80ontDpc9?=
 =?us-ascii?Q?DLoXkZuDN072/iYZN7Ca32cwicrKehPHjUxrjK6GqGcWw0jlKTYBUv/Khw8O?=
 =?us-ascii?Q?f1jDZNG5ptvJZyUR8AqMspcL92bdIgi2qX1eNgnO1ZWrXamaKs9r7964OT74?=
 =?us-ascii?Q?tlaQ3jyy5cZcAeqW1F1PNI8AFTski/EYBpNkZ+fxZpP2s1N0FDhmtg+BROhl?=
 =?us-ascii?Q?pdyE4OmZI2y9M7imNUhfOSmVBKYmqHziKEfNpQuCSmzCVQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR04MB9417.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(52116005)(1800799015)(366007)(38350700005); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ry7zHsSLf7Sh91FWMRNu1CssHy7bsqN5tPDkUf3zyf+GULC/5pri1QNybZht?=
 =?us-ascii?Q?Ftie0048x/OVy8FVv5ZvgLnJ9tlsuqetQqZUzhzTvfiHJv+4DpJHcwbsukbe?=
 =?us-ascii?Q?lPwHZVgDSmuz0MM4YNkwk1PFK87wo91ZzpoYGxvQmkJ5p5DilOogr6RgAbgb?=
 =?us-ascii?Q?/5JovFtISCDrN0cFvsnfgAwahwxTQAleUOHuOU/5owtBFctlgJ5Ewb8lHosA?=
 =?us-ascii?Q?sDGEh2v5OvD8u2XwUnxLRRvPtSwPs+z8QyPWVZSgG+wzCEwWrQTQxm6D3rLr?=
 =?us-ascii?Q?urVC2RfNBx/eooRpSnbpjlwNJwfbtCU1YEbgqKr/j7mhFgY1B0uL0MOouRmJ?=
 =?us-ascii?Q?mUac5VZQgenwN1vZihNfgzBygqHUcAE459RyN4BA6+yOvyo57k+GY9NwMafo?=
 =?us-ascii?Q?Ra6cdwEX2xVG0NK/Qn/ExEn76+1nEjzHVcPiLbBugYcC+y564p2T/Uu0Fa8d?=
 =?us-ascii?Q?tTY9PXNXJal7evabgoRLiNc4MrSV80q8j+cgvbIQ0Z74sWlc/I07rBif2s5U?=
 =?us-ascii?Q?Is5I3ejH6ERTbChj3cEBGCFwzJDqNJIw9SchLmAfrT6NfPObxbhDbEUMe0T4?=
 =?us-ascii?Q?5zgSMMmDWdVj/j1HsKmPi3crNhk4Efrdrs+fyFODM6PS2hA9ad7wXbnPI0n5?=
 =?us-ascii?Q?1YZsPHZ32BYbmqygY9Rq2+ok7o1VJT25Rv6JpGqJF+mjgHzoobEfMCVOaa48?=
 =?us-ascii?Q?JJDss2bd/o/HOFKGBT60tuL1Wlwfh86JaNOG+Ef3qCcvyitDD3BgZc+irICN?=
 =?us-ascii?Q?jkPPIAj75Dp+EmBGsvEuRdkopUwCe8CSSvJDPR0XK+xj+sLM2Z3Euy4o8FMw?=
 =?us-ascii?Q?5pzgsBq6HlW4IL2MaSgbB4/Gam4pQYeNNvAjVjIoJb/P8YN9iIpdjbOmlU0x?=
 =?us-ascii?Q?kR8kfNk/NZoUQDphMSPAO6TalLavp3duZ+HXyNlXS8lJymxtJ0Oo6cYGDOIK?=
 =?us-ascii?Q?uSBt9yW/Xn+7Hbya83NoXrGHgAR59KV11yKVD8O/D0Y/q4LWcqoeKUEl1QbB?=
 =?us-ascii?Q?/rYcxV4UrGxCA8uIsT5m6xIvKU+KhrUfyd23ju+7UFeQe6chk11Tsra3ot0/?=
 =?us-ascii?Q?byel8HKpJ3O00TpyiTRjY3oBp5n+1j+8L38xGcG08D93FdPtXQ74lFU0+KBB?=
 =?us-ascii?Q?y5NxhAKgsmPGMHZV94JtW2/mgoO48Piuh58JEnvJrEyRCIy7uRaipqbM1Qcb?=
 =?us-ascii?Q?J/i+02B3KenNiaQTWWU/w9fwpjBFpNUILa8iKbuQv5uLoS8z49VUFjBXVbxq?=
 =?us-ascii?Q?SlrDGLiDwveMFKNR4ZmsSVok2xNBwARJ7dtoCgtYBpNF49ZgkWfdTeBforTg?=
 =?us-ascii?Q?ZCGraxQs+faMLqfZpEWTnY4L/StrmpjwA/LUguHGkjWwEyffzlZ0ytVruEE/?=
 =?us-ascii?Q?dp35Z3mPDq8IDLNaKfWY8fD99zAL2lw3XyANgIxCY2w9NtpK4+9m1evI/euP?=
 =?us-ascii?Q?XnPiRtxl6WDqKe9oXZMRlsZGziTCbLAJBnZHME5RRESi89YVXYTEDz414PFy?=
 =?us-ascii?Q?4PXESd8U+fcGaPd0UlxE8qon+sPRsf0dQpTxFXEoaHQT7A2ysaGYbfnx+UtS?=
 =?us-ascii?Q?/M459fMKWrZ833+3SxhlUtmcpOR7Sh6RpO9fuIye?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: beb9456b-15e1-4151-7d85-08dc846b8eb9
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 07:54:27.5422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jy0mmp7YSVkRGMMt9cqmELLAD3hM8CRJoLMYAiDBfIwVft9VwtKD6xyTjQlvCfN/7n9+ntu54i+KDW4w4BQKCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9019
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

From: Peng Fan <peng.fan@nxp.com>

If 'info->screen_buffer' locates in vmalloc address space, virt_to_page
will not be able to get correct results. With CONFIG_DEBUG_VM and
CONFIG_DEBUG_VIRTUAL enabled on ARM64, there is dump below:
[    3.536043] ------------[ cut here ]------------
[    3.540716] virt_to_phys used for non-linear address: 000000007fc4f540 (0xffff800086001000)
[    3.552628] WARNING: CPU: 4 PID: 61 at arch/arm64/mm/physaddr.c:12 __virt_to_phys+0x68/0x98
[    3.565455] Modules linked in:
[    3.568525] CPU: 4 PID: 61 Comm: kworker/u12:5 Not tainted 6.6.23-06226-g4986cc3e1b75-dirty #250
[    3.577310] Hardware name: NXP i.MX95 19X19 board (DT)
[    3.582452] Workqueue: events_unbound deferred_probe_work_func
[    3.588291] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    3.595233] pc : __virt_to_phys+0x68/0x98
[    3.599246] lr : __virt_to_phys+0x68/0x98
[    3.603276] sp : ffff800083603990
[    3.677939] Call trace:
[    3.680393]  __virt_to_phys+0x68/0x98
[    3.684067]  drm_fbdev_dma_helper_fb_probe+0x138/0x238
[    3.689214]  __drm_fb_helper_initial_config_and_unlock+0x2b0/0x4c0
[    3.695385]  drm_fb_helper_initial_config+0x4c/0x68
[    3.700264]  drm_fbdev_dma_client_hotplug+0x8c/0xe0
[    3.705161]  drm_client_register+0x60/0xb0
[    3.709269]  drm_fbdev_dma_setup+0x94/0x148

So add a check 'is_vmalloc_addr'.

Fixes: b79fe9abd58b ("drm/fbdev-dma: Implement fbdev emulation for GEM DMA helpers")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpu/drm/drm_fbdev_dma.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_fbdev_dma.c b/drivers/gpu/drm/drm_fbdev_dma.c
index 6c9427bb4053..9e2eddb6eb5c 100644
--- a/drivers/gpu/drm/drm_fbdev_dma.c
+++ b/drivers/gpu/drm/drm_fbdev_dma.c
@@ -130,7 +130,12 @@ static int drm_fbdev_dma_helper_fb_probe(struct drm_fb_helper *fb_helper,
 		info->flags |= FBINFO_READS_FAST; /* signal caching */
 	info->screen_size = sizes->surface_height * fb->pitches[0];
 	info->screen_buffer = map.vaddr;
-	info->fix.smem_start = page_to_phys(virt_to_page(info->screen_buffer));
+
+	if (is_vmalloc_addr(info->screen_buffer))
+		info->fix.smem_start = page_to_phys(vmalloc_to_page(info->screen_buffer));
+	else
+		info->fix.smem_start = page_to_phys(virt_to_page(info->screen_buffer));
+
 	info->fix.smem_len = info->screen_size;
 
 	return 0;
-- 
2.37.1

