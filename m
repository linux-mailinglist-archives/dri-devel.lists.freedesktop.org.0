Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A48872BAF
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 01:23:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C3C0112DA5;
	Wed,  6 Mar 2024 00:23:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="PSLtc8Yb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F9E2112DA5
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 00:23:37 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-7882b02ed2dso115236185a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 16:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709684615; x=1710289415;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rBN1BqbcbZ76mWTdYzaQ/VGjxsv9OMJI1R5f8bpftUs=;
 b=PSLtc8YbgHvfYRtAGwomH4bTyeXBcZUtT5bfpHhjCi/k4GADcJX9nZQj6vADKGgsc/
 5Wr6ZA4TZjH7FoNAmCykvd2ebX5M38BlIB93A9yOEsf0SK6u0yEI+PwQivzZY8BkkdX+
 J5ZiAZvX//zk7ihU9hPW0Evw8g3dJpPPDU6+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709684615; x=1710289415;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rBN1BqbcbZ76mWTdYzaQ/VGjxsv9OMJI1R5f8bpftUs=;
 b=nDw1oIqzx6T2PYWresvJBpqMfDRRBn0+WnqgBDZdBRhiplJPyuQaDLEWoBjhfJhkMY
 s07g7VucNoZx4Jd7tA1IITSdzF+rNpIvNsP2NH69OHDEiUuRni426e+337i/tvoxn4vx
 5zKsJS/9UPjU88FU/nzGFYyPLGcefGmkm4znzdEhGdVKX94nrVy7MqP5sWPRRqPEFW/S
 d7Nh8h3g+eHSnFKaY64TwrWrUsS4GXgc7xdcra8naQfubsaU+QETvui1HVdXxc1Jijds
 nqpyDNG41uIGS+d7gXkHhvHy40ZSih0Fb92EItuGy8MVCg0AJT/wQZj0bWFA2ddjgst6
 GrtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLB+kIRlwVQi6cvCyC3xfyAYfCfXC5vTlg6f5DOjdMNnI9CPDxBRC5ZDvX5GaEddhOOexS047Y1fikUKI8g+9+Sr9OiMyR+5jSCsDJD6PC
X-Gm-Message-State: AOJu0YxeBQC7ItCs1WofVqrNNJPgjrCJTfnChdMwl06KKXGbF02nJD4S
 TUM7DXKBV0ckCYxxLdg+acC3lpvVaBKmpMNo9PNE2hL0FDQqdb6Nv4Icfr94JCJPC7TaTn9E5YB
 tDx6r
X-Google-Smtp-Source: AGHT+IGanGOGPQpQTV13nuWU/gSfmegF+oR3IBfEFLXNcfSQeJD/10FHxbyfWbF3SPCClRv6OYXL7g==
X-Received: by 2002:a05:620a:1663:b0:788:2d1a:d68e with SMTP id
 d3-20020a05620a166300b007882d1ad68emr3483223qko.4.1709684615335; 
 Tue, 05 Mar 2024 16:23:35 -0800 (PST)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com.
 [209.85.160.181]) by smtp.gmail.com with ESMTPSA id
 x4-20020a05620a0b4400b00788217985bcsm3392935qkg.119.2024.03.05.16.23.34
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Mar 2024 16:23:34 -0800 (PST)
Received: by mail-qt1-f181.google.com with SMTP id
 d75a77b69052e-42f024b809cso123341cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 16:23:34 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVYGJTBdSJYNBa3K8X7kMPAnjtMSDIgnSxSuG0hKXu1OPWyMRyvP6VVhSNhwyRY+2rSEaHe1n/5lVsRqrhHi86EfKQ9tt/vHKY6ox0TFrg/
X-Received: by 2002:ac8:7e83:0:b0:42e:f49b:8753 with SMTP id
 w3-20020ac87e83000000b0042ef49b8753mr321969qtj.11.1709684614147; Tue, 05 Mar
 2024 16:23:34 -0800 (PST)
MIME-Version: 1.0
References: <20240305012604.3869593-1-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20240305012604.3869593-1-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 5 Mar 2024 16:23:18 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XUhBUscqx5TY6Ax94_St6xggnirP6hiy_VG9Y_1uB-kg@mail.gmail.com>
Message-ID: <CAD=FV=XUhBUscqx5TY6Ax94_St6xggnirP6hiy_VG9Y_1uB-kg@mail.gmail.com>
Subject: Re: [PATCH V2] drm/panel: boe-tv101wum-nl6: Fine tune Himax83102-j02
 panel HFP and HBP (again)
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch, 
 hsinyi@chromium.org, swboyd@chromium.org, airlied@gmail.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

Cong,

On Mon, Mar 4, 2024 at 5:26=E2=80=AFPM Cong Yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> The current measured frame rate is 59.95Hz, which does not meet the
> requirements of touch-stylus and stylus cannot work normally. After
> adjustment, the actual measurement is 60.001Hz. Now this panel looks
> like it's only used by me on the MTK platform, so let's change this
> set of parameters.
>
> Fixes: cea7008190ad ("drm/panel: boe-tv101wum-nl6: Fine tune Himax83102-j=
02 panel HFP and HBP")
> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

I actually already made these fixes myself for you and applied. My
notes were mostly for you to keep in mind for next time. This is
already in drm-misc-fixes as:

9dfc46c87cdc drm/panel: boe-tv101wum-nl6: Fine tune Himax83102-j02
panel HFP and HBP (again)

-Doug
