Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D5A6E22C9
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 14:04:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F2BC89C48;
	Fri, 14 Apr 2023 12:03:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D1C689C48
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 12:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681473834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EzZmygZ/h6mW1KymHJQMpqqwuqkO8pIbZa2IhX1gPjg=;
 b=PRN+r0Cw6gQZD1k3JNd7yLB8PN9owFpOciTwwPt2V4Ub3VRvWNYTSLbzAxiox0GC2G/gUZ
 W2T9NMZtjRMZ0BKsGv8qsAak3At6M4mStrl/w2MZGZlhKaB1bxilFYlVBnDXmQ3j7anXA/
 TE5kbGjB4MXX0AJwhKFIoZn7XyBs6Fw=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-383-oCD7f4_dM5CKssekPZ2hUA-1; Fri, 14 Apr 2023 08:03:53 -0400
X-MC-Unique: oCD7f4_dM5CKssekPZ2hUA-1
Received: by mail-qv1-f71.google.com with SMTP id
 pr26-20020a056214141a00b005a228adfcefso8660596qvb.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 05:03:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681473833; x=1684065833;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EzZmygZ/h6mW1KymHJQMpqqwuqkO8pIbZa2IhX1gPjg=;
 b=XURnYKM5rGaiWKxiIe2ypIFaNEirmchAY/orbbBZFKc77B92Wa4XBKA4p26e43gaaJ
 FI4/RORJzm6Y/aCjbGBWN5w3QCGcRI4piqKt1FZkgz6+ZbVIMtq/d2r71tgjrkcI0cVo
 2WxyxA9xmz0/Qy5rjuLTEFO9eatAyYcvj5sPcjCYXWKsZD1PYRydtgceWQiwx9/Gv9pd
 qolcvp4RUlH9gDHKHDAqKfch/I5qOAP8DLF6DYCXt3t3R3lXtuUyzU2YX/vDfkNBCG1P
 JrggXHavaZR8hXnqLXfy9XrQlAEg78r9jndvujX3rNg+VAoSCGTlBm3AnKc0EAw4YtEc
 jLzw==
X-Gm-Message-State: AAQBX9fG5RuAAHbq2m0tRGHaX2VixivjKtrOtN4jF+WP9M3yspVids+l
 /g5tdz3mk6Uv2YZ23WpMlzQzDLaroYpxYWXHw/IKMFTQBKSrT/vmChJthQxbgJWtwlzMZAgPlFm
 FBmKHzlI6Uuj6hbw+mPNpLVR5RKab
X-Received: by 2002:ac8:5f53:0:b0:3e3:8ee5:1629 with SMTP id
 y19-20020ac85f53000000b003e38ee51629mr7741018qta.51.1681473833060; 
 Fri, 14 Apr 2023 05:03:53 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZD/j4DT8ikAl75WcXZCOLLsqk7WERFlQmI22J29ud9lx0mWwo6lSZErGjashkqixzZG9eJOw==
X-Received: by 2002:ac8:5f53:0:b0:3e3:8ee5:1629 with SMTP id
 y19-20020ac85f53000000b003e38ee51629mr7740944qta.51.1681473832463; 
 Fri, 14 Apr 2023 05:03:52 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a05620a084700b006fcb77f3bd6sm1168803qku.98.2023.04.14.05.03.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 05:03:52 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: evan.quan@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 Hawking.Zhang@amd.com, kenneth.feng@amd.com, tim.huang@amd.com,
 lijo.lazar@amd.com, mario.limonciello@amd.com
Subject: [PATCH] drm/amd/pm: change pmfw_decoded_link_width,
 speed variables to globals
Date: Fri, 14 Apr 2023 08:03:44 -0400
Message-Id: <20230414120344.3170942-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Tom Rix <trix@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

gcc with W=1 reports
In file included from drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0.c:36:
./drivers/gpu/drm/amd/amdgpu/../pm/swsmu/inc/smu_v13_0.h:66:18: error:
  ‘pmfw_decoded_link_width’ defined but not used [-Werror=unused-const-variable=]
   66 | static const int pmfw_decoded_link_width[7] = {0, 1, 2, 4, 8, 12, 16};
      |                  ^~~~~~~~~~~~~~~~~~~~~~~
./drivers/gpu/drm/amd/amdgpu/../pm/swsmu/inc/smu_v13_0.h:65:18: error:
  ‘pmfw_decoded_link_speed’ defined but not used [-Werror=unused-const-variable=]
   65 | static const int pmfw_decoded_link_speed[5] = {1, 2, 3, 4, 5};
      |                  ^~~~~~~~~~~~~~~~~~~~~~~

These variables are defined and used in smu_v13_0_7_ppt.c and smu_v13_0_0_ppt.c.
There should be only one definition.  So define the variables as globals
in smu_v13_0.c

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h   | 4 ++--
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c | 3 +++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h
index 7944ce80e5c3..df3baaab0037 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h
@@ -62,8 +62,8 @@
 #define CTF_OFFSET_HOTSPOT		5
 #define CTF_OFFSET_MEM			5
 
-static const int pmfw_decoded_link_speed[5] = {1, 2, 3, 4, 5};
-static const int pmfw_decoded_link_width[7] = {0, 1, 2, 4, 8, 12, 16};
+extern const int pmfw_decoded_link_speed[5];
+extern const int pmfw_decoded_link_width[7];
 
 #define DECODE_GEN_SPEED(gen_speed_idx)		(pmfw_decoded_link_speed[gen_speed_idx])
 #define DECODE_LANE_WIDTH(lane_width_idx)	(pmfw_decoded_link_width[lane_width_idx])
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
index 73175c993da9..393c6a7b9609 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
@@ -85,6 +85,9 @@ MODULE_FIRMWARE("amdgpu/smu_13_0_10.bin");
 static const int link_width[] = {0, 1, 2, 4, 8, 12, 16};
 static const int link_speed[] = {25, 50, 80, 160};
 
+const int pmfw_decoded_link_speed[5] = {1, 2, 3, 4, 5};
+const int pmfw_decoded_link_width[7] = {0, 1, 2, 4, 8, 12, 16};
+
 int smu_v13_0_init_microcode(struct smu_context *smu)
 {
 	struct amdgpu_device *adev = smu->adev;
-- 
2.27.0

