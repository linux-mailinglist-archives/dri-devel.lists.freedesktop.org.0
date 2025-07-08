Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93344AFC3DF
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 09:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E38DE10E097;
	Tue,  8 Jul 2025 07:21:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JrlhvK4a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2053.outbound.protection.outlook.com [40.107.244.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35D9510E097;
 Tue,  8 Jul 2025 07:21:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IgMTi2axSQP9gSHMQX+i4x1XOf0LCvkBHQhGZEAui/7jAp25McclxjD9Dr90BsIroRFiI57xUYrnDO/8NiuT7fzcTHlPvavyh/gDQtFWlxFHTzvfsKx40v9lPt3glLPsb7XAM+AdQQLSfw8/jwSRpz+BkxZrlpGlj/9pG1cGGa0m863q0aeGozu4xks+sa1zaxNoNjFh029ro5ym03ZkSkEuC/aVDp0GN5A8Wq61Hye5GY3aqM/Kk04YkuEgh+KByPfEOqqJJAFtTbcOdqBBy62ZoFJCgD12T+1gOchRy6KJUcHg8PwY7exXU+S+pDXtMkHISJFfIbcSfnF1KqeUDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uoOwL0SUajyFBXHpRhkB6upjAmHeijjrBXMpN3VTF1c=;
 b=fGI0i+BHp2XqRW5cuHhN7Icl7JUjPDHs0KL0L8cEFEB3HfV+igWwaxlmV6mZWp3E7MvyU3d3FNucjRcFtXFxma7RFjYVg4SFjYBqCwQQpbqWuXjiDBGg5vbZU81iDtINwYV8VeH8VlWSacdcYRcI/gW660Gkm/hjzxcKOpHRkjJ75WDAK1BiMg6N4pSMOkbHrfPOu2Ky+g9ISBKZ7tBrpBqOAmP7Sp5MsVyGiSqsEw81aZkJKFITXwodUkBgCuMrT+1hw7XmCRYYS64VhyX9LHs5M0FMOBkUw2WF8Z8UHcu4HDt9WNxQgqTFFILM4SNZaE9UKvlSFRyhcnE7AYAGDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uoOwL0SUajyFBXHpRhkB6upjAmHeijjrBXMpN3VTF1c=;
 b=JrlhvK4azYh2/1xqIt+KMCoG5yc1KmfHyhxYV2osVVW/K4e9NQjwnWnWqJY97vxkgaPF+EN90zI/TVZiZCiYZSt0MgS9SThZ1ix92HJm6QPl45iTkMJuKFlVB+uiXnntAZBC11Y4LMtvLoraoa+48Bh4iQ85r5ctntt2n59vJos=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by CH3PR12MB8753.namprd12.prod.outlook.com (2603:10b6:610:178::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Tue, 8 Jul
 2025 07:20:58 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062%4]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 07:20:57 +0000
Message-ID: <c1b724ef-5858-4873-ac98-a24775decc76@amd.com>
Date: Tue, 8 Jul 2025 09:20:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] drm/amdgpu: Add WARN_ON to the resource clear
 function
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, matthew.brost@intel.com
Cc: alexander.deucher@amd.com, stable@vger.kernel.org
References: <20250708065404.4185-1-Arunpravin.PaneerSelvam@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250708065404.4185-1-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::14) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|CH3PR12MB8753:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c34b812-9358-4012-d0a2-08ddbdeffb9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dkh0WDhlNkF2dE4zeFdnek5KWlhmYnVYR0JRb3RDd3ZacUVER21lMHZDRWsx?=
 =?utf-8?B?bjRzVTBTMWN6WkFMNW9jdm9PN0VMOGNSNjRBcGk4bFN1a1hTK2JmUXRySGdR?=
 =?utf-8?B?QUFhcWhtU2hMMnRrR2p1L3ZQK3JkL2VmL3VybEJPVVBCZytPTS9lZDF3NFFo?=
 =?utf-8?B?OW9IbEM4b0tlYnpkTmhEL2ROdjBhZXFGbUtHUDhCVTVqNzdQd3lxUEVvb1Fn?=
 =?utf-8?B?a1NvVjIrTUc4SGJGLy9OSGVwNFFRdHpHRW43MDJnR3FEMkU1RDdLOXpEeDE1?=
 =?utf-8?B?VnZHLytXZFJZOFpwQTVkbWZXMUt1VW9uM3JBdEtNYk1sMzZGNGVwNW1SNEZ2?=
 =?utf-8?B?T2hTMFRKZ21kWG1qa3JhREkzSlpmRmNwYy8yTjZ2aUlxbCtGRG9DRENncmM3?=
 =?utf-8?B?UnV1bndiYkc1ZW1rVnFGRDFJSkFWelVuY1J3VVlseTVzM2k2T3pNelphWDZn?=
 =?utf-8?B?WW9sdEtjdnNYRm92NkVjbS9zTjZDU2M1SDNubmM5Y2pmZGttSFpKOGNKN3Fn?=
 =?utf-8?B?L056VFJVZXpZQU5xZzIyZmkydnlWRXh6TWQ3YjhHbHVEL2ZxbkxmdFhOaXg2?=
 =?utf-8?B?NU5zMW5SdUxSR0NXck9kd1JEcjRIMGo3bXFyOEo2YnBaRUJ3cXNMS21VVG5t?=
 =?utf-8?B?aTg1NjlEb2V6ZzJ3YjBLVm5lT0U4QkdPbVA1Vzl4UkxBMDJJL3V4aktpdFBS?=
 =?utf-8?B?RnpDSk9ZR09semFQWjdyT0JnZGJUaVM4K0F3T1FlRVlrR1NaZ0l5ZXdlNmE0?=
 =?utf-8?B?d3FqUDE3N1BxS1R0MHVPbGJJempaaTZnMWRiaDZiTWUzazMxU0V5bEtkR2RG?=
 =?utf-8?B?d2drWE41dytyMVN3T2RLdE1HS1hadU1EYmlOTzBqcGt2OWJUUDhzYlFIUHlp?=
 =?utf-8?B?ZEFkL0F5elhLc0I4dFltUmR5OHkwTXZ1cDMzbENFNGczZzVZMGhFNUpLUThj?=
 =?utf-8?B?Rm1ROERZTkMvMEw1YzNMaFltQWc5eG8vVS9QTkVKNjJYRmtqRHcyU2JhRS9X?=
 =?utf-8?B?NmJJZ0YrbFEvT3d5NTdMMXNLMWliTDlmUHMxbnhJc29PVks3Q2c1S1RSV3hY?=
 =?utf-8?B?NnE0YWpMQ3lNeC9HUEV1VGJXZXBDQ1dZdlhTR3RwRUJETGNOQ1R6ckhtNWYx?=
 =?utf-8?B?QktXemhxblNPNkFQbVdBdElHQ3RIQXJ1eExVa0g2M1hMQnNNdk1NaTlFTVhG?=
 =?utf-8?B?dXRUbDNMNDBHL29RNFI3V0FhalV3V2Y0eVBFeUJ5ckNIWHJkRVZVTis3V2xD?=
 =?utf-8?B?S244bmx4SHR0N2QweVBuKzZjeUFFTlFRUjhiSW9IWHl5TGRPbzdRNkJWZzla?=
 =?utf-8?B?QVJPM0hhL2lVUlJHNVNMSkRnYWZDSUpicyszM1JtWEFhNW9Gckk1OHpVSFdL?=
 =?utf-8?B?ZGxzU1E1aVYrSUJFZkZiQ3FLOTc1MDF5ZG5sb1p2bVI5V3N4MExLU2lNVGdC?=
 =?utf-8?B?b3ZPU0RRc3R0ZHlCd2Rhd2R4S2hTNnZFTWxTTU8ybExuUG40bGYydHg1U3lw?=
 =?utf-8?B?WWRxM21VbXVwK2s4M0R3VFh2cWE2OHRRVHl0TmpXNU5CQ21QZUpaQ20vbkpJ?=
 =?utf-8?B?S1lYUnRDSkZKc0V5TVZ5WitiSkRLTm1RSEx1cEo2c0NYSVE0RS9wNU9vNU43?=
 =?utf-8?B?MW1QUHZ3bFZpdmxQQUJuRDkvZDdiNGtqeDNJMHJ3cWpNK2laVFY0UkZPM2Jo?=
 =?utf-8?B?aEUzRHhzV2FnZ3RrbUdBNnZQcnN4UWNUZmZ3aE5FbmFSdEgwd3Y5VlJkdVVt?=
 =?utf-8?B?VjJZS29CUE9nMTRnWjNTUUphZk1idEFmRDQ3ZTIvUXIxRnhiZGZzZk9GaDg4?=
 =?utf-8?B?TVJ6MGpIRTlPVGdvN1pOSDIrUmJ1U3lITkk1blVrdm5oemJGYnBxNUZmYWdV?=
 =?utf-8?B?NWRCZTV1eWFRMTYvK3JybDdzbm5xUmhOZk0weC9kWVppZXVZL1hZSCtmZXU4?=
 =?utf-8?Q?JpuUVDBR14o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0ROSFNBWDNEMEx5VitrQ1JSMmVBekk3Qk1MYzhSbDVnalk5OFlvclRxbTF2?=
 =?utf-8?B?VnlIWGM0SlNHam1rbCt5MWhkVWxROS96Zy9SM2dySXNWNW9yOHgrSktJdlh2?=
 =?utf-8?B?bUdXT0F4d1g2R0kycVNrQXQyNlVqTlk4NTNaRlBWMzdJVWRPSENJelVqSnhG?=
 =?utf-8?B?REtpTTdza2FpVFhOeS9ENmgxbGZVdjloT0JldndWRVdJTVl6bDgzL3FwMVcw?=
 =?utf-8?B?UFRQWVozOHRsdU1HTTNudG5RNDNvMHMySWk2Ry9EVzR3RGtqQmFsamxWUjN1?=
 =?utf-8?B?d0tibWhGWExEc0x2NFlaYTBscVg4T0hHaERQdVJLT3U2VXhRQUxBZ0owaEYy?=
 =?utf-8?B?Z2NORVFEV0p6SkNESHRHbXQyYnBuNnNBdGdNc3luKzZpWDQxS25OeTJlaFQ4?=
 =?utf-8?B?SXBwRVpiV0MrMmhndlV0Ni9iWVVBWnU4QkVRRjB4eldNbm5jandQS0MwUVpr?=
 =?utf-8?B?QVlzL3JkVnFKMS9ETjRVN3pjN1dHWDdkcVZwTDM5M3RMdnEweHNiKzgwbHQw?=
 =?utf-8?B?bEFyMUVKeEdkNDRldUF4YUY5TWo4d28reTJEa3RBUlY1aFhEcWtXTzVqanVv?=
 =?utf-8?B?NmQvdTA1cmQ1bnQrNDZyTGZSRGtrbkNXbEhWaHdsdHhCaW1uaUlRckY4L3Fz?=
 =?utf-8?B?czdIWm44ZDdIL3RmMndLSGpUUm5qakJNdWROQ2dOdkZUb0QwRU01S0lmWHVz?=
 =?utf-8?B?YWhaQUF0aVVlcEpROEhMcDN4dEFkTnNZcTlaRGtlcjIwdmo5V0pqYUpNbDM4?=
 =?utf-8?B?d2J0UWZzWFhleW80RG9TeDFaVU9GenkvVW1mV1MwbGtybE13OEFGaWJLOFJp?=
 =?utf-8?B?MnRXdms0TzRCczZsWmh6Z0FhdURpVXBqTmF0bnlwV3J1c1BibzJsN0dZaSta?=
 =?utf-8?B?MTBmc3UrR2wxZEM0VGVEdnk3RnlLNmRQQmxkQ1BGWEgvMWphN1picGRhM3d0?=
 =?utf-8?B?UHg3bU4xMDhNVm9XNkR0ZVMyMHZpWjgyRk1Ya25Ha3ZiQTRodjU1d204U21H?=
 =?utf-8?B?ZTFRRHJuRzIxTCtvNjVzTTAwRFdZbEE3TnBwUXB3cUdsNC9WazNMd2Q3TGFm?=
 =?utf-8?B?SXZmSHdMWFA3UVFUZEd5eG1ncGs2VEo5L2VXSnJTN3E4WStIaWl3NTZkTytT?=
 =?utf-8?B?NmtjK0FkZWMvdmthaHphWVJkS2JuUlhUUCtkanJ4WEVZVTUyREt3djZpZFIz?=
 =?utf-8?B?UmJqY3ZNYlgvV21XaHFoYy84VUl2OUEwVU9MMmVqcWlTc1YwYXFtaHlIL3V0?=
 =?utf-8?B?NStod3Q0VGVOY1JXV2ZaL1FYYTVyOENsY2FKMTBPSUp2VGlvMHArMXVha2Ra?=
 =?utf-8?B?NkVVK3BWRkVSR1BQb3dONVd5bEhGbXA1cmVoQXBDZTl1Zll5eDgzMkQ1aG9R?=
 =?utf-8?B?enEzQTRwMnB5VXVHN3Jvdmd5SEdHZE15MVRaTHpLenozK05jT0R0WGxVUlZI?=
 =?utf-8?B?N0xla0l2ZThCODJZdHBpVCtDbXhSQVVya2FyZVRYQzBmdVNTT1hnWWhrVnYy?=
 =?utf-8?B?cjdMejQvSGxURzFBZmtwV3VFYTNNQ0RzZnFTajJCcjIyL2FTS0t5UWY3bytO?=
 =?utf-8?B?S3ZJVnlCdlFiYk03Zmh4blFvSmpJdU5UZitCai96cUdqMko0ZVdMRnhpTWQy?=
 =?utf-8?B?bXBVb1k1U1dkbDZDVDlKYU02dFZJSVpsVzdibFdMbGRDTXRvUW85TFFhcUZ0?=
 =?utf-8?B?Z0RyOHBjUEVvSzBUbDJXdVpvSkpqYW1GdTZ4Wm9tZXVMVTFVQWJnV3V4SUJE?=
 =?utf-8?B?STlXc2pydEdBcmwzcmpOdmthREJjYlhaSHNSRGNpMFZYdzkwaktRbjV4OWJy?=
 =?utf-8?B?NkhrRnFrS2E3M3pyRXhJdVlWclJYVHIrNzY1enhDZDJiNDQ5aDhhNHcxRXl4?=
 =?utf-8?B?OEcvRHVlQVpab2diSFcwaStwWFRyZ2V2T0g3K1pLVVdFSmdIK2tPZ0UwMWtQ?=
 =?utf-8?B?bjNLQ1UzditVcFdDeG4xN29oZkNReVhVZ0U4T0dlZHVoZU5IMzhtZFllREIr?=
 =?utf-8?B?WEplZEN6VW1rSk1QNngzV2c5dWFTdS9KeDFna1V5NEVTa1cyTC9COXFPNDVY?=
 =?utf-8?B?VCs1NnlJVWNsUEZDUlIrKzNFL2Jtd0lNaUEwc2FFamFFWmZ6WnpscWNSdHpw?=
 =?utf-8?Q?caL+VLHPwFV9yo+GKcm3uIwFN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c34b812-9358-4012-d0a2-08ddbdeffb9b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 07:20:57.5809 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j1q81Cbnp7C0z4SKkNSOWkBeGuGUAYOWBCDVj/i81IqpULFiXnOXaovAF1HwBlH9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8753
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



On 08.07.25 08:54, Arunpravin Paneer Selvam wrote:
> Set the dirty bit when the memory resource is not cleared
> during BO release.
> 
> v2(Christian):
>   - Drop the cleared flag set to false.
>   - Improve the amdgpu_vram_mgr_set_clear_state() function.
> 
> v3:
>   - Add back the resource clear flag set function call after
>     being wiped during eviction (Christian).
>   - Modified the patch subject name.
> 
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Suggested-by: Christian König <christian.koenig@amd.com>

> Cc: stable@vger.kernel.org
> Fixes: a68c7eaa7a8f ("drm/amdgpu: Enable clear page functionality")

Those two lines should probably be dropped since this here is only adding a warning now.

With that done Reviewed-by: Christian König <christian.koenig@amd.com>

Regards,
Christian.

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
> index b256cbc2bc27..2c88d5fd87da 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
> @@ -66,7 +66,10 @@ to_amdgpu_vram_mgr_resource(struct ttm_resource *res)
>  
>  static inline void amdgpu_vram_mgr_set_cleared(struct ttm_resource *res)
>  {
> -	to_amdgpu_vram_mgr_resource(res)->flags |= DRM_BUDDY_CLEARED;
> +	struct amdgpu_vram_mgr_resource *ares = to_amdgpu_vram_mgr_resource(res);
> +
> +	WARN_ON(ares->flags & DRM_BUDDY_CLEARED);
> +	ares->flags |= DRM_BUDDY_CLEARED;
>  }
>  
>  #endif

