Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A72F941087
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 13:33:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4834F10E289;
	Tue, 30 Jul 2024 11:33:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="qaW014ZO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2051.outbound.protection.outlook.com [40.107.215.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC0E210E289
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 11:33:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iPCy/TpXcbaJMxonqnGWhVNV958JibJI/7vlSvPNES8XS4R/8Ubce9rSrihxq1VSC31SPRMomsmOgU0Z645PfJ0V7smy9+annatW7ZIVfNJIv8iUUZ3ahFgPU0wmpXtk3EVqIF/dTUKdsR1/7RNh25rHPQGs5G+sAJ063DWVLlO2HtkS/RdVJxqagRm89jbK39b2fl4WdC0iIDFIOpYQOQqPL28Gj2j8KWBAGoekkW4M1VRYskUeAR0QT+bJwJCtRmOmdq2t0Pr1+mV2EQox/QIohqe34WopZWQItI5OtdIYNjYili2LRXTAt5GOJuEfFpjDFjZsvE2AGSphwkHS5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pUljHyGFPIgtt/f0HnaqHPCDmiHKDnb1p8Sft811DkM=;
 b=MmAJ9L6fY4sI1hVoA662ywmCikN9LlOQBcZg1b9wc+cb9E/rQLEAJ+V/mxS2GErsYikCXZmhYz7lBLjE2zeSEIvZJDmzClSl8w0n98ugaJEdukliF0Ri6NvZUqyOlMU7z5ynTaZf8KFRIGM9clF1Vs5bCfDw/t5jl1d5byb+fekvzsxRxbEFxErFBmUplKEJhhHSgc1HYPKeFFDCh93ddCoKEVqhoEqw5MWkBjfDMbbzAqO/TEDKW7Mp0eLGBIc+MKmPLVK8KwB785j4NDVzcbvfU2yaG5Bbs1+z28O7fBGpyTs7JdPFvd87rPR/mIrijQsmPcdLwt4AW63dQhEF9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pUljHyGFPIgtt/f0HnaqHPCDmiHKDnb1p8Sft811DkM=;
 b=qaW014ZOu8fdr1RYSi+xaj//jYce6mXW0V/NGkU3NVbtZhsPLE86d2e5+4lvPa5fpeFJcGMzs2L7SBKSXJV7urXraVy+9EC7daRij2PFINTfwSLPrhY9CS1Xao+7injUPk2ztf2+gDI/ULlTYK7cnTWyASs0qE8H4K7MJUVmjrMJr4lhtHhLBDShg7jLRgwPs9FyQ7iQH92oVnJxvhHeA76X1YVfbNOlYW1iJBdsXRfOgcrTBR4aV14WH1DXVu7vyQWAzB6i2OBMCq0ZiGrWeKi9TmEbjlvp5vxAHFVCnQQZzi9izkTSR+4872C84qGJ3E4sDUXWs0B7qQXzPWjzsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by SEYPR06MB5961.apcprd06.prod.outlook.com (2603:1096:101:d6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Tue, 30 Jul
 2024 11:33:18 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 11:33:18 +0000
Message-ID: <33775a86-206a-4724-a662-3eb5c70b8f03@vivo.com>
Date: Tue, 30 Jul 2024 19:33:14 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] Introduce DMA_HEAP_ALLOC_AND_READ_FILE heap flag
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
References: <20240730075755.10941-1-link@vivo.com>
 <Zqiqv7fomIp1IPS_@phenom.ffwll.local>
 <25cf34bd-b11f-4097-87b5-39e6b4a27d85@vivo.com>
 <fe460c96-fb5f-41e7-8312-a2aa30140042@amd.com>
From: Huan Yang <link@vivo.com>
In-Reply-To: <fe460c96-fb5f-41e7-8312-a2aa30140042@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0025.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::13) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|SEYPR06MB5961:EE_
X-MS-Office365-Filtering-Correlation-Id: 034fa845-d980-4c9c-f7aa-08dcb08b6884
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b2dHNVpzU0U1dFY0eDA3WDVuT3FzU1pRajlwSmZvaXBQMVpEQU1vNDBIem5q?=
 =?utf-8?B?TTZVTkFmeXcyeGpld05IS1BhYVI1eFZncjZGT3pPeDUzWm5jTHdpc2lvL2x3?=
 =?utf-8?B?VzNBZ1NQYk54YnNhai9BZzJBRGxDN3BCRmZRL0pSRkJJeGVhazBVVlkvMjVM?=
 =?utf-8?B?S24rbXFjNkY0VmNnVG5Bc1NTRm9YUzRJM3NUeVZPWkk3UnNUaStHV2lBU21F?=
 =?utf-8?B?cFBta0R3MkU4NEhaUjhTUzUwUFNuZXEzZWFnbnpSSFN4NWc5R21RaDRDZUQw?=
 =?utf-8?B?aUFHQjVDRmZHdHV0RjhpWm5ON2lqNHV1OTdNZkFDczljS1gvZkxtbmxYbSt0?=
 =?utf-8?B?NktHc0U5WXg4Z1hLUERuK3lqUURUcE5WYXJaWTR3OUVHa2l1UHI5ODBBK3Zw?=
 =?utf-8?B?TktMcXlpdytOR2dPUS8xaHRmRStITW11Y2ZEWGloUitadDl3cEM4N1lzYnho?=
 =?utf-8?B?RjZlZGkvemNBU2JPWmJoc2lFQ0xrVkg1RlBibVBFN2p3RnZVL3llMTRwNjJO?=
 =?utf-8?B?Ujl4TzVFSlN4SkZTcHQwRTdDZWUrZUNMVzNLUlQxdVNhUTdYajF4M3JTUi9Q?=
 =?utf-8?B?ME9lWkJLekRmbDBvMklCaitOZFQwdGkxRnlEWTE2UnRmay9RTVpaenZUY2I4?=
 =?utf-8?B?ZUlXakE0ajY5VkZsa0JGbXZLa2RJQ2xuMm8vRzAvaTNGdXRRbDE2VUdrU0FH?=
 =?utf-8?B?RTNJcys3bGc2M0tDM3QzVEsrelNaeExuTG8valJrMUdSWWRvekczN1NISE9u?=
 =?utf-8?B?Yis1ZUpkOXFDWjFYcUsxSzdKSFUyZC8xaHVrVlBnUlZqMlYrYklodXNYalEr?=
 =?utf-8?B?Q3FFSy80bTBhamVjZXFsOXdPcUtUZHBkVWEwblVVWkF3SmRWeWFmbDZRYk1n?=
 =?utf-8?B?VmFMRm9HZXlwVzlZOVI1QW93cVJWMDdRTC9lWFF5eUNwYjVGNWphWHJFMDFp?=
 =?utf-8?B?WVFkRHJqUkNlNS84NEVEbHk5VFNiQlZKTE5pVFlCdWZBS2oxQVhZcFNZNGJG?=
 =?utf-8?B?NVhKOHFFRFBHM0Vqd0dYMUJNbzBLVEgzeU53SjR0Y1FlY1I1MUJrdjJRejBu?=
 =?utf-8?B?cGZjTjFyNVg1Unlqa3R3ZW04REFWQ3dxOTYxeXJCR1lGWlhlS2IzQWRRQ1Fw?=
 =?utf-8?B?a0VXMUZXcHFIV3ZPck5CUEtLejZlYkRYOVlGc0hSTm9YTWNDQTNJNkJWc1lO?=
 =?utf-8?B?cjNEcHg0Vy9Udy83OTJMUmRrbmtIQUhPUjdWL2lHWGhzaUZGN1dJMlp1V1Ur?=
 =?utf-8?B?aGljMUM0QUlXRCtBN0tpT2JWMEZNcTF6TlppS09EUzZubUtTN0dXbjdhMThM?=
 =?utf-8?B?cDh6UWI2V0dQMWhVQVJNckpua1B0WFNFWlAzMG84ekthRi92MnlvWTJtSUJS?=
 =?utf-8?B?UUI5VnlBblFDOHZvODZwTW9CZWpzTHVZS0Vpd2JiVFptaXd4dC9tTlpsRzBX?=
 =?utf-8?B?ZlVGaXJUU0F3b1h3TzFwRzNYQkNCNEk2YSsrYUN2dHJYdmE2OXpKSysvZEs5?=
 =?utf-8?B?M0FPMzN4Uk11aGVsYkIwZHppNExFV3BrL3dWMmk2Q211czcwL21nYUdYS3ZO?=
 =?utf-8?B?ZjN2VnRPK0NEWUY4b21zbVpCSHlsYi9VSkdSSFZWUGJxUnQyakVhSVpRUk04?=
 =?utf-8?B?ZDFzK2FaanZXRGx2TTNxQlZaaXFVQWtqWlhHa3gyNkVKSDRtb0FJT1k1SERn?=
 =?utf-8?B?eTlSdkJ4R2pkenh5aFgxa094dmhqVFlJZVhNVWJiZzZPNm5wdG1PenUwSVFm?=
 =?utf-8?B?am9TbVorNnByYUk2ODlRT2dDSHFOdTJVcDJhQmhaTFJIeVo1cnM4UEtRckY2?=
 =?utf-8?Q?A5mEVb2Hlb+BHLTjB+A+k+vmh0s3lOeSfCb58=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azNQSnFCdVMxbjIzeUV6Z2hrWi9SanJOZnhzR3FTTDgwOE12eHJQRUE5aDIw?=
 =?utf-8?B?SFVEN0JOd0FIUjJDeUN6cFdoSVJCeUpqUkxLa1BHREN0MjhsWTh4L1Y2YWVm?=
 =?utf-8?B?amFIQmk2eEdGckIyNTVzanNPWUVLK0RibUVRYmx2a21yRU10MHVWT2NUSUlu?=
 =?utf-8?B?YmxNYXVrMEJqNkFIS29qdkFxS3NvYjhoYUpUSlAvejlUQVY1S2pxU1oxMTkr?=
 =?utf-8?B?TjhBY3JCR1dEenVvWlFybERqZWFOcUlwMzBVbHpUQzBMQXhaZTR6K3F0Tjhw?=
 =?utf-8?B?L0Vnbisrd3prM1dCdDFQYm45MU5YZWtoUlVKZTg2bm9jcjdXYmN1eEczZGky?=
 =?utf-8?B?d0JIOHdkWFl4ME1sQVJtSkt4M3hVQU9tdXcwQjBGb2FxNzEvcHFBeXZIaGUz?=
 =?utf-8?B?NkRzc2hRSWlHd2ZyVUxCMFNBL3A3c3lsaHFGT0FmMEN5cHYrVlVDRExiOHVi?=
 =?utf-8?B?cWlTaGRBZndUTmUrSC8wc0JJN0tGSWt0ZGJheHNoZGRKNEl3QWRCZlhnNWJT?=
 =?utf-8?B?MXowY3BQa3hGNEk3dzJPdXJTcnVuMUIxVHFyQ0VYVldYQVRZVERlbGE1MzVL?=
 =?utf-8?B?RTM4MU1XRzZrWVZaNTFZWHY1a1pQM01TR0JVSEpMMnhXaVJadGVtbmsvMHk2?=
 =?utf-8?B?dTNWL1ZlWXE1TEEvWWE3YmNpUEsrZkZMeFMvZ2NQZGpvRmtkU3VSckI0YjNl?=
 =?utf-8?B?RjZQVXRCc2E5ZjlWQjV5ZXF2VVB6bEtXclE1c1VWcm90cXIwQ0F1TTI0bHBN?=
 =?utf-8?B?ektKVmF3RnZILzIvNmJ5eklDUVlLU3ZIZFNZSXlOczlyNllsSE9tcFF3VEkx?=
 =?utf-8?B?b1VDMTlINCtBNU43TDBjazAxT0x6ZzB0cjdwejMyN2huSU5oYkx2SXFKbVZM?=
 =?utf-8?B?eURwWXhwc3JsZWtXVjB5SEhTa09aNTZZWlN6Qll1YkhpSFA4amRDME55UXpX?=
 =?utf-8?B?ZURTVC9XQVhvOVVZWHlVZ0I3bFI2OUo5QzdsTFA2QSt3akVkRnZPd1gzb1Z5?=
 =?utf-8?B?bDhEckxKbVovUGdTTjFDaW9kN0xWcGJsSHFJTm14dVJrQmpnbG5HeFI5eHVt?=
 =?utf-8?B?K0lsVGhlKzd1UWpTeEZHK3N0N0xGSjVEY3c3UkZjVlpjNHdDeS9pbmZOWXVy?=
 =?utf-8?B?Q1MzWHc0WHF6bTBzaTQ0ZXRxR2NTVXNzKzRlUkt2ZmU3Vk5MczJ3QnV0STVh?=
 =?utf-8?B?K2x6N3Q4Mm5ldnRHaEpHTEhIdkVMZ243RklQVlFIQnlpUjg1N1d2YzN4YXA1?=
 =?utf-8?B?Z2FCNEVUaGliL1NqOXBHMDQzeHJoSEdQUFJPcnNiOC8venlreGVGanZzbURB?=
 =?utf-8?B?cmxVTXhSSFpZYnpMMDNWQ2xja3czR013QWFBMVhab01sNHdUNE1sb0wwMUVO?=
 =?utf-8?B?RmYzUHlYZGhlSHRQUkhyVU5IRHRTWlFNMmFyVGdtTWNWbnpyV0tnMlprWk1Y?=
 =?utf-8?B?bFl1clluWFMyN1d3d3g0RUR1Tng2SnJMN1MweUx5bDhlNWRlaFhJMEZwNkV6?=
 =?utf-8?B?KytRZ1E5ZEt5cW5WS0tycmEzbVBPNXR6SXZNblRRNWZUY0oyNk03UXJTaTcw?=
 =?utf-8?B?ajlUSTYrVXg3QmluVlZiZTVwYk5mblAwM2c4NkJsUDIvRk9WY081TkF6eWU0?=
 =?utf-8?B?VlRRWW54cVp3amlxOG9RYS9wNy9sdHVkTDBOZkRQcFh2NnFnWisva2RyalVz?=
 =?utf-8?B?eGxZWTRkY0taK3c3SmE4UVJQeUt0L3IwaWk4YzVISGxwcE9ad1BmUjdyS3Q0?=
 =?utf-8?B?UGtjOWZZbHRmWjMrTm1ISVEzMU9QMmpjQmpma3lQNkVLL3JzenNZUTgxRXJB?=
 =?utf-8?B?b0gzdXZiaVFVMktObmVqVGRYWFZHeXNhb0lEMEwwK2hiM25kL0l1R2h4c1Qr?=
 =?utf-8?B?b2FISVg3RjhrdTNEUkJPUXdHN0ZYaGdVVEpEUXhUVlRKdnlnYStuYVd2R3Jx?=
 =?utf-8?B?ek84V1BiNWhROW5KT29kWkxXcWRhQzBObEJ2dnd2dmc3YUVySjJXSnd2c1Zh?=
 =?utf-8?B?d1ExV1pLUjlIT1lxZnpWR2RYSmpUU2t2anpOc0pOcU5LbDRxR2w5L2VCQkg3?=
 =?utf-8?B?a2Y3dnRJYTdLMTdwL1JOaDgrbnJ3a05obnJDcml4VThpMDNXRlozNXZEelJu?=
 =?utf-8?Q?7QDZoWkVbWxN6cLw5k4WFTD1Y?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 034fa845-d980-4c9c-f7aa-08dcb08b6884
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 11:33:18.2022 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zKZIhvm0oNcmlUldtkG7deiV6V+F3LYbG1GmMzUbBjEVXr4ACk8yD/29ZU69OrAC6OIfANGrK6WHzKvlzZLODA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5961
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


在 2024/7/30 18:42, Christian König 写道:
> Am 30.07.24 um 11:05 schrieb Huan Yang:
>>
>> 在 2024/7/30 16:56, Daniel Vetter 写道:
>>> [????????? daniel.vetter@ffwll.ch ????????? 
>>> https://aka.ms/LearnAboutSenderIdentification?????????????]
>>>
>>> On Tue, Jul 30, 2024 at 03:57:44PM +0800, Huan Yang wrote:
>>>> UDMA-BUF step:
>>>>    1. memfd_create
>>>>    2. open file(buffer/direct)
>>>>    3. udmabuf create
>>>>    4. mmap memfd
>>>>    5. read file into memfd vaddr
>>> Yeah this is really slow and the worst way to do it. You absolutely 
>>> want
>>> to start _all_ the io before you start creating the dma-buf, ideally 
>>> with
>>> everything running in parallel. But just starting the direct I/O with
>>> async and then creating the umdabuf should be a lot faster and avoid
>> That's greate,  Let me rephrase that, and please correct me if I'm 
>> wrong.
>>
>> UDMA-BUF step:
>>   1. memfd_create
>>   2. mmap memfd
>>   3. open file(buffer/direct)
>>   4. start thread to async read
>>   3. udmabuf create
>>
>> With this, can improve
>>
>>> needlessly serialization operations.
>>>
>>> The other issue is that the mmap has some overhead, but might not be 
>>> too
>>> bad.
>> Yes, the time spent on page fault in mmap should be negligible 
>> compared to the time spent on file read.
>
> You should try to avoid mmap as much as possible. Especially the TLB 
> invalidation overhead is really huge on platforms with a large number 
> of CPUs.
But, if not mmap, how to read file from fd to fd? sendfile may 
help(shmemfs may support it, I do not test it), but use pipe buffer is 
not good through test.
>
> Regards,
> Christian.
>
>>> -Sima
>>> -- 
>>> Daniel Vetter
>>> Software Engineer, Intel Corporation
>>> http://blog.ffwll.ch/ 
>>>
>
