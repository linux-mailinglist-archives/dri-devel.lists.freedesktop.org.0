Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E14768C7449
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 12:01:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A8D610EC60;
	Thu, 16 May 2024 10:01:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="gQEx10Ks";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2085.outbound.protection.outlook.com [40.107.8.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9737A10EC4E
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 10:01:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IE8meJojtAr9r+A3f1G+GDgQdinv81JkfJNmnxgaS3VL1WVEwGYo2ZkuWbFzUTKQe/wioqKMzpavayn0UO5/G1CuT/rNmYvQLCFBnL8WIiKJ9sg/dhA0Sq9im/HtvNLc/UzFPDR7duw6H3qXnZ3GD4Tr4tJ1ljqY4EKgeKRThZGLNb9aGCn4XQ6uqZYMPmMjT/Qhhk1k/OMEN2f3alVHLNFr5GyieGq7BWQkbhiUSOp0p1YRSCSPHznqRKKQ1EUahPw+0G6iuccrusRPK2/yOMp42plIOvzp1zfSiO7RwNrTsMPL6yX+iTpQCLjhGzJS7JD4FuGxiyPhashLMYclAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ymfew+mbBrL2SXJHCFkAqeivGXDN8OSDVGpwMbLmEk=;
 b=VFeC/ax8is671sl6szmUrKCbdJc1tPwW0boHjvNNz2ZjGwIgJsk9WfrA4+QsvFWT4QjOoWGlro+T0MWzvKuUVsToF62a8puOcxrsYLe7wMw+4CtqM1YHeR2CiJlsqpdsOLldl78Y6zfLwOTMNO/K1gR9S7pw3/b2oGl6wNWv1g7luOkmYobu3WFjaj2lNTzqH53tCkWA1XjN9XEaHwiLUBS5YI4PjHTaG0Eof+5SGvgHy+e0JXF7qynVklgq4VabunhPBWCDtfIurXtfPU4r/JSlOe8U+P2n9Chq6iKvxtEBX7i3IpM92LfVIuAYcsxVfxQXezd5AXA9f6owT1eRiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ymfew+mbBrL2SXJHCFkAqeivGXDN8OSDVGpwMbLmEk=;
 b=gQEx10Ks8eiWYD+WXSd59BKrTY5r8JgKGStGCyXmljaDadiPA/AXZrZNupP+2607yROEzwILhR+tl8UbYyJ6Ym1z3WkBU0CkofUhazVOIiq8TvfbWlcB3wMBpqPePEo+k6MY3YlJV7/Xqb90DVtWB9CdYYgU7pqImeCPy/5vEwc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VE1PR04MB7232.eurprd04.prod.outlook.com (2603:10a6:800:1af::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.27; Thu, 16 May
 2024 10:01:36 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.7587.028; Thu, 16 May 2024
 10:01:36 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, biju.das.jz@bp.renesas.com, dmitry.baryshkov@linaro.org,
 u.kleine-koenig@pengutronix.de, aford173@gmail.com, jani.nikula@intel.com,
 bli@bang-olufsen.dk, sui.jingfeng@linux.dev
Subject: [PATCH] drm/bridge: adv7511: Exit interrupt handling when necessary
Date: Thu, 16 May 2024 18:10:06 +0800
Message-Id: <20240516101006.2388767-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0014.apcprd02.prod.outlook.com
 (2603:1096:4:194::19) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VE1PR04MB7232:EE_
X-MS-Office365-Filtering-Correlation-Id: ad8f8066-b1f0-4c66-cc54-08dc758f2bf2
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|376005|7416005|1800799015|52116005|366007|38350700005; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FkWqmwiHa763nOx5AtIetT9ZH/qenOcv26zEGRLmkz9UT0iJ/qhpZnPAelOp?=
 =?us-ascii?Q?PLDMGYPieZpm8MQW2ah2zN/S78XIbDHX3qjjB9Z8pzq6HJmHvlByYcswzfUz?=
 =?us-ascii?Q?qNqAp+yN+w359+eeJB8tj25pUvPu5kbD0QWdiI+96U15DMV4B12HH/m9QXm/?=
 =?us-ascii?Q?jKsFUzMuRNSIFpHXleTA3C4JoQvFYN9BPajhcZU3CRBU9Fi9XvfsJgAvf4ov?=
 =?us-ascii?Q?AtyMszXM7dvLwLQYdeA83ih0Jj4S+un0tRPiJJ355e61uvTcZ5hb53BPtzQo?=
 =?us-ascii?Q?EPRRaoJiv5P55HHv3frMYFi33tdIbWPGzr+wzrVMAQAk2z+So0sxOarESn4C?=
 =?us-ascii?Q?ELHDXIcnfek6+186Jin3ttNX64hJxc+q6B4OAOSTOQuAs4kdRPLJOq58pcl7?=
 =?us-ascii?Q?cbSnNZOkcEbC8UcR4ckSKvbVeJdQP3DSeHdAs1xy2pyfTM9bpM2lt6l9gVrz?=
 =?us-ascii?Q?+ha0skfpYkZLXoVozCvYMPM8o9hVsqhHfwJzwH+4EGHLO1gU6y96+ZehfAmm?=
 =?us-ascii?Q?J2FFqTKxSU+Os40WE2RDcrU2i3QM85L08JlY1ZHl6vdVTpJVGGLr8M102I5G?=
 =?us-ascii?Q?Fw/j7/ByZwMbm7UWqla1C20iA9WJS+b4qCcdrSchFHtbUEJ+795AI61r0Ld2?=
 =?us-ascii?Q?8R7D9Ke4NJ85JdM3LDAE++WSbo1V6cR+NVxcTHD4O3oDqvI6w5B7Fj+fCFWY?=
 =?us-ascii?Q?lU+KVAlTZ9/lOO1iK88QpnNtvaUQWGhrOl/xz7BeeBdpz9ETskyXSGw0I17L?=
 =?us-ascii?Q?rF7eoOwuqmstBaQpSE8DLN6h5t3s8R5rCvSOyIlJgWjjh3mxzHKkuwh6lzh5?=
 =?us-ascii?Q?4ALzbF47uvOHIKejMDWsQTwCPd6ZAsDxX+9RtjBr38/o4971D1lCkTs0W0tb?=
 =?us-ascii?Q?L8EDdqdSinjW+obGehYjfbVV4MnKQX9sh0NOJwjNzNOFzQQ5qRkLK2/Noqht?=
 =?us-ascii?Q?K4WBkeIJ85i3zLNUBebiXJMQTmucUymEZDO6VR5xgA1Z9L4eHSVyATAX3reP?=
 =?us-ascii?Q?lngOX+4LcNknc8JEq4M+EhLugOmroBqPxSDcaW1/qd/rIl8O2ZOf81XKDVxt?=
 =?us-ascii?Q?+GQkxmfZICwGbQMBvvcYhdDql8bXo6XcY73oQrjFQjOWUtKRfR+SRVLppDu7?=
 =?us-ascii?Q?wryzedizi7KCxp4ptVvSwWOetQh+dV6HpzfICjCHYvFih4IMQAXuz0OZxfQP?=
 =?us-ascii?Q?kQX7n5WjuZKTuiqqex8f/0QLDMCpPJFonxunbI9ys92Bgw1kHIwO0535PxkE?=
 =?us-ascii?Q?E/VkXW20Xzx8xeO80GPzaJ+sOYtESxfka40AK0AWWO3Jxv2XVXxLU465qytm?=
 =?us-ascii?Q?neteIhzwQ2YfmUdOAoLn3brYfC1C09MfSagyGTzeRryCew=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(7416005)(1800799015)(52116005)(366007)(38350700005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YGjgpN0Ze4IhwlWZZjuVCD1VF4bRvE5P9sVqDRPu4yxS+4MfAHmhoq3d+7dJ?=
 =?us-ascii?Q?36Dyyaa+/KVkF9cmswFjlKKaDFjbS1+hSAZnss4GOeYCVC/+QS8sw9ZsAnFN?=
 =?us-ascii?Q?AVtx/o5h2iEBT6WI1BtlkvFMVe8ZpQ0Ry5CzxJIEwGpqeboWhJS1/aECkNYf?=
 =?us-ascii?Q?J74ohEHrdp7+DlcO8Fxr33+7OANVRuI4WXSCSGP1kZLBr+Kmp8x0FNl+052Z?=
 =?us-ascii?Q?daUXpPuJf5iFweJFqgaoXMq0DN+zY7r7QkGMwFsLJE1/nBerZLJfYZ6aEL2k?=
 =?us-ascii?Q?Wlf+yPuOlCqd7iKEyzBYa+uDQCSGI+cYn02SVyXwKRHJ0x/GMll+PbuDwH2/?=
 =?us-ascii?Q?mOvvOrx8TL1d2DtBvRfez4Wbkp1Y+hYjnkf630ixjT59+ia5aWv5So5AbWvC?=
 =?us-ascii?Q?P++Oe/xONX8yBIj428UT7jjj3OGBaK6umigGR3KQetHA+gzu/ulUAXy78BHd?=
 =?us-ascii?Q?ttU3x6+xHDKhEnx4Olsz6wJ4DZILfUhQBnAuAcR69yroNDEtPf/dtz894W5M?=
 =?us-ascii?Q?DauM3cqFr99QyzaRMYjtkz1u1Vd1OaUMY3OusjWwjIPq4rb/4izX4EycyXgB?=
 =?us-ascii?Q?yS2u6hzuhbvW923UdwxpY3dDNFtnAZ78X0bCxVe3tBNzreUsbAdO8XNXpvu6?=
 =?us-ascii?Q?d8m4WYA2dGlaxvPI9yIcSUW6wLQ5EZplG1d//bJxg1r66F/4xtfokLw5+6oe?=
 =?us-ascii?Q?qc5M1r9C9Dg2KIR+aeoeLpSdFnSgshkWFqrwXoQwIey9NP4a0TWkccCUBzk3?=
 =?us-ascii?Q?kd5uKJzZ3h99RD4i2/O9yF2jM9NRWGR8CSU6PaG6wghZ9h6RLruNBNK+wVYW?=
 =?us-ascii?Q?/2zv9KShjm880VmYHh66UB7ZFLAhahio8pBNN7AjS1G1M2p4SSzwsRb1GON9?=
 =?us-ascii?Q?PW+NxpL+m51SHcdqpfvoi8Mvgxt7A+zhXfFqyNvENGPCw6K2S/2nYVFyKz6V?=
 =?us-ascii?Q?KAhgk0IoWbZX0hLJTwhAS0SK6LG6GjR7UrYDVPW8VPH1zFtwBq5UPilsNUZW?=
 =?us-ascii?Q?k1dfnNdSOuSbefOSQKhnBrUVTwkR+Y1a96QnAGEqYC5181+PKaIr5SPumwys?=
 =?us-ascii?Q?hPl6heeJnsvD7SOOs8xdimHZTRHtluJNakV3a2wV9Hb/zhZYDyRjdvh4mKWt?=
 =?us-ascii?Q?aS0rGVwJqZrzT5QfTmXoro5m7kMIMnE3MVPUnMEZUPcWPIpBc0kDM7MwvRzQ?=
 =?us-ascii?Q?PxDIWWFM08qTuZx+g2vDOVjMyD76Pu19jfjxMI0+364Be6PvJeUydriDHgtr?=
 =?us-ascii?Q?tw9qkmEaogR4Fy2E2Qjbd1e+9Ztv3aDT0cXt01YFTfiVnHgM9wRS1qYZ2KJl?=
 =?us-ascii?Q?AKvuVok30aPNs5ButWGf5iorZSlIBYp9Ha6NqRy+QAVX5rWEkVdMpTRBIv/s?=
 =?us-ascii?Q?CWK/oN7kqBGVle1fvBbQu5iQn9FeTP+f4AqGGuThAUl+e4/zb3WUh07Np03e?=
 =?us-ascii?Q?JpPTEe2urX/G1++WHH8GobTwl6xmWB0XOAV/NC3cl0sw3NkT9Wd37BOj4IrG?=
 =?us-ascii?Q?8oR/Py18enNDjI71Ug+w0QVRPTIDL1QkTk64n3DaFfumLy0gdJQtYUHsNeSC?=
 =?us-ascii?Q?TEpOmhnhE778dWxSkxHel2QOwLWUzrQemHTXF3fL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad8f8066-b1f0-4c66-cc54-08dc758f2bf2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 10:01:36.0542 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jdPEP+GC8qduQeyYelVsFZzYhG4isVvLk4nzNuLiruZfWWjjBCh8KFE0dZF5kGa3VMRKmobZ9SpDZ/abFi52UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7232
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

Commit f3d9683346d6 ("drm/bridge: adv7511: Allow IRQ to share GPIO pins")
fails to consider the case where adv7511->i2c_main->irq is zero, i.e.,
no interrupt requested at all.

Without interrupt, adv7511_wait_for_edid() could return -EIO sometimes,
because it polls adv7511->edid_read flag by calling adv7511_irq_process()
a few times, but adv7511_irq_process() happens to refuse to handle
interrupt by returning -ENODATA.  Hence, EDID retrieval fails randomly.

Fix the issue by checking adv7511->i2c_main->irq before exiting interrupt
handling from adv7511_irq_process().

Fixes: f3d9683346d6 ("drm/bridge: adv7511: Allow IRQ to share GPIO pins")
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 6089b0bb9321..2074fa3c1b7b 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -479,7 +479,8 @@ static int adv7511_irq_process(struct adv7511 *adv7511, bool process_hpd)
 		return ret;
 
 	/* If there is no IRQ to handle, exit indicating no IRQ data */
-	if (!(irq0 & (ADV7511_INT0_HPD | ADV7511_INT0_EDID_READY)) &&
+	if (adv7511->i2c_main->irq &&
+	    !(irq0 & (ADV7511_INT0_HPD | ADV7511_INT0_EDID_READY)) &&
 	    !(irq1 & ADV7511_INT1_DDC_ERROR))
 		return -ENODATA;
 
-- 
2.37.1

