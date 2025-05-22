Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6E8AC1040
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 17:49:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE8A010E187;
	Thu, 22 May 2025 15:49:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="w2jliddc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2044.outbound.protection.outlook.com [40.107.94.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3521410E0D6;
 Thu, 22 May 2025 15:49:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C7b2YpzI8ncyVPQJR0jHF0uYhHcvn/E/RB7BHTFpS2SYhkUPM8hrjCjUd87fp56Dlp5VY0p6UbIAtJri4IHUWjUJAuozFBTXfi3EHkXh40uk5jiXiB+hh2GCwcUX5vRHMuT2YQYmOG3NNy4c3pUcQSxpjucnwQft8iday+tB7WOYe3sGjviDbU4YjLUoXf2JnVrn96bTYvsv9/hoiO0F0KRVjPg7btQuP5l346aWj1HqKT4jJwfclVIwRVKgmQZWxSetK6DTlMOvBDgDmF9fAV6cM5bCHZ/an0UBpfZBY6aL0se4yyt7TIFYZDjmvEOpiVvnmAvOlz1UcRcs211JEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V4Bfbe+i/h0Q6PSlov0eTvNfsvvCrygTWDqPRI+9H8Y=;
 b=gQTMRFmuTdi5f+908/FcSn6A+W+BIsHuwX+CBXRGqE7M7H3NFyoKLJ6FscjMjp4Y/hk1VnH2CDMvPwPqLixgHX09SYQSoOe/dJlt627UgtUt0m5Z/q4ngolNzxKc2byzikGdpoviWyZY4y3HiV6SmhDUzhyQjvP6YJRdLYTm9WHzy6jXokcWGpdw8KzUP2OQ7fd39QLWVEIQlzZti8tfK5PSEjLhssZKYJffvZyvp8vLairynmZiPfbsWIq9A30G6rkYG7qG+wZrATsvPhNL7Usvy3NovZ3ArBI4KQ/TDsSUcrZg4EGmba3tFhMWQg0bPA0FCSh+Uc4O5MZAR7gVmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V4Bfbe+i/h0Q6PSlov0eTvNfsvvCrygTWDqPRI+9H8Y=;
 b=w2jliddcnmp7dYCHvyITqHejWUT97Fi5NH5YuLIsM/ZxpsCxx3yHgfKSIa0uXZOmsZ1663RXX9EZNJnyb8fppgOXbaN8M9XnudSlSwHvFVbPMdh3iZKO/gMzDSYOplq15Ziid6A4nYRtpsWaruiAiVuxCa/+Sz1g9eRVepUhd6s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DS0PR12MB8341.namprd12.prod.outlook.com (2603:10b6:8:f8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 15:49:34 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%7]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 15:49:34 +0000
Message-ID: <3bc07e60-0365-47ba-af6a-4c3e8b05ae1e@amd.com>
Date: Thu, 22 May 2025 11:49:29 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V9 00/43] Color Pipeline API w/ VKMS
To: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
Cc: Simon Ser <contact@emersion.fr>, Xaver Hugl <xaver.hugl@gmail.com>,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>, Alex Hung <alex.hung@amd.com>,
 Misyl Toad <misyl@froggi.es>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 leo.liu@amd.com, ville.syrjala@linux.intel.com, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 victoria@system76.com, daniel@ffwll.ch, uma.shankar@intel.com,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com,
 Arthur Grillo <arthurgrillo@riseup.net>
References: <20250430011115.223996-1-alex.hung@amd.com>
 <CAPj87rNUDdDEopPH+iAF-a=Or6eXH4cMRU8eOj81g_40cq8gdA@mail.gmail.com>
 <f7e9cd32-3e2b-4f06-aa13-049c8b7ba29b@amd.com>
 <CAPj87rMbcZKy2ARe_tp_-+-tMu3FpS0C9R1BHVzjsUpOsU9M4g@mail.gmail.com>
 <5921076d-0150-4e0f-a3ef-1b8dec021630@collabora.com>
 <CAFZQkGymi1XY7m0Ghs8R2HaNRQptE_0NO-5J5Z2c61gDJRho3Q@mail.gmail.com>
 <63e934e6-3c27-4128-801b-f1189f12f8f0@amd.com>
 <20250522105741.6aafc955@eldfell>
 <d1f0e3ac-a030-4763-a112-adca30e9ab08@amd.com>
 <GU-BDO4CzKoaYho7e7l7uEcE32cTt406VF-JQN50yxsvw0g6xGWuQhQDXPANhy9_71s7P6vduHxXsHned9-FCdKqEv80c7HHuNsRAdcwnKs=@emersion.fr>
 <45db460c-35b1-4618-9193-5387bdfc7766@amd.com>
 <20250522182720.4811a8ba@eldfell>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20250522182720.4811a8ba@eldfell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4P288CA0067.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d2::27) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DS0PR12MB8341:EE_
X-MS-Office365-Filtering-Correlation-Id: f43149ea-5d9a-4dae-3a72-08dd99483fec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QnBQbGs1RGxUcGIwQzVlaGhPQkpqbUVkTW56RDQ2UThMRkFpcVg3R3VpYzlY?=
 =?utf-8?B?RWF2eUpVd2ZOZlNjRzRVNzVweCtUd3dtbXljZ1RucjBSTkZFclhZd3F6dE15?=
 =?utf-8?B?Ly82dU81azZmVXhtNml5Nzloc1UyQlkzVmhXR2xiU0owc1JDVEZKUXFCb2V6?=
 =?utf-8?B?NEIwQ0s4a2MrRE0zMU8wcnExWlZGU0t5MFF2RVA5YTJOZlV3Wml6a1hQOHFW?=
 =?utf-8?B?dFhwMEh2ODRPeDJuOTN4Y0NwNzBoakk5dk9yd3N4RGN5aG9MS0VmYVVIWSsw?=
 =?utf-8?B?ZnV6VXZnOFk5b0NLZ0YxZE9PRjBGczJCOFVOMmw5dFRkVjhBbzNJNmcyOEFr?=
 =?utf-8?B?NnY1dDZaM09LalZRbGJwMlZPQkxQN2pWYjc1dmlVR1paTGNJSFpSNisxUmNy?=
 =?utf-8?B?WFZkcW5PTElGSExMbVdicVp0aEhtblVIT1RkSDZVaDdST2FFallkeUZNc1l3?=
 =?utf-8?B?NGQxYjAvQzRLb3VsYnUwQkQvcXZybjF4RVBObHpYVlJHaHFVblBLb2ZZczhB?=
 =?utf-8?B?djZtS0JjYWprd2dxUi90RFVuRkJPNzhQRXpkV1hHd2FKOGVMNVFiRm5XR3o4?=
 =?utf-8?B?eTdZcXdPZmFhcldqWXVvTnhOUEU5QVg5UEVrT1o5elRYM0w1eHpreDF2M0JQ?=
 =?utf-8?B?WUtETmpNc2NhQTZEaFJpOW5FZjNkOW5mOUtyL1FHVm1iV1NGVFNUeDltK0sv?=
 =?utf-8?B?L24rSENRWmNZVDlZdXV1ZEZyNGNFbjhXOWNvb01peTEvVDNYWkNqSkZmWEJh?=
 =?utf-8?B?QTh1cmI1TjFPMFI5b0dxSGM1U0ZGL2h1ck44dXNyMXdWRHVsd25PNTBzTWt0?=
 =?utf-8?B?UlBIN2diTThsd29USUJPWitVVitia0lxcGFlNUFnSVRSa1AzcGxyRlcwaE8z?=
 =?utf-8?B?WTdlWTd1aVNpbHBGaU1OVTFPZVZ0bjg3L1pDU250VlpRKy90MlRDZTdtS2hy?=
 =?utf-8?B?ZWNlMmdDVGVVcEVzelpid2J1S2R2bVdSajkrOWNGMk1NYlgxeGp5ZW9SeUV0?=
 =?utf-8?B?Y00zeVpFeVgvb21tNTE2WkhDV3lrMjFYN2c5dG42eHVFWWVhYURiWE5reGpR?=
 =?utf-8?B?R1VYWU00c0tvbGprV0NHSjEyMUhheWppOUhsZ2NsZ2ZZelowQ3JrVUZJdEV6?=
 =?utf-8?B?aUc1VTBDa2lMV2NqV0I0b1RHeEZVU2locXl2eWdHVjVZSUUxcG1WRFhjUkw0?=
 =?utf-8?B?QkN0N3hnTG90TkRoRFV0WVZRSllRR1cwdGhab2F0d2dsSTlhNTV3elRTSTNR?=
 =?utf-8?B?TzVNOGZ2QXhBeWFsQ0UxNElMei9NTlZmLzNIdmZyZTZCT2dSSkNkbW5makpX?=
 =?utf-8?B?Qll3bnRyUVZ1WU11RmZLb25sbkNITk9pUURJTzJWSzhnVjdOdWxJV29WMU5H?=
 =?utf-8?B?bjF1SmxGUkRNSEk2V3hNcnlBRW5jKzVsa3lMdXlEcW16TzJsWEtMcEYxWUZ2?=
 =?utf-8?B?K3lJTzVYNHAzYm53LzBTK2p1Zng5bXJxMisySlJzQnFGQTcyRlJobGtVbWFY?=
 =?utf-8?B?dTRVSmFzSjFtaWxmZ0JCa0tHcDFscEpDVHRBRWxCTFp1MS9COWdaQThYcm9z?=
 =?utf-8?B?YWtVRHRVdlRqOXgzdDRaY0JUQmJIMHJ5eXJNODNrbm13NXRyQVFQQ1ZKMDU2?=
 =?utf-8?B?dFkzam0vQkhTMWhza0cyZFNieDV3SFJUbWxBa3YramJZdmRpVXdFTFhYL3R5?=
 =?utf-8?B?M3BwdWNidjhKenJxQzN5NGJ1anhFL0NJb3loS2Q3UnBJZzhsei9qNHBUb2xJ?=
 =?utf-8?B?Y3VaVkxmdG8vbzFpVlZNdHJ0UzlrVE9ENndhK0NnTzJaS1NMSlN1SHphWDM3?=
 =?utf-8?B?cE5SZ3BZaWhVZzl3M3dheEJ2bzh3eTRWZklOaXo1L2tQVUFCa1lNZGdrSmZw?=
 =?utf-8?B?aUMzdjBVVDE1bXpEazlhZG1zSXF4ME1nNWQ5aU1jelVvVkozVmZEdzJPanNJ?=
 =?utf-8?Q?xhk0kH+oEo4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RktDZWxlc0hZUUMrdlIzUzdjRDBOaWoxc0FsNGx5a0ZKQm5yUWx5ZjR1L3Jk?=
 =?utf-8?B?Mzl5U0JtVDhlUklyN2QySTE1NEdEdEZueG80bmgzNVNYbHNvaEQ0YVR5ZFdP?=
 =?utf-8?B?cU9CR3B2d09BWWpJZld4d2p6KzZENDBLcytmNENoZjU4ZFVIY0RhNGsyTFhG?=
 =?utf-8?B?OXRndklqUjF5ajV3YTJhL3ZzTmNPKzJDdkFMUHdoK29UUjU3Z3pVUVZyelRu?=
 =?utf-8?B?ekhsMy9XV3RENFNkWUhtcGRnb2RYb0xGZlJUVDFqWGYweTZPd1FhV0xJWkZH?=
 =?utf-8?B?Wm1GN1Y0UE5qUFJFdFc2dWM4ZTlnUWxDb1VIMWZ0cW5wM1JFZHBHemdnU1Zy?=
 =?utf-8?B?Yk9nQytnb3hoT0xyRTFLZCtid2xnVE9hV0FqaTJqL0lBd0N6dlltNk5SVzFX?=
 =?utf-8?B?YlhTQkIrM2FOdHIzTXBDSVo4cVFaY0w3Z2xFQS9zWWFwTlN6OVQ0T3NYa1Vv?=
 =?utf-8?B?SmQzVHVUcEk5ZHIxV2RLMnROcURvaVpjMU9CbWxuWjlvajhQOEIzaUI4dHZB?=
 =?utf-8?B?eXQzRmpHVUlPOXZRVXVwNm9pM1Voemg5Qnc5SG95ZjRYNzJNeExRTjkrQnpo?=
 =?utf-8?B?VzdDeS9xSXErTnZJb0JCNkVmcm9pTFJRSEdUcWpIZ1BMTXhOSU0xK0VwSksy?=
 =?utf-8?B?UW9mUWljWFdHYkoxZFRIaWtqM2lyMEEveTlMeFZ4UzQvZDdEanFVbFoyN0dF?=
 =?utf-8?B?YlFxWWN3SkZjbkR1SzhDWGxyaWZKWVNWUDRPZXZQWXVDTGFEUDIraGFtRjVK?=
 =?utf-8?B?RlFDeHFQSkpGVnpoYU5YZTJ6U25wN2k2anhJaVkvL090Q3JEallNWlZoRHJt?=
 =?utf-8?B?NWRHRnl3dUgrTVIrS1QzOVNDY081VC9pVlJRenFzcGhxUGNrdDFYRXJua1NZ?=
 =?utf-8?B?QTNIVEhtcS9NVm1URWFjN0ZPNlpqTHEwMGlINEJCVjRteGN6ekQrYTVNQUhu?=
 =?utf-8?B?NkJGcFc3UHp0TUE1elJGS2dUTzUrMFFJM1R4VllCa0kzRjJjR091eVNsMGhK?=
 =?utf-8?B?ZStidk5OTnpHcmt6ZWVSTDZVMDBrbjhMeDZPV3dFV0VZM3IrSnZ1bmdaVDd6?=
 =?utf-8?B?cENkSThTM29vbHl5YnBQMHF0NGJ0TXIvNHRRdUZtb2dEZndFaTJzZFhrL1JU?=
 =?utf-8?B?M0NIL2JtNEtKaXpLaVRieVRyekloUTdHT3E2ay9oaFVEaUJhUEUzZFJ3VGFK?=
 =?utf-8?B?MWVGTnhhVGJxcW1obTRQdG44Z210WGRJN1BaNXNVVnZyV2xhdXBKejhKUHVO?=
 =?utf-8?B?a2lmSVh0WFpWa1UwSHBqNVVObVg0anhHVWNNVHFLejNEcHA4SnNhYnlMMWh3?=
 =?utf-8?B?RVJFRjhBQ0dGd1VIOSt3L0FwYkJTZ1dZeFRqcWRUc2htem5rMzNJVXJBMkFm?=
 =?utf-8?B?NVVNeFVueXdBTjA2NlAydVVmcFlFZjMzamhzU1ZBVG1WQmo0TnhCaE5nSGFx?=
 =?utf-8?B?Tmwxb1FWS2MvM1UzaHFqZnFOVFJXQWtSUWViT0l1MlhMUVpxdkVMSGtoRVBS?=
 =?utf-8?B?TEFyV2I0MSs5L2pkeEFoWUoxdzZ2cnpQUzlwU2phNHlEbklHMUs5OUxxLzRT?=
 =?utf-8?B?VzBsdWFaZm9xOUVMcm52ZXhUcWYvSWVlNEdRMXl5WGI1UXFRWXFHUDdmT0Uz?=
 =?utf-8?B?TU0rNmpMaStoYS8xV3FOdjJueko3S2VVRVREeUN4WUM3TWpwamxuUzlPR3d4?=
 =?utf-8?B?UG5TWTgxWUJQVDFYREpsYVlhRU9rMjl4Sk42R2ZOTHBHcDRNVHFnbFZpaUZi?=
 =?utf-8?B?aFNHcHJTbk9pazJSVmVGK3NSbTZZUUxiR2E3ZjdLVTZKQ0MrQjh0R0NYeDBI?=
 =?utf-8?B?NXNyUnk2T3J1V1k3eE9JTVVnVGhUUUVhbVc1TmNrQUtlSFlPT0o5YnloMmNm?=
 =?utf-8?B?OFF4eW9HeFc0RnV3b2YzSW1QSkpKZkhaU2tjQURDdFNvZlVKOW45VTI1R05P?=
 =?utf-8?B?ZUZDK1dzc09zZkhlS0lYdityeWVudjk0Z3RDZVhGeUtFbnd3bWtLSFBkaWhG?=
 =?utf-8?B?MU5hazg1dnQ3M2t5ZE1mNWdqaEIva1RRY1RPMVZ5NFZTZ2pZWHZNRkhiNDdG?=
 =?utf-8?B?cnA0ekNQdmdBZHIwQWNCVFdaRkZTZUNNZkhnY082cHBHRUQwVXBDSHBOSXhR?=
 =?utf-8?Q?3mFjTr1/lrMh9mG9uavU2mwXw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f43149ea-5d9a-4dae-3a72-08dd99483fec
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 15:49:34.7352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GLHvEzucZHaNkwU4vllr8nZv4ih6vfDfOcu/TPA/mWgKzSL9UgmJ+U19RVigYK1jk6+TSQ9asn0P2LOxTCdLeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8341
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



On 2025-05-22 11:27, Pekka Paalanen wrote:
> On Thu, 22 May 2025 09:54:50 -0400
> Harry Wentland <harry.wentland@amd.com> wrote:
> 
>> On 2025-05-22 09:49, Simon Ser wrote:
>>> On Thursday, May 22nd, 2025 at 15:28, Harry Wentland <harry.wentland@amd.com> wrote:
>>>   
>>>>>> What we should
>>>>>> do is reject YCbCr-type buffers with the color pipeline until we
>>>>>> implement support for COLOR_ENCODING and COLOR_RANGE as a new
>>>>>> CSC colorop.  
>>>>>
>>>>> Rejecting is fine, but is implementing COLOR_ENCODING and COLOR_RANGE
>>>>> really a good idea instead of making the color pipelines handle them?
>>>>>
>>>>> Wasn't the original plan to hide all such legacy plane properties when
>>>>> userspace signals color pipeline support?  
>>>>
>>>> It still is. But handling the color-space conversion via a new
>>>> colorop with two properties: COLOR_ENCODING and COLOR_RANGE
>>>> seemed to be the most straight-forward way of dealing with this.  
>>>
>>> I think everybody in this thread is suggesting that the old plane
>>> COLOR_ENCODING and COLOR_RANGE properties are rejected and will never
>>> be accepted again with the color pipeline. I think Harry is just saying
>>> that a new colorop can be introduced with encoding/range properties, but
>>> this is completely separate from the old props?
>>>   
>>
>> Correct. Thanks for clarifying.
> 
> Oh! Ok, that's cool. I thought we were talking about KMS plane
> properties and not a new colorop.
> 

My conciseness/verbosity filter just needed some tuning. :)

Harry

> 
> Thanks,
> pq

