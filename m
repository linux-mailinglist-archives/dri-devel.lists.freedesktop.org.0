Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC31C69F874
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 16:57:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD67010EA37;
	Wed, 22 Feb 2023 15:57:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05D4F10EA37
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 15:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677081418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GScpUkVmR1trk5NKo/KgCoCbwLxTQg040xij2n32R0k=;
 b=TiweaSac5/24jQJUErKk+qsZBOndFFtL+AAKuFsc0FUP5WUdNFjo74BMmKEuIA1vBzow0H
 4vlVChHd9e3UdBV/qM/VrY3WqQbgWx+G7W566qbknwSgfbtN6EdTbyveb44Lap/GRPVaDg
 kt84dDglp5KGbMt/vNBXZMqWR+e6Vu8=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-57-7Y-g5zM-P12QNFo1go3AQQ-1; Wed, 22 Feb 2023 10:56:57 -0500
X-MC-Unique: 7Y-g5zM-P12QNFo1go3AQQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 c9-20020ae9e209000000b0073b344eb74dso3728224qkc.10
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 07:56:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GScpUkVmR1trk5NKo/KgCoCbwLxTQg040xij2n32R0k=;
 b=5sOwV1QrLRwE2ExfU/8Apmx7lTpclJs5YRUmf9b11/tEgll+H0GzXvX4vrtFPMgFza
 MMmYUReiEo6zaLN6IpS24XvnuGQBug5fMu41bgHWif/TXryev8JfFtx5ThXMn+jRWW/7
 X7tx7jtWCfoJsmyv15y6GiArVg0G87uQhpMBmDzsSjC4ijTd7f606T28kcsJzoSlMpBb
 r+ArwkonxN/4JeLnYms4DGlzw2HsCkU11KlKMmP9E1Bp0DU3WR4Ouud9+mKx3i6JD9KW
 p/milKxnxpTPZFMZFR+uze8JxAo8kD3phP2MnwGipAq/BET/Ll3W1Oob6aSHAOr/oaxp
 or0w==
X-Gm-Message-State: AO0yUKUw/Aou1CXB0UBiD/jPhGRBDjCVfpK4bVBrI8dW2aMFAfMqwjdR
 woTHaI6YpWrhY/qkz1qXCsIkxB8kxJXeEBBg/fQnT2aLdEoxTs4yPnnfJQyztqZcUzWJdOmgvdi
 /YeY5BZz3ql3WxxgMtyN6QfM7cEIA
X-Received: by 2002:ad4:5aa7:0:b0:53c:9354:9721 with SMTP id
 u7-20020ad45aa7000000b0053c93549721mr17269895qvg.21.1677081416446; 
 Wed, 22 Feb 2023 07:56:56 -0800 (PST)
X-Google-Smtp-Source: AK7set+9amRNsc788f8Ah1EHOFjNZAoWEKdId2TpDxnPM1JRKz/kP2UH4h79UWQqmJg4CwTyIG4HZA==
X-Received: by 2002:ad4:5aa7:0:b0:53c:9354:9721 with SMTP id
 u7-20020ad45aa7000000b0053c93549721mr17269856qvg.21.1677081416191; 
 Wed, 22 Feb 2023 07:56:56 -0800 (PST)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 t78-20020a37aa51000000b006f9f3c0c63csm589967qke.32.2023.02.22.07.56.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 07:56:55 -0800 (PST)
From: Tom Rix <trix@redhat.com>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@gmail.com,
 daniel@ffwll.ch, nathan@kernel.org, ndesaulniers@google.com,
 tzimmermann@suse.de, javierm@redhat.com
Subject: [PATCH] drm/msm: return early when allocating fbdev fails
Date: Wed, 22 Feb 2023 10:56:49 -0500
Message-Id: <20230222155649.2001467-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Tom Rix <trix@redhat.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

building with clang and W=1 reports
drivers/gpu/drm/msm/msm_fbdev.c:144:6: error: variable 'helper' is used
  uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
  if (!fbdev)
      ^~~~~~

helper is only initialized after fbdev succeeds, so is in a garbage state at
the fail: label.  There is nothing to unwinded if fbdev alloaction fails,
return NULL.

Fixes: 3fb1f62f80a1 ("drm/fb-helper: Remove drm_fb_helper_unprepare() from drm_fb_helper_fini()")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/msm/msm_fbdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index c804e5ba682a..c1356aff87da 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -142,7 +142,7 @@ struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev)
 
 	fbdev = kzalloc(sizeof(*fbdev), GFP_KERNEL);
 	if (!fbdev)
-		goto fail;
+		return NULL;
 
 	helper = &fbdev->base;
 
-- 
2.27.0

