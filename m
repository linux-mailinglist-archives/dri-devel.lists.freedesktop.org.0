Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D69A06B2FBE
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 22:41:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4888C10E8E7;
	Thu,  9 Mar 2023 21:41:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 880E310E8E7
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 21:41:30 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id s11so12693414edy.8
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 13:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112; t=1678398089;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AR1b3GABOQLV0P4AFqJgRYAPV/jd6YPCXWJ10JJ7GQA=;
 b=bVV9zB4PWz/GixwLQd9wj07swwOT/5L8l7AYGlJV39XCgfm5cBj2R76j8n/krnPBNF
 e6HICDvbiaQ1x+XAwjDG08vSRQer/+wTj3q6MkzNMSS3saTFHaS1S2G6cRX2Utbv2eTh
 tWb/JB6UcF+rBSP568bMYcbPnQ2dtX4rPGjdmatlyv7z3GqmrqLzsZq1x3SirUPCsaHu
 LnmAjGvKRmkVtoqaSL09XqXrDe58MJ1OEVF6In8g1AEIakrXwIsRWGh7HbBFoPpaCO4W
 c/kYP+I4vqJB6PSZdBea/WNQx9UYjXpcAk2AfzMmwcdOGOGificFynYzuK2ISXl506in
 VU2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678398089;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AR1b3GABOQLV0P4AFqJgRYAPV/jd6YPCXWJ10JJ7GQA=;
 b=dVToYfx/UBkjOah9RDo03qDJx405LIRSMBxmCwXinNEGiGzmShd4dH/NiExylCM1OM
 JSN3Eo10UJPxRvk7Qujc8iDoGF+mtCTRZI5w3HJyJpfgmzCHtFljGy3xh4Z/1JmAOKit
 ZDgDqlgZ5XmoCEOGDfF/hJt3HEAqVi4z8oDl9PK4MWHJHEVMjvsloFnc7o6V76BpbjU/
 VMCb5s7yCTb/XBv4GIVuAFSfcTtsSOsoSp/tFye+H1dbyvwhi9xL6P9diTNF2hvBb3zM
 ud0sPKpgLEIRkryVwslSkx0jyAGfHI+XgxF50J+pWGM9wOk44QVt80cevSNAXZfTIztP
 AaxQ==
X-Gm-Message-State: AO0yUKUz1nzQH42l591PPJfjYuC6TFZx9nQXL0JSyB5425ZgRBDygQfR
 TrATMNeI+uSJM2A67FMQ1yNiM13sx+0uDM1Lodw=
X-Google-Smtp-Source: AK7set+iplnwVXlr7+v6coCIsyOhlACFhoeoFarKEw4JA1Y6NwVDADLB4DScaPTQyE9qNP613oIHrbUsSOajkyzvD+I=
X-Received: by 2002:a17:906:ce38:b0:8b1:30da:b585 with SMTP id
 sd24-20020a170906ce3800b008b130dab585mr12117490ejb.6.1678398088913; Thu, 09
 Mar 2023 13:41:28 -0800 (PST)
MIME-Version: 1.0
References: <20230306103533.4915-1-johan+linaro@kernel.org>
In-Reply-To: <20230306103533.4915-1-johan+linaro@kernel.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 9 Mar 2023 22:41:18 +0100
Message-ID: <CAFBinCBsC+P=zvh6RF3UKiPnferUYU0QZvZfnn1oS5xWX-65Jw@mail.gmail.com>
Subject: Re: [PATCH] drm/meson: fix missing component unbind on bind errors
To: Johan Hovold <johan+linaro@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Johan,

thanks for your patch!

On Mon, Mar 6, 2023 at 11:35=E2=80=AFAM Johan Hovold <johan+linaro@kernel.o=
rg> wrote:
[...]
> @@ -325,23 +325,23 @@ static int meson_drv_bind_master(struct device *dev=
, bool has_components)
>
>         ret =3D meson_encoder_hdmi_init(priv);
I'm wondering if component_bind_all() can be moved further down.
Right now it's between meson_encoder_cvbs_init() and
meson_encoder_hdmi_init(). So it seems that encoders don't rely on
component registration.

Unfortunately I am also not familiar with this and I'm hoping that
Neil can comment on this.


Best regards,
Martin
