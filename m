Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6D73A4EF4
	for <lists+dri-devel@lfdr.de>; Sat, 12 Jun 2021 14:55:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5906B6E072;
	Sat, 12 Jun 2021 12:55:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7907A6E072
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jun 2021 12:55:13 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id j12so4760165pgh.7
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jun 2021 05:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eb2MpznI1FrI/fGbqqgN7+yj2amKt0XEdrNNlykJC5k=;
 b=TfXfu0bfH9YUnOeSFGMVLTZYIRcJVfZT2oHpbhX/QW7VDi36f6jsqCzp/e4Z3muh7W
 JloSXUKgWczFceQ6BZzmStBQJzGtBc5nUAVo+vFaFyqKvuUFdDpvxjH90QUM8henXy/m
 8dNjf3MTi1LeU/87XF9fi3Tu6mk2hG9Hn97Ux13KlPrWMaVrgSfruzoJkETXmtn6cIxE
 cNaUwOozGVWmycnhAjns1O6SMkmf4KNgzhHhNr57cwlo7ELMQDHAo8bxVw+oYWLSdKVL
 vofDJveXshvsMMhj53rsHxtQ74Tdl4sYY7G6w5qv8HdB+ZYm4molOxO52nTN5B4ytcBg
 mLjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eb2MpznI1FrI/fGbqqgN7+yj2amKt0XEdrNNlykJC5k=;
 b=mBEw0xpl0Pg+lAvGjD/CkTVJCaVWV400POgQ0SSpsSQLCgeZpcE5CSHaOCJCsL/Iot
 vBYb8hcBui+WO2eRf4I2mkk6L1mlnmxAKz2pyqtkmSsNejaK55bDJSXUqfTduOIKDAIR
 HxV0Mes1qX3BpcJEBCMKj9hdQXpxmkm+iM8GcYRf8dePMuKQFWbjbtDTN0FA/IMlVa8C
 Lq/8hzjyQcl4FpUMv90NYtcVxIIfZCqqpw0cVtu6j+EMS9pEeez67ImGAFEquhnyApnj
 5Z/FueVQKl7hPD/cZxLKXuETv/Wwj9t9RD59tb9FeE53RwIQAAHi34HkaE70Mpl61Di9
 pN3Q==
X-Gm-Message-State: AOAM532pySt3XaXIjnDM713KYLVn9gDhQqUrSonTKq6hFakIucmPXWMK
 iJlVBftmPyq+yMWpFYqaugE=
X-Google-Smtp-Source: ABdhPJyQcLlhoZsHoGgitL1Yik3SCMrENZucQuSz7Oa97wztfdRZjB+cRh2q9PHjcpLYOQ30hzuZ1g==
X-Received: by 2002:aa7:8a58:0:b029:2ee:2da3:746d with SMTP id
 n24-20020aa78a580000b02902ee2da3746dmr13250190pfa.75.1623502513030; 
 Sat, 12 Jun 2021 05:55:13 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id c7sm8015498pgh.72.2021.06.12.05.55.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Jun 2021 05:55:12 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 0/2] drm: Address potential UAF bugs with drm_master ptrs
Date: Sat, 12 Jun 2021 20:54:24 +0800
Message-Id: <20210612125426.6451-1-desmondcheongzx@gmail.com>
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
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, skhan@linuxfoundation.org,
 Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series addresses potential use-after-free errors when dereferencing pointers to struct drm_master. These were identified after one such bug was caught by Syzbot in drm_getunique():
https://syzkaller.appspot.com/bug?id=148d2f1dfac64af52ffd27b661981a540724f803

The series is broken up into two patches:

1. Implement a locked version of drm_is_current_master() function that's used within drm_auth.c

2. Identify areas in drm_lease.c where pointers to struct drm_master are dereferenced, and ensure that the master pointers are protected by a mutex

Desmond Cheong Zhi Xi (2):
  drm: Add a locked version of drm_is_current_master
  drm: Protect drm_master pointers in drm_lease.c

 drivers/gpu/drm/drm_auth.c  | 23 ++++++++++++---
 drivers/gpu/drm/drm_lease.c | 58 +++++++++++++++++++++++++++----------
 2 files changed, 62 insertions(+), 19 deletions(-)

-- 
2.25.1

