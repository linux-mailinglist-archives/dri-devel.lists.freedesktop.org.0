Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D6C4F1134
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 10:47:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 228EB10EB3B;
	Mon,  4 Apr 2022 08:47:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 367C410EB3B
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 08:47:44 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id s21so125145pgs.4
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Apr 2022 01:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iezfqCSLi9aeu9geiwLSpu2ZGrh8RQtJ4hILxdTJPow=;
 b=YtZhxs5DRluKygjqYGKUkZHGilAsQaQg+/Yh6XhjAIHye3WtPxHz6OVtRzlCw0j2AJ
 EPD/kRpfj7N4WP1druCEOIr8C5js8jI6h5uIGtsqhj7buJS4KE40uEjZs0uyq4MaPLPc
 9Lp98IVFB6Sb0PT23Jjm+wQszcBoOuzxaiMyu9RB53sgu2pNXBIiuXzZKnM9fq+5R+T7
 CznVXqTEM79IapOa7jfCD0H8pp5iZxKudOhjJKTYMLZTGFFZFvQXZh3FeaynGy6j2y4Q
 RynB/Fbids5KUpCXdFnFQ3HFRGKwf/jBvP59VoEBkmYQ4X1mWi/TCs8/cHjtzlLg9qjd
 ekCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iezfqCSLi9aeu9geiwLSpu2ZGrh8RQtJ4hILxdTJPow=;
 b=2Xu0+AIASkVO6LFehBvaR00KCQVAxNM9VmpYpxIp6dt8Pesl9MET8XcGTlIsQnsMPJ
 pVftH9Mhuf0ht++ayOJ5/WpBYIe0DkX6V4POtHnwV5CipAg0Qu/fZUy1YLxUe/a0M1Op
 T6Xgq7bXXepdDAkPXIcp/dORLFpe+mcpD9cvY/7SCAWyIlpqKGnPzo44h9PlWS1Spyal
 uElni1gebRQEyEftMDLsEkJAM91w8P0NOFHU16ednn/0DPgMZmMDrk0rPMZJeCSap1mU
 EsdN50Tu7D+zFm3t+9phArRKJvNIWbjmdAjl5vDO3f7o58grr3UVrSnTKJZkTA6SAHqF
 ojig==
X-Gm-Message-State: AOAM532niadAKBU7m3zfIYQbXnkZ2Kewm5gxhOdJZ3oleoEkf/V1oJip
 07+wMksaqwFKd3bNMCqFZw==
X-Google-Smtp-Source: ABdhPJxIscq7kv48PLNHhvQHl4s43/rPzURDjQM7KlkXxVudjUh0+KERzVFVcUn4q3vRY9v3WKhDlA==
X-Received: by 2002:a05:6a00:4007:b0:4fa:9505:8ac0 with SMTP id
 by7-20020a056a00400700b004fa95058ac0mr22981759pfb.67.1649062063779; 
 Mon, 04 Apr 2022 01:47:43 -0700 (PDT)
Received: from localhost.localdomain ([144.202.91.207])
 by smtp.gmail.com with ESMTPSA id
 u6-20020a17090a3fc600b001ca88b0bdfesm3991960pjm.13.2022.04.04.01.47.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 01:47:43 -0700 (PDT)
From: Zheyu Ma <zheyuma97@gmail.com>
To: deller@gmx.de
Subject: [PATCH 0/7] Fix divide errors in fbdev drivers
Date: Mon,  4 Apr 2022 16:47:16 +0800
Message-Id: <20220404084723.79089-1-zheyuma97@gmail.com>
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

None of these framebuffer drivers checks for 'pixclock', leading to many
divide errors, which we fix by checking the value of 'pixclock' in
*_check_var(). As discussed before, it is better to keep the check per
driver rather than in the caller.

https://lore.kernel.org/all/YPgbHMtLQqb1kP0l@ravnborg.org/

Zheyu Ma (7):
  video: fbdev: i740fb: Error out if 'pixclock' equals zero
  video: fbdev: neofb: Fix the check of 'var->pixclock'
  video: fbdev: kyro: Error out if 'lineclock' equals zero
  video: fbdev: vt8623fb: Error out if 'pixclock' equals zero
  video: fbdev: tridentfb: Error out if 'pixclock' equals zero
  video: fbdev: arkfb: Error out if 'pixclock' equals zero
  video: fbdev: s3fb: Error out if 'pixclock' equals zero

 drivers/video/fbdev/arkfb.c      | 3 +++
 drivers/video/fbdev/i740fb.c     | 3 +++
 drivers/video/fbdev/kyro/fbdev.c | 2 ++
 drivers/video/fbdev/neofb.c      | 2 +-
 drivers/video/fbdev/s3fb.c       | 3 +++
 drivers/video/fbdev/tridentfb.c  | 3 +++
 drivers/video/fbdev/vt8623fb.c   | 3 +++
 7 files changed, 18 insertions(+), 1 deletion(-)

-- 
2.25.1

