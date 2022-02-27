Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF8B4C5C9E
	for <lists+dri-devel@lfdr.de>; Sun, 27 Feb 2022 16:40:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48CA310E4C5;
	Sun, 27 Feb 2022 15:39:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B7BE10E4C5
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Feb 2022 15:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645976394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JUKXRy9HtvoNJh5zgWKk9291k0gpOXjxfgvv4FNocC0=;
 b=QDIFWwyzFEamCrdA1eWIFXTlRhdBlJFJPtJBUeKG0Ts5V2nuXykT3wzE2aA2RhhRKXDUDH
 w7C2Uy63r31zqRhkn9L1bxSRc7VbcCIOPHhgEQlImfl/enhYBBK8NwL2APzrkeJcpnKC6k
 XC9z5vVvRk0qS7ogwARswUIXJVGwWEE=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-36-0UOeQwkqNjaHvkwPnMlQdQ-1; Sun, 27 Feb 2022 10:39:53 -0500
X-MC-Unique: 0UOeQwkqNjaHvkwPnMlQdQ-1
Received: by mail-qk1-f198.google.com with SMTP id
 k23-20020a05620a139700b0062cda5c6cecso9466771qki.6
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Feb 2022 07:39:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JUKXRy9HtvoNJh5zgWKk9291k0gpOXjxfgvv4FNocC0=;
 b=JEY72Xhga/JqF8IJ998auToSNzjYPZR8/jMvreNr9FldqLgilzWwUYXOxTVq/5MQlS
 JbrtQFmHs4gVkzijc1O7YLmhCg15qhM6cFd5NMru+EI398JhHyy/kfOgEBR7VGL2H3H6
 VoofsveVc3vL6hdhmgao1H08PhULTsL4Wo3LWPMn3/cM7T2HAtK69SgRmbXzxactaG9v
 2RhaTngw3nQdwWN98ZUu0523u0VOl+BexsVwqIxmh662QQRawfrtU9ZyzsBn+jqqJrlR
 iSFi8pivizNKeAmdCH5fp1i7CrA1UY0PrmIec+xt1nL04hzCWs8pwgtVAXqUDT1idXgJ
 /GGQ==
X-Gm-Message-State: AOAM5306dRo0HM7xSAEqGbqAIwDrxBfMPAtcPow3ACGaRzkRjDOjQDM0
 vO1KyjfJssv3dmoH57cXmrcOlb6d1vxgFe9K/hzQpNFBQcB00h2NE0LNk49hETfaZPESVXQ1wga
 /HEyIcTmbED1bQlX5qujDtCkvdU8N
X-Received: by 2002:ad4:5883:0:b0:432:b007:962b with SMTP id
 dz3-20020ad45883000000b00432b007962bmr10545699qvb.55.1645976392596; 
 Sun, 27 Feb 2022 07:39:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJypeMdQov6ivEZ1hmtZAlsJVizNYH0ogniT3ujzWNSu97z8PC8qPn1bhLsvRrQy0v8d6KuyjQ==
X-Received: by 2002:ad4:5883:0:b0:432:b007:962b with SMTP id
 dz3-20020ad45883000000b00432b007962bmr10545670qvb.55.1645976392292; 
 Sun, 27 Feb 2022 07:39:52 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com.
 [24.205.208.113]) by smtp.gmail.com with ESMTPSA id
 c6-20020ac87d86000000b002ddd9f33ed1sm5036371qtd.44.2022.02.27.07.39.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Feb 2022 07:39:51 -0800 (PST)
From: trix@redhat.com
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, nathan@kernel.org,
 ndesaulniers@google.com, lijo.lazar@amd.com, nirmoy.das@amd.com,
 kevin1.wang@amd.com, tom.stdenis@amd.com, evan.quan@amd.com,
 Amaranath.Somalapuram@amd.com
Subject: [PATCH v2] drm/amdgpu: Fix realloc of ptr
Date: Sun, 27 Feb 2022 07:33:42 -0800
Message-Id: <20220227153342.79546-1-trix@redhat.com>
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

realloc uses tmp, so tmp can not be garbage.
And the return needs to be checked.

Fixes: 5ce5a584cb82 ("drm/amdgpu: add debugfs for reset registers list")
Signed-off-by: Tom Rix <trix@redhat.com>
---
v2:
  use 'new' to hold/check the ralloc return
  fix commit log mistake on ralloc freeing to using input ptr
  
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index 9eb9b440bd438..2f4f8c5618d81 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -1676,7 +1676,7 @@ static ssize_t amdgpu_reset_dump_register_list_write(struct file *f,
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)file_inode(f)->i_private;
 	char reg_offset[11];
-	uint32_t *tmp;
+	uint32_t *new, *tmp = NULL;
 	int ret, i = 0, len = 0;
 
 	do {
@@ -1687,7 +1687,12 @@ static ssize_t amdgpu_reset_dump_register_list_write(struct file *f,
 			goto error_free;
 		}
 
-		tmp = krealloc_array(tmp, i + 1, sizeof(uint32_t), GFP_KERNEL);
+		new = krealloc_array(tmp, i + 1, sizeof(uint32_t), GFP_KERNEL);
+		if (!new) {
+			ret = -ENOMEM;
+			goto error_free;
+		}
+		tmp = new;
 		if (sscanf(reg_offset, "%X %n", &tmp[i], &ret) != 1) {
 			ret = -EINVAL;
 			goto error_free;
-- 
2.26.3

