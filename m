Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC548ACF03
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 16:10:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 213FA112B39;
	Mon, 22 Apr 2024 14:10:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Or7587Pm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DA66112B39
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 14:10:50 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id
 6a1803df08f44-69b9365e584so45089526d6.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 07:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1713795047; x=1714399847;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BgjTo5Gsy0Vsq9HceSa7BTmtZ4tw4e+SgvrPUoLWsZY=;
 b=Or7587PmEVfLxNNHtSf2lC0pl+ZGMUfFWMA9hYkO2Et3+Ty2gfOfEoiYR1Cky357Uk
 P7prIphYngj34pil0ftc93W+1ZV7FiwpQVCKwtvFQ7Xp8F6Pf9UMWUgSKAtKtpMMdw7R
 dVHnrR2cwHucg1iYlftxK6kC/xl2vC4lFVLis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713795047; x=1714399847;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BgjTo5Gsy0Vsq9HceSa7BTmtZ4tw4e+SgvrPUoLWsZY=;
 b=dKit4dXB3Shbd4W2tuoR9C8lhgnoe76ZJFtjHgs0ZoDPVngRlNtCGU0wd08fSPFYHo
 BZXkvQnImvOpDEv4X/Vh5QZB7HFoQVgod+wh/8BP3WkZM5yYMKgfJdvmXiEzHpKYCc3r
 nUoa8o82pzbzlWnsCJTq7MYbvi2ObQ6Jfvff8uNOwe95/yhlVEHRgBELe3Y8fogAqPUq
 e98GvVW8x/w+YDzJpqTh7PvDY/xZBh1hKKx216nmYxta7x0eVwhfWh7XzMcQk/hhdC7V
 iVOfBbjjsqeVLxV9tlTAz8kg+ENYh6XdTqBOMy3W+uG71B/Q2EoAPLKx04wQ6SXsj2Ae
 r0bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3vB6sKCzmkLgMSENwKdIEYZ74NOiPZswu5mC0oLLBmCJvZI1wwivg8Bz2B4gK0n41dfnLAroIFkmsnhsZB/HTmPF3Ny5a6xYXZhdton5H
X-Gm-Message-State: AOJu0YxTvtv86XsnmLmWvnU6O+SvG2kVTVoK8ebZ87HTErcwX3E0NexB
 A0v6tET6Uh40Ta7TBuf8LAKiA10hUvFpgErkdVjppF/ubAFfwSKkZzIXogW8j2Bl0D3JHC1dEhg
 =
X-Google-Smtp-Source: AGHT+IG7rG7U5r86aEi++IOf2eYo5/Y3QmXWWofhAK5cC3OyK8vrNRT/0uyz2lTgDcV7jFS9Tg9v3A==
X-Received: by 2002:a05:6214:2346:b0:69b:60b6:7c5d with SMTP id
 hu6-20020a056214234600b0069b60b67c5dmr21463519qvb.18.1713795047044; 
 Mon, 22 Apr 2024 07:10:47 -0700 (PDT)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com.
 [209.85.160.179]) by smtp.gmail.com with ESMTPSA id
 t10-20020a0cc44a000000b006915ae114efsm4286831qvi.52.2024.04.22.07.10.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Apr 2024 07:10:46 -0700 (PDT)
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-439b1c72676so348321cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 07:10:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUaP6zeWV3E1JEtUneSGoe5+Ts+mpJVq9SrFrcns7MfMTvewMana5O1BMmht9KZnmaiEPV2ZO0uOC7l+HkXg0d+t6fQfWXfc6CqvKwHKKBw
X-Received: by 2002:a05:622a:a081:b0:437:b429:c953 with SMTP id
 jv1-20020a05622aa08100b00437b429c953mr405598qtb.14.1713795045405; Mon, 22 Apr
 2024 07:10:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240422060811.670693-1-xuxinxiong@huaqin.corp-partner.google.com>
In-Reply-To: <20240422060811.670693-1-xuxinxiong@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 22 Apr 2024 07:10:29 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WRLLuOkCJeM6RdAb6xLN-cPH+hfWbOv9-LujB-WMGEFw@mail.gmail.com>
Message-ID: <CAD=FV=WRLLuOkCJeM6RdAb6xLN-cPH+hfWbOv9-LujB-WMGEFw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add panel CSOT MNB601LS1-1
To: Xuxin Xiong <xuxinxiong@huaqin.corp-partner.google.com>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch, 
 hsinyi@google.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Sun, Apr 21, 2024 at 11:09=E2=80=AFPM Xuxin Xiong
<xuxinxiong@huaqin.corp-partner.google.com> wrote:
>
> Add support for the following panel:
> CSOT MNB601LS1-1
>
> Signed-off-by: Xuxin Xiong <xuxinxiong@huaqin.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index d58f90bc48fb..5e0b1c94bc62 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -2036,6 +2036,8 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>
>         EDP_PANEL_ENTRY('C', 'S', 'O', 0x1200, &delay_200_500_e50, "MNC20=
7QS1-1"),
>
> +       EDP_PANEL_ENTRY('C', 'S', 'W', 0x1100, &delay_200_500_e80_d50, "M=
NB601LS1-1"),

Are you positive that both this panel and the one above it (which you
also added) are correct? You identified both of them as CSO panels but
one has "CSO" and one has "CSW". Please double-check and let me know.

-Doug
