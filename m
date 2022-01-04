Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8FD48436D
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 15:33:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 303D810E2D2;
	Tue,  4 Jan 2022 14:32:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A4F910E2D2
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 14:32:58 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 r16-20020a17090a0ad000b001b276aa3aabso27923561pje.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jan 2022 06:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bqezZ2/HwBTxC4hfR4A8RkBTbm8B6r0iUtltdIvH/WQ=;
 b=YAM3+6FcklAaIzkc+ONdEfhaXNRmLi+403huzZNGN0fOwIdmd61HZQBr1o2txVgKyt
 siyEfxHArU8zWrkmf1/12qERxvfNG/vZ1jl8BXBdz3WEeUMmEJ+G78swMU44XEJhYIE9
 4063gFpjAJ17n/W8rjU6qUD9ZjReqSv4Nf1eju4FOdYhDsZ6+gYEu9I+xAFy9Asil+H4
 fwH9ForA8Y1C0ywU8cyltaK5QINyjXtJToHq1C409ad/9NTQHCywXAC90Mhhd9bmQy0Z
 o7vSLTrR0s4C638w7a2zpiWT6mPnjE2vga8/lHW/lIGKMs3M1vz180WSD26tiSOBiHPw
 qM5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bqezZ2/HwBTxC4hfR4A8RkBTbm8B6r0iUtltdIvH/WQ=;
 b=vh2g1qDxZo9/qs+wgIZkirTUSDfeLtYwiiR8UsDQnm7ctHvER1VnL3UfzACz6S+VfE
 D+3XD7bwdpB2OxhJbgthJsg8rl7UqM/RoJTg64Zsx/e9WAoyjFASBYW/hXWUEBp5VGDI
 58/actP3/QKARMFZ6e8UkxghQ9zyL8djgNGfqE+sgH6szo6pf8wAy2R4ninM/0GeAjoS
 wtBnUBlS0wQE01hvJtcrj1xZkWGg036Fq/Loimeggh8RMYmVszp4nz+EI0YodCTmiaPf
 UvUcs5rmhEPdcmuqjHBFXzlaGpJ8eASzOXuMLBmPUtecifIjGUXrs6Ch9Ag8O8sR464c
 Q6fQ==
X-Gm-Message-State: AOAM531R1fRQM4jKZErtsrEwiH4/QaNLdpGMg8fQ+VBhwNVws7oXV5p4
 wYB27+TM37wxE1ziIZ1pbJNT651TcVF8KXmPdqWMfQ==
X-Google-Smtp-Source: ABdhPJyjz0JTTnXK42ND24drUizGJVy9nTKCt6Xn2fWRsbWsVUVA40D2jY5VU2owB/9x54wOo7wjRY1SJoVTueCCVAM=
X-Received: by 2002:a17:903:110c:b0:149:8018:e9d4 with SMTP id
 n12-20020a170903110c00b001498018e9d4mr36727254plh.117.1641306777954; Tue, 04
 Jan 2022 06:32:57 -0800 (PST)
MIME-Version: 1.0
References: <20211222083350.18514-1-linmq006@gmail.com>
 <CAG3jFysrEDzYVbpwDVK2OJYMsEKRqpcBexK__m08A6vevm=ubw@mail.gmail.com>
In-Reply-To: <CAG3jFysrEDzYVbpwDVK2OJYMsEKRqpcBexK__m08A6vevm=ubw@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 4 Jan 2022 15:32:46 +0100
Message-ID: <CAG3jFyuqY7LOZxLbrE+--ZxBoduOOnHw8n1XHGtt6=h+pdw=3g@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: anx7625: Fix null vs IS_ERR() checking in
 anx7625_register_i2c_dummy_clients
To: Miaoqian Lin <linmq006@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Nicolas Boichat <drinkcat@chromium.org>, Pi-Hsun Shih <pihsun@chromium.org>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Tzung-Bi Shih <tzungbi@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, Xin Ji <xji@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied to drm-misc-next
