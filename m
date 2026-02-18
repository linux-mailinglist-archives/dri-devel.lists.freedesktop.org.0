Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJyvAWvClWmBUgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 14:45:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C79156CDE
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 14:45:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 064A310E5CF;
	Wed, 18 Feb 2026 13:45:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fireburn-co-uk.20230601.gappssmtp.com header.i=@fireburn-co-uk.20230601.gappssmtp.com header.b="rUpGzuI0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FA5810E5CF
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 13:45:10 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-483770e0b25so48304895e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 05:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fireburn-co-uk.20230601.gappssmtp.com; s=20230601; t=1771422308; x=1772027108;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nBxBlG0CqiDp7wzT8YiCu+b5xM1pw9txP3OMlw0eY2g=;
 b=rUpGzuI0/QbcIe69aU4sQKXu3B4NQT2AAq2sl3+sRjSFBs2nFeMqkqed2ujp+m4v/i
 j06OE9B6up5MCmq+qj+zEC79DuG2hqvzcf9aP6KWFgUsdPG0BVH0bis9ULQXYYqPIUtG
 /JA5e0xN0wEctocGyoBGWhyPZjhjnx0gat6ovkJr6Fg+99ucsPjqorGdX1UR4YYajwAM
 NGGB2AyeReMPWpX9IGIhhUy6KgoO65JDxkMNCO5ZV72m/mV/qUJv/LwdYUdKRgP8+SZe
 gtx1Atc7hGJ9gbqXfNlYQ89OcHqwry6hGM4mmEuVWi4uBLljmxL/HvLPwpQK1lvR/gnM
 BI5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771422308; x=1772027108;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nBxBlG0CqiDp7wzT8YiCu+b5xM1pw9txP3OMlw0eY2g=;
 b=Ke4b2g1WJ4wOaZDJiOQATZa82wiw7oWfrwwO8cZekrSFGTZn5LOB9HkhA8bnXPzC6K
 E0bEsd0KRM3Nsz3oYw5z5kWqi3J+5Q/XeiJZimV+0IY7N9HU733dFJtoE5W7TjwWxzLX
 tvBNXdiMosQ1fe9XVFxaQENczb3ZQptzkBP4b3Yhr/BSvbaoPv0Dt5qcpVhSb5BOXXV1
 LLU2dsyGokTc2mG7maZWRkbEqR7BYfp69SuoCuqKZQ6XBBA8Qpb6DXMTxuv8sD9kzRnz
 7/iRPDLAocFOc40YN1mE8ud338kOW7zu7ggYSuWBpqQLrbD1WtqAi+W67O5AiDyA1mMO
 JP0A==
X-Gm-Message-State: AOJu0YyWkjGFfiAnOM+l2Le/gJn+3u1MkqegjBMAmdu1leNYFef74apd
 7MiGqMbi3zOjLxPqZOBg2wph0E8kavX3WXiuqHxJWgO69Lu2/vsWZA4Jrn7rzoVFvAKhgzgT0Kf
 i8wI=
X-Gm-Gg: AZuq6aLwt7iKkIYolUBB4z0/ibT/L7j2ATZlloVx14lfFNjWrp7q+8Zr0kKjMnmNRmR
 qPnnoHuS5Hzo0aT7jDGMFjHKGWswWhpT45AdBz2OaJGxS6SWbKQAJ9QKCLtnpf1db2TVZUYXfS9
 nmZuZuu6lZmn4OyDT3YBvZAHSI6SFikMGT1NCXrBAtQg896UkuuQZZUnJ+z7uzI4AbHXT4wx4nR
 j35b7X+ahLsT+j1ZmasmCx+K7GOh4lCcD2WQby4HZ02CZp93bk0ISnEwif2F/aA7DtG2nScSJYU
 JXuL71xvC446ljz6ogpzYLoaRU+bsx0MHGuYOaN+ty1e6d3dZkST2wjjbYQOCX/0MFiV0ZOVdxU
 7794JFuvMoRLUf+wruYiE3FRcBhPC7Q7S5KTh5gbqHGQo41wUQF+5PwJ/i8sX74VAHjutzyxbC3
 /iUHZgO5GIqYQA7nezW7BRaLQnb//aq9NmD5uF0EE=
X-Received: by 2002:a05:600c:3b10:b0:480:4b59:9327 with SMTP id
 5b1f17b1804b1-4838c063f8emr124148575e9.1.1771422307897; 
 Wed, 18 Feb 2026 05:45:07 -0800 (PST)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:8363:ff71:698c:eb67])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a74918sm42018264f8f.17.2026.02.18.05.45.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Feb 2026 05:45:07 -0800 (PST)
From: Mike Lothian <mike@fireburn.co.uk>
To: dri-devel@lists.freedesktop.org
Cc: Mike Lothian <mike@fireburn.co.uk>
Subject: [PATCH] drm/amdgpu: increase queue timeout to 3 seconds
Date: Wed, 18 Feb 2026 13:44:52 +0000
Message-ID: <20260218134452.112147-1-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[fireburn-co-uk.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	DMARC_NA(0.00)[fireburn.co.uk];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[fireburn-co-uk.20230601.gappssmtp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mike@fireburn.co.uk,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fireburn.co.uk:mid,fireburn.co.uk:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 83C79156CDE
X-Rspamd-Action: no action

This fixes a timeout whilst running GravityMark v1.89 Fullscreen VK RT

Fixes: 1bea57ea7544 ("drm/amdgpu: reduce queue timeout to 2 seconds v2")
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index c7f44422939f..00f495b8c4f0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4204,9 +4204,9 @@ static int amdgpu_device_get_job_timeout_settings(struct amdgpu_device *adev)
 	long timeout;
 	int ret = 0;
 
-	/* By default timeout for all queues is 2 sec */
+	/* By default timeout for all queues is 3 sec */
 	adev->gfx_timeout = adev->compute_timeout = adev->sdma_timeout =
-		adev->video_timeout = msecs_to_jiffies(2000);
+		adev->video_timeout = msecs_to_jiffies(3000);
 
 	if (!strnlen(input, AMDGPU_MAX_TIMEOUT_PARAM_LENGTH))
 		return 0;
-- 
2.53.0

