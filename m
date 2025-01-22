Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E72A18FEA
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 11:39:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED8A110E6B1;
	Wed, 22 Jan 2025 10:39:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="21+Kb+Mi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4801810E6B1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 10:39:49 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4363ae65100so73668775e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 02:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737542328; x=1738147128;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wIz5Dg4pJALggVCJV3aAQrkAcnenmZfu2TddhDFfjFE=;
 b=21+Kb+Mia8qWjM6D6XAQofwl+VL9BhehQoivvn3IbxRcg+VnJJJzFYwbf1pge6GCTr
 c196v2XiwYbzORiYrNoD4336qKcwr50T1FQQhVmjVhhtOas+RhbNGjtacZ7Fbs6AlxNJ
 8Uhb+oPDbUScK3K+3QJeg7tnaXI9zDSN1jFJNPRvFqoFIxkdkNK4fuej7cF5znFc3W7p
 Rxe5A4vMeIPKH6dX+76YKatgawkSfoQ8KrJKxhPtJdpdEtOPK8N3WDz53caIKc1F5q9F
 N7kZIiLV4T2SACAtNQ/R0mPGsLCK0g97TEhvIuxtrY8i3IdmnZjAAIcl7a7f59knqRmx
 r5hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737542328; x=1738147128;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wIz5Dg4pJALggVCJV3aAQrkAcnenmZfu2TddhDFfjFE=;
 b=RSauMby+JhUhPbHPzM2V7ZaOcK8IHWDWWXyfPOrU05sxMwRAUShiZ/O65exlIchozY
 ytth33xvvVJbgGN+LY2VoBtr5FNI765meknlAOmELk7fCGZ0v8mkv0X7dVMZQfz2OsZz
 lzdQZl8ps13MRVJJD7PM0HHjsOKqqudt6TMYrLxPkvW611Mz/kdX93hUn6s7tVRltQUE
 zP3VZWR0FC8RyOKlEPd2r5/Tq/o/cya5zCre7ZboyRCh1vGbQdbjSXKekOw2+cfa0Ufs
 O8GU6fDVDhij3oGoNvaL1/Ax8s4jkG2KgHEhsvZrHKnTGgw+O8YqpkFn0qHdZe4Lzu+B
 7nZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9vLbynN8l+WUV9q+HQ8/gttGM599CmU9WS0nqSXrUVXJKNFACIge9/kMrf7u8MNlsGDvV0zOIiuE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyvf6hnvJdgkldEJv2ppj9zJvGlc/2m2cBMQOLeeBVbmS1BZ0qI
 HS+0THQYAdSdCEnQBmSiVJNCOUZdG8eqRT7EPbIn9lBBaIAxJyO7r0bc+WNj5nY=
X-Gm-Gg: ASbGncvzHnFnnwBLDCkij+VVKaU7nG5Bw2o9TMC6PZ3o3X3fIza2KKKcVqWH0S6e1jQ
 4uhyMv2dT719zOZcVlTRRAYIBlHLK1R3/b+wkQU4Oy3uFE90rCIBsg1Ip9XOuHOx6knANdYS/l7
 j8/KkfmX7IIFDfeR1IE71AlDdfhRqpcC1kMXXBiThov9D9DuSnxaN2k3huRZmeeI0NaHhQrA7ms
 sSipeLEHVQQ8yI5Hi0qgT5ULbFOq+sRj76/2hQc+ebeGwrPs1CXld8BbiWAAUtk/5ebnQ==
X-Google-Smtp-Source: AGHT+IGHWICVymyczl4ii8tG0TEJPCRASpGt6Bh6um0Z96LWBrB4SGwG4XeA1Yko2Ghrm1yauaArzQ==
X-Received: by 2002:a05:600c:35c3:b0:434:f131:1e71 with SMTP id
 5b1f17b1804b1-438913cf2e0mr197285195e9.8.1737542328421; 
 Wed, 22 Jan 2025 02:38:48 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:c6fe:2fe2:acd6:8e99])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438b31b1566sm19283775e9.24.2025.01.22.02.38.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2025 02:38:47 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ao Xu <ao.xu@amlogic.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,  Neil
 Armstrong <neil.armstrong@linaro.org>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
 <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Kevin Hilman <khilman@baylibre.com>,
 dri-devel@lists.freedesktop.org,  linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/11] Subject: [PATCH 00/11] Add DRM support for
 Amlogic S4
In-Reply-To: <3aa88bdb-ce84-4029-b497-2502ab1eb7a5@amlogic.com> (Ao Xu's
 message of "Wed, 22 Jan 2025 17:50:25 +0800")
References: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
 <CAFBinCDG2in4ZZAp2LXnz8bgiZoPL3G_c9+aCo9+Ort2W-tFCA@mail.gmail.com>
 <1jwmex5lpc.fsf@starbuckisacylon.baylibre.com>
 <3aa88bdb-ce84-4029-b497-2502ab1eb7a5@amlogic.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Wed, 22 Jan 2025 11:38:47 +0100
Message-ID: <1jldv3i154.fsf@starbuckisacylon.baylibre.com>
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

On Wed 22 Jan 2025 at 17:50, Ao Xu <ao.xu@amlogic.com> wrote:

> On 2025/1/15 1:50, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
>>
>> On Sun 12 Jan 2025 at 23:44, Martin Blumenstingl <martin.blumenstingl@go=
oglemail.com> wrote:
>>
>>> Hello,
>>>
>>> On Fri, Jan 10, 2025 at 6:39=E2=80=AFAM Ao Xu via B4 Relay
>>> <devnull+ao.xu.amlogic.com@kernel.org> wrote:
>>>> This patch series adds DRM support for the Amlogic S4-series SoCs.
>>>> Compared to the Amlogic G12-series, the S4-series introduces the follo=
wing changes:
>>> Thanks for your patches. With this mail I'll try to summarize my
>>> understanding of the situation with the drm/meson driver as I'm not
>>> sure how familiar you are with previous discussions.
>>>
>>>> 1 The S4-series splits the HIU into three separate components: `sys_ct=
rl`, `pwr_ctrl`, and `clk_ctrl`.
>>>>    As a result, VENC and VCLK drivers are updated with S4-specific com=
patible strings to accommodate these changes.
>>> Jerome has already commented on patch 3/11 that this mixes in too many
>>> IP blocks into one driver.
>>> This is not a new situation, the existing code is doing exactly the sam=
e.
>>>
>>> Jerome has previously sent a series which started "an effort to remove
>>> the use HHI syscon" [0] from the drm/meson hdmi driver.
>>> In the same mail he further notes: "[the patchset] stops short of
>>> making any controversial DT changes. To decouple the HDMI
>>> phy driver and main DRM driver, allowing the PHY to get hold of its
>>> registers, I believe a DT ABI break is inevitable. Ideally the
>>> register region of the PHY within the HHI should provided, not the
>>> whole HHI. That's pain for another day ..."
>>>
>>> For now I'm assuming you're familiar with device-tree ABI.
>>> If not then please let us know so we can elaborate further on this.
>>>
>>> My own notes for meson_dw_hdmi.c are:
>>> - we should not program HHI_HDMI_CLK_CNTL directly but go through CCF
>>> (common clock framework) instead (we should already have the driver
>>> for this in place)
>>> - we should not program HHI_MEM_PD_REG0 directly but go through the
>>> genpd/pmdomain framework (we should already have the driver for this
>>> in place)
>>> - for the HDMI PHY registers: on Meson8/8b/8m2 (those were 32-bit SoCs
>>> in case you're not familiar with them, they predate GXBB/GXL/...) I
>>> wrote a PHY driver (which is already upstream:
>>> drivers/phy/amlogic/phy-meson8-hdmi-tx.c) as that made most sense to
>>> me
>>>
>>> Then there's meson_venc.c which has two writes to HHI_GCLK_MPEG2.
>>> I think those should go through CCF instead of directly accessing this =
register.
>>>
>>> Also there's the VDAC registers in meson_encoder_cvbs.c:
>>> I think Neil suggested at one point to make it a PHY driver. I even
>>> started working on this (if you're curious: see [0] and [1]).
>>> DT ABI backwards compatibility is also a concern here.
>>>
>>> And finally there's the video clock tree programming in meson_vclk.c.
>>> My understanding here is that video PLL settings are very sensitive
>>> and require fine-tuning according to the desired output clock.
>>> Since it's a bunch of clocks I'd say that direct programming of the
>>> clock registers should be avoided and we need to go through CCF as
>>> well.
>>> But to me those register values are all magic (as I am not aware of
>>> any documentation that's available to me which describes how to
>>> determine the correct PLL register values - otherside the standard
>>> en/m/n/frac/lock and reset bits).
>>>
>>> I'm not saying that all of my thoughts are correct and immediately
>>> need to be put into code.
>>> Think of them more as an explanation to Jerome's reaction.
>>>
>>> I think what we need next is a discussion on how to move forward with
>>> device-tree ABI for new SoCs.
>>> Neil, Jerome: I'd like to hear your feedback on this.
>> I completely agree with your description of the problem, that and
>> Krzysztof's remark on patch 6. This is not new with this series indeed,
>> so it does not introduce new problems really but it compounds the
>> existing ones.
>>
>> Addressing those issues, if we want to, will get more difficult as more
>> support is added for sure.
>
> Hi=EF=BC=8Cjerome
>
> =C2=A0=C2=A0=C2=A0 What are the next steps for "an effort to remove the u=
se HHI syscon"
> patch set, and what is the schedule?

I have no idea. You should check with Neil whether or not it is something he
wants to do and how.

If you (or anyone else) want to make a v2 out of the first clean-up I've
made [2], you are welcome to. I'm handling other things ATM and I don't
expect to get to it any time soon.

[2]: https://lore.kernel.org/linux-amlogic/20240730125023.710237-1-jbrunet@=
baylibre.com/

>
>>>> 2 The S4-series secures access to HDMITX DWC and TOP registers,
>>>>    requiring modifications to the driver to handle this new access met=
hod.
>> Regmap buses are made for those cases where the registers are the same,
>> but accessed differently. There is an example in the patchset referenced=
 by
>> Martin, to handle GXL and G12 diff.
>>
>>> This info should go into patch 1/11 to explain why the g12a compatible
>>> string cannot be used as fallback.
>>>
>>>
>>> Best regards,
>>> Martin
>>>
>>>
>>> [0] https://github.com/xdarklight/linux/commit/36e698edc25dc698a0d57b72=
9a7a4587fafc0987
>>> [1]
>>> https://github.com/xdarklight/linux/commit/824b792fdbd2d3c0b71b21e1105e=
ca0aaad8daa6
>> --
>> Jerome

--=20
Jerome
