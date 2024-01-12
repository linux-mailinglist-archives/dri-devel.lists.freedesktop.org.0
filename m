Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA5D82BD39
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 10:29:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 514D810E080;
	Fri, 12 Jan 2024 09:29:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79D5110E080
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 09:29:49 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40e5f746ac4so18858655e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 01:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705051788; x=1705656588; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5Vv19tHpCjReP2da8tPiV42geQgpc5fReO5lF8jALPM=;
 b=yPkAkJZlFUFdFnU7CvWUafPeSU0cotVgqzC166T18LBBTmK4TUzQkAp7khMuxqeSQJ
 lBQkMmh+23NNGF/rbV7YEEGUYv2KPZoP117X3lqrusTDo7ss5R79MO+vCkBrAPJmVdzu
 ikB8OChzn56CUKMzGkgKat6ytTMDLk4ikdHynOvDN+GOYmCZM59YoVGnbjV4YK3vO4iQ
 AMD4umn/wMYgbrq97ovnewxToDXCzvp7WJDqWcN4iGvj23g+OVejBb90plzr85yUQyoq
 66EXYFCcjnQxrhg0GOvD5xPbk1RlKxLDqKkoJ+TMGi3qYqurEg0JJw3qmTvNrwEn2osl
 0f1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705051788; x=1705656588;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5Vv19tHpCjReP2da8tPiV42geQgpc5fReO5lF8jALPM=;
 b=a6SstgyTyOozLkvOifaewsAwi+3K6WYd81tFvHMvKkjDrse7xMUv7ZjzdN2zWRdis6
 /TkQAlYp/DbqMSsIusFzfXS5Zwx0k3jhf4JfoEDBoryt3/3l489MLRD0BVuIjrWzCStx
 KsUtRvLuiNuRFp15lIKOxk0RTaHHDhChYutAIiokbcf9iM95BhYtU6rJpfEbBdDbBCgO
 bj3p6TA3r8XScm29ASCHUGxP4ivB/Peb74tJZ/+5U9jBJK5dkLi5pXDHe8FCVsylwfbl
 It+nxvw89eL9dpqZ4POrhhoYVQ8GDnxVw88FpEzCdGEZZETxv9tMHf/fv3+wclHGkxrT
 Z2JA==
X-Gm-Message-State: AOJu0YzKQS1jekyhEW2FPRUtxF5tmz1W0EXixR3XmAftwSF+6S0YaOfN
 1QNmXx//4y5ay3vTK+6aOUYcpIQWfsaIRw==
X-Google-Smtp-Source: AGHT+IHfq+p21PmuJzKnW1fi5VR1SlCHI4I3IuV5Ahp8PV8nI/aY/qvkOQ9nVhXNsSsv24cVvR6Nbg==
X-Received: by 2002:a5d:65c7:0:b0:337:767f:c989 with SMTP id
 e7-20020a5d65c7000000b00337767fc989mr558407wrw.12.1705051787821; 
 Fri, 12 Jan 2024 01:29:47 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 h12-20020a5d688c000000b0033718210dd3sm3311184wru.103.2024.01.12.01.29.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 01:29:47 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Luca Weiss <luca.weiss@fairphone.com>, Arnd Bergmann <arnd@kernel.org>
In-Reply-To: <20231023115619.3551348-1-arnd@kernel.org>
References: <20231023115619.3551348-1-arnd@kernel.org>
Subject: Re: [PATCH] drm/panel/raydium-rm692e5: select
 CONFIG_DRM_DISPLAY_DP_HELPER
Message-Id: <170505178684.964410.13503818885603270120.b4-ty@linaro.org>
Date: Fri, 12 Jan 2024 10:29:46 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
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
Cc: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, 23 Oct 2023 13:55:58 +0200, Arnd Bergmann wrote:
> As with several other panel drivers, this fails to link without the DP
> helper library:
> 
> ld: drivers/gpu/drm/panel/panel-raydium-rm692e5.o: in function `rm692e5_prepare':
> panel-raydium-rm692e5.c:(.text+0x11f4): undefined reference to `drm_dsc_pps_payload_pack'
> 
> Select the same symbols that the others already use.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-fixes)

[1/1] drm/panel/raydium-rm692e5: select CONFIG_DRM_DISPLAY_DP_HELPER
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=589830b13ac21bddf99b9bc5a4ec17813d0869ef

-- 
Neil

