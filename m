Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F44BB7CBF9
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 14:09:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8325E10E36E;
	Wed, 17 Sep 2025 07:59:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CFurJJZD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E52810E36E
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 07:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758095968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l2Odf0JqT6IW+0j+h0HfBehCW13u+SOfoRFqc2wWIwk=;
 b=CFurJJZDfGM330a4ZKY+Z+MRtwfGp7UWz3MRjcIfBJwjF7a68AQASmz66/PR/Fs41PAndR
 61rc7x61c77B4shwomHg36RL60vUVEhxjo9dnEZS1+sZRBoHYofs8XBrWTg50puijlBWfI
 efXYjK0OitTsxxO9ejBRLOwRv4fRQuo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-0Dz0crNkMImMZwBZ2My9dg-1; Wed, 17 Sep 2025 03:59:26 -0400
X-MC-Unique: 0Dz0crNkMImMZwBZ2My9dg-1
X-Mimecast-MFC-AGG-ID: 0Dz0crNkMImMZwBZ2My9dg_1758095965
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3eae0de749dso1830523f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 00:59:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758095965; x=1758700765;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l2Odf0JqT6IW+0j+h0HfBehCW13u+SOfoRFqc2wWIwk=;
 b=qIEhD5E9nN4XciJIHA5qMiKeTYbuVp7IqUj01wSeeGKDGvOANiV2ESVzWXt/78McdJ
 oY1+aIF0XFd4ND6uJh03csf7dAnLxNVaGR9GKUDxuQzZeOE5E844J41hJnBDrsHJu87/
 xJzf8SuLzMsoWYtfgbiTjSol//3S99moVsvDikzFPHK14vAre1/fHmi9a7HeiRde9veu
 A46ncnpnkyOsX1j7nnxkfE6ngxzPgkupaaePgT30M9z4KMKumKng+sW5zJ3/s/2h+zZc
 tag/w1fDSVh0dclNiCw1aOYcww8xe/K2j1OPl2aWB4NDdgwWloyQDStJMj6E1RSsZib6
 W53Q==
X-Gm-Message-State: AOJu0Yyfy/KI5GXmDu9KYb3JUDnAiMF106gYJL9KZdLQwve+HLw6eiXp
 XhuRzSZRxknQBpfT7LGUR/L+t6YD0/hSdpmSf+2LTCkO1O4VLmPkn+K4INTt2L5HGDQJc6N0YEm
 SCZUwAqeeV/Ps7lA1w3/SO+3EjvHEifUeh0kvA/Yk3A8IOU0qh8MvIr+lYvgqEOre3NR0dg==
X-Gm-Gg: ASbGnct9xJpOyqG2ZxEpVnyCX/SVzl9hiZjJbybiL1iMDZ1+98noCWLHYKZEEaEa7xz
 G6n1mrQpMBSMCizk5hAIwFLeN0goivrM+K5p/7VBZRXw5rFkL/i/Eg7aTZCqximR5jFqUa9a7rQ
 tnF0tFsEfXBBA1GG6brVAE3eXf8/dwEPO8uCR9gSVuY+lH1sCKtgCYYDmUoUbQWgr6kCMQGDvP5
 TQsjnlz/DES/sNaScWMwo9BQxqhv9xwXPkB9KF6/orPipA9LkqZmlJuw9kOyp/5qqbu67LpO72R
 Q6U9E2SrPerXX9M+SBZ/mRZqrvoyaRfEnCOrlXgKPR+j9U0iqDbz4N+zn7b397h7nYzTIAqHkPv
 dx6HanoY+hy2ExfqqdAmrLg==
X-Received: by 2002:a05:6000:4211:b0:3ea:63d:44ca with SMTP id
 ffacd0b85a97d-3ecdfa1490fmr977329f8f.32.1758095965116; 
 Wed, 17 Sep 2025 00:59:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLZDbLwvhUEeDqRK2yysUJaOHVJhPbbmdwCVM6sKR+SFVeK3ZrxH58uRvVRPwa5gZ93oWPFQ==
X-Received: by 2002:a05:6000:4211:b0:3ea:63d:44ca with SMTP id
 ffacd0b85a97d-3ecdfa1490fmr977310f8f.32.1758095964676; 
 Wed, 17 Sep 2025 00:59:24 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45f32674bf8sm32116455e9.11.2025.09.17.00.59.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Sep 2025 00:59:24 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/3] drm/sysfb: Lookup blit function during atomic check
In-Reply-To: <20250908122240.740033-3-tzimmermann@suse.de>
References: <20250908122240.740033-1-tzimmermann@suse.de>
 <20250908122240.740033-3-tzimmermann@suse.de>
Date: Wed, 17 Sep 2025 09:59:22 +0200
Message-ID: <87a52tpl0l.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5VqWnD1dLO_MSn_yUDweAkNAZM8dU9c6f7_lQJkrCXw_1758095965
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Some configurations of sysfb outputs require format conversion from
> framebuffer to scanout buffer. It is a driver bug if the conversion
> helper is missing, yet it might happen on odd scanout formats. The old
> code, based on drm_fb_blit(), only detects this situation during the
> commit's hardware update, which is too late to abort the update.
>
> Lookup the correct blit helper as part of the check phase. Then store
> it in the sysfb plane state. Allows for detection of a missing helper
> before the commit ihas started. Also avoids drm_fb_blit()'s large switch

"commit has"  

> statement on each updated scanline. Only a single lookup has to be done.
>
> The lookup is in drm_sysfb_get_blit_func(), which only tracks formats
> supported by sysfb drivers.
>
> The lookup happens in sysfb's begin_fb_access helper instead of its
> atomic_check helper. This allows vesadrm, and possibly other drivers,
> to implement their own atomic_check without interfering with blit
> lookups. Vesadrm implements XRGB8888 on top of R8 formats with the
> help of the atomic_check. Doing the blit lookup in begin_fb_access then
> always uses the correct CRTC format on all drivers.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

