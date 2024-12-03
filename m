Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1442D9E1136
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 03:22:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1AC410E1E3;
	Tue,  3 Dec 2024 02:22:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="cK5zkZXT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2087.outbound.protection.outlook.com [40.107.22.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73D3510E1E3
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 02:22:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EyDH/4/SR714oNIYVwcyNQQl7o0plgDYs+Qg7qXNO8Mb4kITp3koifXQUvZpm+bDV+Kx99/0OIRugQBsmHTtwkVQau+HMrdOH0WkIM8u5GjmqXmMmb3XLLkzGBSGi/SclcmokcM1hedB1baMeNRTRtsMgPJBxrGyxcYkw9wDjqJxd2qQkqPR9w6RCBD/dvkedOMFs/HpNDA10FXnZPxBeNk6t41/TAd4Pik1ZbryO6umI/y+UqBDyHQQR8kJw+49Uqj8liV8eStiT3IuzRpn6rLOkjGFbKRhOM9oiRGOt78Que7NbBrB9DF0SS+E/68zQ7eqSeasFpEir7H7YPpDXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UHXWN5v3lYDyHjQ7sOUqnhsCmpoJZ1Ty//xVb9vSUGE=;
 b=ebUhhGGvUNwsVjMiIym+cZgfdbMJEHRs9ERWqkoZA8NvpOmviACBzib/eTUtUC7QcRKyB/IGeaBWy4w/e+zgyBAllvB4ePAJYL5p/Ff+me8KawY5TrM5dk6RLZAYY1+Eih5SpWIn60J1e03SJ2FkzSr5pp5k0p/+FZ4VRUwQi9YQT03WoQZqRTE8OCyF6dsFwGy0hPM+FnVpLKmTSzC3RfYS2REDtChh/N/1MO4nexwGFIGXg2bzXu46pNhl87G80KSB8b/Y4e6Km5LpXNeAC4OdG/4p38WOgtH2OL47gcR1/gCOsEYl/o19OFvM6+gOLrwCF1e1lCa4niMl3d/+9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UHXWN5v3lYDyHjQ7sOUqnhsCmpoJZ1Ty//xVb9vSUGE=;
 b=cK5zkZXTEYHd02LR5eu3Gw+awL6KD1AtuKipG5HpTwrw+OMp/TTt7xPpTQ2SkkCQKtDesux6MdgquksYiTLo5iJTrddykKkbuRjm1ZaWzEFxjsKgFIdThWAzV2gmGsBO189abNsal2j3ZI6NKmHDp9H9gbnlQtru5AcDbrpwxhXAaeMGPz/Y2LQ+flW3uQDrlMFvz0YgiHjWufB3WlLQE1FURNQKCxnnJoU+vHw189ptvK2bAgwWg4k9dcnxebcfR2t6MuErLj8YA8iVUx8gwad5bFl6IAaWykSBqgoKPd/HZh90DiQeopQKXKZ8qHoS6n+J955jg/WhZNvtdnPjgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAXPR04MB8109.eurprd04.prod.outlook.com (2603:10a6:102:1c2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.17; Tue, 3 Dec
 2024 02:22:07 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 02:22:06 +0000
Message-ID: <2c950130-84b4-4a81-84a2-b5e08af43616@oss.nxp.com>
Date: Tue, 3 Dec 2024 10:22:41 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: bridge: fsl-ldb: fixup mode on freq mismatch
To: Nikolaus Voss <nv@vosn.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Liu Ying <victor.liu@nxp.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Fabio Estevam <festevam@denx.de>, Marek Vasut <marex@denx.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nikolaus.voss@haag-streit.com, miquel.raynal@bootlin.com
References: <20241126172610.AD8B51622C@mail.steuer-voss.de>
 <1f0a307a-666f-4647-9f73-e9bddd6c7eff@oss.nxp.com>
 <000b34cdd1591c82265ce1f9848828d1@vosn.de>
From: Liu Ying <victor.liu@oss.nxp.com>
Content-Language: en-US
In-Reply-To: <000b34cdd1591c82265ce1f9848828d1@vosn.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0123.apcprd02.prod.outlook.com
 (2603:1096:4:188::22) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PAXPR04MB8109:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b9c251a-933a-4aaa-c2fd-08dd13414775
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UWM1djMxcXBVSjI1MERjRzQwTDdWZGlzMm1oc0hvUERVczE2RTdoNWhJd1NP?=
 =?utf-8?B?OXdoZjh3TGh1dk9mVVdmN29HbEl5cU4zWjBOL1VPRGhOZHZVd0Q0T2JLbGZT?=
 =?utf-8?B?T1daOXlzbW50YVNhYi82djJRU015QXpNYXNuVm1vN2U1VThJS1ZjT1NSc1Z4?=
 =?utf-8?B?L2lBdGxaaGx6WHRoUnNoaW1qd3ZTcGJTZVBEODlEZUE0MmdOcXhJZXBEZWVK?=
 =?utf-8?B?eUc4U1ZGV3JXMlV5YmtTR2FkZE1WQlhFaC9ybUlJVXhyUEQ1WUw4Z3FKMzAw?=
 =?utf-8?B?YWlTRnBzNVRqL3RFY0Y0RFdMbnBRY29hUFRmazJCSjF5d29XWGFEUTdyTlBC?=
 =?utf-8?B?V0tQRnJCd1Y2OGtXalB6M0pOdWZ3TVV2K2pDdE01cGxFVWV2ck1XVng0bm5x?=
 =?utf-8?B?bi9wampyQXVmVmEzMEZGLzFkTUxQbEs4NXJGRXlnRDVPbDFmekhJKzRZS1N6?=
 =?utf-8?B?Vk1qbVdLTk9HdEpvdW1vYXI1a0czNTYvL1NoRk1qcndCd1hrSDhOYnBMSVNE?=
 =?utf-8?B?TCt2NVQ1cjlVZFJQcHM5bnZqV0lsYlZIUjR6aERFdzhDNDI2OENVcFJVNFo4?=
 =?utf-8?B?dGhMKytZWmMwNW1qdVNyaHo5UnVtaXQ0ZkpZa2lIb2VjSklEcmo4Mmd6Sklq?=
 =?utf-8?B?dFpTdVl2MXh6MEEwcXpORFdvSzZBVk9ZbFFiWXpsM0Z0MWlwN2xBMm9iTCt2?=
 =?utf-8?B?UkF0VGc1bk1jOVc5dEEvcTBJa3dBZzRFYnlCVUFBc2lZRTk5SGlzLzdzeStB?=
 =?utf-8?B?bkU3c3JuMi9ld0d2UUdHSXVFQyt1eGpobkI1ZjBNZExLTzB6ZHozVVVQc1Bz?=
 =?utf-8?B?aXk1TEg5WnNjUmoyc2VXVDkxQWtXNmhZclFiZ2VtTHNINW54UEowQytNMVI2?=
 =?utf-8?B?aUFSQnRFNmttYVJLbkVNWldJdjhldytjTTJtbnk4czRodHgwNHpVYUY4MnlW?=
 =?utf-8?B?VVBRTXlFclR3TU82RFY2M3BEN05hTkpkbUo2NWw4QlNKbGY0M3JRWEpiZXJE?=
 =?utf-8?B?RXNGNWt0M0dTcmVGQkR5RVN6anlEZlRUTmVzVVN3dDNUd25pRExSQVNIdXNj?=
 =?utf-8?B?V1IwZi85Y3FlME1JK0gvZkltVTJXOUpSVXhNL01kQ0I5SmlYbTRyMUdoeXpV?=
 =?utf-8?B?MzRod01uY0tPZ1F2bmppU0xBb2wwZTBsbzVEa2h0K2hJeG4yZ3g2YlRyQURi?=
 =?utf-8?B?a2M4K21XTjNsR1UveVNYNmVVWHlvSDJoeFliY2tmVGZHSVd3NkxlVEU1ZlNr?=
 =?utf-8?B?VW40OGNYN0lWOSszWm10ZXByL1doMGVscTV3V0VWWkRSdm5oUDBDQTA2NTZL?=
 =?utf-8?B?aTNtd3JPazVTNTlJUG53Ni8zVzdNc3dEUlpwclh4WCt0bVVQVTNia0lCNkZF?=
 =?utf-8?B?bWYxN21OT0d6dFNVNEtDRUpMcUE2aFhoSExCTDFtNnpwZm1na1Z1Q2VoQnZN?=
 =?utf-8?B?QytPWUd4QmNOZEcvZjZuclpoVktXNzVhdUtBOVZ1S1ZpenRnaHBwKzNMN3dL?=
 =?utf-8?B?OFF2dlhGeTV4UG9zT0c3MjF6bUluOTJ5NXlUUWFyZHlOQUFUQUlqYWZkUGty?=
 =?utf-8?B?NmFrNEViVTVyTEE2NXFKbHBZOHBuMGtnUG40a0dxbmVoa1p2SmVLcXBzYXUy?=
 =?utf-8?B?UTNaUTlTVDc2S1dHTmdaa2NxM0FJVkZNd0hicmdmSS9QaEhMeUhOL2pVZlkr?=
 =?utf-8?B?Y1VFdFpBTFVUN0h6SjZaR2pMT3hFaDJDbndNYXdQWjB1Uzl6bmF2U29zNGU5?=
 =?utf-8?B?ZjFjbEVHZWYrQytqeG92MHRzc1pvdEtJZFRraVdETDBSbXZ2NlgydkJIOTdZ?=
 =?utf-8?B?NDhnZ01iVWR0U0ZTUEZ0QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWNXR0sxMzNCQkFUcG5PM1hYMExYdGlDbFoxWmNCZ2s5Q3BZRFh3L1VuMFJO?=
 =?utf-8?B?S09aVWMybXFUTkdoLzk0a0RYUXR0QnlQdlV1enR5S040dG9kWnhJY0VnWUZo?=
 =?utf-8?B?ZGFpQll5ZXVVa3lncWU5TVN1VDBHaTZlVnlXaldaYU5ueTlRUDdKbElVQ256?=
 =?utf-8?B?Z01jbW9CK2hLRTVUS0tQNXJXYXk0QTBLZnprWUZPVGVBWmJFRVp3b3lhaWdk?=
 =?utf-8?B?UTEwT2lnVlFaYVdIWEJlckhocmRkMHN3M1JzazJBYzBhSU5qMVlBN01yYUNM?=
 =?utf-8?B?MTBuSWwrK2VaQnRzYWFmNjJMcGlxeG9JdWFhZ25lenRoT2ZDMUxuU042QmRH?=
 =?utf-8?B?OHFYVEthQnMvSjJoem5KWWFDV0Naek9ZM1BLT1JtdjZFRFhIaU85MzQ5aEFr?=
 =?utf-8?B?c0Q0Q1hXOE44cEtibUcrV1ZRS0lXeElXUjNFREwybzZYTEVCVElwWmMrVVRh?=
 =?utf-8?B?TnlDeDRRTjJGQ3J6czl5UkxhV2J6ZHJwNkZ3N3lUYklka2F3K2FxdUp0YWMw?=
 =?utf-8?B?VTFNYXc2TFZEdkVSRzBWRmJDZmRkSVkyUHE2MnFpMnhncXhhOS8weFBtTG9v?=
 =?utf-8?B?VGYzZXViM0NVMkxOMGVSWTJRcHZzaGFhWElLSzNheWxMK3FWSEdITndLRGhS?=
 =?utf-8?B?RDk5T0ZlV0ZnS245U3krZGJCbkJzYVVpRlFnL2d3MmhaN3RqRmY4VU1RSGV2?=
 =?utf-8?B?MTJSamhnVlkyMzhManczcFFET3NLOEpEOWk2TXd2Znd5ckY5TTlyQklRRWh2?=
 =?utf-8?B?V2tWUmJta2dkTmdkQ1BiZ1VoZ0Z4YUtUaStkS1R2SENya0pnRnBWY2hJOHU2?=
 =?utf-8?B?elZMRnZQQ0tRdUpqcEJYazdnMTlTejRNSThWbEJTa1grRWsvRmFNOE5qWXIw?=
 =?utf-8?B?TWlhQ0JySzk4N0Z4cVdiUk1WZmVaQnE1WWtKckEwNGVIRTA5Y3lzVldRc0hj?=
 =?utf-8?B?VXhpSFFFQlV2RmJtM0MwUG1QaVdxcUVubFhkM1FzQ0tmZ1ljc01tYU5md2Rz?=
 =?utf-8?B?K3hDVXRMdkdHQ2Y1a1dWeFRSOXdlRkFwb3EwdjlpaDFkaXZBQytCMXlNWTRR?=
 =?utf-8?B?RWlYMzc4U2tTa2p4YnNZUEN3Nis2K0VjQkIvSEhxY2Q1Z3ZadFFKM2FOU2lY?=
 =?utf-8?B?bHpUN0JIK1N6WUZZMTF4bHFGMHAzbUVTNFh3OGdocnl3M1llWHZQSTYwVWow?=
 =?utf-8?B?Y052cFpaZFQ5Z3k0VGpFamZBRGVyWXhiVThQUmtWUWFRVjRsQkkxOTFvU1I0?=
 =?utf-8?B?SlliUEhRaHZaOUtEbTQzSnlYcXJHNDBwUFlFM0ZhQzU2TXh0YW80a2EyUGhU?=
 =?utf-8?B?WENCS1pwZEw1VlZ0NEVJT1pMa2FyTExTdndORW9XcUZrOFkzdVpZQXRneHBk?=
 =?utf-8?B?WVZsK0xUZTZPcmxnZm82ckIwMjRISk1lSlRkT0w5MU1vdkxySzhEc3VqeXg4?=
 =?utf-8?B?dkpQWC93dE5zSlhvTTlIeEFlcXQyRUN1RVdrdmROTnF3Y283K0JoUWtRcGxy?=
 =?utf-8?B?cEJrUXpvL2NzTjM0L25ndksxMUkwYjF0dm9heGxPTlBRMitlbm1SZWJQWWpK?=
 =?utf-8?B?b016S3llM2dCNGlFTE16dVRFbERtN09qMTlxcmZuMGJwRVMrN3UxYzZ3UCtI?=
 =?utf-8?B?VVNobjBGcmF1QUJqenJaWDNyVHNnZGhDNVJaQlA3K3lQNDRGWk9Db01PODhY?=
 =?utf-8?B?aVRTdG5OYkpiOVF3OVRWNWxZVFkvRWlGUlVDcWNTdWJUdFp0MkR2Z3RPdFBx?=
 =?utf-8?B?d3hPc0pXWDNPdDJXeitQNTdnQXZLWjdNM3g4QTQ1dGxtWUxia0tFMmFGVzlw?=
 =?utf-8?B?QzJ4aDdrN1VQTk5PZmcvM3NsbDFKTERTdlM5YUlweDdmejVsTnFqdzRlNHB1?=
 =?utf-8?B?ZE1qTUxlWmpGQTFNRkUxZ2duak5qZi9qeCswYnY1RlNYZWF4K2R4aDRrUTQz?=
 =?utf-8?B?NlNYQmFQWXZDMC9Tb0pzdEdBZmIxaFJVUm8rYlQ3L2p0dGxWTlVsbkk4Y1hk?=
 =?utf-8?B?dnhhbFEyUXdDbTJCRDdWVmpSUm5QVUhhazQ1VTdrcEpiL2xPTGJPenUxYWZs?=
 =?utf-8?B?SmJUNW9oL2tGRVdJQ3g5UlZyRC84SzArdjcrTVJsMlRRb0QzbFRZVHpKZUVo?=
 =?utf-8?Q?+BXfQPtTTU1V7MSHrDWbvXui3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b9c251a-933a-4aaa-c2fd-08dd13414775
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 02:22:06.6095 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iHzPuMX3e5K+pt7r2Fnw/NqUZtXvaGCtFL3B78NhirfBNp4/Y8BQ0Sdnz/wPcLQOKUykbnWOTG1g5dOJNJK9wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8109
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

On 12/02/2024, Nikolaus Voss wrote:
> [You don't often get email from nv@vosn.de. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> Hi Liu,

Hi,

> 
> On 02.12.2024 07:32, Liu Ying wrote:
>> On 11/27/2024, Nikolaus Voss wrote:
>>> LDB clock has to be a fixed multiple of the pixel clock.
>>> As LDB and pixel clock are derived from different clock sources
>>> (at least on imx8mp), this constraint cannot be satisfied for
>>> any pixel clock, which leads to flickering and incomplete
>>> lines on the attached display.
>>>
>>> To overcome this, check this condition in mode_fixup() and
>>> adapt the pixel clock accordingly.
>>>
>>> Cc: <stable@vger.kernel.org>
>>
>> It looks like stable is not effectively Cc'ed.
>> Need a Fixes tag?
> 
> I will include
> Fixes: 463db5c2ed4a ("drm: bridge: ldb: Implement simple Freescale
> i.MX8MP LDB bridge")
> in v2.
> 
>>
>>>
>>> Signed-off-by: Nikolaus Voss <nv@vosn.de>
>>> ---
>>>  drivers/gpu/drm/bridge/fsl-ldb.c | 40
>>> ++++++++++++++++++++++++++++----
>>>  1 file changed, 36 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c
>>> b/drivers/gpu/drm/bridge/fsl-ldb.c
>>> index 0e4bac7dd04ff..e341341b8c600 100644
>>> --- a/drivers/gpu/drm/bridge/fsl-ldb.c
>>> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
>>> @@ -104,12 +104,14 @@ static inline struct fsl_ldb *to_fsl_ldb(struct
>>> drm_bridge *bridge)
>>>      return container_of(bridge, struct fsl_ldb, bridge);
>>>  }
>>>
>>> +static unsigned int fsl_ldb_link_freq_factor(const struct fsl_ldb
>>> *fsl_ldb)
>>> +{
>>> +    return fsl_ldb_is_dual(fsl_ldb) ? 3500 : 7000;
>>> +}
>>> +
>>>  static unsigned long fsl_ldb_link_frequency(struct fsl_ldb *fsl_ldb,
>>> int clock)
>>>  {
>>> -    if (fsl_ldb_is_dual(fsl_ldb))
>>> -            return clock * 3500;
>>> -    else
>>> -            return clock * 7000;
>>> +    return clock * fsl_ldb_link_freq_factor(fsl_ldb);
>>>  }
>>>
>>>  static int fsl_ldb_attach(struct drm_bridge *bridge,
>>> @@ -121,6 +123,35 @@ static int fsl_ldb_attach(struct drm_bridge
>>> *bridge,
>>>                               bridge, flags);
>>>  }
>>>
>>> +static bool fsl_ldb_mode_fixup(struct drm_bridge *bridge,
>>> +                            const struct drm_display_mode *mode,
>>> +                            struct drm_display_mode *adjusted_mode)
>>> +{
>>> +    const struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
>>
>> Why const?
>> If no const, then ...
>>
>>> +    unsigned long requested_link_freq =
>>> +            mode->clock * fsl_ldb_link_freq_factor(fsl_ldb);
>>
>> ... this could be
>>         unsigned long requested_link_freq =
>>
>>                                 fsl_ldb_link_frequency(fsl_ldb,
>> mode->clock);
> 
> I used fsl_ldb_link_freq_factor(fsl_ldb) to point out the symmetry to
> recalculate
> pclk = freq / fsl_ldb_link_freq_factor(fsl_ldb) below:

I would prefer to avoid this open coding of using
fsl_ldb_link_freq_factor() than achieve some sort of symmetry.

> 
>>> +    unsigned long freq = clk_round_rate(fsl_ldb->clk,
>>> requested_link_freq);
>>> +
>>> +    if (freq != requested_link_freq) {
>>> +            /*
>>> +             * this will lead to flicker and incomplete lines on
>>> +             * the attached display, adjust the CRTC clock
>>> +             * accordingly.
>>> +             */
>>> +            int pclk = freq / fsl_ldb_link_freq_factor(fsl_ldb);
>>
>> I doubt that pixel clock tree cannot find appropriate division ratios
>> for some pixel clock rates, especially for dual-link LVDS on i.MX8MP
>> and i.MX93 platforms, because PLL clock rate should be 7x faster than
>> pixel clock rate and 2x faster than "ldb" clock rate so that the 3.5
>> folder between "ldb" clock and pixel clock can be met. That means the
>> PLL clock rate needs to be explicitly set first for this case.
>>
>> Can you assign the PLL clock rate in DT to satisfy the "ldb" and pixel
>> clock rates like the below commit does, if you use a LVDS panel?
>>
>> 4fbb73416b10 ("arm64: dts: imx8mp-phyboard-pollux: Set Video PLL1
>> frequency to 506.8 MHz")
> 
> I probably could. The point of my patch is you don't have to know in
> advance which LVDS panel is connected, and you don't have to calculate
> the base PLL clock by hand and store it in the device tree.
> 
> In my test system, I have three different LVDS panels with EDID EEPROM,
> none of which worked with the stock driver, but all work with this
> patch.
> With slightly adapted pixel clocks though.

If each of the three LVDS panels has only one display mode, you may
assign the PLL clock rates in DT overlays for the panels. 

> 
> The driver already warns if LDB and PCLK don't match, because this is a
> hardware constraint and violating this will lead to no image or image
> distortion. With the patch the driver tries to fix that.
> 
> I don't know if it works for all or at least most panels, but for my

This patch is supposed to work for all panels and LVDS display bridges,
but I don't think it does due to the problematic pixel clock rates I
mentioned before.

> panels
> it does. And if the clocks match, by chance or by refconfiguring the PLL
> base
> clock, the patch does nothing.
> 
>>
>>> +
>>> +            if (adjusted_mode->clock != pclk) {
>>> +                    dev_warn(fsl_ldb->dev, "Adjusted pixel clk to match LDB clk (%d
>>> kHz -> %d kHz)!\n",
>>> +                             adjusted_mode->clock, pclk);
>>> +
>>> +                    adjusted_mode->clock = pclk;
>>> +                    adjusted_mode->crtc_clock = pclk;
>>> +            }
>>> +    }
>>> +
>>> +    return true;
>>> +}
>>> +
>>>  static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
>>>                                struct drm_bridge_state *old_bridge_state)
>>>  {
>>> @@ -280,6 +311,7 @@ fsl_ldb_mode_valid(struct drm_bridge *bridge,
>>>
>>>  static const struct drm_bridge_funcs funcs = {
>>>      .attach = fsl_ldb_attach,
>>> +    .mode_fixup = fsl_ldb_mode_fixup,
>>>      .atomic_enable = fsl_ldb_atomic_enable,
>>>      .atomic_disable = fsl_ldb_atomic_disable,
>>>      .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
>> -- 
>> Regards,
>> Liu Ying
> 
> -- 
> Nikolaus Voss

-- 
Regards,
Liu Ying

