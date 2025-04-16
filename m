Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 045B8A8B652
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 12:01:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA7E810E3BB;
	Wed, 16 Apr 2025 10:01:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tNdGe/t0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2049.outbound.protection.outlook.com [40.107.93.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79C7010E3BB;
 Wed, 16 Apr 2025 10:01:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fuAhaLdgtgGBZgdVpeTKGOE+y5ez98rIJ99kjKidjbEgAXYOQJugBld+vauVHXK6YfclMEtFa/X+P31HUCSrBq1WLZxvVeIOQ8yX3Tv6ViMOeIKvP4wdevTnJl2jZl9HJISVA91k8RTvBEQREaaOo6DJwjrtmnpEq/AD/awrSVoDx8MHbaGe5BcZsCOp6CTOxavYHqII6lEwLlyznU8ZyAUs4kmGOrI3m/1ejhjMC3rKUzxZwjXD2uJ2MHIszL4/FTZrjCTdcBQ6SwGW8VQajw2TxN05o0R6zpRn1BsOQfl8lQ/m8y72d/KG6H4FdQZQOWmrqCidmbrXqCydDATWFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mzl5Y6XWARiKybjhFux4cK1FaV8rNsJAn8NrtzApw/Y=;
 b=UCA66E3fLc7Vi5wNGb/zI+v8JtGzbwhhF2F+9udKxzYKMKjdxmqyH+xaAbJAOtK6JpOqc0p9I+kvEgAkUYBxcEOuENH0XFmZQv80u42NsnnxdNZoBvvxuguY0vUdBPn6mmhhRzCQXAKkSJdCabpGebw67chBceiS6S4R7bvbJ7leeli7EDme2p/EfTlx4KtPilVPFu2+3sguqsUu+wVoAis9p0QXeTLApdZIwxXiEFuLJMcnl2kSlS5fSigvmxRxrrLhpYa/br7H+MYDDxasV+wPMHCX9pAdoOADfRuiA8TUQiCdvLu5ouKhBgMLhKVYlT0cGJDC7c1OTEOKxnsjnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mzl5Y6XWARiKybjhFux4cK1FaV8rNsJAn8NrtzApw/Y=;
 b=tNdGe/t0wmil1s7Bg3N/qiqIjQ9uSgrYZdJGTWRlLXrDkToo/RGyN4FNWHh1O8X8KqiS4aMJxLljm3A0wlakHW+wTjK3wwIZlLBcI38nWmYfrlpStSdE8MkGbuaAEKs8cuOJ8gnzq4EpbSZxbP6TG2sJ12byGyXAIS5XFc1/WeU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15)
 by CH2PR12MB4070.namprd12.prod.outlook.com (2603:10b6:610:ae::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Wed, 16 Apr
 2025 10:01:33 +0000
Received: from BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e]) by BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e%3]) with mapi id 15.20.8655.021; Wed, 16 Apr 2025
 10:01:33 +0000
Message-ID: <ec6f48cc-9776-4912-b746-ee18edb3536b@amd.com>
Date: Wed, 16 Apr 2025 15:31:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] drm/amdgpu: use drm_file_err in logging to also
 dump process information
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
References: <20250415184318.2465197-1-sunil.khatri@amd.com>
 <20250415184318.2465197-3-sunil.khatri@amd.com>
 <34b082d4-b320-4eb3-8b36-fb63ffca3730@igalia.com>
Content-Language: en-US
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <34b082d4-b320-4eb3-8b36-fb63ffca3730@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0009.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::17) To BL1PR12MB5753.namprd12.prod.outlook.com
 (2603:10b6:208:390::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5753:EE_|CH2PR12MB4070:EE_
X-MS-Office365-Filtering-Correlation-Id: 193aecad-16ad-4520-6262-08dd7ccdaa9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K25iWEJ1aWFQdzcwdkhvajV3NkZzYkxqb0gxSGxTZE9Xd29VUFZFTGdoeDRm?=
 =?utf-8?B?UU9hVks2VVRYMGc0Ukp4T1l3UEFRUjlvakVkbjJPY2ppTjlFa2lHakRDVm1p?=
 =?utf-8?B?Q1M3d1Y4QkluNStCZWNwY2ZBQnkrR3ErUVVBcllscmhUR041bVFZanlJVnpr?=
 =?utf-8?B?SjZlcWVmY0xWUktlYzNrMm1qd0xlNXhwaGo2cis0RUFVa2t3eGlyeFJYL2Rj?=
 =?utf-8?B?bU1GZnJXZGIvMmpwQ25aU1daK21zSldnWDhUNUFteTlOWVoxWmtrS2pMSHA4?=
 =?utf-8?B?SXlaQWlQb0RsaCtkQnVRMHZoRkhPbzdPU1gxUmlyRTlrZXAxWElqNnhWdUFn?=
 =?utf-8?B?cDFaamY5M213U2ZrZG45MW9DVmUxREFRemZHQ20vU0ZyTWU2QngvS2RFbW1i?=
 =?utf-8?B?RXB2WnNaYWxSOVNiN0ZlbkJ0R3FEUHhvV1pkb2MxbjU4TE9yTjFTcjdEcDM1?=
 =?utf-8?B?dkRMQWlmTmgrSWlrL1VweFE4ZUxtOUw4eDhlSktHS1RpUlVPczVPZ2RGM0xI?=
 =?utf-8?B?ODNnZXBHVVhsb1piNFFiM2pwa1ppcGJVUExUMzV6dSt3bHdNbVV5MW82eUgx?=
 =?utf-8?B?ZkFLNWRnYkRrWUlGdFRycUlvTnhSRTRuRVkzSjJtS1JpYlVtL2dVVkNHcnkx?=
 =?utf-8?B?Mng0bjF6YnBKc1FMejF0RzI0Z0c0SjVvZmJNQU5UYWpTTXl0aSt5ak5jK2N4?=
 =?utf-8?B?YW9oc2lTVnpIUG8wNFl1K0NDVUM2eUVxeUlNL3Rib2FGWWY2M3FGd0JsaEJ2?=
 =?utf-8?B?c1owS1NqSlV4VkR3cmFiR2dtQWR6dWJNU3FkSVA2NWJZWDVkMUNodGdDM1c1?=
 =?utf-8?B?SGdQQldQTHpncDNlRDg3cVhsODdzVmlxbEhML1VHbTlqZ1BkSDdqeS94VUt5?=
 =?utf-8?B?ZVRZNkdNelVBM0hSSUZKTU1ZaG5zakVSTXVMZzZNaFlvN3FXMXdqWXViMGNT?=
 =?utf-8?B?YjlzMDlvZG5RZEhGT20zWEl5QUhpeVpqTFdUcFdBRzNEWVFlUEE2NFAyNXdq?=
 =?utf-8?B?bkNIbWtpMFIxTHZlNFVhUktTSER0MkROU1pxNEV1Yzg2Sy9lNWl6ZTFBcEJh?=
 =?utf-8?B?NGtSRGpXaXUyaGtvWlZGOFlLSzhOMGhIWEpnNXJqTTkrYUFKTjJOV3ZVQkxk?=
 =?utf-8?B?ck9odnY2b2FxdW1BSXJ6d25XNGdZMjUzNFdxTVNEZGpSN09ZcEd4a210SFlO?=
 =?utf-8?B?d2c3T2xMRFBiRnZXWnB0ZHY4VU9RVmluOTdKT2lnQWg0NE50dkZXeFBTcCtY?=
 =?utf-8?B?V0sxbnhQcUxSWFFxaGV1TlpFT2RGY0hnRGRrV2lnVGZjR3E0NVJPWU5QZ256?=
 =?utf-8?B?bk9CNjNwakRxbS9OUmM2T3hOSzBKYXYxNnNrYW13L29SMTFlZ3pxN2t1Rjdh?=
 =?utf-8?B?ek83UnQ3QUNXVTFaTU5uWS96am9TMiswS0F0bEdhcVhPZDV2b1B5REhSMnIy?=
 =?utf-8?B?MmM1VXZGZHRjaWZiazdiM3Rwei80UmUvMUFSUmV1Ulp3ZFFaK1BIUllwZC9C?=
 =?utf-8?B?N3laN2Z2c2JTUlRZWHhKNWd3RmQ3VXcySXdHYjZCd2h2ZnN1WkRZekhjMVZ5?=
 =?utf-8?B?Q040RzJ2QkZ2MmZDKzdXN3hVcWlST1BZQU8rMjdqbFVQd3RNWUtFdXBrODRV?=
 =?utf-8?B?TXJNS05qdWFYVnpOaEVuWFpma010YWNlMzBadzdTa2xlbi81eEMwNFE5SUk3?=
 =?utf-8?B?aU9DUkRwMnFITW9NSmh1RkhjenRFY2x6NThCM1kyZTdCUGFNMXFJK0F3S3FQ?=
 =?utf-8?B?b2tkekNMSHNqV29YbkJ3a1JxUnFCa0EzK1lBc1dRcHQ4ck1ycC8yUFBwaEN5?=
 =?utf-8?B?NWRmYVNwYU1qQStmQzZ6NzlHbkw4S01OM2pRdjlsR1FDbnRxSVJzNmhVNDBT?=
 =?utf-8?B?cElWNlJVNDdYRUhFYmxUYndRcVNkKzEyTnB5RitKMHNpNmoyWE5WNzJUclpW?=
 =?utf-8?Q?GjLqhNXunMg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjhoR01ZeFZFdmRHOHRJUUdXTytRTjgwZHdGNVg1Y3MrSDI0ZHd5WVVsS3d2?=
 =?utf-8?B?UXFsaFkrYXM0T2VGREgzenUzTloxdk16Yno5NVVma0R2RjNzbGRWMUVla08x?=
 =?utf-8?B?UlcvcUlqZGpTY3hhT21RMXhBZHExcDlLeituTHhsZ0VvRVpDS0kvRW90MGta?=
 =?utf-8?B?TXpDdGczU2NZOUNlY2RsVHhTQlFlbFVFbUhqb01TSnd1OFhVaHRsQzNjY2Ny?=
 =?utf-8?B?RmYzREI5WUE2YTJlSzlyb21ZUFgrVDI5Tks5NmxBM2x0bmNLdXdXa1lSbktN?=
 =?utf-8?B?V0YwUlF0by9kZWpqenc0Vlh1SDV4Z0RFTGNwK1RpTHYzajZmZWVGOWlKTC9G?=
 =?utf-8?B?MS9zOW9qUFQ5RFd5WDRlbjlEdWRTc2JqY09lOEhjeDd4YjcycjdXVHBqT2FO?=
 =?utf-8?B?WFNpMEZwSE1QOFJjZmNXajljMXhBQnlnMWh1QUpIdWV3OGU2QlloUTZJUWZZ?=
 =?utf-8?B?VVlpZ2FtemhqYjA2OTBGY2k2ckY0a2dCUGIwUVc3aTBkZ2NDY3N3d1VUR3Nn?=
 =?utf-8?B?RmtrODhIMDg4TEppOGdCN2daNFRlS0ZNUDVTMGkydXowK05La1c5amxLZU1X?=
 =?utf-8?B?cWJpcjUraUZqbTFDaCt3T1YraE4xcGZJVGo0cXlSbERhQ05BSkxYS2VCejM5?=
 =?utf-8?B?VjV5OEJ6M1licVdYSldPT28rZHp4dnVRYXQ2ZDhBelRTeENwTEtkemlTb0NO?=
 =?utf-8?B?NGM0cEJ3UjVtQWhQeEF5M3pWVFdVWmIzSjFxRWlIdUhleW4rUFBlZERqT2Jo?=
 =?utf-8?B?VEc4cWpQOTl1N09IL09jWldWQVlMd2JmYk1UUENhbE1aeklJMVovQ1ByenNK?=
 =?utf-8?B?V3BySERwWGJValRZZitzaFhBcURhMkIybWlYdk5nWXBYS3IxUm83NXZKdE4r?=
 =?utf-8?B?bG4yYWw0OC9QTENDalZmZmsrYmo3dDRlWHhhVjFaby9Pd1VRb3doekFXK0pK?=
 =?utf-8?B?dnlwOEJjQ09TMG5nV2RiSGF1NGd0bUpUVmNCMjUzYTdpdHJWNjFoVE5FUkJh?=
 =?utf-8?B?SHIvYVJjb1hvLzdXNlhXOGg5YjYzOEJpUi84emRMSmxTSHoyb1FNNHB4UUdV?=
 =?utf-8?B?TEQ1aXVxL0Jtd0V1UXJ1VUsxVWN5aXZtR1g2aTgxeVNHUmFFRVNuRkpoa1JK?=
 =?utf-8?B?bUZITHFKVkdnc2V2cU8vMkc4MXdkU0ViWmxLMjBUL3FOV21aMktzUVJWYTcr?=
 =?utf-8?B?NStZc0M2Zm9SYzAzVnBJQVNEejRWUDd5MzgyQnk2SEpTWGl6RWVBSldsSEZi?=
 =?utf-8?B?Q1k2eWRyS1JPSW9XTzFYNU54TTl4dDMxQXRBRGh0RlJvZ0FHaE1yQllTQVR2?=
 =?utf-8?B?WU9JWC9UQUxteGpFVFpGZG1PRTdFK1FPMDlGUTZ5aDR0WFVBR091VENNYkZG?=
 =?utf-8?B?aHhTaUVuUlJUNzluUUNuUDRaSWJqdE1FOTJLeWEzYkdHZTBRNzYxSnAwSUEr?=
 =?utf-8?B?VmV2U1IwamcrNENvdENvdGNiZ2txU0JMSU1BbGpzVFRpcDNiL1pSMWoybS9G?=
 =?utf-8?B?U2dsSzZKcUVnbVVEaTJqWmdJcUh3QWhwRDlQaFBQd0E5UXkrbDZONlBZZE16?=
 =?utf-8?B?YjBYSGhlUTFRaFQ2ZUlCNTlIcENwZ1Z6ak5ZY3pPUnRBZ1IrM0xITWxUVFl1?=
 =?utf-8?B?ZlEvV2M4QVhldVZROE55cVdUb0NVWE5RSm5GZUJVN3N3cUpKTXhKU0o1QXNw?=
 =?utf-8?B?S3VhZmxZNmFZQnRaK01lKzJzQUhJc1B6aElMYW1uR01RbVJqd2k0RUdOVGg1?=
 =?utf-8?B?OVdRa09rM01xRUhleEZmWGVIaEwrdzhhRERpQU4vN1hCbHlQS1FuSW0xQlRB?=
 =?utf-8?B?SXNkenA0R3hiSndnWDdBd1V6YjBmeTBWYjJoTGJnMFdtdTZRTzVRNEEwbjNk?=
 =?utf-8?B?cnhJZFpldlI2dTEvRlRucm1aMUh4b2JhZGJzL0RIOXUwcVk4ZWRSVm5oS2xp?=
 =?utf-8?B?elozTzM0ampDRWRISk0rYWFPWGNVc0ZZY1lFRGRyRmZ4S29lWU5WMk04TFAw?=
 =?utf-8?B?SEJVZjE1Q1BPTFkyV2FmQXR0N1NoSlJBdDZGbFE2RS9mdWxSRmRNK0ZmVmww?=
 =?utf-8?B?QWw4SlZvN2pBTlBucnhSM1JxR2UvdmtnbFBxaVAwV1FOMnFEWmJ4dmx3RWp1?=
 =?utf-8?Q?hlOgYJFgwPrqxSW8+iSubWLov?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 193aecad-16ad-4520-6262-08dd7ccdaa9e
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 10:01:33.3416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UHxPOqDXe5PmmQj1qRPrJ2N3LupE8Sw3slF82RexruIGrVRC5fjleOK9sEcazTRZop0JbSonVLSOOOSetNKcmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4070
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


On 4/16/2025 12:56 PM, Tvrtko Ursulin wrote:
>
> On 15/04/2025 19:43, Sunil Khatri wrote:
>> add process and pid information in the userqueue error
>> logging to make it more useful in resolving the error
>> by logs.
>>
>> Sample log:
>> [   42.444297] [drm:amdgpu_userqueue_wait_for_signal [amdgpu]] 
>> *ERROR* Timed out waiting for fence f=000000001c74d978 for 
>> comm:Xwayland pid:3427
>> [   42.444669] [drm:amdgpu_userqueue_suspend [amdgpu]] *ERROR* Not 
>> suspending userqueue, timeout waiting for comm:Xwayland pid:3427
>> [   42.824729] [drm:amdgpu_userqueue_wait_for_signal [amdgpu]] 
>> *ERROR* Timed out waiting for fence f=0000000074407d3e for 
>> comm:systemd-logind pid:1058
>> [   42.825082] [drm:amdgpu_userqueue_suspend [amdgpu]] *ERROR* Not 
>> suspending userqueue, timeout waiting for comm:systemd-logind pid:1058
>>
>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c | 14 ++++++++------
>>   1 file changed, 8 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c
>> index 1867520ba258..05c1ee27a319 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c
>> @@ -43,7 +43,7 @@ amdgpu_userqueue_cleanup(struct amdgpu_userq_mgr 
>> *uq_mgr,
>>       if (f && !dma_fence_is_signaled(f)) {
>>           ret = dma_fence_wait_timeout(f, true, msecs_to_jiffies(100));
>>           if (ret <= 0) {
>> -            DRM_ERROR("Timed out waiting for fence f=%p\n", f);
>> +            drm_file_err(uq_mgr->file, "Timed out waiting for fence 
>> f=%p\n", f);
>
> You decided to leave %p after all?

Yes we are printing the fence ptr here to see which fence is timing out. 
Anyways right now intention of this patch is to add additional process 
information along with existing information like fence here.

regards
Sunil

>
>>               return;
>>           }
>>       }
>> @@ -440,7 +440,8 @@ amdgpu_userqueue_resume_all(struct 
>> amdgpu_userq_mgr *uq_mgr)
>>       }
>>         if (ret)
>> -        DRM_ERROR("Failed to map all the queues\n");
>> +        drm_file_err(uq_mgr->file, "Failed to map all the queue\n");
>
> You lost the plural by accident.
Yes i will add 's'. Noted.
>
I am also not sure "all the queues" makes sense in this context versus 
"all queues" but it's inconsequential really.
Regards
Sunil
> Yes it all queues from a uq_mgr.
>> +
>>       return ret;
>>   }
>>   @@ -598,7 +599,8 @@ amdgpu_userqueue_suspend_all(struct 
>> amdgpu_userq_mgr *uq_mgr)
>>       }
>>         if (ret)
>> -        DRM_ERROR("Couldn't unmap all the queues\n");
>> +        drm_file_err(uq_mgr->file, "Couldn't unmap all the queues\n");
>> +
>>       return ret;
>>   }
>>   @@ -615,7 +617,7 @@ amdgpu_userqueue_wait_for_signal(struct 
>> amdgpu_userq_mgr *uq_mgr)
>>               continue;
>>           ret = dma_fence_wait_timeout(f, true, msecs_to_jiffies(100));
>>           if (ret <= 0) {
>> -            DRM_ERROR("Timed out waiting for fence f=%p\n", f);
>> +            drm_file_err(uq_mgr->file, "Timed out waiting for fence 
>> f=%p\n", f);
>>               return -ETIMEDOUT;
>>           }
>>       }
>> @@ -634,13 +636,13 @@ amdgpu_userqueue_suspend(struct 
>> amdgpu_userq_mgr *uq_mgr,
>>       /* Wait for any pending userqueue fence work to finish */
>>       ret = amdgpu_userqueue_wait_for_signal(uq_mgr);
>>       if (ret) {
>> -        DRM_ERROR("Not suspending userqueue, timeout waiting for 
>> work\n");
>> +        drm_file_err(uq_mgr->file, "Not suspending userqueue, 
>> timeout waiting\n");
>>           return;
>>       }
>>         ret = amdgpu_userqueue_suspend_all(uq_mgr);
>>       if (ret) {
>> -        DRM_ERROR("Failed to evict userqueue\n");
>> +        drm_file_err(uq_mgr->file, "Failed to evict userqueue\n");
>>           return;
>
> It is pre-existing but strikes me as odd that failure to 
> amdgpu_userqueue_suspend_all() logs a failure to *evict* instead of 
> suspend (as the previous log does). Anyway, I did not look at the 
> surrounding code so just thinking out loud.

Yes suspend failed as all the fences were not evicted and thats why 
suspend failed. Anyways there are already alex patches which will change 
this to unmap as a code reorganisation for suspend/resume is in pipeline.

regards

Sunil

>
> Regards,
>
> Tvrtko
>
>>       }
>
