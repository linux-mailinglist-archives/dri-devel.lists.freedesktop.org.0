Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB3EBE513B
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 20:38:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 295CD10E33B;
	Thu, 16 Oct 2025 18:38:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="GZPxqTDB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F021010E33B
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 18:38:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1760639898; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=aB9jWrYTwtvFY7ba+PfA3vtoJYB7oLhmHpakOtsisa6dDMlDIB4/Uch7NUe2pN4MFxM+G5mE4TeZLO11+1LxqlHny5zTe6ZHy9vOA//8wsXMrBDNESDoNIQeuN5lxElsTMgQUsGWa8btAz6Yia/FAU2pnsMrC1Ag+DT9dOmQOA4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1760639898;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=4jNt/6G7APBGygM79snn30su+iBt+CsUvn1IV7Ew4a8=; 
 b=AmYS6moJetYlv2AD/ocTKzyf1ic+oaBBWJ2HCEJwMyYMZa+tswmNkd66Fq68DioAAUd+fWrm/y4M9UU7q6cyB4HIaUzgCVU4nXkD6K4qIgmLlAlyDAk7M+VlPh6gaKljFdy5hceCuX9L1H4QfzzMQ0FDJMxpe0e+mm9YTvNe038=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760639898; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=4jNt/6G7APBGygM79snn30su+iBt+CsUvn1IV7Ew4a8=;
 b=GZPxqTDBDuN4g2MnrfmvkWg4CssOOcSYLgPwotqmCNsl1mprRUEDYtO6MFV7sZl1
 w2IovxZeVp9R99zvQqN5UKa8KvTPGMCirsyAWrsKpb2xX2F/Fqk5VhXYhks6dGU9OfL
 aHIOT5jWfW9wi3YI+XdTL/VZunsXlLno6lCixfgE=
Received: by mx.zohomail.com with SMTPS id 1760639894703897.936793799572;
 Thu, 16 Oct 2025 11:38:14 -0700 (PDT)
Message-ID: <5911961b-09c3-466d-a168-6f492f840549@collabora.com>
Date: Thu, 16 Oct 2025 21:38:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH] drm/virtgpu: Make vblank event dependent on the host
 resource
To: Thomas Zimmermann <tzimmermann@suse.de>, gurchetansingh@chromium.org,
 kraxel@redhat.com, airlied@redhat.com, vivek.kasireddy@intel.com
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev
References: <20251016145230.79270-1-tzimmermann@suse.de>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20251016145230.79270-1-tzimmermann@suse.de>
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

On 10/16/25 17:48, Thomas Zimmermann wrote:
> For each plane, store the buffer object's host backing in the state
> of the plane's respective CRTC. The host synchronizes output of buffer
> objects with a host resource to its own refresh cycle; thus avoiding
> tearing. During the CRTC's atomic flush, ignore the vblank timer if
> any of the CRTC's plane's buffer object has a host resource. Instead
> send the vblank event immdiatelly. Avoids corner cases where a vblank
> event happens too late for the next frame to be page flipped in time.
> 
> The host synchronizes a plane's output to the host repaint cycle if
> the plane's buffer object has an associated host resource. An atomic
> commit blocks until the host cycle completes and then arms the vblank
> event. The guest compositor is thereby synchronized to the host's
> output rate.
> 
> To avoid delays, send out the vblank event immediately instead of
> just arming it. Otherwise the event might be too late to page flip
> the compositor's next frame.
> 
> The vblank timer is still active and fires in regular intervals
> according to the guest display refresh. This rate limits clients
> that only wait for the next vblank to occur, such as fbcon. These
> clients would otherwise produce a very high number of frames per
> second.
> 
> For commits without host resource, the vblank timer rate-limits the
> guest output by generating vblank events at the guest display refresh
> rate as before.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
> There was a discussion about interference between vblank timers and
> the host repaint cycle at [1]. This patch address a possible corner
> case were the timing gets bad.
> 
> [1] https://lore.kernel.org/dri-devel/IA0PR11MB7185D91EB0CD01FD63D21AA7F8EEA@IA0PR11MB7185.namprd11.prod.outlook.com/
> ---
>  drivers/gpu/drm/virtio/virtgpu_display.c | 72 ++++++++++++++++++++++--
>  drivers/gpu/drm/virtio/virtgpu_drv.h     | 15 +++++
>  drivers/gpu/drm/virtio/virtgpu_plane.c   | 16 +++++-
>  3 files changed, 98 insertions(+), 5 deletions(-)

No problems spotted

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry
