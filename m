Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAE88326E9
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 10:47:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C47010E8E8;
	Fri, 19 Jan 2024 09:46:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2054.outbound.protection.outlook.com [40.107.94.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D2E110E175;
 Fri, 19 Jan 2024 09:46:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EAMEJL9+upwnUr5sqJorNNn5V6seuy0L1wbUnjHz1p7FEJqHHcHn9x0znImrjh5ilK8Qp8Z4cIxZiaVbrxbdS6RAUNLrXLFmtgGQNOURhN6JSQbkXEj7xabaI5DtUC+g8rfSSDjzc+V0Y8sUpRkg7wupVY6KjPIItjUSrxYF8O4Wcmm48Dq/G3e0dvf0hs/CWuuvj4Lx7s3ZSRE2t3zkdnAjVu4o5+L8dGN5n5GIViQ+0u0Cdjwp2OBD4SRnT6hR3WCrl08a+1MqO0Jk3QMopDK5xYnUQwlehiH3VXLGgfbU7JrdQNBAWH6MxrKhdm/6kPET3NwbJb+EHKaPQrTcpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FODVJsGNJ0LZPpVPz7B0dn7ZvS6bMd5BY0nylvvPAh8=;
 b=PahJkUsw2bgDPEFwVPgR10Cu07tQl+Lox4ReVqV1Gowd0qaG+kt7r279PAHIpOjXYJ6HXGKKrlRgnLPnBhJGsNJEvYXfKc0acYwjwyESpitC5LOHjm/KBX/QOi1cLPN7Pe4SZnbKwHrN/Ye8THlsc6WYsPxmHjxluDnSbq/v2Df4ee/u6U8AZ5Y+OMZPzhv+UHo93G6hknG3LS4DGYreUWHgwIxAUazy1v8gnrXSP8FvPPtJIG7xHDTRi020GCyklY/eaqsj7y7a/fua16iSprB1NU3MHMV7t2HcEoe85/c5DsZj8CoBSqeT2rgEppPqq+J5k3KZN3dqSwTOozFvYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FODVJsGNJ0LZPpVPz7B0dn7ZvS6bMd5BY0nylvvPAh8=;
 b=LJsLhq8IaPIkp/hLiqfTG3MM6ab4srsp4tURMkMR/K6uK2LBsru2RMlETwmiYmnlz6zdRSlAp/LzIChqb+bwHD9I2O5eMVbi/3azj3yoE6M2R0/BQnXcJPJ/X9aNnKk3QpRK43vYR5xlQW2YNFau2+vdRYnqfVXQmNnP2KzNwWM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB8511.namprd12.prod.outlook.com (2603:10b6:610:15c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 19 Jan
 2024 09:46:51 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 09:46:51 +0000
Message-ID: <b75961c3-097a-454a-a36e-6f0d11a0bf4a@amd.com>
Date: Fri, 19 Jan 2024 10:46:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/exec, drm/gpuvm: Prefer u32 over uint32_t
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20240119090557.6360-1-thomas.hellstrom@linux.intel.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240119090557.6360-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0028.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB8511:EE_
X-MS-Office365-Filtering-Correlation-Id: fb466b40-3886-4407-0851-08dc18d38fe7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PK/e3Xruc4oG0Pbv56QisJgUAAB0qZZ/7QrLsdZh++pyxaeDsQNxtgtdR+gvkbslLuEkCIpzYxj1D4yuUDxmcF9wbdFmR0G3ng75K9sXSR5CcauPtsMYPhsZKiyTOz9qlreqtb2F6fgguKt8FNkNRHPXEjDjl08MxkDhCCr9bp3taJR8Epgf6rGtHKeoyvrp1wLi00BCGdiFKTXf5AbJo4XDrrK1MXR0e6u/Z524fmY5zO8GI0dh8HhtRbM0Vs9FJkuoMURP5zVNcHPZp7dBVkF3+tkzn7hPye0JDxvlS7KeWHmLjJLWzauYdc4X00AZlU0TJWHRp5FydFjukzcZlH9R/TzCeKpDWtVoNKTz++X1F0WXacOCZdyacW278stDz2nq336byTWB/n3Z0OeIzg8fFOAwjHUoCM8MKbztijBANRvod3DV1rAxdMdttFBSsqWJMLxRtJYjNknkpTXhL7cQ4Kb0pFP8tjIHNcw7ARIYlSN1PVuXzVBKo00rBznMp6qbPxUjZtGMCId1wgQZPcJISmsVyiSYzhWZhceVFBsO+fGpmJd1b79h+mgc2O121RQqi3I5VTV+/H0HWco1jwpSRhyY1b1TNYp7mwyHo5THL6+xlP90bG4tFL1mcWPkomWDx56tw0EWl9MA6a+EeWIUeRjHKdB+3IM9sNf650yGIOvn07jr+6UFRf0QwdmJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(136003)(39860400002)(366004)(396003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(66556008)(66476007)(316002)(31696002)(478600001)(36756003)(66946007)(6486002)(8676002)(4326008)(8936002)(5660300002)(2906002)(38100700002)(41300700001)(26005)(2616005)(83380400001)(6666004)(6506007)(31686004)(6512007)(66574015)(86362001)(45980500001)(43740500002)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHZaL0ROemR1MDlNeGpDU1Q3UEd4M0ZCYWFKMzIwbjV6NUlkdHR5bVlsUHpY?=
 =?utf-8?B?OHRRWXEvblN0amtKYXhDRzZOOXJ4dzlHNnZFU0RDem01Tm4vNlBRVHgyQnkz?=
 =?utf-8?B?OVkzQWd5TUtldHYxV2ZJSUthNHJOdG9RZzJqSXpOZGVXNWI1TVFUZEZ0Q1g3?=
 =?utf-8?B?WkhXeTNDL0h3WEVIdzRJY0R4bnA0Q1I2WHIxREVIbVdjUStpcGVqaFZzMnR5?=
 =?utf-8?B?aHlzZFZ6QVJlbndmbW5uNnFCMzhzbTQvbFVENVFWQzBOYzJ6TWJjNlFrVC9Q?=
 =?utf-8?B?bXYwQmExaEo3eVUySzJ4MDRablJ4Y21nM05BcDhzUmQ2R09sRGhIQWdnNHk4?=
 =?utf-8?B?Y0w2RHNUdVp3cW9zWEE0L2tyMHNVM2VsR3lJUEIvcUl6dUVMMlVCRnc1MHdY?=
 =?utf-8?B?ckdqbEZ4Mm5XWWdZaHRiYUxRYzFkYWVaSzFMdmU2bjN2ZmV4eEwrRkRoYUlR?=
 =?utf-8?B?aktlUFkrNENxaXZsUitWclBBaFloRGRXTXdNZWRicnJZMGhzWVVrYmxtbExs?=
 =?utf-8?B?NFAxc1pKQUdmTU5ldUlhMFgzbjRtZUhmNlErblVTU3o5MXJra0ZIU2p4VDkx?=
 =?utf-8?B?b01SOVRsSWYvN0g3cU40V1RGdUNndWhJNnFGSVc2NXQxZXYva2FtMzRYUGZr?=
 =?utf-8?B?L1ByN2VQNng0MW9Ec1NsZitlMGRxQ0FqTU1qRi9mVEVZazJ3a1J0UmRvTERF?=
 =?utf-8?B?SklmNDVoRlBDVjg4RUtMR1ovVFY5blNERk9JYzB5dXQ3d283NGMyUHMvNWdG?=
 =?utf-8?B?WjNNdWJ1Z2s5dkhsUGsvcFFYd3FPb2E0MHFreG5pa1BpNkIxdU1ndng5MldK?=
 =?utf-8?B?dEhVZVhEMG5qZGkvakIremJNRWhyVG5rQ2FOQnI2YmllaWp6ZXI2b2o3eUl3?=
 =?utf-8?B?Njg2WUFYemdqc2Q5RkxiZytXcWVsWUhmcFg2MUtpcmtRck5kaUk3Wjg1Ynhm?=
 =?utf-8?B?Qm5BTzVjc3g4M3VkMlRZNVhTMEZEdzlwL2JnMWlsbjhvTUpONVd1ZXFhaTFS?=
 =?utf-8?B?RGpVVXNnTVRjY01Eb3ZYVTcxcFU5L3NXQjlVSFBDSUI5dXp3Y3Q5am5QSWtZ?=
 =?utf-8?B?eC82UjJiQVZMbmM1WDBST3kyR1JYL3ZNQkN0bklqSHpxd3NSSlluUDlQV28z?=
 =?utf-8?B?UWJ4cTZCUEtkTUtsQTBPNWtMK3BMVTlsTmxNZFNaM01iU0JkYjhxUmxXWU5r?=
 =?utf-8?B?NXRPbnRHTXNrZEsvNzZFSDAzakhKNDRJdHRXSm5YV3BFTTlIWE53TlZRYVJP?=
 =?utf-8?B?U3RMMFNJY05razFuRXRZRE1rbjVhTWJTcy9GTTNWQzNLV0RtYVo3aFdLZ3kv?=
 =?utf-8?B?RGUzbERrOHBTWUlOQ3lZd2kyT1JLTTI3a1FOYkxZZVVOZmNSN0FyU0l5TnlV?=
 =?utf-8?B?WE5XaU02SUJBQ2t2NCtweTdOWXdiUGhkaDBwcHlPblVDNllaM1J3SG1KODF6?=
 =?utf-8?B?WEJremVLb2lSUkZaQ2hGZHhNU1VKcDJVRnZjVWErUkF2ZmJEQmc5Tm1BRmY2?=
 =?utf-8?B?d3pML0JNTmpRTXoxZ3E1R2xBaFNmbFVYVTZLT0JLV3JjYlBiZk9rbjNhd3pw?=
 =?utf-8?B?bmtJeFRGRjhjUXJQKzlIZW4zRFZhbmJ6VHYzaUlsaDIyRzNVVkI4T2x5bFhG?=
 =?utf-8?B?ZGg1WFdwejFMdFJROGNIUmhoSWZncnUrMDE2dzFFRkNTanpXY0ZsZUFoc2V5?=
 =?utf-8?B?UWVnWGluSHhtOVc4bmlaam9Fbi9oV2ZyRWlIOFdTUlI1cy9HVTNrbEpNWkFk?=
 =?utf-8?B?WXV6Zk5GdURBSWF3dnBSTXcvNG42Mk1oKzk3NlVEUnp4eXIrRjgrTXVhWEhi?=
 =?utf-8?B?Z1NpTXlHVm5GVWtaZ1JVNS8yTHplMGNmbVFRMSs5OXhmUzAyK1dDS3o2dzZV?=
 =?utf-8?B?QTBaQWg3VkFLVG1tY0FOWXFNUWw2eGZNQXNYTlM2MkZuZFZocXEzbXpoRE1I?=
 =?utf-8?B?YUtpL1ZWeVdZb1FmYkwzb0xxS2xlMFUydElpVVA1cUxQYVhsZGVJbXRFbFdJ?=
 =?utf-8?B?M096b2c5ODBnYVdpR2RUL0hXTEZVK2NZYlBHb0tyRXlUSWVkK3ZtZ1NLZ0tL?=
 =?utf-8?B?TzZwNlVzOGh0U3NWUjUybklDa0JoQktlU1A0cHlyTjU4NHp1ellQWHpHc0Ny?=
 =?utf-8?Q?k0dmdBJCV94Skl+veIjvOVzAR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb466b40-3886-4407-0851-08dc18d38fe7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 09:46:51.2432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v3h4I3/Qa+ZiJeIYTr7KSbnpSF0EcUpO3jN4gOyWzCetCi7NJvvfWd5+rL256h9X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8511
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
Cc: Danilo Krummrich <dakr@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 19.01.24 um 10:05 schrieb Thomas Hellström:
> The relatively recently introduced drm/exec utility was using uint32_t
> in its interface, which was then also carried over to drm/gpuvm.
>
> Prefer u32 in new code and update drm/exec and drm/gpuvm accordingly.
>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/drm_exec.c | 2 +-
>   include/drm/drm_exec.h     | 4 ++--
>   include/drm/drm_gpuvm.h    | 2 +-
>   3 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
> index 5d2809de4517..20e59d88218d 100644
> --- a/drivers/gpu/drm/drm_exec.c
> +++ b/drivers/gpu/drm/drm_exec.c
> @@ -72,7 +72,7 @@ static void drm_exec_unlock_all(struct drm_exec *exec)
>    *
>    * Initialize the object and make sure that we can track locked objects.
>    */
> -void drm_exec_init(struct drm_exec *exec, uint32_t flags)
> +void drm_exec_init(struct drm_exec *exec, u32 flags)
>   {
>   	exec->flags = flags;
>   	exec->objects = kmalloc(PAGE_SIZE, GFP_KERNEL);
> diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
> index b5bf0b6da791..187c3ec44606 100644
> --- a/include/drm/drm_exec.h
> +++ b/include/drm/drm_exec.h
> @@ -18,7 +18,7 @@ struct drm_exec {
>   	/**
>   	 * @flags: Flags to control locking behavior
>   	 */
> -	uint32_t		flags;
> +	u32                     flags;
>   
>   	/**
>   	 * @ticket: WW ticket used for acquiring locks
> @@ -135,7 +135,7 @@ static inline bool drm_exec_is_contended(struct drm_exec *exec)
>   	return !!exec->contended;
>   }
>   
> -void drm_exec_init(struct drm_exec *exec, uint32_t flags);
> +void drm_exec_init(struct drm_exec *exec, u32 flags);
>   void drm_exec_fini(struct drm_exec *exec);
>   bool drm_exec_cleanup(struct drm_exec *exec);
>   int drm_exec_lock_obj(struct drm_exec *exec, struct drm_gem_object *obj);
> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> index 48311e6d664c..554046321d24 100644
> --- a/include/drm/drm_gpuvm.h
> +++ b/include/drm/drm_gpuvm.h
> @@ -514,7 +514,7 @@ struct drm_gpuvm_exec {
>   	/**
>   	 * @flags: the flags for the struct drm_exec
>   	 */
> -	uint32_t flags;
> +	u32 flags;
>   
>   	/**
>   	 * @vm: the &drm_gpuvm to lock its DMA reservations

