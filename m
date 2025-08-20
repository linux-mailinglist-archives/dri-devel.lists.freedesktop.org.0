Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A36C0B2D2BC
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 05:53:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3056A10E698;
	Wed, 20 Aug 2025 03:53:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="H17+oLdW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011031.outbound.protection.outlook.com
 [40.107.130.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 020B510E698;
 Wed, 20 Aug 2025 03:53:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=szE/ZYlq2+MAZ/nJSlzoTno55sWa8Ksr0P7Y22CDzo3ej8gmJ3udDTA/oUK/h50tNtg/s6jVmlqkL9frp6zokhvjFfTu6G9XWcRbhGTDiKS4zXJfoy/g43zkBbT8elC4C5E/DBgizhyORNDADcMZ0zGdF5Y0y31xSLdJF8dEhG/m48/Ko+Vk3d27Vf5uhpI7v/GWTtS2cyM2xdjzLc/7yeeIShrK5V8OmG81Rb6erEjHO7aC4X/+/L+1sLvqJ4Dz1zc2h5CoowlmPxC/IC8H7n/YiWxqV0Fw2dLlxT54ryxSJhvGmu9fOnx/YiT1fAhkT2+PXX3CjkOEGZ/s/iB4kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vNeB8rqPo1pu7Kkf3JybbCm932A70fKERgVPdA429xU=;
 b=SPt/2777ZnnD6X46LwvJUkDHf/7sJD6BeL3bBEFxQnE2P8i18Q4GGwMF+0EHv5AZU3JIKVMXTNKEkRU4OKU6U4141UcHcBIdGEtol5OUpScFsiXSnSl9dFJgFga+G5Y3JjTn3n71Jn4tIiRSfnrezEstR1RnISuE/XFAF6JBLEXUNNo91i+LKuDWP48qYpi+HHDdocqZRg0IR/8MP5CYyBCgiSveNkfw8XtkIphKzPqmw9oXZWZbfWW1yStt5PvpcC+HAEdWovgsUIMoD04/KYsKa07H/x48A0UNaJCmoY1u45zCgZMbWtuOdGykscSImnjiQANCnLrz3+/+pgtjSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vNeB8rqPo1pu7Kkf3JybbCm932A70fKERgVPdA429xU=;
 b=H17+oLdWj5ez1CrgovZ46vqhBnYA8lfkp9rtH2DvlBsoUzxTtVInFdsuwmSQdElyCMzEu62LXN6fkvY9b3+eauZMIVGkJ+reXD/BHQ4zgx5ps3zgcbWXbe4mi4PARjXDzpgkR70oP+UMi6yQbxDajmX3nR8oYsZgZAT72FPuNxq0oicBdCOtK/1JDmxqJm8hIOklNHwFbJ6eBrwn0yE9fV/EX0tRDIfoxQ9SG3dupA5hbiNF3U8Sc0YGQVtuxrMllohVAlxW+l668+F+kAzgpon+rzH3v6pUtsyunq3D7d6LZH8g1xIVgA3TNedRmNgZNFU29EDRgmjgoIa2DufP+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DU0PR04MB9695.eurprd04.prod.outlook.com (2603:10a6:10:321::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Wed, 20 Aug
 2025 03:53:23 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.9052.012; Wed, 20 Aug 2025
 03:53:23 +0000
Message-ID: <72108638-dc4b-4917-be7d-a664961e3761@nxp.com>
Date: Wed, 20 Aug 2025 11:54:53 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] drm/bridge: synopsys/dw-hdmi-qp: declare supported
 infoframes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
References: <20250819-drm-limit-infoframes-v2-0-7595dda24fbd@oss.qualcomm.com>
 <20250819-drm-limit-infoframes-v2-5-7595dda24fbd@oss.qualcomm.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250819-drm-limit-infoframes-v2-5-7595dda24fbd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0163.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::19) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DU0PR04MB9695:EE_
X-MS-Office365-Filtering-Correlation-Id: cbb07912-5ae3-4719-93cf-08dddf9d1c0a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|19092799006|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c3FUS3U4ejU4SDRDVWR5MHhqQldUK0VkQ3A1N3BRVm5LTXRvbWdYRStxWjFK?=
 =?utf-8?B?YmwzZERkekt2Sk9IRzFNQndEbjE1Q29oQk1OZUt1NUpKR24wOEh3cXc5c1A2?=
 =?utf-8?B?bHhSQyt2eWtpckk5WGh1WWVGTGlUMXRkM2RYSlZqbjhFd0xnSktHNCs3M01p?=
 =?utf-8?B?Z1FMOUJjVVlNbGJPTHNRbFNyaDdnVEV0LzdmeVZiT3duRUx1aXBUT1RpdzJv?=
 =?utf-8?B?NkFmWVE0TGJkZlp2SVlSdk14VEUzT0xLSXlFenk0V3R6L0pOd3RKWTRxR3dn?=
 =?utf-8?B?SGRJTktuejBLZnAvc0tKQy9nd3N2V2o5YmRxbVpiT05xeXRKY2c0WWd6Q3R5?=
 =?utf-8?B?aUw1dEtIeHFUQit2MlpoNWdXWlJWMUc0UlB5ckJLUytJZnB5YUZheXkrQUhi?=
 =?utf-8?B?UFh0dGVBcGh0dnd0VXJ6UUlDeExCaFZWV051Y3NJU1BEeW9SOGVHNG5kWERH?=
 =?utf-8?B?UENPVmI1cVkzQWI0SGlYVUtZcWlEWmFQa2hsaUEvN2RQZVllVlhMZ3VrZkMw?=
 =?utf-8?B?bG9IVnBpZjYvTzdCalc4Y3R2OVl6SVdDNFF0dHFMbFpmOURKUFNZMTZUTytI?=
 =?utf-8?B?Q1FOMmZXL08wWjJDQmtZR1ZNcUpqM0dvMkE1L0ViMW1EM2piYlAzWUc4Tys0?=
 =?utf-8?B?d1NBcXRickh1aWt3WUlvKzlqSUFBSU14VjVMYk5LQmVrMWhNcHd5aVRKYXJW?=
 =?utf-8?B?elpBOENqdlNUQzN1cXYrMHVoR2JnZnc3cUhMWEZxMHBTaDJ0NlZtNUlhVDh1?=
 =?utf-8?B?MHBLN3ZmWTJWemE1b1BSQk5qbXlGM1BwTGYrdERINTdsaFc2VXN2UWljVm9F?=
 =?utf-8?B?Uk5Xd3VZR3hlTXhYaG5pY3dadlo3U0RrQ29LTGZIRmNNVTRVY1gyRXU2TTEw?=
 =?utf-8?B?RERiTGk2ZzV1dEcyTlF3UEdaMTJvbXBLNWRmZUpCSU5KVVFkOEV6TEw4dFRu?=
 =?utf-8?B?S3YxdHBSVUs1MXFIRTdtSEErVG1XNEhSQ2Vuc1Q5aGgrZUQ0bzMza0JabVlj?=
 =?utf-8?B?M0YxbEFXb1VYdjRFSUswTVZoeXg0Q2NNRkhjcnZaSytGWHFkTEZIQndtWjBK?=
 =?utf-8?B?eVNMK1ZNSlF3d290L2JFdTF3UzU2SDdtRUdJNkc2WTc2OXo0YkprS01TWVB0?=
 =?utf-8?B?cGluS1hPWjhlK2tuRUpDWEt4VTIxYUpxUVlVQUdueGNUNjFWeGN3bWJGUW5L?=
 =?utf-8?B?STNzMFIzVTFvdGgzUHBzb29GUHlQQ1QvUDZwTjFZR01wbXFHaFIxM2dSSDVu?=
 =?utf-8?B?NWRHdU5EZzY5dkFFUlNlUDNUZ2t6MkNtKzlLZ2QyUXBtU1pNUUFWRTJRS01q?=
 =?utf-8?B?ZXpMWjJ5Ly8xN09jenlFTENoOVh6OWJSNm82UEFHUTJob0lxbk00RDlyOWd3?=
 =?utf-8?B?UTM1WjhiTUx2bVRrQVU1SG5GUDBadk5zRFJTZ25nUW4wRGtSZHQyVG9qWE9B?=
 =?utf-8?B?YjhLZk1NdnM1SVlnMTZ5MHB5cm5LdnQ5Ni80NFAwZDZmTUV3RXJNbHFZdXJS?=
 =?utf-8?B?Wk44ZVZsZWViYWFnV1hicC9NOFpaQTREYmhWWnBGMHR0M2cydmxvTFhDY292?=
 =?utf-8?B?Ym1vcEcvVVd4UWRWUlRyaVZzSklmaW00c3dLbUFRZVRtZkVQWG9ndktpWUZY?=
 =?utf-8?B?TWNacGMxVzQ4U2NPWXBWaWF2NzF0MGRZZzR3NjRJWGV3MGNseHBxWUFsamZn?=
 =?utf-8?B?bW9zb3Vwdk5vWEpVWEJQOHp2WnpUbXZwZm9XbEdCOWo3RFdsOFNBU2xqY2dY?=
 =?utf-8?B?MDBSeDZNSjlXaGlkOFNRSTR1blBYN1puT0xNeEozc0dMbWw3a01xM2MrTWVo?=
 =?utf-8?B?N0ErVWdDc3drczNodkRlLy9kb2FDTVNnTHhzRnl3WVNjR2hoZXQ0UW41ZW5Z?=
 =?utf-8?B?L2hUUkdWdkhpSEhodm1ZRXkvRktmUW9PT0VVcU5hMnpXdkZCOXBadGpidExl?=
 =?utf-8?B?RVBDSGNyQnNPWHlSTDlIQVdDYWdxKzMxSjlhT3dJTFM3aFNzbG9iMEpwL2RN?=
 =?utf-8?B?NEM5TzdkeHpnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(19092799006)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2NVZVVOck9wM1dXVmhSZHFNalptazlPeVBkMm4za2g1SUF2VlNLWU9MeCt0?=
 =?utf-8?B?ZkFoa0ZzYitISWtJRXlYTWtXYWluRVFNRi9kaDl1bmY4emkybGtuWG81UlVS?=
 =?utf-8?B?TVU0ZVFsUTlmMjZtYzRrMnNjRGc0ZEdNRytzU3ViZGdBZ0xkSWY0L2hkSVQz?=
 =?utf-8?B?Wldzc3NHV0E3dkNaWlIrRlNSQTZMeXc3MUVyUklXTExBcVIxaGgzMkZFMThw?=
 =?utf-8?B?VmlVZ2QrTWdYcFdNbzVhcGVNYXdPTXBxTlp3UStNdHl5TzVzT1MzNEZNOHFQ?=
 =?utf-8?B?OWpURHdEejFSbllyWTFzaUc1SXBkeG1DWjQ5eDRPVEZrWWg1UDc4NEp5Tzlu?=
 =?utf-8?B?NHA4RmxpQk9XL3FzdjRPMGVkcWsvVk5qT2pSZHowT1NxanhQYnhjcGtPSHlK?=
 =?utf-8?B?WGtpQ0tTNThLNjA2ZnIzRE5xbFh4dlFja0k2V0ZqdTVsd1JZT0pBRWdvcEJm?=
 =?utf-8?B?Q2UvbStEd2FtNjVDUzlFVFZXODcySWdwc0g4RHA0Zkg4SDIycktBYis0UVZ4?=
 =?utf-8?B?Z3ZVbDZFckJiTHRtbno5d21yTmphelhlZGJ4WlEyZ0VsRVh4Ulc5elNpRHZB?=
 =?utf-8?B?VVRBYzltOGdCeXJXcEVHaGM3Sk5jNFgyMlk5a0lOQWRPOHZ2RzNETWVDbCtx?=
 =?utf-8?B?bGJTQjhjWlRjRWZzK3JQRUNYSWVGVkFkNmxPZ0wzRG5pSUpmN3NMR04wNmdG?=
 =?utf-8?B?NWFxTHF4WmJWQ1dlbTQ2eGNWSTRmcTY2UlRESzZtQXVyaXFyYWh5ZUNKdUdq?=
 =?utf-8?B?VTVBRnFObnhWbTcyY1JOZW0zTGlzdStURnBsREJsN0UyZ2dBb0E3RjBOY0xN?=
 =?utf-8?B?MHFGM2dvMWNEakhkVGx1NG80czV2aE04cDB4aVpScXYyQUYzRzdYUnlWOHpq?=
 =?utf-8?B?STQvVHEzbXcvMEplMDcxNVV4Yi9oWjNORHNLZEx6V0VrRGNHWkQrVThXQXNN?=
 =?utf-8?B?VmpXcUFQNVFwQnN4YzhHb3FrR1dzTm90ZytydFMrdnFvSDR4dm82a0hxOCtN?=
 =?utf-8?B?UUF1bTdIRUswN1dna0xaM2JLWFlqdVF3R08zR3BSUVB1c2Z6aUxzc2FpQzBH?=
 =?utf-8?B?WFBvbUNxTnpBK2lUblM3Y3RrSHdxRCt0Z1o4VlFXT2wwMlI0TnExS2REVmdp?=
 =?utf-8?B?M2Y3YjR2cWFld2gwZWR3UURRZ1hMNXpzay8vK1RkK3hXS1BpeGtmczZ6NlI0?=
 =?utf-8?B?VmVpZkxtVytKQXVwYlNDRldpT3Zudzh5YTcwaWdOcnA2S1ZxZUdPb3EvZXpC?=
 =?utf-8?B?S2VVMUhqNTNRNW5HZWN3eVYxMVI3MlQ5S3d6cmdPdWdteS9ocmpUL0Y2Rmo4?=
 =?utf-8?B?YUVmZlptNkkyL0lIeU9sZzV5YUlqOWFrYTFkZmhJeW1oUW55VGtPNU11WlN6?=
 =?utf-8?B?dGM5WWVqL3N4RWdXayswZUh4dlBmZnFWRG9zWTFDak9haTM4YXJsTmwyRy94?=
 =?utf-8?B?bXJ0dGNVS203dW40VkE2OStGNWgrb3p5ZVZvb1YrUXhzWCsvYkhNZmk3OTZx?=
 =?utf-8?B?K2pvSU5XTkZBYy9jRlhLWFpJT3lxU0IwWVorRmFwSnJ5OWJ1d0NEWjNhcHZY?=
 =?utf-8?B?V0dzU05ZQkxMUzNSS0FRbGswMUUvdmpHWE45REhqT290V1BzdlJXakY0VVpt?=
 =?utf-8?B?K1o5Mk8xYTRxc3dMOU9Wb1VWNGtpNFNxemE5RUxScE9hRkFtdzN5L1ZhTEFO?=
 =?utf-8?B?Q243NGZraGlrbGwwSGt0R1k3N3JvNGVHQitzamswR3FvZmZOSnczY2wxQUd6?=
 =?utf-8?B?ZkRrZjJKSG1hNGtGcUhPc2xFeGFvSkJQLzZFVXBqbnpxeVFnS25FSVI3akt0?=
 =?utf-8?B?UlNBekVMc1dPMDB1bWhHdTRwUmZmQjBBQU9nZnRDZS9jREpUbUZtbVQ0aVd2?=
 =?utf-8?B?NHFpaWVvMjI4NkJkbGZQbXB3aGlac21LdVJNT3VpcVE0dUJMM2lVSmwwdUNJ?=
 =?utf-8?B?L203aEhuZkFIYUducGlkYmV4TlVUdHNiV0xJamRtQVVOcTd0KzRodk00RkE3?=
 =?utf-8?B?djd2dHowMXQ1Mmo3aFBTdDV4bm5QYWY2WkhUTVJna0RqRjJ2VkNFdGN6NlV5?=
 =?utf-8?B?UTQvTkFWNXNEZngyWFJRbGZkREE1bSt6dUo0Z0NoNVN4Q0lzZGNQeHB4VVJR?=
 =?utf-8?Q?IXiEIWMEi8c3hCiGbPAM1l/kU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbb07912-5ae3-4719-93cf-08dddf9d1c0a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 03:53:23.1022 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0W4ibwfxjIlYNzIL+ybM597j4b4ksrRX0q2rD0jQXG3hoc/7VPzgRb/C/iAj09AitBBmmUtwQXdibcm9qU9LGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9695
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

On 08/19/2025, Dmitry Baryshkov wrote:
> Declare which infoframes are supported via the .hdmi_write_infoframe()
> interface.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> index 39332c57f2c54296f39e27612544f4fbf923863f..b982c2504a3112a77fbc8df9a39236cb8e625ea4 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> @@ -1084,6 +1084,9 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
>  	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
>  	hdmi->bridge.vendor = "Synopsys";
>  	hdmi->bridge.product = "DW HDMI QP TX";
> +	hdmi->bridge.supported_infoframes = DRM_CONNECTOR_INFOFRAME_AUDIO |
> +		DRM_CONNECTOR_INFOFRAME_AVI |
> +		DRM_CONNECTOR_INFOFRAME_DRM,

Same, use ';', not ','.  And align DRM_CONNECTOR_INFOFRAME_* veritcally.

>  
>  	hdmi->bridge.ddc = dw_hdmi_qp_i2c_adapter(hdmi);
>  	if (IS_ERR(hdmi->bridge.ddc))
> 


-- 
Regards,
Liu Ying
