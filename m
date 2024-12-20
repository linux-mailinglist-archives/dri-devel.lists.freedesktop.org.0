Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBBF9F89CA
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 02:57:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 925B210E4C7;
	Fri, 20 Dec 2024 01:57:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="n26L6Kf0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE2A910E4C7
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 01:57:07 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-3003e203acaso14833961fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 17:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734659826; x=1735264626; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qcxbyvJiOICQMcEs6u323lixswetago60n1o/AkURyE=;
 b=n26L6Kf02qaSIcAqf5XsWqThqSWqmEVCp+wPlXW4VhEywT/SZk0JAWPbIJpxOdEk8Q
 VDm+zlFs7IS1KrxDxMO4kT8trPTQAgrsbtsOxoT/ibdxqQz5fJJd6TcLxBqSOXDI5h74
 nZeI7YRilOQ0A39LY7FYUl+WniHDaOskiJHc6haOFF2Xd6RvnuJvtHqgBWb8L4E8dqjS
 PNvuomNXTbpfnmJucRVrdvwxKntKWup0m0i2aay7jr3/bnoSrY4yH0WbHEVIUZo97NRr
 7h3eCCLs+p1JLTcU21tOBZRfc4vTaURn8RJ1HojLFqLm5q/tMrME2WBOqzfYXu8UWw+e
 QFOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734659826; x=1735264626;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qcxbyvJiOICQMcEs6u323lixswetago60n1o/AkURyE=;
 b=izVkqiLpQ2jhKMKW3iKda18O85tgcbM4CM+9YOS8MUAy+qtZ08625BvjNr90TQh2JD
 pD8v7Hpl0vBq30vtyh5ESErnkraixWpHn6b+CCj/DMXMHe2beTxoRBjVHcMuVCi0PaAY
 SL5BYt3QIA6wIDdpgNseB9JBmC44W8h82nRjvU1k08UGrtXvTdgq61mT+IrXv3Jgn8xB
 ziSkRXyaJMRDDV405V8rn3SwYLBjQatMbhafee4cwvwAmNoJ2FvIIC8d80v5Kvl5REeE
 vufEcu6S2BFsm8moqcwTzz8TTI3IfRgPtZ0wXqNAZK77dWps+VoIGvJIz8ilhHtxuGsV
 sVTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW16b2SkXs2OLYQ62aKP21yhiwJ+qzGOBuwASr/mWj6PTjiMC4Dd/Ft2XNDYqmu+M7yNMzAOmetZ38=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLiGqgRvE5xYVBCNZNM20un4Fgyq0sk5U9SDL+8Vd1P8tV0sQp
 Rd1alW4cC2W+xVILrA/HoWdNsPvnhaj2AjM7iFY0E+NMe6TWrNXWA/Vj61ceNLk=
X-Gm-Gg: ASbGncvZaS/7ym2Ba6XbUQzPeOEADQaTkDJ52H/ebReIMWYIE1z9z4iQTxTNChZK8X9
 +HVhB52dUDtchN5NO6qdLGgk3ldc0Xf/TZ/P1NMku9KvlFbAuU8Uyt6laGF4O11nJKl+DLxazn2
 /W6e0Cu5xyP28uaoB+f7b+y6FpKy7ed6i2UDOTb5kUOedmBs7TSfPzDC9n8axxPb7TEFa0TqNDz
 M1NYXLf82T88qanZg44cjfHvZAGegxDl2vJNpLJpWBlLMw2mihRjQbCjQgUExkChOd53zQyHvVs
 TwnXgCDEuKKcw/NhpCs+Kehy
X-Google-Smtp-Source: AGHT+IEGdAy9vvO//82CPUOr7vqwKuGjOfLCWN8ZKc4QKX1xqUxp3Bufx4tMUvT+ylCqU4OH7XIPFg==
X-Received: by 2002:a2e:a544:0:b0:302:215f:94f3 with SMTP id
 38308e7fff4ca-304685198f9mr3524541fa.9.1734659826258; 
 Thu, 19 Dec 2024 17:57:06 -0800 (PST)
Received: from eriador.lan (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00::b8c]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542238214eesm328324e87.190.2024.12.19.17.57.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 17:57:05 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Biju Das <biju.das.jz@bp.renesas.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v7 0/3] drm: adv7511: ADV7535 fixes
Date: Fri, 20 Dec 2024 03:57:02 +0200
Message-ID: <173465975414.3473111.11308790514573278508.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241119192040.152657-1-biju.das.jz@bp.renesas.com>
References: <20241119192040.152657-1-biju.das.jz@bp.renesas.com>
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

On Tue, 19 Nov 2024 19:20:28 +0000, Biju Das wrote:
> This patch series aims to fix 2 bugs in the ADV7535 driver
> 
> 1) use-after-free bug in adv7533_attach_dsi()
> 2) Drop unsupported single lane.
> 
> Changes in v7:
>  - Dropped check for host_node as of_node_put() is a no-op when called
>    with a NULL pointer.
>  - Added Rb tag from Laurent for patch#1.
> Changes in v6:
>  - Fixed memory leak by adding goto stattement in error path of
>    adv7511_init_regulators().
>  - Added Rb tag from Adam for patch#3.
> Changes in v5:
>  - Updated commit description for patch#1.
>  - restored host_node in struct adv7511.
>  - Dropped of_node_put() in adv7533_parse_dt() and calling of_node_put()
>    in error path of probe() and also in the remove().
> Changes in v4:
>  - Updated commit description for patch#1.
>  - Dropped host_node from struct adv7511 and instead used a local pointer
>    in probe(). Also freeing of host_node pointer after use is done in
>    probe().
>  - Added link to ADV7533 data sheet.
>  - Collected tags
> Changes in v3:
>  - Replace __free construct with readable of_node_put().
>  - Dropped single lane support from bindings and driver.
> changes in v2:
>  - Added the tag "Cc: stable@vger.kernel.org" in the sign-off area.
>  - Dropped invalid Mail address Archit Taneja <architt@codeaurora.org>.
> 
> [...]

Applied to drm-misc-fixes, thanks!

[1/3] drm: adv7511: Fix use-after-free in adv7533_attach_dsi()
      commit: 81adbd3ff21c1182e06aa02c6be0bfd9ea02d8e8
[2/3] dt-bindings: display: adi,adv7533: Drop single lane support
      commit: ee8f9ed57a397605434caeef351bafa3ec4dfdd4
[3/3] drm: adv7511: Drop dsi single lane support
      commit: 79d67c499c3f886202a40c5cb27e747e4fa4d738

Best regards,
-- 
With best wishes
Dmitry

