Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D486C77FA8B
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 17:17:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B37DF10E4DF;
	Thu, 17 Aug 2023 15:17:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4ABD10E066;
 Thu, 17 Aug 2023 15:17:54 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 7341740E00F4; 
 Thu, 17 Aug 2023 15:17:52 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
 header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id QmBmwkyxKu7T; Thu, 17 Aug 2023 15:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1692285470; bh=ub9UHmv4k4n9Fnzww3zqDAiez22GxzEYG+O3pBXVSr4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DJKLdJGakm5QLV1vCz5EbOOXhQVEpm6bNC1dVTHuka1drW77i2q2EJK+4I5XyPcq1
 f4/AjqEpE7gb7HatHtfd+HzHtigSmxV5v34Btnpq5BnBVj3c8JrY8ttSIfOCV9JTfR
 dUg3mBiIfN2f/CBUsF8BMgYBUDDcQyeOWvy8/ke39lDBVQMSJBAZjSs3g1N2fe2xIV
 eTFD82YLIhNSXw9ZldQSArzNJXglxT5m9uZUwg3/XgmYVTYJlPfdVH9EYwYfSh1CmX
 wJOy/hNBn0T1rgN/45gmWhDVBDhYgtjVaQ29Tm52jphkKKl/FhTflBcaGKHBL0MRGg
 +o4E0nlspAo1Qc7pcLgrs7WIDcC+r6FrW+ZNtl5A8Ao29I1VKVAEYtcuBL7UdUoLfl
 eJXqYgTnLApmp/g8IGUtOxC5qQsdR5TvMW0heU2NzoD3dOl/ndjAnFZqdMlJ/rd9xG
 R3zqnEizgvh3/N7UY5nbESEZ11kqNv12+blNLKGz9tAKwUnS+qP/K76D9i4xnbNlYw
 n5xCfyNXxaIsR0UZRp4FxWfBgAoSwNIqMJsCedCcPvcsr/Rmu4r96D+NnKdSF0FHf+
 IubBZQdyEBq6HgXIlTbKK1EQV3IMl3wLMrQTjWMMkNI40oTuY1Aktvr4kr6FdcWyQK
 RylsoRsiY5MRB2GAFojCiOwY=
Received: from zn.tnic (pd9530d32.dip0.t-ipconnect.de [217.83.13.50])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 24CBE40E00B0;
 Thu, 17 Aug 2023 15:17:43 +0000 (UTC)
Date: Thu, 17 Aug 2023 17:17:39 +0200
From: Borislav Petkov <bp@alien8.de>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: [PATCH] drm/nouveau/disp: fix use-after-free in error handling
 of nouveau_connector_create
Message-ID: <20230817151739.GEZN46E2T/1GS+baIZ@fat_crate.local>
References: <CACO55ttasKLxBTmZjN-XBOuJFC7rng2PbLgxCT8WT6ukOZNGzQ@mail.gmail.com>
 <20230816151252.GKZNzndDNySuWC+Vwz@fat_crate.local>
 <CACO55tunC5mEu3Tw64rKLqNM6MN6d=N90kYQKYwXWNMB=ahDaw@mail.gmail.com>
 <20230816221353.GXZN1KIXloRn8cGt5E@fat_crate.local>
 <CACO55ts7430tAUDC+0qY0EZ5ReO=2Rjwj1SzHaBLodmyBgrUrw@mail.gmail.com>
 <20230817081032.GAZN3V+NQ1blzQC2sU@fat_crate.local>
 <CACO55tv-dKnDzUYYFW+d2pNoAhEoEniUT=QAmD4-c_xKQw0cfw@mail.gmail.com>
 <CACO55tuWTYngfw+MZnan+U4eYyE+SvOWgxzffaCMNGQgriq3ig@mail.gmail.com>
 <20230817101129.GCZN3yUTWHkt22Jgec@fat_crate.local>
 <CACO55tt9ZLKjaTyARXQ4VePgd41nYCQBn+wAGGDJRw1QV3hPBQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CACO55tt9ZLKjaTyARXQ4VePgd41nYCQBn+wAGGDJRw1QV3hPBQ@mail.gmail.com>
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 17, 2023 at 12:24:45PM +0200, Karol Herbst wrote:
> simply throw a
> 
> printk(KERN_WARNING "nvkm_uconn_uevent %u\n", outp->info.location);
> 
> inside drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c:104 after that
> mentioned comment.

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
index 46b057fe1412..661fd0cf3b3b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
@@ -101,6 +101,7 @@ nvkm_uconn_uevent(struct nvkm_object *object, void *argv, u32 argc, struct nvkm_
        if (args->v0.types & NVIF_CONN_EVENT_V0_UNPLUG) bits |= NVKM_GPIO_LO;
        if (args->v0.types & NVIF_CONN_EVENT_V0_IRQ) {
                /* TODO: support DP IRQ on ANX9805 and remove this hack. */
+               printk(KERN_WARNING "nvkm_uconn_uevent %u\n", outp->info.location);
                if (!outp->info.location)
                        return -EINVAL;
        }

result:

[   10.566759] ACPI: bus type drm_connector registered
[   10.591171] Console: switching to colour dummy device 80x25
[   10.598472] nouveau 0000:03:00.0: vgaarb: deactivate vga console
[   10.607121] nouveau 0000:03:00.0: NVIDIA GT218 (0a8c00b1)
[   10.728361] nouveau 0000:03:00.0: bios: version 70.18.83.00.08
[   10.742137] nouveau 0000:03:00.0: fb: 512 MiB DDR3
[   11.059848] nouveau 0000:03:00.0: DRM: VRAM: 512 MiB
[   11.064911] nouveau 0000:03:00.0: DRM: GART: 1048576 MiB
[   11.070302] nouveau 0000:03:00.0: DRM: TMDS table version 2.0
[   11.076126] nouveau 0000:03:00.0: DRM: DCB version 4.0
[   11.081335] nouveau 0000:03:00.0: DRM: DCB outp 00: 02000360 00000000
[   11.087865] nouveau 0000:03:00.0: DRM: DCB outp 01: 02000362 00020010
[   11.094395] nouveau 0000:03:00.0: DRM: DCB outp 02: 028003a6 0f220010
[   11.100912] nouveau 0000:03:00.0: DRM: DCB outp 03: 01011380 00000000
[   11.107422] nouveau 0000:03:00.0: DRM: DCB outp 04: 08011382 00020010
[   11.113940] nouveau 0000:03:00.0: DRM: DCB outp 05: 088113c6 0f220010
[   11.120457] nouveau 0000:03:00.0: DRM: DCB conn 00: 00101064
[   11.126182] nouveau 0000:03:00.0: DRM: DCB conn 01: 00202165
[   11.138865] nouveau 0000:03:00.0: DRM: MM: using COPY for buffer copies
[   11.151291] nvkm_uconn_uevent 0
[   11.154643] nvkm_uconn_uevent 0
[   11.157975] nvkm_uconn_uevent 0
[   11.161298] nvkm_uconn_uevent 0
[   11.164616] nvkm_uconn_uevent 0
[   11.167943] nvkm_uconn_uevent 0
[   11.176010] [drm] Initialized nouveau 1.3.1 20120801 for 0000:03:00.0 on minor 0
[   11.184186] nouveau 0000:03:00.0: [drm] Cannot find any crtc or sizes
[   11.260527] megasas: 07.725.01.00-rc1
[   11.264555] st: Version 20160209, fixed bufsize 32768, s/g segs 256

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
