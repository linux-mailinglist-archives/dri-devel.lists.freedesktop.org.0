Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB9469C661
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 09:16:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D16C510E122;
	Mon, 20 Feb 2023 08:16:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eb2::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C438F10E113;
 Mon, 20 Feb 2023 08:16:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XLTjAMiDk5HYX2E6tb5L0IjYpQZlD5Xur9GHlT793xdhemXq46dLRGB0muPnAtpz44h8fIQT/S9TlNLCkBo4fN5KPzr17ZxjLxoLORjgA0vlWloOnJxNgljm0R2ZxxpndRbO+/ldF4Prj6FBD1QhIqp34pUt7XkUNam/6rdJl1fDbD3GjIWsVouvOLoYRxyGSzNaTAq77svHODWkZlkr2FdDKD7Hd9dDdtGEWN5LIQOWdnMqE6nfobrThYnI0lS9Si0n3lEpwxowbH5kPnRFiRm3p+EtjRMeSBbJBZL8AUNhVWUkW7wc8PoJm3gs+DuXhIW7IS+/CjlqYcEea7qPRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uPIH0SA/LOj4D7ZOI/QvZ3/L2vEdx3sArdEG6dfNj4g=;
 b=MBSvYy+sfDS1g7Hq/djd96H3qEGz2RSxoKO3iM6+WELuCYfMnM9vltxbI7rSVxTh46Gtpn40GY4TFJASf9V8mWjwPUPq2tjNnXCYaIi2UlP+JaTq06VCMUfeA0lnpAFSfpAG7/1hPEpZARLOmVmFHL/TOBnmAADwW02xt4HcwZiMNEMaiXNip2ax3fx5Ply0bxOKZE1qhO1VhkwJX4zjbniqRPy5ItOlPDRaUlIYtKzD+cW8bDQI0r3sXoA0z3fxhrD8ObnDs+A0/lr4qGfen4t8Th9B+yOO2IErDkTlffDstF7Zn/A1zEp0D7v/Cmg4kgke9H4Mi0oJeY9fJ78LCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uPIH0SA/LOj4D7ZOI/QvZ3/L2vEdx3sArdEG6dfNj4g=;
 b=17YZVwdAqNWFgSxiI9WIn4hCUnepBiiJEODdmKsfBIw8hhR2Vkvq3QdyRa5sSqnRykjABZm5AYbaEv7GJMRtKllwYpKXkc/28BhrmJiSrQK0Yg0q+tYyGQw332obO6yX7BX7W81zL+U1qt7yiYXQCPtRf6DLryPArJLiN3hGLNg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by IA0PR12MB7603.namprd12.prod.outlook.com (2603:10b6:208:439::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.19; Mon, 20 Feb
 2023 08:16:17 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6111.019; Mon, 20 Feb 2023
 08:16:17 +0000
Message-ID: <0630025f-d7b5-320f-b5ec-2a459963d76d@amd.com>
Date: Mon, 20 Feb 2023 09:16:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 04/14] dma-buf/dma-resv: Add a way to set fence deadline
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230218211608.1630586-1-robdclark@gmail.com>
 <20230218211608.1630586-5-robdclark@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230218211608.1630586-5-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|IA0PR12MB7603:EE_
X-MS-Office365-Filtering-Correlation-Id: e03011e2-63be-4ae1-6ad4-08db131abd67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: USRjSnhshMNqhtTOzZUJwIMVr6kDvriB+va9dlag522uUGT9FdGD6+C/aN1Uyy0dKIeEPDoUJJKv7ddpAxrP9XjVoMrtiufis5rrkF8qxko9qV44dQMwZTW5RFowct8ki4GJWazkw6uoYojodN7JvfdeQHrjmFFpTLqMkAaBpDpQCABhGtUSwoEHL6awtpJ+1j25S+5zyR5cKAUoViYB5blR/+lXKW/lg8de0qTF0k+JuOZF8aXsRqAYt/VbeT9YXtFOG6rYKymCZozudCTRgdyK18X7ke+8VK+83Uv8zROsXaL90y0WdLlDieidTHDKS9HEiMIexNHhh9s6DoOo/EPMh/SRODv0hewajeQphiPwLRDp1+8gUfrj5oD65MCp7HoLznBd1Jbd2s+dZzxOv2EHJ10ilvctSNPU5YbWRmBB9JqZaXOOHJFJaOC5D381TBJlqHdVRpIkvxMiZ59BEcQp1dC2h4ke5eiQZI0l9ynKfvLQoY+b4idDRPUD39MbdBnsRzB3/k72ugBaHT9SBp1c8/lg0PiolZmpXiitsV4+JxawiEJdJeBf1qAMMoU+/sIm0qChp2eI8A3ctySL5/wIcwFc3/MbQMAz9GcgsekMkOrnpHDdQ5/sEo8jpRY8JB7KuhbysmjOj2GUNUmg3amwmo0a2ZMMpuYXYGNGgY0MDPurShCSEKKU/48OMIVo6bXcGXk8D/vHyJoHbFs/K+91d/z9xMwtrI1W3Rk2sMKczfiw/2IppPw6XyGoSCYx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(376002)(346002)(396003)(39860400002)(136003)(451199018)(31686004)(8676002)(66946007)(4326008)(66476007)(316002)(6486002)(66556008)(7416002)(54906003)(41300700001)(8936002)(5660300002)(36756003)(31696002)(86362001)(478600001)(186003)(6512007)(38100700002)(6666004)(6506007)(66574015)(2616005)(2906002)(83380400001)(43043002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnVjc2JXUlpnc3I0NUF5TXNvZWhjNldpa3I3TFRqMXY2THZZQWdUZlZ6enJz?=
 =?utf-8?B?YzRQU2FpUGJHcjBHSUQ0RFJSUENlK21qb3VTdEtuUldnZXhubjJKZzlYWnVS?=
 =?utf-8?B?b3BBcUk2T1JkM3dCM2RSQWZsRHpyOUU1MTI3d1QwSnRIRGpLcGJVbTU4bjNv?=
 =?utf-8?B?MTV6MlZlN3hDeTF4eE5teHJGWmh6bkFKWUROclhqYll1N1ZHZ0ovZXhkMUxi?=
 =?utf-8?B?cUM0b3VtbzR3OE9zdGZ4OExRZlJqMHRIYVVRd0Nuanc0V0NYc2Z6VEFZYlAr?=
 =?utf-8?B?NUp5MmkwUUg0M3cvemgrNDA1N2pmV1cycnlRRy9vTXNMUGRsSWlrQkhMTlhs?=
 =?utf-8?B?c3hEVVpYOWFNYjhITk9tY016bkVJcEdKUTlmZlFUQ0Fkc2ZFWFFDanhrS3pt?=
 =?utf-8?B?MWQ1V05qOU1BSVJiL0JzYjhJZ2VsNmFmRzF1WWFpOE9MMmtQZjR0eDJweFVa?=
 =?utf-8?B?Uk9Hd0lUYkxJbHhrREEvRE5Fb3luQmxwTzZNdjhmMVVKRzROZXdyM2R1a3ht?=
 =?utf-8?B?RjBOeTdETVpyUjdWSzlYUkc1VzhQUFlMMXQwdmEvMW42UWNUMUpxaXJjTWRL?=
 =?utf-8?B?UEdLWmc2aXNYUlZIZnpHL2NoclhKT0ZIdlJkU3F6WFZsZHY0MzM3VDNHN1pU?=
 =?utf-8?B?U1MwM1JQbkdvTzVzTTY2M3VlWEZDNStmTnpON0JOeXh2MXVOL3IzRDFSWktQ?=
 =?utf-8?B?bTRrVjR6L3k0Ukl5M2xESStSSFRrVjFpN0VpemxpS3dSSktULy85aHR1U0dQ?=
 =?utf-8?B?WmhVUHVJWERyUmExUGwyQTVXOTArek5sTzBrNHhqY3VYM2p2S2RCVXEvRTAw?=
 =?utf-8?B?YWlNczc5UlUwWmhCWFBMWmltWW55MnJaVnMrTTM0SE1VNUdXWVEySndkNUdt?=
 =?utf-8?B?VFBrR1YwbTdZY3N1Y2JFdW9NZ2x4R0NuZ0VkQmlUNFlZaHU0VElSTkVIbk1B?=
 =?utf-8?B?T3VxeUtCTDNkOGh1MkQ4UUtKRmNCVEpkbVAxeld2ZDlYd2lyU0tScEpZRUxx?=
 =?utf-8?B?bkhJcUdoVWsvK0ViMWRmTmpFUUlEVENac2FSYmw5YmlNYXBmS21rZ1RubVBX?=
 =?utf-8?B?eXRZL3lHWHdBdE5yOS9HVU5VN0tTdGg3Qm1leHF3bEROcHAwMTZHekhGblhU?=
 =?utf-8?B?ZWFrenJlSSttNTBzUldjbmMrVzFCaEk3MnZZV0RWNFIvc24vMWhyM2FMY0VU?=
 =?utf-8?B?TU9pSVgyR2drYU5JWG4rMEZ0bSs5VGxVV24vS0ZhVktFOWtQd25mczZaL0F1?=
 =?utf-8?B?eTVWT0N3WEIrZmdJSWoyY3ZmVFpLSE1XVGhzZVBnajhmN1hkRUNPMCtaR1NY?=
 =?utf-8?B?T0tkWksrMlFqUDZVYmp6ZC9LT2ZSeVY5ZkxJb0l5Q2M1akI3WHhXb2xGeW8v?=
 =?utf-8?B?Vk1LY1RqY3lWc1hzN1VBaTVwWFUwMzkxQmx1TDZ3Y0dMci9VUktwTGFsTjdx?=
 =?utf-8?B?dDg2aVFpM084RkNpMXF3UXM3NFd5bXZveEZGdlFyUjV3RmZkTFBPdUdBMzZz?=
 =?utf-8?B?b1lXSWhIUUpkb0RMbU15bFc2MngvK0J6TDNKdG9OendFVGltZDlLN2ZtYTQ2?=
 =?utf-8?B?MUEzaE9RbHV0Q1RGS1NlYms4Q2x6UXhXeHR2V1ZzWnBiYjR6bitqMDFZTGdR?=
 =?utf-8?B?NCs4UjViUFNySkhTNWs5eENOUzFicGdNbnNCSVB2OERCYWYyNWg0SHpkcWk5?=
 =?utf-8?B?TGJ1Y3dZTkxFVnZWQ0hhSko1SWdpbkRINXFXWHVvL3A2VS9xWHpHclFzaTBB?=
 =?utf-8?B?eU4vVW5PcFQ3RzlrQy9iYnZhUThoVlRCeVpQWU93MzcxRzdmSGNtR3oyRytH?=
 =?utf-8?B?b2Jqb1VobVB4YjBwOFNjbFpLeFE2VGlPa0JTK2ZPT1oySWh5eTJQNVFMdEFn?=
 =?utf-8?B?aVlJM3ZDUUE5VklRNGg1Mml1bmpOOFE2N2x1RVEwNGNpWkxWY2M5NjhMSUdU?=
 =?utf-8?B?TTVhanB3WFRmZy9xTGlqc3JUSzhuWm5JWFp2VlJCTmxhclR1VFV1OE9zNTMw?=
 =?utf-8?B?SGt2RnYzWXNNUVk5Rnc0Nk1oc0l5aEVwM1o5SmNEWXRHVStRYTRSb09oQUs2?=
 =?utf-8?B?ZlkvTnZFVVNXZXR6aDhyUmczSlFPRkVjNkNGcDlyUHZDYTdMbkh4T0xDNCtX?=
 =?utf-8?B?dGtDN1Y4b3V3RXpRWmNka2VCa2pvSjFKd3hlRDROS2QyVmtZQitSUnpnSTls?=
 =?utf-8?Q?bKQ3VN6Te7DTLiOAPfls97SlbujTcVBU2YMmnuhDf1dV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e03011e2-63be-4ae1-6ad4-08db131abd67
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2023 08:16:17.3774 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: us4B/IElYoqI8/KaiTFaX4BOQ8RyrZILx+0gNFolmu8uBppwuxgr5OpdVUB3ukUr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7603
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.02.23 um 22:15 schrieb Rob Clark:
> From: Rob Clark <robdclark@chromium.org>
>
> Add a way to set a deadline on remaining resv fences according to the
> requested usage.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/dma-buf/dma-resv.c | 19 +++++++++++++++++++
>   include/linux/dma-resv.h   |  2 ++
>   2 files changed, 21 insertions(+)
>
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 1c76aed8e262..0c86f6d577ab 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -684,6 +684,25 @@ long dma_resv_wait_timeout(struct dma_resv *obj, enum dma_resv_usage usage,
>   }
>   EXPORT_SYMBOL_GPL(dma_resv_wait_timeout);
>   
> +/**
> + * dma_resv_set_deadline - Set a deadline on reservation's objects fences
> + * @obj: the reservation object
> + * @usage: controls which fences to include, see enum dma_resv_usage.
> + * @deadline: the requested deadline (MONOTONIC)

Please add an additional description line, something like "Can be called 
without holding the dma_resv lock and sets @deadline on all fences 
filtered by @usage.".

With that done the patch is Reviewed-by: Christian König 
<christian.koenig@amd.com>

Regards,
Christian.

> + */
> +void dma_resv_set_deadline(struct dma_resv *obj, enum dma_resv_usage usage,
> +			   ktime_t deadline)
> +{
> +	struct dma_resv_iter cursor;
> +	struct dma_fence *fence;
> +
> +	dma_resv_iter_begin(&cursor, obj, usage);
> +	dma_resv_for_each_fence_unlocked(&cursor, fence) {
> +		dma_fence_set_deadline(fence, deadline);
> +	}
> +	dma_resv_iter_end(&cursor);
> +}
> +EXPORT_SYMBOL_GPL(dma_resv_set_deadline);
>   
>   /**
>    * dma_resv_test_signaled - Test if a reservation object's fences have been
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index 0637659a702c..8d0e34dad446 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -479,6 +479,8 @@ int dma_resv_get_singleton(struct dma_resv *obj, enum dma_resv_usage usage,
>   int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src);
>   long dma_resv_wait_timeout(struct dma_resv *obj, enum dma_resv_usage usage,
>   			   bool intr, unsigned long timeout);
> +void dma_resv_set_deadline(struct dma_resv *obj, enum dma_resv_usage usage,
> +			   ktime_t deadline);
>   bool dma_resv_test_signaled(struct dma_resv *obj, enum dma_resv_usage usage);
>   void dma_resv_describe(struct dma_resv *obj, struct seq_file *seq);
>   

