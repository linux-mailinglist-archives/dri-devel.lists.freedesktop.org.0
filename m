Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B3C9E3225
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 04:33:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6536410E29D;
	Wed,  4 Dec 2024 03:33:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="NzE+T5Fu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013066.outbound.protection.outlook.com
 [40.107.162.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 314BD10E29D
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 03:33:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cE2GCFfeNBUM1dhNCr604OIx9yzWozjPMV5bRewtp+xpPToLXsoP52vV+GvWqXzmPes8h2o0s8xcmhiPcRJfLHZN6RRG2svVJIK1cuZ3GoFch1CAgkF5qcoQNm9DI/idKpBn35bErTy5AP74C+MLQ8tkE/L/RkYogE+Kylmd4p5s3uRkzZIpzKq8inTk3BFzIRp3yV8T0L+pvM2tONjiBnTuOkyQIEGNgSS3sbYNP4spVe76u34o+EPKRI9sauo/aor5aKA7cgjEkVcayUuOWVHa4P5RdPpc+fR7LxASDQtXZm42iK7zcFLW1MA2aargMFYZsd7B8YC3emxlMUqVZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nH3jRy/NKWc3NAnsTtg2KAimpqxwaOhhmMLMGKppsyw=;
 b=SlvrveMEOdferh2WBvI68VSiBrm8FXBfboxA2ul3/fvCsiBnyKeczDVLxUt2Kh76NngRxd5Y5t9FiWn3xemRyMpbUMhoQenSZPdAIqXIkWbsi7rP3yiYccQLWKFNVDs8QRSSkyE3QbY6oP8KcV0cdMdTKYBGoUJU+twDT3PThGZtJif9PLQ9sdL5PboSdnFyOGSfpxCRazpDMie/R7YFW+iLD7xcN4iYR4VyVK+UBhaX7wVW0T4ZyrnHE5bHGqvfPvZdqhKgjBGvUh2YsEyvPNT/U+YWstv25l2/+78xMTgYynYOLG1bgbgQhzSaQoBXyi29HmovfgV+ltQnCD0NgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nH3jRy/NKWc3NAnsTtg2KAimpqxwaOhhmMLMGKppsyw=;
 b=NzE+T5FuvRawhtheW2WnRo2m+9mm8UTA2NGiQBM93MuQZY2Mu2/U8p5xy8MqppPXdgVLnDsRXdCoSpk/IYnABRo6zBUWYbe9f7k7UsrfOXOSbqZ3YW//CtGjqNkhd+ORR1TErKu26ziSMTboreiJlSYauAkSm9L9eSKwXP7wKIPH0TaGkY1tsYT6JusURoSYptLRiTpa3y7hvaho1lWEQIcFz16V8h4nhJXelH/jLBikTOFJ9vb+eN24GWzwgvuQPrryNVa+1BH7yqYMeSS86WWvUZahzsv333pZ3QGnrLt/kfP7zYLfiWIZ+M/GTe7RAvDX1g0PtqdDJts9ln08iQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB7701.eurprd04.prod.outlook.com (2603:10a6:20b:293::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Wed, 4 Dec
 2024 03:33:47 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 03:33:47 +0000
Message-ID: <834a2690-ca06-4a8b-9a81-c4981074f95c@nxp.com>
Date: Wed, 4 Dec 2024 11:34:23 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: ite-it6263: Support VESA input format
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 biju.das.jz@bp.renesas.com,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
References: <20241203172129.778123-1-tommaso.merciai.xr@bp.renesas.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20241203172129.778123-1-tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0031.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::7)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB7701:EE_
X-MS-Office365-Filtering-Correlation-Id: 207ad66e-479e-4f6e-2230-08dd14147627
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OUx1U3djRlYyd01TK2dkOUc1OUl2UElLaG1zRzlPSlp0N0VpU2QzU3dQMmNQ?=
 =?utf-8?B?Vkdyakttb1psdk5VRmhycHQrWFdlaWtCL1BOeXErdnVJSXIwbytKTG9Ta3Bs?=
 =?utf-8?B?bk5xRXh6akxuV3VYOURIRHdjWVdTbWxaZlVjbnJMWmFNbkNvb083ZDlrdGpp?=
 =?utf-8?B?N1RZMWVpRS9yOFpJeG5CcGUzTU9yWHNwMEo5b3BNSXEzOVJlbmQxd1NYcW4r?=
 =?utf-8?B?OTgrOUQ4cWRXK3QwTE94SGdmRWo4RnpUdWg0QmxzUnJsRTRnRFdBQnJBdnAw?=
 =?utf-8?B?aUQ5RmJOZGdIbldzczFNYUwxbjFKcXh6V0V6eThqVlIyR0FaOXhkWS9mZVRj?=
 =?utf-8?B?TlZZTFNHdTkvUGpSOE95Rys5Q0J5Q1VFMDdDL2hpRjZWcmJ1TDg2RlZZSFov?=
 =?utf-8?B?a3N4SmJzVzMvaDYxWjB0eVNuVi8yaWI3eFZUa2hYdTVVWXgyWnJVQ1Q2Qk9I?=
 =?utf-8?B?NGVYU3lVbWpETnI0TjJ5bzQ1cDhsbXIwWmx1QTZUWEs2eUVrL0h3MmFja3Fh?=
 =?utf-8?B?Qll6WjNqa25pVnFjcUFMdWxpNmMrS2ExSFRHQUJENjRBR25hME9ZOEt6R0V4?=
 =?utf-8?B?ZnQ2dklCZnZLelgwUnlDTkRKK05YeVhjTlc2YU5lbHJaSHAyY3o4ZFIzeXdO?=
 =?utf-8?B?VlNOMXM0NmRVbldaaVN4SEttQzk5WXR1anNxa1czWHpjTnliT3hEL01RaU5t?=
 =?utf-8?B?SHNmOHpZNFFya040eTdCRXU0ZnJ3bWNMaVV4Z3F3ZW8yMWtZQVRzOWVwalV3?=
 =?utf-8?B?NnBud2E4clZXSU1UVWNpN25tRk4zL053cXdyR0JIWVhodXo0dVloaGlCVUM0?=
 =?utf-8?B?bnl0b2hQRU9GcmdRaGtXZXJ3bmlkRExXeTg2L2FBdjJ6ZDU0M1JiMkxZVEpV?=
 =?utf-8?B?QTIwUzlJdHdGeTh1T1FrTThtb01nelJtMHNpYU9ZeUw4MlVZVU4zazJmSVhm?=
 =?utf-8?B?dE5mYVk1MndTSDVjRmxTRWYwQitBRlRUeExUT0w5NGxOWVZmQk9IcVZ4MDIr?=
 =?utf-8?B?bFFGT21rcm83OTQxa2pBNmhoOHN4eEU4bTNUNjdxSUlDbi94VFlBbC9BNko5?=
 =?utf-8?B?YVpSeHRoSUdmTWhkZ01GVzRydE4yZmNMeUJ6eTByemN6OEZ3TTZ0RmFYTHJa?=
 =?utf-8?B?azNlOXhJWFlpTThJSVJ6Q3NDWUZuWG1mcTBlMzRidGhhNlFTUzhmMlY3dkRh?=
 =?utf-8?B?NWlIL0N4K0pacndVa2oyVXdyRHFEd2ZhK0Jpdm5vZDZiSHdsakZkZGptSktP?=
 =?utf-8?B?MllWMDhQd0hJL1RJMkNFYVVVcTRDZ0VsMXBsQXBiTG84K3pubXBUUHo3dExO?=
 =?utf-8?B?NTB6d2Jlbk1aUjJObDQ0ampjY280cUR4S053K0MyYmFZUHFMYzFFTkU5bkFU?=
 =?utf-8?B?KzhBT1hHUENUWW4yR0xxekxaQjI3WGh3R2JCdXhtdVpmbnRDdlY4SFpFTkhZ?=
 =?utf-8?B?WCtZL2dqT0NaVXF5cW91NHlUOHdTK0ttWVRXSks5VDRodlNxS3J3RmprZ1RJ?=
 =?utf-8?B?dkVxSXRPSnRRMEhYSHF0dHk1OU9lOFA1S0pNd241Sno3OVN6M3haQkpoNThx?=
 =?utf-8?B?YkVXZUk0dVd1MUVZZjBFU1RHUXlFZE5hbFBjMVNaZjJ0Z2c3bG1waVhkdWdk?=
 =?utf-8?B?Z0hlY0pFSXQrSGtqMFdxTU55UlovNWtMWjhXL3JGdmRqL0RFOUhPRVM3amx0?=
 =?utf-8?B?OWR0Y1JMcUVDdHFndDV4ckhzWWNIS2l0SlVtakFaN1ZoMFVnTjVKelBkYXlC?=
 =?utf-8?B?SWMzcXBmc21HdmFXM1QyczFJTXZIMUpMOHVXdkxVbzErYTlTM2tSQjhhTzU5?=
 =?utf-8?B?bnAxQ3dNSHpDMzYzaEZyZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTBwL2d2WDFISkY3T1EwbFZrQXh0N0FCWmYyNUZIZENyWkZuekZYM01PQVVV?=
 =?utf-8?B?UU1URnF4aUVJaVNQR3RZWWJVQWlJdUhjaS8wNUFERXZqSUw0Nnh4WWhTOE1V?=
 =?utf-8?B?aGUrVEZHZytRK0NNTXNUcWdKb2kzZnI1MzRZVnF6eHBSUVB3MG5CTEd3Z3ZT?=
 =?utf-8?B?VGs1clFTaFZUZUU0MS9WZE11bnRxUmtEWVJYN2I0Y00zeHA0QVI5b3VnZEtO?=
 =?utf-8?B?d0dacXVZTFBhVlE2TzlLQ2V0QmJ5d3A0N2R3UGhNRkJCZ29ndlhLNS9zZnBH?=
 =?utf-8?B?VlUrcHdhaVM5WmtYcGNrZ1dVMGhEdFI4TVBDM1paYnVIZExpOUl5Zkl4MVNy?=
 =?utf-8?B?TWdockxrOHJVeVpDNDFKR1lScGlJM3NFOGxBRmkzWmFXdDE4ZStBWDFSOWVt?=
 =?utf-8?B?MDFzQmUvcnVqVHFycEFwLzI4bVVvSzhDR2NVeEVEWmJlK1R0SUhqK0VHV3U1?=
 =?utf-8?B?cTNpNzdtZGZ6bnRCWk1lWVFJYkVwQW1nMGJLQVRUd0I0WThBZmR5ZTJVVWJo?=
 =?utf-8?B?TGk3Tk9rRWtYRnpoQXJIMkwvTzRvR25LSEFWYUg2S1REZmk4YzZOV1JQQXBv?=
 =?utf-8?B?Z0YvZGYrTzM5UTlieFViUTV0UTBEWWx3YW1hU2dMdndNQUl2YktTeE5vYlUv?=
 =?utf-8?B?K2Z4SnV1eWlELzhtYklWSDhYalVxWGtyUHpiUUJVZmtQNStmS0R0ZFBqVU1Q?=
 =?utf-8?B?TkpkL1ExL1krTGZQOUhWRm5Mc1VGKzlHU25qU0JZZ3dSRmUvMDhKWk95Z25O?=
 =?utf-8?B?bFo3TXdDTFNzelUvbWZoTW15bERNbWpDNzg3cVMyUUZyb2Mvd1BsQmRwMVdw?=
 =?utf-8?B?MGxrU2ZDTmljaUtYWHVpYk5OODdRT1RYUXV6RTdRUHVOSDR6dEcwK2tpcWt1?=
 =?utf-8?B?SUFqdnhpTUVsK3pnMloxU1A3UlFyVGNTcWNuT3pKT04xMElhaWJac055K1RB?=
 =?utf-8?B?eUNCT3BXSitNQ1EzOWY0R1F0SnFyRy9oa2VLTXcraVNxTkVJN3F1RWM2Sk5G?=
 =?utf-8?B?MW1MbW1ENWMyWDJkWFFidm1ZNVk3V1JpaGRwUU96VGlTRyt0QnpsNjMvdklr?=
 =?utf-8?B?Q0FKSHE3WmNKand3L1pxdzRlSXU4dHZISWlITkNmUTdpSkhhdEg1N1h0Tm5q?=
 =?utf-8?B?a3Z6OFNpdHg3Sm5COTBaM1RiOXdpSlFWU1l1d1dmcnczOVNVTEcvS3JSYjhN?=
 =?utf-8?B?R2k4SUJEZzkraHk1ZkI1cWdkNXRVRDcrVyt2VnhSbmJDSUoweGZyNDF0OWFX?=
 =?utf-8?B?V000VUNGM2NSREN5Q3krK2MwbWRvNEpwUmVkMHVBNXd6V0tLeHFGaG91RUNU?=
 =?utf-8?B?eVZvdVJqYXEyZUNVOExMVlVwSDM4QzVXWHRQTmpaR3NDUU5yV2UwMExtNVU4?=
 =?utf-8?B?cVFlN1d3SjZhdXFMVDRXdmxSVzdoRXZTS1oxcEtHUHJPaEJvSHBXd3NZYU5U?=
 =?utf-8?B?VEZFVzdIOW5JMDlUSUo2NGF6NURhK01sYUlpRUtxNDVoUHpSUVdvdldUL2tk?=
 =?utf-8?B?dmFHVjJZYm9iV0hOK1doSlFDalJmdmF2bjBhajNsams2eUpIVGRKMm1KOGNT?=
 =?utf-8?B?M2F4d3pod1lkS0lyQlFubmttaW5wMENJcTRJMkF5czc1bkdUT2NRUmNhR3Jm?=
 =?utf-8?B?Vk1JbENtMjlRRjVDTFV6aC9YaXpCYklldjlOZ211dkNNNmFTRnJYQ0NCcTc5?=
 =?utf-8?B?T0lDL3N2SjZCTVlZVDBnK1poMXBmWWZuWlZPS1ZqYWdTMU9oQTYwZk4xVG94?=
 =?utf-8?B?MVZ0cmNxaUUrTlZDWnJZQWk3dTlXM3I3Rmd2VlBDMGQxTWl2ei9CVGxhbWp2?=
 =?utf-8?B?bCtCQXFGMnY0TVhSZmV6UjE2d0xaWkJIWkJRbkRUV0xIVVE2WGNlbTJWNGFy?=
 =?utf-8?B?Q1lJTGd6d0xPdFYveDFNUkZNa1lHOFJ4VlhMd2F5ZEFuZG43YldNemRXNDlU?=
 =?utf-8?B?clJESkFkYnBPQ1JOQlIybWJXMUcva2dzV2x3bE1UU2RLRUdKaDhTc1QvVGYv?=
 =?utf-8?B?K1lnNndiVTRwU2ppOHlOTm02MW54UHRpWm5rWEFvU1A4SExqUENhaW90RWlw?=
 =?utf-8?B?RXFsRDZsUmh1anZyYXNWOU5GMHY5Y25sZ0p5dE1VZHBSSDVYNElPdTNWYjdr?=
 =?utf-8?Q?mnRi6PrwiwphFQV9dyYux7PgH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 207ad66e-479e-4f6e-2230-08dd14147627
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 03:33:47.3571 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T1DmSX9ZEgH4NIJQHrbIgiUjhH6yYnSaq72LVnfEJnaFduoAeRSwJhVsFJ6V6YiHIMMXRZvitd8bUVdKTy8mCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7701
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

On 12/04/2024, tomm.merciai@gmail.com wrote:
> From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> 
> Introduce it6263_is_input_bus_fmt_valid() and refactor the
> it6263_bridge_atomic_get_input_bus_fmts() function to support VESA
> format by selecting the LVDS input format based on the LVDS data mapping
> and thereby support both JEIDA and VESA input formats.

ite,it6263.yaml says IT6263 supports vesa-24 and vesa-30, while
this patch actually only adds vesa-24 support.  So, to be more
specific, the patch subject and commit message should reflect
this rather than claim "Support VESA input format".

> 
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Can you please send this patch with your Renesas email address
instead of Gmail email address?
Otherwise, add a Signed-off-by tag with your Gmail email address.

> ---
>  drivers/gpu/drm/bridge/ite-it6263.c | 25 ++++++++++++++++++++++---
>  1 file changed, 22 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
> index cbabd4e20d3e..83d1db29157a 100644
> --- a/drivers/gpu/drm/bridge/ite-it6263.c
> +++ b/drivers/gpu/drm/bridge/ite-it6263.c
> @@ -48,6 +48,7 @@
>  #define  REG_COL_DEP			GENMASK(1, 0)
>  #define  BIT8				FIELD_PREP(REG_COL_DEP, 1)
>  #define  OUT_MAP			BIT(4)
> +#define  VESA				BIT(4)
>  #define  JEIDA				0
>  #define  REG_DESSC_ENB			BIT(6)
>  #define  DMODE				BIT(7)
> @@ -428,12 +429,30 @@ static inline void it6263_lvds_reset(struct it6263 *it)
>  	fsleep(10000);
>  }
>  
> +static bool it6263_is_input_bus_fmt_valid(u32 input_fmt)

1) Inline this small function.
2) Change the argument input_fmt type from u32 to int to
   match the type of it->lvds_data_mapping.

static inline bool it6263_is_input_bus_fmt_valid(int input_fmt)

> +{
> +	switch (input_fmt) {
> +	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
> +	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
> +		return true;
> +	}
> +	return false;
> +}
> +
>  static inline void it6263_lvds_set_interface(struct it6263 *it)
>  {
> +	u8 fmt;
> +
>  	/* color depth */
>  	regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, REG_COL_DEP, BIT8);
> +
> +	if (it->lvds_data_mapping == MEDIA_BUS_FMT_RGB888_1X7X4_SPWG)
> +		fmt = VESA;
> +	else
> +		fmt = JEIDA;
> +
>  	/* output mapping */
> -	regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, OUT_MAP, JEIDA);
> +	regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, OUT_MAP, fmt);
>  
>  	if (it->lvds_dual_link) {
>  		regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, DMODE, DISO);
> @@ -714,14 +733,14 @@ it6263_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
>  
>  	*num_input_fmts = 0;
>  
> -	if (it->lvds_data_mapping != MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA)
> +	if (!it6263_is_input_bus_fmt_valid(it->lvds_data_mapping))
>  		return NULL;
>  
>  	input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
>  	if (!input_fmts)
>  		return NULL;
>  
> -	input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA;
> +	input_fmts[0] = it->lvds_data_mapping;
>  	*num_input_fmts = 1;
>  
>  	return input_fmts;

-- 
Regards,
Liu Ying

