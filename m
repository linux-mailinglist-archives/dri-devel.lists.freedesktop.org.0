Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0C294F1F7
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 17:46:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEAA510E197;
	Mon, 12 Aug 2024 15:46:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="gcSlxTjM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D7E410E25A
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 15:46:02 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-654cf0a069eso40957627b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 08:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1723477559; x=1724082359;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PWTnM/TlBV50vGuoHmIWpJag7IVGU1x6R8fvFCPQCsE=;
 b=gcSlxTjMXn4pa7G/I+NNH7Wug0o41vWoT6AlpOfhZgYz5pq23FV/fya9FnaFSBGXNN
 ZT/7+ICDzZgiY2l+LVgvd78nkx81HV8ooGfcP7lbEUPY+dfmCcKFTci1Mim06I6XmLv4
 wHpS2p0PD1jSQbsBwRcBFlhx5wWKHl/JlkP98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723477559; x=1724082359;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PWTnM/TlBV50vGuoHmIWpJag7IVGU1x6R8fvFCPQCsE=;
 b=ZBe/Zar9QImB8yN6Q7BX+bA+GlZ041PPFrJfHqMAbbVJ9m6VBIlsTEfBuV/F/dIG/r
 RfxFVnBQHOjo7pCdkD4tgCyhQ51p260SCXp6YvNi7zpvxKIgikLXsfmPcXwA1/Y3LW/S
 om0gXaLxjXaMhKjFWJxNSncSSCDnM/I2iVc1P3BUNaJPCCxt1Z8QKNFTrzp0dmgljorm
 Nv1mNGPSP1YbGsBlYtflCvYPvLIp/bOUe0zdULB8wfD21NujOL1IGfIRrkNule300Kga
 GWgiHQp867mxhUFqAebjTzCAGZHEDknU/IEQsHU5pShwiC0Newr643+PIc+g0+l6KKb7
 XPZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWH02+1CbMFOVhXS6TxFwR4dR+ml0IbseHUOBVNay4xUGmCxqHyAqzDFDZyp2jl5wfmG2aVGZy2kslW7FaF/mg+zzCz8OOlN03OJxU9xEDD
X-Gm-Message-State: AOJu0YxuCLcBSz45V0C1ZUDTu8YUX8Ul4NgJhsNU2QQrzOPyOkHqePba
 SOYvahBu9zDR/rfxk9yxFquog1WaWMS3IUiRIgxVGj+cfcLoDAcaPcQsrhsflvI5617BZbEdShV
 mJg==
X-Google-Smtp-Source: AGHT+IEDV4KXmrfQPEkJMzEfDGoQMUZ8sRFpcZRgA7HQkd9VrbTFb4KN1jA+aYy0zHqErNI0BRL3Mw==
X-Received: by 2002:a05:690c:4702:b0:675:a51b:fafd with SMTP id
 00721157ae682-6a975ab139fmr8028967b3.31.1723477559148; 
 Mon, 12 Aug 2024 08:45:59 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com.
 [209.85.219.170]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-6a0a3c71bd8sm9073307b3.76.2024.08.12.08.45.57
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Aug 2024 08:45:58 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-e0e88873825so4384250276.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 08:45:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXrtApSXcXbzGFhzSGxk9dDs6kzoOXjUC+KD1H1wm+46Nrr9BscSLSVuI0EpTGOI3pcvxNwmEVhGNP8EvHMAQiR0APKdlyleH0FMRArgeOa
X-Received: by 2002:a05:6902:1542:b0:e0b:e550:4e5c with SMTP id
 3f1490d57ef6-e113ced41a7mr1044286276.26.1723477557390; Mon, 12 Aug 2024
 08:45:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240807100429.13260-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240807100429.13260-2-lvzhaoxiong@huaqin.corp-partner.google.com>
 <1518bded-72d8-4ed0-a63f-3dd21473b23b@quicinc.com>
In-Reply-To: <1518bded-72d8-4ed0-a63f-3dd21473b23b@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 12 Aug 2024 08:45:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UfE99Q1aQfPk61WzqK+kbMd-htWstjWUqgCvK1fqfWPw@mail.gmail.com>
Message-ID: <CAD=FV=UfE99Q1aQfPk61WzqK+kbMd-htWstjWUqgCvK1fqfWPw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/panel: jd9365da: Move "exit sleep mode" and
 "set display on" cmds
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>,
 neil.armstrong@linaro.org, 
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

Jessica,

On Thu, Aug 8, 2024 at 3:56=E2=80=AFPM Jessica Zhang <quic_jesszhan@quicinc=
.com> wrote:
>
>
>
> On 8/7/2024 3:04 AM, Zhaoxiong Lv wrote:
> > Move the "exit sleep mode" and "set display on" command from
> > enable() to init() function.
> >
> > As mentioned in the patch:
> > https://lore.kernel.org/all/20240624141926.5250-2-lvzhaoxiong@huaqin.co=
rp-partner.google.com/
> >
> > The Mediatek Soc DSI host has different modes in prepare() and
> > enable() functions, prepare() is in LP mode and enable() is in
> > HS mode. Since the "exit sleep mode" and "set display on"
> > command must also be sent in LP mode, so we also move "exit
> > sleep mode" and "set display on" command to the init() function.
> >
> > We have no other actions in the enable() function after moves
> > "exit sleep mode" and "set display on", and we checked the call
> > of the enable() function during the "startup" process. It seems
> > that only one judgment was made in drm_panel_enabel(). If the
> > panel does not define enable(), the judgment will skip the
> > enable() and continue execution. This does not seem to have
> > any other effect, and we found that some drivers also seem
> > to have no enable() function added, for example:
> > panel-asus-z00t-tm5p5-n35596 / panel-boe-himax8279d...
> > In addition, we briefly tested the kingdisplay_kd101ne3 panel and
> > melfas_lmfbx101117480 panel, and it seems that there is no garbage
> > on the panel, so we delete enable() function.
> >
> > After moving the "exit sleep mode" and "set display on" command
> > to the init() function, we no longer need additional delay
> > judgment, so we delete variables "exit_sleep_to_display_on_delay_ms"
> > and "display_on_delay_ms".
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com=
>
>
> Acked-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Does this Ack mean you're confident enough about this patch that we
should go ahead and merge it, or do you think we should wait on
anything else (like Neil getting a chance to look at it)? As I
mentioned in my reply to the cover letter [1] the patches look OK to
me but I still don't consider myself to have a wonderful understanding
of the intricacies of MIPI DSI. If you think this is OK from a MIPI
DSI point of view then we can land it...

[1] https://lore.kernel.org/r/CAD=3DFV=3DWCw6pAump-PUFCW0cgbRY+5_2tPNLe=3Dh=
N3-dnXD=3DB6MA@mail.gmail.com

Thanks!

-Doug
