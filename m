Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMMSInYVe2n5BAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 09:08:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F23AD202
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 09:08:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B650110E812;
	Thu, 29 Jan 2026 08:08:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FaHRAiCt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010044.outbound.protection.outlook.com [52.101.46.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAA0410E80E;
 Thu, 29 Jan 2026 08:08:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DbMlPf2kIT5yyiFrmfRkVA21sGXsPlQRJ9s3aEm97l0V4Bvnbj3gKx3wc4KvyCrpX/kYWXKi5ISom5cUMI6cbTsz0dvvSOeoO4y3XTMCbnjnCltjepSzzeAxCAsMjO1EDAY0ngmlxUpU8NSiGyYrEHJrs0N8KvxM31B4x2tdtoijHYAfrEbhA6LJI2Cu34JtYhXWdWwqiH+5f729biCrQSvUPVLFc5gNZUd8K/X288YE7jyloSYY3/KKfwLyTp0Q13ezyG8RgFlPoF0MkgkFKXWqZY0CO5YuK15O0D1xG93bLmienX3/DFmnQKocc5lDnSwSWOC81zqiOXfBdg0XxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9UEb0TtI9lNv1G5JDPp4bVL/DKH0BLmJdILLaUK37vA=;
 b=tvaiTyh497rjdHiFz9pNkmNHgszZD6tlG1AoLJU+TlS7qydGFfFsyN+vMSTpPLobUqvnZ0mEnBYOnQmA8UND497lkev/viQd9DdJwL93lJEDjI69TZVwFWPYocxduySNWpNcBstVr2KOEN62wxijtvdzIrGkKjpDQB8O9iRyhvuKsAC65m3H87zMd0f1wnn7W2GfPXf9BLUXPykg/02e98/kDXSqth26yFGvzRxtuCb+p7edGSZMAslZdLreL5Eih9E4HTVnATW4HQUlY4DIYpgxgnTsNM2Uif/QnByJbEZjW2FMKHlnnWygm7rr6XtG66y0rG5uFrVYvMuSK38xag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9UEb0TtI9lNv1G5JDPp4bVL/DKH0BLmJdILLaUK37vA=;
 b=FaHRAiCtF37ZgXJ+3Y+kvXR2Y8AZATcyIBcanUaotK3xD1ZArMNJXKdqYXqMcFsVsHv9bZcu7X73cczRGcPN0ay+4BHXsmbHHl/oH8tGXQaKL1SskbJXQ/5NH2r7SV1VK2mvkPStBKtANfV2P9BWnB7hGBN7kjSZ5zx2Pw2fPgY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BL1PR12MB5969.namprd12.prod.outlook.com (2603:10b6:208:398::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 29 Jan
 2026 08:08:13 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9542.009; Thu, 29 Jan 2026
 08:08:13 +0000
Message-ID: <f7c23358-9438-47cd-8493-6bc84ecd9900@amd.com>
Date: Thu, 29 Jan 2026 09:08:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] drm/radeon: Raise msi_addr_mask to dma_bits
To: Vivian Wang <wangruikang@iscas.ac.cn>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Brett Creeley <brett.creeley@amd.com>
Cc: Han Gao <gaohan@iscas.ac.cn>, Thomas Gleixner <tglx@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 netdev@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-riscv@lists.infradead.org,
 sophgo@lists.linux.dev
References: <20260129-pci-msi-addr-mask-v4-0-70da998f2750@iscas.ac.cn>
 <20260129-pci-msi-addr-mask-v4-3-70da998f2750@iscas.ac.cn>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260129-pci-msi-addr-mask-v4-3-70da998f2750@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN0PR02CA0026.namprd02.prod.outlook.com
 (2603:10b6:408:e4::31) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BL1PR12MB5969:EE_
X-MS-Office365-Filtering-Correlation-Id: 9387bf3f-514b-4237-6aa9-08de5f0d8c7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SVRGTTkxQTBmQkdjU3BkbzJFZUJ1QWExQVhqK2VOMU95djJiQzRnV3hXbndj?=
 =?utf-8?B?VVJCUFdEWDdiVS9qekZXTEM0bi9vWnVPRURqMjBDY0ZXR2tVTms2anFJMmxN?=
 =?utf-8?B?Zlp0clF3WE5zcUJtTkJVeWRJNzh4L1J4KzVRcVFzTnRSREVCTWlQUFBWWFJC?=
 =?utf-8?B?OWlUb1d5UENIZk9hVU4xYm41eDY5NlVaelh4cnlVa0tMclg5OEdhbUFUdEpF?=
 =?utf-8?B?VW1RM0ErNS9abkJVT3BQTGc3dlp3T0NNK21JTFluaGMzbU5yRnM4MU8yblpr?=
 =?utf-8?B?NytiWUdPR09EajNheHlsaFY2MnFpMkwxeG8vM2JjZ3dkVE01cExPbGdFRTlO?=
 =?utf-8?B?UDhQRFJ1d0c0bjNFTXZuS3JrMHVjbHRwRmZGbkxKQUI1L1p1dHNSbkx6MVNz?=
 =?utf-8?B?ZWNUT2UvZkRyTWEveWRZM3h4VU1nNHloM3ZaQ3NmRGtubjlhUTNPa1ZhVExR?=
 =?utf-8?B?VU4vWUlDSjJwWEdzZUdlUytmb01wbW13a21OUnFOdExZSm9LZTljaGlrcE4y?=
 =?utf-8?B?ZUdLRDlaUFRqRmVLYms0dG9oOXZmcGUrNUdSenVxYXBmOTVPZXh0WTdJVFJl?=
 =?utf-8?B?K3F3WHYzU0tNdXhqYTRHOWdnbUJxS0pwVHVXeDFITGNLcWtROFVrUVZ3WE9C?=
 =?utf-8?B?Rm1xS1B2cUVnT0RrMTJrbEJLcS9MM0JuU1RvZGwrSFBTYU5BRmtucXFIMDVC?=
 =?utf-8?B?TXJMeDZyTG5US0JuVWhCTCtQUVNZbUs3QXdLOUtnZmoxODhIUmZMcUIxODJJ?=
 =?utf-8?B?K3FrN2ovMjlCcTZ1MmwwWGpvc3lzQlBDRVpkRXlJSUI1Z1gwOWhsZERMVmZl?=
 =?utf-8?B?YTlaUjRqbEVISTA5S0hTaGtKSldtNktFN2dLcXdjVVc0SURVZTRJTU54SDhE?=
 =?utf-8?B?LytkaDlRRHZpYXhUdlhGVzEwbms0R1dQWjR5OEljSUJpUmY0enh5SWhIN3hK?=
 =?utf-8?B?RzdFRGVyL3BLeHJnTkM1YkgvWkZaTXJTRE8raUIrUDBSclZMcHJzR2tJYzJD?=
 =?utf-8?B?YjBMeW5PNTBISm5MTUxGcGQ4WlY5cG5lb3F3bjVUZWtYajRKOFh4VlVpSUhK?=
 =?utf-8?B?bUs1dHh5eXRtblpWVm1adW5pVVBJZlBFaDZwQ09mS0dRWWNDQ1plSTRxaHhx?=
 =?utf-8?B?aUNCQkpQV0ZtZFBoYVg2NlZXdGpmT1Z2S0FQaU1hZmQvWWgzd25jVDY1UlBn?=
 =?utf-8?B?NEhGN0pFL0xzd2tuV0V3ZXdQSkk1czFDdXA3dE5RL1ZXY1prMGhJYXJpM3N4?=
 =?utf-8?B?L0lVajJFR3VrTXZSQmdVaDFYekhsM1pSOVJDTndLOVlCSUxvL3phaXc2THRu?=
 =?utf-8?B?eWNiR2pSMUp2b2JXMS9vZGhoZGVJVFVmZkhWQ0M2T1ZsaDlnYjdPZm5rWmxB?=
 =?utf-8?B?bFpDT2lIVTRLT3M4L2w0WWt1Q2lDV2VSdHVhTHp5Ui9uSlZ5dXg1UWYvTlJ1?=
 =?utf-8?B?NFdGbjh5WGdvMU1iN3c5ZmNsaEwvYXVxbkE0NWF0MVZNajRacXBUV1k3RWJV?=
 =?utf-8?B?M1Iyb1Y3UjBXWXJkYnBKaDd3Rld4akVVUlpXampiU0FhT29CaGJwem50LzdC?=
 =?utf-8?B?UWo3NkF4Y3FpQWJJQThPTWwwNk80M3pyeFpOOHgzRGhEY3FnOXd3SEZPUDhh?=
 =?utf-8?B?cEErajFFSjYyd3Y1cnNIYW5pS1g0UXUrL2ttRjVSdjNrL29IT3pSTDZnZnpG?=
 =?utf-8?B?Um5XblV1ai9rVDNCVU1MQ0ZJdVR4SGs4SDEzOFJlVWlIR0lqSER1VTUyeGdY?=
 =?utf-8?B?M2lmWWYvKzE0eGdmMmMyMmhGTlo3My96QlZlUmN1djZDa3Rpa1BDT1Z1VjJm?=
 =?utf-8?B?NzhteWl5TG0wZHIvZEE2UzhjbDZiWnRsR2tqS2NYNTJxWXU0WGxxRWFSYUtw?=
 =?utf-8?B?UisxNVJvZHNOMkJ0MFo4UUdPVFlPMnVCcmZWaGRtSnU1UkZKSkozZFh1d2dJ?=
 =?utf-8?B?RjArNmx5QU5sbEVKVTRkRVhGOGJWS0ZNRUhoWDRzeG1VSzQ0dmUxMGVRZGY0?=
 =?utf-8?B?dDllRytEMkR5QkVFeURPb08wK05HcEFxdEY3OHEvaUZFM2lTOHVPck1XN1g2?=
 =?utf-8?B?VzJBcjJ6aGVtNmNMaFNiRE50dlNkNUFWTFNqWnhEQWIzU0dCZEV2Z2FLeU0x?=
 =?utf-8?B?ZUhBVWR6RlAyVlBrb0FyUmJsbDBpdWl4cHVBZG9STXpCMGg4YWF6QU04d3ha?=
 =?utf-8?B?dWc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RE1BUy9ySytNUnNDem0zblhwallObXh4K0g4RG9URWxWUVgxbFF6N0gyaFZ5?=
 =?utf-8?B?bGpvbjFVaXREakhGUXRVaGtIby90VmhhMnQ3ZTcxYWRhUVhZaFQ0R010dzZO?=
 =?utf-8?B?N3hNMEZFOW1yZEY1ME5LYXpRUEtNbFNHUHVrN2xlYVM4VkdPQktTbGwzMW5O?=
 =?utf-8?B?M21mSVhGcVRkRWR4ZlptUVFpSnE2N2xQNHI2SC9BaDIybEY0YVJ2d044dTU2?=
 =?utf-8?B?SVFsbGhjNDRVNkhpVDcwNnhxOUtoUmdBZndsbXFMc0Q2UktEeHhZMGpqVXdY?=
 =?utf-8?B?a1Q1YmEwanhxR3NSeVRyWlNERjdEV2FxMWZVWTRYOXJPcmR6VFFyQ29QelFZ?=
 =?utf-8?B?Q3ZQMG9BNnBLUkJRcnRXcWR3cWZUWnRyNjBnVDlkU3hCcUsvMk4wZXpKUytw?=
 =?utf-8?B?d0tic0NaV3JQMFQ5MEtobG5NdzlxT2pzSWsyWFhPcmN2QlJqZSsyNW0xcUwx?=
 =?utf-8?B?eExSR3BjbDBXN3FlZGNXS3BzSjgxZmxwSy8yby9PaVZRSTVZZnhYWjh4Y3pZ?=
 =?utf-8?B?YnNyNmpCNkJ2Q3pzVVRKVXQwRTRkOTVqMDJXZmxtVzNXK0d1L0J4WUhEMGNZ?=
 =?utf-8?B?N0tJeUg2NjVNaVdJbkRYcVJPMU1oYUQ1YUt6dEVncTllV0cvL1JBbmdxdkhO?=
 =?utf-8?B?eWNvL2pOTkQ1UFMvSitNcXhuOEhOV3ZUdUhOQ2RkYWdrUy80M0JUeUo1NEFB?=
 =?utf-8?B?K0JCVHJwOEpVM0NpaU5OZ1VFdlRoaGM3dHJpZjV0UDAwR2tpODJRVkpOTi9C?=
 =?utf-8?B?LzNZQS9na3EvWUVNNnVHVTF2Z2F1UTU1ZTFjUXNnY04rUFFaa0x2UTNSTXRM?=
 =?utf-8?B?UWlpRmZHRlA0K0VuVUdzZ01oTHhBdkpZVTlWVCtoSFdVdy94TWNPMzJ5b0R3?=
 =?utf-8?B?dWs5ZjBSRzY3U1FpdFhtN2xDY0pXZlg2VTNOb2JDbXY5UUtNYkFnTGVhVjFq?=
 =?utf-8?B?dmpYYWkxNjlYVVFWRDJHZUpMaVJicU45K1ZEZjNSVElzZkQ5NWNMT0J5Y0Vm?=
 =?utf-8?B?djBZd0FVdG52Z0Fzck1vK1poK3BJY0QveGRSMVd4b3lnMDdzQmRHVG5NKzFw?=
 =?utf-8?B?WklqWW52MEhaZEEvcTYwNmJ6VE40VTJSb2Qwa284QzQrczBoOHdCT3hRMDBR?=
 =?utf-8?B?SXZ6YVhWeWlHaklQRjBzcGtoV3V5TTFBSTlkYjViVXpuUWVmZXEzQXFvQzJr?=
 =?utf-8?B?TE04eDB6MXdoOEJmcWUyR1U0R3BlekFhMTBGTzdEdUNmc2gwWEdFYm1sRUto?=
 =?utf-8?B?UCtET1BwZnZWUWM5NGpaTWFiZ3krNmtwQ1NzWGU4SzY3R1BLR2ZyQ1hxRUZk?=
 =?utf-8?B?aldFSVQ2Y3kwSEZxMVJDRkh6NEVBRzhBajdva1JYRUtlOFM3NUo3RFkxRHhs?=
 =?utf-8?B?bVpSNWhnMGRGTmtmWjlNQTV2THBQRU9MVDZLTmJNOEkwRzRUOWFDN1A4UUZm?=
 =?utf-8?B?c05wZW1OaThzTEltODREK0l0U0VBaW4yVTdGZHQwVnFKcnVoajdEa2FSTnNi?=
 =?utf-8?B?cFM2Q3h5UmpKVjAyc1Y0a2kxVzNFdnU2OWowUmNPMDM1UTlCaFlXYVg0bjNk?=
 =?utf-8?B?d0lIS28yRjBFeWk3bnZKRDhCSkhkcTJNYUlodUp6L3JKYnpGc3Y4SkQ4dWlQ?=
 =?utf-8?B?Z1B1NExiRlkrbzMrTU1mTHlLNkMvQjBBZGZGbVdxMFNmdkJ6d0pNUlY1MDFX?=
 =?utf-8?B?K0tTZFIyQ28zV095Y3RuRmMvTEY1MktQdDBNZnQ1Wnd4dU9lM24xTmpQWFZk?=
 =?utf-8?B?NjZVVzBzNk9VRDJ3YWhSYWkrUXdORlovWTZvSFBiS0hLeVpkeG9CTXBkQXQz?=
 =?utf-8?B?QnVaV2k5T2R5ZlpULzRlTnl0NkNJcG4veXhrNzdSN1RoWUNuQVRhbXVydHBw?=
 =?utf-8?B?WncvcWFIV1hsNzB0Y0Z1dkZNLys0alA1OHFDQ2gxMzlNdkFYU2g0OExMSHB1?=
 =?utf-8?B?eis4S2dZdU5QU2UycndjTnAvaHRuN1NzazNwbDUvVnZTbEpmNmVmM01vVXpt?=
 =?utf-8?B?NkI3TVJDNGZKb2pEQnlBbUhSVDROdDVtaWp4cEJoZlFuLzJHanArUXJGVU5x?=
 =?utf-8?B?TWQvQVZ2dE9ISXBpanIvbnRqczdvOUJ3NU1aMGo1RlpiOHBhcUFGTWluOE1t?=
 =?utf-8?B?Y29aTWlJSEZxdGFaZ2dLRlBRR2lYUkZUb05jSFpaeWJCTUorRHg2Qmh3MlFW?=
 =?utf-8?B?S0pNa2kyeG1hUFdTYWk0aTJmSFMxeXpyMWhCTG5PUnZ1M2ZZY1BVNVVqeVRo?=
 =?utf-8?B?N0s1WVVuNlV5QmZCRUlLdE9sVVRQTlVYckc5U0IvNThHWGxsWFZrT2E3RVd0?=
 =?utf-8?Q?rF3XE926xNrVi8AiD1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9387bf3f-514b-4237-6aa9-08de5f0d8c7c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 08:08:13.0983 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gWB5c8uw8mwYmng8Ej2tubcudxpPkEEPRvaREjD0DI3BOnY2MrbNiG1q30e0H/08
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5969
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[iscas.ac.cn,linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,amd.com,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 37F23AD202
X-Rspamd-Action: no action

On 1/29/26 02:56, Vivian Wang wrote:
> The code was originally written using no_64bit_msi, which restricts the
> device to 32-bit MSI addresses.
> 
> Since msi_addr_mask is introduced, use DMA_BIT_MASK(dma_bits) instead of
> DMA_BIT_MASK(32) here for msi_addr_mask, describing the restriction more
> precisely and allowing these devices to work on platforms with MSI
> doorbell address above the 32-bit limit, as long as it is within the
> hardware's addressable range.
> 
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>

Reviewed-by: Christian König <christian.koenig@amd.com>

> 
> ---
> v4: Patch message rewording for more consistency
> ---
>  drivers/gpu/drm/radeon/radeon_device.c  |  1 +
>  drivers/gpu/drm/radeon/radeon_irq_kms.c | 10 ----------
>  2 files changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
> index 60afaa8e56b4..5faae0361361 100644
> --- a/drivers/gpu/drm/radeon/radeon_device.c
> +++ b/drivers/gpu/drm/radeon/radeon_device.c
> @@ -1374,6 +1374,7 @@ int radeon_device_init(struct radeon_device *rdev,
>  		pr_warn("radeon: No suitable DMA available\n");
>  		return r;
>  	}
> +	rdev->pdev->msi_addr_mask = DMA_BIT_MASK(dma_bits);
>  	rdev->need_swiotlb = drm_need_swiotlb(dma_bits);
>  
>  	/* Registers mapping */
> diff --git a/drivers/gpu/drm/radeon/radeon_irq_kms.c b/drivers/gpu/drm/radeon/radeon_irq_kms.c
> index d550554a6f3f..839d619e5602 100644
> --- a/drivers/gpu/drm/radeon/radeon_irq_kms.c
> +++ b/drivers/gpu/drm/radeon/radeon_irq_kms.c
> @@ -245,16 +245,6 @@ static bool radeon_msi_ok(struct radeon_device *rdev)
>  	if (rdev->flags & RADEON_IS_AGP)
>  		return false;
>  
> -	/*
> -	 * Older chips have a HW limitation, they can only generate 40 bits
> -	 * of address for "64-bit" MSIs which breaks on some platforms, notably
> -	 * IBM POWER servers, so we limit them
> -	 */
> -	if (rdev->family < CHIP_BONAIRE) {
> -		dev_info(rdev->dev, "radeon: MSI limited to 32-bit\n");
> -		rdev->pdev->msi_addr_mask = DMA_BIT_MASK(32);
> -	}
> -
>  	/* force MSI on */
>  	if (radeon_msi == 1)
>  		return true;
> 

