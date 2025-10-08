Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF96BC4929
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 13:32:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 581E410E04F;
	Wed,  8 Oct 2025 11:32:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="jlma1YDY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1420C10E04F
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 11:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1759923162;
 bh=lHFZ0Mn7FZKfUa9zLPtyWyUGRg5TjpNVLCteTg2PP/U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jlma1YDYm9z5o3ZL6+30bY24E7jAiHQxf1UvcLL5wOA80aahx6ShF2qqKCsKMGiRS
 HYW88JC8U/kspNkR2ugSBxLuGNOP2IvdnS0NndNjQZ/2OFUkZpHYnhIkJxXvXq8wHo
 CCtVWmlWpj88cTpmBu9RN88zpYVFNY8z1eRd91b2XMhbwZmohm+KcEHY3oXntw3lbn
 yx/rEDuIN2ZbvnhL4TTAVVRcjyq4db62VK++WXsbiMMrrN2wJi2F5u+DGjjru2raHE
 tBP6Jlpqlm8Ooicdhf1wbLlWiYwd0VuNS/uWNUxDk512GYx9e7yWZOz+/QBSg0btzp
 4uOhJm343jDdA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 2FDE717E0A28;
 Wed,  8 Oct 2025 13:32:42 +0200 (CEST)
Date: Wed, 8 Oct 2025 13:32:35 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Ketil Johnsen <ketil.johnsen@arm.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panthor: Ensure MCU is disabled on suspend
Message-ID: <20251008133235.0407cc9c@fedora>
In-Reply-To: <20251008105112.4077015-1-ketil.johnsen@arm.com>
References: <20251008105112.4077015-1-ketil.johnsen@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Wed,  8 Oct 2025 12:51:11 +0200
Ketil Johnsen <ketil.johnsen@arm.com> wrote:

> Currently the Panthor driver needs the GPU to be powered down
> between suspend and resume. If this is not done, then the
> MCU_CONTROL register will be preserved as AUTO, which again will
> cause a premature FW boot on resume. The FW will go directly into
> fatal state in this case.
> 
> This case needs to be handled as there is no guarantee that the
> GPU will be powered down after the suspend callback on all platforms.
> 
> The fix is to call panthor_fw_stop() in "pre-reset" path to ensure
> the MCU_CONTROL register is cleared (set DISABLE). This matches
> well with the already existing call to panthor_fw_start() from the
> "post-reset" path.
> 
> Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_fw.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index 9bf06e55eaee..df767e82148a 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -1099,6 +1099,7 @@ void panthor_fw_pre_reset(struct panthor_device *ptdev, bool on_hang)
>  	}
>  
>  	panthor_job_irq_suspend(&ptdev->fw->irq);
> +	panthor_fw_stop(ptdev);

Is this not preventing fast resets? My understanding was that
MCU_CONTROL shouldn't be touched if the MCU was halted from the FW, but
maybe I got that wrong. If it's just for the MCU crash case, we can
have:

	if (on_hang)
		panthor_fw_stop(ptdev);

>  }
>  
>  /**

