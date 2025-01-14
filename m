Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47657A10E33
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 18:51:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CDD410E44B;
	Tue, 14 Jan 2025 17:51:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="CUqL47F6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0B0C10E44B
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 17:51:26 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-436326dcb1cso41459235e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 09:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736877025; x=1737481825;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r7kyhS+AN7mALzi6gxFmcRFltHcX9PkTUE9xxZswSTo=;
 b=CUqL47F6D+4EVXCWCOqDQG7qOxvaJ1HxVB7utv3AUJb7XsmPHWSRlKUkmvxP0wHiGn
 wDdPLXp0kQOEzJ0tCeAWgHn24xZlrODhEDHMJMoGzJxavqBxYU7kaKuEdZr75UfoaSGl
 mrTipYTDOqX7lGUxCmV0dj89BiKjdyAW+1GOGNLhQv1JLCE4FOZMHQyi/YxbKdXkAd3O
 aOWnZZG9EMZS6J0dSUr4xq8FpQ7NpMGlhWgsS1D0h/9jjDmk7GvjqVSdJCNEM3/h8R+C
 ermCtr/BK4ieYGLqWwwdNiQF+qQUe89e9cAkZNs4nPkZmzsF3Nvsczh9Vyz2SckZ6v6H
 OOMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736877025; x=1737481825;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=r7kyhS+AN7mALzi6gxFmcRFltHcX9PkTUE9xxZswSTo=;
 b=UWp1cV+mbKLalogvUTFPsQilFIkckQtcWyiQtlm9LsOR8b3kPKfqwg8W44vxKgMjzN
 3sVjpEuiI+aeBNTB3qB6p1qkuu1JXUYlPUKR3RUH92EZ6VBPqfnJGVj5cD76QLgMdEcv
 BdwI90JbWVlFAOy3OQ9806eNVO4XOxCqjAShd3oYrqzZzjyKfXCmTuR4/KfZ4gZK/us/
 Mi1ywnxkYz/qaBtPpySXaRxE8mTStVGqQ1HujYClcbamdRhC1pi7rkywIw7hRTfbzZaT
 GcG8xjrNIOblOQTFfUfwexTRrQp77HzTmu9LmKLxKmlkA9Ph4Qm6H0kAXQYyQJgG2SiS
 NOoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhUyC4o4VG2IW4mChLMWFOPnltMS3erelcAlqgI5Kk1Msfna61pnkMSn3p7v14QhjCdElSn92BuPM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+fC3EHF3O6s1Cf6qJwl6e0t8RyiUoScLMCUsxav1d03zmNTHM
 MYEnWGJqUjC2BwbN16lD1idz0Lq0kMnGAMNjJouRJQZ1ERW63odh95ug0oKmW+NCxbZEA8Vhebx
 L
X-Gm-Gg: ASbGnctUMeqDTFJLdQLd760krpZJiiVdmSHzfhemtsKSFxjLprCAc5UtTzSNiYYOAy2
 WEWrcpz9JkuC/y7W8u3RH1GWcafvO/drZXUKZZofN7vPovFqMhDtasnNqkTL7jeLNU3AI2L6e9L
 d+2KE2DsWngHnkcTmHq1/qNoblE6Eiqyiu8YNoS9s0rrBXM7sZML+qVVmQqH6cXJIYHR7NeEU6O
 nlZXKJ+j2F/9jhQORNoaq8M2BPKAiShQ1tVI4bJQjPchL6LWfV6FHHP
X-Google-Smtp-Source: AGHT+IGniaS5vKpw5UThOug4qTnk81tkkU2MITchcBy/hQw5sKSXoGOKno5PQ4PZG23+YM4eJ9Ctww==
X-Received: by 2002:a05:6000:1547:b0:386:391e:bc75 with SMTP id
 ffacd0b85a97d-38a872debb2mr24343563f8f.16.1736877025045; 
 Tue, 14 Jan 2025 09:50:25 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:317c:3d93:b7d4:96cd])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e4c23dcsm15192221f8f.101.2025.01.14.09.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 09:50:24 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: ao.xu@amlogic.com,  Neil Armstrong <neil.armstrong@linaro.org>,  Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>,  David
 Airlie <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Kevin Hilman <khilman@baylibre.com>,
 dri-devel@lists.freedesktop.org,  linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/11] Subject: [PATCH 00/11] Add DRM support for
 Amlogic S4
In-Reply-To: <CAFBinCDG2in4ZZAp2LXnz8bgiZoPL3G_c9+aCo9+Ort2W-tFCA@mail.gmail.com>
 (Martin Blumenstingl's message of "Sun, 12 Jan 2025 23:44:52 +0100")
References: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
 <CAFBinCDG2in4ZZAp2LXnz8bgiZoPL3G_c9+aCo9+Ort2W-tFCA@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 14 Jan 2025 18:50:23 +0100
Message-ID: <1jwmex5lpc.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

On Sun 12 Jan 2025 at 23:44, Martin Blumenstingl <martin.blumenstingl@googl=
email.com> wrote:

> Hello,
>
> On Fri, Jan 10, 2025 at 6:39=E2=80=AFAM Ao Xu via B4 Relay
> <devnull+ao.xu.amlogic.com@kernel.org> wrote:
>>
>> This patch series adds DRM support for the Amlogic S4-series SoCs.
>> Compared to the Amlogic G12-series, the S4-series introduces the followi=
ng changes:
> Thanks for your patches. With this mail I'll try to summarize my
> understanding of the situation with the drm/meson driver as I'm not
> sure how familiar you are with previous discussions.
>
>> 1 The S4-series splits the HIU into three separate components: `sys_ctrl=
`, `pwr_ctrl`, and `clk_ctrl`.
>>   As a result, VENC and VCLK drivers are updated with S4-specific compat=
ible strings to accommodate these changes.
> Jerome has already commented on patch 3/11 that this mixes in too many
> IP blocks into one driver.
> This is not a new situation, the existing code is doing exactly the same.
>
> Jerome has previously sent a series which started "an effort to remove
> the use HHI syscon" [0] from the drm/meson hdmi driver.
> In the same mail he further notes: "[the patchset] stops short of
> making any controversial DT changes. To decouple the HDMI
> phy driver and main DRM driver, allowing the PHY to get hold of its
> registers, I believe a DT ABI break is inevitable. Ideally the
> register region of the PHY within the HHI should provided, not the
> whole HHI. That's pain for another day ..."
>
> For now I'm assuming you're familiar with device-tree ABI.
> If not then please let us know so we can elaborate further on this.
>
> My own notes for meson_dw_hdmi.c are:
> - we should not program HHI_HDMI_CLK_CNTL directly but go through CCF
> (common clock framework) instead (we should already have the driver
> for this in place)
> - we should not program HHI_MEM_PD_REG0 directly but go through the
> genpd/pmdomain framework (we should already have the driver for this
> in place)
> - for the HDMI PHY registers: on Meson8/8b/8m2 (those were 32-bit SoCs
> in case you're not familiar with them, they predate GXBB/GXL/...) I
> wrote a PHY driver (which is already upstream:
> drivers/phy/amlogic/phy-meson8-hdmi-tx.c) as that made most sense to
> me
>
> Then there's meson_venc.c which has two writes to HHI_GCLK_MPEG2.
> I think those should go through CCF instead of directly accessing this re=
gister.
>
> Also there's the VDAC registers in meson_encoder_cvbs.c:
> I think Neil suggested at one point to make it a PHY driver. I even
> started working on this (if you're curious: see [0] and [1]).
> DT ABI backwards compatibility is also a concern here.
>
> And finally there's the video clock tree programming in meson_vclk.c.
> My understanding here is that video PLL settings are very sensitive
> and require fine-tuning according to the desired output clock.
> Since it's a bunch of clocks I'd say that direct programming of the
> clock registers should be avoided and we need to go through CCF as
> well.
> But to me those register values are all magic (as I am not aware of
> any documentation that's available to me which describes how to
> determine the correct PLL register values - otherside the standard
> en/m/n/frac/lock and reset bits).
>
> I'm not saying that all of my thoughts are correct and immediately
> need to be put into code.
> Think of them more as an explanation to Jerome's reaction.
>
> I think what we need next is a discussion on how to move forward with
> device-tree ABI for new SoCs.
> Neil, Jerome: I'd like to hear your feedback on this.

I completely agree with your description of the problem, that and
Krzysztof's remark on patch 6. This is not new with this series indeed,
so it does not introduce new problems really but it compounds the
existing ones.

Addressing those issues, if we want to, will get more difficult as more
support is added for sure.

>
>> 2 The S4-series secures access to HDMITX DWC and TOP registers,
>>   requiring modifications to the driver to handle this new access method.

Regmap buses are made for those cases where the registers are the same,
but accessed differently. There is an example in the patchset referenced by
Martin, to handle GXL and G12 diff.

> This info should go into patch 1/11 to explain why the g12a compatible
> string cannot be used as fallback.
>
>
> Best regards,
> Martin
>
>
> [0] https://github.com/xdarklight/linux/commit/36e698edc25dc698a0d57b729a=
7a4587fafc0987
> [1] https://github.com/xdarklight/linux/commit/824b792fdbd2d3c0b71b21e110=
5eca0aaad8daa6

--=20
Jerome
