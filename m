Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C164CA057C2
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 11:13:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0B5510E040;
	Wed,  8 Jan 2025 10:13:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="ICDa/rtM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2065.outbound.protection.outlook.com [40.107.22.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 982DC10E040
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 10:13:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=geeuMG3YqbY3kuPeuJkKQgxUH6rUVktR1XOL6x5uRHovO3aAi7/3RS1zbIAJLRtovMWddEsQtIkk/AfCotdvJJezUKKof9vuJC8M4zPJw4lY00yxmbVlsR9CurBGmSVLYPBc9GOKZTvQaUNa1x6CZuF/fjyPkcHnlj/8CZbdxAccjQKmhVNAmC4r/dA6R80NMQoCvcOJroKKoPISVy4uqApjM6lEg/OJIhwmdIPedQoKclE4n6t2bffv/YHgKE4imhMvl3DOpKsFh5ZWyfd3XCM8B8En7825m3853JLZpshCdNM6EkiUGwm8siUyO8t8jt5UAZE9op8E+Ths6SD1jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tFvSoAb0xgNoMorU8x1iWErXWn3jaSjplkVNKh136b8=;
 b=Mzg8FDIbv2iHfN6Q6SLaYDvGIXUVu5oETGEzUDCIB99TOjO3xLlQZUbUjWyxnzrl0v4+NK13cimi0Pr8sXxJQOwSM6AhWrqE89YbxuRKMpdjTN10n+tNmxsSxsl03F9hGbqa5onTuedd+RUc3A3L0Qvpn8Lmeh8k2kqOtSC8MMnOOPnmNinX4Hri2Ga6rTcUEk7JWZjCe5UuT3rg5xZFoCPYkY24v1OvDQUaVDq59l0tyiwkIwI1X0eXX/y+LQsPG71lltaoEnD1NWn8dZAzya6r8hFDe6wJcMydgvQQpmNd21aUIiJRB7npYmyG5WLlPYE8yeVPcya325zVS9qPYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tFvSoAb0xgNoMorU8x1iWErXWn3jaSjplkVNKh136b8=;
 b=ICDa/rtM3H+NCr1yZT2DTe+6ZlbqYPx/7DRGMVYcPkWVX5mYGJQny2/Q2Djfb5LZMt+NV8wefy2qfyTkro07jfT9ZBcDnmtlYjpsyugaU/c09xYc9OsIrM+2vSGMX+5+cHJP1zOwxn/GKXedY7/93WDuNWUuShhITBOy+AEE8NDel2X5nWSRjUgTowQ37Lur7lJJ73Sg6eYXN2+fddiBlwWR20K6T0vzorgEEQOBlOrOPe5kvZWlyHsxOk50U2s8xNf9BDRuZXeJFuJfW6qaHYD6L9Swl6fnV8sPfn+LAj3wasmSq28cZEi9GMtc6ChDYMl2VXM9qlw7N1CyHJDv8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PR3PR04MB7242.eurprd04.prod.outlook.com (2603:10a6:102:91::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Wed, 8 Jan
 2025 10:13:20 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8314.018; Wed, 8 Jan 2025
 10:13:20 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dmitry.baryshkov@linaro.org
Subject: [PATCH] drm/display: bridge_connector: Do atomic check when necessary
Date: Wed,  8 Jan 2025 18:13:51 +0800
Message-Id: <20250108101351.2599140-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0020.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::9) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PR3PR04MB7242:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dd9e448-d07b-4e44-f562-08dd2fcd13b8
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|52116014|7416014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Sn/0DAPlBX5j8wqDDDvC+qofFK6nsYZBPwtydOi4wjIE9dsT8OrKeadnKh71?=
 =?us-ascii?Q?5qGmScs9q6UigYMAjRRnAfDL5y/SPl7jMpUQG/CzwGp9Ss4nv3uhvkZBs53/?=
 =?us-ascii?Q?m3BjfkhOPANsXcr42lpDUSgOS2Q2w1nxToSIFBvE4dcf/z4FCiCIhPYG5SIt?=
 =?us-ascii?Q?erv7BhuvawE9Ne4RiSxAB4A7+duiiS4OOlZlwjbGqGSKW11+INeEZearfcNd?=
 =?us-ascii?Q?WBnmrow+K0kPRt3Fzxtj6US9dCn6K9XPSDJwIB7fTjnD9QkI9c7x2X2IzpuO?=
 =?us-ascii?Q?htXveQ/ISI23VySqalwh+ecxoPBfWhNx6pfUIqHVnwc4oSCgDu/93DhP/URg?=
 =?us-ascii?Q?Rf+HY98ToyQ2J/j+VlJaxsqgw0W9ZkHhpGmhnQ/qpDXcNzRN+xsMa1fZ8/me?=
 =?us-ascii?Q?HidzucIPgTyaAF0nUPVBc0nS54B4GBbOcHHk4GW8hmoT9O2uxmpdRay3XBS4?=
 =?us-ascii?Q?FmVUz8I+51eOnp4aRJWTIh0aSE2Nziy2Q44jL+uyonFhql6RLTLD+W1vlsYU?=
 =?us-ascii?Q?36c8WV3+Dzb98wZUbjoecemVKDPgLXOiVJctxibBEjUNhV5xwuT5RRYXX1mn?=
 =?us-ascii?Q?CCUY/RhPNNzBkXP6ur3xZhJ++8TdcvMlt3nw+GdS699b5LbNAAinjUX9/WPt?=
 =?us-ascii?Q?kr8BPZcy/26yFl6SxYmiDMv+VQ3S5eil0vmjdoDaI5p13nOL0T/Ayx80DT+d?=
 =?us-ascii?Q?L3UdeiyjBwSyu2JrbD3XshEjvuCKvNZLLTMe+URanB0RsxWjDufnMtQyDexE?=
 =?us-ascii?Q?1ubimU7Qx/ZGHCp05x2GbcQumU6SyUjDVWzNflB4wTXWfj/+gjtYYagCWQES?=
 =?us-ascii?Q?pBWz3RRWFUw3lPSlKZVaR6CFFYVA+5W8jrdtYAvTagu5wNo2BtpaaaCzbClo?=
 =?us-ascii?Q?D80zYprC9U5y+JIYZhB0xTIZ1dEQaPph9RszwIJGPzJfF4iPN4D0noI3SkZY?=
 =?us-ascii?Q?HaYA78CBQPel3U9x+xmsej+ulQdAjSD31selALegJPYgtRRt4p6oMSTYCvfd?=
 =?us-ascii?Q?tCDR9CNEy5ij+yRv6+ZPahWFp2gaeGMSt51J5p94jE3q7HBNJPo0PFs+SQHb?=
 =?us-ascii?Q?39Bdr3h+kHbX6wtzK7eOcz6DyTMvnF8XLNDJ0jt6SOJmtpnwZuE5Z8IcDF3i?=
 =?us-ascii?Q?QDb2bhvXpgtoJqGsZNKImHTjz0EWbzc0k6qb4EOaumXrQ5RgJct+m+yv1lXF?=
 =?us-ascii?Q?2ZtOIzECsUaKciTcWfRCBMVEsB3bJ3Mdz4g7r0iYReUJ74GzNTTYJ3eDYltJ?=
 =?us-ascii?Q?qflvR1gOtDt+0mIKb5B1DcSv+mlKHk/N1xs0HrSTK7U4TPfgkfQWJTS9J93W?=
 =?us-ascii?Q?jHCTTv02AYLu6YG+ZaWn/kvQmmAnSgjuFreWGKHcwahfwBQlsnsGjxHUqmQ/?=
 =?us-ascii?Q?cumZLcsHKOZ0NpldOiKZh8OOPAnMzAmBelnnCNgkRYQ1Ub6UQPDW2X7Is70s?=
 =?us-ascii?Q?DgLWK953E9oe++OjpfLQj/55q22kbYMm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(52116014)(7416014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F86JmB38gUrtwQWqAU00rAU/RLfZjXpQazFZSzvi1KOWY297hJkEULZDXXPv?=
 =?us-ascii?Q?H4/zeyrDqGybjr3eXa8MSTi+tVBLdKYTap5v02xjnLfm85lsVqRkG/rLpmCQ?=
 =?us-ascii?Q?Hv6LLmDf4NPr/0V1rfVDKxZDb3ILdDwlQaqy5G4jKBwrsKD7XPW8kzB+eiMT?=
 =?us-ascii?Q?Ou2AhBWWIRXzIUEIZ/ZaqLcfFC4AQ8ZV9QX+9tRGGoHYEVUdrI6pLPCHzt4Y?=
 =?us-ascii?Q?mFrmCnqZHmZeIcvDdN2M3DRYJclY60R8riLiFVbxLSs65sXgUFYoJOkraDhY?=
 =?us-ascii?Q?+7nAtoKf4sqVu1D2IF2RaqpjTEsuL+KqLm3On3zxaV4cIv2YADrtoVu1hmsj?=
 =?us-ascii?Q?nyZ9e//bGpfYRzyQiwJIEHGEmefPGBh4vPl7QGhUKc7pGOiHoz853ezDrjgw?=
 =?us-ascii?Q?Eu1F/69w/+KBPrcUBcZN+8bza0dvc52d/uS/pukvItpepVmGs4CMdU1ERRyf?=
 =?us-ascii?Q?/Toyu8vvJvDWT9PnB8PSGInJmegQex20f5fL+SFLGx3PCvkyNkQAfZDpHXL5?=
 =?us-ascii?Q?PjS7W8LLUV4/+zSPUd/h8BMX7gcbplqqld98bzFYY7vuAmRuMlFrIcO8VgvF?=
 =?us-ascii?Q?MkvSEEyzeQ0FHX/mmb5i1Y8U12i9DSjjEMoaMb2hjNUMVfqLOuhm+WIb3Qrz?=
 =?us-ascii?Q?w9XlmLxqogL7npyHpdWmEPLLy2R8vyRZXGj56siorMSn9GEDXf+MUDvvwamQ?=
 =?us-ascii?Q?qBU4RQ1PYOe0fyit/El7o9mqZF1pZ+0QuscnNM9dByQVYYCgy50rIAbioISu?=
 =?us-ascii?Q?a1po+F0SdLkec1DanFvI+ccKLUOXnhg7an8zWjQHJ74DVaH7PPcdOjV1v7f0?=
 =?us-ascii?Q?3iezZqAdatBpjD9JMCUa4QA1Qh/cULSr33llS9QpmEjLnM6Qv/FQczfFOGbC?=
 =?us-ascii?Q?dOjCcjnoOeR8jTud4y89C2wF04LdgjtxsJ98s27BRWZe3c2SceeJ2c6sp98n?=
 =?us-ascii?Q?QQY603wM7Xe8i9uFMZQIG6Gz+r0KUmwxUiMNqrmAuKnRV1hykU0O2gQgNL1A?=
 =?us-ascii?Q?FyeKgjwQKhChE7JABAYg8iM2MbpD3syl4XVdL7BTpVr1XgCy/ynqlVujHV6m?=
 =?us-ascii?Q?AEQoK8H43vh1Tn3hD+ubWAaneQie6PW+XVICg2qamkA62kww02V714y5xJVE?=
 =?us-ascii?Q?9ZRN3pKAi6t7VjN1ZefUgBY0ggred85pqf7o7lKeQMw8msRY9YYLeDZzoFF9?=
 =?us-ascii?Q?YDtfoxeHq9qUm0QApd4OZIlg+pj4R3vuE5k6HmJEI7H6BYamxXGsamoDAe6m?=
 =?us-ascii?Q?y78zvstGPwh9CF7bRBfwmyr5CEUjcsZrWHvEDH9zNPXSpxQ19yx/1NQgrmLu?=
 =?us-ascii?Q?dBJ4oem6+LDDc/kcrRLHxGCLUI2vIuZ2nsaARyekxVFw4oWzsDsJc5jonEyt?=
 =?us-ascii?Q?YngBh+oxMnquTn7ejlCtEc5iaKBjm/OBTmIj98vpG8K46ofXPFY4Pkv9uepV?=
 =?us-ascii?Q?oPv644nwjMZYbNB9DNkmSA9Z4p7IsDr6VAPgjTzkdgkaVwr3IocxlmWgeuEk?=
 =?us-ascii?Q?QzgDhH8B5JVdcpxKqs0VMAIZ1R6hLjMCsO6rZDFZF3UfUdamxycTY80zb+Nj?=
 =?us-ascii?Q?wkYoVMj49HOsM2YsYqUKmUv1AheSb18q+9eJC7Mw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dd9e448-d07b-4e44-f562-08dd2fcd13b8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 10:13:20.4057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G/h56SB/SqpXinp4768bi50KkitW8dueegfoOX73x3iO5w+bTuPmMcHJD/3i/oGkV4qWzovsZSYscL08vDK9vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7242
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
are NULL, drm_bridge_connector_atomic_check() should return 0 directly.
Without the check against the NULL pointers, drm_default_rgb_quant_range()
called by drm_atomic_helper_connector_hdmi_check() would dereference
the NULL pointer to_match in drm_match_cea_mode().

[   46.189903] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
[   46.189906] Mem abort info:
[   46.189908]   ESR = 0x0000000096000004
[   46.189910]   EC = 0x25: DABT (current EL), IL = 32 bits
[   46.189914]   SET = 0, FnV = 0
[   46.189917]   EA = 0, S1PTW = 0
[   46.189919]   FSC = 0x04: level 0 translation fault
[   46.189922] Data abort info:
[   46.189923]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
[   46.189926]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[   46.189929]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[   46.189932] user pgtable: 4k pages, 48-bit VAs, pgdp=000000010b6b4000
[   46.189936] [0000000000000000] pgd=0000000000000000, p4d=0000000000000000
[   46.189945] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
[   46.719532] Modules linked in: caam_jr caamhash_desc caamalg_desc dw_hdmi_cec crypto_engine snd_soc_hdmi_codec authenc libdes hantro_vpu mwifiex_pcie mwifiex v4l2_vp9 v4l2_h264 imx8
mp_hdmi_tx v4l2_jpeg v4l2_mem2mem dw_hdmi videobuf2_dma_contig videobuf2_memops ite_it6263 videobuf2_v4l2 snd_soc_simple_card drm_display_helper videodev snd_soc_wm8960 snd_soc_simple_
card_utils fsl_ldb samsung_dsim videobuf2_common etnaviv mc fsl_imx8_ddr_perf gpu_sched imx_lcdif adv7511 phy_fsl_samsung_hdmi drm_client_lib snd_soc_fsl_micfil drm_dma_helper cec imx8
mp_hdmi_pvi snd_soc_fsl_sai imx_pcm_dma snd_soc_fsl_utils rtc_snvs pwm_imx27 snvs_pwrkey flexcan caam can_dev error imx8mm_thermal imx_sdma coresight_tmc display_connector drm_kms_help
er snd_soc_bt_sco imx_cpufreq_dt coresight_funnel coresight overlay bluetooth ecdh_generic ecc cfg80211 rfkill drm fuse backlight ipv6
[   46.795415] CPU: 3 UID: 0 PID: 64 Comm: kworker/3:1 Not tainted 6.13.0-rc6-next-20250107-00009-g045f95f0de2e #1637
[   46.805767] Hardware name: NXP i.MX8MPlus EVK board (DT)
[   46.811078] Workqueue: events drm_mode_rmfb_work_fn [drm]
[   46.816619] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   46.823581] pc : drm_default_rgb_quant_range+0x0/0x4c [drm]
[   46.829244] lr : drm_atomic_helper_connector_hdmi_check+0xb0/0x6b0 [drm_display_helper]
[   46.837293] sp : ffff80008364ba00
[   46.840605] x29: ffff80008364ba10 x28: ffff0000c8955080 x27: ffff0000c2e1c700
[   46.847743] x26: ffff0000d3887200 x25: ffff0000c2e1c700 x24: ffff0000d3887400
[   46.854881] x23: 0000000000000001 x22: 0000000000000000 x21: ffff0000c8955080
[   46.862019] x20: 0000000000000001 x19: ffff0000d3887c00 x18: 00000000ffffffff
[   46.869157] x17: 0000000000000000 x16: 0000000000000000 x15: ffff800082ce6911
[   46.876293] x14: 0000000000000001 x13: ffff8000827e4a88 x12: 00000000000015f0
[   46.883435] x11: 0000000000000750 x10: ffff80008283ca88 x9 : ffff8000827e4a88
[   46.890573] x8 : 00000000ffffefff x7 : 0000000000000038 x6 : ffff0000db2c3440
[   46.897711] x5 : 0000000000000001 x4 : 0000000000000038 x3 : ffff0000db2c3440
[   46.904847] x2 : 0000000000000000 x1 : 0000000000000001 x0 : 0000000000000000
[   46.911984] Call trace:
[   46.914429]  drm_default_rgb_quant_range+0x0/0x4c [drm] (P)
[   46.920106]  drm_bridge_connector_atomic_check+0x20/0x2c [drm_display_helper]
[   46.927275]  drm_atomic_helper_check_modeset+0x488/0xc78 [drm_kms_helper]
[   46.934111]  drm_atomic_helper_check+0x20/0xa4 [drm_kms_helper]
[   46.940063]  drm_atomic_check_only+0x4b8/0x984 [drm]
[   46.945136]  drm_atomic_commit+0x48/0xc4 [drm]
[   46.949674]  drm_framebuffer_remove+0x44c/0x530 [drm]
[   46.954809]  drm_mode_rmfb_work_fn+0x7c/0xa0 [drm]
[   46.959687]  process_one_work+0x150/0x294
[   46.963700]  worker_thread+0x2dc/0x3dc
[   46.967450]  kthread+0x130/0x204
[   46.970679]  ret_from_fork+0x10/0x20
[   46.974258] Code: d50323bf d65f03c0 52800041 17ffffe6 (b9400001)
[   46.980350] ---[ end trace 0000000000000000 ]---

Fixes: 8ec116ff21a9 ("drm/display: bridge_connector: provide atomic_check for HDMI bridges")
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 32108307de66..587020a3f3e8 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -343,6 +343,11 @@ static int drm_bridge_connector_atomic_check(struct drm_connector *connector,
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
+	struct drm_connector_state *new_conn_state =
+		drm_atomic_get_new_connector_state(state, connector);
+
+	if (!new_conn_state->crtc || !new_conn_state->best_encoder)
+		return 0;
 
 	if (bridge_connector->bridge_hdmi)
 		return drm_atomic_helper_connector_hdmi_check(connector, state);
-- 
2.34.1

