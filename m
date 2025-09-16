Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B75B59444
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 12:51:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D899C10E75E;
	Tue, 16 Sep 2025 10:50:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="F4QTMlmO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010032.outbound.protection.outlook.com [52.101.85.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2298310E75E
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 10:50:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YKNmOCQPMGSGwtkN64P2zg8Mye+MDKSmjDtxuCUVWLaPVUO+2KBicTfUoCjg/Iy+EDkzrBp7eZEeXZN8+GLN6arjlLbK8VHQ7ln8H6WkPvyOlx60SLWx9jNbnDMHIiP6/0smzPL2hl2Sx8nuJCZqlJ7qOV3Mm6OWPana3w2dHdr+LTk3nHtXLqYoC3zSGUEDmnRwNu0GTvhZyNRnLVgIYw+ZOecLBxrPUWhMscoh3t2KN+YcMTOEH2p44mWWCFXdGxXfZ/JrHmJRoYapKJf9FwK1PotXMAgIUUkdEDutVp78PYuY/o/GuzIKGBQyRgz8fy+wgZGor6PxS9Tn1NfOMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cAI4LZnx1aRNT8IXRHr9KjBjibwG0EmXNaCHRMUQ6js=;
 b=cqE5Qe4o8dr5CFKIqNAVfFbpJ55YVRmVBRLzNH87q0qficYt+4uy1YvGnkQh02ZVboV0VAbIeDV2xgG1sGXgYUe3mu9e9sTYyV5nZVBViyd7l/q92EVxzb3DVscJyvTI/FfKa5KQc9sajTrrX3ITeGoOfCCSLkdsilSF3yUgG9EhXviMBUDzTxxXMmi5DQL4qk6ePZoqPit9OA/LZ9+oDGLNZnCuomRHSY/2Kbxs9ESGSXyry/PpnglbE3ItwhLH9LQfDOAdtoN+LlQiFmr4dU9jqquO7TD3u4l7ORIQwYaGgTRIYPjNNjZqyF8ei0lNAktVbuCI9aIox/qXyez0yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cAI4LZnx1aRNT8IXRHr9KjBjibwG0EmXNaCHRMUQ6js=;
 b=F4QTMlmOsXXLTQ7VDzY10xWTLhC+WMBCt7MUcLUfWo9xjnkeTGGxqnrJPMPj3r+hmFB7Y2cOIKML7b1VNAVjgUaklVLogJTVypB1Ib4xStdGvn4W+5GYazb+miIbBw3LuI1yKE+P7D8p8EKkNAoylkN7jaeTA6xnmx2mI6MmPoPfVDQbX+IhftJYTraubsytt9W2bebE/Kdju+k9JeUVNYBJQZx96rke9r44T+n0VZp9udVF2KYrDDG0qGoI/yrkOT38urMcg9vxfr7MjtWwLaDs9BNbxMClx1ICKhjIOgD859SxVyhoSHdUG45uNdteS5m549UYn4AArpvS6fhkHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by PH0PR12MB8005.namprd12.prod.outlook.com (2603:10b6:510:26c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 10:50:54 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9115.018; Tue, 16 Sep 2025
 10:50:53 +0000
Message-ID: <388ddd8a-c71c-41f1-8706-12ebeea0fc7b@nvidia.com>
Date: Tue, 16 Sep 2025 20:50:45 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [v5 06/15] mm/migrate_device: implement THP migration of zone
 device pages
To: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
Cc: damon@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
References: <20250908000448.180088-1-balbirs@nvidia.com>
 <20250908000448.180088-7-balbirs@nvidia.com>
 <d35eea42-ed32-481f-9dcf-704d22eb8706@redhat.com>
 <49039b9d-4c42-480f-a219-daf0958be28e@nvidia.com>
 <4cc2ba18-e7de-448f-aaee-043ed68dc6e3@redhat.com>
 <06a0e258-2c68-43ee-ab53-313a13ed0d68@redhat.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <06a0e258-2c68-43ee-ab53-313a13ed0d68@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0354.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::29) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|PH0PR12MB8005:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e54f6f4-83eb-484a-5473-08ddf50ee858
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|7416014|376014|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZkJuWEVxZ0J0R3c4UnE2dTdYamlBdVRZejV4d0h2NDVaZnNYeCtXQnVNSWdH?=
 =?utf-8?B?MDUwY3FzanB1N0ZDZlpPY0t4dm52cGQ0Zm9DVzZ1dHFWakFmMFVuS29WNnNo?=
 =?utf-8?B?MklKV1JPM3YwWlhuUHZBRlVNY3lsY29GL1VlY3BaUy94MFUxYVBydmFiWGRa?=
 =?utf-8?B?aGtvVzZtenFtZ0hKektsQUhCTzhRcFN2NXhaSHluQW9OZHVGUm11UU5TK2wy?=
 =?utf-8?B?bUlGR2drUVJJSmI0emZpQnBrUy8rUUt1QVdpbldtVFNwTUErUU5PWHdsV2Fv?=
 =?utf-8?B?SEFJK1Y5NnBvZnJDOXk5RGhISjFIZkFOTjJKMnY5UGQ0NG5UNkNodlVvMFFh?=
 =?utf-8?B?OUV1RXE4NkwwRGVkek9xUEg1bTdhUHFBMUZsUWJ6czNHTC9DMTZub1RKajhn?=
 =?utf-8?B?Slh1emRuNEtEK0U0dEhiOHlDcjhqSjRHUXgyeEFMRUdsUnIraVkxa3VhN3hC?=
 =?utf-8?B?WEZCY1ljLzFzSFBybnU4TEhLNXROcXFzejE0YXlXb2d3L0tCNWdjcFE3SGxJ?=
 =?utf-8?B?TTN2b1Y1anBtTXdRcGVORXRhL1k5bGVUSnhraU9xTXJrc0pjL1hPS2Q3N2JB?=
 =?utf-8?B?RWwrU3dqaUMzanZ4RmdJQWtMbnF0dE9GZWd6ZGZtQXRranpWK0U2SUhUS2tK?=
 =?utf-8?B?NytGZitCdHJIMzlnWXNPZTR0Rll5Yjg3L3FJSzVOV0hZMmhPL2d4Sm8yZHVE?=
 =?utf-8?B?SU5XTmpuazY3bnNwOFRYdFMzWkFFbHZJNi8vclpnN1ZxMmR2K0NBNVBOWW9w?=
 =?utf-8?B?MXR2QmxSbWR5UDNORFFhS2QxZWZvRkgyTm00VURPNFAvd2pXSmtIRWFWejBQ?=
 =?utf-8?B?cnVqcnEvd1RiMjVGQlBXbFhFVkRKN2d5anFXM2M3MHpEM2I5a2F1a3E0Vm04?=
 =?utf-8?B?ZzNLeUNhMG02ZlRRaWk2N2hydndNbmpKMmRBOUc0aVNxcWFmbGN2MHhrT0xG?=
 =?utf-8?B?YzNJN3VGeDdDWWVxUkErbGZDb3o4cHJVcFphRDVxRzF3NklhM0t1MlhWeFVh?=
 =?utf-8?B?T0xKeXdUN0Z4MFFEYmxabmN1Vm1Ua3lsUnl5ZmdpUUNaZm1zZGxCYWtKQ2RW?=
 =?utf-8?B?ZFBsQWgrTzVwajhHK0tHeDZMdy9pRWh2THkwWEtpeDYzOThYdEtUbHJvM01j?=
 =?utf-8?B?NFZybWZPRkZhUi9rR1ZMakVkQkR2UDhGTldOc3oxVGxidUxiR3RIc3NjRXV2?=
 =?utf-8?B?a3A4NlNuYW1qZ2RydXlvaG1kS3dUQWt5aFJYbUFqY2g3T3lkelJnZnM1d3BB?=
 =?utf-8?B?eFdJZWVjTElvSWFoNk5rblBZak5LYVJLTE9nSndPQmZpdG5CNTZTWDNBOG15?=
 =?utf-8?B?SGxReTVBS1Nhelk3U0RtbVhkemxSUnpYRmZZaGpKY2l6WXVVai9aNEY0Wldr?=
 =?utf-8?B?Q1JxVUlxL3lRK0xDbDQvRTFHYmpFYUgwNlNsM1E4MWZ5YVZ5c1JSUU5nczN2?=
 =?utf-8?B?OEkyK3B6ZVN2UXJ4QjdGa2l4MklsbGRFSkljMGpuRXJCRy8zSUFPbUc1RmVx?=
 =?utf-8?B?Rk8wU2ZrT2Iyb3dMMTZveit2YnRZTnMxYThRbEhCNWdhVWMzaEw4OVRQMkdr?=
 =?utf-8?B?dDNJSWIzQlhMQ2NYREk4cXZDbHJYbklqcEl2ejhpQXBteDlTenpTeEs3WUpF?=
 =?utf-8?B?YkFxTmV1ZFlTcy9DbzFWZkE4TkZRUTljcmszaHpHNWxmeXZSUXVYb2QxNTN5?=
 =?utf-8?B?MHlGaUhlUWZuYzM3QTl2RDdPSWkxYmdnZ0NiOWExc0V3YW5Zdm16NVUxcDVn?=
 =?utf-8?B?Y0w3TzZOV05Ha3lTVDd4dUljb0poS0N2OU1DRmY0Y1JETmVvTmFkdzBpdnk4?=
 =?utf-8?B?Wmh3RTZoTysvSUF3SzVBRU1MOVdyV0M0Q3lTTitUMkdJS0lIbWFYaHZmRHZs?=
 =?utf-8?B?VktmaUJ6L1Qyc1J3Z1VIWk01bXZPSkJMUmdEOHhONlkxemdBV0M1OStNSlZB?=
 =?utf-8?Q?Q9gGVVGiYJk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(7416014)(376014)(366016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVFjU01yNExJb3huS3lXZmpMbXVGN3dmQklPYmI2OUNPUFl1SVAya2F5ckFD?=
 =?utf-8?B?U0xVMDgvbjArbEhGU29pb0lzeUpSbmZPR3NONmVUUE1wUUxXY0o1cnowOFlB?=
 =?utf-8?B?NVI3VFZnSGRwNjlmMFlveEgyZFpCd1pyYVNFMEk0VnErM2NtOWM3ZFhlL2NG?=
 =?utf-8?B?bmVyRURPOWNGVmdaOTJOaS92UTdrbTNzNk13TUdxSUorSGZMWkJQbkkxRmsr?=
 =?utf-8?B?QUNMcWNDajcrYmNXQTdMWmhlUFcyeFNSbGhNTytibkRpdUlycVk0K3lFanlX?=
 =?utf-8?B?cW40bGxIaVBibDhNOEEzbFpodGNBdGJoRnU3R3doUGtUY2k5Rys0MThXeEZS?=
 =?utf-8?B?bU85b29kYVZKVnEwTUtlSjkrLzF2MW1CZ094YTV1b3h3NGJuN3d0WGhqbnJZ?=
 =?utf-8?B?bXpVVzlDQkh6cG9QZ2RKY0JNeDlKelNCRUNMQnZuenJ0V2NaNUVUU1lIcmox?=
 =?utf-8?B?cDVXSXZObVJDeE9lMVZFaDRGaXlqNW1iK0xHS0NGeTRkUytjNTdaR05tTE5x?=
 =?utf-8?B?c2h4WDBOR2V6WXROVTdiTTUzV0Fjb3lwS0hscFFPRXU4ZzV6bEo5K3VZbndr?=
 =?utf-8?B?UHVjTUVvMlV0M0gvVVNRdnFtM1Z2V1BWOFNxYTczRmJnWk5heWd6N1RiOGRo?=
 =?utf-8?B?L1BrTFVTTkR3Unh4YW44b1pvdFZMMlZmaGRXbDFKOExxZEFUL2V1RjVhZ1Y4?=
 =?utf-8?B?WU1sUkk0U25JRkFYVC9SZFhPdHRYT0o3WGlEZ09SaFMzL0tYRllwR0I2TUFy?=
 =?utf-8?B?RE9CR2JRWm9UZEVvYm55NERHYUtWNmkxcitqN1NNbWVtQm8zRTRaMXlDMmVk?=
 =?utf-8?B?TGpMSmpXZ2FlSVlNVnAzT2tLeGlaYWFvTzhONlVZaitrOVpZVnJTRUNSMlR2?=
 =?utf-8?B?SXpVL1RTbnl2bHZpNnVuTmFGakNwcGJ2RmY2V2RrMnBRd20xczhXQVpxSGFY?=
 =?utf-8?B?QmZZWTY3MHdZbENkME8wMGU3MVFTVnRuY3EzL05EY1dZSG5ub1dzM1QrQU9o?=
 =?utf-8?B?S1krZnVzYk1pYkZZaFBtL25lRm05MEJWT2JkZnEzRVVYSnlpejRNV0FraTl0?=
 =?utf-8?B?bWgwOE03RUZrZk9BZjVRZTRTeTF1S00xVytlc3ZFN0RZK1FqbSs0a1R1MkdX?=
 =?utf-8?B?RERmWTJGbkFiR0RZR2pTRlhFUWFYc0p5MnhoZGFSQTBWK0w5QTdtREoyVFJW?=
 =?utf-8?B?WklOZ015Y3I0UGliK05hazl3cXpWMHNsWW5KbXp2TnEvaXJKdnFqM0pJUTZw?=
 =?utf-8?B?cDZRSnhZeEF4T2RDYmxXSmtncTFhdU8zUTBNQTFHeDRDWkN4UHdTSWhHcFAv?=
 =?utf-8?B?UzJtZTdkckpoSHVnblR3TWVjRElPMkFVTmlldVZGS0dHUmdGYm95R3daNEU3?=
 =?utf-8?B?WUJ0TWpSOUxwVG1SeEZQV2M0bk4vMFFLdXRmUlNMcDExRHVEcDJEUUZBZWFN?=
 =?utf-8?B?cmh5OFMvT0hOdHVsVGlsOTQ1UXhQekVDVlJjVHNCMU5RTE1nOE80ZkZTMEMz?=
 =?utf-8?B?VThwSHVXOWF1eWlCY2xNTHJkQnRZTnlUc0kwRUpkeWFHRzNBUVBRZ0JWNlNG?=
 =?utf-8?B?R01OYlJ0N0JGOFpwaHloZFdJT1I1L3RYNW14UURzM21MWG92RThQcDlXRHVY?=
 =?utf-8?B?YkpxYk4xRmVMZjlrNjdJVXcyTkQ3c21nSVZHU1VlbG8zWU5yOHlGcE51ejBz?=
 =?utf-8?B?eXlqbGhmZGFYQlptNVNHU1l6bDRNUXEwS2FDcnNjRE4vSVdUUitkQmlETVpS?=
 =?utf-8?B?T3dlck93alhTcXl3WTBVaVYwcFQ1YzNtU3dKcjVpYld3dXRyQjJRSEJMWTBT?=
 =?utf-8?B?WjN3a3FZeHZUZUdRTGExT2E2cWRHRFBpLzFzeG9yS290K3dpYjQ1K29CMXJE?=
 =?utf-8?B?Z010Z2E2OXl5a05uT1pIZHBIMXl2Skh3REFjQm5pYitGNU1zV2xjYkhHQVJP?=
 =?utf-8?B?RTNMSllhTHQyai83ZGNmMmdkY2Y2c2JVUmpWQTl5eDNHOEM3NTFEQm5MamZv?=
 =?utf-8?B?YkxQS3ArZnZiUTJoSjlOOFVERTlwV2h5a08xOHBoZ2o2ZWZneFZualU1QzNh?=
 =?utf-8?B?S2psZTE2b1hNNzVaYkJwa3I3SlYxSzZ1M1NnVU84YlRvTlZ3aFN3dUVaZXR2?=
 =?utf-8?B?QlNRNGhGcFBVUzZxSlR5QjNvbUo1ZzhZSmRwb2FieEl5ZkxUY1dCTnVJTnpt?=
 =?utf-8?Q?il4QYyLmnGWQzlUSnj5wSTGDylFKxZBtMn3BuJ0N6XGO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e54f6f4-83eb-484a-5473-08ddf50ee858
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 10:50:53.7283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9iUoHP5YPrSXEg4NxICc/6zQsKy/l1uIBEBto47GpOQNLFANH6fWvN+jhh8mrLCxtq8kuNawiK+rItbCcnZz0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8005
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

On 9/12/25 15:38, Mika Penttilä wrote:
> 
> On 9/12/25 08:28, Mika Penttilä wrote:
> 
>> On 9/12/25 08:04, Balbir Singh wrote:
>>
>>> On 9/11/25 21:52, Mika Penttilä wrote:
>>>> sending again for the v5 thread..
>>>>
>>>> On 9/8/25 03:04, Balbir Singh wrote:
>>>>
>>>>> MIGRATE_VMA_SELECT_COMPOUND will be used to select THP pages during
>>>>> migrate_vma_setup() and MIGRATE_PFN_COMPOUND will make migrating
>>>>> device pages as compound pages during device pfn migration.
>>>>>
>>>>> migrate_device code paths go through the collect, setup
>>>>> and finalize phases of migration.
>>>>>
>>>>> The entries in src and dst arrays passed to these functions still
>>>>> remain at a PAGE_SIZE granularity. When a compound page is passed,
>>>>> the first entry has the PFN along with MIGRATE_PFN_COMPOUND
>>>>> and other flags set (MIGRATE_PFN_MIGRATE, MIGRATE_PFN_VALID), the
>>>>> remaining entries (HPAGE_PMD_NR - 1) are filled with 0's. This
>>>>> representation allows for the compound page to be split into smaller
>>>>> page sizes.
>>>>>
>>>>> migrate_vma_collect_hole(), migrate_vma_collect_pmd() are now THP
>>>>> page aware. Two new helper functions migrate_vma_collect_huge_pmd()
>>>>> and migrate_vma_insert_huge_pmd_page() have been added.
>>>>>
>>>>> migrate_vma_collect_huge_pmd() can collect THP pages, but if for
>>>>> some reason this fails, there is fallback support to split the folio
>>>>> and migrate it.
>>>>>
>>>>> migrate_vma_insert_huge_pmd_page() closely follows the logic of
>>>>> migrate_vma_insert_page()
>>>>>
>>>>> Support for splitting pages as needed for migration will follow in
>>>>> later patches in this series.
>>>>>
>>>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>>>> Cc: David Hildenbrand <david@redhat.com>
>>>>> Cc: Zi Yan <ziy@nvidia.com>
>>>>> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
>>>>> Cc: Rakie Kim <rakie.kim@sk.com>
>>>>> Cc: Byungchul Park <byungchul@sk.com>
>>>>> Cc: Gregory Price <gourry@gourry.net>
>>>>> Cc: Ying Huang <ying.huang@linux.alibaba.com>
>>>>> Cc: Alistair Popple <apopple@nvidia.com>
>>>>> Cc: Oscar Salvador <osalvador@suse.de>
>>>>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>>>>> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
>>>>> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
>>>>> Cc: Nico Pache <npache@redhat.com>
>>>>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>>>>> Cc: Dev Jain <dev.jain@arm.com>
>>>>> Cc: Barry Song <baohua@kernel.org>
>>>>> Cc: Lyude Paul <lyude@redhat.com>
>>>>> Cc: Danilo Krummrich <dakr@kernel.org>
>>>>> Cc: David Airlie <airlied@gmail.com>
>>>>> Cc: Simona Vetter <simona@ffwll.ch>
>>>>> Cc: Ralph Campbell <rcampbell@nvidia.com>
>>>>> Cc: Mika Penttilä <mpenttil@redhat.com>
>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>> Cc: Francois Dugast <francois.dugast@intel.com>
>>>>>
>>>>> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
>>>>> ---
>>>>>  include/linux/migrate.h |   2 +
>>>>>  mm/migrate_device.c     | 456 ++++++++++++++++++++++++++++++++++------
>>>>>  2 files changed, 395 insertions(+), 63 deletions(-)
>>>>>
>>>>> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
>>>>> index 1f0ac122c3bf..41b4cc05a450 100644
>>>>> --- a/include/linux/migrate.h
>>>>> +++ b/include/linux/migrate.h
>>>>> @@ -125,6 +125,7 @@ static inline int migrate_misplaced_folio(struct folio *folio, int node)
>>>>>  #define MIGRATE_PFN_VALID	(1UL << 0)
>>>>>  #define MIGRATE_PFN_MIGRATE	(1UL << 1)
>>>>>  #define MIGRATE_PFN_WRITE	(1UL << 3)
>>>>> +#define MIGRATE_PFN_COMPOUND	(1UL << 4)
>>>>>  #define MIGRATE_PFN_SHIFT	6
>>>>>  
>>>>>  static inline struct page *migrate_pfn_to_page(unsigned long mpfn)
>>>>> @@ -143,6 +144,7 @@ enum migrate_vma_direction {
>>>>>  	MIGRATE_VMA_SELECT_SYSTEM = 1 << 0,
>>>>>  	MIGRATE_VMA_SELECT_DEVICE_PRIVATE = 1 << 1,
>>>>>  	MIGRATE_VMA_SELECT_DEVICE_COHERENT = 1 << 2,
>>>>> +	MIGRATE_VMA_SELECT_COMPOUND = 1 << 3,
>>>>>  };
>>>>>  
>>>>>  struct migrate_vma {
>>>>> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
>>>>> index f45ef182287d..1dfcf4799ea5 100644
>>>>> --- a/mm/migrate_device.c
>>>>> +++ b/mm/migrate_device.c
>>>>> @@ -14,6 +14,7 @@
>>>>>  #include <linux/pagewalk.h>
>>>>>  #include <linux/rmap.h>
>>>>>  #include <linux/swapops.h>
>>>>> +#include <linux/pgalloc.h>
>>>>>  #include <asm/tlbflush.h>
>>>>>  #include "internal.h"
>>>>>  
>>>>> @@ -44,6 +45,23 @@ static int migrate_vma_collect_hole(unsigned long start,
>>>>>  	if (!vma_is_anonymous(walk->vma))
>>>>>  		return migrate_vma_collect_skip(start, end, walk);
>>>>>  
>>>>> +	if (thp_migration_supported() &&
>>>>> +		(migrate->flags & MIGRATE_VMA_SELECT_COMPOUND) &&
>>>>> +		(IS_ALIGNED(start, HPAGE_PMD_SIZE) &&
>>>>> +		 IS_ALIGNED(end, HPAGE_PMD_SIZE))) {
>>>>> +		migrate->src[migrate->npages] = MIGRATE_PFN_MIGRATE |
>>>>> +						MIGRATE_PFN_COMPOUND;
>>>>> +		migrate->dst[migrate->npages] = 0;
>>>>> +		migrate->npages++;
>>>>> +		migrate->cpages++;
>>>>> +
>>>>> +		/*
>>>>> +		 * Collect the remaining entries as holes, in case we
>>>>> +		 * need to split later
>>>>> +		 */
>>>>> +		return migrate_vma_collect_skip(start + PAGE_SIZE, end, walk);
>>>>> +	}
>>>>> +
>>>> seems you have to split_huge_pmd() for the huge zero page here in case
>>>> of !thp_migration_supported() afaics
>>>>
>>> Not really, if pfn is 0, we do a vm_insert_page (please see if (!page) line 1107) and
>>> folio  handling in migrate_vma_finalize line 1284
>> Ok actually seems it is handled by migrate_vma_insert_page() which does
>>
>>         if (!pmd_none(*pmdp)) {
>>                 if (pmd_trans_huge(*pmdp)) {
>>                         if (!is_huge_zero_pmd(*pmdp))
>>                                 goto abort;
>>                         folio_get(pmd_folio(*pmdp));
>>                         split_huge_pmd(vma, pmdp, addr);   <----- here
>>                 } else if (pmd_leaf(*pmdp))
>>                         goto abort;
>>         }
>>
> While at it, think the folio_get(pmd_folio(*pmdp)); is wrong for here,
> we split the pmd for huge zero page.
> 

Ack, will do

Thanks for the review
Balbir

