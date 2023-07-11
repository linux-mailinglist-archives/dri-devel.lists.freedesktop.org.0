Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3630A74E6E1
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 08:10:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22CE310E30C;
	Tue, 11 Jul 2023 06:10:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6722A10E30C
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 06:10:45 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-31454996e06so4897618f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 23:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689055843; x=1691647843;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=W89qn4/C8LoZMhk8A7/gIp60EbovNS/dN8Aiz2Yljxw=;
 b=Ze8PzEdUz4HE8I7eSSzJ76ZK2Uh8DracZb2nq0ssaV9RuGgo9BVN/0t0YvIrJ+J5QD
 n3xzjBNMxJ0M2IZfmXVTZWZzdtGIlcKZvvu4LTI7lYiFmhe85IRG3osRpz6EvONjuAvE
 yqOFdvS+BNTjpWbKM6meyk/bfYSEi4XkDZn5pQNztHb+fbsynhX2emksje4H/7EiE8TI
 FrKHtC1seiz3rtgWDqJ9djnRxC+l/ZAzTe+VtxXS97PPKnE+jzCq/DHUT2EXjHOPaceG
 Ex9/YGOXSz6XORR1aHDWnug7ZMf4VfU6H/IZvP4VZVRb88/OqpdBcZzvc3vKI2rWYMvB
 t9sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689055843; x=1691647843;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W89qn4/C8LoZMhk8A7/gIp60EbovNS/dN8Aiz2Yljxw=;
 b=SKkNyRoQE3XHhG+OJQS4I4VDDTq7wrKtWhSbsvpEMbMjyn8cbP1XqnNf1YmPXbL57G
 /j/weMkn3hBMc2uvoarmm3bUdlmFrT5i8xpnH7lW/+9GbwSh9YCl5Rq7erqR1Qqs1SYX
 GkWrEQaXI3Ji4a5Lepag/5I1Edte+GbJcV4rFhA7u+PQjheU7xzmW3UbOaH2Jba+ZY2/
 HzplJ63CoL4P8hU9AdIiP60jV3JhJx2pQZOrI5J9rdlj1HIFYtmoF6LPGIjs8jmIYjPR
 jYYtbZOTY7WksWzSfu2eMudWwoIX8mYHB6O0HDOn1k1qw8d8LB8+qKeX7udjSxHAucIo
 wT+Q==
X-Gm-Message-State: ABy/qLafV6mOkWyUZ1VawCsmt2eD0vgo75ymjgjpFyz2OYAKuPfyo1NB
 xZjRWSrMiydYXnU4zTFKjHLl7g==
X-Google-Smtp-Source: APBJJlGdAcXpWlULRWAexBF1MkCVD8fekFkTckTPUVtXuIJ0qsN2xCBn2qOMjMHMVUISI9i3vY5oSw==
X-Received: by 2002:adf:fa8f:0:b0:313:f548:25b9 with SMTP id
 h15-20020adffa8f000000b00313f54825b9mr12144824wrr.40.1689055843557; 
 Mon, 10 Jul 2023 23:10:43 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 b16-20020a5d5510000000b0031417b0d338sm1258094wrv.87.2023.07.10.23.10.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 23:10:42 -0700 (PDT)
Date: Tue, 11 Jul 2023 09:10:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH 1/5 v3] accel/qaic: tighten bounds checking in encode_message()
Message-ID: <ZKzyXx0z1gWDDJII@moroto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZKzx5nA6Z/0yhBJj@moroto>
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

There are several issues in this code.  The check at the start of the
loop:

	if (user_len >= user_msg->len) {

This check does not ensure that we have enough space for the trans_hdr
(8 bytes).  Instead the check needs to be:

	if (user_len >= user_msg->len - sizeof(*trans_hdr)) {

That subtraction is done as an unsigned long we want to avoid
negatives.  Add a lower bound to the start of the function.

	if (user_msg->len < sizeof(*trans_hdr))

There is a second integer underflow which can happen if
trans_hdr->len is zero inside the encode_passthrough() function.

	memcpy(out_trans->data, in_trans->data, in_trans->hdr.len - sizeof(in_trans->hdr));

Instead of adding a check to encode_passthrough() it's better to check
in this central place.  Add that check:

	if (trans_hdr->len < sizeof(trans_hdr)

The final concern is that the "user_len + trans_hdr->len" might have an
integer overflow bug.  Use size_add() to prevent that.

-	if (user_len + trans_hdr->len > user_msg->len) {
+	if (size_add(user_len, trans_hdr->len) > user_msg->len) {

Fixes: 129776ac2e38 ("accel/qaic: Add control path")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
This is based on code review and not tested.

 drivers/accel/qaic/qaic_control.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index 5c57f7b4494e..a51b1594dcfa 100644
--- a/drivers/accel/qaic/qaic_control.c
+++ b/drivers/accel/qaic/qaic_control.c
@@ -748,7 +748,8 @@ static int encode_message(struct qaic_device *qdev, struct manage_msg *user_msg,
 	int ret;
 	int i;
 
-	if (!user_msg->count) {
+	if (!user_msg->count ||
+	    user_msg->len < sizeof(*trans_hdr)) {
 		ret = -EINVAL;
 		goto out;
 	}
@@ -765,12 +766,13 @@ static int encode_message(struct qaic_device *qdev, struct manage_msg *user_msg,
 	}
 
 	for (i = 0; i < user_msg->count; ++i) {
-		if (user_len >= user_msg->len) {
+		if (user_len >= user_msg->len - sizeof(*trans_hdr)) {
 			ret = -EINVAL;
 			break;
 		}
 		trans_hdr = (struct qaic_manage_trans_hdr *)(user_msg->data + user_len);
-		if (user_len + trans_hdr->len > user_msg->len) {
+		if (trans_hdr->len < sizeof(trans_hdr) ||
+		    size_add(user_len, trans_hdr->len) > user_msg->len) {
 			ret = -EINVAL;
 			break;
 		}
-- 
2.39.2

