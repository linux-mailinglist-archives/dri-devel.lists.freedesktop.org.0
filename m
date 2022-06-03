Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFF653D26D
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 21:37:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 739811120AD;
	Fri,  3 Jun 2022 19:37:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2048.outbound.protection.outlook.com [40.107.243.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 880321120AF
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jun 2022 19:37:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oZVKopFMDl1ri3NoGDZYTspEXd6BV7aKJG3u7IkT/6ShyCAgiN6mIfbQ8IYH6Xj81HOIhV87VwmR52EDvk6C5iknuMwVhArlzePu2573bBFSqP6YwY3KKU6OI3x9B7QiNlJI5jJrVpRxcGIhUeJvSSqN6jgpTYRVF++OH63zyWvZ901KVPO+T+p5vXswRaBorGGapyuEiPTh6+zJMxO1aKQs4q3A03F06eZVEQsRAGlTHAOsRBgw6XhT/+60N0oWbQ/OhrP8hlUUbW+E1dmCuY6zXbUdVkYlMvNrXVJIag1WKMojnJQ7BdoqKXXDK/PXDyfaifWd014wf82rErL7rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n1MzmhVEwTAWOlhHpW8Njq5O60Ln7UrdkVLf09kAEfU=;
 b=Ss6Rxb4gTwOKsw6/X+fvg+qBuz/Gr0fXp2PUUHb/E/VDdU/86b3t3EJXaZkHgUH9A6fbV8B8kHZ7285WxFYKOXJJG1kZ1Hicy/rE0/4z1YUA5vv5mgdpkzSaa9wX1S/6X4v3vUfRMXgI79iBcod6TlcVC6hqtXhBOy/4GMbMoK7qo9lgn3vGBLvo1T+ZpPkbWU013r/5zNGmK3H9cPZrVKIuqtiDWBd+pL1dFPTtodECRex0zQ4xTmujEObAJN4+7iXo86IXc7s37np+zpnFLDFGfjXsRzEnlxPkZyZPg2Nny07QJXlyagnMqjPxx5B31yK/aED8zgCwubT2XrzPmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n1MzmhVEwTAWOlhHpW8Njq5O60Ln7UrdkVLf09kAEfU=;
 b=3Vrod7QzapW8FskNSuFCEuNk7xWUlEI1aDv7x3QLco7/BBXnRot4Vn0mIxtR2mpJPUM8eDYpxVyhiqUI+Vx7Y9WO4L30u1JbqHnMPCkdPekzc+Z6V9LExPUCKLgo7JgKWSpe59dQB0frek1egZ24HjO0x+3J+FnRcfWWz89DU38=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BY5PR12MB4004.namprd12.prod.outlook.com (2603:10b6:a03:1a8::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.17; Fri, 3 Jun
 2022 19:37:45 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::1cf6:2a9d:41d6:e8c3]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::1cf6:2a9d:41d6:e8c3%4]) with mapi id 15.20.5314.016; Fri, 3 Jun 2022
 19:37:44 +0000
Message-ID: <c9b23cac-6bf0-e8ad-d6b1-f59c1ee1569f@amd.com>
Date: Fri, 3 Jun 2022 15:37:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] drm/ttm: fix missing NULL check in ttm_device_swapout
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 mike@fireburn.co.uk, dri-devel@lists.freedesktop.org
References: <20220603104604.456991-1-christian.koenig@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20220603104604.456991-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR03CA0143.namprd03.prod.outlook.com
 (2603:10b6:208:32e::28) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b66bc5ba-dffa-4f8a-03b4-08da45988820
X-MS-TrafficTypeDiagnostic: BY5PR12MB4004:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB4004F7F4E9E58D34E4DE726292A19@BY5PR12MB4004.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EMvZP1XNVkj+cYKD1cyXyGSo5d29rA2GAJA+Kd7puW5j0ClpS2EKxwh8picVyhaggrjoHlRrJa2nsh1ZkbwhVc8Ll+pqWn4qoiOoWO5CSZS8NaYJY9ZqOpuvc3tJvI9CkP/6zRFlMhvEzm33uV/rrRYyvV0dK5cD7wXFC2Kf3BalRl2xOTWWxRKa5efTpa84zicnLUedBaEzhb1jwptVOCtL7mKABudp00xJ0dyMy0Ph1zr1bPNEuMPDPI6OegRLCaaeoMyID2A6D7rCQnJZdTthWm6SKECPFWbE4YiM+AENmx+F1024yDeoEHLAGTwKOIQexvxxSobBLuORE1O/WroUxFDV4HunGtIfxpf8awXH9nxcZShWLdJRPxeYa8QK8HnbsA5+oEYVS1ZAdKi9hsJM9inaQzhh44Fzq/8DZ+bkJ7+6EAupiQCqr7rY9HZJYKM3+QNpxHxR6MBM31yZYTn2PGXBGCJYDuoW32dJ9wf53d3ePg1+k8KKFjyqWnQb/ILVqqUv0q4RFhM1ajgjqg73GOqx3I+GzwXEK0HH4yMRniN1uxrSbtzIzOoJdDzIWGBw+Q+m4/cBbVMEGFMhSBZ/qnkAEDjRCC39aaLlP5rBW/83e3bVYjaFw7iJSknFoQQfbK7lMr6v8Y97cS0reIpbdp9o7PgZ3/lAkYsrhNeY9yNQ6NG7ryoABppBfH9/jtmniF9m4gm/R2p9RzRggrYamJT4xVzzgRFA5QICkeljZ4D89cyUEmuPvwTE3oru
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(5660300002)(4326008)(66556008)(66946007)(6486002)(66476007)(316002)(86362001)(36756003)(44832011)(8936002)(2906002)(31696002)(38100700002)(186003)(2616005)(66574015)(6506007)(26005)(508600001)(36916002)(6512007)(83380400001)(53546011)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2t1emhXU3FCT3E0c1dlbUtpcFhXMlE0WjFkTzJOSXh0WVJWb0sxOHB5ZXYy?=
 =?utf-8?B?M1ltcVlkeEJuMDZ4WExSOHZRdHBCYzVvVmtRL2dBWTVIK1NQUng0QVRLQkJX?=
 =?utf-8?B?TUpncjVQNE5sdmFOYTBGQnB3V3JiTTVOZ1VPbzNEdGZvRzZiY0FBcFJiVmZI?=
 =?utf-8?B?Z01wd2xDRFVLVUt3UzR6SkNQRFFCNVlBa1kyQ1dhaUNrdXRGM1ozM2FGclJm?=
 =?utf-8?B?WG0zVGtTN2FLeVVxNGhMQ3U2dGxBdElUSFNkU3BqejlVV251dGJpNjY4Smlq?=
 =?utf-8?B?Tk1hZkc4ajZyNzBSZUpaRm5sa0UrN1VyQ1hTVW1HdURkNEtUQ3kvaERqaDBi?=
 =?utf-8?B?YXplamdSakFlOXM3Ky9PQUtMdXJDYjRXQXAyZndzd2xGVGFBOFg4b2RNMVRH?=
 =?utf-8?B?RTlkU3gzN0l4UTRZbmlWQ3Z6aVhCeXdWNGY1aTMvNjhsRWtSc1BISW4zV3Fu?=
 =?utf-8?B?KzhSRStCVWk3b0JPT1BiNFJYcWExazR0ZHdYV2JsRVkvRmNiSC9Qc09OOUVa?=
 =?utf-8?B?YjZ5bDlpQVJWWmdsYzRTV1ZGeStqK3J6TERHSGEvM2JQS1YzSThmT2VvaE11?=
 =?utf-8?B?dlU0VStkN1RROXlUbGhGL2dqb0kwK2E4Z25SUWNycE5TNmZOL3RINXdWZ0lM?=
 =?utf-8?B?Um1QMndRdldTSmVQQXg5S0doQncrSTgyR2NKeGk0ekZLWGZiY0xsMGNNZUxv?=
 =?utf-8?B?ZW9HUkNZRW5Eamw4TkI4L3JHZzB4aGZ2VHZMZ1h5M0hjRm00NE4vS2E5LzRr?=
 =?utf-8?B?amVFQzFNOHV2RkF0b04zNHFzSWw4SVpIcGYwQWhoRmJRNHJ5aEFKMzJYTVNx?=
 =?utf-8?B?RUNEVk9KRUY4S2dFMFRRSG56aTZnNGU0ZU40LzRvU2IwWEd4dWYvbCt3eXNF?=
 =?utf-8?B?VmFvUE5RdEozVDNpQjFCTTJPMHRXT2NCKytOQ3JQL2hjMDc3Q0xUYVRYN3pL?=
 =?utf-8?B?QlVodTl1V25rc1hXdGlhZFp3OEwySjBqUDhmbDJ3UTJlTVpnclJJa09mY05J?=
 =?utf-8?B?ZWlZR2pqdDlxY2toTzladWJaTFFZaUlmSmZ4YkgyblozTExJYVEyeFBMV2lL?=
 =?utf-8?B?ZHJPWmgzVVpaTWd5c1B4ZlV3SkFoUndSbTBTWWhIaVV4WkEwRTVPV0YyY2U2?=
 =?utf-8?B?OXo3OTdQL0lZT1g2WUtIaHdSVjFqN21jS3VTTmM1ZU1aNElXZzNubGs0V1BI?=
 =?utf-8?B?Qm40QzdqY0JnUk5MZDk0SFB0NXpoTFhXMVBhdUxHZTRQK0syYkdjQTYxaWJW?=
 =?utf-8?B?SjhobDhOVFdYWVBHUnRCY1ljdDY5cldSTVhZZmduQVNxcmhXbDdpNU1qcW9C?=
 =?utf-8?B?ejk2Rklod0xrcW8rQi9LVkwxRlhPU3VEVHFqa3FjS0M2RVBWZS9tb0c1V2VZ?=
 =?utf-8?B?MmVzQmNNZ2ZwN2FncmdVZnd1eW4xRTcvQkZXb1dPeFUzTk5VbHRnSFF2M1Ja?=
 =?utf-8?B?aWxSa0VHNXZSTkd4SW5HZ3BQTjQ2cE9pR2VLZUFsWVNNenkwZ2NkY0lHdWxi?=
 =?utf-8?B?WU9RcHJEbFpSUlhSTUJGV2dxTTZHend6REJYM2ppbDdtdnFtSHhqZVVVUExD?=
 =?utf-8?B?YzJwK040bzFXdkprNU8vMzl1RzcvTWNmbENSOTZWVlBDSTNSbHhocTVaL25l?=
 =?utf-8?B?WWVibmNEbStQaE93NldWdFdxUy82TVp5YXdHNmZyekhZRkU1UmFrakI3eGJy?=
 =?utf-8?B?ODhlZjRZT00xczM5S1JNQm5HTmRRVEFMbGhPc0N4QVRYY0hrcnN1d0piZ3lC?=
 =?utf-8?B?Yy9KaHZKTUlGK0hlWFk2SkdyU3NiQVFLN3F6TmxMTTZzaXJXV3hTL3ZEZ2tu?=
 =?utf-8?B?a3VyczVxV0FmeDZRM0xmS1FKcW5xQUwyNGV0bzdtUGRqK3gzQk1SdTlnaGtV?=
 =?utf-8?B?aHZDYm05MThHTXJoT1BiYm5VTTdoNUlDdnl0M2Zkajd5ajR6VGtVTHlrVGlu?=
 =?utf-8?B?VGl5cVNpY1lJckhpNUpnZGc5czNudWZOb0diUVBuM25pblpRMU5sSVJCbThM?=
 =?utf-8?B?ZlI3K0xlSjhmSnFXeWVMb3B5VXczZzhudzNpQ3EyOXBqZFdsOS9BdHpEM1lH?=
 =?utf-8?B?MkxQbEhXeVRiL1RDK01Td0FubUlkOGZRQy9jdnZkbm9MMy9VajBSdEtsTzlU?=
 =?utf-8?B?N1c4czVYUm1MTTZaSnhEMGFYdTYzQ3FDT2t0YjhhWGdYczVtbG03dlluU0RQ?=
 =?utf-8?B?UEQyMk5ZWTkzWVVJa0QrY2FhbjQ1YllTNE1WWXdkYkVMbTJQV1BFUnlzQVE0?=
 =?utf-8?B?M0VSV2VTOWZ6cThvelQ3cFAxNk8zVkVxR2hJMENQOC9KZUI4MFhialg0SEFT?=
 =?utf-8?B?cXc4NzB6TGtadUw5RnBibEdmTlZPOXdnUzlRTFlPbStRZ2pzYkwvZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b66bc5ba-dffa-4f8a-03b4-08da45988820
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2022 19:37:44.9053 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rfifg1MzVb/oSo3A42ILrZhYgFB4jbS8Z6ckypA/zlF3eIlTRHNaKuSQqC7/hld+LXDP0LOAbcpybCKPKY14KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4004
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022-06-03 06:46, Christian König wrote:
> Resources about to be destructed are not tied to BOs any more.
I've been seeing a backtrace in that area with a patch series I'm 
working on, but didn't have enough time to track it down yet. I'll try 
if this patch fixes it.

Regards,
   Felix


>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_device.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index a0562ab386f5..e7147e304637 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -156,8 +156,12 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
>   
>   		ttm_resource_manager_for_each_res(man, &cursor, res) {
>   			struct ttm_buffer_object *bo = res->bo;
> -			uint32_t num_pages = PFN_UP(bo->base.size);
> +			uint32_t num_pages;
>   
> +			if (!bo)
> +				continue;
> +
> +			num_pages = PFN_UP(bo->base.size);
>   			ret = ttm_bo_swapout(bo, ctx, gfp_flags);
>   			/* ttm_bo_swapout has dropped the lru_lock */
>   			if (!ret)
