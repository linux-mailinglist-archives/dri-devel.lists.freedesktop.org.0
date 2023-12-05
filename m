Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C5E805CD7
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 19:05:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AA0210E5DC;
	Tue,  5 Dec 2023 18:05:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03B1910E5DC
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 18:05:35 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-54cd8f5bb5cso2682865a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 10:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1701799530; x=1702404330;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/V+PxHL1FW8rgKB1502EvHkVxrAYI9iWPYYV+GrNQZ0=;
 b=XMVw+IWSa2oJWf9amyqU0t6PDtwECAO5CCIB5wIqWNTum5Iiw2p+dVER3VMaEEzzY8
 8iybagssqvuTTgRR4bqujXaFfTApqdr8rnw88MLFT+yxnMSPdZ8uYh3BG7Xrpw6+TDjq
 YaQaDh0W4TSEhuqo4LI4/1x1f+NBDpPO2EFd4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701799530; x=1702404330;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/V+PxHL1FW8rgKB1502EvHkVxrAYI9iWPYYV+GrNQZ0=;
 b=AB0JDjS/5dj5Iphy1LTWaXOrISEyiajjiV4rJdbM+2PZToNYhks7fqDAnx6Nb0re1+
 TKq2uRFNgO5MitnJ6r9NGn54zymTfU7IBURCessyGzeOYopO8jXcg0o2Jv/9estuFXkX
 BcqDKdbXvoiO4BFcBGdGuzUhRAIrPiaNPLwTx46OqTIk3XMVI837ioZ0Hyf73EMFl9dB
 oWksmJ+hAtftEr/SiMCrtsdixfiZWmssX8duVrvRxr3OprAK3HUBbLogdROK76smQFMD
 b9gVtSFeBfLGy+9srt8Jy1o5+1aAPDWqjzwFYRO0jBzXAOPGRK6zYf/OV/GIY90fV5ae
 6lNA==
X-Gm-Message-State: AOJu0Yx3nK9+DN658WmIQWenwT8VYhCmXfjlAAaCJEOYwYnqCQ0qRijY
 OtNUbe6SACRqAVRfxuSi27kkczzft4EcAuqv7k7oT8TZ
X-Google-Smtp-Source: AGHT+IGSlR24lMRp9TB1e0CfYqkH+E9rMfeNwE7abqEDNiEPjTPeGYFEYefR5Jvpi9kGk7p9mPB28w==
X-Received: by 2002:a50:bac5:0:b0:54c:4837:7589 with SMTP id
 x63-20020a50bac5000000b0054c48377589mr4564241ede.53.1701799530543; 
 Tue, 05 Dec 2023 10:05:30 -0800 (PST)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com.
 [209.85.128.42]) by smtp.gmail.com with ESMTPSA id
 i21-20020a50fc15000000b0054ca3df2257sm1400302edr.36.2023.12.05.10.05.29
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 10:05:30 -0800 (PST)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-40b35199f94so3175e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 10:05:29 -0800 (PST)
X-Received: by 2002:a1c:7202:0:b0:40b:4355:a04b with SMTP id
 n2-20020a1c7202000000b0040b4355a04bmr588480wmc.6.1701799528753; Tue, 05 Dec
 2023 10:05:28 -0800 (PST)
MIME-Version: 1.0
References: <20231205123630.988663-1-treapking@chromium.org>
 <20231205123630.988663-3-treapking@chromium.org>
In-Reply-To: <20231205123630.988663-3-treapking@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 5 Dec 2023 10:05:16 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VPLmM8CJY91M0JiboB2efk=td45geo_1oD_eXsRgfSJA@mail.gmail.com>
Message-ID: <CAD=FV=VPLmM8CJY91M0JiboB2efk=td45geo_1oD_eXsRgfSJA@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/edp-panel: Sort the panel entries
To: Pin-yen Lin <treapking@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Guenter Roeck <groeck@chromium.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Dec 5, 2023 at 4:36=E2=80=AFAM Pin-yen Lin <treapking@chromium.org>=
 wrote:
>
> Move the order of CMN 0x14e5 to make the list sorted.
>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> ---
>
>  drivers/gpu/drm/panel/panel-edp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Pushed to drm-misc-next:

4900e0396e59 drm/edp-panel: Sort the panel entries
