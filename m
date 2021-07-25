Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E87CA3D4AED
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jul 2021 04:11:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C44F86E213;
	Sun, 25 Jul 2021 02:11:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CE256E213
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 02:11:12 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id n10so7713373plf.4
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jul 2021 19:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=pPOXDqETdyx4025/ipNQtnHs947c2VAzDTy6HRdNK/c=;
 b=jwicGB0cqqTRVvCmdosEvB9nPjRYKZQzyksO6XzSIkwEaMIG3g27dD+3wDx65trvWf
 HCMO4f6+dB0m32tSWME4MWPqXng3tkxNnlEopha5d0JlcvAHKLoUZR12u5T503LXfOhg
 eXm9Yw509RnPP1NN33aChiiH4HyJa/M5tTKEocqt9lQdJgBuIhoHEH8FNpfB1Mxseu79
 WcYnt2fmNJcCNviO543qwifeozCpW+ESyZErnMUwpufFWGgd12q7UVfMU9OwIGi6BwtX
 OI2EW3Tcp7Jt59fGgXa9GU5tKHTjCPXPeleQ2E0ADRrc5FR2gmCacINDtVQyWH8m14+c
 gRzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=pPOXDqETdyx4025/ipNQtnHs947c2VAzDTy6HRdNK/c=;
 b=ZyHX1u9BFQYMlI++DAAQ9IJpIf3DxOkJIfEAc8Jb5wjgSWDiJYSaUx8MxGfvgKEmuD
 9hJYuHc2xRpcQBbL2PqsocTpvpCrxTz1p2RqPS84amwcINlXNdi9VKihQoK8HW6Cmr5i
 rTVyCZzIJTm/2MsW8eB6XSUfJfke4F+0VGgjBA5pYvF/lJSdEOlmVbwt/5r+byVGeBZ5
 AMJid9ynz4NqtMssPUoJGH+R+OXI/2EScMk5vk/lexLh72BUMfHOGdIEL27HIJinS2UL
 qfGPiEBAtQziJ2uwrBm8dYgrpYqwdJ2arMVysYwDW07QpwMLkPwgUSpPlXovfhX3abL0
 uKhQ==
X-Gm-Message-State: AOAM531jfPfchlTdmc6fWkP+RNEs+Z5tGgwNvfsw072ztYz8lBzdIFfH
 eUD3e7MyayyV9aJ1ywkAoA==
X-Google-Smtp-Source: ABdhPJzIaHTgElPRpB7ItNlkm0sEIcWjuV3Ik+ePJWeAxxNQ8TxXpSC4MEdgK7CsazLdq+0uXcBlfw==
X-Received: by 2002:a17:90a:dc15:: with SMTP id
 i21mr11307214pjv.139.1627179071853; 
 Sat, 24 Jul 2021 19:11:11 -0700 (PDT)
Received: from vultr.guest ([107.191.53.97])
 by smtp.gmail.com with ESMTPSA id y139sm12122341pfb.107.2021.07.24.19.11.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Jul 2021 19:11:11 -0700 (PDT)
From: Zheyu Ma <zheyuma97@gmail.com>
To: adaplas@gmail.com
Subject: [PATCH 0/3] add checks against divide error
Date: Sun, 25 Jul 2021 02:10:51 +0000
Message-Id: <1627179054-29903-1-git-send-email-zheyuma97@gmail.com>
X-Mailer: git-send-email 2.7.4
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
Cc: linux-fbdev@vger.kernel.org, Zheyu Ma <zheyuma97@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Zheyu Ma (3):
  video: fbdev: kyro: add a check against divide error
  video: fbdev: riva: add a check against divide error
  video: fbdev: asiliantfb: add a check against divide error

 drivers/video/fbdev/asiliantfb.c | 3 +++
 drivers/video/fbdev/kyro/fbdev.c | 3 +++
 drivers/video/fbdev/riva/fbdev.c | 3 +++
 3 files changed, 9 insertions(+)

-- 
2.17.6

