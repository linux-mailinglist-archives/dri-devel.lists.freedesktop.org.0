Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C55AAE38A
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 16:50:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C23F10E81A;
	Wed,  7 May 2025 14:50:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="aocsHeFo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2072.outbound.protection.outlook.com [40.107.94.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 912A610E81A
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 14:50:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LQUyixlMiuUJrhUhftsFpt0cuF35QOYGmvUk8h037iL8KWRd/IwgTLz04zyzol9W3p5Vw1EefqN7r3CFPwTr8P4PAtOyMUDVgkVwJE3fcXAgUTh8n3zcuvG/D9vJBa2qHluOv5Lyu5E6qoI4pekckr4n+91Jvi9KYPtxCA9q/IaSIHYW7cW1gcHTxfgk4Nxn2+KOVeXV0muSzo9U94UXkytKxxYGldj2/+ze46Ji+uTVW8rKdQEhl5YJLMDnVjWntzu+jJAf+VwZQ79EQ1Y48fg8KgyHVDuKfMsGhHkLhOZVTrxUa5I0k4TIShrY0oAenSkIwFbAuoIxRD4DqzfnDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lwl/cGMx1co4T4Pjtfjm2Xb1F0BoE98HTa0Km3iVf7s=;
 b=c5NeRln/gYVaKoRr9WzQErkfw7yhuppVoyGLgZxJJlxMMtSu9otTvNucFq1WLm3I0u23wsGzbygbr/mISPlyoj+AKH1cdAoWDG72qHyViE506JvlQJxlhRPgWhZhI6gvPq7JRU2DobIK8VrXMWRuYitfloE78CzK0n+ZGUbePDISoO1MFtpNp91oAo/qyfP2Kt1I0b+iGi5lUsFpKO3zg8u0a1QJlSxQdn7ZcP+TOjpyv0OfKnoInkmSe1Y3uqij0Z46ptrtDJ8F+mYcbrEJ39fj9U3Ic2mbnHwpTl/6PUrp73eg4E6vhMyTMigCrOCIhgPrW65zyzoAgasVhtdylA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lwl/cGMx1co4T4Pjtfjm2Xb1F0BoE98HTa0Km3iVf7s=;
 b=aocsHeFoYAChnbMTNGhNdvgsFc+gsipUJDVFRY4CDZPD+9DXx0AYPHkIUhtRoiBo66J/X+fauzZ4LZ9atcBgmfpT+66Afm9FX1JCFh6LHS8965RS46TSeQNgOg1lKfgYBoWaBDKheOsUESw9/1oXSObLOZ7gEjcYY5EaRrjPJws=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB7414.namprd12.prod.outlook.com (2603:10b6:930:5e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Wed, 7 May
 2025 14:50:33 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8678.028; Wed, 7 May 2025
 14:50:32 +0000
Message-ID: <cab8b34a-cc21-433e-a4c1-0a25db6df798@amd.com>
Date: Wed, 7 May 2025 16:50:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 0/4] Some (drm_sched_|dma_)fence lifetime issues
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Danilo Krummrich <dakr@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Philipp Stanner
 <phasta@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250418164246.72426-1-tvrtko.ursulin@igalia.com>
 <29b27ae3-de56-475d-ae85-fd593a011ea3@amd.com>
 <e4acf86d-ff22-423d-9769-80316fa96cb5@igalia.com>
 <ff76a94e-97cd-4d19-a02b-cf2a1fc00ac8@amd.com>
 <67a89aac-5eb6-46d2-b456-32e9f3e72f09@igalia.com>
 <67697ca1-e18e-4f9e-a315-43957e71dbef@amd.com>
 <33cf57f2-230d-4bab-bab9-848b5ace9dfc@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <33cf57f2-230d-4bab-bab9-848b5ace9dfc@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB7414:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b817174-6291-4d35-9acc-08dd8d76847e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eWdVbUk1WnRIS2xmRlpYY25kVzZubjB2YnQ5TzZITUN4dVNXd0lEclRUWFpO?=
 =?utf-8?B?R3pIaGp6RlNsSGdsZkZmQVMyd3FaWEZSQWJNc0JXRGQvc1lMVDgxWDZPT0x2?=
 =?utf-8?B?TTBMb0tYYmltZ2JPUFRXR05icHNqaW5zQnFTeUFvSWFVMnpFaFIyeDI1dEcv?=
 =?utf-8?B?ZzA0by9qMTcrSlBEVUZxOTY5QlhNM3VnN2t2Y0NrRHlCb3Bzb04ycThjMmg4?=
 =?utf-8?B?bEFGZDBzMXozdXlCQVRvS0wwSTFZbit6UkJpeXpib1J2TDlFVWx3THZ0SnZT?=
 =?utf-8?B?UG44Y1U3dmxpQ2IzUHdwQU8zM2dQV1pTbWs3c05VR24zZ3MzbWd2YUhvSmNa?=
 =?utf-8?B?WmtxSDJLSVB0YkVKMUMyN1dnZnJyaXc2K2l2OFNyRFJ1d2hCakJhOENaNkEy?=
 =?utf-8?B?Tnc4Z2VyNkFUT3VVdE1LVWdYNWFVNFNMREdpZTVDUjRtVWd0ZTl5bmV5dnd4?=
 =?utf-8?B?MkRMQTFnZ2ZoNjhJeDdaclIwd2pyTmdXSnFSSk5KQjV0M2VlY0tobC9ZdVZ2?=
 =?utf-8?B?Y09RQzZITnBqQXJ0WFJHN2c4eE5WdjZjcXllNk15SXNaME5CamhVaVV1WE1J?=
 =?utf-8?B?ZlhramUveFhzbkx0czVudmJ2cFpOem1OTHEweTJ2YWF0OTFNUDRFQTJlRTVk?=
 =?utf-8?B?L29oZ1FCdTg0QVM5N2JKMzRPcGJiWVJhdzlkL00xSnd2anpzMytGNzc0OEhZ?=
 =?utf-8?B?RllDVTFWbUhHWDZGS1JtU1Y0QnRFelNGYUhIM2tDQ2toQ1VpaDNGT3RMeWdy?=
 =?utf-8?B?TnBqYzZ6ZjJSMG56Ri92SGJFczNXSGp6emFIVkd1blJxN3ZyV3ZxVjVqT2Fw?=
 =?utf-8?B?NDQ4bWs4c2RtRVJIcVJrdGh1TVVqVmJ2RUFORGZBMnZBSlpZckVGcEZEeCt4?=
 =?utf-8?B?OXJBWnNMd0xZLzRYL0hYV0F6Y2lINXN3VGFpWnFCVTE0OEhlZXFCQURsWi9i?=
 =?utf-8?B?U3JYd2Q0dG1tbEszemMwMTJFQ3RqNnkyUGhhWUsvWWRqNDNXdXc2TTg1ck1S?=
 =?utf-8?B?TXkvWFpyWVVTYmxYV2x0dVVCWk9kLzFFc2J4OVY1bHZlZlhCQzJRQWJKNlRx?=
 =?utf-8?B?eG0rSzlRaGM2N0F5dmFOMmRpeW50dFpUNnoxZVVlN0VDOUtEcFB1MFY4Lzdk?=
 =?utf-8?B?T2NzMmRKaEY2MXBDM01xTW01aVJud3p2OVFkS0VFSmpyUURuemE3MitqSmdZ?=
 =?utf-8?B?TjEvWVFwTStyQmc5bXpxK0lhM2J6QWZTZk1vbU1wOEZuZ2FIN2M3MVpBUi91?=
 =?utf-8?B?Zi9tVDhDTXJYUzRiSjlxaWQzUW0zVVlUZy9VdnI2ZC9DOTB2YnBWV2N5SFRj?=
 =?utf-8?B?NG8yZEhVT3gwL0RPMjhiUnNRTzBtOVpXZTZvRml4bHIzZFVjVEp2ajhzQzlh?=
 =?utf-8?B?Wm9BdUVGMU40QWxUa3NJeTFiRjJoY0tFUzB6SXpWc0QvYWx1ZW9lQ0hKZjEz?=
 =?utf-8?B?Ynl1VlRjWWZIZTBxdE85Kzg1cjN2MVFOdzBaRm0xa2wxOWg5UWQ4S0J0UWZX?=
 =?utf-8?B?Vk9UWEUxYzU4RHpwRlc0bHZweEtOSmptQ3M2SHAvaGFtSDdvMUFLVXRQQkFh?=
 =?utf-8?B?bEtzY0ZNeG9UT2s3QngxblJWeVVhcElDblhTbnIxMzZlUDNLL3ByYUFQbjA2?=
 =?utf-8?B?N0xwUWpSblVYR3FpV2ZSN01pZjBoalpaNUsvV1l1OFBtT3RvNmtVWkhZUzIz?=
 =?utf-8?B?bi9Xd0diZ2NUVFM2MWJ3by95OTYvVjN4bldjYVFsSEZvVnk5ZmpkdDRRVXE5?=
 =?utf-8?B?a0M1WS92cFRWOHM1V1pkUnk1TUI4MDNBTkY2cS9qbFU1ci9ieFVvVFpWbkNs?=
 =?utf-8?B?MFlBdHpJZHdwZ3NsWnZmUEJJSlpRdkprNFQ1dHhBcHc3Z1E5ZXFHdjM5ODJq?=
 =?utf-8?B?WG1PNnFnWHhNNUVIbXpmVi9oTHlNSjNDRy9VQnRtRi9YRExVSHMrSWVMRHdB?=
 =?utf-8?Q?h/JXgcTIk1I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGd6SC9pWGYrcnZvRWxkMU52am4rN0pBN2NqdGJZSVZHNHlTY0w4Q0Y1cVdl?=
 =?utf-8?B?Qk5tY2I4OHRyUC9lamVUNElCeVpQMTdxcTlQd2FMUFhJZHZJOEdnVzUwR3VD?=
 =?utf-8?B?b0RoTHlmRCtNUmdqaXRHSzVqdmR2eW4rWllhUTQvUm5iN0wxTW9HQW9MZkNl?=
 =?utf-8?B?L3NBK3ZkMUtEaDJRR01RUXBVYm11NE51L3RHdFNBYTBqQ3IwMUpzUVNlRFdS?=
 =?utf-8?B?T1VXaVA2QStqV0FsYzRkK1B4ZW90d05vZ1loK3ZzNkM4OUEwWDZZVGdPVkpY?=
 =?utf-8?B?djdMTnh4S3p3a3lEb0dzd2dUa0pKMldXYkhJU1ExZm1zRzNYb0RBTHp4bGpO?=
 =?utf-8?B?ZTB5V0owakVBWUdQMU1ZOFlEcjB6RlQrWjN5UC9xeFVtSFZveXd6Qm9Ua0lj?=
 =?utf-8?B?aVJSN1FJMlFWdnAxQ3kvcEc5ZWo3ZEJEck5OdUZhSWxQc0hiWGVPNE51ZXQy?=
 =?utf-8?B?ZlA3ckEzdjY4Rk13V0o5SElqd0FhRFNaTUFOT1RncXZnUkdnaG5zMWZYUWdL?=
 =?utf-8?B?RFUvRTMrN2xzdXVFQVkwMHNBNkRpUmY0VGt6WXJlR2RyZkZqNFA3OUxJZDdp?=
 =?utf-8?B?VGdvVk1sTzZNQkMxd0JyN1RKcnFvZFFoMlRqNFNOMUNnb2xsYkRtcUIrS3dO?=
 =?utf-8?B?aXVucHd0L3ZhYk4zNjQ5YWRVMEl3WGRhSmlIVDk3aThGdy9CbXdoRERidXRk?=
 =?utf-8?B?MWFZMW5TditMamVqU0xtRzBncFRGSTJqdTg3aWFIck9vS1EvdnZVM1NyK3pQ?=
 =?utf-8?B?Zzg5QUtRUDZVVkNPTmg3RFZhd3BXaGgreTk4WC9iNWY2N1F0VkRSUStQWk9Z?=
 =?utf-8?B?cCtBWDU3aGpkc1NwOVo1Tm1CYkx6cFhhYUVqam5HekMrcjI5K2dhR2xrNEYy?=
 =?utf-8?B?U3o3KzdDdVZ3bkVhTXpBV3VXbHNBZ3p3WUlSSUF0T3BIWURMVkpqNU4xTTJ0?=
 =?utf-8?B?bmpmdHQzeDBvOWJWVXJ3MVdrTUV5TkE1NG5QdzA3L09vYjZhamtSVS94YVo4?=
 =?utf-8?B?YVZ6dEppY1I1bGt4VEdkRjBGdUFNdEpkSWtrUXdSMUhyOXVmeEt3VnRzNysv?=
 =?utf-8?B?QUEwOEpjWWRDeitlWFdUdmdZa0JEMjBBTEFnendzeU4wL2dTYy9SVlVkOGJB?=
 =?utf-8?B?cVZ1b09BbGwrWTlPRHZXWWdMcXZZUnFza1lJTDRqbWNzNVQ0YzlWcHlCTEUw?=
 =?utf-8?B?Z0RNcVl6ZURYVXI1djB4YytKZ2RkUGZXOXVaYkhvdVBqUmE2QmVZemlxUXpR?=
 =?utf-8?B?eDkxSUJWcVEvR3pDU3VSaWU0MnRMNU54UlhnSVJsRjFRdlVKZlFFRWJLV2xp?=
 =?utf-8?B?VDdqL3lLTFd5M2lkcVhVV0lDMzlQNDNxY1IwMFVCUnJrYUg1K0VHQVd6YXdJ?=
 =?utf-8?B?SStLRFJCTitkQ2JHUWg3Y0lsZ1hRd3ZCWUo1RitGTmVMVFlxdXFzWUdFTk01?=
 =?utf-8?B?dVlKZGttTU1jNlptVXY0SDREMEdJd3JIbDVyM0JtdHFGS2JnVEhRZEdnYlRs?=
 =?utf-8?B?azNjWXVZNm9RM1JjdXFKZzZuQk9JQWMxbFBNZTgxWUMwZ2MydncyZ3RvTU5B?=
 =?utf-8?B?R1hRbmlPRkZnb2Zsb1VNcXM3RzZpeUhFZ2VjWHhkOXd3My9rZlhMK2NHNW5S?=
 =?utf-8?B?Ym9ZUEdXandhcTNPOG14V0FhNFEvS2JzM3lxNE44dVowTGhiY3pnQXJJaEo3?=
 =?utf-8?B?SzVuNHhhcDBISTRkZFlCdE9Yb3lBM3diaFo2cDRpcmI5cHAwUWp3WXV3VEdR?=
 =?utf-8?B?QWwwb2EzU0ZFWVF5eUR1Qk9PdnpmaTZoL2lEc0c1NE1UT1hvaTZIR1VXRmtn?=
 =?utf-8?B?akxPUEpxdXYxTHNsakV1bEFNMTNlZ215UnRETjNJMEc1NFliSURmNEN0amxa?=
 =?utf-8?B?L21Fa2Y0bGgycE5ISUs1TldRQ3NhMWJ3WVlYYXNyLzU5UmlWbVFpYWxXLzlK?=
 =?utf-8?B?MVpvZDlBVlhGbGJ2NXFydGdzZDZOY3dQQUpKWU5SWmRQcHAySmxCd0pUcXFX?=
 =?utf-8?B?bW5OV0laRTRSS3JWMUhKRDZyS05qSjA3TDZ1ejVoSVFrR3B0Tlh2TlZROE5Q?=
 =?utf-8?B?QVNpSE9RVkJDaVlRK3BZSlFtS3BYeWtMTkFmd2phV0Jhc1lhWm9ySVJFWG92?=
 =?utf-8?Q?9E0Le81a1QcRW0/yJJU7vrD8W?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b817174-6291-4d35-9acc-08dd8d76847e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 14:50:32.7583 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jJMj0HiyYIbPqJ7YlYQFzfZd+6PAiMacmIJLtDG/irpFRf6TkpzU9B9aIA4MpEn2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7414
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

On 5/7/25 16:07, Tvrtko Ursulin wrote:
>>> Are you thinking truly never or for as long someone has a reference?
>>
>> Truly never. It's simply a circle dependency you can never break up.
>>
>> In other words the module references the fence and the fence references the module.
> 
> Past fences being signaled? How?

See how for example amdgpu manages it's VMIDs. Basically the driver keeps an array of all the fence which every used the VMID.

When a VMID is needed the driver checks those fences and eventually frees the signaled ones until an idle VMID is found.

The problem is that freeing the old signaled fences is a lazy operation and only done when a new request comes in.

As far as I know we have tons of those use cases spread all around in different drivers.

>> When the module unloads it drops the reference to the fences ultimately freeing them.
>>
>> The only issue is that modules can both reference their own as well a foreign fences. So what can happen is that you have module A which references fences A1, A2 and B1 and module B which references B1, B2 and A2.
>>
>> Now you can't unload either module first because they cross reference their fences and unloading one would leave the other module with fences which can't be released without crashing.
>>
>> So what we need to have is that the dma_fence framework guarantees that you don't need the fence->ops nor the fence->lock pointer any more after the fence signaled.
> 
> With this option it would mean guarding all entry points with the embedded lock or you had in mind something different? Going simply by the signaled bit looks impossible to be safe.

The module can't unload until all it's fences are signaled, that's obvious.

I think it's save to assume that module unload doesn't happens right after signaling a fence, so we should be save to assume that nobody is inside the callbacks any more after some grace period.

We could use some SRCU or similar to enforce that but my gut feeling is that this would hurt more than help, especially since the code is really performance critical. 


>>> It is also a question how to "revoke" fences safely (race free). It sounds hard to me. It does not seem you got to this last problem in the above branches so I don't know if you had some elegant ideas for that.
>>>
>>> Maybe first to ask if anyone is aware of a precedent where something in the kernel already uses this design pattern?
>>
>> Of hand I don't know of any, but the problem sounds rather common to me.
> 
> Uf I don't know. Feels very atypical to me but I would be very glad to be told otherwise.

I briefly remember that Greg once kicked me because I accidentally violated some rule in the FS layer which implemented something similar for signal/polling.

E.g. you can unmount and unload a file system even if userspace is still sleeping and waiting on something.

I need to look that up again, maybe it provides a good pattern on how to solve this.

Regards,
Christian.



> 
> Regards,
> 
> Tvrtko
> 

