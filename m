Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 963858D1A6D
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 13:58:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADBDD10E42A;
	Tue, 28 May 2024 11:58:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=axis.com header.i=@axis.com header.b="HiUfyLOj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2076.outbound.protection.outlook.com [40.107.104.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BE8C10E0CA
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 10:04:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e2DJRWuyxM366mOO2lB4uKvA6D0UJCKG8rkWpGTsJ8Ur5fVpPQY332T+6e9zCtTgQIJ9yiFxXTDv15RzpqJanNcPmUGIHnVcR9tJ4Du+CtAGaqA4NEcopWrbTq3FGjqcusaVzHYsm2Gb57yzALEX0hUDwDqpA7XfxwVMGtBNJgoULy2ymiO8wDtaTPrzIQaGHLKgr0Ibd5S2zznTxKm1IVjlwhp/FybBeFDFplA6QDBdlRFWjxbDS8yh/5/jZI45FW8dEtYT7YdoatnAIcrOnJuC27ttLj5kb9ZCItGEoHqDqEYkoqwl6dUCbL/b1U1Maf5dqilTPAOMJUuY2dHcmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YufMOriIqzxBP0UZgysfvoHZcRIi0WHOXptjc+s3xPM=;
 b=QuVxhwtXhmIV7qgWI69Ne2GXMeCRA6t6PyxSb1GMypNijabcHJN/9TAvRHO2TPa60TOj7t+bjUB1LeWlhF5mTAJIe2LdaBIK9LXqbvzhIyDh9ne+ccgJAcOgNFtksNq/oMVFUPnKRqtnIRQ9J2K9+fLdF0VsP1Nob+oUONpVbF5B1c+Id+Auwf6S+3q+om+XZGDOFjfOerq1wzVbgYDPfr7wMAqIW/kPLyidRqmTfHTUqah2UlBX/Gw3VwSlPGczhi+4iQ0h2+n2xJs3PKz93vUTHjSYExXSYFe+Zpky9YUh4UdL+rRqfGMQIWb16Cq6lkXuwhzJJgwXRz4YW9nZeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YufMOriIqzxBP0UZgysfvoHZcRIi0WHOXptjc+s3xPM=;
 b=HiUfyLOjR3392XtkWZnqTo4NeWSo+BnohrLJzNlhWyCOtR7WobBZrtHvWf9tSN/BZrQARtNViSKjyW8XsPm2VdxsKhpN090BcOtyq7ZYGKXQ8tW9fSRs+HSC12U9RgwQtZpAhQADecH2YHO7H8MaHVi4kAYQ5hqxD2gogrhbJsc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Received: from VI1PR02MB3229.eurprd02.prod.outlook.com (2603:10a6:802:24::28)
 by PA6PR02MB10739.eurprd02.prod.outlook.com (2603:10a6:102:3cb::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Tue, 28 May
 2024 10:04:51 +0000
Received: from VI1PR02MB3229.eurprd02.prod.outlook.com
 ([fe80::658d:49ce:8a32:69ca]) by VI1PR02MB3229.eurprd02.prod.outlook.com
 ([fe80::658d:49ce:8a32:69ca%4]) with mapi id 15.20.7611.025; Tue, 28 May 2024
 10:04:51 +0000
Date: Tue, 28 May 2024 12:04:49 +0200 (CEST)
From: Ricard Wanderlof <ricardw@axis.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>
cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel@axis.com
Subject: [PATCH] drm: bridge: adv7511: Accept audio sample widths of 32 bits
 via I2S
Message-ID: <91472c14-3aeb-766a-1716-8219af6e8782@axis.com>
Content-Type: text/plain; charset=US-ASCII
X-ClientProxiedBy: MM0P280CA0057.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:b::17) To VI1PR02MB3229.eurprd02.prod.outlook.com
 (2603:10a6:802:24::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR02MB3229:EE_|PA6PR02MB10739:EE_
X-MS-Office365-Filtering-Correlation-Id: c79eb05c-e913-4f6a-0ba3-08dc7efd9d44
X-LD-Processed: 78703d3c-b907-432f-b066-88f7af9ca3af,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|366007|376005|1800799015|7416005|921011; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jivDxjojaz6NMQNbInjDOF7a9LI2/rmOnTEJDhCyCpuDsh1BNHX7jqmOcB7z?=
 =?us-ascii?Q?eSMgzFj5MIzNDuNQ/Ss65gGLvItSCDi/lRng2cF0K2EZO6ZYfDrjh/TMYulk?=
 =?us-ascii?Q?j3mmPr40czszEPnje66vR0NFCruTuw1EZTXdWVfpItUxpMhFnCfkT1J84qPa?=
 =?us-ascii?Q?DerfNG6yF0KtdKqczzHEe23Jl7LDMucxyrDtgGMmcAH9Emaak2DaFWeHWe7t?=
 =?us-ascii?Q?lyRvt7EHcBIAV9MBAGqjlt9u49I1Hy1ycmoXro7OVO0TQDoZqKHL5mBjj/o8?=
 =?us-ascii?Q?XSKddMwTRVmTXJbY0eyhD3ZaxVtc/pDdvcq/Hi/OiBBzUha3rqnEc9iU+xMN?=
 =?us-ascii?Q?o3wZhsaJCIPY5zv+BEneGDnE6vpgFvdGneaCdlhSUq1K+U1SSoDZopUjWclD?=
 =?us-ascii?Q?UEQtx2AmOMfyq8hEaRaN3b/oueDBhWZ9hw/TYTIcZZvYkwkRRdxfXzxQdfmk?=
 =?us-ascii?Q?9aFAQmEVRUbszlZIV/5Sdj1QMMMsD2hD6gC2jNL3VQ71JAS5GxsyJ4g7UNhJ?=
 =?us-ascii?Q?RHwMRPAsVZi2Fg5S3/N3uqVV11+R72yYbMQyKHkS3Bw9KKs8i6uyyGr+n9zj?=
 =?us-ascii?Q?OpXhaNsmxj/Fh39QA3qjMZU1xgFDCCf529wHbNJYe74jMKfNV3o5UagcCDd8?=
 =?us-ascii?Q?v3VmZGXlLPo1wi0wj6jds0RC+EkIl9Xws1H/oiH4ipFcsjWuubfvwRYXNIjq?=
 =?us-ascii?Q?McPS9NzU0qLAOHylWqeJdFBdoQJ8Dq/jXrj28e2gUsKsZoMT+kyXL5uvlCTH?=
 =?us-ascii?Q?A/ZWBaPDr3sSWJbDRjWg4AS6rNEqIYeNGTdoVCDMY3PjOiNUYA14ZOb7hlIW?=
 =?us-ascii?Q?d+t/DSQJXMVRIIyNu/UEEhBBcF80O2H4t0WvW4SGe/jvQ04G/1UxxM60CABs?=
 =?us-ascii?Q?YgAi0nTx5ZgZaCYYBt26yMeS2D2tp4A3oP6IQcPAysD8K21vPF8LKRjKhEon?=
 =?us-ascii?Q?lZLMqFA11qHvCdFugfuw6bzotJiLj7gIm6fc52xYdLqhDSKtuGvPLyiGOvNj?=
 =?us-ascii?Q?EqFrsGOxOrMRQeq5fYKStU0Aan/OvjXs/sJWEXfZ2peujyJQnAOzw+mbKVwv?=
 =?us-ascii?Q?iWLBAino/TxZ3DrkOcbMz0Wu3HyQniShAv77j1RNa4vo15TUjYz2ND2nohwK?=
 =?us-ascii?Q?cvc2qQoFFTkwoRq1h9lNQQHfdEZ32fGrPXmZ/ICC+KV0OtQP1VBIQz6GB3wz?=
 =?us-ascii?Q?BOBkz5lpi7tF5j7CRFNLSwDN3qSHImV98h5TJHqMHRW9/6kuPehrHOEzjJDi?=
 =?us-ascii?Q?11+OLGP0lAbbWedcRs9j6nxbxGL/wtb61udunkHnZ1RO1/3HP1149M2OixY8?=
 =?us-ascii?Q?fOg72VfEHEk7Va7UVOUgGxzZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR02MB3229.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(7416005)(921011); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fyERMwcgVJwcaADVUmp3sdXwUmng3nfhOd21tWwtj/UNA06moxt/3Twrt8VH?=
 =?us-ascii?Q?vpe55qmeuoJdmw9W+PerQTrKk1JD9s3LhldjYaZ5EpVk7G28Zpi5Hf/tlyFM?=
 =?us-ascii?Q?8uM6cmRY5KzR9X8vF30xeG3wfcZ80o2zs392TcE9RRQhqHu7GlV+AbS5Yy42?=
 =?us-ascii?Q?tbsJYn+2hVb6nk2SNbi9omHTxjYO5pDgC9uMBHNyurFZBugdbtrEt/LcddRP?=
 =?us-ascii?Q?BQm08AC1F5PN5tPVv5OFnaOMYAtPcfu6gKE8KbdQ8bmVw2s530yGNqtw/Kqp?=
 =?us-ascii?Q?czpJXZPrtzrDtT18eRs3Btfr/hMIIfi4yRenPbmsxlouAmyT8oZeODApNjC7?=
 =?us-ascii?Q?vykz0nneZDmLr9yMu7ECPyw3wpjWcDSLrjZTztRI0HwZQ9YnOuHsFjzr/oMZ?=
 =?us-ascii?Q?jkOu6VUQx5RPZH18adDmqICq8U5xIxs/gB6JX9E9NNEBps4Jhb2tyIPXkGxE?=
 =?us-ascii?Q?bnqQ1FXXtJY2Kasby2DzNgIf9CJwXXJX+XAU1s+M6N7GKoyHA0pYQd+AqRWQ?=
 =?us-ascii?Q?hiP9u5hl2N80IQ5F+Acu3SgsnlURo94cgbmS65LKpkF2SXPMlbgrfcO5Kuhs?=
 =?us-ascii?Q?of0jxEU5Ibp7ziRyPLDae6Bu0GlJJp1NhUaTWRDA0x9oowPwKIMZLKbYwmow?=
 =?us-ascii?Q?H7nghT+pS/SfW+s6Mmr+/oiFPY9NrOZXwQyem3pRTJiufByDY7YlqeeIbf6X?=
 =?us-ascii?Q?InDRNH0sL+xCOXd023pv0EtZqNGRngc6QohZhyimnzNwkWhVwBTM1zWMfkJu?=
 =?us-ascii?Q?ZAGWETixWSkJ1j7eKtu60CkH4g/DjrqEBfZAomJZRmon0XFVsre6rhNlUyfu?=
 =?us-ascii?Q?/el8NEp+jh70rWR7XZKOL4zN8Tc/EzFpvb9/In42YixiLNxbLUJA0pN5Gv3R?=
 =?us-ascii?Q?b7Bm38T52uZ/MY7tpCrUPoT0jH6U8zn+MvyIllKTCfTny0BhL+hGrWJXXeV+?=
 =?us-ascii?Q?ZBto+3Mugp3NqXmnLjsHCIOB1t/xspeWDnKK3iKrDvCJIw9h0jyQ10YekWVH?=
 =?us-ascii?Q?Pj2f1kvOS0lvnu0CTRfDosXYWydMp8anRVcYoDoe1YA7Md8Hvt6bVZtxUGRb?=
 =?us-ascii?Q?D4JMXogHNKkoL38HE5Q8FdTiXE1gJ2+VXaiXBvLlzHGPzK05jpqC1c1MFkGi?=
 =?us-ascii?Q?mC5+CwBjHGAatWJhlMCOtCe17CMqNz73IIpf6tZjIsvCdRSH71kB9rK/7l0/?=
 =?us-ascii?Q?DcUCUMOjtUZ04YIpnguroXXCfME7SRSeJvWWpNu3U55UYrU3WzkHKMuNnHE0?=
 =?us-ascii?Q?TOcVBXzdcBje0xJzLIp5WKfjz2W9rC15Ji8S2zjlWb4gMuMw15hNqiSsbDmC?=
 =?us-ascii?Q?yPfHL+r/qJe0SOCHK8bf1epOAwWILtgDlctWV4qsWbJ8yg6SUaDTb7pQlCqB?=
 =?us-ascii?Q?jfTsuDIL8Qi7GdnRvV0R2/dWmjd1xIiwxzrI23ebNiwiMeXdoJEFyQEgYzTa?=
 =?us-ascii?Q?iH3ZpEBzibll/O0rauaIS1atrt7pDIFqk0ApdGsEsdeFILTrbGLjRJLniYoz?=
 =?us-ascii?Q?s8HT9FAOdBp9IyXYTX7+n6h8FttjwRq41hMkYrpXHrIznNSckMGLdW38rJcV?=
 =?us-ascii?Q?vcRNVhMQwePsC/yWtRfXaTJ4m8YoiYd45fn4LFH1?=
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c79eb05c-e913-4f6a-0ba3-08dc7efd9d44
X-MS-Exchange-CrossTenant-AuthSource: VI1PR02MB3229.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 10:04:51.1464 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U88QP//je2sjWMktlEMG2ddXF1gtMCIvd7LbbGQhqz+RPx7zwh2LOvm9gwXTjoNHZCF4sDKW+Szz2UCpV33RCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR02MB10739
X-Mailman-Approved-At: Tue, 28 May 2024 11:57:27 +0000
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


Even though data is truncated to 24 bits, the I2S interface does
accept 32 bit data (the slot widths according to the data sheet
can be 16 or 32 bits) so let the hw_params callback reflect this,
even if the lowest 8 bits are not used when 32 bits are specified.

This is normally how 24 bit audio data is handled (i.e. as 32 bit
data, with the LSB:s unused) and this is also reflected in other
bridge drivers which handle audio, for instance sii902x.c and
synopsis/dw-hdmi-i2s-audio.c .

Signed-off-by: Ricard Wanderlof <ricard.wanderlof@axis.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_audio.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
index 61f4a38e7d2b..4563f5d8136f 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
@@ -101,11 +101,14 @@ static int adv7511_hdmi_hw_params(struct device *dev, void *data,
 	case 20:
 		len = ADV7511_I2S_SAMPLE_LEN_20;
 		break;
-	case 32:
-		if (fmt->bit_fmt != SNDRV_PCM_FORMAT_IEC958_SUBFRAME_LE)
-			return -EINVAL;
-		fallthrough;
 	case 24:
+	case 32:
+		/*
+		 * 32 bits are handled like 24 bits, except that the lowest
+		 * 8 bits are discarded. In fact, the accepted I2S slot widths
+		 * are 16 and 32 bits, so the chip is fully compatible with
+		 * 32 bit data.
+		 */
 		len = ADV7511_I2S_SAMPLE_LEN_24;
 		break;
 	default:
-- 
2.30.2

