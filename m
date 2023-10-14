Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EED077C924A
	for <lists+dri-devel@lfdr.de>; Sat, 14 Oct 2023 04:06:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 036DA10E0A6;
	Sat, 14 Oct 2023 02:06:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2084.outbound.protection.outlook.com [40.107.244.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D3910E064;
 Sat, 14 Oct 2023 02:06:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R5Oseuc7Dlu5m4WNSwqXROiGTNkq7/zlotNXA9/tbI/wGEeOnjKsKDjOA3p9keI1C/9w0bD4GPAn/E+ToiOLX0gKLWyfcHEIzdQ9P23jEV8rOpiyGw3eRqUKH+WdUOPeGMlfOjuKTw7FwsSf6o0ZOvDssLsAuIAhXgcoKcueDG60XFk9Kuu0Bfk5izdoJvCD73namssjO4THZZa+xfj4Yoqmja8ONUjyBlk/T1PbXgv0d/MnHtxae2mTBvdiO7PysXAxT184OKl7Ehv2/tg8dSJ5iLEN/YBIK1YAq1iPZDVOZrilS6gvwNgMFZRvlY2jjbnfatA6WrMU0cEU9JGADg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gCxgFOXqgXbSiuPwB86hWco6ufLxUiAOaJbKgCmnJO0=;
 b=bxhg+Dety4/mPpkPDtf14JB8zPAUhJSYbFYywhxeGYw9DM0a0I47I8hOLWtOY8OQFeE8qBMm/dLIqhn8HNzI7h8PLQuuafbBbteIg3Kblvly4ZeKKhRYNVxwe1WdhpoOrJkpUXhMXjlnaqjtMkktcj9r3yEy84Qh3tD+4iyoaX7FTjIjuAMLqRZ8CibmIqmraVnhmZFjdvoX8GMJ2gwkeEV/A4iof7HGm4uRKHCji7O6vXteSPoADlk81alX03+wlqClL18hehkPQ371bj3DWDiWClToi2a1t3FjLTXZb/avMAmanwovpVhmczJotRJRFbMDp5s9ywbAgUZpugmW3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gCxgFOXqgXbSiuPwB86hWco6ufLxUiAOaJbKgCmnJO0=;
 b=hjtQ3vjH5QdjqA5dFpGX1dV1eSoQ+EWne2EWtlh7vyzZNaWxwnjWC6+zVAfZhdOHm+4Z8RXPXsZxEE+jC+F+oXQAD+Odvbuedq4hrUuyhwBPu127jjnHI251LfrUuk77XP0hRQ2ncBr+Bk/oYYFZehj6DwTDYX1UkIg313HrQI8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 PH7PR12MB5879.namprd12.prod.outlook.com (2603:10b6:510:1d7::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.45; Sat, 14 Oct 2023 02:06:22 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef%5]) with mapi id 15.20.6863.047; Sat, 14 Oct 2023
 02:06:22 +0000
Message-ID: <f8316e1e-a4c8-46a3-83b8-2971d242fc7e@amd.com>
Date: Fri, 13 Oct 2023 22:06:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.3.2
Subject: Re: [PATCH v5 4/7] drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY
 scheduling policy
Content-Language: en-CA, en-US
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20231011235826.585624-1-matthew.brost@intel.com>
 <20231011235826.585624-5-matthew.brost@intel.com>
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
In-Reply-To: <20231011235826.585624-5-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0112.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::15) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|PH7PR12MB5879:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ddb7811-f662-46e2-2e3a-08dbcc5a299d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oA/afa11FaO+lmfXA/bSM96oMzYiZR1oQlUb1S7NRhJ18KQN1rhSgQJPh96hmJo4/4SIIrhmLP58gMINGVt10to+moz7S1BIbEwHzjEutGnbyY+Yviheu2QTyIXx/o1wj9OeDYKlbK7p8VweRGa8FwgbHdzmt/eZ8oyDhoRcliEWDRkHq7Zq4vhJwh6dw3raODMeQ7Aha2tHTPdgHrhdUdKu6iNdrxUF+1m4DziG1gp0DIcEg197yetbo2peTDAd0k1pv8ht6KDNHfU0KvFOX6AfFrY+ND33750kTXJYgJlk2wD4Ps/F2Wfap/N6dIffBA6taGUaKyfbyqISt+lm96ggs18uLDO2aki5cj2YRwrip3mOhAPElro/l9zPDoGmLQK15ETqizduS/j0POGCgbL8t9sBn6vmdlSDJ4uf4weaTWOOdwCPFGCDlQ8gdN/jd8dMEs90HNdiRBOTXZ0TCB/Zaq9bygQYLjrZ75S+DKNIch5UgHGSXhEevjUG3UNATkbs8QZAFFCS7zAxgKtlXMPTjyISts/Mn7Up0qlE/P9l2IBc+icEEgn7wStPLe9jJaEjAG2Qcn/1mWt7jp+jfhMkqMN5iJ44c0TMfDHxE68WPdXMqSCnvZh6hH1xO89ffWCD3upv+Qtfqe3H1g8Xe1bLmnyFithMvmQd7eJVHuTGxsjBEqjMEZWvp66FOum/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(346002)(136003)(396003)(39860400002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(6506007)(53546011)(4001150100001)(6666004)(30864003)(2906002)(26005)(83380400001)(44832011)(36756003)(2616005)(31696002)(38100700002)(5660300002)(86362001)(7416002)(66476007)(66556008)(66946007)(41300700001)(316002)(6486002)(6512007)(31686004)(8676002)(4326008)(478600001)(8936002)(45980500001)(43740500002)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmtIanVESm5LZVdDUi9JN09tZWRNL05SZ2pSUm5FeUxXYnpzUFZWV1dndHVV?=
 =?utf-8?B?YjJnSCtPNCtoamh4dWtWOTVQRGlXQ2RwSVowU3c0Z09BMUJGRzVPTEJZTkF0?=
 =?utf-8?B?UnZRWElEVUtxSDRtcWZMTkRrU05KNUV0WnNyK1lLazU3dnE2U3NmekswdDNB?=
 =?utf-8?B?OFVRbWlLclJBcjBGTkhXOE0rYzF2ajlUd0R6WTRoa09WK2NmUGRUOHdvWENM?=
 =?utf-8?B?VTdId0Y1ZjRTbFlCT3ZGQWNXeDdqWWpaOGg4UVZjMzVaT2hNUmFJVU5tSWZ4?=
 =?utf-8?B?THlZSkMvVmxsalNKbytWdndIM09adXBWLzNBVVVkZ0RTdVE2TmZvOFM2d3NJ?=
 =?utf-8?B?WXdBQ21nZlZBdDNLZ1pCZFZKbmg2dXVyR1o4anVsdkFWSk9Hb25tNStmNkNi?=
 =?utf-8?B?M2tnSWRGMnVtcmhIZW1xRWNEVmlEMURwMExaRmlCeEoxQ3paNVBUbkJERnVp?=
 =?utf-8?B?RnBjZFBxRFU5Z1JwNkVYZWo1dU1KbnJUUTVyQzNRWmNwbE5XbzB3ak5hTVlI?=
 =?utf-8?B?QU8rYXAvbFJmLzVGLzVNcXZpMXUvUGJsOVRpZE5IUkxYeUorcnFxSlludGJN?=
 =?utf-8?B?dUVDVi96THE0Qlg3SkwrbzhqeE9iUzBSZTRIVEJMZmNrenlXQzJrTFc0N0xX?=
 =?utf-8?B?Z3JhWHBvN2NrcjI4YUpKZU5UbUJVaGxwWWQ5djErZWpCa0xNdzhSMFJoOGs5?=
 =?utf-8?B?MkxURVBkVEd0MmJjNzdXT2Z3TE0vdU9xcnMwT3l3U0dEMUIxc3RnSnRYUWxh?=
 =?utf-8?B?NVNHanJEUVAwUGN3RWQwRk1vckZ3TjRoZTlXUDVuV0RHeVhUT3VQcjlpYWZ5?=
 =?utf-8?B?M2R1dkpDanNpdnNISHZyMEE3Rjl3ckJKeUFCendnZDFBSjNyejduTk5OY0di?=
 =?utf-8?B?ZWdMajZXbWJZWnRUVjJTNzBPR3NvaURocGVWeVkvTHZJM1h6bWxOM0FvWDhI?=
 =?utf-8?B?cE5xa0xTN0JJU0NFQXlabjNIdjVjZ1pnMHlxNElnWXBmZU1PS2JFb3dabk1j?=
 =?utf-8?B?bk9MNHNrRysza2hjS2w3anRSeFVjbjRvV0wyUXRDZjRyaUNTS0dycEp5M2Fx?=
 =?utf-8?B?TnF0T0RMWFNyMDF5VTFQNS9wR1dqV2gvWVR4bE8xU0ViQ2pVSHlzR2FlWUR0?=
 =?utf-8?B?OWZ3ME5INXlQbnZRS0lBRE16aHFyY0R2MzRWUjlKbWZlbUpwbW82aVRBb2Rk?=
 =?utf-8?B?S3hjWXFHZ1NPZVZyaWFZSW5kSjEzRUcyUlQwTmhpc2xzWTRCTGhEQWsvaktD?=
 =?utf-8?B?WUh0c096OFNLUzFwNXdyZnZleUlmeXhZeG1oLy9qKzY1K3BzK2QvbTN3cUxE?=
 =?utf-8?B?em4xNXJqNGxOQ2JMWXhlZFlqaTgvN1VtQWMrMGlUcVVWT2dVR09VODkwS3dq?=
 =?utf-8?B?WkYrRnQyQ0tmOXhvamwwZkpaUkNiQnlQbStTOStSdFAzbG5hTElQWFRmRTNU?=
 =?utf-8?B?alN5Qklsd1RWbjBRcGtWTUoyc1l1Q0NBejZzWVNLSnd2b2NKYUVFNUVxM1RT?=
 =?utf-8?B?MFFjeXNkRTVUN2tJZHZxcmQzSUQyQllWQnB4RTNKSjVZYXF1NU9pL1V1Q3Zx?=
 =?utf-8?B?NEZrTEN4aU1xZWJqNkdQZ3lIcDVldkd3aysyUzVtUy9GdXNQSDFnRElvQmJB?=
 =?utf-8?B?VlV6VllmSEJaRTZUMXZXeXFmRzBRNmtYcnZydllWUXJTYkdiNldBTGczUEd4?=
 =?utf-8?B?TUxWWHFWYlBtVzhvclRNV3RkQWx1TkcvMTJFSjRwWUI5dkdDK0pKdlpvK0Yy?=
 =?utf-8?B?dlRDM3A3WnRSL0RxU0RJSjMrSEVzMEdXTVZvaWR2NlN3a3dxNTJ4aXJWUXBr?=
 =?utf-8?B?VmlZZlBIRHA1REQ3cjJudlFpQ3ovTGtFSU4wQmh4MUd1REM3VUpQak9JVTVN?=
 =?utf-8?B?dERMZGpLRVhyMkpOR1oxU1gwc25sRENmV3pNcUFvTk84VEZEUXJ5VitCTVdn?=
 =?utf-8?B?UThYRENkYU9mS1NkMjRUdWl2dUx2V3pBREllMS9scTkrOHRkT1FNejcvQVlD?=
 =?utf-8?B?UkpaRHFWZzJ1R2dVVm5MQlhxZkVxMndMMTFGa2wwOUEzeUJsZmFpVGRHNVly?=
 =?utf-8?B?NjcvUmVDZ3g2aUdyNWdhSk5Yckpxa1BBOTVzVERHMUtSYTZvU0xkbmxkS2k5?=
 =?utf-8?Q?I+67XaGk/3itCK06LCQWp6Lxc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ddb7811-f662-46e2-2e3a-08dbcc5a299d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2023 02:06:22.1651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M2MpBB/xWlHDw65gEr0rnQDj1eGPsat2IvogidT+BvSOnFFcD/fbqOe69ch8Hpit
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5879
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

On 2023-10-11 19:58, Matthew Brost wrote:
> DRM_SCHED_POLICY_SINGLE_ENTITY creates a 1 to 1 relationship between
> scheduler and entity. No priorities or run queue used in this mode.
> Intended for devices with firmware schedulers.
> 
> v2:
>   - Drop sched / rq union (Luben)
> v3:
>   - Don't pick entity if stopped in drm_sched_select_entity (Danilo)
> v4:
>   - Rework if statement in drm_sched_entity_init (Luben)
>   - Update comment for drm_sched_entity_to_scheduler (Luben)
>   - Reword a few things in DOC comment (Luben)
>   - Do not check sched policy in for statement (Luben)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/scheduler/sched_entity.c | 70 ++++++++++++++-----
>  drivers/gpu/drm/scheduler/sched_fence.c  |  2 +-
>  drivers/gpu/drm/scheduler/sched_main.c   | 86 ++++++++++++++++++------
>  include/drm/gpu_scheduler.h              |  8 +++
>  4 files changed, 131 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index cf42e2265d64..1ef3883764f9 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -83,6 +83,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>  	memset(entity, 0, sizeof(struct drm_sched_entity));
>  	INIT_LIST_HEAD(&entity->list);
>  	entity->rq = NULL;
> +	entity->single_sched = NULL;
>  	entity->guilty = guilty;
>  	entity->num_sched_list = num_sched_list;
>  	entity->priority = priority;
> @@ -90,8 +91,18 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>  	RCU_INIT_POINTER(entity->last_scheduled, NULL);
>  	RB_CLEAR_NODE(&entity->rb_tree_node);
>  
> -	if(num_sched_list)
> -		entity->rq = &sched_list[0]->sched_rq[entity->priority];
> +

^ This adds an extra blank line and scripts/checkpatch.pl rejects it.

> +	if (num_sched_list) {
> +		if (sched_list[0]->sched_policy !=
> +		    DRM_SCHED_POLICY_SINGLE_ENTITY) {
> +			entity->rq = &sched_list[0]->sched_rq[entity->priority];
> +		} else if (num_sched_list == 1 && !sched_list[0]->single_entity) {
> +			sched_list[0]->single_entity = entity;
> +			entity->single_sched = sched_list[0];
> +		} else {
> +			return -EINVAL;
> +		}
> +	}
>  
>  	init_completion(&entity->entity_idle);
>  
> @@ -124,7 +135,8 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>  				    struct drm_gpu_scheduler **sched_list,
>  				    unsigned int num_sched_list)
>  {
> -	WARN_ON(!num_sched_list || !sched_list);
> +	WARN_ON(!num_sched_list || !sched_list ||
> +		!!entity->single_sched);
>  
>  	entity->sched_list = sched_list;
>  	entity->num_sched_list = num_sched_list;
> @@ -231,13 +243,15 @@ static void drm_sched_entity_kill(struct drm_sched_entity *entity)
>  {
>  	struct drm_sched_job *job;
>  	struct dma_fence *prev;
> +	bool single_entity = !!entity->single_sched;
>  
> -	if (!entity->rq)
> +	if (!entity->rq && !single_entity)
>  		return;
>  
>  	spin_lock(&entity->rq_lock);
>  	entity->stopped = true;
> -	drm_sched_rq_remove_entity(entity->rq, entity);
> +	if (!single_entity)
> +		drm_sched_rq_remove_entity(entity->rq, entity);
>  	spin_unlock(&entity->rq_lock);
>  
>  	/* Make sure this entity is not used by the scheduler at the moment */
> @@ -259,6 +273,20 @@ static void drm_sched_entity_kill(struct drm_sched_entity *entity)
>  	dma_fence_put(prev);
>  }
>  
> +/**
> + * drm_sched_entity_to_scheduler - Schedule entity to GPU scheduler
> + * @entity: scheduler entity
> + *
> + * Returns GPU scheduler for the entity
> + */
> +struct drm_gpu_scheduler *
> +drm_sched_entity_to_scheduler(struct drm_sched_entity *entity)
> +{
> +	bool single_entity = !!entity->single_sched;
> +
> +	return single_entity ? entity->single_sched : entity->rq->sched;
> +}
> +
>  /**
>   * drm_sched_entity_flush - Flush a context entity
>   *
> @@ -276,11 +304,12 @@ long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout)
>  	struct drm_gpu_scheduler *sched;
>  	struct task_struct *last_user;
>  	long ret = timeout;
> +	bool single_entity = !!entity->single_sched;
>  
> -	if (!entity->rq)
> +	if (!entity->rq && !single_entity)
>  		return 0;
>  
> -	sched = entity->rq->sched;
> +	sched = drm_sched_entity_to_scheduler(entity);
>  	/**
>  	 * The client will not queue more IBs during this fini, consume existing
>  	 * queued IBs or discard them on SIGKILL
> @@ -373,7 +402,7 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
>  		container_of(cb, struct drm_sched_entity, cb);
>  
>  	drm_sched_entity_clear_dep(f, cb);
> -	drm_sched_wakeup_if_can_queue(entity->rq->sched);
> +	drm_sched_wakeup_if_can_queue(drm_sched_entity_to_scheduler(entity));
>  }
>  
>  /**
> @@ -387,6 +416,8 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
>  void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
>  				   enum drm_sched_priority priority)
>  {
> +	WARN_ON(!!entity->single_sched);
> +
>  	spin_lock(&entity->rq_lock);
>  	entity->priority = priority;
>  	spin_unlock(&entity->rq_lock);
> @@ -399,7 +430,7 @@ EXPORT_SYMBOL(drm_sched_entity_set_priority);
>   */
>  static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
>  {
> -	struct drm_gpu_scheduler *sched = entity->rq->sched;
> +	struct drm_gpu_scheduler *sched = drm_sched_entity_to_scheduler(entity);
>  	struct dma_fence *fence = entity->dependency;
>  	struct drm_sched_fence *s_fence;
>  
> @@ -501,7 +532,8 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>  	 * Update the entity's location in the min heap according to
>  	 * the timestamp of the next job, if any.
>  	 */
> -	if (entity->rq->sched->sched_policy == DRM_SCHED_POLICY_FIFO) {
> +	if (drm_sched_entity_to_scheduler(entity)->sched_policy ==
> +	    DRM_SCHED_POLICY_FIFO) {
>  		struct drm_sched_job *next;
>  
>  		next = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
> @@ -524,6 +556,8 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>  	struct drm_gpu_scheduler *sched;
>  	struct drm_sched_rq *rq;
>  
> +	WARN_ON(!!entity->single_sched);
> +
>  	/* single possible engine and already selected */
>  	if (!entity->sched_list)
>  		return;
> @@ -573,12 +607,13 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>  void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>  {
>  	struct drm_sched_entity *entity = sched_job->entity;
> -	bool first, fifo = entity->rq->sched->sched_policy ==
> -		DRM_SCHED_POLICY_FIFO;
> +	bool single_entity = !!entity->single_sched;
> +	bool first;
>  	ktime_t submit_ts;
>  
>  	trace_drm_sched_job(sched_job, entity);
> -	atomic_inc(entity->rq->sched->score);
> +	if (!single_entity)
> +		atomic_inc(entity->rq->sched->score);
>  	WRITE_ONCE(entity->last_user, current->group_leader);
>  
>  	/*
> @@ -591,6 +626,10 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>  
>  	/* first job wakes up scheduler */
>  	if (first) {
> +		struct drm_gpu_scheduler *sched =
> +			drm_sched_entity_to_scheduler(entity);
> +		bool fifo = sched->sched_policy == DRM_SCHED_POLICY_FIFO;
> +
>  		/* Add the entity to the run queue */
>  		spin_lock(&entity->rq_lock);
>  		if (entity->stopped) {
> @@ -600,13 +639,14 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>  			return;
>  		}
>  
> -		drm_sched_rq_add_entity(entity->rq, entity);
> +		if (!single_entity)
> +			drm_sched_rq_add_entity(entity->rq, entity);
>  		spin_unlock(&entity->rq_lock);
>  
>  		if (fifo)
>  			drm_sched_rq_update_fifo(entity, submit_ts);
>  
> -		drm_sched_wakeup_if_can_queue(entity->rq->sched);
> +		drm_sched_wakeup_if_can_queue(sched);
>  	}
>  }
>  EXPORT_SYMBOL(drm_sched_entity_push_job);
> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
> index 06cedfe4b486..f6b926f5e188 100644
> --- a/drivers/gpu/drm/scheduler/sched_fence.c
> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> @@ -225,7 +225,7 @@ void drm_sched_fence_init(struct drm_sched_fence *fence,
>  {
>  	unsigned seq;
>  
> -	fence->sched = entity->rq->sched;
> +	fence->sched = drm_sched_entity_to_scheduler(entity);
>  	seq = atomic_inc_return(&entity->fence_seq);
>  	dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
>  		       &fence->lock, entity->fence_context, seq);
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 150e5330f0fa..7dbb3392124d 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -32,7 +32,8 @@
>   * backend operations to the scheduler like submitting a job to hardware run queue,
>   * returning the dependencies of a job etc.
>   *
> - * The organisation of the scheduler is the following:
> + * For scheduling policies DRM_SCHED_POLICY_RR and DRM_SCHED_POLICY_FIFO, the
> + * scheduler organization is:
>   *
>   * 1. Each hw run queue has one scheduler
>   * 2. Each scheduler has multiple run queues with different priorities
> @@ -43,7 +44,24 @@
>   *
>   * The jobs in a entity are always scheduled in the order that they were pushed.
>   *
> - * Note that once a job was taken from the entities queue and pushed to the
> + * For DRM_SCHED_POLICY_SINGLE_ENTITY, the organization of the scheduler is:
> + *
> + * 1. One to one relationship between scheduler and entity
> + * 2. No priorities implemented per scheduler (single job queue)
> + * 3. No run queues in scheduler rather jobs are directly dequeued from entity
> + * 4. The entity maintains a queue of jobs that will be scheduled to the
> + * hardware
> + *
> + * The jobs in a entity are always scheduled in the order that they were pushed
> + * regardless of scheduling policy. Single-entity scheduling is essentially a
> + * FIFO for jobs.
> + *
> + * A policy of DRM_SCHED_POLICY_RR or DRM_SCHED_POLICY_FIFO is expected to be
> + * used when the kernel-mode driver is scheduling directly to the hardware while
> + * a scheduling policy of DRM_SCHED_POLICY_SINGLE_ENTITY is expected to be used
> + * when there is a firmware scheduler.
> + *
> + * Note that once a job is taken from the entities queue and pushed to the
>   * hardware, i.e. the pending queue, the entity must not be referenced anymore
>   * through the jobs entity pointer.
>   */
> @@ -96,6 +114,8 @@ static inline void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *enti
>  
>  void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts)
>  {
> +	WARN_ON(!!entity->single_sched);
> +
>  	/*
>  	 * Both locks need to be grabbed, one to protect from entity->rq change
>  	 * for entity from within concurrent drm_sched_entity_select_rq and the
> @@ -126,6 +146,8 @@ void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts)
>  static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
>  			      struct drm_sched_rq *rq)
>  {
> +	WARN_ON(sched->sched_policy == DRM_SCHED_POLICY_SINGLE_ENTITY);
> +
>  	spin_lock_init(&rq->lock);
>  	INIT_LIST_HEAD(&rq->entities);
>  	rq->rb_tree_root = RB_ROOT_CACHED;
> @@ -144,6 +166,8 @@ static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
>  void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>  			     struct drm_sched_entity *entity)
>  {
> +	WARN_ON(!!entity->single_sched);
> +
>  	if (!list_empty(&entity->list))
>  		return;
>  
> @@ -166,6 +190,8 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>  void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>  				struct drm_sched_entity *entity)
>  {
> +	WARN_ON(!!entity->single_sched);
> +
>  	if (list_empty(&entity->list))
>  		return;
>  
> @@ -641,7 +667,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
>  		       struct drm_sched_entity *entity,
>  		       void *owner)
>  {
> -	if (!entity->rq)
> +	if (!entity->rq && !entity->single_sched)
>  		return -ENOENT;
>  
>  	job->entity = entity;
> @@ -674,13 +700,16 @@ void drm_sched_job_arm(struct drm_sched_job *job)
>  {
>  	struct drm_gpu_scheduler *sched;
>  	struct drm_sched_entity *entity = job->entity;
> +	bool single_entity = !!entity->single_sched;
>  
>  	BUG_ON(!entity);
> -	drm_sched_entity_select_rq(entity);
> -	sched = entity->rq->sched;
> +	if (!single_entity)
> +		drm_sched_entity_select_rq(entity);
> +	sched = drm_sched_entity_to_scheduler(entity);
>  
>  	job->sched = sched;
> -	job->s_priority = entity->rq - sched->sched_rq;
> +	if (!single_entity)
> +		job->s_priority = entity->rq - sched->sched_rq;
>  	job->id = atomic64_inc_return(&sched->job_id_count);
>  
>  	drm_sched_fence_init(job->s_fence, job->entity);
> @@ -896,6 +925,14 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>  	if (!drm_sched_can_queue(sched))
>  		return NULL;
>  
> +	if (sched->single_entity) {
> +		if (!READ_ONCE(sched->single_entity->stopped) &&
> +		    drm_sched_entity_is_ready(sched->single_entity))
> +			return sched->single_entity;
> +
> +		return NULL;
> +	}
> +
>  	/* Kernel run queue has higher priority than normal run queue*/
>  	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>  		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
> @@ -1092,6 +1129,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>  		return -EINVAL;
>  
>  	sched->ops = ops;
> +	sched->single_entity = NULL;
>  	sched->hw_submission_limit = hw_submission;
>  	sched->name = name;
>  	if (submit_wq) {
> @@ -1111,8 +1149,10 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>  	sched->dev = dev;
>  	sched->sched_policy = sched_policy == DRM_SCHED_POLICY_UNSET ?
>  		drm_sched_policy_default : sched_policy;
> -	for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
> -		drm_sched_rq_init(sched, &sched->sched_rq[i]);
> +	if (sched_policy != DRM_SCHED_POLICY_SINGLE_ENTITY) {
> +		for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
> +			drm_sched_rq_init(sched, &sched->sched_rq[i]);
> +	}
>  
>  	init_waitqueue_head(&sched->job_scheduled);
>  	INIT_LIST_HEAD(&sched->pending_list);
> @@ -1143,19 +1183,25 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
>  
>  	drm_sched_wqueue_stop(sched);
>  
> -	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> -		struct drm_sched_rq *rq = &sched->sched_rq[i];
> +	if (sched->single_entity) {
> +		spin_lock(&sched->single_entity->rq_lock);
> +		sched->single_entity->stopped = true;
> +		spin_unlock(&sched->single_entity->rq_lock);
> +	} else if (sched->sched_policy != DRM_SCHED_POLICY_SINGLE_ENTITY) {
> +		for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> +			struct drm_sched_rq *rq = &sched->sched_rq[i];
>  
> -		spin_lock(&rq->lock);
> -		list_for_each_entry(s_entity, &rq->entities, list)
> -			/*
> -			 * Prevents reinsertion and marks job_queue as idle,
> -			 * it will removed from rq in drm_sched_entity_fini
> -			 * eventually
> -			 */
> -			s_entity->stopped = true;
> -		spin_unlock(&rq->lock);
> +			spin_lock(&rq->lock);
> +			list_for_each_entry(s_entity, &rq->entities, list)
> +				/*
> +				 * Prevents reinsertion and marks job_queue as idle,
> +				 * it will removed from rq in drm_sched_entity_fini
> +				 * eventually
> +				 */
> +				s_entity->stopped = true;
> +			spin_unlock(&rq->lock);
>  
> +		}

^ Blank lines aren't necessary before a closing brace.

I've fixed both of these locally, and would like to try something before R-V-ing this patch.

>  	}
>  
>  	/* Wakeup everyone stuck in drm_sched_entity_flush for this scheduler */
> @@ -1186,6 +1232,8 @@ void drm_sched_increase_karma(struct drm_sched_job *bad)
>  	struct drm_sched_entity *entity;
>  	struct drm_gpu_scheduler *sched = bad->sched;
>  
> +	WARN_ON(sched->sched_policy == DRM_SCHED_POLICY_SINGLE_ENTITY);
> +
>  	/* don't change @bad's karma if it's from KERNEL RQ,
>  	 * because sometimes GPU hang would cause kernel jobs (like VM updating jobs)
>  	 * corrupt but keep in mind that kernel jobs always considered good.
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 320f0a720486..e67b53c3546b 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -79,6 +79,7 @@ enum drm_sched_policy {
>  	DRM_SCHED_POLICY_UNSET,
>  	DRM_SCHED_POLICY_RR,
>  	DRM_SCHED_POLICY_FIFO,
> +	DRM_SCHED_POLICY_SINGLE_ENTITY,
>  	DRM_SCHED_POLICY_COUNT,
>  };
>  
> @@ -112,6 +113,9 @@ struct drm_sched_entity {
>  	 */
>  	struct drm_sched_rq		*rq;
>  
> +	/** @single_sched: Single scheduler */
> +	struct drm_gpu_scheduler	*single_sched;
> +
>  	/**
>  	 * @sched_list:
>  	 *
> @@ -473,6 +477,7 @@ struct drm_sched_backend_ops {
>   * struct drm_gpu_scheduler - scheduler instance-specific data
>   *
>   * @ops: backend operations provided by the driver.
> + * @single_entity: Single entity for the scheduler
>   * @hw_submission_limit: the max size of the hardware queue.
>   * @timeout: the time after which a job is removed from the scheduler.
>   * @name: name of the ring for which this scheduler is being used.
> @@ -504,6 +509,7 @@ struct drm_sched_backend_ops {
>   */
>  struct drm_gpu_scheduler {
>  	const struct drm_sched_backend_ops	*ops;
> +	struct drm_sched_entity		*single_entity;
>  	uint32_t			hw_submission_limit;
>  	long				timeout;
>  	const char			*name;
> @@ -587,6 +593,8 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>  			  struct drm_gpu_scheduler **sched_list,
>  			  unsigned int num_sched_list,
>  			  atomic_t *guilty);
> +struct drm_gpu_scheduler *
> +drm_sched_entity_to_scheduler(struct drm_sched_entity *entity);
>  long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout);
>  void drm_sched_entity_fini(struct drm_sched_entity *entity);
>  void drm_sched_entity_destroy(struct drm_sched_entity *entity);

-- 
Regards,
Luben

