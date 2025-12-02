Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A01C9B90D
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 14:18:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42F6010E00E;
	Tue,  2 Dec 2025 13:18:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="CvUS6u+P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6925D10E00E
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 13:18:43 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-59584301f0cso4387236e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Dec 2025 05:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1764681522; x=1765286322; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d2qTS0djCtlvzenkDRiQ4JmBu4W3Dqf8pIaygUtSKbc=;
 b=CvUS6u+PW9a8fI92ihohy9mxR0p+dq4Dwz+YPeZ6bPhwRZqAoMhQSoixxQMF98ZSXo
 F5Toj+JwnMK/rpNhe4rsApveWiLMmG/lZR3U8ZJFEWecR6DY9TlFephTVagbM94gGQNI
 2XUPhSvVZo+V4/NuaX/4VOrzvxzynjn/4t/Q3QIA/cQ4RZ0yxa1FeDQ7Lb1mQ4rhXEbp
 pTpPpm0qA97grfC3kl9uMdvyjBVmb7JebKBsGsk7CfTum4TIrw7BE7OZLQ9gpB7EuOOC
 +gZqit34YmNpKulx59/V2Q570u2SgKDkTBBJn7O+CgnIfBnM9TClPCV7QrfKEr4Bnh1I
 4lsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764681522; x=1765286322;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=d2qTS0djCtlvzenkDRiQ4JmBu4W3Dqf8pIaygUtSKbc=;
 b=xMK+XpISzkanh2S9CecsxE/GWpr8pgDZ5uVFvK9olM4oE9W/Pqx0bAyv1Rn8rCSJv+
 DPvTWAEO4zkVtuQkWr8TDBskiBXgrVM8b9yO9kyC1pHvr60mY2+lhDbTG+Y+LkMK62H3
 pZJgF4JWmJdFKUSRNJ51YrWR6ih3U7Whxtyoto2uDnO6RYKo2Rv6KK0tjUfPeG0EA/SJ
 oOL9yugmbjtVbNsTJiKfpmxol1NU4aLnMtPrwYEZnNpPDC0vbQ4jtBVaTILs7c3lRrsQ
 73Qf/NiwjM7Ks4EEQjA5xoM25EY5gOfNjCcj+3APKH2XNdO5Zxb6TDqieDe6ENzpSmAr
 BC4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDe/cBkWpFKzjI2zBIrnaZ7foe0AsjNZLsqIsCh6UANVyOTjBtvoxjiJI9/nQWe/dBNKP0LT7qKmo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxEIxpcFLBvuwsLOE7gIQn5wYWXPHW66WCTwpsSdEmaKYOhkaX6
 vEgePxOXplQf7YQ7rfT0TScCA2gF4Trngt5qN4vQXy62YJsILIy9oaMCfDRhmHhTLGAsI0/zpRP
 Ew5kPyonplwtOSmyFs8b4RNH4LR6kiCY9He+Lu8j+VA==
X-Gm-Gg: ASbGncvuDMFzdfctNGqN8RRWqfzhc5o2C1FFkrczqafqvaLL5Eqeyf85BLjd11zKWch
 zlFqANOR0gTaMT1dgscmZ/7QDQPHvNEIcls1C39JZLOStJrP5VFh/M4z5DAGFhkEbIJ/ajFvjEQ
 v178g7B8faKWMZw7EO3x3hpivYTD459fAc/VAgdhwEl9p6MXVXzURSO1G1bamQURn2Dno5W96W2
 NIcxu0VOrF8SvFwPdEj4pEfOO41d4jt/qsdgh3IzTS0amwxl0NyWou746tywa0M6OhJVPpalDsf
 NbDGLuCjLz+WEvBtQk/IsbW7FDdc
X-Google-Smtp-Source: AGHT+IHXPq/1WU7Y6p5Y1lD+k5wDuWG4cZs/H+fFh7MfEyTT0+oPBhUYEG6IeIhzVNqgsaoRyEt5M7vDP9CoP0oYIqI=
X-Received: by 2002:a05:6512:159c:b0:595:9152:b932 with SMTP id
 2adb3069b0e04-596b526c87bmr9950731e87.47.1764681521679; Tue, 02 Dec 2025
 05:18:41 -0800 (PST)
MIME-Version: 1.0
References: <20251031104846.119503-1-marco.crivellari@suse.com>
In-Reply-To: <20251031104846.119503-1-marco.crivellari@suse.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Tue, 2 Dec 2025 14:18:30 +0100
X-Gm-Features: AWmQ_blWaASpaRpR4V19dOIxX8T97Dq9h1s9NUCUDv7AzhCvoFkKrXxIheilGew
Message-ID: <CAAofZF7BnLm3XKBVsOvAcfON29PgxvA4dfkd4N4+yx40LSTV-A@mail.gmail.com>
Subject: Re: [PATCH 0/2] rename system_wq and system_unbound_wq
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Michal Hocko <mhocko@suse.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
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

On Fri, Oct 31, 2025 at 11:48=E2=80=AFAM Marco Crivellari
<marco.crivellari@suse.com> wrote:
> Marco Crivellari (2):
>   drm/rockchip: replace use of system_unbound_wq with system_dfl_wq
>   drm/rockchip: replace use of system_wq with system_percpu_wq
>
>  drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 4 ++--
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c    | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Gentle ping about this.

Thanks!

--=20

Marco Crivellari

L3 Support Engineer, Technology & Product
