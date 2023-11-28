Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C8B7FC9B6
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 23:42:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C9B510E355;
	Tue, 28 Nov 2023 22:42:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E14E10E355
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 22:42:49 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a02ba1f500fso869479366b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 14:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1701211366; x=1701816166;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ALoEGlhFgB5uPPGu3xj9KOLCNfgqVoia8DwXpxVnje8=;
 b=guveg65pMps1qUR3isSQi/SBxIPhuF6TO3T2AMUXMycFeQuUdRmH5rs5dUqE4bg6P9
 FgDCGjB5PuW0y3j4fvhfwtk6H2VmPQxay89fBiK+IaB0rZ6+OcgMyuFBSHhGZeDOYe7l
 UIKP/oK4TU9bmen9SWFkC+7SWhfcdvvvSMJe4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701211366; x=1701816166;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ALoEGlhFgB5uPPGu3xj9KOLCNfgqVoia8DwXpxVnje8=;
 b=L9eFTMIqjcIWzJeiKkZbEH4s/KrxkGp8t6qmXltqV7rAPQNtaCEfZbNhs9WahwxGwU
 PEOC1Q+aIAS+calvCg0fdmsGoHEq4Jm72/kg7o8oy//2RmygWRehPqG2VI6Za43q+nQk
 cdGLv4KNOBBZffDNhLmPKgkxdeRhAbmUvE65Hd5uXAYeHgzL2eYkfnf/Pi/6Kv049sRR
 DdFmJXTi7Zw0zaxCYyuPORtLhKstPqwfPDp/YqMpP4l4fGwT4i9ihk9vAmdLnCEKoGpe
 V3D7ZJ9lKs9asKp7XPc4cr4QQN+ILpCcR59Msae436OzNAOoRQRb0OVAlqDRufb3ndVd
 6aOQ==
X-Gm-Message-State: AOJu0YwZ396qfK7oqltrNQ2A9TEEVOAnOD/zQenRGB0euhIB3NR7scS/
 4f1tYQ+m80AisQoCyESCIBpOlUy8T/3kjilKppe2Ku/y
X-Google-Smtp-Source: AGHT+IGeVamGQoq83JArsVWnPNSYg3bYmUYAUMGsy2wekLIrttGYNYmxbwoS904O0nEZ06c9T6DOyw==
X-Received: by 2002:a17:906:7151:b0:a01:2a80:f74a with SMTP id
 z17-20020a170906715100b00a012a80f74amr11864591ejj.34.1701211366712; 
 Tue, 28 Nov 2023 14:42:46 -0800 (PST)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com.
 [209.85.208.51]) by smtp.gmail.com with ESMTPSA id
 w18-20020a1709062f9200b009b2ba067b37sm7156640eji.202.2023.11.28.14.42.46
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Nov 2023 14:42:46 -0800 (PST)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-54744e66d27so5131a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 14:42:46 -0800 (PST)
X-Received: by 2002:aa7:d8c4:0:b0:54b:c986:2bc8 with SMTP id
 k4-20020aa7d8c4000000b0054bc9862bc8mr81395eds.7.1701211365772; Tue, 28 Nov
 2023 14:42:45 -0800 (PST)
MIME-Version: 1.0
References: <20231117215056.1883314-1-hsinyi@chromium.org>
 <20231117215056.1883314-2-hsinyi@chromium.org>
In-Reply-To: <20231117215056.1883314-2-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 28 Nov 2023 14:42:34 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VFUnEEkEh5ij05LeHhfpJBTJ=qRwabdmDdt+y7w7C3Pw@mail.gmail.com>
Message-ID: <CAD=FV=VFUnEEkEh5ij05LeHhfpJBTJ=qRwabdmDdt+y7w7C3Pw@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] drm/panel-edp: Add override_edid_mode quirk for
 generic edp
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Nov 17, 2023 at 1:51=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org> =
wrote:
>
> Generic edp gets mode from edid. However, some panels report incorrect
> mode in this way, resulting in glitches on panel. Introduce a new quirk
> additional_mode to the generic edid to pick a correct hardcoded mode.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
> v6->v7: split usecase to another patch.
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 48 +++++++++++++++++++++++++++++--
>  1 file changed, 45 insertions(+), 3 deletions(-)

Pushed to drm-misc-next:

9f7843b51581 drm/panel-edp: Add override_edid_mode quirk for generic edp
