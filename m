Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44685908D76
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 16:33:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8FC710ED7D;
	Fri, 14 Jun 2024 14:33:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JK8sqQ/v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2043.outbound.protection.outlook.com [40.107.237.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A85EA10ED7C;
 Fri, 14 Jun 2024 14:33:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ACrzO9Zc1IplOgf0kiFr9cOiLDEGIJoyDrV8tP7Qxg/IiEo9hJpmb7PfDA5W7v+AoNxfb9yUdrUO7wTvllgAvygp3UgMZMPUeeaEcruGdax3CFBlml5ch1QpwsYox++O3XY5+BXWUo/em8sGx+K1SvJr/i8Oc9MuMGLlapd/h3jsQ2xYnLdRJUbxkTBTrG4NCLzAPs/QtCNNyouWbxUcHIlc/wiyzwo7DHeEuyqyDY76saLoawRDPXkPaBFogV8M1uz5hOe7xAeV4D2ZR2HyZqKMn2GiaQhJ/CkSapWvNBG9JddL4YhFbDtJorUEUoasYeK1Z8gAALATm0qPma1ZXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jfovN5Cd5EkSkp/m7J8CevcIaa2J0EUhaH4lE/RxucE=;
 b=PoSnE19Q21CyrF/3UQcIYMxisAJruEedHCfzf/ooQBmbu+b4Qi3STS67elvUPY5N3vBm9DM8Bi0CA3UnwKFK/SxDJpgqiljOEruG/mvNSLVrBHo9MbLQIRSUQYGP5YMDuz/SbtWdZ5bECBurMkEBrRA6LrdL+DbEy3oNVcMoXzJce8GndPMljlfupVjDQLMjKknzC/tHj3LPD2XIkXwDpjz9w44HgEErf8wv+JPZx/I5dcTuJIqa4LM00jpBWy6g2240ZWJJ8RFnQBGtlBHpZJBMYqLpyFbWRE6G6MJi6XF2sUhV/HFs4NVXFKMAW/6oPFiG9a6HkIpxj2GNoNSbNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jfovN5Cd5EkSkp/m7J8CevcIaa2J0EUhaH4lE/RxucE=;
 b=JK8sqQ/v5SYUonKjIP8UDM+iQu43LYTEFne1I1Hrw94unJEn3SbFHpb/RKUhx1UsyCcHf0GRJXyD+KwzgkTqYUovv68OGuTN8SAn96sElhcKVhIE6HeZSWSRTr6BAmOWwgs0lYZFene8NApuFIKZAd2GxqKIoxO/1hhoZ4oqBwM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by MN0PR12MB6002.namprd12.prod.outlook.com (2603:10b6:208:37e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.20; Fri, 14 Jun
 2024 14:33:11 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062%2]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 14:33:11 +0000
Message-ID: <e597ad20-bd31-4388-ac75-50ecaf7c0cd2@amd.com>
Date: Fri, 14 Jun 2024 16:33:03 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] drm/ttm: Support partial buffer mappings for
 ttm_bo_vmap()
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, ray.huang@amd.com, kraxel@redhat.com,
 airlied@redhat.com, suijingfeng@loongson.cn
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
References: <20240614133556.11378-1-tzimmermann@suse.de>
 <20240614133556.11378-4-tzimmermann@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240614133556.11378-4-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::22) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|MN0PR12MB6002:EE_
X-MS-Office365-Filtering-Correlation-Id: ca6122cc-325f-43b1-8cb1-08dc8c7eeaae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|366013|376011|7416011|1800799021|921017; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SWxtWURjcG43TkFKdTk4UGVybFBoeFZWSjVSd1dFUWZPV2I1dkRtMS8vUDdW?=
 =?utf-8?B?eHkvVzdPQ2VrYlM0S214WkQycFd2L3plN2U0VFRLbzhsTjdCNGEyVDVtWE1O?=
 =?utf-8?B?R1laK3ZNRFRISmxXUUpObVhJRlVBYS96Qk1nYWxHaW15QnlGYmVBLy83TE1r?=
 =?utf-8?B?SkJvaW5hNXkyWGloNHVFUlArVVpuVkp4ZTJqdFI3U2ZlcjZTbUVwemN3ekFR?=
 =?utf-8?B?RGJZc1Z0OTlXWU5ETVI2cEtKdGd4RS9TdkUwUDh4bHR6MVBWTFlFN2lpcUhj?=
 =?utf-8?B?RElkQnhHYnJISjZER3Q3dFdWL1laODF1eStXeXhIOTYrdXd4MFlNcnJDWEZn?=
 =?utf-8?B?WW5hbGdUNjhjeWx2Nms1alppRXZnL2dya0oxdHNHdnNQaHVqdTBSeXU4NnF0?=
 =?utf-8?B?TngzelVSYkxxTzl6S2Fnb3IxS3ZmUFVzNFVHeVlyREZWSE5PY1hwZEdGNDE2?=
 =?utf-8?B?d0Q2ajJMSUptcWU1ZjFyeCtPS3lqQVpOZU9HVVAvcmswU0ZMVWw1aHgvS0NY?=
 =?utf-8?B?Z2tRN0hMS1RZTFhmS0c2MXBUTktxc1YxM1hTSWs3ZDZOYnJZTHRRcmxoSFNy?=
 =?utf-8?B?QkxpdEZ4R3o4M1JhbngrNWEwVFlIT3RDQU4yZnpOOWpUeUFha3ltb291dlEv?=
 =?utf-8?B?blk3d3MvQWFGYU1vbVlNMGV0eE9KK3UrczlVYkJzUVdjM29tWjlaVXFRYXJl?=
 =?utf-8?B?aWhqZEp2QldScmlSTEUvTkRQWkt5K1o5Mk02d0RuelpVMWczNW9LYmo4VGVr?=
 =?utf-8?B?UUhncG1GTDFhRDlsWnRCRlRUd05ja0tvYmZ1OHRJNHJkKzJ4cm1IWjUvMVhm?=
 =?utf-8?B?RGxKM0QxUy9nY3FXOFdGVWtYSURPaFg4RGlaY1NPRnhDOGY3S0RSMmVsR2Q0?=
 =?utf-8?B?NWw3Slg2cmF1Q1VSWUlxeUFxb1lYQmpiUEw5bWpqVk1TZ3BCTXM2WXFXcXJv?=
 =?utf-8?B?eUowMkJGYmdtU3BjRmVaWTA0cDcrdzhQK2VCM0lITDZLYXZmcVhvR3EyL3U2?=
 =?utf-8?B?d1V2UlFPdkNDd1kyLzVwdis1d3lIREluNTJaOGNVWStrUk9aNkdLbzBrNGJ3?=
 =?utf-8?B?eWI0ek4vTjI4NGVxbS8xUnJ1UTJWRFRtWnBQM3I1ektWTlNiakIrR0xNeGhZ?=
 =?utf-8?B?VnJOZmYzNVdRbUkxODFDRzg3WkFOajNnNXlEdmlHWEM2SFNYQ1JYdS94NjJP?=
 =?utf-8?B?VTUva1JEOG5SeGMzdDFyOUlhdUk0V096VUsyTVFGWWRvUmR5MHZlcEljeXY4?=
 =?utf-8?B?Mjh1ai9DWk5acU91QjhNUXJNOG9sQktSMHhraVJJT3FxUWIwUWcvcXROSjFS?=
 =?utf-8?B?RFVoUjJTMWR5cDNzNHpiUEk1d0dZNEZFaFNueEs5YTVCOFh4N24rOVZzRE5R?=
 =?utf-8?B?bzJOU29Ec29XU0NVMWdTZnBFRmVGaE1IcktpTWNHMTZ0YWY2aGx4QUxqcmk3?=
 =?utf-8?B?NTRPRlZDUUI3K0w0cFg5S1R4cFBibUxtdm1XbjYxMjlweDZtOXRiSXBVVDNJ?=
 =?utf-8?B?SVRLSFY2ME41QTdjYU4zM2JSNDhuRFI2c0dtdWtBYTdadm9LZnVSVEhySGVw?=
 =?utf-8?B?ay9HTzd2OVMybnhPVjl4ZkJWMHNDZmFxVU1pSnhLdm13NlZTVDBKWjlVRGlw?=
 =?utf-8?B?MzNZbzdhU3NKMFVQbWhoaEw4RlFPU01yM1RXbDhEVFNEV1E1WG9jWkNrYzJI?=
 =?utf-8?B?WStTVjFJME1tMEJ2T0ZGZGVXNUhIaTVTWUdoRkZLM1JxVE03VGtqc041N1V3?=
 =?utf-8?B?WnZVVUtsOEZBRUxZY1dvTStCYnVyQjI5UnpOdTUzMDBZNWNkblBQWndSUy9s?=
 =?utf-8?Q?8PXZg+lQPAduEG+Kv2dMUZ1IXsSMF7RrLqUJU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(7416011)(1800799021)(921017); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjZaUWRoVFdSZlIwaW1NTWl0MUhXMm1ydnBvYU9QMDl6b1ZwVzdGYjNZcXgv?=
 =?utf-8?B?T1dabVJaYlY1UWFyTGI1UTF4emk3eHlXejRmR2RJZ2hhTFB6NFBlQzlZUWRG?=
 =?utf-8?B?ZmRMVTJsdVB5Q3BvOWJMcWhScGlpK1VCaldCTGNEbXUzKzhoOTNtSmNnVkNB?=
 =?utf-8?B?S2pHU1o3dVZ6TkJvZVM5S0ZjclVnZWgvMlErRGh0U3NGSFdUQW5pekU4Q0Z6?=
 =?utf-8?B?bHJtNjZzUFlHZzgwNVRzdS9HSG1XL3RYUUlzV1hpVnpVT0NjaTcrbWtjWWJY?=
 =?utf-8?B?NS80Ymt5VVY4TisrSFlpaWV0V0d1eUo2c2lVZVlKc0J0d2dwcUt1aUcwemg0?=
 =?utf-8?B?azZxbWhJRjQ2Sm1XT3cyaTVNRWU2a0ZEY2Y5ekdCOUNIZEFFTlMxeC9rZGNz?=
 =?utf-8?B?ZkUvbDJVR3Q0b3pGL0MvYitpQW12ODRaOXkrWkRmdFJmSHZYMHhZQ1dmdDRa?=
 =?utf-8?B?RVkxZE1WSnBmTDFRbWJMbWJQOVlaRnRnSnZHdk1SMFZPbHE1M1YzWWNzTU1u?=
 =?utf-8?B?djdqRFQ4SUJGbGhmTHNtME9hY2M5TEp6Z0QxT0FxVHZNV3B0ZkplVnE1UnYy?=
 =?utf-8?B?c2h0dDBkOWptT2hMTExWSjVzODl4aHFBb1RVdlFJL1I2aUR5T29xdDYwdWhJ?=
 =?utf-8?B?NXYzVnJMRkFjRldPS01TcnYwWERGZkNsWEZzbjczOEpoTWpyaWxjaFZNN3R0?=
 =?utf-8?B?dmtlRXk1dmVXc3ZTbThjajV6ZkFweFBWd045UWdWMlo0enB6UVkxcnE3V2F4?=
 =?utf-8?B?T2tPbmRVaE4yNitUc3VCejFRSEp2SmxISlBXWkJSYUE3UjVjMnMrUFJnL0Iy?=
 =?utf-8?B?SWhkd1EyZFRER2JFL25VWm00WkNoSzNTUkNzaDNYV3hkaklXYnY1b3dPVGhT?=
 =?utf-8?B?Q2wyYmVxUDhYWGw1NDZ2TlhFTDI0VEtQY2JCSXdlV2ppVVkraWFNTGQvaFd2?=
 =?utf-8?B?Y2lvdkZCRy9uZmhnRHhvdnJEUjJsdUVtL0dVUE9rempDZmQ4NnBnNlBKMThW?=
 =?utf-8?B?VFRhQitjbE5yK1dvVlNkWGJEWUVUTDZHZTJPaWJJTHBRK0M3UlUrc3RZbFlq?=
 =?utf-8?B?YWh0WDVEVVFNYnFpUjBVTHMzMHF6NU42N0FGYmtkSndjZlRhNGpWekFxbTl5?=
 =?utf-8?B?WnZJRXdiRkx5TWVlazVrVUpneFZYa3RVQ01qTWZTRm8zSnRkRFdmNXpnZGgx?=
 =?utf-8?B?UGZDdkU5cjJCTmxFNXo0cFg0dDNKSVpIWndtTFYwcFVCOXJpREV4anpuYzls?=
 =?utf-8?B?K2ZWMW9aalNwaWNqZGxYNkdNL2JaRnpVM1BXREl1NlZ6Zzc2NHd3cEZpdy9k?=
 =?utf-8?B?OXFNbjJ3a1EvZDJPZlBOV1JGWGJTeWZnSzhvYk4vWG1lUTR4M3A5aVdLbGJw?=
 =?utf-8?B?L3o3REZ1TmV1c0dGMi9XV2oyRmNNeFF6TlFOWGthTHFydVFOT1pzQ3pXTkta?=
 =?utf-8?B?QkxzN2Y0bWJYaUxWTFI0dFllQlUzd1BvMWMzRFdIbnpKeEptWENFS25jOVFr?=
 =?utf-8?B?VmNLYldFc20xcHd4Sk5tbkhJVzZMRG05M3RnYnBkVzNhbC9sMUVKdXRxeUx5?=
 =?utf-8?B?dUk2QWQreHhVV1ArOGJVei9OUnI3QVdTTlFPTGFyS1VFekVYYnpTMHRLclNM?=
 =?utf-8?B?N1liWjBxcGpCbVR1TWVIZlQ5SndXbE1URDdSYmlJVFJxZU96bHB2YmM4MFBP?=
 =?utf-8?B?dm8wc0k4bXhkL0l3U3cyM0NDUUpLVElZVkJ0NEtoRmNrb0h5eTZnckpySEk0?=
 =?utf-8?B?YjlOUDVsTVZkUUxFK0R2SXJ3YlVkWEYrNXdCWGFRTklEaHVMVlZIQ3d1Q1ZU?=
 =?utf-8?B?ZTVUN1BRVUZJeGoyNWs5Ni9WbEFZS2FDUThBMnozbndiSXRVSHlzc2NZUzBP?=
 =?utf-8?B?UXdwbVhpT0l1OVB1RGl4aytmYUZqdytDVkV3ZllkT3I4cHhNUmlCY1lUYWF2?=
 =?utf-8?B?UWFGL3lrei9DODNEbFlhL1BNYXBSS1JEUitjS3daQVFHR3p4OXUyckZzVFky?=
 =?utf-8?B?cXQyZzBCQXZMeHBhT013dFdtY2h1dTRmcE9oaGtzb2JsZFlpT3Byay8yZmp6?=
 =?utf-8?B?ZFVhMThjUWVYc005akJrQnNUWWUrTnk4eHA2aGQ2bmUzVldsS0puNkpTbjZs?=
 =?utf-8?Q?MEsB6UhJRFSYZvts8m0doJR2P?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca6122cc-325f-43b1-8cb1-08dc8c7eeaae
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 14:33:11.3724 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Jjh2wRCCjn8ZADQQc3snn2w+R+qzga7QtbxM0Gut3yNhTUYOABTuZctKWbB1a70
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6002
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

Am 14.06.24 um 15:21 schrieb Thomas Zimmermann:
> Add offset and size parameters to ttm_bo_vmap() to allow for partial
> mappings of a buffer object. This brings the functionality on par with
> ttm_bo_kmap().

Well the long term plan was to remove this functionality from 
ttm_bo_kmap() and nuke that function sooner or later.

What exactly is the use case for partial mappings?

Regards,
Christian.

>
> Callers pass the byte offset and size within the buffer object and
> receive a page-aligned mapping of the buffer object's memory for the
> specified area.
>
> Also update all callers of ttm_bo_vmap() for the new parameters. As
> before, existing callers map the buffer object's complete memory.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/drm_gem_ttm_helper.c  |  2 +-
>   drivers/gpu/drm/drm_gem_vram_helper.c |  2 +-
>   drivers/gpu/drm/loongson/lsdc_gem.c   |  2 +-
>   drivers/gpu/drm/qxl/qxl_object.c      |  2 +-
>   drivers/gpu/drm/ttm/ttm_bo_util.c     | 21 +++++++++++++++------
>   drivers/gpu/drm/xe/xe_lrc.c           |  2 +-
>   drivers/gpu/drm/xe/xe_vm.c            |  2 +-
>   include/drm/ttm/ttm_bo.h              |  4 +++-
>   8 files changed, 24 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gem_ttm_helper.c b/drivers/gpu/drm/drm_gem_ttm_helper.c
> index 3734aa2d1c5b5..f26b7c9077a68 100644
> --- a/drivers/gpu/drm/drm_gem_ttm_helper.c
> +++ b/drivers/gpu/drm/drm_gem_ttm_helper.c
> @@ -67,7 +67,7 @@ int drm_gem_ttm_vmap(struct drm_gem_object *gem,
>   {
>   	struct ttm_buffer_object *bo = drm_gem_ttm_of_gem(gem);
>   
> -	return ttm_bo_vmap(bo, map);
> +	return ttm_bo_vmap(bo, 0, gem->size, map);
>   }
>   EXPORT_SYMBOL(drm_gem_ttm_vmap);
>   
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
> index 6027584406af6..1670f9a459a9d 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -398,7 +398,7 @@ int drm_gem_vram_vmap(struct drm_gem_vram_object *gbo, struct iosys_map *map)
>   	 * no mapping present.
>   	 */
>   	if (iosys_map_is_null(&gbo->map)) {
> -		ret = ttm_bo_vmap(&gbo->bo, &gbo->map);
> +		ret = ttm_bo_vmap(&gbo->bo, 0, gbo->bo.base.size, &gbo->map);
>   		if (ret)
>   			return ret;
>   	}
> diff --git a/drivers/gpu/drm/loongson/lsdc_gem.c b/drivers/gpu/drm/loongson/lsdc_gem.c
> index a720d8f532093..f709960c781b9 100644
> --- a/drivers/gpu/drm/loongson/lsdc_gem.c
> +++ b/drivers/gpu/drm/loongson/lsdc_gem.c
> @@ -77,7 +77,7 @@ static int lsdc_gem_object_vmap(struct drm_gem_object *obj, struct iosys_map *ma
>   		return ret;
>   	}
>   
> -	ret = ttm_bo_vmap(tbo, &lbo->map);
> +	ret = ttm_bo_vmap(tbo, 0, tbo->base.size, &lbo->map);
>   	if (ret) {
>   		drm_err(obj->dev, "ttm bo vmap failed\n");
>   		lsdc_bo_unpin(lbo);
> diff --git a/drivers/gpu/drm/qxl/qxl_object.c b/drivers/gpu/drm/qxl/qxl_object.c
> index 5893e27a7ae50..9f06d5e26a32c 100644
> --- a/drivers/gpu/drm/qxl/qxl_object.c
> +++ b/drivers/gpu/drm/qxl/qxl_object.c
> @@ -164,7 +164,7 @@ int qxl_bo_vmap_locked(struct qxl_bo *bo, struct iosys_map *map)
>   		goto out;
>   	}
>   
> -	r = ttm_bo_vmap(&bo->tbo, &bo->map);
> +	r = ttm_bo_vmap(&bo->tbo, 0, bo->tbo.base.size, &bo->map);
>   	if (r) {
>   		qxl_bo_unpin_locked(bo);
>   		return r;
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index a9df0deff2deb..31f9772f05dac 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -457,17 +457,23 @@ EXPORT_SYMBOL(ttm_bo_kunmap);
>    * ttm_bo_vmap
>    *
>    * @bo: The buffer object.
> + * @offset: Byte offset into the buffer.
> + * @size: Number of bytes to map.
>    * @map: pointer to a struct iosys_map representing the map.
>    *
>    * Sets up a kernel virtual mapping, using ioremap or vmap to the
>    * data in the buffer object. The parameter @map returns the virtual
>    * address as struct iosys_map. Unmap the buffer with ttm_bo_vunmap().
> + * The address stored in @map will be aligned to the next lower page
> + * boundaries.
>    *
>    * Returns
>    * -ENOMEM: Out of memory.
>    * -EINVAL: Invalid range.
>    */
> -int ttm_bo_vmap(struct ttm_buffer_object *bo, struct iosys_map *map)
> +int ttm_bo_vmap(struct ttm_buffer_object *bo,
> +		unsigned long offset, unsigned long size,
> +		struct iosys_map *map)
>   {
>   	struct ttm_resource *mem = bo->resource;
>   	int ret;
> @@ -483,18 +489,18 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo, struct iosys_map *map)
>   		u16 alloc_flags;
>   
>   		if (mem->bus.addr) {
> -			vaddr_iomem = (void __iomem *)mem->bus.addr;
> +			vaddr_iomem = (u8 __iomem *)mem->bus.addr + offset;
>   			alloc_flags = ttm_bo_map_premapped;
>   		} else if (mem->bus.caching == ttm_write_combined) {
> -			vaddr_iomem = ioremap_wc(mem->bus.offset, bo->base.size);
> +			vaddr_iomem = ioremap_wc(mem->bus.offset + offset, size);
>   			alloc_flags = ttm_bo_map_iomap;
>   #ifdef CONFIG_X86
>   		} else if (mem->bus.caching == ttm_cached) {
> -			vaddr_iomem = ioremap_cache(mem->bus.offset, bo->base.size);
> +			vaddr_iomem = ioremap_cache(mem->bus.offset + offset, size);
>   			alloc_flags = ttm_bo_map_iomap;
>   #endif
>   		} else {
> -			vaddr_iomem = ioremap(mem->bus.offset, bo->base.size);
> +			vaddr_iomem = ioremap(mem->bus.offset + offset, size);
>   			alloc_flags = ttm_bo_map_iomap;
>   		}
>   
> @@ -510,6 +516,9 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo, struct iosys_map *map)
>   			.no_wait_gpu = false
>   		};
>   		struct ttm_tt *ttm = bo->ttm;
> +		unsigned long start_page = offset >> PAGE_SHIFT;
> +		unsigned long aligned_size = size + (offset - (start_page << PAGE_SHIFT));
> +		unsigned long num_pages = DIV_ROUND_UP(aligned_size, PAGE_SIZE);
>   		pgprot_t prot;
>   		void *vaddr;
>   		u16 alloc_flags;
> @@ -523,7 +532,7 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo, struct iosys_map *map)
>   		 * or to make the buffer object look contiguous.
>   		 */
>   		prot = ttm_io_prot(bo, mem, PAGE_KERNEL);
> -		vaddr = vmap(ttm->pages, ttm->num_pages, 0, prot);
> +		vaddr = vmap(ttm->pages + start_page, num_pages, 0, prot);
>   		if (!vaddr)
>   			return -ENOMEM;
>   		alloc_flags = ttm_bo_map_vmap;
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index c1bb85d2e243f..3a68fe6d592ed 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1595,7 +1595,7 @@ void xe_lrc_snapshot_capture_delayed(struct xe_lrc_snapshot *snapshot)
>   		goto put_bo;
>   
>   	xe_bo_lock(bo, false);
> -	if (!ttm_bo_vmap(&bo->ttm, &src)) {
> +	if (!ttm_bo_vmap(&bo->ttm, 0, bo->ttm.base.size, &src)) {
>   		xe_map_memcpy_from(xe_bo_device(bo),
>   				   snapshot->lrc_snapshot, &src, snapshot->lrc_offset,
>   				   snapshot->lrc_size);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 99bf7412475c0..81306c32f5d09 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3485,7 +3485,7 @@ void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap)
>   
>   		if (bo) {
>   			xe_bo_lock(bo, false);
> -			err = ttm_bo_vmap(&bo->ttm, &src);
> +			err = ttm_bo_vmap(&bo->ttm, 0, bo->ttm.base.size, &src);
>   			if (!err) {
>   				xe_map_memcpy_from(xe_bo_device(bo),
>   						   snap->snap[i].data,
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index 6ccf96c91f3ae..c421ffe3563b1 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -375,7 +375,9 @@ int ttm_bo_init_validate(struct ttm_device *bdev, struct ttm_buffer_object *bo,
>   int ttm_bo_kmap(struct ttm_buffer_object *bo, unsigned long start_page,
>   		unsigned long num_pages, struct ttm_bo_kmap_obj *map);
>   void ttm_bo_kunmap(struct ttm_bo_kmap_obj *map);
> -int ttm_bo_vmap(struct ttm_buffer_object *bo, struct iosys_map *map);
> +int ttm_bo_vmap(struct ttm_buffer_object *bo,
> +		unsigned long offset, unsigned long size,
> +		struct iosys_map *map);
>   void ttm_bo_vunmap(struct ttm_buffer_object *bo, struct iosys_map *map);
>   int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct ttm_buffer_object *bo);
>   int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,

