Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D0E9C17FA
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 09:31:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48F0710E930;
	Fri,  8 Nov 2024 08:31:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="oG6CG1GY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AC7510E926
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 08:31:38 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-37f52925fc8so1143416f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Nov 2024 00:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731054697; x=1731659497; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kuMMItLYzFCoobqi01tA+K1arxATzzRbaTv/6NYr6os=;
 b=oG6CG1GYjG+0YVwN2wuuC4/dRif5ZHNNER+NRaxi2sqJeAmcE7EunODdSdT5AIhYK/
 X1tR6cmZni9Dbb9fsGESUbWJ+POV230Sr86vU8DV67AYpYHdx+Hq4U/bcFR4cIvb0Q/k
 dJGgQH4tu+C6hlR5eITDwizn25EXa/0fBSM4NRTNHs8cTLQDUrL6c1XpQdOyqieNOSu2
 DPhwLtkBmsoQleU7oU/wRwAUoAjFdRyUfyddVKeFEsC2J++8qZKVamMIzJOvPfV1l+kt
 0/z847AJ2+Ivaf58w8hZeymazavocHi997bNwhh4YJBxAlbuZgbE4nEIa8ejuCe9/oxc
 lo9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731054697; x=1731659497;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kuMMItLYzFCoobqi01tA+K1arxATzzRbaTv/6NYr6os=;
 b=n7BVIeXq/txjc8pGIxtMCCqq9mRZlSWnBVHINjh0bHkiFvLBAWyL+CNrnKMW2QjFlc
 6kTUgNn1Sq5yrpQNkUNTd5i+zGgLjiu+FsTmdlM9YJk+KLovhZOAucrz9lP62DWS4FAL
 tGxrikrv5fjQ7g4V2v1t9msYtVcii+wGzbwBimqx0/PxhR1KTeIaVMmC0MMpsy8CjHAA
 hPM5kdYfEe80yAenhZbZzY5p6Viqg8TsFxXZVAHqzue37RHuvB4ufRjJsuv5eQBpoq+a
 NH5nmSRtgHGm9CxrBv8vQBhOUoUCPFWxogJesvhDoHf82NpUHzl1RnfThn6nxqOaDyq6
 3gSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOjraGFLvQvTXC6evygo6xXKVm2StW+2FyLfUWKVgtbSuUAeTfzm9ck1AaiuywW2RLFs61AdWaQUs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOcdaJ9mJTCUzZ/vQBJ2GYxbKjnsvxAfhBMhD3ZLTUkNgdL8b6
 uytULykLXPVnk5JhbumRnzLzq3hN2ysLenYU8t1Euf28YUROyi1tmNR7O4q7Pwo=
X-Google-Smtp-Source: AGHT+IEbn82YtanjJwsBTFkxT0F7uSzZx2KIbtNokrqQeZSRioBBYxItPzf3xppwRdTzkRVo7qD0tQ==
X-Received: by 2002:a05:6000:480d:b0:37d:4894:6878 with SMTP id
 ffacd0b85a97d-381f1862d7dmr1755298f8f.10.1731054696912; 
 Fri, 08 Nov 2024 00:31:36 -0800 (PST)
Received: from aspen.lan ([154.14.63.34]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381eda04ad0sm3876370f8f.100.2024.11.08.00.31.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 00:31:36 -0800 (PST)
From: Daniel Thompson <daniel.thompson@linaro.org>
Date: Fri, 08 Nov 2024 08:30:45 +0000
Subject: [PATCH 2/2] MAINTAINERS: Use Daniel Thompson's korg address for
 kgdb work
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241108-new-maintainer-address-2-v1-2-47c9d71aac11@linaro.org>
References: <20241108-new-maintainer-address-2-v1-0-47c9d71aac11@linaro.org>
In-Reply-To: <20241108-new-maintainer-address-2-v1-0-47c9d71aac11@linaro.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
 Jason Wessel <jason.wessel@windriver.com>, 
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, 
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 Daniel Thompson <daniel.thompson@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=714;
 i=daniel.thompson@linaro.org; h=from:subject:message-id;
 bh=QJ1shEfgNhMbzUoWs/iI/qCnvnU4Abj00tvjzrGfSIw=;
 b=owEBbQKS/ZANAwAKAXzjJV0594ihAcsmYgBnLcxWQsD/YJwtzmPwpQMVWHqtNS07maf3x0/vh
 5r9h43cLqqJAjMEAAEKAB0WIQQvNUFTUPeVarpwrPB84yVdOfeIoQUCZy3MVgAKCRB84yVdOfeI
 oVW4D/9FVXqDJq4DHUBD4lKDdXOmtcMWGMXhsMBQCl0mRzsT9PVQeWXyNsDOqkgfzXckkgdh6vy
 zFM5AlBzmJsuh5bffLhMQyxUjvTXUD5yTpIOtF4WrLiEO5CQs1uuSD9JKZxFd7MZbBkheZCmiJZ
 6MEqwdsqyKG6ASwhaPh6H6NT5DuWmstx7INWkXJyHfDtLtOh59XjCoUtvZhvPix9z1XoWhh/M0G
 XF3/i2sWRmXwCyx5DkA+7TPnCWF3COzCXqSV0I4blHDIAptgCYnxF1Jk2Is33yaW9K75kiPez0u
 FvtuYFgm5u7YgI+l2ir1rZXnE7QD8UJ/1jGJb/20Cx/9VsEEuKFeRooaXqCq57bd1BpMfU7KcJl
 oAAtiRkrF6RvAaB4xuGwLnPAAsrQRjk1CJG/9Fj2z7wwX9VYqqd9CSzsHGlbdgRkzFRItynjUWe
 gmzmPJL/U1E6YvHm1/LKcWHGbtnPcOeXUXgb5HCzAzw7LlAE8iQudzBMQu0Jn9W8LeGQtXlAVgI
 uN9eToS/EJuooHnnFESqCVLs3kvyJB8V1UHdWzaUdH6iHzuiCWu1kdFZMGztArU5zV7oU03DIle
 nOYocmse3gLulu+QbxvediGRjUfvb02G5AK72LafTVRS4SOdslvAMwFCECE6tUjXC+VwDIwoaMe
 KXmonldOnXGkAjw==
X-Developer-Key: i=daniel.thompson@linaro.org; a=openpgp;
 fpr=E38BE19861669213F6E2661AA8A4E3BC5B7B28BE
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

Going forward, I'll be using my kernel.org address for upstream work.

Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5396fd1b15aee1eb2a234ba8963c57571d532a91..a88528c14e372856f83c60392240a3f1a41f6032 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12659,7 +12659,7 @@ F:	samples/kfifo/
 
 KGDB / KDB /debug_core
 M:	Jason Wessel <jason.wessel@windriver.com>
-M:	Daniel Thompson <daniel.thompson@linaro.org>
+M:	Daniel Thompson <danielt@kernel.org>
 R:	Douglas Anderson <dianders@chromium.org>
 L:	kgdb-bugreport@lists.sourceforge.net
 S:	Maintained

-- 
2.45.2

