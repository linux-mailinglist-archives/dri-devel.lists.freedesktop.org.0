Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3658264D9AA
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 11:46:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83E8510E51F;
	Thu, 15 Dec 2022 10:45:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64F9A10E51F
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 10:45:22 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 b24-20020a05600c4a9800b003d21efdd61dso1492659wmp.3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 02:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KHuddhTs1woKQMA5yxy2mTLY+wNV6WvVLa7elkBE4tw=;
 b=vkk0Z84jrKQRm876NHO6IUZ/gtYYo3q7FnC1uP+EyV2QxKZ3VeWyN+x2wUriqyW07k
 gKhLpngEf5ukIXa2tlu9NbZrQxiZSvpZlqMpGS1OH72wv80WzJMG2mJbM3eVfg2S/Jfh
 cs8NEvYSzUmAbxL3szMKEoVmwxe8Fho2Yj3D3ZFi386cyq0PLOlg30BFfHSIz6WqwrGr
 2Ef5xsIC9DhHlTbyqEMnkhDFt9b4ryWhnjVeAhSSNkIMHp5xHvrTCzhoL+MFRAsw7xKu
 WAj/P2WYxMICJO9H3YYeRaasNOjsvB4RRJb2gUxVU9JPOmBQ+te+cyQPWKhofnECAdeu
 4AhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KHuddhTs1woKQMA5yxy2mTLY+wNV6WvVLa7elkBE4tw=;
 b=RJxfeMev6M+Wvm3yKDo7PiFNHi39qhOcmptwHHzSzXB3DpHOO97tyYO2tceOdMHZhA
 JSmPBS/mTBExnRcJ7Ynz7Xkfd5uZ2nnNdKGCHXWkgpyrVplfQ0vzGyCrcytOAGvwaBfu
 3KzGU8xK9crUIQi/jdqyRfmOX9n2wTEflCsyLdxRMNX7WOJLpBS52u7cAHIi9vHhKGp/
 VGonKHrgcMRjcH/ero3brJdJoG8EK94MxOJAHeiuq28CH54rULKH26UXXdT60mdrbq0p
 3nGQq/99kV9iQPhHmhL2fiR7Wv69lZ+QwPkJkkqpKtPRnPhjvEg5HeLaa+S6JjyvyOOq
 0oHg==
X-Gm-Message-State: ANoB5pk1kZRNkPKrP7L64KTXjWpWXPGhP0VzfJIbnD6hEIpP9xdNtJ6M
 5wsW6KOelrGf3gPisIOSltNf+Q==
X-Google-Smtp-Source: AA0mqf61J2YEn7tAitSvNv7cg8MsrjGIppG7rPDoRjCfzx+1rPn+1m9vchRs7d/GhhC+bfyHG2RTxA==
X-Received: by 2002:a05:600c:310e:b0:3cf:b07a:cd2f with SMTP id
 g14-20020a05600c310e00b003cfb07acd2fmr21041676wmo.37.1671101120589; 
 Thu, 15 Dec 2022 02:45:20 -0800 (PST)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
 by smtp.gmail.com with ESMTPSA id
 m17-20020a7bce11000000b003d2157627a8sm5919771wmc.47.2022.12.15.02.45.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 02:45:19 -0800 (PST)
From: Robert Foss <robert.foss@linaro.org>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Pin-yen Lin <treapking@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH] drm/bridge: it6505: Add caching for EDID
Date: Thu, 15 Dec 2022 11:45:10 +0100
Message-Id: <167110107985.909515.966397009406015766.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221115112720.911158-1-treapking@chromium.org>
References: <20221115112720.911158-1-treapking@chromium.org>
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
Cc: allen chen <allen.chen@ite.com.tw>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Robert Foss <robert.foss@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 15 Nov 2022 19:27:20 +0800, Pin-yen Lin wrote:
> Add caching when EDID is read, and invalidate the cache until the
> bridge detects HPD low or sink count changes on HPD_IRQ.
> 
> It takes 1.2s for IT6505 bridge to read a 3-block EDID, and skipping
> one EDID read would be a notable difference on user experience.
> 
> 
> [...]

Applied, thanks!

Repo: https://cgit.freedesktop.org/drm/drm-misc/


[1/1] drm/bridge: it6505: Add caching for EDID
      commit: 11feaef69d0cb81278294299bbfd86f94c2004e3



Rob

