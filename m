Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68455B59162
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 10:57:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 591F110E71C;
	Tue, 16 Sep 2025 08:57:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ucb4zgsb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011068.outbound.protection.outlook.com
 [40.93.194.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A283110E6E7;
 Tue, 16 Sep 2025 08:57:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KB02nQjh4yINaZel187GrjCvkEbejZ9WAtI0FFPLxczEHJhXukyjG2eRLwCeBYyi4dfiwhrI7TJkM/nCTsUp+MsYu2BZlUBW5PoDm1IcFVEqIlQRISv9IPMTMHvP6RNNw2X+ltIOfbme9MeEt2NlW/G4ZI29GFygUC2jsSlKuAdBKmRQxgdtOr4SRblaTf26YgpDyKHgxYEaaIr7oluFS8UV6/pnFSbo2BqktE0qCtcloBqN52a9m7oYs5y3XF/91+bCqh2O149iH18D3YEme13PfnxDcaVvo+dZQTUuLk6G1jl/SFeDo6PiS4U5vNEx15si/PTlEmzNmVnR897ifA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gc5w1UC54cFNmdl2DUbXP9oPX4r/cbrYMAT30mzalN0=;
 b=Upst9L1QFNvxeef32Zio0wXICzuR55BHD9GLRjfqG9LJfa6Lrfu7oqAzhpDwSgykAci5IVq1A6CxbIijoOCtzbKKi+DbXoVlUPT+6vE9fjGl77MFbZewEFNwfBgZ8wAUNCKLYXYaK6MIICi48Xp5CYzkiL2gi3Ad4iGkWmOSuFEkRzzTcLcFebib9wM5V304L9ZH386uq3wp7Z4eql1baDt/obbfFeYzhgwfezmjcMsefaE1SPLep3A7+EtaYD6tUFnRtU2CstvZ3rOlhKW3lqmAR4Bvsup2RCFVEETsOIRgqSq68MWQEGTERkSDgGhRrMTh5KoR5Y1W8qScSqwkog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gc5w1UC54cFNmdl2DUbXP9oPX4r/cbrYMAT30mzalN0=;
 b=ucb4zgsboFKtRX/2S34VbEHAyXEej0wj0Rj1FbebQQCO9RJ1o8DuC2BZ7st+r9K2L5z+kEJMBNplzKt9fIZCknqV0koMGhJMFsUMjSJi3V7Rz7jXXDxY29cZ3SfXAzQOcXFDxwFcrakGRHCjsx3TiASgufc8Kx92EFApo1r1lO0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB6160.namprd12.prod.outlook.com (2603:10b6:8:a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Tue, 16 Sep
 2025 08:57:31 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 08:57:31 +0000
Message-ID: <77b76efa-60fe-4629-8828-5a56b254a92b@amd.com>
Date: Tue, 16 Sep 2025 10:57:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/11] drm/i915/gt: Use pci_rebar_size_supported()
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 ?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Michael J . Ruhl" <mjruhl@habana.ai>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20250915091358.9203-1-ilpo.jarvinen@linux.intel.com>
 <20250915091358.9203-7-ilpo.jarvinen@linux.intel.com>
 <b918053f6ac7b4a27148a1cbf10eb8402572c6c9@intel.com>
 <ewypjj64siaswcfvfzgxihwrflb6k6pz2mrfuu4ursdldwnqlm@ignlhd73keck>
 <aMhzougLzpfw2wWw@intel.com>
 <58fb988207c4d5c5ba25338c1281189e12c009c3@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <58fb988207c4d5c5ba25338c1281189e12c009c3@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0010.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d1::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB6160:EE_
X-MS-Office365-Filtering-Correlation-Id: ee7a6aca-8a39-415d-029f-08ddf4ff11d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZmZ5RGRHKzJCenljdCtDOFJ0SGh1bGkvL3RxMGpxdyt3em9EY0hQWEVuQnFK?=
 =?utf-8?B?bXJnQStYMndHeE1OaUJQWlpxenJIMkhhcTNtMTdZK2E2N0tBZlNxWlZrSHJ6?=
 =?utf-8?B?QWJCdHAzYjhoL0hnSFpIQzFGVlBIS3hsdjdyOEsxUm1UdmRRWWxJWC9VZlVl?=
 =?utf-8?B?Yy9CWEFBeHVXUGJxTWQ0RUhKUnZJeGhlUDNvSHVTNDk4Nmd2RXFBcDBPaFkr?=
 =?utf-8?B?cmwvYTdObkY1bnVUY1ZNQlRtUWNQL0NpM3p4bGdOdTVoN2NPTGg3TEo4eDNH?=
 =?utf-8?B?Ukh3SUtQVnpCYjUvaWxaV1IvZWNDai9tdjFtZnR1ZDA5dHg1aElGZXhpNVFt?=
 =?utf-8?B?R1d3aGl6YVhHQnMvNzdXeUYyM3o5Mkt4LzcvamU1aldVaCtNYVJjU3NGQlN6?=
 =?utf-8?B?N0o0YlJmS25pOTc4VTdaVFRzOTdYZmhEeU9HNEEyc3ZSTnJvRGg1ejZGSjQy?=
 =?utf-8?B?T3hrTHcyWVVhNDlZNWtlZVVuaGFlQy94QzBteTd0YW9SeE50M2xUK1VqckpP?=
 =?utf-8?B?TkJ3V2FXVmVnaVFRa2JYRUZTSE0yOFNSUktNbFF4c1NObzVNYTZrVzg3dzBL?=
 =?utf-8?B?anZlZ2tDVEUwazVEelVISTRVenQ1KytDNy9pOGh1SUZPK0wzOXZNK0NRMFk4?=
 =?utf-8?B?dHYyQXBtWWFHSDF2dmdRT3lkc1lQV0R0TUxHb0RqbnhEWXBiNWtuNjB6SVB0?=
 =?utf-8?B?NkRRN3gzQzc2WHJJYVZhOE92dExyQU5HUVRWZXNhczBrL0hEenhFeEEwRW1a?=
 =?utf-8?B?RG9RVjNwRG5Od3RXME9lRWVFci9KV0FrR21MSk1VWFQ3amQ0emZEcGJyQWZI?=
 =?utf-8?B?RjlEdmN6d2NPZGlTSFFGQ2xPamUzamtWdDZZdnF1V3VpK1dOa0lGOEpvZDJx?=
 =?utf-8?B?QjhucW16bktyb0c4WG4yd2VlR2FpS3NqK00vK2ovakxnc3FQbjh0THAyWkpv?=
 =?utf-8?B?MVBORjZMdkVmd3VFVzFIL1VVYjMzdjRja2VZOEtmVUhjNzlubjlBeUpueVNp?=
 =?utf-8?B?ZUVJenpDblBtdUhvV2x3MVNNY21oY3NHUDlUSGYveFBwWGluMUorYWtsUFFU?=
 =?utf-8?B?Q0k3eDZYYVNVbDFxbFpweTA0QmpIY2FCT0dUOCtjelhUeVdmWlJxWGJDNllN?=
 =?utf-8?B?ank2L2EzZ2c4bFVnbkJhZWRGMUUyN0FQeUJZVE5kcFhmM0orNHpDaDc5cTNk?=
 =?utf-8?B?RERWQm1LcUFObTc4QnJPVzg0Zi90Tjk0aUQvaTVwTktVcmZBbERuRDhubmp3?=
 =?utf-8?B?SlFqWXZkZjJybzFHdTY1cXNXQnpFTnBwNVNRY0cwZkxBVlJyQ3M1bmx4OXM0?=
 =?utf-8?B?Q1FheWQ0c2QyWHcvMGh0VjY2VWJ4TnlWTXhyK2tPVjJSdWhmcU5uaGRBWGJq?=
 =?utf-8?B?aXQzSU5FbC8vVjMrWGZGVnBVZ0lxNG0zNVhhUHlOR1Vlakg0d0RyR2x2Zks3?=
 =?utf-8?B?NXM3dkc1WURsQTYrSUsrVHJvY3FHU3lwN3pTaXNPWUhCdTBtQ2VsSGsvR2pN?=
 =?utf-8?B?R2hud2VucmdwaFp3RFhCUnVJRmVnYnRSM3pCNlI3amNCWmtDblFKQjFJVzRU?=
 =?utf-8?B?bEdjVlVOZlVaOEFlbDZURHAzakthMmF5dkpRSDRycG42Vy80OS92cTdNckZD?=
 =?utf-8?B?V3UzMUVaQkcreVppWTViL3ZIQzk5aVFXbTgySDlrYlc0M2FvekhNSk9GanM4?=
 =?utf-8?B?R1I2ZTB6UUJnWWxOcFlEMFE1TFM2NlovakN4clVUZ1ljN3ordHByRk1MSUc2?=
 =?utf-8?B?YUowQlZBRk05VmtOQ1U4S0dzdCtrM3R2Qmt5b01idWZDWTRyeXRCMEMvQWVa?=
 =?utf-8?B?NWZoV2NNd2pPMGdJYkw2a0l6c2dsd2tKeDEzbXBVVmE4VCtoSTlaOFB5aklj?=
 =?utf-8?B?bXlYYy9ZODNmL2hDaytDL1Z3TDhGZTJjRGhYTEdJem1YR2hCcVcyemswbjNF?=
 =?utf-8?Q?WjxqMMGwonQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0M2MHd6Vm5GVURRWlM3a0FFVlhtUWo0WnZBU2pVSjg5RWxodHlyU2p4NTJU?=
 =?utf-8?B?NEVHZ0swZG5SSUhvamJOUnhkSlpzemlWUjJ1cWZiN0VnQXFGelRVNDY2djlL?=
 =?utf-8?B?ZmdJZEN2YXJSVlQxejlaNzFobitDQ2F3ZXBCQ2Y1NnlLa3UwVWYrWXQ2UjQ3?=
 =?utf-8?B?aVhFZ2R3S080WlNPR3FUVHl1SVhqSTJzZlFXdXBsSnJVTSt2UWNGZ3N3dVR2?=
 =?utf-8?B?NWxRWG1qUXB6L3RXK1YzbjROYjdpbnRlOUpjbEE3U1BUejZoYzcxOGtGWGNi?=
 =?utf-8?B?OUNjNFBkU2F4SzhRNUZtRmNCMlgrbVA0V2pSaUMzTGpMb0l2Ty85WHpnK0Fs?=
 =?utf-8?B?Zlg2ejdia0o2aThQcU9lNk9sWnlPQ0N1UkpOaDdJTWd6TEUwZmp6Z3Vpby92?=
 =?utf-8?B?Yi91MUJPSzZFSGpvSGFVYkMyMytjNnF3Y1Rrb0hTUW5US1JadklhU3hpZFhO?=
 =?utf-8?B?YWlTYldrWmN5QWg2ZG9VclZhT1pRZ0I5WmRXR09DSS9xV3pSeWllVUt0d1hI?=
 =?utf-8?B?R1dCeDFwby9POE9lR3FoVmR6WnpYdGZjUjhOcmpWYUZsK3BFVTZCWXpuZjBL?=
 =?utf-8?B?OHlIWHBKdHVkcFUvS1ZFR3I0RDV0MWtCNC9vSlloWkl6U0JlbEpDOUFSb2Vu?=
 =?utf-8?B?dVRzVHBuWGNsRlUzbVdsRFRQZHdTeHBTQnlwQXlHRFcrS3Jtc3U4a0szN29T?=
 =?utf-8?B?SVFtSEdYcEpEK0Z2WE5HWTFOTVJOSDloTUJQWC9jV29tc1VLRHRPMWNZd2Ir?=
 =?utf-8?B?NHc3ZnN0UDQvdDZGSFk2d3JKVlExZXhtYnBMMGZmRFJ4Y3UwR3R2dXJYdmFT?=
 =?utf-8?B?MDEvOFp4TldYa0lrYU5CaDE1VmtveXc5OGp3a2hicm9tdE4rV3hmU005MCto?=
 =?utf-8?B?ay94NWtPcGppRnd2THlBWmVCbGIyRzlad3hzeWpXR1U3ZTVGWHBxcFptZWI4?=
 =?utf-8?B?dWJBTnA4SUNMRkRXVHkrbVRpM3cxV2RLaXB4c3FyMGoyaTl6RThKU2tMU2tU?=
 =?utf-8?B?Y25ZNEdMVTkxVTdHaTBwdUtmTHc0d0h6S3Jyakx1bWMyOUdMVUQwVjJvUUVm?=
 =?utf-8?B?QnAvZjdzMjcxVWFGVGxwT0NiUXVGcTVoUXh0b3VhOHZVN3NMN3ZBaXg0YkZJ?=
 =?utf-8?B?S1F5LzlyRkFEWHVOZTMxYkdkSFcrbnZvVFFjMnlCbGIrL1pUeWdyeTJpTmt0?=
 =?utf-8?B?Sm1Udy90d1Q1eHRiYlppNlRtNjluN0IwTWRUM3BsVGdsemRvVmVUMHNVbjRP?=
 =?utf-8?B?UWdNTUZYTTV1MC95M1V5NFN0dGp6SXRMT2F2Y0ZJT29QblNCTUZIOUhpeDdj?=
 =?utf-8?B?SWxwcXA2cFhSVkVYZFFFMVdFbUhSQjUwQ0Jzcks1WEJTUWNzdGRIMTBBTUR4?=
 =?utf-8?B?blRFdVNXeElzWWFkbnZyWENCM0dpRmJQT1M0ekxTYmtIbnBlbE4xSHpWZk13?=
 =?utf-8?B?QTVheXRPdVh0cGdiYXp2TFprZi9FVm01dzFaUzZvbmZmS2I2NXBMeGdRaHFC?=
 =?utf-8?B?SDFFbWxGQXhPVkd4aitrUVM2REtNSFk4b2wzM24vaVM4TTI4ZjNBYnJqSDY3?=
 =?utf-8?B?TXg5c3V0SzZKdlprZzZ5V2NhR1pBRDRjUE82cXFTWjZrMDhLajhWVGdMdk53?=
 =?utf-8?B?ck9lc1BnbEwyb0FqSlhEcStvZThjbzcvbzNDQmZkQTZNVHRxK2RwRzRObXVn?=
 =?utf-8?B?eTR1b0JDNGQ1aHN3RVVlRmkrMU9JYWFDd1pEcDhYMzVjaEtuL3JRVlFkcER2?=
 =?utf-8?B?N0lHcnBIcFFRS0VHRkZMQ1Q2alJmZ3RTVWtyRDg0MnVmU3IrR1JFZ1FVeHpj?=
 =?utf-8?B?RW9scWlZc1g4dHBtMDJNb3hRUzBtWmdQcENMRzV6aWZTMDVPU1JPWndOVUdu?=
 =?utf-8?B?cVdocWpPNEhyNUlyRktoV3ZMU3dHSFBWS2JVY0l1Z0MwcWdicytVd29DQ3Zv?=
 =?utf-8?B?TVVmUHEwRlFtc2w0RDdvTWFoM2pHalgzaVRFU0s3N1JXeWdYcHh3bU9qSS9U?=
 =?utf-8?B?NVYxRUQ1R1pFMXh1SWxBeG8rRzRtK01mSE13UXA1M0J3UzhrbFdkZTFaK0ho?=
 =?utf-8?B?Y1V3Mklwayt6N0k0a1haaFpmWktrV0dtTTJ5TUxUSkZCNEZCYXBLeVQyYjZu?=
 =?utf-8?Q?A1UIfTXFQImfn/kJyujqPz5I/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee7a6aca-8a39-415d-029f-08ddf4ff11d7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 08:57:31.1177 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TwgNE+DXpXRj1G60wDCvNJ5vGnC7zjERqfTdYVIZg8GsPdNVmsZDeP1AnIjXpMwc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6160
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

On 16.09.25 10:12, Jani Nikula wrote:
> On Mon, 15 Sep 2025, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
>> On Mon, Sep 15, 2025 at 07:24:10PM +0200, Andi Shyti wrote:
>>> Hi,
>>>
>>> On Mon, Sep 15, 2025 at 03:42:23PM +0300, Jani Nikula wrote:
>>>> On Mon, 15 Sep 2025, Ilpo Järvinen <ilpo.jarvinen@linux.intel.com> wrote:
>>>>> PCI core provides pci_rebar_size_supported() that helps in checking if
>>>>> a BAR Size is supported for the BAR or not. Use it in
>>>>> i915_resize_lmem_bar() to simplify code.
>>>>>
>>>>> Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
>>>>> Acked-by: Christian König <christian.koenig@amd.com>
>>>>
>>>> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>>>>
>>>> and
>>>>
>>>> Acked-by: Jani Nikula <jani.nikula@intel.com>
>>>
>>> Just for some random noise on commit log's bureaucracy: why do we
>>> need both Ack and R-b? I think R-b covers Ack making it
>>> redundant. Right?
>>
>> reviewed-by is a more formal attestation of the entries in the
>> submitting-patches doc, saying that he carefully reviewed the work.
>>
>> acked by is to state that from the maintainer perspective of that file
>> the file can be merged through any tree.
>>
>> in the drm trees nowdays our tooling is enforcing acked-by tag if
>> the patch is touching domains outside that drm branch itself.
>>
>> if a committer tries to push a patch without ack from the maintainer
>> of that domain it will be blocked.
>>
>> So I believe it is a good idea to keep a separation of the meaning.
>> Carrying a technical review of the patch in question doesn't necessarily
>> mean that you, as maintainer, is okay of getting that patch merged
>> through other trees.
> 
> Yes, all of the above. I just wanted to be explicit to avoid the
> follow-up questions "thanks for the review, but is it okay to merge via
> pci" or "thanks for the ack, but does this need review also", and move
> on from this whole thread. (Which is a nice cleanup, btw, thanks.)

Mhm, that's a really good point.

My understanding of an Acked-by by a maintainer is also "go a head and merge it through your tree", but I think we never formally documented that.

At least I can't find any reference to that in the "When to use Acked-by:, Cc:, and Co-developed-by:" section of Documentation/process/submitting-patches.rst.

Regards,
Christian.

> 
> BR,
> Jani.
> 

