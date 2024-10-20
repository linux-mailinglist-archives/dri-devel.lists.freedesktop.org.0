Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 455ED9A53CE
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2024 13:35:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B213C10E220;
	Sun, 20 Oct 2024 11:35:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vsLyHLQP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A99C10E220
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Oct 2024 11:34:58 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-539ee1acb86so1424362e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Oct 2024 04:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729424096; x=1730028896; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MRt6enI5ko0LZqY7RinaKQGYLU2W/bGx6fEsADiHq5w=;
 b=vsLyHLQPBWoQmv/FrtiLFN1OtUJPT953tIwBsNthX4d9KoegWwuFnSzVAy5HmYwiuC
 WkbGqEQWBMbo6iQfwPy7KE1jJjmutiehNCDEUETxdreGFeto0NncrhEQ6d93j4QWwLP9
 DBqWpSnPxQJD8ubfJ3jdmssC6T84o5JfBnWDevjUSZ5VUK2tRdvIYtmS6SVO5Sx/3Ije
 LeB5YqG7IJ5y4O/HkCF7NkGaV1d4JG0pWWinPe5sUhxRcSVpBlFVeKrSUZL8PNvaznr2
 rOdk5QeOKjeIqUx7eG6nBBveeulnMrSakNGCeUwUyEHAkcSYCO2C7WOt8WUfQpcfFW7i
 GlTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729424096; x=1730028896;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MRt6enI5ko0LZqY7RinaKQGYLU2W/bGx6fEsADiHq5w=;
 b=hZLHMp+mE0epz37SOXjXZPEkXKm0vJclNXp4kGOOGZ7d5igp0Ctu0ZSj9qJ/pT3q6T
 dlj5877AJd8ZkbF81fM4XK1fnfBBv+m78F9V/EJNIziDABTY58UwyS3dm4J241T/YBGs
 zjnkzz4O6M5VRjDoCwyS4GI7DkzjrfP4hooOu5jnvBeqiIEJnmhjIeOwCct7ynXZ1/Gp
 iDuwAbV+kEtQlU6du6vZ+tE2YDeBYCkYDyhQDC0SdL2kszTDg4A9Sb6pC0Y/hvPb8X8S
 hvLBIy/eqMHP2+nzwzhiwfXteNDrFH2CbyKTcYImDqx1YYRP5vkmAe/1czxRsRj9l++n
 eJxA==
X-Gm-Message-State: AOJu0Yzqr52BQDMlsoeJTX2i1Qb99ZGMSSd+ks2yhbUXdwq9kZxiQ56U
 IdTGVH/FInHRf7ARVdWIMB5TccdZW1bncMrtK9VaqJlt5LV1T4FHJzcgDAknAHHYj7k/N3KnRDb
 JiL8=
X-Google-Smtp-Source: AGHT+IFR2NcypCaN4eOHDhvz8LdFW2aNsn9ZbQ+tMnn51f3T95e3n3u1SUNT3hVXdo31XY/fBfGtbQ==
X-Received: by 2002:a05:6512:12cb:b0:539:9594:b226 with SMTP id
 2adb3069b0e04-53a1522dba5mr3787132e87.34.1729424096435; 
 Sun, 20 Oct 2024 04:34:56 -0700 (PDT)
Received: from eriador.lan (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00::b8c]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a22440492sm195656e87.289.2024.10.20.04.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Oct 2024 04:34:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org,
	Ryan Walklin <ryan@testtoast.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Chris Morgan <macroalpha82@gmail.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH RESEND] drm: panel: nv3052c: correct spi_device_id for
 RG35XX panel
Date: Sun, 20 Oct 2024 14:34:53 +0300
Message-ID: <172942408877.2805126.3289122620465684612.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241020083836.175733-1-ryan@testtoast.com>
References: <20241020083836.175733-1-ryan@testtoast.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Sun, 20 Oct 2024 21:37:41 +1300, Ryan Walklin wrote:
> The Anbernic RG35XX devices use an SPI LCD panel from an unknown OEM,
> with an NV3052C driver chip.
> 
> As discussed previously, the integrating vendor and device name are
> preferred instead of the OEM serial. A previous patch corrected the
> device tree binding and of_device_id in the NV3052C driver, however the
> spi_device_id also needs correction.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/1] drm: panel: nv3052c: correct spi_device_id for RG35XX panel
      commit: 45608a3eb4902f32010a8328c0a01ccda4b38c9b

Best regards,
-- 
With best wishes
Dmitry

