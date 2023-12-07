Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD2C80858F
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 11:33:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 417DE10E1F7;
	Thu,  7 Dec 2023 10:33:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EA9610E1F7
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 10:33:21 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-50bfd3a5b54so572186e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 02:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701945199; x=1702549999; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0G7EQ5KcNMD+FJBWqkf4cHHplz7DlKiV0y/rovpjNYk=;
 b=m1leqtxVKj7Yv/PlOMsaDGBE9HZJPKZPkEmG6+5A2AEwR3YECF2f9GJFwTtMJcpewu
 f3n0/tot9AoK43aXIYBSUpllm+l5q7Xm7SaTzUgSjXpQQ2tF9beY897W1pp4ml2QD19g
 xVhgwOtLgpFUwdxf2fBh9wmnlyH89o/1vZocgEe4lJ7MjS6KxjoJBq6PvD/cCQa9WtSU
 QKl03V/ghogBdru53Qb9DM34rImliV2GrIEKvkaTLLUUEbZTd3o1JXxpBrAGAdSeHPxB
 bO/F5DKWavzmvxSHJw71MgXZ7fIX5AdnJDO4tLOT+TlM0QueLTm9p8i2ttRJLhXgIFiD
 wWbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701945199; x=1702549999;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0G7EQ5KcNMD+FJBWqkf4cHHplz7DlKiV0y/rovpjNYk=;
 b=PFNrLhYVedSpHWu2Bsmy1WasMTOLk+8k4f44aBQuePzXfKaPT59p2O8ouhuZ6vzCNA
 /0+Fc1bTT/cg7Ftqps2VfovaXzGo0Eag6SsvXmqUAiOfBTZX2F4EUjhJe2v1PoWYPNMS
 frjshaQS7Crz8XBYJ420RMhbrU6AyNFjC0NJ2u8+BxTcojmkyZ1ml/VJMI//6Xfyw3vy
 9KFcmjPoFIwoK3uxzx5SsH5rdT0hL8ud1+atC8RBBT/NrPzuKbY6tvVOj8pSTX80Tt01
 NVtaOzwaUB7AXR/lBLXIK+HIsOsWRnPM0QH+eWgxvapcGVYaI+DAc79KOFwq2W1YuVEY
 ZFig==
X-Gm-Message-State: AOJu0YyWOW15rsKWh8gDWoj9azBqqfp9/u1p+X0WiGr2kh9qsnwjNQxL
 9bWgOpHZ23Q3WUU6ZOpd8h0MUaaaAV/hNxXMFJW3BWV2
X-Google-Smtp-Source: AGHT+IElfQrP5//I1yr0A5j3iV0uNq6PB6PrCqFCGPat86Z8HQ+XO+jpbihW4CTlZz6+VkLy4eJv1g==
X-Received: by 2002:a19:5f19:0:b0:50b:e5e6:aa8e with SMTP id
 t25-20020a195f19000000b0050be5e6aa8emr1318607lfb.127.1701945199127; 
 Thu, 07 Dec 2023 02:33:19 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyyykxt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::227]) by smtp.gmail.com with ESMTPSA id
 o17-20020ac24bd1000000b0050c19506428sm138326lfq.170.2023.12.07.02.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 02:33:18 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] drm/debugfs: fix potential NULL pointer dereference
Date: Thu,  7 Dec 2023 12:33:15 +0200
Message-ID: <170194519139.470483.9628943162805035474.b4-ty@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231205130631.3456986-1-m.szyprowski@samsung.com>
References: <CGME20231205130643eucas1p283a5476b78a87997fa393d00f5172418@eucas1p2.samsung.com>
 <20231205130631.3456986-1-m.szyprowski@samsung.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 05 Dec 2023 14:06:31 +0100, Marek Szyprowski wrote:
> encoder->funcs entry might be NULL, so check it first before calling its
> methods. This fixes NULL pointer dereference observed on Rasberry Pi
> 3b/4b boards.
> 
> 

Applied to drm-misc-next, thanks!

[1/1] drm/debugfs: fix potential NULL pointer dereference
      commit: 76385d493c2137460ee7735a5d3a494099c35188

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
