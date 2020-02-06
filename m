Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C791154C04
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 20:22:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96F2D6FB2C;
	Thu,  6 Feb 2020 19:22:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC7C6FB2D
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2020 19:22:16 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id e9so397373pjr.4
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2020 11:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VxdYT7Jr37+XIWn4jhBieUFNrBXU3SoPK6I/5YRWK/w=;
 b=AyNlQwU4TwuV2H4B2LJ9M+QyLsr8MIDpbVzyEBwfkPuT7y58VZYSUlrCknQ5QXCpPP
 aR+yUaNXi3pw8YlbsaTP2/7pFK3P3YdNEwrGVIQ256XZ1DRiFeqk4cCpl56X/aRqcUow
 HNrb8XfUnHw8iaIa9ATn/QZUi7cLTSt4KeGE4J6zeH+irSBQlKvCq5xK2ydUNIPvqsvA
 bib+XLUmzrXdQMm3ekQVHF6VXb4ByoaGfu+77Ivwa/77PnBhS9jW2Vq2otc6Pvyx5zuD
 s5oL1F+3x5JduLHY2h2/z5Wj44G7MLoZlM6KXlM5a3SuOdFja4ZUrl+eFqfP3yNqnaE6
 V8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VxdYT7Jr37+XIWn4jhBieUFNrBXU3SoPK6I/5YRWK/w=;
 b=eflmleHQhH6Xsxn2GxzKC0hQziO9vBIkZPyYq6ajF5+boxfu6nNcUuWuGy/yJMv+HL
 6E6Puu4WtP+ty9ih+wRZV/VJvfwqQs7zPTmEoZle1NKFCGMzUap/1IZ7JMncsCj0+OgU
 rrAvgxx1bD7Qu7BCTJ0xlFncjMRrBEroYkhqLhB/FAxAaZI+3dziDiORG8342ItSktG+
 NvOBGRFfO3LDb3ltX1ATWzZzC7uLlxl1+uzaZzDwivT5XFguMwLl9i6D7ZRoSp3HRpcn
 P1LCV+UEyaxNE6dW+3wOjoZmgewQIRN3u+GDcStpdK3wtuDOYIs2MEWi3V+s9CzjEImQ
 0Mow==
X-Gm-Message-State: APjAAAWXJiFA+g2qKusKC2kt/PtL7i5WYrNnmIbPCY+oXqbxyhik0KzI
 sNV5hhA6UFxprrr46jwmVOj/miOs
X-Google-Smtp-Source: APXvYqyjDYC8RhP0MYu0D4UwolFbddZUid8A3BeKe0LdbwbaR5415huAP9swAW3DYwczy4DbqX4iuA==
X-Received: by 2002:a17:902:7d86:: with SMTP id
 a6mr5612159plm.212.1581016936143; 
 Thu, 06 Feb 2020 11:22:16 -0800 (PST)
Received: from olv0.mtv.corp.google.com
 ([2620:15c:202:201:9649:82d6:f889:b307])
 by smtp.gmail.com with ESMTPSA id r3sm162840pfg.145.2020.02.06.11.22.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 11:22:15 -0800 (PST)
From: Chia-I Wu <olvaffe@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] drm/virtio: rework command batching
Date: Thu,  6 Feb 2020 11:22:12 -0800
Message-Id: <20200206192214.86818-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
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
Cc: kraxel@redhat.com, gurchetansingh@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series replaces the global disable_notify state by command-level bools to
control vq kicks.  When command batching is applied to more places, this
prevents one process from affecting another process.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
