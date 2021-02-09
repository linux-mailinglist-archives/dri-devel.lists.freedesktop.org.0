Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D23314F03
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 13:37:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5611F6E03D;
	Tue,  9 Feb 2021 12:37:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF20B6E03D
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 12:37:45 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id y10so9675491plk.7
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Feb 2021 04:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=967eBecaBcf3bDwc7ufrOcSaPwogO+dzRNci9Jx2sbo=;
 b=eA6ZzChduHPTMqwvb080DCcMO6PxKR4dC8i99uTS6GPwbftMVKTI0y2NMeGPEA5iT7
 LVdymh2XXvbCwxxAlilErz8rXcaHeMl19WBeWpdc4+qpMnbIScoAz0Q/WwW8eYjGCBP5
 avvt4zuLjAWlDk2BSzjKIGKsuTyqnrXHzFOuykV+cWFnQJ4o97JTMYJNWhavUzOa4WCU
 7eeRPXZDDjOxdyjUE5RIgQ8QiwECY5frzAz3nVmBArfJTAPwKtHQqBbnI53bHw7UvM7Q
 8MwihYKlXOq4wF/ucOZCMkMmF41c2OtcujftQ7Dc0oxzkMcvx+tGDCCRjZlvDfm1Rejb
 LQKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=967eBecaBcf3bDwc7ufrOcSaPwogO+dzRNci9Jx2sbo=;
 b=ELGtZOZfbXLxJ/MfVMSLW3hED7dyPO24C6XnO+DYVxbCWrUygKI4dB1uWxnvzkTo8g
 E1QStsCg63+fK/6MdB+d/t1Kh3Gunax6V8wFXGxrsxsF8ZQI76QvYZ6DHYdDBhavkFgO
 6ymzJ4KpKqf53VKMsVmwqEN1/YXL3r+rfCe11wAc5PGinrDO7BEkKVs/NA68IXZkCkW1
 LeyWfjrHga4fXhNGmOCOCvEdv/2w4sLME+KNEC9Yh1RHFqSsLcXD8ExNJcxq6HAep4hM
 BwW9/xiJGGKIwwdq18ethh5U0m0hmOtZZIYMoJW6m4Sws19cpTz0EIzxnzpUvQUyK84j
 1VYA==
X-Gm-Message-State: AOAM531remZUVX3vK0CCDmh1Nbni4wL2UiVOAY6lvcFcRsnYrLtyP+M5
 hU1KJ7WiATW+eSKrn+ElcCs=
X-Google-Smtp-Source: ABdhPJy2UCRzy8/Etrbhoxi2JKfFS/m8pcIjipjpZgBGckQh4989njKh4Vzf+9yBqb6vZRlOXaS5bg==
X-Received: by 2002:a17:902:9f8b:b029:e0:a90:b62 with SMTP id
 g11-20020a1709029f8bb02900e00a900b62mr21141320plq.70.1612874265242; 
 Tue, 09 Feb 2021 04:37:45 -0800 (PST)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id i7sm22584395pfc.50.2021.02.09.04.37.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 04:37:44 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Andrew Jeffery <andrew@aj.id.au>, Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH v3 0/2] drm: aspeed: Support more chip families
Date: Tue,  9 Feb 2021 23:07:32 +1030
Message-Id: <20210209123734.130483-1-joel@jms.id.au>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
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
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-aspeed@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The out of tree vendor driver was recently updated to support the
ast2400 and ast2600. These patches begin to add that support to the
mainline driver.

With these two cleanups it should be easier to support different
families of BMC system on chip with this driver.

I will merge them through drm-misc once they have been reviewed.

v2 fixes review from Jeremy. Thanks!
v3 fixes the dt match table declaration

Joel Stanley (2):
  drm/aspeed: Look up syscon by phandle
  drm/aspeed: Use dt matching for default register values

 drivers/gpu/drm/aspeed/aspeed_gfx.h      |  8 +--
 drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c | 11 ++--
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c  | 67 ++++++++++++++++++------
 3 files changed, 62 insertions(+), 24 deletions(-)

-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
