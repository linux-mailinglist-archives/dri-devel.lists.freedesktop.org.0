Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DDD6A08C5
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 13:43:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 026FB10E4D6;
	Thu, 23 Feb 2023 12:43:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94D8D10E4D6
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 12:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BVf9wSov6W+mdwF4/MSO6Tbm4ILnDIvIVk0QaAP+arY=; b=rRAPyt7pL1TDSgnvvZGRpl6kyH
 YEuPDI9+9KkDeWOzMePr/5tRF8mgVUXQesvJISUczg7wJOd9A/sAXeP615i1xhdnXB4t2/U7Dayj5
 kUdX+nOChuUR0NtPJjZXjTO4Vx/+TtOKsO6Ml88/+uxm0xccVu1rNvo3JZT0amGXZnEOi16w2v30V
 OECtGcn4sqh7b78hMCMxgL72zJiQX3w6/mTv3Jn8gQo9EBJUFOOprswNIskAt+uumNEnKyBLqm4KF
 QmrCf8N1OO3etUNqH5eKQlOCBR15syX8WEEZaNNa+pLlP+SKXVi2WMgLSC6oIAV7My9nM4KbAsQ1s
 jAdU45FA==;
Received: from [187.36.234.139] (helo=[192.168.1.195])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pVAwG-00C5Mz-IF; Thu, 23 Feb 2023 13:43:08 +0100
Message-ID: <1f5a24d2-f2f3-8d2e-a0d0-e425785e128a@igalia.com>
Date: Thu, 23 Feb 2023 09:43:04 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 0/2] drm/vc4: Improve drm_gem_object handling
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Melissa Wen <mwen@igalia.com>
References: <20230202111943.111757-1-mcanal@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20230202111943.111757-1-mcanal@igalia.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ping.

Best Regards,
- Maíra Canal

On 2/2/23 08:19, Maíra Canal wrote:
> Currently, the array of BOs that are lookup up at the start of exec is being
> instantiated as drm_gem_dma_object, which is not needed and makes it difficult
> to use the drm_gem_objects_lookup() helper. Therefore, replace
> drm_gem_dma_object for drm_gem_object and then replace obj lookup steps with
> drm_gem_objects_lookup().
> 
> v1 -> v2:
> 
> * Add André Almeida's Reviewed-by.
> 
> Best Regards,
> - Maíra Canal
> 
> Maíra Canal (2):
>    drm/vc4: replace drm_gem_dma_object for drm_gem_object in vc4_exec_info
>    drm/vc4: replace obj lookup steps with drm_gem_objects_lookup
> 
>   drivers/gpu/drm/vc4/vc4_drv.h      |  2 +-
>   drivers/gpu/drm/vc4/vc4_gem.c      | 78 +++++++-----------------------
>   drivers/gpu/drm/vc4/vc4_validate.c |  4 +-
>   3 files changed, 21 insertions(+), 63 deletions(-)
> 
