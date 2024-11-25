Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9899D8249
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 10:32:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 034B610E3AE;
	Mon, 25 Nov 2024 09:32:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="nCG/aqyl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2040.outbound.protection.outlook.com [40.107.212.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF7610E3AD;
 Mon, 25 Nov 2024 09:32:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MvO+ISZNh/FNk/5nJ0KapAfNUTp6odPvBFRXBv2E/fcJ6xaJLbot7iELK/I8YJbXu+GY+Vs/djRc5hYbrqi5SkJYqtFshAZLrHcLAZwZ1TpS3VDHqU8sfuAqsHLFo9vmNpYLueAZgjcD061qj2PXnHhvbbKLmZzC1oQoCKw3tgXOzKEwEhGEvO2AZ9OApWhBaZYTelbXlI6qFTqdtDpI/7YKIwI11KLyz3YyCKCZHi6dCQSWfy7ztGGAUux+VcgZxi12KDGqkctOelUXRV2P9188lyQD8hUdWXHqHG5nblvUpvOXDCFSmvOWej/7byizE3dKRPyX6NtICXDsypm+HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a8SHldCRbBLXBYd6XlcEsae13JAdro/hZUTPjsJPLN0=;
 b=aRMZW+HWZ9Ye+bNKp74h3KFDrfksfAlir2uWaVqPFpO8kXtLxGtFjYWqkz4r4vE/IM3fX6nAzvd/uUs9fZzoup6P0E0naHP2y9yxEnK38yNgmAF3+EH6Aa3WuPqb3R2NYACb+QG8AixxC39EBe2cykq8T7xeDtxnY2Se/+I584WSbySjucTdE3oQCKfjprJasGnQ2hRSYzPG0AGDa/W69ZFbb/xlPcJXNCaFbeOdBKoyWvKtozrR4WF5mTdy+I7iJrjYv67RyPtcIqj+etAwCjm5FAh4kJyZPIiPk5tzc23tSxukgnCU3pHanZsYhaLX6okH9DOU+r0kun3kdHdGsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a8SHldCRbBLXBYd6XlcEsae13JAdro/hZUTPjsJPLN0=;
 b=nCG/aqylOVlVSNsKcHZMO6Dqap5GUULObjMYtc0d2HjWm8MvCR+Mxi9IGRb7uhdwAVlNLUDrPfo10rBqBV8jyE2M84uEXVAWq/DjRkkPBb220389zTvPgdeW3fUOUAgIT1wsaNj1NS9ZtFugw05ixvvEXaoNwwvITh3LhWDR/5s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB9074.namprd12.prod.outlook.com (2603:10b6:510:2f4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Mon, 25 Nov
 2024 09:32:49 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8182.018; Mon, 25 Nov 2024
 09:32:49 +0000
Message-ID: <1018930b-98cc-432a-a4fe-6898ffa51d29@amd.com>
Date: Mon, 25 Nov 2024 10:32:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/4] drm: Introduce device wedged event
To: Raag Jadav <raag.jadav@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 andriy.shevchenko@linux.intel.com, lina@asahilina.net,
 michal.wajdeczko@intel.com, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, anshuman.gupta@intel.com,
 alexander.deucher@amd.com, andrealmeid@igalia.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com
References: <20241115050733.806934-1-raag.jadav@intel.com>
 <20241115050733.806934-2-raag.jadav@intel.com>
 <8c7292c3-8459-4ddc-a899-b56b1d93076f@linux.intel.com>
 <Z0Atv3Zw1d0N8hvv@black.fi.intel.com>
 <3644d364-6021-46fe-b3a2-689821551984@amd.com>
 <Z0CrJ3C3wJqtySLp@black.fi.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <Z0CrJ3C3wJqtySLp@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0421.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB9074:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fab5ce7-8a4c-4db8-8094-08dd0d3420d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ajlZWEFlYTMrQ1BZM2hoVVhpV1VKcDRJa2NvNGhBVTRQVVRBcCtoN2JLY2dS?=
 =?utf-8?B?Nkc0c1YyMW9OZFpqSXFiaWFrQ29XNWZWbGxRS3hRQTFaY3ZIbEVHNExBclBI?=
 =?utf-8?B?NmZnT1ZqeHFXL0JpUWNVSkVQK0lONkJoWldvY3Zqa1dUd3lZekIxdy9qZjdX?=
 =?utf-8?B?MW5OQk5mdHEwTGJwZmptWHc3U243cG1iaXBtazc1WGRFZW5TV2E2QUlDSXVj?=
 =?utf-8?B?SVBRU2lFM01SdExOVFA0MXN4TnpnS2JlaUVOb2NWU0NPZENETmxvSm15OWEz?=
 =?utf-8?B?b0VMRUVENWZmVGFKVXFPbzVwbkxPUHJXeTNqWWpWclF1cFdMQmJmalR6U09h?=
 =?utf-8?B?RTVNUEt1bTRyZkNqZU9EeXZEUndBOSt3dFRGVXVBSlV0alZCUWtGdkVoaHVF?=
 =?utf-8?B?OGhWbzV3cHlobTVaeFFBM2RDcFN6bmdQZUtIZjlrVzYzdFBKOVdtRmhQMzd1?=
 =?utf-8?B?aTJQWTZMQXhEYkUzbWp5N0h0NlR0MW4yVkVYa2RPV2g4akFoVWFUK2FrZUZC?=
 =?utf-8?B?RmQxNjRJSXlQQzdONkRkNXJjZHZGWkVVa05Scm1xK2MvZDdVYnlYR2Z4cXJn?=
 =?utf-8?B?ZVN3SmhVZVNEdzRrV0VYeFgydGNldDVpMjVtRHFMb0NJT2pUU3JJcmp1bnJY?=
 =?utf-8?B?ZkY4dHR0ZmZGdUZVZTRSNmRkTXQ0bG11eDJPSG1NOGhBd1RpRys5K2NjM3lI?=
 =?utf-8?B?Nm9kSHp5V2pBYS82NG1HVkhjU2VYUnIzdnFnNW1kVktBVDgrWE52MnliQWVs?=
 =?utf-8?B?VDJBUlJybUc5R1RZT2tKS1VwME92cy9Pb1dXdGpEbGVwS3ZvOW50azJhZ0tw?=
 =?utf-8?B?TmdWdWU5d3J5QXN0alRJeW5jZitGRVN2b0NxZVo3TTNFUjBLMVh2QVpyWDF6?=
 =?utf-8?B?a3d1bDUxNXVoYUw4WEF5VThvbDJSVkxSYVp4bGY1eTZYSmp0bjBCSFNRQkR1?=
 =?utf-8?B?Sm1qQ2Exc2Y5S2ZKcTNWcDhFU0hlZTZLdC9MVTN0eTNUdnk3ckRvNHB6Q1kr?=
 =?utf-8?B?T3pxNHlkR0Fmck12cHJ1eTBBSUViNVZOVEFhVUFLTFUxb0hnZDFRWVBoOXBF?=
 =?utf-8?B?WlAxZjNSUVRlKzBTRkRVdkloeW9zcjk4ZnJIdnJ4SlVvbUtSN0NnRG9TbWFM?=
 =?utf-8?B?V25YN0lHaWE5NDdtczAxSEp5R3F0S1pLdlEvQnRnWmc3aWtycnpnQmUxZVdx?=
 =?utf-8?B?LzllN0FaVVBWaExCbkRsbzlETWlnSFROUEo4ODVBcDIvcDd6MlJDWnVlUFZs?=
 =?utf-8?B?ZUNiVFZYbHN0Wm5KclVtKzl2WmEwRDBVY01oa3pISGJndzhQcGxtditQbm9B?=
 =?utf-8?B?K2FxTWJvQ0FibUNZcnI4WkFiM20yZW10RDYrbGJYV2NXK2NkQjBTM3g3MGVz?=
 =?utf-8?B?VzlXakFyVkkwUFZGLzl0OUlTc3dXTVVmU3RRNVJPY2JOV1IyNVMwb255dkRJ?=
 =?utf-8?B?ZG9rTjQ1Ui9wNnNIMmUvZmRzWFU4RWhiSWlZbDZBVk5YbGpBTFVWTlZrWXN4?=
 =?utf-8?B?d0x2MFhlTkZaN0NaUEdQWkhsOEpOeDRUZVhSZ29DU3BocEd1Y3pyeDUwN01V?=
 =?utf-8?B?azN5bVgrM3V2YVRFUGEzQjYxODZUeUhjVmJ6TlJmN09xNklGL2p6dWM0cVBE?=
 =?utf-8?B?OGYwY2l3UHRaWjdlRVdZaWtock00OVVNRXl5MkZyK1ladFN2R1hnMTI2RTF2?=
 =?utf-8?B?WTRQRkVCVnJHZjlidUNiZkNKUVZoNWRJNFhKZGtjWmlRYzRUanBmZVVUQjFj?=
 =?utf-8?B?REVScm5kU0NOenp4QnoyTk8yVWJtZDVZb1ZQME1EbWh3bUxjRjk2NnZaY2dy?=
 =?utf-8?B?OU1DUkdBL1FXUkowSkx4UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amdDdUdsaEZPa0p0c3h1VE0za0pMR0luTGpOZ1FKRnNiMnZpTi9YNnozMkZJ?=
 =?utf-8?B?WEtMclZvcW9jZmNZNXRSVmhOYmV4UC9lNEFmRVBEUFFrVWZJbXB6MjRESGFs?=
 =?utf-8?B?elliekZYelN6U1d0bFk0bDlCNmZuTDFWaGVtaTNJWlBwVzZzQ3VKbzBCVitV?=
 =?utf-8?B?cTgraHpKaFowREUxSk0zdG1OTTlLNENHZlpIOWk1Q2ZZTldPNnVxK0tMMmRp?=
 =?utf-8?B?aGIxUXFQUkUybS9PQ3dIckE0UzEyRWJCdTY3cDdWUjRGMHlVZ0MxRVZZNEdo?=
 =?utf-8?B?VWpWdk93aVdYbCthOVUwL2xDc1o5dDZlcnNSYTJEc1crVXUvdEd3TVFLWmRP?=
 =?utf-8?B?Nk8xT3RZZDY3OVJRS00wUnhidVplSGdxN1ZObXI3VCtVTER6cHVVeXFkQjVN?=
 =?utf-8?B?S0NORXZFSHhnajVEVmF1RmI4Q0xyUTFxQVpkT09OTEJZMlBSWFFIYVJ5U3Ra?=
 =?utf-8?B?RGlvQU9VVy9CdlpleE9udzNwTzdUOStYYzI2WFRpTmxvOVJ4WDh5MU1UVHgz?=
 =?utf-8?B?NHh1SjdYSWwwSWRmMHJzZ0J1QTFEL1ZzNnFGMlBNdjRsZDZGRHdUT0JVMlJT?=
 =?utf-8?B?d00zYkRuanljNEhYNDArY1l0b0FjOUxTSEpBM0NLSWJTZnEwWlAxdTlvTGVT?=
 =?utf-8?B?bnZ3MFIyaWx6d0lWVmkwUVE0cmljSjZHTlE5VXIwdjdmeHVaV3RvQzFnTFZT?=
 =?utf-8?B?dStaMURSVldKN0gxMnNsNGQzV1hnRm1hdk1Lemp6SGZuREFQNUZkNzN6RFpk?=
 =?utf-8?B?c3ZycklLYUY4ZU1Fbk12TDVWR1dJVHFvL0ZzRk1FVm1QUmY0cTNQakZlWlBM?=
 =?utf-8?B?ZkM4d0JFc1U0dTBwMDVjMVRMb1JCRFZWVkNvdDZQR21kajJQVW5XSllBNnlx?=
 =?utf-8?B?VllmVmo4VG9VMmRqQzhnWFNxZ3VxcjhOYm9YUklnTFJBSXR2NS9Bc09mQ01p?=
 =?utf-8?B?Rk5qUlB4VTZMQTVvN2dKdnZZazNEaVdRK3lycDlXQm9rNjhYNkU0RmZscFFK?=
 =?utf-8?B?L1Bqdk5Tb3ZlTVVuRWFwdlM1eGdSSVlxbmVUTHlaZFZ5S2hka2RuamFBUFAv?=
 =?utf-8?B?NkU0eVNOdmhrSS9XMm15YWpXckJnTlRtcXh1Z2dRc1F5ZXk4V2F5T1A5VWtu?=
 =?utf-8?B?ZUFYeEVpVE1KaHBSZ1F6SEQ2eTlaUU9pYnkyVk0vaWdUamhpRnljYWNpUFFv?=
 =?utf-8?B?ckt0ekwzVjI1Um5pNytCSUNaNWFrQ2NTaE1aY29GeFVoektrWUNPMkswV1dk?=
 =?utf-8?B?OVZUTTA3Qmd1cFJuTGJIWGdOaStiRlVtaEVPYnJCaHpBaDU2aVhWOHo5ZU03?=
 =?utf-8?B?SkEvQ3NHMmhZZXhjU0QrYkFGN1VkM28wOGErYkxPaG5ZNXBxcXhIbEtoNms5?=
 =?utf-8?B?SjVzMTBxaFhFYjdwWktpSUt3djcwTXBaWnEvaWVaSnhSRTI2b2RKT2lISjFa?=
 =?utf-8?B?U0FHeXNHNkdub2liV0J6ZlpxMFpMb2Y4WW5zVWhmb3JzUXRSdk5kZXFITUcr?=
 =?utf-8?B?VHVRcmFEcVZ3Q001TU55RVF5M2M3VUN3Y0JNNmNZYlk2M09hVzNzT1BBazVn?=
 =?utf-8?B?clF1RzQva0RxbVJJWmNodEMvdHp6WWFIbFhyanNCQUgwM3hhNERobk5tSi9y?=
 =?utf-8?B?bXNRQ1FIakVmTENxTllEVkFwM3ZvSFl5R3JwNnBocDE4a3pUSUpyYThyRlEw?=
 =?utf-8?B?UWpEekZDdklvQWQ5OFhIb2MyT3drRVBpQnZTeUZaYlhtc1JtL3o0WCs5MXdE?=
 =?utf-8?B?UGtKcWlCTlZGZXl4WVI3ell5SE5YOVdrZWthMlZRQmZtN0lLaGxtVlZxZEF5?=
 =?utf-8?B?N1UzQ0N1dndHYXhaRGtpWnBlMmZUbkV0TDlkSGtSUVR0N3lWTThrd1BkdEt0?=
 =?utf-8?B?NWhCZ2Npc3NxQjliZjZ1eFNEeS9CQmlUMGhRNWQxdzRpK1VOdWpXbW1jR3cw?=
 =?utf-8?B?UTVwMHVDdGhqMS9yTS9iYlBsWjc5YU1EK2VFbGQvMjZVZDNXcW9tNzJwcTA3?=
 =?utf-8?B?WUQvSEhEUk1BelU0dTdFc1JGbTRzUFRrZU50cG9xNW5OYWdVckZJK1UzcEQv?=
 =?utf-8?B?UmxhZFZ0b0YwdFBHdHd1SFZmdE9GdHJ0ZDZtb3J0TWVCelJCdlV2SHBmWjRT?=
 =?utf-8?Q?rj5+OdWrvI54+2I6LI7eVD2B/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fab5ce7-8a4c-4db8-8094-08dd0d3420d3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 09:32:49.7852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RUx9o3NhPULjGirKbuzwgbfP6/mAMvIfyKu0yz8Xi3lRVOg9UhigZ19b6/Y7FrRC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9074
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

Am 22.11.24 um 17:02 schrieb Raag Jadav:
> On Fri, Nov 22, 2024 at 11:09:32AM +0100, Christian König wrote:
>> Am 22.11.24 um 08:07 schrieb Raag Jadav:
>>> On Mon, Nov 18, 2024 at 08:26:37PM +0530, Aravind Iddamsetty wrote:
>>>> On 15/11/24 10:37, Raag Jadav wrote:
>>>>> Introduce device wedged event, which notifies userspace of 'wedged'
>>>>> (hanged/unusable) state of the DRM device through a uevent. This is
>>>>> useful especially in cases where the device is no longer operating as
>>>>> expected and has become unrecoverable from driver context. Purpose of
>>>>> this implementation is to provide drivers a generic way to recover with
>>>>> the help of userspace intervention without taking any drastic measures
>>>>> in the driver.
>>>>>
>>>>> A 'wedged' device is basically a dead device that needs attention. The
>>>>> uevent is the notification that is sent to userspace along with a hint
>>>>> about what could possibly be attempted to recover the device and bring
>>>>> it back to usable state. Different drivers may have different ideas of
>>>>> a 'wedged' device depending on their hardware implementation, and hence
>>>>> the vendor agnostic nature of the event. It is up to the drivers to
>>>>> decide when they see the need for recovery and how they want to recover
>>>>> from the available methods.
>>>>>
>>>>> Prerequisites
>>>>> -------------
>>>>>
>>>>> The driver, before opting for recovery, needs to make sure that the
>>>>> 'wedged' device doesn't harm the system as a whole by taking care of the
>>>>> prerequisites. Necessary actions must include disabling DMA to system
>>>>> memory as well as any communication channels with other devices. Further,
>>>>> the driver must ensure that all dma_fences are signalled and any device
>>>>> state that the core kernel might depend on are cleaned up. Once the event
>>>>> is sent, the device must be kept in 'wedged' state until the recovery is
>>>>> performed. New accesses to the device (IOCTLs) should be blocked,
>>>>> preferably with an error code that resembles the type of failure the
>>>>> device has encountered. This will signify the reason for wegeding which
>>>>> can be reported to the application if needed.
>>>> should we even drop the mmaps we created?
>>> Whatever is required for a clean recovery, yes.
>>>
>>> Although how would this play out? Do we risk loosing display?
>>> Or any other possible side-effects?
>> Before sending a wedge event all DMA transfers of the device have to be
>> blocked.
>>
>> So yes, all display, mmap() and file descriptor connections you had with the
>> device would need to be re-created.
> Does it mean we'd have to rely on userspace to unmap()?

Yes and no :)

The handling should be similar to how hotplug is handled. E.g. the 
device becomes inaccessible by normal applications all mappings become 
invalid.

But we don't send a SIGBUS or similar on access, instead all mappings 
redirected to a dummy page which basically shallows all writes and gives 
undefined data on reads.

On IOCTLs the applications should get an error code and eventually 
restart or at least unmap all their mappings.

Regards,
Christian.

>
> Raag

