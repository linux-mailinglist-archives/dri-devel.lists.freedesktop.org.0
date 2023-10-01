Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE817B46B9
	for <lists+dri-devel@lfdr.de>; Sun,  1 Oct 2023 12:24:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28D5910E1F0;
	Sun,  1 Oct 2023 10:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC6E610E1F0
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Oct 2023 10:24:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3735B60B76;
 Sun,  1 Oct 2023 10:24:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90E46C433C7;
 Sun,  1 Oct 2023 10:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696155863;
 bh=n1QzS5Oyh/kDOGh9vmCgQky1ibgIz1pvHVuBImWEKmk=;
 h=From:Subject:Date:To:Cc:From;
 b=nKOsWFFLFd3CpjKpFAYs2qlCLyc9P9cOrjHyNqoG7gHjXd9LYNl4nblCYutXHI6Cg
 YrLJnbPrfpoEkTg5vvsbv1krwU9xD4G5WQTmQGYN9T9qQK7A1LQ574JfoxGgjRNVdL
 kk12jCigBgQoaMFt7F+Y3QENa8rGyDU0FoCcm9FgnDxYNiV50GjWEDs+vfAy5WnwnO
 cH/MNvaxmzHqy2Bw6YGSQG9YNJVaGj+Q/wMT+q2Ri8bDszp3IpfsDsTMaaj2qrW90M
 vUi30LZl9mdANcIZwHJt11Zu8pJpm34evn3DO8fpEYsw0tGQEkrbxh1AVDSeOYNiss
 1aDB6LeUTUlaw==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/2] drm/panel: ili9322: Minor regmap improvements
Date: Sun, 01 Oct 2023 11:24:12 +0100
Message-Id: <20231001-drm-sn65dsi83-maple-v1-0-5519799a55e5@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMxIGWUC/x3MwQpAQBCA4VfRnE2tXWS9ihwwgymWdkpK3t3m+
 B3+/wHlKKzQZg9EvkTlCAlFnsG0DmFhFEoGa6wz3nqkuKOGuiKVxuE+nBvjXFSmtKN3NBGk8ow
 8y/1fu/59P5j5OyVlAAAA
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Sam Ravnborg <sam@ravnborg.org>
X-Mailer: b4 0.13-dev-0438c
X-Developer-Signature: v=1; a=openpgp-sha256; l=573; i=broonie@kernel.org;
 h=from:subject:message-id; bh=n1QzS5Oyh/kDOGh9vmCgQky1ibgIz1pvHVuBImWEKmk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlGUjSvv/JqQn+nRXQwGJvz0Sj8LuhZP0Blpx9y
 9DfUPK23JaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZRlI0gAKCRAk1otyXVSH
 0EDXB/9zmakb/3pVO6LzcL9UVzG/sueJv8KbPbRJeDFihiw0Os7bcu7WjzguGr1chc9hxI4UfBs
 jN0QD6nojx0QBFDdNYGlcIuKKS/mbvHQorstE6fIDh+a5Vb52QAux90gMsaE3lSSypIpIUWeRZJ
 tLGAaDv3P8JMfHz/+GDTko5x+MenUHHZcrlL1sD7Z3guL+tGZZBQzq6UFzbocEp40JoiTtLRGjE
 Ugs7TYSUqCwagpN9G5UbvDdlOXoB7XSXYGrsjQonyZztSwf6jCJJ0ZLDoAPtVDJhD6O8RfA9tMe
 RY3tktTXasDdy9HNRNjUQa6hJbkCrJWQbBPm2Nf11VR/Hg14
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These two patches provide some minor improvements to the ili9322 regmap
API usage.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Mark Brown (2):
      drm/panel: ili9322: Remove redundant volatle_reg() operation
      drm/panel: ili9322: Convert to use maple tree register cache

 drivers/gpu/drm/panel/panel-ilitek-ili9322.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)
---
base-commit: 6465e260f48790807eef06b583b38ca9789b6072
change-id: 20230929-drm-sn65dsi83-maple-f15042b93dcd

Best regards,
-- 
Mark Brown <broonie@kernel.org>

