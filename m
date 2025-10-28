Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D09C15A1B
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 16:58:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C55AB10E5FC;
	Tue, 28 Oct 2025 15:58:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="OjmQQZVE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4D9210E5FC
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 15:58:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1761667118; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=iijX9Izz0uG8wktjqRaepdAW7Voi45MDynx6tzFeVUWXux7/lNY7KUdKek282mPagZ4l3rlmtl5Nwflquwx68RbQhBNp/UomEdBE7pZzLPJi8pRa1EFvHWg47JiDeu2hO1v9QlWXtONjG2NeOMeNUpO/9JkZY0xbedZnCbSS/cM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1761667118;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=efnwSCEsXITjibbdoGIyNdBFDpkKA+IsZHmoTSS+4Cg=; 
 b=UQNjv/HZUj/DOb+mENrPNtI29zga+jU0eIpKQHKxIeaGX99kIdE0c5aLjBJZllg9LC067lAKemqGmlt1cB6+qFyjecIOqCVCSo94ETsFcqarHOiO5fVYcRkKuNg/WKD8pgkruPsJ7DIQVqDNiQJGtQ+sOw+eLDqypyEGjwxQQ30=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761667118; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=efnwSCEsXITjibbdoGIyNdBFDpkKA+IsZHmoTSS+4Cg=;
 b=OjmQQZVE4SdKQtG7N+LPM4dW+IHd1vQSLhb/k66m+8bni9RGgP/VklwABYTxQwby
 1ujDiyMw6Ejcx7UE+4hqI7TAl59OIrORkmMjmL8cowueAl8PmxLbkDFp6RW3CMoZ/3q
 oh9HUoKE2g1LyMALzqrnyIVbamgcVt3qvlFwSUag=
Received: by mx.zohomail.com with SMTPS id 1761667115040634.8837214497644;
 Tue, 28 Oct 2025 08:58:35 -0700 (PDT)
Message-ID: <1e4a29e7-bf98-4193-962a-66fd251e2c72@collabora.com>
Date: Tue, 28 Oct 2025 18:58:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/virtgpu: Make vblank event dependent on the
 external sync
To: Thomas Zimmermann <tzimmermann@suse.de>, vivek.kasireddy@intel.com,
 gurchetansingh@chromium.org, kraxel@redhat.com, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev
References: <20251027095550.110562-1-tzimmermann@suse.de>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20251027095550.110562-1-tzimmermann@suse.de>
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

On 10/27/25 12:52, Thomas Zimmermann wrote:
> For each plane, store the buffer object's sync status in the state
> of the plane's respective CRTC. During the CRTC's atomic flush,
> ignore the vblank timer if any of the CRTC's plane's buffer object
> is synchronized to an external source. Instead send the vblank event
> immediately. Avoids corner cases where a vblank event happens too
> late for the next frame to be page flipped in time.
> 
> Exporters of GEM objects sometimes interfere with the vblank timer;
> resulting in framerate drops. Hence detect this case and handle it
> as outlined above.
> 
> The vblank timer is still active and fires in regular intervals
> according to the guest display refresh. This rate limits clients
> that only wait for the next vblank to occur, such as fbcon. These
> clients would otherwise produce a very high number of frames per
> second.
> 
> v4:
> - only handle imported GEM buffer objects (Dmitri, Vivek)
> - fix test for plane visibility (Vivek)
> - always enable vblank timer to make waiting clients happy
> v3:
> - disable vblank unconditionally
> - compute status on each commit
> v2:
> - enable/disable vblank timer according to buffer setup
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
> This patch was previously called "drm/virtgpu: Make vblank event
> dependent on the host resource". Earlier versions where meant for
> testing, rather than being merged. See [1] for a discussion of when
> the fixed problem happens.
> 
> [1] https://lore.kernel.org/dri-devel/20251016145230.79270-1-
> tzimmermann@suse.de/
> ---
>  drivers/gpu/drm/virtio/virtgpu_display.c | 67 ++++++++++++++++++++++--
>  drivers/gpu/drm/virtio/virtgpu_drv.h     | 15 ++++++
>  drivers/gpu/drm/virtio/virtgpu_plane.c   | 28 +++++++++-
>  3 files changed, 104 insertions(+), 6 deletions(-)

No problems spotted. I'd only extended comment in the code explicitly
stating that drm_gem_is_imported() is the workaround, might edit it on
applying. Will wait for Vivek's feedback. Thanks.

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry
