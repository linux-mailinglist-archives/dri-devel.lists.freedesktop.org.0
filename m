Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4355A65F3A0
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 19:22:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6105110E196;
	Thu,  5 Jan 2023 18:22:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8869210E196
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 18:22:18 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id q64so2252479pjq.4
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 10:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ol5Lt2XQiuGIXtfwmpPBwEmqpCu54lrX3kJGijNzR80=;
 b=M0GsXA3zHPW/vX6nqhv3n9ePxFy/ysmv1+os9eyM85XvobijyMjZjxrx1Ax+vBNv88
 JQQkvjrGfsVJp+P8JkNlX3PEslL++yM9gK84QPS6RwRwTXMfcaUrLDR1KVU/tpOdgXyU
 MNTAjbAZwwnlo0/9B1DgoAR72Q6diMBUKeARA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ol5Lt2XQiuGIXtfwmpPBwEmqpCu54lrX3kJGijNzR80=;
 b=7mZRj5O3cQ0nU1QHSEP2OKfG3RFFBDWX5pgxYfJed7vLOV8DDdyeGdsrVkxQYz9uQB
 qY0PHCXHjjonyMxkq39C0+a80c1hWCjoQ6knh81RIiILDKLAXr4X4Iw5WtafaOUdNoD9
 yaVbk2XRmUxY0CaXipGriRovrgzSvgyJGC8DSdRoF3Xqaa+eoquxgcsXesWMrJs/6PzF
 YV9VeKhxe7wAKb0fGctZdwQZFN08O2afF46iwBb/6uyLT8srew69o0Bfy/s+zj9ITmx+
 kRty8bqaIw4UEe2kCgdMR163bChrI45Po1TRw36mGbq1mL81iiwQMWnPtydEtpTwJ7VJ
 ucOw==
X-Gm-Message-State: AFqh2kp3hpJQykWXx91gozYY8bL/Mfpnr3Y3qpyudfIj6gcldvPh4fNY
 KSm0w3/VFYpxHNIMB+w65uoWV/Zc/gWdJZ9pCts0sg==
X-Google-Smtp-Source: AMrXdXvJIpbdpipMOFdy7tJBAQ4NnLVZz70bmSLgsK2Z0qxQZB59/2RqVGuN7DYedWx9FWj8OvUuQACx47/+mgtP/94=
X-Received: by 2002:a17:902:b902:b0:190:e27b:b554 with SMTP id
 bf2-20020a170902b90200b00190e27bb554mr3196852plb.148.1672942938186; Thu, 05
 Jan 2023 10:22:18 -0800 (PST)
MIME-Version: 1.0
References: <20230103125322.855089-1-mcanal@igalia.com>
 <Y7bsKFCIOgauVbII@phenom.ffwll.local>
 <7104fc80-f996-8fce-eb72-b29ba4ff438e@igalia.com>
In-Reply-To: <7104fc80-f996-8fce-eb72-b29ba4ff438e@igalia.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 5 Jan 2023 19:22:05 +0100
Message-ID: <CAKMK7uHZcLc1UYD44Zpi2wkrkuKAWXpQZKtdy4wwMW9wqJJ_og@mail.gmail.com>
Subject: Re: [PATCH] drm/gem: Check for valid formats
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Melissa Wen <mwen@igalia.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 5 Jan 2023 at 18:48, Ma=C3=ADra Canal <mcanal@igalia.com> wrote:
>
> On 1/5/23 12:26, Daniel Vetter wrote:
> > On Tue, Jan 03, 2023 at 09:53:23AM -0300, Ma=C3=ADra Canal wrote:
> >> Currently, drm_gem_fb_create() doesn't check if the pixel format is
> >> supported, which can lead to the acceptance of invalid pixel formats
> >> e.g. the acceptance of invalid modifiers. Therefore, add a check for
> >> valid formats on drm_gem_fb_create().
> >>
> >> Moreover, note that this check is only valid for atomic drivers,
> >> because, for non-atomic drivers, checking drm_any_plane_has_format() i=
s
> >> not possible since the format list for the primary plane is fake, and
> >> we'd therefor reject valid formats.
> >>
> >> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> >> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> >
> > Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >
> > I think to really make sure we have consensus it'd be good to extend th=
is
> > to a series which removes all the callers to drm_any_plane_has_format()
> > from the various drivers, and then unexports that helper. That way your
> > series here will have more eyes on it :-)
>
> I took a look at the callers to drm_any_plane_has_format() and there are =
only
> 3 callers (amdgpu, i915 and vmwgfx). They all use drm_any_plane_has_forma=
t()
> before calling drm_framebuffer_init(). So, I'm not sure I could remove
> drm_any_plane_has_format() from those drivers. Maybe adding this same che=
ck
> to drm_gem_fb_init() and refactor the drivers to make them use drm_gem_fb=
_init(),
> but I guess this would be part of a different series.

Well vmwgfx still not yet using gem afaik, so that doesn't work.

But why can't we move the modifier check int drm_framebuffer_init()?
That's kinda where it probably should be anyway, there's nothing gem
bo specific in the code you're adding.
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
