Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0680AC68F2
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 14:14:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6554910E1D2;
	Wed, 28 May 2025 12:14:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CpQ4w9MD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2046.outbound.protection.outlook.com [40.107.244.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D95D110E1D2;
 Wed, 28 May 2025 12:14:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NMrbqzjbtGXy2jxSD/qadFAb+/03JARz18PYUPqXy+NexddIbtnKHREjJ7ewyJme2p4is8u+RZ0+OTv7nMOl1DzCLpEFAzpn3k7Q/c+GmaUG4Q4H/SK8OrQ2crMTt+GXDYBVn9DTQpLbnWFGAciZfWvKMnw0eHnK6CiZN5lHNQ8Ewsn6JW9bhUUxD82wzL6HI1JB5u1elO9nlBD+IUm3TVhIoZ3tjaCrkl1u5mUAtlqi2sMhQWfjVK7bJsYLsOx1/tench4j/vYdXEAEkrn27QPNHY1QDJKwaPC/+Uqcf17sQepqxkqHi+PumvHJ0QhQu8niYjY0HW91TktofhP4yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eI0rcscdtb60Em4QJ5JPnAozM3PhLSNE4OhkGqO7lHM=;
 b=M0Wu03e5pFiupD9uZfSg9WjocyeIuqjrs2YzN1KCp8qG5m5nv5RSWIzBPYQc+ZfvBZel7ZvnxwQjUuN7gJCF1g68Ne7SjUlXfR5t/5EDtpylKuSbKnbXB8cHCKUGl0Sw5QdPxGvOLvmPlZxRpkM/KO+I49etGFKspVyJGlTjjKBxgRCZu/l8Tgl4XOCbqHMOhNja8gvX4+6UAmhntmFnr8nN5omiZlKuE3APFYYb+B5NhCF9YRBoC4GIxG+xXI1SM2ipocfQDCOOOf2HIEFPDlcAmDiQjZLLtUufwb6ThSiCa+TyIjozWIygxytgKcX0/rt7EaQgGERRyY5T0AUuCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eI0rcscdtb60Em4QJ5JPnAozM3PhLSNE4OhkGqO7lHM=;
 b=CpQ4w9MDuvnLOJHcdfUsDlSOh1ybcY4AukYLVPRLT8VV40qjy79kvPtcUqQFFGXPXCm6Bwm1lK2kE6RmXk+Dyt/sEzXUfmheV8MX+Qmo+XT8ogo3CWvtPSqUk/DXM2ULDY5CrzEtSdvSAi+5y3TAKdn9IVtl2OekDb1HWOTi/YU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7301.namprd12.prod.outlook.com (2603:10b6:510:222::12)
 by CY5PR12MB6550.namprd12.prod.outlook.com (2603:10b6:930:42::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Wed, 28 May
 2025 12:14:31 +0000
Received: from PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350]) by PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350%5]) with mapi id 15.20.8769.025; Wed, 28 May 2025
 12:14:29 +0000
Message-ID: <da44526e-f2b6-4486-8ede-24647869576f@amd.com>
Date: Wed, 28 May 2025 17:44:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/amdgpu: Dirty cleared blocks on allocation
To: Natalie Vock <natalie.vock@gmx.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 stable@vger.kernel.org
References: <20250527194353.8023-1-natalie.vock@gmx.de>
 <20250527194353.8023-3-natalie.vock@gmx.de>
 <89652580-5763-4f1e-abf5-d340119543f3@amd.com>
 <dbbdcada-32ae-4457-af87-1f98362461f1@gmx.de>
Content-Language: en-US
From: "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>
In-Reply-To: <dbbdcada-32ae-4457-af87-1f98362461f1@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MEWPR01CA0035.ausprd01.prod.outlook.com
 (2603:10c6:220:1e5::8) To PH8PR12MB7301.namprd12.prod.outlook.com
 (2603:10b6:510:222::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7301:EE_|CY5PR12MB6550:EE_
X-MS-Office365-Filtering-Correlation-Id: 18604709-4731-4139-3bc5-08dd9de1321c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RjhMM0VJY01BU0p5WXVKTTIxRHFVbTlJbzdmSWUzZzdmR0o3MWZEdnk5V0RF?=
 =?utf-8?B?MVFDVlF5eUFHWkJ2T1AxbHVSaTNmVkZwbUNEVjZzV3dOdWNVdlJEWTJjcWRx?=
 =?utf-8?B?bzFVbitiZnNLUWNOaEM0TlBZcUVMbzZ2MG5CdExHckRzV3BMdlppRE44ZHI4?=
 =?utf-8?B?UThaOTVQS2hNakpJaU4vRXQ0TFdTdnc4bnVpL3JmZGtURzJEQlA1T2JWMnZo?=
 =?utf-8?B?VTRTSmtTL2FHZ0VYTEtCK3JLbzFzRStxcFIwQklHWmx2YU9zbXg3amVOVE9Z?=
 =?utf-8?B?STFRSFR6VEpNeDFBTkVPa2dsY1VZd0VaWEgzOEUvdUx4N1VKL2V6ZHNMYTRp?=
 =?utf-8?B?L1NEY2pDWlBQdjcvbmVIQ3hJOXd2ZnBpbzZEYis2bWhHMVdYK1c2RW1CS0FZ?=
 =?utf-8?B?WkZCaWZ2K3Fsa00wRXdKRUhWck81eTIzVm83Q2RSQ1orU1ZaQWpUKzVidS92?=
 =?utf-8?B?eGpSZGxFNlBaV1czSHFVamxLUWdWT3VkbG94aENMQ2YvSHBKQjlEWHgrVTA2?=
 =?utf-8?B?bkpCMm5Ndk1NNkhFMWV4Sk9UQjQySU1VdGptTHFkOUFVYXNPZVRvZmk0K0Fr?=
 =?utf-8?B?VWo3b29hWENkdElHU1ZMOWI3Q2Z5SXJ0eWkybFlvZE43UnpHMEQyWUtOWlhv?=
 =?utf-8?B?TmJnbWU3aEU5eHBUd0crNUkvK2NmMDd6TzFlM2Z4bnJqK1NySGNIeW10dE9l?=
 =?utf-8?B?VHVtZCs4OWI0MlI1UHFvMklUOU54dHpaM09vR1QrckZTVnFXT3dCamxxQTgz?=
 =?utf-8?B?NGtHZWJJZU42VjY2Zk8wWjREbVBnMzhRV1lvMWgwMXpPQVJGMzhQR1VZUlNp?=
 =?utf-8?B?NkE0OGlUZTB5K1pocFh4eWZVRnVzekQwT29aVWlhMmd2anIxMW5zcUpFUk03?=
 =?utf-8?B?Q3o1WHRmWmJZYldxVGliUFdyZGJiSlh2VnJLMFE1U1BqN3JXWFRBRXJXcWdV?=
 =?utf-8?B?QzZFRjRZdHkrUDBzSkRkTWtDbmc4aWIwNENVK2h5eXpwMktjMzdvV3ltNENX?=
 =?utf-8?B?bmk1dkFZRXh1Y2F6N3A3SFZyUE8xM21McjBRbWRYRHNlZEREaDdPek9henVs?=
 =?utf-8?B?cWtud2NGQXN4V3M3ZnlERXpDSzVFU1FNL3kxTnlGQlYvajdYcFp2MWM4TVRi?=
 =?utf-8?B?SU1UMVpxTllOSjVycWpJMFZmWHlBWlNGNVlzOEFlU1hoZHdEeGhvbHdoOER1?=
 =?utf-8?B?Z1luMEZrSnRTbFF5RTJ4Q3N5dGVPV01xbHNsRWd5SEtLMWM0SzdlV2FIUm1C?=
 =?utf-8?B?MlUybGRwMy8xajMrbGhxck9zNDMrU05PVVJUUnRBL0d0S3hIcFR0SWM1Vmcx?=
 =?utf-8?B?MEdXdGdicUJXZUdmc2FEWEFnUlRYWGIwYktLZkNlTGtpQUpETDlkUVRPZWIz?=
 =?utf-8?B?QWZHV0NlU0Q1dEZTaW1hZzltdmRrSVJmMmE1V3ptS3RVQzBrM2VuWmUyK0lU?=
 =?utf-8?B?RXZHRFFvOUpZc01NcmdrTXRpTHlKUi9ZaWpqU1lKT0g4MkQzbWlkMDNlT0xn?=
 =?utf-8?B?cHcwb2RRNzhJYWhpdjgvaGdmR3o4VTViRnVoOHptaGlrcEx0K2k5dFU1RUJu?=
 =?utf-8?B?eWt1WDZEeUROZ0NyK1JoSmxJeld0N0M1WmpGZlk5RG1uZGQvbFM0ZzdEVnBv?=
 =?utf-8?B?MmwzS3lRaXJ4OTR1UTdsSzNod3NzT2RrSFR4bkFKQlNqbk5HdWh2NmRyZTBV?=
 =?utf-8?B?dWhMR1lia0VUU0JiSHkyRUExTDdWQmh4VFJxeDVNS1FkMVZPUlU1RytRd1E4?=
 =?utf-8?B?KzVSSjQyMUJKaks3ZjlzeUp0UG5yT2NrckNlNlVCcERIWUEwUDJCUmsvK3N6?=
 =?utf-8?Q?s1W1N3g6nQWIx9hqTkfLdr+6quqX2JQRr1Uxk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7301.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eElxSlB2YkFYTC9lZEo4emJheERlS05WMXNMUm96aWxKVmFsWnZZdEFyVDcx?=
 =?utf-8?B?SVpFUVM4TzErMWpVd0F4RXkwYktFQk1pWHI0aFFGdnRtQzY2MUZDYzdMRXd5?=
 =?utf-8?B?UDh6bG95S3JJS0ZGK2hJeVBoNERtUHZQVDVZRURTUDhhRHgrL0ExRCtScjFN?=
 =?utf-8?B?SnRtRVA0RzNTMHlFQmxaM2hDS1h4ODZXeXFWSjQrSTkreHdxSmVRVHVDalRN?=
 =?utf-8?B?R0NHa1NWRVB5eXkwTHhHNUtnV2lTNjNMcEl4Q0VNZE1YT2pmTm9ZdE53Q0pM?=
 =?utf-8?B?SldnSHVkOWdZZmFqR0lmT1dxeWFUZVNIdXlsd3BuUitQdTNRSDlESEljeE5Z?=
 =?utf-8?B?aFo5dnpvUXpoZ0UvT29SNGppQktqRlVpQ1dmdVRYOVFVcEpTdW10SlcrbTZK?=
 =?utf-8?B?OEF2OFRRODlUbnNqbCthQ2g4WDczaGl3SXNrb25NVzlZVnVBZnRlMGdmaTIr?=
 =?utf-8?B?Y0NVN0EzSWNZVlBYS1RlcmdtZEZFWHp4V201KytnT2RZamkxRUdpeHZqVHND?=
 =?utf-8?B?TEtHQ3A0ekdpdkl4S2VYazA4ZVdPcU1GRzl3Q0I3VUhqaDBiVWpVV1NvR3pK?=
 =?utf-8?B?SFlqQStxajl0aE1KcmRpZlFLcGpIOHl5S3oxUUpESEV2V1lqWGV5SnJKT1dE?=
 =?utf-8?B?eFBESU5Kck5sNEtCNExzQXp6UVFFSDZxQnZpazExNEtSN1JuZ202Q3FOVkw5?=
 =?utf-8?B?R3JDOEF4Rlo3UFliSTdyVEMrU3laV244STJVWmpwa3FLa2xUR3VhelNDcXg2?=
 =?utf-8?B?K3ZtZlRucEtWZlZuR3lYUXgrODBkWTNWdU44SmV1bEErejBZRWVpQUVVTXln?=
 =?utf-8?B?azF1blRVdUJYTGt5Ym82T0JMalo2VFk4Vm5rRzg2VGprSHQ3LzZwbUJ4V1hq?=
 =?utf-8?B?ZHQwT3Nyc0NQVTFCMWxIVUpENnYzR3JTT3dUc052UW5hV1ArL0dOaFNkNkd2?=
 =?utf-8?B?blJzNFRuRWRYdGkxdHJ4cXVnWVpwZE5jOWxKWDB2RGxTVnJRVHBELzIrcGdK?=
 =?utf-8?B?Z3premNuWjREanJnRVhSRVZkdGd4dWRabWE3a0ZMRGVtekpsMkc2dldVVkVC?=
 =?utf-8?B?elgrc2FhK01KcWkwSGlEZm5wNTNrazFKVTZ2eURtR1FvM1pFWis4dWhVR2Rl?=
 =?utf-8?B?YXpmaTFMcFU4bmVrTFgxb3d6dTdZWWJaVnBhK2Z4TUNhNkJYVWxuWjRVVDN1?=
 =?utf-8?B?VjZqY2RqRjJyKzZqL1NTQVdweFpsV05SSnpjMEtLdm5kelJHVVdiV29Yd0JZ?=
 =?utf-8?B?Q0EwemNuQ2RVQlk0bHZqa2NjRzFGWWdqK0dWd04rT2NQL0JzNlJ2WEdJQVJR?=
 =?utf-8?B?WEIrbnBoU1hlQVpOK2l2WTVEWXA5QjFWNCtoNGRmY2llbWR4MnUrM0xVNXQw?=
 =?utf-8?B?Y1hKdDhQWTA3SHhiQkhqVkFldlpSNDN4TXVSanF5Y3FsMjVKazlDeDd2bnpW?=
 =?utf-8?B?MGhEOFRnMENWU3FmTDRBWmd4amU5ZnBQcmF4MWl1K3ZuS2VvTEN0cnBiRS9W?=
 =?utf-8?B?R1hNbG1hNlBacG9UT1haWWo1WTM2K01QT2VRNHR5TU8xcG9SOWNsdUpiYndV?=
 =?utf-8?B?MzJMWGY5SWpGeFU4dHhNdk5QYWZPVldSU2o3Nkp6alJtR1J0MCt5QTkxTy9j?=
 =?utf-8?B?SU42M3FsMEd6N1MxaHpJYmxNOS9HVGlSdjA5NE1FRDlWem1hZTFGZHdkRDY5?=
 =?utf-8?B?THdTbHZvZG1zaDdoc2REbXpmYS9LamwxbzFad1BlZEg4RmFreXZKQTJleThT?=
 =?utf-8?B?Uyt6eXJQTlRDenNvK2Q2VlIrUXdjV3lsbjlYTXFzYUJQTS9OdWxiUDFVMVlq?=
 =?utf-8?B?aU52L0lueW80WFNZUzBVajdGaU80cUQ2Rk8vcU9CUnBzY2M3UjZ5YlFQWm9J?=
 =?utf-8?B?VWcvVGpNVHQvdndVUCt1aXJ2RVFDY1ErWGVGeG41L0d2Z1ZMTjhIUWkrOE9m?=
 =?utf-8?B?K3JMd2ljaDFyMWw1S0R4U2huclE1M29hZ3NTeWhRemVNMXpqWlZsTWhvNlVU?=
 =?utf-8?B?R2NtYkRRaVUvWlptZDl1dDRaMXpLS0Q0NmhoUjJmSjNCVlkvZk5EZjViTHR0?=
 =?utf-8?B?d0tkZGdhL1d6MnhyZHRuUnQ4dzBaRTdSU1E4VVpDTWFXWnE1T2RuUzBEeEQ2?=
 =?utf-8?Q?Wfh5tHlWVAZQoaLYWBKh6FRrb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18604709-4731-4139-3bc5-08dd9de1321c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7301.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 12:14:29.3221 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bee3BLIKSEys2Y4jXsL5DkY4e4EqJGFjZC8pEyMj8t5TUO0ocRihPtGsI/eFFvGleB9gtqAfW46J95sqigzpBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6550
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



On 5/28/2025 2:59 PM, Natalie Vock wrote:
> Hi,
>
> On 5/28/25 09:07, Christian König wrote:
>> On 5/27/25 21:43, Natalie Vock wrote:
>>> If we hand out cleared blocks to users, they are expected to write
>>> at least some non-zero values somewhere. If we keep the CLEAR bit 
>>> set on
>>> the block, amdgpu_fill_buffer will assume there is nothing to do and
>>> incorrectly skip clearing the block. Ultimately, the (still dirty) 
>>> block
>>> will be reused as if it were cleared, without any wiping of the memory
>>> contents.
>>>
>>> Most severely, this means that any buffer allocated with
>>> AMDGPU_GEM_CREATE_VRAM_CLEARED | AMDGPU_GEM_CREATE_WIPE_ON_RELEASE
>>> (which is the case for **all userspace buffers**) are neither
>>> guaranteed to contain cleared VRAM, nor are they being wiped on
>>> release, potentially leaking application memory to arbitrary other
>>> applications.
>>>
>>> Fixes: a68c7eaa7a8ff ("drm/amdgpu: Enable clear page functionality")
>>> Cc: stable@vger.kernel.org
>>>
>>> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/3812
>>>
>>> Signed-off-by: Natalie Vock <natalie.vock@gmx.de>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 7 +++++++
>>>   1 file changed, 7 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>> index 2d7f82e98df9..cecc67d0f0b8 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>> @@ -591,6 +591,13 @@ static int amdgpu_vram_mgr_new(struct 
>>> ttm_resource_manager *man,
>>>       list_for_each_entry(block, &vres->blocks, link) {
>>>           unsigned long start;
>>>   +        /*
>>> +         * Allocated blocks may be dirtied as soon as we return.
>>> +         * Mark all blocks as dirty here, otherwise we might
>>> +         * incorrectly assume the memory is still zeroed.
>>> +         */
>>> +        drm_buddy_block_set_dirty(block);
>>
>> Exactly that makes no sense.
>>
>> We need the information if it's dirty or not later while clearing the 
>> blocks. Otherwise we will clear all blocks and completely loose the 
>> advantage of the clear tracking.
>
> Right, I missed that separate clear on allocation. I was put a bit 
> off-track by assuming DRM_BUDDY_ALLOCATE_CLEARED would guarantee 
> cleared pages, when in reality it's more like a preference.
>
>>
>> So we should set them dirty as soon as we are done with the clearing.
>>
>> But the problem rather seems to be that we sometimes don't clear the 
>> buffers on release for some reason, but still set it as cleared.
>
> Yes precisely - "some reason" being the aforementioned clear flags. We 
> do always call amdgpu_clear_buffer on release, but that function will 
> perform the same checks as the clear on allocation does - that means, 
> if a block is marked clear then it will skip emitting any actual clears.

On buffer release 
[https://elixir.bootlin.com/linux/v6.15/source/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c#L1318], 
we call amdgpu_fill_buffer() and not amdgpu_clear_buffer() (in 
amdgpu_bo_release_notify() function), so the buffers are expected to be 
cleared without fail.

When the user space doesn't set the 
AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE flag and having only 
AMDGPU_GEM_CREATE_VRAM_CLEARED, we don't call this amdgpu_fill_buffer() 
and amdgpu_vram_mgr_set_cleared(), and that's kind of makes sense.
I think the problem here is, when we don't clear the buffer during BO 
release, but the flag remains as cleared and that's why these blocks are 
skipped during clear on allocation (in amdgpu_bo_create() function).

Therefore, if the release path clear is skipped for any reasons (for 
example, in case of AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE not set), we 
should set all buffer to dirty. Somehow, that is missed.

Thanks,
Arun.
>
> If we don't mark the blocks as dirty after allocating, then the 
> amdgpu_clear_buffer call on release will skip actually performing the 
> clear like it did during allocation - this is obviously really broken.
>
> After calling amdgpu_clear_buffer, we call amdgpu_vram_mgr_set_cleared 
> which causes the drm_buddy blocks to be marked as "cleared" when 
> freed. This part is correct in itself, but obviously breaks if 
> amdgpu_clear_buffer didn't actually clear the buffer. That's how the 
> dirty blocks end up in the buddy allocator as cleared ones.
>
> I'm testing a v2 that sets the dirty flags after the initial clear, 
> I'll send it once I confirmed it works.
>
> Thanks,
> Natalie
>
>>
>> Regards,
>> Christian.
>>
>>
>>> +
>>>           start = amdgpu_vram_mgr_block_start(block) +
>>>               amdgpu_vram_mgr_block_size(block);
>>>           start >>= PAGE_SHIFT;
>>
>

