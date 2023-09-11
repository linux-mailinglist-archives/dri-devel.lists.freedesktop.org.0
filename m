Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB9679A69E
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 11:16:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AE5C10E07C;
	Mon, 11 Sep 2023 09:16:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2084.outbound.protection.outlook.com [40.107.243.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EA3A10E1A0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 09:16:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ByIbkrMveQYLZmHQ1Ropih1K6i3sjI5KnZ/OBvTgIBuovXEYg24NBGfYFHmW6lZEU1fmIuMzqn4zsBhTdnfwPvCKoUuiiHJk1+TzrysCn13kW/TEQqgIxBEunxvnNVx5y1XHzasS8NsJ2HmcWQd2rY4a+rpyYf9KmM/vg1xOTs/nwqD0eQxq+ORP5oF2tPgLPYYo/2GDXGcKRjJq6F9/M9XbHunWwOwY9/4h5GSgeCGi3DDXxCaguCMBwJDbWx7+pmy+HU2s43V5Rb04pZeicLEMhaFORrodD+ljPwfXcLf8ejisFyJzsTIeasjONAyxTjo+EKLsAlK1fknNJx4W2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uvKMjeF4x4Ki56sNBfJuYnzTqhoMEuo+TePjfMlXOwU=;
 b=kY1krtwJmsUiQfSQ+lWZcEG9H9gFBLSDK2XYvzfCK8R5BaRLFqtnuAS8WWg+wrPUM0ldRc2+p2eEjDgJWNqmJLQYnYNiOfG+ndodtjQAOcy6wbsRseP8jJENkS5QFe+Z05hvl31plRMDh1V+fHrYvwD2P5oP6WxhnPHAJ/dx0HXHzbWe1S88jcH427Ey92wd/fH9nQ+qv569tP63ek2vZ3t/ZirMP/sFL5sHua6OVGlj2nikyb6qzkN1SaXf3U9t6mmqNRTJXIys1zI3y1AurnSVxC/Bw7OTh8C1mlPfTWWwNeQocIawCa3wlP5EXhu7l8GcAGFlx9tlEVlcYQG5sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uvKMjeF4x4Ki56sNBfJuYnzTqhoMEuo+TePjfMlXOwU=;
 b=zDV09KNvdy2Yy7HrxJ1C2L8SIEnoL4pAng5xZtdWWA2J1yVYxfNNR91KOkivlcXQhZ6xiESXl1+0XYlRUlgqexs2C1btjuWUHpED1Zc6LWKghzNwr7s2Q80qua0k00BAjUU/RBcLh4Yg7uR/XG/U6xozMktjrEa9s3iuOEXnyRc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS7PR12MB5861.namprd12.prod.outlook.com (2603:10b6:8:78::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Mon, 11 Sep
 2023 09:16:23 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced%5]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 09:16:22 +0000
Message-ID: <d281b69f-64b0-2d50-91c2-1b259491a9f1@amd.com>
Date: Mon, 11 Sep 2023 11:16:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] drm/sched: test before reading fence timestamp
Content-Language: en-US
To: Yunxiang Li <Yunxiang.Li@amd.com>, dri-devel@lists.freedesktop.org,
 Alexander.Deucher@amd.com
References: <20230908182431.12634-1-Yunxiang.Li@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230908182431.12634-1-Yunxiang.Li@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0004.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::14)
 To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DS7PR12MB5861:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bbaf16c-dbcc-4178-5266-08dbb2a7c45b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pJK+TykIEWczAAGHniQOA3CSZPIh5tIUtgZ58Tzz0g50p1a2jpaq1/mzxthka17IEIEn8El0vHkW0S8FemeLM03S268JAh2zz+OCuw+M3ku7RO0MserCwkz9Hy3YZtj80hLn5JZMdk36AprqUf8oCXEzaZbrr+FZCpuxwmeo3tdIwCczaG7rS9SWxpxoP5SpfXkCYn6cnBW+E1u0Q7vLJEJfTkiUda8DC1AQLW5IK0zEWkyPoeZEDYVUr6sNkX6275QsF8b8Qpahw6DOHj3B/JWu+M68/NmnWQW9rZDXuwQ7oHafgQ0jfvaMFMk2mDOn4Tm2fcpb2AekVYIKzPwgNRhNEuDF3jynPPRi59v6RzlKFVsOaCIssaSr61E06iTCFcL3Xu2e7TUp18W2LMyxD1im1vOuzGvitBvuZZfpeM2TzL3/27vgslt1lnfdElruetQVCtSC5HfcIUxLl/wPV9Y50o6miJiN3lCsB/qW0TA84SskDupnejLu+lronjXPYFiOqdG/GtGem67IYbQeh0jcdf0WIuEULSfcSmubT3ozzAgsuV0HisQhmtr+kyG1uOLgnBy/AARA74OpspNWKPbsrVkMOc7bzfof2vFq5pscCiWpzPc33Qjc1auIrKpch7klRLymkXOOlZb4UF9zeA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(136003)(39860400002)(366004)(376002)(1800799009)(451199024)(186009)(38100700002)(86362001)(36756003)(31696002)(31686004)(6486002)(2906002)(6666004)(478600001)(6506007)(66946007)(8676002)(316002)(5660300002)(6636002)(8936002)(66556008)(6512007)(41300700001)(66476007)(26005)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUlYVS93UTVTQmdHNnBTVUVMa1pVUXVwcy9oREYrMHRZNGxnSTVpZldOL2dG?=
 =?utf-8?B?WU5ZdURBMkFpckN6OVUwVzN2aTkyQXVSNDRCZDNzcUoxRTVkWE4zYnhGRXJ5?=
 =?utf-8?B?NGFDbG1qZ1VYWUljdVRJOEpzNFBIOGowQW51Ujd2bUVPL25KeEJSZzZPSFE3?=
 =?utf-8?B?aTliOG9wR0lLTXY4MmRUR0dvd2NiS0pITWtTNUFWYmRrUlpwRmtLRHFPeDB4?=
 =?utf-8?B?K2RYTGIyKzJrM2NhZDIyaFhwSFdUeDdOY1ZHMEtBRlhOL0FvdnltamtCWjMv?=
 =?utf-8?B?MjFMTnVHRnFHOWs2LzZ4QU9BRnpFRkdFcWNIdGVRbTl4SE5CZm1aUDBRaG1v?=
 =?utf-8?B?OU5LVHNFUWc2c1d4UTdnRVlhSVBCV1NmRkRBYUdOc3JFVmZSaCtZUkEvcW5a?=
 =?utf-8?B?dWtEaEVkNjhrV0JrdmVqNXNaK2J6WlZULzZmVFZzby95bHNkbTRocEpUWFBj?=
 =?utf-8?B?Wm9qdXFrY0RmNEU5Y3lpTEZSc2htQ05abHpnY3Zsbmk2R282UEZZd3VOR09p?=
 =?utf-8?B?ME01UTZMZ2RsSXJ6VGpnM1hrSUhZNU1WdFUrUFF1Qm1JYVVFSEhTNWdWNm5E?=
 =?utf-8?B?RHQySS9UL05vN3RvZ1FwT2UreDkzaldQZ001N0tzcFJqSmoxZlFxZUNHTUkw?=
 =?utf-8?B?MVlMNUt4eUFXek1lYmwwOEVCY1Z2cGY4ZjZXZWczbmFuM1NlNC9YOWp3S3Qw?=
 =?utf-8?B?YkxKU3lhL2piSFJBeEN1NjlIQ0dNaWJNakxpbEZwSDQ5aThDbFFTNmhiRzdO?=
 =?utf-8?B?ODU0RUdXUllQa2dWVzlhaERvMFhyQnBibU5MRytwSXlpVmw5eGhFL0NiYlJZ?=
 =?utf-8?B?RERHQ2N5MUtoTEZnY3drRzVnVTBrN05MbGE1UXNyM3dnMkZtalZHVi9QSUk0?=
 =?utf-8?B?M3I0YlFBdHdSeXgxYnA4L1hhQzRWSG56MzFCWDdxblF5V0dBNTdDT3dNZUZH?=
 =?utf-8?B?aTRJUUx2eklSdXlwMFpzejNJRWVYNWNRVE5WYnpNZHBGWkRRZ2JYb0dzeUJO?=
 =?utf-8?B?YjN5U1doRHNyT1RBenZETU9BMDlEWk53WmFqZmlETWRRNU5CcVBLelFmVWU3?=
 =?utf-8?B?NUtsOWVZYys2SjdnTlhIeGIvYXp6dGRHRFBiUFFTeG85VXArTXV1Q09KcWJK?=
 =?utf-8?B?emUxdGlQTWdmV3VkdGFHY3NSaENRN1ZiVlkvUXZMYjJaMVBwTW9Xc2pPelhj?=
 =?utf-8?B?Q2NzMjhlaFh3Z1JRZXRZcW9rRUhtd290ZWZqUVZDK2Zha2doT29IYVNJUXBi?=
 =?utf-8?B?cjVQZU83WHgvVGxmVE5GTFFhV3E1Y2FVNDJZNnJWRzBiWTNuSlBQZzJiL0J4?=
 =?utf-8?B?dG1OYVhGNUFYQ1E4ZUFTSFo5WlJoUm4wUy9TS0t5QmRoZ1pZSTJ5UGtCREww?=
 =?utf-8?B?QVRFcU5GVnY3aGRPK216VDVEYTlaN3c4VWF2S09Yb2tqS3ZzQkI2NXl1b1Jm?=
 =?utf-8?B?SVVhcWovaTlaSHVhVTdhMXpHTDVkanVqdEs3UjRMY2J0Mlk2SW55RjBGWitI?=
 =?utf-8?B?cG9WWTFnUWhDMWwycHdSYmU3OHNGOU1tc2NDeDJpRGR2OThsVi9Ic0lSSVRq?=
 =?utf-8?B?TzNMaG5JTHBrNjlkL1ViQytYbEhidXdzWi9tb0FMUExlVGlHTGNFVTIyd3Y1?=
 =?utf-8?B?amVNQTRZek1zVk9FckFMcnd1Q3NoQURvcExCMkZBdHJlUG40MTRGSk5YbnRV?=
 =?utf-8?B?cUdtZlA4dkZFeGoyaS84aVFOQnV6eE82eS9ORUlYVU5GT2h6NHdmZ3ZaODF2?=
 =?utf-8?B?ejFsenh6eUNvdjEySU8raEdoemJIMytmRVZ6Ry9WNlNZb0M4eXBza1l5RllF?=
 =?utf-8?B?dm84YUkyQUtjejBkZ296QitwdGQwdTBOb3VtRmdXTkUvdHUvUnFiYVpPMEM1?=
 =?utf-8?B?NEc5TWswZG44Sk81dE14NkJUMURHYVNzdnN1Nlhqd251OTFXejhOQndNRklC?=
 =?utf-8?B?ZDV2MVBBTDNVcURtK3kxN1NXeWIvR3Rqd1hJdmJGY3lFL2tlL3Z3R0xEMkRI?=
 =?utf-8?B?eHBIR2dZK2lGZHNlNzZ3Q2xNSTJOSjE5bDNmdkdaZHNFNlVnSGwraVZhUkt3?=
 =?utf-8?B?Snc4NFBaZTlGbjZ2ZnJCRUkwYldWZDMxcWQ1L0ozYVE3LzNvNEdlai8xZzZw?=
 =?utf-8?Q?EREaA9QPiVvJPMKQqwPbawAVp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bbaf16c-dbcc-4178-5266-08dbb2a7c45b
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 09:16:22.8615 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JOj2dxKEz4jHJW/1xPQLARyJp5Qa5hyU3+wML2lzT6N0X9oNTno7Vjhe0ZY3vOQ7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5861
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

Am 08.09.23 um 20:24 schrieb Yunxiang Li:
> Reading fence timestamp always need to check the corresponding flag bit
> before to make sure the write is actually visible, otherwise we can read
> garbage here.

Yeah, Teddy already stumbled over that problem as well I think.

We are currently testing a more wider fix for this.

Regards,
Christian.

>
> Fixes: 1774baa64f93 ("drm/scheduler: Change scheduled fence track v2")
> Signed-off-by: Yunxiang Li <Yunxiang.Li@amd.com>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 506371c42745..8ed00f54c59d 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -928,6 +928,9 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
>   						typeof(*next), list);
>   
>   		if (next) {
> +			while (!test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT,
> +					 &job->s_fence->finished.flags))
> +				cpu_relax();
>   			next->s_fence->scheduled.timestamp =
>   				job->s_fence->finished.timestamp;
>   			/* start TO timer for next job */

