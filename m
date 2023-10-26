Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E57F7D7B8B
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 06:38:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF88A10E755;
	Thu, 26 Oct 2023 04:38:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2081.outbound.protection.outlook.com [40.107.220.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2823710E753;
 Thu, 26 Oct 2023 04:38:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PG/MiU2ctumJUqVLJZokQm1kIKl3jxElRWD4Gm7gbC3ExGR18rwd+EcL7JTF4mxu+2X4hyIBXuAnkTh8brjqM4wh6Gfae3mqvMlJxdG9Zd1XBZy3+25yqF5OvEutMBEIixrk3my3QoNibOZs1BeKT9KRa4UbmhhEgQf/We1E0+tCehahCChW0vFtTnBAQUwEl716rd5ptF5FyAsEfUzXKVcKQk8mZHEed1E0vKXjuoA/P33geTG05Bv3Qjlii6sntHFwIrOE9oVG41riFabFqHkadCvSaEM6ayiI28kCCSAuaQPAZT6vEV+JWVunGdOESFw1lHm3FPdCWdne22YZ9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cmxSIXPDhhqInP6MCKHksuVm1Sdhkv7G4jlH5x+s7YU=;
 b=ZL9TeGSjcBBHzEJIbRHZfaSjgB329gjIR1qpwjbjWSBsZCXEPYb1d41NRVVnIXvsR3za0ZIrLB6S4x8RGtFp1hPy6s1RlfVa28KZDx11ZhPuaxvgyadjuUteHL1ZHSn43Vk8tQ0ho24pzegg4AgvZRiECpkDhtO/KoD8AMNJz/tzxzyH0aNwHfs/vzxivtTM+F6lTXq+8lh3cXuOHx0T3OZK4bDwUBfYmwaLNO64IrqcWoL/xJ1HaCFqiGVPt8IyQMIKccNNWa4PW5oyVEe47Jxun0DpkZF+eDdzksCt3O9nQ5wqL4sF2ZB/cpZ5JqSns7g75LtNhK5z8jtlpkURgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cmxSIXPDhhqInP6MCKHksuVm1Sdhkv7G4jlH5x+s7YU=;
 b=e4jCn+OdBXuFBXH6vBMtXw291h8W7UXEQGY51cWWDsV7cYNdc0JkE/en5a+/Ssd81O8PlcSIYhtpMIqXkJnucI5qdl6D1gzjaS3NdWtvKhahRCqcbxfAVjXfS0ZzOTuumX7qFVrWZKWJWo4dLhspVrl9VXN8j7a04MnbpU4VkJE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 PH7PR12MB9222.namprd12.prod.outlook.com (2603:10b6:510:2ef::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6933.19; Thu, 26 Oct 2023 04:38:30 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef%6]) with mapi id 15.20.6907.025; Thu, 26 Oct 2023
 04:38:30 +0000
Message-ID: <2f942aee-f6fc-40bf-87b9-745736747fa8@amd.com>
Date: Thu, 26 Oct 2023 00:38:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.3.3
Subject: Re: [PATCH v7 4/6] drm/sched: Split free_job into own work item
Content-Language: en-CA, en-US
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20231026041236.1273694-1-matthew.brost@intel.com>
 <20231026041236.1273694-5-matthew.brost@intel.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Autocrypt: addr=luben.tuikov@amd.com; keydata=
 xjMEY1i6jxYJKwYBBAHaRw8BAQdAhfD+Cc+P5t/fiF08Vw25EMLiwUuxULYRiDQAP6H50MTN
 I0x1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+wpkEExYKAEEWIQQyyR05VSHw
 x45E/SoppxulNG8HhgUCY1i6jwIbAwUJCWYBgAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIX
 gAAKCRAppxulNG8Hhk53AP4k4UY5xfcje0c5OF1k22pNv8tErxtVpgKKZgvfetA4xwD+OoAh
 vesLIYumBDxP0BoLiLN84udxdT15HwPFUGiDmwDOOARjWLqPEgorBgEEAZdVAQUBAQdAzSxY
 a2EtvvIwd09NckBLSTarSLNDkUthmqPnwolwiDYDAQgHwn4EGBYKACYWIQQyyR05VSHwx45E
 /SoppxulNG8HhgUCY1i6jwIbDAUJCWYBgAAKCRAppxulNG8HhnBLAP4yjSGpK6PE1mapKhrq
 8bSl9reo+F6EqdhE8X2TTHPycAEAt8EkTEstSiaOpM66gneU7r+xxzOYULo1b1XjXayGvwM=
In-Reply-To: <20231026041236.1273694-5-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQXP288CA0034.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:41::45) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|PH7PR12MB9222:EE_
X-MS-Office365-Filtering-Correlation-Id: c0b0f452-aa94-40fb-0cd4-08dbd5dd672b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EhzhbGeoxpBGuEq6Z1Pdc1yDTZxeZZw3fWDng/1m9Et8dw9tETnsdUhmNC4Va+fR4bTjiR0nh91OUrNQNt46pqbsQqpXbYpXHPeXqALCWFDVj3H8nwOUD+7vHS0SjsIHCb9f25vMCRhLOzlEWEMSrLz6bDr4hPnCg41bSOucyzKZ4dLnEbv2al8uNQ2XAZhtbuTrPyfCxFZJVZkirffIhQ499cPmUy3DCadc5czbQ1OwSEWybEgyCGAt1oRV36ckmLxFLpnDCrbkOVwEBXin4DMY/fACxr9TBUwD63V1LF2LJJRRMkS1js1d+f+kW1yX+EYJyFOh4Gy86sOv7QShgNsEDq1VOU3QZKnQLPx+NkaCn1CfbIZFXDms+sDnLSuSHAVKSIOTWR/YlzQbH1vV7sWkr0+mvMwKUUzEAgaRubCxv4To4/vxZumiUeVBIIvW1kTALJ61e5zgIY3BYUsg1NbxFWAh9L8u+MwOVoBJa2OaH3/1Q5787uTR1HdztfKyA3woW6ZhzJrvT5jZueIBzFs2p/ltAccTNDaTGq5PSBz/OEr/tj9f3s4lTFVU9nh8r27Ke/F6cAjio4ZoMFViUNAStxIZa27yCboAeC7gCSbkXKSs+qStIlGdpEsxMWPk0Y0UtNVmFmKEZxWamudeew==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(366004)(136003)(346002)(396003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(44832011)(53546011)(6666004)(478600001)(6506007)(66476007)(2616005)(66556008)(66946007)(6512007)(36756003)(31696002)(86362001)(6486002)(26005)(38100700002)(41300700001)(8676002)(8936002)(83380400001)(4326008)(316002)(7416002)(5660300002)(31686004)(2906002)(4001150100001)(30864003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjRRVU0xWmpRSHhQcUpZc2MxcWhJV3dubjgxWnFyNzk2cklJWmhnRFRNTm92?=
 =?utf-8?B?c1VKVlpYNHM0QVFQcVUvRmVNQmhqbUEwZlN4MEVOZm5rSkFiYmlyQTMxNFhD?=
 =?utf-8?B?L2ZFZjRnNmRreXdCcVpRRGlzaXh2N2hRVXUxSnpPUFZ6Mys0aWQvKzNhNjVa?=
 =?utf-8?B?cDhlSzhEZ2YvbmtiTjAwUWVJbURFTEJjeWgzU3poYkl4dDNWY1RmWW5pcHpX?=
 =?utf-8?B?UFBucjVTejRVK0NvV1czZ3k1aGkrVm9SbkZBUGdtL0lZc0hlZHBtMWJmZFBH?=
 =?utf-8?B?YlJkNXZZMm5YNHRmeCtyUG9lclVuM2xXbzhhdUNMeDluRWdwUkVpem45TkRx?=
 =?utf-8?B?amF5NnJ3bVpJTnlEMlNSUHZKQll4Rjl2RE5ZbVVBc3lDYUliV3JIZjY4UFFG?=
 =?utf-8?B?MExrczJ4VHFhdFlQVHR4TysvODArRG51OFlDMGRxdXlVelNSNjVBa1hPZDVJ?=
 =?utf-8?B?Nno0NEQ0dlpRUWxRL1Z0ZmVuODBiVVdhdkdvR1draTNpQW5ZYXZ3ekpVTWJi?=
 =?utf-8?B?VTVkUHVnWVlOZmdXOUN5M1hyUzFwRXJOdi9ObTJMWnd3V0FJNXRDa2EwQm8v?=
 =?utf-8?B?T3VIbHd3UEhVNVJlS3pUa0xxMVh4UUlJKzhhYTNORmxnTmtYMTFiRnM3ZWJX?=
 =?utf-8?B?SFBaLzBLeGhqUWt4L3FHcDRPbXZKOTZQRHNxVTh4NEFrcWozelBLb1d4ekpG?=
 =?utf-8?B?NWxlTjZ3cHc5QStzNXRVYXZpTjJmdHdCaEpLTFR3REl5RnJNcEJnY3k1R1Zk?=
 =?utf-8?B?TVo3RHhXaTdva3pyWTc5ZU9Bc3l3WTh6NmdqSTBmY0xDeXN0NFAzMWRaV0tx?=
 =?utf-8?B?enVwd1haWjh5cFdWMkxpQ0oxTndwZ1dPRTd0M21zL2h6SUpvOFFJam1oS3Mv?=
 =?utf-8?B?OVpHYmhoMzdFUGJDR2hYTjVHTVhncEoxeEx2RUdTZ0hzalgxc0NsUG9kN1BT?=
 =?utf-8?B?K0ZrZWdUVU5Vdnc1V0VOMnRvell4SHZqYXEwcWJ4K2V2aExLMkdTNTlDd1dQ?=
 =?utf-8?B?YlRZMlBweEtyTnpLdk41c1lyTUFxOEZPMHBpeVc1c2h2QUJFMWV6ajZ2dnMw?=
 =?utf-8?B?YWxndDU3ZHB0OEtiVHRWV3hQRHlHalR3cjE1RGdNZ1dRSCtXOFpJanBUbnpm?=
 =?utf-8?B?d3Y0RUUvNmpCMUErdno2RDBzcTVnRFBxaXdCZGhacXhMKzFrQlFLRklsWExP?=
 =?utf-8?B?eTFaQW9tb1pvMEJwSzNuZkdyNVpFWHBraGRudldZQ3B4dlpCakI0ejNZanhR?=
 =?utf-8?B?N1U5N1pid1BnRHlmU2luRzg1NUlxVzFmS2F2ME5hdnNkclNhLzh2QzZBZWlF?=
 =?utf-8?B?WEUxOGZIcjRCMFRRVzhNN0dCeldKR1FlUGo3djJISVU0S1JLdUNmQmFFMXVH?=
 =?utf-8?B?MHdiekVjTE9HUzNTWU5KOFBBM2pRRXZYaWYvaWpPcU1ydUxPbDA5cmVZNjl1?=
 =?utf-8?B?UnZtaC94ZWJXV3NqM1RwZUtwZlZQRlA5bHBpaDNFM3pSZ2NsWEtBbTFKUzVo?=
 =?utf-8?B?R0l6YVpXTkU3ZEZWcWVzMFBQbGoyekNlMy9aMjQ1Y2NJb1BsajJDVVYyMlZo?=
 =?utf-8?B?U0NvWms2UTArQkVzY3N4Z29LODJlWGF6ZlkrcTNFK0l3dmpWd2dFeHlrd1Nm?=
 =?utf-8?B?emR0TnFiMFkzUTZZdldwZnFJc1pQZkdaYjEvRGtKM1JWOWY1Z0g0N2tEOTlI?=
 =?utf-8?B?b1lhdHhwUlFDZXVQcDNacVhoNzVQZTV4YkxUaktXK0xWQ01jSXA3N0hualZU?=
 =?utf-8?B?M3BWY3Z5RkhKR2s4K09jT0o1TkJDM1llZURVOGpiL05LQm0zQVk0TWswY01F?=
 =?utf-8?B?T3pUellVMzhhV0ZFemgxN3UrV2hyQ0lZejhGTFl6YitzMXFhalFpbGMzQXc5?=
 =?utf-8?B?TllmaUlCNjEvc0FSeS9LVEErN21lNTNacUdIaFNNOVNHWnRuTTMyYVEzMUh2?=
 =?utf-8?B?aldCWHBCQklZb2tmUkRvWXVENENSVld1ZG5LMDhKU2h2YzJkb2hUYVBCeVRo?=
 =?utf-8?B?NzJ1OHUyTkY4b3p3MCtITlB3bEZnVFNMSlNJT3VKbmhVblhBR3hmRmwvQk9z?=
 =?utf-8?B?T1psNzNKTFFGTXRNYXJ4QWM5QXMveGhjcVBleTZCV3l1T2R3MzBSNE1VR05v?=
 =?utf-8?Q?CvUXz0/n4IY3wKMcWp6JVqV17?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0b0f452-aa94-40fb-0cd4-08dbd5dd672b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 04:38:29.9882 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qaSCpXrnlHBWyzL3yli19sVXED9bfgUS1v33b6q8HOR95qIiXMhT8stOvl8nB9de
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9222
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, Liviu.Dudau@arm.com,
 mcanal@igalia.com, boris.brezillon@collabora.com, dakr@redhat.com,
 donald.robson@imgtec.com, lina@asahilina.net, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-10-26 00:12, Matthew Brost wrote:
> Rather than call free_job and run_job in same work item have a dedicated
> work item for each. This aligns with the design and intended use of work
> queues.
> 
> v2:
>    - Test for DMA_FENCE_FLAG_TIMESTAMP_BIT before setting
>      timestamp in free_job() work item (Danilo)
> v3:
>   - Drop forward dec of drm_sched_select_entity (Boris)
>   - Return in drm_sched_run_job_work if entity NULL (Boris)
> v4:
>   - Replace dequeue with peek and invert logic (Luben)
>   - Wrap to 100 lines (Luben)
>   - Update comments for *_queue / *_queue_if_ready functions (Luben)
> v5:
>   - Drop peek argument, blindly blindly reinit idle (Luben)
>   - s/drm_sched_free_job_queue_if_ready/drm_sched_free_job_queue_if_done (Luben)
>   - Update work_run_job & work_free_job kernel doc (Luben)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 241 +++++++++++++++----------
>  include/drm/gpu_scheduler.h            |   8 +-
>  2 files changed, 151 insertions(+), 98 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index b22157e920d4..3d89420d4ffb 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -257,12 +257,89 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>  
>  /**
>   * drm_sched_run_job_queue - enqueue scheduler submission
> + * drm_sched_run_job_queue - enqueue run-job work
>   * @sched: scheduler instance
>   */
>  static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
>  {
>  	if (!READ_ONCE(sched->pause_submit))
> -		queue_work(sched->submit_wq, &sched->work_submit);
> +		queue_work(sched->submit_wq, &sched->work_run_job);
> +}
> +
> +/**
> + * drm_sched_can_queue -- Can we queue more to the hardware?
> + * @sched: scheduler instance
> + *
> + * Return true if we can push more jobs to the hw, otherwise false.
> + */
> +static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
> +{
> +	return atomic_read(&sched->hw_rq_count) <
> +		sched->hw_submission_limit;
> +}
> +
> +/**
> + * drm_sched_select_entity - Select next entity to process
> + *
> + * @sched: scheduler instance
> + *
> + * Returns the entity to process or NULL if none are found.
> + */
> +static struct drm_sched_entity *
> +drm_sched_select_entity(struct drm_gpu_scheduler *sched)
> +{
> +	struct drm_sched_entity *entity;
> +	int i;
> +
> +	if (!drm_sched_can_queue(sched))
> +		return NULL;
> +
> +	/* Kernel run queue has higher priority than normal run queue*/
> +	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> +		entity = drm_sched_policy == DRM_SCHED_POLICY_FIFO ?
> +			drm_sched_rq_select_entity_fifo(sched->sched_rq[i]) :
> +			drm_sched_rq_select_entity_rr(sched->sched_rq[i]);
> +		if (entity)
> +			break;
> +	}
> +
> +	return entity;
> +}
> +

Could you please rewrite the patch so as to not do the unnecessary move
of the drm_sched_select_entity(). This function has no changes in it,
and this move a few lines up only creates noise, when doing "git blame"
and similar data-mining.

So, just rewrite the patch without moving unchanged code up/down, so
that only the essential differences are shown by git-diff(1). This makes
it easy to review, easy to do data-mining down the road, and so on.

The rest of the patch looks good.

Thanks!

Regards,
Luben

> +/**
> + * drm_sched_run_job_queue_if_ready - enqueue run-job work if ready
> + * @sched: scheduler instance
> + */
> +static void drm_sched_run_job_queue_if_ready(struct drm_gpu_scheduler *sched)
> +{
> +	if (drm_sched_select_entity(sched))
> +		drm_sched_run_job_queue(sched);
> +}
> +
> +/**
> + * drm_sched_free_job_queue - enqueue free-job work
> + * @sched: scheduler instance
> + */
> +static void drm_sched_free_job_queue(struct drm_gpu_scheduler *sched)
> +{
> +	if (!READ_ONCE(sched->pause_submit))
> +		queue_work(sched->submit_wq, &sched->work_free_job);
> +}
> +
> +/**
> + * drm_sched_free_job_queue_if_done - enqueue free-job work if ready
> + * @sched: scheduler instance
> + */
> +static void drm_sched_free_job_queue_if_done(struct drm_gpu_scheduler *sched)
> +{
> +	struct drm_sched_job *job;
> +
> +	spin_lock(&sched->job_list_lock);
> +	job = list_first_entry_or_null(&sched->pending_list,
> +				       struct drm_sched_job, list);
> +	if (job && dma_fence_is_signaled(&job->s_fence->finished))
> +		drm_sched_free_job_queue(sched);
> +	spin_unlock(&sched->job_list_lock);
>  }
>  
>  /**
> @@ -284,7 +361,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
>  	dma_fence_get(&s_fence->finished);
>  	drm_sched_fence_finished(s_fence, result);
>  	dma_fence_put(&s_fence->finished);
> -	drm_sched_run_job_queue(sched);
> +	drm_sched_free_job_queue(sched);
>  }
>  
>  /**
> @@ -550,7 +627,7 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
>  				drm_sched_job_done(s_job, fence->error);
>  			else if (r)
>  				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
> -					  r);
> +					      r);
>  		} else
>  			drm_sched_job_done(s_job, -ECANCELED);
>  	}
> @@ -862,18 +939,6 @@ void drm_sched_job_cleanup(struct drm_sched_job *job)
>  }
>  EXPORT_SYMBOL(drm_sched_job_cleanup);
>  
> -/**
> - * drm_sched_can_queue -- Can we queue more to the hardware?
> - * @sched: scheduler instance
> - *
> - * Return true if we can push more jobs to the hw, otherwise false.
> - */
> -static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
> -{
> -	return atomic_read(&sched->hw_rq_count) <
> -		sched->hw_submission_limit;
> -}
> -
>  /**
>   * drm_sched_wakeup_if_can_queue - Wake up the scheduler
>   * @sched: scheduler instance
> @@ -886,34 +951,6 @@ void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
>  		drm_sched_run_job_queue(sched);
>  }
>  
> -/**
> - * drm_sched_select_entity - Select next entity to process
> - *
> - * @sched: scheduler instance
> - *
> - * Returns the entity to process or NULL if none are found.
> - */
> -static struct drm_sched_entity *
> -drm_sched_select_entity(struct drm_gpu_scheduler *sched)
> -{
> -	struct drm_sched_entity *entity;
> -	int i;
> -
> -	if (!drm_sched_can_queue(sched))
> -		return NULL;
> -
> -	/* Kernel run queue has higher priority than normal run queue*/
> -	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> -		entity = drm_sched_policy == DRM_SCHED_POLICY_FIFO ?
> -			drm_sched_rq_select_entity_fifo(sched->sched_rq[i]) :
> -			drm_sched_rq_select_entity_rr(sched->sched_rq[i]);
> -		if (entity)
> -			break;
> -	}
> -
> -	return entity;
> -}
> -
>  /**
>   * drm_sched_get_cleanup_job - fetch the next finished job to be destroyed
>   *
> @@ -943,8 +980,10 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
>  						typeof(*next), list);
>  
>  		if (next) {
> -			next->s_fence->scheduled.timestamp =
> -				dma_fence_timestamp(&job->s_fence->finished);
> +			if (test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT,
> +				     &next->s_fence->scheduled.flags))
> +				next->s_fence->scheduled.timestamp =
> +					dma_fence_timestamp(&job->s_fence->finished);
>  			/* start TO timer for next job */
>  			drm_sched_start_timeout(sched);
>  		}
> @@ -994,74 +1033,83 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
>  EXPORT_SYMBOL(drm_sched_pick_best);
>  
>  /**
> - * drm_sched_main - main scheduler thread
> + * drm_sched_free_job_work - worker to call free_job
>   *
> - * @param: scheduler instance
> + * @w: free job work
>   */
> -static void drm_sched_main(struct work_struct *w)
> +static void drm_sched_free_job_work(struct work_struct *w)
>  {
>  	struct drm_gpu_scheduler *sched =
> -		container_of(w, struct drm_gpu_scheduler, work_submit);
> -	struct drm_sched_entity *entity;
> +		container_of(w, struct drm_gpu_scheduler, work_free_job);
>  	struct drm_sched_job *cleanup_job;
> -	int r;
>  
>  	if (READ_ONCE(sched->pause_submit))
>  		return;
>  
>  	cleanup_job = drm_sched_get_cleanup_job(sched);
> -	entity = drm_sched_select_entity(sched);
> -
> -	if (!entity && !cleanup_job)
> -		return;	/* No more work */
> -
> -	if (cleanup_job)
> +	if (cleanup_job) {
>  		sched->ops->free_job(cleanup_job);
>  
> -	if (entity) {
> -		struct dma_fence *fence;
> -		struct drm_sched_fence *s_fence;
> -		struct drm_sched_job *sched_job;
> -
> -		sched_job = drm_sched_entity_pop_job(entity);
> -		if (!sched_job) {
> -			complete_all(&entity->entity_idle);
> -			if (!cleanup_job)
> -				return;	/* No more work */
> -			goto again;
> -		}
> +		drm_sched_free_job_queue_if_done(sched);
> +		drm_sched_run_job_queue_if_ready(sched);
> +	}
> +}
>  
> -		s_fence = sched_job->s_fence;
> +/**
> + * drm_sched_run_job_work - worker to call run_job
> + *
> + * @w: run job work
> + */
> +static void drm_sched_run_job_work(struct work_struct *w)
> +{
> +	struct drm_gpu_scheduler *sched =
> +		container_of(w, struct drm_gpu_scheduler, work_run_job);
> +	struct drm_sched_entity *entity;
> +	struct dma_fence *fence;
> +	struct drm_sched_fence *s_fence;
> +	struct drm_sched_job *sched_job;
> +	int r;
>  
> -		atomic_inc(&sched->hw_rq_count);
> -		drm_sched_job_begin(sched_job);
> +	if (READ_ONCE(sched->pause_submit))
> +		return;
>  
> -		trace_drm_run_job(sched_job, entity);
> -		fence = sched->ops->run_job(sched_job);
> +	entity = drm_sched_select_entity(sched);
> +	if (!entity)
> +		return;
> +
> +	sched_job = drm_sched_entity_pop_job(entity);
> +	if (!sched_job) {
>  		complete_all(&entity->entity_idle);
> -		drm_sched_fence_scheduled(s_fence, fence);
> +		return;	/* No more work */
> +	}
>  
> -		if (!IS_ERR_OR_NULL(fence)) {
> -			/* Drop for original kref_init of the fence */
> -			dma_fence_put(fence);
> +	s_fence = sched_job->s_fence;
>  
> -			r = dma_fence_add_callback(fence, &sched_job->cb,
> -						   drm_sched_job_done_cb);
> -			if (r == -ENOENT)
> -				drm_sched_job_done(sched_job, fence->error);
> -			else if (r)
> -				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
> -					  r);
> -		} else {
> -			drm_sched_job_done(sched_job, IS_ERR(fence) ?
> -					   PTR_ERR(fence) : 0);
> -		}
> +	atomic_inc(&sched->hw_rq_count);
> +	drm_sched_job_begin(sched_job);
>  
> -		wake_up(&sched->job_scheduled);
> +	trace_drm_run_job(sched_job, entity);
> +	fence = sched->ops->run_job(sched_job);
> +	complete_all(&entity->entity_idle);
> +	drm_sched_fence_scheduled(s_fence, fence);
> +
> +	if (!IS_ERR_OR_NULL(fence)) {
> +		/* Drop for original kref_init of the fence */
> +		dma_fence_put(fence);
> +
> +		r = dma_fence_add_callback(fence, &sched_job->cb,
> +					   drm_sched_job_done_cb);
> +		if (r == -ENOENT)
> +			drm_sched_job_done(sched_job, fence->error);
> +		else if (r)
> +			DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n", r);
> +	} else {
> +		drm_sched_job_done(sched_job, IS_ERR(fence) ?
> +				   PTR_ERR(fence) : 0);
>  	}
>  
> -again:
> -	drm_sched_run_job_queue(sched);
> +	wake_up(&sched->job_scheduled);
> +	drm_sched_run_job_queue_if_ready(sched);
>  }
>  
>  /**
> @@ -1146,7 +1194,8 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>  	spin_lock_init(&sched->job_list_lock);
>  	atomic_set(&sched->hw_rq_count, 0);
>  	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
> -	INIT_WORK(&sched->work_submit, drm_sched_main);
> +	INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
> +	INIT_WORK(&sched->work_free_job, drm_sched_free_job_work);
>  	atomic_set(&sched->_score, 0);
>  	atomic64_set(&sched->job_id_count, 0);
>  	sched->pause_submit = false;
> @@ -1273,7 +1322,8 @@ EXPORT_SYMBOL(drm_sched_wqueue_ready);
>  void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched)
>  {
>  	WRITE_ONCE(sched->pause_submit, true);
> -	cancel_work_sync(&sched->work_submit);
> +	cancel_work_sync(&sched->work_run_job);
> +	cancel_work_sync(&sched->work_free_job);
>  }
>  EXPORT_SYMBOL(drm_sched_wqueue_stop);
>  
> @@ -1285,6 +1335,7 @@ EXPORT_SYMBOL(drm_sched_wqueue_stop);
>  void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched)
>  {
>  	WRITE_ONCE(sched->pause_submit, false);
> -	queue_work(sched->submit_wq, &sched->work_submit);
> +	queue_work(sched->submit_wq, &sched->work_run_job);
> +	queue_work(sched->submit_wq, &sched->work_free_job);
>  }
>  EXPORT_SYMBOL(drm_sched_wqueue_start);
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 1d52b8bbb06c..37749f561866 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -480,9 +480,10 @@ struct drm_sched_backend_ops {
>   *                 finished.
>   * @hw_rq_count: the number of jobs currently in the hardware queue.
>   * @job_id_count: used to assign unique id to the each job.
> - * @submit_wq: workqueue used to queue @work_submit
> + * @submit_wq: workqueue used to queue @work_run_job and @work_free_job
>   * @timeout_wq: workqueue used to queue @work_tdr
> - * @work_submit: schedules jobs and cleans up entities
> + * @work_run_job: work which calls run_job op of each scheduler.
> + * @work_free_job: work which calls free_job op of each scheduler.
>   * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
>   *            timeout interval is over.
>   * @pending_list: the list of jobs which are currently in the job queue.
> @@ -511,7 +512,8 @@ struct drm_gpu_scheduler {
>  	atomic64_t			job_id_count;
>  	struct workqueue_struct		*submit_wq;
>  	struct workqueue_struct		*timeout_wq;
> -	struct work_struct		work_submit;
> +	struct work_struct		work_run_job;
> +	struct work_struct		work_free_job;
>  	struct delayed_work		work_tdr;
>  	struct list_head		pending_list;
>  	spinlock_t			job_list_lock;

