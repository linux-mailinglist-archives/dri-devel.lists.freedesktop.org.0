Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BABEB5154B
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 13:18:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 218F710E8D8;
	Wed, 10 Sep 2025 11:18:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FYAnntRH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9D0E10E8D8
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 11:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757503085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mQNBoOyxmrq7spEGbUcgPjGs/vcAB6E3uxzpwOuMRrA=;
 b=FYAnntRHhBm80kluW2lCbsIPcKYnU3R8bbLLZMhQWfjDzrAc0rnNYw4uPws+wMuBWCBa5O
 IvDm8SBbwanuY56KPVV6wL7kI9sQIv0IRemstn0O4JuBioiuFDBNSuyezxld/ItkoLbWSy
 z8TCNDjiY8wBPHs2SiRTO2lGUou1MfY=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-199-g-zMrrP3OjeDmZBw3va3Yg-1; Wed, 10 Sep 2025 07:18:03 -0400
X-MC-Unique: g-zMrrP3OjeDmZBw3va3Yg-1
X-Mimecast-MFC-AGG-ID: g-zMrrP3OjeDmZBw3va3Yg_1757503082
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b471737c5efso4905309a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 04:18:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757503082; x=1758107882;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mQNBoOyxmrq7spEGbUcgPjGs/vcAB6E3uxzpwOuMRrA=;
 b=osHpjL3TMT4aZQvAMqHt87VdvMsNjai2E/aecIokxqesdX2kbv2YJFp1wLfksWjFND
 jbGp+Ne7U8db7zivrdj9jY1AKUiVVIn9wRPD1qeS2P921U4nR7p33HND/ciN9hQtYYC+
 uSrXNCovDW/7N/gLoWg5OSmSNS26lGGddTQ2MpdBAB6OkGz5n9aggA67hwsCgXTIWnpF
 FC3sI3qhHU5kEJ9o2c7RQKnooTz5GMma9+fijmkH3A137XPN+5LgiUZLGO4OjSqnHui/
 INwetolJ65GUnuZJrhawKguD8lgIIruoBHikqki2W3zI6yEV3sYuavmSRWn3Vj4Sxb3j
 N+FQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUm8XjXf76fACkG4pu4CDWt5SDldt7riu5RA0ZSjtUViwK+whXNLv9SyqQOsCBAdk0aErpHcf/wK2c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzelk+JWQkcgvvbR/f14s0tnzMFU7x7nbwBLPSpg/3Bq95U7lho
 f9kpsC6YPhgBCrrJG9bDRtk7sqlcTcbql7OTkhmF7lp1LrSH8TLob53KMg47VN0xjpjI+yp+Q78
 XIgit/feW/K6Nvny5mw1VxEeDF8ZijuWS+ZMZHiGMPSKn0CbRyQMqORn88wnsnHo+htZ4Kw==
X-Gm-Gg: ASbGncssfbl2cEZ2CfNDEjOoGHtKrx24xCflH394vK5JPrRlufl324i4br/ftoS6tGz
 H410Zmg/SjF2UwXccxGfvTFbXWnjlxb4RWRF9AhlN7WbblYIXgeT+8UGeK4KK98/xwPWzwk6DQ0
 d6itFWSO10efzfJm1gg2A9meihu1Se0vwns1QjSc/mqlkUvMZ/1/ylTH6oeB7JueRxwQiDMYrm9
 6qekCfGiOdZVQNLy+6T92H0GBvZ9IDjx3Idn9vieg11fL1pxcDONHc1j2Ee0j2GeDSZZncg14vw
 kkDzVWikDka0yPYKkg9POJKfJl+JjOWrlSA=
X-Received: by 2002:a05:6a20:6627:b0:246:3a6:3e3f with SMTP id
 adf61e73a8af0-2534775e1c2mr14891252637.60.1757503081746; 
 Wed, 10 Sep 2025 04:18:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiMrvxjVgffC7DE9f/8FL4eREAcsUy0lGs5oMB5Ba2E8pPpwmAdota/m2q4TuNtlgFN8rhwQ==
X-Received: by 2002:a05:6a20:6627:b0:246:3a6:3e3f with SMTP id
 adf61e73a8af0-2534775e1c2mr14891224637.60.1757503081330; 
 Wed, 10 Sep 2025 04:18:01 -0700 (PDT)
Received: from zeus ([2405:6580:83a0:7600:6e93:a15a:9134:ae1f])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-774662905bcsm4934270b3a.51.2025.09.10.04.17.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 04:18:00 -0700 (PDT)
Date: Wed, 10 Sep 2025 20:17:56 +0900
From: Ryosuke Yasuoka <ryasuoka@redhat.com>
To: Ian Forbes <ian.forbes@broadcom.com>
Cc: zack.rusin@broadcom.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, jfalempe@redhat.com,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH drm-misc-next v2 1/1] drm/vmwgfx: add drm_panic support
 for stdu
Message-ID: <aMFeZG9_CvWX9vz-@zeus>
References: <20250908141152.221291-1-ryasuoka@redhat.com>
 <20250908141152.221291-2-ryasuoka@redhat.com>
 <CAO6MGtiOuQhGcHUjDjcYwnDrcZOWy9yM_kFwhxcTfbB-_OHQvA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAO6MGtiOuQhGcHUjDjcYwnDrcZOWy9yM_kFwhxcTfbB-_OHQvA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dPLNVQOxN2yJLkXeiNZ3WtgCj6kXjNakMPDLFFuAfsI_1757503082
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 09, 2025 at 03:48:01PM -0500, Ian Forbes wrote:
> On Mon, Sep 8, 2025 at 9:12 AM Ryosuke Yasuoka <ryasuoka@redhat.com> wrote:
> 
> > +static int
> > +vmw_stdu_primary_plane_get_scanout_buffer(struct drm_plane *plane,
> > +                                         struct drm_scanout_buffer *sb)
> > +{
> > +       struct drm_plane_state *state = plane->state;
> > +       struct drm_crtc *crtc = state->crtc;
> > +       struct vmw_private *dev_priv = vmw_priv(crtc->dev);
> > +
> > +       if (!plane->state || !plane->state->fb || !plane->state->visible)
> > +               return -ENODEV;
> > +
> > +       sb->format = plane->state->fb->format;
> > +       sb->width = plane->state->fb->width;
> > +       sb->height = plane->state->fb->height;
> > +       sb->pitch[0] = plane->state->fb->pitches[0];
> > +
> > +       u64 size = sb->height * sb->pitch[0];
> > +
> > +       sb->map[0].vaddr = memremap(dev_priv->vram_start, size, MEMREMAP_WT);
> > +
> > +       if (!sb->map[0].vaddr)
> > +               return -ENOMEM;
> > +
> > +       return 0;
> > +}
> > +
> > +static void vmw_stdu_primary_plane_panic_flush(struct drm_plane *plane)
> > +{
> > +       vmw_ldu_primary_plane_panic_flush(plane);
> > +}
> > +
> >  static void
> >  vmw_stdu_crtc_atomic_flush(struct drm_crtc *crtc,
> >                            struct drm_atomic_state *state)
> > @@ -1506,6 +1538,8 @@ drm_plane_helper_funcs vmw_stdu_primary_plane_helper_funcs = {
> >         .atomic_update = vmw_stdu_primary_plane_atomic_update,
> >         .prepare_fb = vmw_stdu_primary_plane_prepare_fb,
> >         .cleanup_fb = vmw_stdu_primary_plane_cleanup_fb,
> > +       .get_scanout_buffer = vmw_stdu_primary_plane_get_scanout_buffer,
> > +       .panic_flush = vmw_stdu_primary_plane_panic_flush,
> >  };
> >
> >  static const struct drm_crtc_helper_funcs vmw_stdu_crtc_helper_funcs = {
> > --
> > 2.51.0
> >
> 
> You only need the code I've highlighted in this reply with some minor changes.
> 
> 1. You can call `vmw_kms_write_svga` directly in `panic_flush`. There
> is no need to mark the buffer as dirty or send any commands.

In my test environment, it will be unstable without dirty command's
submission. In test environment, which is Virtual box, I've
observed serveral instances of the panic screen appearing.
It sometimes appears immediately as expected, and at other times,
there's a delay of about 15 to 20 seconds to appear the screen.
Another pattern, it's necessary to switch back and forth between
the Virtual Box console window and other windows.

With command submission, we can stably get a panic screen. Even if it
failed due to some reasons, we may get the panic screen ultimately. So I
think we should leave vmw_kms_ldu_panic_do_bo_dirty() to submit
commands.

What do you think?

> 2. The format should be hardcoded to RGB565 to minimize the risk of
> overrunning VRAM. Adjust the pitch accordingly to 2x width.

I see. drm panic supports multiple pitches. Checking pitch type 
in get_scanout_buffer is not difficult.

> 3. The sizes should be vmw_priv->initial_width, and
> vmw_priv->initial_height. These are the safe sizes for VRAM in early
> boot and will work in panic as well.

OK. I'll try to change this.

> 4. You want to ensure `get_scanout_buffer` only succeeds once when
> using display unit 0 since all calls to this function will return the
> same VRAM.

OK. I'll add a check in get_scanout_buffer. To confirm this, Is it
sufficient to check if lds->num_active is 1, or do I need to check
other places or values?

> 5. memremap flags should be `MEMREMAP_WB | MEMREMAP_DEC`

OK. I'll chenge the flag like this.

> 6. Move the panic related functions to the vmwgfx_kms.c files since
> they work in all DU modes.

OK. I'll try to move them in vmwgfx_kms.c

Thank you for your review and detailed comment.

Ryosuke

