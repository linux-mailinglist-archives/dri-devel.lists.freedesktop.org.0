Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5075FA10E66
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 18:55:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7017010E45B;
	Tue, 14 Jan 2025 17:55:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="B9JOfS1X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2076.outbound.protection.outlook.com [40.107.243.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F157E10E452;
 Tue, 14 Jan 2025 17:55:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lyYZGhL58f6lGFU40TriujD7AvDZZ60hufTbXWyDD6wdcdFxlZHIOwpRONAIWgkszwiT+k3MGTJfqFLbCcu1+vwaELrurJhvXiy3mpIMIUBWOL7oepla2aQLEdlZIEb5jKYDlkR8dmiemst+lkQrbdu+T+4PM5XCBSahiE176tkDFVf1ygZ8JsapJ8jbVWIo7FEyTa4ouOcaJazPxLWp3EcRgj3hD7XB67UBGU1Eo39Cl29HpKIgK6ZI9DpcOQopRweRK39ik0fp4cUoCn773EsNmY95iLizr1tUIwcDwZxVv3cKLmnvDJs3hz28Dv0hc3EufTOr7WUoqGOCHQxvhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XdiBROqx6Wnu8vO4nGCXsMxFc68RyeI5Fbz6rHK5foE=;
 b=avsLBP1EnmKClbpFAIoi4pb6K5j6wxAwFZ968/ElwDj2VxsWJjGKKpri/UUze+pi4qHvc4SXXR32Rvbtrnj1OMF0xbkCcSQGri3FsI0mDDSM2X75v1P195o7go72kq+o+0KMJmi2vly0xE/60HVKhn4qOIk25tRGUntO7k53Yu+SaD7nc1u2rkMfsW7EVNZWBg0ieugz2y2wH/V63Mm+CYFCzaTUoKKT/ZcW1B+a9QG9FAgLCPrVmU7mol1VKAkOHHtBxMOPr+58SJfyDss+fqcfnoi7GS68p2mI4+qbZG0HHEhX/o/XNnfO/Kf5bQfcY+VR8cGcwBUzejdoamK3TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XdiBROqx6Wnu8vO4nGCXsMxFc68RyeI5Fbz6rHK5foE=;
 b=B9JOfS1Xs1qyj66CkvIWPpBeU4pGqS7zM3bqk84pkAA//XxOgB/kLdV2pj4MUY+UA2iZcHFbVGi+8I3piQExnDeNGAVVqDr9PaxwFhfP11PXXBiTbrzLG06fbIvnnp/r2lVBV+2bQjGxJX5A3hGkp0ZAFp+dqOxsmfCmH2KhJGco/CETep1Eov9JGg2sAlEoNxVnJD3S94z1OlOdZSc2bDloRvsfK6qYTNSMMa2HWPyxoTjYEcxJNsjsvQGSuqLz/GQagrPolNG7jEjuHC7WJrAnnfQFpZmRgSOT5Qh8gyBmKkJ/DqynGCGAKTq1ywtI0bK+D6m9tMmrGGqsbZoDkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB9146.namprd12.prod.outlook.com (2603:10b6:610:19c::18)
 by PH7PR12MB7841.namprd12.prod.outlook.com (2603:10b6:510:273::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 17:55:48 +0000
Received: from CH3PR12MB9146.namprd12.prod.outlook.com
 ([fe80::a638:d48c:2c10:9b04]) by CH3PR12MB9146.namprd12.prod.outlook.com
 ([fe80::a638:d48c:2c10:9b04%7]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 17:55:48 +0000
Message-ID: <8dd7405a-0317-4e35-ac66-a35b0bd743a9@nvidia.com>
Date: Tue, 14 Jan 2025 09:55:44 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/fourcc: add LINEAR modifiers with an exact pitch
 alignment
To: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
 Daniel Stone <daniel@fooishbar.org>, Brian Starkey <brian.starkey@arm.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>, nd@arm.com,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
References: <CAAxE2A5BkF13bFt8_UnuiqPM8W-ZESgmKEjqqGfv=DGzSfJ7aQ@mail.gmail.com>
 <uffsfaps6a75zmkyshkwfxgybcslqrnfqqtjzekegdptvwpugc@2ndpcuxyfp3f>
 <c64cb9d8-5ea7-4644-93c8-04a97b758fa0@mailbox.org>
 <h26quuebhpxwkc3fl4vtfteoqyvingnddgxbnzptfnxfg6xgkd@kkkmeqwplomv>
 <8dae97c9-9286-451a-8122-b309eb21b2f4@mailbox.org>
 <Z2Ki-lQH4Fbch6RO@phenom.ffwll.local>
 <q45c43j5kwwvemec7mcs4kqzt54pa3nz3jlhkcky2v63s2vfie@him4q253uw4p>
 <CAPj87rMFJ0JRvsKqZUsw_EGrFWr1VLO4Ne2w_bZ5cH+gs_d=og@mail.gmail.com>
 <Z2Rf7mpSuzZ0ObmT@phenom.ffwll.local>
 <07d08a42-c44a-477e-8057-721b270310cf@nvidia.com>
 <CAAxE2A6N0xtgZmzTR9FXMN79xxy3T8zfhh1sz73h1h8=0ycJ2g@mail.gmail.com>
Content-Language: en-US
From: James Jones <jajones@nvidia.com>
In-Reply-To: <CAAxE2A6N0xtgZmzTR9FXMN79xxy3T8zfhh1sz73h1h8=0ycJ2g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR10CA0027.namprd10.prod.outlook.com
 (2603:10b6:a03:255::32) To CH3PR12MB9146.namprd12.prod.outlook.com
 (2603:10b6:610:19c::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB9146:EE_|PH7PR12MB7841:EE_
X-MS-Office365-Filtering-Correlation-Id: 725dcee0-d8c6-4149-0226-08dd34c4ad07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SVdwb3dIZGRwWm9UMFRKNDNrdXNyOFpSWlZDaUZza2g0Wldka05YYVlDQUV4?=
 =?utf-8?B?cXU3SE43NU4wZmhQZDhOUXpmTGlEdk41WWFsSHBPRWRDRkdyMEV6b01HblV3?=
 =?utf-8?B?amVGZXQ1emROd1lpTk1LNFI5Qjl1U29oWUFDNTFFT29xMHUvSWkzeWo3aHBv?=
 =?utf-8?B?TTNGeXR2QkoxWUIrWERNOHcwWHBad05GK0Z2L092V0J0MzNQdGVycXdMZ1ZN?=
 =?utf-8?B?OVJVdkIxOHRPSFQ0RVpuM2JrNHMrM3FOYmFrNEpwNlpEZHVCUGE1NVBNcTBn?=
 =?utf-8?B?N051N0FWYzNnbU84aDdXaGxtS1V3TWw5MTVPWS94V3RXL1VNV0VQVnBaM2hs?=
 =?utf-8?B?RjhieDR3cE4waGRmTmN5WkFNVUlmVVJVSzBadGkrTHd2ZWRxdG5qUTYzblEw?=
 =?utf-8?B?NHk3TmZ1MzVjdGNrUktidmtxNDE2cFBXTURUcUNrN1ZGeG41cUdtcXJ5aFFt?=
 =?utf-8?B?ZW9JTERiUEpTa0I5M1U2ellUVnhBMGxNOVl2ZWxxMHpsQ2Qyc3FtL0xIZzVT?=
 =?utf-8?B?YUlBdFEySlB1NGZCLzJkSkJROEFLUWJsNkVRZ3UrbVYweDd3Q2VSNHU5WDhv?=
 =?utf-8?B?bEJUQ0hhd3NxbmdHMWFDVGdiOUNzVDcrb2ZndjZzcHJmREJZbzZYNFhuNUxo?=
 =?utf-8?B?YUdDVmdEYUZkaFBNZFRzaTFCN3d2NzNDTDRxMlkvN2kvNmJUVkhIdE9DWUtp?=
 =?utf-8?B?bENiamFLM0lOZnlRVWRET0k3L0lYMFYvQXQ3cWNUdGhCdlByN1VKL0xHSGxv?=
 =?utf-8?B?RUFhT1BUY24wOWU4cnJqeWZvUklGTktValNVUThrcXJiWHJyK0xMZXh3TDc4?=
 =?utf-8?B?bTBLUEZnUkpESFh0RFdGazNNL2YvOElPMU5VSllwZmRmSUVqMC9VRUxuUWVK?=
 =?utf-8?B?SE5nNUJqZW92T3gyOGJodnk5VkdUVHZDRDY1VnAwbmhjL0ZDR04rbno4TzQv?=
 =?utf-8?B?MURBa0R3dmNHcXZ6T2R3KyswWXE0RG05RG92czV2SEMrRWhqS3ZScUd4MHZF?=
 =?utf-8?B?ZE9LZzdlaExxZU9xUmF6Y3c1V3cybjZiUnhNQ0R4S3VjL2hxU3dkMkxUWWZT?=
 =?utf-8?B?SnJVN3B6c0tuaExRazkzKzhzUDBhc1JZekdMZ29Dc3ZIV0ZPR1RwTGNRS1Zq?=
 =?utf-8?B?dWhucjdvczZ3cVdubnFHSDBrWVVGK0FoUHFzQitmUlNqcGUzOWpRK2RJc0V5?=
 =?utf-8?B?M3pEMHpqdXY2eFRHVTl6d0Rld01DV0FjdjMydTNxSTI4T1BhRmJYTXRaWGxo?=
 =?utf-8?B?T21CZUsvTlBxclF3dmdYai9JNnJhSFloQWxKQmRTdlgvRXp3blh3Z2F6SXpq?=
 =?utf-8?B?UXl1U0xVeFRjT0Q2aFVGbkdXTGJFckhRWUNaVkI4SFlzK0sySTR3OFEyY2Qz?=
 =?utf-8?B?cGhBQkh6M2h6MUNVTk4wS3F1dVVPRldVTWg0N1VrcEh1aHluajFoaFAvemwz?=
 =?utf-8?B?ZDVWQXVZL01rUVpGV1FtdjVaWDVBcXQ2N0xmYmRBVHNnVWVDSVc2dXZ2c090?=
 =?utf-8?B?YmwxSTZNMDlNQm11NENWM1RGS0hySUVWZ2NjVExNcFNCMnl6aGdYZkpEbGdj?=
 =?utf-8?B?UTBMYy9DTi9mZklxcHh0dGhVV284bHZOWUQ5QkpqMjdZOURpb254Wi9Edmsx?=
 =?utf-8?B?NXZKcTRpTXVmNmVjbDhxUzZ5U1BvbEtUdENsVjhDSitzVU82WXZ0ODIzNDNN?=
 =?utf-8?B?WEhoTmZVWlluR3hwMFJtZzFYcVBBcno4cUJZZ1VQV2NCcmpNamU1RVpBQTBi?=
 =?utf-8?B?QklrWlhXRWJsV3Zjc1pEaStZOXRRblo2RnVaSU9xd0pJdGxUVlgxT3pEOGtR?=
 =?utf-8?B?WXg0RzBxNFBOSW5KTE9jRVB5cFB1U2RtVzVQMjg3ZTE1WUxocnBPemI2MnM2?=
 =?utf-8?Q?VGpC4x3KbtCLI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB9146.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnFYN2lxV2t0azBVcDRXZVcvcnJZQ2RLdTJyaE1CQlFZSWlJVTI2bklmekoy?=
 =?utf-8?B?V3JjSFpQMHpRWkt2amlja3RhaTNVbVNianFZdkRBeENmdTNYbXUwMmFwTXA2?=
 =?utf-8?B?QjJkT2FIZ1J0dU8xYmV4WmZOMkl2dWsvNDVQYUxoejdzdmhFTWhZd3JnZk5j?=
 =?utf-8?B?RUpMc2E4MjIrR0tGdk5aVXluQ2ZFOWZzOFhEeUZNRmZWQWwrZ0lqM241UGRB?=
 =?utf-8?B?UzZNVThrWHo0bW9MS0xkV2lCMm5seXBBRUZyUmF1RzAvTnNHTTJKc2tvZWZ1?=
 =?utf-8?B?VVBmb3dBKzg1cStDTGlaOXpQTDQ1VjN0SzVheld3aUdsamJuOHFoellVenE5?=
 =?utf-8?B?dDczQVdNZFlueStwVUxTNGJRUWM2a1RORGZndkNaZnhjQkl0MEVaU3ZxVWEv?=
 =?utf-8?B?bDY0a2lhVE95V1ltQTl0TDM1aFpyZTI5MTBDa0Q2VUhEcmwrdnB6b2NTQ2lB?=
 =?utf-8?B?eE5QSkpMblJkdkZ5MnZuYUFpczJHd0pRSnhrcC80OXdZL3RRU3VPa3U0NWpS?=
 =?utf-8?B?c2N5SEliWnhkZVNtZ1RGb1ovamoybDlkN08wMkQ0QkZIQ0ViL2x0MTVhZEdX?=
 =?utf-8?B?aUxQeW5BaklNQkxFUkNHOE5Kd3h4cHcybnphQnZHT2Y0bFF2OHExZHdKUVdy?=
 =?utf-8?B?NzBxOWJMMHZ3TWU0UFlNbDN2amhCcFFjT2lIVUtrZjN1N0QrRlZFUy80TTBN?=
 =?utf-8?B?V2V5REJ5SUdrQ0dwdDk0ZHJkYnFkYm9hbXFDMGFvaGs5ZTJUSFFYWjVORkFZ?=
 =?utf-8?B?Zjl4SVpleUc3M09BbjdMWm8remJaV3pIM2FMRG40di9BUVN5OXZqSFFBRkZ1?=
 =?utf-8?B?eENGNG1NNkVzcHhXcFhaN3hKVUVua013RThYWXREM2VWZzNsMitHSklWTnB2?=
 =?utf-8?B?T3AwNHIyWW4yNWVIRVZpbmdWaDU2ZkM1cmYxT09PZW1iak1tZUtwc2RCU2hh?=
 =?utf-8?B?d3BZZGZYbk5WcU83aUF4OUVhclIrcVdEN3BxdUV3b3F3WjFSTjk1eEpUMVBm?=
 =?utf-8?B?TE5aazFRSDBZZDhVOXpYaEVXQ01YUGFLeUhNaUxzZmQrVnljZ1M1MHB2YjBl?=
 =?utf-8?B?M0M1YjJHNk5VOExPRWNORTd2RjhZMnNqVjd2N1NRTWRtdEYwdVBoM25sTStl?=
 =?utf-8?B?c1lzOTIrejZ5V1FLSHRIWi95dUpQNUl3ZENVTjNqWkFyY3hpMXc1S2FWbENX?=
 =?utf-8?B?SnJud1FGRXFubFFZbDdNSC9BOUQ5YVUrdlpkYW1SQzJCbWVkbWppRCtjSmN2?=
 =?utf-8?B?R1BiQ2h5WjVZR2xhb2NKakp2L3NtRkp6b21Rb3hqTm9ocFQ1T2toRWpKS0NI?=
 =?utf-8?B?TEIvc3kwcHJWcnVlYTBUazJZc24xcGlPcm50QzZHT0MyVFErZUxsRjFxRS9Y?=
 =?utf-8?B?ejR4WFFHbnlieUdoRzVoTmsxeTIwNTVjQXZLa3RBbEZZbzZoc3crbDArWVhs?=
 =?utf-8?B?RU00a2NrUk8zd0tjdENQUlZwNloranRGNUx5NnJ1S3JaZXBneS8ySjZNand1?=
 =?utf-8?B?RzJRR1FycmEweDVaZzZ2R1BsaGNRVmN5MlVjMkxMQkd3UGpVdWVhalR5WmYx?=
 =?utf-8?B?VDRqNUgrdUxTYkpHZ0Z3SEQvaWhYUjdJcHdEM2pCRytoNzhwR01yYmtnclY5?=
 =?utf-8?B?VTRyQWN0QlgwcHlZMnhKaGh0TW8zTHNGbDZkKzFNMTMySzlFMEpuVFFQRm5E?=
 =?utf-8?B?MHdRVVNuOHgvdHhKMUJvNlVoNzN4MWtXeHFuT0xDd2xxRTErTE81dVlHbnkx?=
 =?utf-8?B?dHFKL1l4TUJVa1Fuc0JsWEYxRUhZL3h5eFdxYjA3OTRlZi9GQXozVVFJbHE3?=
 =?utf-8?B?TnJCbmlSTUtzRitrY29oMEdoRUZobTBhYWVzbWEvbUs1L1crRklDZjFBc3E3?=
 =?utf-8?B?UDZKb1EzOCt2RmZLUm5GdGdFV3ZUbkdqUm1VVzBtMUN2ZEJkeDU3Z2FFOTAx?=
 =?utf-8?B?SG5oVmNKYUg2d25mV2RJMlhPZjB2QkswM3lRbmI0Z0dJd29BdSs0N2Y2YUFy?=
 =?utf-8?B?QVBPREdnaHFCRTFWNWFIbHgrenZrMGZPVWRhNXIxbU42VVQ5K1NFY3MwUzk4?=
 =?utf-8?B?OWZ2V2MvTEJFT2J4c0IrYkV5SEcwU3RHMXY1TUx0Q01tNWdCaHRqcmxmbXc3?=
 =?utf-8?Q?J9nqKe3SctZXH81AgGRzy6kPo?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 725dcee0-d8c6-4149-0226-08dd34c4ad07
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB9146.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 17:55:47.9667 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mgB0g84eAHKNDag5wwzse8441oAeLSe1QwXBQSXN89oO03evoiptfzbE81RALsMIl3LYGqOuPgbKsYLYp9E8Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7841
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

I don't see how that fits in the current modifier usage patterns. I'm 
not clear how applications are supposed to programmatically "look at the 
modifiers of other drivers to find commonalities," nor how that "keeps 
"expectations the same as today for simplicity.". I think replacing the 
existing linear modifier would be very disruptive, and I don't think 
this proposal solves a general problem. Is it common for other vendors' 
hardware to have such strict pitch/height alignment requirements? Prior 
to this discussion, I'd only ever heard of minimum alignments.

Thanks,
-James

On 1/14/25 01:38, Marek Olšák wrote:
> I would keep the existing modifier interfaces, API extensions, and 
> expectations the same as today for simplicity.
> 
> The new linear modifier definition (proposal) will have these fields:
>     5 bits for log2 pitch alignment in bytes
>     5 bits for log2 height alignment in rows
>     5 bits for log2 offset alignment in bytes
>     5 bits for log2 minimum pitch in bytes
>     5 bits for log2 minimum (2D) image size in bytes
> 
> The pitch and the image size in bytes are no longer arbitrary values. 
> They are fixed values computed from {width, height, bpp, modifier} as 
> follows:
>     aligned_width = align(width * bpp / 8, 1 << log2_pitch_alignment);
>     aligned_height = align(height, 1 << log2_height_alignment);
>     pitch = max(1 << log2_minimum_pitch, aligned_width);
>     image_size = max(1 << log2_minimum_image_size, pitch * aligned_height);
> 
> The modifier defines the layout exactly and non-ambiguously. 
> Overaligning the pitch or height is not supported. Only the offset 
> alignment has some freedom regarding placement. Drivers can expose 
> whatever they want within that definition, even exposing only 1 linear 
> modifier is OK. Then, you can look at modifiers of other drivers if you 
> want to find commonalities.
> 
> DRM_FORMAT_MOD_LINEAR needs to go because it prevents apps from 
> detecting whether 2 devices have 0 compatible memory layouts, which is a 
> useful thing to know.
> 
> Marek
> 
> On Fri, Jan 10, 2025 at 4:23 PM James Jones <jajones@nvidia.com 
> <mailto:jajones@nvidia.com>> wrote:
> 
>     On 12/19/24 10:03, Simona Vetter wrote:
>      > On Thu, Dec 19, 2024 at 09:02:27AM +0000, Daniel Stone wrote:
>      >> On Wed, 18 Dec 2024 at 10:32, Brian Starkey
>     <brian.starkey@arm.com <mailto:brian.starkey@arm.com>> wrote:
>      >>> On Wed, Dec 18, 2024 at 11:24:58AM +0000, Simona Vetter wrote:
>      >>>> For that reason I think linear modifiers with explicit pitch/size
>      >>>> alignment constraints is a sound concept and fits into how
>     modifiers work
>      >>>> overall.
>      >>>
>      >>> Could we make it (more) clear that pitch alignment is a "special"
>      >>> constraint (in that it's really a description of the buffer
>     layout),
>      >>> and that constraints in-general shouldn't be exposed via modifiers?
>      >>
>      >> It's still worryingly common to see requirements for contiguous
>      >> allocation, if for no other reason than we'll all be stuck with
>      >> Freescale/NXP i.MX6 for a long time to come. Would that be in scope
>      >> for expressing constraints via modifiers as well, and if so,
>     should we
>      >> be trying to use feature bits to express this?
>      >>
>      >> How this would be used in practice is also way too
>     underdocumented. We
>      >> need to document that exact-round-up 64b is more restrictive than
>      >> any-multiple-of 64b is more restrictive than 'classic' linear.
>     We need
>      >> to document what people should advertise - if we were starting from
>      >> scratch, the clear answer would be that anything which doesn't care
>      >> should advertise all three, anything advertising any-multiple-of
>      >> should also advertise exact-round-up, etc.
>      >>
>      >> But we're not starting from scratch, and since linear is 'special',
>      >> userspace already has explicit knowledge of it. So AMD is going to
>      >> have to advertise LINEAR forever, because media frameworks know
>     about
>      >> DRM_FORMAT_MOD_LINEAR and pass that around explicitly when they know
>      >> that the buffer is linear. That and not breaking older userspace
>      >> running in containers or as part of a bisect or whatever.
>      >>
>      >> There's also the question of what e.g. gbm_bo_get_modifier() should
>      >> return. Again, if we were starting from scratch, most restrictive
>      >> would make sense. But we're not, so I think it has to return LINEAR
>      >> for maximum compatibility (because modifiers can't be morphed into
>      >> other ones for fun), which further cements that we're not removing
>      >> LINEAR.
>      >>
>      >> And how should allocators determine what to go for? Given that, I
>      >> think the only sensible semantics are, when only LINEAR has been
>      >> passed, to pick the most restrictive set possible; when LINEAR
>      >> variants have been passed as well as LINEAR, to act as if LINEAR
>     were
>      >> not passed at all.
>      >
>      > Yeah I think this makes sense, and we'd need to add that to the
>     kerneldoc
>      > about how drivers/apps/frameworks need to work with variants of
>     LINEAR.
>      >
>      > Just deprecating LINEAR does indeed not work. The same way it was
>     really
>      > hard slow crawl (and we're still not there everywhere, if you include
>      > stuff like bare metal Xorg) trying to retire the implied
>     modifier. Maybe,
>      > in an extremely bright future were all relevant drivers advertise
>     a full
>      > set of LINEAR variants, and all frameworks understand them, we'll get
>      > there. But if AMD is the one special case that really needs this
>     I don't
>      > think it's realistic to plan for that, and what Daniel describe above
>      > looks like the future we're stuck to.
>      > -Sima
> 
>     I spent some time thinking about this over the break, because on a venn
>     diagram it does overlap a sliver of the work we've done to define the
>     differences between the concepts of constraints Vs. capabilities in the
>     smorgasbord of unified memory allocator talks/workshops/prototypes/etc.
>     over the years. I'm not that worried about some overlap being
>     introduced, because every reasonable rule deserves an exception here
>     and
>     there, but I have concerns similar to Daniel's and Brian's.
> 
>     Once you start adding more than one special modifier, some things in
>     the
>     existing usage start to break down. Right now you can naively pass
>     around modifiers, then somewhere either before or just after allocation
>     depending on your usage, check if LINEAR is available and take your
>     special "I can parse this thing" path, for whatever that means in your
>     special use case. Modifying all those paths to include one variant of
>     linear is probably OK-but-not-great. Modifying all those paths to
>     include <N> variants of linear is probably unrealistic, and I do worry
>     about slippery slopes here.
> 
>     ---
> 
>     What got me more interested though was this led to another thought. At
>     first I didn't notice that this was an exact-match constraint and
>     thought it meant the usual alignment constraint of >=, and I was
>     concerned about how future variants would interact poorly. It could
>     still be a concern if things progress down this route, and we have
>     vendor A requiring >= 32B alignment and vendor B requiring == 64B
>     alignment. They're compatible, but modifiers expressing this would
>     naively cancel each-other out unless vendor A proactively advertised ==
>     64B linear modifiers too. This isn't a huge deal at that scale, but it
>     could get worse, and it got me thinking about a way to solve the
>     problem
>     of a less naive way to merge modifier lists.
> 
>     As a background, the two hard problems left with implementing a
>     constraint system to sit alongside the format modifier system are:
> 
>     1) A way to name special heaps (E.g., local vidmem on device A) in the
>     constraints in a way that spans process boundaries using some sort of
>     identifier. There are various ways to solve this. Lately the
>     thinking is
>     something around dma heaps, but no one's fleshed it out yet that I'm
>     aware.
> 
>     2) A transport that doesn't require us to revise every userspace API,
>     kernel API, and protocol that got revised to support DRM format
>     modifiers, and every API/protocol introduced since.
> 
>     I haven't seen any great ideas for the latter problem yet, but what if
>     we did this:
> 
>     - Introduced a new DRM format modifier vendor that was actually
>     vendor-agnostic, but implied the format modifier was a constraint
>     definition fragment instead of an actual modifier.
> 
>     - Constraint-aware code could tack on its constraints (The ones it
>     requires and/or the ones it can support allocating) as a series of
>     additional modifiers using this vendor code. A given constraint
>     might be
>     fragmented into multiple modifiers, but their definition and
>     serialization/deserialization mechanism could be defined in
>     drm_fourcc.h
>     as macros all the clients could use.
> 
>     - Existing non-constraint-aware code in a modifier usage chain might
>     filter these modifiers out using the existing strict intersection
>     logic.
>     Hence, any link in the chain not aware of constraints would likely
>     block
>     their use, but that's OK. We're muddling along without them now. It
>     wouldn't make those situations any worse.
> 
>     - New code would be required to use some minimal library (Header-only
>     perhaps, as Simon and I proposed a few years ago) to intersect format
>     modifier lists instead, and this code would parse out the constraint
>     modifiers from each input list and use the envisioned per-constraint
>     logic to merge them. It would result in yet another merged
>     modifier+constraint list encoded as a list of modifiers that could be
>     passed along through any format-modifier-aware API.
> 
>     - One consideration that would be sort of tricky is that constraints
>     are
>     supposed to be advertised per-modifier, so you'd have to have a way to
>     associate constraint modifiers in a given set with real modifiers in
>     that set or in general. This is easily solved though. Some bits of the
>     constraint modifiers would already need to be used to associate and
>     order constraint fragments during deserialization, since modifier lists
>     aren't strictly ordered.
> 
>     This effectively allows you to use format modifiers to encode
>     arbitrarily complex constraint mechanisms by piggybacking on the
>     existing format modifier definition and transport mechanisms without
>     breaking backwards compatibility. It's a little dirty, because
>     modifiers
>     are being abused to implement a raw bitstream, but modifiers and
>     constraints are related concepts, so it's not a complete hack. It still
>     requires modifying all the implementations in the system to fully make
>     use of constraints, but doesn't require e.g. revising X11 DRI3 protocol
>     again to tunnel them through Xwayland, and in situations where the
>     constraint-aware thing sits downstream of the non-constraint-aware
>     thing
>     in the allocation pipeline, you could get some benefit even when all
>     the
>     upstream things aren't updated yet, because it could still merge in its
>     local constraints before allocating or passing the modifier list down
>     the chain.
> 
>     Does this seem like something worth pursuing to others? I've been
>     trying
>     to decide how to best move the allocation constraints efforts forward,
>     so it's potentially something I could put some time into this year.
> 
>     Thanks,
>     -James
> 

