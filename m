Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D40CABC7464
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 05:12:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3878A10E1B2;
	Thu,  9 Oct 2025 03:12:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="CyBs1SK5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FDB710E904
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 03:12:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1759979538; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=XwRbKGxXyD1jo0M0N4VIzR6ojXZmxwhgPGBwUyWRggJXwJC/pePX+9XCKOD/we8EfK1gm5HIxZr2s47G2mKSbl7I+P4UKp+qaAxYy9j/1VeuuIBqLaIMY4l6S9OTcrbD07EEsJn3jR9qfjlp6HL8jm0t8Dt84Yw4Gwi1A9nu+ro=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1759979538;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=KRi9Dp8IwKCGBEjvVN1ZhH9rJI8hir+DEKoyo8v/Rl4=; 
 b=iaBPfWs9bTF+/ri6fJS4+ldc8+EG9U53k4pdktMMMJ/1jxzVYupA+qWhn4oKtcYXsHBgMoG4mD/AhgdqnrBKI/gx/tiiFkbNe+srJqwQYOALTKHSs5Rx1N0sqWpRfKX5r6XhXS+GncEmIStCS89w4S2bONZSixilop9Gq30fWN4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759979538; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=KRi9Dp8IwKCGBEjvVN1ZhH9rJI8hir+DEKoyo8v/Rl4=;
 b=CyBs1SK5MhxCXB9nCJeUNXpQjCIKsqO5sV3k5odoHlJVA/QEp62go6W41GBac047
 f4VCkG2JSMP47zAzU4WQUxR8QCjAgVmA5VEJoJVWQm6hu30zP7Q7GyPhoYBbZ2psRvt
 cUksUlH55NQ7bWF06GehTuxYEjkJrp9EmiNzAkAI=
Received: by mx.zohomail.com with SMTPS id 1759979536109504.4796089477394;
 Wed, 8 Oct 2025 20:12:16 -0700 (PDT)
Message-ID: <d3cfbc5a-11f0-4482-bf6b-ef890d182fc7@collabora.com>
Date: Thu, 9 Oct 2025 06:12:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5.10] gpu/drm/virtio: fix error return in
 vgdev_output_init()
To: Alexandr Sapozhnkiov <alsp705@gmail.com>,
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev
Cc: lvc-project@linuxtesting.org
References: <20250922144418.41-1-alsp705@gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20250922144418.41-1-alsp705@gmail.com>
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

On 9/22/25 17:44, Alexandr Sapozhnkiov wrote:
> From: Alexandr Sapozhnikov <alsp705@gmail.com>
> 
> Return value of function drm_crtc_init_with_planes(), 
> called at virtgpu_display.c:276, is not checked, 
> but it is usually checked for this function
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> Signed-off-by: Alexandr Sapozhnikov <alsp705@gmail.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_display.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
> index ad924a8502e9..59b652e8a630 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_display.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_display.c
> @@ -253,6 +253,7 @@ static const struct drm_connector_funcs virtio_gpu_connector_funcs = {


Applied to misc-next with corrected coding style and edited commit
message, thanks.

-- 
Best regards,
Dmitry

