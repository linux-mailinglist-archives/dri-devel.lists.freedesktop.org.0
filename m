Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E444B07358
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 12:29:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41BCB10E13D;
	Wed, 16 Jul 2025 10:29:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1mAH2iLi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2071.outbound.protection.outlook.com [40.107.92.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABD5D10E13D;
 Wed, 16 Jul 2025 10:29:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kAICNvn9Uez/y2vec0X+FkL5G1i0sZ0766mwmqq6pNcEOnyEX5E3Tnnp2B6mV42T4H44f+9Nq/Xtd6Z5LaCn8LhAG4CULAci7GskZ8C6/GhfcOc5tk6+hhuVpUO4fUTiDJ7tKBngUaKxIVV12YV5segqEl1V9AxYc3hZNPZY36F5XZSlmAkpiJhPOKvGPcXwYXJhD7TNFgMMY8BoRIj3ulqHBhcc2Nis10f/I+fZmgb5B4doscMyGt1aPAPEXeUOrteVS7cwVPJsd4IoAfKvddvXU93eQOU0gZ/CEKKZT4iSod6UFe7OFIIUtCxulIExCeQGoBYUmR+9IiJpZGrPgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1SrIKOUnH4UrCOfVr1bOOSY4fmQK0OxcD4ivgO9OCto=;
 b=edeOIZW1Dz9ODFjmWk6yDyJ6dWIuls2tqTygmA1Cc+jAUpOIUqvrRmJJ5wSEqGkWCmLW2ZNZjc/r2lprdHYJo7lvqcfRYvGBSCFpreM7wZjPtB/W3yhjFcm25JsYtKC/YE/Es3rjybmB3bPKIaj+jiopFGPEFWxknoQGm6xw+2qJRt/qRTz23aD376wjKgVGkZRQwUKqys94DR/er4qQs9k3PRGMkN9S47UdMXvbdFRIkEj9osous05QqVvOn0A+5I9D4rLbnZsi2yJlkwFiBOWuPYjO43MM0PJQMSHQYESufr7/vZ4GA/6sLfCUz9Jk6Xw2KfOLLVK7UnuNNoIiJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1SrIKOUnH4UrCOfVr1bOOSY4fmQK0OxcD4ivgO9OCto=;
 b=1mAH2iLi79PXy4IiDj9VMAlO9l8goMoh8NNo85h8RQkZKJZy9Bbb/sB3HozWVNQSzVehXtgHQfbXVuBR200GaBhR/UA9X1vxCCrBmji2rBaZmzEQig7op5viQDVvG9UAbqZdILRe4kVJeA4H0kunzRVwSAbTW0pqpHiySHVAUuM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7301.namprd12.prod.outlook.com (2603:10b6:510:222::12)
 by SA5PPFF3CB57EDE.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8eb) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Wed, 16 Jul
 2025 10:28:54 +0000
Received: from PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350]) by PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350%4]) with mapi id 15.20.8901.033; Wed, 16 Jul 2025
 10:28:53 +0000
Message-ID: <05a2b3f0-2166-47cd-9964-53254e4df6ba@amd.com>
Date: Wed, 16 Jul 2025 15:58:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] drm/amdgpu: Reset the clear flag in buddy during
 resume
Content-Language: en-US
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, matthew.auld@intel.com, matthew.brost@intel.com,
 airlied@gmail.com
Cc: alexander.deucher@amd.com, stable@vger.kernel.org
References: <20250716075125.240637-1-Arunpravin.PaneerSelvam@amd.com>
 <20250716075125.240637-2-Arunpravin.PaneerSelvam@amd.com>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <20250716075125.240637-2-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0077.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:26b::13) To PH8PR12MB7301.namprd12.prod.outlook.com
 (2603:10b6:510:222::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7301:EE_|SA5PPFF3CB57EDE:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ad9a5c3-e978-4c34-d78c-08ddc4538fd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZkNPdHpGcW81SzhCOXNwdDIzT05IcDdlN1ZvRWhDdVloRnZYNFY3V0lCYkNy?=
 =?utf-8?B?L2taemRLSzlFdW5Kd1ZGLzNQUzVYeXRnbnltRTB6RzlzMWpVeDZmUzhUS3d4?=
 =?utf-8?B?bkdTMXNmZTlWTTZhKzRiUmlscW9NWWJWMVRlZUsxbWdLRms3ZFFnKzVuSDJp?=
 =?utf-8?B?S1pFcGVDa0xUSEJQQVRqK2RWVDV4TTV4c3A2em9VcksvS1N5QlFENkNmZTEw?=
 =?utf-8?B?VkJUMm90UTVpZCtCakVEUGtLL0ZIUjRkQWN6TFJlVnI3eWE5N09HRWdKZEJj?=
 =?utf-8?B?aW84cjhraTQ0QVJHeHhBS0hMUE13cTVjWkxhTlJTR1B0U3JiaUZWVUhmL2pu?=
 =?utf-8?B?RGhHcjdsQTgrclYzSFRmTDNNTlBBWm9kWXdlRmR5Uyt3QzRydDNzMTBjbDZ1?=
 =?utf-8?B?MHJId2pOZVNPMGREQ1JFMHNKWlgrN3czdjJObzRwRm1ZTzUrV3h5eWF3ckhm?=
 =?utf-8?B?dGlUWFFrdTNWUng4N1laZkVsQkVnQWVjdmhETC9sMlhNNmp5ZG96RS9VUGs0?=
 =?utf-8?B?MFp5c1hiRTJWeXNycFRkTWt1UzVpYUkvaEl2SEJsWkg5UFFTcU5uK0RCT1Zh?=
 =?utf-8?B?L0MvRWZjM0MxOGJSTEEvLzV2dWRMVVZFUzdISFliL0o5dERqZUp1Qml2WWM0?=
 =?utf-8?B?aHdjSWp1YTV4NGxmL0tNbmh4QlhFb0svQVJkcjN4b1JPSEx6OE9MQndzN2pp?=
 =?utf-8?B?M2ZqaTNxUG9LS0hYN1I1Z3NMdUJmNWhvVUZrY25oWWVsTEpheFYxZmgxMHRj?=
 =?utf-8?B?TTZjeVBWVURRK0ZObks2Uk9aL2JQUDFqaEd4aXdlOUh6VU8xVlpZVVp2bTBy?=
 =?utf-8?B?aGZVVXYwL2pVYm8xS1puZDVYRkNkeEZDUHA5ZFJjUjlFUkFjOU5MWUJxQlVO?=
 =?utf-8?B?NHBHRUVVZjdYWVdyR1FLSXhXVm1nWU1VT0RUenhPb2pWbFZESTdab0NSc1Q5?=
 =?utf-8?B?Qk9RSXVKNDJtbmdSRnFtWDFJTDRLSXlyc0pKeGtyTHc4dnpxc2I1VHZZcmYw?=
 =?utf-8?B?QVR2c3FtTXNWZFI1VjJUQ2FtcitWclFUSlY3UDdLODZvSXpraXRPd2Zwbjhq?=
 =?utf-8?B?Y3lpd1ZrY3lJeDUwT3pZZlVyUk9weFA4UGwvdTFmSHBPdmNqWWc2U1pOQlRL?=
 =?utf-8?B?SGFERFRlNnkrS05WMnlpL281YmpPRzU0UW5IU2dndk9kR1ovK0huaFBBQUlJ?=
 =?utf-8?B?VS9XNVNMYWk1ZldySXl3TmFMZGZsYW96OCtTaitUUXpHYmIrM3B3dUpkZ0hE?=
 =?utf-8?B?L2ZEclJMRExyZ0Vnd0J1Tzk2WVZtUnRHWUxtLy9nd09CQmVVdGVPUjgxM0dC?=
 =?utf-8?B?ZDN3NWEwT0I1bGcyRERHM3BRZTBENDhOQVVlWk5LMWFUUWNkb2ppWXB2eCtS?=
 =?utf-8?B?K0FvYWl2ci85bjMzL01TeThGRTgyMkJNVVVlbjg3NGIydnlpN0ltbzVoeHQ2?=
 =?utf-8?B?VWZTS2d6V0lvYzJvZ1ZCeHRtRVlDWXpTaElwZ1RlSXFYWWw1Y05LZnc5NW1C?=
 =?utf-8?B?VUd1aFZMbmtUMmJwSnI2R0pOdXV4QUNmQjMrR0NwZ3NhbkltUVRnZEpmLzdj?=
 =?utf-8?B?TWtpaVVRYjhPVzlURFN0UUkwR0k2ZzNpWFZaMzlZTDJJUDVHQzB5LzhFQ2hH?=
 =?utf-8?B?STkvN1RBdk16bjQ1dDVLM1NkSnhnZzZLOFlGd05NVWFNTk0vSHROZlJiOUFN?=
 =?utf-8?B?WElKK1A4cWRHaHFzajh1bTFYc1gyQmQ0WEo5R3ZIRExNODY5aXZRKys3eGFE?=
 =?utf-8?B?TVhGOG5Sa0hSN0loYUdNYk80Rzd4VzBrMk04d3MxTERKUFlrZFkyWmh6MEJE?=
 =?utf-8?Q?PXejiTrHACGsJ/MA7zW8IDpTWANhs9huNb8ZM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7301.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sk1RR0dKQTVlOEd0TVNFZlE0WWo4VnB2L3dyNXRMSno4WlVGOVBrTlVPL0o0?=
 =?utf-8?B?ejRqTEdYQyt5NVphamNzb3E1bTE0N3U4aVpxZlQ1ZmVnM0JNeS9qWmtuK01h?=
 =?utf-8?B?SHc1OEZUbDZVL2FrSHdGM1ZXcDBIemVpYTFXTGgvaEFLRDVnbXNoSHpjWnhz?=
 =?utf-8?B?cmNmT1didkU0N1lqOFNmeUZQdGFnSFNHQUYyZWN5bjRSQk5vTXRTL0IwaWVr?=
 =?utf-8?B?cDFLVzE4SjVrNWZEbGhIYmZ1TWVhMS9VV01mbW9PTEQxN2JNL3pJVWZJeHhL?=
 =?utf-8?B?aTIyS3hBQjRVZ1BMZVVrMm50YVRvUDF2emdiSXZpcU9iUG5MVjBrUCtKV2pq?=
 =?utf-8?B?MHlXcGEyVzhzNlJYQityVTYyV2JRd1kvNXVqLzJ5ZXVyNHRLc2ZxaGJUNkF0?=
 =?utf-8?B?U21LK201eFR1cmhDSjJEQWdNZFdOVURrYUFYNzRHNW9pdnBUZnJYRFZOK2Nv?=
 =?utf-8?B?MUZQdHF5Ti9TQW44ZXVudlZlenVYSXFKMjVCa3hvcU1LNlM4OURsWDJxditI?=
 =?utf-8?B?aVFPa3dFRnNWckpCUS9PY2FKL0JZbmtPd1dnRVFOSmNvcTlhUkhxZlh2bW9K?=
 =?utf-8?B?Vyt5N3FSNm5UNDkyTHBraFhlSG9ncU5zWjFFZjB3dlpmT0ZnaXhLNnJ4dUxY?=
 =?utf-8?B?MjdjbEFZL3IxWDdWemlhYVk5akthaHZCVUVJSHFOL21ocnFXUWxjdHN5Mnd2?=
 =?utf-8?B?YXVqZERvdUtmZExzc3VLMWdXYjd0UWZwQVQ3T05jcVRSTlZmQnZwZ2Z3eU9k?=
 =?utf-8?B?N29UbmpGeDA1SXo2VkxhdzNtd1BMSHc0bVNQWmtQYTdpSHloY0l3bGdBaUxS?=
 =?utf-8?B?dG9JRmVZcnh0K0JBV0hCKy9mV3ZtVllZRWFEaGpEUkhGaHhGRWVWUVRHcERR?=
 =?utf-8?B?M21LYmdxQlNxRWY4Qm5iVXVRVmNKYjRhMlpkR2wyT0RSdjJHekF3MXZ0NVgr?=
 =?utf-8?B?TWNkYnZIbFZiVkU3aW9vV0VVa2crWFU3Y3dlclpiRXlYQkJFa1FxTStQVTBZ?=
 =?utf-8?B?dFhjd0xIYmdCbW9sRFFEOTQrVnFDUXpWWTRsalFJOThVUXhxQVNvK2x0UHhC?=
 =?utf-8?B?b3ZkUkRvdVU4V1QyWGlqVGRTUVZiVzZTbkZ0SDNQMnEvZEdKZUNLelZ5dWx4?=
 =?utf-8?B?YXVSSERVYThwc3VLNE1PQ1l0blRnczNuQ1RyN2t5NGpueHdsMGZWMXlkM0pN?=
 =?utf-8?B?b1dlZC9jRGlkV21hTTRuYmM2OGk3QXBFS3JyR2lNeW0rMG1pdUR3LzdGMUcx?=
 =?utf-8?B?bU84dUM2N2t0TnZiNW8vZ0F4eXZ5aWJocEJCYnVWOVRVbThnWVJRSmYzbHE1?=
 =?utf-8?B?K2dqbEw5VjFwdklIN0RyNDd2b2VzU1N1ajQzbGQwSUpxOWFXQmxFZlVIamJB?=
 =?utf-8?B?TjRhUHNMUFNodVlGRkRXd2oyclVsemZ1UTVrdituVlhub25kSFozRkl2VXpK?=
 =?utf-8?B?WkVWSWlsMG5KRUpzSmNnZWlsd0Z0dU1KVzJQdlBZakh6MU9qTFZldmxnWVZT?=
 =?utf-8?B?ekNoM2FyWmV2MlNoNG9KUG5YSzY4Z280MzJpUzJ3d3YrVkNDbWpjc3c4YXBR?=
 =?utf-8?B?cFdFdnBnVHZjUEVwMXc4SVZPUTk5WVpTSnNvWFhzTjNnTGh4M29sNTArUEY2?=
 =?utf-8?B?ZjFydFVqNmJFazNGL1g0a2szdTM3L0FyQzY2ZnpWMSs0YzhWckZsRWxwdGFy?=
 =?utf-8?B?dnJJVmgzczlTQVNFOFF2WW5iVzI2bjgyd2dSc25tQ0l1T2ltcHlHN1Erb3By?=
 =?utf-8?B?a3M5UVhQMGtENTVQbWxJQkNBbXVKWUV6NXN0STRMai9IQVZDNCtoVldpNW91?=
 =?utf-8?B?cjNia2poclNjUm9hWENYdTFvV3lCTkdzNjBZRXN2bkVRSkw2VUZtbVlOQ1U5?=
 =?utf-8?B?eEFENU1GQW81YU0yOUUvdlZaZDlmS3FzMjhqSVhINitkUk5ZWUFSZ2o2NnR6?=
 =?utf-8?B?dmhPK3NKZGJPQlFud0tadHVrN2JoVnVwK3Vhbjc3K0JOODRjbnVZaGx2cldi?=
 =?utf-8?B?MlUzU2w5NDNLd01RODBSd2Z5WEx1MW1YYnZqU1ZIYXVPKy9LWW5pMGVHckpM?=
 =?utf-8?B?YUJzNjVaMFNTbWFYRysxTFZ2R0RYQzdOUERRQXdEa2p1andSSVJZaWphejVE?=
 =?utf-8?Q?L4TLxcb167XqdIdcANIV0MvcE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ad9a5c3-e978-4c34-d78c-08ddc4538fd9
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7301.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 10:28:53.5149 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lBZ3h/6KZ7QhARDY1mc3rD24ng/FOUoJIcGjsFoCPixGkG/ceoEayi075bRO/njT8V6iydQJZ4+Sgyzq5Y681w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFF3CB57EDE
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

Hi Dave,

I am trying to push this series into drm-misc-fixes, but I get the below 
error when dim push-branch drm-misc-fixes.

dim:ERROR:e24c180b4300("drm/amdgpu:Reset the clear flag in buddy during 
resume"): Mandatory Maintainer Acked-by missing., aborting

Looks like maintainers Acked-by is required to push the patches into 
drm-misc-fixes ?

Regards,

Arun.

On 7/16/2025 1:21 PM, Arunpravin Paneer Selvam wrote:
> - Added a handler in DRM buddy manager to reset the cleared
>    flag for the blocks in the freelist.
>
> - This is necessary because, upon resuming, the VRAM becomes
>    cluttered with BIOS data, yet the VRAM backend manager
>    believes that everything has been cleared.
>
> v2:
>    - Add lock before accessing drm_buddy_clear_reset_blocks()(Matthew Auld)
>    - Force merge the two dirty blocks.(Matthew Auld)
>    - Add a new unit test case for this issue.(Matthew Auld)
>    - Having this function being able to flip the state either way would be
>      good. (Matthew Brost)
>
> v3(Matthew Auld):
>    - Do merge step first to avoid the use of extra reset flag.
>
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Suggested-by: Christian König <christian.koenig@amd.com>
> Acked-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> Cc: stable@vger.kernel.org
> Fixes: a68c7eaa7a8f ("drm/amdgpu: Enable clear page functionality")
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3812
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c   |  2 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h      |  1 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 17 ++++++++
>   drivers/gpu/drm/drm_buddy.c                  | 43 ++++++++++++++++++++
>   include/drm/drm_buddy.h                      |  2 +
>   5 files changed, 65 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 723ab95d8c48..ac92220f9fc3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -5327,6 +5327,8 @@ int amdgpu_device_resume(struct drm_device *dev, bool notify_clients)
>   		dev->dev->power.disable_depth--;
>   #endif
>   	}
> +
> +	amdgpu_vram_mgr_clear_reset_blocks(adev);
>   	adev->in_suspend = false;
>   
>   	if (amdgpu_acpi_smart_shift_update(dev, AMDGPU_SS_DEV_D0))
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index 215c198e4aff..2309df3f68a9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -155,6 +155,7 @@ int amdgpu_vram_mgr_reserve_range(struct amdgpu_vram_mgr *mgr,
>   				  uint64_t start, uint64_t size);
>   int amdgpu_vram_mgr_query_page_status(struct amdgpu_vram_mgr *mgr,
>   				      uint64_t start);
> +void amdgpu_vram_mgr_clear_reset_blocks(struct amdgpu_device *adev);
>   
>   bool amdgpu_res_cpu_visible(struct amdgpu_device *adev,
>   			    struct ttm_resource *res);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> index abdc52b0895a..07c936e90d8e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> @@ -782,6 +782,23 @@ uint64_t amdgpu_vram_mgr_vis_usage(struct amdgpu_vram_mgr *mgr)
>   	return atomic64_read(&mgr->vis_usage);
>   }
>   
> +/**
> + * amdgpu_vram_mgr_clear_reset_blocks - reset clear blocks
> + *
> + * @adev: amdgpu device pointer
> + *
> + * Reset the cleared drm buddy blocks.
> + */
> +void amdgpu_vram_mgr_clear_reset_blocks(struct amdgpu_device *adev)
> +{
> +	struct amdgpu_vram_mgr *mgr = &adev->mman.vram_mgr;
> +	struct drm_buddy *mm = &mgr->mm;
> +
> +	mutex_lock(&mgr->lock);
> +	drm_buddy_reset_clear(mm, false);
> +	mutex_unlock(&mgr->lock);
> +}
> +
>   /**
>    * amdgpu_vram_mgr_intersects - test each drm buddy block for intersection
>    *
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index a1e652b7631d..a94061f373de 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -405,6 +405,49 @@ drm_get_buddy(struct drm_buddy_block *block)
>   }
>   EXPORT_SYMBOL(drm_get_buddy);
>   
> +/**
> + * drm_buddy_reset_clear - reset blocks clear state
> + *
> + * @mm: DRM buddy manager
> + * @is_clear: blocks clear state
> + *
> + * Reset the clear state based on @is_clear value for each block
> + * in the freelist.
> + */
> +void drm_buddy_reset_clear(struct drm_buddy *mm, bool is_clear)
> +{
> +	u64 root_size, size, start;
> +	unsigned int order;
> +	int i;
> +
> +	size = mm->size;
> +	for (i = 0; i < mm->n_roots; ++i) {
> +		order = ilog2(size) - ilog2(mm->chunk_size);
> +		start = drm_buddy_block_offset(mm->roots[i]);
> +		__force_merge(mm, start, start + size, order);
> +
> +		root_size = mm->chunk_size << order;
> +		size -= root_size;
> +	}
> +
> +	for (i = 0; i <= mm->max_order; ++i) {
> +		struct drm_buddy_block *block;
> +
> +		list_for_each_entry_reverse(block, &mm->free_list[i], link) {
> +			if (is_clear != drm_buddy_block_is_clear(block)) {
> +				if (is_clear) {
> +					mark_cleared(block);
> +					mm->clear_avail += drm_buddy_block_size(mm, block);
> +				} else {
> +					clear_reset(block);
> +					mm->clear_avail -= drm_buddy_block_size(mm, block);
> +				}
> +			}
> +		}
> +	}
> +}
> +EXPORT_SYMBOL(drm_buddy_reset_clear);
> +
>   /**
>    * drm_buddy_free_block - free a block
>    *
> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
> index 9689a7c5dd36..513837632b7d 100644
> --- a/include/drm/drm_buddy.h
> +++ b/include/drm/drm_buddy.h
> @@ -160,6 +160,8 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>   			 u64 new_size,
>   			 struct list_head *blocks);
>   
> +void drm_buddy_reset_clear(struct drm_buddy *mm, bool is_clear);
> +
>   void drm_buddy_free_block(struct drm_buddy *mm, struct drm_buddy_block *block);
>   
>   void drm_buddy_free_list(struct drm_buddy *mm,
