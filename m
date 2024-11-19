Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 065119D2309
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 11:09:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42B7A10E604;
	Tue, 19 Nov 2024 10:09:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="OkP1ImM9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75A5A10E604
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 10:09:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1732010967; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=OWJm+P8PpGSWkuVnY+dKdmOJr9QNXvLPig7omSmwHOAf2Zo28rBFbqGJSIg3VM2ZGGfOXtK3+r48G3u+vfXOMqmfgaCVEkPbu1HVoSkm2KQGM9+gL/rsxszwOW5YzZYIru4gDxXAfjDIV8GyComVqCRaogwapY1QdoFEQWqKdoQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1732010967;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=6vObRq2E+RGALjKawt1r5dY6l6TVau1KQSOylOW2doo=; 
 b=WrCu9YOEuavHSUfdbGsj5jNaSqtEuCcmEa5ivP4DwTtt368Cy8oLRTyHrQbmlHzoVcRxDiduXGQhzEpv5XCTVMqOZ0Bt8h4L967OA6948OIddrgrnGSAztt5EvYNXvTpq2T3d2BToYd9mjwvtDwAx8ZrfZIVHuSS4GJJj7YHtpA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732010967; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
 bh=6vObRq2E+RGALjKawt1r5dY6l6TVau1KQSOylOW2doo=;
 b=OkP1ImM9vxIcIwxt+xg/n12ilQgxh2T795cbyPYaFS7F/WLvsiaDtfOA6K2Z8/v8
 ndFChntS9sFVWWvqVzFXHE5sIonmejkkKV2i+8ZHCYVjXdKCOoxvAzfCzA+njwRL7dS
 bw16/xBSgWeS//rdFVqP+83TvWFCXQhCESnCS1dY=
Received: by mx.zohomail.com with SMTPS id 1732010965656991.9554222257977;
 Tue, 19 Nov 2024 02:09:25 -0800 (PST)
Message-ID: <0c842e7b-5a49-404d-9647-311bfc37f003@collabora.com>
Date: Tue, 19 Nov 2024 13:09:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 RESEND] drm/virtio: use generic dumb_map_offset
 implementation
To: Peter Shkenev <mustela@erminea.space>, David Airlie <airlied@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20241107141133.13624-1-mustela@erminea.space>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20241107141133.13624-1-mustela@erminea.space>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

On 11/7/24 17:10, Peter Shkenev wrote:
> Currently, virtio uses its own dumb_map_offset implementation,
> virtio_gpu_mode_dumb_mmap. It works similarly to generic implementation,
> drm_gem_dumb_map_offset, and using the generic implementation is
> preferable (and making drivers to do so is a task stated on the DRM
> subsystem's TODO list).
> 
> Thus, make driver use the generic implementation. This includes
> VIRTGPU_MAP ioctl so it cannot be used to circumvent rules imposed by
> drm_gem_dumb_map_offset (imported objects cannot be mapped).
> 
> Signed-off-by: Peter Shkenev <mustela@erminea.space>
> ---
> Changes in v2:
>   - Remove excessive include of drm_gem.h from virtgpu_ioctl.h
>   - Remove obsoleted virtio_gpu_mode_dumb_mmap prototype from
>     virtgpu_drv.h
> 

Applied to misc-next, thanks!

-- 
Best regards,
Dmitry

