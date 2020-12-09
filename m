Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2A62D423D
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 13:39:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B65586E419;
	Wed,  9 Dec 2020 12:39:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DA4E6E419
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 12:39:46 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id d8so1171526otq.6
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Dec 2020 04:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3/0bk6VTruv3DfVf3Y4y/UsSVzdPBUpIs/1kbPWZm0k=;
 b=Ag0aeGNKdi3OBchP0J3GCXt12r4upplnXF5lNpQxVFFzvYEtlbzCT3OIYtomwOY9C0
 bbLpKGykmR3ce87s/wlwK88a4fa1g4YuDCqAcvB+CjYCRVa+vfY+pbPwkNCs4Sa28MBI
 N6L3Mm5IPZoNLeO8+2Jc0OaLO23v1EdLFpm6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3/0bk6VTruv3DfVf3Y4y/UsSVzdPBUpIs/1kbPWZm0k=;
 b=Ow51bjgjdRs/SqlTkyttJH4he+gsKS/BT1WM98BAcI3Rh9F5sExX6ISUhEUIWZA4UV
 nalP3HL/88nA0Tg4nY4fjri69DXO+Sclbw1PDmqRqIWSh2M0hlJoiiLZlZvRnYD8UKhL
 rv6+s6Oly5FPdumWy/1lUJHu2awO7+uzs9BXy6KmgUrd5MTbXv86CH4McQLpRjewWSnw
 /RKtOWOKvwvj0fWCkOVE0TKsmKplaFK0GOy8pz2PlLby2dJuQksyMxtcvrTPBwCEx/lW
 jnQc8cKDltGXPF3QX+TnH1ziC8SY3mYDobpsCfYSnRgyJX6XDHyGJCF9NPT/xb6Cy7JA
 2DDg==
X-Gm-Message-State: AOAM532/dET/AgvmB9weU8hauuFq5p3X58KtEk5kf03DA4hqcZJYjTVn
 ZcJdnfiIbEo4pCyZ2iNC9OoRcxNQP+vlF0bnDp+ekg==
X-Google-Smtp-Source: ABdhPJzLEl6x04f+ZeWv7APCFj/zoTHpm8dVBQmp3o4klpktJOAwjuAHjYJfehdZWhZgq4/jhYiCe8o5Zkt91PVv0CI=
X-Received: by 2002:a9d:470f:: with SMTP id a15mr1481808otf.303.1607517585945; 
 Wed, 09 Dec 2020 04:39:45 -0800 (PST)
MIME-Version: 1.0
References: <20201208135759.451772-1-tomi.valkeinen@ti.com>
 <20201208135759.451772-2-tomi.valkeinen@ti.com>
 <X8+h37/GM6K7q1mk@pendragon.ideasonboard.com>
 <20201209005134.GO401619@phenom.ffwll.local>
 <6a36125f-1852-1e92-2373-cc9684f54334@ti.com>
In-Reply-To: <6a36125f-1852-1e92-2373-cc9684f54334@ti.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 9 Dec 2020 13:39:34 +0100
Message-ID: <CAKMK7uFkqhhnROZYtTMENNo0iNorwTRAfiaNYswUUwzouj=PZA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm: add legacy support for using degamma for gamma
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
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
Cc: Yannick Fertre <yannick.fertre@st.com>,
 Philippe Cornu <philippe.cornu@st.com>, David Airlie <airlied@linux.ie>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sandy Huang <hjc@rock-chips.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 9, 2020 at 12:17 PM Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:
>
> Hi Daniel,
>
> On 09/12/2020 02:51, Daniel Vetter wrote:
>
> >>> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> >>> index ba839e5e357d..4d9e217e5040 100644
> >>> --- a/include/drm/drm_crtc.h
> >>> +++ b/include/drm/drm_crtc.h
> >>> @@ -1084,6 +1084,9 @@ struct drm_crtc {
> >>>      */
> >>>     uint16_t *gamma_store;
> >>>
> >>> +   bool has_gamma_prop : 1;
> >>> +   bool has_degamma_prop : 1;
> >
> > I'm a bit behind on patches, but in case this got missed please remove
> > this and replace with the (obj, prop) lookup function thing or something
> > like that. Makes sure everything stays in sync, plus like I said atomic
> > uses this a ton. So not a problem here.
>
> The drm_mode_obj_find_prop_id() is in core drm.ko, and not exported, but I need it also from
> drm_kms_helper.ko.
>
> drm_mode_obj_find_prop_id() is declared in drm_crtc_internal.h. Are those functions supposed to be
> not exported from drm.ko?
>
> So, is it fine to just export drm_mode_obj_find_prop_id? If I export, should I move it to
> drm_mode_object.h?

It's not exported to drivers so they don't play games in their own
ioctls or do something else than the atomic set/get_property hooks. I
guess we could export, but I think here the better solution is to lift
the legacy gamma compat function to core code status, since I think
that's the direction we want to go anyway. Bit more churn since the
name changes.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
