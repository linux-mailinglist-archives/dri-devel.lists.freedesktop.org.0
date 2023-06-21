Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD839737BF3
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 09:21:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09E2910E3CF;
	Wed, 21 Jun 2023 07:21:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BCAD10E3CF
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 07:21:21 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f918922954so32080255e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 00:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687332078; x=1689924078;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=O8Qxh2dT/vwmYCb8MwuNXPbVaEQPUFjJDHObAtD1Tv0=;
 b=ZfXGWQRSl4/XvBX3iv+Rh/4qYvqpdCuRzYsg8C2NverEOCaCnpi3ecSOWQ0UoImMUl
 Gu1kywphP0el0ZT7nUq6CEIBna70laq8q3Ry+fnYkaDngMs7rJstJCWwUdMvbjpDvXH5
 e9MnKB0KebdorG5JwPVJXu40zDYi8xtBhdhLNDpCSpG97++FXB5zq9XQ6/RCcRTos4LM
 ANiy3a0CE1hvSFqDBCvcga0xjEya9vc6XXdSvGKaIz+aZzlX50BhKtZoAbJvMpcYl/2T
 Ht/Fk2fWo6jIbHV4TFToiz7RE7tKYKkenPYnY+qERubDNhdObSJNsm5gRcIwOC2DsAdR
 Z80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687332078; x=1689924078;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O8Qxh2dT/vwmYCb8MwuNXPbVaEQPUFjJDHObAtD1Tv0=;
 b=ddttDywnDehlzo+SWCOxeKkkNkp21nvSSEliEXpiuxrXnAn/U4Z3yZu3i3Lv1tyHE2
 szxU0Cbf3eJuwPhAaxLvdq7irzC9QLPzxKYmDVavM0siRhL+Ta6NsnEM7XsnExT7P/4I
 gVxH4X2YVBa/cNhWZ5dbl0Do6QjeisEz9rXOIZw7PDJXpkiD1fHGVdXh2/EVr0lJysvG
 YOXOckRAEAJ0dE0WtO/5qqKSB0mF0jky1bylTRenDhOTNon08pEJGHmnwg4cKZ1dA+ZN
 7/Dckcw0AWcaVGII/r7tE40NnOLXyNEwerVsUeP51vTBISFEpsgVYmAbaQ5tn4JTnTuQ
 L5dA==
X-Gm-Message-State: AC+VfDx09p+2n+YwJyYojkBIP5wu0cTBpYXighAvnut2/LFQyLxGi5zx
 w5izcs61bcQg47ycDoh8XxE7Dw==
X-Google-Smtp-Source: ACHHUZ6XpM6zbQ+qRrWux2KVECElKBl33INbEX4v/GZyD4Exilk6QiXFk7yV4s2Fau3BgEusHee8EA==
X-Received: by 2002:a5d:5960:0:b0:30f:c56c:b5b0 with SMTP id
 e32-20020a5d5960000000b0030fc56cb5b0mr10339083wri.4.1687332078132; 
 Wed, 21 Jun 2023 00:21:18 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 d2-20020adff842000000b00312793cc763sm3735043wrq.15.2023.06.21.00.21.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 00:21:16 -0700 (PDT)
Date: Wed, 21 Jun 2023 10:21:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH 0/5] accel/qaic: Improve bounds checking in encode/decode
Message-ID: <af83549b-ccb4-4a8d-b036-9359eba9d39f@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
 Carl Vanderlip <quic_carlv@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

(I think this is the first cover letter I have ever written).

These patches are based on review and not from testing.

I found it quite complicated to track the buffer sizes.  What happens
is the qaic_manage() gets a buffer user_msg->data[] which has
user_msg->len bytes.  The qaic_manage() calls qaic_manage_msg_xfer()
which encodes the user's message.

Then we get a response and we decode the response back into
user_msg->data[], but we don't check that it is overflowed.  We instead
copy seem to check against msg_hdr_len (which would prevent a read
overflow).  At the end user_msg->len gets set to the number of bytes
that we copied to the buffer.

I'm coming to this code brand new, it's the first time I have seen it.
So I don't really understand.  There is an element of trust in
msg_hdr_len but then at other times we check it for integer overflows
which indicates deep distrust.

What I'm saying is that there may be more issues in this code.  But also
that I don't really understand it so please review carefully.

The patch that I'm least sure of is 4/5:

[PATCH 4/5] accel/qaic: move and expand integer overflow checks for
 map_user_pages()

regards,
dan carpenter
