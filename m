Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C76E9460A8
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2024 17:39:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 928EF10E17E;
	Fri,  2 Aug 2024 15:39:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="JaReSU7a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE65210E17E
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2024 15:39:41 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-7a1d067d5bbso521603585a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Aug 2024 08:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1722613178; x=1723217978;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GRFINZgqxXlEvcRo25F5fVmBGHphu79yWWl1LkUSdVo=;
 b=JaReSU7aNBWoROO9v+IUOFMrpT7i6k2QIxZHA3u0MZbxCHzoWVe5Tf4uxI6GiJKO7P
 X4UA3sbOqYPjtHhaTkX8HXOxEMw1w43am94dx4IRiW1O8lsYyZ7cnoCASxBZ4GGBSrbL
 yoa+VMf9UPrrL85DjlPtzWUJwik+0QIjTlo9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722613178; x=1723217978;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GRFINZgqxXlEvcRo25F5fVmBGHphu79yWWl1LkUSdVo=;
 b=pWLn40aMrrGOgAq0JQiHqsRfsjsMVj0VHq40KkpdduMnNYwRgm50KkLujoEhITo7PP
 Vaw6QfitCeRy0bW8vgqPIS9nknEKy/ixvwa02lHIjbqzAGfjLBV6xwv3PD5aNML4TXpY
 lp9IBld2p1KseWOVlIkmrvTfaddKmI4AXjCaSraFjtcsQVCptYDRhLWSUbAeRF51xwN3
 f9BOBBXve/Jo20xsn7zvOZ6YvTojQmljub0xS5eQxkjeJ4z2wVT58xdPIspfOw+GhBut
 usaBuQj8BQEQPa4EHTE0HNXgFLt4xG3XEAG5e+fSmo7B4phNiIz5lfIOWg/15q5+6dAq
 qQ/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMaHCTizYbXT/5hn16Z+k0Z60pNu8jXTSRE/stld4ChzUXVoTapS/aeweTgfwX/yAv+0EyS3zSb7n8/8PfhMVudxJzjVy7rebJ3SYtmSJt
X-Gm-Message-State: AOJu0YwKwlWFqwyND6idMhJxyv2k2eOCglOdvczMu2fXsJ654Kt0PkxI
 djBYGo3Rm1/LUqiVtu1U8jHuSFveyJZmrSkvJ4GzBzC6QxraviFU2FFr/1RTmluiA8XClEl3gHA
 =
X-Google-Smtp-Source: AGHT+IFUgQSLWuLsPUGem4ip0y6mnKyHe/PK21JGXY0+mEhsHkcXyMp0iHuIkRf/SanWWOPJQJcLMQ==
X-Received: by 2002:a05:620a:1709:b0:7a3:56dc:d414 with SMTP id
 af79cd13be357-7a356dcd813mr180299385a.49.1722613178342; 
 Fri, 02 Aug 2024 08:39:38 -0700 (PDT)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com.
 [209.85.160.169]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a34f6dcdecsm95992085a.2.2024.08.02.08.39.37
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Aug 2024 08:39:37 -0700 (PDT)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-44fee2bfd28so1151551cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Aug 2024 08:39:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV6N3wtPZq0jam+n/OAJ1wnYUZot9MWavlndRggeyjzSQtiEoD1suK8xGhggOdelHwa93yQnLe0cjtfGYe78Ni3NDlIqUvpHHfEE/pcBGlg
X-Received: by 2002:ac8:7f08:0:b0:447:dbac:facd with SMTP id
 d75a77b69052e-4518c7e5c44mr2509491cf.24.1722613176824; Fri, 02 Aug 2024
 08:39:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240802070602.154201-1-terry_hsiao@compal.corp-partner.google.com>
In-Reply-To: <20240802070602.154201-1-terry_hsiao@compal.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 2 Aug 2024 08:39:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XMmxXY4REZiUTsZA3KZBrUdSzi5DCwuWz5F-9KLZA4eg@mail.gmail.com>
Message-ID: <CAD=FV=XMmxXY4REZiUTsZA3KZBrUdSzi5DCwuWz5F-9KLZA4eg@mail.gmail.com>
Subject: Re: [PATCH v1] drm/panel-edp: Fix HKC MB116AN01 name
To: Terry Hsiao <terry_hsiao@compal.corp-partner.google.com>
Cc: linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
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

On Fri, Aug 2, 2024 at 12:06=E2=80=AFAM Terry Hsiao
<terry_hsiao@compal.corp-partner.google.com> wrote:
>
> Rename HKC MB116AN01 from Unknown to MB116AN01
>
> Signed-off-by: Terry Hsiao <terry_hsiao@compal.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index 2733366b02b0..7183df267777 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1948,7 +1948,7 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>         EDP_PANEL_ENTRY('C', 'S', 'W', 0x1104, &delay_200_500_e50, "MNB60=
1LS1-4"),
>
>         EDP_PANEL_ENTRY('H', 'K', 'C', 0x2d51, &delay_200_500_e200, "Unkn=
own"),
> -       EDP_PANEL_ENTRY('H', 'K', 'C', 0x2d5b, &delay_200_500_e200, "Unkn=
own"),
> +       EDP_PANEL_ENTRY('H', 'K', 'C', 0x2d5b, &delay_200_500_e200, "MB11=
6AN01"),

Nice!

Reviewed-by: Douglas Anderson <dianders@chromium.org>

...and pushed to drm-misc-next:

[1/1] drm/panel-edp: Fix HKC MB116AN01 name
      commit: 21e97d3ca814ea59d5ddb6a734125bd006b66a60
