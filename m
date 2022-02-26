Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AC74C56B7
	for <lists+dri-devel@lfdr.de>; Sat, 26 Feb 2022 16:59:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B83410E2A0;
	Sat, 26 Feb 2022 15:59:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24AF110E1D8
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Feb 2022 15:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645891145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Grhy4tvGVEY5R3BS2D+G2b4sVPmyn1TwoVnElYjF3HA=;
 b=Cz3RBWU9OTrgg5/3z7LolJTGzjAFRC4o7cUzT6W8+Fu04L2G5MbI6RVy+aPdxQ3DX8zdIn
 yA/QUNUAv/gyA6NcdbWA1Nhl+EWGOilE1EF/81affeBF0r//u7uiDGLibyVhnV6mqLyFKB
 oF3fLlagyiHTlYffPgNVi36uHKjl35Y=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-578-27q1CsX0PKSNun0QIHLl9A-1; Sat, 26 Feb 2022 10:59:01 -0500
X-MC-Unique: 27q1CsX0PKSNun0QIHLl9A-1
Received: by mail-qt1-f197.google.com with SMTP id
 o19-20020a05622a045300b002dd26442ed0so4371846qtx.20
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Feb 2022 07:59:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Grhy4tvGVEY5R3BS2D+G2b4sVPmyn1TwoVnElYjF3HA=;
 b=GtFomD5UJuGxBpAy3R/688ZwksachB1HDsK5pstKVRSyLwAeVPKIgKSvDMjlJOZkrE
 VE7WVzHVhZNtckbM+LTSmY8EKyuEeK+X0bC50wCJFWznkq1vIt0Bgu3JarkpAtVZw1Rm
 Qk7YbWI6aYdQX3Ky7PPHeXeIcoIGL9zIwTt3u4Se/DOG00qusTTtoDGXKis3HjnU9qUH
 kuk9oTJy2P63V9Jj9+pxHWylVy/Jgw/xr6kn5sW1sWDR+7MN/YRBpVkZcJp/z6yTU2wy
 TbY2H1Pff72MS8945xTZL3c7LOScvPduSGdWL02am8f5tVmLvcVCe5caAfA1inPTVfpt
 Jiiw==
X-Gm-Message-State: AOAM531ctBKQBUT9XqzSPkLP718TJrHXC/d4Ge0MjZ44qWsLQ8e4waet
 MRheIe0btLhpXWu1ZMfnjL7Wzcu265NZ9/W/NT3OXCl/bSY+hECY8fkab6PbkpXQ3P9gKWpMBFy
 yrvCbXt8WccJNXOyuDd/a8ExL8ypi
X-Received: by 2002:a05:620a:122c:b0:47e:1445:15e8 with SMTP id
 v12-20020a05620a122c00b0047e144515e8mr7667241qkj.200.1645891141071; 
 Sat, 26 Feb 2022 07:59:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyep784W30LsjYckoKZZTZAqrxmyuQo5OmviyaAolfcaSK5XfS1laivNCE0UKTxjerrO/TlHg==
X-Received: by 2002:a05:620a:122c:b0:47e:1445:15e8 with SMTP id
 v12-20020a05620a122c00b0047e144515e8mr7667237qkj.200.1645891140834; 
 Sat, 26 Feb 2022 07:59:00 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com.
 [24.205.208.113]) by smtp.gmail.com with ESMTPSA id
 w9-20020a05620a148900b005f188f755adsm2640064qkj.32.2022.02.26.07.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Feb 2022 07:59:00 -0800 (PST)
From: trix@redhat.com
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, nathan@kernel.org,
 ndesaulniers@google.com, nirmoy.das@amd.com, lijo.lazar@amd.com,
 tom.stdenis@amd.com, evan.quan@amd.com, kevin1.wang@amd.com,
 Amaranath.Somalapuram@amd.com
Subject: [PATCH] drm/amdgpu: Fix realloc of ptr
Date: Sat, 26 Feb 2022 07:58:51 -0800
Message-Id: <20220226155851.4176109-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tom Rix <trix@redhat.com>

Clang static analysis reports this error
amdgpu_debugfs.c:1690:9: warning: 1st function call
  argument is an uninitialized value
  tmp = krealloc_array(tmp, i + 1,
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~

realloc will free tmp, so tmp can not be garbage.
And the return needs to be checked.

Fixes: 5ce5a584cb82 ("drm/amdgpu: add debugfs for reset registers list")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index 9eb9b440bd438..159b97c0b4ebc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -1676,7 +1676,7 @@ static ssize_t amdgpu_reset_dump_register_list_write(struct file *f,
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)file_inode(f)->i_private;
 	char reg_offset[11];
-	uint32_t *tmp;
+	uint32_t *tmp = NULL;
 	int ret, i = 0, len = 0;
 
 	do {
@@ -1688,6 +1688,10 @@ static ssize_t amdgpu_reset_dump_register_list_write(struct file *f,
 		}
 
 		tmp = krealloc_array(tmp, i + 1, sizeof(uint32_t), GFP_KERNEL);
+		if (!tmp) {
+			ret = -ENOMEM;
+			goto error_free;
+		}
 		if (sscanf(reg_offset, "%X %n", &tmp[i], &ret) != 1) {
 			ret = -EINVAL;
 			goto error_free;
-- 
2.26.3

