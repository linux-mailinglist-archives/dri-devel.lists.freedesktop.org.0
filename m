Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B11134AF866
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 18:28:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BDE089FE6;
	Wed,  9 Feb 2022 17:28:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0296389FE6
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 17:28:18 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id p15so9363062ejc.7
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 09:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Oj1txH1U8co5rSGx4kpxKWpJZ2ixf2fNLNbwVSTc3q0=;
 b=TZ17UPMEdxa+llRScmyrtRpadlOV+mO6ficAHR/AbUbCAFhwoN3PIaUB+Dm6Yy1A0f
 Lap9E7pm1bPPbls/LT0WD1ZXVJve521S0VzMZKWcqIJZ8FoXJ6v29AZzGfVb0kiDwyy8
 kRRniTdMe2OwrtKbY29vq4LerKI5xG3sWstuS9/M6CmUoaIKOj1qGfgLiPQJ5G5BEnff
 jtOov4q7ZJLAsiQADR5B3Uh9rDuH+PyvxTFR0k4aQGBPtkd8YqVS5ZHgqYhk6cIc2+Bm
 mfdeYS4yAC3P5UVO8zIRO83+oZIIsv6fTa3ouk2e6vWOcRX+dM1inW5vwGLepDNTrXMc
 tHsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Oj1txH1U8co5rSGx4kpxKWpJZ2ixf2fNLNbwVSTc3q0=;
 b=i7kHo+RREAUldDVTItOa5qdQufVor0VWIteYysprDcEFncxcrshPobgCL214UF0NwD
 Zbe2m+LANjl7jm77F5im4G7CUdaSoOegSW6iJ+3auvz/GSGIwWYr1ZhlXg582G1UXIDM
 E67tpOV3WCmNoqT8F3x5l7RMAOibwr6uKB3p5FxpWrPAHTlgX4cKG0BSQh5y9eY/1efQ
 5IK/A3RaZbBFsY7Me+1QkxTH1eLRfN0rCErYD2dBkda6cYW2P82FUltXE+CJFadzjxBv
 3eTmO+aTfEmrcnZBsIWNfMt1hYN6qpBJrt1cjcAyXBIJ69mkf0EB9HUqwt4k8rAHSVgU
 9+Aw==
X-Gm-Message-State: AOAM530+sWFeTpAKoX/9rUlOM2nJ3T5rNsY9llkpSb9eJiidrFXOtzKv
 h2hRnixNRuwFVhyWN4j9nDs=
X-Google-Smtp-Source: ABdhPJwE8armPOf2NcDudp4zU/H+APwY24uygKTAnE1PUaB/Qllz6QBMp5oDqRIgi8n1WHvAqkrNPA==
X-Received: by 2002:a17:906:2bd9:: with SMTP id
 n25mr2924545ejg.359.1644427697091; 
 Wed, 09 Feb 2022 09:28:17 -0800 (PST)
Received: from kista.localnet (cpe-86-58-32-107.static.triera.net.
 [86.58.32.107])
 by smtp.gmail.com with ESMTPSA id q7sm2330396edv.93.2022.02.09.09.28.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 09:28:16 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Pin-Yen Lin <treapking@chromium.org>
Subject: Re: [PATCH] drm/bridge: anx7625: Fix overflow issue on reading EDID
Date: Wed, 09 Feb 2022 18:28:14 +0100
Message-ID: <3151389.aeNJFYEL58@kista>
In-Reply-To: <20220209055327.2472561-1-treapking@chromium.org>
References: <20220209055327.2472561-1-treapking@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: Tzung-Bi Shih <tzungbi@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Pin-Yen Lin <treapking@chromium.org>,
 Maxime Ripard <maxime@cerno.tech>, Pi-Hsun Shih <pihsun@chromium.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Xin Ji <xji@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi!

Dne sreda, 09. februar 2022 ob 06:53:27 CET je Pin-Yen Lin napisal(a):
> The length of EDID block can be longer than 256 bytes, so we should use
> `int` instead of `u8` for the `edid_pos` variable.
> 
> Signed-off-by: Pin-Yen Lin <treapking@chromium.org>

Please add "Fixes" tag. With that:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


