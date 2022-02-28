Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C82274C7BCB
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 22:21:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C02E10E8F4;
	Mon, 28 Feb 2022 21:21:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2040.outbound.protection.outlook.com [40.107.93.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8403410E8F4
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 21:21:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nGq+JzaHa/DAe+rITAHuFEhhYtgMYeQRuRmBMvfyUE3IxUGltKhYPpWXGPID6taPtg3nNz0CPaMvZYJmhQrbldB1pJVf+7iKxNwIjt5KSwB3qJ2kVDuX1/DnV8tXG1B+PPfBaHB0LA+oQn9GhpdTl44gRMkUJYWfkfsOmxLUhrlAO2t1ozLEiYbMHQHN4Wbc1Z1Il4wYHNxh28tyBoqCEVroAAcl95UdsFQKoqtyQDqP6KuHUrK8T6ys7dHDX8hllxauZGmuv4eDyVlz2xiQ2sKVY4QIAogGf5NkfivltJyMLe7ZWAGUErik7j1YHgJKXDLgFBp2pM7LKe3Jukih0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zh3qTpgYBUHDTThTeO77/9+ykepZ9n/GPsnTiXI9ACk=;
 b=R2o9LW9lGyGz2oS2YEoD+/zn4PshnkIeEy0qNuwUMXlMip1xIqrF+uahH49MvthFQl5udUk/tv+W8ui/Yf8JPBqVT64WfEgzCgmboMgcqdVXDqW2hT7Ih20EBFUAc1VIoBqgARGiqkCjjkNn/lY2+Urmno9wwJUcwyYSl9Dbmuhks/w0Bo/H+P3hNz4/aRH5ZS3gHE7QCFqIHvgg1ShsB2+J7ppc9TGrgHVxbD9PhveatyAoXCOy/OHymLF1VIfwoSWPMgXy9gkPljwgBh4ZSXHiVGkaDVT9xJ3ZDP4vz1Xb8z5Lo/uDrrp5XtN/92EwfdK3/FEXWala5t1uVAsdHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zh3qTpgYBUHDTThTeO77/9+ykepZ9n/GPsnTiXI9ACk=;
 b=KFys8x4AgswQ3fUrc2iTbKXTEvHr1VTvPNBxDPIAA4QQarlJpIUztfWbO/jQ3+ToU/ppFpDQ/ffyCRONQro36yVHnQtR+3m93JCTmu1cI9oFQQjcmqqAQMMiTOd2fs6cGdtMUiSSYTlSU1U+wSoWgneyd73i3iD4XcHhdcGrH60=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by BYAPR12MB3238.namprd12.prod.outlook.com (2603:10b6:a03:13b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Mon, 28 Feb
 2022 21:21:47 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::a105:faab:243:1dd3]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::a105:faab:243:1dd3%11]) with mapi id 15.20.5017.026; Mon, 28 Feb 2022
 21:21:47 +0000
Message-ID: <9e288f3c-3251-f017-3541-d01ae6afe499@amd.com>
Date: Mon, 28 Feb 2022 16:21:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/v3d: centralize error handling when init scheduler
 fails
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, emma@anholt.net, airlied@linux.ie,
 daniel@ffwll.ch
References: <20220228181647.3794298-1-mwen@igalia.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <20220228181647.3794298-1-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0040.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::26) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ef18464-ac82-451c-e01e-08d9fb0053d0
X-MS-TrafficTypeDiagnostic: BYAPR12MB3238:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB323878EE9D9202FE7AAA93B2EA019@BYAPR12MB3238.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h9tatDuRu133yu+8dlF8s1Uz6V9PZewjSbmBxnc9JGNp09DZJoECtS5lRktpDzYn0Kt/cQbm3AH0QmDLvEXCKtxjwPKqjB9BQXcZndS/ATEm1TXDRyUQxxEbRaJdA0CON2aR45HFB8i1jyL///fz3ZIXrMUtXzxYAaTzVHSVG9RtzIb9m4qgTOqBs9My8gA07p1l3aczh8AHH6B53PfrlPVJTWWvVpcWxHuxUWQQZ9Z/TN/ugLJSDgOxkqeXxw9KB4d7vfIssTA6/0znRBwPz/caeRQlo1qBVeq3nid9FuJO0xydGfoAG0R6viMF3mk173Yt23WEkY963j5Fq6TKusN7WzFA+s8OnjWi/9xTfQcCo1xC3LVs7XQdXQBdQTag5HNf5hIoWg9dxNQyu1bNunHOaG4tXtsK4vUBUT6nDuoyVSFxtNYOmrzVkLcIzxakBapPCjv0zHLpNr+tvY+KK3kXkElZox+AFnzLvi+KxopDrxZglOijVz7AL6Y5iu4VrsGbBkwYCwq/NxBeAuaVNw9AZVsGZo36u32dPlZAXIh3WGjFFZZ6NH9699yVIGTbhVi9Bv7OmjsItbxHu+GIZibiibClrD+S4aMHM4WKQCSZoU/rhvLK3/iAwaFLmkBCB9gRrOiTte7jds3dSpbfgYII8OpzEoMnOGHgYAL35fBxYzB5vCwWD+Uf/MmVfov/BWQZ9tEN5JfLHX+RD0IKm6vxqkg5TSmRw/0CCPVv/64=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(31696002)(38100700002)(86362001)(6512007)(6506007)(53546011)(2616005)(186003)(8936002)(5660300002)(66476007)(4326008)(8676002)(66946007)(66556008)(31686004)(36756003)(2906002)(44832011)(508600001)(6486002)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzgwazYzOVR6OWJoajA0RXZ1eU5aY0tpSFBCZElxcld1RWJlYTNpeWprbHNk?=
 =?utf-8?B?cXRiSktmWEJuRG5zRVd1N3RXWWY5eWxyV01DaGlaMlVadDZ2bjBlcnpoenVR?=
 =?utf-8?B?YmVNdERwUkRzNC81cXpDd3htQjYwVk1yU0JhM0FtTVBxWjIvWitVdFQva1NT?=
 =?utf-8?B?bG5GZWd4NnQ5VzNGcWYxVm9wZnZyeC9KNnJ5c3ZvTk8yM0pOMDNaOTVBRGR2?=
 =?utf-8?B?RU1WbFpQY0NSTGxZUkVidmV4MEdmbmUwa1VUSWhSeXR4Q2FrZEV0Nmsyd2Rn?=
 =?utf-8?B?d1F6V0d1K21sL0R4RlZ5SW1mTTFidTFlVm9zdWIwa1Rnd3NScExwaGJsYS9H?=
 =?utf-8?B?TjdxMlkxb2U0M3pVUVljZXZWYXJUSEwzSmtEcEdaR043ZGozcmx1WTlJcHlS?=
 =?utf-8?B?RnFVQk12QUFCWE44blc5c2tSOUFpV2w5NVM3SVpzSjBQaitzRitKeSt2ZkVm?=
 =?utf-8?B?RFEyVENzY0srdGxnaEN0dkVUSDg0c0NuaXA2THNYczErLzlxTjdCT3lZQ0Z4?=
 =?utf-8?B?SDBNWHFqNCs3WFlIRlhJOVY5K1ZPQWtmV2xmK3hVRCtlcWV5L0I3VDhCV25r?=
 =?utf-8?B?ZVk5WjlYZ1QvOUFkeWliZUt0ZCtQaW15Y2piOTVLU2NzWE9JbHgvUWtuMlRO?=
 =?utf-8?B?bXhENVB1MEFIaFNuZ1BBaDlXUTUxVHREVUMzVnU2OG4wN3JIUnRTTUsrS2tz?=
 =?utf-8?B?eStHUHE3Tm9iZGVVNTJGT3JvcUF3aFkxN3daem81cnhDYnlzUEREMjRrSHha?=
 =?utf-8?B?UmhlNkd3bVVmSkpJb05ZT2drSGVNcHVwLzZzTW5KQ2dZWlNvV21wZFNGMjdK?=
 =?utf-8?B?YVh6cVkzMXdIU0FqL29xek1SOW1OMXp1a0R0TTAwR1QxcUxkdm1SQi9MWVQw?=
 =?utf-8?B?amZmZVFmaVRDZGlPaDBhajFqWitIWldMZ0VxcFBDeGthcUVzeG9nV2xXV0JG?=
 =?utf-8?B?NHBMeVY3VmhGaU82SjEwU2o3ZlpTaFZMRVFKazh2d3VUVEhNaklvVVVHMEdR?=
 =?utf-8?B?aG9vdEdEQXhNQTdVNEF6TjY2bS9iQ1lBTDBxcWV5NURaQkJRVGZxdVJXcFRx?=
 =?utf-8?B?M2VVTytqRlF3cTdZQzBibFF3eFVETmdaWlVMa2t1RHJqa09vcHNYZXUwZmNq?=
 =?utf-8?B?a0JDQVE3Vm1yQlVCejVLT0txMTdTMVdqcTYvcVFUbktqcGJXRDNnL2NyVlRL?=
 =?utf-8?B?SnB5bXBidTd1QlRBR3VaSThrSmozTGRCRm9FcHlEQmt2UEdVUEZZNjRZcW1h?=
 =?utf-8?B?dW5MOEhmOEhWYnlyK01yRnFqU3hnSXdFVUtxWFY4dXNKeC95VVpFcVBnaURv?=
 =?utf-8?B?cmdXR0xjK1JLWlFJcnE2d2dpUnVjekJqcnVOdWpKKzVlWW1od2lMaC91b1ZE?=
 =?utf-8?B?V0J0SXM5Zk1FamdDS3pBaTMrVEFYQlNCWjhWYWJnODZwazh4RjVtSnR5QlI0?=
 =?utf-8?B?aU16Um42R2VSMUZ1L2YyOGFJVkk3ZDNDOTBrNWthTVBGWEhLcUdYNDNpMmNR?=
 =?utf-8?B?czJFVnRVM05LQWFoU1ovZ1BBeFBYTUgyV2JUVFBrNVBkUExqaXlUTXA5ZFFp?=
 =?utf-8?B?UTliR1B5N1AxdjFDVGFFUjlZazY1bFptb0F5WExTYldYOGpjdXJRKzZNL0VD?=
 =?utf-8?B?TXBUSlNCdFM5MS9KL0RXQzhPSVkrcU5QNkFPZFFrdGJyZ2lXcEU2ejFXRzlU?=
 =?utf-8?B?bGd1Y1o3YzBtUlJqQk9IRnhwWXF2aXBVaHUvaDBreHRMd1dJODhNeDRQNkE4?=
 =?utf-8?B?dkE3c1RzcHpCcEZ5b1JMdDNyMkFUNzIzTUwzTlpBNytscnlNKzdrcmt2Y3VX?=
 =?utf-8?B?MDdUaW1KYWVVOFJXRTNLWmdHUTRnTkIyY2JxRFVzK0dEMk1qSitGMEdMQThV?=
 =?utf-8?B?MXAxZ0NxSklXOUpNeHZ2aGhPdk9Zdmx5MHkyK0JrZkhqdThob3ZtWWNDcitJ?=
 =?utf-8?B?Q0JhbVdEWXEwQmQvVXNQbS9ISFI2V0ZIQ2o3VFkxS3ZhMEZtbzJRbGJ3aHJi?=
 =?utf-8?B?dyswTDlDaFBRajUyUVpVVFRjVnpjeFg5cjNPME9nalM2MmdNVE1kcUxuQjRu?=
 =?utf-8?B?clRCR1JIVURCUVI5RWZ3S3ZIYTFRdFA3TkF1SXJ6UUVYaDJhWUJ3aXNEdVcr?=
 =?utf-8?B?YVpwbGI5WEtBejQydEpTV01tR052OW5ZQ25kY2k3Y21Ja0FtcmxoTmF2Q3FW?=
 =?utf-8?B?S1dJOEIvRGxHUXBZRGVBd3hRTEUrWXMzN0dUbUFWOGFCWk9Zd1hTK0JtN2hw?=
 =?utf-8?Q?X4H01x6ruR+1M71P5/j+8HzooKspgv4yRq+/tf2QbQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ef18464-ac82-451c-e01e-08d9fb0053d0
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 21:21:47.7217 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tERwQAyWTWfpiyCsOWAzp3/2chPDLtTzxw7L5j1PnlzvhNeeKwvuArhrew031PJ2bJPghv7ZBQz5KeFLQitJdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3238
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
Cc: Jiawei.Gu@amd.com, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Acked-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>

Andrey

On 2022-02-28 13:16, Melissa Wen wrote:
> Remove redundant error message (since now it is very similar to what
> we do in drm_sched_init) and centralize all error handling in a
> unique place, as we follow the same steps in any case of failure.
>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   drivers/gpu/drm/v3d/v3d_sched.c | 40 +++++++++++----------------------
>   1 file changed, 13 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
> index 39459ae96f30..06238e6d7f5c 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -392,34 +392,24 @@ v3d_sched_init(struct v3d_dev *v3d)
>   			     hw_jobs_limit, job_hang_limit,
>   			     msecs_to_jiffies(hang_limit_ms), NULL,
>   			     NULL, "v3d_bin", v3d->drm.dev);
> -	if (ret) {
> -		dev_err(v3d->drm.dev, "Failed to create bin scheduler: %d.", ret);
> +	if (ret)
>   		return ret;
> -	}
>   
>   	ret = drm_sched_init(&v3d->queue[V3D_RENDER].sched,
>   			     &v3d_render_sched_ops,
>   			     hw_jobs_limit, job_hang_limit,
>   			     msecs_to_jiffies(hang_limit_ms), NULL,
>   			     NULL, "v3d_render", v3d->drm.dev);
> -	if (ret) {
> -		dev_err(v3d->drm.dev, "Failed to create render scheduler: %d.",
> -			ret);
> -		v3d_sched_fini(v3d);
> -		return ret;
> -	}
> +	if (ret)
> +		goto fail;
>   
>   	ret = drm_sched_init(&v3d->queue[V3D_TFU].sched,
>   			     &v3d_tfu_sched_ops,
>   			     hw_jobs_limit, job_hang_limit,
>   			     msecs_to_jiffies(hang_limit_ms), NULL,
>   			     NULL, "v3d_tfu", v3d->drm.dev);
> -	if (ret) {
> -		dev_err(v3d->drm.dev, "Failed to create TFU scheduler: %d.",
> -			ret);
> -		v3d_sched_fini(v3d);
> -		return ret;
> -	}
> +	if (ret)
> +		goto fail;
>   
>   	if (v3d_has_csd(v3d)) {
>   		ret = drm_sched_init(&v3d->queue[V3D_CSD].sched,
> @@ -427,27 +417,23 @@ v3d_sched_init(struct v3d_dev *v3d)
>   				     hw_jobs_limit, job_hang_limit,
>   				     msecs_to_jiffies(hang_limit_ms), NULL,
>   				     NULL, "v3d_csd", v3d->drm.dev);
> -		if (ret) {
> -			dev_err(v3d->drm.dev, "Failed to create CSD scheduler: %d.",
> -				ret);
> -			v3d_sched_fini(v3d);
> -			return ret;
> -		}
> +		if (ret)
> +			goto fail;
>   
>   		ret = drm_sched_init(&v3d->queue[V3D_CACHE_CLEAN].sched,
>   				     &v3d_cache_clean_sched_ops,
>   				     hw_jobs_limit, job_hang_limit,
>   				     msecs_to_jiffies(hang_limit_ms), NULL,
>   				     NULL, "v3d_cache_clean", v3d->drm.dev);
> -		if (ret) {
> -			dev_err(v3d->drm.dev, "Failed to create CACHE_CLEAN scheduler: %d.",
> -				ret);
> -			v3d_sched_fini(v3d);
> -			return ret;
> -		}
> +		if (ret)
> +			goto fail;
>   	}
>   
>   	return 0;
> +
> +fail:
> +	v3d_sched_fini(v3d);
> +	return ret;
>   }
>   
>   void
