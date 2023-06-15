Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE83731B06
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 16:15:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E362610E0BE;
	Thu, 15 Jun 2023 14:15:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A648310E0BE
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 14:15:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dxJ7UUI47lJIiVVqW9xrQF5H23M+JEfnzf5GEtbgbWkrBXhOUIn1P4DpfyS4JNYoDUI34nr59MbuGmqFmIfl5g8llYMTdB3k/v0xzUYMhd2XVpmaUk26DL9RglEGsGxItlhGfPxuAoc8iXfNoRlUR38S83Aq5ZxygeC6e/aOggAc/v9WIU8BgWKozl+QQPhGbjY+4n43MVrfd/8Ko21CsQp5yAPF2Gi9GyzdqeD5dyBK8gFFnJ+B6wYNXgdTsRr/Vf/1BrHGw7Yqeuyf+MAJHUwaUyP6xRWb33jT3UvbBHqtaDSwcMLMhsYVjHbpBnOgh3EGgAA4dI1Lk+r04cLi0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CzHNfNAxYVZa1q4cVtn85IDweCxUsXiZwBd4S5mZcKk=;
 b=RXQCZLhdyjLNU/DS6IzcHeOyE+WvCT+wALw3NkuI4Pwov0QJKEBF2uWeB0hB2CALy9d/+0hapVP5UKYMLoVXaWdSY52pcKniRBvm4h+UVSKE0wmG96e2VUALslNqnbeTqGapDLFU+6ycmphp20tdVcDJ01eMjkEBFKsMC0rdeDyWo1aYbpdUP7wzC3n4WxK+o9Kw2pRa96mS72ud0OEupJxr57Nq7VkwUf14GdzQaE53C7pqsDgJ8gtdjjymDgzX49o3Ysg02Yu2JkTuoPdXQHB7OvyVXb86vnTmiMh6pV07BSmMaDrOI/QVMvaRnehN/jN1hGlVQ3kWIMIFhru7iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CzHNfNAxYVZa1q4cVtn85IDweCxUsXiZwBd4S5mZcKk=;
 b=5mR8g49szqwxWh7mds3eBLZLR4q2CV2dyprSUpx6F0+rKr2L3J1edrwpC+zEkMqxKUlDIub/fUYd/miXKE9jlKyi/GXTfjqMrdexXtatwuWfrGeg4qBKkVSwStpnI4/lSIqaEx+PHDuSHlQb1IGWooJMMewCG5UodlevEUROSns=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 BL1PR12MB5192.namprd12.prod.outlook.com (2603:10b6:208:311::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.25; Thu, 15 Jun
 2023 14:15:22 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b59e:105c:f546:4310]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b59e:105c:f546:4310%7]) with mapi id 15.20.6455.020; Thu, 15 Jun 2023
 14:15:21 +0000
Message-ID: <aaee2a70-eeaa-3c7a-7edd-06155d752d2c@amd.com>
Date: Thu, 15 Jun 2023 10:15:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-CA, en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 l.stach@pengutronix.de, tvrtko.ursulin@linux.intel.com,
 robdclark@chromium.org
References: <20230615115630.164098-1-christian.koenig@amd.com>
 <20230615115630.164098-2-christian.koenig@amd.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH 2/3] drm/amdgpu: mostly revert "fix force APP kill
 hang(v4)"
In-Reply-To: <20230615115630.164098-2-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1P288CA0018.CANP288.PROD.OUTLOOK.COM (2603:10b6:b01::31)
 To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|BL1PR12MB5192:EE_
X-MS-Office365-Filtering-Correlation-Id: 225e2eb8-d1d7-4645-e0f1-08db6daaf466
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jKK++SC82L1tvVyCdP/+/BahdZcJEW7k0PqJPQXUuYowkS8qlhX0/OTTAXZQs1ArTYZQGqW0NoBlpLTxWu55wmdbdL2bHGvWIxJJ+tdesqiz1t/m3/YH0s5N+r75lSkZsx3FO8ZgEE7dG8GXNCa8cPVZ8bl+iaeEyE8uUFBBnVy2MSDQRVs2bPxREsh+SOQf16lagZ4o4voaK5PsTAdRy9Sm28YpyT7lc9jfls23H8DlbXVduMxvieHyDEET81UYTxKmdNNIQAWUPZgQHzRpUqGNITw/j2F0SYfbTatqKqmlM+jkAOGhbLV8VtTaLdVioiRvOfxPIPhK1swnfKbyJYpuaR8h6AEvp9M/OBsLji6IJCtPjPLKI5Il0RGmUN4PfNg2PYgQGKqlN1bt3j7whB74oAGCn/D2gt1KEmMV/POUe6uYAUX+dju+XXx0r5XtxgoAGdPwH9ORMeExR6qG5PGAuMr2Ba2BM5Q0GdTBhl8+1/zJMvN7vt1JkW/bei515VyXMNlHqQeiH2qv6rTc4u6wa+zWSQ+mssyrG6ne3wrkAOD8Zik5OGIyVsxu0qIkukcL7z8745q5fd6GGXN7ZjFwRgkIdfrNCB+uKpi0QyY4KcpqV8kx13FqSYQkq4UqZ9GId4xFuMb564XAB8HL2w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39860400002)(376002)(366004)(396003)(346002)(451199021)(66574015)(83380400001)(2906002)(2616005)(36756003)(86362001)(31696002)(38100700002)(8936002)(8676002)(6486002)(316002)(41300700001)(5660300002)(478600001)(31686004)(66946007)(66556008)(66476007)(6666004)(4326008)(26005)(6512007)(53546011)(6506007)(186003)(44832011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1JrM1dQbXhWNjdGRzR6R0ZhWWZQOWVSeUwzdTgwOHhycnhOaU5rVDZGbjNO?=
 =?utf-8?B?MkZxT2xWKzRxYVhQTXBUSTh2c29uS0ZZaTZWN1hVMGV4OHBpMHZ3cjJzcFcr?=
 =?utf-8?B?SXZGcFRkRS8wc2RtNVZ5OVdkeXI3dkZaUnp6WU53ZWpPNnVqY29TSVdDM2t4?=
 =?utf-8?B?c3VnMDRwNWFYYTcvRUgwaTZBK2pWbFgzbGRUZTRRSEtncmpORkYzWmF3emRW?=
 =?utf-8?B?VHBiZXdoS0ovSzZQTEk1ZjQxOFY0UFJuaGVMMEZhSGRtYVpocENiUm9RYU1Y?=
 =?utf-8?B?NWE1UDVLK2FhWGF2U2NwN1NyL3F2N2d2YWF4QTRkN3FBSFhaSEdPNDdlaUQz?=
 =?utf-8?B?eE5HYUpudVUxak41NnlPcHQrSFBCdk04NHR6SWpvUUdLd1ZNWUJvQ2oyblJZ?=
 =?utf-8?B?c0tJVFBNTEFvZ3h3aEJUYndocFFnaURUb1Y1aXBqdUd2UHdmTTdjMityblpx?=
 =?utf-8?B?MVVVUXFGT0RXandwUXdnZFpKcXlGZ3ZxbUp4OTVnUkFOT0RRaWt3R0NCMUtZ?=
 =?utf-8?B?VHIvNkRNVkVTK0JGN1NwVkFwNXFFeXVuQmV6UzFZcUFFRWVITnRwTFVSc1pl?=
 =?utf-8?B?bFo1QXFYc1cyaVFhMnFEcGJUYTBqVmlWODFVNmpMeWM2NkYya2JCZVVUZGhv?=
 =?utf-8?B?T1JQcm5QRVArdVU2K0JDeTcyd1pyN1hQNUZHTG8raGN5d1RzZm9GbFJzYUUx?=
 =?utf-8?B?R2hzRjVhanFqNVluVG1UWTFWQXhHR3ZXTWZhZlpnSWYwK09mZ0pLSmMrRkh4?=
 =?utf-8?B?ZStjazhTS0tuL3JPRHBzZ1VjNko2bVVmbjh6YlhoZ2ROajJNY05FdTY2d0NN?=
 =?utf-8?B?ZTVWRnQzNTErSVVEYXNsQVVzb0x5WVU3WVBzalp2eFFCNmRDNTBtMmZJakJk?=
 =?utf-8?B?bjFZRDlSL0RYYml5SnZVRVBRM3pBbkkycDQ0cTJONDY1UlViS3ovbWxpR0Y5?=
 =?utf-8?B?T2s1R3A1MGtiY1U4SG0xSDdWQ0FQRWN3OXZXWWtpWXcrdlhRR2VOT0lUbXJE?=
 =?utf-8?B?MlhPTFdpV2Z3UzcydWwyTGw0bkhST0VPNWY2djBYejgySlZLb2pXM3owREVO?=
 =?utf-8?B?cmQ2aG5ncmYwUDE5RGxVK3ArN1gvbzJZYXM5L3hheTRic3gvblNpNDRQVlRI?=
 =?utf-8?B?TlRLQ2FHM1VKNWtkTXN2TVBydVM0aEZiVVR6d2F6T0xMUzlNVDhaNUVUcmgx?=
 =?utf-8?B?Z3pNd1VuSTd6OGZ0cFNpT3JqZkNqbDlsa2M3MCtEYW90TVRQMDRKSDZjd0FF?=
 =?utf-8?B?OHlGWXhVek5tdERBVnpDZVNLendpblBpMjJiSDVkTmpub2hMMUpMLy9mUll3?=
 =?utf-8?B?NmZrckFGOSs3OWVQeGM3WERiV3o0WmEyUTB5bk13SFZSTEp4VDFzL0xKRGpt?=
 =?utf-8?B?VzBBOGRUZGdiZTlWdnRKaCtGeDd0UERsd2VFNC92UEFkakU2SnlOS0NzUmNm?=
 =?utf-8?B?Rzc2N3RYcmg3N1FGZGVvbWl6am5Vak1uVGlUNjNRc0RUSVgzaHI5aG0wYkVl?=
 =?utf-8?B?N0V5OHVKUitsWjFQcjNVWjhwenBDVnV1aEJyK29aYjZ4V3JaeGFFTmxYRjhh?=
 =?utf-8?B?eUMrQk5SNVNOUE5YQnBKaDAxUnpwcDZGMVB1RG5yQWJnUEFDMW1Ec3UzdzhP?=
 =?utf-8?B?QzRkTTJ1QkhCbTBITXhqQ3hoNXBSb3p0V24yaXFTenBNV3k3OTExWXJZb0pJ?=
 =?utf-8?B?WHR5WlI0aGdBczUwZE1wS3REYTZYMGpMSDJmQ1kxNlg2c1FUaUl0L1hsRDBm?=
 =?utf-8?B?NTc1c2xPR29TOWhJekR2RVRtSmpsV0xLOStwemxHcUxGZFpPN1R5dXJiK3hO?=
 =?utf-8?B?SDBoM1pDUEhuelVCS0pDRWpGdFdxNFhmT2xnak03anFDSnZSU0UzM0p1RlRt?=
 =?utf-8?B?Q3dYdjhJQ21KSnBOZmIraDNNeU0yUFpMQm5USGNHY2pobkRYam5VNGtuZ25D?=
 =?utf-8?B?bk1RSElnYlhDckFvbG1VcXo4cXdKMU5BR001clJOUllIcWUrcmk3RERJY3lM?=
 =?utf-8?B?d25IZktJTTRJd1dtajdKZW5QYjVLVGNNQTJPWE1HQzlaRVdwQVpKbnFsc3JV?=
 =?utf-8?B?Q3dNd1dZSDRXT09xb09yTG1rSkN5VzhnRlNxVHdYV1JKcThsRGZmcjVJYnQw?=
 =?utf-8?Q?s/oM=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 225e2eb8-d1d7-4645-e0f1-08db6daaf466
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 14:15:21.7189 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gg4z4p8yscnHxnD3+dsAGvhG4EmS5y7pigEou32GK8u3G7JfZZ1Pv2eoO/t1aavO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5192
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-06-15 07:56, Christian König wrote:
> This reverts commit 8ee3a52e3f35e064a3bf82f21dc74ddaf9843648.
> 
> The new amdgpu_ctx_mgr_entity_fini() was never called, so it was pure
> coincident that this patch didn't cause a crash. Since the workaround
> shouldn't be needed any more just mostly revert the changes to amdgpu.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Add a fixes-tag,
Fixes: 8ee3a52e3f35e0 ("drm/gpu-sched: fix force APP kill hang(v4)")

Acked-by: Luben Tuikov <luben.tuikov@amd.com>

Regards,
Luben

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 59 ++-----------------------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h |  1 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c |  2 +-
>  3 files changed, 5 insertions(+), 57 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> index d2139ac12159..1445e030d788 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> @@ -267,7 +267,7 @@ static ktime_t amdgpu_ctx_fini_entity(struct amdgpu_ctx_entity *entity)
>  		res = ktime_add(res, amdgpu_ctx_fence_time(entity->fences[i]));
>  		dma_fence_put(entity->fences[i]);
>  	}
> -
> +	drm_sched_entity_destroy(&entity->entity);
>  	kfree(entity);
>  	return res;
>  }
> @@ -476,24 +476,6 @@ static int amdgpu_ctx_alloc(struct amdgpu_device *adev,
>  	return r;
>  }
>  
> -static void amdgpu_ctx_do_release(struct kref *ref)
> -{
> -	struct amdgpu_ctx *ctx;
> -	u32 i, j;
> -
> -	ctx = container_of(ref, struct amdgpu_ctx, refcount);
> -	for (i = 0; i < AMDGPU_HW_IP_NUM; ++i) {
> -		for (j = 0; j < amdgpu_ctx_num_entities[i]; ++j) {
> -			if (!ctx->entities[i][j])
> -				continue;
> -
> -			drm_sched_entity_destroy(&ctx->entities[i][j]->entity);
> -		}
> -	}
> -
> -	amdgpu_ctx_fini(ref);
> -}
> -
>  static int amdgpu_ctx_free(struct amdgpu_fpriv *fpriv, uint32_t id)
>  {
>  	struct amdgpu_ctx_mgr *mgr = &fpriv->ctx_mgr;
> @@ -502,7 +484,7 @@ static int amdgpu_ctx_free(struct amdgpu_fpriv *fpriv, uint32_t id)
>  	mutex_lock(&mgr->lock);
>  	ctx = idr_remove(&mgr->ctx_handles, id);
>  	if (ctx)
> -		kref_put(&ctx->refcount, amdgpu_ctx_do_release);
> +		kref_put(&ctx->refcount, amdgpu_ctx_fini);
>  	mutex_unlock(&mgr->lock);
>  	return ctx ? 0 : -EINVAL;
>  }
> @@ -712,7 +694,7 @@ int amdgpu_ctx_put(struct amdgpu_ctx *ctx)
>  	if (ctx == NULL)
>  		return -EINVAL;
>  
> -	kref_put(&ctx->refcount, amdgpu_ctx_do_release);
> +	kref_put(&ctx->refcount, amdgpu_ctx_fini);
>  	return 0;
>  }
>  
> @@ -881,45 +863,12 @@ long amdgpu_ctx_mgr_entity_flush(struct amdgpu_ctx_mgr *mgr, long timeout)
>  	return timeout;
>  }
>  
> -void amdgpu_ctx_mgr_entity_fini(struct amdgpu_ctx_mgr *mgr)
> -{
> -	struct amdgpu_ctx *ctx;
> -	struct idr *idp;
> -	uint32_t id, i, j;
> -
> -	idp = &mgr->ctx_handles;
> -
> -	idr_for_each_entry(idp, ctx, id) {
> -		if (kref_read(&ctx->refcount) != 1) {
> -			DRM_ERROR("ctx %p is still alive\n", ctx);
> -			continue;
> -		}
> -
> -		for (i = 0; i < AMDGPU_HW_IP_NUM; ++i) {
> -			for (j = 0; j < amdgpu_ctx_num_entities[i]; ++j) {
> -				struct drm_sched_entity *entity;
> -
> -				if (!ctx->entities[i][j])
> -					continue;
> -
> -				entity = &ctx->entities[i][j]->entity;
> -				drm_sched_entity_fini(entity);
> -			}
> -		}
> -	}
> -}
> -
>  void amdgpu_ctx_mgr_fini(struct amdgpu_ctx_mgr *mgr)
>  {
>  	struct amdgpu_ctx *ctx;
> -	struct idr *idp;
>  	uint32_t id;
>  
> -	amdgpu_ctx_mgr_entity_fini(mgr);
> -
> -	idp = &mgr->ctx_handles;
> -
> -	idr_for_each_entry(idp, ctx, id) {
> +	idr_for_each_entry(&mgr->ctx_handles, ctx, id) {
>  		if (kref_put(&ctx->refcount, amdgpu_ctx_fini) != 1)
>  			DRM_ERROR("ctx %p is still alive\n", ctx);
>  	}
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
> index 0fa0e56daf67..729cf479d71d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
> @@ -91,7 +91,6 @@ int amdgpu_ctx_wait_prev_fence(struct amdgpu_ctx *ctx,
>  
>  void amdgpu_ctx_mgr_init(struct amdgpu_ctx_mgr *mgr,
>  			 struct amdgpu_device *adev);
> -void amdgpu_ctx_mgr_entity_fini(struct amdgpu_ctx_mgr *mgr);
>  long amdgpu_ctx_mgr_entity_flush(struct amdgpu_ctx_mgr *mgr, long timeout);
>  void amdgpu_ctx_mgr_fini(struct amdgpu_ctx_mgr *mgr);
>  void amdgpu_ctx_mgr_usage(struct amdgpu_ctx_mgr *mgr,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> index 0efb38539d70..50c36c95556d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> @@ -1278,6 +1278,7 @@ void amdgpu_driver_postclose_kms(struct drm_device *dev,
>  		return;
>  
>  	pm_runtime_get_sync(dev->dev);
> +	amdgpu_ctx_mgr_fini(&fpriv->ctx_mgr);
>  
>  	if (amdgpu_device_ip_get_ip_block(adev, AMD_IP_BLOCK_TYPE_UVD) != NULL)
>  		amdgpu_uvd_free_handles(adev, file_priv);
> @@ -1299,7 +1300,6 @@ void amdgpu_driver_postclose_kms(struct drm_device *dev,
>  		amdgpu_bo_unreserve(pd);
>  	}
>  
> -	amdgpu_ctx_mgr_fini(&fpriv->ctx_mgr);
>  	amdgpu_vm_fini(adev, &fpriv->vm);
>  
>  	if (pasid)

