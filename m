Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 927839940BC
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 10:13:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 176E610E48F;
	Tue,  8 Oct 2024 08:13:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DuxyUXfx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2063.outbound.protection.outlook.com [40.107.223.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F5C410E48F;
 Tue,  8 Oct 2024 08:13:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DEz/+ll8CFv8BGNQBxSBnYiC0DGrvjJVLMPtQPuRm1IUiHrkhmLPVkIGf4F/id4zaHQUcuKRmjoS8l6zmA1PncN9dyZdFLdBUUfUHgJzGlxe7ar98QVGepNHc50MBHbBMu0CTFlZpuFU0Am0Cje7ex/crwdbi7a/yXENqjPgzpOL9FKP8v4ZjmFXVZVYDjJy/SgOcbDo0yvm/fdN5VYEkTTW/+ljzkKOcRRVRnLbJLhe9TCzi58KSSSREURrk4/Zv13m5EAYrzDcLbBSKoAEy+BHAmXd3FWxqP9Mh4InarfOe7FnFwkLxU6His6wbXF39mXVqu+s1xHbYTpK00BqgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OPjyYMKXnWd8+qlBsYbXJqkxiyePPTLpJlN2j4B7g1s=;
 b=RCaxlqVW87wr0Yh+X+25hJ0PlDfSOAFR+bduDeCJnt/F4zdde+B34G3uORm1GPSI0+Lcc1cvcXoS+v3e2XoeR2I3YLeHB9AvcoZJosJPjBhOrP+SNMRx6XwAnzPAW3PIw/4GBYN9lw/2i6ndwtEI7btjD1HovkcLJpIEG822jKFBjcO4yN7lM76ztUmPrHWGgIhDU42PaALU8IHtINYxE3dS5LKCioGqU297vaPjFeekT++RE0bb77EgQqIfxpYALLKIFR25cS6fU7k6ijo/TY+rt7t6Mtnbkl0mtmsbYYPLTeGM3HKAR6M1zOpyrbyni2R0kvnrD/AXLSvF1wD67Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OPjyYMKXnWd8+qlBsYbXJqkxiyePPTLpJlN2j4B7g1s=;
 b=DuxyUXfxVBH0uZFDS6dSKCiVOeVghWDtxWciYPJT34SUBnDrFeQvtkGGRNF8BuombBXPGQDvFTrDZB2+zDsLiCNTXdGv2fbm1svYxgTeMvdCpz40WrJ4onKzymNFPfb8lhxNHge5nywdFJacCIDl1lU1bSaTpZ029WaDflWYIlk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB6813.namprd12.prod.outlook.com (2603:10b6:806:267::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Tue, 8 Oct
 2024 08:13:12 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 08:13:12 +0000
Message-ID: <45be3629-7d02-434d-ae2d-afd9b87bf036@amd.com>
Date: Tue, 8 Oct 2024 10:13:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/6] drm/amdgpu: alloc and init vm::task_info from
 first submit
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dmitry.osipenko@collabora.com, jani.nikula@linux.intel.com,
 tursulin@igalia.com, simona.vetter@ffwll.ch, robdclark@gmail.com,
 alexander.deucher@amd.com
References: <20241003124506.470931-1-pierre-eric.pelloux-prayer@amd.com>
 <20241003124506.470931-5-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241003124506.470931-5-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0105.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB6813:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a5309dd-b53c-41ad-f5c5-08dce7710d90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QWl1S05nVXkyVUMyYWJSQXJjUTNQUmxhd0VjTldpVkhmTEpvSUZRQXI4OVBq?=
 =?utf-8?B?STA2enFqYkNqVjFEZElaOUJRREJVNW9HYTZHQVJoOGR0bXVVL3YrTHJPVjRN?=
 =?utf-8?B?SWxxUjFiSnBVRGl4WEg3dmNBMHk4SUp4RnloSjR3bTcwcTFpZVV5Z1oyN2lY?=
 =?utf-8?B?SDZRcnRPWEl1ajVKbXpVVkkvNVFKN01rajZKY1Q5VGVJTjJaWlNZc2d3Q2hS?=
 =?utf-8?B?dDNwMlQyNVFESVROcVdPY1ZxdXRQMkhKbCs1TDlGTjVmWTZXOWFlTTg1N3Ix?=
 =?utf-8?B?VEtkUFVqdVJ3aUNBbDJZMnJpdnk2VWl1azE1cmhyWkI0Z0Q3TWhxSURjMXlO?=
 =?utf-8?B?U3lWSlUrTGVSek9IaDNmTnNEU1JPbnNXbXZ4SCtzdTMvUmlaRmo0N1BxTjNa?=
 =?utf-8?B?TTdaNXNoNGpIMnpIY05xNUIvdXh5ajdNR04xNloyOW1sNDdOMVdBU0JqMUl2?=
 =?utf-8?B?Zk5jY0k5NENlcnJCQWpnZDh2Z0hLdEV6ZjBQOWsrNGNtVEF6SVFoS0xpTTJU?=
 =?utf-8?B?VDVqOCtFY2FhRkZDZ25yOXJpVU9hR0lPa3NITlVjbk1MVVBSTWQ4MkV0Vjg3?=
 =?utf-8?B?azJ4ZjhTelpqaStSVjQ0cml2RjRTeS9ENEd1NGpZQmpnQy9lQ3lxb3hVV0RG?=
 =?utf-8?B?R3RJOW4wV0VSMHFWYUlyaGViVkxWZTZEcWNpcHRZLytSUnpIUGIvanMwZHdP?=
 =?utf-8?B?VWcrVUE0cUwyOTd3dEtiMDAxLzd1NnZWdWZhdEM1V1pFcDF3Um9jL1JjUUxL?=
 =?utf-8?B?akZKbElmOHk0Z2JwYUg5dzloRy83aDQ4OWx5ZDZXekZvMGlzWHlpRXAzZDY4?=
 =?utf-8?B?OUg0OE50Y0pLM1E3c1Z5SjNmSGhLN256OFJtR3kyZ3EwK24zRmd4aFMwVkFz?=
 =?utf-8?B?K1lxOHBFRXdaWWl6eTlqY2JOVWNDK2RMRFlrenNYYmZxb251QVBwOUdrMDh6?=
 =?utf-8?B?SmthUTZVMStQQUxNSHhyUkRwbHEzRC9Hb3dCWUQ5amY1TW1SSnpkK1gvZnl1?=
 =?utf-8?B?YmVLbTA5RW9yeVhsN21VUVpDZy9vY3Y4NUhlS21TOXBSUi8zS0RqUUN2TW1h?=
 =?utf-8?B?OG9wTWdhTHhYTVdqY3gzSUx5UGF1R1cvWWtLNTNZZlNHb0E0QTg5bzZ0K01i?=
 =?utf-8?B?ZUVOOXhzeGN6ZVZmRFVBNjd6TG1lUGZ0YXFEU0ladHFnc3BiMnNLQUhpVDJC?=
 =?utf-8?B?WU9JanU0MjBaSkhoZjBvNHY4TS9YRElsT2Q3TEVsNzdnd3IxN0N1dWR5TllC?=
 =?utf-8?B?cEZNK2RIRURJWHdKYWt2TmJPQVh1Slp4ZVYxZFFtbktiSG56MnNXRXJFWnFZ?=
 =?utf-8?B?U2hSM0RnNUZaYm16T0UwUC8yajAxRFhYVEFaNWhZNjhjQzdZNzN5TysyR1hO?=
 =?utf-8?B?ZFZwbzJpb2lIUllSc3hwVTd4dlRVY2t2U0hxMEFiMkVRV20yOHZGVjBscVhP?=
 =?utf-8?B?RDAzeHNBY3VkYkpHdXU0bDZqZTFiV3pyMzV6MHdHVjY4eTNUb0lsY29SV0tU?=
 =?utf-8?B?WFpyS2s3R0N4WFpLUVV3emVTQmovWWtkaklQQldEeHM2UDBaRlM2SmRqdHBi?=
 =?utf-8?B?a1JJWEdMZGpHaW5vbTBJR0J4MzgzVU9WQlFDL3BPRFdlRStsMmg2bXkrZitC?=
 =?utf-8?B?b2JpZURtdEhQWW1TRG5sbE5mKzBoZXBZa09HcGkvSGhJWU1VendFVlZXcEtj?=
 =?utf-8?B?cFhmYno1QnV1bnVldnJpWGdEdk1leTNMWmpHZUxBenkyb0J1eWk3N3d3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDhQR2daREgxVzBqdkZkWDJRWHBOOXRnWkZTUkoxUHBSM3k1a1RvWC9uQmdE?=
 =?utf-8?B?NXJUMS9TTWhIQkZObEI0VEZvMnJqbDVwbjB0UmNzcVYxbE9YZ3VIUWdVcFJR?=
 =?utf-8?B?djR3S1VTWTVhV1NROGZPZW1ZT1NwUnFHYVpVZ1VGQ3c1UFVQNC9jM0JFZE9j?=
 =?utf-8?B?OExPOWNNbWkvVVUxK3RialBSdFNIa3BRSHY4NDVRUk15bTFmQ2tlcW4rdm9t?=
 =?utf-8?B?UTV0WmVBUnNEcGZmV1ZMTjNmNFZQM0xUOXl6V09SZVl2bVJ6T0dGRUZZZFcv?=
 =?utf-8?B?TlZvNThWRW5GTzUxRGg3VW91dE15TkxRNkZWVlZJSkZHS3lnRk1NUGk3ZytF?=
 =?utf-8?B?NVl0am5KczJyT2lES3RmeTBjZXNyUXdlWVlaRlJGYVdibUFjWTJFVnhQSGIx?=
 =?utf-8?B?cUxmTmc5bTB1QzgxeGFFT1VmUHlVM09OTkhXcmErQVdQZEtFQjlTWG1NdW42?=
 =?utf-8?B?V051bGtzMGdtNmc5TG9jaUUrck1CbEdNTzJVclJUcUx6S0VTbnpiT0VMckhv?=
 =?utf-8?B?ekxBeUExQjh4Nlc4QzU2YlpyOFNlT2IwWmwzOWh0VFBmUnZzaU56MHNXRnlJ?=
 =?utf-8?B?M1RKQWovV0VRNHI5dkN4MWlZaWRFVG56MUxqUHRvUThwcEdFSFNDVW13bmE1?=
 =?utf-8?B?SkVGNDdBT2xqN2M5T3hoMUlFaVhYanMvT2MySkpvdjZ6WTRmcFRQOElQTWxW?=
 =?utf-8?B?blY3WmU4bzBDemFUeGVzNnlxOXphYStQOGdSWlVwenpXa3VLZndkU0djQ1Mw?=
 =?utf-8?B?akhoeGxkNXc1V2tPOEl3Ylc1cWFsM0hlTGJYbmZoeUE0eTJtSGpIYTVoTUl4?=
 =?utf-8?B?cGprYmdTMGZjYzFjbmVHRFAvWnRYQTBETis0a09kZzZhVzNDQVVEajZyK2lC?=
 =?utf-8?B?cEwwekZ1YXRSZ0JHcVRyZVhnSWlQT3NtZ1c4OUh4U1dVeWttWmF1dER4LzlL?=
 =?utf-8?B?QVZRNURXeVlid0d6eGNUTGtIS2tvSXN5UE15QWNhMUxZc2Q3bmRpaE8xYVFG?=
 =?utf-8?B?U0RxOHYyWGZUMmNweFVqbS9hcnV3R0ZRelFsMHcrUGx6OGFETDhkblhsRnNL?=
 =?utf-8?B?N3RGb0sycG5GQ1d3N1BzOTlMOXBHSlk3WVBTZG44K1dEYklrR1pTdVJxYnhy?=
 =?utf-8?B?K1VhSzZobkRwSHg0eEJjME1MSm94QWdmRUZkbVZjam5COEUwRWlZZmJWMVdG?=
 =?utf-8?B?b2hOc2o2WGtXYWFNcHoxUWlxSlFSZHR2NnR4cnRaL3dSNFhRVHFnYUJwbGU4?=
 =?utf-8?B?Y2EvS2M5cGtpMGRVU0Jpc1FIMWdrWllOYkh4bDh2ZmdYK1R1Y05sSW9nSXl2?=
 =?utf-8?B?bGFHZFJwRDVKUWZtU1RyL0dscE9Hci9TM05mVEczc2d4UGlUUklCRVZveWU1?=
 =?utf-8?B?TTVyNWtyZDErcnd2dEhBTjRWK0lxS3JJTXZsd1YwZkROVm4zclRBNE9nTkI1?=
 =?utf-8?B?aUdnMXlFNURuN0VHQ0NyLzkvZDV0OFRjYVE0cllxTzlBM0FvZjQxczFCcXRX?=
 =?utf-8?B?V0JScmJrdlNBQjlBampydmpFY290KzE0bEYvUXF6THZweDJzUXdaTlBvdk80?=
 =?utf-8?B?STI3cVowak85Smc2ZWlwb1RFZUErbUZMTEtDTnlhbW9BQXNhQng1UGwyRWlR?=
 =?utf-8?B?NDUwTVBrUmlvYVNiL1V0ZnVYQUpIVHhNUkt3TnBmMEp4V05oREZtSytlRnNz?=
 =?utf-8?B?WkhoN204QXZ4VHI3UE5VOTkzZDhXZmhlU2hsN29qWFlFdkdNVnB2QnZjVnU2?=
 =?utf-8?B?S0NOWkZETXBZTU11NmUwUkI4WWJOdDRUL3VTVUJKWDJKb2ZhODdYTlJVQnR5?=
 =?utf-8?B?NkFLZ1BhSWFTRkJ6UVQvWCtSb2R2SWpzT0cwQlVVUmIxMDZtcWJJWmh1WE8y?=
 =?utf-8?B?TmhZNFlhcDBCVDhvN251LzNrV1NRK0Y0RFY0dzhSc2hWL2hGa3FneWxnbjFj?=
 =?utf-8?B?SURzYzV1V2xNZ1FYQWZJNncrMzFSYy9tLzVrRk9ZNkt0YnVzUG9DYlVhM0Nu?=
 =?utf-8?B?aGUwUEVhK2E5OVRKUElRY092dFgrbHY1WVFHdThjSThVVW1WU3l2UmJrMzF0?=
 =?utf-8?B?VmMyOVo4bjZneGI1RUUzM3VYNHNHRkw4Smo5a3Nsby93Y1RxKzV0N2ZGanJq?=
 =?utf-8?Q?M1mfNbEV/N14vXynOrvCZ50LN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a5309dd-b53c-41ad-f5c5-08dce7710d90
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 08:13:12.6020 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A2SOIqA8fHKFLj5wAUfSJrBWy7VZ0YgSzpPA5R7mWmmV8uOg9widy/Wgo1BmgPAK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6813
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

Am 03.10.24 um 14:43 schrieb Pierre-Eric Pelloux-Prayer:
> This will allow to use flexible array to store the process name and
> other information.
>
> This also means that process name will be determined once and for all,
> instead of at each submit.
>
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 29 ++++++++++++--------------
>   1 file changed, 13 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index e20d19ae01b2..6cd5bd5362d4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -2331,7 +2331,7 @@ amdgpu_vm_get_task_info_vm(struct amdgpu_vm *vm)
>   {
>   	struct amdgpu_task_info *ti = NULL;
>   
> -	if (vm) {
> +	if (vm && vm->task_info) {
>   		ti = vm->task_info;
>   		kref_get(&vm->task_info->refcount);
>   	}
> @@ -2361,6 +2361,10 @@ static int amdgpu_vm_create_task_info(struct amdgpu_vm *vm)
>   	if (!vm->task_info)
>   		return -ENOMEM;
>   
> +	/* Set process attributes now. */
> +	vm->task_info->tgid = current->group_leader->pid;
> +	get_task_comm(vm->task_info->process_name, current->group_leader);
> +
>   	kref_init(&vm->task_info->refcount);
>   	return 0;
>   }
> @@ -2372,20 +2376,16 @@ static int amdgpu_vm_create_task_info(struct amdgpu_vm *vm)
>    */
>   void amdgpu_vm_set_task_info(struct amdgpu_vm *vm)
>   {
> -	if (!vm->task_info)
> -		return;
> -
> -	if (vm->task_info->pid == current->pid)
> +	if (!vm->task_info) {
> +		if (amdgpu_vm_create_task_info(vm))
> +			return;
> +	} else if (vm->task_info->pid == current->pid) {
>   		return;
> +	}
>   
> +	/* Update task attributes. */
>   	vm->task_info->pid = current->pid;
>   	get_task_comm(vm->task_info->task_name, current);
> -
> -	if (current->group_leader->mm != current->mm)
> -		return;
> -
> -	vm->task_info->tgid = current->group_leader->pid;
> -	get_task_comm(vm->task_info->process_name, current->group_leader);
>   }
>   
>   /**
> @@ -2482,10 +2482,6 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>   	if (r)
>   		goto error_free_root;
>   
> -	r = amdgpu_vm_create_task_info(vm);
> -	if (r)
> -		DRM_DEBUG("Failed to create task info for VM\n");
> -
>   	amdgpu_bo_unreserve(vm->root.bo);
>   	amdgpu_bo_unref(&root_bo);
>   
> @@ -2608,7 +2604,8 @@ void amdgpu_vm_fini(struct amdgpu_device *adev, struct amdgpu_vm *vm)
>   
>   	root = amdgpu_bo_ref(vm->root.bo);
>   	amdgpu_bo_reserve(root, true);
> -	amdgpu_vm_put_task_info(vm->task_info);
> +	if (vm->task_info)
> +		amdgpu_vm_put_task_info(vm->task_info);

That NULL check should probably be moved into amdgpu_vm_put_task_info().

Apart from that the patch is Reviewed-by: Christian König 
<christian.koenig@amd.com>.

Regards,
Christian.

>   	amdgpu_vm_set_pasid(adev, vm, 0);
>   	dma_fence_wait(vm->last_unlocked, false);
>   	dma_fence_put(vm->last_unlocked);

