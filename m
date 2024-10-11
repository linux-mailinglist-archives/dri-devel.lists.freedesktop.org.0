Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 695B9999AF5
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 05:10:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3A1510EA1E;
	Fri, 11 Oct 2024 03:10:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="hn7VHdM2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010018.outbound.protection.outlook.com [52.101.69.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4F8910EA1D
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 03:10:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OZqO6T8TeNWeH/a69E6h2TPYvvBHDBXQImV+G3fIWGt/LNbHdrLkqVtSLw8JJg+7AU3Hgq5O99e4bOU0zEXHrbFvIjNI/mkOCmFhhoPr2wQHVpbHWXjbEuLZx6lDq93+enTJRkutuHAGVOLKAwBeULAsZs1EdglwCdVYuGCork6nzs+jLqA62gtTiEyMqiRN73N+g66+Eve7RJMECtsNXWvw/c/ccfErYwDh1b07DK2KMC8b9dqH6NrUENH3RHpwnVCdN5YZrTX0V1mk8asgY5y9LLEX8EaYXGlMwCFJBtqFZNdyHoYt23/d36DMKvo4oIpIxDUIe9M+UD/MPcv9tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hD6UdBxcPprKsOP0ysJrl1lTEmI+gilQ37/g9hfb3ds=;
 b=OKqfn3uTxdJIDwF8txItNf918SHDIBE/awYSdwDicqooNQKWUDj3QYZ8AdvIDGU5nt6HnoJv9IWn64dOb5ASNpmaLMHZTaPUaSzLDK2LkH5ScMaQY96t61cmNSFWHaAiwBD9zdAdsISi+O2VnVWyRcFni3eZP/HYtZq06bYJcZfGSf6x33hwTaEh4/Drm+BZlJvLUb2GGvie6ZEbk7nw02moyK5BEiQiY/099XE6hEOiSZ61DG/WBMYsxlNyiOrPkDspPURWGY+HUHuvQlNMp/nbVUXFvuN4Q6wkaT60RDobIot4prVhgEOHyInxS+F4JHlPWT68IWF0wubgi21r0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hD6UdBxcPprKsOP0ysJrl1lTEmI+gilQ37/g9hfb3ds=;
 b=hn7VHdM2TWUsQ56YJrhDLlDw8L7k1CZoAqDA4QC6trp8y2I0D045ss0BQP6zrr5verM4kTYPHCj0x+vaShlVTQqlAbQRt8L7VwfxKG+5uEPgM42asMs/ilwiTXOGp1VuSG7RcczMnM/3Fb3fprZPKkUax+kn6oKo/uaK8MNIXmWwMDrRbWVdmMCS1pxxTVX9mpZdcZmWdRyK1oXtM1N3+nu+W3XrHLN2RtG+qs0DjRtWHU2agkFwBN1NnSZfccj8lxNNWv1ICkaTMQY6bhUXdiXczVHAyHtORAyKsOPeMgtrSSspK2TfLwrcC1EHmzrWLVIPkLbsi4AIsiG61ai2ng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GVXPR04MB9994.eurprd04.prod.outlook.com (2603:10a6:150:11a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 11 Oct
 2024 03:09:57 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8048.017; Fri, 11 Oct 2024
 03:09:57 +0000
Message-ID: <23d9df90-cb80-4d97-afd6-5c573face4bc@nxp.com>
Date: Fri, 11 Oct 2024 11:10:23 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: lcdif: Use adjusted_mode .clock instead of
 .crtc_clock
To: Marek Vasut <marex@denx.de>, Isaac Scott <isaac.scott@ideasonboard.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>,
 "Lukas F . Hartmann" <lukas@mntmn.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Stefan Agner <stefan@agner.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, kernel@dh-electronics.com,
 linux-arm-kernel@lists.infradead.org, kieran.bingham@ideasonboard.com
References: <20240531202813.277109-1-marex@denx.de>
 <1897634.CQOukoFCf9@steina-w> <ab2eb32e-a458-4c9b-8324-27ccb00336c5@denx.de>
 <7ae0cd7774f4b3e30cc033a7e543546732dbced0.camel@ideasonboard.com>
 <de285fc0-728f-4ba0-86e0-0069d2cc9a35@denx.de>
 <64e18ceed5279a9346a6a1141f02ead93383bd1e.camel@ideasonboard.com>
 <84f505af-1066-4fcf-84b7-28c152c09b89@denx.de>
 <a7143bd9-a5e0-4afc-98ed-2d4d58171a32@nxp.com>
 <d70a9c51-6fd7-46fe-8009-b42d0ab4e142@denx.de>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <d70a9c51-6fd7-46fe-8009-b42d0ab4e142@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::14) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GVXPR04MB9994:EE_
X-MS-Office365-Filtering-Correlation-Id: caa000b8-02f3-47aa-dd84-08dce9a22f83
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZzBTeUpXQ2VtbUowd1ZnV0pNaGVIQ3FGNXNoa1JYWk5NN0VBTDhIdFdjVHVW?=
 =?utf-8?B?OE9hekFxNzRHNjZLK0grMmRROWorNm1zVEVzVFpzUEZxNEJTZGlHZm1XZDd0?=
 =?utf-8?B?Zmwzd0xWc0wzclI2QVFQZlk4N0tFZmVUOTd2eDBoakdzWCtEMUNOcm04MG54?=
 =?utf-8?B?WW1mQmZPdjVOZlA2TUc3ZTlMb2VkMXh1Q3d0MkRQdkFBclozVTMzREtmNS9M?=
 =?utf-8?B?RUtUZHRZUkJSQkMzZk51VUM1dXpZbm9QMWx2b3V5bm1iREExZkpQdDl5Tkl5?=
 =?utf-8?B?eVVyMW05ZFZsWWVYUjYzbXQvVHkySVhLWnVvd0c2dXExS2cvclhtT3NhQkMw?=
 =?utf-8?B?UmFEbjZiTEQ1UEVzTEVFV0dYaHNETlB5a1R5ZklNMFIxbVpJc2pnVktYbmE3?=
 =?utf-8?B?WDdWanFvNVVPNnhnM1Q3c2x0OGV5YWhnc0lNYlJXY3ZtZWZBVXoyYVVrYTRX?=
 =?utf-8?B?NFZjSkpnMkVnb0trcWF4UVd6elRFeTNETCtySFVHMlpEZWMvZmJNUDBzTFFa?=
 =?utf-8?B?WlRUWkh0VFRXSnlwTDZSc2VzVDJldGdUbHNYNzRBQlVLNmV3bDlPYkdITkZk?=
 =?utf-8?B?TXRFZ2hIYmExQ2NFTzBzQmZnYks4M3JyWnJsVXlpdWRKc2FSSTNHWGJPZjFr?=
 =?utf-8?B?bmpuUmw3b2VnMHMwNDQxaEl3ZkRhUlRQelppVnJkaVhlV0Racms5cjZlK0xT?=
 =?utf-8?B?MmRqRGVLZjdZNW1DRXh1TVdab01UMWFLZXFCd1FMYWtYWGtpN28yOHhySW9B?=
 =?utf-8?B?TTZMdGpxS1JUK3VYc1VtR01vRm5TUUNvVHZKMzdwU0xJNjVSMFR1RkVoVFdt?=
 =?utf-8?B?WXdNSlo4ekxTN1JLOERteis0bjY5Nmx4TGl3aXhKYjFLWVRnRUdyb1RlY3ln?=
 =?utf-8?B?NjJuZUhmdW1sRjU3Uk5LRkw4MU91eFRXU0FlSzliWllCeHFwbUxwdmhjVTVS?=
 =?utf-8?B?enp6UitqbWpsS2NLdmhRMkNpU3ZXb1hCdnd4aUVSZ2FOS3YyYVhhTHh1akxh?=
 =?utf-8?B?cHlrL3VPVGxKZCtybGdWRC9LZ21nNDdTZGZUSHpvUXhYWHdzaHhLTGpXOEU5?=
 =?utf-8?B?QmRFb3REOWlSNHBxSlhLTkVBRGxReXFCQWZadktwaHp6c1Q3cU44ZzV1WXZz?=
 =?utf-8?B?SEp6UDQwQ1BCZDhlNndKbldyODU0OEtjS3NKUmxIOGdRc3laMGVGc0tkNzB1?=
 =?utf-8?B?RGsxc1F1dVU1SlZzSCtJbU95UWlrTlRLdlV3QjE0am9aL3RQTHNyMzVQY3ZQ?=
 =?utf-8?B?OUhQR09BV1hsR0Q0SEo1Z2NLbWljSFhuQzZ1QUNHWWRNcHo5VW5BSkZSODJY?=
 =?utf-8?B?Ui9uaG5BNHIvVjRvcFY1MzBIaEV4MW5wRmlQQzQ3bWd2a1dRM2RPem9uVTVk?=
 =?utf-8?B?T2JKMVViWW9kZnplZnhnTGpTRzk0eGNPb1UvYW05eHIxL1lrRkZidzZseHJR?=
 =?utf-8?B?MlFpQzlsMG1EUnF5cHV2ZzZXbm1IWDliUDZEdTlDaFpWclVpWFF6VUdHSHk0?=
 =?utf-8?B?TWREa0RKUk5hYXhMUkR1d3RZaEZsSkZZcDYwVGdVYmw2dW9JTmJ4WkxiV1pq?=
 =?utf-8?B?OGFHRU5YbUVHTktkU1NFM2RFR08zamlScFhJZ2Npb3M5VjZZVkZVU1RLTis1?=
 =?utf-8?Q?KipKCGm2euYJJjhhVRTrBiLENzwsqlE8jnvU7htZ3YR8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlUrWXg0Mzg0Sll3aGdLTWxKZTJtMERXWVFoVVdsTlFwMkVnOEZ3U0ZRRGFO?=
 =?utf-8?B?ZUNnR1l3dmh1V0dEWFByRTBTdGthVnBmVDBNamE2aytVR1ltMUtVWW1Ecyty?=
 =?utf-8?B?dkxOSkVqMjR2Mm5FSmk5dkNHcldQcHFTNHdla1Jwc1hHbEZYM042TkNpdStB?=
 =?utf-8?B?ajJYSE9ZbmozZGttZG80UW5SNUN1MlR3N1c5UHIvODE3am9NNjdkVVNzUGdr?=
 =?utf-8?B?T2xMNGlRdzZ1NUoweE4rODBaWTBYTEhHTlZ4bElQY1VoK2xMdDBQUHVkTE1q?=
 =?utf-8?B?Y2Nwa0NWRlN6b0FMK1NiNEhJbzRhVm9hekNoVjdreU5NUnpKQm8zWDFxL1Ry?=
 =?utf-8?B?R0RtNEJiUFBLa0t1QW9Dblk2R0trTGJ0OWFjSCtkc0F5b1Vvektja3U0ek9V?=
 =?utf-8?B?V3BYRS9sMlNjMHNkUjIySEFCdXhTNWtMck1qWk5XVWpVaEgySEVmOEFoSHVT?=
 =?utf-8?B?cjRnVFZGTWVrWHdQaVRQVk5DMUNlS3NWbU5qSVR2Sjd0WHVYVXJmT0F4Y0NJ?=
 =?utf-8?B?UHVDTjVLVzFWS2JLZXJ2YlJva1FWa2VLVHg3aVkvL0FZRzYrL2lKdmQ0MWto?=
 =?utf-8?B?ZmoxZ3BuNTZqdW5KY2hZUTU2S1dSWlNOVjZkd0Y2dWVqTE9qUUxOb001ZllR?=
 =?utf-8?B?M2xzMlF4MXk5NldrN3ZRM2gvcHRVUkgvRjFVOHdkK0pLNmZhc1gxZWcyT0p5?=
 =?utf-8?B?MWg3OEErT1g2ZEZxSXJoRDduQyt1L0RCbm51YmRZTitvemhEWDNJTng2UjVq?=
 =?utf-8?B?dXlEcS9NQ1lvL2ZhZEdRQkZXVVBKWlR2Zm1zT3IxOFowdFg3Z3d4OTBoT1F5?=
 =?utf-8?B?R1BPd2xhR0ZDUTFWeDJlYUhMU2o2SHU5U0FGWU5yR1BSdGJKK3pHVEl3dWZo?=
 =?utf-8?B?S2ZDRXFOMGZpTlpzMzFIVjJaWTgyVTRKblhubnJtOVpocForL1Ztb3BTZWRx?=
 =?utf-8?B?ejZ0TU5JWlBtakY0NEZKT3kvQlFIMFh6TG9nZldkMWhLNk4xNHU1US9vTE81?=
 =?utf-8?B?S3JuenJHejhKZVMySkdvZnlYRStaaFRYVVBQMjNKb1RtQ1lsS3drQ1dCQmF2?=
 =?utf-8?B?bWRnRHhDT1E4YUJhWWlTK0w5d2h6VHYyN0ZSTjB2VDkyWmk3YlA5cElaNVpv?=
 =?utf-8?B?bjRWNDRueEhXK3E5UGhxcUlHNU5DUDJSdlpCR3d6MlcyTFYxKzExZi81RnRO?=
 =?utf-8?B?MStwRldCOHU0dTNJZ0luY29xOUluUDB0UHlMVmxNMmxMN3R0bDY5eFNDV2Rx?=
 =?utf-8?B?VHdpSjdJS2RRWTV1cXYwQnE5dnBwaHBlejY1enZZOGRjNlNrb25JbjF0V0tD?=
 =?utf-8?B?ckdHVFJLK0d3ZE9ubU93TENKT0tWaXNaNTlMazVDL25naFVHNHpjWFFoQkxQ?=
 =?utf-8?B?TU1LdHdnZTZycll1Qmc0UXRFWk44U1puQWN4YUdMV2Q3TkpnV2xNdnlyd1pJ?=
 =?utf-8?B?R3ZkZHFXSDhuamlpdGF6VEN5V0pCZ0ZRa0FneVR0NCt4UXZ4aTgvRVVvUTVj?=
 =?utf-8?B?WWh6MWxUd1FDT1AwdThJY0l5dGdEOTNuRTFqWEZwUEg4QzJkVHdHK0VqeXFG?=
 =?utf-8?B?azRMLzJhY0Qzc3pjYStmZldrWnhRT3AveGh5bTNEQytGZFRzOCtveXVuN09D?=
 =?utf-8?B?ZVEwYmVjdFF4a0VsNmhlOGdkM3ZqOWZBVDJLeG1CdUNneWNYY0tEbXlHdlF0?=
 =?utf-8?B?ZUlUeERNZVJYbzcvN3lZajA2RUNKVzJqQytiRDZPMnlFUGFxV0hiTHU1UEc1?=
 =?utf-8?B?VTJBNVlYbUxmUC9ISWJUK3N3eXVkQVYzTGFxYzUxQ3F6S3pDWC90L2g5ZTRr?=
 =?utf-8?B?NVIwZlRHbUMweEM5NUJYZlBTT3p3bnF6NEJ3aUtIKzVRMk5WK3JIaWJvRmJQ?=
 =?utf-8?B?cWE3ckVlWDdvaG9meGVCbnhkN3FtOWxFVTJvZ0tuMStocmlEQzB1SlVSZ1Vi?=
 =?utf-8?B?ZEttNnNBelQ1dGZnVnVwbzZqNjhOQm1TYWJhLzZQQUtKTW1OUlFRMFVSdDhD?=
 =?utf-8?B?NGF3QjVkQy9IVThNcS9Fb2ZvbDJBYUVuaFJZSXRFdFIxVHNuNXgxYmtqVUVE?=
 =?utf-8?B?MnpqWm8vek1GTnQrejZ5YTBFQld4UkVIRUd0U3BvYSs4RkxFeU83VThYODhN?=
 =?utf-8?Q?2kuJ2QRIFAnXLd5nWCyNJForu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caa000b8-02f3-47aa-dd84-08dce9a22f83
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 03:09:57.1975 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7o3l1E+17KbgjX//jGsqA2DprCPjuJz+P96PlGW2ymSDriscYCIDIHZWr2OMpkDcWsGQh/3/RAM3MgqnOxwKzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9994
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

On 10/11/2024, Marek Vasut wrote:
> On 10/10/24 7:31 AM, Liu Ying wrote:
> 
> Hi,

Hi,

> 
>>> This Video PLL1 configuration since moved to &media_blk_ctrl {} , but it is still in the imx8mp.dtsi . Therefore, to make your panel work at the correct desired pixel clock frequency instead of some random one inherited from imx8mp.dtsi, add the following to the pollux DT, I believe that will fix the problem and is the correct fix:
>>>
>>> &media_blk_ctrl {
>>>     // 506800000 = 72400000 * 7 (for single-link LVDS, this is enough)
>>>     // there is no need to multiply the clock by * 2
>>>     assigned-clock-rates = <500000000>, <200000000>, <0>, <0>, <500000000>, <506800000>;
>>
>> This assigns "video_pll1" clock rate to 506.8MHz which is currently not
>> listed in imx_pll1443x_tbl[].
> 
> Since commit b09c68dc57c9 ("clk: imx: pll14xx: Support dynamic rates") the 1443x PLLs can be configured to arbitrary rates which for video PLL is desirable as those should produce accurate clock.

Ack.

> 
>> Does the below patch[1] fix the regression issue? It explicitly sets
>> the clock frequency of the panel timing to 74.25MHz.
>>
>> [1] https://patchwork.freedesktop.org/patch/616905/?series=139266&rev=1
> That patch is wrong, there is an existing entry for this panel in panel-simple.c which is correct and precise, please do not add that kind of imprecise duplicate timings into DT.

At least the patch[1] is legitimate now to override the display
timing of the panel because the override mode is something
panel-simple.c supports.  And, pixel clock @74.25MHz is not out
of the panel specification since edt_etml1010g3dra_timing
indicates the minimum as 66.3MHz and the maximum as 78.9MHz.

Furthermore, if "PHYTEC phyBOARD-Pollux i.MX8MP" also supports
something like MIPI DSI to HDMI, then 74.25MHz panel pixel clock
rate is more desirable because the LVDS display and the MIPI DSI
display pipeline with typical 148.5MHz/74.25MHz pixel clock rates
may use one single "video_pll1" clock.

Anyway, I think it is ok to use the patch[1] or assigning
"video_pll1" clock rate to 506.8MHz in DT(no things like MIPI
DSI to HDMI in existing DT).

> 
> [...]

-- 
Regards,
Liu Ying

