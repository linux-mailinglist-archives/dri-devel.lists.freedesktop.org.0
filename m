Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C16E1C85C31
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 16:26:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2299D10E2A7;
	Tue, 25 Nov 2025 15:26:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="cP/Ej8Uz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5119A10E2A7
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 15:26:52 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-644f90587e5so1905819a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 07:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1764084407; x=1764689207;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wCZdld6CYrWFXkrUxJ5abCqUL/Pa1DX9edqJLOysax8=;
 b=cP/Ej8Uz2rxZfEYxxiscV9ijVpbz4ysozBudk+msAa+IrDaHReJ8jWgUatOiDhWOmy
 HX70KDTLV82mWBFBWaq0+Z2Xhd3yLSMABYX6lqL7ZUXfD0QiYKYdXgh8w3vfMbf2mvc/
 O39m3Aa4yoOsg67iFmyeqVVC/n5HNlI9iYnU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764084407; x=1764689207;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wCZdld6CYrWFXkrUxJ5abCqUL/Pa1DX9edqJLOysax8=;
 b=Zxbjw3dosqusYfJf0z/fU7+7nxhh0W1BUHM5UeuTQ8GmaTXfI5/LsAjzHznto2nXH2
 IhzRVrSZaAGbBKsJHVaYA8ypm5k+faOMHOJAOmmxvFAs6HeDkVPNsF/m3D0tIZIL4SZ6
 U5ZdBd3fdymIq6wrIE/b9mKnmzMpjTXKQ1gpS060b5kR/0djJ3WUaBgnnUoNqZEHupXE
 hQpb348E8dQmZykO6PLsP6LuEXzBAhnx2bAPsiv+/AgQHYTqxa40eO6XCclZjPg1Kv23
 L4eCdRqKg1Owgm1nBxYqW50qWNTa4SAGz6N8bF09vXK3e96qIe0GD2tn2SKARlDMeC5J
 mHPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfG4nRQjkAp4vNVJ4ax+0FhWOlMqeSvkrSinmb2b7msBdYfq9+wkpX/l0PpsNH/kFnMHQovV6XRsA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGEV1Hbghap6s4HmsruxtRHA6Lyx62vF+nU48ynWCQBjowrX6Z
 bMGqqCsYpuyemMCoFGrGqyQIKtcjkztblAOjOZnzNoKTW082W6kGH7m5gMkyV+O6HjE6nk16MMf
 kEbxDUF2I
X-Gm-Gg: ASbGnctg+7hF2rk2H1xfDuvEZiYVjtkUY/B3A8572x7WHbUdBg+ckUqo23GOABluJfL
 P+qtBL9srSzjMRvIkgPNQPXj+Qb+H6EPq51OTlGUlJhnPk/Teuc1BIAV5r0U8wvphkNdJZzdG0V
 s3PxOX+8rETqrbzJtppxehoKnHSJM2im/kBJh9S9inqg5TabtU3UxjLCINntfBwKZq+yp4wuMYu
 pnKZzEuqDeDp2+ZlvwEOdWuzvZDt1JsnskDolkjnz2HhLryuu9HmZzD5doUe7TbobnzWYblhAQO
 SgFsJm9UgfxnQguw7QlfESDdFFzB6skeP132BUfyprjM1frr46WHO13DQCPrVGIbhCNhwIo+vlN
 m1ZxVlmCMHWeKpT8EbWX798BDn7wP6LoXrByiluLNw4afKcO62uwNu4o+6Ttl2LhpgXy+bdo1yf
 SRFvpt/wu+OfFvLci3R9YcXLpfc+mZCJJpVRCLM2a3+LNLPZKAPluty9u4/BBV
X-Google-Smtp-Source: AGHT+IEzSEAC/QBbHfs5lJmQpUrmttgcO37ZBucvtfi+c+BgqMKoJ6JBuu47sgCHe0SLJhjJ/G+ubg==
X-Received: by 2002:a17:907:928e:b0:b73:6dbc:39fc with SMTP id
 a640c23a62f3a-b76c551508emr352944166b.30.1764084407329; 
 Tue, 25 Nov 2025 07:26:47 -0800 (PST)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com.
 [209.85.221.52]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654d502cfsm1606460866b.19.2025.11.25.07.26.46
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Nov 2025 07:26:46 -0800 (PST)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-42b31507ed8so4793188f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 07:26:46 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXv/DlSfF0Nsfh8/jTMSW2Ezmg2jiEZhs3GIa2sMVRJ+xpVHAdkSV+ll71AD4UMN6HqaKwxAM9S2c0=@lists.freedesktop.org
X-Received: by 2002:a05:6000:381:b0:42b:3ad7:fdd3 with SMTP id
 ffacd0b85a97d-42e0f21e953mr3395597f8f.18.1764084405547; Tue, 25 Nov 2025
 07:26:45 -0800 (PST)
MIME-Version: 1.0
References: <20251125130634.1080966-1-tzimmermann@suse.de>
In-Reply-To: <20251125130634.1080966-1-tzimmermann@suse.de>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 25 Nov 2025 07:26:33 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X_-t2AF5osp7Hamoe7WYE_2YWJZCaPaOj=9seSbnwwVA@mail.gmail.com>
X-Gm-Features: AWmQ_bldhiBpRCqVYkj0GufunmE0LiqT8gw4vCTv4PiT8j1h28du9Cx4NWXFEj8
Message-ID: <CAD=FV=X_-t2AF5osp7Hamoe7WYE_2YWJZCaPaOj=9seSbnwwVA@mail.gmail.com>
Subject: Re: [PATCH 0/5] drm: Remove remaining support for kdb
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: simona@ffwll.ch, airlied@gmail.com, alexander.deucher@amd.com, 
 christian.koenig@amd.com, lyude@redhat.com, dakr@kernel.org, deller@gmx.de, 
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, 
 jason.wessel@windriver.com, danielt@kernel.org, 
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nir Lichtman <nir@lichtman.org>
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

On Tue, Nov 25, 2025 at 5:06=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Remove the rest of the kbd support from DRM. Driver support has been
> broken for years without anyone complaining.
>
> Kdb cannot use regular DRM mode setting, so DRM drivers have to
> implement an additional hook to make it work (in theory). As outlined
> by Sima in commit 9c79e0b1d096 ("drm/fb-helper: Give up on kgdb for
> atomic drivers") from 2017, kdb is not compatible with DRM atomic mode
> setting. Non-atomic mode setting meanwhile has become rare.
>
> Only 3 DRM drivers implement the hooks for kdb support. Amdgpu and
> nouveau use non-atomic mode setting on older devices. But both drivers
> have switched to generic fbdev emulation, which isn't compatible with
> kdb. Radeon still runs kdb, but it doesn't work in practice. See the
> commits in this series for details
>
> Therefore remove the remaining support for kdb from the DRM drivers
> and from DRM fbdev emulation. Also remove the hooks from fbdev, as
> there are no fbdev drivers with kdb support.
>
> If we ever want to address kdb support within DRM drivers, a place to
> start would be the scanout buffers used by DRM's panic screen. These
> use the current display mode. They can be written and flushed without
> mode setting involved.
>
> Note: kdb over serial lines is not affected by this series and continues
> to work as before.
>
> Thomas Zimmermann (5):
>   drm/amdgpu: Do not implement mode_set_base_atomic callback
>   drm/nouveau: Do not implement mode_set_base_atomic callback
>   drm/radeon: Do not implement mode_set_base_atomic callback
>   drm/fbdev-helper: Remove drm_fb_helper_debug_enter/_leave()
>   fbcon: Remove fb_debug_enter/_leave from struct fb_ops

Personally, I've never worked with kdb over anything other than
serial, so this won't bother any of my normal workflows. That being
said, at least as of a year ago someone on the lists was talking about
using kdb with a keyboard and (presumably) a display. You can see a
thread here:

http://lore.kernel.org/r/20241031192350.GA26688@lichtman.org

Daniel may also have comments here?

-Doug
