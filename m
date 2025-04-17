Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E17A3A91E28
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 15:36:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D737410EB0D;
	Thu, 17 Apr 2025 13:35:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="JRyD4MQW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7790E10EB0D;
 Thu, 17 Apr 2025 13:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IasqFWwfLP0aLVmPyL5Jc3Kg8ivsSMIoMKzRcnpcEL4=; b=JRyD4MQWoWdKtul3e1F1NKbWxe
 3GB/P94LsejChbmDGy5DyHRhW7PlD0xvAgfkOwvsB5U4xOnjXpOkD+t5BREC066aU79wJsWswqca0
 g85wa6A1seDF4/eU/VQhUdXrvNlMcpMYgrcE9yezaH+DZ1cJqUW2oKa2QSaFxFIZw0n3PFVHz6RN5
 OMMdv2mPDixMoZ0zW+CUuoFnZaSQlyZZO//NqG2Omgs24yqyxAyurP7KGp6yZD4+1hBHfE2pC3109
 mRKtMAsjvSq4fKKcr7H2CT4BjDoE7dnhg2bI13XYry9fp+SArOlilcnr5qhVdfDgMKs33HPsk5JRc
 kH8BBPZg==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1u5PPI-000pFJ-Hr; Thu, 17 Apr 2025 15:35:56 +0200
Message-ID: <4fd8c9e7-e39a-478a-8735-4536c636b286@igalia.com>
Date: Thu, 17 Apr 2025 14:35:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V6 2/5] drm/amdgpu: add drm_file reference in userq_mgr
To: Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
References: <20250417123155.4002358-1-sunil.khatri@amd.com>
 <20250417123155.4002358-2-sunil.khatri@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250417123155.4002358-2-sunil.khatri@amd.com>
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


On 17/04/2025 13:31, Sunil Khatri wrote:
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
>   	if (r)
>   		DRM_WARN("Can't setup usermode queues, use legacy workload submission only\n");
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.h
> index 0701f33e6740..fe5d1c8afb9b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.h
> @@ -78,6 +78,7 @@ struct amdgpu_userq_mgr {
>   	struct amdgpu_device		*adev;
>   	struct delayed_work		resume_work;
>   	struct list_head		list;
> +	struct drm_file			*file;
>   };
>   
>   struct amdgpu_db_info {

With the promise you will later move the initialisation into 
amdgpu_userq_mgr_init():

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

