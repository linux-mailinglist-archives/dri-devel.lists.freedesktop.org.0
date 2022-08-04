Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E140B589BCE
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 14:42:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 250651139E8;
	Thu,  4 Aug 2022 12:41:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 424A097971
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 12:41:41 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id h132so17833274pgc.10
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Aug 2022 05:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=Jxp/ZZ2IP/r5wdh/E9VL2sjWN7cCRv4O2EVI3aFNd88=;
 b=mB1b1iZj1jk6+iE3H8+0/DIUxhsUtKMmi1cUlKktRqiKRdQl6wcVCaH0fxiKE5L1St
 Oo0ssMdoZK+r/XpROJQAL4ajPnwpPXVyS3osq1JaxsveNY7yOUdGfwwVcgyxRjB/7+rD
 TatDIZp8jwH4Q892sSBKqahFwQjQh0tcbDYNmkFOpnl+GyaYDpreX6AY0LN/kjjWFVOp
 KjALY8HLg1vivHOSjiIKxVIuoT/K5JZwwypcojJ/gbMP0ILl+YPZy1lNDvz2V6+ybajI
 5yjS77Vurc+ZDrE4mltLD27p3SSiNZrMPLy3NaQgwQ2c6Z6lz5tAfKQFxCDcvZoz+4o7
 K7XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=Jxp/ZZ2IP/r5wdh/E9VL2sjWN7cCRv4O2EVI3aFNd88=;
 b=IQHQMVWlkotPEQWIS1H8FDABl4wa+rNHvZ/XZ4EGhaljBYkR9mB+4gevj/N3dpX4WX
 lVOqvT55wYnS+96VgUIB3eAV8ymqY7ge4BHDJZQ/4hrUeDRJZ+Gjvus2DR8Kl+lSCPxY
 bFsHstBIT1GBMn5yA5bHG7DPqPGdFc0AVGhXQ67yVtunCg3k6E+c8SS02Cu18kEULGqp
 JUZfr3gi/mv1IDuTpU62Uf80A51DDJDTpUT8/fNjvpveN2TZInyhx4dN2KT6GKFVf5En
 plZeU1GcRF+bUS5mNC9cbn78+L29Oxv/oE2bW2NohFDn91SpkxmhhaEAits5EuyDRqzx
 JKuw==
X-Gm-Message-State: ACgBeo0ySG3Ihg7PAvtxpxvvKB9zDfzCDJjiymUKyFx5HvsyZxDBOCg/
 d/44PbZnDn6vPWBsrBceQA==
X-Google-Smtp-Source: AA6agR7OCkCZOlQGd61Gl4vRVugbgIJJG5uCOjm6CCDU2oMYjrbQ4/YazeoSktpsodzeVz9eh6wGsg==
X-Received: by 2002:a05:6a00:1c4b:b0:52e:6c05:8f1f with SMTP id
 s11-20020a056a001c4b00b0052e6c058f1fmr1746153pfw.7.1659616900533; 
 Thu, 04 Aug 2022 05:41:40 -0700 (PDT)
Received: from localhost.localdomain ([166.111.133.51])
 by smtp.gmail.com with ESMTPSA id
 i8-20020a63bf48000000b0041b672e93c2sm1070769pgo.17.2022.08.04.05.41.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Aug 2022 05:41:40 -0700 (PDT)
From: Zheyu Ma <zheyuma97@gmail.com>
To: deller@gmx.de, adaplas@gmail.com, santiago@crfreenet.org,
 akpm@linux-foundation.org
Subject: [PATCH 0/3] Fix bugs in *_set_par() caused by user input
Date: Thu,  4 Aug 2022 20:41:22 +0800
Message-Id: <20220804124125.3506755-1-zheyuma97@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

In the function *_set_par(), the value of 'screen_size' is
calculated by the user input. If the user provides the improper value,
the value of 'screen_size' may larger than 'info->screen_size', which
may cause a bug in the memset_io().

Zheyu Ma (3):
  video: fbdev: vt8623fb: Check the size of screen before memset_io()
  video: fbdev: arkfb: Check the size of screen before memset_io()
  video: fbdev: s3fb: Check the size of screen before memset_io()

 drivers/video/fbdev/arkfb.c    | 2 ++
 drivers/video/fbdev/s3fb.c     | 2 ++
 drivers/video/fbdev/vt8623fb.c | 2 ++
 3 files changed, 6 insertions(+)

-- 
2.25.1

