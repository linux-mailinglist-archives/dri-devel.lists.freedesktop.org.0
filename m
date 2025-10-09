Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A7CBC8576
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 11:41:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FB7C10E9BB;
	Thu,  9 Oct 2025 09:41:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Lt+69rFU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF8C10E9C9
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 09:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760002865;
 bh=BgXT6/6d97jbIHWS93AHyI/hD6v0+ToEm+ndv9lo0QM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Lt+69rFUN9ToCo1ZD94mzQ7xera+H/SjVJNDRFkiR7OjAzpkD2aCceDydfl7xM9sD
 V0sOhkspeoNSt6/3D3rx6DVLEnB7z7yxh/UVQxl8unheZplJ7ByKDgL6HaULp8HZLE
 fcG7ee4ti6Ot4KQxMZLme02B2rNyFCvukBB3rmOY+xQCO6rGSxfjeT9AI20muGBlm1
 8vf9ywcL4faDtZMAJombg9eJIOjG3D6huE55eUcWtHUako3MDJ4q11BDe8P2B+gtH9
 hko2Xwc9tbpGiUECV+5IaBUb4zfZxjKt2ZFHYyJ4/6gtBIkA54wIpLX5a4MhXMFqT2
 6UMucPBZmx7aw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id D1B4A17E0C54;
 Thu,  9 Oct 2025 11:41:04 +0200 (CEST)
Date: Thu, 9 Oct 2025 11:39:14 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Karunika Choo <karunika.choo@arm.com>
Cc: Ketil Johnsen <ketil.johnsen@arm.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, nd@arm.com
Subject: Re: [PATCH] drm/panthor: Ensure MCU is disabled on suspend
Message-ID: <20251009113914.665a2c25@fedora>
In-Reply-To: <30b8b782-1bf9-43bd-9022-67851ccef7a6@arm.com>
References: <20251008105112.4077015-1-ketil.johnsen@arm.com>
 <20251008133235.0407cc9c@fedora>
 <30b8b782-1bf9-43bd-9022-67851ccef7a6@arm.com>
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

On Thu, 9 Oct 2025 09:42:08 +0100
Karunika Choo <karunika.choo@arm.com> wrote:

> On 08/10/2025 12:32, Boris Brezillon wrote:
> > On Wed,  8 Oct 2025 12:51:11 +0200
> > Ketil Johnsen <ketil.johnsen@arm.com> wrote:
> >   
> >> Currently the Panthor driver needs the GPU to be powered down
> >> between suspend and resume. If this is not done, then the
> >> MCU_CONTROL register will be preserved as AUTO, which again will
> >> cause a premature FW boot on resume. The FW will go directly into
> >> fatal state in this case.
> >>
> >> This case needs to be handled as there is no guarantee that the
> >> GPU will be powered down after the suspend callback on all platforms.
> >>
> >> The fix is to call panthor_fw_stop() in "pre-reset" path to ensure
> >> the MCU_CONTROL register is cleared (set DISABLE). This matches
> >> well with the already existing call to panthor_fw_start() from the
> >> "post-reset" path.
> >>
> >> Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>
> >> ---
> >>  drivers/gpu/drm/panthor/panthor_fw.c | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> >> index 9bf06e55eaee..df767e82148a 100644
> >> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> >> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> >> @@ -1099,6 +1099,7 @@ void panthor_fw_pre_reset(struct panthor_device *ptdev, bool on_hang)
> >>  	}
> >>  
> >>  	panthor_job_irq_suspend(&ptdev->fw->irq);
> >> +	panthor_fw_stop(ptdev);  
> > 
> > Is this not preventing fast resets? My understanding was that
> > MCU_CONTROL shouldn't be touched if the MCU was halted from the FW, but
> > maybe I got that wrong. If it's just for the MCU crash case, we can
> > have:
> > 
> > 	if (on_hang)
> > 		panthor_fw_stop(ptdev);
> >   
> 
> Hi Boris, I think as long as the FW is properly halted, we can safely
> disable the MCU. In fact, because of the ptdev->reset.fast tracking, we
> can call panthor_fw_stop() in both cases, as the flag allows us to
> handle the resume path correctly.
> 
> As per Ketil's commit message, if we don't clear the HALT bit on L2
> power on, the MCU can start booting the FW with the bit enabled, which
> in certain cases can make it fail to boot. So this patch fixes that by
> gating when the FW is allowed to boot.
> 
> I also believe this behaviour will be better aligned with the expected
> behaviour from the FW of newer GPUs (Mali-G1 for example).

Okay, as long as you're sure it doesn't screw up the fast reset, I'm
happy to get that in.

Acked-by: Boris Brezillon <boris.brezillon@collabora.com>
