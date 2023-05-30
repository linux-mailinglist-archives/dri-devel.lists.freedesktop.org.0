Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C17716E67
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 22:11:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFFB110E195;
	Tue, 30 May 2023 20:11:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2089.outbound.protection.outlook.com [40.107.101.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B786210E195;
 Tue, 30 May 2023 20:11:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LjiaS5jRQMuMDblCbLtzrvWky5jTCd64Wyjhn2/u8ApCMqlAbufX1oBkMXM3asnJ/jaeMqaCg+Aye4SJmmEjFsBDR1IgQMr+Lt796TBdIIFJeR1grUdYCh8iTN5DkoGi86VaeGpailfvrLmxVzEw4rgsZBzjIp1p8fHFRHKs04nXTVwAaAiAQuGVviM2w2g13EvZS3+CmYqZG3IyPEps41HHrmP2whlxAjzh9XlzMuTsHhhIQeIGBzhIjxyeViLRpRnXAvEExWOf6qtHFfUhgxJvEPnxbcxY18wc4goAF79TzBuGH0eqgA5IXMVRbS/ZWWWwpROE1fj8XmDzo+zzOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ENW2u0UNzcn/wlE1UrSEtFLcYSrFz3t8tivBTCy4Mxk=;
 b=nju67mLPIpjsCuaO5QsK7ylujAsW015udL9unJtTfjUJ6ZXCjoAfHHtkEn7X503PMJXC8O1dWT23v26+A1lgV4Yx0AJhJ0r97CWkgxYZIEFzBUKV+UA9gJv1VafLgkuJzy+89CjMIhFyNMzcvfFEsoHv2dEFBClhVN41UiYKAEfulOXs5b6INLTxFybbp6mHExuP+IyM5/qCpUAvSTepU9urGUTodarHeQNsD9RaV24Bus6thDlQKABCTFx5ZHtvktz/S1IjchSv2Q5XZ6O3zNlJZOxcvyqYpDtC97bmsbRGfFYEjZKK8ibRjYQnLokLhMs6EqHAEQDLA3z8VZ4Bqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ENW2u0UNzcn/wlE1UrSEtFLcYSrFz3t8tivBTCy4Mxk=;
 b=MHMABcvxsIQEpslOF1cG7MRFeJKxR+vnQsB8Az5FplrgMoUfWZ778HvurZj/E5uNfQhD4OmEQDG6VMvLWzTkYD+qeFedLO8oDQmZvT9IVqLVEqhrW7txUhH9Rxj7Cuk/PAhACQJSFieTnX56+tbmfrC8U/Davd8/ELdyvYGlI+E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by IA0PR12MB8375.namprd12.prod.outlook.com (2603:10b6:208:3dd::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Tue, 30 May
 2023 20:11:23 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::943e:32fb:5204:a343]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::943e:32fb:5204:a343%3]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 20:11:23 +0000
Message-ID: <bcbccf51-b43b-b9e7-0119-1fc5fcc18e83@amd.com>
Date: Tue, 30 May 2023 16:11:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 20/33] drm/amdkfd: add runtime enable operation
Content-Language: en-US
To: Jonathan Kim <jonathan.kim@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230525172745.702700-1-jonathan.kim@amd.com>
 <20230525172745.702700-20-jonathan.kim@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20230525172745.702700-20-jonathan.kim@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0196.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ad::26) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|IA0PR12MB8375:EE_
X-MS-Office365-Filtering-Correlation-Id: ad97575d-2966-48b1-f776-08db614a0a2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7PadDToLIwnKmkmjpB8MKBU82+nYrYWQS4eQRYov/vv+g9rC6OSc3ZV1GBRL59YVQykkcB6ExOgubp2p2Q1e3t24iNvIqPBcaphNxRS+RTRNQfAL1kzCtullEcPJpxG44EX/2S56tyfl1qaVdk/F28IqVmUeD5I7bhFg0dZ+0Bw22bUo4xY7cCHVwHi3ROgSXU1C4nc0iBzdGpCezOCRrdv/mk2F7r7zE+Mk/JmiehOWBMnm5OhmkfdKRO9x/gx+QnU2eGFXrI6JVkVtJKJUmhrrbQ5K6iMg8Nm6nnQ8iEgk5X9fvuzZ2o3dUsx9DzMM4qbsNgGUyrIb5Sa/IcSXfziOpubj2QOFFipWAhabrF/Abu/gLtx5D/5Gt4dmHuOdVYLhPQpSlp1TXYmbK3GHlgkmqPxperQ7aRM0by4HTuX9uXqEwgkMs0UnLlSdUIMaaI2zHZSTaLzMCjNJwfy2zV1TgwB+h7KM975HJ5gZanIWxwogm7P/gRygzXwB4h1BtytSvM59cfRtTKfegJBZN+15uO5gUfBTmxkfCeyNeUkfeinj+eSujjXlufIaDzi6O/3aK8pqGitVduGlhmJ0LvBDJ0r28r6e9gy5H4DTz7+RRbQKQYGpTOJXPkbyE5j1rjwjfp1qTDiErIY107EUO/v5r0hsojaM+ruUzMBBa+jF40PiDSmLbLMwOZVxepB0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(376002)(346002)(136003)(39860400002)(396003)(451199021)(41300700001)(6486002)(5660300002)(186003)(8936002)(8676002)(36756003)(38100700002)(6506007)(6512007)(26005)(4326008)(66556008)(66476007)(31686004)(44832011)(316002)(66946007)(2906002)(30864003)(83380400001)(478600001)(2616005)(450100002)(31696002)(86362001)(43740500002)(45980500001)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1NGelZXZWF0UGU4aVM5ZDBqRktzbGJRbDYxRFVqMWNzYVF2djR5RW9WWnlR?=
 =?utf-8?B?SVhreEhTVWMyRkNxUDFBRTREMGtZWm9wOElqa0h2R3NZUGpSeGJtTE1LaU5w?=
 =?utf-8?B?SEFkd2FHV0NSeHBnQ0VNZ25IQUpaVWFDNy9wMStTYUFpb1lsYVozczJRdjZL?=
 =?utf-8?B?aWlSdFRoSllDRExuRmladk1pWkRzcGtnZXE4WEhBKzZidkpQaUVaNFkrZjFo?=
 =?utf-8?B?MmJWdEo0SmpxNE5YNkt5dnJ3azBsTW9JTHI3ZXhUZjc4dkYzOTdZenkxUGZJ?=
 =?utf-8?B?bHVzdXFBS1ZoS2ZQUHpMYWpHQURLVXplSi9XNFlzUHJmaU11Wm12bTdwVDVk?=
 =?utf-8?B?N2s2Yis0b0J1TUdVY2daWjFtemU5ano1L2NVai83SkdzNXBLWGluR284K25l?=
 =?utf-8?B?RDlQSTJmM1JEWTNJTUZTL25kcnY5QldTejNoekw4RG10bjN5dHFUTk40bWRp?=
 =?utf-8?B?clJLOHN1TXR4NFYva1B6TlB1SVdHTXN3N0UxQ3p2ZHNSSjNjWlhFY2c4eGVo?=
 =?utf-8?B?RWUxcXhkZndBdGdnN2htcEpDOUFqMlZxVUFMMmZMa3owbVJrQ0xoWVIzVk1F?=
 =?utf-8?B?SmEraE03dDVCWUNTTy9zeUV1bXlBYVA5eU8zTWkvcVlhS1c3b2NrTkxaMFFl?=
 =?utf-8?B?NlBZN0IwVG9rKzZEOXdqWVJDOWNWNFg5L1oyL2hha1JhSlFTdTFkNTVYZFNH?=
 =?utf-8?B?ek1IN2Zhd3JOcGlLWFhjNFBubUtqTk42TkdLSUdPRVVmUkVHV2ZQbzdteElX?=
 =?utf-8?B?SmNRWkprT1dnTGNPbGswVktjWTJJMkVQUWJrMEpQS3R1cTFTK3lRZWIySlNk?=
 =?utf-8?B?STR0T3ZaRGYydWlUR0M4a2FMYmU2djB3TUFYcC9Mc2x2Zmk3VHUxU2ZocC9J?=
 =?utf-8?B?MlROTFlTVlpkQldoUy9Da1VPa2w0UkI1QXpHNU0zTTNKTU1mbFZCNThwUTNV?=
 =?utf-8?B?bFhTTE01NFh5a1gvSnk2TTdFWmVoa0JkY3ZVZjFzb3ZlakVnODEvWC8wbnNV?=
 =?utf-8?B?S1VvRkhUMEFEei9IZ2oxb3JPUS95elg2Vlpyd1JPR3d4aWhuVFpRbEpYZDVP?=
 =?utf-8?B?aGQ5T2d3OWxkbHVEc0N3aC9ZdVdEMlJJeThjUHlqdyszbnlqcXdSdS9XZGcv?=
 =?utf-8?B?WEhQQS84aGFmYjVPWW9OVVVrM2Q2MjlBTnVqS2xlRmd0T1FiRm1FYTRYWk11?=
 =?utf-8?B?d0N4SlBNSFJzQVZ0TTBFQnFsRkdoeWd4b3FFd2VITnl1R2ZRemlKdUdMcFBV?=
 =?utf-8?B?MDh6dUl6ME1QYk5SRElVMmg2VU9zdTk3bHFCTDVMckJkaDBHaVdERXFiUzR6?=
 =?utf-8?B?Rll2NkxKcXppUHVmWVBrSTBaUHM0Qk54OXpaYWFySHV1Y2FpakNiTlQvaHlq?=
 =?utf-8?B?VWRJVHdYQnlsQUVXaERNMFlHOWxhall0eGVrZnhuMTk5VU9KamtkMUhQRWEy?=
 =?utf-8?B?L1dCY282MWgxSTRZQnhIQ2hHeURFV013Q0xQRVlzWnZBVUE3aWpaUVNxVzJi?=
 =?utf-8?B?UXF6TzhNY0pwSlEycndubUpDV1ZjaUVHaXdmWXpDVytzU21Oa0FRMVBjbElJ?=
 =?utf-8?B?RlJEeFk3YW5QenNCWHRMbFR6dmhJaHRzU3E1RFlOaWV3R2JDekRLTFNGRDJR?=
 =?utf-8?B?aUMxUllXempSd256cG5JS2huaDFwZm5DWkhCd21hdVFSZnlLNDltdW4vQmtk?=
 =?utf-8?B?bFdLT0tBb3NyM05JWVUyS0NDVHFIQjd2akpBaHh5MUZvWGM5TGttUDVYNjJ3?=
 =?utf-8?B?MEkrNFUwRjFGQ2E3ZHdKRHJuV0NaSWxPYWZSNHhlVkZacDAvUDRHcDM4Rlo1?=
 =?utf-8?B?R252Rnh2TVpqSTV1dXRxK1k2UDZIUGdDMmZRZjNWMmh0cG9hVktzdlhscjYx?=
 =?utf-8?B?RTFBSjJxK21wU1pSY0U3TnJZeWlIMk9ON01wOHFhNURWVml0U3hrdG5hdkhr?=
 =?utf-8?B?amwwV0E4bUNIWkZCaSsxN2JaSlJQMHc5T2xWdGxGZHJ1Q1NkR3duUWRZdlR3?=
 =?utf-8?B?OGc0SnFhTGVKUUdTMzZxdW5HV3o2Mk43b0RoNEVCQ2xVWFlWcnROUGJYdGU3?=
 =?utf-8?B?QUVRV09JYi91Y05FMEs2ckZQRTVyd0JqeG8rQWNuZldQc01aQU8wc0x1RVFD?=
 =?utf-8?Q?ZftdW3qoqR1is+Qldlv5RETNo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad97575d-2966-48b1-f776-08db614a0a2e
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 20:11:23.1076 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h7uDELlk6qXxtUP3bgEUa7fxFHIX+VVYXRrsIUt1xg3TWnqQEsg9Gc+pzdO1IEg0TScoDciyWJtbeswhqW4T0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8375
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
Cc: Jinhuieric.Huang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2023-05-25 um 13:27 schrieb Jonathan Kim:
> The debugger can attach to a process prior to HSA enablement (i.e.
> inferior is spawned by the debugger and attached to immediately before
> target process has been enabled for HSA dispatches) or it
> can attach to a running target that is already HSA enabled.  Either
> way, the debugger needs to know the enablement status to know when
> it can inspect queues.
>
> For the scenario where the debugger spawns the target process,
> it will have to wait for ROCr's runtime enable request from the target.
> The runtime enable request will be able to see that its process has been
> debug attached.  ROCr raises an EC_PROCESS_RUNTIME signal to the
> debugger then blocks the target process while waiting the debugger's
> response. Once the debugger has received the runtime signal, it will
> unblock the target process.
>
> For the scenario where the debugger attaches to a running target
> process, ROCr will set the target process' runtime status as enabled so
> that on an attach request, the debugger will be able to see this
> status and will continue with debug enablement as normal.
>
> A secondary requirement is to conditionally enable the trap tempories only
> if the user requests it (env var HSA_ENABLE_DEBUG=1) or if the debugger
> attaches with HSA runtime enabled.  This is because setting up the trap
> temporaries incurs a performance overhead that is unacceptable for
> microbench performance in normal mode for certain customers.
>
> In the scenario where the debugger spawns the target process, when ROCr
> detects that the debugger has attached during the runtime enable
> request, it will enable the trap temporaries before it blocks the target
> process while waiting for the debugger to respond.
>
> In the scenario where the debugger attaches to a running target process,
> it will enable to trap temporaries itself.
>
> Finally, there is an additional restriction that is required to be
> enforced with runtime enable and HW debug mode setting. The debugger must
> first ensure that HW debug mode has been enabled before permitting HW debug
> mode operations.
>
> With single process debug devices, allowing the debugger to set debug
> HW modes prior to trap activation means that debug HW mode setting can
> occur before the KFD has reserved the debug VMID (0xf) from the hardware
> scheduler's VMID allocation resource pool.  This can result in the
> hardware scheduler assigning VMID 0xf to a non-debugged process and
> having that process inherit debug HW mode settings intended for the
> debugged target process instead, which is both incorrect and potentially
> fatal for normal mode operation.
>
> With multi process debug devices, allowing the debugger to set debug
> HW modes prior to trap activation means that non-debugged processes
> migrating to a new VMID could inherit unintended debug settings.
>
> All debug operations that touch HW settings must require trap activation
> where trap activation is triggered by both debug attach and runtime
> enablement (target has KFD opened and is ready to dispatch work).
>
> v2: fixup with new kfd_node struct reference
>
> Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 143 ++++++++++++++++++++++-
>   drivers/gpu/drm/amd/amdkfd/kfd_debug.c   |   6 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_debug.h   |   4 +
>   drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |   1 +
>   4 files changed, 150 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index ec5a85454192..73cb5abce431 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -2738,11 +2738,140 @@ static int kfd_ioctl_criu(struct file *filep, struct kfd_process *p, void *data)
>   	return ret;
>   }
>   
> -static int kfd_ioctl_runtime_enable(struct file *filep, struct kfd_process *p, void *data)
> +static int runtime_enable(struct kfd_process *p, uint64_t r_debug,
> +			bool enable_ttmp_setup)
> +{
> +	int i = 0, ret = 0;
> +
> +	if (p->is_runtime_retry)
> +		goto retry;
> +
> +	if (p->runtime_info.runtime_state != DEBUG_RUNTIME_STATE_DISABLED)
> +		return -EBUSY;
> +
> +	for (i = 0; i < p->n_pdds; i++) {
> +		struct kfd_process_device *pdd = p->pdds[i];
> +
> +		if (pdd->qpd.queue_count)
> +			return -EEXIST;
> +	}
> +
> +	p->runtime_info.runtime_state = DEBUG_RUNTIME_STATE_ENABLED;
> +	p->runtime_info.r_debug = r_debug;
> +	p->runtime_info.ttmp_setup = enable_ttmp_setup;
> +
> +	if (p->runtime_info.ttmp_setup) {
> +		for (i = 0; i < p->n_pdds; i++) {
> +			struct kfd_process_device *pdd = p->pdds[i];
> +
> +			if (!kfd_dbg_is_rlc_restore_supported(pdd->dev)) {
> +				amdgpu_gfx_off_ctrl(pdd->dev->adev, false);
> +				pdd->dev->kfd2kgd->enable_debug_trap(
> +						pdd->dev->adev,
> +						true,
> +						pdd->dev->vm_info.last_vmid_kfd);
> +			} else if (kfd_dbg_is_per_vmid_supported(pdd->dev)) {
> +				pdd->spi_dbg_override = pdd->dev->kfd2kgd->enable_debug_trap(
> +						pdd->dev->adev,
> +						false,
> +						0);
> +			}
> +		}
> +	}
> +
> +retry:
> +	if (p->debug_trap_enabled) {
> +		if (!p->is_runtime_retry) {
> +			kfd_dbg_trap_activate(p);
> +			kfd_dbg_ev_raise(KFD_EC_MASK(EC_PROCESS_RUNTIME),
> +					p, NULL, 0, false, NULL, 0);
> +		}
> +
> +		mutex_unlock(&p->mutex);
> +		ret = down_interruptible(&p->runtime_enable_sema);
> +		mutex_lock(&p->mutex);
> +
> +		p->is_runtime_retry = !!ret;
> +	}
> +
> +	return ret;
> +}
> +
> +static int runtime_disable(struct kfd_process *p)
>   {
> +	int i = 0, ret;
> +	bool was_enabled = p->runtime_info.runtime_state == DEBUG_RUNTIME_STATE_ENABLED;
> +
> +	p->runtime_info.runtime_state = DEBUG_RUNTIME_STATE_DISABLED;
> +	p->runtime_info.r_debug = 0;
> +
> +	if (p->debug_trap_enabled) {
> +		if (was_enabled)
> +			kfd_dbg_trap_deactivate(p, false, 0);
> +
> +		if (!p->is_runtime_retry)
> +			kfd_dbg_ev_raise(KFD_EC_MASK(EC_PROCESS_RUNTIME),
> +					p, NULL, 0, false, NULL, 0);
> +
> +		mutex_unlock(&p->mutex);
> +		ret = down_interruptible(&p->runtime_enable_sema);
> +		mutex_lock(&p->mutex);
> +
> +		p->is_runtime_retry = !!ret;
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (was_enabled && p->runtime_info.ttmp_setup) {
> +		for (i = 0; i < p->n_pdds; i++) {
> +			struct kfd_process_device *pdd = p->pdds[i];
> +
> +			if (!kfd_dbg_is_rlc_restore_supported(pdd->dev))
> +				amdgpu_gfx_off_ctrl(pdd->dev->adev, true);
> +		}
> +	}
> +
> +	p->runtime_info.ttmp_setup = false;
> +
> +	/* disable ttmp setup */
> +	for (i = 0; i < p->n_pdds; i++) {
> +		struct kfd_process_device *pdd = p->pdds[i];
> +
> +		if (kfd_dbg_is_per_vmid_supported(pdd->dev)) {
> +			pdd->spi_dbg_override =
> +					pdd->dev->kfd2kgd->disable_debug_trap(
> +					pdd->dev->adev,
> +					false,
> +					pdd->dev->vm_info.last_vmid_kfd);
> +
> +			if (!pdd->dev->kfd->shared_resources.enable_mes)
> +				debug_refresh_runlist(pdd->dev->dqm);
> +			else
> +				kfd_dbg_set_mes_debug_mode(pdd);
> +		}
> +	}
> +
>   	return 0;
>   }
>   
> +static int kfd_ioctl_runtime_enable(struct file *filep, struct kfd_process *p, void *data)
> +{
> +	struct kfd_ioctl_runtime_enable_args *args = data;
> +	int r;
> +
> +	mutex_lock(&p->mutex);
> +
> +	if (args->mode_mask & KFD_RUNTIME_ENABLE_MODE_ENABLE_MASK)
> +		r = runtime_enable(p, args->r_debug,
> +				!!(args->mode_mask & KFD_RUNTIME_ENABLE_MODE_TTMP_SAVE_MASK));
> +	else
> +		r = runtime_disable(p);
> +
> +	mutex_unlock(&p->mutex);
> +
> +	return r;
> +}
> +
>   static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, void *data)
>   {
>   	struct kfd_ioctl_dbg_trap_args *args = data;
> @@ -2815,6 +2944,18 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
>   		goto unlock_out;
>   	}
>   
> +	if (target->runtime_info.runtime_state != DEBUG_RUNTIME_STATE_ENABLED &&
> +			(args->op == KFD_IOC_DBG_TRAP_SET_WAVE_LAUNCH_OVERRIDE ||
> +			 args->op == KFD_IOC_DBG_TRAP_SET_WAVE_LAUNCH_MODE ||
> +			 args->op == KFD_IOC_DBG_TRAP_SUSPEND_QUEUES ||
> +			 args->op == KFD_IOC_DBG_TRAP_RESUME_QUEUES ||
> +			 args->op == KFD_IOC_DBG_TRAP_SET_NODE_ADDRESS_WATCH ||
> +			 args->op == KFD_IOC_DBG_TRAP_CLEAR_NODE_ADDRESS_WATCH ||
> +			 args->op == KFD_IOC_DBG_TRAP_SET_FLAGS)) {
> +		r = -EPERM;
> +		goto unlock_out;
> +	}
> +
>   	switch (args->op) {
>   	case KFD_IOC_DBG_TRAP_ENABLE:
>   		if (target != p)
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> index 61098975bb0e..a19c21d04438 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> @@ -219,7 +219,7 @@ static int kfd_dbg_set_workaround(struct kfd_process *target, bool enable)
>   	return r;
>   }
>   
> -static int kfd_dbg_set_mes_debug_mode(struct kfd_process_device *pdd)
> +int kfd_dbg_set_mes_debug_mode(struct kfd_process_device *pdd)
>   {
>   	uint32_t spi_dbg_cntl = pdd->spi_dbg_override | pdd->spi_dbg_launch_mode;
>   	uint32_t flags = pdd->process->dbg_flags;
> @@ -239,7 +239,7 @@ static int kfd_dbg_set_mes_debug_mode(struct kfd_process_device *pdd)
>    *				to unwind
>    *		else: ignored
>    */
> -static void kfd_dbg_trap_deactivate(struct kfd_process *target, bool unwind, int unwind_count)
> +void kfd_dbg_trap_deactivate(struct kfd_process *target, bool unwind, int unwind_count)
>   {
>   	int i;
>   
> @@ -307,7 +307,7 @@ int kfd_dbg_trap_disable(struct kfd_process *target)
>   	return 0;
>   }
>   
> -static int kfd_dbg_trap_activate(struct kfd_process *target)
> +int kfd_dbg_trap_activate(struct kfd_process *target)
>   {
>   	int i, r = 0;
>   
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> index 2c6866bb8850..fca928564948 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> @@ -25,6 +25,8 @@
>   
>   #include "kfd_priv.h"
>   
> +void kfd_dbg_trap_deactivate(struct kfd_process *target, bool unwind, int unwind_count);
> +int kfd_dbg_trap_activate(struct kfd_process *target);
>   bool kfd_dbg_ev_raise(uint64_t event_mask,
>   			struct kfd_process *process, struct kfd_node *dev,
>   			unsigned int source_id, bool use_worker,
> @@ -77,4 +79,6 @@ static inline bool kfd_dbg_has_gws_support(struct kfd_node *dev)
>   	/* Assume debugging and cooperative launch supported otherwise. */
>   	return true;
>   }
> +
> +int kfd_dbg_set_mes_debug_mode(struct kfd_process_device *pdd);
>   #endif
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> index 58b82fa59584..4b80f74b9de0 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> @@ -980,6 +980,7 @@ struct kfd_process {
>   
>   	/* Tracks runtime enable status */
>   	struct semaphore runtime_enable_sema;
> +	bool is_runtime_retry;
>   	struct kfd_runtime_info runtime_info;
>   
>   };
