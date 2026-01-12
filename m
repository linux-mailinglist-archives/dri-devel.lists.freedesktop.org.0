Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC572D11F45
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 11:39:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A30610E0D5;
	Mon, 12 Jan 2026 10:39:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="aVbsQJFH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3EE410E0D5
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 10:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tfeH+zteWrSk0EyQhlnFYhPhLHVRmivxckNJQEL7UdA=; b=aVbsQJFH79BUIfe9Zrh+OP4vxH
 pC6+VyemKMsI/SsQW2XFyc4QSRHj6wDonBuo8lRT2FKN+gaRFpMzaa9K4c0RCVDnXAra4XZtlOwNQ
 YUZzFmezGCXdiQ+hqtU6qmgQwwA8AGTIcKiFWCTRr1AdPKQ6WjDC3q0KEFH20OG1+vvY6EHkRLbvy
 wanf8WOXlWjATC+vXYCDJzxeL0zyDacp5FJzt/eC1Sg2xHyaJ8gTCgMJ0ST4ShYOhaBu0J78X3Lpr
 6DKAoRRNPgmgRk5acE/L2YQJIhSe59ushOOog46P+kW/cFr9PoTBVQeZyAmj9fqz61OG/b6xmNN3w
 qzHkujOQ==;
Received: from [187.36.210.68] (helo=[192.168.1.103])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vfFKn-004MBX-Lp; Mon, 12 Jan 2026 11:39:42 +0100
Message-ID: <b71decf2-7b19-4c28-b10c-34f75e2206de@igalia.com>
Date: Mon, 12 Jan 2026 07:39:35 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/v3d: Consolidate CPU job validation in a function
To: Iago Toral <itoral@igalia.com>, Melissa Wen <mwen@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org
References: <20260109-v3d-drm-debug-v1-0-02041c873e4d@igalia.com>
 <20260109-v3d-drm-debug-v1-1-02041c873e4d@igalia.com>
 <7e0d79d43d00cea963cf1b2c1953305ccbcdaeaa.camel@igalia.com>
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Content-Language: en-US
In-Reply-To: <7e0d79d43d00cea963cf1b2c1953305ccbcdaeaa.camel@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Iago,

On 12/01/26 04:38, Iago Toral wrote:
> El vie, 09-01-2026 a las 15:35 -0300, Maíra Canal escribió:
> (...)

[...]

>> @@ -770,15 +756,8 @@ v3d_get_cpu_copy_performance_query_params(struct
>> drm_file *file_priv,
>>   	struct drm_v3d_copy_performance_query copy;
>>   	int err;
>>   
>> -	if (!job) {
>> -		DRM_DEBUG("CPU job extension was attached to a GPU
>> job.\n");
>> +	if (!v3d_validate_cpu_job(v3d, job))
>>   		return -EINVAL;
>> -	}
>> -
>> -	if (job->job_type) {
>> -		DRM_DEBUG("Two CPU job extensions were added to the
>> same CPU job.\n");
>> -		return -EINVAL;
>> -	}
>>   
>>   	if (copy_from_user(&copy, ext, sizeof(copy)))
>>   		return -EFAULT;
>> @@ -826,6 +805,8 @@ v3d_get_extensions(struct drm_file *file_priv,
>>   		   struct v3d_submit_ext *se,
>>   		   struct v3d_cpu_job *job)
>>   {
>> +	struct v3d_file_priv *v3d_priv = file_priv->driver_priv;
>> +	struct v3d_dev *v3d = v3d_priv->v3d;
> 
> Since we can get the v3d_dev from the file_priv and we are already
> passing file_priv around, does it really give us anything to also pass
> the v3d_dev around if we only need it in that function? Not that I am
> necessarily against it, just making sure that was a conscious decision.

Initially, I thought it would be more semantic to use v3d_dev, but
rethinking it, I can agree that it would be better to use file_priv.
I'll address it in v2.

Best regards,
- Maíra

> 
> Iago
> 
>>   	struct drm_v3d_extension __user *user_ext;
>>   	int ret;
>>   
>> @@ -843,22 +824,22 @@ v3d_get_extensions(struct drm_file *file_priv,
>>   			ret =
>> v3d_get_multisync_submit_deps(file_priv, user_ext, se);
>>   			break;
>>   		case DRM_V3D_EXT_ID_CPU_INDIRECT_CSD:
>> -			ret =
>> v3d_get_cpu_indirect_csd_params(file_priv, user_ext, job);
>> +			ret = v3d_get_cpu_indirect_csd_params(v3d,
>> file_priv, user_ext, job);
>>   			break;
>>   		case DRM_V3D_EXT_ID_CPU_TIMESTAMP_QUERY:
>> -			ret =
>> v3d_get_cpu_timestamp_query_params(file_priv, user_ext, job);
>> +			ret =
>> v3d_get_cpu_timestamp_query_params(v3d, file_priv, user_ext, job);
>>   			break;
>>   		case DRM_V3D_EXT_ID_CPU_RESET_TIMESTAMP_QUERY:
>> -			ret =
>> v3d_get_cpu_reset_timestamp_params(file_priv, user_ext, job);
>> +			ret =
>> v3d_get_cpu_reset_timestamp_params(v3d, file_priv, user_ext, job);
>>   			break;
>>   		case DRM_V3D_EXT_ID_CPU_COPY_TIMESTAMP_QUERY:
>> -			ret =
>> v3d_get_cpu_copy_query_results_params(file_priv, user_ext, job);
>> +			ret =
>> v3d_get_cpu_copy_query_results_params(v3d, file_priv, user_ext, job);
>>   			break;
>>   		case DRM_V3D_EXT_ID_CPU_RESET_PERFORMANCE_QUERY:
>> -			ret =
>> v3d_get_cpu_reset_performance_params(file_priv, user_ext, job);
>> +			ret =
>> v3d_get_cpu_reset_performance_params(v3d, file_priv, user_ext, job);
>>   			break;
>>   		case DRM_V3D_EXT_ID_CPU_COPY_PERFORMANCE_QUERY:
>> -			ret =
>> v3d_get_cpu_copy_performance_query_params(file_priv, user_ext, job);
>> +			ret =
>> v3d_get_cpu_copy_performance_query_params(v3d, file_priv, user_ext,
>> job);
>>   			break;
>>   		default:
>>   			DRM_DEBUG_DRIVER("Unknown extension id:
>> %d\n", ext.id);
>>
> 

