Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 280723D015A
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 20:14:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A34A46E4BB;
	Tue, 20 Jul 2021 18:14:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F11B6E4B3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 18:14:12 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id d12so229419pfj.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 11:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BhkbkDYY5lvapWHEYykIm8DO+eSuMufmOfIOn+p1+24=;
 b=ZvSTTs75luozBsuzjjDfqvGvX6rfb4OBotN2TaGX2XDIZCJZPAgy389MySA5VEAcmJ
 Ss7Cju71+UxJfBD6PeAjdTiPRYMMoIkQ6Fhdvj2n0mxX6H2KYNx9KlvQ3co8elRj65E1
 K8xrtozo6FS6E9gF0YOpTX68JEXC2B7p/u4D1Jr0MQpeuh2ndqzXfwYnbf1tqSYtjaoD
 NfHWEBWEPw7BGFHoFYGBlorl8PB1DqQ8I2gotkY9tBf+xATe5kjq9FvdAs40yFvWyG70
 sKIuaTspQkdK8efxswNzuUF6nlDMrnIyrspoKizfVMRCZf10p07EoWszNAWFoKO6lDi0
 Gj7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BhkbkDYY5lvapWHEYykIm8DO+eSuMufmOfIOn+p1+24=;
 b=IC1vsZ4EXhpH1qVpFsYkcUtbXIibOLuFyO3KcQnNbd1lEcQsinDbrw8yhcImwGjU77
 uQXAK+pMIdwpnyVShvXgJxaw34zNLGxprtQdDcSWLFURcjLeRykjX5ocwZRbpj6fdUF1
 6ItyL2lnh8l51/BsbWeWMXIgTtd7O7+F0DdGSXbqpHSWft3xkSKzmiuJ9QIgzT0PBfrX
 5e0Cc2sTVxqM/C15YtOfcH7/UMbGj39QrHPOYmg0iuKIyZdlCiKR0OHqk/efFFEwzVXs
 LMxHqWZOVQ93Yp8w1d/8dmkU9PE17xjg+CWPJsRHpk9xLgUOXlrLUUS2ZVv4lnjJTTms
 UkbQ==
X-Gm-Message-State: AOAM532KstfQnmb4ANfkl9LwO8aauk6sH0uLKyZvOGhbZpVp7WEKsbeC
 QZgQ/iLGEMqbgNC09X+eiCHb4A==
X-Google-Smtp-Source: ABdhPJxs1URLIaPpnELGajNiYpfIT/75pNlAQ6CN0HA3PPqOfCijHhXe/LZIfOaf8w4b46ApoYSn8g==
X-Received: by 2002:a62:3244:0:b029:308:22b0:52ff with SMTP id
 y65-20020a6232440000b029030822b052ffmr32463719pfy.68.1626804851975; 
 Tue, 20 Jul 2021 11:14:11 -0700 (PDT)
Received: from omlet.lan ([134.134.137.86])
 by smtp.gmail.com with ESMTPSA id c2sm26436573pgh.82.2021.07.20.11.14.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 11:14:11 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 4/6] drm/ttm: Force re-init if ttm_global_init() fails
Date: Tue, 20 Jul 2021 13:13:55 -0500
Message-Id: <20210720181357.2760720-5-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210720181357.2760720-1-jason@jlekstrand.net>
References: <20210720181357.2760720-1-jason@jlekstrand.net>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If we have a failure, decrement the reference count so that the next
call to ttm_global_init() will actually do something instead of assume
everything is all set up.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Fixes: 62b53b37e4b1 ("drm/ttm: use a static ttm_bo_global instance")
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_device.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index 5f31acec3ad76..519deea8e39b7 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -100,6 +100,8 @@ static int ttm_global_init(void)
 	debugfs_create_atomic_t("buffer_objects", 0444, ttm_debugfs_root,
 				&glob->bo_count);
 out:
+	if (ret)
+		--ttm_glob_use_count;
 	mutex_unlock(&ttm_global_mutex);
 	return ret;
 }
-- 
2.31.1

