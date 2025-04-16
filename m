Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 886B7A8B224
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 09:29:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C20AA10E86D;
	Wed, 16 Apr 2025 07:29:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="U0u9Z6b9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C3910E86C;
 Wed, 16 Apr 2025 07:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ia4B45pMDmZ3UwY9Bd4jR/lwQE2ezYjp7vEdsGcZgWI=; b=U0u9Z6b9xfpzzZC9L1kjIZguNj
 hyqJ2apa/3vr7X7PbWRbtTIXxtaghOpSd7xEQ++Ll0XwFJY4d6RRKwMPf37RPs8mvSP2/nXcxCnk0
 RaNlEE8SubDeFTbexpwpTvlr9K4Zwrb3oTz3b9VDi9DuWVY/yyeH0Dd2tXvvMOAx1jKrJ66PlpMBK
 A+5YWB+3SROFfgAMgD2DFfGSkWBPOF+0AEmgc7spkhIC+PgD66Qi3ZmEwXG4HxcXvz19cGnV23G99
 V5/xnQezYniR98OEtNh5EaIRWIfPrRcZ+mfzovL6CBnawI2sBjYIv/mzWGLTXht5TW3qrdnPy0A+z
 FqqgcT2w==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1u4xDT-00HHAl-TH; Wed, 16 Apr 2025 09:29:51 +0200
Message-ID: <dcc0921c-d0f1-491c-b5f8-ef0be4d08dfb@igalia.com>
Date: Wed, 16 Apr 2025 08:29:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] drm/amdgpu: add drm_file reference in userq_mgr
To: Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
References: <20250415184318.2465197-1-sunil.khatri@amd.com>
 <20250415184318.2465197-2-sunil.khatri@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250415184318.2465197-2-sunil.khatri@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 15/04/2025 19:43, Sunil Khatri wrote:
> drm_file will be used in usermode queues code to
> enable better process information in logging and hence
> add drm_file part of the userq_mgr struct.
> 
> update the drm_file pointer in userq_mgr for each
> amdgpu_driver_open_kms.
> 
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c       | 1 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.h | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> index 3d319687c1c9..3de3071d66ee 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> @@ -1436,6 +1436,7 @@ int amdgpu_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
>   
>   	amdgpu_ctx_mgr_init(&fpriv->ctx_mgr, adev);
>   
> +	fpriv->userq_mgr.file = file_priv;
>   	r = amdgpu_userq_mgr_init(&fpriv->userq_mgr, adev);

It's a bit of a layering violation since amdgpu_userq_mgr_init() is the 
place which otherwise initialises fpriv->user_mgr. One day someome might 
put a memset in there for example. Anyway, I think it would be nicer if 
you passed fpriv to that function. Potentially instead of adev. Looks 
like that would be cleaner "design".

Regards,

Tvrtko

>   	if (r)
>   		DRM_WARN("Can't setup usermode queues, use legacy workload submission only\n");
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.h
> index 381b9c6f0573..fe51a45f7ee4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.h
> @@ -77,6 +77,7 @@ struct amdgpu_userq_mgr {
>   	struct amdgpu_device		*adev;
>   	struct delayed_work		resume_work;
>   	struct list_head		list;
> +	struct drm_file			*file;
>   };
>   
>   struct amdgpu_db_info {

