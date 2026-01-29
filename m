Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPS3FD8Qe2nqAwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 08:46:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E023EACE8F
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 08:46:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32DA010E7FD;
	Thu, 29 Jan 2026 07:46:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="m475rDKc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011055.outbound.protection.outlook.com [52.101.52.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F71D10E801;
 Thu, 29 Jan 2026 07:45:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CY+UI3zr46o6rC2xfFcGLgxMAcFMmlBWBYbqK2UgBHm3tbZKyxlO09tko/d/c2aYG+V4D33V5OXDVI4RUB+QFEWrz4ZHxppckipTCGtUdwWLEmpombFQtFUnOl999Ea1BKPM+OiU17vSJuPYDQ0DZ73ITQBJzMyPLw1l3helXv19ve2+CRXdMkaXoz8JNXR9yv8aJjXtlMMX5L79ujFJIjXrE0pfDEXQZBUFxLeFv/R2qEE0pzQyQ5oP79Ke7vnuzlc4xl9F+JDfBOzFokxt89ZyYUKl/8weXdAlLTb3ZBFeGkVujJzKnRX8C3OILU0rbqwtjRqQpV/NJDDxYP2yEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=REx9ZFL33SHL/Y3hf7WaBe4cOQ1mtKshVcngJgPkt0U=;
 b=oSrEBE/YuoJdtKM7IllxHtV+zgGHDRhWP3I/r3uB4ZsXoqjhmVa2AlY2jyJMce10AeNMkM85eMTlgEnjKD3Lyloa+0noSLtTm0v0ta6yL7EHoM4JWUIV2O0+VAKEE5H3T9Y9IXpAEDoIcy7BLq7d93M7EpUrm0N5lbnLxUTFiYCisEwUHSt3i3zBlW+gnJP4tZvjoi3jkQd9cBH2rXF/nviM0gT9x2/Qq/ZRT29ZYFJWH6q4WlplxYbJ6iR0Fywh1ljKK9B+Fcrdhehs+xDOHgs4IDtVKEk+At6zdsPV/wVIW9LbO+iT1T5/51q44Z4SCYwKc5FKChhVzMK5QwYlIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=REx9ZFL33SHL/Y3hf7WaBe4cOQ1mtKshVcngJgPkt0U=;
 b=m475rDKcvXA+A5DRX++kvVi14dp9oNcacsOYifNCxV9RPRyZNzSlalli5SCiFDR438dYA2t+qojnrMBHR5FgdZgCt0HUPYd3zZkavVm/hfu2Z/9AdTgA7sr6H9SZ6ZfongoOtkuL2a9DwzC6RoRkCzKORQJ5QBJx7ZqwIQD0XDohu0JLioqX074mGL6ohBwk8s914n93i8XydhXZn6L0eqCx8Zy+v/YJ3iNq7V0ADpbOBFpcstGxMAU0M7d3MV+yiwJM8JOJwHj0U+AGfHKMtll0Idn+wNpm+E1ih2Eaeh0Wx6C4Y12WHyRMO0TCGfJ5gJfSo+tYl84glZqlwhxENA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by CH3PR12MB9124.namprd12.prod.outlook.com (2603:10b6:610:1a7::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Thu, 29 Jan
 2026 07:45:52 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%6]) with mapi id 15.20.9542.010; Thu, 29 Jan 2026
 07:45:52 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Thu, 29 Jan 2026 16:44:59 +0900
Subject: [PATCH v3 1/5] gpu: nova-core: gsp: fix incorrect advancing of
 write pointer
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-nova-core-cmdq1-v3-1-2ede85493a27@nvidia.com>
References: <20260129-nova-core-cmdq1-v3-0-2ede85493a27@nvidia.com>
In-Reply-To: <20260129-nova-core-cmdq1-v3-0-2ede85493a27@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Alistair Popple <apopple@nvidia.com>
Cc: nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4PR01CA0016.jpnprd01.prod.outlook.com
 (2603:1096:405:2bf::15) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|CH3PR12MB9124:EE_
X-MS-Office365-Filtering-Correlation-Id: 483d7914-491a-443e-893b-08de5f0a6daa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZWlvcER1b1RHT3hoRWs4UU02ZStxMEpaT08xSFRFdU41WW9NVG5zRlFUVUZI?=
 =?utf-8?B?RFdRR3RrVVhJQkhXK3VBQXVSSG1aRzd3NnBqemFOeWtSMmRPV0M3Z0RuUS9D?=
 =?utf-8?B?V2dPNGFGY1RGZjkrOU1DMHpCaFNtSzdWK1lOcnpodjlIRlJjcHZ4a3BaWkFZ?=
 =?utf-8?B?SFBIZDl1RzUxeFVsaWRZNmZCK1Y5eXZpYUg0d2F4dFN2ZHlTaTJJcHNtNklp?=
 =?utf-8?B?cGFFUE9qazE0V3lxazBlaWFuMFk3cllWeXJ1REpSTmZiM2JSelVtZkhhU1Z2?=
 =?utf-8?B?ekc2V3JvK2dadnVIbmZ5T1A0ZE92ejZwYnB2UDB2dVBMWkFxVE1jOU1oMmtW?=
 =?utf-8?B?ZnBhYytqTXNpMFBNbzJGN1RXVFNWNStOK2ppWm1yL29BRm1iZnNxeVo5RU55?=
 =?utf-8?B?QWtGS1BkS2RzWUZJcW9zYXFTdmdKT1RueS9uMURkdHlLKzRpL3NBdVl4eXdz?=
 =?utf-8?B?VE51NktnV3hZcW9LMUhsb0pHcEhOU3lYWVZUU2tqKzhKWXJuMjMxb0ZSUldX?=
 =?utf-8?B?YUMxU0hBZzZkOEtPOXROaGQ5OVk3VDhNeDZFeSt5cmV5S3JMYVdleTZsQWVO?=
 =?utf-8?B?ei9iYmNnYVQ4VGt2cTdkWHpINWM5cWtTSnpNS0FHWGdOeE5STmExekVHKzNF?=
 =?utf-8?B?V2l2MkF2OXN5VHI1UjUxYjk3dWlSZkVxMlBZYXRuMUhQTWdScllOQXk1bkpH?=
 =?utf-8?B?SEdDK0RreVFObjVnNWNGd2lRNDZNY09EeUoxTzNwUk9MQllZQXJhUzFlNGsy?=
 =?utf-8?B?cUpWdEkwaDh5SWVocXBmamNHWHZINkdQNnNhREdYYlRaaHY3TWVzTmFTQ21v?=
 =?utf-8?B?ZVdzd1RacDh0djh0eGNldjJLZ1dJaFpKb0l2dDFTb3BQOUhBU215RmtsZEt4?=
 =?utf-8?B?eno1SzN6a2NTUjNRNVJrbWcrWnpTOTVOQU8vRE8yQ3hmSXRuaEtWcFByUUNW?=
 =?utf-8?B?MnJ4Sm1LY0krT2E2STlzUUFkQjEwMVUxeXNsK2ZkWHZoNmttdTVNYmttdEp2?=
 =?utf-8?B?T2VEbmRxcjJ5SmpqQ2dzdGFtcFcxVFh2WHN2WmR4VGZ5UGZsK2JiQVkrZ1NC?=
 =?utf-8?B?SUVJTlZvMVYySkRRZ1NHeDVBWG12UVFiWmxzYXZVMklraWpIdHd1VDB0VVl4?=
 =?utf-8?B?dVdQcmk5M3VhWnl3ZkNra0c4dDVzalVzYTNNWXdvaVpBR1pLRVpSVnV0RkYx?=
 =?utf-8?B?eGluMUVtd21Da3kyRzlLYVpmM09VcmQ1cjRwR25JVElYS09hbWxtK01qcHVU?=
 =?utf-8?B?YTkxV3pqUi92SUw3dW03cExOcXMrZU1BT05kaDFRT05ON3JkaWdpS2ZrSitn?=
 =?utf-8?B?SUMvU1YvRDIvN1VwNUpTR2JLUE5VbkMvK1UwSzlWNFdQMjFmZ3l4Znl6T0pF?=
 =?utf-8?B?RVl0R1lHSWFWNXhVa1kzQjRxdWpZN3EvR3FYVXQ1Tm91Yk03amt0ZmZsdUJV?=
 =?utf-8?B?UTVDT1lPbUdOd2VxRUlvVm9QSWpSWkRCeFRrSW55SzQ3djFqN2JTdDRKYldT?=
 =?utf-8?B?bmg4dXNaaVlXTTJDSndoUkluOVR1UzgyZnFWSWJiaCtTbHp3WlZydTl0cXQ5?=
 =?utf-8?B?aFZxRFJ1ZWlKRkE5WVZLTEtqRVBHejVORkF5UlFQM0Vra3dWTjRhUi9ZcHVo?=
 =?utf-8?B?RldvQUhOaTJKTVFMZDY3MEdoaGQ2allFcHlsalBlc3I3ZytkZDQzV0NTTXgx?=
 =?utf-8?B?WnJxWXEwN0JmQzZyL2VFRFd0c0ZIc083c3JtdWdzRXVyTVpQL1k3RDR1KzhQ?=
 =?utf-8?B?NDZZcFpJTnZrTERvZzlSamJZLzZkdmFiMjFMdmtPeksyT2lqTGYrZXg5bVhG?=
 =?utf-8?B?czE5UmwraTFhMENUcTFJSmtQcEZwSjdtbmhQTDAzNmhMTzFlWjMveWk3Tkl2?=
 =?utf-8?B?UkgrZG1NN2FlTVpPK3dwYUd6UHNBQ3ZqNVBnZTR1MU9qN1RjdXNpdVN3MlBj?=
 =?utf-8?B?bjhNUUpEc2xTUHBoM1IzNTJNMkZuaUROenNmZXo3SW9KcnN0NkRGcnJVUmdC?=
 =?utf-8?B?bjVlN3MvNnFva1p2d1YyMDZ3WXpzVVJwWTk5VG10NFBPTFQ1T1NxQjViUnZq?=
 =?utf-8?B?aWtCUEp1K2VkMHdqTlpJWldDNDhzZTF0R2pKcUJiN3Y1V0t1ejVuRVorT2d0?=
 =?utf-8?Q?KfEc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEovR2JtdTRnTG92LytXakZoOFB2TWZFSkxFWDVzdXhGYVBURDBsRTBRYjBu?=
 =?utf-8?B?blkxOTE3V3dvVWd4eUNRdkFaV1pMbW0rOWdKZW9vQ2NUYlMya3pRcXBoUXNI?=
 =?utf-8?B?TkU4bnNnaEdGSGwzcWd6azdwYlIyVnJWeTkyTEZTUHU0QlRicURYRWRiQnBl?=
 =?utf-8?B?MEpOTVV0U2g2OGVmVDIwL0o4b29CQXViZk9lZGl6cHJPdDV3MTc1WTdUSzJa?=
 =?utf-8?B?aFFoZElmT1FOVVlXb0gvd2xWaE5OcGFnZ3R5T2xIVTI5L2NJTnpsQWovUUl6?=
 =?utf-8?B?dzljaklmUkNjTGlmUlpuSElEUWRNMDJPSVoyWVBhYVB2VDZyb1VuNEV3N1pI?=
 =?utf-8?B?YndXSFpyY21pNDNiYXg5clNmemxabllPQ1E0UmNNQWFSNFN1M3BnajdwakVw?=
 =?utf-8?B?Tks0Qk1BZGpGQVJGa29xdTJFZ1piOXVEb1dkUmk5ZVF1SzRFNWx2blBwaGRi?=
 =?utf-8?B?QTducDFlUmFOUU1lVFd5eVpMOUVEWUx4VkF1TG0rT1ZJNXFXallyUXQ1Z2pH?=
 =?utf-8?B?ZkZZaGtRVzhlWEdKRjVmK29ydnY1TkF0SnlGVnRZN3AyQ3IvU1B3dkxBZ0pN?=
 =?utf-8?B?OGE5VVc4RndiRDJqalhGSUFIb0hyNU11ZmQ0b0V2SXQwWkZRc2RDZlI1WFRi?=
 =?utf-8?B?Nm5TS1I3SVdSY0UzZHdZbStRZWptV2cwcDFRTkEydnNPK1dKdEtwbjdicDM3?=
 =?utf-8?B?d0U2bGhQamZGRUQwa0dySGtqWnVRSCt3RE8yWjNEUVhaSmpIQjZ4TlVxTEM3?=
 =?utf-8?B?SVE2UWJBbmpkbFJ0SU9OU3NoU3FpTTNTSTN2ZVJGc2RWK0xXSjgzT1RuTWRJ?=
 =?utf-8?B?a3JFWnhUa005UGU1SGZ4TTNGOU0xbFFsZHM2bzBYWjZ4bGJQMXpDUStHUmRI?=
 =?utf-8?B?R2RHTy9LNm9JWk1TUitFZGtIaDluZlFvWTdEcHFUVnRKYUgyMllNRTNid3l1?=
 =?utf-8?B?SGFnS01pSGw1TjNsZUFKMUczMVBCM2lBMHZYMjRUcFlIMk9QbWtDQ0xwZmpT?=
 =?utf-8?B?U2t6UmpCL21KOWg1TW9EUVRDVUJ3VWJhT1dCQlo5dFltdHFhWHBuZnlYbytB?=
 =?utf-8?B?eDA0OStBbmNyY3lZcEpYMVRDUzJISDJEQlRCSXNYWDlVZjQ2MUVYMzhiOUN3?=
 =?utf-8?B?dlpoWVlRYnozYXFDYlYxSDJPMGxRZWhpQ0RYQzdOcVRQYnRERTRzSEVtOFdI?=
 =?utf-8?B?UnZmYUwrWUt3Q1l0SXlIREVEcko1ckJwbnF3TFRBaFFJL3h3RlluTVM1Y2Y2?=
 =?utf-8?B?a0JOSnBjckVPVktkNi9tOXB4UnU0NzRxdXNqSUJZL3I3OEtNUkpYNjJvSE1Z?=
 =?utf-8?B?TmxGTXlxOG1MRGgwVEFyajJFVm16bHgza29aNHA2aUsrc3RWcmd3dGg3V2hv?=
 =?utf-8?B?dDlvVzZtQUVuWlNSSmhSaXM4ak90SHRURDQwNkRkS1RPQXJUQlNVZzVWOFBL?=
 =?utf-8?B?Q1huc1JibWxnM2VadzBGSU1pdGZCM0IxQ0pHQnc2MW9YaG9XdzNVbW1uUEkw?=
 =?utf-8?B?Y0EzSUNEM09FNHpzTlBFQWFXUGRVU1JMcGE5VXFKcjd4WGtLQ0NDSWFWRkJk?=
 =?utf-8?B?aytYeDUvYTFCTlJEdFJSaTM3dkdVdkd6bjZtOGowZ2FCWFVNK2R1MjJYVEt1?=
 =?utf-8?B?UFk2dWo1eVgzN3BrZjZNU3hJUVdmbS9pYUhkSzJManRPbUdQVkxEOWNqVWpl?=
 =?utf-8?B?U09ISTRFRWEwSzZmOEl3WkV4NWErRnhkQmJqdTRpOEx4TEdFaXpoODB4cXN5?=
 =?utf-8?B?WURZTzF0Y0p5STkrQXBGVFRTamZGczkranhsa3lseGZnRHVpYzU4eFgyNG56?=
 =?utf-8?B?MDlDcmZiVXduRWRPdmd4YXpSY2w2c2s3NnU0T0xCblpPTWZJcVFYWFJTL1lR?=
 =?utf-8?B?akg1YUt4bk1MNzdpSysyeWtVZDdjYTVKVlNKRUJhbitzTlNsUlVHUEhPNlc3?=
 =?utf-8?B?YUdwQlBYNGRaMm9mL1k5TEF1NmhzSkRHL1c5WXBqTE5Ub243OGdkTEFqU3l0?=
 =?utf-8?B?RUR2ZFhrNC9OOGZleGtZVE1sT2g5VlVDa0pGV3EwNm9TeGE2bENrbkVhQ1Br?=
 =?utf-8?B?d3BhV0RackFYWUd6WFpHdGlFR3NWQjVTNndjK3BkMGVyZlVYMEZCbHQ4NHJT?=
 =?utf-8?B?Y1pqeGJVN1E3V1NnWXRNZ2xnWE0vczdBNDJQay9NWUZZK1ZhNSs3Z3dRMWE2?=
 =?utf-8?B?ZUphNUlEYkcxL0NZOHdLNDVtNkxpMnFieDJXSHZ1NzlKQWJlUTlOWWVXeEFS?=
 =?utf-8?B?clF3bjhZTUhyZi9OdVZuVEZhT2FmRHlBK01JRzRuOU8vNlFBMzViaTZqbDk0?=
 =?utf-8?B?UVY2TzErTFpDelRFcGFYMno3dW5nMEFKN3FUSXM0ZFR3V1cyWFhTQktoL3NS?=
 =?utf-8?Q?OcCzjhPErKv2XehhkeBATe6E+KK2MD61b7yg0eY2B83qJ?=
X-MS-Exchange-AntiSpam-MessageData-1: 1eaI83wH6hK6Jw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 483d7914-491a-443e-893b-08de5f0a6daa
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 07:45:52.8319 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mKxWxBdeRSjLnRbK8IikyyUCvpDu2G0YE1NB8p+sRqYy7++AYWw1vLXYlmMfpIqQ6UV1YK/GiwQwqX/z4G83rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9124
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,google.com,gmail.com,ffwll.ch];
	URIBL_MULTI_FAIL(0.00)[nvidia.com:server fail,Nvidia.com:server fail,gabe.freedesktop.org:server fail];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Queue-Id: E023EACE8F
X-Rspamd-Action: no action

We should modulo not bitwise-and here. The current code could, for
example, set wptr to MSGQ_NUM_PAGES which is not valid.

Fixes: 75f6b1de8133 ("gpu: nova-core: gsp: Add GSP command queue bindings and handling")
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 46819a82a51a..f139aad7af3f 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -384,7 +384,7 @@ fn cpu_write_ptr(&self) -> u32 {
 
     // Informs the GSP that it can process `elem_count` new pages from the command queue.
     fn advance_cpu_write_ptr(&mut self, elem_count: u32) {
-        let wptr = self.cpu_write_ptr().wrapping_add(elem_count) & MSGQ_NUM_PAGES;
+        let wptr = self.cpu_write_ptr().wrapping_add(elem_count) % MSGQ_NUM_PAGES;
         let gsp_mem = self.0.start_ptr_mut();
 
         // SAFETY:

-- 
2.52.0

