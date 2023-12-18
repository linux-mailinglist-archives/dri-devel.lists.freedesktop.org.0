Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBF88179D5
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 19:40:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F175C10E3A4;
	Mon, 18 Dec 2023 18:39:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A8110E066
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 18:36:42 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-54ba86ae133so3162459a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 10:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1702924601; x=1703529401;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nM0rc7/LDh8NwvQblcAD/SfzUIDE9JpJzu1fXo/7n0Y=;
 b=a3KsF6HCWqSZOPKHwO74fU+q8VCzYftiX4mF4U4qOD935L9/Xt8HpGlJbpJdSb7RfX
 jZGdQ6sAamdTsKhu595MjHkhHHgCVjw5ZvLDhN9E1RyaKCzNBU4v/dWApIoQo7b94OP6
 Gn5/0wYPgpCWAavQNqlUIRAmX/8jcnntcgYdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702924601; x=1703529401;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nM0rc7/LDh8NwvQblcAD/SfzUIDE9JpJzu1fXo/7n0Y=;
 b=o8QNLo3Px8IAajTbY4WT876PmUExj8rsYKgC0CLIElil1MU2hIv3veVgdSC7QYzzTO
 YjLLIFk46QFKNUzg/4LHlHj+2h9oPlMFJxCuaHXfmV0oVDiIwdEMEETIHi8qkThSNUuy
 f5gp/6/QOY2OGZJULdl0mpQSGMZSYZWT+Vj0rgH2AVz/D1Wh1bnvX2m8SzC+aCpK+mPF
 7u4oYCj9SiVo7yNrH3FjhTactNKhCXM0x2UC4S5d7gaNeeEtWXNKDW0l4RlpAMuryaIy
 teygBuydV7ZNjjZtGP7Xxo+6d8G8xufAi/63J+beoOnLdYUOUSiDLXjwlXFa2NuwFecR
 VVjg==
X-Gm-Message-State: AOJu0Yy6ulNn0GmWfeDsrjJDEuyGCq1D4KzZ8NYPVEHBHeNZQAjYvSdm
 97uyI5dcVwZBG3PX1mC6ymhUdlWZXot5vpo6l12M07wq
X-Google-Smtp-Source: AGHT+IH0Q2Huf7P0pb6wp2BTJvaqhT45z0lfICOBVWhpuJIxDRzCvfxfuBhvE7fP7FdyIW+bDIlRJg==
X-Received: by 2002:a05:600c:3501:b0:40c:6b9c:eb49 with SMTP id
 h1-20020a05600c350100b0040c6b9ceb49mr3084742wmq.95.1702918051868; 
 Mon, 18 Dec 2023 08:47:31 -0800 (PST)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com.
 [209.85.128.53]) by smtp.gmail.com with ESMTPSA id
 k10-20020a170906680a00b00a236193fe3esm868009ejr.96.2023.12.18.08.47.29
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Dec 2023 08:47:29 -0800 (PST)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-40c38e520e2so100865e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 08:47:29 -0800 (PST)
X-Received: by 2002:a05:600c:3b03:b0:40d:174c:9295 with SMTP id
 m3-20020a05600c3b0300b0040d174c9295mr213133wms.3.1702918048764; Mon, 18 Dec
 2023 08:47:28 -0800 (PST)
MIME-Version: 1.0
References: <20231214123752.v3.1.I9d1afcaad76a3e2c0ca046dc4adbc2b632c22eda@changeid>
In-Reply-To: <20231214123752.v3.1.I9d1afcaad76a3e2c0ca046dc4adbc2b632c22eda@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 18 Dec 2023 08:47:16 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VtGN-qU-jqHsD0XpPc5uJwm2xd_rO+ueR_PqK-VJcukQ@mail.gmail.com>
Message-ID: <CAD=FV=VtGN-qU-jqHsD0XpPc5uJwm2xd_rO+ueR_PqK-VJcukQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/bridge: parade-ps8640: Never store more than
 msg->size bytes in AUX xfer
To: dri-devel@lists.freedesktop.org
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Philip Chen <philipchen@chromium.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Guenter Roeck <groeck@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Dec 14, 2023 at 12:38=E2=80=AFPM Douglas Anderson <dianders@chromiu=
m.org> wrote:
>
> While testing, I happened to notice a random crash that looked like:
>
>   Kernel panic - not syncing: stack-protector:
>   Kernel stack is corrupted in: drm_dp_dpcd_probe+0x120/0x120
>
> Analysis of drm_dp_dpcd_probe() shows that we pass in a 1-byte buffer
> (allocated on the stack) to the aux->transfer() function. Presumably
> if the aux->transfer() writes more than one byte to this buffer then
> we're in a bad shape.
>
> Dropping into kgdb, I noticed that "aux->transfer" pointed at
> ps8640_aux_transfer().
>
> Reading through ps8640_aux_transfer(), I can see that there are cases
> where it could write more bytes to msg->buffer than were specified by
> msg->size. This could happen if the hardware reported back something
> bogus to us. Let's fix this so we never write more than msg->size
> bytes. We'll still read all the bytes from the hardware just in case
> the hardware requires it since the aux transfer data comes through an
> auto-incrementing register.
>
> NOTE: I have no actual way to reproduce this issue but it seems likely
> this is what was happening in the crash I looked at.
>
> Fixes: 13afcdd7277e ("drm/bridge: parade-ps8640: Add support for AUX chan=
nel")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Since the patch fixes a crash, has two Reviews (even if they're both
from @chromium), and doesn't seem controversial, I didn't want a full
week and just landed it in drm-misc-fixes. If anyone is upset by this
then please shout and we can revert or I can post a followup patch.

3164c8a70073 drm/bridge: parade-ps8640: Never store more than
msg->size bytes in AUX xfer
