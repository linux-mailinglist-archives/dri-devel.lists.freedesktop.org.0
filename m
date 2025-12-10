Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0433BCB3873
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 17:51:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2F4C10E77E;
	Wed, 10 Dec 2025 16:51:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="Q0pG3vFf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6BE110E77E
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 16:51:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1765385490; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=AqWOnSV3x1aE+qAbMdMHP7POIq0TLbcppVkPg6jvkhE1SgxoIS20xF5HS3tRgoc1PHl1SnoGhkOh9qkf88ZyYoEBCj9HBFhQUcmq/A2EQn5bhP7gDx59fJjzVyzhD3fao1mHhuQXo58D46UPWmu1lMDt0veDAKAvzgNOru/d6Y4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1765385490;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=XYQugW6063MToRusR1W+LNEWImZVIODvOq5oYuOWBG8=; 
 b=OJ1cHg2sqkd6bp++vSCv6qKR0kGmuMnSTGWmc3Qqy6Ubx5YFonESd3xzyX+65HR6EMamp4J/QxNBNyqdJkMK9wvYqbKqIIanUiQpOd15diGrmBIUPcg75nQb50kGGlih5wXBY8yGbdwX/E36IK35I02UcBrM5M6fPo0C4JEtV+Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765385490; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=XYQugW6063MToRusR1W+LNEWImZVIODvOq5oYuOWBG8=;
 b=Q0pG3vFf+K/YLOMnqVuPrRJWPNy6Y0bETcoLClHXCwsZkFDt971EPbM7WHV/ZC3p
 NxvO/8G/ALFDjZa0UP6O81SuRJdSDMwgMyShCBunmdE0sx+2VKp4uSbiX7HKhE2ChDe
 UrRr+l0CeGwoaPrvJsh1aysnXLZdxgiOw28zeyBo=
Received: by mx.zohomail.com with SMTPS id 1765385488675690.2327611062028;
 Wed, 10 Dec 2025 08:51:28 -0800 (PST)
Message-ID: <a8405071-8489-4965-9a59-fc58f78cb250@collabora.com>
Date: Wed, 10 Dec 2025 19:51:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/virtio: Allow importing prime buffers when 3D is
 enabled
To: Val Packett <val@invisiblethingslab.com>,
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>,
 Christian Koenig <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251210154755.1119861-2-val@invisiblethingslab.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20251210154755.1119861-2-val@invisiblethingslab.com>
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

Hi,

On 12/10/25 18:39, Val Packett wrote:
> This functionality was added for using a KMS-only virtgpu with a physical
> (or SR-IOV) headless GPU in passthrough, but it should not be restricted
> to KMS-only mode. It can be used with cross-domain to pass guest memfds
> to the host compositor with zero copies (using udmabuf on both sides).
> 
> Drop the check for the absence of virgl_3d to allow for more use cases.
> 
> Fixes: ca77f27a2665 ("drm/virtio: Import prime buffers from other devices as guest blobs")
> Signed-off-by: Val Packett <val@invisiblethingslab.com>
> ---
> 
> Hi. I couldn't find any comments on that line in the reviews (on patchwork), so I assume
> there was never a specific technical reason for that check, just an abundance of caution?
> 
> BTW, while here.. The drm_gem_prime_import "fallback" seems pretty much equivalent to
> `return (-ENODEV)`, as drm_gem_prime_import(_dev) just translates the call to
> gem_prime_import_sg_table which we don't use. Should it be replaced with `return (-ENODEV)`?

Returning -ENODEV should break dmabuf self-importing where virtio-gpu
driver export dmabuf and then imports to itself.

> ---
>  drivers/gpu/drm/virtio/virtgpu_prime.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
> index ce49282198cb..2fedd5d3bd62 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_prime.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
> @@ -312,7 +312,7 @@ struct drm_gem_object *virtgpu_gem_prime_import(struct drm_device *dev,
>  		}
>  	}
>  
> -	if (!vgdev->has_resource_blob || vgdev->has_virgl_3d)
> +	if (!vgdev->has_resource_blob)
>  		return drm_gem_prime_import(dev, buf);
>  
>  	bo = kzalloc(sizeof(*bo), GFP_KERNEL);

At a quick glance the change looks fine. Will take another stab after
Holidays and merge if no problems will be spotted. Thanks.

-- 
Best regards,
Dmitry
