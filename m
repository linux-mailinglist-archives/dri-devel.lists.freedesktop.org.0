Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 606D9497CEA
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 11:24:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DB9610E86A;
	Mon, 24 Jan 2022 10:24:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C08810E4DB;
 Sun, 23 Jan 2022 22:30:33 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso32958185wmj.2; 
 Sun, 23 Jan 2022 14:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=05N9uh+4Ak2VGTM8SLSYA5VF5ZUwizJAzi30P4Q0iRw=;
 b=NPt3mdSMhrv9lsWtnCpYgVJT+P4r6DvFFVhWMEF+qsCMv8p/KM3MY7GzS08yOUteuT
 LHagLw8sHXlFvgO5E7F0DAzgxBgUTrPXv4yXumLELORCfCMPHjN8lGSSHuPtwArbJ4gO
 1jTCF5oZteYXfjGjloKP2mmrwgvDAwkUgZ84SYQSMyAS1HoiT+6+FUNVUwjhz1wjAoLc
 +Lp5xCdC1CF9p6d0fn0sfbk4L00rrxkJrARp+FqqNrhtdPvhnNDq0jZS4DQfr5STlSVu
 LjaqfnKEDhI+29JSc07xts8njJhV1vUV5PirqvK/+XRuIqasz7YESbIHXaA7SxlgDQjv
 MtSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=05N9uh+4Ak2VGTM8SLSYA5VF5ZUwizJAzi30P4Q0iRw=;
 b=seX3XF1j4SDjyz3TgKZjk/w4EjEU+TSKap2HeDDqKZRdn3mtTcOj+z2BSV/TNkoGcM
 io0cF1+BkKbxpnxHE7hZCIe1wot68arbm1Xb8UoVkl+sZBk6KLzkZC07WAftC396czQc
 lvQ2rWYD0rD6gMdOjoI9P38mM8knEbFHYLhId/Y5PKvmBwwlBP1U22CAiCmJ+WK/vInd
 IRxaPlxKB9kOAXCXCDvXqRVFfRjy1Zv3YwSlnbJAxcZSf5zTdhZ92Xj/TBjKcIBn3jm1
 iYm9o0D2BUlgOBEYcgttuUWxd9DmNBN67bHtCFHcWGZNBfKAm3j408V3z3qwmscEKjdI
 0oqQ==
X-Gm-Message-State: AOAM531qryMIJ1KI0fAJs6KZDRcafEYGUF3QOJYbomdMtIfOr7HVy2TY
 sJujA9OlWVp/wjEVxEBCnIo=
X-Google-Smtp-Source: ABdhPJyMJ8VXx50B3SxP9I2RY6ip0w1a1Kzi1Kf73vVfrPUNQ54IUDnlElLRNFHeZuitW7cwxfi/eA==
X-Received: by 2002:a1c:7316:: with SMTP id d22mr9132678wmb.5.1642977032008;
 Sun, 23 Jan 2022 14:30:32 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194])
 by smtp.gmail.com with ESMTPSA id n10sm14436700wrf.96.2022.01.23.14.30.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 14:30:31 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/selftests: make static read-only array page_count
 const
Date: Sun, 23 Jan 2022 22:30:30 +0000
Message-Id: <20220123223030.6005-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 24 Jan 2022 10:24:17 +0000
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The static array page_count is read-only so it make sense to make
it const.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/i915/selftests/scatterlist.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/selftests/scatterlist.c b/drivers/gpu/drm/i915/selftests/scatterlist.c
index d599186d5b71..a4f2fbb451e2 100644
--- a/drivers/gpu/drm/i915/selftests/scatterlist.c
+++ b/drivers/gpu/drm/i915/selftests/scatterlist.c
@@ -195,7 +195,7 @@ static unsigned int random_page_size_pages(unsigned long n,
 					   struct rnd_state *rnd)
 {
 	/* 4K, 64K, 2M */
-	static unsigned int page_count[] = {
+	static const unsigned int page_count[] = {
 		BIT(12) >> PAGE_SHIFT,
 		BIT(16) >> PAGE_SHIFT,
 		BIT(21) >> PAGE_SHIFT,
-- 
2.33.1

