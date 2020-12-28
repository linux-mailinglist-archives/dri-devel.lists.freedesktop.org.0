Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6572E6F70
	for <lists+dri-devel@lfdr.de>; Tue, 29 Dec 2020 10:42:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69769892E0;
	Tue, 29 Dec 2020 09:42:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7F9C894E0;
 Mon, 28 Dec 2020 21:32:43 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id x16so15854487ejj.7;
 Mon, 28 Dec 2020 13:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I2WBbrkH2ONKXlEDHonkPj8AaAP1q8vzoVqaiWZLsUg=;
 b=veLKfrSGWbd3LTDOY5lt4PaP9PCYEgPTlIz7EUcvX42ydY/0lOFux5IcfuXUUiCf3d
 CQmpJn8IWQb5uhTloPCLp1XDkrdLUGCLWAVrS3UcoJy+B4HJ+DIoEyc8jz3eToiojC8u
 xE7Tavg902Qm9pudVd65nwEOfozvvnK1gDo0qxWZM/3lWZI9erklKix71m8qWH3yuDGW
 UNbJVaqORU1hMGPcKOq7Rzmcnn58RNzzTx9GxnCAV3vmylUTTVFSZFmVNs4gtS0R3QNb
 NKOK+806eu/RExhwim19mLzDir/YB7c/mGy+/CCImBwkFIbm1j9+azL0qusKQrbPlNIn
 FB+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I2WBbrkH2ONKXlEDHonkPj8AaAP1q8vzoVqaiWZLsUg=;
 b=UqXAb2PgtcDZCRkdcqBrKKj8Qh4/4Z3z9YGMce9jmlkUOAQQljKA3yPsVBIv0XB6aP
 ndW+ST+h5szI/8gx8Vk2FmmapIH9RUgzQaEJ7kgIhIXPfWLHpcbS8hBx9v7U7jttygJi
 9Qk9L5QKFOdclZ61vfftEugE7Nzl4Inmeshl7b64T8CCoJrph0aIl6AiXGI0CMgCfgMn
 n8Gb2v42Yf4yKtpvxwZgi8SvuuMTP+RhkAzEGo87IGc4QjEuON+hyW3QYVl9Gi/n1s0X
 MlVkZDXehEy4OPtoTOgvPU3+OV/UQYs7v1HeL40hfZ6yCLfMmAYKD499RWgNBb1mM993
 zc2Q==
X-Gm-Message-State: AOAM532dQrpRbqo4B9Y92Frsu0WxFXEHclYVvQHI7L0exJTqh1kBobU5
 fkTZ7ZHfScTQ/wL9sRmH7xA=
X-Google-Smtp-Source: ABdhPJxt3v098h+osXmQY1LyoTMKKWPimAzb7g00fZLrEQdCMwrw5lSl3gm4oc39Np0J8+Q2c8SyGw==
X-Received: by 2002:a17:906:e94c:: with SMTP id
 jw12mr44293726ejb.56.1609191162587; 
 Mon, 28 Dec 2020 13:32:42 -0800 (PST)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com.
 [178.169.161.196])
 by smtp.gmail.com with ESMTPSA id dg10sm14625072edb.63.2020.12.28.13.32.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Dec 2020 13:32:42 -0800 (PST)
From: Iskren Chernev <iskren.chernev@gmail.com>
To: Rob Clark <robdclark@gmail.com>
Subject: [PATCH 2/2] drm/msm: Ensure get_pages is called when locked
Date: Mon, 28 Dec 2020 23:31:31 +0200
Message-Id: <20201228213131.2316293-2-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201228213131.2316293-1-iskren.chernev@gmail.com>
References: <20201228213131.2316293-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 29 Dec 2020 09:42:26 +0000
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Iskren Chernev <iskren.chernev@gmail.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

get_pages is only called in a locked context. Add a WARN_ON to make sure
it stays that way.

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index c658deb31eb5d..9d10739c4eb2d 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -96,6 +96,8 @@ static struct page **get_pages(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
+	WARN_ON(!msm_gem_is_locked(obj));
+
 	if (!msm_obj->pages) {
 		struct drm_device *dev = obj->dev;
 		struct page **p;
@@ -1129,8 +1131,9 @@ static struct drm_gem_object *_msm_gem_new(struct drm_device *dev,
 
 		to_msm_bo(obj)->vram_node = &vma->node;
 
-
+		msm_gem_lock(obj);
 		pages = get_pages(obj);
+		msm_gem_unlock(obj);
 		if (IS_ERR(pages)) {
 			ret = PTR_ERR(pages);
 			goto fail;
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
