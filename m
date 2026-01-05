Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 685BDCF4647
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 16:28:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9D7210E41C;
	Mon,  5 Jan 2026 15:28:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Qe495B2R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CBD110E41C
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 15:28:41 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id
 5b1f17b1804b1-4779aa4f928so336425e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jan 2026 07:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767626920; x=1768231720; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PB6e08EWlcYnnLEyvdrJxsH0lwpkv3EVQiwtaaaiNhU=;
 b=Qe495B2RWO3wZnguEXmvEETEBfyrv+QwtwCXXQsCGzYuBUFGKz0XiF+/YgnWK+tvnw
 SulWuBTtUcSWkqDaXjOAbggsnrPFI7qUQFWDoupSH98wOenLJLAOusl/r/QBqBV4BWnB
 OrSiZLYMw5P3noGWf9+hiXHVGroXr0D1019quvK1ET6o/iqPSAdMvg5MsVXh3mSoi4mo
 psYF1yE+5JqFdCWvjlesLIHx5gNdQKKMn6nfHvoRdYjLC0wdcnRXRihT7vwBJ33Jzzfe
 GK22MH8m1WNHn5QbybyUmm0ERcS829cmHd9ZOHjknyIwmEQma8M28oPEh5/QobUzDmQU
 bwMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767626920; x=1768231720;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PB6e08EWlcYnnLEyvdrJxsH0lwpkv3EVQiwtaaaiNhU=;
 b=wGFLASp3Pl34ooM82d08DYWL1tAuQjyq/G5O7Bfv1vs8fNFZGIK6psPFGE0HXtAZhO
 eKvtthHI5Y4fPSzRPVe/6Mgzj1iAxQuYOiE4y5NdgSAdu6FcpMp7vk/IK5zwXBjOAOSj
 zANaJXckN4EMgHgUO1Oc8V7PobL3Vs/HxiqISQak7M797CGpGRiTf21JTwXOn22hQ9p4
 xZmOsWkSazlrDBKXUdTX6rlFDsrf9C454dMc0Owsjb4mBxwjEkgxTxCleab8IHasTIRe
 AxC5hhnNVfo7UZrM2cPVxxiHLRYTgZIt5ZTWr0AVY3x5uDRyL6FOa1GBc9fKglcIExB+
 iHDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYAf/C1tpYR7FSdcZ+i7GequlOMSZTH1/87EBIWq0MkoaT4eiFbbUGyXyFYAL8mIVV0dI+OqghyXM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXPSWz8b/5XtZAuoYrPL898BSc4pJReyCp0f2CXCwpa4GFlgKX
 wWdHPLG8ZFBK8wgFvptrOXz7nzNlwmQvxqJIgP2C9uI8XBz5B1/SJVRjV2XAp/sjlqw=
X-Gm-Gg: AY/fxX4YY2hIqUQt0Vui0Pl8DM32x6woQneK7jW3ddQUJd/MpJWJUSBGCMGofpAZYAG
 DOVBylE+wWApOYHrClfohROwXCcL3vN6iIlYnKc6MGMvpsxo+MGYv1YmJcqNn437XiFO0korJEv
 hj8wTFyh7wMLy7fuqwXiGBtgIAJnim3zb1uwsYC3ST54gDMm1ZB1wFko8C7+LbjLlGjZm7qmq73
 zaGfEnYctMCklsH7Da24229Eld0hLcAZlLZWgZiL6xYLwt3O+oq2ScKt5xbF9VT1ejoEfRgQPoR
 5nJdx2t5nA45zCYitWLbiYkX270ZlFtCq9ctajcnPTvCLyZt5JFL6B3CZUh2Elpi6Z9tzupm3b6
 qeh3UQHNVjwBRVkNlDQqM4juyUXnxEh1mVJ1pCElawXEclxDIoALloxnJTHi13aprwM8l1r82dQ
 G+CoCnrTdfSAvNDqOTRd+Zi9YFWh9Ijn0=
X-Google-Smtp-Source: AGHT+IF9dg3EzRKJCUJkIpaOYmPDVUtUlHUdtyUXwFpDzaH40VuJcbLqERy5ln9Blgk3u+fx9gjH6A==
X-Received: by 2002:a05:600c:1550:b0:477:7991:5d1e with SMTP id
 5b1f17b1804b1-47d1958b250mr638504575e9.25.1767626919903; 
 Mon, 05 Jan 2026 07:28:39 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d6c0c148bsm58247155e9.18.2026.01.05.07.28.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jan 2026 07:28:39 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 tobetter@gmail.com, christianshewitt@gmail.com
In-Reply-To: <20251108134236.1299630-1-martin.blumenstingl@googlemail.com>
References: <20251108134236.1299630-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH RFC v1] drm/meson: venc: add support for HDMI DMT modes
 up to 3840x2160
Message-Id: <176762691920.335654.10635601419658872459.b4-ty@linaro.org>
Date: Mon, 05 Jan 2026 16:28:39 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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

Hi,

On Sat, 08 Nov 2025 14:42:36 +0100, Martin Blumenstingl wrote:
> Commit 5d0bfe448481 ("drm/meson: Add HDMI 1.4 4k modes") added support
> for HDMI 1.4 4k modes, which is what TVs need. For computer monitors
> the code is using the DMT code-path, which ends up in
> meson_venc_hdmi_supported_mode(), which does not allow the 4k modes yet.
> 
> The datasheet for all supported SoCs mentions "4Kx2K@60". It's not
> clear whether "4K" here means 3840 or 4096 pixels.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/meson: venc: add support for HDMI DMT modes up to 3840x2160
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/26ce0b87a815c71d24fd193a81c06daefb60959f

-- 
Neil

