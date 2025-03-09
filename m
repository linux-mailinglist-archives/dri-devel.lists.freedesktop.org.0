Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6BDA58844
	for <lists+dri-devel@lfdr.de>; Sun,  9 Mar 2025 21:54:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F111510E323;
	Sun,  9 Mar 2025 20:54:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="U8QN12nZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F14BA10E364
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Mar 2025 20:54:11 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-abf4b376f2fso665587266b.3
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Mar 2025 13:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741553650; x=1742158450; darn=lists.freedesktop.org;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kSm+onMEHwFJZpJzuOCRbpMFcD/0+q6u6nZOZEP268Y=;
 b=U8QN12nZgLwAxAt1kqTVe95kreOq0JcV5OWUe9IMuOuK/fdcs5+bzENcdHnqVa9vnI
 t+XH2feV2pe8PvQr7/shNEAXu4qneW9QpN5jTRjiDqBdUJlse/YA1zV6cUEV5oeWDuvl
 P/mDVqMaH05lAPDpllErho7e3X3FrYaPtWf/roUzbhSfZOv1s5EVqKdAJrl1hufOk8i7
 ExcrPyXTB9ZkJkisMfyPwC56aSLijZHBZYTk3jrG5bPTqvsl/4+G+6I8wh/S6pgcTYqH
 bDGOKpf+W2J1Sr45TAyvL3wHl9S9U9jJX4Lg69sF0dV0fdqC3ny1O+aFX8eHeRgw52Yc
 thNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741553650; x=1742158450;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kSm+onMEHwFJZpJzuOCRbpMFcD/0+q6u6nZOZEP268Y=;
 b=Z7y/3VNkuGljsMTsa+HF/kEnuODpw3j5yZE1PAVuPPL0fGV8mWVUeBwfvE5KK55LEM
 tLUeshKpcg2/U7tqibhcNlhaERfB5WSdkeZqGi4eKN5itC6BAmlOM19mYlXVDtGeeq3q
 ylplLNqvKXUuIz3hzHFIC/Xpuos+2uEbvyk6h7mMCeh2foRY3lria5xpsp3w6kf37Ey/
 ArZY2zXHmBBNP6P21SxYHWMQv4xZNU2aH1hA271T2UUCDeJtY/gXHme8gxPYtrfnmTcj
 BFtrkbLPbRO0SUgHdxpeCjs2UEoirknilzGMFXZwm2kOJHCef/FWL5KewgBHhAIBNaQq
 7/EA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrTZM0GQbkVNrkgQF126cFLmwc5kIimq2BJ+8GhwQiaXEG/JHN8gakwd4b86PNEu6Uh6QnmVriG4E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmWx94gDrRZtjw09/HiGlsuZHRvljiWmA6kSdHr0Q9iUr8eS6t
 bcyUWxAhoaMLy9ae4seVI48JBywHoHm2EBzqW83j9NccvF7vYEtN
X-Gm-Gg: ASbGncsHOLjF7O1Lapc0XMsrX35fl1hNg4DcnvjavmB2HRJkelDDj0s8nRv5Igwtb53
 id/RvTZ9Lf15DU/ygkx2JUjtAaHRemddvdJaRskx3qjr9jNC2/QztRx/AwUWHo0DSSmo9xZhERq
 nLcnhKWmy/2ij8QNa3pB1rrYaLXvOsm25CW8dgA6CLHMo2MwQWZ2oENZlDVUha8c+jEHeC22tEc
 J1vdVjZo2oNuHCDivmICMxV/t/faUQHh5jeU2yiYUKMqlhidRKF0QzXZt+sdUQ7FuMuUyAneYRy
 mypJY4yKLlfzXhSlx6jQxj3o6KaFZ/c4EPGbZMENRa7QN0LKKe0AmbyUL4j7xGdDJUJvX+7igw6
 UUFXs91RqHk0YZ+A5LxaMzpci5g==
X-Google-Smtp-Source: AGHT+IEkphpQpWmxa52E9NmJ7R2K15iVQw2MxsItmN3QV+4Fwm8dnR0PSWqP8wMiR4tkyT8ZY5e5Bg==
X-Received: by 2002:a17:906:240c:b0:ac2:6a7c:142e with SMTP id
 a640c23a62f3a-ac26a7c2295mr672419366b.44.1741553650157; 
 Sun, 09 Mar 2025 13:54:10 -0700 (PDT)
Received: from smtpclient.apple (89-66-237-154.dynamic.chello.pl.
 [89.66.237.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac278a7a7e7sm299767966b.47.2025.03.09.13.54.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 09 Mar 2025 13:54:09 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH 0/6] Add support for RK3588 DisplayPort Controller
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
X-Priority: 3
In-Reply-To: <545cc438.7e3.1956e13a3e2.Coremail.andyshrk@163.com>
Date: Sun, 9 Mar 2025 21:53:50 +0100
Cc: heiko@sntech.de, neil.armstrong@linaro.org,
 sebastian.reichel@collabora.com, devicetree@vger.kernel.org,
 hjc@rock-chips.com, mripard@kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, yubing.zhang@rock-chips.com,
 dri-devel@lists.freedesktop.org, Andy Yan <andy.yan@rock-chips.com>,
 krzk+dt@kernel.org, robh@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <AD2A56F9-B4FB-406B-BE7C-49BB5DFD3BAD@gmail.com>
References: <25401bfa.291d.19564244e54.Coremail.andyshrk@163.com>
 <75189787-28E1-4FC2-8E10-4960B3877A6F@gmail.com>
 <28b0d3fc.bb3.19568f6b5f8.Coremail.andyshrk@163.com>
 <44213B17-FE14-4FB8-8319-1E31BBF6EAA0@gmail.com>
 <74c154b6.8c50.1956aa8c8d2.Coremail.andyshrk@163.com>
 <1573D5D6-AFED-4D92-8112-B0C6BB52D5FF@gmail.com>
 <46c0d239.a4f5.1956b619b97.Coremail.andyshrk@163.com>
 <252BB2E2-4BC5-4402-953D-F7B30EA5DE14@gmail.com>
 <326B91E9-FB91-43C3-B98B-3EF079F313C6@gmail.com>
 <545cc438.7e3.1956e13a3e2.Coremail.andyshrk@163.com>
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
7 mar 2025, o godz. 01:48:
>=20
>=20
> Hi Piotr,
> =E5=9C=A8 2025-03-06 22:28:08=EF=BC=8C"Piotr Oniszczuk" =
<piotr.oniszczuk@gmail.com> =E5=86=99=E9=81=93=EF=BC=9A
>>=20
>>=20
>=20
> All dump information currently appears to be correct, so I'm =
temporarily unsure why
> there is no display on the monitor.
> Maybe try some plug and unplug for the DP cable, or try another cable =
or monitor?
>=20
> It seems that this board uses a DP to HDMI converter? Does this =
transmitter need a driver?
>=20
> I won't be at my computer over the next two or three days, so any =
further replies to your email
> might have to wait until next week.
>=20
>=20

Andy,
FYI:

I done test on mine rock5a with applied Naoki dp0 enablement in dts (and =
only in dts).
No any changes in dw dp driver (so i=E2=80=99m on vanilla  =
https://patchwork.kernel.org/project/linux-rockchip/cover/20250223113036.7=
4252-1-andyshrk@163.com/   )

on mine rock5a ra620 hdmi port works ok.
(I contacted also Radxa about ra620 and they confirmed: ra620 is just =
DP->HDMI converter. No any driver nor special programming/enablement is =
needed)

This tells me that dp0 (rock5a) works ok while dp1 (rock5itx) not.
i suspect issue is probably in =
https://patchwork.kernel.org/project/linux-rockchip/cover/20250223113036.7=
4252-1-andyshrk@163.com/ and is related to dp1 handling?

BTW: there seems to be issue with video modes handling on dp0 port:=20
-playing video 1920@1080@50 - ok
-playing then video1920@1080@59,64 hangs board=E2=80=A6.

hdmi0 works ok. video modes issue is only on dp0



