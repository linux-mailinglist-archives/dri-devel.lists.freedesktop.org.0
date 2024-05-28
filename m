Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E04FC8D1952
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 13:22:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D447010E973;
	Tue, 28 May 2024 11:22:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xSbaYwjy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB28210E973
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 11:22:33 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-62a080a171dso6863047b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 04:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716895352; x=1717500152; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vVnrDTGTD1jTPXsabavO9KRkROagr7tEQ9cYmmbnS2U=;
 b=xSbaYwjyHzbJu48YgeqL7jaE9X4KFzV48kJ3rmcgs/SW2qWOfutJ/YIzsF+yLFyioY
 8idhJ7kJdoer8HoaE/9pzk0Y1V4hixFixmQ1VP7tJtW/jNrDt+SMTyqLY5WJSRV6+PvJ
 XyTVMGyWqAvHhD/awF+zrQrVBsL48DtJfly9J0VsJONEHL5ACpp8yKVT0Sf+YimzpaSz
 Xcc4uYxgvfCq8Anc2YUSu3K1otsZe6UtxLUaKLDP4KLc6XaUqe3OXpARtiptT7jrdzjP
 404xBS4bndwpz0w0JrthhsSRtvUM54WGpGSTmCDT0VMHEuWQA1xyOeiKgYf2w9ke8jqY
 29hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716895352; x=1717500152;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vVnrDTGTD1jTPXsabavO9KRkROagr7tEQ9cYmmbnS2U=;
 b=uUcKhe31gKlChO7+XzZswD7A9nuU7/rWwMYp3M+E3nFKmpM9rQ5ELaHslHwaToULQE
 3MFFJ/Vu6bn57BzFQsvykt9BGO68AEAs9+fxdQzy7AJ55serQIE7Bwt7uqbHOrp4P0Ap
 LGCQ6qo2M/GLWOBZ6eHTL+BT7UhLBH//cjrNYLD0W7IE7i9lU9T38sTUpySgvcPgIa8y
 fuQhvcW19HHP738hxiIi0k6X+QR1NZQfqcHtQyK6cZ9I82gXjKRii/xV1hvX7sk+Y8ZF
 TVCD7pfG9+GgES/RALtPDqiOQQaVYf+vR7zN1hGeIabag7q/d1wxovnC1d+Vu1e/5PCd
 3Euw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7rmL+wepyJ6UZeRGMgVZTKDFsEpgCeFlTjFL5y5ooYboJU8g/XovGGW3ZA4ikulYWVcux6oibAcI/ptuXWIjhECZOlY/kdmMctKLpkCwm
X-Gm-Message-State: AOJu0Yw1Eor/CQfCn9i1nMcEMQe3kzGJ3HPOvTSqZZH9zdNUj8zv0bvt
 lAfC5B89jpqbStLQiiKfzhLpQIx+nsMo5yOVX/fiFKnOkJFk1J5JMp7qclbE1AmGlL0FS9NQk8w
 WrhvtjVlbhsszHYhpNSbNwQq55ISPS0j5TSpNKw==
X-Google-Smtp-Source: AGHT+IHD5J3DLTxyYoMzPiDDOZC0S/UzhoN+Hfi8cgK3hs+6ZRNPHnTS5nc3W1mkS6q9XlpPWh1tPo0b8CZO3gohUX8=
X-Received: by 2002:a25:d384:0:b0:df4:f200:4580 with SMTP id
 3f1490d57ef6-df7721e0180mr12372977276.29.1716895352516; Tue, 28 May 2024
 04:22:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240515014643.2715010-1-yangcong5@huaqin.corp-partner.google.com>
 <20240515014643.2715010-2-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20240515014643.2715010-2-yangcong5@huaqin.corp-partner.google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 May 2024 13:22:21 +0200
Message-ID: <CACRpkdZuX1gi8No1eOC2GjCZOA-1vh5iBokR75dXmc4SLy6ROA@mail.gmail.com>
Subject: Re: [v7 1/7] dt-bindings: display: panel: Add himax hx83102 panel
 bindings
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch, 
 dianders@chromium.org, krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, 
 conor+dt@kernel.org, airlied@gmail.com, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, xuxinxiong@huaqin.corp-partner.google.com, 
 Conor Dooley <conor.dooley@microchip.com>
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

On Wed, May 15, 2024 at 3:46=E2=80=AFAM Cong Yang
<yangcong5@huaqin.corp-partner.google.com> wrote:

> In V1, discussed with Doug and Linus [1], we need break out as separate
> driver for the himax83102-j02 controller. Beacuse "starry,himax83102-j02"
> and in this series "BOE nv110wum-l60" "IVO t109nw41" panels use same
> controller, they have some common CMDS. So add new documentation for
> this panels.
>
> For himax83102-j02 controller, no need 3v3 supply, so remove it.
>
> [1]: https://lore.kernel.org/all/CACRpkdbzYZAS0=3DzBQJUC4CB2wj4s1h6n6aSAZ=
QvdMV95r3zRUw@mail.gmail.com
>
> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Nice work,
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
