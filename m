Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EF99D9FBB
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 00:40:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32B6C10E00A;
	Tue, 26 Nov 2024 23:39:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="JYRQAKhb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011047.outbound.protection.outlook.com [52.101.125.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB65B10E00A
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 23:39:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iUyXCi6H5XBx4b0pc/X7FCrmo+TrIoktlWKRxOM8UVD9S40DXOYdwf9xEtC2FiOLCkn2payaEnyxgQnFanxP2X1ax4s/ofga4JL+RBcbh89LsCILIVjYuglfzauaMQLcw1KxgUVYCtDQ64w2AaPkr2jWPfp/d9jwh4Nk2rAlduIlUiNz8x52X/fnxvskaNZQcJBszUYZQjsDf0bXCNFfapC8H7Iyb9wwKWRoGLPSOPmy0w09U9ZonndhUtAvbUWpIOC6udCu3vuQMPkcaiISvYjyGRWBIgLpPoDGjctxgj374eTRHdo/pVCB7X5GChrZdXnzUM4JdA4bTXFb0FlMZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xrGISA2//XTBz73phpzO1xWI7utSIsdHpGmeaf2d6Ws=;
 b=AGvorFnDVFtrU0kS2Xf2IK2sRI7pTOgy/vT9vh8QY4s/Jcuq3e225VQsKwTdUVhBEAQHjbkl8tfdbSsa47aZS51qLTwu1ztF/ougbf+pMWJlZ5tJupDCgerfwsMWA9a3TFxv77s1zC5MCxnBHP5RViDtkHjVGr/RPb3zw5QgITlpo5y+NhttAJdq7iurP/jv7AaQHb/Xyhlk46SXNGGlmhH+PGz4l06jafQruPSF4sXsMSFomiyAl4/FCNVMxcvsoIzxz6aTVfcsKhOwp4jz1aoahtuuaJ1gAPEZaj04RDTSOyt84T8BguQ+KBYSHTYcmKnXXesMRHyvely8/lvMyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xrGISA2//XTBz73phpzO1xWI7utSIsdHpGmeaf2d6Ws=;
 b=JYRQAKhbmk/QWX6WWI8nHzLMcktrs7COC8Rle6rlfZAIFl9Kqa5Jo8afopDZnRHLwj+1kkVCCj1AraY8QoCCuCEOK7Ij0TjNOY0Wbq9R53V7K5L1lKo5WLG7mLe+E7H6R2LJyF3qUr/kjZkwZx6kLWIZnr1WVfs41u2KahCI6zI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB13294.jpnprd01.prod.outlook.com
 (2603:1096:405:113::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Tue, 26 Nov
 2024 23:39:49 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8207.010; Tue, 26 Nov 2024
 23:39:49 +0000
Message-ID: <87ed2xwomy.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Rob Herring <robh@kernel.org>, Thierry Reding <treding@nvidia.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, dri-devel@lists.freedesktop.org,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 0/3] gpu: drm: replace of_graph_get_next_endpoint()
In-Reply-To: <20241126123253.GF5461@pendragon.ideasonboard.com>
References: <87o722sg6y.wl-kuninori.morimoto.gx@renesas.com>
 <20241126123253.GF5461@pendragon.ideasonboard.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 Nov 2024 23:39:49 +0000
X-ClientProxiedBy: TYCP286CA0189.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB13294:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d24ef3f-9c23-48c6-c9a2-08dd0e739e40
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oASopSw0h7R2mAl+SMSFogbezEuw6pIlqX2UwJ7RvqVzWSHIWsZGjtwKGoX+?=
 =?us-ascii?Q?eEYdxFWgMh3I/bLDqTCFrq5j3TKI81OGZEJohAFl1Z8sLKli2zifO27nrBU7?=
 =?us-ascii?Q?FFOx11eh2tNYy0oSncVjTtP8BnGoEX9oV6XzxzYA8dK/4rCqw5Q0q6JZG85/?=
 =?us-ascii?Q?K4cBEADoWQr2CcR5sfzJE/Glt3x/BRLdcrNScjitkkPGbBlXbSjNK9sRIwzE?=
 =?us-ascii?Q?k6D26x26sSSClUF5y2Vv2S1HGUn6/s2Fb7yp17GEqZfsy5KDGKtojNkqOk8n?=
 =?us-ascii?Q?D2HUJpjZCw+Ijz0db1EQt+PUzyECESYD5e8pMkMChw37T5Fcl5e9Q+sxbFRF?=
 =?us-ascii?Q?zwEGYxrWBIKJ3oPQLJeZMKy1pgh5CCuGs+eX8mC+EDbtlISNbRjKZUSR/ElL?=
 =?us-ascii?Q?1GasClfmI9TUXBIo14m47xFqWRVmH22K3glRWMPKgLCftXIlI2Vwj09k6Mv8?=
 =?us-ascii?Q?NYuh7SgGdHjgDuq3oqabv5EWiOXgL28j4yNkpSVrNvEHBmVLJp8jvaNqbvQw?=
 =?us-ascii?Q?yW0l424GTc1ov02LuKMkQAUtavZgcsfzRCOv/87f4BOstWdTo9sGr6ANygIf?=
 =?us-ascii?Q?blF2dFra/u6uFbBga7aKf4paQ0+5purjeieDsvzt1Ini7Bv0ETMopdrG5Bql?=
 =?us-ascii?Q?y8P8IltNMoNscAYUxcn1Ki02LaE/FAlbuiQHvyJUdc3F/EpenBXlcI3zN4Sl?=
 =?us-ascii?Q?YgrisKBV2krBZzgI9NK6dNXySoZpc2Cws8sFVcQBkbMf7IGW8f9YFeBTmO7H?=
 =?us-ascii?Q?ecl6iUgRY1LnT/4/fI8xSA30XfuvGeedIyk6W5Yuh854stHckTIHRpMqwJxb?=
 =?us-ascii?Q?XtqxD4Grwym+eg9n5abYYPPEdQujefe0AaKbVpJkz2LyFHMODAIe6PAIiPIi?=
 =?us-ascii?Q?xAmIn5anT+QKCrgfDPjU3jiX+HPdQfbU8rKrMYlNwX1xAbpX8niVtgVsqP9h?=
 =?us-ascii?Q?R1Jh5tmOqXBGKTeRSwjeDTBEFU9BJJzfE9Urg8zpCgVFl67o232g+gk+bOUm?=
 =?us-ascii?Q?3CGPqCNjlvbeFRfGC01cBbcldpPhIGuF0XXV5E7IQtX8t36xihjumC93pMK3?=
 =?us-ascii?Q?kTG1MuEyYbD45m41huosH6bHkdoToVRTg7Xjy9Q3VISxKEDj0Kzz4aqegYl1?=
 =?us-ascii?Q?zSMcYAkYmq/TjWMzJ2YTYeUe1pJdNjtQSP2F4cUq/nHB2VgHVMWARUn0sA6u?=
 =?us-ascii?Q?+I69sbnvVKhMmJAQ3CQY47vJ9mQWzSL0KkTmFXlzlxu9Mzd7guRkY6wiVFZ7?=
 =?us-ascii?Q?zVX80OcoDZbQUxDODdcSFpedBDV9DFiZbRdLnkm5Lezddv6woyN2ou9QV/Bb?=
 =?us-ascii?Q?RNHEzWWqpFpRc0kBjtOOUUaogVIjEcsrTiXTZbdzwy7CCO0pP3LnyP83uNk/?=
 =?us-ascii?Q?OoSgDYhq8u9yDfq21z9ik6s7o0nrM9j2oTz3VFS3edJXfI+xnw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Bqo+jeAO13DU1f1AG123vO8c+VMIrw4dN/zCo33HcyyKST1T5+iNqM8ed4f/?=
 =?us-ascii?Q?/DvD7436vk6X3u81cU1IcQAvTSL+8S8f5utShDaOYmry9jpibaIUGk+DBeCx?=
 =?us-ascii?Q?uVkydfeGGH84ZNhTHpY/2OyJIdkRXoXPnqSOLlEXhVWO7yLv39MzC2XXqT7f?=
 =?us-ascii?Q?8s5nAmIUfmE0qhqQrYL8kWUjVvOBLEGwFasgwmTcL5V3C5EGePSgrPX9dMaY?=
 =?us-ascii?Q?y8Ubx6IRg66tQOgdwM65d4D5EcaRC1SjhkGHhp04wvcD/hij1M0+otPERQId?=
 =?us-ascii?Q?HreLetvjZ6bFSq3e4vS/rUwIN4XKN8/Wd9ELrG4Q/Z+Xi01ms8WTwTprnUXP?=
 =?us-ascii?Q?64NtSkg19xvT4x36mNqxsU35M0qB4tsBjHDnj5WECu5wk361VKs9C5AoHuWh?=
 =?us-ascii?Q?YiK2NINZtWTUgMnXTOvL/3q3gYFzWffzW1RraS6+kKHI49Ui0wsD1yd+AZq+?=
 =?us-ascii?Q?nhin1rPE1BnwW79JzcseKYGaao8ninbtRITymNqGyS+phf49PD1KDkBU8JtK?=
 =?us-ascii?Q?0lYjTz/QrwtDwUdX9pOeYyVs0xN48uMclOiV51kwAYLjuM2LILsN9WcYsjtx?=
 =?us-ascii?Q?AdBJX2sfYloPOf424qWufnFb3MvPZEXs+ZoZPvlSUQdtfRTYAm3J3Z5qv4VP?=
 =?us-ascii?Q?yF4S/jC1uXNW1vzQvksHGOVYDi4mps73cZErvrwfLy+TL3HcB+G5K9gOcr7f?=
 =?us-ascii?Q?Ok6qWUE3Sxb8Y+inxR81h1HIq2nTktu+RYA3/fcDVmuHy3S1gLgHR2W+/MAl?=
 =?us-ascii?Q?BWp6bJOgVwr3yV5RzeurCR+0dBSY7uuWOxZ3fq37+lTC//l4hdQbr9a5nMX+?=
 =?us-ascii?Q?0Z2of8VPoMqIeoxpyGZhjz4lv4FSbAMpjOuSukko+E7c1Z8oTwAIUv1Kdiyy?=
 =?us-ascii?Q?+i7By9rZd61kRse9TDt733a89mIHotH6o5/1uMFBxwIXVJ0kp3KKQ3oQDAb9?=
 =?us-ascii?Q?HvQ/Mzei4CqJ98/4TRdJRwo/XMpGzbndhoB4CBEOqPrihTXDSHPQns4hyQkZ?=
 =?us-ascii?Q?G7jPVQkdvPDelRZiRVmr6yN069lPfZb3HjW6tDIDWkdIiCkokt+rrxntvLVM?=
 =?us-ascii?Q?j+cPD0sdY0DbDBt3zJBflSVlagHI3z0bxLy7y9HZp01f140B6XW6Uykl6Gtx?=
 =?us-ascii?Q?nUIBqKWeudg75RPDknhva42WM5RCXwY3YCAtT6Yylow/T37rj4nzYRh9p313?=
 =?us-ascii?Q?YbKo+hrNQ6t39oohCfm8OlZSyj/KxSotppaYKVHQEILuBvk2Oz1t5Wv3HFsm?=
 =?us-ascii?Q?cud038TAPoxdEAP8ccR+QAILsUVSWBmG0VTCv3uz5qg8O0mj3KjNSzmDnScz?=
 =?us-ascii?Q?vDMvg4+jGazwkoel5KuI3D/rtJU28EwAlk5HJdIvTKvo0M0GNnENBeWKbiTL?=
 =?us-ascii?Q?vSNjIl34p8CNJN+nqXOTOUvLXyhmbrjxCMieeJTB5/S//siCT6J68NJqhoB9?=
 =?us-ascii?Q?fDyDRMDDlyrX210JnThSjbK6mcBJ5O0W/1bjkuXxrm5UE0pZq+M0CtQSVHZC?=
 =?us-ascii?Q?4/gUI6hnLHQwlULsSScl4+IZIda6z6NbbNiJGPDeaiI7nVKnsX+FaZeq9x/3?=
 =?us-ascii?Q?ufbVJ5lQ9UJOwzij70KmzBPIi9umddcVtmRLdkLW9xDyop6vkWuLNjs9JIIZ?=
 =?us-ascii?Q?PFt4xQ6tNYlC7j1QiqKt6tA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d24ef3f-9c23-48c6-c9a2-08dd0e739e40
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 23:39:49.6688 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 73yf712a/J0Epd9Z9DkPQwnEd0wfSKc00f5DH7TlNmaWp3bYk9EZfCzVM3tQFzjqqDCYe367bwfrI8HSQmaGQlVq5v32JnHTv+u18rs6/hfxS8Y+tLhegTEACEXbJk6D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13294
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


Hi Laurent

Thank you for the reply

> > Hi Maarten, Maxime, Thomas
> > Cc Laurent
> > 
> > The patch has been created as 1 patch for "drivers/gpu/drm", but this time
> > I have finely disassembled the patch into 3 patches.
> 
> Thomas has merged v6 in drm-misc in commit 17558f97fe62fbe14757880a0aa998bfd194ea95

Yeah, I have noticed about it, and could find it on linux-next/master
before, but can't today. So I thought it was rejected for some reasons...

Thank you for your help !!

Best regards
---
Kuninori Morimoto
