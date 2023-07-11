Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6CA74E8E1
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 10:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA9D710E32D;
	Tue, 11 Jul 2023 08:21:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1DAC10E32D
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 08:21:00 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3fbc5d5746cso61558855e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 01:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689063658; x=1691655658;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=fquwLHvnamolS/A4KcwEUnoJp9w0O66643f28CD8jzM=;
 b=mzv8741rgqYmjOsoiNDIW6+1xXPxKOF3DQEErDqsmEh0HZc8TRpBiT6mRk+EFiykz+
 m2YaIFcSQwkc/hQJzEcFYX3HKm0c+3WYFRjTRx9zmwlpLMT9Ouhab7DCbeY1xEXqttW4
 Rk5esQWuwVWH8MmsN9PwYR3zDbvzJQvrDFuPZO0JU+gsQD+0ZsCn4pjD7BZqwIlRhV0j
 Qnh+wZ/FPjKcdpSRBYHBShqJzZJd4PV4KGMMQ0vFzc3Ua/zC1KL2qD/O65VQSpOCRpgt
 hM2auTr4qr3lFt6jiupoGHy6HTUxXGi7hV+hdp9b9fCIK9Glj5HRyN6rGHoh3Lc3MXfR
 MNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689063658; x=1691655658;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fquwLHvnamolS/A4KcwEUnoJp9w0O66643f28CD8jzM=;
 b=RsvARt/NDaZ2XKHTy05Iv0b4kjf63hdvAfazS4k7wVKVVULGYKhJ7IncDU4ZNvfM/l
 8+jtVx/EsMeDokbXdN+5Srqvpm1c2oxRBx2QmKamSMr/LEuQfKtz4ixFwWfm3DJT5HEj
 xnFeWZsnft60/JlqCb4ZS91hqpwJWBLw877gC2MpC9b9dnlTMAYlNpNTJUvjTO4Ajmh2
 xR63IBu9ncZp9fSkFuLc/9+WkYr7p6csUpNDHejPAxSWFsMSDgSCiuulLHthHdYTq1Ho
 VQSPc4dAa2Yah1Hqo4hSO0ctAfT8PBKBwhH+NRUJXxApcb2rtXGXSAbBMNxAqqo6V7BM
 bpUg==
X-Gm-Message-State: ABy/qLZQ6ml1Th3HIx71Ht3T2zYYEtvfj7AgsghF2dHjTsdVqgV5e4Cz
 wtmRg5fgwu9ne/W5D1xX2JI3+w==
X-Google-Smtp-Source: APBJJlGFbfN8PFu6vBwaUFRibZsOZ+dedhaxMwqSHVuvWYjJ3E+fa9D5Z0fCd2jvkBGnSvz80HAmdg==
X-Received: by 2002:a05:600c:21d0:b0:3f9:b17a:cb61 with SMTP id
 x16-20020a05600c21d000b003f9b17acb61mr12798362wmj.13.1689063658783; 
 Tue, 11 Jul 2023 01:20:58 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 n22-20020a7bcbd6000000b003fbb618f7adsm1811798wmi.15.2023.07.11.01.20.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 01:20:57 -0700 (PDT)
Date: Tue, 11 Jul 2023 11:20:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH 2/5 v4] accel/qaic: tighten bounds checking in decode_message()
Message-ID: <ZK0Q5nbLyDO7kJa+@moroto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e935c70-5bd2-4808-bdd9-d664f892b0b5@moroto.mountain>
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

Copy the bounds checking from encode_message() to decode_message().

This patch addresses the following concerns.  Ensure that there is
enough space for at least one header so that we don't have a negative
size later.

	if (msg_hdr_len < sizeof(*trans_hdr))

Ensure that we have enough space to read the next header from the
msg->data.

	if (msg_len > msg_hdr_len - sizeof(*trans_hdr))
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
v2: Fix the >= vs > bug in "if (msg_len > msg_hdr_len - sizeof(*trans_hdr))"
---
 drivers/accel/qaic/qaic_control.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index 2fdd5959c52f..752b67aff777 100644
--- a/drivers/accel/qaic/qaic_control.c
+++ b/drivers/accel/qaic/qaic_control.c
@@ -956,15 +956,23 @@ static int decode_message(struct qaic_device *qdev, struct manage_msg *user_msg,
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
+		if (msg_len > msg_hdr_len - sizeof(*trans_hdr))
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

