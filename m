Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2AED16519
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 03:38:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0512410E2E4;
	Tue, 13 Jan 2026 02:38:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="G/cPoG5g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7F6610E2E4
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 02:38:48 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id
 41be03b00d2f7-c2af7d09533so4523302a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 18:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768271928; x=1768876728; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tyucI0YH7MG3WfHl/qzA6deXC4xj1ffZFIfXjqoMq40=;
 b=G/cPoG5g0uRyR4xkLi9lH6hUWdPPEG1+KY2q00ElJTRKxt88Pl2SbSwl63xvgQt/wC
 8Z1KJJZRPH/GUo7vTycmsPJr0WIRSVqzPOMRzBKKIng4r3cUWUZ/B3tat514BqAxPWDk
 0l/ZPHDppaioHH6DCeCeTjlSSMZvwsATnML+kAH0zbbrkjp4A2BwHgSftA4HA9Ldohwb
 QkoOv+3LtySbDRgFz6RtW7GkRl9fWgmDXmfBCnFEnu/NxI4BEIwariHW+e56btpMaCRQ
 sh5RrNb1VtiDURtg9g/vHH0j2dGZnqIO56/jqPswT6eX5yURa5cDXOcVX7ULEWVnSZ3o
 AUYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768271928; x=1768876728;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tyucI0YH7MG3WfHl/qzA6deXC4xj1ffZFIfXjqoMq40=;
 b=oxYNs82CsU7yXJInwqXHqPeqCPzPYBCvE14Z54iWbM9en6qmY8dci0EMWUknkeQQW+
 ZoJnnnTEeFmIjDxdC7l7yAVtEKFWPwRYttBNMFYNWpIEewmO4tu/CX/UkkbaQ0hwrBAz
 czPVRbIJOWnqvkpTDZsxxSdkX0Qqt7cMfrNGWIf41A8jHLjzHHSPS4UuDWzvTtJgBlTU
 27A1Dr8kt9Mg9Zgs5ot9+x1HzKnVWFPrkIp+ljiMWxwcBZeK3pFkzdqgaxC1fcum5Wl5
 r+BrDNRpL4X34pYLoH0PPno2o5T1hBpULuAHUBXRamOAombQPFa9ADIwYC4/3cTC/tSE
 Xq4A==
X-Gm-Message-State: AOJu0YwSYt49XATRuqfzx98hk8P9LBuAA4glbMjj9I5uLXBYG2zq5n0m
 UuC+WT7e+oGZePwIqUMKHLGeDCmmCzNhozhSt1kwGWrFzynFhEA4wjL5
X-Gm-Gg: AY/fxX66mg23DrNCmVldKpvkn8rqvRIg4miIv5C5fPvrLB2pCxUK/yB+KtnKR+Wz0EA
 hJduDA0yqQtLQr2MFIAmcStXFZLklbYlrnSigL1BRIBpFgXLJg8ThtI2rgOEarj7jzEwfxCJhwC
 zQ9usleHMlEe2p1bTsehShE/nWI4xOS2/KI0fbygrQ6zpwj0yJpJwq1rDmKfFcwno79221tazlz
 NN9JIf6AJiv0+gVtFfjjDpophNW/G7bjzIow80tzfxRWAZ4X3j1mfTXkByAxL7lZWQG7nn+V/lX
 oFLhpg23KVeRpNjawAAQNe8VnZ+PSZDvqjO4H2TbFqPl02wusJBY7x/LmYPMYOO3WscBrkiC5eu
 HJ6xymSJf/jA+ZAbfSGbLOAiy05ll/cjfPZcPxdkalpafz7JqgIVlFMzkFYfg7xPLGLql91ucbb
 qFi/7BJ5OC7mRGX9dxBrTqruY=
X-Google-Smtp-Source: AGHT+IHRJPGz8XR3WjiNhMWGuhhCzTmijR2cafO3T+hWG74VDUwGnsCFbiMo83oXcnyoYAY+ItE+Zg==
X-Received: by 2002:a05:6a20:6a21:b0:35e:824a:dc57 with SMTP id
 adf61e73a8af0-3898f9915b4mr19710567637.37.1768271927906; 
 Mon, 12 Jan 2026 18:38:47 -0800 (PST)
Received: from localhost.localdomain ([111.202.170.108])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c57a50da1a7sm7819559a12.36.2026.01.12.18.38.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jan 2026 18:38:47 -0800 (PST)
From: Xingjing Deng <micro6947@gmail.com>
X-Google-Original-From: Xingjing Deng <xjdeng@buaa.edu.cn>
To: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Xingjing Deng <xjdeng@buaa.edu.cn>, stable@vger.kernel.org
Subject: [PATCH v2] misc: fastrpc: check qcom_scm_assign_mem() return in
 rpmsg_probe
Date: Tue, 13 Jan 2026 10:38:39 +0800
Message-Id: <20260113023839.4037104-1-xjdeng@buaa.edu.cn>
X-Mailer: git-send-email 2.25.1
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

In the SDSP probe path, qcom_scm_assign_mem() is used to assign the
reserved memory to the configured VMIDs, but its return value was not
checked.

Fail the probe if the SCM call fails to avoid continuing with an
unexpected/incorrect memory permission configuration

Fixes: c3c0363bc72d4 ("misc: fastrpc: support complete DMA pool access to the DSP")
Cc: stable@vger.kernel.org # 6.11-rc1
Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>

v2 changes:
Add Fixes: and Cc: stable@vger.kernel.org.
---
 drivers/misc/fastrpc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index fb3b54e05928..cbb12db110b3 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2338,8 +2338,13 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		if (!err) {
 			src_perms = BIT(QCOM_SCM_VMID_HLOS);
 
-			qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
+			err = qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
 				    data->vmperms, data->vmcount);
+			if (err) {
+				dev_err(rdev, "Failed to assign memory phys 0x%llx size 0x%llx err %d",
+					res.start, resource_size(&res), err);
+				goto err_free_data;
+			}
 		}
 
 	}
-- 
2.25.1

