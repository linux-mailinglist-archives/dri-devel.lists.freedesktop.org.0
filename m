Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1158989D19
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 10:44:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0AD889151;
	Mon, 30 Sep 2024 08:44:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="fkXBNU2r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11012009.outbound.protection.outlook.com [52.101.66.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B78789151
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 08:44:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ABcNP4oibiFCeypWMksDqhhJp91DgDOLGImcP+uUrEMOWDRFwOqvRgkvPX3RBxpwvD9rxh5ZbyL0p0vab9od4u2dPBwaZl85nxpGujRUHeSNvkFwp9O4dg0sQCjJd0UoHK1HDeS+jYXlCpp85gqTJasIplUqyNoYuIcM186p00LVP3irShOhi/ThvzJLWpYn2mJaJihPHI85xtbNXkH9uGkSJxr7tE2m2ADOopRgA/ZIh3d0MdRU+ZGYVxJ428sxXxPtd5nAcwo94JkWmYnxiC3VqVB5+NzbvGW05llZP6KRR2SxLLY5unAhvW7czpoSAPJvYrvWpffpXmFjdBORxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uMs50eefJPObkuty3lpU8Q+bVLjUv7VLzOdtnob3VEY=;
 b=TNGMrQQEtiqyLLXkpCjHwkMoigvs2GAoNTl6x9WBm+792QNxNwDpwmWmuiM6vy5ep21sACvyrl8HpS10Lp6BMW0emE8ijPBxmUySgq84ZgxN21qKUUKUj9bvEC6tsP3LbsZ8Zt7W7u7lmJGzrpjKOMZDJZGUZgd8cg1Y8lB2daLhZbmclK6jbACtzr5vwMcqmm5ENlIn07Bn0G41tNI1zZAdY4Yl8/ycif3o8xoPt/r485k9RvbjHgIriilGpxQbY7n3MsS3WImOgsAQRcx/UzlzEubwrnapTp8b6wtQ3RmFwEZ2kjO/PqtZfTDZm5wjQ3KidRvl0jvq/EN1PDQG9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uMs50eefJPObkuty3lpU8Q+bVLjUv7VLzOdtnob3VEY=;
 b=fkXBNU2r+Cx7+CBDSVIdRVsSvYaEVdEEM+wqjhv5YYont8G6FZH0s21fvmrr/4GOkZKdGSkzk28sopBrS1FENlGOWQuGNFJm4B20g6eISBxtJipI46GFUaAkx9WHJoTCrZGsA0E28X0eBiCxmnm9hwHk95hp5wywo5fgk6AwLrfwSaAHcQoWrBEGqPI6rP7fopkCEDuUAi6aJZWaeccwQv2Lmimz54PnkzRK35/wUbcUq7WmQfJDpMncJJx5VRbXLcG8Jb2AA5H/4ldLWXoWfB+zkRA4WQPzu5PGKdHrJZAgHHYBmwh4K37ipQp8JWu8ENFV87eW9QpKLYJyzXIeZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8970.eurprd04.prod.outlook.com (2603:10a6:20b:409::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Mon, 30 Sep
 2024 08:43:57 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 08:43:56 +0000
Message-ID: <2017eb23-a2a9-4fa5-8d9f-675cc6d114ec@nxp.com>
Date: Mon, 30 Sep 2024 16:44:17 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] drm/bridge: Add ITE IT6263 LVDS to HDMI converter
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 catalin.marinas@arm.com, will@kernel.org, quic_bjorande@quicinc.com,
 geert+renesas@glider.be, dmitry.baryshkov@linaro.org, arnd@arndb.de,
 nfraprado@collabora.com, o.rempel@pengutronix.de, y.moog@phytec.de
References: <20240930052903.168881-1-victor.liu@nxp.com>
 <20240930052903.168881-7-victor.liu@nxp.com>
 <y4ala34bejzmw5wt3vw5ncoxdzpzda2cwi7bdzve5bn4udmr3b@eiguckpaui6d>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <y4ala34bejzmw5wt3vw5ncoxdzpzda2cwi7bdzve5bn4udmr3b@eiguckpaui6d>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0036.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::11) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB8970:EE_
X-MS-Office365-Filtering-Correlation-Id: 83affbb3-5c32-44de-b2b5-08dce12c055e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eGVHNE96MWRlaFVnOWpSS1JWWC9leEZUQ1FvRmUrZUs4c0Y4dzM1Si8rODZs?=
 =?utf-8?B?NGNkZWpITjlJV0J2TUVXaWwwK0RxK01YZDQ2dVdtUktQaXo4Nk5VMHc1d21O?=
 =?utf-8?B?T1l4Qk0zS0JqSlc4djBxbWZRbnNodGhBNnRQbnhDRVI2cEpob3B3R1M1UFRE?=
 =?utf-8?B?VHVrcSswUHZxMGF5RnUzQ2lEMXcxTElya2JTbnNINi9tdmk4ZkR1WlF6SWhC?=
 =?utf-8?B?SWt1YUtOZ2JGeWtXYms2Z1YrMkRUcHMxblJMSlRTL3d0S0xyU1RWQVByUW1x?=
 =?utf-8?B?RHJQN3ozK0Q1a2IvcjlEUmpsaWlQOG1hTWN0eVhCYk91YUp5MjcvMVlnY2xs?=
 =?utf-8?B?azRpVytmdFRBMmk1cG9sMEYxSDFOU29GZFpOYVFzb01jbHEwNzRjVkhrYTZF?=
 =?utf-8?B?UkpYY1JVL21BR2pnRVNLMDRkR3pBQm5nNUdScFRMODM2TW55NHlkblA0VGpT?=
 =?utf-8?B?bWs2NEo5QkZ0ZGI1R1ZVREp4V3lQa0xPalBNeFNKc3pJSWttY2xQdm92bEly?=
 =?utf-8?B?aWZzUVZENTFXdEFQdmNJL2cvVUxYMXh1ZjQrRWdxUTZJelJkRnF6K3pzYm5H?=
 =?utf-8?B?RUh2TnQ1YU1xWGttQVhmOG9ta2ZZQ21jSThKTFR4SVN4TExDVkxaNnV1cEZ5?=
 =?utf-8?B?YVhwOUZscFFFSXZNZ1h5MmNoNHRzV1ZpQytQelYzSmpBUlBDMi80eWltdXdT?=
 =?utf-8?B?ZkJ0cTNBWHFSRUU4dlJORzZhaTF1NTJ4ZGlnWG5lY2Q5Ty9pNDIrZEZvN2dx?=
 =?utf-8?B?RjFYVHFLRi9WekQ3QlNvVEZuMXNkM1QwY1Fyb1E2aDl6SFVoVHdTSFRXUk1Y?=
 =?utf-8?B?dXNWMkFzam9PTVdVK00yMTV4Vlc4WVJkY2svKzluRlV6d1NPMms0OFhNWTlT?=
 =?utf-8?B?SmxRSXE5WXZoS282dGhPMHNDNVRLYUU4NytlbE9uWkxmVUZIb1BYZnpoazlK?=
 =?utf-8?B?SG1pazlOYTQ2QUNLc1UwUDl6TldWYnpQeXhIbW9PVTBuSjMyc0wrQkp3N2FI?=
 =?utf-8?B?MUZaU1J6anl4OC9JeUJQRVE4dnIvbk9aLzMrVUxIeFlKcExmRmtnNXN3RkZs?=
 =?utf-8?B?VmZIUDJkdnBnMW5vaGFSbktiWWF0ZGdTMlNwNmhPY2NuSFRUcEplc2trU0tY?=
 =?utf-8?B?Zzhmc2p1T2ZYSmtmM05ER3FaajRjYmRVSWZXNUFDV2NHbHNJQ2ovK0l0K3po?=
 =?utf-8?B?SnE4S0gzcGRrbmREdWhkUXpoRkp0ZDlMYWg2RUF1UnA5VVQ3Umw0UkZZOVdV?=
 =?utf-8?B?VTVoVHNqZUl1V0JNeFJGMjVPNHJ5Q0psUXkrZkpEV3Q1emlaUXUzVzFwTU9D?=
 =?utf-8?B?VjUvZHFMc01xNjlOZ3lSSXZUU1BSMG4wbmwwcU5xZmdTQkg4NGtFVnBxT1gr?=
 =?utf-8?B?Y0thS2xpNVRTa2J1M0tlUkFjSHk5QVdLcEU0V1A1SWpxYnZVNTRSUitabjRk?=
 =?utf-8?B?UVdSSE9MSFZUOXZsb282a3JzN24waEFCVTRkdy9TaTVWN3NvaU1vZHJmcE5X?=
 =?utf-8?B?dU9oNHd0TzV4eUtzYUQ3eWJxK2J2aGJRdklRK1NhMnN2VVlzb2lQNzhQeUxp?=
 =?utf-8?B?ckZQTkxGY0NldUtiS01IQStDQWpIanZ2cEZuRmFoVFRWc1VremhuVXQzQUc2?=
 =?utf-8?B?eGlDRHRIOWZ2MTRiVjNGcG9uN3RTOXpraHJCcEdmU2xEdHpyUlIxZWF2Yzhp?=
 =?utf-8?B?a1JmalVFQkgwSWw5R2Z4YUFheHJGSmVmTnAwMlY0MVd3eGx0ZFpqTEFNUE94?=
 =?utf-8?B?SWlMeUdiVkROaFNpNjM1UFhKVGNVOXVtSUkrb01veDF2REQ4ck5EWlBCOGMv?=
 =?utf-8?B?RmJWd3Buek5HdzVzeGRodz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d25SQTNTcERJL0NZaUJKU2tSRGVjTTRMSXhyWXRVaHhBOFVPYWdUVXpET1dr?=
 =?utf-8?B?cG5FS2szRDFzQ2pyelM4MU00OE40c2kvZVdVQnZ1Z1lsQW10UnY1WG1oMUNn?=
 =?utf-8?B?anNZQ3pRWVAvZzdPb1VhcitVOWJBdUd6TlU2ZDdYZHM3eXF1a2REOTN5MjIr?=
 =?utf-8?B?Wlg3Vy9QWEJBZjJlZlBHV2lKRUUvcFRRbWJxdkRNMEFtaVVxTUVXb3VNY3BL?=
 =?utf-8?B?SEV1TVNxSEg3dmR4VnZpUG9UVS9jUnhCNnhGT2xiME9QeVFSc0cveE5GM0pj?=
 =?utf-8?B?cTJkTnlITUhhaHIwVnpsNEZsVXVoUDZDYk1OMmVocUE5VjIzNmpUTkJFL01m?=
 =?utf-8?B?NlNZR2VrenQrVEtmTEd1L2U5ZVRhQlNmS04yWGw0K1pUSndaMlMxTUVZVXdK?=
 =?utf-8?B?eHpXNEZMc1NsQ1hoUS9mSE90cVY5TW1FMzYvWUJRUkhORHNqMU90V3pPaHl0?=
 =?utf-8?B?d1d5WUt3M3JGeG1LbFkwbHhEM2h6VUJocWtCbzlOa0VCVnphQVc3eDZLZTUr?=
 =?utf-8?B?R0UvN1RjcFJ6SDhSQ3ord2J0eEVoS2ZrVCt6RGl1SWRFRGdsSDZUS2dOdWV5?=
 =?utf-8?B?b0RZLzRMVVhIQnFjNUEwNEE1YVc0QlEyT3hOZ1kwSDdTOWswVnBBUlVrazlR?=
 =?utf-8?B?WkgxWjFBWi9DSnpiNnIrdDFraiswSUk5NVFOYWEyVzAyWEpmTU1hS2xuWlJ3?=
 =?utf-8?B?WGdVc251S1YzZzBjZC8yN01oTmdHSEo2cWc5SHRmSG1nZ24yMm1oM0txYy9n?=
 =?utf-8?B?Uy9hU0lJZ1RGTEVBZkJ4Y3VNZ0hGbkVhRThzVTlLU3lBd0hPSm4wNkFiSWsz?=
 =?utf-8?B?Sk9xR2twYjdYaWtTcEZqMThRLy9Lc2M1MFY3aFBrQmVjM0pGUlBLb0pzSDY2?=
 =?utf-8?B?SDhyalN0U0kzamxBbEhqUUwzV1dvZW1Da1FMQVhESm5rSXNYdFJTLytHSW9o?=
 =?utf-8?B?ZmR1N0lNek9KbThEUG1hRDJtN3g0SzhrQlAxSVNGY296L1VnYUUvSTc2eEIv?=
 =?utf-8?B?cGg1TnpsbU1KTUtNdTlTZDBKUWlWcVdjUVozbHN3aGxEWEY2TXpCaXQySjFH?=
 =?utf-8?B?SlZHUmJuT2dNQWdOUjB4bE9sVGhoaFJYRmhsTE5mZlllbnFQU2hCb1J0bVow?=
 =?utf-8?B?M2tXc3Rab2lPYlBidWlHSEhLVjNWQmMwRkVPaWZla1BRcDhVVmpnV1BFd1pw?=
 =?utf-8?B?ejV3K2JFMzNjcUpLdWdQN3I4TTR6MWR6NEw4a2p5Y05tNXZLZStvR2tYek8v?=
 =?utf-8?B?SXVkUVVQSURmQ3NJcHVIa0RUbkw5dTRiTlJtRlFoWkQxOFBDUXphanFjZlhK?=
 =?utf-8?B?RE5TdzZDa3J1MXhpRWlMUDlROW1rNWw0bFFtOEh5K3RVQjc2My9LYUVUTUpo?=
 =?utf-8?B?VGd4YkZSeThUNHZtSGpHU0xQTDg1YkNpYVd1MVY0dWdrQjdKOWJRdE5TQXVP?=
 =?utf-8?B?YTFML056bG95TXYwdGdVL0ZzNzR2Q1FxZ1AvaUNNNnJEWlIwZUQraSs3K3lQ?=
 =?utf-8?B?UWxER0h2L2laS1MwVXdzeXVtZEJBd2lXOTV1RmVqUk81SDVZQkdnc1pUb29Z?=
 =?utf-8?B?Q1V0dU1xbFlyaUpqaEZ3UXJzRjBSdVo0bDI1ZmVjbHZSM0UxOEhKRmh3dmxv?=
 =?utf-8?B?cHBPalI5Nzh5bEc2SjZtWlBRcGJpTndBeVozZ3grRFR1b2VRL3Vxam8ydnh2?=
 =?utf-8?B?YlpYUXRYUXptVG0rSFVrNTJWSHJiVXEyS29oWWVsMWhrc1JvOWdlYlZrbjFR?=
 =?utf-8?B?KytkNjZXdCs0bzZLb2RDLzU5VTVKY3kzdG9tQlU3bE9mS09EWGcxYkhzeHVk?=
 =?utf-8?B?Ulk4UkxQL3BhR0JPK2F4UFRCbDJDN0wwZnZxVTRqVjJidnVvOHpkS0Z4ZjVN?=
 =?utf-8?B?VVZ2Vmt6cE9CMXVSMGt0OVkvWjlOZkMrL2djaU16QU9vVHlCRTNVTWJaOXg5?=
 =?utf-8?B?a05OWk1KR0RsdEsvOHdkMEY2dnN6TE1VOWRzb1RwbDRxK1Jqamd5S0hnUGVT?=
 =?utf-8?B?Q2lYV1BXVE1FLzM2TU5qLzg2bmhvcjRxT2xoTXNzbFFGSGRwWWxZS3R6NmFj?=
 =?utf-8?B?YWVSOXVFMHdiK0R1OGVsN2ZDUFptUzJ4ZExvY0YxVFlsRDIzQnpad2tyUmVh?=
 =?utf-8?Q?2vtaOYgq1m4+pmid7TNbnAydl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83affbb3-5c32-44de-b2b5-08dce12c055e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 08:43:56.7413 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ra4gdZ5ER9EKsGzBH+JGpyyIxawORAUyxlRquEAkZstK4zBK66NHBu1oBdkDJQ9NgUX8qvg6hFK92oiB0Ne35Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8970
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

On 09/30/2024, Maxime Ripard wrote:
> Hi,

Hi,

> 
> On Mon, Sep 30, 2024 at 01:29:01PM GMT, Liu Ying wrote:
>> Add basic HDMI video output support. Currently, only RGB888 output
>> pixel format is supported.  At the LVDS input side, the driver
>> supports single LVDS link and dual LVDS links with "jeida-24" LVDS
>> mapping.
>>
>> Product link:
>> https://www.ite.com.tw/en/product/cate1/IT6263
>>
>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> 
> Generally speaking, you need to use the new HDMI bridge infrastructure.
> There's a lot of required things you're not dealing with here (such as
> infoframes)

I'll add AVI infoframe support in the next version.
My system doesn't wire up any audio line to IT6263, so I cannot
add audio infoframe.  I hope this is enough.

> 
> Also, you should add a MAINTAINERS entry

Ok, will add this.

> 
> Maxime

-- 
Regards,
Liu Ying

