Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3957F4845
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 14:53:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD32A10E08E;
	Wed, 22 Nov 2023 13:53:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x41.google.com (mail-oa1-x41.google.com
 [IPv6:2001:4860:4864:20::41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52FFC10E5FA
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 10:49:48 +0000 (UTC)
Received: by mail-oa1-x41.google.com with SMTP id
 586e51a60fabf-1efabc436e4so3956013fac.1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 02:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700650187; x=1701254987; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vClGiBY+skMb8f5fUBjtogQhsfTb2RWZZTVRz7W2ypg=;
 b=e8ukXOWhGayqh988/baKgUkX259DO+jJ1MgyhXH/TQnDXk36Re+mUmm8EcknmSbiLN
 QYL3f2DvIx5mGhi0h0K4Hsc4m02xBx29/j0Ufv738/2NmxT33httU9/vr8Xg/cYaM5DB
 oNY66aIZjkpfRPJZcHTcRGAaarLBTamJ1DmS80UsO00dJYevIB9j0ZWiA6DPXQqNTqO+
 oeTxw/2iyGuwvxThSTAl9tQTNk57WJNaX0rZrmZfwLBdNdOfyuzxVL24eXRTLGFIi3bY
 fN+nut5gfJDVJsYcoXwMHuJMUoGa2GHyVUII8uPLEC84Uq/xYoO9KstqS2V8i723NMEa
 aTiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700650187; x=1701254987;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vClGiBY+skMb8f5fUBjtogQhsfTb2RWZZTVRz7W2ypg=;
 b=Vs2K+8uOJ7Upch7+a/fFLwaxtvNcujLBMyY6/1zBkHOA0sNvL3OR8+40CTBcpkqPAp
 k1W6Ts9SV6zFZWsALSoPJhX8Ao913t0XZIdyokhCnVM5rFOKApXtzgWDHlaMwU4tQM7t
 /Ts2EVELY+Wbos9ADMUWmQV3bl6tDVvEUErHshvdv/daa8uA1kMp3tTZ4UsQqWK/hRHK
 +niMK0AOAMbrornXgxyuOV7cMiF5mtjM6A1LD2ZvcVYEfkWko13AyziRsYcZs6P5/06a
 oREr/q3jiC4UrewL1UguSXJCOLUXB+7UMrrQoSBqzc4rTC81vevWMp2Fpd9RMpztEOuW
 Fr5Q==
X-Gm-Message-State: AOJu0YyjVHTaktZOEM4fpWHXEn3DkZ5ZGzEBW7vsbzcQ3apk6L4kdtfy
 le17wqGLVEca09cRGQdDANon9JjQND/HLkgI
X-Google-Smtp-Source: AGHT+IHl1N14L7944A4EcUH8xA7UHPSt7LZWdrmkU+8Fn5zGJHGZX2ivMEEEu0oeEc4f+ggzd4gDmA==
X-Received: by 2002:a05:6870:bb0e:b0:1f5:c70b:e437 with SMTP id
 nw14-20020a056870bb0e00b001f5c70be437mr2034201oab.56.1700650187500; 
 Wed, 22 Nov 2023 02:49:47 -0800 (PST)
Received: from localhost ([219.223.232.184]) by smtp.gmail.com with ESMTPSA id
 e9-20020a056a001a8900b006cb94e20014sm5491027pfv.41.2023.11.22.02.49.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Nov 2023 02:49:47 -0800 (PST)
From: Xingyuan Mo <hdthky0@gmail.com>
To: Oded Gabbay <ogabbay@kernel.org>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] habanalabs: fix information leak in sec_attest_info()
Date: Wed, 22 Nov 2023 18:49:40 +0800
Message-ID: <20231122104940.46765-1-hdthky0@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 22 Nov 2023 13:52:55 +0000
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
Cc: Xingyuan Mo <hdthky0@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This function may copy the pad0 field of struct hl_info_sec_attest to
user mode which has not been initialized, resulting in leakage of kernel
heap data to user mode. To prevent this, just zero out the pad0 field
before copying it to user mode.

Fixes: 0c88760f8f5e ("habanalabs/gaudi2: add secured attestation info uapi")
Signed-off-by: Xingyuan Mo <hdthky0@gmail.com>
---
 drivers/accel/habanalabs/common/habanalabs_ioctl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/accel/habanalabs/common/habanalabs_ioctl.c b/drivers/accel/habanalabs/common/habanalabs_ioctl.c
index 8ef36effb95b..9e3feb7ad5e5 100644
--- a/drivers/accel/habanalabs/common/habanalabs_ioctl.c
+++ b/drivers/accel/habanalabs/common/habanalabs_ioctl.c
@@ -707,6 +707,7 @@ static int sec_attest_info(struct hl_fpriv *hpriv, struct hl_info_args *args)
 	memcpy(&info->public_data, &sec_attest_info->public_data, sizeof(info->public_data));
 	memcpy(&info->certificate, &sec_attest_info->certificate, sizeof(info->certificate));
 	memcpy(&info->quote_sig, &sec_attest_info->quote_sig, sizeof(info->quote_sig));
+	memset(&info->pad0, 0, sizeof(info->pad0));
 
 	rc = copy_to_user(out, info,
 				min_t(size_t, max_size, sizeof(*info))) ? -EFAULT : 0;
-- 
2.43.0

