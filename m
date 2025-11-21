Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AF4C779D0
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 07:53:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7977E10E7EA;
	Fri, 21 Nov 2025 06:53:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VcUQEatU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010051.outbound.protection.outlook.com
 [52.101.193.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84FFB10E119;
 Fri, 21 Nov 2025 06:53:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PJi+pVk6EMLl0tCL1ZeA9SBu3mR1MksBZ7XfSHmxNEmO0/LMIr3A5d6tnzduyVWD6tsA3u10tLChfvFaKjTn6Tm0zoZJhb/38bk+IUHse45+12/ytEER3Vqt0rq1QUfBkJnQlTlJYKL4ER3Kv74vFpdyu68ZGamDOhOerCVpaJ2yURj8Thx/y3ilbFZwpY12cocIt5g161hwMuk0/S4kyN9W9ZqArORc4duwpGB2MIWwIQYmT8h8ZjCZzMgvNic4E4busNh5F9CHQAAol+ECX/7usGoaFR5DjYrZtsNIrCLNdnql5Rc2T8+P9XTu2UpMSrZ4vESCK9cqLK3u+5+qig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sp+2b6gLfF+iAiOl1tncvT0sm79F8rvvwf3S9b8dP10=;
 b=aUll7QdZFsd3z9LwyxWYM98jVIlTzGNTstDI2ch+l7S8PX6C5NkpUp4g1Vc7DiDjxXBp+e3BviLy7IuxenmeYKfgmSVxjP8ouavvoarIpYN+3musR85BTOhrLxs6CFPvO+6uMSxwafl/SGZbACp7gsBjCGKVTFG1WR2BInZhQM5klvA1HLsD/5WbiIM684rf6X+oIhIoKah03iFLFC7NC8YWwa2s2yvRN/i9vMtdPQfUqqAvlxRBicM30iSuVyyblhqpQhQ9B/BdPErj92leOg3UTk02oHjT71VHAtptiOxEjkJhKZ1v/Ze5O1eQTRazrcC2f4hSMCvp21hmrPtarA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sp+2b6gLfF+iAiOl1tncvT0sm79F8rvvwf3S9b8dP10=;
 b=VcUQEatUHbMHcuevEaKRISSYLCkxnNPiRE1W5Dmcc605P+UwREkAIvqTcA4oI74kZ3/fQBcybnb+jSG13KNVvxiocpbPlvcPQ5PnNglhrgdCtR6byGxyxkYeiRrRrrBRgWOGSZLjKe4Vf0Sg47g3B8VPRLV/iYvF+FDnrz29WdA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB7091.namprd12.prod.outlook.com (2603:10b6:806:2d5::17)
 by IA1PR12MB8309.namprd12.prod.outlook.com (2603:10b6:208:3fe::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 06:53:21 +0000
Received: from SA0PR12MB7091.namprd12.prod.outlook.com
 ([fe80::d759:a62b:f8ba:461d]) by SA0PR12MB7091.namprd12.prod.outlook.com
 ([fe80::d759:a62b:f8ba:461d%4]) with mapi id 15.20.9343.009; Fri, 21 Nov 2025
 06:53:20 +0000
Message-ID: <5f614997-41a5-432f-ab3c-ea1011c16dc4@amd.com>
Date: Fri, 21 Nov 2025 12:23:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Fix error handling in amdgpu_atpx_detect
To: Ma Ke <make24@iscas.ac.cn>, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 evan.quan@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
 stable@vger.kernel.org
References: <20251121014415.37964-1-make24@iscas.ac.cn>
Content-Language: en-US
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <20251121014415.37964-1-make24@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0110.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::25) To SA0PR12MB7091.namprd12.prod.outlook.com
 (2603:10b6:806:2d5::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB7091:EE_|IA1PR12MB8309:EE_
X-MS-Office365-Filtering-Correlation-Id: 220551fc-ab23-4e7a-ccf6-08de28caa830
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OUJPdW9waU5NVlBLWWRQSmdWT1lVZFRrR0dVV1NIK3g4VnpFQ1puTk9KTzI1?=
 =?utf-8?B?bEY0WUEvVGwyamR0OW5YclFtWE53bk9nQzFHSGloWnVrVUx0RTd1MlpaaFJQ?=
 =?utf-8?B?ZFdZc255ekt3RHNjTGZTYnBFaFJoVnpDbjhCbEd3QlNTd3pueFhnY2hVRnM5?=
 =?utf-8?B?WmxwMkxtZVE5Qmp4M2FWejVvK0YvQm5HMDZsamxqQStxZFRKaFlETTdDSlJx?=
 =?utf-8?B?bVF6QmFMeFhvNlMvL3dGL0o1UUlsRHl3Z01MbUs2MVMyazlRb0k0M0xVbWpp?=
 =?utf-8?B?aHdTaXVNd3duWk1GYjdPdUIwbWpIektyajcyVHRGWWx4NW9XcFMyQXpSdUVO?=
 =?utf-8?B?UEdIR0c2NGlpMHlVdUMveXFVN2FNdmlnUFpnMkFiYVFuY0F0cUg0UmRKUjFM?=
 =?utf-8?B?eDNRRWthcXZkdCt4YU9BYnV3N0o5WVFsVURFWE4zWTVpRXBPZ05xV1ZJd3Vw?=
 =?utf-8?B?amlqZGx0MzI1ZjZiVTFlZWlBRko2SC9udVFYZ2pFRWtTd0kraStId0JZMVU4?=
 =?utf-8?B?S2gxZElsVUVuSDFhQVFrTjMxSExWK2JXOGFLczBWL1pMNnBQMXhUNVJzS0xI?=
 =?utf-8?B?V1F0a052SFR3VDdrK2VEdFM4dXZ5d1p1REpFNUl4ZWlyWWsxbHhNSUZrVUdZ?=
 =?utf-8?B?eERlVytscDJLSnFWR2NuT2hIV0tobUNYUHB5VXZRblZvVERTQ2J4V0tVbUQ3?=
 =?utf-8?B?VUx2T2FpMFpIK0xqVDZkeFdaNHJyYW9PY0ZOVTdkOUM3YUNRejA3NU4rbmty?=
 =?utf-8?B?ZjdZN0dseXRhdEFwTHV3WnJ6Tk52cEdpa1l5Z2ZDbktiWkdSNVl0NUxVVXJt?=
 =?utf-8?B?T0JJalp4b1FXYlR3UWh6ZXloblBSUlNQYm1qa1AvMEJqWXZsWXp2aEhvZ001?=
 =?utf-8?B?TmFjeUU1UmVhdTkrUXFmOVpxWjV0aFFyRWtHZHpOQUVFT2JWQ0JGVjc5dHFm?=
 =?utf-8?B?aGVVVkM2TUNUUCtFMkZ2TlcyVzd6WHVzaUJLbUk0WStrMTBscVJJUXhYVFI0?=
 =?utf-8?B?aWRNaWNONGdQTy9CT0pMZ1MxeWRrU21JVDBuZmttUlZ6OHg5YlBMWUgzL0Iw?=
 =?utf-8?B?RDZseFh6VlVOUDRraGlMRzQ1dzRmR1YwZXpTbE1PRWtpRVduT0Zlb3ZZcWEy?=
 =?utf-8?B?ejIrVmFNU3V2VFZTbUM4a0ZwMHI3YmRuYlpoQ2ZCSDJacGdJbWNYOFNlVDlp?=
 =?utf-8?B?VlJvZDl6Nm5rdkhUbEVRYlMwcVl6Q0tseEdqYlRLYVd2UEFaR2xUK2g3ZldB?=
 =?utf-8?B?dHBZMWI2Y29taXNPaENnRHJRelhCNnhSVWlaK1dwV3ZXUnBzblcrSXQzOEcr?=
 =?utf-8?B?RzFBM2IzNUxzM2ZvR3F5b2s4REIyY1JHdzk4YXljMVlJRUNOcDhxQkgrV3Uz?=
 =?utf-8?B?ZHQ1RzY5b1JHakEwaWtsVi82STdocUtWa0Q2YUhRb1NSMFMwcFp1dXVRR3RW?=
 =?utf-8?B?TnhtOXJRTFlXWVBlTzFsdno2WkE1TEVscXNFVGdQUDViVDhCRFduUHFKQTZR?=
 =?utf-8?B?TmVqNERZMjRrdkkrUS8rdWdQVnlVd25jN094NFNhVmhHemhHMVY0bng4VmJT?=
 =?utf-8?B?T2htNGx6VGd6UTQyc2JRaG9zbldXUjd6TE1YVDh2Z0RiUHQxTzljZ1dqcWE2?=
 =?utf-8?B?S3l1Q0VLWkhzVkdScXczY0pNN1NxeU0xVU1ZRUNYMmZKZGVoY09kQmxhV2Jo?=
 =?utf-8?B?WEZlcDQ5Y3hCcko0V0N0R3BHbW8wOTB4bnBuSmszMCtkbkdYZjdJeks0VGNa?=
 =?utf-8?B?bE16TWJQZnFCU0JIQnlScHVJVUdmNkhZQThOSWhacE51YlgyTTMwNnZhQjk1?=
 =?utf-8?B?ZjZtU2RKSVZRbVJ5b1paemVGb3FpcGJnZytSVWtjMC9DTUxaNlJBUVZSdm1E?=
 =?utf-8?B?SVh5cG03N2x0MTZRdGJQWVN0WitsYkdPZjZJQWRqVEhPQmRENzMwVGFPbWEv?=
 =?utf-8?Q?0HxZcnLipteT2l2ou+GzKCw+gI/T6um8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB7091.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTlXaGJvdnUvYUVtcENZR0JPT1hOOGlyT1c0V0ZaZWM4UU5QMVdmOXBHcWhR?=
 =?utf-8?B?R0FFcDNFNUMzb1hHOTVNSjBCYThLUkpTdXV2emo4dXV6akdsT3F3TklzTUhC?=
 =?utf-8?B?VmlrUE9mcVJnRkZxVzVpYzBpblZqSVFFY3dZR3RQNmFuUTloOWpFVUN2WEZ5?=
 =?utf-8?B?VVlhdlNGdy9acDRiaVFxT3dCMm9vWndBY0RyajFrSDcwNnFFN1Y1MFBSaHV1?=
 =?utf-8?B?REVGUlpFNlZ4aDN2SXUrcDhtbDFOcTE2VXpaRHczZjBveUl1WXBqUWN1QWlU?=
 =?utf-8?B?NTQ3V1ZITEQzUmppNW05amZZbnhRdk9EV01pV0drTnk2TW8xazZaVnhBMzVi?=
 =?utf-8?B?Y2hZc2t2a3dna0h0d2ErU1NaZEVIa3ZDNnpmTmFta0lGRVAxWTE4YjZuMjZG?=
 =?utf-8?B?NzU1MUNaU3JrZms4ZjZEVk5LUEFyUDN0YkVKM3JWaUNlM2Q3bFFJMzRubDRH?=
 =?utf-8?B?Sk94N21DVlZYOE9rcDlrUVptcDBhOENUdHlDWTFNR0lGVXFEcjVVUVdIalN3?=
 =?utf-8?B?Z1lhMWt3M3NKTWkzUTg5VHVORi9EMWhZTU9lUHVwUE0wenladjA0bmlEZFpw?=
 =?utf-8?B?RGVsSGl3K2VlQlB0enY3amk4cG1IY1hJUUZiSmZHQlc3Q1pXOUZNKzBpNkR6?=
 =?utf-8?B?Um9HYzkvTnpxQTQ0ZisreUZ6TDFYaGhjdTVicVJmQ3JoTlRSM3g0VGNVVENN?=
 =?utf-8?B?QW5EUlp0VGxqR0x5L0szR1RCaWNlZjZRdElGTklHWmQ0MWFBenRtNjZKSXcz?=
 =?utf-8?B?RDZ6VkNTVWpKUFR6MjJKVDlUUlp5dDJqR3RGUTcxNFpSUHlEVlVJWTM3WlhH?=
 =?utf-8?B?L201dFFRSFRBZzZlTFpjVCtRbHBQc3RBRVJHSjlLSkd4NjZybzhLdGNva2Rr?=
 =?utf-8?B?eG96c0VqaHZpQ2h2RWV4N1dGV3ZUR3JEdldsREpSUkhMcWt4N09yM3MrTGJZ?=
 =?utf-8?B?U1dPNlJUNmdnSVZVbkV2eEdpa0J4NzR1SEc0dlJ2cm1pY0RTOFMrQmRvMjJO?=
 =?utf-8?B?L2JTRXdIYzF3Zlc3d1FzY3BhZ05qNEpSOXBvamJlZTJVejB6dlVFd3dHbldh?=
 =?utf-8?B?MW9wbGdGSWx0QUFXbHRhakJmZVA1Um82Ri94M0k3b2tmQXc0dUpEZWtiakRL?=
 =?utf-8?B?MU9adHRxQzJQMmtPTGozNFFFV01qTWxFTzNDb2lsNU14d1RuN1JzcTlSMmMw?=
 =?utf-8?B?TmFQemlsdCtpNEQ5MGdKL0s2djFHSFNpZ3JzeDdSUkdyMzVDVTlDWjUyTE1B?=
 =?utf-8?B?UmNiT2ZPWDNrcjNqZ0NwdGFhUlNOdVdPS0RSSDJTcjdwN1VwUVcxQ0ViUnJm?=
 =?utf-8?B?LzhqOHU4OTBzU2tzbHhtdzJ3Zi9CRVJ0NWxWWmRucXdQNm0xUmRDU0NQWnY4?=
 =?utf-8?B?djc5YWxxcFZIay9iRStOZHVCMDh4dmdpa1JJTDNTeFMzblBPRHdQcFJTNFQw?=
 =?utf-8?B?VUpkblRZSkMvVWUwb3llV0NlZGxoT29WMk0zcmRvbE52azhQQ2hUcGZmTFVE?=
 =?utf-8?B?dWNNZDlMMUljdXlSRXNtRmJHRi9LajIvZmZoelhzUTgxM1V2MGUrUlQ0eTFG?=
 =?utf-8?B?N1Y1ZlZxdjBjQmh0K0dWZkkrN0IzT2VMQnYwN3dvcjRpamxJRjdkR2U1dkNS?=
 =?utf-8?B?M0JZOHV4eTFjUnBwbk03UU1OUmNRQnQ3ZG5mN3dEdXlkejFFR3RzQnhSYm5T?=
 =?utf-8?B?eUt5OHRCVS8yWVlka01OSDhJUXFDTEdBZE9mUm90MDE3ZklRZU40bkdzNTJn?=
 =?utf-8?B?djdvR2FJWTQ1cXpuMzdxdFB5RWoyY3AvelhaMjY4UTNMb3d5aXk3WGZXU0N4?=
 =?utf-8?B?YndBSW16OWE4eTQyVmVCN3M5T3B2K2g4REhzRFlzY05FNHFtbjh4VzI1cmRp?=
 =?utf-8?B?cXZpWXBnSDZGcjR3TSt2VzZoQ0NNWGpaSUE0VGFOS2I5a1hLUkV3eE1YaHYr?=
 =?utf-8?B?NkRZRk1neW1uWGNXdzlMWUpvaHZTSmZyWU1odlk0R2k4eldDV2JxZ3lTSCta?=
 =?utf-8?B?WnBJVDlvcHhIVTBqUnUxSTRsZXVoc0hXSFp6Umh4SFdRRmZSTEFTK1lBd0Nx?=
 =?utf-8?B?dkhHaFAyRDhNWVNHSGxib2I1R09uVnpXOWt6cit0QnM4T3VSYWdPaktoZTVl?=
 =?utf-8?Q?VHiFDLx+eLgnScqAziib8yyrI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 220551fc-ab23-4e7a-ccf6-08de28caa830
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB7091.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 06:53:20.8214 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tF4JrEmSuXwWv/WjjbXGyW4Aii4VGfsez0NB+Gf2w6Q/NPp/Ba6aC3gJTOqIoDey
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8309
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



On 11/21/2025 7:14 AM, Ma Ke wrote:
> amdgpu_atpx_detect() uses pci_get_class() in two while loops to
> iterate through VGA and OTHER display class PCI devices. Each call to
> pci_get_class() increments the reference count of the returned PCI
> device. However, after the loops complete, there are no corresponding
> pci_dev_put() to decrement these reference counts.
> 
> Add pci_dev_put() after each while loop to release reference counts
> held by the last devices found in each class.
> 
> Found by code review.

This doesn't look correct. Below is the documented API behaviour.

"Iterates through the list of known PCI devices. If a PCI device is 
found with a matching class, the reference count to the device is 
incremented and a pointer to its device structure is returned. 
Otherwise, NULL is returned. A new search is initiated by passing NULL 
as the from argument. Otherwise if from is not NULL, searches continue 
from next device on the global list. The reference count for from is 
always decremented if it is not NULL."


After a device is found, it goes in as the "from" device for the next 
iteration. Then reference count of the from device is decremented. Both 
the loops continue till pdev gets to NULL. So there is nothing to put() 
after the loops are completed.

Thanks,
Lijo

> 
> Cc: stable@vger.kernel.org
> Fixes: 5d30ed3c2c74 ("Revert "drm/amdgpu: simplify ATPX detection"")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_atpx_handler.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atpx_handler.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_atpx_handler.c
> index 3893e6fc2f03..9eb776a2e8bb 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atpx_handler.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atpx_handler.c
> @@ -617,6 +617,9 @@ static bool amdgpu_atpx_detect(void)
>   		amdgpu_atpx_get_quirks(pdev);
>   	}
>   
> +	pci_dev_put(pdev);
> +	pdev = NULL;
> +
>   	while ((pdev = pci_get_class(PCI_CLASS_DISPLAY_OTHER << 8, pdev)) != NULL) {
>   		vga_count++;
>   
> @@ -627,6 +630,8 @@ static bool amdgpu_atpx_detect(void)
>   		amdgpu_atpx_get_quirks(pdev);
>   	}
>   
> +	pci_dev_put(pdev);
> +
>   	if (has_atpx && vga_count == 2) {
>   		acpi_get_name(amdgpu_atpx_priv.atpx.handle, ACPI_FULL_PATHNAME, &buffer);
>   		pr_info("vga_switcheroo: detected switching method %s handle\n",

