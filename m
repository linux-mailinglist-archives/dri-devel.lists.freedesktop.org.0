Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43982B59402
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 12:46:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0806210E7B4;
	Tue, 16 Sep 2025 10:46:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="ijIglfya";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B6DF10E7B1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 10:46:17 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id
 af79cd13be357-80e2c527010so336126385a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 03:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1758019576; x=1758624376;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qC0p3554k0ILiI1ThcPEwrxZpoZgtvHtQQDToFyMdLY=;
 b=ijIglfyakuPGTdjy3Xgzvb6JxgftOaftpBuUs5GcgE+ajO93ZRqhlQahxWhFxOkPJY
 CUVnZBvvlqCEML6HGAG/9ZF7g7DiP//MqePuY50fxCjts6CXAWS2KwVMqrMVIS5nrtRY
 t9Wc56I4vJKzcRmWmHDTfAEAX+HD/bPbEvnPAIGooj7ra1Bv4/zUCyCYQp0BPUm2LXYD
 OJOUUqXQnOnqbB7V4ZLk+N+w8V1KFZtA/caMyiXsy5Kl8XHuTVoTBDQYxYQ5AYukHA41
 RiNbiZjY/P8KFeJDjbivtiNoO3u1Py86PhF5k+serhnZiq8iKd5EjKK9YVwVFTfKk8oV
 qCVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758019576; x=1758624376;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qC0p3554k0ILiI1ThcPEwrxZpoZgtvHtQQDToFyMdLY=;
 b=hYK8MeeO9hoT8jL8WbJpTF+NmiTSyFYYjTseOlh6sVNqklLXTponInxCeWkeNcmqO1
 pHApCIrfc/v2eMOjg5Y6M5vwH0XkQ4DfSk1gF2SOq9/O98vVfFEkC20cmGUuXLVIMjU2
 kVsLeteon2BouRDnHSMv1zA1gKr9HR8kNOvtnae7BFtefvevrZgx0f7ii2iIpko0S4LQ
 5vCiZJO6wawOFHMT+N7rZuFnRMyp46UGjf2pm+g5HIqFJ4C3ry1QR9c5nqw3gnB+GMBC
 3OfuWQffeH9JCcbHBFoFE5Cqoze+jgv0DW4ZiQqXJWg8/i/GI6ZimTPeyaZBhH14uYiY
 C8UQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZwlyyNHNeHBuC4hSvUcHs3Zrz9JNOhnUOxYIAXzRb+UjMLxyBWmAgFWhvXjflOITGFPZ+i9+rZrU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQbsW9HXG54KvysytQLF6jKqZw2aknKtgIlB4Ay4xhWNA6Z3Lw
 sXoE9sIWbi6hAGZWrstLN9VTssF+07l0uoXs1UZj1ze/Qdq6IuGIt7RnS6pI1s4ZqcW+2QjHf++
 zyK03C1kOGIvlbiPYyqxdSovDAjn4EpH7U6m2+WUhViBKDxL2CZI2up+TeA==
X-Gm-Gg: ASbGncvWFCRAOD7OohFLk6/XfDf3ZzHoTOp/JVZohavpn8XkTCzOUa/dgyiPUZGBuem
 iYNlXRFeQCh0bju0hcqqNQZjW19TRzScZhZj9MunQAhJ66NRjomfE0BDTOLKEM/D1WbngfJyPRy
 Jf7IJ2AO1ODCld7P7Qhd42XXIPCxSRjlGkS8xTFHdSQYoIYZctJJvvJPUXZlcMCG7v7sAeSX/Ri
 6E+B3B9nyI/M7XDqAk7x8FJ6k2beOt1cR+IEDGzzw==
X-Google-Smtp-Source: AGHT+IHLMQNS/TiUzJuO4yJweDohTVUZKFl0iq/0IGyrwggdlrJ5r+wf2k3Tv3E12/UcEXiU7eIrpvFoqr2IQ89Tkt0=
X-Received: by 2002:a05:620a:4626:b0:82a:8f4c:2d27 with SMTP id
 af79cd13be357-82a8f4c32a9mr670525285a.40.1758019576337; Tue, 16 Sep 2025
 03:46:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250911130739.4936-1-marius.vlad@collabora.com>
 <20250911130739.4936-4-marius.vlad@collabora.com>
 <ssvxorsrhum2eo2uiieradrrmytemivr6m5c3mskalehzaj4ci@nc74epxgjq5w>
 <aMMDxIWN9TadgVyw@xpredator>
 <6zmp2dzpvcb4hi4kaa66q5o4rlcpdkor75ci4rnvalt2a37f26@lbmvc4t2ow4z>
 <CAPj87rNxGfroKTf1i5UtmmnZ9wDQTdZFDMKw-MLdbCfjTCD=Uw@mail.gmail.com>
 <20250916-piquant-jerboa-of-completion-87b80d@houat>
In-Reply-To: <20250916-piquant-jerboa-of-completion-87b80d@houat>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 16 Sep 2025 11:46:04 +0100
X-Gm-Features: AS18NWDVFmh2ACMW-t96-awld4AdSmcudSY-yS7GMOHlE34fcn7sRnOGXt05EsE
Message-ID: <CAPj87rMuwvir_aDReT1ou-BNs3w9coUG6MPmCnGAeg5rQ97rCQ@mail.gmail.com>
Subject: Re: [PATCH 3/8] drm: Add new general DRM property "color format"
To: Maxime Ripard <mripard@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Marius Vlad <marius.vlad@collabora.com>, dri-devel@lists.freedesktop.org, 
 wse@tuxedocomputers.com, andri@yngvason.is, sebastian.wick@redhat.com, 
 daniel.stone@collabora.com, jani.nikula@linux.intel.com, tzimmermann@suse.de, 
 simona.vetter@ffwll.ch, harry.wentland@amd.com, christian.koenig@amd.com, 
 derek.foreman@collabora.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, 16 Sept 2025 at 09:29, Maxime Ripard <mripard@kernel.org> wrote:
> On Mon, Sep 15, 2025 at 12:33:08PM +0200, Daniel Stone wrote:
> > Quite possibly just a failure to display. Same as if the driver
> > guesses it wrong - including for reasons it can never statically
> > detect (e.g. buying a 10m-long uncertified HDMI cable which drops
> > signal, or having the cable pulled around a 90=C2=B0 bend making it ver=
y
> > marginal for transmission).
>
> I guess there's two cases for "not supported by the display"?
>
> If the display reports that it supports a format but is broken, yeah,
> there's not much we can do except maybe add a quirk.
>
> But if it's that the monitor doesn't support that format in the first
> place, we should just reject that commit.
>
> Just like we don't let any mode go through if we know it's obviously
> wrong (like if it exceeds max_tmds_clock) but can't indeed account for a
> long / broken cable.
>
> > > I'm trying to point out that this complicates userspace: it is now
> > > required to handle EDID and non-EDID cases for no practical reason. F=
or
> > > all other usecases it is enough to query available modes from the
> > > kernel.
> >
> > But not 'now', because that's been happening for years. And not 'no
> > practical reason', because in order to support features the kernel has
> > no involvement in (colour management and HDR as a large part), you
> > need to see the full EDID.
>
> I guess it's still slightly different when we're talking about opt-in
> features like VRR or HDR, and "just get something on my screen".

Yeah, I absolutely agree (as with the quoted parts as well) - the
kernel should absolutely just get stuff on the screen.

> Introducing a dependency on libdisplay-info for the latter is still
> something new, but I guess you can always YOLO it, try a format and see
> if it works.

Again though, it's not something new. I promise you that Weston (for
over a year), Mutter (for about a year), KWin (for over two years),
and wlroots (for two and a half years) already have hard deps on
libdisplay-info. Even outside of 'serious' compositors, Mesa requires
it to support HDR in VK_KHR_display (when it was added a couple of
months ago),

Cheers,
Daniel
