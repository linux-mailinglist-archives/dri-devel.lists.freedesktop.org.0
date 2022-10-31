Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10540613C01
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 18:16:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20B2710E1B0;
	Mon, 31 Oct 2022 17:16:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D45D810E1B0
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 17:16:09 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id b62so873387pgc.0
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 10:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ew7SqTPEFFhxu7/hKrNbrME/m/ofSkUv4YYTUxK9hTE=;
 b=LNy0wlk54NXx0XGRLGJLTGHN4ywvxf5ommsqE1Fdvkb3oQxH48emeDOhk5HgzYYP5i
 D6Idhh6Iw5QX1O0N/ayHK9u2K512PuftFkYPlMpLOP7ZAjKaGvggrvDwGBhXal3Q86yb
 19ek7qCAUe4SKIA9ct7LeonTh+0TQdvtmnfXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ew7SqTPEFFhxu7/hKrNbrME/m/ofSkUv4YYTUxK9hTE=;
 b=Fjxq3+3Sp4w9rdYFA6szEAjdL5WEb9y+HQDmIsH1AtMcZupCY/fGCnyeSa5Esar5sK
 5cnXeBUy1JqJLo+9UMaDkVRluyMY3iACpMKqtIkAuBPgUlG+auJiVUkw7M3Y618fMOf1
 S5bxl5S+jEyNHPeZ6EBC9HUjFFsaV1RK1TYN8rvgEPCEjNT75Nj/pVb2LSJjZVhcgGv0
 J/w5t/XyROP3eHT1oqpPw+IMfOm1CbiGJFtNUY8Y9J9KsNt3hMM+S02aVlKe9EaUJTGY
 YbR/UG8H5URH/h3X17cyGDv/fd0JF+Q1CBBP46pBSjm0l0yQ1nj7r205eQ3nJMp599Ek
 qrPg==
X-Gm-Message-State: ACrzQf04m5KwKiFAZpYh/RRCDoVXk5NO0INZVd1xJQpbjVDpH42p7AUg
 5YBwwcCUokqjhstu5K41YUfofw==
X-Google-Smtp-Source: AMsMyM4cDfw2gQpzV2vuUo36o86Uf/NDWo6Qa/wbI4r1jWqZL9p4/hZK2btJIj/1sXglXJX0VgmwHw==
X-Received: by 2002:a63:69c2:0:b0:46a:eeb1:e784 with SMTP id
 e185-20020a6369c2000000b0046aeeb1e784mr13351654pgc.589.1667236569518; 
 Mon, 31 Oct 2022 10:16:09 -0700 (PDT)
Received: from localhost ([2620:15c:9d:2:cf9d:6561:637d:2194])
 by smtp.gmail.com with UTF8SMTPSA id
 f15-20020a170902684f00b0017d97d13b18sm4679040pln.65.2022.10.31.10.16.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 10:16:09 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>
Subject: [PATCH] drm/rockchip: vop: Quiet always-warning AFBC log
Date: Mon, 31 Oct 2022 10:16:01 -0700
Message-Id: <20221031101557.1.Ic1569d394173c1c3016142fee4bb87a09753db94@changeid>
X-Mailer: git-send-email 2.38.1.273.g43a17bfeac-goog
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
Cc: Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The downstream code from which this was derived didn't ever run through
this 'switch' block with non-AFBC formats, but the upstream code does --
we use this function to probe whether a given format is supported.

Demote the warning to eliminate this sort of warning seen on every
boot:

  [drm] unsupported AFBC format[3231564e]

And make it warn more than once, because if we *actually* care to see
what formats we're probing/rejecting and for what reasons, we probably
care about more than just the first message.

Drop the comment, because one of the two *is* commonly reachable.

And lastly, drop the unreachable return; we'd do better to let the
compiler complain if we start hitting this unexpectedly.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index fa1f4ee6d195..aab77eb6caa3 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -316,13 +316,10 @@ static int vop_convert_afbc_format(uint32_t format)
 	case DRM_FORMAT_RGB565:
 	case DRM_FORMAT_BGR565:
 		return AFBC_FMT_RGB565;
-	/* either of the below should not be reachable */
 	default:
-		DRM_WARN_ONCE("unsupported AFBC format[%08x]\n", format);
+		DRM_DEBUG_KMS("unsupported AFBC format[%08x]\n", format);
 		return -EINVAL;
 	}
-
-	return -EINVAL;
 }
 
 static uint16_t scl_vop_cal_scale(enum scale_mode mode, uint32_t src,
-- 
2.38.1.273.g43a17bfeac-goog

