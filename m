Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2D93ED317
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 13:34:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D12C889DA7;
	Mon, 16 Aug 2021 11:33:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2085.outbound.protection.outlook.com [40.107.101.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CE6789DA7;
 Mon, 16 Aug 2021 11:33:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YFutBzzq2cBQuVhY3YEfqfrVRI8COoMbUQlNTJyiYCj1yMTs8ssgWRy9LfUuSEO0dkkj9oNBjlwxQW4lsNeimf6FkaakWhWsSEJ7NCK0kkKHMhdnkHrRfL/kil+7Xl74lWMT1iFCvFQNJ+tikEZcavQqtl80f5fEHCQbbXK4xB1F8srlDHZ2iOVaRHVYosYTW7pyhCtvqoivITNrUk4s3+drxP/rDPchRS6BpUzus3OAu3jzkSXzy5ZaBLlkwYgq5tTS6iXcaR/ONnA1D4TaV14QFGXGj746C13BP0qZzqcyI7E7R9FG9HUjt3gDwp4mhgA0dGej5ZsjaCy3bvR1cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+64Zvr6L5vQEUO93nQ4N2LGI8WN76Pj82T2Z/rsHViY=;
 b=I6c3dBPsnHeuLr0dqOwcpkk7aglU0UfCpniIshjE+GeCEMobLeR70VixMTIn0YaRP/Xw19swh+Jci5a2e6BK5EveHAgWeAOHhhcqKWfPv87qrHp0O9yExXL4agBBYxeNs0iKNLXs5vqfOcj2YmmSkDQlXy/W8izas1fB/6f5LOsycuwu1MM5DGgKUd4JDulrbAqjXCjLd5COuTonnwTy1xog3fWDoPd60z1530i9/VLR0DVvqnPguapEACrJ4bgtq/DILsQ3+i9YQZSoSzhcUkR5QtT90cQTRmox5JpB+b41IWQQ4AaNtljT55mAKaZMtvbT+JzUkB3KH8j95JYIZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+64Zvr6L5vQEUO93nQ4N2LGI8WN76Pj82T2Z/rsHViY=;
 b=bc3MrnHeh+M9qzJtoYipsSOD2IafeRJ9UQ5UEgTlzxGxpuc7vKcfRjLQP0YRjePAHqU+n9IxwyyF+oyv1ckuKpHr6K/pJPDZ0+g09DlSlkBUsrwOrQkCL2/K/phAb9NDLDx+q/fA+cMIL59961KhOi7zLQeuywOa/6TNhnVSOWw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5349.namprd12.prod.outlook.com (2603:10b6:208:31f::7)
 by BL0PR12MB5521.namprd12.prod.outlook.com (2603:10b6:208:1c7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14; Mon, 16 Aug
 2021 11:33:57 +0000
Received: from BL1PR12MB5349.namprd12.prod.outlook.com
 ([fe80::152:9dd3:45a4:eeb6]) by BL1PR12MB5349.namprd12.prod.outlook.com
 ([fe80::152:9dd3:45a4:eeb6%4]) with mapi id 15.20.4415.022; Mon, 16 Aug 2021
 11:33:57 +0000
Subject: Re: [PATCH v3] drm/amdgpu: Cancel delayed work when GFXOFF is disabled
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Cc: Leo Liu <leo.liu@amd.com>, James Zhu <James.Zhu@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210813102920.3458-1-michel@daenzer.net>
 <20210816103506.2671-1-michel@daenzer.net>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
Message-ID: <cc08735b-df2f-e8a6-a1b0-22e1dba02757@amd.com>
Date: Mon, 16 Aug 2021 17:03:43 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210816103506.2671-1-michel@daenzer.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0140.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::25) To BL1PR12MB5349.namprd12.prod.outlook.com
 (2603:10b6:208:31f::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.157.114] (165.204.158.249) by
 PN2PR01CA0140.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:6::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.14 via Frontend Transport; Mon, 16 Aug 2021 11:33:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd92bdc2-72b1-42ef-b3b3-08d960a9bbbc
X-MS-TrafficTypeDiagnostic: BL0PR12MB5521:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB5521C92CB1B10CC29854FBB197FD9@BL0PR12MB5521.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pCV7a6BPVDlkSVogY5n5cv1J8CMLWhy470qkXAv3UDr3JLYJNnkn0P6R2KCPvWNz3LHk6nAvnn4PrdG0u4EnqT0dOq3oYuBk4Ktt5etx3H/44Pg3e4S6yjK3Okgg+CLN+5OTO9ziUWUebFIHkufKfJxLOKUhTSvxx/BrKHYvjKQ0wgM9GHrABoZDdcxKdmt2q95ayKYCVPt2yLswU3PKVNYF7ymWQsCAyjBxy9GdZTwhB+lyqBASWy2t04rBcL1XBsdfR5gDlbT6IOBsukH6ew8jZYAvUXcTRvjTNR6yMsmOlofftBWZ+p3FsajpuI0qL2LrrI6VbvtCvpdrVAio/VBSrj6eSplSoCLaajDkPl+2Xj7p7Vd6BfIoI6PhVGTQADTKyHEXQbtTwbrh/o2p7Bbhv7Q/67scOYsHArQ+CsXw1K3Uu55mzgYKiJZql6JdVcfDHT9kh1Xl1DDAiEacPUwrUJNyMaGZOQroK15KcGrrxtXx9MmWoWfQhu7OURKuWSiBWIRZwQCrnLzBGBcnKu/Q/jEX8u9mT7PEqJH4f9a9y3cXkbpE1zrv2NJhk/hBPtS2/FI2DeGK5p5rU+Hrw509j2JIcfuzRLf1zTDe7y4WBlHrqxs5874ljQHXQj97uP/drI0dIcZFSK23+2QyWsTFcox3QLU959OMcSJbyATPXA/rQRbyTbdv+pSGMfubnCFw+s2+t4x5CBwqm4ijHfQIXcahcpErqkM/Y4B3y0Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5349.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(39860400002)(346002)(136003)(16576012)(5660300002)(2906002)(54906003)(110136005)(316002)(6486002)(6636002)(38100700002)(478600001)(53546011)(6666004)(956004)(2616005)(36756003)(8936002)(66946007)(4326008)(86362001)(31696002)(186003)(66476007)(83380400001)(8676002)(66574015)(66556008)(26005)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXNnRlo0ZTVTSWZSRGVUbElCeW1valdpR2hNbExlRDhHYzF0anRkcE1GcGgr?=
 =?utf-8?B?clpqellvRFYyVGF0ZEpyU0ZPZ0V0Wmh3L2xGbXpqcjA1Zk1QMjNlQ0ZZcFp4?=
 =?utf-8?B?OUdpRHJRYUNYUDRFUDdsU1pZektZWHMvK29NREtTclppUVZIZVErU0dvcEtT?=
 =?utf-8?B?UVhJVEFqdERxRjQrS2E2UHdOdjM5VHE2cXJZb3ZLSThYQnMwMXJITHptbzgy?=
 =?utf-8?B?S3Y5emNIK2Y2NWRKVGFqYWZDUldrazVKQThIR1RZbjdjOWVXVXFhaUJjUG05?=
 =?utf-8?B?UHllQlQ2dTJoaTEzRTZGY0hlTHZ5T2V5TzVkLzZHUFNBRVBiNEZaS2lWaXg4?=
 =?utf-8?B?b0lxZDlzbWVCWUlaQVJXUk9GenZOL1hBSSs4MnRDTkdkNTVSL204U2tsSDFs?=
 =?utf-8?B?TjlpN1ppa0lhcnIwb1JsbUxzK2liV3ZBUUlYWXY2b0dVNFdVUTVjNkdabG5R?=
 =?utf-8?B?SjRhblBmOW01UGJCcU5zZVZGN0tmMnJjZ2xhZXdCa0FhQ2ExbTRzZmdwUWNO?=
 =?utf-8?B?REx2K3JSSzBkVDg5K3RhRUVIZDZ1a0MrekY2UXdBaEQ1L2xWdGZjdmxDTjdr?=
 =?utf-8?B?WVZRdmJDcTNrR25QbGIyWisxRHErWFBXSmNpaFVvQ0Z1M3FDNG8xSmIzMnRK?=
 =?utf-8?B?TlJVZU00Ui9vQUJlYzFxR29xUW1HNzlOSlRzeGRHT3VpZ1EzZHpSWmcvSWZF?=
 =?utf-8?B?QWJUenJkaitLSFN0Rmg5Mzd1UWFJWkhYZ0Y2VmlIOVR4Z0RXcFRyY2pYYTA0?=
 =?utf-8?B?NnNkQ1ljRzhtWERCT2J0dGdEZ2JWTG5yNlg3YVczMXVzdzVqeXA1cVY4S1I4?=
 =?utf-8?B?VDExcTdxZTJadWhLeGFYdk0zeXZGMm1pMVoxUFVmcFJUOG5ObXFUM3lDVzY3?=
 =?utf-8?B?SVhsRmptWlFkaG11bHorK1lZRVlYSGVrZElOd09PWmdQVFdaWVZwZXZDdUFW?=
 =?utf-8?B?QUFtN1Z3R2ZidnVwVXNvWFBucDdyVVNJS0hWUEZ6UmFSRHpDRm1lUXYrcjVT?=
 =?utf-8?B?bzFqeDFmVlRaNWZpbzZBbmg1eno0NkFsK3dFSElWM1hBMk9uWUMzelA1T0Rj?=
 =?utf-8?B?cVRTS2M4L1hrN05zVmpTTGUvZzZHWDNSZWZpcFFTY2RLVC9TdkQ2emRsREdx?=
 =?utf-8?B?OWFBUnhaUFNDQkk4SjltWTVSL0dNTXBTMDF3M0VkeDYxZ0pvVjRaS3R1TmI1?=
 =?utf-8?B?Uzdmb2ROSWwyODlYU1FvbHh5Z2Q5UnVNazJuVzBNN2xNenc2dG9ndUZGbEIr?=
 =?utf-8?B?dlNYZGFxWlpyVXNyWEVVOTlrS0NwK2U2RUJHTm1acTRtWjBDZ3YwNnQvc0Ro?=
 =?utf-8?B?dXloSDdPZmp6SFd4clpoWVk4WTdNV0RnWnlycGxpRDdpN0JrSU5GNStyUG81?=
 =?utf-8?B?TklxZ2JZQU1WelhZYWJuY0loeDVLUDRtREovMmdlUWhXdzVvMXV0TlNKcWZR?=
 =?utf-8?B?dXAvZEZjbVN3cTdWaDZBUmYyRHp3ekpjbnI4RE91blRzNlVTUzQxc24vOFdi?=
 =?utf-8?B?b2g1dU5WZXJuaHo1alFNVkwzNjE0VzdwQWM2aGVUQVBKZERENFlaQjRTUXov?=
 =?utf-8?B?Mm5oUW9WeW1rU1lxRzN3WWw5a04rdlc3YWRPeVJMU29SeVlURm9zbEZmVklO?=
 =?utf-8?B?Q0xGMkdKQnF2eE1MVkhBRSs5bUxaVjc1UWdoUFZtU1dRWk5oSEFlaEl3Uy9F?=
 =?utf-8?B?VVRpVHczVFRzNnY5cmZmcll6UXBxbGN0S0FXUUp4MHRkSTF1cG9DUmZHWUlK?=
 =?utf-8?Q?ISH/NwV+A9sEAnyNymyCTcLvkg+UxmiHOwYPhwk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd92bdc2-72b1-42ef-b3b3-08d960a9bbbc
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5349.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 11:33:56.7600 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zhZWNJqG9eQCLHSB6lqMuvWq7rHH+jid/A7pwrIylU3W8Di7hjnUBvJVeFlF5iKw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5521
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



On 8/16/2021 4:05 PM, Michel Dänzer wrote:
> From: Michel Dänzer <mdaenzer@redhat.com>
> 
> schedule_delayed_work does not push back the work if it was already
> scheduled before, so amdgpu_device_delay_enable_gfx_off ran ~100 ms
> after the first time GFXOFF was disabled and re-enabled, even if GFXOFF
> was disabled and re-enabled again during those 100 ms.
> 
> This resulted in frame drops / stutter with the upcoming mutter 41
> release on Navi 14, due to constantly enabling GFXOFF in the HW and
> disabling it again (for getting the GPU clock counter).
> 
> To fix this, call cancel_delayed_work_sync when the disable count
> transitions from 0 to 1, and only schedule the delayed work on the
> reverse transition, not if the disable count was already 0. This makes
> sure the delayed work doesn't run at unexpected times, and allows it to
> be lock-free.
> 
> v2:
> * Use cancel_delayed_work_sync & mutex_trylock instead of
>    mod_delayed_work.
> v3:
> * Make amdgpu_device_delay_enable_gfx_off lock-free (Christian König)
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Michel Dänzer <mdaenzer@redhat.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 11 +++++------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c    | 22 +++++++++++++++++-----
>   2 files changed, 22 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index f3fd5ec710b6..f944ed858f3e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -2777,12 +2777,11 @@ static void amdgpu_device_delay_enable_gfx_off(struct work_struct *work)
>   	struct amdgpu_device *adev =
>   		container_of(work, struct amdgpu_device, gfx.gfx_off_delay_work.work);
>   
> -	mutex_lock(&adev->gfx.gfx_off_mutex);
> -	if (!adev->gfx.gfx_off_state && !adev->gfx.gfx_off_req_count) {
> -		if (!amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK_TYPE_GFX, true))
> -			adev->gfx.gfx_off_state = true;
> -	}
> -	mutex_unlock(&adev->gfx.gfx_off_mutex);
> +	WARN_ON_ONCE(adev->gfx.gfx_off_state);

Don't see any case for this. It's not expected to be scheduled in this 
case, right?

> +	WARN_ON_ONCE(adev->gfx.gfx_off_req_count);
> +

Thinking about ON_ONCE here - this may happen more than once if it's 
completed as part of cancel_ call. Is the warning needed?

Anyway,
	Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>

> +	if (!amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK_TYPE_GFX, true))
> +		adev->gfx.gfx_off_state = true;
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> index a0be0772c8b3..ca91aafcb32b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> @@ -563,15 +563,26 @@ void amdgpu_gfx_off_ctrl(struct amdgpu_device *adev, bool enable)
>   
>   	mutex_lock(&adev->gfx.gfx_off_mutex);
>   
> -	if (!enable)
> -		adev->gfx.gfx_off_req_count++;
> -	else if (adev->gfx.gfx_off_req_count > 0)
> +	if (enable) {
> +		/* If the count is already 0, it means there's an imbalance bug somewhere.
> +		 * Note that the bug may be in a different caller than the one which triggers the
> +		 * WARN_ON_ONCE.
> +		 */
> +		if (WARN_ON_ONCE(adev->gfx.gfx_off_req_count == 0))
> +			goto unlock;
> +
>   		adev->gfx.gfx_off_req_count--;
> +	} else {
> +		adev->gfx.gfx_off_req_count++;
> +	}
>   
>   	if (enable && !adev->gfx.gfx_off_state && !adev->gfx.gfx_off_req_count) {
>   		schedule_delayed_work(&adev->gfx.gfx_off_delay_work, GFX_OFF_DELAY_ENABLE);
> -	} else if (!enable && adev->gfx.gfx_off_state) {
> -		if (!amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK_TYPE_GFX, false)) {
> +	} else if (!enable && adev->gfx.gfx_off_req_count == 1) {
> +		cancel_delayed_work_sync(&adev->gfx.gfx_off_delay_work);
> +
> +		if (adev->gfx.gfx_off_state &&
> +		    !amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK_TYPE_GFX, false)) {
>   			adev->gfx.gfx_off_state = false;
>   
>   			if (adev->gfx.funcs->init_spm_golden) {
> @@ -581,6 +592,7 @@ void amdgpu_gfx_off_ctrl(struct amdgpu_device *adev, bool enable)
>   		}
>   	}
>   
> +unlock:
>   	mutex_unlock(&adev->gfx.gfx_off_mutex);
>   }
>   
> 
