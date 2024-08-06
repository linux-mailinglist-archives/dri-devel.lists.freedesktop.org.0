Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1ED19496D3
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 19:31:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F15D10E06B;
	Tue,  6 Aug 2024 17:31:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="RQC6pDPk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 503DE10E06B
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 17:31:48 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id
 af79cd13be357-7a1e1f6a924so51450585a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2024 10:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1722965504; x=1723570304;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gqyeHMahsCOkK3u9LkoMA6WHj+nv0M3p/02yM0qdpV8=;
 b=RQC6pDPkCT0pdF4F/5MrPv2vCmLOEQgUo1ctAYISl9s/YKybes+TOGIgGPG8fUUghu
 5ZAsQlQHm1TJq8967FtUq9vTV8ot7224ye2zjVLpmdb7WaqLFqM3ecdnk5eqmfelJNeA
 hMRjrp8N5cacwn6RAELqc5leQXZQCWbHmgmhA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722965504; x=1723570304;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gqyeHMahsCOkK3u9LkoMA6WHj+nv0M3p/02yM0qdpV8=;
 b=NNDvVfUhzxhJIcK7RCSoMQiaFxNZGJdP0u1eV6UTHHlc0It6nE8KR0mGlo2mYYafIg
 RD3ie2YRl20WwhYcCcmobvPeyoVOZpwOJhN0mB5Mh+uLGYmNqh5h3wCAD/fYaKp/mlUu
 32nOxvg9GvykfKcAYN72LyvjGlHHoM0ctVJkfeQtcDVwoP3dR4g0rwQGmMweW4mWwAP9
 6Kcq35Gw5jpxvJR/7BY7YDGsJlQd46o/5y8PU8nkmgO7dWu8A1xi+9d3hGSMrnOiBF4G
 /242670tzvXECLdCrqlmwWiXGqLWbUFFqAupmGC3hz7emE/dDKAEOLnNBr3NxGXdtHyw
 cyKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYvVcEq2HO44u6uUy7+1+LVLGERoxBD7CMN1q1apJycn9UIZ1zhrBV8FU9d0rxrcZxBf0IusXbvzlHJeFd6yAaUhdpNBoUtY2sLe2Cy11K
X-Gm-Message-State: AOJu0Yw212Fh0RsvZ7JqJ0g8yeEQPh03ViOyGfTXRQ/w0Alxt3F57Sk6
 g1wcq1Bh9wgqhGBrq58y0z6n+yI29IOLa+FIlyD3cNnpcpvW4/RidNtVdbABXoATT9Y6Lvka8Qz
 rPFWe
X-Google-Smtp-Source: AGHT+IGYzfIhTL4iP0mvOKx4wNVAE2t+TIYtwtyuA8jg9YfcQpZlGNQi3LEx3+b/ejgquu7inJ8uKw==
X-Received: by 2002:a05:620a:244f:b0:7a2:16f:a7d4 with SMTP id
 af79cd13be357-7a34efe95c0mr1966728085a.59.1722965504133; 
 Tue, 06 Aug 2024 10:31:44 -0700 (PDT)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com.
 [209.85.160.182]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4518a6aa1cesm39497281cf.6.2024.08.06.10.31.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Aug 2024 10:31:42 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-4518d9fa2f4so464761cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2024 10:31:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV150LltBq45d+8h3sfxxot78+bsuR/fMYZEVz8EHdW24IN6yMeiU239i1PwT6+eFANjURjoxq71mxxfo5W30WvRZUAcCMOqJCUAWMm812H
X-Received: by 2002:a05:622a:1822:b0:447:fad8:ccc1 with SMTP id
 d75a77b69052e-451c5a614e8mr1041cf.22.1722965502125; Tue, 06 Aug 2024 10:31:42
 -0700 (PDT)
MIME-Version: 1.0
References: <20240806034015.11884-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240806034015.11884-2-lvzhaoxiong@huaqin.corp-partner.google.com>
In-Reply-To: <20240806034015.11884-2-lvzhaoxiong@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 6 Aug 2024 10:31:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WrMxyxkuCYEbd=aYFaTJKNqGqXr6Re+V=B_h9jnjHPvg@mail.gmail.com>
Message-ID: <CAD=FV=WrMxyxkuCYEbd=aYFaTJKNqGqXr6Re+V=B_h9jnjHPvg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/panel: jd9365da: Move the location of "exit
 sleep mode" and "set display on" commands
To: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 hsinyi@google.com, airlied@gmail.com, daniel@ffwll.ch, jagan@edgeble.ai, 
 dmitry.baryshkov@linaro.org, jani.nikula@linux.intel.com, 
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

Hi,

On Mon, Aug 5, 2024 at 8:40=E2=80=AFPM Zhaoxiong Lv
<lvzhaoxiong@huaqin.corp-partner.google.com> wrote:
>
> Move the "exit sleep mode" and "set display on" command from
> enable() to init() function.
>
> As mentioned in the patch:
> https://lore.kernel.org/all/20240624141926.5250-2-lvzhaoxiong@huaqin.corp=
-partner.google.com/
>
> Our DSI host has different modes in prepare() and enable()

nit: it's not obvious to the reader of this patch which DSI host is
"our"s. Maybe spell out which SoC you're using? I assume this is a
Mediatek SoC?


> functions. prepare() is in LP mode and enable() is in HS mode.
> Since the "exit sleep mode" and "set display on" command must
> also be sent in LP mode, so we also move "exit sleep mode" and
> "set display on" command to the init() function.
>
> We have no other actions in the enable() function after moves
> "exit sleep mode" and "set display on", and we checked the call
> of the enable() function during the "startup" process. It seems
> that only one judgment was made in drm_panel_enabel(). If the
> panel does not define enable(), the judgment will skip the
> enable() and continue execution. This does not seem to have
> any other effects,and we found that some drivers also seem

s/effects,and/effect, and/


> to have no enable() function added, for example:
> panel-asus-z00t-tm5p5-n35596 / panel-boe-himax8279d ...
> In addition, we briefly tested the kingdisplay_kd101ne3 panel and
> melfas_lmfbx101117480 panel, and it seems that there is no garbage
> on the panel, so we delete enable() function.
>
> After moving the "exit sleep mode" and "set display on" command
> to the init() function, we no longer need additional delay
> judgment, so we deletevariables "exit_sleep_to_display_on_delay_ms"

nit: s/deletevariables/delete variables/


> and "display_on_delay_ms".
>
> Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
> ---
> Changes between V2 and V1:
> -  1. The code has not changed, Modify the commit information.
> v1: https://lore.kernel.org/all/20240725083245.12253-2-lvzhaoxiong@huaqin=
.corp-partner.google.com/
> ---
>  .../gpu/drm/panel/panel-jadard-jd9365da-h3.c  | 59 ++++++++++---------
>  1 file changed, 32 insertions(+), 27 deletions(-)

nit: ${SUBJECT} is a bit long. In general it's worth abbreviating a
bit more so that the subject doesn't go to crazy.

drm/panel: jd9365da: Move "exit sleep mode" and "set display on" cmds


Aside from the above nits, this looks OK to me. I wouldn't object to
fixing some of my own nits when applying or you could send a v3 if
there is no other feedback. In any case:

Reviewed-by: Douglas Anderson <dianders@chromium.org>


I'd prefer someone with more MIPI panel experience give a review,
though, so I'll expect that Jessica or Neil or someone else gives a
review.

-Doug
