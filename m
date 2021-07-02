Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4523BA1C8
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 15:58:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53D756E187;
	Fri,  2 Jul 2021 13:58:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D6EE6E187
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 13:58:05 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id u25so13384292ljj.11
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Jul 2021 06:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k0Qf8LnRzgJKGYnwaG9Xn2vyU5JdJZJXYA+9GZcR0qQ=;
 b=SFZAEuMwq885wgiySUSkwZaWFS6KdfmllRvo2GqlVc0E46Gcj9z3SONVjHNnvKONaX
 RSXowlTb0gj8BZIpQCdiZAzA49p+7Pm3yFCX7n2uzKQRsfqYvc+NV4dFIp6JNqEqFfih
 Fxgg2gQidRD+EJXqDcy9rly7TmIMZWn7R0XTw8V4i3wgJHzgVHvkST8TwfezjzuP21PY
 /SZWP+XAmcP3Jm82cUGJw0U5y3hq5UAgwct8wC/rhyTPobguoEjJBE0/lgJcYJV7wlIh
 GT9jb7TMc8Tr5XN0zjSDCIcnELLmJoW67eYz0qsiwx1vo+diNKXsjE3UfRIfByyDUKdv
 S3jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k0Qf8LnRzgJKGYnwaG9Xn2vyU5JdJZJXYA+9GZcR0qQ=;
 b=fpcBtavS6I0KbZnhsDXOKqOS+8W2jIgP6V0k2IOUSWucFFcbAGagAt1jB9w0AVpkgW
 Iev0JLpdvVaesylciNnp4j4JqF+gj1hRbIyuOOwJ69cbxx+fp5wTvHF9OZj080WpUPEM
 zkqnXsqfUO0lcDHStyZMSxNVIO7CAJDZpYkd1mGJOL0OoTQcM0m79OqfvyBLcX3GEESG
 wV53N3+XwW86Q6JNb6C5W7QbstEO7AYjSNpmRFgU/8MrEznyyd8iCh+GtouhLLhivuTY
 9RH9TMvGMjgePQOtmxwz14AWfcpOC/GK3rhCPj2PYWxCGzrX5WYkpSRekImgrmQfB6hD
 4wsQ==
X-Gm-Message-State: AOAM533OUGNAt/g9m8MmVUKI1viwOXHohlYLXivf0sRA4EkFYODa6zRg
 uiSa+mFZ5Z7gL1sdOVT5bqYBVw==
X-Google-Smtp-Source: ABdhPJz4USwKSxn12WOwJ7Notppd2/yhMu+HDtTqun5SfxeweusCVqypSAex/NvXZdUJal/UYKC37Q==
X-Received: by 2002:a2e:5c2:: with SMTP id 185mr4174770ljf.25.1625234283414;
 Fri, 02 Jul 2021 06:58:03 -0700 (PDT)
Received: from localhost.localdomain
 (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
 by smtp.gmail.com with ESMTPSA id j17sm282058lfb.111.2021.07.02.06.58.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 06:58:03 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v3] drm/dbi: Print errors for mipi_dbi_command()
Date: Fri,  2 Jul 2021 15:56:01 +0200
Message-Id: <20210702135601.3952726-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Douglas Anderson <dianders@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The macro mipi_dbi_command() does not report errors unless you wrap it
in another macro to do the error reporting.

Report a rate-limited error so we know what is going on.

Drop the only user in DRM using mipi_dbi_command() and actually checking
the error explicitly, let it use mipi_dbi_command_buf() directly
instead.

After this any code wishing to send command arrays can rely on
mipi_dbi_command() providing an appropriate error message if something
goes wrong.

Suggested-by: Noralf Trønnes <noralf@tronnes.org>
Suggested-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v2->v3:
- Make the macro actually return the error value if need be, by
  putting a single ret; at the end of the macro. (Neat trick from
  StackOverflow!)
- Switch the site where I switched mipi_dbi_command() to
  mipi_dbi_command_buf() back to what it was.
- Print the failed command in the error message.
- Put the dbi in (parens) since drivers/gpu/drm/tiny/st7586.c was
  passing &dbidev->dbi as parameter to mipi_dbi_command()
  and this would expand to
  struct device *dev = &&dbidev->dbi->spi->dev
  which can't be parsed but
  struct device *dev = &(&dbidev->dbi)->spi-dev;
  should work. I hope.
ChangeLog v1->v2:
- Fish out the struct device * from the DBI SPI client and use
  that to print the errors associated with the SPI device.
---
 include/drm/drm_mipi_dbi.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_mipi_dbi.h b/include/drm/drm_mipi_dbi.h
index f543d6e3e822..05e194958265 100644
--- a/include/drm/drm_mipi_dbi.h
+++ b/include/drm/drm_mipi_dbi.h
@@ -183,7 +183,12 @@ int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
 #define mipi_dbi_command(dbi, cmd, seq...) \
 ({ \
 	const u8 d[] = { seq }; \
-	mipi_dbi_command_stackbuf(dbi, cmd, d, ARRAY_SIZE(d)); \
+	struct device *dev = &(dbi)->spi->dev;	\
+	int ret; \
+	ret = mipi_dbi_command_stackbuf(dbi, cmd, d, ARRAY_SIZE(d)); \
+	if (ret) \
+		dev_err_ratelimited(dev, "error %d when sending command %#02x\n", ret, cmd); \
+	ret; \
 })
 
 #ifdef CONFIG_DEBUG_FS
-- 
2.31.1

