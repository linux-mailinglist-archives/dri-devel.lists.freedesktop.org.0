Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8CE8BCEA9
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 15:00:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D743D10F9CB;
	Mon,  6 May 2024 13:00:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="GKgSFouA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D58F910F743
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 13:00:26 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-52103349cf0so3441e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2024 06:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1715000425; x=1715605225; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0MC7OpcGYLPXs/PO3kIcpv2b78zv2hyqRLzxTdiWabM=;
 b=GKgSFouAqGheNlC/Llc4Eap9PLjKgqylTUh4YFruecqEX1J2Hf9a+/O9mD6AmnBmsX
 dVnpHhdKcGzKsKkoKYUWZMtSAHK82OWllZrzscl5svtBFIc/XRFyQbHOF9AInJe2HgGY
 pPa32al3poE1wnMKT0OEmbqZqITBeeKvgK2zg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715000425; x=1715605225;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0MC7OpcGYLPXs/PO3kIcpv2b78zv2hyqRLzxTdiWabM=;
 b=gZDYpLdChwObtmHfCJiyQ/sc/rsP5I+za8425lImiqjLZTb6rxnPu0vswJo9JnJ4l6
 KXA4t1kN07/fhIHSdvXOFgB+VIsyfKkClk7wssoLQArkJCVt6UxULrN3F1/eR9GEQQaB
 kevGC2i5B8WZP/AyTRPHyZfkx0/fe87AIo33GYol+QnDZhXT9HYz3XUk7NXtXizBPI8x
 //wE+ceOPKbrYrHhBI1g9VwpOzNTuaXe+mwQ74xsIYkb3F4CNzLM8FhiGLRl/Z4xwRMP
 p07VUioaxJYVyRJTe61tk3niE0V4B5kyPf6NQeVy+Tqi/pIJmeR/bRlNNp7EP4rf1qId
 fo3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAOnm0uLFAEII0L+K5OBCuVWs+m49quUvFcKyAZIfoJFNPIA2bQ7YN7hXg7WpTAZFNHfSkMKG2M83qCBmnI9qAnlchJRaIBWOQ1Ee3WcOJ
X-Gm-Message-State: AOJu0YzCKaGxedlJvmRb3YjelEJ9MnGNbfZOlT14jxuLVl1gE1vd6lAq
 JIT/xz+rv/1/9w8QxMLDwUCiNffuBS6hTR3WfBevp/jN+QlfCkQ4Cl9GrcaN6Qo=
X-Google-Smtp-Source: AGHT+IH8lLdNAY2mbmVkOQp3kCoVJthBU9BDKN8li5OhS+ZudNo18IHEkVSjHjChPC6rmdTZ2FD3xg==
X-Received: by 2002:a2e:9482:0:b0:2e2:1647:8308 with SMTP id
 c2-20020a2e9482000000b002e216478308mr6371165ljh.2.1715000424590; 
 Mon, 06 May 2024 06:00:24 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c1d8c00b0041bcb898984sm16077853wms.31.2024.05.06.06.00.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 06:00:24 -0700 (PDT)
Date: Mon, 6 May 2024 15:00:22 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: Ian Forbes <ian.forbes@broadcom.com>, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, martin.krastev@broadcom.com,
 maaz.mombasawala@broadcom.com
Subject: Re: [PATCH] drm/vmwgfx: Re-introduce drm_crtc_helper_funcs::prepare
Message-ID: <ZjjUZn_awQMqjnUR@phenom.ffwll.local>
References: <20240503222916.26552-1-ian.forbes@broadcom.com>
 <CABQX2QM=U+6HnO6k=3-=aV_katM20jOeDTWRAjiPSV_N_3Ktzw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABQX2QM=U+6HnO6k=3-=aV_katM20jOeDTWRAjiPSV_N_3Ktzw@mail.gmail.com>
X-Operating-System: Linux phenom 6.6.15-amd64 
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

On Fri, May 03, 2024 at 10:46:40PM -0400, Zack Rusin wrote:
> On Fri, May 3, 2024 at 6:29 PM Ian Forbes <ian.forbes@broadcom.com> wrote:
> >
> > This function was removed in the referenced fixes commit and caused a
> > regression. This is because the presence of this function, even though it
> > is a noop, changes the behaviour of disable_outputs in
> > drm_atomic_helper.c:1211.
> >
> > Fixes: 7b0062036c3b ("drm/vmwgfx: Implement virtual crc generation")
> > Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
> > ---
> >  drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
> > index 2041c4d48daa..37223f95cbec 100644
> > --- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
> > +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
> > @@ -409,6 +409,10 @@ static void vmw_stdu_crtc_mode_set_nofb(struct drm_crtc *crtc)
> >                           crtc->x, crtc->y);
> >  }
> >
> > +static void vmw_stdu_crtc_helper_prepare(struct drm_crtc *crtc)
> > +{
> > +}
> > +
> >  static void vmw_stdu_crtc_atomic_disable(struct drm_crtc *crtc,
> >                                          struct drm_atomic_state *state)
> >  {
> > @@ -1463,6 +1467,7 @@ drm_plane_helper_funcs vmw_stdu_primary_plane_helper_funcs = {
> >  };
> >
> >  static const struct drm_crtc_helper_funcs vmw_stdu_crtc_helper_funcs = {
> > +       .prepare = vmw_stdu_crtc_helper_prepare,
> >         .mode_set_nofb = vmw_stdu_crtc_mode_set_nofb,
> >         .atomic_check = vmw_du_crtc_atomic_check,
> >         .atomic_begin = vmw_du_crtc_atomic_begin,
> > --
> > 2.34.1
> >
> 
> Thanks, but that doesn't look correct. We do want to make sure the
> drm_crtc_vblank_off is actually called when outputs are disabled.
> Since this is my regression it's perfectly fine if you want to hand it
> off to me and work on something else. In general you always want to
> understand what the patch that you're sending is doing before sending
> it. In this case it's pretty trivial, the commit you mention says that
> it fixes kms_pipe_crc_basic and if you run it with your patch (e.g.
> sudo ./kms_pipe_crc_basic --run-subtest disable-crc-after-crtc) you
> should notice:

Rather aside, but atomic helpers supporting the ->prepare callback in that
special way is kinda a remnant of the conversion helpers to move legacy
kms drivers to atomic.

Which means we might want to look into whether anyone still needs that, or
whether the ->atomic_disable hook is enough and then nuke that if-ladder
of compat code. Because as this bug shows, it's rather surprising special
case :-/
-Sima

> May 03 22:25:05 fedora.local kernel: ------------[ cut here ]------------
> May 03 22:25:05 fedora.local kernel: driver forgot to call drm_crtc_vblank_off()
> May 03 22:25:05 fedora.local kernel: WARNING: CPU: 2 PID: 2204 at
> drivers/gpu/drm/drm_atomic_helper.c:1232 disable_outputs+0x345/0x350
> May 03 22:25:05 fedora.local kernel: Modules linked in: snd_seq_dummy
> snd_hrtimer nf_conntrack_netbios_ns nf_conntrack_broadcast
> nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet
> nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat
> nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 rfkill ip_set nf_tables
> snd_seq_midi snd_seq_midi_event qrtr vsock_loopback
> vmw_vsock_virtio_transport_common vmw_vsock_vmci_transport vsock
> sunrpc binfmt_misc snd_ens1371 snd_ac97_codec ac97_bus snd_seq
> intel_rapl_msr snd_pcm intel_rapl_common vmw_balloon
> intel_uncore_frequency_common isst_if_mbox_msr isst_if_common gameport
> snd_rawmidi snd_seq_device rapl snd_timer snd vmw_vmci pcspkr
> soundcore i2c_piix4 pktcdvd joydev loop nfnetlink zram vmwgfx
> crct10dif_pclmul crc32_pclmul crc32c_intel polyval_clmulni
> polyval_generic nvme ghash_clmulni_intel nvme_core sha512_ssse3
> sha256_ssse3 sha1_ssse3 drm_ttm_helper ttm nvme_auth vmxnet3 serio_raw
> ata_generic pata_acpi fuse i2c_dev
> May 03 22:25:05 fedora.local kernel: CPU: 2 PID: 2204 Comm:
> kms_pipe_crc_ba Not tainted 6.9.0-rc2-vmwgfx #5
> May 03 22:25:05 fedora.local kernel: Hardware name: VMware, Inc.
> VMware Virtual Platform/440BX Desktop Reference Platform, BIOS 6.00
> 11/12/2020
> May 03 22:25:05 fedora.local kernel: RIP: 0010:disable_outputs+0x345/0x350
> ... but in most cases it's not going to be so trivial. Whether you
> decide to work on this one yourself or hand it off to me - we don't
> want to trade bug for bug here, but fix both of those things.
> 
> z

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
