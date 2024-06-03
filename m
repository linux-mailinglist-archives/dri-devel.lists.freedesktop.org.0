Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 410B18D7DB2
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 10:46:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A7A610E30D;
	Mon,  3 Jun 2024 08:46:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="feV2FVdq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 534FF10E30D
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 08:46:19 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2e95a883101so53545961fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jun 2024 01:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717404377; x=1718009177; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VVHtq0A2OIGu49NOlrBVkvwGk4bFKOy+4DYwcf6aVjs=;
 b=feV2FVdqOoh809QIOsbwLGh3qVp3lyDtvU6i9CEqYUiVmqvLFA6p1L1MkBhuLYJPfj
 mGOy8hnN4OA2bD6Pqpz2/iTaX5S8St+fMEWGF/5xw7tUTIelHnai7WQoDgc2qL3awDq1
 sWianxKpxCnReOrsFGLS1WF2lFpcX1k0Sh0DsNtiDIPqXKPi7L1uDSpGeYMwIDxpN4h6
 +yKqsGtKpFbBDs/ahxB1Ss4FNrEbfoEZi7rDogGKfblb4n3xQM2ujiSIAZg+RGf5yzL3
 q6R5TWWMS0wlWlLFlk66jjnTNfph0QpGnyMO+w9JuKy+wbIpz6HLSjDqOo438D2rnARo
 yaYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717404377; x=1718009177;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VVHtq0A2OIGu49NOlrBVkvwGk4bFKOy+4DYwcf6aVjs=;
 b=qXU3uUaooPfvq4hDTz8x2V6Evf+AqrH/B6mBkhEQ91mdcZmDXqO3t3GxHfV3cnQ+Sn
 AtuCPqahWnCLAUPEv6o9r9JqwIa24W2Z8XjebdTA66Hkbhz7UE8jy++WUKIrOQ03W+mO
 6Z5D92QjlSOlA0nkZNtHXJ73XWD9KG1IXG7oGuG373pSIa0zw+3mUwWX2jzGAWIJWorC
 FzWhfcGhoityIDktR0Pa/FisbNdzrxtiKvDhk7r5Z1uuKMWzec8b9B1xVeGzxgnlzoc2
 B43Hnkq2fumRn2porvGOW1m9C4avKM/g2QZtW9YJ6Z9MgTMH6jRbVgo2Uc8LKbeK0plx
 w/mg==
X-Gm-Message-State: AOJu0YwfbuAlwdVvO6y1GXix+DsPT4doPWHCYW2/QSC4MBDqxpiaZ2DR
 sDVCafy4K5pI5GnGbuE/E4/mv6ck485z1C841oxrCK4auJparSRgNFLuVUWeQA0=
X-Google-Smtp-Source: AGHT+IHByWKrFoixzwsFlBxosJ3tYc/9lpXf1eVw6In+oWfzyCfjLZC2Rbbz1pyZ2WBfGlRtHr/Xww==
X-Received: by 2002:a2e:b358:0:b0:2e9:8c28:3358 with SMTP id
 38308e7fff4ca-2ea950ec83bmr51673301fa.20.1717404377121; 
 Mon, 03 Jun 2024 01:46:17 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4213eca8a51sm16117655e9.14.2024.06.03.01.46.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jun 2024 01:46:16 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>
In-Reply-To: <20240530211402.GA1660596@ravnborg.org>
References: <20240530211402.GA1660596@ravnborg.org>
Subject: Re: [PATCH] MAINTAINERS: drm: Drop sam as panel reviewer
Message-Id: <171740437658.4156184.5628747747427694739.b4-ty@linaro.org>
Date: Mon, 03 Jun 2024 10:46:16 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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

On Thu, 30 May 2024 23:14:02 +0200, Sam Ravnborg wrote:
> Drop myself as reviewer of panel patches, to reflect the reality.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] MAINTAINERS: drm: Drop sam as panel reviewer
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/4a534428ef8df2e3ca91a8341702f6127fb42867

-- 
Neil

