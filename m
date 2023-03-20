Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B7B6C2416
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 22:49:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C07EA10E329;
	Mon, 20 Mar 2023 21:49:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC83B10E323;
 Mon, 20 Mar 2023 21:49:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nW7r35cLVqLFxG3yWGhiTMXHxAY0HURBgf+4C+ZQP3+3YyD5dTG9T+Uep0QuQNK/sj8HpY2sASF8HG9ckBQ4JPBLBGH7lAPrUVogmiUlpSkuiP9FiVZPYGAGd3+0hnWgq1+cAOY+md9Y6qvUqlD8w4oai/tDtb1LC8p/o8yvwNwQScXWqbwrKs0KN+KvR3nUoa+vHyUvxJVIWWbNEH6i/emUAPD66LtFE1kx6T+68isQcf3ExenM7uvXQ7USfF2zqpgYnxMB46r2FuAw15tdIr3jZYq+40xH1pzMh75mcKo1786bxsWut9Choxd72veQNEKDXTEzN0kY/TD3wHTIAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xjolZGp/CfbS245+qj/jFvYev0XV2U385EfPayYFAbE=;
 b=Zk190kZmUYvKHjBWcAkakOil4tKJ8C+6dX8D7QDAvPwo2WnwPB/C2qwC0MbHb++FbWWqtIZRrviR3hwYkfFK72ntGdxbC9GkbbKJmX1vyApJZQL8jjYrxiV1GaOhxL2E8jprC6r/Cesm4JQ0kNcnA9+pp0I9nBTSko5rFnYVWFV1AkQceoJkPdV9oPHvn8YLOnpuAuC/WfPhfuOVcawaqwR9RjxJI+lh0PwPMC3gwyAgdmHq+QfyUDpiGSI5yqN9Fe3uw2vVXb/BhVfQubtHEiqq5XbstWFOYoc0dQEr+sRU4KPjHk6H1LeFt1AGSTb92TcKe+0aZmcojxTasx+CYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xjolZGp/CfbS245+qj/jFvYev0XV2U385EfPayYFAbE=;
 b=ZCFOipXVkWXj5IuY9+cuQnk4lCy0RzWvWVmk7y8ilzxGhqPN4ffel0QvKGljeK2n+LPjPzu7uUp/ABh63Ak2UicX+Tzsd3hfELVFD9n5WsMnqRnB3W/CI5GDo5ch79gmIy9ZsWLO2lCeUIGc0/LhQfpxqulqfvb6ukWTcAlQ8iI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by IA0PR12MB7774.namprd12.prod.outlook.com (2603:10b6:208:430::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 21:49:44 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::23f:22c1:b49e:b77e]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::23f:22c1:b49e:b77e%5]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 21:49:39 +0000
Message-ID: <3b49982c-b339-3b43-afcb-e6f48b8fb70e@amd.com>
Date: Mon, 20 Mar 2023 17:49:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 15/32] drm/amdkfd: prepare trap workaround for gfx11
Content-Language: en-US
To: Jonathan Kim <jonathan.kim@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230125195401.4183544-1-jonathan.kim@amd.com>
 <20230125195401.4183544-16-jonathan.kim@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20230125195401.4183544-16-jonathan.kim@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0392.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:108::8) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|IA0PR12MB7774:EE_
X-MS-Office365-Filtering-Correlation-Id: 486c368f-def4-4b20-b2b9-08db298d017c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w+PDeR5xFrTVhAg3AWELHlFfGP/onBMboEPmUj+YkZIuOAkljnCjGfviDy3tnEU0jgMuP+BMSzRMAo/mFYfxAaWRMbyFbRLKRuk8b/71wsOuSpIW6TGM0nExtkBWwRoxmgY0l9wAT8685QTpBl3OsHPZ+UMSt1DvSqg2+rHtScfn24cK5SVVX4EbYwg5Y+jOOFKX7Vd2HZji2eHSxgbHSN64B+Spz69kd7Mp3SIehubK7YjtV1DpismU56iZHQKuTvPNEWWLvXcF3cLMoFFsKwmO8wF9mpXW+RXDJZdJ5rfW9xTHXJuY77yYfAgmIHd+6QVxmW4kf1/o7tG0/dVqp0xslB+MF2eOE/zt7YqBReQL6aTWn0/p0pewngOphZdwzQSadiodgZwS4/JKVTkIywt/BeC8QyWmp/23yaup6wj9zrMqULdo5iiXLYUQmaR9x+FcQ15hrEGDxwVO9DJNpWRLsoxjiziaNvW7UPMex0fwODc3zHJDqOic8Mvhlyc5oWQSfgFVlLkzgnFW+8p75orPuYBSKgBiFN66nGuw/TjFAt6BEkDcNx2NcUN/SVDherFI5G7BqS/Y68YanmPxX4CA5B2KeKpx73CWCNL5JUSoZrMnd7LUrZEmSXeACLkkFJWZ2CmK2a5feHe1JJe3FqMjVQ+nRgA5EXTMLjRxGW6ilYGaIHlSpCx+kV1ycirgubZmd1Kr7nH/Nzs3RQTVNs9bzL82irarjVsSiYkW8tkpe+ANbSfdklXWtLca4QJaJONByZCDAb3Owy2v8+hDyA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(376002)(366004)(346002)(136003)(39860400002)(451199018)(86362001)(316002)(31696002)(6486002)(83380400001)(38100700002)(2616005)(36916002)(478600001)(36756003)(26005)(6506007)(186003)(53546011)(6666004)(6512007)(30864003)(2906002)(44832011)(41300700001)(31686004)(8936002)(8676002)(5660300002)(66556008)(66476007)(66946007)(450100002)(43740500002)(45980500001)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXFTQnlIdlg2aUtqVHlUYjJ2S3lKL1RLMTkzTmJWVnhaa2RxbURNYkZ2eHhh?=
 =?utf-8?B?Wm5ySXVqekwrazdic0Z5Vzhyb29PODZsZGtXQTZlSVJRRElyWmo0aitDWW01?=
 =?utf-8?B?Sm1CYU1kN2FsK0xmWmFSZU5BeWdONEMwb3pGZWtCZTJZaHJMTkpsVjM5U015?=
 =?utf-8?B?NEZ2UFUwQmYrQS8reWZJZjdiMDBNN05Tdk9naFhKTERKejdpRzdTVDQ2R3FE?=
 =?utf-8?B?ZnM5aXdnOEg4VXhsR3EyYm91dFlTSTFBUlM5ZFdjY0ZWd2lMS2ZSUWRTbXZJ?=
 =?utf-8?B?S2N2YzJjdHdsWk1xRTZwQXpvRVdCd3pKYlhNVkRLWlJMU2NnOFdSQmxCbVRv?=
 =?utf-8?B?eDhGcC8xMlRDNDNETHdvZGNtUjc2b05xQzlOODg0OXd6dGdENlB3UlZRYTJH?=
 =?utf-8?B?ekx6N2c3M0xXd3BuckpTZUpDdTF3QkxoYkE2M1IzcjVQdDdac3dqUi9reVNU?=
 =?utf-8?B?czduK3ZFWW16Rkh1b2Uvamt1SzNyWVJMbFcxQUpvV3NEWldyM2pjaVRUY3hP?=
 =?utf-8?B?bnc1NWcybkY0WUdENnJXYmdVNGphMWVVR2hwb2JiRWpVSU1pWEMzbERRbVRV?=
 =?utf-8?B?OU5jbUkyNTZLWjBacmpiT3ZPd1VsNExqbm1WZFJZYlJVNmYwVll0bWN3OGFL?=
 =?utf-8?B?WW0yd0pLOVpRcTcwOEVvMTNZVXAzdThrWXBzL2p3Z0VXM0pVUEpnQXhHRzc4?=
 =?utf-8?B?akR4bEsvcWtpZm0xN2pwWDI1OStySktYTFphYWJ4aTlKV3dCZjh1UlpabnJl?=
 =?utf-8?B?dVVDZFFTSlBrbU43Vi8rUjQyYnBzTE0vNUdvQVd3THNXVm5lZTdwWm83VE9q?=
 =?utf-8?B?Rk9yU0FNSW5rV0ZaTmxIYkgwbzZFWDBCUHY4U2c3ME5ra0U5cG5SMTJQZ3c2?=
 =?utf-8?B?S2wxcDZiQkh0SXNEbTc4SnBVdVFtVGFpdG1VQmp6aGVjSXhqVzlkU3kyZ2FM?=
 =?utf-8?B?bjR4cWdPOFBaK01hS1N0N0VCWVlXbFhYdEYzaFBLOHRGL2ppaTBiOXI4emZJ?=
 =?utf-8?B?NmRKRWI2VVB3S1FhZE5VTC84NnYwQW52bTl3MEt1QUdhOVhKSzBkTmNlWjlZ?=
 =?utf-8?B?akN6bncvZ1VTTjhVSWkwMUlHWkdCWk90T2tVVVNDbU02UThqQ09xRWo1TUZE?=
 =?utf-8?B?ajBmOElUSlpmSENueG1HbTF0eDVQNEZGQk81Zm5ycDhnY3Y0UTBwR1A5Yy9a?=
 =?utf-8?B?MDArWWlIMEFyQmpGL1lpTUIzcVNYd3hReXJvSFc0YXE2a3ZZVS9XcUtjS1ZB?=
 =?utf-8?B?dS9pSU5PSjBPdGpBS2ViQ1Fsa2J4K3RDWFEvcld4SytiOG4rS2J6QzQ1aTl1?=
 =?utf-8?B?K2t4S3VjQ3N2a0tGQ2Z4bzRRY0FHL3IveEcrQWNqY0ZhdEJycXU3ODdRYWNl?=
 =?utf-8?B?Q3IrWEVkWEJCeHd4bm5ZbVprV2d4aG4rYTNzN2pTZ3hqaHN0S0ZLbEhZMnh5?=
 =?utf-8?B?eGdaWFV0RFQvUGJDaWFuVjMvTFJTWmppdnhySXJPN05kdy9lakFkbzdndHR1?=
 =?utf-8?B?TmZWdjk3SDhMUGR5dlJQa0NnZ1lGQ0hRSG02SytQeTVtZlhMRUEvRHUwaUV5?=
 =?utf-8?B?czB0TXJaekxWWkdYUWlqNlpuSC9vT3VvWXg0SldEd0EwR3cxN1loOVd2TXBa?=
 =?utf-8?B?N1ViOUJqTE9hcWxtUVM2M1pvMVFhcW52TG5PODdBOGlMTG1Kb28wRVZXNjNI?=
 =?utf-8?B?aDBWTko5bHU5R3BwSWJKVDhHb0JnbWRQSExtYSsvU1hhME5ySFVEeTlCZXk0?=
 =?utf-8?B?Z3prRWo5cHhGSlVGZWVJbmFjV1pzYmRvSVdFN1lyWWhWclR0NjlrSnRYeGhG?=
 =?utf-8?B?dlJ1S2J1eW9aWVVxaFBhTlhPQ0t4NnROZzYvTXRpcWI5MG5ITEpXUkV6NnNl?=
 =?utf-8?B?d3l3UHQ0aWlNUmpYREtXMCtCMjBoRVdBQTZicyszZVVmTldLWlNETjVlZ3E4?=
 =?utf-8?B?UEtvbmFrcGM3cVNQdk9JM1F0cjhFbG9janNaaFpqRVJIWVRtNm51U1V6VUlt?=
 =?utf-8?B?bGJVOEo2RnNVUXFrRlNGQktrZWhyLzNIMit4MS9XemIxeHhjcWFMQjZ2dlIx?=
 =?utf-8?B?TU9CQVFKeWZkZVlYdVd4Y0dVR3dyRWppWjdkZW5iS0IrOURYN2dPMkNPMlNW?=
 =?utf-8?Q?fmxznxBrCouVvbRAKBL9QfpJ9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 486c368f-def4-4b20-b2b9-08db298d017c
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 21:49:39.7022 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GMnqMxPs5QzyeHrS607U+4A53JsmDzt+j9xMMBVFec2r3cIT1VDWieUaczt7v7EFMPu0+pE6zYguOVRly5biVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7774
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


On 2023-01-25 14:53, Jonathan Kim wrote:
> Due to a HW bug, waves in only half the shader arrays can enter trap.
>
> When starting a debug session, relocate all waves to the first shader
> array of each shader engine and mask off the 2nd shader array as
> unavailable.
>
> When ending a debug session, re-enable the 2nd shader array per
> shader engine.
>
> User CU masking per queue cannot be guaranteed to remain functional
> if requested during debugging (e.g. user cu mask requests only 2nd shader
> array as an available resource leading to zero HW resources available)
> nor can runtime be alerted of any of these changes during execution.
>
> Make user CU masking and debugging mutual exclusive with respect to
> availability.
>
> If the debugger tries to attach to a process with a user cu masked
> queue, return the runtime status as enabled but busy.
>
> If the debugger tries to attach and fails to reallocate queue waves to
> the first shader array of each shader engine, return the runtime status
> as enabled but with an error.
>
> In addition, like any other mutli-process debug supported devices,
> disable trap temporary setup per-process to avoid performance impact from
> setup overhead.
>
> Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h       |  2 +
>   drivers/gpu/drm/amd/amdgpu/mes_v11_0.c        |  7 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  2 -
>   drivers/gpu/drm/amd/amdkfd/kfd_debug.c        | 64 +++++++++++++++++++
>   drivers/gpu/drm/amd/amdkfd/kfd_debug.h        |  3 +-
>   .../drm/amd/amdkfd/kfd_device_queue_manager.c |  7 ++
>   .../gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c  |  3 +-
>   .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c  |  3 +-
>   .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c  | 42 ++++++++----
>   .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c   |  3 +-
>   .../gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c   |  3 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |  5 +-
>   .../amd/amdkfd/kfd_process_queue_manager.c    |  9 ++-
>   13 files changed, 124 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h
> index d20df0cf0d88..b5f5eed2b5ef 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h
> @@ -219,6 +219,8 @@ struct mes_add_queue_input {
>   	uint32_t        gws_size;
>   	uint64_t	tba_addr;
>   	uint64_t	tma_addr;
> +	uint32_t	trap_en;
> +	uint32_t	skip_process_ctx_clear;
>   	uint32_t	is_kfd_process;
>   	uint32_t	is_aql_queue;
>   	uint32_t	queue_size;
> diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
> index fbacdc42efac..38c7a0cbf264 100644
> --- a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
> @@ -197,17 +197,14 @@ static int mes_v11_0_add_hw_queue(struct amdgpu_mes *mes,
>   	mes_add_queue_pkt.gws_size = input->gws_size;
>   	mes_add_queue_pkt.trap_handler_addr = input->tba_addr;
>   	mes_add_queue_pkt.tma_addr = input->tma_addr;
> +	mes_add_queue_pkt.trap_en = input->trap_en;
> +	mes_add_queue_pkt.skip_process_ctx_clear = input->skip_process_ctx_clear;
>   	mes_add_queue_pkt.is_kfd_process = input->is_kfd_process;
>   
>   	/* For KFD, gds_size is re-used for queue size (needed in MES for AQL queues) */
>   	mes_add_queue_pkt.is_aql_queue = input->is_aql_queue;
>   	mes_add_queue_pkt.gds_size = input->queue_size;
>   
> -	if (!(((adev->mes.sched_version & AMDGPU_MES_VERSION_MASK) >= 4) &&
> -		  (adev->ip_versions[GC_HWIP][0] >= IP_VERSION(11, 0, 0)) &&
> -		  (adev->ip_versions[GC_HWIP][0] <= IP_VERSION(11, 0, 3))))
> -		mes_add_queue_pkt.trap_en = 1;
> -
>   	/* For KFD, gds_size is re-used for queue size (needed in MES for AQL queues) */
>   	mes_add_queue_pkt.is_aql_queue = input->is_aql_queue;
>   	mes_add_queue_pkt.gds_size = input->queue_size;
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index ee05c2e54ef6..f5f639de28f0 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -530,8 +530,6 @@ static int kfd_ioctl_set_cu_mask(struct file *filp, struct kfd_process *p,
>   		goto out;
>   	}
>   
> -	minfo.update_flag = UPDATE_FLAG_CU_MASK;
> -
>   	mutex_lock(&p->mutex);
>   
>   	retval = pqm_update_mqd(&p->pqm, args->queue_id, &minfo);
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> index f6ea6db266b4..6e99a0160275 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> @@ -37,6 +37,70 @@ void debug_event_write_work_handler(struct work_struct *work)
>   	kernel_write(process->dbg_ev_file, &write_data, 1, &pos);
>   }
>   
> +static int kfd_dbg_set_queue_workaround(struct queue *q, bool enable)
> +{
> +	struct mqd_update_info minfo = {0};
> +	int err;
> +
> +	if (!q || (!q->properties.is_dbg_wa && !enable))

Should this condition be:

     if (!q || q->properties.is_dbg_wa != enable)


> +		return 0;
> +
> +	if (KFD_GC_VERSION(q->device) < IP_VERSION(11, 0, 0) ||
> +			KFD_GC_VERSION(q->device) >= IP_VERSION(12, 0, 0))

Indentation. It would be more readable if the KFD_GC_VERSIONs were aligned.


> +		return 0;
> +
> +	if (enable && q->properties.is_user_cu_masked)
> +		return -EBUSY;
> +
> +	minfo.update_flag = enable ? UPDATE_FLAG_DBG_WA_ENABLE : UPDATE_FLAG_DBG_WA_DISABLE;
> +
> +	q->properties.is_dbg_wa = enable;
> +	err = q->device->dqm->ops.update_queue(q->device->dqm, q, &minfo);
> +	if (err)
> +		q->properties.is_dbg_wa = false;
> +
> +	return err;
> +}
> +
> +static int kfd_dbg_set_workaround(struct kfd_process *target, bool enable)
> +{
> +	struct process_queue_manager *pqm = &target->pqm;
> +	struct process_queue_node *pqn;
> +	int r = 0;
> +
> +	list_for_each_entry(pqn, &pqm->queues, process_queue_list) {
> +		r = kfd_dbg_set_queue_workaround(pqn->q, enable);
> +		if (enable && r)
> +			goto unwind;
> +	}
> +
> +	return 0;
> +
> +unwind:
> +	list_for_each_entry(pqn, &pqm->queues, process_queue_list)
> +		kfd_dbg_set_queue_workaround(pqn->q, false);
> +
> +	if (enable) {
> +		target->runtime_info.runtime_state = r == -EBUSY ?
> +				DEBUG_RUNTIME_STATE_ENABLED_BUSY :
> +				DEBUG_RUNTIME_STATE_ENABLED_ERROR;
> +	}

Braces are not needed here.


> +
> +	return r;
> +}
> +
> +static int kfd_dbg_set_mes_debug_mode(struct kfd_process_device *pdd)
> +{
> +	uint32_t spi_dbg_cntl = pdd->spi_dbg_override | pdd->spi_dbg_launch_mode;
> +	uint32_t flags = pdd->process->dbg_flags;
> +
> +	if (!kfd_dbg_is_per_vmid_supported(pdd->dev))
> +		return 0;
> +
> +	return amdgpu_mes_set_shader_debugger(pdd->dev->adev, pdd->proc_ctx_gpu_addr, spi_dbg_cntl,
> +						pdd->watch_points, flags);
> +}
> +

You're adding some unused static functions here. This will cause compile 
warnings until the patch that starts using them. You could avoid this by 
reordering this and the next patch and moving the function calls into 
this patch. That would also make it more obvious where the workaround 
plugs into the debug code.

Regards,
   Felix


>   int kfd_dbg_trap_disable(struct kfd_process *target)
>   {
>   	if (!target->debug_trap_enabled)
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> index 53c5a3e55bd2..0c09f1729325 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> @@ -35,7 +35,8 @@ int kfd_dbg_trap_enable(struct kfd_process *target, uint32_t fd,
>   
>   static inline bool kfd_dbg_is_per_vmid_supported(struct kfd_dev *dev)
>   {
> -	return KFD_GC_VERSION(dev) == IP_VERSION(9, 4, 2);
> +	return KFD_GC_VERSION(dev) == IP_VERSION(9, 4, 2) ||
> +	       KFD_GC_VERSION(dev) >= IP_VERSION(11, 0, 0);
>   }
>   
>   void debug_event_write_work_handler(struct work_struct *work);
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> index 2517716d7cbc..be1985b87ea7 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> @@ -214,6 +214,10 @@ static int add_queue_mes(struct device_queue_manager *dqm, struct queue *q,
>   	queue_input.paging = false;
>   	queue_input.tba_addr = qpd->tba_addr;
>   	queue_input.tma_addr = qpd->tma_addr;
> +	queue_input.trap_en = KFD_GC_VERSION(q->device) < IP_VERSION(11, 0, 0) ||
> +			      KFD_GC_VERSION(q->device) >= IP_VERSION(12, 0, 0) ||
> +			      q->properties.is_dbg_wa;
> +	queue_input.skip_process_ctx_clear = qpd->pqm->process->debug_trap_enabled;
>   
>   	queue_type = convert_to_mes_queue_type(q->properties.type);
>   	if (queue_type < 0) {
> @@ -1679,6 +1683,9 @@ static int create_queue_cpsch(struct device_queue_manager *dqm, struct queue *q,
>   	 * updates the is_evicted flag but is a no-op otherwise.
>   	 */
>   	q->properties.is_evicted = !!qpd->evicted;
> +	q->properties.is_dbg_wa = qpd->pqm->process->debug_trap_enabled &&
> +			KFD_GC_VERSION(q->device) >= IP_VERSION(11, 0, 0) &&
> +			KFD_GC_VERSION(q->device) < IP_VERSION(12, 0, 0);
>   
>   	if (qd)
>   		mqd_mgr->restore_mqd(mqd_mgr, &q->mqd, q->mqd_mem_obj, &q->gart_mqd_addr,
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c
> index 4889865c725c..c2a7226fc588 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c
> @@ -48,8 +48,7 @@ static void update_cu_mask(struct mqd_manager *mm, void *mqd,
>   	struct cik_mqd *m;
>   	uint32_t se_mask[4] = {0}; /* 4 is the max # of SEs */
>   
> -	if (!minfo || (minfo->update_flag != UPDATE_FLAG_CU_MASK) ||
> -	    !minfo->cu_mask.ptr)
> +	if (!minfo || !minfo->cu_mask.ptr)
>   		return;
>   
>   	mqd_symmetrically_map_cu_mask(mm,
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
> index cb484ace17de..8248e77751e7 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
> @@ -48,8 +48,7 @@ static void update_cu_mask(struct mqd_manager *mm, void *mqd,
>   	struct v10_compute_mqd *m;
>   	uint32_t se_mask[4] = {0}; /* 4 is the max # of SEs */
>   
> -	if (!minfo || (minfo->update_flag != UPDATE_FLAG_CU_MASK) ||
> -	    !minfo->cu_mask.ptr)
> +	if (!minfo || !minfo->cu_mask.ptr)
>   		return;
>   
>   	mqd_symmetrically_map_cu_mask(mm,
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c
> index ac7c8fc83c94..18ab613e787c 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c
> @@ -46,15 +46,33 @@ static void update_cu_mask(struct mqd_manager *mm, void *mqd,
>   {
>   	struct v11_compute_mqd *m;
>   	uint32_t se_mask[KFD_MAX_NUM_SE] = {0};
> +	bool has_wa_flag = minfo && (minfo->update_flag & (UPDATE_FLAG_DBG_WA_ENABLE |
> +			UPDATE_FLAG_DBG_WA_DISABLE));
>   
> -	if (!minfo || (minfo->update_flag != UPDATE_FLAG_CU_MASK) ||
> -	    !minfo->cu_mask.ptr)
> +	if (!minfo || !(has_wa_flag || minfo->cu_mask.ptr))
>   		return;
>   
> +	m = get_mqd(mqd);
> +
> +	if (has_wa_flag) {
> +		uint32_t wa_mask = minfo->update_flag == UPDATE_FLAG_DBG_WA_ENABLE ?
> +						0xffff : 0xffffffff;
> +
> +		m->compute_static_thread_mgmt_se0 = wa_mask;
> +		m->compute_static_thread_mgmt_se1 = wa_mask;
> +		m->compute_static_thread_mgmt_se2 = wa_mask;
> +		m->compute_static_thread_mgmt_se3 = wa_mask;
> +		m->compute_static_thread_mgmt_se4 = wa_mask;
> +		m->compute_static_thread_mgmt_se5 = wa_mask;
> +		m->compute_static_thread_mgmt_se6 = wa_mask;
> +		m->compute_static_thread_mgmt_se7 = wa_mask;
> +
> +		return;
> +	}
> +
>   	mqd_symmetrically_map_cu_mask(mm,
>   		minfo->cu_mask.ptr, minfo->cu_mask.count, se_mask);
>   
> -	m = get_mqd(mqd);
>   	m->compute_static_thread_mgmt_se0 = se_mask[0];
>   	m->compute_static_thread_mgmt_se1 = se_mask[1];
>   	m->compute_static_thread_mgmt_se2 = se_mask[2];
> @@ -109,6 +127,7 @@ static void init_mqd(struct mqd_manager *mm, void **mqd,
>   	uint64_t addr;
>   	struct v11_compute_mqd *m;
>   	int size;
> +	uint32_t wa_mask = q->is_dbg_wa ? 0xffff : 0xffffffff;
>   
>   	m = (struct v11_compute_mqd *) mqd_mem_obj->cpu_ptr;
>   	addr = mqd_mem_obj->gpu_addr;
> @@ -122,14 +141,15 @@ static void init_mqd(struct mqd_manager *mm, void **mqd,
>   
>   	m->header = 0xC0310800;
>   	m->compute_pipelinestat_enable = 1;
> -	m->compute_static_thread_mgmt_se0 = 0xFFFFFFFF;
> -	m->compute_static_thread_mgmt_se1 = 0xFFFFFFFF;
> -	m->compute_static_thread_mgmt_se2 = 0xFFFFFFFF;
> -	m->compute_static_thread_mgmt_se3 = 0xFFFFFFFF;
> -	m->compute_static_thread_mgmt_se4 = 0xFFFFFFFF;
> -	m->compute_static_thread_mgmt_se5 = 0xFFFFFFFF;
> -	m->compute_static_thread_mgmt_se6 = 0xFFFFFFFF;
> -	m->compute_static_thread_mgmt_se7 = 0xFFFFFFFF;
> +
> +	m->compute_static_thread_mgmt_se0 = wa_mask;
> +	m->compute_static_thread_mgmt_se1 = wa_mask;
> +	m->compute_static_thread_mgmt_se2 = wa_mask;
> +	m->compute_static_thread_mgmt_se3 = wa_mask;
> +	m->compute_static_thread_mgmt_se4 = wa_mask;
> +	m->compute_static_thread_mgmt_se5 = wa_mask;
> +	m->compute_static_thread_mgmt_se6 = wa_mask;
> +	m->compute_static_thread_mgmt_se7 = wa_mask;
>   
>   	m->cp_hqd_persistent_state = CP_HQD_PERSISTENT_STATE__PRELOAD_REQ_MASK |
>   			0x55 << CP_HQD_PERSISTENT_STATE__PRELOAD_SIZE__SHIFT;
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
> index 86f1cf090246..50da16dd4c96 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
> @@ -49,8 +49,7 @@ static void update_cu_mask(struct mqd_manager *mm, void *mqd,
>   	struct v9_mqd *m;
>   	uint32_t se_mask[KFD_MAX_NUM_SE] = {0};
>   
> -	if (!minfo || (minfo->update_flag != UPDATE_FLAG_CU_MASK) ||
> -	    !minfo->cu_mask.ptr)
> +	if (!minfo || !minfo->cu_mask.ptr)
>   		return;
>   
>   	mqd_symmetrically_map_cu_mask(mm,
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c
> index 530ba6f5b57e..58b40bff3e0c 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c
> @@ -51,8 +51,7 @@ static void update_cu_mask(struct mqd_manager *mm, void *mqd,
>   	struct vi_mqd *m;
>   	uint32_t se_mask[4] = {0}; /* 4 is the max # of SEs */
>   
> -	if (!minfo || (minfo->update_flag != UPDATE_FLAG_CU_MASK) ||
> -	    !minfo->cu_mask.ptr)
> +	if (!minfo || !minfo->cu_mask.ptr)
>   		return;
>   
>   	mqd_symmetrically_map_cu_mask(mm,
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> index 8f1e2f9023db..75521d96e937 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> @@ -479,6 +479,8 @@ struct queue_properties {
>   	bool is_evicted;
>   	bool is_active;
>   	bool is_gws;
> +	bool is_dbg_wa;
> +	bool is_user_cu_masked;
>   	/* Not relevant for user mode queues in cp scheduling */
>   	unsigned int vmid;
>   	/* Relevant only for sdma queues*/
> @@ -501,7 +503,8 @@ struct queue_properties {
>   			    !(q).is_evicted)
>   
>   enum mqd_update_flag {
> -	UPDATE_FLAG_CU_MASK = 0,
> +	UPDATE_FLAG_DBG_WA_ENABLE = 1,
> +	UPDATE_FLAG_DBG_WA_DISABLE = 2,
>   };
>   
>   struct mqd_update_info {
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
> index 5137476ec18e..d8f032214481 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
> @@ -498,8 +498,12 @@ int pqm_update_mqd(struct process_queue_manager *pqm,
>   		return -EFAULT;
>   	}
>   
> +	/* CUs are masked for debugger requirements so deny user mask  */
> +	if (pqn->q->properties.is_dbg_wa && minfo && minfo->cu_mask.ptr)
> +		return -EBUSY;
> +
>   	/* ASICs that have WGPs must enforce pairwise enabled mask checks. */
> -	if (minfo && minfo->update_flag == UPDATE_FLAG_CU_MASK && minfo->cu_mask.ptr &&
> +	if (minfo && minfo->cu_mask.ptr &&
>   			KFD_GC_VERSION(pqn->q->device) >= IP_VERSION(10, 0, 0)) {
>   		int i;
>   
> @@ -518,6 +522,9 @@ int pqm_update_mqd(struct process_queue_manager *pqm,
>   	if (retval != 0)
>   		return retval;
>   
> +	if (minfo && minfo->cu_mask.ptr)
> +		pqn->q->properties.is_user_cu_masked = true;
> +
>   	return 0;
>   }
>   
