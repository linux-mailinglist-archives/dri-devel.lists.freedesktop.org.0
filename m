Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8701CA17B34
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 11:16:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFD1310E538;
	Tue, 21 Jan 2025 10:16:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="W9Ucynjq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6836810E538
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 10:16:55 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-305d840926fso42323511fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 02:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737454614; x=1738059414; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2sKmlgZFxW5SzQMIIe+zswmZcO3cIm/lz/eCX/l5rXA=;
 b=W9UcynjqXrAIOXzW6bgXaH+RrsQrsT7S35lkozrf0aJDjmXoZrs+tl/DQelR8Kxdjs
 j2XIpnBB2kttdAZn6cSfS+NDfZEYngB97/7vp9TtXyO0dpmhCdAhZahpCfNz/oDxeq41
 dbHgcVWhN3XvuZ28ZFf0QfCET8pgqnxeD0xvN1LPSscpMjfwg+Sn7eVyn6NpLG2UjbLn
 XmiTAMZuB0x/2bzOThGgIddyhFl+WMXtBYypcDhtN8CY/2/UpRoOcNF7RBP3hCmOiMFh
 IofzsouOLPGaYEvCFpKpZFRL2duDWI/EfZ7PWAquNgH8P/JYNRFaxj7QiTj1XFO/ccYj
 rZvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737454614; x=1738059414;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2sKmlgZFxW5SzQMIIe+zswmZcO3cIm/lz/eCX/l5rXA=;
 b=r2o1eC+Zi0jMt/y+ugjhp9ai3Roq75M5x5/GtP4gtona8T33XKx7BRYpDnV0A+YSFZ
 3uh+iQuPwu9bnQCqu4w2SoGksKtW8hIqrY63c1cZ8a3X24PbRptfVgXMx+7qBjfTHVG8
 8WkR8hqsGFc4IPouAqOADgwyHGHKFQ7vvIoliZZU3QlVl+UKNiEuH8cm/p/R5ZU6qi3f
 4YQUbfvqJ2NJZJvAqtJj2SNUj1S5j+8045qU9Sy3p/HrlaeyOhJE3SslZazno6+EWXfz
 BXrbh53A+XuVpAWKtq3Gbn9NT6qN7E//dz7pse7m2Y7lCu3rJahkn9wQXlIBJwkQ8pPc
 ZPzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUOHgazpYJJl+f51XXLhBH1mWXJZeia0OCfBbKzZ4XEAES63SGBL7sJelvzgDbNDzFmBHhRihf/io=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxStO+3Dz1y8IDdCtGHf+fyuLzvh0tQECu8rkyWbcnBoWjBt5Mz
 pAC5kHZ9q6QMwfT38/ka35RJoZR+S2Xb1uLxeRFfg7dLLPGKPE25YlP44wU1KW0=
X-Gm-Gg: ASbGnctDZtRpMW+X5HVLFv3FFIVyDjZYgyMEo1bqAs5P/nPN0NKVMbcRFzi0ji1rntn
 GxF37MhVQTkcLmdxgnVZJC54SVyDd6rrOI0eXp6yI7wS/qJF9gHDxiqJfaUk5Spvnf++julXkMH
 B9kvNWfOEdPvZmy71tzI3A4bxQkbNN97DeySDrx/FFLjq+vWSolYhsY0kAW+Nm1cqMtO9Xqc3VH
 kFj0R0wjzdUjPOHUpORXoqUYZmvMmd+4x3Yolgpb4wAqhGjoBVffPQ+ltKe944L1JtttZn1qV5C
 qbROk1dnX/OFZ6WLSpVXawtNtiWWhZHpypY12/8wB7JjaSDZSg==
X-Google-Smtp-Source: AGHT+IFznj5QTkxejj1h7e2DHbCZsbF1n+9b/WPMSF7tP8oviwsQK24SYuQjBNYHiYuWIa5m3UyWwQ==
X-Received: by 2002:a05:651c:1309:b0:300:3a15:8f0d with SMTP id
 38308e7fff4ca-3072cb284e5mr59022731fa.34.1737454613712; 
 Tue, 21 Jan 2025 02:16:53 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3072a4ed203sm21215321fa.73.2025.01.21.02.16.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2025 02:16:52 -0800 (PST)
Date: Tue, 21 Jan 2025 12:16:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: oushixiong1025@163.com
Cc: Joel Stanley <joel@jms.id.au>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Shixiong Ou <oushixiong@kylinos.cn>
Subject: Re: [PATCH] drm/aspeed: Use devm_platform_get_and_ioremap_resource()
Message-ID: <b5rhfo6q6ko4vf2vubkcma4v7dnpxruh7peyqav6tszj4sg6ee@mzjc543jsujn>
References: <20250121075041.201599-1-oushixiong1025@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250121075041.201599-1-oushixiong1025@163.com>
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

On Tue, Jan 21, 2025 at 03:50:41PM +0800, oushixiong1025@163.com wrote:
> From: Shixiong Ou <oushixiong@kylinos.cn>
> 
Missing commit message

> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>

This doesn't match your email address, so SoB is missing.

-- 
With best wishes
Dmitry
