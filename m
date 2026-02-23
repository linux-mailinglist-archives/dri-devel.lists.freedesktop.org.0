Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BdmJuqmnGklJwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 20:13:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C57E17C1EF
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 20:13:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B735010E43E;
	Mon, 23 Feb 2026 19:13:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="13DxFPpC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012055.outbound.protection.outlook.com [52.101.48.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F88510E43E;
 Mon, 23 Feb 2026 19:13:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VA+CMK5L+Rp9TvYppXjxJAiQb2czm5w38OouS1mfjuw5JmrqyoMn6xT10+MCfUGbhGYEue2laqfqmv9PjAmuEDr40fbwgv7Pmh0zNvQHFnujOwQIj6jAM1N1NizTbvDvpdELPfuL/rDCObPlmN/8LxFcVDPvpdAvf7SPVX0j8hsDeGcbO50IJh/pcUD9jbBpvrlbWDArvTvn/dYiA4VuJ7+rG44eOdnA6RCWsl6ehsWI6venRaugtWJw+Xwee6tE0qDqqH/yUBK0CINSGsai5CeSh0Syrs0yOgGSbQhr7DqSigarsYZffkRWHuDCRwe1ZUGgzlOYuX+RhWaN6tV74Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KRSj8OTPCGiHpz+6R5uoeG9er1JUdUPlILmF20HbPY4=;
 b=rmQu7aj593UR+RMxMICFdUIk035veF4B9GeMiMb9t2EAAj8vVy33hVZkZAxQCKRAMXwXA9lxVpWsY4Kp9QhMKyEM6THlbIFKz2CxvDbuT2yg9+MOn1HnxgMWAlzMI7mY3AyolWziLaFMSjEiJ+kPvCCtJ12Y1BAnCLhCegEXJB62d29pF/C5fuG/6mGrVGBSVHphVxNDBCzX32k685Nb1EhOpurN9e+E1tx84MuCelw+g67l81xMAjDKIqHYt89vy3cz9fieS6883oRCvd/hrC9vjcVv0+zdhsnu6cQkG3L4dTpWrmdybAh7bu2t25/31JaqqTXekJYFnzra4/74bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KRSj8OTPCGiHpz+6R5uoeG9er1JUdUPlILmF20HbPY4=;
 b=13DxFPpCevJf1uNnzHghOcuIshXhdiH4VcoJenqvknczaM0Q1N8Gl6naMq7/2wxTXrJ6HTXhvxCsZqbIE8tNGw8nX8b310ScTMfvCxeJzctvMkTlRhx+U4XA4FT2rIUbi6p0V3wMMFqmU8dT+AdK0VY8581vf1Pb5JvHPF0aZJ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB7856.namprd12.prod.outlook.com (2603:10b6:806:340::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 19:13:39 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 19:13:38 +0000
Message-ID: <af898ec2-c373-45ce-b78d-2002f43e3dd9@amd.com>
Date: Mon, 23 Feb 2026 20:13:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/selftests: Fix build after dma-fence locking
 rework
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20260223172553.1663749-1-matthew.brost@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260223172553.1663749-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0343.namprd03.prod.outlook.com
 (2603:10b6:408:f6::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB7856:EE_
X-MS-Office365-Filtering-Correlation-Id: 44513973-f3f1-44ff-f4df-08de730fa5e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NWJONlU4VGp2RW9TU3lzWGFtdkc5Y09OK3ErTzhGUEtna0F2M2tTSS9LOXIr?=
 =?utf-8?B?OVNTUUt6bklwK1dJYWMrM1Q4N0VNSzd6RzZudHh4T3drSENxTGxvU0U2aGRj?=
 =?utf-8?B?eUswUTdwYjYzSkFUVTdxdWYzMEpuN3R4ZlJnSDh5WUwwZDhwMy9FZFMzUnds?=
 =?utf-8?B?Q0pWcWk3cG5FTTB0aGIvS2h4eDN3b0hqZWRzQ2RrZFVLVXJYcXREenFoaWkv?=
 =?utf-8?B?V1M4VndNMWRjUHBHUWVzKzlvNUFmK1FQdFNaZ3BEcEhZdjFrTEpJQUx2ZGFt?=
 =?utf-8?B?UGNXM1JTanh3a3kyMTRERHlVaDV4bndZYVpFQVFSaHArSG5PdHkzbkt2MUxh?=
 =?utf-8?B?clIvZEFUSEhqWUlLQnFicEQ0V0RVOW51cGdab2YzZlUvOG1ZL3YySGh0Y0Jx?=
 =?utf-8?B?TWI1SzB1RjQweUlXdk5lVzU5SXlkMVV0OVdialk1bGdxNFpjblN3cDNUTXpB?=
 =?utf-8?B?a3gzN1pQYVY1a3JGMzBxYjk3QXZmMUtIQU51dXB3bHFLSnEwTG5RNXN0eUVO?=
 =?utf-8?B?Q2JtSU9VNlVqN01wUlRWSlE2dXYyRmk2ME1idURTL2M0ekJXRE1WblJieFZj?=
 =?utf-8?B?UmZUekdJTlk0U2l4TG9JaFR2VFJ0OGt3MjN5Y1BPZmk5eDlqTkJLVmRQeTds?=
 =?utf-8?B?R2x5Mk1kMVdvWTU4NmVnTmovcVlxTHF2c2V1UXdIcnlLRHQrc3kxRzVlUHJ5?=
 =?utf-8?B?ZlQwQi94aWgzZ3g5eEkwak9lTXNCaGptMjg1a28raHIwTjgzcE9hOXQyWTZD?=
 =?utf-8?B?WWRqbHhSZ0RROVBFRlpNdk1GdFFienhoa1ZLemZWT2wvRk1GRTRwOEJzY1M3?=
 =?utf-8?B?bE9nR3NXTXBTYlY0M0Y1QlR0V3BXWFRGY1FDSVJkdTVSeGE4aFNTSTZudkNx?=
 =?utf-8?B?TERweW12a1dFWTdVN1ZMdlloaUc0KytLMkMzdWZ5TDl3ODloVjJCM3NMNHRh?=
 =?utf-8?B?b2lNZVlDNkV6NG5nZmwyeTQyTDRKTU81YW5vUzhqMXh5MEhnTUdQVTlMcExh?=
 =?utf-8?B?WlVQREY0VUhYQTRPV2l6enB5OFN4cWhGWnRHUU04SXpZUTNLc1NXNUZmY3Bl?=
 =?utf-8?B?V2FFZHovb3plT3FIVFBmQUg3ZTZiMTVYMkVkRFYyRW9kdXlEWEdRTnZBM0RV?=
 =?utf-8?B?ZHNva2xBZGljZ1o5TXBGeVZSUWNBdjE1NTRHTlNGaTVGblNwWDhBdWsrYmlp?=
 =?utf-8?B?QSs2bTdXVjFNblRKNGtETCswSEJIaUdURHZwN1dySnpjTXd1Z3pBbGdiNTIw?=
 =?utf-8?B?ZWxwYTRSdCt5NjNQcGR5WFRTaG1OdHpKcFpZOW5qeEhBQlBNYjN1YUhpbFZa?=
 =?utf-8?B?VDRUNEdwR2EzV2FWNDNGc2YrSkF6ZVp6SVUzZk9Nd2ZoM3laUzJyb2lGUEVH?=
 =?utf-8?B?cEVnU3huRmhUaGVKNk0xUG5QbGloMnBoSFMvUmhLZDBRNjUvVzlaVzZRYTdl?=
 =?utf-8?B?NUIxU0sySENrbitMZ01IbjhFZTlSKzZ2ZGd3bFZlcFp1MEhSTUNpbEtUbU1Y?=
 =?utf-8?B?Si9vOTg3aVliVTVreWJETHI4REZzUitpakNDcFVPVmlqT2Ywc0JpeVFDcGFZ?=
 =?utf-8?B?d3JLaHY1K044eWcveW9Ud3dsclZKeGg3WVdpQ1pVaXN1anFLbW5QdjUydlNq?=
 =?utf-8?B?SmhxWnllZ1pMTzVyMzd0dG5tYXVndzJsN3N4eG9hRnRLVCtHL0lka2RPK2pt?=
 =?utf-8?B?dW1RRVB3ek9HTGpkMDl0bC91VU1xUmRRTjlXOW5id0YrQ21FKzBNMjFoMlAx?=
 =?utf-8?B?TTFVR2dyY3Z5L0lTWW1nT091VjJTdCtnNzh6VVdiVVEybDhUSUFYRXJqanhv?=
 =?utf-8?B?eEFiaThtdkErVkttNmxuQnBFVXIwWldTc3hXOTNPeUdIQjhtTDduZUZQVkFS?=
 =?utf-8?B?RkJXcE1RZDhacmFoSlJpSmpPTW5aTzBGWXFIUUZqbHVScXp0dmN0NzIzekxB?=
 =?utf-8?B?L0wzcWFpTXNCaWpwM1RUVXhGYTB5RXpJVzFXWUV1aVc3cHNvSjBHSVNqejNK?=
 =?utf-8?B?ZzlWc0xaR2hNekRkVy8xcGZMRzdtOFA4YjFqZ2NVaGpaQUJhVE0rRjQ0ekFk?=
 =?utf-8?B?UXptVzgybGgyQTk0clBBM1hTTVFRaU1XS2dUNVhTaCthODM4ZktoTk1DejFS?=
 =?utf-8?Q?Zlw4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VG1CYlB2NWxoWFpXZlFyaGFiQTNGanpkQ2RtTkEySnIwWEw5ZVkxWVFIdEdV?=
 =?utf-8?B?bUYxcjlveWJ2cFpvbkg2ejZ3ZnVwNzVBRzdsMDdSbHFzZDROTGVYcTNPTTQw?=
 =?utf-8?B?Y1pZVFl2SVJpRURDRjIyZExseTNBeVJYWGdjd2ZsQlpYN2oyNnNTMGJaYXNY?=
 =?utf-8?B?UFA1UmtnMkJKU3N5L2J0Qm1vZHc2c3VESHlYRkVidUZTQ2tCVFhxTW5zczJq?=
 =?utf-8?B?alk5TVZaeENNNC9rMzNzTEhKcEFTcUV0WnYxYXd0djNWanQ2eGVLdUFQZEFO?=
 =?utf-8?B?TCtmZ09vdURVOHlyYm44eEMxNytPVERJdnhzb1YvYXFROC9vZTZmUkxMN1FW?=
 =?utf-8?B?NzFmWjJEL0ZvbndBODM2eVVtU1VDT3RwZmtsWjEyUmIvZG80aXRjcHRjZ0xM?=
 =?utf-8?B?ZWh6L1ROZXBwclI3Z0JrbHd2cWsvcXNraDJNamcrYXovR0NEWHAxcy9hVnVV?=
 =?utf-8?B?alBtZXlPS01tT1FnME5xYjFOY1Bnbmo1czF2c1B0ejZFRzlqRXFMZ3BSdUhU?=
 =?utf-8?B?czl5QldUREtaQndmWW8wSExsTXAvbUMyTndYYXNzazFwQmhram1LWVlocjBo?=
 =?utf-8?B?SWNCV1BhWG9jaVRxdjBIUkgydUZ3NjR5a1BmdXd5U0poTkp1RkVLTSs4ZUhi?=
 =?utf-8?B?cE5SdGRJeC9TaXdOakVNUHJCSHZHSVF3emN4bUQyaHF0R1Nja2lUK3Yyc3hx?=
 =?utf-8?B?WitaRVVUbjFxa1ZmdmI2a0xtckZacFN4ZVJ5UVJodzlVcGdKUVFUZ1VDZnVl?=
 =?utf-8?B?cmhiQ1RnYmZtcERTVkJhMFhjRUZRckxtYkZ6VzZsUElYKzVOaHY3Q3BoR1E2?=
 =?utf-8?B?K1RhVzNtaWhENlVRaFJpMmUxVHZiNTVsUG9tWTRPTGJBbUpoZ1JpRktnWGZa?=
 =?utf-8?B?WURzQjE0NlZqVXFlSm5tZkhaS2RlVFNuN2ZMSkpjSXkzdUpMRmp3QytFSU1y?=
 =?utf-8?B?UFFiNzJkSVd4RzNPVkVWY01VOU0rcDlrUy83NHNwRTVNbGhRUjROdnpZNGh5?=
 =?utf-8?B?eFVCMGI4SVB5emZYWXN4RTRveWIyVmRkeHkzbmtIOGdPOGVZb0U5UjJFNytz?=
 =?utf-8?B?Y0xFK2pNdUJSVk1hVUZVK2liTmYrM3FGcHBxdi9kczQ0YlNNS3FLSTB3Mkl6?=
 =?utf-8?B?SVJLczhFZ1ZNQy9FUGNJK1REeVVJV3NRUTF2dkVleFN6K2VwaUZzNUpWclc5?=
 =?utf-8?B?R3hmUFhrZnlPVThvUHA1S05JUXpmT1hJRkhzK1g5b2VCZ3VsMW1qSTNmMElC?=
 =?utf-8?B?THQrREdRMzhDdFF0Y3FyWG0zdnRVaGVUaGVQZmhaZHlmb3IycjByQWpZNHNI?=
 =?utf-8?B?Y2Zac2grN3lqN0trbWtnRVZkQnVHMnVhbkRqelZoOE0yUUlDeXNjOUhiYmVi?=
 =?utf-8?B?Mms0YVcxL0JsaVJxelo1bWdxVGF6aGFGY3BocWN4RVNpOHlWZUcyZjFramxW?=
 =?utf-8?B?YjBpcy9DSzh6cEpzWC91dTA2b1FjVkVDUUdSajVsaW5uTDM4Q0hxYW42cE9O?=
 =?utf-8?B?aWY2ZXRvZXpjK295L2J4Sm1YYTlXTldLVllrWC9PZGltVkVaU0VuWHIzcDlh?=
 =?utf-8?B?cmFqSm0xRTdkT2x1YlpFOUlnRGNzaEJMdnMya0VISFdoQW1hUi9pbnk2YUJr?=
 =?utf-8?B?YUl1M3RkTXJhMUM4T0o3MTFBcDA1UTEvWnFFK2drY0pLc3plMEkwM1FSbW1m?=
 =?utf-8?B?ZEp2b0Q0dFgveFcrMlM1NWUydWpWS1ZtWkZxS2gzUzVQQS9jMTd2OVRQcWFa?=
 =?utf-8?B?Tk5JRFZiRjY4S3JuZzVRNDlmTDZobWQybHJPZFVuNEpDTzQ2cms4cVJmS0tw?=
 =?utf-8?B?Ykt1TklQVjA2dFlQaFZBQWY3b01WR3dHYVdqdGZMd2gxU2l6VUt5blNGRFJo?=
 =?utf-8?B?bFIzb2FmUUZORjFLN2N2bTV1eVFvSlQ0d0ZUNUw3QktnV050dXA5bVhMV20r?=
 =?utf-8?B?NVhtR2JlOGE0eUpoYm0zdnlMZE8vdkY4b2QwMFFsVjFLNHRBaW9mNGdWSDY3?=
 =?utf-8?B?eXZuSEpYTTJZMnNPT0hndG9pNnZreDB5RUhVaEkvWVJCMFNNRTJoNDc1NjE4?=
 =?utf-8?B?LytvV0tiQXJlTnhQU2cvUS9EZVRuUmFMeVZGUEx4bVBsOXVPWEVDcjdiTHF5?=
 =?utf-8?B?K1pOdTZScnBubGpReWRXaHplVGNNVXNjMVkyZHhiZy82Slhtc1V3YXRnS0Ux?=
 =?utf-8?B?Q1lkZTRSRW0vT20wUTRYdHBwcEVjenVUdENNUXJhN2E5NmJLeUxVY2N2c3dq?=
 =?utf-8?B?aGNQT0s1V1pDaUg5bjFtQzQ0YzRiQWRlZmIwSElZSjJDS2xyS3BSZDh2TzJD?=
 =?utf-8?Q?4phba9tfUPZGUGPSqQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44513973-f3f1-44ff-f4df-08de730fa5e7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 19:13:38.0128 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eLi2omJBA6a1AYeQwUbgQ2QY6l/ht0dIO0FQC3vGIDI8xkkIk7C1HO+V4g71I/2k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7856
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
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Queue-Id: 4C57E17C1EF
X-Rspamd-Action: no action

On 2/23/26 18:25, Matthew Brost wrote:
> The i915_active selftest no longer builds after the dma-fence locking
> rework because it directly accessed the fence’s spinlock. The helper
> dma_fence_spinlock() must now be used to obtain the spinlock. Update the
> selftest to use dma_fence_spinlock() accordingly.
> 
> Fixes: 1f32f310a13c ("dma-buf: inline spinlock for fence protection v5")
> Cc: Christian König <christian.koenig@amd.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

Thanks for the patch and sorry for the noise, just one more question below.

> ---
>  drivers/gpu/drm/i915/selftests/i915_active.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/selftests/i915_active.c b/drivers/gpu/drm/i915/selftests/i915_active.c
> index 52345073b409..9fea2fabeac4 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_active.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_active.c
> @@ -323,9 +323,9 @@ static void active_flush(struct i915_active *ref,
>  	if (!fence)
>  		return;
>  
> -	spin_lock_irq(fence->lock);
> +	spin_lock_irq(dma_fence_spinlock(fence));

Is it guaranteed that this is called from interrupt context? E.g. why is spin_lock_irq() instead of spin_lock_irqsafe() used here?

That's basically the reason why I missed this.

Regards,
Christian.

>  	__list_del_entry(&active->cb.node);
> -	spin_unlock_irq(fence->lock); /* serialise with fence->cb_list */
> +	spin_unlock_irq(dma_fence_spinlock(fence)); /* serialise with fence->cb_list */
>  	atomic_dec(&ref->count);
>  
>  	GEM_BUG_ON(!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags));

