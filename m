Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B687661127
	for <lists+dri-devel@lfdr.de>; Sat,  7 Jan 2023 19:48:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4670D10E1BA;
	Sat,  7 Jan 2023 18:48:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFDB410E1BA
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Jan 2023 18:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673117318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NEY3gLZEXX4WZYkSBG8Y3BNi/aeS/CuZ7LY05TbsVxs=;
 b=aNsOb/p/xY0z5W1zPZ+wm3RJ3cgp3MM6nceunEStI5LaLbNOzEGowJEtoXk3ARILoFaID3
 e298z0SvlBWqzz7vUEgC9/dEsz2kvdsZlfia2FujHnGuee66Fs3SOOF+RGGdGnvMXZtrRH
 7JeeQ10UyWbEpStQqlsSv+AzdfN6oMo=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-630-smo27rEtNi2KcjgYmZjMJA-1; Sat, 07 Jan 2023 13:48:37 -0500
X-MC-Unique: smo27rEtNi2KcjgYmZjMJA-1
Received: by mail-qk1-f198.google.com with SMTP id
 r6-20020a05620a298600b007025c3760d4so3396628qkp.1
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Jan 2023 10:48:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NEY3gLZEXX4WZYkSBG8Y3BNi/aeS/CuZ7LY05TbsVxs=;
 b=COvgwtr+JRNWzK37fK2T2/iAHfijeqTmtpgp5phNkHgw7NP2rJ5Z9FV30Qe4DoBnSg
 tqsb2cgXDFoT+ge6NIc20vYRywgT6aM6tb6yH/WHVkOVZIbcUOSPFMRuH0Wb61rXkxRt
 SH/Xit1BYsWiamITh33OcyvxHxsnJf9eQMoJaSjW5+LWeGGGa1t8yxSCB6fbNSFMpW2O
 /Zigti+GOZLpgPL4vd1C2L3uGaGyVLUd9WeLEboVxLF0NocYWzbxzjdO2+leZ5PGqAC0
 0xgXak5sC/U21Rif7Ku6SxZYLx+IUpFUOrtzLlynJARz8uYtTTP4v9d4KlmlZyQ3rlYT
 o0oQ==
X-Gm-Message-State: AFqh2kqXKOf9pR7epfnl2VzO9fyeUJLqO92XoevomDvkE86gZn4at232
 aBEuC//vSHPLImfWOMZsiQgzP/q374FLnIAoOGdS6179peLBGRD94VQgWLD2NG5eesp6xIiMDjU
 OmFICt6f2COmfEuWrnpyc1Le+18Bk
X-Received: by 2002:ac8:65da:0:b0:3a9:7789:7d1a with SMTP id
 t26-20020ac865da000000b003a977897d1amr78611125qto.25.1673117316950; 
 Sat, 07 Jan 2023 10:48:36 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtved5EwV17svAb1rAH+JvbXZPZmitIXIKm2hTk2L21vpZxb/fRiD3RJLuAtBw+P8ujndGoZQ==
X-Received: by 2002:ac8:65da:0:b0:3a9:7789:7d1a with SMTP id
 t26-20020ac865da000000b003a977897d1amr78611111qto.25.1673117316729; 
 Sat, 07 Jan 2023 10:48:36 -0800 (PST)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 az31-20020a05620a171f00b006fbbdc6c68fsm2535696qkb.68.2023.01.07.10.48.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 10:48:36 -0800 (PST)
From: Tom Rix <trix@redhat.com>
To: ogabbay@kernel.org, gregkh@linuxfoundation.org, dliberman@habana.ai,
 osharabi@habana.ai, obitton@habana.ai, talcohen@habana.ai
Subject: [PATCH] habanalabs: remove redundant memset
Date: Sat,  7 Jan 2023 13:48:27 -0500
Message-Id: <20230107184827.2837347-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From reviewing the code, the line
  memset(kdata, 0, usize);
is not needed because kdata is either zeroed by
  kdata = kzalloc(asize, GFP_KERNEL);
when allocated at runtime or by
  char stack_kdata[128] = {0};
at compile time.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/accel/habanalabs/common/habanalabs_ioctl.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/accel/habanalabs/common/habanalabs_ioctl.c b/drivers/accel/habanalabs/common/habanalabs_ioctl.c
index 619d56c40b30..949d38527160 100644
--- a/drivers/accel/habanalabs/common/habanalabs_ioctl.c
+++ b/drivers/accel/habanalabs/common/habanalabs_ioctl.c
@@ -1123,8 +1123,6 @@ static long _hl_ioctl(struct file *filep, unsigned int cmd, unsigned long arg,
 			retcode = -EFAULT;
 			goto out_err;
 		}
-	} else if (cmd & IOC_OUT) {
-		memset(kdata, 0, usize);
 	}
 
 	retcode = func(hpriv, kdata);
-- 
2.27.0

