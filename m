Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17125429E51
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 09:10:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6955C6E5CC;
	Tue, 12 Oct 2021 07:10:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2072.outbound.protection.outlook.com [40.107.237.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 619F36E5CC;
 Tue, 12 Oct 2021 07:10:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n8UDSL/BRKYX8JNywuyCy8E7VPe29A2wcfqo8A26nrXHZc2YSYcY87WaIjUU1ocHbpKQ0iNUUWpAIORvFb+L6Jd8rZYJjASofwD3vSJ9KrJL89ff65btLX+45529RIG8VKLO9i1cSSaNDtAdlvkqfpzuU5ozc6uSwh/3ZsnXbct5vHixGPF+JRx0ysmC46G4yIZy9G7faxG+A+Y3U5oMb0Vf5VfaQiC7XYDB2SXd8Mb5Pfjx5ZeqtFraOTUEeXX3Wl9nYAP2HV8gPcv5vNk27AI6F8LribwnqQoa3jGqVgjt5nouPa+wIj7hTCV1LlM+WnzxoGpb8e9rCwW7HnyrDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5C+mK4uTWuFfDRnYFMj+0Wv4pH64XxZilxHukSAueLo=;
 b=nN8pAnmICEORBZqGv5e2RMB5+oJLsZisNwkPuRvzpqjTI7274n/WFtynPGvuM1ce8BiQdB97fADIcoEZbj4SwD8+P6oYj2yGZ4VvNy5vMO2yllXuT9V1d8RaHh176n6KOMNV/GdAK42UA4bxAgT1baxvpO2SBVtcU2YWt1A6k6Uy7VYs9ql4M1qMa9joKsbwJq1Ry2rZ6ArdaN6n/4xyBrVn9BL+f1Rp4Oiecr7Tz7/VGaPtm8mTS8zgteophgKI6qgxetZhZNnaVhiRFL32vpC+3fVKC7zYSgYEtG6Wb3mTlwrX1UJDQ7xuT/hNq8IyswEfDiJA3dV44nKYkja6Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5C+mK4uTWuFfDRnYFMj+0Wv4pH64XxZilxHukSAueLo=;
 b=cvTes5OwHszXHLs956FsGhYMfdzLhSpJpwP0Q4CLYZO2mdugFT9D9Rx4WM0bFQvOEJpkB8WBNTXbk/A5WYcKnreVePekuuApTz6cAjweAq+nFzmJlfGrB0RGyhpqTx788PUheM76LIWq1KHQRCCMtoo1pe4gTZ+XZOXoCTYbIU8=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1216.namprd12.prod.outlook.com
 (2603:10b6:300:10::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Tue, 12 Oct
 2021 07:10:08 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a%10]) with mapi id 15.20.4587.026; Tue, 12 Oct
 2021 07:10:08 +0000
Subject: Re: [PATCH 2/4] drm/ttm: do not set NULL to debugfs dentry
To: Nirmoy Das <nirmoy.das@amd.com>, dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20211011190607.104618-1-nirmoy.das@amd.com>
 <20211011190607.104618-2-nirmoy.das@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <f98a7c4d-0d2c-4ae2-fbc2-e3085dfb3e8c@amd.com>
Date: Tue, 12 Oct 2021 09:09:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20211011190607.104618-2-nirmoy.das@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AM6PR04CA0003.eurprd04.prod.outlook.com
 (2603:10a6:20b:92::16) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:87c8:f860:ca5d:9823]
 (2a02:908:1252:fb60:87c8:f860:ca5d:9823) by
 AM6PR04CA0003.eurprd04.prod.outlook.com (2603:10a6:20b:92::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.25 via Frontend Transport; Tue, 12 Oct 2021 07:10:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a294cd8-e7af-4f4e-2748-08d98d4f52b4
X-MS-TrafficTypeDiagnostic: MWHPR12MB1216:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR12MB1216FA24CE04808D27E245C583B69@MWHPR12MB1216.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jzj0D6VJMvv+mB/SX3pXTi2nmzlOUlu4heyN3WlIuZPacFVIEBtvAr9M20TMreF1dvuyByswuiPjTx+E66Vls3heOSF9FrCvd+hZBVm/UVk9IgO8S7fBxtOm5TTJ9Ehi0nNhq8FioIoIhu0kyT//I2I6Try6Va/zbULmec7UDhdes9OfZc9hC2hWAaXYsdXRir8h13/RJ0SPtV01ZjZ0QA3L9DvkQjoAHM+cibvvXBSECuFyY1yNUtFjUKwzJh//NCTE81tjSi6SCaBTiePrX0trKZmz/jc5RK1HMSUBppVsriLMN+m7BvzxLN7uKDawXcN+XL2ci1c+owSpEQuTUWSZsbBUOEAOssSeK0o9iTL9iRpQ/4VfNjr4SgThb8o7RT7BEYT2KokDFwiF7pz1WFvF+LLugJUbormPEZFeA8h0s0Sy398K8xycDzD838AuTvgcHxuKmZoKZqI88HqBp7vDKChubXVGFU60TgeWkI0F9CQP0OxJ2h4pl8ROLy3hIUFBtbgMcPogvv4h8mo1RQ06/gq5DD0q7BDaYyDXEqytm6oOz786eQsc6UlVW8+laBA0YZKML3V+NPKk7OtqQbEZKO00Y7YaJ/jhlTXvfkRiSuYw93nDnO8erTIlhuKat4Fjra2xXd6BB7QEBaO/KK13L5m1yWHEfzweAQi+YgG2XFnaBoUKiBw+OLL6v+NzQy/SGjJxwduJafLTCBB9aWzHcfu15nn2PWXBTK/tRW7pxpqjXQQXw3LHmuBeSxjn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(83380400001)(186003)(66556008)(38100700002)(54906003)(31686004)(8936002)(66476007)(316002)(36756003)(8676002)(6486002)(86362001)(6666004)(31696002)(5660300002)(4326008)(2616005)(508600001)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlhqcVJOd3crdWYvMkVBUEcrdURzMFJyaDBBanNtdkhDZ0dLdHpYMTc5UklQ?=
 =?utf-8?B?UTlzdjZURVEzUGRIclE1eTRDa1ZvNE9rQWg5VUVGWlc4ZkxlQ0lwR1dMT1o1?=
 =?utf-8?B?L29wMDFvRFRqb0hrUXVkNndRVXJzb3VDTFBNekZZWkxXQ0RLc284RjlmZU1Q?=
 =?utf-8?B?T2toVGZJa1FSWUgzYlBueGxMTjJyYlJOeTBjWkxsRnZtNUw1WXAwNERTamhw?=
 =?utf-8?B?bUp4T2oyOWRtZXVKV0Y0c3dwQytzdko1ZDJ0WDJSajFpWG5uVTRCVmV4SnNY?=
 =?utf-8?B?R0VtNnc5a21tUC82UUJEbUNWZ0hxVUlJUXcwYldWRiswL0VmL1VSSitwUlhE?=
 =?utf-8?B?YnBOM2VzRWpEY2RUdk1kL2U3TG1qeHg3bFNzSHRuWFM0RmJONldmWGxtMVpT?=
 =?utf-8?B?SDZsRkwzWHZmOEM1VHY0OThlQWlqU3drSlp6R1NsbEJSODhHKzRiQ01EOGNo?=
 =?utf-8?B?VStaYmN3a0E2MVR1SkJoK3hnMTZ5dFdtdHNqUklpaGI4ckQ3QmdwUG1XU2s5?=
 =?utf-8?B?bnFHaUpkdzhkWHY3ZmxydlZ1YWI1VG1tUVVjUyt0Mmc5dGE0aWZGSmw5VzFP?=
 =?utf-8?B?dnZLZVFic2tGNzBjdHlFVXJiZi9DWGtkTzNtZ0MxeEFoaSttbjVsRVl6MGVJ?=
 =?utf-8?B?NnRMc0lLeG9YblNyZC9HdzNWMlZyaTFRR2JVRDNnUVlWdHVtV3dtM1ArNUdp?=
 =?utf-8?B?WUxKdWxQdnEzUXZNbzRpVFFnVXE1K3JudjlmN255WlI4T2Z0YmttOUtKNTFi?=
 =?utf-8?B?SlEwd2JVdHl0bnFSZVJRQWdtQzNYN1p2WkZ4dzdQWEg2SWVtdHYwc3FVWUNu?=
 =?utf-8?B?YU1UOC9hekl0QkpBTnR3djFvR0ZicVlJeVNxUHhNdEVvMkw3MW5ZZXlFRGdz?=
 =?utf-8?B?WUhsTytrR0hFN3ZtVmZVbzZKcGFmeUhmL2hrOVVKMkZHd3U2bnhZU2VzRVZZ?=
 =?utf-8?B?azhoUFNhSnMyNkptMGMvMk5VSHc0MU1tSCtxMjFpZGV5alNEdnNiRFpZZmFr?=
 =?utf-8?B?Y0RMQWlCTnFKK3U1bzN6djJtWHRsZW8vR3NGYzNpVitHeGNGa2NucURHbU5L?=
 =?utf-8?B?aW8yTXRhSjhWb0ZQNHdOWlBkZ2xyNmVEVURrbGpIQXJSdkYxcDRKclZsS3dh?=
 =?utf-8?B?aEI4T3ZKYkdZZ3AyYml6czcyWlk2cFoySG1SYUx2RVRzczhCSFVNZ2JBbFhG?=
 =?utf-8?B?ZFFlSnBVTHlRbk1LQXpFTUFKYjhqVHllLzZlRk5kRFYzbnBBa3ZJWGl4R2Yv?=
 =?utf-8?B?RDJUM0ZqdUlGNy9EQktzVE1CVURDMHgxSW1BYkVST2FUSkpXVktLS2tJS0FK?=
 =?utf-8?B?aEp0eEx4WFRlcHAzMjcxTFdySGxUM210VW9IVGpYQnM3YjJ5ZXVIM3lMRWh6?=
 =?utf-8?B?QVE2d3BSMEVpakV4QjZUYkhiM21EdHRzSjJHSEEraUp1cVp6NHZoZHNWeFBk?=
 =?utf-8?B?OEVZVkMvZE5jUkhoY1k4b1pzQ2NHbmNUcWdBZkw2RkVvRUpnTHFzaGRNd0NB?=
 =?utf-8?B?T3l0UktZT1JJNEZxQjJFbU1lL1JpdHZRcjZKVnBoQVhYbDg0SGFtRDRWdmNi?=
 =?utf-8?B?M2RxTGZWaUZWMjFranpRNE9QaytxSWEzV0lUL2Y4bUVUMUIrUC9PU2ExM2JS?=
 =?utf-8?B?bFZpWFIxdktVNStXYTFWalFRd25jcXlLZzdvWDJUeW85UGx4RGJvKzhmNmgx?=
 =?utf-8?B?OHdjdmxDT0xNMVYrTndSRUFNYW55SlpEOGhHU3pPcWJjQjI5ZmlzYUV6M3J2?=
 =?utf-8?B?WUJFb2Z4alhSZmpaSjhLNzFyTjZDd3g2MzE0UGc5NTFseEdyNktQYlU3Uzc4?=
 =?utf-8?B?VUIwL1ZVcVZQV2U3T0FMeW55YjBSUzN3Rm5Selg4L2JBNWVMa2dkNEJUMW4z?=
 =?utf-8?Q?uU+29Cy6vK1JE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a294cd8-e7af-4f4e-2748-08d98d4f52b4
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 07:10:08.2235 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EORnYrolLVoow3VEAXdOt4sdTju5Md46U58l7ytrpZGnG5OuNInyYP09UoXXnPVb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1216
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

Am 11.10.21 um 21:06 schrieb Nirmoy Das:
> For debugfs directory, it is recommended to save the result
> and pass over to next debugfs API for creating debugfs
> files/directories. Error conditions are handled by debugfs APIs.
>
> CC: Christian Koenig <christian.koenig@amd.com>
> CC: Huang Rui <ray.huang@amd.com>
> CC: David Airlie <airlied@linux.ie>
> CC: Daniel Vetter <daniel@ffwll.ch>
>
> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>

Please also add a comment to ttm_debugfs_root that this can also be an 
ERR_PTR and should not be dereferenced.

Apart from that looks good to me.

Christian.

> ---
>   drivers/gpu/drm/ttm/ttm_device.c | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index be24bb6cefd0..225ae6b0b4c2 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -77,9 +77,6 @@ static int ttm_global_init(void)
>   	si_meminfo(&si);
>
>   	ttm_debugfs_root = debugfs_create_dir("ttm", NULL);
> -	if (IS_ERR(ttm_debugfs_root)) {
> -		ttm_debugfs_root = NULL;
> -	}
>
>   	/* Limit the number of pages in the pool to about 50% of the total
>   	 * system memory.
> @@ -108,8 +105,7 @@ static int ttm_global_init(void)
>   	debugfs_create_atomic_t("buffer_objects", 0444, ttm_debugfs_root,
>   				&glob->bo_count);
>   out:
> -	if (ret && ttm_debugfs_root)
> -		debugfs_remove(ttm_debugfs_root);
> +	debugfs_remove(ttm_debugfs_root);
>   	if (ret)
>   		--ttm_glob_use_count;
>   	mutex_unlock(&ttm_global_mutex);
> --
> 2.32.0
>

