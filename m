Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C72194085C
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 08:25:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5919210E421;
	Tue, 30 Jul 2024 06:25:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="m/bdIN7t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11011070.outbound.protection.outlook.com [52.101.65.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F8B010E3DA
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 06:25:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vGdzuEg6QtwWNbIEJuxZMZQi2w9rPCJ7pmZOSqA8GPllbTnnO1fXIYhoC5SPSOZpIBT8O14Oz+tnnaKqnWNXuN9K8ivNAZRcDqRUPmkuSeL4ShSV/sqnjCP4gsC4OA7IsNzG865rcAzR6KgKJ4FoMpC/9mNBNGnGfx/9qDd+aEaDRHHQTIj3avFnMkN8P4rgSpEwHGt/6BFb7gWc157cQ7nrORa12/LJFPNDT2KWyj3qzV4xBzFnrABV5uq2t9jIRzZpacgnhosmbc5KZDraWZ7rx53PKwLRyjeJC+YpdF656WqHfI660plUD7w71u8gJe8SUg34LS0YqvE7wBrw9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jIXJomD+2cbN1vsRLKEwUM8DfXFO5FTjqiYmRtzOf3w=;
 b=rVUaNZ9EXqDRENt+TQkG9IFf+VLLX3E4haiCw3GgDNPSathE6AFUH37O3qF0oqDgZG57xOXXr4zyUxvagIAMt/gAlUkwMDts5Ld32ZTej7A7puA82EvSJ9D+LoalILBs7b4T7oYvvfnkEW1tzSN/HGf8wDcCBrmxB5w8UNTEP+U4JpGe86QmrGmZdzUzkN6tY5bcD8XrKkwus6zTkBbuXDH7yUXhLhBfBlRwPu7GRfjjKfUEnwHEakJ6kOr1NN5AeHZLlOGHyOPj9TIttxzacMN9nmYCe5HQE9dLNoeWcH60TRguIpxG0sTeyaVOtecbKeMLaCq7lmRtk5QfybbUzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jIXJomD+2cbN1vsRLKEwUM8DfXFO5FTjqiYmRtzOf3w=;
 b=m/bdIN7tqwTpXZNoPLXFPOiKiLU5sPoSFjjoSVdKDjOp42kEEEKGGEdsoIOyvJ6ixkJ78BMKG7kwKpD/ak/6C9Eg83nW17DL1v2923ZPq3kNt2TBvgBDvHd/tngiHbsiu0LhmgBYlE9Xaulx4hj/LNHPW32wGJqhX4XiNYTqJzOFwbOQxLaavXqSjr9VmYYsLNSJtO3zIAnN1pIgl8WfnbWpEnpdw2q0lu0DEGQn5ya2sZkg/nRBsnWcgpqBZRvAoKK54l8rAIgA60yWxLA9jOzoOJyVjWa+eggCgn5Z86fwTXswRGcCsrBeo5wUdJNDOL0QZt75CClMidD83N+PRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Tue, 30 Jul
 2024 06:25:16 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 06:25:16 +0000
Message-ID: <8071fdf8-6813-4707-8a9c-ad24f8b6a32f@nxp.com>
Date: Tue, 30 Jul 2024 14:25:41 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/16] drm/imx: Add i.MX8qxp Display Controller display
 engine
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org, kishon@kernel.org,
 aisheng.dong@nxp.com, agx@sigxcpu.org, francesco@dolcini.it, frank.li@nxp.com
References: <20240712093243.2108456-1-victor.liu@nxp.com>
 <20240712093243.2108456-7-victor.liu@nxp.com>
 <ib6brwxeai3wkgzglihfbqx7jakjslnftydbzo32xthijkd4u6@y4ebhgk5o3ec>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <ib6brwxeai3wkgzglihfbqx7jakjslnftydbzo32xthijkd4u6@y4ebhgk5o3ec>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR06CA0191.apcprd06.prod.outlook.com (2603:1096:4:1::23)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PAXPR04MB9448:EE_
X-MS-Office365-Filtering-Correlation-Id: ceb61d9b-481f-44ae-0de9-08dcb0606094
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dEppM1VQWDhLOHg0c0MxbWNuQU1IR3lEbVN4S2JteU5icDNxQVFablQzVkw5?=
 =?utf-8?B?amF6eFVrclRZVjJwWFNNMVZkL3FNUXhybzlxWDY3K0FwQ2JKTENoVnFoakto?=
 =?utf-8?B?T3liaUZjMWlwRGFpVi9iUHluR1gxYlc2RFluRGZnVFJNdE1XTUgzdUE5Q0Zx?=
 =?utf-8?B?d281R0Y2VjcyZkUwODBsTzJGTlRXd2x3Rm9DVDZzRUZmY05odGNrcVBmcmhR?=
 =?utf-8?B?cm1VRW00bjhOMXo4TGpMam12SnBIRWc1RXFrNEtURGdvcEo4eVJzNnJkeFA2?=
 =?utf-8?B?OFF0cnpINHppcmJiRkZBNjdqUzFBV215bEpmdmpwaHVTNGRaa3RMbnZxWElw?=
 =?utf-8?B?NE5Jd1VoK0loc2IxUDlGWjYvdXhFaHJES3JXRFR4MWJYT3dpUGtiQ1JpbHBI?=
 =?utf-8?B?ZEgvUUZrRVlSU2s0V1RvWTdBVXJHdjB0QmxWNkFzSVgrS3BRMWlvaSs2SVIv?=
 =?utf-8?B?eFdwazdDSlNZYXRtcmtOdEh1VEs4Z0VlaTVCbUJKTTJKR2dvN0VpL0Zpc2Iz?=
 =?utf-8?B?K25MdUwzQThRdE0zbjRuRXU3U2NnV21xcy94QnBmaHRGTzYvdEc1UjZJcXVQ?=
 =?utf-8?B?dGY5STdDQWlpcm5XeHdSUmI1Zjd0QVdyRUVYNzRQQ3E2QnFIWHdYcUx5MEFa?=
 =?utf-8?B?c0ZtNFlHbGd1Z1I2OUk1ZlB6cnN1bWhST2JSd1BLbTZPTy9VN1JlUFE4UVVL?=
 =?utf-8?B?a3ZDVkRFSjdGQTRjMjlEUWhnQmphODRpdEk0SDl1NjVHa011WDg5OFhVZlhN?=
 =?utf-8?B?RVNUNytJZVIwTkVGbk5BU2R5VlVQL3gwZXFyMWNUc0xjVDFnNElYaUdjc25s?=
 =?utf-8?B?bU1keVZUcENhL1paQlhkanBwYXl1QkFSd0hnQ1BSQmxQendvbE9hVXppbHF0?=
 =?utf-8?B?Z0M4M0o2aE1lMDBGc3BlT3FaVWErMG41WEtmeE43b3ViVWJVQ2ZiZ0g0ai9L?=
 =?utf-8?B?Y295UEJFaHo5MlJpVWNCbEdrcE1ZdVJIeG1UUkI5TDRTem8yWTlEaWJUTFBB?=
 =?utf-8?B?Yi9WbDZXMWpMbmRPNTBMNUx1VDl2L2c0eStNTldaYVliSGFoeVN0V0NGSlpU?=
 =?utf-8?B?bkVNOWcwSDZtSUxMV21HR3ovWU5hYU55cmJZTGlxNTJOeHVnVkd0Vk90Y3cz?=
 =?utf-8?B?anFvVlNTQWZUUVQyb3JySHQ4Uk9WcnBCeGJjdXg4Z0pxTDNMR21mUEUvaVZ5?=
 =?utf-8?B?WVR2MUIxckpoWWg3Tm0rcTZOZWJhenoyd0FvMVJPMlVheXJJWjZRZWxRMXZx?=
 =?utf-8?B?dEFuVmhVMGU3Z3BmQnd1TGw1N3dvNkx6RytneEgyOUZ0TmJjaXRlRjJNcm1D?=
 =?utf-8?B?bjY1anQyRFJiM0VYK2c4OXJZSkJiUXBxZmJYRzVwdFJnNW8xZStONHMxN1VX?=
 =?utf-8?B?S1VsbndMaFFxQldzdTJlSE5jOElyOXo4ZUYwT1l1MUU3M2kvZ0xJY3J5ZnBq?=
 =?utf-8?B?OGdtWWh0TVhZblJvQUxZWDRVb0dzMHpqeFhqS0dzbWdYT1JQeWp3VVp0ZjhN?=
 =?utf-8?B?ajFSanhuK1pYdzhVKzlhVHZEaEYwU2tRMHBpN2lXQVpUeEc3U0V0clk0Q2xr?=
 =?utf-8?B?TmNydytSazJJTnNzdGZlL3Q1S2NzRkZseGo4Zng4VkJ3ZFhSOEpzNHFubEti?=
 =?utf-8?B?cDJYWkZKc0tOVmdZUWtiQjFFejVoeC96QjF6a1U0YjlibWxjY0pOdVlNZ2hB?=
 =?utf-8?B?S0RvM2NCYm0wTGxMRmF3Y1kxclBWUWxYQnRMemJQMUg4ajl6OCtIQUw3OHl0?=
 =?utf-8?B?MVI1YTFJTmxOeGd4TDhZUzQrUkVXL2Q3cWhmbGJYL0w2elo5bm80TGZDeEE0?=
 =?utf-8?B?OG1tbVVwdnF2WVUwenFTZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkdqUzZYQzVwVTV0VC96dVg3Ti9rKzlIWTduMnp3SmxJdjdXWHYySlEwMTFQ?=
 =?utf-8?B?c3RIb21lTE9aZ0RSVXpTNTFMVk9sd2lxMWxJOEFjWnBCSjJOUmZyWS9YS3Zq?=
 =?utf-8?B?UEwrVTJxb2VzdVdZZXh1TDZvOEFaSzdCMkRMWitNVVl4NWlTYnlsNS96M1JL?=
 =?utf-8?B?V0N0OWM4QVh4U01FOTcwdEpNTUZMemhFQ2RrWmdRcG9EUW5GTDJnQ2h3c0Yr?=
 =?utf-8?B?cXV3Mk45d1h4KzN6ZWtEOEJOUHVPdWpUWExhZ3pxL3A5d0hkQzdaRnR5S2wz?=
 =?utf-8?B?dVkwZUM3SUlUSisrQkUvRldEeXpPWm5RY2RhSFUzZW8zS05CNWZEL2UwVCtO?=
 =?utf-8?B?MTNJeGFydGRBeDFVckRwV2lYSDlkOCs4c0NjZVUzdkViUWZ2dXhWbEl6cXFY?=
 =?utf-8?B?aDdLZ0JPU2Z3Rk1KdHhSeDhZUzNEakNFMDBBa1M2K1hiUTk4dDYzdmlRcFN0?=
 =?utf-8?B?Q3ZwNGtPMTgrQlcvYkp4N085cEJRSTlYM2NlS2FxeTg2R2I3a25neUIwTS9h?=
 =?utf-8?B?dit3Znc4TFoyMkdJYkxySUVsYWQ0NDJGdy9CZXFIRW1BbXRDYjMxU0Q3eUR2?=
 =?utf-8?B?Mzc5UHFJcVdTZnNqQ2NGWGsrRkNMMUFpWVkyaGRrUllqOS9aQTJkVjlxQjUw?=
 =?utf-8?B?WW5wbUZicWV0TXRaK2JENGNjMEM5YUNsWGZEME1jVzRubWtjbUFHS1ZEWGlK?=
 =?utf-8?B?eVJnUXdSeVZGYkFaR0xlQnRvZU5kMGpyT0pKMURUaDZJWkhEYmp4YU12T2lG?=
 =?utf-8?B?THhqdHEvNTQ2NXA5SDlmYTJ0L0hXTlc2bkVqNGJDZXZkcHp3c0NuaERVaVZa?=
 =?utf-8?B?ZzhHNVl4cHhPY0lycHUybVNocjlHR0lWUEVSWlY4SUExVlEraDhPOHF2c3FZ?=
 =?utf-8?B?azZqeGFNK1hDYi9jRm10NDJwQk9wZ25nSnBEREhVWUE0MEdLWDZrN3g5NHJk?=
 =?utf-8?B?WUhuMEQ5ZHA1VHdURVNIeEdDWDJ0WC9rQUdDaEQwTmx5NDhoV0RDdmpZaEg0?=
 =?utf-8?B?UXJzNjQ1aDRUa2tRMHlZM203dkM4dHJlUDQvT2p3VjhOb3FlNG5wNkZGUGZp?=
 =?utf-8?B?aXZJbEs0Mjc3Z0Q1elZLNElybUk4WkpGTUN3d01WYWdhc25kejFZaUhDamYr?=
 =?utf-8?B?WndyR01VNlREUjRpZ3JzallLZDNGd1VXNmhaYVgrRmV4U0ZmRTV5dGxpaEZM?=
 =?utf-8?B?ei84d29zSytLc2RmUGVrY0JORjFxNmFqVkduSFpsTm9IcGNkcmNkWHUwbERZ?=
 =?utf-8?B?cnZwS0U0R0FkRDc4QUFncmI3RGQwRjIySjVlZHZydGtzWWtqMEJ5VnJMdUpY?=
 =?utf-8?B?dkZiWmEzL0Uxa2VIUUNlUE9qOG5DcCtWczRWNEFaandQVk5pT3RqcVJvVi9O?=
 =?utf-8?B?MktpUjdlS0ZjTEoyMUxMNzR4NXZhTElPbEdxQTdRZEluVnlQN1JnSFRoZm9W?=
 =?utf-8?B?Tjd2QVkvb0J5U0RvMkxveC9wSFhBVytjN1lwOUNYQk1xSUVSOHJ6L3grQ1dL?=
 =?utf-8?B?emszYzZnQzVZWTRSdllrNVA5NVU4dXVIL0FLOWNBczRKbGNqb0hpNGEzczRt?=
 =?utf-8?B?aUlrZlpmU3FlRWFOU244NFFENXhuczZ6R0xxc3R4aXdRTUR1YS8vMUlTMXdQ?=
 =?utf-8?B?cll5OTBUTW82QndYNE1PeVZibXkzUDBDRk5ycXpBdlhleGFreEYrZnd4ZU9J?=
 =?utf-8?B?NHBoZXI4NGtTaVA0L3ZjTXZFdk9FU29EeW43VnduUHdHQjM3eVMzRU5ZMURE?=
 =?utf-8?B?UzRNeWwyZUpFK3Q4WU03VkVoR09HU1RIM3dheE1lZC9tWUpCb1p4aElxc3pI?=
 =?utf-8?B?YS9KSlZpSC9QeUtaSmhIQnlqamx2WWFPdTVYODRNQW1hQkJ3S29vbWYxZ2pQ?=
 =?utf-8?B?UnpLMUVjdldtZWdVSUpjNXVEMVhNTjJTd2JXZzdSbURkektUNFoybmQ4a0NR?=
 =?utf-8?B?WVovaHl5NEVMQkVLR3p0Q1ZuOU5NbUMxYUNBUkRLSE5xUmluVHJ3ZFJpMXg3?=
 =?utf-8?B?WEZZNi9PbjNqUzVSa2krRHJsejFRSUJUa1AydExlZnhiKzRoUVMwbGI0N3I2?=
 =?utf-8?B?ZU9RdVVDeUNtbEdSeFN1YkFZcmpmajlValQ2QUVvS05NbWtqQ2tLUG9LMkRi?=
 =?utf-8?Q?EO/gAjKYNzEnAnqYkHug0+RUY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ceb61d9b-481f-44ae-0de9-08dcb0606094
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 06:25:16.4642 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e/NXU35QQQ2CLctyq0QKBgyR7BHFqc3cpOxwLRjHvuj6EEWhDsY89epyJTq1j2dfebyNv/VCY6FUGdGJUJuKUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9448
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

On 07/28/2024, Dmitry Baryshkov wrote:
> On Fri, Jul 12, 2024 at 05:32:33PM GMT, Liu Ying wrote:
>> i.MX8qxp Display Controller display engine consists of all processing
>> units that operate in a display clock domain.  Add minimal feature
>> support with FrameGen and TCon so that the engine can output display
>> timings.  The display engine driver as a master binds FrameGen and
>> TCon drivers as components.  While at it, the display engine driver
>> is a component to be bound with the upcoming DRM driver.
> 
> Generic question: why do you need so many small subdrivers? Are they

As we model processing units, interrupt controller, display engine
and pixel engine as devices, relevant drivers are created to bind
them.

Maxime insisted on splitting the main display controller(the overall
IP) into separate devices.  Also, Rob asked me to document every
processing units and the other sub-devices in v2.  So, splitting the
controller is kinda accepted from both DT PoV and DRM PoV.

> used to represent the flexibility of the pipeline? Can you instantiate

No. They are just used to bind the devices created from DT.

> these units directly from the de(?) driver and reference created
> structures without the need to create subdevices?

Given the separated devices created from DT, I can't.

> 
>>
>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>> ---
>> v2:
>> * Use OF alias id to get instance id.
>> * Add dev member to struct dc_tc.
>>
>>  drivers/gpu/drm/imx/Kconfig     |   1 +
>>  drivers/gpu/drm/imx/Makefile    |   1 +
>>  drivers/gpu/drm/imx/dc/Kconfig  |   5 +
>>  drivers/gpu/drm/imx/dc/Makefile |   5 +
>>  drivers/gpu/drm/imx/dc/dc-de.c  | 151 +++++++++++++
>>  drivers/gpu/drm/imx/dc/dc-de.h  |  62 ++++++
>>  drivers/gpu/drm/imx/dc/dc-drv.c |  32 +++
>>  drivers/gpu/drm/imx/dc/dc-drv.h |  24 +++
>>  drivers/gpu/drm/imx/dc/dc-fg.c  | 366 ++++++++++++++++++++++++++++++++
>>  drivers/gpu/drm/imx/dc/dc-tc.c  | 137 ++++++++++++
>>  10 files changed, 784 insertions(+)
>>  create mode 100644 drivers/gpu/drm/imx/dc/Kconfig
>>  create mode 100644 drivers/gpu/drm/imx/dc/Makefile
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-de.c
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-de.h
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.c
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.h
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-fg.c
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-tc.c
>>
>> diff --git a/drivers/gpu/drm/imx/Kconfig b/drivers/gpu/drm/imx/Kconfig
>> index 03535a15dd8f..3e8c6edbc17c 100644
>> --- a/drivers/gpu/drm/imx/Kconfig
>> +++ b/drivers/gpu/drm/imx/Kconfig
>> @@ -1,5 +1,6 @@
>>  # SPDX-License-Identifier: GPL-2.0-only
>>  
>> +source "drivers/gpu/drm/imx/dc/Kconfig"
>>  source "drivers/gpu/drm/imx/dcss/Kconfig"
>>  source "drivers/gpu/drm/imx/ipuv3/Kconfig"
>>  source "drivers/gpu/drm/imx/lcdc/Kconfig"
>> diff --git a/drivers/gpu/drm/imx/Makefile b/drivers/gpu/drm/imx/Makefile
>> index 86f38e7c7422..c7b317640d71 100644
>> --- a/drivers/gpu/drm/imx/Makefile
>> +++ b/drivers/gpu/drm/imx/Makefile
>> @@ -1,5 +1,6 @@
>>  # SPDX-License-Identifier: GPL-2.0
>>  
>> +obj-$(CONFIG_DRM_IMX8_DC) += dc/
>>  obj-$(CONFIG_DRM_IMX_DCSS) += dcss/
>>  obj-$(CONFIG_DRM_IMX) += ipuv3/
>>  obj-$(CONFIG_DRM_IMX_LCDC) += lcdc/
>> diff --git a/drivers/gpu/drm/imx/dc/Kconfig b/drivers/gpu/drm/imx/dc/Kconfig
>> new file mode 100644
>> index 000000000000..32d7471c49d0
>> --- /dev/null
>> +++ b/drivers/gpu/drm/imx/dc/Kconfig
>> @@ -0,0 +1,5 @@
>> +config DRM_IMX8_DC
>> +	tristate "Freescale i.MX8 Display Controller Graphics"
>> +	depends on DRM && COMMON_CLK && OF && (ARCH_MXC || COMPILE_TEST)
>> +	help
>> +	  enable Freescale i.MX8 Display Controller(DC) graphics support
>> diff --git a/drivers/gpu/drm/imx/dc/Makefile b/drivers/gpu/drm/imx/dc/Makefile
>> new file mode 100644
>> index 000000000000..56de82d53d4d
>> --- /dev/null
>> +++ b/drivers/gpu/drm/imx/dc/Makefile
>> @@ -0,0 +1,5 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +
>> +imx8-dc-drm-objs := dc-de.o dc-drv.o dc-fg.o dc-tc.o
>> +
>> +obj-$(CONFIG_DRM_IMX8_DC) += imx8-dc-drm.o
>> diff --git a/drivers/gpu/drm/imx/dc/dc-de.c b/drivers/gpu/drm/imx/dc/dc-de.c
>> new file mode 100644
>> index 000000000000..2c8268b76b08
>> --- /dev/null
>> +++ b/drivers/gpu/drm/imx/dc/dc-de.c
>> @@ -0,0 +1,151 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * Copyright 2024 NXP
>> + */
>> +
>> +#include <linux/component.h>
>> +#include <linux/container_of.h>
>> +#include <linux/io.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/pm.h>
>> +#include <linux/pm_runtime.h>
>> +
>> +#include <drm/drm_managed.h>
>> +
>> +#include "dc-de.h"
>> +#include "dc-drv.h"
>> +
>> +#define POLARITYCTRL		0xc
>> +#define  POLEN_HIGH		BIT(2)
>> +
>> +struct dc_de_priv {
>> +	struct dc_de engine;
>> +	void __iomem *reg_top;
>> +};
>> +
>> +static inline struct dc_de_priv *to_de_priv(struct dc_de *de)
>> +{
>> +	return container_of(de, struct dc_de_priv, engine);
>> +}
>> +
>> +static inline void
>> +dc_dec_write(struct dc_de *de, unsigned int offset, u32 value)
>> +{
>> +	struct dc_de_priv *priv = to_de_priv(de);
>> +
>> +	writel(value, priv->reg_top + offset);
> 
> Is there a point in this wrapper? Can you call writel directly? This

At least, it helps finding read/write ops upon interested devices through
'git grep'.

Also, since we have dc_*_write_mask() helpers, it doesn't look too bad to
have dc_*_read/write() helpers.

> question generally applies to the driver. I see a lot of small functions
> which can be inlined without losing the clarity.

Can you please point out typical ones?

> 
>> +}
>> +
>> +static void dc_dec_init(struct dc_de *de)
>> +{
>> +	dc_dec_write(de, POLARITYCTRL, POLEN_HIGH);
>> +}
>> +
>> +static int dc_de_bind(struct device *dev, struct device *master, void *data)
>> +{
>> +	struct platform_device *pdev = to_platform_device(dev);
>> +	struct dc_drm_device *dc_drm = data;
>> +	struct dc_de_priv *priv;
>> +	int ret;
>> +
>> +	priv = drmm_kzalloc(&dc_drm->base, sizeof(*priv), GFP_KERNEL);
>> +	if (!priv)
>> +		return -ENOMEM;
>> +
>> +	priv->reg_top = devm_platform_ioremap_resource_byname(pdev, "top");
>> +	if (IS_ERR(priv->reg_top))
>> +		return PTR_ERR(priv->reg_top);
>> +
>> +	priv->engine.irq_shdld = platform_get_irq_byname(pdev, "shdload");
>> +	if (priv->engine.irq_shdld < 0)
>> +		return priv->engine.irq_shdld;
>> +
>> +	priv->engine.irq_framecomplete =
>> +				platform_get_irq_byname(pdev, "framecomplete");
>> +	if (priv->engine.irq_framecomplete < 0)
>> +		return priv->engine.irq_framecomplete;
>> +
>> +	priv->engine.irq_seqcomplete =
>> +				platform_get_irq_byname(pdev, "seqcomplete");
>> +	if (priv->engine.irq_seqcomplete < 0)
>> +		return priv->engine.irq_seqcomplete;
>> +
>> +	priv->engine.id = of_alias_get_id(dev->of_node, "dc0-display-engine");
> 
> Is this alias documented somewhere? Is it Acked by DT maintainers?

I see aliases nodes in about 10 .yaml files as examples.
If needed, I can add them to examples.

Rob said "Ideally, no" to use alias in v1. However, IMHO, it is the only
appropriate way to get instance id. In v1 review cycles, we've seen kinda
4 ways:

1) fsl,dc-*-id DT property
   Rejected by Krzystof.

2) OF alias

3) OF graph ports (Rob)
   This doesn't directly get instance id but just tell the connections.
   Since there are too many input/output options between some processing
   units, I hope we don't end up using this approach, as I mentioned in v1.
   It seems be difficult for display driver to handle those ports.   

   VC4 Hardware Video Scaler(HVS) is not using OF graph ports to tell the
   connections to display controllers, either. See brcm,bcm2835-hvs.yaml.
 
4) fsl,imx8qxp-dc-*{id} DT compatible string
   It doesn't seem necessary to add the id information to compatible string.

> 
>> +	if (priv->engine.id < 0) {
>> +		dev_err(dev, "failed to get alias id: %d\n", priv->engine.id);
>> +		return priv->engine.id;
>> +	}
>> +
>> +	priv->engine.dev = dev;
>> +
>> +	dev_set_drvdata(dev, priv);
>> +
>> +	ret = devm_pm_runtime_enable(dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	dc_drm->de[priv->engine.id] = &priv->engine;
>> +
>> +	return 0;
>> +}
>> +
> 

-- 
Regards,
Liu Ying

