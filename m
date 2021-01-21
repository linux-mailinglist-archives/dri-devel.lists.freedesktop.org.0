Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 130D12FEEB9
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 16:30:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B89646E90C;
	Thu, 21 Jan 2021 15:30:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60A7E6E8FF
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 15:30:11 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id v15so2149101wrx.4
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 07:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Sfm+N6VHymLjQmYycaoCq/05lkdq1IkwzaFXG+6Nf6k=;
 b=bS2VNm0lnS5hfBUVa3UxzWQJjNqNmZi9HxwbR9Sx8zcMiETNikJg/e0EW4Qn4zOWaC
 1x8MUCc3tWbpLFVS9GdBhYdqwzjxJDhpJMWQl3ZXgwDXvla0oDAZNJLWVLJse5psqO6j
 jiYVJmiIspYvPTlO2V1Ip3Dbd1R/hnW0xVVUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Sfm+N6VHymLjQmYycaoCq/05lkdq1IkwzaFXG+6Nf6k=;
 b=LHGnLuAVIvFsQOiobWvQb38ZuYPM/7SiOw3QKpOXof6XvX+5gI/A/Fnk89NTiEamdq
 H0WrNHcfeuAxO7tTu8WrWAoyUdxyBpgRCM4jQ8ZaBeVq995Hpznt6PPOF9YK5sJjZOP/
 8UZS7+t4UfNJG4PrKhFZaKorHchK5aEwJBpGOCHMvmQA9dQEXJlpBa5cihkmRznyeq91
 ZJF6MPDZPR7+UDmyceW98xHoG9nq4cY/HBlk+L9GDB1fbwKF4JvrP9yYe+Tu6dmCFW+7
 b6Jn3TM/VY4dQdcxdNiHKnyC3C9oR/ODXz73ijq9wIfL1HTsCwfqHmBF44U68vUr+sV7
 zVRQ==
X-Gm-Message-State: AOAM533Wq20sJ5tfTcesHp11rVBDPkRwU7/wS4Gfo18tXdx3OHuHzKQW
 cWlBoXS9wiW5GQe6QpTTI6anJVelB22i/JlM
X-Google-Smtp-Source: ABdhPJzCb4KS+fiszHb49zxZ2I+3tYJfaUh5SocU4KSsf00COANFVLxkherARcZtJSJKoFnMbUI0DQ==
X-Received: by 2002:adf:fa02:: with SMTP id m2mr22159wrr.130.1611243010044;
 Thu, 21 Jan 2021 07:30:10 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f14sm8269866wre.69.2021.01.21.07.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 07:30:09 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 04/11] drm/komeda: Annotate dma-fence critical section in
 commit path
Date: Thu, 21 Jan 2021 16:29:52 +0100
Message-Id: <20210121152959.1725404-5-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210121152959.1725404-1-daniel.vetter@ffwll.ch>
References: <20210121152959.1725404-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Liviu Dudau <liviu.dudau@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>,
 James Qian Wang <james.qian.wang@arm.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Like the helpers, nothing special. Well except not, because we the
critical section extends until after hw_done(), since that's the last
thing which could hold up a subsequent atomic commit. That means the
wait_for_flip_done is included, but that's not a problem, we're
allowed to call dma_fence_wait() from signalling critical sections.
Even on our own fence (which this does), it's just a bit confusing.
But in a way those last 2 function calls are already part of the fence
signalling critical section for the next atomic commit.

Reading this I'm wondering why komeda waits for flip_done() before
calling hw_done(), which is a bit backwards (but hey hw can be
special). Might be good to throw a comment in there that explains why,
because the original commit that added this just doesn't.

v2: Small rebase

Reviewed-by: James Qian Wang <james.qian.wang@arm.com> (v1)
Cc: "James (Qian) Wang" <james.qian.wang@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Mihail Atanassov <mihail.atanassov@arm.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/arm/display/komeda/komeda_kms.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
index 034ee08482e0..aeda4e5ec4f4 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
@@ -73,6 +73,7 @@ static const struct drm_driver komeda_kms_driver = {
 static void komeda_kms_commit_tail(struct drm_atomic_state *old_state)
 {
 	struct drm_device *dev = old_state->dev;
+	bool fence_cookie = dma_fence_begin_signalling();
 
 	drm_atomic_helper_commit_modeset_disables(dev, old_state);
 
@@ -85,6 +86,8 @@ static void komeda_kms_commit_tail(struct drm_atomic_state *old_state)
 
 	drm_atomic_helper_wait_for_flip_done(dev, old_state);
 
+	dma_fence_end_signalling(fence_cookie);
+
 	drm_atomic_helper_cleanup_planes(dev, old_state);
 }
 
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
