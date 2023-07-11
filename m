Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A551A74E6EC
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 08:12:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B927B10E30D;
	Tue, 11 Jul 2023 06:12:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5B4B10E30D
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 06:12:49 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3fbc5d5742bso58826505e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 23:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689055968; x=1691647968;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=p96yGLmqdrf7EnICZmRF6+JxSLRO9iWhLvWVcOetAfo=;
 b=c8m65s/NZjXnL9E1LlXyBllzpLUAiodYtykzNxEEN5emm9CzusFcfb0sWytztLEfHv
 12Jf3ImHddWgKqtknJgnRGj9VaTeHRWrDfGT+t42r3rarL44yBM2xSc3m55WBOgKljXi
 DcO4rU2fXOzAQxJoJ4Xg4emJYMAX8lVf99GFGtfbwN33b1yE0Ufh0JKu5a2U94ukfEzK
 qKnCG5qo8FGFTqD0RZoXWrukV8XMl/gesto0vQQNIe01pbzFlPlVVxfwwpwRO7Gi3FW6
 sY7arA4v1ZkBrjFFGUnGFV+UwMLcAMX4Be1eDa3zIcCJLEE0c8LT0YsgS9EtyYSCc8Xz
 BDdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689055968; x=1691647968;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p96yGLmqdrf7EnICZmRF6+JxSLRO9iWhLvWVcOetAfo=;
 b=HRX3gLKm5NYnrfEh4lm0LqVDoBQy3/nzXHCOK/12Awm1o/qSVDyTJBtakOmU0LKxOf
 mS+lbmrg8PUFVf3yUvXODATTAiyoFUhVxnbrnndoj7L/VBkntlfHYbh45iJKMARZOjLl
 rGASZAgz4G9w4YQ3NuiXGUkd7IrIvVsTcfu0iIEdBwPbu1XT8rWL9ihaYJdRvX4jKCoN
 oGO3QwprdXo2nfNfyLSKpvD8OPnELsh2kiW0x5xjL+CcvN6ptzN8j/xklKVKSty6Ouoh
 TVz5Mzfty4HoWbN+q2BBEpVSmKpiydMt+vEAO17FMIHFXOo6pGd4Q/xhX/xz/FsU5KbY
 Om7Q==
X-Gm-Message-State: ABy/qLbh6TU/Ug6J+Kp3Ix1D4u1l2UKyuzl4dzJXLHTl6d6smDx7TMII
 OLHobKevbADH9c61Q4KanUYrsw==
X-Google-Smtp-Source: APBJJlEZuQh6Ov2aYt0aLAWHvKyBYfta+NWkUT+mAMgVQDp4GKo6QCnDdRw/d+jEjlafyD3531oGwQ==
X-Received: by 2002:a05:600c:22cf:b0:3fa:96ad:5d2e with SMTP id
 15-20020a05600c22cf00b003fa96ad5d2emr16303689wmg.19.1689055968070; 
 Mon, 10 Jul 2023 23:12:48 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 z19-20020a1c4c13000000b003fb225d414fsm11935313wmf.21.2023.07.10.23.12.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 23:12:47 -0700 (PDT)
Date: Tue, 11 Jul 2023 09:12:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH 3/5 v3] accel/qaic: Add consistent integer overflow checks
Message-ID: <00af1b08-fd62-4e00-8c8c-931b235e77e5@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZKzx5nA6Z/0yhBJj@moroto>
X-Mailer: git-send-email haha only kidding
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
Cc: linux-arm-msm@vger.kernel.org, Oded Gabbay <ogabbay@kernel.org>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Carl Vanderlip <quic_carlv@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The encode_dma() function has integer overflow checks.  The
encode_passthrough(), encode_activate() and encode_status() functions
did not.  I added integer overflow checking everywhere.  I also
updated the integer overflow checking in encode_dma() to use size_add()
so everything is consistent.

Fixes: 129776ac2e38 ("accel/qaic: Add control path")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: no change

 drivers/accel/qaic/qaic_control.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index 752b67aff777..23680f5f1902 100644
--- a/drivers/accel/qaic/qaic_control.c
+++ b/drivers/accel/qaic/qaic_control.c
@@ -367,7 +367,7 @@ static int encode_passthrough(struct qaic_device *qdev, void *trans, struct wrap
 	if (in_trans->hdr.len % 8 != 0)
 		return -EINVAL;
 
-	if (msg_hdr_len + in_trans->hdr.len > QAIC_MANAGE_EXT_MSG_LENGTH)
+	if (size_add(msg_hdr_len, in_trans->hdr.len) > QAIC_MANAGE_EXT_MSG_LENGTH)
 		return -ENOSPC;
 
 	trans_wrapper = add_wrapper(wrappers,
@@ -558,12 +558,10 @@ static int encode_dma(struct qaic_device *qdev, void *trans, struct wrapper_list
 	msg = &wrapper->msg;
 	msg_hdr_len = le32_to_cpu(msg->hdr.len);
 
-	if (msg_hdr_len > (UINT_MAX - QAIC_MANAGE_EXT_MSG_LENGTH))
-		return -EINVAL;
-
 	/* There should be enough space to hold at least one ASP entry. */
-	if (msg_hdr_len + sizeof(*out_trans) + sizeof(struct wire_addr_size_pair) >
-	    QAIC_MANAGE_EXT_MSG_LENGTH)
+	if (size_add(msg_hdr_len,
+		     sizeof(*out_trans) + sizeof(struct wire_addr_size_pair)) >
+		     QAIC_MANAGE_EXT_MSG_LENGTH)
 		return -ENOMEM;
 
 	if (in_trans->addr + in_trans->size < in_trans->addr || !in_trans->size)
@@ -635,7 +633,7 @@ static int encode_activate(struct qaic_device *qdev, void *trans, struct wrapper
 	msg = &wrapper->msg;
 	msg_hdr_len = le32_to_cpu(msg->hdr.len);
 
-	if (msg_hdr_len + sizeof(*out_trans) > QAIC_MANAGE_MAX_MSG_LENGTH)
+	if (size_add(msg_hdr_len, sizeof(*out_trans)) > QAIC_MANAGE_MAX_MSG_LENGTH)
 		return -ENOSPC;
 
 	if (!in_trans->queue_size)
@@ -719,7 +717,7 @@ static int encode_status(struct qaic_device *qdev, void *trans, struct wrapper_l
 	msg = &wrapper->msg;
 	msg_hdr_len = le32_to_cpu(msg->hdr.len);
 
-	if (msg_hdr_len + in_trans->hdr.len > QAIC_MANAGE_MAX_MSG_LENGTH)
+	if (size_add(msg_hdr_len, in_trans->hdr.len) > QAIC_MANAGE_MAX_MSG_LENGTH)
 		return -ENOSPC;
 
 	trans_wrapper = add_wrapper(wrappers, sizeof(*trans_wrapper));
-- 
2.39.2

