Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0962BA798C
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 01:58:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98E4110E1A4;
	Sun, 28 Sep 2025 23:58:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cSoHnoWi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CEF910E18B
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 23:58:10 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-57e03279bfeso5580356e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 16:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759103888; x=1759708688; darn=lists.freedesktop.org;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yljnIlU4v2VwJK3/t+Nwxj+G8c/okseAmLmguNulAtk=;
 b=cSoHnoWis5kmamz9BZ2ZppgG2pyG398Yz3izuS7xTHPn1A6UFKOLxhQI90B1LEkNl/
 1hjafPCP9os2DjZ7O51wziELLdBW0bGsCQtoPFBG3GD3hGIPXtmFfydemDxNZF1Q1W87
 4lzjOME4hwRfncP8U/pfevkK83Nbs7LmGyDirKrxx1CNHD1MP3lxht6f9WLFKA+7XB1S
 LuJbf/ST7HAh6NqzmUm7AaMfZQW2f2fJnu69f2qIOrlCW2f6oP3MSTQypSygNR6bUddd
 lVjMEhPxai5YZhzJwWAzQ7Rpz4pxwECNzPFizC2JF5rtWe2phgt3MXyHmy9/n6JtZRgy
 IjVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759103888; x=1759708688;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yljnIlU4v2VwJK3/t+Nwxj+G8c/okseAmLmguNulAtk=;
 b=HjVFXBiI35UUJ3wFhgiyubWuninwwrzdWhaCGMbOylWU1Y3vNJVbgIfYPjnLkQxweb
 XOtITlhbk4Pdh7PScl6/4YU6ZTWo/lsUhmOm8BjEJJ/hTP5FmAepFaz8knX0zjSfGmPL
 uwLCRunRWYfkEO1elmjVaquv59oQ4zem1V9qsD3EzAfdpbUV26m8wly0hXI9o/Vdx72T
 imUMymVSNks3w1WFPf38KUl3AOcN9a2D/E+de0SuPboZfNf9AZf2j1AK4B3QzSL2/CZG
 lnoI+F50fe7MrQr/FAouIOWfKMFtgaY5e0HJFMbXy7rXEkd++ASoeCmDwHySyiSLAauA
 y9cg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1r+71dl588Y1TCD9pupLKQ+StPic5/w62vgZpkLXoSmn8keMGxt/VA9bjJcxqa+FjYpDCKAE1FNk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7Mj6jKPZtMEFl5s1aUZiDCvYArxs4t+83Kyr2LK+MtWu42pmp
 ASW+x9MhTygyqh0baG0LDXcn+LdxzJdHNbdXRkY6ojDzaNBDIDVBcN3L
X-Gm-Gg: ASbGnctwo9oFMHmSYzKsOjD8tJ6qVCSSPZt7QRHR6++VDQOVCeAXYLXNB2+7AAAQ5hh
 +5MI6isRz+M2YV98iAAcMeIGQBlBfYWgMNYDxdzAuHUygxWbcVnjZyxDdQ/8PwIMVe1/jqH/4cw
 waPFV9By760H926Su2fRT/l/+zG0hH891m2PJxOwQYOyAujyeuLJHzZVkVXOzqvHXRW0Coi8Ar4
 0DqWXpIf6+SkI3wdXVx86tHj2ZVwQNVr8hWtt9po7YHQyvlMRvDVAP79JbHqz3NNeIK6U6tJe/D
 QNvyCf/PG4plwvwR/aNDpGm9Ywms9f9beFhBy+66rpW9ddAlpGxiRAVyHbwWW5Gnr5rYIXTpy+D
 UYwSk+CeHbRK36sFBVxpIbnPNzFgeipceePQC8UM3aQPYpZk=
X-Google-Smtp-Source: AGHT+IFatLnH+CWKbIPVnt1XCGsPTWuZfxlrZtyuUOcPTm0iQtnY1bAc/cnSijrrtlSR3Mk4EECIMg==
X-Received: by 2002:a05:6512:3052:b0:57b:968a:6df6 with SMTP id
 2adb3069b0e04-583066e7e35mr4445802e87.18.1759103887574; 
 Sun, 28 Sep 2025 16:58:07 -0700 (PDT)
Received: from smtpclient.apple ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58316c1d303sm3761723e87.123.2025.09.28.16.58.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 28 Sep 2025 16:58:07 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] drm/meson: add support for 2560x1440 resolution output
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <CAFBinCCsTqsn06A5oVXGTW6PgmSQH0bHE+8PSftyWNRAbYUTcA@mail.gmail.com>
Date: Mon, 29 Sep 2025 03:57:51 +0400
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Dongjin Kim <tobetter@gmail.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C8A273D4-5F5F-4BD8-911A-67EC9C3FF1F4@gmail.com>
References: <20250927130239.825060-1-christianshewitt@gmail.com>
 <CAFBinCCsTqsn06A5oVXGTW6PgmSQH0bHE+8PSftyWNRAbYUTcA@mail.gmail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-Mailer: Apple Mail (2.3826.700.81)
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

> On 29 Sep 2025, at 1:24=E2=80=AFam, Martin Blumenstingl =
<martin.blumenstingl@googlemail.com> wrote:
>=20
> Hi Christian,
>=20
> On Sat, Sep 27, 2025 at 3:02=E2=80=AFPM Christian Hewitt
> <christianshewitt@gmail.com> wrote:
> [...]
>> @@ -894,6 +908,10 @@ static void meson_vclk_set(struct meson_drm =
*priv,
>>                        m =3D 0xf7;
>>                        frac =3D vic_alternate_clock ? 0x8148 : =
0x10000;
>>                        break;
>> +               case 4830000:
>> +                       m =3D 0xc9;
>> +                       frac =3D 0xd560;
>> +                       break;
> Initially I thought this was wrong because it's only added for the
> G12A (which is also used on G12B and SM1) code-path, leaving out the
> GX SoCs.
>=20
> Was the 2560x1440 mode tested on a computer monitor or a TV?
> I suspect it's the former, so I think it expected the code to take the
> MESON_VCLK_TARGET_DMT path, which automatically calculates m and frac.
>=20
> I'll give it a try on Friday as I do have a computer monitor with that
> resolution - so any hints for testing are welcome!

The original patch is from Hardkernel sources - I=E2=80=99ve picked it =
several
years ago and then updated values semi-recently after 1000ULL changes.
The user who originally requested that I cherry-pick it (and tested it)
was using an Odroid N2+ board (G12B) with a Dell monitor IIRC. It=E2=80=99=
s not
tested by myself as I only have TV=E2=80=99s not monitors, so it will be =
good
to have your confirmation (either way). If it=E2=80=99s wrong I=E2=80=99ll=
 be happy to
drop it - I=E2=80=99m just trying to upstream and offload some =
longer-running
and allegedly good patches in the LibreELEC kernel patchset.

Christian=
