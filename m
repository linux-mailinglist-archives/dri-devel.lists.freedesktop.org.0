Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5032C737BF5
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 09:21:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CF6D10E3D5;
	Wed, 21 Jun 2023 07:21:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6132010E3D5
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 07:21:54 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4f870247d6aso4572206e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 00:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687332112; x=1689924112;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=CZmvVILTRUYuuna4kyNwmHz+05y6e9HA767/dDY6Eos=;
 b=j4sioODyzUl2U16EBi+muzNb7LYcgJA6zqvzuGHn+vI7biXRHaBxjp/KvIY5JGYSg1
 V93xDmp5YKIUTvcxnsVUhGgG0O8B3tYnuy4qH3/FXPcYRdlT1lSZgsmssFhLpTwE84Ok
 WBAibyM4ulyOyRGMKglLCtJvNULodeek/M1GGq/CWvA1s0O1qezOrquDPGL5ifyeiqoD
 oLP+RFptBUgGSCZWhn6n/s9zBPo1as5FzLKJjepV0GpHUwx7IX9RYvV8QU2zY/IraA5X
 +RB3O+kMVFcbpy9ptWU4cpYRPtBNhzlg/U2+sKbhDxNhwYmFSaXzh0VkNQIBp92AulL8
 tDyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687332112; x=1689924112;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CZmvVILTRUYuuna4kyNwmHz+05y6e9HA767/dDY6Eos=;
 b=IJnZ09Kap6EBvgolW0u5G6sVnAs3AEjZkqvF+m2+JGlmyPxTskrJncFmIY3gf1+tL+
 3fPHwowDzZHaQC57UqZES8NB0p1c7gxHcjE5ROiodcQog6oio92bkOYMFmTm+fRMaHmo
 p74kCG9pfRJcIvfC1GCHqZCxBRh5MM8ZARejMM5qZ0EC7kLmyMC0EofxoV1/p3tBxLU+
 FMao60HqkEYcyDLiS/iOD7HVBesHYikqMHAYcotojc5EKT1amwQNxF9hKf+TdggGVdqK
 GNBigQAFW7fugBXvp/Imyn60GdPZ9bTOuYOXS15ZKrPjNOCU3yXSLZpzOTPlH16+RTM+
 Hx9Q==
X-Gm-Message-State: AC+VfDxSerztAsqKy2tciAvwMu4lV/vG/kuiWg0hEDg0eYJCR+69WENW
 dG9r7yyNxgAv8tlsNjPbHaulDQ==
X-Google-Smtp-Source: ACHHUZ5i3hbZ+EY2u3cWMm7/VxqrPuRBkipz14YmZjC2dPxHjO1DIo3PL18tiL8tunWtmNyDMhgh3g==
X-Received: by 2002:a19:5f4f:0:b0:4f9:5718:70b0 with SMTP id
 a15-20020a195f4f000000b004f9571870b0mr1039020lfj.41.1687332112158; 
 Wed, 21 Jun 2023 00:21:52 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 j10-20020a5d604a000000b0031272fced4dsm3671556wrt.52.2023.06.21.00.21.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 00:21:50 -0700 (PDT)
Date: Wed, 21 Jun 2023 10:21:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH 2/5] accel/qaic: tighten bounds checking in decode_message()
Message-ID: <e94567c5-0478-4bdf-84fc-5709df0b3392@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af83549b-ccb4-4a8d-b036-9359eba9d39f@moroto.mountain>
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
 Carl Vanderlip <quic_carlv@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Copy the bounds checking from encode_message() to decode_message().

This patch addresses the following concerns.  Ensure that there is
enough space for at least one header so that we don't have a negative
size later.

	if (msg_hdr_len < sizeof(*trans_hdr))

Ensure that we have enough space to read the next header from the
msg->data.

	if (msg_len >= msg_hdr_len - sizeof(*trans_hdr))
		return -EINVAL;

Check that the trans_hdr->len is not below the minimum size:

	if (hdr_len < sizeof(*trans_hdr))

This minimum check ensures that we don't corrupt memory in
decode_passthrough() when we do.

	memcpy(out_trans->data, in_trans->data, len - sizeof(in_trans->hdr));

And finally, use size_add() to prevent an integer overflow:

	if (size_add(msg_len, hdr_len) > msg_hdr_len)

Fixes: 129776ac2e38 ("accel/qaic: Add control path")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/accel/qaic/qaic_control.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index a51b1594dcfa..78f6c3d6380d 100644
--- a/drivers/accel/qaic/qaic_control.c
+++ b/drivers/accel/qaic/qaic_control.c
@@ -955,15 +955,23 @@ static int decode_message(struct qaic_device *qdev, struct manage_msg *user_msg,
 	int ret;
 	int i;
 
-	if (msg_hdr_len > QAIC_MANAGE_MAX_MSG_LENGTH)
+	if (msg_hdr_len < sizeof(*trans_hdr) ||
+	    msg_hdr_len > QAIC_MANAGE_MAX_MSG_LENGTH)
 		return -EINVAL;
 
 	user_msg->len = 0;
 	user_msg->count = le32_to_cpu(msg->hdr.count);
 
 	for (i = 0; i < user_msg->count; ++i) {
+		u32 hdr_len;
+
+		if (msg_len >= msg_hdr_len - sizeof(*trans_hdr))
+			return -EINVAL;
+
 		trans_hdr = (struct wire_trans_hdr *)(msg->data + msg_len);
-		if (msg_len + le32_to_cpu(trans_hdr->len) > msg_hdr_len)
+		hdr_len = le32_to_cpu(trans_hdr->len);
+		if (hdr_len < sizeof(*trans_hdr) ||
+		    size_add(msg_len, hdr_len) > msg_hdr_len)
 			return -EINVAL;
 
 		switch (le32_to_cpu(trans_hdr->type)) {
-- 
2.39.2

