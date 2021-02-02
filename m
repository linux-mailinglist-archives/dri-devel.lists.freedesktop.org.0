Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F90C30B750
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 06:46:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A33A6E8BC;
	Tue,  2 Feb 2021 05:46:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C2586E8BC
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 05:46:09 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id m12so1563938pjs.4
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Feb 2021 21:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GfAQJJOiqfJpwqSbeAm0bLmc69acbey6JfZBmykjrNo=;
 b=Q64G8Q1Xtgrmck8NQm4jnn56juX7QbIPeeQX3Uhihe9bvMekEKhbUJFmv4Q6XbzYUg
 FfP/aUk4Xh5U9tODV8Z7V6TP+UmImXOm2F5yrt8ki4N6T9f86m1AuWgHSL79X5E+cyar
 mZ4th07kAOuM7jt7sx+A19aC7NGSdnWwx5aFgk9qoDD5XJg1wMhsSogdU6J8JSZv4xi9
 kq2SR9IrC6ftLn1RERsx+g74w7ibM/SKjN7yWOXAkeKXBWsppKZNb52H9tC2TCru3i1s
 d1gEydGMZFwvVvnU2LwP6hwr8Sc149+RkfIytKcQ0tqng8m5gmZ5+2WC6vuv/Lt+w6og
 24Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=GfAQJJOiqfJpwqSbeAm0bLmc69acbey6JfZBmykjrNo=;
 b=CbwTetYmq2DxQ5COijFdVEoN2NYh5juXnQIEotYm/psjswrpnBJe4zDs6pXAhiNY+J
 199K5XcSmat8mih4ocj6qQO4g2hJ/dnHghwNXPcXX+d9Dh1enAc/EdI9tyYTf2VvnBh0
 i06K+gfm7zbdRP0d1MqiNvfONzzdFQQ+G9ZmLcNE+j3w89KfuFwa4/kcnIc9sq1IQfq4
 1K0qttERPFH71rL0IxpA1ZGBadDwzRAdnGVK3Ru1/+1uGoXkp3upqtKmMqjg9oxN+ID+
 b2tYe5E/KAM1JaHI/FO4iDYl1xzVavfwpl13Fl3RCjtCC/xGgBCAtbyYyStjaZ3nz33M
 ySzA==
X-Gm-Message-State: AOAM530ZADwLbIs46WrKbX5pmWbNEj2Xu5EXsGN0Qm3jPc+QzYVCsWlT
 lgYjRWJrGFX64zJtWaL+Cmw=
X-Google-Smtp-Source: ABdhPJw77F0Ms1Mav8c2DJzdO+6VRXbL7FJ6kwtRH1DUYObjNeA6QmQeOpCqPdp+WQge0UltBYzmBA==
X-Received: by 2002:a17:902:ea91:b029:e1:8695:c199 with SMTP id
 x17-20020a170902ea91b02900e18695c199mr2004237plb.6.1612244768757; 
 Mon, 01 Feb 2021 21:46:08 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id h23sm20707603pgh.64.2021.02.01.21.46.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 21:46:07 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Andrew Jeffery <andrew@aj.id.au>, Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH v2 0/2] drm: aspeed: Support more chip families
Date: Tue,  2 Feb 2021 16:15:56 +1030
Message-Id: <20210202054558.344451-1-joel@jms.id.au>
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
