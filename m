Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46886B3F1A8
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 02:47:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A65410E54E;
	Tue,  2 Sep 2025 00:47:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DsKaS+A0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2051.outbound.protection.outlook.com [40.107.101.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96AEB10E54E
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 00:47:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sa8SSlzmAJts05b5DQgrGEgwQKdXXleSxxUTZN0GzIjYggKWFcDlAmCV7hvX1MJvIbnCyfTIJHfCEh4UqRjFuItJCySpqPHvEE24maxjfEHkt2UiGcmGKGA4YhzGdQlGFkEVDGL5BdKAHnqR4ayANxSkDj8BmufHPaL8bJo2mNpYhIlsLbzlDFnDNEiotzOk7++vEjVj7ahLUZMYU4QgfyfofTb0nUqhO/+3xI1ToZdQbZJlzMCgIeG/A1f6riSF/0P9jheX62v9r7gWrt7lAuBbUG0xNhxIr3yur6Zh84j9eJzsdZvrO3wcuW3rygF5oQd4kAYAussbRYmrRyXPLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cjaZdJWtzqJzZOe1MrtlgK3QspzVxm9OTmEXIq7HvjE=;
 b=TF30Dwhzf1xZYsDFudFYQgtZ1SHu3eZzn1GP3JA9hEDVInNOb0SCpoS9+TbnM+1rvZ9+Zp62j6JQ8p4FLKOyIaE5Y3rAJ+DphqGGfBmEeixDti4548bLwEVlhVqOAA2smVFSgoD23O7dS/ZWb+CeNqoj7dfiKtDnmVee6SxszwM3Gr3eAILWhaFDUoROBbFLhs+7qXceY0J4gYig15tfXNcPRCIfogVFMeN3+LVsQKZyvC9aA0/vDZRflad0/4415yeT49RHSer62xlaolHAIwMU+AHB1feanLo2QL5giW+I8vESBvWu0XSuGC1NrjSdbvQ1e1ZHurQpNDH6OB2kvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cjaZdJWtzqJzZOe1MrtlgK3QspzVxm9OTmEXIq7HvjE=;
 b=DsKaS+A0xIwSkGZDrc+ler93gMWDJ5wV+p0Qw+Xqa1xVuHoL/kzD9cnUf4M1/kqTURLAmzY0rCdtWn7lfT0Ciof9wKVobDfYTU0SxTIbxtuQAEcBVi1C5a5dH/JZ05HULtfg61/zCONiHMgTQYDltU7fMx6TQ/yi+zfd+8fp3wyQfW7loWGerCga7DyQzQLiE/SMV1U3hzbFTpGAMwb0QnD3hyI2g41iRd3LF2yV3bGQghlDmDeWKvfcuQ3Q7NFEi+OXmR15VoHzx84x1KzNzIKcqE+LIEjsrjSEPs6bKiY0wU8BNE9fsMWr2ZY0evh1MAMXKu3xx0tT90Ul1Vcuvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 SA1PR12MB9001.namprd12.prod.outlook.com (2603:10b6:806:387::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.27; Tue, 2 Sep 2025 00:47:01 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 00:47:01 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH v1 07/19] staging: media: tegra-video: csi: parametrize
 MIPI calibration device presence
Date: Tue, 02 Sep 2025 09:46:52 +0900
Message-ID: <6948375.lOV4Wx5bFT@senjougahara>
In-Reply-To: <20250819121631.84280-8-clamor95@gmail.com>
References: <20250819121631.84280-1-clamor95@gmail.com>
 <20250819121631.84280-8-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0292.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::17) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|SA1PR12MB9001:EE_
X-MS-Office365-Filtering-Correlation-Id: ec3c8559-6e87-4215-42ca-08dde9ba3a61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|10070799003|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UkFiTlRmZktueHl3NnhPcmhBVFlzWHFjcmt0RWhTblpTMWdDRFJVSG1VVnkw?=
 =?utf-8?B?U2hQQ3B1ZUlhejA2NGp5TFFmVnhxdjIxN1JOdWF3bzVzUHBVUFpLNmdBT21q?=
 =?utf-8?B?eit1ZE84R3BkWkZmV2lVelZlRXk2ZlB2Tm0xRmYzblJ0T1E2MFVWUWNLQy9t?=
 =?utf-8?B?Q3VLMzcyYUc0aGFMZDR6WjdXRllaaHd5elRnNFk0Z3Y0ZzloYjcyRGRlZjV2?=
 =?utf-8?B?LzB1dEs3dVRKNFYrYkx5NjB3dysvM2RjR0RtSEdtTmJLemEreC9xcGdiek9Y?=
 =?utf-8?B?eTRNaDlkZXlxSkNVVGRVKzg1TXoyclFBaTFHV214VlhTa1pZajhXSUxtYVV4?=
 =?utf-8?B?K293K2I1MzRFb0xndWcwcDdWaFlhdzRjNE1ra2xCaklDMGNUVWdDeGpJRzR0?=
 =?utf-8?B?Qi9Cck1yN2VLMVZtTFVOSkR2U0VQT1BLWWlSWWl4aUdxWmdBdVlPQWg1S3o2?=
 =?utf-8?B?QlYzU0JMOUt6R1FSd2pyUlhPWUh2QjhpS3RXdGVuY0Z4WjVST1ZwdEJTbmM2?=
 =?utf-8?B?N2RqTk1LMFZJY1drZSt1Sm1VeXNhdzhoeUdjUmNGY3ptZkIra1k4Q1lsb05V?=
 =?utf-8?B?a2RpcnRheXZUc1pnVHZvK1BtTzhlQ1lMSDB6SGc4UmhrNm5OdnZGbFlmSWFk?=
 =?utf-8?B?alhHZ2hQcThMeGdTVFN5SXBaMUovbVVVaFVLTHFVS1lrbnU0c0hlVFo4L24z?=
 =?utf-8?B?M1c0VzRMbURkd0h1UDNhN0ZaZk15MzByLzFHT1F2TUV3aTEyalozVitjMm1Z?=
 =?utf-8?B?ZHpkZ0s0MFhkTHlpbmQvb2krazN2N0JoZ2lHNjRYVkkxbmhlRk5EZlJnbkdW?=
 =?utf-8?B?YUNWMGszRU1MVC9DVThNNDFPOVVaUXlKOGNFQ3VUbGRiMUw1OW92eEdPTGxY?=
 =?utf-8?B?N2ExelVLUk1RN3p1c0xzMGlMOUNBRmJqT1Y1ZWZlbW5NbXBPYjBmV0x0R3Fu?=
 =?utf-8?B?OVpTbGJZOHBjODZoSHJpeis5TUZFWVVvejRQbEl5VVdtZnlmVHJyU1BBdWc3?=
 =?utf-8?B?VWtRdDQ0OUpQeUVsYnArUFdENklJZ0VBM2U0TFVhY1dSVjFwMTJ2czZIbS9T?=
 =?utf-8?B?TS9DUk1hQncyaWg2SGVqWFptcGczem8wdVhVenMyVXlpUHJxQS9MY3RiaHBD?=
 =?utf-8?B?R1FZSGo0N0hHSHRUWEMyWHVxYVFsanpSQmhPeFhCUWpCdjlpVWxvTUtSYURa?=
 =?utf-8?B?OEoxS1kwNDBGWjVqcFVnWllCamtUTVRGNGJhSXpHdFUxNEZnQkxFcWovcFhY?=
 =?utf-8?B?cjJnK3h3WTFEaTdnVXBWRFpzbGVQdFhENEFvOURReFhPOTFPUGltTEQzUDA5?=
 =?utf-8?B?VVVzbU8xYTdzQm5pZGZCSU5uMi8yeFVZMWNVSC9pUzFBY3lsT0k3b2hTQ3RG?=
 =?utf-8?B?eUlkY3FqcFRXaGdaUGorR29QYkZ2V0NCeTVmRW5wYUNwTWpUeVJDaDQzWXJK?=
 =?utf-8?B?ZkhkWGpaUnBwVm5JNEJtMVdtOVpIaWtEL1FsaWJCejhKZ25OUzQvWm1xcmxn?=
 =?utf-8?B?NzNrdFhwRkgrU3FOdmtyVkhWMTZ4TU5jVGhmT2hvMEl3RGNNN0lqTWdDeGNZ?=
 =?utf-8?B?YmVnYmozQnBpdy9pc2FHTllOYm9naDNsblhDVEdNQzBmcEV5Rmh1RjUrQVZD?=
 =?utf-8?B?ZzB1dXN1R2lYWjc4VS9UZlB1OXlDdzJVcUdldk9LU2dRVHloc0tjdmdiSHZv?=
 =?utf-8?B?ZGRPOTllWk5JQzBGWGVPbzc4WWgrU3FST3lhRzlJRy9LYjJBdDdQMnlUTjZu?=
 =?utf-8?B?YTIwRjI3WC82YzFUZTJtdHZJazZEM2RjTkdFelhHdjdwaWkrWmUwRE02ME1Z?=
 =?utf-8?B?U1NrTjNoL1J1cGRLNExVN3pFMVBiRnNWWkw3N2w4VXY1UkFGVnJFVjkvZk5K?=
 =?utf-8?B?Mkc0NG1KY3JEQ29FZ0kra0ljdjltN2hMeVRTKzBkT29xakRTNE5qNEpMdlY2?=
 =?utf-8?B?WkxtNlAyNEovcFM2K3FSV25SR01JWjdlYTdjR0VRNmE3UGFwVFlYT29pc3Vs?=
 =?utf-8?B?K28zV2FaRmdBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3N3TDM4YndKUEtxZ2RPMUdLR3YyWEF3VDhUR3o1WWZsdXROL285eTR1cVYz?=
 =?utf-8?B?QkhGTEFZSWpXTU1NV2RTelUvWjlIR2xrWjArVS8wSEsweHFWZlNldjVxNzRw?=
 =?utf-8?B?MS9XOXYxOUxueVdwUnlodm8vbWpTWDY1MEd4RnMwQ0VRLzlkSmlkSlJOYXVj?=
 =?utf-8?B?YkE3c3d3Z2VxQnVtcTJ0QTlMRU9XdHg3VUVxNStmdy8yV3I4cGZIOENYRXd3?=
 =?utf-8?B?RzR6ZFYzbmVaY1NpMTV1Vkg3dlMyWFM2MFgyVHlTYVoyRWlFVVNTaUJVUkhh?=
 =?utf-8?B?WmNuTkZvYnpxZHpxQjRtemJmU0JFTzZyM0hackQyWmZKeU4rbzlNN2ZWS3Np?=
 =?utf-8?B?c1Q0SndCOVZEYVpsbGtCY0lIK0gzTmJNaUI1ZmE4RERRTzJna3BVZ0tzQ3pB?=
 =?utf-8?B?VEhVSlB5QURCaTlIdHZvNHRUNTk5QTFrenR3K3FSV0o3TXB6c1BDanYwaE52?=
 =?utf-8?B?a3JDc3JSSGR4U1I3NUo5L09FazgvYTYvMkFaTXN5b3JZb0F4RFA1ZTV6NnYz?=
 =?utf-8?B?SE1jbXRyMDhMNUVZeG1pRXRPaWE1bmgvNTZFRWZYOWFYZHpqeUp6YUpsb0VR?=
 =?utf-8?B?SE0wb1JaTGZBMW93S1dtY1AxTGk0bFQzOElDOUxYUkpvand6K054bWpXeERL?=
 =?utf-8?B?UXVoZmlwZnVweWhLY3h2ZVIzc2RDeTZpS1k3eklNU1BId3lTY1FZWkhXQkxM?=
 =?utf-8?B?cWovK1RSS3pJb3Ztd1pvRGVRRWQ5NmRlTWhPSTI0czVlVytZc1lCYWYzYlJa?=
 =?utf-8?B?OWFaS1FPNDQ2alZoVjRmcS8rNWVFdjg2YndXczFIb0d1dUFXejdlQ1Z4Sk1x?=
 =?utf-8?B?SDloWHRNRVYwRStBM3VUUzFtY3lTbUtHZnhVZHlaZ2Q5Y0Q0ZHNEL0YwMWFn?=
 =?utf-8?B?bTNZRTZWNkNFRWJkY0lsb0JOYlVYcmpqaTN3U0dpKy9zR3JiNGNrMk1FemNm?=
 =?utf-8?B?TWszMmFUWEYrWCtRQ0cyR0Y2OUk4Wk5scUkrMnhtYUJtRVVMTmF1b21hRWZY?=
 =?utf-8?B?aVZCdlV3UGZpWGtkV2p6QW95UGp1QmZROFBReGM0MGdZbFRBUzcrYzhySkpB?=
 =?utf-8?B?a29qd0lWSWJaczdIOTV2Tk5PSklzM0l0ZXF2YXMzQm1VTlZKcmNuMlR4UDd0?=
 =?utf-8?B?V3dGTGIvc2xwYjRwdXJJT0hWOXBGOFJuR3BEeFk5L09sTWN6MzA2ajVSRGdN?=
 =?utf-8?B?VDByVlJvdzEwMmMyTlVWOXRnVlgrbzdBbkZ3dGRKejNLclUvekcwaHRJUzlE?=
 =?utf-8?B?VW5uaFRpUkJwUjBEcHpKQU5JNGRETUl1TVo3U2lyZHV4T2d3V2tMREFLVGxv?=
 =?utf-8?B?TWR6QjBEdDZ4SExHbG13TjlQbWtqN3BCZFV4V1F1RWdNQzUrd0dHejVVZHBY?=
 =?utf-8?B?QUVGOXhXZ1VRMjAyRlV1QTF1YlUwQ0FUdThRUDJqVUtXcUpySHloY3pjNzJV?=
 =?utf-8?B?MkZ0M1BkK05KZE4wSk1sMUdYRFN5OElWVFFoVml4R3RtbEpwVWZKNlFMYWVY?=
 =?utf-8?B?QnJSdEQvYmc4MkxSV20xUi9SbWRrVis4QmhSWWRlaWkrQnNIQkQvL3B1SjA1?=
 =?utf-8?B?RGhpQ05zSVdFTXBQQ21IdCt2UE1LeGhpTHdNRkJhQkl0MVYyUEFLYXB3MHAr?=
 =?utf-8?B?Rk9XSEEwYkJSNWt4bm9aRXlFVGwrNy83ZnRHK3hDN0syNmRTTXArS3BaMjhp?=
 =?utf-8?B?aTUyRWFtQUtvR2RaTGRqRDRvbHVNdk1KVE9jR2hrTXh3TnUzLzlPVFluUDNl?=
 =?utf-8?B?cENRMG5vMVl3MXAyRVpvVjBuSlBDazZzNVRhdGFxUVVVQjM1d3ErYXJENWxN?=
 =?utf-8?B?US9FUGN6TTUrSERuSGZ5ZGVuN0M4Skh0T0RXNCs3US96aEowZ2hqbkJKb0Vw?=
 =?utf-8?B?U2NnOTZ4WlVXbW14ODVkelNvSm9RNlowd3QwV2Z3YW5LN3NRS3I5SHJlSWJk?=
 =?utf-8?B?NUhhMHI1RTRxUUM3ZVlhTzN6UUQ4SzVNU2xMSnRNK2ttOFdEZldjWVhHOVdD?=
 =?utf-8?B?QkVvR3d3QjlienFVanRxWUtNNUJaSGl5RSs0MGtrTVJkQ2hKc2xBdTZjZWN1?=
 =?utf-8?B?a1B6M3E4STBVWnAyZXU4Zm9NSlh1d1BBeWZHdTJlNHlrK2pjTmpKZ281Q05r?=
 =?utf-8?B?MGxXTlVnMVI4a0ZGUGNyblZnWFI5dWxjSWhPVnUzblZOOXFaVmgzQTJYL0tG?=
 =?utf-8?B?ZTl0MkJGWWpZQktUWERITzAxUDFoQUkzYkR0L256NVhTbDBGdlRndDJZSC83?=
 =?utf-8?B?M2RjWEZCZ1Z3Mm5WOEtoelVVR3ZnPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec3c8559-6e87-4215-42ca-08dde9ba3a61
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 00:47:01.2985 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f9+jaOdVuufX2FlmWYWpZ7TesUpA2wH5pSL8gdS34urTjGJWGJ1zmQD7EpH2Aswdq4xGBC+1mRpXOKsE6ejuIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9001
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

On Tuesday, August 19, 2025 9:16=E2=80=AFPM Svyatoslav Ryhel wrote:
> Dedicated MIPI calibration block appears only in Tegra114, before Tegra11=
4
> all MIPI calibration pads were part of VI block.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/staging/media/tegra-video/csi.c      | 12 +++++++-----
>  drivers/staging/media/tegra-video/csi.h      |  1 +
>  drivers/staging/media/tegra-video/tegra210.c |  1 +
>  3 files changed, 9 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/staging/media/tegra-video/csi.c
> b/drivers/staging/media/tegra-video/csi.c index 74c92db1032f..2f9907a20db=
1
> 100644
> --- a/drivers/staging/media/tegra-video/csi.c
> +++ b/drivers/staging/media/tegra-video/csi.c
> @@ -485,11 +485,13 @@ static int tegra_csi_channel_alloc(struct tegra_csi
> *csi, if (IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
>  		return 0;
>=20
> -	chan->mipi =3D tegra_mipi_request(csi->dev, node);
> -	if (IS_ERR(chan->mipi)) {
> -		ret =3D PTR_ERR(chan->mipi);
> -		chan->mipi =3D NULL;
> -		dev_err(csi->dev, "failed to get mipi device: %d\n", ret);
> +	if (csi->soc->has_mipi_calibration) {
> +		chan->mipi =3D tegra_mipi_request(csi->dev, node);

The way I would read 'soc->has_mipi_calibration' is that this device (CSI)=
=20
contains the MIPI calibration hardware. I.e. the opposite of here. I would=
=20
invert the logic and optionally call it e.g. 'internal_mipi_calib'.

A cleaner way to do this might be to always call tegra_mipi_request et al. =
--=20
on pre-Tegra114 SoCs this would just call back to the VI/CSI driver using t=
he=20
callbacks registered in the MIPI driver as we discussed before. That way th=
e=20
CSI driver won't need separate code paths for SoCs with internal MIPI=20
calibration and SoCs with the external MIPI calibration device.

Cheers,
Mikko

> +		if (IS_ERR(chan->mipi)) {
> +			ret =3D PTR_ERR(chan->mipi);
> +			chan->mipi =3D NULL;
> +			dev_err(csi->dev, "failed to get mipi device:=20
%d\n", ret);
> +		}
>  	}
>=20
>  	return ret;
> diff --git a/drivers/staging/media/tegra-video/csi.h
> b/drivers/staging/media/tegra-video/csi.h index 3ed2dbc73ce9..400b913bb1c=
b
> 100644
> --- a/drivers/staging/media/tegra-video/csi.h
> +++ b/drivers/staging/media/tegra-video/csi.h
> @@ -128,6 +128,7 @@ struct tegra_csi_soc {
>  	unsigned int num_clks;
>  	const struct tpg_framerate *tpg_frmrate_table;
>  	unsigned int tpg_frmrate_table_size;
> +	bool has_mipi_calibration;
>  };
>=20
>  /**
> diff --git a/drivers/staging/media/tegra-video/tegra210.c
> b/drivers/staging/media/tegra-video/tegra210.c index
> da99f19a39e7..305472e94af4 100644
> --- a/drivers/staging/media/tegra-video/tegra210.c
> +++ b/drivers/staging/media/tegra-video/tegra210.c
> @@ -1218,4 +1218,5 @@ const struct tegra_csi_soc tegra210_csi_soc =3D {
>  	.num_clks =3D ARRAY_SIZE(tegra210_csi_cil_clks),
>  	.tpg_frmrate_table =3D tegra210_tpg_frmrate_table,
>  	.tpg_frmrate_table_size =3D ARRAY_SIZE(tegra210_tpg_frmrate_table),
> +	.has_mipi_calibration =3D true,
>  };




