Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABEC805CEC
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 19:09:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCD9E10E5E7;
	Tue,  5 Dec 2023 18:09:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 519D310E5F0
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 18:09:51 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-54c9116d05fso3994909a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 10:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1701799787; x=1702404587;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BRQn44/aTuYgsI6zHupZ2XRpsR2rUlkoEa03YW7tLjw=;
 b=dFXKYlM4verThUSB5UPxUTo29jPYq946gt4vffNh7Nn1v6cKXfTy25R5lm5lyhhMYL
 QJKWkfXBqcVoQDhmcjSJQvPYOxfjrrvDPALDTiuy2ZLA52lEVtqNUXcX0DTLBu+MozyL
 j7seL+Oko9YkXnmZUF/7LiJVEYYbA0ZSqBPV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701799787; x=1702404587;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BRQn44/aTuYgsI6zHupZ2XRpsR2rUlkoEa03YW7tLjw=;
 b=XVC7P6KlLAhGznWxKrShvWiQQrsGpD8U7AhUfRWwTx8+w0P1u/4liDclA5IndAzV9o
 Gg+bUtjqfJFazLECSa7iGxxLDIjQzdOpbZyltH5xg044WI21ex3XoFN1LqQK2+aM1GuK
 K2MACtsIQ9PJPQNkwgJjWsz/6o5AfMiNdTvCyy6s2YFyMTavp7TR7VnkgSBgSqfPOFP3
 ZL4Telnl48rJz3PDA3ooeRYRLeO/7ygz5uB5XOcMujlNTTPhSHQwUDsFEbumSk4sBiIT
 gG/wtOrTI3nDpu2b14pEwijRF2v6BiYwgDIP/nUW4apoNZnWjfP4BJoaTIz4mW5tcPoh
 m/bw==
X-Gm-Message-State: AOJu0Ywfh+B728KSc38IHb32/Fwemn5/hQNCWOSlHEi5XEuchmUdsyUU
 qTsfWkI2fovxcDl9dubeK2pbVUC9S2VisBopTw4n426x
X-Google-Smtp-Source: AGHT+IH/l4DA94u1gIyU5Fuop/ok3mTo0p522yztn2qAZ0g4rNE1sLrfR6PnKtVGjUwavTn+jCyI8Q==
X-Received: by 2002:a50:a693:0:b0:54c:4fec:da with SMTP id
 e19-20020a50a693000000b0054c4fec00damr2242776edc.105.1701799787516; 
 Tue, 05 Dec 2023 10:09:47 -0800 (PST)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com.
 [209.85.208.43]) by smtp.gmail.com with ESMTPSA id
 i13-20020a056402054d00b0054c4fdb42e5sm1405185edx.74.2023.12.05.10.09.46
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 10:09:47 -0800 (PST)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-54c79cca895so528a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 10:09:46 -0800 (PST)
X-Received: by 2002:a05:6402:22c4:b0:54c:f4fd:3427 with SMTP id
 dm4-20020a05640222c400b0054cf4fd3427mr221749edb.7.1701799786563; Tue, 05 Dec
 2023 10:09:46 -0800 (PST)
MIME-Version: 1.0
References: <20231205123630.988663-1-treapking@chromium.org>
 <20231205203536.4.Iaa6257fcf9e7fe3ca88c50ab6e5aa3fbf55266d0@changeid>
In-Reply-To: <20231205203536.4.Iaa6257fcf9e7fe3ca88c50ab6e5aa3fbf55266d0@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 5 Dec 2023 10:09:34 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WNJP=aCC1hmSp8h0hgcXxzt1q-nPTPcU159i4OCQ7+_g@mail.gmail.com>
Message-ID: <CAD=FV=WNJP=aCC1hmSp8h0hgcXxzt1q-nPTPcU159i4OCQ7+_g@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/panel-edp: Add some panels with conservative
 timings
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

On Tue, Dec 5, 2023 at 4:37=E2=80=AFAM Pin-yen Lin <treapking@chromium.org>=
 wrote:
>
> These panels are used by Mediatek MT8173 Chromebooks but we can't find
> the corresponding data sheets, and these panels used to work on v4.19
> kernel without any specified delays.
>
> Therefore, instead of having them use the default conservative timings,
> update them with less-conservative timings from other panels of the same
> vendor. The panels should still work under those timings, and we can
> save some delays and suppress the warnings.
>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
>
> ---
>
>  drivers/gpu/drm/panel/panel-edp.c | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)

This is OK w/ me, but it will need time on the mailing lists before
landing in case anyone else has opinions. Specifical thoughts:

* I at least feel fairly confident that this is OK since these panels
essentially booted without _any_ delays back on the old downstream
v4.19 kernel. Presumably the panels just had fairly robust timing
controllers and so worked OK, but it's better to get the timing more
correct.

* This is definitely better than the very conservative timings and the
WARN_ON splat.

* I don't love the "Unknown" string, but it doesn't do anything other
than print to dmesg anyway and at least it conveys to anyone else
reading the table that the timings may not be quite as tight.

-Doug
