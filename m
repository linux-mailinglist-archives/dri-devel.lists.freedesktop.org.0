Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D1EA8766C
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 05:51:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A91310E461;
	Mon, 14 Apr 2025 03:50:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="XaTxu+Py";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013024.outbound.protection.outlook.com [52.101.72.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20B6210E461
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 03:50:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CDcX+tm0O4m7seX7q2kWgfmx+cOKTBYk+iDAvcAkLZuwWVuqHu6TOTcbS3dpqOeVWRBMDZq820xjK89Q51odXxmctZlufK5PyfFFLQqaq6iD6VP6Zvi5iQslITNRcDQKdv7cwCFeKtHlZjNAnuXrwsO67Z1p+4KWfoDDW9xKltpuBfCH3hZJM3H5E550GhxnERcdkTQf9JLIvNQHN2tnvMY+gdryGJYHQ2+vCJEkGluvEDa8njl1KXOAIIL2rRNqlX4DQrGs2+vvfOK5NoEHN4myOToicvLiXHDNhixqnLgy28ofXZvx6lsYTTejNgpDWccxh89y0hdodbOtHZlZww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pe+bYui+d+1eciagTJqq7KQ5nspvlk+irxxZEXokqFY=;
 b=okXG5xtRNDvoO9ZW+GkdX4wxjMBXWr0fNIzQ5WInppNo9nfIVNXdPlNHLAVn2L2tWAyNbf4v/dDRB8dB3ZGgwvsLV/K7PrqaBYAaK4hKHCYvMV9te+T7qt2oOzUyCMT5ao0FdRC1xikzAqiU/TrbiJd5g31WRDl55aHxfCcPre2wZzOFKILLX8V0QdvF9OEgi5fxJier8ktV7bfFr0YpgVRShUHnQcnRHjO6jiebYkkWpo1fQ385iJ33lRJYMi/jwLNjcWN/vfF7F+XSZLOcpZnE9QslDpW1gFOPDHQuV9BOQWMP210UQUMRacFNsq8rnsVJBRRLpI4/oHagpVT7Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pe+bYui+d+1eciagTJqq7KQ5nspvlk+irxxZEXokqFY=;
 b=XaTxu+Py/tvZjL2tce9oyCN/lcgth+cUPGgHROnZ9q2ggf89QEe5PhQevJ8DUVFFewP1a/BYvC7r5Sd9PZJY5YREeUrTjtUjBbN2/fEhA2ad0KdflWNKLWHqn5kXlwz290PHGr6O/qBq50pg950v0jY9Hxhi+uNQsqBIigi0kKU6/DNs+q31OkMqUJ4QyNRitI5J+fspXR2kV092Jj1g4/21kfB7tRedEn9sRd+aDsoixm2YZLB12JpX2Xziq2/iWAcXgenxJFgtguhPmjgu33cneDJP2flSKLDGviSVMvMg1u/doFGQN9AVn2mGFdazALJZ+jCgVDwfTGZ2XtFVQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GVXPR04MB9803.eurprd04.prod.outlook.com (2603:10a6:150:111::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 03:50:44 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 03:50:44 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, Frank.Li@nxp.com, lumag@kernel.org,
 aisheng.dong@nxp.com, agx@sigxcpu.org, u.kleine-koenig@baylibre.com,
 francesco@dolcini.it, dmitry.baryshkov@linaro.org
Subject: [PATCH v9 10/19] drm/imx: Add i.MX8qxp Display Controller pixel engine
Date: Mon, 14 Apr 2025 11:50:19 +0800
Message-Id: <20250414035028.1561475-11-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250414035028.1561475-1-victor.liu@nxp.com>
References: <20250414035028.1561475-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0017.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::29)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GVXPR04MB9803:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f76902f-4a79-44e8-780d-08dd7b078876
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ysQuePBFXQfZgDs8ZEAwcP1jldQ+40zLwKIQq62IwBBKKptTG0sofBD9jAE7?=
 =?us-ascii?Q?1seZlcTNecNvi7JAPRw1fHzTj6dF4f2e4T1igSQYOQZryq4dtWh2z7HbXq3R?=
 =?us-ascii?Q?zytD02owKQh/FG3dygUguqtuAcIa8K3/3JeRP9nuHbcjfk1Z/xki6GfFStzI?=
 =?us-ascii?Q?q5M+rp4kyly6Czp4L+fKtvM0iEz7bdwYjglrRXooP7Z0BLio76XfltuwWtzY?=
 =?us-ascii?Q?wLHBr9+65OFXjuxNgWeXrCmDyXtbUn1SjBHdHRjed02YdLitK5TZbq0pJVBB?=
 =?us-ascii?Q?5OppOKr9JHhPJMuYOWOlAQzQWhuSihpCIHhqsulJvQeFVRVmeE6VFCAdADJg?=
 =?us-ascii?Q?rNHky/PkV2LkCgFItMv1l18Ptf4riZ9jlhWwTUCXOS9Kz2X3PngymR4yKNaZ?=
 =?us-ascii?Q?InaQkG80bA19HFNW957lcRt8cqYxkLyfwzAuAY0Lwj6AjLtNs0hoNYVpge4f?=
 =?us-ascii?Q?TbO1jtTD3dQvrSsP5rByxlLanZYts6Cglz1eh+lOG7u9PQQ1kunyMejf9/cf?=
 =?us-ascii?Q?MNFdtCyL9/xdCyMg/ewujRylmwc+Pn7o4QEzJdQd7VxiAdXBZqY9hOcw9iei?=
 =?us-ascii?Q?v2Q8SaqLu4rGPeXFGWea4bY7iwcki2H95k8gRoEUDIOCTHXAhGtbRxYYZvXY?=
 =?us-ascii?Q?8zLXuUfjmporPKYhdYr93ZrS/2jZ/cYldFH2hJGXfhxGU6NfLICHtEmtjg5B?=
 =?us-ascii?Q?fArRuVPpD5BdhqstHHcqgx5zXXDUwD9uf0oa50SwNN0xMbEjeoACiiu5GD1P?=
 =?us-ascii?Q?ECD0PuhNCav7NLtIm3rzY2rMECOcZwmOcIn9+9kXLWNe3wQeq4hwkc5tApvP?=
 =?us-ascii?Q?mtMiiihduP0bOCSAI/BV0093BIyQafrpYbQlpg+al0y4KepOCyBz2/k8Qemc?=
 =?us-ascii?Q?acR0m/MEbf0pp4RpHh2+gbkxp+xgcvk+Zmz1q5kLQmKb6V8WorZNmHDDOrBX?=
 =?us-ascii?Q?SvN2moQHKSjjyoY4RSCdJKqzoIKD4JxqlfZ/g8i10HJGfc70jqsvUag3DDjR?=
 =?us-ascii?Q?rAqCVdc7gv61T1oNActFjKvR6JgQsARNU+LEobXsmQ3aUlnkEGfjV133K2vm?=
 =?us-ascii?Q?SdMA2t4bciY+4es1YkgyD9hBcFC22IThRuM3msIZ1omJfl5lsO+t3PkJHnct?=
 =?us-ascii?Q?9xMbo59lELGyOyfr/l4l3AK2bfL6fisVYV4IgRUaHXgnQt0LYBLiLbDvgjPn?=
 =?us-ascii?Q?rLMsmVjbF0Bc7O8wtLowgSzoDd82THZtBYJM/lzevDX6nyxH4+l9IGlYTytp?=
 =?us-ascii?Q?So+uMeO7lIKdQGk1vTIA7jgUA3J/EaJxwQIoJVvanaFZaNCzYxBMX45XOWjG?=
 =?us-ascii?Q?jUtiOk80BVsZZSojfibIG+CpaMb9shFDjgRn0GanuoEa7AQr0hQh0SS1UC6S?=
 =?us-ascii?Q?a2ByRFF7Cc+i0ieqdh5KBRw+yjl5rVBL2gD9zgsksv+Tb64p1++TeGtHTOE3?=
 =?us-ascii?Q?OdCpgepiURSsd5A4yWWM3xiWwuegfZYTZjZlFH1elOVJUrRTGzPoDg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2O0IPJc4OPUEaN24wV35GevMOCQySYhHNhlgt9QnkkI3yd3mirvOD41iRsAX?=
 =?us-ascii?Q?llN1v0N20iji2eAyh/PNH/HKNid3NA0mUbLr3wWdZohAhKUp7NmCAOvOw9oV?=
 =?us-ascii?Q?hkCiJfBS/EWPaHR4hpSVS7sS7pfzMWUToVw+8saInYuaTTClX4f1vE/zuePd?=
 =?us-ascii?Q?CF5FGBD++8bJ3IyMeLmYJR4k8fNMc5yP4T4NESTJ06wZIOhzSLs8+MhmbyQK?=
 =?us-ascii?Q?eV8X1yu1pxMGxN8524TnohHuBdrWY85qG4nRp+ER8MyiDDqmpkbyNJpuZUki?=
 =?us-ascii?Q?EG0iGcgYnBwydOfzkr5fY2zoiiUdxqhgU2aSTTNuyhWqkO8A+v/8sWPLq3rK?=
 =?us-ascii?Q?NsoznUkATaic5I/ysqmQgYoMTxU62IxhiKl8VfGY2+Ce3wwi828wCp78ZbPX?=
 =?us-ascii?Q?v4SIQnGHuRBoi1cDMkxW3j4IR5Q2sSZPr5XT2DkxHKH9QTPBckVZmYlxcTXq?=
 =?us-ascii?Q?Avs55yjBR3pHj++zBFn8eWSdK048TSKjLxd6fUdldnadMlsvCFvg4zfm5TS5?=
 =?us-ascii?Q?X1j6GP9nCrpmHTFBxLThM8XzyJ+PxB8rUr20ZC8nkTozKl7d5cH3eJw5Mj/g?=
 =?us-ascii?Q?rGY4DGW8aLs27UFUFMQCjBOFSoSAMcjHaB5syVz2BJTxjjNnSU17IOgx9laN?=
 =?us-ascii?Q?YM6GrJwBTPIZZ3+BHpi/Xl5erCsh3yhj17AA0dG+zNN4MIFA4rnUOy/fT2rS?=
 =?us-ascii?Q?IPPX5dHeAM4ogp7VB21DooG87qG78H5xI+3yb4nSKYez09XLHH9OT35oPUuc?=
 =?us-ascii?Q?4MlXx5Kw1dRIiuBGOKUKThhtnd13VJ3zE6Ri01KZHXrGC85rAfIPoid0tLN2?=
 =?us-ascii?Q?uX0eTjmRilYV+THLDZS2D8A6Aa/iwfvAiZMSmmjDPUTWTGupRngqfnZNfE5u?=
 =?us-ascii?Q?2NtuVLYZey09XwU/SN7t+NlYcOC6y3Ib8CWhIlBGwaUp8EUiiwWwIa+AMi49?=
 =?us-ascii?Q?ND0PY2ZHLtGl0+QAPZx783sTq1tfm+rJov9Ypy9Lh21wuZWXAq6kdz/M/rEf?=
 =?us-ascii?Q?afZYkYWB1MWiwT/b0sLEpRma+KV5GJbjIaE/Qn+hDwPs59tg/cDi2qcbBbtx?=
 =?us-ascii?Q?iJZpF/SA3nNzG9ryTGxkzbFurggkD+bE55XhDwK/N+/s988SWQbq8Rlzbb1Z?=
 =?us-ascii?Q?xLkR4t4eRWzMAYwKSJY5ClXwGAlgKTVDGlZYphJWnJolkkwhPD/nUln4kKAS?=
 =?us-ascii?Q?1Qwbgrh2OwmIWlcATKWFqEqBu+iRT9FmVheasCvi5ri1L4aHuKJbTvrrAPrN?=
 =?us-ascii?Q?2pmbMr1hf+kHcKNQ8L0ddiIM7S6XKRAAQL1tdp38wyxscTuYC4UeNxkyjuNj?=
 =?us-ascii?Q?rCfetwjjWgzfKCucr3jtafgqcDlakRims4Zem82ZRE/lDg55ZKcSoMp1FCPT?=
 =?us-ascii?Q?jSCix33AqqhiYEqiZ8uDH6FMJJCbkpEBV0uAQvz5TmSc5w0oLLDcvGYJEIGj?=
 =?us-ascii?Q?fJQMX63mI9hwoit2OY9xdyyI1zOIVMP+HKzJJpt15eaa3n648eyPTGLeTYoj?=
 =?us-ascii?Q?/KYgXCW6jhDYttFgNlfyRZRYpznrDjJ26tPXmSRsuESynTIBQhSh7I1aUVcf?=
 =?us-ascii?Q?dx+tDZWba7bujcJx4PJ1G1CUX8c6NlHaCVedccDk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f76902f-4a79-44e8-780d-08dd7b078876
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 03:50:44.4738 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vmvIXK8xkjqzs5HKmCstLjVF21+ZWQ9CWs3nFIzf5LK7ysBGIuOeGa/6Q1zYWvdCGUDXGlDHWIr8iwsnU3RM1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9803
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

i.MX8qxp Display Controller pixel engine consists of all processing
units that operate in the AXI bus clock domain.  Add drivers for
ConstFrame, ExtDst, FetchLayer, FetchWarp and LayerBlend units, as
well as a pixel engine driver, so that two displays with primary
planes can be supported.  The pixel engine driver and those unit
drivers are components to be aggregated by a master registered in
the upcoming DRM driver.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
v9:
* Add Dmitry's R-b tag.

v8:
* Get CF/ED/FL/FW/LB device instance numbers through register start addresses
  of the devices, instead of compatible strings. (Dmitry)
* s/shdld/shdload/ for ED IRQs. (Dmitry)
* Add dc_pe_post_bind(), to avoid dependency on the component helper's way of
  implementing component binding order. (Dmitry)
* Add dev_warn() to dc_lb_pec_dynamic_{prim,sec}_sel(). (Dmitry)
* Drop lb_links[] and dc_fetchunit_all_fracs[] arrays. (Dmitry)

v7:
* Add kernel doc for struct dc_drm_device. (Dmitry)
* Fix regmap_config definitions by correcting name field, correcting read
  ranges and setting max_register field.
* Get instance numbers from device data(compatible strings) instead of OF
  aliases.
* Collect Maxime's R-b tag.
* Trivial tweaks.

v6:
* Fix build warning by expanding sizeof(fu->name) from 13 to 21.
  (kernel test robot)

v5:
* Replace .remove_new with .remove in dc-{cf,de,fl,fw,lb,pe}.c. (Uwe)
* Fix commit message to state that pixel engine driver is a component driver
  instead of a master/aggregate driver.

v4:
* Use regmap to define register map for all registers. (Dmitry)
* Use regmap APIs to access registers. (Dmitry)
* Inline some small functions. (Dmitry)
* Move dc_lb_blendcontrol() function call from KMS routine to initialization
  stage. (Dmitry)
* Use devm_kzalloc() to drmm_kzalloc() to allocate dc_* data strutures.
* Drop unnecessary private struct dc_*_priv.
* Set suppress_bind_attrs driver flag to true to avoid unnecessary sys
  interfaces to bind/unbind the drivers.
* Make some fetch unit operations be aware of fractional fetch unit index(0-7).

v3:
* No change.

v2:
* Use OF alias id to get instance id.

 drivers/gpu/drm/imx/dc/Makefile |   3 +-
 drivers/gpu/drm/imx/dc/dc-cf.c  | 172 +++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-drv.c |   6 +
 drivers/gpu/drm/imx/dc/dc-drv.h |  22 +++
 drivers/gpu/drm/imx/dc/dc-ed.c  | 288 ++++++++++++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-fl.c  | 185 ++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-fu.c  | 258 +++++++++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-fu.h  | 129 +++++++++++++
 drivers/gpu/drm/imx/dc/dc-fw.c  | 222 ++++++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-lb.c  | 325 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-pe.c  | 158 ++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-pe.h  | 101 ++++++++++
 12 files changed, 1868 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/imx/dc/dc-cf.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-ed.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-fl.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-fu.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-fu.h
 create mode 100644 drivers/gpu/drm/imx/dc/dc-fw.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-lb.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-pe.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-pe.h

diff --git a/drivers/gpu/drm/imx/dc/Makefile b/drivers/gpu/drm/imx/dc/Makefile
index 56de82d53d4d..2942ae6fd5bd 100644
--- a/drivers/gpu/drm/imx/dc/Makefile
+++ b/drivers/gpu/drm/imx/dc/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
-imx8-dc-drm-objs := dc-de.o dc-drv.o dc-fg.o dc-tc.o
+imx8-dc-drm-objs := dc-cf.o dc-de.o dc-drv.o dc-ed.o dc-fg.o dc-fl.o dc-fu.o \
+		    dc-fw.o dc-lb.o dc-pe.o dc-tc.o
 
 obj-$(CONFIG_DRM_IMX8_DC) += imx8-dc-drm.o
diff --git a/drivers/gpu/drm/imx/dc/dc-cf.c b/drivers/gpu/drm/imx/dc/dc-cf.c
new file mode 100644
index 000000000000..2f077161e912
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-cf.c
@@ -0,0 +1,172 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/component.h>
+#include <linux/ioport.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include "dc-drv.h"
+#include "dc-pe.h"
+
+#define STATICCONTROL		0x8
+
+#define FRAMEDIMENSIONS		0xc
+#define  HEIGHT(x)		FIELD_PREP(GENMASK(29, 16), ((x) - 1))
+#define  WIDTH(x)		FIELD_PREP(GENMASK(13, 0), ((x) - 1))
+
+#define CONSTANTCOLOR		0x10
+#define  BLUE(x)		FIELD_PREP(GENMASK(15, 8), (x))
+
+static const struct dc_subdev_info dc_cf_info[] = {
+	{ .reg_start = 0x56180960, .id = 0, },
+	{ .reg_start = 0x561809e0, .id = 1, },
+	{ .reg_start = 0x561809a0, .id = 4, },
+	{ .reg_start = 0x56180a20, .id = 5, },
+};
+
+static const struct regmap_range dc_cf_regmap_ranges[] = {
+	regmap_reg_range(STATICCONTROL, CONSTANTCOLOR),
+};
+
+static const struct regmap_access_table dc_cf_regmap_access_table = {
+	.yes_ranges = dc_cf_regmap_ranges,
+	.n_yes_ranges = ARRAY_SIZE(dc_cf_regmap_ranges),
+};
+
+static const struct regmap_config dc_cf_cfg_regmap_config = {
+	.name = "cfg",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.wr_table = &dc_cf_regmap_access_table,
+	.rd_table = &dc_cf_regmap_access_table,
+	.max_register = CONSTANTCOLOR,
+};
+
+static inline void dc_cf_enable_shden(struct dc_cf *cf)
+{
+	regmap_write(cf->reg_cfg, STATICCONTROL, SHDEN);
+}
+
+enum dc_link_id dc_cf_get_link_id(struct dc_cf *cf)
+{
+	return cf->link;
+}
+
+void dc_cf_framedimensions(struct dc_cf *cf, unsigned int w,
+			   unsigned int h)
+{
+	regmap_write(cf->reg_cfg, FRAMEDIMENSIONS, WIDTH(w) | HEIGHT(h));
+}
+
+void dc_cf_constantcolor_black(struct dc_cf *cf)
+{
+	regmap_write(cf->reg_cfg, CONSTANTCOLOR, 0);
+}
+
+void dc_cf_constantcolor_blue(struct dc_cf *cf)
+{
+	regmap_write(cf->reg_cfg, CONSTANTCOLOR, BLUE(0xff));
+}
+
+void dc_cf_init(struct dc_cf *cf)
+{
+	dc_cf_enable_shden(cf);
+}
+
+static int dc_cf_bind(struct device *dev, struct device *master, void *data)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct dc_drm_device *dc_drm = data;
+	struct resource *res_pec;
+	void __iomem *base_cfg;
+	struct dc_cf *cf;
+	int id;
+
+	cf = devm_kzalloc(dev, sizeof(*cf), GFP_KERNEL);
+	if (!cf)
+		return -ENOMEM;
+
+	res_pec = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+
+	base_cfg = devm_platform_ioremap_resource_byname(pdev, "cfg");
+	if (IS_ERR(base_cfg))
+		return PTR_ERR(base_cfg);
+
+	cf->reg_cfg = devm_regmap_init_mmio(dev, base_cfg,
+					    &dc_cf_cfg_regmap_config);
+	if (IS_ERR(cf->reg_cfg))
+		return PTR_ERR(cf->reg_cfg);
+
+	id = dc_subdev_get_id(dc_cf_info, ARRAY_SIZE(dc_cf_info), res_pec);
+	if (id < 0) {
+		dev_err(dev, "failed to get instance number: %d\n", id);
+		return id;
+	}
+
+	switch (id) {
+	case 0:
+		cf->link = LINK_ID_CONSTFRAME0;
+		dc_drm->cf_cont[0] = cf;
+		break;
+	case 1:
+		cf->link = LINK_ID_CONSTFRAME1;
+		dc_drm->cf_cont[1] = cf;
+		break;
+	case 4:
+		cf->link = LINK_ID_CONSTFRAME4;
+		dc_drm->cf_safe[0] = cf;
+		break;
+	case 5:
+		cf->link = LINK_ID_CONSTFRAME5;
+		dc_drm->cf_safe[1] = cf;
+		break;
+	}
+
+	return 0;
+}
+
+static const struct component_ops dc_cf_ops = {
+	.bind = dc_cf_bind,
+};
+
+static int dc_cf_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	ret = component_add(&pdev->dev, &dc_cf_ops);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to add component\n");
+
+	return 0;
+}
+
+static void dc_cf_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &dc_cf_ops);
+}
+
+static const struct of_device_id dc_cf_dt_ids[] = {
+	{ .compatible = "fsl,imx8qxp-dc-constframe" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, dc_cf_dt_ids);
+
+struct platform_driver dc_cf_driver = {
+	.probe = dc_cf_probe,
+	.remove = dc_cf_remove,
+	.driver = {
+		.name = "imx8-dc-constframe",
+		.suppress_bind_attrs = true,
+		.of_match_table = dc_cf_dt_ids,
+	},
+};
diff --git a/drivers/gpu/drm/imx/dc/dc-drv.c b/drivers/gpu/drm/imx/dc/dc-drv.c
index e5910a82dd4d..7c64acc863ad 100644
--- a/drivers/gpu/drm/imx/dc/dc-drv.c
+++ b/drivers/gpu/drm/imx/dc/dc-drv.c
@@ -9,8 +9,14 @@
 #include "dc-drv.h"
 
 static struct platform_driver * const dc_drivers[] = {
+	&dc_cf_driver,
 	&dc_de_driver,
+	&dc_ed_driver,
 	&dc_fg_driver,
+	&dc_fl_driver,
+	&dc_fw_driver,
+	&dc_lb_driver,
+	&dc_pe_driver,
 	&dc_tc_driver,
 };
 
diff --git a/drivers/gpu/drm/imx/dc/dc-drv.h b/drivers/gpu/drm/imx/dc/dc-drv.h
index 65ae9c7c3694..b9fe12577a19 100644
--- a/drivers/gpu/drm/imx/dc/dc-drv.h
+++ b/drivers/gpu/drm/imx/dc/dc-drv.h
@@ -13,6 +13,7 @@
 #include <drm/drm_device.h>
 
 #include "dc-de.h"
+#include "dc-pe.h"
 
 /**
  * struct dc_drm_device - DC specific drm_device
@@ -20,10 +21,24 @@
 struct dc_drm_device {
 	/** @base: base drm_device structure */
 	struct drm_device base;
+	/** @cf_safe: constframe list(safety stream) */
+	struct dc_cf *cf_safe[DC_DISPLAYS];
+	/** @cf_cont: constframe list(content stream) */
+	struct dc_cf *cf_cont[DC_DISPLAYS];
 	/** @de: display engine list */
 	struct dc_de *de[DC_DISPLAYS];
+	/** @ed_safe: extdst list(safety stream) */
+	struct dc_ed *ed_safe[DC_DISPLAYS];
+	/** @ed_cont: extdst list(content stream) */
+	struct dc_ed *ed_cont[DC_DISPLAYS];
 	/** @fg: framegen list */
 	struct dc_fg *fg[DC_DISPLAYS];
+	/** @fu_disp: fetchunit list(used by display engine) */
+	struct dc_fu *fu_disp[DC_DISP_FU_CNT];
+	/** @lb: layerblend list */
+	struct dc_lb *lb[DC_LB_CNT];
+	/** @pe: pixel engine */
+	struct dc_pe *pe;
 	/** @tc: tcon list */
 	struct dc_tc *tc[DC_DISPLAYS];
 };
@@ -33,8 +48,14 @@ struct dc_subdev_info {
 	int id;
 };
 
+extern struct platform_driver dc_cf_driver;
 extern struct platform_driver dc_de_driver;
+extern struct platform_driver dc_ed_driver;
 extern struct platform_driver dc_fg_driver;
+extern struct platform_driver dc_fl_driver;
+extern struct platform_driver dc_fw_driver;
+extern struct platform_driver dc_lb_driver;
+extern struct platform_driver dc_pe_driver;
 extern struct platform_driver dc_tc_driver;
 
 static inline int dc_subdev_get_id(const struct dc_subdev_info *info,
@@ -53,5 +74,6 @@ static inline int dc_subdev_get_id(const struct dc_subdev_info *info,
 }
 
 void dc_de_post_bind(struct dc_drm_device *dc_drm);
+void dc_pe_post_bind(struct dc_drm_device *dc_drm);
 
 #endif /* __DC_DRV_H__ */
diff --git a/drivers/gpu/drm/imx/dc/dc-ed.c b/drivers/gpu/drm/imx/dc/dc-ed.c
new file mode 100644
index 000000000000..86ecc22d0a55
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-ed.c
@@ -0,0 +1,288 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/component.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include "dc-drv.h"
+#include "dc-pe.h"
+
+#define PIXENGCFG_STATIC	0x8
+#define  POWERDOWN		BIT(4)
+#define  SYNC_MODE		BIT(8)
+#define  SINGLE			0
+#define  DIV_MASK		GENMASK(23, 16)
+#define  DIV(x)			FIELD_PREP(DIV_MASK, (x))
+#define  DIV_RESET		0x80
+
+#define PIXENGCFG_DYNAMIC	0xc
+
+#define PIXENGCFG_TRIGGER	0x14
+#define  SYNC_TRIGGER		BIT(0)
+
+#define STATICCONTROL		0x8
+#define  KICK_MODE		BIT(8)
+#define  EXTERNAL		BIT(8)
+#define  PERFCOUNTMODE		BIT(12)
+
+#define CONTROL			0xc
+#define  GAMMAAPPLYENABLE	BIT(0)
+
+static const struct dc_subdev_info dc_ed_info[] = {
+	{ .reg_start = 0x56180980, .id = 0, },
+	{ .reg_start = 0x56180a00, .id = 1, },
+	{ .reg_start = 0x561809c0, .id = 4, },
+	{ .reg_start = 0x56180a40, .id = 5, },
+};
+
+static const struct regmap_range dc_ed_pec_regmap_write_ranges[] = {
+	regmap_reg_range(PIXENGCFG_STATIC, PIXENGCFG_STATIC),
+	regmap_reg_range(PIXENGCFG_DYNAMIC, PIXENGCFG_DYNAMIC),
+	regmap_reg_range(PIXENGCFG_TRIGGER, PIXENGCFG_TRIGGER),
+};
+
+static const struct regmap_access_table dc_ed_pec_regmap_write_table = {
+	.yes_ranges = dc_ed_pec_regmap_write_ranges,
+	.n_yes_ranges = ARRAY_SIZE(dc_ed_pec_regmap_write_ranges),
+};
+
+static const struct regmap_range dc_ed_pec_regmap_read_ranges[] = {
+	regmap_reg_range(PIXENGCFG_STATIC, PIXENGCFG_STATIC),
+	regmap_reg_range(PIXENGCFG_DYNAMIC, PIXENGCFG_DYNAMIC),
+};
+
+static const struct regmap_access_table dc_ed_pec_regmap_read_table = {
+	.yes_ranges = dc_ed_pec_regmap_read_ranges,
+	.n_yes_ranges = ARRAY_SIZE(dc_ed_pec_regmap_read_ranges),
+};
+
+static const struct regmap_range dc_ed_pec_regmap_volatile_ranges[] = {
+	regmap_reg_range(PIXENGCFG_TRIGGER, PIXENGCFG_TRIGGER),
+};
+
+static const struct regmap_access_table dc_ed_pec_regmap_volatile_table = {
+	.yes_ranges = dc_ed_pec_regmap_volatile_ranges,
+	.n_yes_ranges = ARRAY_SIZE(dc_ed_pec_regmap_volatile_ranges),
+};
+
+static const struct regmap_config dc_ed_pec_regmap_config = {
+	.name = "pec",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.wr_table = &dc_ed_pec_regmap_write_table,
+	.rd_table = &dc_ed_pec_regmap_read_table,
+	.volatile_table = &dc_ed_pec_regmap_volatile_table,
+	.max_register = PIXENGCFG_TRIGGER,
+};
+
+static const struct regmap_range dc_ed_regmap_ranges[] = {
+	regmap_reg_range(STATICCONTROL, STATICCONTROL),
+	regmap_reg_range(CONTROL, CONTROL),
+};
+
+static const struct regmap_access_table dc_ed_regmap_access_table = {
+	.yes_ranges = dc_ed_regmap_ranges,
+	.n_yes_ranges = ARRAY_SIZE(dc_ed_regmap_ranges),
+};
+
+static const struct regmap_config dc_ed_cfg_regmap_config = {
+	.name = "cfg",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.wr_table = &dc_ed_regmap_access_table,
+	.rd_table = &dc_ed_regmap_access_table,
+	.max_register = CONTROL,
+};
+
+static const enum dc_link_id src_sels[] = {
+	LINK_ID_NONE,
+	LINK_ID_CONSTFRAME0,
+	LINK_ID_CONSTFRAME1,
+	LINK_ID_CONSTFRAME4,
+	LINK_ID_CONSTFRAME5,
+	LINK_ID_LAYERBLEND3,
+	LINK_ID_LAYERBLEND2,
+	LINK_ID_LAYERBLEND1,
+	LINK_ID_LAYERBLEND0,
+};
+
+static inline void dc_ed_pec_enable_shden(struct dc_ed *ed)
+{
+	regmap_write_bits(ed->reg_pec, PIXENGCFG_STATIC, SHDEN, SHDEN);
+}
+
+static inline void dc_ed_pec_poweron(struct dc_ed *ed)
+{
+	regmap_write_bits(ed->reg_pec, PIXENGCFG_STATIC, POWERDOWN, 0);
+}
+
+static inline void dc_ed_pec_sync_mode_single(struct dc_ed *ed)
+{
+	regmap_write_bits(ed->reg_pec, PIXENGCFG_STATIC, SYNC_MODE, SINGLE);
+}
+
+static inline void dc_ed_pec_div_reset(struct dc_ed *ed)
+{
+	regmap_write_bits(ed->reg_pec, PIXENGCFG_STATIC, DIV_MASK,
+			  DIV(DIV_RESET));
+}
+
+void dc_ed_pec_src_sel(struct dc_ed *ed, enum dc_link_id src)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(src_sels); i++) {
+		if (src_sels[i] == src) {
+			regmap_write(ed->reg_pec, PIXENGCFG_DYNAMIC, src);
+			return;
+		}
+	}
+}
+
+void dc_ed_pec_sync_trigger(struct dc_ed *ed)
+{
+	regmap_write(ed->reg_pec, PIXENGCFG_TRIGGER, SYNC_TRIGGER);
+}
+
+static inline void dc_ed_enable_shden(struct dc_ed *ed)
+{
+	regmap_write_bits(ed->reg_cfg, STATICCONTROL, SHDEN, SHDEN);
+}
+
+static inline void dc_ed_kick_mode_external(struct dc_ed *ed)
+{
+	regmap_write_bits(ed->reg_cfg, STATICCONTROL, KICK_MODE, EXTERNAL);
+}
+
+static inline void dc_ed_disable_perfcountmode(struct dc_ed *ed)
+{
+	regmap_write_bits(ed->reg_cfg, STATICCONTROL, PERFCOUNTMODE, 0);
+}
+
+static inline void dc_ed_disable_gamma_apply(struct dc_ed *ed)
+{
+	regmap_write_bits(ed->reg_cfg, CONTROL, GAMMAAPPLYENABLE, 0);
+}
+
+void dc_ed_init(struct dc_ed *ed)
+{
+	dc_ed_pec_src_sel(ed, LINK_ID_NONE);
+	dc_ed_pec_enable_shden(ed);
+	dc_ed_pec_poweron(ed);
+	dc_ed_pec_sync_mode_single(ed);
+	dc_ed_pec_div_reset(ed);
+	dc_ed_enable_shden(ed);
+	dc_ed_disable_perfcountmode(ed);
+	dc_ed_kick_mode_external(ed);
+	dc_ed_disable_gamma_apply(ed);
+}
+
+static int dc_ed_bind(struct device *dev, struct device *master, void *data)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct dc_drm_device *dc_drm = data;
+	struct resource *res_pec;
+	void __iomem *base_pec;
+	void __iomem *base_cfg;
+	struct dc_ed *ed;
+	int id;
+
+	ed = devm_kzalloc(dev, sizeof(*ed), GFP_KERNEL);
+	if (!ed)
+		return -ENOMEM;
+
+	base_pec = devm_platform_get_and_ioremap_resource(pdev, 0, &res_pec);
+	if (IS_ERR(base_pec))
+		return PTR_ERR(base_pec);
+
+	base_cfg = devm_platform_ioremap_resource_byname(pdev, "cfg");
+	if (IS_ERR(base_cfg))
+		return PTR_ERR(base_cfg);
+
+	ed->reg_pec = devm_regmap_init_mmio(dev, base_pec,
+					    &dc_ed_pec_regmap_config);
+	if (IS_ERR(ed->reg_pec))
+		return PTR_ERR(ed->reg_pec);
+
+	ed->reg_cfg = devm_regmap_init_mmio(dev, base_cfg,
+					    &dc_ed_cfg_regmap_config);
+	if (IS_ERR(ed->reg_cfg))
+		return PTR_ERR(ed->reg_cfg);
+
+	ed->irq_shdload = platform_get_irq_byname(pdev, "shdload");
+	if (ed->irq_shdload < 0)
+		return ed->irq_shdload;
+
+	ed->dev = dev;
+
+	id = dc_subdev_get_id(dc_ed_info, ARRAY_SIZE(dc_ed_info), res_pec);
+	if (id < 0) {
+		dev_err(dev, "failed to get instance number: %d\n", id);
+		return id;
+	}
+
+	switch (id) {
+	case 0:
+		dc_drm->ed_cont[0] = ed;
+		break;
+	case 1:
+		dc_drm->ed_cont[1] = ed;
+		break;
+	case 4:
+		dc_drm->ed_safe[0] = ed;
+		break;
+	case 5:
+		dc_drm->ed_safe[1] = ed;
+		break;
+	}
+
+	return 0;
+}
+
+static const struct component_ops dc_ed_ops = {
+	.bind = dc_ed_bind,
+};
+
+static int dc_ed_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	ret = component_add(&pdev->dev, &dc_ed_ops);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to add component\n");
+
+	return 0;
+}
+
+static void dc_ed_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &dc_ed_ops);
+}
+
+static const struct of_device_id dc_ed_dt_ids[] = {
+	{ .compatible = "fsl,imx8qxp-dc-extdst" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, dc_ed_dt_ids);
+
+struct platform_driver dc_ed_driver = {
+	.probe = dc_ed_probe,
+	.remove = dc_ed_remove,
+	.driver = {
+		.name = "imx8-dc-extdst",
+		.suppress_bind_attrs = true,
+		.of_match_table = dc_ed_dt_ids,
+	},
+};
diff --git a/drivers/gpu/drm/imx/dc/dc-fl.c b/drivers/gpu/drm/imx/dc/dc-fl.c
new file mode 100644
index 000000000000..3ce24c72aa13
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-fl.c
@@ -0,0 +1,185 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/component.h>
+#include <linux/ioport.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <drm/drm_fourcc.h>
+
+#include "dc-drv.h"
+#include "dc-fu.h"
+
+#define BASEADDRESS(x)			(0x10 + FRAC_OFFSET * (x))
+#define SOURCEBUFFERATTRIBUTES(x)	(0x14 + FRAC_OFFSET * (x))
+#define SOURCEBUFFERDIMENSION(x)	(0x18 + FRAC_OFFSET * (x))
+#define COLORCOMPONENTBITS(x)		(0x1c + FRAC_OFFSET * (x))
+#define COLORCOMPONENTSHIFT(x)		(0x20 + FRAC_OFFSET * (x))
+#define LAYEROFFSET(x)			(0x24 + FRAC_OFFSET * (x))
+#define CLIPWINDOWOFFSET(x)		(0x28 + FRAC_OFFSET * (x))
+#define CLIPWINDOWDIMENSIONS(x)		(0x2c + FRAC_OFFSET * (x))
+#define CONSTANTCOLOR(x)		(0x30 + FRAC_OFFSET * (x))
+#define LAYERPROPERTY(x)		(0x34 + FRAC_OFFSET * (x))
+#define FRAMEDIMENSIONS			0x150
+
+struct dc_fl {
+	struct dc_fu fu;
+};
+
+static const struct dc_subdev_info dc_fl_info[] = {
+	{ .reg_start = 0x56180ac0, .id = 0, },
+};
+
+static const struct regmap_range dc_fl_regmap_ranges[] = {
+	regmap_reg_range(STATICCONTROL, FRAMEDIMENSIONS),
+};
+
+static const struct regmap_access_table dc_fl_regmap_access_table = {
+	.yes_ranges = dc_fl_regmap_ranges,
+	.n_yes_ranges = ARRAY_SIZE(dc_fl_regmap_ranges),
+};
+
+static const struct regmap_config dc_fl_cfg_regmap_config = {
+	.name = "cfg",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.wr_table = &dc_fl_regmap_access_table,
+	.rd_table = &dc_fl_regmap_access_table,
+	.max_register = FRAMEDIMENSIONS,
+};
+
+static void dc_fl_set_fmt(struct dc_fu *fu, enum dc_fu_frac frac,
+			  const struct drm_format_info *format)
+{
+	u32 bits = 0, shifts = 0;
+
+	dc_fu_set_src_bpp(fu, frac, format->cpp[0] * 8);
+
+	regmap_write_bits(fu->reg_cfg, LAYERPROPERTY(frac),
+			  YUVCONVERSIONMODE_MASK,
+			  YUVCONVERSIONMODE(YUVCONVERSIONMODE_OFF));
+
+	dc_fu_get_pixel_format_bits(fu, format->format, &bits);
+	dc_fu_get_pixel_format_shifts(fu, format->format, &shifts);
+
+	regmap_write(fu->reg_cfg, COLORCOMPONENTBITS(frac), bits);
+	regmap_write(fu->reg_cfg, COLORCOMPONENTSHIFT(frac), shifts);
+}
+
+static void dc_fl_set_framedimensions(struct dc_fu *fu, int w, int h)
+{
+	regmap_write(fu->reg_cfg, FRAMEDIMENSIONS,
+		     FRAMEWIDTH(w) | FRAMEHEIGHT(h));
+}
+
+static void dc_fl_init(struct dc_fu *fu)
+{
+	dc_fu_common_hw_init(fu);
+	dc_fu_shdldreq_sticky(fu, 0xff);
+}
+
+static void dc_fl_set_ops(struct dc_fu *fu)
+{
+	memcpy(&fu->ops, &dc_fu_common_ops, sizeof(dc_fu_common_ops));
+	fu->ops.init = dc_fl_init;
+	fu->ops.set_fmt = dc_fl_set_fmt;
+	fu->ops.set_framedimensions = dc_fl_set_framedimensions;
+}
+
+static int dc_fl_bind(struct device *dev, struct device *master, void *data)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct dc_drm_device *dc_drm = data;
+	struct resource *res_pec;
+	void __iomem *base_cfg;
+	struct dc_fl *fl;
+	struct dc_fu *fu;
+	int i, id;
+
+	fl = devm_kzalloc(dev, sizeof(*fl), GFP_KERNEL);
+	if (!fl)
+		return -ENOMEM;
+
+	fu = &fl->fu;
+
+	res_pec = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+
+	base_cfg = devm_platform_ioremap_resource_byname(pdev, "cfg");
+	if (IS_ERR(base_cfg))
+		return PTR_ERR(base_cfg);
+
+	fu->reg_cfg = devm_regmap_init_mmio(dev, base_cfg,
+					    &dc_fl_cfg_regmap_config);
+	if (IS_ERR(fu->reg_cfg))
+		return PTR_ERR(fu->reg_cfg);
+
+	id = dc_subdev_get_id(dc_fl_info, ARRAY_SIZE(dc_fl_info), res_pec);
+	if (id < 0) {
+		dev_err(dev, "failed to get instance number: %d\n", id);
+		return id;
+	}
+
+	fu->link_id = LINK_ID_FETCHLAYER0;
+	fu->id = DC_FETCHUNIT_FL0;
+	for (i = 0; i < DC_FETCHUNIT_FRAC_NUM; i++) {
+		fu->reg_baseaddr[i]		  = BASEADDRESS(i);
+		fu->reg_sourcebufferattributes[i] = SOURCEBUFFERATTRIBUTES(i);
+		fu->reg_sourcebufferdimension[i]  = SOURCEBUFFERDIMENSION(i);
+		fu->reg_layeroffset[i]		  = LAYEROFFSET(i);
+		fu->reg_clipwindowoffset[i]	  = CLIPWINDOWOFFSET(i);
+		fu->reg_clipwindowdimensions[i]	  = CLIPWINDOWDIMENSIONS(i);
+		fu->reg_constantcolor[i]	  = CONSTANTCOLOR(i);
+		fu->reg_layerproperty[i]	  = LAYERPROPERTY(i);
+	}
+	snprintf(fu->name, sizeof(fu->name), "FetchLayer%d", id);
+
+	dc_fl_set_ops(fu);
+
+	dc_drm->fu_disp[fu->id] = fu;
+
+	return 0;
+}
+
+static const struct component_ops dc_fl_ops = {
+	.bind = dc_fl_bind,
+};
+
+static int dc_fl_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	ret = component_add(&pdev->dev, &dc_fl_ops);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to add component\n");
+
+	return 0;
+}
+
+static void dc_fl_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &dc_fl_ops);
+}
+
+static const struct of_device_id dc_fl_dt_ids[] = {
+	{ .compatible = "fsl,imx8qxp-dc-fetchlayer" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, dc_fl_dt_ids);
+
+struct platform_driver dc_fl_driver = {
+	.probe = dc_fl_probe,
+	.remove = dc_fl_remove,
+	.driver = {
+		.name = "imx8-dc-fetchlayer",
+		.suppress_bind_attrs = true,
+		.of_match_table = dc_fl_dt_ids,
+	},
+};
diff --git a/drivers/gpu/drm/imx/dc/dc-fu.c b/drivers/gpu/drm/imx/dc/dc-fu.c
new file mode 100644
index 000000000000..f94c591c8158
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-fu.c
@@ -0,0 +1,258 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bitops.h>
+#include <linux/bits.h>
+#include <linux/math.h>
+
+#include "dc-fu.h"
+#include "dc-pe.h"
+
+/* STATICCONTROL */
+#define SHDLDREQSTICKY_MASK		GENMASK(31, 24)
+#define SHDLDREQSTICKY(x)		FIELD_PREP(SHDLDREQSTICKY_MASK, (x))
+#define BASEADDRESSAUTOUPDATE_MASK	GENMASK(23, 16)
+#define BASEADDRESSAUTOUPDATE(x)	FIELD_PREP(BASEADDRESSAUTOUPDATE_MASK, (x))
+
+/* BURSTBUFFERMANAGEMENT */
+#define SETBURSTLENGTH_MASK		GENMASK(12, 8)
+#define SETBURSTLENGTH(x)		FIELD_PREP(SETBURSTLENGTH_MASK, (x))
+#define SETNUMBUFFERS_MASK		GENMASK(7, 0)
+#define SETNUMBUFFERS(x)		FIELD_PREP(SETNUMBUFFERS_MASK, (x))
+#define LINEMODE_MASK			BIT(31)
+
+/* SOURCEBUFFERATTRIBUTES */
+#define BITSPERPIXEL_MASK		GENMASK(21, 16)
+#define BITSPERPIXEL(x)			FIELD_PREP(BITSPERPIXEL_MASK, (x))
+#define STRIDE_MASK			GENMASK(15, 0)
+#define STRIDE(x)			FIELD_PREP(STRIDE_MASK, (x) - 1)
+
+/* SOURCEBUFFERDIMENSION */
+#define LINEWIDTH(x)			FIELD_PREP(GENMASK(13, 0), (x))
+#define LINECOUNT(x)			FIELD_PREP(GENMASK(29, 16), (x))
+
+/* LAYEROFFSET */
+#define LAYERXOFFSET(x)			FIELD_PREP(GENMASK(14, 0), (x))
+#define LAYERYOFFSET(x)			FIELD_PREP(GENMASK(30, 16), (x))
+
+/* CLIPWINDOWOFFSET */
+#define CLIPWINDOWXOFFSET(x)		FIELD_PREP(GENMASK(14, 0), (x))
+#define CLIPWINDOWYOFFSET(x)		FIELD_PREP(GENMASK(30, 16), (x))
+
+/* CLIPWINDOWDIMENSIONS */
+#define CLIPWINDOWWIDTH(x)		FIELD_PREP(GENMASK(13, 0), (x) - 1)
+#define CLIPWINDOWHEIGHT(x)		FIELD_PREP(GENMASK(29, 16), (x) - 1)
+
+enum dc_linemode {
+	/*
+	 * Mandatory setting for operation in the Display Controller.
+	 * Works also for Blit Engine with marginal performance impact.
+	 */
+	LINEMODE_DISPLAY = 0,
+};
+
+struct dc_fu_pixel_format {
+	u32 pixel_format;
+	u32 bits;
+	u32 shifts;
+};
+
+static const struct dc_fu_pixel_format pixel_formats[] = {
+	{
+		DRM_FORMAT_XRGB8888,
+		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
+		R_SHIFT(16) | G_SHIFT(8)  | B_SHIFT(0)  | A_SHIFT(0),
+	},
+};
+
+void dc_fu_get_pixel_format_bits(struct dc_fu *fu, u32 format, u32 *bits)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
+		if (pixel_formats[i].pixel_format == format) {
+			*bits = pixel_formats[i].bits;
+			return;
+		}
+	}
+}
+
+void
+dc_fu_get_pixel_format_shifts(struct dc_fu *fu, u32 format, u32 *shifts)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
+		if (pixel_formats[i].pixel_format == format) {
+			*shifts = pixel_formats[i].shifts;
+			return;
+		}
+	}
+}
+
+static inline void dc_fu_enable_shden(struct dc_fu *fu)
+{
+	regmap_write_bits(fu->reg_cfg, STATICCONTROL, SHDEN, SHDEN);
+}
+
+static inline void dc_fu_baddr_autoupdate(struct dc_fu *fu, u8 layer_mask)
+{
+	regmap_write_bits(fu->reg_cfg, STATICCONTROL,
+			  BASEADDRESSAUTOUPDATE_MASK,
+			  BASEADDRESSAUTOUPDATE(layer_mask));
+}
+
+void dc_fu_shdldreq_sticky(struct dc_fu *fu, u8 layer_mask)
+{
+	regmap_write_bits(fu->reg_cfg, STATICCONTROL, SHDLDREQSTICKY_MASK,
+			  SHDLDREQSTICKY(layer_mask));
+}
+
+static inline void dc_fu_set_linemode(struct dc_fu *fu, enum dc_linemode mode)
+{
+	regmap_write_bits(fu->reg_cfg, BURSTBUFFERMANAGEMENT, LINEMODE_MASK,
+			  mode);
+}
+
+static inline void dc_fu_set_numbuffers(struct dc_fu *fu, unsigned int num)
+{
+	regmap_write_bits(fu->reg_cfg, BURSTBUFFERMANAGEMENT,
+			  SETNUMBUFFERS_MASK, SETNUMBUFFERS(num));
+}
+
+static void dc_fu_set_burstlength(struct dc_fu *fu, dma_addr_t baddr)
+{
+	unsigned int burst_size, burst_length;
+
+	burst_size = 1 << __ffs(baddr);
+	burst_size = round_up(burst_size, 8);
+	burst_size = min(burst_size, 128U);
+	burst_length = burst_size / 8;
+
+	regmap_write_bits(fu->reg_cfg, BURSTBUFFERMANAGEMENT,
+			  SETBURSTLENGTH_MASK, SETBURSTLENGTH(burst_length));
+}
+
+static void dc_fu_set_baseaddress(struct dc_fu *fu, enum dc_fu_frac frac,
+				  dma_addr_t baddr)
+{
+	regmap_write(fu->reg_cfg, fu->reg_baseaddr[frac], baddr);
+}
+
+void dc_fu_set_src_bpp(struct dc_fu *fu, enum dc_fu_frac frac, unsigned int bpp)
+{
+	regmap_write_bits(fu->reg_cfg, fu->reg_sourcebufferattributes[frac],
+			  BITSPERPIXEL_MASK, BITSPERPIXEL(bpp));
+}
+
+static void dc_fu_set_src_stride(struct dc_fu *fu, enum dc_fu_frac frac,
+				 unsigned int stride)
+{
+	regmap_write_bits(fu->reg_cfg, fu->reg_sourcebufferattributes[frac],
+			  STRIDE_MASK, STRIDE(stride));
+}
+
+static void dc_fu_set_src_buf_dimensions(struct dc_fu *fu, enum dc_fu_frac frac,
+					 int w, int h)
+{
+	regmap_write(fu->reg_cfg, fu->reg_sourcebufferdimension[frac],
+		     LINEWIDTH(w) | LINECOUNT(h));
+}
+
+static inline void dc_fu_layeroffset(struct dc_fu *fu, enum dc_fu_frac frac,
+				     unsigned int x, unsigned int y)
+{
+	regmap_write(fu->reg_cfg, fu->reg_layeroffset[frac],
+		     LAYERXOFFSET(x) | LAYERYOFFSET(y));
+}
+
+static inline void dc_fu_clipoffset(struct dc_fu *fu, enum dc_fu_frac frac,
+				    unsigned int x, unsigned int y)
+{
+	regmap_write(fu->reg_cfg, fu->reg_clipwindowoffset[frac],
+		     CLIPWINDOWXOFFSET(x) | CLIPWINDOWYOFFSET(y));
+}
+
+static inline void dc_fu_clipdimensions(struct dc_fu *fu, enum dc_fu_frac frac,
+					unsigned int w, unsigned int h)
+{
+	regmap_write(fu->reg_cfg, fu->reg_clipwindowdimensions[frac],
+		     CLIPWINDOWWIDTH(w) | CLIPWINDOWHEIGHT(h));
+}
+
+static inline void
+dc_fu_set_pixel_blend_mode(struct dc_fu *fu, enum dc_fu_frac frac)
+{
+	regmap_write(fu->reg_cfg, fu->reg_layerproperty[frac], 0);
+	regmap_write(fu->reg_cfg, fu->reg_constantcolor[frac], 0);
+}
+
+static void dc_fu_enable_src_buf(struct dc_fu *fu, enum dc_fu_frac frac)
+{
+	regmap_write_bits(fu->reg_cfg, fu->reg_layerproperty[frac],
+			  SOURCEBUFFERENABLE, SOURCEBUFFERENABLE);
+}
+
+static void dc_fu_disable_src_buf(struct dc_fu *fu, enum dc_fu_frac frac)
+{
+	regmap_write_bits(fu->reg_cfg, fu->reg_layerproperty[frac],
+			  SOURCEBUFFERENABLE, 0);
+
+	if (fu->lb) {
+		dc_lb_pec_clken(fu->lb, CLKEN_DISABLE);
+		dc_lb_mode(fu->lb, LB_NEUTRAL);
+	}
+}
+
+static void dc_fu_set_layerblend(struct dc_fu *fu, struct dc_lb *lb)
+{
+	fu->lb = lb;
+}
+
+static enum dc_link_id dc_fu_get_link_id(struct dc_fu *fu)
+{
+	return fu->link_id;
+}
+
+static const char *dc_fu_get_name(struct dc_fu *fu)
+{
+	return fu->name;
+}
+
+const struct dc_fu_ops dc_fu_common_ops = {
+	.set_burstlength	= dc_fu_set_burstlength,
+	.set_baseaddress	= dc_fu_set_baseaddress,
+	.set_src_stride		= dc_fu_set_src_stride,
+	.set_src_buf_dimensions = dc_fu_set_src_buf_dimensions,
+	.enable_src_buf		= dc_fu_enable_src_buf,
+	.disable_src_buf	= dc_fu_disable_src_buf,
+	.set_layerblend		= dc_fu_set_layerblend,
+	.get_link_id		= dc_fu_get_link_id,
+	.get_name		= dc_fu_get_name,
+};
+
+const struct dc_fu_ops *dc_fu_get_ops(struct dc_fu *fu)
+{
+	return &fu->ops;
+}
+
+void dc_fu_common_hw_init(struct dc_fu *fu)
+{
+	enum dc_fu_frac i;
+
+	dc_fu_baddr_autoupdate(fu, 0x0);
+	dc_fu_enable_shden(fu);
+	dc_fu_set_linemode(fu, LINEMODE_DISPLAY);
+	dc_fu_set_numbuffers(fu, 16);
+
+	for (i = DC_FETCHUNIT_FRAC0; i < DC_FETCHUNIT_FRAC_NUM; i++) {
+		dc_fu_layeroffset(fu, i, 0, 0);
+		dc_fu_clipoffset(fu, i, 0, 0);
+		dc_fu_clipdimensions(fu, i, 1, 1);
+		dc_fu_disable_src_buf(fu, i);
+		dc_fu_set_pixel_blend_mode(fu, i);
+	}
+}
diff --git a/drivers/gpu/drm/imx/dc/dc-fu.h b/drivers/gpu/drm/imx/dc/dc-fu.h
new file mode 100644
index 000000000000..e016e1ea5b4e
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-fu.h
@@ -0,0 +1,129 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2024 NXP
+ */
+
+#ifndef __DC_FETCHUNIT_H__
+#define __DC_FETCHUNIT_H__
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/regmap.h>
+#include <linux/types.h>
+
+#include <drm/drm_fourcc.h>
+
+#include "dc-pe.h"
+
+#define FRAC_OFFSET			0x28
+
+#define STATICCONTROL			0x8
+#define BURSTBUFFERMANAGEMENT		0xc
+
+/* COLORCOMPONENTBITS */
+#define R_BITS(x)			FIELD_PREP_CONST(GENMASK(27, 24), (x))
+#define G_BITS(x)			FIELD_PREP_CONST(GENMASK(19, 16), (x))
+#define B_BITS(x)			FIELD_PREP_CONST(GENMASK(11, 8), (x))
+#define A_BITS(x)			FIELD_PREP_CONST(GENMASK(3, 0), (x))
+
+/* COLORCOMPONENTSHIFT */
+#define R_SHIFT(x)			FIELD_PREP_CONST(GENMASK(28, 24), (x))
+#define G_SHIFT(x)			FIELD_PREP_CONST(GENMASK(20, 16), (x))
+#define B_SHIFT(x)			FIELD_PREP_CONST(GENMASK(12, 8), (x))
+#define A_SHIFT(x)			FIELD_PREP_CONST(GENMASK(4, 0), (x))
+
+/* LAYERPROPERTY */
+#define YUVCONVERSIONMODE_MASK		GENMASK(18, 17)
+#define YUVCONVERSIONMODE(x)		FIELD_PREP(YUVCONVERSIONMODE_MASK, (x))
+#define SOURCEBUFFERENABLE		BIT(31)
+
+/* FRAMEDIMENSIONS */
+#define FRAMEWIDTH(x)			FIELD_PREP(GENMASK(13, 0), (x))
+#define FRAMEHEIGHT(x)			FIELD_PREP(GENMASK(29, 16), (x))
+
+/* CONTROL */
+#define INPUTSELECT_MASK		GENMASK(4, 3)
+#define INPUTSELECT(x)			FIELD_PREP(INPUTSELECT_MASK, (x))
+#define RASTERMODE_MASK			GENMASK(2, 0)
+#define RASTERMODE(x)			FIELD_PREP(RASTERMODE_MASK, (x))
+
+enum dc_yuvconversionmode {
+	YUVCONVERSIONMODE_OFF,
+};
+
+enum dc_inputselect {
+	INPUTSELECT_INACTIVE,
+};
+
+enum dc_rastermode {
+	RASTERMODE_NORMAL,
+};
+
+enum {
+	DC_FETCHUNIT_FL0,
+	DC_FETCHUNIT_FW2,
+};
+
+enum dc_fu_frac {
+	DC_FETCHUNIT_FRAC0,
+	DC_FETCHUNIT_FRAC1,
+	DC_FETCHUNIT_FRAC2,
+	DC_FETCHUNIT_FRAC3,
+	DC_FETCHUNIT_FRAC4,
+	DC_FETCHUNIT_FRAC5,
+	DC_FETCHUNIT_FRAC6,
+	DC_FETCHUNIT_FRAC7,
+	DC_FETCHUNIT_FRAC_NUM
+};
+
+struct dc_fu;
+struct dc_lb;
+
+struct dc_fu_ops {
+	void (*init)(struct dc_fu *fu);
+	void (*set_burstlength)(struct dc_fu *fu, dma_addr_t baddr);
+	void (*set_baseaddress)(struct dc_fu *fu, enum dc_fu_frac frac,
+				dma_addr_t baddr);
+	void (*set_src_stride)(struct dc_fu *fu, enum dc_fu_frac frac,
+			       unsigned int stride);
+	void (*set_src_buf_dimensions)(struct dc_fu *fu, enum dc_fu_frac frac,
+				       int w, int h);
+	void (*set_fmt)(struct dc_fu *fu, enum dc_fu_frac frac,
+			const struct drm_format_info *format);
+	void (*enable_src_buf)(struct dc_fu *fu, enum dc_fu_frac frac);
+	void (*disable_src_buf)(struct dc_fu *fu, enum dc_fu_frac frac);
+	void (*set_framedimensions)(struct dc_fu *fu, int w, int h);
+	void (*set_layerblend)(struct dc_fu *fu, struct dc_lb *lb);
+	enum dc_link_id (*get_link_id)(struct dc_fu *fu);
+	const char *(*get_name)(struct dc_fu *fu);
+};
+
+struct dc_fu {
+	struct regmap *reg_pec;
+	struct regmap *reg_cfg;
+	char name[21];
+	u32 reg_baseaddr[DC_FETCHUNIT_FRAC_NUM];
+	u32 reg_sourcebufferattributes[DC_FETCHUNIT_FRAC_NUM];
+	u32 reg_sourcebufferdimension[DC_FETCHUNIT_FRAC_NUM];
+	u32 reg_layeroffset[DC_FETCHUNIT_FRAC_NUM];
+	u32 reg_clipwindowoffset[DC_FETCHUNIT_FRAC_NUM];
+	u32 reg_clipwindowdimensions[DC_FETCHUNIT_FRAC_NUM];
+	u32 reg_constantcolor[DC_FETCHUNIT_FRAC_NUM];
+	u32 reg_layerproperty[DC_FETCHUNIT_FRAC_NUM];
+	unsigned int id;
+	enum dc_link_id link_id;
+	struct dc_fu_ops ops;
+	struct dc_lb *lb;
+};
+
+extern const struct dc_fu_ops dc_fu_common_ops;
+
+void dc_fu_get_pixel_format_bits(struct dc_fu *fu, u32 format, u32 *bits);
+void dc_fu_get_pixel_format_shifts(struct dc_fu *fu, u32 format, u32 *shifts);
+void dc_fu_shdldreq_sticky(struct dc_fu *fu, u8 layer_mask);
+void dc_fu_set_src_bpp(struct dc_fu *fu, enum dc_fu_frac frac, unsigned int bpp);
+void dc_fu_common_hw_init(struct dc_fu *fu);
+
+const struct dc_fu_ops *dc_fu_get_ops(struct dc_fu *fu);
+
+#endif /* __DC_FETCHUNIT_H__ */
diff --git a/drivers/gpu/drm/imx/dc/dc-fw.c b/drivers/gpu/drm/imx/dc/dc-fw.c
new file mode 100644
index 000000000000..acb2d4d9e2ec
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-fw.c
@@ -0,0 +1,222 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/component.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <drm/drm_fourcc.h>
+
+#include "dc-drv.h"
+#include "dc-fu.h"
+
+#define PIXENGCFG_DYNAMIC		0x8
+
+#define BASEADDRESS(x)			(0x10 + FRAC_OFFSET * (x))
+#define SOURCEBUFFERATTRIBUTES(x)	(0x14 + FRAC_OFFSET * (x))
+#define SOURCEBUFFERDIMENSION(x)	(0x18 + FRAC_OFFSET * (x))
+#define COLORCOMPONENTBITS(x)		(0x1c + FRAC_OFFSET * (x))
+#define COLORCOMPONENTSHIFT(x)		(0x20 + FRAC_OFFSET * (x))
+#define LAYEROFFSET(x)			(0x24 + FRAC_OFFSET * (x))
+#define CLIPWINDOWOFFSET(x)		(0x28 + FRAC_OFFSET * (x))
+#define CLIPWINDOWDIMENSIONS(x)		(0x2c + FRAC_OFFSET * (x))
+#define CONSTANTCOLOR(x)		(0x30 + FRAC_OFFSET * (x))
+#define LAYERPROPERTY(x)		(0x34 + FRAC_OFFSET * (x))
+#define FRAMEDIMENSIONS			0x150
+#define CONTROL				0x170
+
+struct dc_fw {
+	struct dc_fu fu;
+};
+
+static const struct dc_subdev_info dc_fw_info[] = {
+	{ .reg_start = 0x56180a60, .id = 2, },
+};
+
+static const struct regmap_range dc_fw_pec_regmap_access_ranges[] = {
+	regmap_reg_range(PIXENGCFG_DYNAMIC, PIXENGCFG_DYNAMIC),
+};
+
+static const struct regmap_access_table dc_fw_pec_regmap_access_table = {
+	.yes_ranges = dc_fw_pec_regmap_access_ranges,
+	.n_yes_ranges = ARRAY_SIZE(dc_fw_pec_regmap_access_ranges),
+};
+
+static const struct regmap_config dc_fw_pec_regmap_config = {
+	.name = "pec",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.wr_table = &dc_fw_pec_regmap_access_table,
+	.rd_table = &dc_fw_pec_regmap_access_table,
+	.max_register = PIXENGCFG_DYNAMIC,
+};
+
+static const struct regmap_range dc_fw_regmap_ranges[] = {
+	regmap_reg_range(STATICCONTROL, FRAMEDIMENSIONS),
+	regmap_reg_range(CONTROL, CONTROL),
+};
+
+static const struct regmap_access_table dc_fw_regmap_access_table = {
+	.yes_ranges = dc_fw_regmap_ranges,
+	.n_yes_ranges = ARRAY_SIZE(dc_fw_regmap_ranges),
+};
+
+static const struct regmap_config dc_fw_cfg_regmap_config = {
+	.name = "cfg",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.wr_table = &dc_fw_regmap_access_table,
+	.rd_table = &dc_fw_regmap_access_table,
+	.max_register = CONTROL,
+};
+
+static void dc_fw_set_fmt(struct dc_fu *fu, enum dc_fu_frac frac,
+			  const struct drm_format_info *format)
+{
+	u32 bits = 0, shifts = 0;
+
+	dc_fu_set_src_bpp(fu, frac, format->cpp[0] * 8);
+
+	regmap_write_bits(fu->reg_cfg, CONTROL, INPUTSELECT_MASK,
+			  INPUTSELECT(INPUTSELECT_INACTIVE));
+	regmap_write_bits(fu->reg_cfg, CONTROL, RASTERMODE_MASK,
+			  RASTERMODE(RASTERMODE_NORMAL));
+
+	regmap_write_bits(fu->reg_cfg, LAYERPROPERTY(frac),
+			  YUVCONVERSIONMODE_MASK,
+			  YUVCONVERSIONMODE(YUVCONVERSIONMODE_OFF));
+
+	dc_fu_get_pixel_format_bits(fu, format->format, &bits);
+	dc_fu_get_pixel_format_shifts(fu, format->format, &shifts);
+
+	regmap_write(fu->reg_cfg, COLORCOMPONENTBITS(frac), bits);
+	regmap_write(fu->reg_cfg, COLORCOMPONENTSHIFT(frac), shifts);
+}
+
+static void dc_fw_set_framedimensions(struct dc_fu *fu, int w, int h)
+{
+	regmap_write(fu->reg_cfg, FRAMEDIMENSIONS,
+		     FRAMEWIDTH(w) | FRAMEHEIGHT(h));
+}
+
+static void dc_fw_init(struct dc_fu *fu)
+{
+	regmap_write(fu->reg_pec, PIXENGCFG_DYNAMIC, LINK_ID_NONE);
+	dc_fu_common_hw_init(fu);
+	dc_fu_shdldreq_sticky(fu, 0xff);
+}
+
+static void dc_fw_set_ops(struct dc_fu *fu)
+{
+	memcpy(&fu->ops, &dc_fu_common_ops, sizeof(dc_fu_common_ops));
+	fu->ops.init = dc_fw_init;
+	fu->ops.set_fmt	= dc_fw_set_fmt;
+	fu->ops.set_framedimensions = dc_fw_set_framedimensions;
+}
+
+static int dc_fw_bind(struct device *dev, struct device *master, void *data)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct dc_drm_device *dc_drm = data;
+	struct resource *res_pec;
+	void __iomem *base_pec;
+	void __iomem *base_cfg;
+	struct dc_fw *fw;
+	struct dc_fu *fu;
+	int i, id;
+
+	fw = devm_kzalloc(dev, sizeof(*fw), GFP_KERNEL);
+	if (!fw)
+		return -ENOMEM;
+
+	fu = &fw->fu;
+
+	base_pec = devm_platform_get_and_ioremap_resource(pdev, 0, &res_pec);
+	if (IS_ERR(base_pec))
+		return PTR_ERR(base_pec);
+
+	base_cfg = devm_platform_ioremap_resource_byname(pdev, "cfg");
+	if (IS_ERR(base_cfg))
+		return PTR_ERR(base_cfg);
+
+	fu->reg_pec = devm_regmap_init_mmio(dev, base_pec,
+					    &dc_fw_pec_regmap_config);
+	if (IS_ERR(fu->reg_pec))
+		return PTR_ERR(fu->reg_pec);
+
+	fu->reg_cfg = devm_regmap_init_mmio(dev, base_cfg,
+					    &dc_fw_cfg_regmap_config);
+	if (IS_ERR(fu->reg_cfg))
+		return PTR_ERR(fu->reg_cfg);
+
+	id = dc_subdev_get_id(dc_fw_info, ARRAY_SIZE(dc_fw_info), res_pec);
+	if (id < 0) {
+		dev_err(dev, "failed to get instance number: %d\n", id);
+		return id;
+	}
+
+	fu->link_id = LINK_ID_FETCHWARP2;
+	fu->id = DC_FETCHUNIT_FW2;
+	for (i = 0; i < DC_FETCHUNIT_FRAC_NUM; i++) {
+		fu->reg_baseaddr[i]		  = BASEADDRESS(i);
+		fu->reg_sourcebufferattributes[i] = SOURCEBUFFERATTRIBUTES(i);
+		fu->reg_sourcebufferdimension[i]  = SOURCEBUFFERDIMENSION(i);
+		fu->reg_layeroffset[i]		  = LAYEROFFSET(i);
+		fu->reg_clipwindowoffset[i]	  = CLIPWINDOWOFFSET(i);
+		fu->reg_clipwindowdimensions[i]	  = CLIPWINDOWDIMENSIONS(i);
+		fu->reg_constantcolor[i]	  = CONSTANTCOLOR(i);
+		fu->reg_layerproperty[i]	  = LAYERPROPERTY(i);
+	}
+	snprintf(fu->name, sizeof(fu->name), "FetchWarp%d", id);
+
+	dc_fw_set_ops(fu);
+
+	dc_drm->fu_disp[fu->id] = fu;
+
+	return 0;
+}
+
+static const struct component_ops dc_fw_ops = {
+	.bind = dc_fw_bind,
+};
+
+static int dc_fw_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	ret = component_add(&pdev->dev, &dc_fw_ops);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to add component\n");
+
+	return 0;
+}
+
+static void dc_fw_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &dc_fw_ops);
+}
+
+static const struct of_device_id dc_fw_dt_ids[] = {
+	{ .compatible = "fsl,imx8qxp-dc-fetchwarp" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, dc_fw_dt_ids);
+
+struct platform_driver dc_fw_driver = {
+	.probe = dc_fw_probe,
+	.remove = dc_fw_remove,
+	.driver = {
+		.name = "imx8-dc-fetchwarp",
+		.suppress_bind_attrs = true,
+		.of_match_table = dc_fw_dt_ids,
+	},
+};
diff --git a/drivers/gpu/drm/imx/dc/dc-lb.c b/drivers/gpu/drm/imx/dc/dc-lb.c
new file mode 100644
index 000000000000..38f966625d38
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-lb.c
@@ -0,0 +1,325 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/component.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <drm/drm_blend.h>
+
+#include "dc-drv.h"
+#include "dc-pe.h"
+
+#define PIXENGCFG_DYNAMIC			0x8
+#define  PIXENGCFG_DYNAMIC_PRIM_SEL_MASK	GENMASK(5, 0)
+#define  PIXENGCFG_DYNAMIC_PRIM_SEL(x)		\
+		FIELD_PREP(PIXENGCFG_DYNAMIC_PRIM_SEL_MASK, (x))
+#define  PIXENGCFG_DYNAMIC_SEC_SEL_MASK		GENMASK(13, 8)
+#define  PIXENGCFG_DYNAMIC_SEC_SEL(x)		\
+		FIELD_PREP(PIXENGCFG_DYNAMIC_SEC_SEL_MASK, (x))
+
+#define STATICCONTROL				0x8
+#define  SHDTOKSEL_MASK				GENMASK(4, 3)
+#define  SHDTOKSEL(x)				FIELD_PREP(SHDTOKSEL_MASK, (x))
+#define  SHDLDSEL_MASK				GENMASK(2, 1)
+#define  SHDLDSEL(x)				FIELD_PREP(SHDLDSEL_MASK, (x))
+
+#define CONTROL					0xc
+#define  CTRL_MODE_MASK				BIT(0)
+#define  CTRL_MODE(x)				FIELD_PREP(CTRL_MODE_MASK, (x))
+
+#define BLENDCONTROL				0x10
+#define  ALPHA_MASK				GENMASK(23, 16)
+#define  ALPHA(x)				FIELD_PREP(ALPHA_MASK, (x))
+#define  PRIM_C_BLD_FUNC_MASK			GENMASK(2, 0)
+#define  PRIM_C_BLD_FUNC(x)			\
+		FIELD_PREP(PRIM_C_BLD_FUNC_MASK, (x))
+#define  SEC_C_BLD_FUNC_MASK			GENMASK(6, 4)
+#define  SEC_C_BLD_FUNC(x)			\
+		FIELD_PREP(SEC_C_BLD_FUNC_MASK, (x))
+#define  PRIM_A_BLD_FUNC_MASK			GENMASK(10, 8)
+#define  PRIM_A_BLD_FUNC(x)			\
+		FIELD_PREP(PRIM_A_BLD_FUNC_MASK, (x))
+#define  SEC_A_BLD_FUNC_MASK			GENMASK(14, 12)
+#define  SEC_A_BLD_FUNC(x)			\
+		FIELD_PREP(SEC_A_BLD_FUNC_MASK, (x))
+
+#define POSITION				0x14
+#define  XPOS_MASK				GENMASK(15, 0)
+#define  XPOS(x)				FIELD_PREP(XPOS_MASK, (x))
+#define  YPOS_MASK				GENMASK(31, 16)
+#define  YPOS(x)				FIELD_PREP(YPOS_MASK, (x))
+
+enum dc_lb_blend_func {
+	DC_LAYERBLEND_BLEND_ZERO,
+	DC_LAYERBLEND_BLEND_ONE,
+	DC_LAYERBLEND_BLEND_PRIM_ALPHA,
+	DC_LAYERBLEND_BLEND_ONE_MINUS_PRIM_ALPHA,
+	DC_LAYERBLEND_BLEND_SEC_ALPHA,
+	DC_LAYERBLEND_BLEND_ONE_MINUS_SEC_ALPHA,
+	DC_LAYERBLEND_BLEND_CONST_ALPHA,
+	DC_LAYERBLEND_BLEND_ONE_MINUS_CONST_ALPHA,
+};
+
+enum dc_lb_shadow_sel {
+	BOTH = 0x2,
+};
+
+static const struct dc_subdev_info dc_lb_info[] = {
+	{ .reg_start = 0x56180ba0, .id = 0, },
+	{ .reg_start = 0x56180bc0, .id = 1, },
+	{ .reg_start = 0x56180be0, .id = 2, },
+	{ .reg_start = 0x56180c00, .id = 3, },
+};
+
+static const struct regmap_range dc_lb_pec_regmap_access_ranges[] = {
+	regmap_reg_range(PIXENGCFG_DYNAMIC, PIXENGCFG_DYNAMIC),
+};
+
+static const struct regmap_access_table dc_lb_pec_regmap_access_table = {
+	.yes_ranges = dc_lb_pec_regmap_access_ranges,
+	.n_yes_ranges = ARRAY_SIZE(dc_lb_pec_regmap_access_ranges),
+};
+
+static const struct regmap_config dc_lb_pec_regmap_config = {
+	.name = "pec",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.wr_table = &dc_lb_pec_regmap_access_table,
+	.rd_table = &dc_lb_pec_regmap_access_table,
+	.max_register = PIXENGCFG_DYNAMIC,
+};
+
+static const struct regmap_range dc_lb_regmap_ranges[] = {
+	regmap_reg_range(STATICCONTROL, POSITION),
+};
+
+static const struct regmap_access_table dc_lb_regmap_access_table = {
+	.yes_ranges = dc_lb_regmap_ranges,
+	.n_yes_ranges = ARRAY_SIZE(dc_lb_regmap_ranges),
+};
+
+static const struct regmap_config dc_lb_cfg_regmap_config = {
+	.name = "cfg",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.wr_table = &dc_lb_regmap_access_table,
+	.rd_table = &dc_lb_regmap_access_table,
+	.max_register = POSITION,
+};
+
+static const enum dc_link_id prim_sels[] = {
+	/* common options */
+	LINK_ID_NONE,
+	LINK_ID_CONSTFRAME0,
+	LINK_ID_CONSTFRAME1,
+	LINK_ID_CONSTFRAME4,
+	LINK_ID_CONSTFRAME5,
+	/*
+	 * special options:
+	 * layerblend(n) has n special options,
+	 * from layerblend0 to layerblend(n - 1), e.g.,
+	 * layerblend3 has 3 special options -
+	 * layerblend0/1/2.
+	 */
+	LINK_ID_LAYERBLEND0,
+	LINK_ID_LAYERBLEND1,
+	LINK_ID_LAYERBLEND2,
+	LINK_ID_LAYERBLEND3,
+};
+
+static const enum dc_link_id sec_sels[] = {
+	LINK_ID_NONE,
+	LINK_ID_FETCHWARP2,
+	LINK_ID_FETCHLAYER0,
+};
+
+enum dc_link_id dc_lb_get_link_id(struct dc_lb *lb)
+{
+	return lb->link;
+}
+
+void dc_lb_pec_dynamic_prim_sel(struct dc_lb *lb, enum dc_link_id prim)
+{
+	int fixed_sels_num = ARRAY_SIZE(prim_sels) - 4;
+	int i;
+
+	for (i = 0; i < fixed_sels_num + lb->id; i++) {
+		if (prim_sels[i] == prim) {
+			regmap_write_bits(lb->reg_pec, PIXENGCFG_DYNAMIC,
+					  PIXENGCFG_DYNAMIC_PRIM_SEL_MASK,
+					  PIXENGCFG_DYNAMIC_PRIM_SEL(prim));
+			return;
+		}
+	}
+
+	dev_warn(lb->dev, "invalid primary input selection:%d\n", prim);
+}
+
+void dc_lb_pec_dynamic_sec_sel(struct dc_lb *lb, enum dc_link_id sec)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(sec_sels); i++) {
+		if (sec_sels[i] == sec) {
+			regmap_write_bits(lb->reg_pec, PIXENGCFG_DYNAMIC,
+					  PIXENGCFG_DYNAMIC_SEC_SEL_MASK,
+					  PIXENGCFG_DYNAMIC_SEC_SEL(sec));
+			return;
+		}
+	}
+
+	dev_warn(lb->dev, "invalid secondary input selection:%d\n", sec);
+}
+
+void dc_lb_pec_clken(struct dc_lb *lb, enum dc_pec_clken clken)
+{
+	regmap_write_bits(lb->reg_pec, PIXENGCFG_DYNAMIC, CLKEN_MASK,
+			  CLKEN(clken));
+}
+
+static inline void dc_lb_enable_shden(struct dc_lb *lb)
+{
+	regmap_write_bits(lb->reg_cfg, STATICCONTROL, SHDEN, SHDEN);
+}
+
+static inline void dc_lb_shdtoksel(struct dc_lb *lb, enum dc_lb_shadow_sel sel)
+{
+	regmap_write_bits(lb->reg_cfg, STATICCONTROL, SHDTOKSEL_MASK,
+			  SHDTOKSEL(sel));
+}
+
+static inline void dc_lb_shdldsel(struct dc_lb *lb, enum dc_lb_shadow_sel sel)
+{
+	regmap_write_bits(lb->reg_cfg, STATICCONTROL, SHDLDSEL_MASK,
+			  SHDLDSEL(sel));
+}
+
+void dc_lb_mode(struct dc_lb *lb, enum dc_lb_mode mode)
+{
+	regmap_write_bits(lb->reg_cfg, CONTROL, CTRL_MODE_MASK, mode);
+}
+
+static inline void dc_lb_blendcontrol(struct dc_lb *lb)
+{
+	u32 val = PRIM_A_BLD_FUNC(DC_LAYERBLEND_BLEND_ZERO) |
+		  SEC_A_BLD_FUNC(DC_LAYERBLEND_BLEND_ZERO) |
+		  PRIM_C_BLD_FUNC(DC_LAYERBLEND_BLEND_ZERO) |
+		  SEC_C_BLD_FUNC(DC_LAYERBLEND_BLEND_CONST_ALPHA) |
+		  ALPHA(DRM_BLEND_ALPHA_OPAQUE >> 8);
+
+	regmap_write(lb->reg_cfg, BLENDCONTROL, val);
+}
+
+void dc_lb_position(struct dc_lb *lb, int x, int y)
+{
+	regmap_write(lb->reg_cfg, POSITION, XPOS(x) | YPOS(y));
+}
+
+int dc_lb_get_id(struct dc_lb *lb)
+{
+	return lb->id;
+}
+
+void dc_lb_init(struct dc_lb *lb)
+{
+	dc_lb_pec_dynamic_prim_sel(lb, LINK_ID_NONE);
+	dc_lb_pec_dynamic_sec_sel(lb, LINK_ID_NONE);
+	dc_lb_pec_clken(lb, CLKEN_DISABLE);
+	dc_lb_shdldsel(lb, BOTH);
+	dc_lb_shdtoksel(lb, BOTH);
+	dc_lb_blendcontrol(lb);
+	dc_lb_enable_shden(lb);
+}
+
+static int dc_lb_bind(struct device *dev, struct device *master, void *data)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct dc_drm_device *dc_drm = data;
+	struct resource *res_pec;
+	void __iomem *base_pec;
+	void __iomem *base_cfg;
+	struct dc_lb *lb;
+
+	lb = devm_kzalloc(dev, sizeof(*lb), GFP_KERNEL);
+	if (!lb)
+		return -ENOMEM;
+
+	base_pec = devm_platform_get_and_ioremap_resource(pdev, 0, &res_pec);
+	if (IS_ERR(base_pec))
+		return PTR_ERR(base_pec);
+
+	base_cfg = devm_platform_ioremap_resource_byname(pdev, "cfg");
+	if (IS_ERR(base_cfg))
+		return PTR_ERR(base_cfg);
+
+	lb->reg_pec = devm_regmap_init_mmio(dev, base_pec,
+					    &dc_lb_pec_regmap_config);
+	if (IS_ERR(lb->reg_pec))
+		return PTR_ERR(lb->reg_pec);
+
+	lb->reg_cfg = devm_regmap_init_mmio(dev, base_cfg,
+					    &dc_lb_cfg_regmap_config);
+	if (IS_ERR(lb->reg_cfg))
+		return PTR_ERR(lb->reg_cfg);
+
+	lb->id = dc_subdev_get_id(dc_lb_info, ARRAY_SIZE(dc_lb_info), res_pec);
+	if (lb->id < 0) {
+		dev_err(dev, "failed to get instance number: %d\n", lb->id);
+		return lb->id;
+	}
+
+	lb->dev = dev;
+	lb->link = LINK_ID_LAYERBLEND0 + lb->id;
+
+	dc_drm->lb[lb->id] = lb;
+
+	return 0;
+}
+
+static const struct component_ops dc_lb_ops = {
+	.bind = dc_lb_bind,
+};
+
+static int dc_lb_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	ret = component_add(&pdev->dev, &dc_lb_ops);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to add component\n");
+
+	return 0;
+}
+
+static void dc_lb_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &dc_lb_ops);
+}
+
+static const struct of_device_id dc_lb_dt_ids[] = {
+	{ .compatible = "fsl,imx8qxp-dc-layerblend" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, dc_lb_dt_ids);
+
+struct platform_driver dc_lb_driver = {
+	.probe = dc_lb_probe,
+	.remove = dc_lb_remove,
+	.driver = {
+		.name = "imx8-dc-layerblend",
+		.suppress_bind_attrs = true,
+		.of_match_table = dc_lb_dt_ids,
+	},
+};
diff --git a/drivers/gpu/drm/imx/dc/dc-pe.c b/drivers/gpu/drm/imx/dc/dc-pe.c
new file mode 100644
index 000000000000..6676c22f3f45
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-pe.c
@@ -0,0 +1,158 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/clk.h>
+#include <linux/component.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/pm_runtime.h>
+
+#include "dc-drv.h"
+#include "dc-fu.h"
+#include "dc-pe.h"
+
+static int dc_pe_bind(struct device *dev, struct device *master, void *data)
+{
+	struct dc_drm_device *dc_drm = data;
+	struct dc_pe *pe;
+	int ret;
+
+	pe = devm_kzalloc(dev, sizeof(*pe), GFP_KERNEL);
+	if (!pe)
+		return -ENOMEM;
+
+	pe->clk_axi = devm_clk_get(dev, NULL);
+	if (IS_ERR(pe->clk_axi))
+		return dev_err_probe(dev, PTR_ERR(pe->clk_axi),
+				     "failed to get AXI clock\n");
+
+	pe->dev = dev;
+
+	dev_set_drvdata(dev, pe);
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
+	dc_drm->pe = pe;
+
+	return 0;
+}
+
+/*
+ * It's possible to get the child device pointers from the child component
+ * bind callbacks, but it depends on the component helper behavior to bind
+ * the pixel engine component first.  To avoid the dependency, post bind to
+ * get the pointers from dc_drm in a safe manner.
+ */
+void dc_pe_post_bind(struct dc_drm_device *dc_drm)
+{
+	struct dc_pe *pe = dc_drm->pe;
+	int i;
+
+	for (i = 0; i < DC_DISPLAYS; i++) {
+		pe->cf_safe[i] = dc_drm->cf_safe[i];
+		pe->cf_cont[i] = dc_drm->cf_cont[i];
+		pe->ed_safe[i] = dc_drm->ed_safe[i];
+		pe->ed_cont[i] = dc_drm->ed_cont[i];
+	}
+
+	for (i = 0; i < DC_DISP_FU_CNT; i++)
+		pe->fu_disp[i] = dc_drm->fu_disp[i];
+
+	for (i = 0; i < DC_LB_CNT; i++)
+		pe->lb[i] = dc_drm->lb[i];
+}
+
+static const struct component_ops dc_pe_ops = {
+	.bind = dc_pe_bind,
+};
+
+static int dc_pe_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	ret = devm_of_platform_populate(&pdev->dev);
+	if (ret < 0)
+		return ret;
+
+	ret = component_add(&pdev->dev, &dc_pe_ops);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to add component\n");
+
+	return 0;
+}
+
+static void dc_pe_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &dc_pe_ops);
+}
+
+static int dc_pe_runtime_suspend(struct device *dev)
+{
+	struct dc_pe *pe = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(pe->clk_axi);
+
+	return 0;
+}
+
+static int dc_pe_runtime_resume(struct device *dev)
+{
+	struct dc_pe *pe = dev_get_drvdata(dev);
+	int i, ret;
+
+	ret = clk_prepare_enable(pe->clk_axi);
+	if (ret) {
+		dev_err(dev, "failed to enable AXI clock: %d\n", ret);
+		return ret;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(pe->cf_safe); i++)
+		dc_cf_init(pe->cf_safe[i]);
+
+	for (i = 0; i < ARRAY_SIZE(pe->cf_cont); i++)
+		dc_cf_init(pe->cf_cont[i]);
+
+	for (i = 0; i < ARRAY_SIZE(pe->ed_safe); i++)
+		dc_ed_init(pe->ed_safe[i]);
+
+	for (i = 0; i < ARRAY_SIZE(pe->ed_cont); i++)
+		dc_ed_init(pe->ed_cont[i]);
+
+	for (i = 0; i < ARRAY_SIZE(pe->fu_disp); i++)
+		pe->fu_disp[i]->ops.init(pe->fu_disp[i]);
+
+	for (i = 0; i < ARRAY_SIZE(pe->lb); i++)
+		dc_lb_init(pe->lb[i]);
+
+	return 0;
+}
+
+static const struct dev_pm_ops dc_pe_pm_ops = {
+	RUNTIME_PM_OPS(dc_pe_runtime_suspend, dc_pe_runtime_resume, NULL)
+};
+
+static const struct of_device_id dc_pe_dt_ids[] = {
+	{ .compatible = "fsl,imx8qxp-dc-pixel-engine", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, dc_pe_dt_ids);
+
+struct platform_driver dc_pe_driver = {
+	.probe = dc_pe_probe,
+	.remove = dc_pe_remove,
+	.driver = {
+		.name = "imx8-dc-pixel-engine",
+		.suppress_bind_attrs = true,
+		.of_match_table = dc_pe_dt_ids,
+		.pm = pm_sleep_ptr(&dc_pe_pm_ops),
+	},
+};
diff --git a/drivers/gpu/drm/imx/dc/dc-pe.h b/drivers/gpu/drm/imx/dc/dc-pe.h
new file mode 100644
index 000000000000..f5e01a6eb9e9
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-pe.h
@@ -0,0 +1,101 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2024 NXP
+ */
+
+#ifndef __DC_PIXEL_ENGINE_H__
+#define __DC_PIXEL_ENGINE_H__
+
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/regmap.h>
+
+#include "dc-de.h"
+
+#define SHDEN			BIT(0)
+
+#define CLKEN_MASK_SHIFT	24
+#define CLKEN_MASK		(0x3 << CLKEN_MASK_SHIFT)
+#define CLKEN(n)		((n) << CLKEN_MASK_SHIFT)
+
+#define DC_DISP_FU_CNT		2
+#define DC_LB_CNT		4
+
+enum dc_link_id {
+	LINK_ID_NONE		= 0x00,
+	LINK_ID_CONSTFRAME0	= 0x0c,
+	LINK_ID_CONSTFRAME4	= 0x0e,
+	LINK_ID_CONSTFRAME1	= 0x10,
+	LINK_ID_CONSTFRAME5	= 0x12,
+	LINK_ID_FETCHWARP2	= 0x14,
+	LINK_ID_FETCHLAYER0	= 0x1a,
+	LINK_ID_LAYERBLEND0	= 0x21,
+	LINK_ID_LAYERBLEND1	= 0x22,
+	LINK_ID_LAYERBLEND2	= 0x23,
+	LINK_ID_LAYERBLEND3	= 0x24,
+};
+
+enum dc_lb_mode {
+	LB_NEUTRAL,	/* Output is same as primary input. */
+	LB_BLEND,
+};
+
+enum dc_pec_clken {
+	CLKEN_DISABLE,
+	CLKEN_AUTOMATIC,
+};
+
+struct dc_cf {
+	struct regmap *reg_cfg;
+	enum dc_link_id link;
+};
+
+struct dc_ed {
+	struct device *dev;
+	struct regmap *reg_pec;
+	struct regmap *reg_cfg;
+	int irq_shdload;
+};
+
+struct dc_lb {
+	struct device *dev;
+	struct regmap *reg_pec;
+	struct regmap *reg_cfg;
+	int id;
+	enum dc_link_id link;
+};
+
+struct dc_pe {
+	struct device *dev;
+	struct clk *clk_axi;
+	struct dc_cf *cf_safe[DC_DISPLAYS];
+	struct dc_cf *cf_cont[DC_DISPLAYS];
+	struct dc_ed *ed_safe[DC_DISPLAYS];
+	struct dc_ed *ed_cont[DC_DISPLAYS];
+	struct dc_fu *fu_disp[DC_DISP_FU_CNT];
+	struct dc_lb *lb[DC_LB_CNT];
+};
+
+/* Constant Frame Unit */
+enum dc_link_id dc_cf_get_link_id(struct dc_cf *cf);
+void dc_cf_framedimensions(struct dc_cf *cf, unsigned int w, unsigned int h);
+void dc_cf_constantcolor_black(struct dc_cf *cf);
+void dc_cf_constantcolor_blue(struct dc_cf *cf);
+void dc_cf_init(struct dc_cf *cf);
+
+/* External Destination Unit */
+void dc_ed_pec_src_sel(struct dc_ed *ed, enum dc_link_id src);
+void dc_ed_pec_sync_trigger(struct dc_ed *ed);
+void dc_ed_init(struct dc_ed *ed);
+
+/* Layer Blend Unit */
+enum dc_link_id dc_lb_get_link_id(struct dc_lb *lb);
+void dc_lb_pec_dynamic_prim_sel(struct dc_lb *lb, enum dc_link_id prim);
+void dc_lb_pec_dynamic_sec_sel(struct dc_lb *lb, enum dc_link_id sec);
+void dc_lb_pec_clken(struct dc_lb *lb, enum dc_pec_clken clken);
+void dc_lb_mode(struct dc_lb *lb, enum dc_lb_mode mode);
+void dc_lb_position(struct dc_lb *lb, int x, int y);
+int dc_lb_get_id(struct dc_lb *lb);
+void dc_lb_init(struct dc_lb *lb);
+
+#endif /* __DC_PIXEL_ENGINE_H__ */
-- 
2.34.1

