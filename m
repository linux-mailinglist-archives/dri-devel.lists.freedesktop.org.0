Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89069663B17
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 09:32:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8322D10E54E;
	Tue, 10 Jan 2023 08:32:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A17F10E54E
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 08:32:48 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id ja17so8185044wmb.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 00:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g1TFzsY4F93uzkv4BoveW/h5a+CswnlNdRYqVKav/z4=;
 b=wF14M3NRFIJcAUCJ9WSchD86R1xCWLy5PM/NQha35AibDoCaZaKSzgUyYIFC+iV3IJ
 pWYadodEjs69CjVtSmVWZpFvyvqw3REG1PjtyVYSr2eLyClgwVYTfQhwYhZ8MEgBQJhV
 u07wZgKALblLiykMpV6PxcrIuY1nOSqK4ryjno01xPrx+qV83zh4L6keZJLNlWmCRiJo
 rSsU4G5dLk0+TejjxxrzaMv4QWxzDlnckGFyyl49YsdFnLNlyucKqVulDwA9nmePWRhq
 IWGdEYG4TPH66eIs9/o6p+Y5tq4VvErlL4VQJ6FfKqRCIy87amszNdvVpE3DOKTWr3Hk
 tNJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g1TFzsY4F93uzkv4BoveW/h5a+CswnlNdRYqVKav/z4=;
 b=H7Gosrgm5u8q79nKeWrm376p5pZv/CHJM9ArdgZk1N3ZZFOgzzUTo92GJGrGtwRlf+
 1ppj+yQVNi9Za8OpoChAQsnzqqD0kpPe+P1bC+q4lz41uSf6lNY96PlX8A2iyH9tkCEt
 PuvV9oTFY1ai+7GOwpto65oMPOMDhgTwZTPs0a83kmlTUtKDrkFzV5HILCau39Kk7xCO
 iee/VvWFLiZI4FnynuYCmLzqbJto61peDklhhpQ+36z9sA9VnW4+tGZAaAExrv3HFTIp
 QLvXAwaHXsfy6pllzNoAsDfSUP/Ay393Usi4URY9h/lQBF65NfTLIam2Dhj2d7SARFad
 RSbQ==
X-Gm-Message-State: AFqh2kqIYFpnKNMy3tOHklQO9sKamw5UTUmcE7gFlDTWEk7cahg5UVeo
 mnHd8cOGWzMmaa8md9DzEcylEQ==
X-Google-Smtp-Source: AMrXdXtjr5ownIMXxWxHFKAnFJWMeJytFZmJg9YqzEHYXQ8XXn2K+W/Xt8g5sNChDMdyDG1/pl+XPA==
X-Received: by 2002:a7b:ca4f:0:b0:3c6:edc0:5170 with SMTP id
 m15-20020a7bca4f000000b003c6edc05170mr47689049wml.25.1673339566974; 
 Tue, 10 Jan 2023 00:32:46 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 i8-20020a05600c354800b003cf894dbc4fsm15032112wmq.25.2023.01.10.00.32.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 00:32:46 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20230109220033.31202-1-m.szyprowski@samsung.com>
References: =?utf-8?q?=3CCGME20230109220056eucas1p26418012878272961a3a21a365?=
 =?utf-8?q?192ef60=40eucas1p2=2Esamsung=2Ecom=3E?=
 <20230109220033.31202-1-m.szyprowski@samsung.com>
Subject: Re: [PATCH] drm/meson: dw-hdmi: Fix devm_regulator_*get_enable*()
 conversion
Message-Id: <167333956612.1584080.3967652630228708272.b4-ty@linaro.org>
Date: Tue, 10 Jan 2023 09:32:46 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.11.1
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
Cc: Matti Vaittinen <mazziesaccount@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, 09 Jan 2023 23:00:33 +0100, Marek Szyprowski wrote:
> devm_regulator_get_enable_optional() function returns 0 on success, so
> use it for the check if function succeded instead of the -ENODEV value.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm/meson: dw-hdmi: Fix devm_regulator_*get_enable*() conversion
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=67d0a30128c9f644595dfe67ac0fb941a716a6c9

-- 
Neil
