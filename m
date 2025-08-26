Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49018B37112
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 19:18:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA80510E080;
	Tue, 26 Aug 2025 17:18:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KSKaUMxq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2074.outbound.protection.outlook.com [40.107.94.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7B7610E080
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 17:18:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y1121tmKt6WMXKjFFEwuRTfF/57J4vzMe8nmLt0LX4gdZnX+JPJw/iQKzaMGkLKM5SDZdU2fsgy1pU0c88sMJKea5GWFfKF6334/A9HQEMo6bLN7M0WCzpsi8q2uHYTg6lUDyeaHchaj83IrUCQcpGwaZLgJ0uQR0tjeOwZYMk+Wm9nGeCnFSrckO/YH+LkbvaDvf4XM8UIYcjMmzWcc3geGUnucUpHylaT4CbgjULOUNErVabNoprfFW6GErNXUsN6krYAFfn7HHb8ii6swQEJ4vRRewmxMS/s7VpZZge14yISx1NFai0AAAXq5vy7/fL5wPbvU/PzDkUIufXjGqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I67hN73T6MavkXTyGRL4fFAGKCOEwZh3gcpc73Dxfyk=;
 b=Cmnm+ctPaD9FhSvE6/iMjz46g3o2Br1e7houtQYQk+QH/R4XyCOvEZDCwwYB4EwNAU6xPTmZgtdmgbokJJLR0QDjvYHBvgSXRBj2C4e5fROmgAuqsLWT2ST6o1C3reH+6ZiTyA5IofhCkhW9M3nam0ou7hbIBYjdIkLd0gqEOYq1Hb9rO0wkHL5sOTePdkGCeSYSwL+VQw6doaRmZ/aiS8bXZJ3ejs9vFfej3/bkqHihlKaAVWY3ENO6+C0jA2rYlWKCtBrfGe+p/7T4Uq6eJtP+mSka/zCCcQ+4nDZV+ddYR4knQELgda3zPrDciZpm6zbPLJQ+YmmVut5atNXiJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I67hN73T6MavkXTyGRL4fFAGKCOEwZh3gcpc73Dxfyk=;
 b=KSKaUMxqEw6EHhni4DSjbLT/LRRo2BzZxPoO76BLI+1R3aE5h01A3VoRt3N6i8PSSMCOLX1gy3oaXJLEuCyS61hM5Je3s+3sigV3N4PAqwiA0ffm1tK7Ny90NLMJYiOCIISLCojikBH2nhRsYStKbiWTf6aw1DJNaJjuDDL+xno=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH7PR12MB7819.namprd12.prod.outlook.com (2603:10b6:510:27f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 17:18:40 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9052.017; Tue, 26 Aug 2025
 17:18:40 +0000
Message-ID: <a9814644-96e3-456f-90b7-8705a102c938@amd.com>
Date: Tue, 26 Aug 2025 12:18:37 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] accel/amdxdna: Add ioctl DRM_IOCTL_AMDXDNA_GET_ARRAY
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, jacek.lawrynowicz@linux.intel.com,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20250822172319.377848-1-lizhi.hou@amd.com>
 <2bec1429-4f8c-472c-99a1-420a33a3d316@amd.com>
 <d6a02baa-3b05-73e6-9c2a-66c257efecc3@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <d6a02baa-3b05-73e6-9c2a-66c257efecc3@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0172.namprd04.prod.outlook.com
 (2603:10b6:806:125::27) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH7PR12MB7819:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f51a858-d5ce-4516-0a0b-08dde4c499a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TzhGSDNFMDh0bThkMkU3a09Pd2xDQXgrUUJ2c0h4T2gxWmRJT0ZWbzJoUktS?=
 =?utf-8?B?Tnh6S1llc3VGdTROeDE0NndIQUJMMHlrY20vQll6RXdaaGlscHhaM1cxdVFs?=
 =?utf-8?B?QzRGUzhhQmxESkMyYnVWNG4yVDZNaUUwMFZlT3ppMitXV2djdXE4Y2x2OVVB?=
 =?utf-8?B?NzNtais4ZllNL29rS2xrcVhvek14VThYZWRYUmJKWGxVN2Vhd253clBVdDJR?=
 =?utf-8?B?bWwyMEovTFplMkVpTEhWeVA2dVJyZTVSKzk1aDJIZDNtN1lyVUFFdklEMCty?=
 =?utf-8?B?eksvZmpPKzNmcis4MndnTFg4TmZIUGlrNmxVVjZaRWdzeXhZajE5OFBOd2pr?=
 =?utf-8?B?MDJJaER5UlRYNWJHT1BURnR0dGZzdXl6ZjFxNUU2VGpHdXUwa09TdTBxd3Np?=
 =?utf-8?B?YVBvU05JYm9vT1RwWG8xMDYyaC9BQ0lpeEt0eWovRnhLMUF0dFlNK3Q5S1dJ?=
 =?utf-8?B?dHRZNUFtRmI3Z1pMeXBJUmdqeG55WTdqTXBwTTU0Sm9HWGRaejBWRDZJbkpn?=
 =?utf-8?B?N1NXWVNxNWZzUWlkWFJnVC9BcW9qRmZnOGxYTzZDS0JCbFkraWdzYzZ3a2hm?=
 =?utf-8?B?OTk1OWNRckpuU1dPTk1kR2ozc2M5aVBRNS81dUFPd1p0N1lGeUtTZ0ZzRWo1?=
 =?utf-8?B?MERUKzJtaHhHNUpXK25yVy8zTU9HUERoaFRYWUI0d1lYVTNBN3EzeFVWbEVx?=
 =?utf-8?B?aTRKdFRGL3NHUUtuaFZ0a2RIU29ZYzNDNUVmUjJDTGVYUFBGK21YNzBXT3Nr?=
 =?utf-8?B?OFFZTnNoOHFOQUIxdXNWd2k0UWk3Y1RLTkVBYjJCQ0NSdHRQY0lqNUd3bDgw?=
 =?utf-8?B?SCtINUw0WEgyYklScy91RFlUVnkxWkhoVXlTdTBtZDNUMGxvQ2ZRR2srLzZI?=
 =?utf-8?B?Z01PVUJSQXBVS2drVHlFdllUZlhxMktTVU5SK3NuVVZ3Q2p2Ymh4Rm4yV1JX?=
 =?utf-8?B?VmIxNjg1NGkrMDg2UUJPV2lWSGg0NjRDRngxbmRrYTE3MGM0ZnFvNVE1T1No?=
 =?utf-8?B?UkFGSmhBTHNjVk04Ky8vNHZOY3pPcmg5MkkxSmNMNnc1Z0hTVzVjSUZQclgv?=
 =?utf-8?B?V1N2c2lIcnZ6TXFiTWxObnhyQUQ5RFlJcGVpa2VPc3htd3NVbHExdzZrYkpQ?=
 =?utf-8?B?c3Z6SzFjN0s2SU9zajZRdU1OSXIrOEl2TExyTlY1VFllZTRqNDhQRVQ1UWt6?=
 =?utf-8?B?SWNWOXhLVllmR0VmVGRUTFB0aXExd1RFSFhkVXh3QUpMaUNrNkNNd1A0R0ta?=
 =?utf-8?B?SHNqWGtsNGlYeXVhUThtR0R1NnFHbDFaeU95cDEyamo0amlOVFdWSE11b0Q3?=
 =?utf-8?B?S1h0Tk45TXhXd3hkQ2RzNU5SREVFMHl4SEM1Nkx4K0ZwZUlYVjk1RXZhRzND?=
 =?utf-8?B?MXlDdWlDRjAvTEx2Z3ZwaVhpWlpkM0Vxcy9ISkNSY2xmczBkUDlja0tLZ3RS?=
 =?utf-8?B?ZWZCaWZHYnBHS1JBRk5FVm9UdU5IYWFMOE84bWR2SFVWYjgyOHdkaHU1OUNi?=
 =?utf-8?B?UmorcHdsL1lydkt0TGdoaDZMczhSeHA2UzlzbC8yb0JrU2FvS3BuSEpDZjhk?=
 =?utf-8?B?WnBOc1JBN0pEZklTdGlxRnRhVkZFWWg0RTIvUUlkL1dLbmwvTTlZY1ZsOVV4?=
 =?utf-8?B?Y3hnNTZIK1JJcnhTdWNiS0M5cDNjY3dyM2hnRGFvbHZpMng4N2lua284Vzkv?=
 =?utf-8?B?OVFTM0x2Sk5hem9wbDB4THlVV0MzR0pxZGRnYW1URndXdEl4KzA5VTJCcVFx?=
 =?utf-8?B?VnlzSFVTd3Q0Mk5VK3FsWnk4V0dSOFpvTXEzdlN5L0RtR1BTNmNvZWZyRnYx?=
 =?utf-8?B?U2MxSnBvUFYxYWxkcWJNVnZ4Y3Ztb1lRMFVBaEVrMHlUeHExemh0QWZXZkpw?=
 =?utf-8?B?ak8zVWIxOFY4QXcxMVlENUVmL2ZianhsWERJZUo5MDJRd0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkNseVhMTjdKMVhOQUMwb2FqZ2UxUlV0a2tlTlhyOGM4eExISWh2RmdnQUJw?=
 =?utf-8?B?Ti9XTVM3RmQvQisxZXRkVktsMzNxRi94SW05SC9BcmROM2ZYK3FNa1Z4WUtz?=
 =?utf-8?B?YU5EejFaUUJqb0dBVnFyQ2VLL0I3QVB0S2F4TnFwVEJ6clNNVFdaZjc5ak8r?=
 =?utf-8?B?a3ZQeGVOeEo5Vlo5UkRQNDl5WHBPNjd3RVg3YWpLZ0h1bk1ybzVzMTVKYStM?=
 =?utf-8?B?UjFheGJvOHhwWEM5VjVzSk9vRWgvR1BmSHNCdWxBeThodGxNbXN0YUx3SkJj?=
 =?utf-8?B?WFZaMTN6RUhXeUhSdG1JRHE1a0Q0YXIwQTJ1RzBDeWdFT0xQakNhNDlBNmRz?=
 =?utf-8?B?eGJDcHl3MTlGQ2I2RXlDNmdySFFHVUhTZ3huaWRVQkFXR0ExdkRXMzVSNktw?=
 =?utf-8?B?cVN1d21rQkczWHZNMXBiZUNCcUZtMzkrYUFLcDlmRWdxODhsQnEyWnlNc0FF?=
 =?utf-8?B?N1drR2J2aFBqdkw1eG9yMGZvRm85bVNBd2t5d1ppbisyTllWWjJVNXJ3NmZ6?=
 =?utf-8?B?SGw1UVhJRHpLaS9yWE56emxYT3p5S1R2NXY3UTRUNHJQK2dYbUNTOFNuQTR6?=
 =?utf-8?B?NVUzSU5BOHlYdVY3OUNIWWVnZWpIVU0zRnBmcVZvUWxXdE9jSHFxcEFHN29k?=
 =?utf-8?B?akVBRkRMUnhvM0tUQmZuNE9WWUpOVFlEa2piWXdhY3VkQmlOakVtUWQzMVhp?=
 =?utf-8?B?WDF4RUFicERnWnNtK0J6TUc0dUh1dkorVGhYdjNTZE14WmhNcGVDQVVkTXpV?=
 =?utf-8?B?TElCKzJ4VC9PZjdoeHZEMnEwT3F1blZDalNLelo4eVRMVnltdzRjcXBhcVBW?=
 =?utf-8?B?aDNmczZLM01yODBUT1FTQUlVcFJpZncxbm0xUHR1UHpscE5zbHZVNnFybHp5?=
 =?utf-8?B?OGYrdzhXMndLMmpTSnZqenpUWXVrU2x5STlxSEU0elN1clhiOWdaMXgwYzY0?=
 =?utf-8?B?bXg5TkJ5NmMzbk1EMlFjR3BaT2dybHdFQkthamhkKzAxUE02aDE1aTNDdk1H?=
 =?utf-8?B?RGM5OGV1YVNQVmloaGhxZUlhbTY4L1JjNDVJWnlnc1J6ZTF1dGlPWGxhV3Yw?=
 =?utf-8?B?YXpnZEVmdXZYc1E0UkRJUytnUytlSEJERTZDWFFtRVB4TGVaWEhRbHpMcDBy?=
 =?utf-8?B?cHRTblFaQWtPRmJDSzRFdE1wYWU3c1JlR3JNeGtyamd4eDRZcVdyZkpEV1RR?=
 =?utf-8?B?N3JKT2lIUGUvMGZNVVhidUdibTVZMDNWVDVZcitPKzVSNEszaXVaWEIvVm8r?=
 =?utf-8?B?WURybjlRbmZVWUl2d0F4RHBvY3RGYUM4bDR4MHJNS3A0d2laR3d2L1FHUW1I?=
 =?utf-8?B?MmNYMEJGRVFHeStOZG9YRUl5NkVsOXl6dTRicGVqakRmbGhDTnkzL0tyek9r?=
 =?utf-8?B?ZVduT0FxZ28wNDl5UHN1TThUdnhkM3ZaN1p3RFA1bjhSZzY4ZHE5ZXQrNHhT?=
 =?utf-8?B?Zzc1Y2VNUGM3cytMS1hkTnhnWlk5NlJRNy9LVGxXVmxURmJwTXRiVUo3NWFo?=
 =?utf-8?B?L1Uwc0xsR2d0YmlBcU55dGJCbVRTWnFNWjFoKzhXMlYwSytoSVYxVFMwUHAr?=
 =?utf-8?B?bDJqcTBjWWMzRjBZM2ZTV3UrdGovQ3pCVkFOMDJZN3pBeEdRbGRWdkpPRUt0?=
 =?utf-8?B?QWFBanQ3SDN1emxOSlJvTnlkRHUxNnI5UTZEeUVKYUU5RG1ZQmpRZVkwRCs3?=
 =?utf-8?B?SEMxR0NSMzdvemJWSnFmRmt0VGtxUHpUaUZ4bFBhbjNiRVczdXVZbDhENWNp?=
 =?utf-8?B?ZVJJanZIaWlEdWIwZ0V6R0tkMDdUY2duemhwcUxKOUltT1RRTkdBWktKODRw?=
 =?utf-8?B?c2wzZ29tRGw1aFYxT2s3MTNsTjFFUW9uQVFnYk1IbEJrZWpHSFlsdkV2ekxJ?=
 =?utf-8?B?WGFnYVR2ZXNFeURvZnZxRk15UHBLN1VQV0pveFp2S3ZWb3ZrdjNvbVNEczBZ?=
 =?utf-8?B?dVZzV3F3NTRiT0FkYkRGNlY2TVdmRjdmS0RCdlkvZGt3d01NbmJNWUZpSVF2?=
 =?utf-8?B?NXlHeWc0U096TitOQThxNzB0VG5ITTQzNHZ1RGY2SUJMSUpxVVJ1N2V3MXZO?=
 =?utf-8?B?M1U2c21UbmVRbjJ6SUVkWDBrSzVRWWVXaTBjSFNhbTRwYWhONjBCVE12Ujlu?=
 =?utf-8?Q?AyUgCal4OLwLUXWgfS6Hp+7Rl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f51a858-d5ce-4516-0a0b-08dde4c499a2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 17:18:40.1033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ImUbD2eMOdefFbqoFG3ebCJSIvXxGjkblCOxVH6enxk3oASVFlTpBebxTDHcn3eWO2CJN3Myu3dTfsPi1LQbQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7819
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

On 8/25/2025 11:48 PM, Lizhi Hou wrote:
> 
> On 8/25/25 14:28, Mario Limonciello wrote:
>> On 8/22/2025 12:23 PM, Lizhi Hou wrote:
>>> Add interface for applications to get information array. The application
>>> provides a buffer pointer along with information type, maximum number of
>>> entries and maximum size of each entry. The buffer may also contain 
>>> match
>>> conditions based on the information type. After the ioctl completes, the
>>> actual number of entries and entry size are returned.
>>>
>>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>>
>> How does userspace discover whether or not the new IOCTL call is 
>> supported?  Just a test call?
> The kernel header version will be used to determine whether the 
> application which uses new IOCTL will be compiled or not.
> 

But it's not actually an application compile time decision, it's a 
runtime decision.  IE I can compile an application with the headers on 
kernel 6.18 that has this, but if I try to run it on 6.15 it's going to 
barf.

To some extent that comes with the territory, but I'm wondering if a 
better solution going forward would be for there to be a dedicated 
version command that you bump.

That way applications can call the version command and if it fails you 
know it's an old version pre-version command (and likely pre-this 
command).  If it responds with a valid number you can know what commands 
went with what number.

> Thanks,
> 
> Lizhi
> 
>>
>>> ---
>>>   drivers/accel/amdxdna/aie2_pci.c        | 114 ++++++++++++++++++------
>>>   drivers/accel/amdxdna/amdxdna_pci_drv.c |  21 +++++
>>>   drivers/accel/amdxdna/amdxdna_pci_drv.h |   1 +
>>>   include/uapi/drm/amdxdna_accel.h        | 109 ++++++++++++++++++++++
>>>   4 files changed, 220 insertions(+), 25 deletions(-)
>>>
>>> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/ 
>>> amdxdna/aie2_pci.c
>>> index 16ac0cab4f44..b8bfc0700798 100644
>>> --- a/drivers/accel/amdxdna/aie2_pci.c
>>> +++ b/drivers/accel/amdxdna/aie2_pci.c
>>> @@ -785,10 +785,11 @@ static int aie2_get_clock_metadata(struct 
>>> amdxdna_client *client,
>>>     static int aie2_hwctx_status_cb(struct amdxdna_hwctx *hwctx, void 
>>> *arg)
>>>   {
>>> -    struct amdxdna_drm_query_hwctx __user *buf, *tmp __free(kfree) = 
>>> NULL;
>>> -    struct amdxdna_drm_get_info *get_info_args = arg;
>>> +    struct amdxdna_drm_hwctx_entry __user *buf, *tmp __free(kfree) = 
>>> NULL;
>>> +    struct amdxdna_drm_get_array *array_args = arg;
>>> +    u32 size;
>>>   -    if (get_info_args->buffer_size < sizeof(*tmp))
>>> +    if (!array_args->num_element)
>>>           return -EINVAL;
>>>         tmp = kzalloc(sizeof(*tmp), GFP_KERNEL);
>>> @@ -801,14 +802,23 @@ static int aie2_hwctx_status_cb(struct 
>>> amdxdna_hwctx *hwctx, void *arg)
>>>       tmp->num_col = hwctx->num_col;
>>>       tmp->command_submissions = hwctx->priv->seq;
>>>       tmp->command_completions = hwctx->priv->completed;
>>> -
>>> -    buf = u64_to_user_ptr(get_info_args->buffer);
>>> -
>>> -    if (copy_to_user(buf, tmp, sizeof(*tmp)))
>>> +    tmp->pasid = hwctx->client->pasid;
>>> +    tmp->priority = hwctx->qos.priority;
>>> +    tmp->gops = hwctx->qos.gops;
>>> +    tmp->fps = hwctx->qos.fps;
>>> +    tmp->dma_bandwidth = hwctx->qos.dma_bandwidth;
>>> +    tmp->latency = hwctx->qos.latency;
>>> +    tmp->frame_exec_time = hwctx->qos.frame_exec_time;
>>> +    tmp->state = AMDXDNA_HWCTX_STATE_ACTIVE;
>>> +
>>> +    buf = u64_to_user_ptr(array_args->buffer);
>>> +    size = min(sizeof(*tmp), array_args->element_size);
>>> +
>>> +    if (copy_to_user(buf, tmp, size))
>>>           return -EFAULT;
>>>   -    get_info_args->buffer += sizeof(*tmp);
>>> -    get_info_args->buffer_size -= sizeof(*tmp);
>>> +    array_args->buffer += size;
>>> +    array_args->num_element--;
>>>         return 0;
>>>   }
>>> @@ -816,23 +826,24 @@ static int aie2_hwctx_status_cb(struct 
>>> amdxdna_hwctx *hwctx, void *arg)
>>>   static int aie2_get_hwctx_status(struct amdxdna_client *client,
>>>                    struct amdxdna_drm_get_info *args)
>>>   {
>>> +    struct amdxdna_drm_get_array array_args;
>>>       struct amdxdna_dev *xdna = client->xdna;
>>> -    struct amdxdna_drm_get_info info_args;
>>>       struct amdxdna_client *tmp_client;
>>>       int ret;
>>>         drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
>>>   -    info_args.buffer = args->buffer;
>>> -    info_args.buffer_size = args->buffer_size;
>>> -
>>> +    array_args.element_size = sizeof(struct amdxdna_drm_query_hwctx);
>>> +    array_args.buffer = args->buffer;
>>> +    array_args.num_element = args->buffer_size / 
>>> array_args.element_size;
>>>       list_for_each_entry(tmp_client, &xdna->client_list, node) {
>>> -        ret = amdxdna_hwctx_walk(tmp_client, &info_args, 
>>> aie2_hwctx_status_cb);
>>> +        ret = amdxdna_hwctx_walk(tmp_client, &array_args,
>>> +                     aie2_hwctx_status_cb);
>>>           if (ret)
>>>               break;
>>>       }
>>>   -    args->buffer_size = (u32)(info_args.buffer - args->buffer);
>>> +    args->buffer_size -= (u32)(array_args.buffer - args->buffer);
>>>       return ret;
>>>   }
>>>   @@ -876,6 +887,58 @@ static int aie2_get_info(struct amdxdna_client 
>>> *client, struct amdxdna_drm_get_i
>>>       return ret;
>>>   }
>>>   +static int aie2_query_ctx_status_array(struct amdxdna_client *client,
>>> +                       struct amdxdna_drm_get_array *args)
>>> +{
>>> +    struct amdxdna_drm_get_array array_args;
>>> +    struct amdxdna_dev *xdna = client->xdna;
>>> +    struct amdxdna_client *tmp_client;
>>> +    int ret;
>>> +
>>> +    drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
>>> +
>>> +    array_args.element_size = min(args->element_size,
>>> +                      sizeof(struct amdxdna_drm_hwctx_entry));
>>> +    array_args.buffer = args->buffer;
>>> +    array_args.num_element = args->num_element * args->element_size /
>>> +                array_args.element_size;
>>> +    list_for_each_entry(tmp_client, &xdna->client_list, node) {
>>> +        ret = amdxdna_hwctx_walk(tmp_client, &array_args,
>>> +                     aie2_hwctx_status_cb);
>>> +        if (ret)
>>> +            break;
>>> +    }
>>> +
>>> +    args->element_size = array_args.element_size;
>>> +    args->num_element = (u32)((array_args.buffer - args->buffer) /
>>> +                  args->element_size);
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +static int aie2_get_array(struct amdxdna_client *client,
>>> +              struct amdxdna_drm_get_array *args)
>>> +{
>>> +    struct amdxdna_dev *xdna = client->xdna;
>>> +    int ret, idx;
>>> +
>>> +    if (!drm_dev_enter(&xdna->ddev, &idx))
>>> +        return -ENODEV;
>>> +
>>> +    switch (args->param) {
>>> +    case DRM_AMDXDNA_HW_CONTEXT_ALL:
>>> +        ret = aie2_query_ctx_status_array(client, args);
>>> +        break;
>>> +    default:
>>> +        XDNA_ERR(xdna, "Not supported request parameter %u", args- 
>>> >param);
>>> +        ret = -EOPNOTSUPP;
>>> +    }
>>> +    XDNA_DBG(xdna, "Got param %d", args->param);
>>> +
>>> +    drm_dev_exit(idx);
>>> +    return ret;
>>> +}
>>> +
>>>   static int aie2_set_power_mode(struct amdxdna_client *client,
>>>                      struct amdxdna_drm_set_state *args)
>>>   {
>>> @@ -925,15 +988,16 @@ static int aie2_set_state(struct amdxdna_client 
>>> *client,
>>>   }
>>>     const struct amdxdna_dev_ops aie2_ops = {
>>> -    .init           = aie2_init,
>>> -    .fini           = aie2_fini,
>>> -    .resume         = aie2_hw_resume,
>>> -    .suspend        = aie2_hw_suspend,
>>> -    .get_aie_info   = aie2_get_info,
>>> -    .set_aie_state    = aie2_set_state,
>>> -    .hwctx_init     = aie2_hwctx_init,
>>> -    .hwctx_fini     = aie2_hwctx_fini,
>>> -    .hwctx_config   = aie2_hwctx_config,
>>> -    .cmd_submit     = aie2_cmd_submit,
>>> +    .init = aie2_init,
>>> +    .fini = aie2_fini,
>>> +    .resume = aie2_hw_resume,
>>> +    .suspend = aie2_hw_suspend,
>>> +    .get_aie_info = aie2_get_info,
>>> +    .set_aie_state = aie2_set_state,
>>> +    .hwctx_init = aie2_hwctx_init,
>>> +    .hwctx_fini = aie2_hwctx_fini,
>>> +    .hwctx_config = aie2_hwctx_config,
>>> +    .cmd_submit = aie2_cmd_submit,
>>>       .hmm_invalidate = aie2_hmm_invalidate,
>>> +    .get_array = aie2_get_array,
>>>   };
>>> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/ 
>>> amdxdna/amdxdna_pci_drv.c
>>> index 8ef5e4f27f5e..ee89485299bc 100644
>>> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
>>> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
>>> @@ -164,6 +164,26 @@ static int amdxdna_drm_get_info_ioctl(struct 
>>> drm_device *dev, void *data, struct
>>>       return ret;
>>>   }
>>>   +static int amdxdna_drm_get_array_ioctl(struct drm_device *dev, 
>>> void *data,
>>> +                       struct drm_file *filp)
>>> +{
>>> +    struct amdxdna_client *client = filp->driver_priv;
>>> +    struct amdxdna_dev *xdna = to_xdna_dev(dev);
>>> +    struct amdxdna_drm_get_array *args = data;
>>> +    int ret;
>>> +
>>> +    if (!xdna->dev_info->ops->get_array)
>>> +        return -EOPNOTSUPP;
>>> +
>>> +    if (args->pad || !args->num_element)
>>> +        return -EINVAL;
>>> +
>>> +    mutex_lock(&xdna->dev_lock);
>>> +    ret = xdna->dev_info->ops->get_array(client, args);
>>> +    mutex_unlock(&xdna->dev_lock);
>>> +    return ret;
>>> +}
>>> +
>>>   static int amdxdna_drm_set_state_ioctl(struct drm_device *dev, void 
>>> *data, struct drm_file *filp)
>>>   {
>>>       struct amdxdna_client *client = filp->driver_priv;
>>> @@ -195,6 +215,7 @@ static const struct drm_ioctl_desc 
>>> amdxdna_drm_ioctls[] = {
>>>       DRM_IOCTL_DEF_DRV(AMDXDNA_EXEC_CMD, 
>>> amdxdna_drm_submit_cmd_ioctl, 0),
>>>       /* AIE hardware */
>>>       DRM_IOCTL_DEF_DRV(AMDXDNA_GET_INFO, amdxdna_drm_get_info_ioctl, 
>>> 0),
>>> +    DRM_IOCTL_DEF_DRV(AMDXDNA_GET_ARRAY, 
>>> amdxdna_drm_get_array_ioctl, 0),
>>>       DRM_IOCTL_DEF_DRV(AMDXDNA_SET_STATE, 
>>> amdxdna_drm_set_state_ioctl, DRM_ROOT_ONLY),
>>>   };
>>>   diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.h b/drivers/ 
>>> accel/amdxdna/amdxdna_pci_drv.h
>>> index b6b3b424d1d5..72d6696d49da 100644
>>> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.h
>>> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.h
>>> @@ -58,6 +58,7 @@ struct amdxdna_dev_ops {
>>>       int (*cmd_submit)(struct amdxdna_hwctx *hwctx, struct 
>>> amdxdna_sched_job *job, u64 *seq);
>>>       int (*get_aie_info)(struct amdxdna_client *client, struct 
>>> amdxdna_drm_get_info *args);
>>>       int (*set_aie_state)(struct amdxdna_client *client, struct 
>>> amdxdna_drm_set_state *args);
>>> +    int (*get_array)(struct amdxdna_client *client, struct 
>>> amdxdna_drm_get_array *args);
>>>   };
>>>     /*
>>> diff --git a/include/uapi/drm/amdxdna_accel.h b/include/uapi/drm/ 
>>> amdxdna_accel.h
>>> index ce523e9ccc52..e19e4cd04ffa 100644
>>> --- a/include/uapi/drm/amdxdna_accel.h
>>> +++ b/include/uapi/drm/amdxdna_accel.h
>>> @@ -34,6 +34,7 @@ enum amdxdna_drm_ioctl_id {
>>>       DRM_AMDXDNA_EXEC_CMD,
>>>       DRM_AMDXDNA_GET_INFO,
>>>       DRM_AMDXDNA_SET_STATE,
>>> +    DRM_AMDXDNA_GET_ARRAY = 10,
>>>   };
>>>     /**
>>> @@ -455,6 +456,110 @@ struct amdxdna_drm_get_info {
>>>       __u64 buffer; /* in/out */
>>>   };
>>>   +#define AMDXDNA_HWCTX_STATE_IDLE    0
>>> +#define AMDXDNA_HWCTX_STATE_ACTIVE    1
>>> +
>>> +/**
>>> + * struct amdxdna_drm_hwctx_entry - The hardware context array entry
>>> + */
>>> +struct amdxdna_drm_hwctx_entry {
>>> +    /** @context_id: Context ID. */
>>> +    __u32 context_id;
>>> +    /** @start_col: Start AIE array column assigned to context. */
>>> +    __u32 start_col;
>>> +    /** @num_col: Number of AIE array columns assigned to context. */
>>> +    __u32 num_col;
>>> +    /** @hwctx_id: The real hardware context id. */
>>> +    __u32 hwctx_id;
>>> +    /** @pid: ID of process which created this context. */
>>> +    __s64 pid;
>>> +    /** @command_submissions: Number of commands submitted. */
>>> +    __u64 command_submissions;
>>> +    /** @command_completions: Number of commands completed. */
>>> +    __u64 command_completions;
>>> +    /** @migrations: Number of times been migrated. */
>>> +    __u64 migrations;
>>> +    /** @preemptions: Number of times been preempted. */
>>> +    __u64 preemptions;
>>> +    /** @errors: Number of errors happened. */
>>> +    __u64 errors;
>>> +    /** @priority: Context priority. */
>>> +    __u64 priority;
>>> +    /** @heap_usage: Usage of device heap buffer. */
>>> +    __u64 heap_usage;
>>> +    /** @suspensions: Number of times been suspended. */
>>> +    __u64 suspensions;
>>> +    /**
>>> +     * @state: Context state.
>>> +     * %AMDXDNA_HWCTX_STATE_IDLE
>>> +     * %AMDXDNA_HWCTX_STATE_ACTIVE
>>> +     */
>>> +    __u32 state;
>>> +    /** @pasid: PASID been bound. */
>>> +    __u32 pasid;
>>> +    /** @gops: Giga operations per second. */
>>> +    __u32 gops;
>>> +    /** @fps: Frames per second. */
>>> +    __u32 fps;
>>> +    /** @dma_bandwidth: DMA bandwidth. */
>>> +    __u32 dma_bandwidth;
>>> +    /** @latency: Frame response latency. */
>>> +    __u32 latency;
>>> +    /** @frame_exec_time: Frame execution time. */
>>> +    __u32 frame_exec_time;
>>> +    /** @txn_op_idx: Index of last control code executed. */
>>> +    __u32 txn_op_idx;
>>> +    /** @ctx_pc: Program counter. */
>>> +    __u32 ctx_pc;
>>> +    /** @fatal_error_type: Fatal error type if context crashes. */
>>> +    __u32 fatal_error_type;
>>> +    /** @fatal_error_exception_type: Firmware exception type. */
>>> +    __u32 fatal_error_exception_type;
>>> +    /** @fatal_error_exception_pc: Firmware exception program 
>>> counter. */
>>> +    __u32 fatal_error_exception_pc;
>>> +    /** @fatal_error_app_module: Exception module name. */
>>> +    __u32 fatal_error_app_module;
>>> +};
>>> +
>>> +#define DRM_AMDXDNA_HW_CONTEXT_ALL    0
>>> +
>>> +/**
>>> + * struct amdxdna_drm_get_array - Get information array.
>>> + */
>>> +struct amdxdna_drm_get_array {
>>> +    /**
>>> +     * @param:
>>> +     *
>>> +     * Supported params:
>>> +     *
>>> +     * %DRM_AMDXDNA_HW_CONTEXT_ALL:
>>> +     * Returns all created hardware contexts.
>>> +     */
>>> +    __u32 param;
>>> +    /**
>>> +     * @element_size:
>>> +     *
>>> +     * Specifies maximum element size and returns the actual element 
>>> size.
>>> +     */
>>> +    __u32 element_size;
>>> +    /**
>>> +     * @num_element:
>>> +     *
>>> +     * Specifies maximum number of elements and returns the actual 
>>> number
>>> +     * of elements.
>>> +     */
>>> +    __u32 num_element; /* in/out */
>>> +    /** @pad: MBZ */
>>> +    __u32 pad;
>>> +    /**
>>> +     * @buffer:
>>> +     *
>>> +     * Specifies the match conditions and returns the matched 
>>> information
>>> +     * array.
>>> +     */
>>> +    __u64 buffer;
>>> +};
>>> +
>>>   enum amdxdna_drm_set_param {
>>>       DRM_AMDXDNA_SET_POWER_MODE,
>>>       DRM_AMDXDNA_WRITE_AIE_MEM,
>>> @@ -519,6 +624,10 @@ struct amdxdna_drm_set_power_mode {
>>>       DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDXDNA_SET_STATE, \
>>>            struct amdxdna_drm_set_state)
>>>   +#define DRM_IOCTL_AMDXDNA_GET_ARRAY \
>>> +    DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDXDNA_GET_ARRAY, \
>>> +         struct amdxdna_drm_get_array)
>>> +
>>>   #if defined(__cplusplus)
>>>   } /* extern c end */
>>>   #endif
>>

