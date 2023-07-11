Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D90A274E8E4
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 10:21:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A5C010E330;
	Tue, 11 Jul 2023 08:21:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9EBC10E334
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 08:21:06 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3159da54e95so1631274f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 01:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689063665; x=1691655665;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=p96yGLmqdrf7EnICZmRF6+JxSLRO9iWhLvWVcOetAfo=;
 b=NoUPMC6dZeoMa8/E+BW4bns/yzCS0r1fbf8fMVW/3pn/55f1coshgfIRntvLgKepPU
 UmXlRW5EmUaoEYdNzZ6Mrr6jQ9ST+5BL/E7VQ2BFvT0KDdAsuddaRd04URW1dGUtPi/m
 3IUZbKyCpU9VgMlfrTIojA5vupDmWzb/bAXOGiqesyAIUmanavE1BBAEBI8QlEm1UvrS
 Ng3XRi6SIGi/glvJojiwZT5u3EkzxpdHlbnXCPiYUHmSwKlx/M6Yrmw16nI1QXuGHXUc
 /upYTptuHBRUBpKAmfRpRsXNQ8xyaTRqam+j5RXAZoBisa4pHtu978I6q8ppvnCgTNeb
 1arQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689063665; x=1691655665;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p96yGLmqdrf7EnICZmRF6+JxSLRO9iWhLvWVcOetAfo=;
 b=XtZkTDc0XQ3RcsKiR/ftsK6DSkfdy74FrAYTh/HIG6WTbXlE20Il4YHJo1gdEImk81
 X2WVC6LkB0dPqvMz4iRMPhY/pXfcJ30ZX4GEVtDjISYzyj8+CpdN8P5NcmA01VUQmuph
 b5ug5YjW6xqnP3kppC1WoHDhoof3vrx/h4rJIgllWngBci8yQ+EOOc5vtlGsB1FC6KKT
 twC4V8IsGpWIgIq+UMBeQfKhmiWf/WOe+IbsWDRShmXGn9/8HRxThp+fj3qjnZcIsldE
 ga3QLbHONiSO+Q0gFAaFCXpAfOonG63zXqlpD+tLWDfO4uQyvSVTMeyIuTzbsVrJ2iyF
 IfrA==
X-Gm-Message-State: ABy/qLZGKi7PeVdkbsVKFVLsFIdQzBJih/sYqktacRmlqsB0c/WA6rFr
 CNRWg18MsAVRjsX6c83CICcFGw==
X-Google-Smtp-Source: APBJJlE9i4XhHmQv1pBhQZUzsFzcV9eFjlSxljOGejA2W9oGWgdxxGZyfxWGUnUD4oZvCT2ekuvWAg==
X-Received: by 2002:a05:6000:1290:b0:315:a91c:1a8c with SMTP id
 f16-20020a056000129000b00315a91c1a8cmr169842wrx.22.1689063664992; 
 Tue, 11 Jul 2023 01:21:04 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 q10-20020adff50a000000b003144bfbd0b3sm1576580wro.37.2023.07.11.01.21.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 01:21:04 -0700 (PDT)
Date: Tue, 11 Jul 2023 11:21:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH 3/5 v4] accel/qaic: Add consistent integer overflow checks
Message-ID: <ZK0Q7IsPkj6WSCcL@moroto>
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

