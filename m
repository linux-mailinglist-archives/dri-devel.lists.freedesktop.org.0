Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D97D8200E3
	for <lists+dri-devel@lfdr.de>; Fri, 29 Dec 2023 18:43:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 068A910E2D7;
	Fri, 29 Dec 2023 17:43:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9435010E2D1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Dec 2023 17:43:24 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-dbd4608121fso6019581276.0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Dec 2023 09:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703871803; x=1704476603; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NksR4Y0NrUvy+Rxpg9VzrCsku+YIs4s2MG0gMgIvcUc=;
 b=bOOml2PYeztknqe9TxC2KlLfKLvViB1yyD3Zv7RX/Ev/bsmHo709s1tCzy4Bc/j/QL
 CMypwuQjrJtLAZ8uH9u7utd/32ULmIbPVWVZ+h9Zja/pVhtEaXpq5myWCJSfCpk4vDxl
 CXy7clZwmVJ+PKSh1kPkrssvxWY6SVK8DuTTN14Bzddf3Os5q4JGj3IOEGYActARFBZw
 fTBIK4L0ButntdzxVxu9HHHcY9agGmwyAm04HVFt059AGi7PuGD/CAogKa7n564qPJwS
 Ypr9bym1+q9lQOGR+OxAmyBmm3pxkw0O8QNbGyAdN+DyC5W6+m161LS/Y7zV5MxTyP5P
 2zeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703871803; x=1704476603;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NksR4Y0NrUvy+Rxpg9VzrCsku+YIs4s2MG0gMgIvcUc=;
 b=q1y4xr5gHfwN71VTdNQRldwKxQWtU7s2tdvGMQuVncQIcL+frx+WntPi/ZeJgDJbJ5
 HtqbV71E5/1oRpsKxZ7Nvyz1jz7jJGpD1+AiZEyQuEXRIqbzZMsbJW1/tWANCD9ubsQQ
 M501RuQPg6c0jniJVykxKzipq/QhsafX6dxLR+WimXCuwyRoDVRhJvihXvkJi3f2XCAI
 je7qY+S1H04USVWAtWUpmKJWFGdt9E4KNXlQEEhEHBGGmG/wB1EptxORmYh844rdaaqi
 KhdFcT33ar7N202VkihI/wqPVErhhQXcBBZUW2Z1l0kcXKpdBUgddl8LODQGODaTE165
 QwdQ==
X-Gm-Message-State: AOJu0YyICqNEMUlSNPy8KubIaVKEKdcfQa4Xm0EhJ6NzqKVRbyyVFuAk
 wYlTigR1ub8+RS4OZ4Q8aAnFb7CK5bpzpUTZPjTs1w4H/mJXdA==
X-Google-Smtp-Source: AGHT+IFnWHAjBL3ppmZayDtDj98vb3SmrehR/QcRTr7cVgxlTrwqWX5c8SlCfehL2vjo/b007G6ikA2wwqzr7RJ6klE=
X-Received: by 2002:a25:9f0b:0:b0:dbe:3259:770f with SMTP id
 n11-20020a259f0b000000b00dbe3259770fmr2678598ybq.71.1703871803682; Fri, 29
 Dec 2023 09:43:23 -0800 (PST)
MIME-Version: 1.0
References: <20231229135154.675946-1-dario.binacchi@amarulasolutions.com>
 <20231229135154.675946-8-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20231229135154.675946-8-dario.binacchi@amarulasolutions.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 29 Dec 2023 18:43:11 +0100
Message-ID: <CACRpkdbHodbAwoaTyxTX4LxYm6ZrBV6m6ht31Y2OaUPxS0Zhrw@mail.gmail.com>
Subject: Re: [PATCH 7/8] drm/panel: nt35510: refactor panel initialization
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 linux-amarula@amarulasolutions.com, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 29, 2023 at 2:52=E2=80=AFPM Dario Binacchi
<dario.binacchi@amarulasolutions.com> wrote:

> The previous implementation did not make it easy to support new
> NT35510-based panels with different initialization sequences.
> This patch, preparatory for future developmentes, simplifies the
> addition of new NT35510-based displays and also avoids the risk of
> creating regressions on already managed panels.
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

The idea is to have the driver adapt to different panels, and encode a deep
understanding just like we do with all hardware drivers.

NAK.

This patch:

- Deletes a lot of useful documentation on how the panel works.

- Deletes defines and replaces them with magic numbers

All it achieves is a bit of "magic sequences because we are used to
magic sequences" and that doesn't look like an improvement at all,
instead it creates a dumber driver which has no explanations at all
to what is going on.

Please rewrite the patch in the same style as the original driver.
The fact that you (probably) are not used to writing display drivers
in this way is not an excuse to destroy this nice structure.

There are things that can be done, like create an abstraction for
sequence encoding with less open coded command issue
statements, by adding helpers to the DRM core, so if that is what
you want to do, then do that instead?

Yours,
Linus Walleij
