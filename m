Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2F5859ED4
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 09:53:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA83810E1BF;
	Mon, 19 Feb 2024 08:53:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="a4OcECBy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D32A610E078
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 04:45:52 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-41263e8b7f8so5462835e9.2
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Feb 2024 20:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1708317951; x=1708922751;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a7y1laujVjSrryFs6iJ5GCZwVB/NRNVw3uguZLpIQqk=;
 b=a4OcECByUr2EcA+3S0+OVTAPA5JBnbG2F5ZVWdDU1jgwnLfqBS3rhQvjok5/oidR3y
 11i97wq5ZJHSb+i1YiliB5qHlUWARqpxg+TASVVJDa+QI8wC0K1NivrmZLZNkzajRSfm
 ZmxtssF2KIgLlytXrf1N+qFQyXE2HGWQtLI00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708317951; x=1708922751;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a7y1laujVjSrryFs6iJ5GCZwVB/NRNVw3uguZLpIQqk=;
 b=NDRHpOgd7H09UH644vUbmNTzJeqELB35MRtwIiKtZlYhbq5wGOVZtL9HW0TcaWCpbJ
 uUFmjFdjBTpMiFdxVD0lEulwXDIqe8S+Q4yKbcW10ZI364LDnaPEIy7N6QuvcSPfVt4o
 JpSf9SCR6B+Ry7WIoEXsn993j7HHYUFXWKm6TUTshkwQXJ8AKyO6372mmDFyxxJOm0bL
 kJXa+GhCTQk2sVFk/82eAz8vtj5HRqxUTvnU0clKMsNmjFPrQjQVrc69Ty/dQuIZddPs
 Ns6WB+rLbE0Fad96QAT3xcNhwPlnMP8Zy4AtthEnhFkxvfKLPs8zsrm0ynBkiJAKDZ2t
 XTtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWX6ZH/PijuI3whpsFnj8zgkxRXiLwlfh8OgaroaRgj5/oaJaV7dtXztgsPw9h7gZCJ84MDghUbRQUUXdp8z/bywQLFC/zYxr6tHQyLVa7g
X-Gm-Message-State: AOJu0Yx2eWliT5Q4gN9ZQOaspsM/q0ACjfw0W+ex5KqCC1nOC//AsQQa
 3OAS3+gUKi3ajg/NcY7r0Pd1WZOgHtQ1m14/uL+fj/i9QUtOvmA73X/YseeexicdhvFtSAfS22O
 gwOVi9uJWc8a0Pf9tBp6iqyaJhCFgaZ667qkj
X-Google-Smtp-Source: AGHT+IFmD5ws3SRz0ys/c7GsQE1n5zbIG2sA9x5gW1fhOmHKqofyiRm9MM4uDUDgT3IR0dKVANwZ1jVmYBAj6ebfv64=
X-Received: by 2002:a05:600c:2218:b0:410:ac80:bf3e with SMTP id
 z24-20020a05600c221800b00410ac80bf3emr10578913wml.37.1708317950949; Sun, 18
 Feb 2024 20:45:50 -0800 (PST)
MIME-Version: 1.0
References: <20240202141109.1.I24277520ac754ea538c9b14578edc94e1df11b48@changeid>
 <CAJMQK-it9YMod4rHKnACq4O-iaGieK2SN4x5vQ018CghsA631A@mail.gmail.com>
 <CAD=FV=VfuFrK1cSKA0maMzT5dxzKEzADqrd69fZKXuAGrU2rmA@mail.gmail.com>
 <87sf1u58k0.fsf@intel.com>
 <CAD=FV=XQdLm3PcjEd_g_dBJ9QO8zAJtj5nrXS9=cjC80+-Jbfg@mail.gmail.com>
 <cbcd981f-bd5d-477e-8482-d3414be17057@linaro.org>
 <CAD=FV=UtakQZ6OEKwERW5gNeAfS88EqkuQAHkrQoN=SicDG1JA@mail.gmail.com>
In-Reply-To: <CAD=FV=UtakQZ6OEKwERW5gNeAfS88EqkuQAHkrQoN=SicDG1JA@mail.gmail.com>
From: Eizan Miyamoto <eizan@chromium.org>
Date: Mon, 19 Feb 2024 15:45:39 +1100
Message-ID: <CAAi1THx9TKwr9fESxf2bWzsp2bcJmR+HAATFbJ=gBK1E2XG7jg@mail.gmail.com>
Subject: Re: [PATCH] drm/dp: Don't attempt AUX transfers when eDP panels are
 not powered
To: Doug Anderson <dianders@chromium.org>
Cc: neil.armstrong@linaro.org, Javier Martinez Canillas <javierm@redhat.com>, 
 Jani Nikula <jani.nikula@intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, dri-devel@lists.freedesktop.org, 
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Imre Deak <imre.deak@intel.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 19 Feb 2024 08:53:03 +0000
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

Hiya,

On Fri, Feb 16, 2024 at 4:09=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
[...snip...]
> Sounds good. I know Eizan (CCed, but also a ChromeOS person) was going
> to poke at it a bit and seemed willing to provide a Tested-by. I'll
> let him chime in.

Yup, I've tested this like so:

1. I started by slightly modifying a recent chromeos-5.15 kernel checked
   out to _right before_ the patch we are discussing to emit some
   tracing info to dmesg at entry/exit of auxdev_read_iter(). I
   installed it on a "tentacool" Corsola device.
2. I then rebooted the device and ran these commands:

   # dmesg -w &
   # while /bin/true; do echo -n "dpms: "; cat
/sys/devices/platform/soc/14000000.syscon/mediatek-drm.7.auto/drm/card0/car=
d0-eDP-1/dpms;
dd if=3D/dev/drm_dp_aux1  count=3D1 of=3D/dev/null; sleep 30; done

And after a few minutes, I saw the following output:

dpms: On
[  435.603257] auxdev_open by pid 6327 inode num 108 dev 256901121
[  435.603369] start auxdev_read_iter by pid 6327
1+0 records in
1+0 records out
[  435.756547] finish auxdev_read_iter by pid 6327 status 512
[  435.756632] auxdev_release by pid 6327 inode num 108 dev 256901121
512 bytes copied, 0.153862 s, 3.3 kB/s
[  455.418637] [drm] mtk_crtc_ddp_hw_fini 459 event 0x0000000000000000
0xffffff80c0277080 0xffffff80c0277080
dpms: Off
[  465.775104] auxdev_open by pid 6399 inode num 108 dev 256901121
[  465.775218] start auxdev_read_iter by pid 6399
dd: error reading '/dev/drm_dp_aux1': Connection timed out
0+0 records in
0+0 records out
0 bytes copied, 16.6631 s, 0.0 kB/s
[  482.437762] finish auxdev_read_iter by pid 6399 status -110
[  482.438200] auxdev_release by pid 6399 inode num 108 dev 256901121

(OK, so what to look for in the above is the ETIMEDOUT returned by
auxdev_read_iter after about 17s when dpms was turned off.)

I then checked out the repo to the patch we are discussing and did the
same thing, and after a few minutes, I saw:

dpms: On
[  441.892692] auxdev_open by pid 6317 inode num 108 dev 256901121
[  441.892786] start auxdev_read_iter by pid 6317
1+0 records in
1+0 records out
512 bytes copied, 0.148004 s, 3.5 kB/s
[  442.040597] finish auxdev_read_iter by pid 6317 status 512
[  442.040652] auxdev_release by pid 6317 inode num 108 dev 256901121
[  455.395549] [drm] mtk_crtc_ddp_hw_fini 459 event 0x0000000000000000
0xffffff80c3993080 0xffffff80c3993080
dpms: Off
dd: error reading '/dev/drm_dp_aux1': Device or resource busy
0+0 records in
0+0 records out
0 bytes copied, 0.000241 s, 0.0 kB/s
[  472.055296] auxdev_open by pid 6439 inode num 108 dev 256901121
[  472.055388] start auxdev_read_iter by pid 6439
[  472.055421] finish auxdev_read_iter by pid 6439 status -16
[  472.055571] auxdev_release by pid 6439 inode num 108 dev 256901121

Tested-by: Eizan Miyamoto <eizan@chromium.org>
