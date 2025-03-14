Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C35A60B07
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 09:16:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E1A410E998;
	Fri, 14 Mar 2025 08:16:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BjwuPcqq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCD1E10E00E;
 Fri, 14 Mar 2025 01:10:09 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id
 6a1803df08f44-6e241443e8dso2934726d6.0; 
 Thu, 13 Mar 2025 18:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741914608; x=1742519408; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hkSnH1tD+VyGeZC4CDJd4I/+pbRt7UbVDuyaiJJ96IA=;
 b=BjwuPcqq/hZtxVSUhkKrURTZIGc4x3qcbQB3om6a5pCgkJvVzj2Mpg5bCzAzXF9CNk
 V/NVYHPD79XAQ7Q9MyrbdSHDI63gK3HYlP1TLNnrrUoyHO0ZEaTG0pQNupa/FcmgejzZ
 MhKhin4Nut+gtf+7jyQ6K592RjbKVc3gJXYbqjyddxJ9G/SWdOLYrs2+uxjLBKvunX7n
 8A+FwoG0nyl5ZAjjbSXdPo3pMWWl1H50tl8uUgZmNUlaMjOFkuaoy+YPRZbltR+MyVSH
 rFJPlZ+9ccW31WDbolm84K4cuaEqPy7tF3UqJOM+ax8QnGBI8IH0To79yyQ1+8GPDH/R
 E3CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741914608; x=1742519408;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hkSnH1tD+VyGeZC4CDJd4I/+pbRt7UbVDuyaiJJ96IA=;
 b=Vq64b0FKVeLMNn17lGBa/Q8AKJUM7pfwPTrj/U0BMunjOYYdi7FM8qlR0zuxPO8bPp
 dEFchDZtOtzLkKt8cPQoSck+m/iYdcXk5UvzPu/F3mjcJGBuM0N4B06XJugh4wy2utni
 MS6/Olo89GOo4WcRLcLota5FWiLOkeN6Gm8xzCY+TD9NX2oI3Vu3yziHgVus/SWMZ+5z
 KCKsOZIW+vZylxPLjASwR9jR4U/VLrtiBDjX8dhw7IA5RghIpRSKhiA0+vv2HMNXNBU1
 /0cJwg/ZfJ7QaA8wWmanZGkersX9rppIEgnqgysAgC1uMMQekn7hZdlLc/HGiNOuiTDr
 ouxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX38B4TKP9Ty/QMTC21erzSjItaDJ6IMicrAjevlxJwMn8tJKtOjIzGN1pN2T+O0jvhNJJOFedkw4W1@lists.freedesktop.org,
 AJvYcCXvrpzMsW3Io+196LD49W5F9fmmam0I57omtMTViEVuIee47Bbo6ZRxaEctWkOC25ZtP+PqTKVgVFw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxoU/dYyJdydo03V5j4R3X4hGvmySHOaj+kTGh9ucg1Q/9jS2Qi
 SEjcZwXp45uZ6UhL5cyUE5GGccIwxqWHzMmzz+87l15n5nFwyLA=
X-Gm-Gg: ASbGncu7M2QuCWY1Fj8D4LXhsyuX5ttA4OrfrfWK0QZjsI2guW9xf2S6L8uAYTbH5LZ
 0ggt6usxOAmNX756HTgv7Zpu4xTob3dCZdwryoDuFgsV0EDbKt56p9lmeSY9PvpfGOPXyVWQF5A
 3THJU3/nooqibnQa46QrBo+1mYikUXVcMxTLFph6j4BhqpA0B3uLur28x8sI3/fV2TmzbdTEHfV
 q9IekhmzDJwfmxqvLK6cIcByC1wTg1lRzX+H1NUFTwJNDK+MagB2xf7qNjL4UvjjLl5arEkukAe
 bhJo3JhF0o844nZKscZoKqjpYRY55vTKipO1Ou20aA==
X-Google-Smtp-Source: AGHT+IFmmZuJNS0zeaQVv7pfgVsxK7bio9LYQnBmmIvV0hbV2M/RWT5yx48Yln8G5HTdRHoKXlcTYQ==
X-Received: by 2002:a05:6214:e8d:b0:6e6:5cad:5ce8 with SMTP id
 6a1803df08f44-6eaeaaa0ca1mr2938166d6.6.1741914608576; 
 Thu, 13 Mar 2025 18:10:08 -0700 (PDT)
Received: from ise-alpha.. ([2620:0:e00:550a:642:1aff:fee8:511b])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6eade34beb0sm16214436d6.105.2025.03.13.18.10.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 18:10:07 -0700 (PDT)
From: Chenyuan Yang <chenyuan0y@gmail.com>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chenyuan Yang <chenyuan0y@gmail.com>
Subject: [PATCH] drm/msm/dpu: Fix error pointers in
 dpu_plane_virtual_atomic_check
Date: Thu, 13 Mar 2025 20:10:04 -0500
Message-Id: <20250314011004.663804-1-chenyuan0y@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 14 Mar 2025 08:16:01 +0000
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

The function dpu_plane_virtual_atomic_check was dereferencing pointers
returned by drm_atomic_get_plane_state without checking for errors. This
could lead to undefined behavior if the function returns an error pointer.

This commit adds checks using IS_ERR to ensure that plane_state is
valid before dereferencing them.

Similar to commit da29abe71e16
("drm/amd/display: Fix error pointers in amdgpu_dm_crtc_mem_type_changed").

Fixes: 774bcfb73176 ("drm/msm/dpu: add support for virtual planes")
Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index af3e541f60c3..b19193b02ab3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1059,6 +1059,9 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
 	struct drm_crtc_state *crtc_state;
 	int ret;
 
+	if (IS_ERR(plane_state))
+		return PTR_ERR(plane_state);
+
 	if (plane_state->crtc)
 		crtc_state = drm_atomic_get_new_crtc_state(state,
 							   plane_state->crtc);
-- 
2.34.1

