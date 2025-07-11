Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C03B01273
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 07:01:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EF0E10E258;
	Fri, 11 Jul 2025 05:01:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="JfIbSpF4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010070.outbound.protection.outlook.com [52.101.84.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4EF910E258
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 05:01:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bNwIxNNoC+PmTX5eksGTHN9ZTMqQIhu+5jHZmZxi5Ts4wsDufoyl26CbPgekPL0hP5SkcaX9ihxxDWOpGYU7cdE4J69tgX7JoSOhBgv7wyiASzKPQ2mUpN0AHEQFib0O84ytFIo6lyPR+LK8CY68vVk/I1d96tyrQVBUjtGTknnz7bZqLo5+W5dthDL0MdkQp44KYsmXvgwef8Zm96Nn7xBkcVkbxeXR8CjG7fOaRPEObQjxFKUqcpZFSeBDcjmOsbnEKm8NA7kGzBXIeb7aLLVNsZxuJESRVTiEnpJxcWzgRNvAR3chepgWn8Rd/UlhguMDFTTaJzmdGjtfpOlM6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ARmLy62uDsafvM9r5bpfTa77ndCypNoaJDnLvsxPx68=;
 b=F5n6gAtaZ27ujroAcfHk9j8b/wDK5XUPGU/2GwWa/flQltvnYJBw8pm1AlvBtyNCn6yi/a2NMTyZFXE73lOa9FyLGFMYlNj/pY4Jv0qSgqe+bHUGzNDi3ei78Q203Q/bReRS3HXCw5SoxlGvhFEq23gqp0FDfTxYCDsX+ETw9Z12bLBLZmwYr8HaqsdV7ZUNV6Q9VKjv+Yqs6tVVxuFtGnbns7G1nVZAi9fTwzFWcHILcBsP7EVV/tKLK0reECG64IuCQ+0ZbCqn+P4pooB6x0McNfqSRNhBmL+w/i7vBZ/6zYEj5Pwttuws8Bn5PxPwQ5sF5w6aS8sgs8j1GfG6Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ARmLy62uDsafvM9r5bpfTa77ndCypNoaJDnLvsxPx68=;
 b=JfIbSpF4BiUMldvSnzE4YWz1qU/hzxfwchzeNxBEKGo7weFAxZdgE7U4nYI4PT1Odlstey7NJeNi3Rz9Mv30xehBDgTtVL3PF25v6uHM4tVfdpiro+chS7WFS+wOClrkqI8BAiuj+I60Tv4hQJQcod3ahv8QjZc/As/Cv5gscK57WdXxrGJPMh4k6MfJMJFD1FZlnuu4+cTIOEk37SvMGz4Ih4KIjx82gMUmkX18Kgj8rE48uLajX8rq8LlnGxop6VYUkmanLCnciPPoA7WhBkdZuxqZBN30NixCvRy+pZKy/KGdLDRT/uO1gY+nG2LVWWmVvzu4qv63rd9BSlhl0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB8PR04MB6796.eurprd04.prod.outlook.com (2603:10a6:10:11e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Fri, 11 Jul
 2025 05:01:26 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8922.023; Fri, 11 Jul 2025
 05:01:26 +0000
Date: Fri, 11 Jul 2025 01:01:20 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: imx@lists.linux.dev, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
 Sandor Yu <sandor.yu@nxp.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 6/8] drm/imx: Add support for i.MX94 DCIF
Message-ID: <aHCaoDzvevch5KNU@lizhi-Precision-Tower-5810>
References: <20250709122332.2874632-1-laurentiu.palcu@oss.nxp.com>
 <20250709122332.2874632-7-laurentiu.palcu@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709122332.2874632-7-laurentiu.palcu@oss.nxp.com>
X-ClientProxiedBy: AM9P250CA0004.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::9) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB8PR04MB6796:EE_
X-MS-Office365-Filtering-Correlation-Id: e3acb32e-465c-4e1e-4a62-08ddc037fce7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|366016|7416014|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WiAsOjSf9KUCs5f3r+iOB3VgZxcEtmGgMVg0UInm/G2r7E4EJgM/aiHxmcfK?=
 =?us-ascii?Q?TZoMk7y9iJ5lCSPnC+Wp4Giy1AsY9mCp7kRbbHqz1RuMauv8Mps215fSIdYV?=
 =?us-ascii?Q?SSbGvxD6T7zwzsr7Bpxj5HA4hLl6xACsr2J84Mzyu5zOvjC/tBpViIfzENkK?=
 =?us-ascii?Q?PJ+1SoqZYEeWXCzZsgSS6+WoiUn+Fr971KpDYwfHbJbyLMJFQws03N55MfKY?=
 =?us-ascii?Q?1xPWW5kWdBcjFKp/mQBpmSx4XPKEk0vQl2ZzuqJI8Vn8IfBQnPx2/FMBA1JB?=
 =?us-ascii?Q?sKy2bcowRSzuqGaBsTgJ3kunAY7qPaZVfGgzRQtpoLWS3vdPfY+5OGzrz0zB?=
 =?us-ascii?Q?RqjbfwLTbepCucOTIR71lPyiNxUho8e8irODjVdTUqLwgPe3kp80Qs425IFo?=
 =?us-ascii?Q?Hiteog50B610tBnNLtp7EX8gwj4eBb4IR48Z/b+SEK3ehaAS8/jAp8s1/Nfc?=
 =?us-ascii?Q?MjWL1uBbdNG/h7LT/nxBpIQI9zT0ATu3fwhjCzTXBXqFzCj0PvL9eIwsCF5Q?=
 =?us-ascii?Q?F8DPWIcWCFY6UDzzm+sLNuU6Ul6hpD8UuqcTgkvW+VM1K7JpNcqIkI6wj20D?=
 =?us-ascii?Q?e62CkTiVbUzAbA8eaCen1vE7IBD7OwM2rVN1amx3AZWOH0UrjW8q2nUKASDQ?=
 =?us-ascii?Q?DG21XKuIrW+Vhp1P75PhDlLEf5TtIoaDUSNzvKEoHMyNVnfuJIIvMJG4osmj?=
 =?us-ascii?Q?EE2GWdLeGO9nHzX2KKOgsfPaRMwZDAa+eBbMAiYHAJ84PjkJlyLc6WnsZTPm?=
 =?us-ascii?Q?pWM1KAYsPNrW5V4XK4HuFVMSqG4Ozm0pXBHQPUSPazbAcTrrGna/AdRDKMSH?=
 =?us-ascii?Q?W3MX960DPYJDpt31dHreBuP1cZN6t+0J9Fgy2kS5Zn4kw1D+qXHKYRrq5vsg?=
 =?us-ascii?Q?7n+zD7blnbkJ0Vgie2miGwu2fNFr3wNfCHKcMVO1nPNZmnJpiSyzoiQmGxTk?=
 =?us-ascii?Q?CSE+895iDL4Dbvjg8w5IPQMLf3Xqv2k5dtrV4W4ZqZMCvl3LyHBhjJhjW0Wl?=
 =?us-ascii?Q?ufTfo0HT0r6/QMFGqkWqeJPsMdcAxShS1nSoK1WflYg8ePjJLLU+RPb9/DHT?=
 =?us-ascii?Q?1YHMLrUQwpheNbQhACmGZWNcKKSORn0SW49rx6wce9jSgK9rxjDSOXVgWilL?=
 =?us-ascii?Q?9Ph/h3vbIMKQ439J3EeXg8EZlfExzFAIxnFSDpURwbCZfxnTmW8UbPlzXV2Q?=
 =?us-ascii?Q?fSznhw8Scga6nBOL8mSmxpzGtQPDS4w5l4qS5EAmlyI25RjbHIpWcpVMu/Dq?=
 =?us-ascii?Q?Jo4qQSlF5SumkvD4sESUGZvinSo+/IYREX2kHjioyoyjhPey27SxcJUFBO4o?=
 =?us-ascii?Q?TNiwJ4VWm/qjomXf74aS9vxFkavM1PJMztj5CP2KpSLbGywBxB5aOTZ8Wgbd?=
 =?us-ascii?Q?0uuSVzqcEIoqkZDSIemg8eFYMFLcrrLgYA2FyU2SpPWqa1LnMp/SUq7Oc4Ch?=
 =?us-ascii?Q?be/8QGUqwbuXmKrv7bD+c+Kr2sTo7r3cZyzOhutSx3O/N88eIaoyBu5jQfB4?=
 =?us-ascii?Q?CzrTHutNhxNBl9o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(366016)(7416014)(376014)(52116014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iriBhPCdMdyFnsfwJyjjQju5HbfYeFLCj5lVIiBgo+l084isbDYNQ1011h7Z?=
 =?us-ascii?Q?N/dpCk0W4VcT3U+n3WprP59hVy5QvX2CkhmXeOR5QmfHPzubMYNJ6CtbD7/n?=
 =?us-ascii?Q?1tAIaQdT/4F7qQxMJkh2tab37DES8H3QYrLv+EoY7asyR4r5+S7PFHtQQ5H9?=
 =?us-ascii?Q?ln/CcPTTvxIfbipIk97IpG97VwtMR8OQEJn2Bq5vNWE4uNWeTNz+8dvZD9tK?=
 =?us-ascii?Q?kqHHytUybcESYxefumg6FbSRrPVksY4YUTKgne2wQnLe00GEf1ZbuyXZy1XK?=
 =?us-ascii?Q?7PRH2yA4sydJ5CcY+UxV8lB52D4Nhnl2JE/ZJ8HA1/WcUgJ/MxC4d1osM4ET?=
 =?us-ascii?Q?o2TO07ZUbQwV5cTibwAj9cLZ/LyXknZU0VUE+y5MrBN7GwEy4ZXVRjr4RGQS?=
 =?us-ascii?Q?uUZvWB5DsJY/kp6UrorZLBwmB3Ar9gTWsk9eLvLlcjv+8/N+cEIrrsEVXWOq?=
 =?us-ascii?Q?G2Yuj2UDYETog2vm0xcAO910vDpw8gauRnJ8K8XuX7vp+BBcWbIqJTxA8dvp?=
 =?us-ascii?Q?nUP6qMkNPmIo1iMLEunUn6AjZjCqDtRvrVKhh9XMQsbaAcgi29cThPr0yJfb?=
 =?us-ascii?Q?l6Uo7x7WcF2nxyTtsHAdXkuUfS69gD7T1Djx6rhSEqPtpTQ0ps+wh2HM3f/t?=
 =?us-ascii?Q?ZEZSpTFUkIKoeqcEz9s5zE2f7TDxlAZz0+epIjz7aeiGA6sogDMUZLF3W8qS?=
 =?us-ascii?Q?66teRtHl6RE1Di3fhqs2Llm+46tT+lBA9HNu5DY+sRh+JcF49jN+OThGn34M?=
 =?us-ascii?Q?hafGEw7iaFfbqWFVSYigeSy6oVv/c0KK2+6OuzdZFnSCUh/Gdlz9y76ytZu4?=
 =?us-ascii?Q?3P415Wsh2fGHINWYFH6JUM/zTG0sl/k/Im3atTF4W7PZCjEYj1WLqNYjxz/B?=
 =?us-ascii?Q?5YIVmg01WhYBO6nALMBu7+jBHfNYa2w70JNYDyoYnnXpz5xRppcH5a5U/xSy?=
 =?us-ascii?Q?MzNKpxP09NN8aAMZVEmfLlMlbJRjfGLfchC8velWs4vM7gsbgu0ZLbxUJq0q?=
 =?us-ascii?Q?b7Jd0xjEWzeU3EoMRlFpHMDQepGseVwPkI2b12zWxB0JtEd4L2PPuLDlNfW7?=
 =?us-ascii?Q?27x8mTiH++mjL69S9zdLDA0zVxbe6wzhC1yZFN02QY7U319V8nLP7kR6be3e?=
 =?us-ascii?Q?2iWpKmfehb2+dYPx4FG+62Cn3ucEf7cBhO1YMLkdemmD726vVWgMgOeS9wjl?=
 =?us-ascii?Q?grHQln9UiBreLSxFKfPb/CgDOOZx9R56WdEkX6TU2VX1ZJh2SHbyRwSri6t4?=
 =?us-ascii?Q?KCSjdUXuRj+dtli74HSUR743ypbZTMHcXNtaOgpVZzMxnkJsVsq/W1mKZyTH?=
 =?us-ascii?Q?xR7xUtC+QXT8xgkNRZTf4+b2pIBYwrhGIoT61zjCXAaR49/iPF4yt3u2V2Jb?=
 =?us-ascii?Q?CCb6D+gtxmeUz8hbHzz+cRukUWdTC/Uxt/3BVccsItpM2B0b/rPiabZtBr9+?=
 =?us-ascii?Q?X15L2XMNtSxHrD2kjiAa5sNKt1wY/3pTNXsAL89qhvUSpPDEfdH+27v5dp+O?=
 =?us-ascii?Q?zNmmjPDVagZiJRMGmuTYzfFrY25F/X5NdIoDQ3XkcEruh1JTvYY6lbIDli/q?=
 =?us-ascii?Q?N3IUdGGfBn0YKAU0o8KoJ7w6uynrtu8HSKRTcY7s?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3acb32e-465c-4e1e-4a62-08ddc037fce7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 05:01:25.9240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2GfvndiPkr+LDNB7ACO8TsrSqcY5m3kEbgmryqGHTqPTnmN/ncCxLu5FkozhcuZisbHznoHFMXJM7PMeu6B/wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6796
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

On Wed, Jul 09, 2025 at 03:23:25PM +0300, Laurentiu Palcu wrote:
> From: Sandor Yu <sandor.yu@nxp.com>
>
> This patch adds support for the i.MX94 Display Control Interface.

Needn't word "this patch"

Can you list feature here?

>
> Signed-off-by: Sandor Yu <sandor.yu@nxp.com>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---
...
> +static int
> +dcif_crc_parse_source(const char *source_name, enum dcif_crc_source *s,
> +		      struct drm_rect *roi)
> +{
> +	static const char roi_prefix[] = "roi:";
> +
> +	if (!source_name) {
> +		*s = DCIF_CRC_SRC_NONE;
> +	} else if (!strcmp(source_name, "auto")) {
> +		*s = DCIF_CRC_SRC_FRAME;
> +	} else if (strstarts(source_name, roi_prefix)) {
> +		char *options, *opt;
> +		int len = strlen(roi_prefix);
> +		int params[4];
> +		int i = 0, ret;
> +
> +		options = kstrdup(source_name + len, GFP_KERNEL);

where free options?

> +
> +		while ((opt = strsep(&options, ",")) != NULL) {
> +			if (i > 3)
> +				return -EINVAL;
> +
> +			ret = kstrtouint(opt, 10, &params[i]);
> +			if (ret < 0)
> +				return ret;
> +
> +			if (params[i] < 0)
> +				return -EINVAL;
> +
> +			i++;
> +		}
....
> +	/* Perform an atomic commit to set the CRC source. */
> +	drm_modeset_acquire_init(&ctx, 0);
> +
> +	state = drm_atomic_state_alloc(crtc->dev);
> +	if (!state) {
> +		ret = -ENOMEM;
> +		goto unlock;
> +	}
> +
> +	state->acquire_ctx = &ctx;
> +
> +retry:
> +	crtc_state = drm_atomic_get_crtc_state(state, crtc);
> +	if (!IS_ERR(crtc_state)) {
> +		struct dcif_crtc_state *dcif_crtc_state;
> +
> +		dcif_crtc_state = to_dcif_crtc_state(crtc_state);
> +
> +		dcif_crtc_state->crc.source = source;
> +		dcif_copy_roi(&roi, &dcif_crtc_state->crc.roi);
> +
> +		ret = drm_atomic_commit(state);
> +	} else {
> +		ret = PTR_ERR(crtc_state);
> +	}
> +
> +	if (ret == -EDEADLK) {
> +		drm_atomic_state_clear(state);
> +		drm_modeset_backoff(&ctx);
> +		goto retry;

Need max retry time, otherwise may dead loop here.

> +	}
> +
> +	drm_atomic_state_put(state);
> +
> +unlock:
> +	drm_modeset_drop_locks(&ctx);
> +	drm_modeset_acquire_fini(&ctx);
> +
> +	return ret;
> +}
> +
> diff --git a/drivers/gpu/drm/imx/dcif/dcif-crc.h b/drivers/gpu/drm/imx/dcif/dcif-crc.h
> new file mode 100644
> index 0000000000000..ea1b18362a344
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dcif/dcif-crc.h
> @@ -0,0 +1,52 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
....
> +
> +static void dcif_crtc_atomic_disable(struct drm_crtc *crtc,
> +				     struct drm_atomic_state *state)
> +{
> +	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
> +	struct dcif_crtc_state *dcif_crtc_state = to_dcif_crtc_state(crtc_state);
> +	struct dcif_dev *dcif = crtc_to_dcif_dev(crtc);
> +	struct drm_device *drm = crtc->dev;
> +
> +	if (dcif->has_crc && dcif_crtc_state->crc.source != DCIF_CRC_SRC_NONE)
> +		dcif_crtc_disable_crc_source(dcif, 0);
> +
> +	dcif_disable_controller(dcif);
> +	dcif_disable_plane_panic(dcif);
> +
> +	drm_crtc_vblank_off(crtc);
> +
> +	pm_runtime_put_sync(drm->dev);
> +
> +	spin_lock_irq(&crtc->dev->event_lock);

suggest use scope_guard(spin_lock_irq)(&crtc->dev->event_lock)

check other place.

> +	if (crtc->state->event && !crtc->state->active) {
> +		drm_crtc_send_vblank_event(crtc, crtc->state->event);
> +		crtc->state->event = NULL;
> +	}
> +	spin_unlock_irq(&crtc->dev->event_lock);
> +}
> +
....
> +
> +static int dcif_probe(struct platform_device *pdev)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +	struct dcif_dev *dcif;
> +	struct drm_device *drm;
> +	int ret;
> +	int i;
> +
> +	if (!pdev->dev.of_node)
> +		return -ENODEV;
> +
> +	dcif = devm_drm_dev_alloc(&pdev->dev, &dcif_driver, struct dcif_dev, drm);
> +	if (IS_ERR(dcif))
> +		return PTR_ERR(dcif);
> +
> +	/* CPU 0 domain for interrupt control */
> +	dcif->cpu_domain = DCIF_CPU_DOMAIN;
> +
> +	drm = &dcif->drm;
> +	dev_set_drvdata(&pdev->dev, dcif);
> +
> +	dcif->reg_base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(dcif->reg_base))
> +		return dev_err_probe(drm->dev, PTR_ERR(dcif->reg_base),
> +				     "failed to get reg base\n");
> +
> +	dcif->irq[0] = platform_get_irq(pdev, 0);
> +	if (dcif->irq[0] < 0)
> +		return dev_err_probe(drm->dev, dcif->irq[0],
> +				     "failed to get domain0 irq\n");
> +
> +	dcif->irq[1] = platform_get_irq(pdev, 1);
> +	if (dcif->irq[1] < 0)
> +		return dev_err_probe(drm->dev, dcif->irq[1],
> +				     "failed to get domain1 irq\n");
> +
> +	dcif->irq[2] = platform_get_irq(pdev, 2);
> +	if (dcif->irq[2] < 0)
> +		return dev_err_probe(drm->dev, dcif->irq[2],
> +				     "failed to get domain2 irq\n");

can you use loop for above 3 irqs.

> +
> +	dcif->blkctrl_regmap = syscon_regmap_lookup_by_phandle(np, "nxp,blk-ctrl");
> +	if (IS_ERR(dcif->blkctrl_regmap))
> +		return dev_err_probe(drm->dev, PTR_ERR(dcif->blkctrl_regmap),
> +				     "failed to get blk-ctrl regmap\n");

You just set QOS value by blkctrl_regmap. Is it possible to set it blk-ctrl
drivers? Or do it when power on the power domain to avoid use customer's
syscon to other nodes.

Frank

> +
> +	dcif->regmap = devm_regmap_init_mmio(drm->dev, dcif->reg_base, &dcif_regmap_config);
> +	if (IS_ERR(dcif->regmap))
> +		return dev_err_probe(drm->dev, PTR_ERR(dcif->regmap),
> +				     "failed to init DCIF regmap\n");
> +
> +	dcif->num_clks = ARRAY_SIZE(dcif_clks);
> +	dcif->clks = devm_kcalloc(drm->dev, dcif->num_clks, sizeof(*dcif->clks), GFP_KERNEL);
> +	if (!dcif->clks)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < dcif->num_clks; i++)
> +		dcif->clks[i].id = dcif_clks[i];
> +
> +	ret = devm_clk_bulk_get(drm->dev, dcif->num_clks, dcif->clks);
> +	if (ret)
> +		return dev_err_probe(drm->dev, ret, "cannot get required clocks\n");
> +
> +	ret = dma_set_mask_and_coherent(drm->dev, DMA_BIT_MASK(32));
> +	if (ret)
> +		return dev_err_probe(drm->dev, ret, "failed to set dma mask and coherent\n");

When DMA_BIT_MASK(32) > 32, never return failure. Needn't check this
return value.

> +
> +	pm_runtime_enable(drm->dev);

devm_pm_runtime_enable()

> +
> +	ret = devm_request_irq(drm->dev, dcif->irq[dcif->cpu_domain],
> +			       dcif_irq_handler, 0, drm->driver->name, drm);
> +	if (ret < 0) {
> +		dev_err(drm->dev, "failed to install IRQ handler: %d\n", ret);
> +		goto err_irq_install;
> +	}
> +
> +	dcif_read_chip_info(dcif);
> +
> +	ret = dcif_kms_prepare(dcif);
> +	if (ret)
> +		goto err_irq_install;
> +
> +	ret = drm_dev_register(drm, 0);
> +	if (ret) {
> +		dev_err(drm->dev, "failed to register drm device: %d\n", ret);
> +		goto err_register;
> +	}
> +
> +	drm_client_setup(drm, NULL);
> +
> +	return 0;
> +
> +err_register:
> +	drm_kms_helper_poll_fini(drm);

use devm_add_action_or_reset to avoid goto here.

> +err_irq_install:
> +	pm_runtime_disable(drm->dev);
> +	return ret;
> +}
> +
> +static void dcif_remove(struct platform_device *pdev)
> +{
> +	struct dcif_dev *dcif = dev_get_drvdata(&pdev->dev);
> +	struct drm_device *drm = &dcif->drm;
> +
> +	drm_dev_unregister(drm);
> +
> +	drm_kms_helper_poll_fini(drm);
> +
> +	drm_atomic_helper_shutdown(drm);
> +
> +	pm_runtime_disable(drm->dev);
> +}
> +
> +static int dcif_runtime_suspend(struct device *dev)
> +{
> +	struct dcif_dev *dcif = dev_get_drvdata(dev);
> +
> +	clk_bulk_disable_unprepare(dcif->num_clks, dcif->clks);
> +
> +	return 0;
> +}
> +
> +static int dcif_runtime_resume(struct device *dev)
> +{
> +	struct dcif_dev *dcif = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = clk_bulk_prepare_enable(dcif->num_clks, dcif->clks);
> +	if (ret) {
> +		dev_err(dev, "failed to enable clocks: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = dcif_set_qos(dcif);
> +	if (ret) {
> +		clk_bulk_disable_unprepare(dcif->num_clks, dcif->clks);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int dcif_suspend(struct device *dev)
> +{
> +	struct dcif_dev *dcif = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = drm_mode_config_helper_suspend(&dcif->drm);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (pm_runtime_suspended(dev))
> +		return 0;
> +
> +	return dcif_runtime_suspend(dev);
> +}
> +
> +static int dcif_resume(struct device *dev)
> +{
> +	struct dcif_dev *dcif = dev_get_drvdata(dev);
> +	int ret;
> +
> +	if (!pm_runtime_suspended(dev)) {
> +		ret = dcif_runtime_resume(dev);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return drm_mode_config_helper_resume(&dcif->drm);
> +}
> +
> +static const struct dev_pm_ops dcif_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(dcif_suspend, dcif_resume)
> +	SET_RUNTIME_PM_OPS(dcif_runtime_suspend, dcif_runtime_resume, NULL)
> +};
> +
> +static const struct of_device_id dcif_dt_ids[] = {
> +	{ .compatible = "nxp,imx94-dcif", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, dcif_dt_ids);
> +
> +static struct platform_driver dcif_platform_driver = {
> +	.probe	= dcif_probe,
> +	.remove	= dcif_remove,
> +	.driver	= {
> +		.name		= DRIVER_NAME,
> +		.of_match_table	= dcif_dt_ids,
> +		.pm		= pm_ptr(&dcif_pm_ops),
> +	},
> +};
> +module_platform_driver(dcif_platform_driver);
> +
...
> + * Copyright 2025 NXP
> + */
> +#ifndef __DCIF_REG_H__
> +#define __DCIF_REG_H__
> +
> +#include <linux/bits.h>
> +
> +/* Version ID Register */
> +#define DCIF_VER				0x0
> +
> +/* Parameter Registers */
> +#define DCIF_PAR_0				0x4
> +#define DCIF_PAR_1				0x8
> +
> +/* Display Control and Parameter Registers */
> +#define DCIF_DISP_CTRL				0x10
> +#define DCIF_DISP_PAR				0x14
> +#define DCIF_DISP_SIZE				0x18
> +
> +/* Display Status Registers */
> +#define DCIF_DISP_SR0				0x1C
> +#define DCIF_DISP_SR1				0x20
> +
> +/* Interrupt Enable and Status Registers, n=0-2*/
> +#define DCIF_IE0(n)				(0x24 + (n) * 0x10000)
> +#define DCIF_IS0(n)				(0x28 + (n) * 0x10000)
> +#define DCIF_IE1(n)				(0x2C + (n) * 0x10000)
> +#define DCIF_IS1(n)				(0x30 + (n) * 0x10000)
> +
> +/* DPI Control and Sync Parameter Registers */
> +#define DCIF_DPI_CTRL				0x40
> +#define DCIF_DPI_HSYN_PAR			0x44
> +#define DCIF_DPI_VSYN_PAR			0x48
> +#define DCIF_DPI_VSYN_HSYN_WIDTH		0x4C
> +
> +/* Control Descriptor Registers, n=0-1*/
> +#define DCIF_CTRLDESC0(n)			(0x10000 + (n) * 0x10000)
> +#define DCIF_CTRLDESC1(n)			(0x10004 + (n) * 0x10000)
> +#define DCIF_CTRLDESC2(n)			(0x10008 + (n) * 0x10000)
> +#define DCIF_CTRLDESC3(n)			(0x1000C + (n) * 0x10000)
> +#define DCIF_CTRLDESC4(n)			(0x10010 + (n) * 0x10000)
> +#define DCIF_CTRLDESC5(n)			(0x10014 + (n) * 0x10000)
> +#define DCIF_CTRLDESC6(n)			(0x10018 + (n) * 0x10000)
> +
> +/* CLUT control Register */
> +#define DCIF_CLUT_CTRL				0x1003C
> +
> +/* FIFO Panic Threshold Register, n=0-1 */
> +#define DCIF_PANIC_THRES(n)			(0x10040 + (n) * 0x10000)
> +
> +/* Layer Status Register 0, n=0-1 */
> +#define DCIF_LAYER_SR0(n)			(0x10044 + (n) * 0x10000)
> +
> +/* Color Space Conversion Control and Coefficient Registers for Layer 0 */
> +#define DCIF_CSC_CTRL_L0			0x10050
> +#define DCIF_CSC_COEF0_L0			0x10054
> +#define DCIF_CSC_COEF1_L0			0x10058
> +#define DCIF_CSC_COEF2_L0			0x1005C
> +#define DCIF_CSC_COEF3_L0			0x10060
> +#define DCIF_CSC_COEF4_L0			0x10064
> +#define DCIF_CSC_COEF5_L0			0x10068
> +
> +/* CRC Control, Threshold, and Histogram Coefficient Registers */
> +#define DCIF_CRC_CTRL				0x20100
> +#define DCIF_CRC_THRES				0x20104
> +#define DCIF_CRC_HIST_COEF			0x20108
> +#define DCIF_CRC_ERR_CNT			0x2010C
> +#define DCIF_CRC_SR				0x20110
> +#define DCIF_CRC_HIST_CNT_B(n)			(0x20114 + (n) * 4)
> +
> +/* CRC Region Position, Size, Value, and Expected Value Registers, n=0-3 */
> +#define DCIF_CRC_POS_R(n)			(0x20214 + (n) * 0x10)
> +#define DCIF_CRC_SIZE_R(n)			(0x20218 + (n) * 0x10)
> +#define DCIF_CRC_VAL_R(n)			(0x2021C + (n) * 0x10)
> +#define DCIF_CRC_EXP_VAL_R(n)			(0x20220 + (n) * 0x10)
> +
> +/* VER - Version ID Register */
> +#define DCIF_VER_GET_FEATURE(x)			FIELD_GET(GENMASK(15, 0), x)
> +#define DCIF_VER_GET_MINOR(x)			FIELD_GET(GENMASK(23, 16), x)
> +#define DCIF_VER_GET_MAJOR(x)			FIELD_GET(GENMASK(31, 24), x)

can you move it close register offset define.

Frank

> +
> +/* PAR_0 - Parameter Register 0 */
> +#define DCIF_PAR_0_LAYER_NUM(x)			FIELD_PREP(GENMASK(3, 0), x)
> +#define DCIF_PAR_0_DOMAIN_NUM(x)		FIELD_PREP(GENMASK(5, 4), x)
> +#define DCIF_PAR_0_AXI_DATA_WIDTH(x)		FIELD_PREP(GENMASK(7, 6), x)
> +#define DCIF_PAR_0_CLUT_RAM_NUM(x)		FIELD_PREP(GENMASK(11, 8), x)
> +#define DCIF_PAR_0_CSC_NUM(x)			FIELD_PREP(GENMASK(13, 12), x)
> +#define DCIF_PAR_0_CRC_REGION_NUM(x)		FIELD_PREP(GENMASK(18, 16), x)
> +#define DCIF_PAR_0_BACKUP(x)			FIELD_PREP(GENMASK(31, 28), x)
> +
> +/* PAR_1 - Parameter Register 1 */
> +#define DCIF_PAR_1_LAYER0_FIFO_SIZE(x)		FIELD_PREP(GENMASK(3, 0), x)
> +#define DCIF_PAR_1_LAYER1_FIFO_SIZE(x)		FIELD_PREP(GENMASK(7, 4), x)
> +
> +/* DISP_CTRL - Display Control Register */
> +#define DCIF_DISP_CTRL_DISP_ON			BIT(0)
> +#define DCIF_DISP_CTRL_AXI_RD_HOLD		BIT(30)
> +#define DCIF_DISP_CTRL_SW_RST			BIT(31)
> +
> +/* DISP_PAR - Display Parameter Register */
> +#define DCIF_DISP_PAR_BGND_B(x)			FIELD_PREP(GENMASK(7, 0), x)
> +#define DCIF_DISP_PAR_BGND_G(x)			FIELD_PREP(GENMASK(15, 8), x)
> +#define DCIF_DISP_PAR_BGND_R(x)			FIELD_PREP(GENMASK(23, 16), x)
> +
> +/* DISP_SIZE - Display Size Register */
> +#define DCIF_DISP_SIZE_DISP_WIDTH(x)		FIELD_PREP(GENMASK(11, 0), x)
> +#define DCIF_DISP_SIZE_DISP_HEIGHT(x)		FIELD_PREP(GENMASK(27, 16), x)
> +
> +/* DISP_SR0 - Display Status Register 0 */
> +#define DCIF_DISP_SR0_AXI_RD_PEND(x)		FIELD_PREP(GENMASK(4, 0), x)
> +#define DCIF_DISP_SR0_DPI_BUSY(x)		FIELD_PREP(GENMASK(14, 14), x)
> +#define DCIF_DISP_SR0_AXI_RD_BUSY(x)		FIELD_PREP(GENMASK(15, 15), x)
> +#define DCIF_DISP_SR0_TXFIFO_CNT(x)		FIELD_PREP(GENMASK(23, 16), x)
> +
> +/* DISP_SR1 - Display Status Register 1 */
> +#define DCIF_DISP_SR1_H_CNT(x)			FIELD_PREP(GENMASK(11, 0), x)
> +#define DCIF_DISP_SR1_V_CNT(x)			FIELD_PREP(GENMASK(27, 16), x)
> +
> +/* INT0 - Interrupt Enable/Status  Register 0 for Domain 0/1/2 */
> +#define DCIF_INT0_VSYNC				BIT(0)
> +#define DCIF_INT0_UNDERRUN			BIT(1)
> +#define DCIF_INT0_VS_BLANK			BIT(2)
> +#define DCIF_INT0_HIST_DONE			BIT(5)
> +#define DCIF_INT0_CRC_ERR			BIT(6)
> +#define DCIF_INT0_CRC_ERR_SAT			BIT(7)
> +
> +/* INT1 - Interrupt Enable/Status Register 1 for Domain 0/1/2 */
> +#define DCIF_INT1_FIFO_PANIC0			BIT(0)
> +#define DCIF_INT1_FIFO_PANIC1			BIT(1)
> +#define DCIF_INT1_DMA_ERR0			BIT(8)
> +#define DCIF_INT1_DMA_ERR1			BIT(9)
> +#define DCIF_INT1_DMA_DONE0			BIT(16)
> +#define DCIF_INT1_DMA_DONE1			BIT(17)
> +#define DCIF_INT1_FIFO_EMPTY0			BIT(24)
> +#define DCIF_INT1_FIFO_EMPTY1			BIT(25)
> +
> +/* DPI_CTRL - DPI Control Register */
> +#define DCIF_DPI_CTRL_HSYNC_POL_LOW		BIT(0)
> +#define DCIF_DPI_CTRL_VSYNC_POL_LOW		BIT(1)
> +#define DCIF_DPI_CTRL_DE_POL_LOW		BIT(2)
> +#define DCIF_DPI_CTRL_PCLK_EDGE_FALLING		BIT(3)
> +#define DCIF_DPI_CTRL_POL_MASK			GENMASK(3, 0)
> +
> +#define DCIF_DPI_CTRL_DATA_INV(x)		FIELD_PREP(GENMASK(4, 4), x)
> +#define DCIF_DPI_CTRL_DEF_BGND_EN(x)		FIELD_PREP(GENMASK(5, 5), x)
> +#define DCIF_DPI_CTRL_FETCH_OPT(x)		FIELD_PREP(GENMASK(9, 8), x)
> +#define DCIF_DPI_CTRL_DISP_MODE(x)		FIELD_PREP(GENMASK(13, 12), x)
> +#define DCIF_DPI_CTRL_DATA_PATTERN_MASK		GENMASK(18, 16)
> +#define DCIF_DPI_CTRL_DATA_PATTERN(x)		FIELD_PREP(GENMASK(18, 16), x)
> +#define PATTERN_RGB888				0
> +#define PATTERN_RBG888				1
> +#define PATTERN_GBR888				2
> +#define PATTERN_GRB888				3
> +#define PATTERN_BRG888				4
> +#define PATTERN_BGR888				5
> +#define PATTERN_RGB555				6
> +#define PATTERN_RGB565				7
> +
> +/* DPI_HSYN_PAR - DPI Horizontal Sync Parameter Register */
> +#define DCIF_DPI_HSYN_PAR_FP_H(x)		FIELD_PREP(GENMASK(11, 0), x)
> +#define DCIF_DPI_HSYN_PAR_BP_H(x)		FIELD_PREP(GENMASK(27, 16), x)
> +
> +/* DPI_VSYN_PAR - DPI Vertical Sync Parameter Register */
> +#define DCIF_DPI_VSYN_PAR_FP_V(x)		FIELD_PREP(GENMASK(11, 0), x)
> +#define DCIF_DPI_VSYN_PAR_BP_V(x)		FIELD_PREP(GENMASK(27, 16), x)
> +
> +/* DPI_VSYN_HSYN_WIDTH - DPI Vertical and Horizontal Pulse Width Parameter Register */
> +#define DCIF_DPI_VSYN_HSYN_WIDTH_PW_H(x)	FIELD_PREP(GENMASK(11, 0), x)
> +#define DCIF_DPI_VSYN_HSYN_WIDTH_PW_V(x)	FIELD_PREP(GENMASK(27, 16), x)
> +
> +/* CTRLDESC0 - Control Descriptor Register 0 */
> +#define DCIF_CTRLDESC0_AB_MODE(x)		FIELD_PREP(GENMASK(1, 0), x)
> +#define ALPHA_EMBEDDED				0
> +#define ALPHA_GLOBAL				1
> +#define DCIF_CTRLDESC0_YUV_FORMAT_MASK		GENMASK(15, 14)
> +#define DCIF_CTRLDESC0_YUV_FORMAT(x)		FIELD_PREP(GENMASK(15, 14), x)
> +#define CTRLDESCL0_YUV_FORMAT_Y2VY1U		0x0
> +#define CTRLDESCL0_YUV_FORMAT_Y2UY1V		0x1
> +#define CTRLDESCL0_YUV_FORMAT_VY2UY1		0x2
> +#define CTRLDESCL0_YUV_FORMAT_UY2VY1		0x3
> +#define DCIF_CTRLDESC0_GLOBAL_ALPHA(x)		FIELD_PREP(GENMASK(23, 16), x)
> +#define DCIF_CTRLDESC0_FORMAT_MASK		GENMASK(27, 24)
> +#define DCIF_CTRLDESC0_FORMAT(x)		FIELD_PREP(GENMASK(27, 24), x)
> +#define CTRLDESCL0_FORMAT_RGB565		0x4
> +#define CTRLDESCL0_FORMAT_ARGB1555		0x5
> +#define CTRLDESCL0_FORMAT_ARGB4444		0x6
> +#define CTRLDESCL0_FORMAT_YCBCR422		0x7
> +#define CTRLDESCL0_FORMAT_RGB888		0x8
> +#define CTRLDESCL0_FORMAT_ARGB8888		0x9
> +#define CTRLDESCL0_FORMAT_ABGR8888		0xa
> +#define DCIF_CTRLDESC0_SHADOW_LOAD_EN		BIT(30)
> +#define DCIF_CTRLDESC0_EN			BIT(31)
> +
> +/* CTRLDESC1 - Control Descriptor Register 1 */
> +#define DCIF_CTRLDESC1_POSX(x)			FIELD_PREP(GENMASK(11, 0), x)
> +#define DCIF_CTRLDESC1_POSY(x)			FIELD_PREP(GENMASK(27, 16), x)
> +
> +/* CTRLDESC2 - Control Descriptor Register */
> +#define DCIF_CTRLDESC2_WIDTH(x)			FIELD_PREP(GENMASK(11, 0), x)
> +#define DCIF_CTRLDESC2_HEIGHT(x)		FIELD_PREP(GENMASK(27, 16), x)
> +
> +/* CTRLDESC3 - Control Descriptor Register 3 */
> +#define DCIF_CTRLDESC3_PITCH(x)			FIELD_PREP(GENMASK(15, 0), x)
> +#define DCIF_CTRLDESC3_T_SIZE(x)		FIELD_PREP(GENMASK(17, 16), x)
> +#define DCIF_CTRLDESC3_P_SIZE(x)		FIELD_PREP(GENMASK(22, 20), x)
> +
> +/* CTRLDESC4 - Control Descriptor Register 4 */
> +#define DCIF_CTRLDESC4_ADDR(x)FIELD_PREP(GENMASK(31, 0), x)
> +
> +/* CTRLDESC6 - Control Descriptor Register 6  */
> +#define DCIF_CTRLDESC6_BCLR_B(x)		FIELD_PREP(GENMASK(7, 0), x)
> +#define DCIF_CTRLDESC6_BCLR_G(x)		FIELD_PREP(GENMASK(15, 8), x)
> +#define DCIF_CTRLDESC6_BCLR_R(x)		FIELD_PREP(GENMASK(23, 16), x)
> +#define DCIF_CTRLDESC6_BCLR_A(x)		FIELD_PREP(GENMASK(31, 24), x)
> +
> +/* CLUT_CTRL - CLUT control Register */
> +#define DCIF_CLUT_CTRL_CLUT0_SEL(x)		FIELD_PREP(GENMASK(0, 0), x)
> +#define DCIF_CLUT_CTRL_CLUT1_SEL(x)		FIELD_PREP(GENMASK(3, 3), x)
> +#define DCIF_CLUT_CTRL_CLUT_MUX(x)		FIELD_PREP(GENMASK(29, 28), x)
> +#define DCIF_CLUT_CTRL_CLUT_SHADOW_LOAD_EN(x)	FIELD_PREP(GENMASK(31, 31), x)
> +
> +/* PANIC_THRES_L0 - FIFO Panic Threshold Register For Layer 0 */
> +#define DCIF_PANIC_THRES_LOW_MASK		GENMASK(11, 0)
> +#define DCIF_PANIC_THRES_LOW(x)			FIELD_PREP(GENMASK(11, 00), x)
> +#define DCIF_PANIC_THRES_HIGH_MASK		GENMASK(27, 16)
> +#define DCIF_PANIC_THRES_HIGH(x)		FIELD_PREP(GENMASK(27, 16), x)
> +#define DCIF_PANIC_THRES_REQ_EN			BIT(31)
> +#define PANIC0_THRES_MAX			511
> +
> +/* LAYER_SR0_L0 - Layer Status Register 0 for Layer 0 */
> +#define DCIF_LAYER_SR0_L0_FIFO_CNT_MASK		GENMASK(9, 0)
> +#define DCIF_LAYER_SR0_L0_FIFO_CNT(x)		FIELD_PREP(GENMASK(9, 0), x)
> +
> +/* CSC_CTRL_L0 - Color Space Conversion Control Register For Layer 0 */
> +#define DCIF_CSC_CTRL_L0_CSC_EN			BIT(0)
> +#define DCIF_CSC_CTRL_L0_CSC_MODE_YCBCR2RGB	BIT(1)
> +
> +/* CSC_COEF0_L0 - Color Space Conversion Coefficient Register 0 For Layer 0 */
> +#define DCIF_CSC_COEF0_L0_A1(x)			FIELD_PREP_CONST(GENMASK(10, 0), x)
> +#define DCIF_CSC_COEF0_L0_A2(x)			FIELD_PREP_CONST(GENMASK(26, 16), x)
> +
> +/* CSC_COEF1_L0 - Color Space Conversion Coefficient Register 1 For Layer 0 */
> +#define DCIF_CSC_COEF1_L0_A3(x)			FIELD_PREP_CONST(GENMASK(10, 0), x)
> +#define DCIF_CSC_COEF1_L0_B1(x)			FIELD_PREP_CONST(GENMASK(26, 16), x)
> +
> +/* CSC_COEF2_L0 - Color Space Conversion Coefficient Register 2 For Layer 0 */
> +#define DCIF_CSC_COEF2_L0_B2(x)			FIELD_PREP_CONST(GENMASK(10, 0), x)
> +#define DCIF_CSC_COEF2_L0_B3(x)			FIELD_PREP_CONST(GENMASK(26, 16), x)
> +
> +/* CSC_COEF3_L0 - Color Space Conversion Coefficient Register 3 For Layer 0 */
> +#define DCIF_CSC_COEF3_L0_C1(x)			FIELD_PREP_CONST(GENMASK(10, 0), x)
> +#define DCIF_CSC_COEF3_L0_C2(x)			FIELD_PREP_CONST(GENMASK(26, 16), x)
> +
> +/* CSC_COEF4_L0 - Color Space Conversion Coefficient Register 4 For Layer 0 */
> +#define DCIF_CSC_COEF4_L0_C3(x)			FIELD_PREP_CONST(GENMASK(10, 0), x)
> +#define DCIF_CSC_COEF4_L0_D1(x)			FIELD_PREP_CONST(GENMASK(24, 16), x)
> +
> +/* CSC_COEF5_L0 - Color Space Conversion Coefficient Register 5 For Layer 0 */
> +#define DCIF_CSC_COEF5_L0_D2(x)			FIELD_PREP_CONST(GENMASK(8, 0), x)
> +#define DCIF_CSC_COEF5_L0_D3(x)			FIELD_PREP_CONST(GENMASK(24, 16), x)
> +
> +/* CTRLDESC0_L1 - Control Descriptor Register 0 for Layer 1 */
> +#define DCIF_CTRLDESC0_L1_AB_MODE_MASK		GENMASK(1, 0)
> +#define DCIF_CTRLDESC0_L1_AB_MODE(x)		FIELD_PREP(GENMASK(1, 0), x)
> +
> +/* CRC_CTRL - CRC Control Register */
> +#define DCIF_CRC_CTRL_CRC_EN(x)			(1 << (x))
> +#define DCIF_CRC_CTRL_HIST_REGION_SEL(x)	FIELD_PREP(GENMASK(17, 16), x)
> +#define DCIF_CRC_CTRL_HIST_MODE			BIT(21)
> +#define DCIF_CRC_CTRL_HIST_TRIG			BIT(22)
> +#define DCIF_CRC_CTRL_HIST_EN			BIT(23)
> +#define DCIF_CRC_CTRL_CRC_MODE			BIT(28)
> +#define DCIF_CRC_CTRL_CRC_TRIG			BIT(29)
> +#define DCIF_CRC_CTRL_CRC_ERR_CNT_RST		BIT(30)
> +#define DCIF_CRC_CTRL_CRC_SHADOW_LOAD_EN	BIT(31)
> +
> +/* CRC_THRES - CRC Threshold Register */
> +#define DCIF_CRC_THRES_CRC_THRESHOLD_MASK	GENMASK(31, 0)
> +#define DCIF_CRC_THRES_CRC_THRESHOLD(x)		FIELD_PREP(GENMASK(31, 0), x)
> +
> +/* CRC_HIST_COEF - CRC Region Histogram Coefficient Register */
> +#define DCIF_CRC_HIST_COEF_HIST_WB_MASK		GENMASK(7, 0)
> +#define DCIF_CRC_HIST_COEF_HIST_WB(x)		FIELD_PREP(GENMASK(7, 0), x)
> +#define DCIF_CRC_HIST_COEF_HIST_WG_MASK		GENMASK(15, 8)
> +#define DCIF_CRC_HIST_COEF_HIST_WG(x)		FIELD_PREP(GENMASK(15, 8), x)
> +#define DCIF_CRC_HIST_COEF_HIST_WR_MASK		GENMASK(23, 16)
> +#define DCIF_CRC_HIST_COEF_HIST_WR(x)		FIELD_PREP(GENMASK(23, 16), x)
> +
> +/* CRC_ERR_CNT - CRC Error Counter Register */
> +#define DCIF_CRC_ERR_CNT_CRC_ERR_CNT_MASK	GENMASK(31, 0)
> +#define DCIF_CRC_ERR_CNT_CRC_ERR_CNT(x)		FIELD_PREP(GENMASK(31, 0), x)
> +
> +/* CRC_SR - CRC Status Register */
> +#define DCIF_CRC_SR_HIST_CNT_SAT_MASK		BIT(13)
> +#define DCIF_CRC_SR_HIST_CNT_SAT(x)		FIELD_PREP(GENMASK(13, 13), x)
> +#define DCIF_CRC_SR_HIST_SAT_MASK		BIT(14)
> +#define DCIF_CRC_SR_HIST_SAT(x)			FIELD_PREP(GENMASK(14, 14), x)
> +#define DCIF_CRC_SR_HIST_BUSY_MASK		BIT(15)
> +#define DCIF_CRC_SR_HIST_BUSY(x)		FIELD_PREP(GENMASK(15, 15), x)
> +#define DCIF_CRC_SR_CRC_STATUS_MASK		BIT(31)
> +#define DCIF_CRC_SR_CRC_STATUS(x)		FIELD_PREP(GENMASK(31, 31), x)
> +
> +/* CRC Region Histogram Counter Register For Bin n */
> +#define DCIF_B_BIN_CNT_MASK			GENMASK(20, 0)
> +#define DCIF_B_BIN_CNT(x)			FIELD_PREP(GENMASK(20, 0), x)
> +
> +/* CRC_POS - CRC Position Register */
> +#define DCIF_CRC_POS_CRC_HOR_POS(x)		FIELD_PREP(GENMASK(11, 0), x)
> +#define DCIF_CRC_POS_CRC_VER_POS(x)		FIELD_PREP(GENMASK(27, 16), x)
> +
> +/* CRC_SIZE - CRC Size Register */
> +#define DCIF_CRC_SIZE_CRC_HOR_SIZE(x)		FIELD_PREP(GENMASK(11, 0), x)
> +#define DCIF_CRC_SIZE_CRC_VER_SIZE(x)		FIELD_PREP(GENMASK(27, 16), x)
> +
> +/* CRC_VAL - CRC Value Register */
> +#define DCIF_CRC_VAL_CRC_VAL_MASK		GENMASK(31, 0)
> +#define DCIF_CRC_VAL_CRC_VAL(x)			FIELD_PREP(GENMASK(31, 0), x)
> +
> +/* CRC_EXP_VAL - CRC Expected Value Register */
> +#define DCIF_CRC_EXP_VAL_CRC_EXP_VAL_MASK	GENMASK(31, 0)
> +#define DCIF_CRC_EXP_VAL_CRC_EXP_VAL(x)		FIELD_PREP(GENMASK(31, 0), x)
> +
> +#endif /* __DCIF_REG_H__ */
> --
> 2.46.1
>
