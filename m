Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C0E867794
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 15:03:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED1FE10F1FF;
	Mon, 26 Feb 2024 14:03:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="PopbfQts";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B31E110F1A0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 14:02:29 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-412a38e2adaso8268995e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 06:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708956148; x=1709560948;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=bDWI7WdWN/xqchY8MpbLI2Q/P6BoSTpm5HQ84jq3qfg=;
 b=PopbfQts1ny3yQ0yN3ldo5jGBLWuPU2jiLxMxHYtB8VXQslTvn+G/RIe2CXrCdnwXX
 mZRuIyXQgbyefcRXXqUQXSL9BQAA99rVMj/B/JfQhlugc/lzEmzyn6UypY0Bze2oIQ3X
 7xx21y5MvsGo6VZ5fvXwJ+pLHQkXKo/M3g5oHswwr8pzjk4igQ16XXEcYYokh61KnBgn
 tukiW4sNXBf//lVwNxP+chExwGibngnRyZw9Rxhvccty4UYq+O6slcM3Z8ukGf+RcfLn
 R01/2ehQfhk9jrUN6NBiaCE46kXoiWUf/nHZM+469nBhtd6kR8H1m4fPD1iJHqWhV7eg
 9osw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708956148; x=1709560948;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bDWI7WdWN/xqchY8MpbLI2Q/P6BoSTpm5HQ84jq3qfg=;
 b=q38ug0Xjm9fR0udrWik0s1/JcUZgdT5Q4v0lzonEQ/rdGm66SmxZZtCx442JaF9yuq
 7pCM+ToDtmRrwLJYFC7bt6kG8VAOL/4vfKFmORG+bbBkq9q1YG45O6C4o341dgrVDjdz
 jAAWX2+uoWvAlLD8mWM58lBEHG8fE0Jccg+H3llN1vC56FgO0cs99h2tnYOfIDE47657
 UKy5YskrlVF4wTdgPWvEW4QZrSUulc6W3XYKZtFN95nF+EXzG+FST/yfJ/vkFWck/je3
 tMyZ7L5fa5rimDc52V1lOXlhZIyCeB9+KxGIb5EULg9SAMyAsVnQZ+NbvWS8NT10sFAz
 C1ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcXz+5GxFDdZDD7Np+ihoMjjsFQbp4YO8/C2RiuVhXppN/WqbT0kDkt+Y9U/bZz7nx5PXFL39Yx2HnhBXDb8lCLPIx62UmmfI2Dah3pt3p
X-Gm-Message-State: AOJu0YwxNovvqkvn3AwVBgQMby+6TFVyvNmO6egw5cfy1a3ueQoUxwBj
 flo5P0hS2WLhtQDkSaPPkBbDGXNlmM6A1TCoypLS1rbFHqhZ+4bl6dfTorpF9xQ=
X-Google-Smtp-Source: AGHT+IHWP/qkYWdxWpHEOS8rjToyu4G798DZv6YBQMjIkLWJWPFpz5/qUpxUbGtrV03PZ5K0SplPJA==
X-Received: by 2002:a05:600c:5489:b0:412:a1c4:66d5 with SMTP id
 iv9-20020a05600c548900b00412a1c466d5mr2993620wmb.6.1708956147845; 
 Mon, 26 Feb 2024 06:02:27 -0800 (PST)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 d33-20020a05600c4c2100b004129f87a2c6sm2838475wmp.1.2024.02.26.06.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 06:02:27 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 26 Feb 2024 15:01:53 +0100
Subject: [PATCH 15/18] arm64: defconfig: enable mt8365 sound
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v1-15-4fa1cea1667f@baylibre.com>
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
In-Reply-To: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=777; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=35n2GsRcpTZr3lOxOrHagpbcqAgi2905jIabSC1TVuI=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBl3JndJ19aagvtDXuZQ0/9DdusYhsa8CdGoAfiK+Wc
 Gt6z2s6JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZdyZ3QAKCRArRkmdfjHURTqHD/
 934l6M/jGn2yIyXJ+H7MJY3XE3WHJZZH2XV18t06deIoLU2VYNVI9icYiXE3kWlTsugcaBrHFVdLfw
 LXDiTpZeqxap6v7hy3e5BcB+1kBBm0b242bXkAN/yLqPLoa8J+eGpLA0DZ0GuiNZTC0B3qCQi7TPNp
 ZJP2h+BTawbIPutN1ZogugnUa7s7abKX25cXLAfRn+3rFhcDy9hTi4cgLA5b6Y2ozG1nuvVvRsFO27
 9c0fgNdWilfdZbn5EWoPRVFtscYocxq1w1lqCTprO7YNT+I+4c4+8GvaVuuDgaQP33qROKicyT3IsI
 AyAC9o4NYiaUjIX19hIvq0pEopkv22VPMXOShzFztdCon+CTTW56zvJw58DBl8ajyBG/ZEL4i9IwMX
 e2fHAQXvwuMpNj6HVRiWWh1wqstY/tcck7h5HSGoMVnhSBqAKQANmmwyavlPir/cfla8c3Yfr68Eg2
 MpiJbP3Pw/IACIwg/vJ1fH/IB9zbSek9i6bti0FE52dIluxg7MsCM5/ThLq7AA3ac5Lk5U9ay2q80f
 HtfYo59N2TqCcD/MAMTArwQP4w8uyTj+N9U9bSfZ3cmHRAFnYp2Aqt8380CM1TBNqYTo5k3/uu1OqP
 IRbvhiPyZA/odmosICzKALd0F0QjU81jby46zspKro4iZcoEuCxQ6rXSu7ug==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
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

Enable the MediaTek MT8365-EVK sound support.

The audio feature is handled by the MT8365 SoC and
the MT6357 PMIC codec audio.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e6cf3e5d63c3..83aaefb1c866 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -929,6 +929,8 @@ CONFIG_SND_SOC_MT8192=m
 CONFIG_SND_SOC_MT8192_MT6359_RT1015_RT5682=m
 CONFIG_SND_SOC_MT8195=m
 CONFIG_SND_SOC_MT8195_MT6359=m
+CONFIG_SND_SOC_MT8365=m
+CONFIG_SND_SOC_MT8365_MT6357=m
 CONFIG_SND_MESON_AXG_SOUND_CARD=m
 CONFIG_SND_MESON_GX_SOUND_CARD=m
 CONFIG_SND_SOC_QCOM=m

-- 
2.25.1

