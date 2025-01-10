Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99265A08AA6
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 09:47:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1561410E4FC;
	Fri, 10 Jan 2025 08:47:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="OSg00vQd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2054.outbound.protection.outlook.com [40.107.249.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA2E310E4FC
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 08:47:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FpwaKhdLx56zM/LAbYXjdYlL2Mr5aPuAK6SdL7fPj6bCbB+vIHYUVA1uuzeL/vGySDEwdq0XY3mammkc3GTBGwUbeJ+n7qufKxIu6W3YdeBWfH6e3b/ZhJ5G+RSvhcGY9MyzVjC022JTfYaQ0+NrUe2XW43zZsD3UsCdtJusnNpdlqqJcDhx14JXOPXO/ONM4ZQutYCUf04JYe7zdqkMFZhMv2fy5z9GtAfdXOripyOLunj5zrTTtAGs+YBGu4diSZelSFZEuyzNCmvutBN1J/27luLr+ozONIndqmUcGOKl0QxfvkYfC7P8lwhuUTrF4UGDdmPDpVqARdtzsw/4Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VW4dGaT0v5IoxjWe15+w5qtcWgWmgfapMXw1w3m8Rc0=;
 b=GvSqijwpBSr7NMwRWTVawUsuCifqhCSlbeeBFHM3apbAvWcdQwdVqHitBXUoUFmcmQkMRoeq8POHo7kF1PhOcl3/xMJ3sf2G+HkEVAy0ZfTdmVOQ+/wkhFBmKkLsJSnrmlRfvquMeHTEKZesBGni5p3f1ETxzsILkcUwv7XOH/q7krVKCVjALDHhpnMsy9lKbcyLoQtOxmM8EUuFiF0PXhlq0uqZCFeT4/AqLlMgCBvQ2ubbvBKA3aOyrgScyQ5UKXiIiobtvrPBEdoksJTQWlJMeiqYzhotTI/+GgbqgHcpLmXLF0MXDmM4ZCUeUR7Q4K/FJNkvvsVQmRoILePvkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VW4dGaT0v5IoxjWe15+w5qtcWgWmgfapMXw1w3m8Rc0=;
 b=OSg00vQdYJZ0z6lDFcB6q1vGoBekUNoI+Iy9zLpo6VaswJeGTiut+rR+l2z9cAT4ENmj45z+hwtvZn0gYIfj4kiPA0GWnx1irKH4U9hmwaqFaosrotOfRwEwi1Nk79psvzbtTRuDaMqst03o+dW2fuHypDP9Ldlhr6ER7m6CU6FM83n0UJTCmiEUJBO+4eYtNaHhAQ96eTFao+n7AGuEnhxydHNmDEBJFuwK1/5pDKdrxS+/RMFE/SEc2Om1ZT2+ZnTrhsm++pK8JZbsooKHZQNIGqyF7qg8Uxx0r8bn1Fuhj4r57mDqC+zzOtCgjgIZcPk33q0kb+U4LU/kJVGDwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS5PR04MB9770.eurprd04.prod.outlook.com (2603:10a6:20b:654::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Fri, 10 Jan
 2025 08:47:45 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8335.012; Fri, 10 Jan 2025
 08:47:45 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dmitry.baryshkov@linaro.org
Subject: [PATCH v2 1/2] drm/connector: hdmi: Do atomic check when necessary
Date: Fri, 10 Jan 2025 16:48:20 +0800
Message-Id: <20250110084821.3239518-2-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250110084821.3239518-1-victor.liu@nxp.com>
References: <20250110084821.3239518-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JH0PR01CA0186.apcprd01.prod.exchangelabs.com
 (2603:1096:990:75::11) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS5PR04MB9770:EE_
X-MS-Office365-Filtering-Correlation-Id: b119083d-76b3-4fad-3552-08dd315373b0
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|52116014|1800799024|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?boe2jpJs+SBGO7ND/l30ms7oRvGfPOZPOx9ImrpETADRDzHKOfkJsCa2NS8I?=
 =?us-ascii?Q?y4esz7GLHCmb5yBwt3+2iJwTXPANeBV2+6sZ/CmcolKdiAFwA8z+7xy6LTnB?=
 =?us-ascii?Q?n6gLIZY7Gb2LTRmIXS7IZSoojcyoKDHxD3J0fvlOTx7D57vcX4TrJH5yJlDL?=
 =?us-ascii?Q?TGA6d68HW5NB1iMcmgRP9OPv66jx6Q8oIyM1MdEzY8sAJelUdMUZ3ejEm/cz?=
 =?us-ascii?Q?8+L0cEZwaVZMXi0++4noqIE6TlSOrpp7GCgMlzPaBeu0iB2vfhBkQmR5bh5m?=
 =?us-ascii?Q?N7UdooHa/1GftXKRmuboq0zHDpzMiZNfFgNsdkNK2OuHD3R74GGsA7ZlOxdM?=
 =?us-ascii?Q?xeH1UMlveU0xZLh7YwhwwlNl3ZSGeG6DfSbyzuId+p8S5/R2PzallbxzWmnN?=
 =?us-ascii?Q?d3wIJFiJbjir7VZs17jhiPXvcvnGhdw1J6TtjeKOvdqvO1RFGmTba21C3+JC?=
 =?us-ascii?Q?BtdkHSJqaVYXWmCVKJtfPtVCP6dNhe2/mGT+IMcjzKHMx+Ww78kng4iqdgQo?=
 =?us-ascii?Q?Q3sikqQvDmAdwe73AG/eRnjOUTWwm/aJBOXb0qqyQN9kJrjWl8K5okJReaB2?=
 =?us-ascii?Q?wc9bLR3mTvdx5RImC2nDzskvDevLJg2LvVczEBnywvAnsjd4YYvV2xttT/sG?=
 =?us-ascii?Q?bP5+gHfzUkEF2ogKhs/lzg6y5W3EB8bnQ/jrJRYzGu9MbCsWLiL6gAJqjB/v?=
 =?us-ascii?Q?iIZpBRLKVLeX1Sntm2gqzgZjtzPO+4Zs3898llYlrLEhmJHnUB2s/sBxnd+f?=
 =?us-ascii?Q?dgUjAAhkiRN8G8V1M8MFDj+4hIE9bz31nqmZD0tfmHq71gxbsFHpMq19l/Od?=
 =?us-ascii?Q?mUdG5vHyBxKp301HgMbTdKgnEJTIQosgs44vzkTRk8aQP6iPjHcbqOGy2S6f?=
 =?us-ascii?Q?3zdBvBoj1+68jBJn3GdBZk/iJx5wmpjiI1ciLUY/ODDim4ycBHCjojjDTUKG?=
 =?us-ascii?Q?YBMGagc67xR1Dq1wpWgYXRb/LF3MlIypvujQcdwDV1hkXaaTJXDw22Rwdkc4?=
 =?us-ascii?Q?torfJTPGNibXxZgxQL8Wu9gvlOq0b1xA+WvXlpmr01aGXNSsGZniTmS6PFS/?=
 =?us-ascii?Q?SnxLqRpQRx8Gj9X00yyhCylpbkF4p091pgVaGw70dkts0xfIHQ3lhSfYbrLQ?=
 =?us-ascii?Q?FLc7h2Q+mf1dpM/Kr+hroDxN0BKvyoopyob1qlz3LnrR33+BmqYnMRQkv+O5?=
 =?us-ascii?Q?EFAgsMcFV0J0XQI3Er3UXOc5eGj5sq2gc5OOY48D+LJm8KJqym4ncvfSt153?=
 =?us-ascii?Q?8LhqSQqLVCqsTtSnU04C9ZCM4djSYLi1KYnMJMZo/5ZnQTwydPct13UhjhmX?=
 =?us-ascii?Q?9u825EVMtuQWpKsRlQNRTElh9Nw2TAHqnDnjizaHDPpji7FezyWjI7m58Dmt?=
 =?us-ascii?Q?3yg/1rDSbG7owLHGRIE0zY4S2AzMworj4xYAYf6ONs1w7pdi+mMaWBiDellL?=
 =?us-ascii?Q?9Syrd61xZTvw05V8yPwCk70NpXOXQFdG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(52116014)(1800799024)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?c6PtHofq43AOiObIFTAQdtYFrPA5/G0Wrxv9J2PXDQ6AvLw3l0n04ad8Rfao?=
 =?us-ascii?Q?NXKwimhL/t1uaDL4fxrhs0VOqm79QNuNJwrUNaUI+TkIqLMfI8INNSAqMzU6?=
 =?us-ascii?Q?oiSmzfz2+x/CbmhSTRgI5vTB9jw32rMudCkndkMRIir+e+VbCrCOl38y0t6T?=
 =?us-ascii?Q?YjApqi2ECe/yZrPwrx/uyuONxrrBaD6piHRbuMsc2S93uSldH53nwMsepwZQ?=
 =?us-ascii?Q?P7Q7O8+Ad4XslPk0+IfNxqjCJi3xn3xuVY0i7uqMRoNXPfgmxBisNVJ+SDD9?=
 =?us-ascii?Q?Y1PmSQ+Xehietf254wbZJL90AQ4nl0cyjpFqOZV4udyEFqzJKGH6OqwOlOub?=
 =?us-ascii?Q?SbBcNg0M2t/upX8JZVUTfjK2HU3bfGihqPewPNgKA7UO/QxQmbqE5PdaS/ok?=
 =?us-ascii?Q?Bd6ulnGrfhNDfosAoZeyn59CUYPNLY0Yy8PR4mylSpHLX/qEjodj5aT7AOWe?=
 =?us-ascii?Q?Sbz52Qzaxpvq3x6ezOSpUoj/H0phQIqi1gibi20u2itvPGwvmx1lfRJLH1H5?=
 =?us-ascii?Q?PaP6DBRWAkhExX7q2SSIDRtOU3CjPc34oABWXudAnDNlu2iSuQhHKbIToctG?=
 =?us-ascii?Q?22qMBPXMqWUfVYTplo4JkPjlvz8BsFXKzLyxIclP47xreOLQB5MO3Sxgb3nZ?=
 =?us-ascii?Q?vveOZ89/9a55qwvQRU2ko7ytUuYggBdnwWMlrmaBVM03LMIiV0gja0tOveXN?=
 =?us-ascii?Q?Hr/uCDsFL7U0oCOQGWkidmfWRAbU/ceoOv+QlwJQPj3SmC7Y4iAMKUvNoWZp?=
 =?us-ascii?Q?ArIpcTrOSsU8twy+tgKG9c7T/Xr0F+RqkriwiIC5qlcfXw8wo97YVzn2zwHo?=
 =?us-ascii?Q?GFABQSoFxctwiIxBJMA/HB9mVwL+q5R1xjT9C5hxI9040xC9KtAJXN52JD1H?=
 =?us-ascii?Q?HAEvkFlLz56pIdpNBXV3Z+Y4u0ZdZGGfBpea0laJuDY5ZNCGoSv0TOn88tTC?=
 =?us-ascii?Q?OPkMmZD6o3B08Wjmf3VJj/WNf1i7ZNfHVeL3syp+K5c8EXqxhXk5swiIQ9w8?=
 =?us-ascii?Q?0iIwDZUs1Jl3zg/1RYGLJLUjgUD9TIE/nQb82thR/LLFjfOf6eQhkoQd0K1l?=
 =?us-ascii?Q?Isjbn7tPKoWlGXPSUMV+vWYI3lBtA8N3DGBiIdBaV8zA59OMX2JPZjqUqYMx?=
 =?us-ascii?Q?abqWb1m5rylg2dKG0wlbUny2i+15Orjm4pu074WWJnAse6+kSlfYuYYuj7RG?=
 =?us-ascii?Q?aIh046R7JSEa54o6MrnBcTWNBD+hA4C4Q2fUIqlUWsnUITxzTyvYqGmMz2/6?=
 =?us-ascii?Q?02Ui9v3Y4pTtua+gvhh+r3npbYYFiChKfA1448RoFf926wyxGEnoO3EuQBtW?=
 =?us-ascii?Q?bX82pTd++lgXNeIRVN+RvJn5peX5BRwxZ5dIowu1V9omLxquZ7575tDICuAN?=
 =?us-ascii?Q?xJ+uoStNY2WNJxFjByCS/rn16vrmC2/C5Gdm2B6PwJs2KdBg5YWDEXWcDL8i?=
 =?us-ascii?Q?l+ujFvhPB6rQU/6bZi3gCAR55Sv9JMBdlcfivCF0FsdbOZNP0W26MIyLqTwA?=
 =?us-ascii?Q?JcuMv3atHHc0GHolU1cw9fcJvqBxpz/ZiTmHKjxeBzpNuyThhwyBflTE82e1?=
 =?us-ascii?Q?YhmLLmdAKRaFdfJX1jum9YXOJgo9LKsFpmIKmsHa?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b119083d-76b3-4fad-3552-08dd315373b0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 08:47:45.2545 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VTL+9G1XrVxczdB7396tOX4gYDthCsZ5J7I8iadsUNdKwX9UcUBjuYKfcADYqimY/svOYQfJ133x5/LIi3YcyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9770
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

It's ok to pass atomic check successfully if an atomic commit tries to
disable the display pipeline which the connector belongs to. That is,
when the crtc or the best_encoder pointers in struct drm_connector_state
are NULL, drm_atomic_helper_connector_hdmi_check() should return 0.
Without the check against the NULL pointers, drm_default_rgb_quant_range()
called by drm_atomic_helper_connector_hdmi_check() would dereference
the NULL pointer to_match in drm_match_cea_mode().

Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
Call trace:
 drm_default_rgb_quant_range+0x0/0x4c (P)
 drm_bridge_connector_atomic_check+0x20/0x2c
 drm_atomic_helper_check_modeset+0x488/0xc78
 drm_atomic_helper_check+0x20/0xa4
 drm_atomic_check_only+0x4b8/0x984
 drm_atomic_commit+0x48/0xc4
 drm_framebuffer_remove+0x44c/0x530
 drm_mode_rmfb_work_fn+0x7c/0xa0
 process_one_work+0x150/0x294
 worker_thread+0x2dc/0x3dc
 kthread+0x130/0x204
 ret_from_fork+0x10/0x20

Fixes: 8ec116ff21a9 ("drm/display: bridge_connector: provide atomic_check for HDMI bridges")
Fixes: 84e541b1e58e ("drm/sun4i: use drm_atomic_helper_connector_hdmi_check()")
Fixes: 65548c8ff0ab ("drm/rockchip: inno_hdmi: Switch to HDMI connector")
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
Tested with i.MX8MP imx-lcdif.
sun4i and rockchip are not tested due to no HW access.

v2:
* Trim backtrace in commit message. (Dmitry)
* Drop timestamps from backtrace commit message. (Dmitry)
* Move the necessary checks from drm_bridge_connector_atomic_check() to
  drm_atomic_helper_connector_hdmi_check(). (Dmitry)

 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index cfc2aaee1da0..daaf68b80e5f 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -503,6 +503,9 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
 		connector_state_get_mode(new_conn_state);
 	int ret;
 
+	if (!new_conn_state->crtc || !new_conn_state->best_encoder)
+		return 0;
+
 	new_conn_state->hdmi.is_limited_range = hdmi_is_limited_range(connector, new_conn_state);
 
 	ret = hdmi_compute_config(connector, new_conn_state, mode);
-- 
2.34.1

