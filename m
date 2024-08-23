Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FC095D3B8
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 18:50:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40AF110EC84;
	Fri, 23 Aug 2024 16:50:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="iIMPCmGA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E553010EC84
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 16:50:01 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id
 af79cd13be357-7a66907fa39so133467885a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 09:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1724431799; x=1725036599;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YF7d6zgK96oUF/UdvRet8Wq1EsEpokqSbVExBvPEI58=;
 b=iIMPCmGAOZkN5tlzLYlLkkW5kd5LWX6aW+xkahdwPIb7PSSCaTGp6w3w9ix25NzFIp
 054GUet0wQUM+GqV1vMXD4Yh9Ysog/tqUKijomKol1XXjVHsRPO4thYp+9FqItyCu9XN
 gfm4KKjB1vDnvATG8lmiDcQ/Jxki5zO/zcEcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724431799; x=1725036599;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YF7d6zgK96oUF/UdvRet8Wq1EsEpokqSbVExBvPEI58=;
 b=sCyn4cIRif06+K/UyKwf3h51duU3SvCgKqOsVxs3winhjvzn3F3hD7q+XqZburRlDw
 CmcS6GO19x4Ju6RdEwxq+i50r4pa4H0bCUt1brDuTNgsSUBsAKLnNWP9yzwBxCiZHMeI
 WuOWXCwQSfrzVeXuhJ+VgS3Aj0xlrQ6UaEx2VeUjXjkw0ZNI12nT1tJFrUI7lEdLmSpC
 3QMH6HAU8I+AYWDCjE55dA2oK5M6ozLsRDsPuNJscWv1SpyWPNTH1LJL53h9NcYmjMWy
 iHBURX18g9SfWjne1J1nLVprCdRWokpjNAjo3ZECmNnUs5yujNnPeK6nTQ4gKTVS5A/n
 oY+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsZhs+QJOpSEqcNCIVYBCKzT0/0NzNNjONkF8lU6WHA2sXhy+dZE6nLjEd8NAr+kwfuf00ijcpHRg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4H3tKdbg/rOV0fzhka05FeBW2fEmmVErKW0nMwDpqJXtfQkXP
 e5SU48kuWVXMhrwT5ZcPgrNOg+nLel2mbj8+rvYfxuSRcTXImMZFeMswMeKKO80If0x4uFg1H9k
 =
X-Google-Smtp-Source: AGHT+IF8rRho366HR1LWzzU/FdKL1aE8oejgB6nqGZOW+TdsZ8FeshmFO1CZz0OQWwsLTh+HUSRcIQ==
X-Received: by 2002:a05:620a:2911:b0:7a6:68fc:ac5f with SMTP id
 af79cd13be357-7a6897a6f70mr386049785a.44.1724431799465; 
 Fri, 23 Aug 2024 09:49:59 -0700 (PDT)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com.
 [209.85.219.43]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a67f341702sm195701985a.29.2024.08.23.09.49.58
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Aug 2024 09:49:58 -0700 (PDT)
Received: by mail-qv1-f43.google.com with SMTP id
 6a1803df08f44-6bf8b41b34dso10854096d6.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 09:49:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCX1kNjR7TUmAirMuL2u5P726dAdixsK6Ep0SvYx6PxPvdc+fp6k1qjhS3N+XP7mDA7vA4KQTbDpL4c=@lists.freedesktop.org
X-Received: by 2002:a05:6214:4199:b0:6b9:5fb9:113f with SMTP id
 6a1803df08f44-6c16dc6309emr28510476d6.27.1724431798162; Fri, 23 Aug 2024
 09:49:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240823163513.4344-1-hanchunchao@inspur.com>
In-Reply-To: <20240823163513.4344-1-hanchunchao@inspur.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 23 Aug 2024 09:49:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X_a2NzAi6L3N-Bgta4Vn7uSd3DPZ355LBg1gpd=A7H+w@mail.gmail.com>
Message-ID: <CAD=FV=X_a2NzAi6L3N-Bgta4Vn7uSd3DPZ355LBg1gpd=A7H+w@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: himax-hx83102: Add NULL pointer check in
 hx83102_get_modes
To: Charles Han <hanchunchao@inspur.com>
Cc: neil.armstrong@linaro.org, yangcong5@huaqin.corp-partner.google.com, 
 quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, liuyanming@ieisystem.com
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

On Fri, Aug 23, 2024 at 9:35=E2=80=AFAM Charles Han <hanchunchao@inspur.com=
> wrote:
>
> In hx83102_get_modes(), the return value of drm_mode_duplicate()
> is assigned to mode, which will lead to a possible NULL pointer
> dereference on failure of drm_mode_duplicate(). Even though a
> small allocation failing is basically impossible, kernel policy
> is still to check for NULL so add the check.
>
> Fixes: 0ef94554dc40 ("drm/panel: himax-hx83102: Break out as separate dri=
ver")
> Signed-off-by: Charles Han <hanchunchao@inspur.com>
> ---
>  drivers/gpu/drm/panel/panel-himax-hx83102.c | 2 ++
>  1 file changed, 2 insertions(+)

FWIW, this looks to be v4 of your patch, right? The subject line
should include a version number and you should be providing version
history "after the cut" in your patch. Tools like "b4" and "patman"
can help you get this correct [1]. If you plan to continue posting
patches you'll need to start getting this right. The next version of
your patch would be v5.

[1] https://sched.co/1aBGS

I see:

v1: https://lore.kernel.org/r/20240821095039.15282-1-hanchunchao@inspur.com
v2: https://lore.kernel.org/r/20240822093442.4262-1-hanchunchao@inspur.com
v3: https://lore.kernel.org/r/20240823083657.7100-1-hanchunchao@inspur.com


> diff --git a/drivers/gpu/drm/panel/panel-himax-hx83102.c b/drivers/gpu/dr=
m/panel/panel-himax-hx83102.c
> index 6e4b7e4644ce..e67555323d3b 100644
> --- a/drivers/gpu/drm/panel/panel-himax-hx83102.c
> +++ b/drivers/gpu/drm/panel/panel-himax-hx83102.c
> @@ -565,6 +565,8 @@ static int hx83102_get_modes(struct drm_panel *panel,
>         struct drm_display_mode *mode;
>
>         mode =3D drm_mode_duplicate(connector->dev, m);
> +       if (!mode)
> +               return -EINVAL;

I would have returned -ENOMEM since drm_mode_duplicate() is defined to
allocate memory copy the mode (like strdup does for strings) and it
should be clear that the only failure case is failure to allocate
memory. Other callers convert a NULL return as -ENOMEM.

-Doug
