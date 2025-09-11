Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECDFB530C2
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 13:37:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50A8210EABF;
	Thu, 11 Sep 2025 11:37:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="kWg7tg0n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010071.outbound.protection.outlook.com [52.101.84.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37AA910EABF
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 11:37:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aKgnNe463q6/x3gOP4DKEbyviGS+9zhvcdoys76XRuRmR4vOwAWIWeQCk7XZxTWiy8DUNR+3CycQPObWTChn6rd9N38fzXdFSq8EntRyiIo3yRT5jRMXteg7TigFNx03RDAAThHoCFraIhSxnvZE8clroCxWhjp8Vw2AS9qniKW3TZzTRG+bXn0lqwzicaxc8CJnZvfc0RtUAgJImP4NO+Lu+zgZ0X+V/gbZdfDooWgunycVUjFYNjXdVrkRDo3LvDrzdHUikQUGnJ5qalu3RMoWnCQ2eINeqLXgkgR09B4OjJAx55K1gy7etDPFmVqhNe/lqWjhDB10vcTl/YLRWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tA/GFDutmvKkWOYUWX1EYSUMr+bA6YIQrD+3l9ypQls=;
 b=NXxzrKkaXqHWDth7EIp85FJR7/SPlIvlHbMu3E397l9OTAoFuNLiPURGjmPpVtBrrETLGp8E/QRjss9Qee1aUwP0Jw3wKmdv7G4BgSU7Tnt22j80DVkUx8qFIvoVCJeVyn3QTsBU/ILw3xhXIcc82LPYAf5zoXeWljEWhrW0j84QGSYF3MYMf19GE44DlKnw+IKKBTMajatKrlKGtC+pQNoaNOlMpdsG7W0k7v84EDYTk4KsykazqRpVNvVVSIPszs7GX/1SX4g/H6DOhxRKUTzyBMOOxli9nXiwkIsJscAjeC7F2GbIac/bLW0wO7OE1jqE4ojUSmyMHRXo8nhQNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tA/GFDutmvKkWOYUWX1EYSUMr+bA6YIQrD+3l9ypQls=;
 b=kWg7tg0ngFJQidRqA1DA//7P+fa1p+zJEPzdKYYS50QDFw42OzG2b9FUc53PO3rh1gXQsi4YyXcRihQP7NZ9jrstHrN702Ix+QgAKOvDI/iwAmlU3B2VP6Z6vSuKeDfVcghzCmMfC3HDQ6FO8DpY3QYHjslcoZnp151TJmGWehfZdZAA8S4atnHKA24Z+jg98uMTjbrISYmFYMvkD+H2QMdOym7H8L7rtuF6P1C+B1Q9Fb1hqmGtOxhb33+yexED8lrGaS4G91UluuNEdJR0/h+A0aMrGeKGpuVvahfaFaPA3PRm9TnLOJLz37MRmjWXlEAsfWJ/EVdnY9Bw9vUX8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by DB9PR04MB9961.eurprd04.prod.outlook.com (2603:10a6:10:4ee::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.14; Thu, 11 Sep
 2025 11:37:37 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442%5]) with mapi id 15.20.9115.010; Thu, 11 Sep 2025
 11:37:37 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: imx@lists.linux.dev, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/9] dt-bindings: display: fsl,ldb: Add i.MX94 LDB
Date: Thu, 11 Sep 2025 14:37:01 +0300
Message-Id: <20250911-dcif-upstreaming-v5-1-a1e8dab8ae40@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250911-dcif-upstreaming-v5-0-a1e8dab8ae40@oss.nxp.com>
References: <20250911-dcif-upstreaming-v5-0-a1e8dab8ae40@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P190CA0053.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:656::17) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|DB9PR04MB9961:EE_
X-MS-Office365-Filtering-Correlation-Id: f7e6c257-4d36-4ba1-c87c-08ddf1279b29
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|19092799006|376014|1800799024|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SFU1MjVhMDFQRFA4ZlB3OXg0QWZ5SFF6SVVndVlHektPVFZyeEdBR1Z4cEJh?=
 =?utf-8?B?VGUyeVR6ZUFnMk5MeTZCbUdXWFNZVEdacFBBT0YySjVGNlMzcExNRXV4cEI4?=
 =?utf-8?B?UysxZUlTWE5OcngvT3l6bWx2WEQ3TVFqZUEyUU9oSDRTdktxcEllTlJjbW1T?=
 =?utf-8?B?SUx3by9pQlpTVXFZNElPT080aEowSStUMUpCbWlUUzc0VFVaaXBXMGs4L2tD?=
 =?utf-8?B?OXJaQ3hmTW9qOTlodloyZVo4Qjg4ekZrZ0dYYkwvZmFpY29RaGVONTZ4T1g5?=
 =?utf-8?B?aUYzTmRteXpYeGFlY0NRYzBnSUc5MGlGS05uaEgzQ1lkcWtmcFIrcXViQ1RH?=
 =?utf-8?B?WmtqQUw5dVJzUXl4ZG5tQzRlMU1POFlYUmVrNVRjcVRqV25QYVNSOCtEdDVa?=
 =?utf-8?B?VW1nTnZ0Q0J5am0zUTJrTzUvV0RCK29Jd1ArRmNKUXZudnJsOTZLSlluSDMx?=
 =?utf-8?B?UWdSdW9jcFRNVCsxcWdYNHVoYmdnNEFtN3RzOFRHdSsxYzJ2b1ZZd2doaUJX?=
 =?utf-8?B?SjJSSDFscmZVaTEydG1wTDM0VGRleThzTjdZcngxWTRQLzVFQXl4aTRBQTZk?=
 =?utf-8?B?N093WU9tVFNKY1E0VitFdlVCOTZ2aFJ3YjBISXdVSm5TR3R1ZExWQlFpS2w5?=
 =?utf-8?B?c0JreW9iWlk3UW84K1JCdHV1aDlaa0lZZWN0aXpFaU8xdlN3YVM0YWhsWkVr?=
 =?utf-8?B?dUo1Z1l3cTBkbHpybUxjSVRtZ2QxUjZOZ0swMjNlYWt1QVRsbUlLRzI5OEV4?=
 =?utf-8?B?cFJZVDFWbjdpTUlCZUQzcmZISTRKY1U1VjF5bDFxQllQVDFSOHArNGE4NUcr?=
 =?utf-8?B?T091cnVJMDBXRkJMNld4dTY5dnVOc1pTYmtLMVFnQTFOZkRXUy8wUkg2R09Y?=
 =?utf-8?B?TW5HVlBzV2hVZmhJbzBFOUtDcWdRSlF3eXpPVUN0ZTNlVVVLTytnWXdFV3Ja?=
 =?utf-8?B?MytvdUVIZThiQWc1R3RhQkc0TkNVU2V0ZnFHR3hhOXRqTlpxVlhlY0tuWjV6?=
 =?utf-8?B?MElEWHlQTzRXSDdFZjdvVzBOVW1HNHh2V3lTdEhUcVdic3c3UnVJSkZOOHRl?=
 =?utf-8?B?NjdwWDdjNGZzc0h3aUZ1U1pINFB0dmJkeTJMaUVyUWdkRDQ5VEVtVnNEenVn?=
 =?utf-8?B?OTNNTTdVU0VES2xNNG5sSmpFNFRrZnNIbjVjZjR1RlNwVXZ6U0l1WU85M2dr?=
 =?utf-8?B?azQ3T2ZJTm5Va3JYNW1pbXFST240MHE0cEFmVWp3UCtDUGhaZFJEbmUzdVlx?=
 =?utf-8?B?eElFNXVDRWRxSVdIOEsyT3FjazM5Slc3aXhvaHJpV1FtUCtPUEU0ZDR3WFdp?=
 =?utf-8?B?SGY1Q0pzdUY3blJOYS85ejVYVjhNZlhYaUsvcVpnTXdVcVdvVEs5emFIR25E?=
 =?utf-8?B?TWhzYzZOc1lXYURUQmdFaTlockJ4eWhPdWNveENnbkhTSnZrVFpVWXkvSnM0?=
 =?utf-8?B?cHprK3dHd0s0MlowYUpmS3poQmN2NDFPaURWeEg3WUtVRWkxT3JqTXhQdDMx?=
 =?utf-8?B?MVRiN2ZMblhFVFBlZEhkQko0aDd2VFNNdFJJWitnUU5SeVJuWXllaXRuZ1RS?=
 =?utf-8?B?V2ZnNlJ6d1ptR2Z2eUNvQTA1bCs2RmJXaUhVbVNNQlY0YnlIWnNuelhqSTg3?=
 =?utf-8?B?YnVvVWhXNWZuam1CZmhId0ZGa3pBTkdiVTRsTjRuQ1Bva1EydmVVNWFiTlNv?=
 =?utf-8?B?dlBSTUF5QldGZ3FtaHYzdHRqbHZtcS9EZXpnUkl6VkFIUWxYYXZFS05OMjdN?=
 =?utf-8?B?amNzdjVpNkFvNFl1eVVCZnVxUk1sR3ZwRkt3eWZDRCtlb2xFWUJtenlkWHBI?=
 =?utf-8?B?ZHlCOFM0VEF2LzBXY2JBSG1kRDczNVlzQWRXekhoUG1JN3VqM0RQa1N4OG5G?=
 =?utf-8?B?bXVkMW9BRU5Oa3grNHh1Y0dQZTVXeEVvUG95L2dKeGZxVFluK0VvTUJlY0RJ?=
 =?utf-8?B?cUcrWDMrNlQwOEtTUVdMTi8vTGtwT3gyTWVZVUVHeUFaRFBlUk81ZmVGRmRr?=
 =?utf-8?B?NjZJeTJOYVNBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV1PR04MB9135.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wm9OTmNYbU5mcENTN211eTNtdWlNL29tMHJaNnEzekx1a20vMThaVzFybkFn?=
 =?utf-8?B?b2tIU0lFTVpSZzljZjFFVEtBSUkwaVlPanE5TVF0YThXOXBGOTQ5VlBvdHBV?=
 =?utf-8?B?LzhiV1gwVjJYUE91eWhDL21VanNtZ203YkorMFFnT3JmSkE1QXlYVEpOZWtv?=
 =?utf-8?B?T2YySXFpZ0FTVmQyWXFUTUZYYnZMSytYWlhjd0d4WWNBQnFpZFRSYUsyc1ZY?=
 =?utf-8?B?SktlcTM3K2dRYk9WZXplUmNFQkZleUswVGJDR01OOGNuYWVhSVBhUU5sbUJQ?=
 =?utf-8?B?SkgyMC9Ca2VkeXVTekJxeVVjazRhNnEzT0VMZjBjYnE1U0JQdHU4WE5BMDE3?=
 =?utf-8?B?V2ozUlpaZE5YclNrTVdaY3BMWDk5aTlVOXpWc0I3NHhkbnE4M0xxQmVHdzU3?=
 =?utf-8?B?Q2ZqT2duL0tNdk1uK2RxeVZrMmgwSmZrWGYwWkdEWnJNYkJMdkhyOGpkVjhh?=
 =?utf-8?B?OGgraHczOGlKYmZIWm92VUVUcXE3VHFrT3BXazNNRDlPRWlDNGNKU1dVbC82?=
 =?utf-8?B?UjY1NWFHUE9NV3hyQ2pmK1hBUFZQb0htc01yYVRaOERiSEJoTVo5N0t2SlZy?=
 =?utf-8?B?WU1NYi9YMFVwdWZ4TWNkNmw1ck1CTWx0U2ZGWDA0NmxXSXpEN0FtSTM1WDVK?=
 =?utf-8?B?Zk1KOG8xQXNMcmhYalFqeS92VkUrMGg2NE9lcEw5eTNYS1psZGNHTUU3bHZ3?=
 =?utf-8?B?bGZTeS9SODF3RDJRNGJTSENJTkk0UHdyNDhPK0JTTDkyTEdPNFJUa3JwZi9D?=
 =?utf-8?B?cHBCalIvN29ad2NadjBYNDVEMXd6OExYaGh2VGl5dkwrRmlXRkdCVWlxcmxS?=
 =?utf-8?B?OHY0cVpDTmRRMmlkcCtDbjNCdXBiRTFrLzlVZTRtMjhYOTZmL3d3c0Q5Q3lY?=
 =?utf-8?B?TkU1aFVocVZhbEgzRmluVk1sMlY1YlVOZkNCeWxTUVcwTXI1MmwyRjg4Y29q?=
 =?utf-8?B?Y2Z4eGNzMUxZVGZIbDVybDNpWG5XMnhrUkF6b0lzZlFSbSswTWJzRXo5RktI?=
 =?utf-8?B?amlkeDJ3aXBjT3hVdjhNajA3a2lkTkRlVFdyT1F2bTFrU09nRUcrMyt4SERi?=
 =?utf-8?B?aXJBVnB1T1hIckw2SzhLeCtxaXBwWVBYM2JnWHI0S0hlL1JTRjJJZUllWmp0?=
 =?utf-8?B?TXdaWWprR2k0Q2JENHBlYmJGQXBvTFZOQk16OWNJeTBBUVpNVHRmcGcxUkpL?=
 =?utf-8?B?Z0JVK0dmUDRERmVBNUtvQkFla1lmVm54L0ZCTTdKN0xWaXJCZHlkalBGeXZs?=
 =?utf-8?B?bnFXQUR2Vkc3STJzRjIvaFRHT3pXU3RuN3RHKzRYMTEwRUJMeFozY0lodGlu?=
 =?utf-8?B?WTBXUmU1amVaS2U0b21uTUhHcG1ISnZVVUNSZUQ0N1VXUkxLTEhKdUpwak9k?=
 =?utf-8?B?U1VhV3FmZUMzZm0yVmptcVJaQm4xajQ5VkNMRy80NmxZU2FlQzZTYzNSeE45?=
 =?utf-8?B?Y05sL1dsSk1HZFB0T1hkeCtBNFVXTlAra3VUcnFzTWYzWFpzVW1JK2VOd3hF?=
 =?utf-8?B?RndUTWp0MEIrT3hWSERoMWo4ZWZ6RS9nc05SaWh1elFzT0cweVhocHZyTWh0?=
 =?utf-8?B?cVlUVnFaU2xwazllbVZYbUQ4U2hPSXp3ZWY1VHM1K0FyemV2a0N0Q0tleDBG?=
 =?utf-8?B?RHNmS0psTGQxWklvRVlCaDFEOTVaWnc4eTZQMUNweXdTZUdQNHZSam1SajNi?=
 =?utf-8?B?MTI0RE5HaFptdmR0b1R1Yjltd2hNQ3JyRE1SOXpYQ0dSOEFPK3Q0TjJ6R2FK?=
 =?utf-8?B?SThUUWgzeGJtMjhTWGFDSGErcnprSDBvdVVxNkphTXhWOXJ1dGUzRWxsL01X?=
 =?utf-8?B?UDU0V2lCQndMZXI0VGZpNUNOdTRyYkFLdGlqSHdpdDY5RWZoZytBVGhhTWlJ?=
 =?utf-8?B?STdwNHNTd08xU2lRT1NWci9CclZCS1U3ZTBnVE9EQVBISVJabXk1RWF6TTNH?=
 =?utf-8?B?QzA0TDJnOStYVEhZWkFPdUFWMFZLNXNnUDFCMWxnaExMS2M5VloxZk1rVUt4?=
 =?utf-8?B?a1J6Q1pLM1NzYkNVdm44V1JEZmVxV0VNTzJ2UzNmUG9GTTdSNDdqV0VibjQ0?=
 =?utf-8?B?dGNORWEwcDJjYXRyKzZmblFIMEl4Qk9NNVFFcDZMUE11cEdVdTVVNDIwai9H?=
 =?utf-8?B?ZGtoMlhqQW9VZXdwMGNyR09Vbnk3dDZnMkl1L2xydENXeUR4b21xN0xhNVc5?=
 =?utf-8?B?YWc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7e6c257-4d36-4ba1-c87c-08ddf1279b29
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 11:37:37.0183 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pLUN4JwSn9fvvxxZUwfUHSLbEIeAuGkuO+bAwpFeCOA7EhxkHwQNFg4sJZQwdPAwlaaEowHe+ExmjLCfou7YpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9961
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

i.MX94 has a single LVDS port and share similar LDB and LVDS control
registers as i.MX8MP and i.MX93.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
index 07388bf2b90df60d7059959bd8cfdf6a311bb49f..a54b8f14780491468b7b78ec4fc6ae3eaa4d59e5 100644
--- a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
@@ -20,6 +20,7 @@ properties:
       - fsl,imx6sx-ldb
       - fsl,imx8mp-ldb
       - fsl,imx93-ldb
+      - fsl,imx94-ldb
 
   clocks:
     maxItems: 1
@@ -68,6 +69,7 @@ allOf:
             enum:
               - fsl,imx6sx-ldb
               - fsl,imx93-ldb
+              - fsl,imx94-ldb
     then:
       properties:
         ports:

-- 
2.49.0
