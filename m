Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4EAA54D05
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 15:08:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21A8810E9A3;
	Thu,  6 Mar 2025 14:08:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jkA+RhBX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4503810E9A3
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 14:08:35 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-5e57c81d5d0so839487a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 06:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741270110; x=1741874910; darn=lists.freedesktop.org;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kWV8ljageqb0izUaC+/nzAbBvrv81I+4eNjdwXRR/Fs=;
 b=jkA+RhBX4whB7w+vAp7KMea6DRUG0DAuOoX8MlegVqi0Oe9R3C5Z6kFlnT/hftn1so
 iKLaCh/uCggUyQZnGeKkEtTe2b3XCUwIoIlvM326KJj+P1w0O42jTIfEuLiPLkv2yM8q
 nt2RmGk3I6EDrXQ2Yvag6DEwliYxVngkj5W39PMa8CuuEHH1aX/xmJFwvUUOZB9Tzhad
 gOiAiY6mLnJlT2JfGMG3EWFRs6AQChCvWR1Q+XibI7kLDT6rPZ6D4dOBS1uOwCJ0V2I6
 nfxWmg9QGI+ZOZdmji72PBldAmrl25sKFypsF57uHGJjEfF/Lp4KP4Lfd4hSBw2ZiTYb
 a1Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741270110; x=1741874910;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kWV8ljageqb0izUaC+/nzAbBvrv81I+4eNjdwXRR/Fs=;
 b=hAAm6qHtKqzHM0fl+1aPftRXNbqTDnBJpDoZv4JUQcvfySgFU6kiZoeKfL3AJvGfNq
 JLQBNKRJkff7F37O8rDOYF8xvkkCU4xKPC2afb14yirxTHc+YcPp+qanxAU5BTI/SseE
 Pe0cLDBxvaiNbEcYgjjfxOaBHIB6PxIr3OwdTfIbakffpvlOrM6LN1uqJwTRX9WjIyQc
 P23LK2YFmXAPDAHIlgyu5AhAYjgtsc9kdomx9+zcPZe447m64rLls2M2unqFY9PNPZPb
 I8u9lVV41DasPJ2GBVrmrEUs9GEgttBBD2Nry5gs5A0KX9mSOvoOQGCk4vRPJZgHxdpm
 KKvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX187XQNeQUsy+IiWzfoPvk8o8YQOhiXVLS7ofY5/ofD6dlyI9rscvLj6NgaF7DkMaf6v58k7rrWNw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSNnxTaEHbUNw8jPJWgh+4/x6PrebxYWDGTOObMeXMeBC4ej4y
 YM5kyMFFuDx8WlpvdsIBzV4+oQsALO+duq++ub5q39W3uTiIv3wJ
X-Gm-Gg: ASbGnctE97WsnpuvBfxTYM9w7INmY7mR4D+GumDb//FxqSIBlNG9HvOFTvGrFqHsRDE
 RxJQJZJaYS4EbZxDzhefwWT4nk+5yOsZAZYIoWVwfyDFEV5HEpSxsSpMwE7RzQCtaqZO7V8qYAv
 gpGrOmxflL3Jp2X5D4RXgHDajFU+E18jbxekSMeiEhNwdD7qT3b86OE6c/MrBhecc4cEG91y+5l
 0U1qAJsCb29FUoDMo11ZuLTZYttOihe4nPHXo2pDB8gm58/aVpA7iJKOKInxj7ZostPCMO6nO9j
 XMhXe3GWiGSQE17Xr8obuOksi75K6SReCOWzhm4I4UF2IPxriDV8GBfMpnHq09ybKh4UzMAKeq6
 3LphBjx1Lw6BwMU1swp2R6kuRHA==
X-Google-Smtp-Source: AGHT+IEjOK8tItru0CnDJMfpuW+YocWEOgCRwuy6WiSEato+NxCIl7mKq10KFt+G6Q2r3z6rTWjduA==
X-Received: by 2002:a05:6402:2186:b0:5e5:be7f:a1f6 with SMTP id
 4fb4d7f45d1cf-5e5be7fa870mr8495205a12.1.1741270109496; 
 Thu, 06 Mar 2025 06:08:29 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.chello.pl.
 [89.66.237.154]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e5c7475e9dsm989794a12.30.2025.03.06.06.08.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 06 Mar 2025 06:08:28 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH 0/6] Add support for RK3588 DisplayPort Controller
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
X-Priority: 3
In-Reply-To: <46c0d239.a4f5.1956b619b97.Coremail.andyshrk@163.com>
Date: Thu, 6 Mar 2025 15:08:14 +0100
Cc: heiko@sntech.de, neil.armstrong@linaro.org,
 sebastian.reichel@collabora.com, devicetree@vger.kernel.org,
 hjc@rock-chips.com, mripard@kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, yubing.zhang@rock-chips.com,
 dri-devel@lists.freedesktop.org, Andy Yan <andy.yan@rock-chips.com>,
 krzk+dt@kernel.org, robh@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <252BB2E2-4BC5-4402-953D-F7B30EA5DE14@gmail.com>
References: <25401bfa.291d.19564244e54.Coremail.andyshrk@163.com>
 <75189787-28E1-4FC2-8E10-4960B3877A6F@gmail.com>
 <28b0d3fc.bb3.19568f6b5f8.Coremail.andyshrk@163.com>
 <44213B17-FE14-4FB8-8319-1E31BBF6EAA0@gmail.com>
 <74c154b6.8c50.1956aa8c8d2.Coremail.andyshrk@163.com>
 <1573D5D6-AFED-4D92-8112-B0C6BB52D5FF@gmail.com>
 <46c0d239.a4f5.1956b619b97.Coremail.andyshrk@163.com>
To: Andy Yan <andyshrk@163.com>
X-Mailer: Apple Mail (2.3826.400.131.1.6)
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



> Wiadomo=C5=9B=C4=87 napisana przez Andy Yan <andyshrk@163.com> w dniu =
6 mar 2025, o godz. 13:15:
>=20
> Hi Piotr,
>=20
>=20
>=20
> Then when you DP cable plugin, you can run command as bellow to see if =
the driver detects the HPD:
>=20
> # cat /sys/class/drm/card0-DP-1/status=20
> connected
> #=20
>=20


Andy,
Thx!

With above changes i=E2=80=99m getting =E2=80=9Econnected=E2=80=9D.
Also it looks crtc gets reasonable mode: =
https://gist.github.com/warpme/d6220e3cc502086a4c95f05bd9f9cf0c

Still black screen however... =20=
