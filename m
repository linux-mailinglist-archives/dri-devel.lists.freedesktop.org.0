Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E10429D82
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 08:11:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE28789DBD;
	Tue, 12 Oct 2021 06:11:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17AF689D5C
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 20:22:03 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id d125so5275596iof.5
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 13:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=mR1r6/ECG8yi6si5Sq8LCfLiqt83mEP64fZS0b5Zpvw=;
 b=P3F9gRwbWfa6U3rMrHyOrJQCCH7PzT/IAYQKBIAmr4d+0iB68Hb52AOPzyMvPe8SEh
 vYHQSqu7Mi+zWV2q/IMl8T3Um7nFY6H54ddJwbeLHL2WV3i3OnYuwzcvdnf80HLJ2Ik0
 8L0s7ZJ5dLxVxWM2UIqsLZQQWo+IjAnOzNEClxJukZU4LUkfaBOg8b9q7FW3lpRQjDBZ
 +qCA6kVfG/WmFvna9EsEg7Zgxg2qXvRJzM+u8eljvIww1FspZy6KwRlc22LsQVGotK/X
 SmLclcvVnl/xTf/SkV7dSUnwHD6Hn9p7h2Ug8rOTY2l+nKIiDc5p3yu17QZHOr4TR6BC
 FYMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=mR1r6/ECG8yi6si5Sq8LCfLiqt83mEP64fZS0b5Zpvw=;
 b=cNpAbrwk984qQGyGorJY9zZn4nycC8j1D0rJbqUSK5WFBXWLDM11DZtzGhm01rZGMC
 VibDIyDTk5YRKKyDqAKTbTtLB5Nyaf06ctRl0pFf04qRyw73Z/4iOT53twYLooYjZSxU
 BV3BbhsPVVOSIMNnfWc9p6xUTHO7xETmi1YUtKiHExUzWiCOPHMC7Bze8X4UFPFlC2iE
 pw9uuwmdBLzMnYPFOLX5ZIFL7ect+ja18FAIhD16yaUclgGKzQsB/Uzzn4ZjoGfRVLFc
 A0cnW3rFrgKSju0rq+eVAZ5knUNiPJIhif1DnQ56L/NmnARFQi/ItUmxp2/3M9oigxDM
 lI+w==
X-Gm-Message-State: AOAM533TeGI8ijyuN6+What/cRCZyB2AKs9bL3CKTIZomY4XsTBkYfAQ
 Llq7eL9zeZp28QiCpQ8VcYvknGhbbRe9Sg==
X-Google-Smtp-Source: ABdhPJw1YJ6ui6BPpSN5nhhgNmpblK0pumQEZJ0TmbGY3skLQ25OywfSXa96jZi0c2ez4N+UWH2DkA==
X-Received: by 2002:a05:6602:2e81:: with SMTP id
 m1mr9434430iow.23.1633983721679; 
 Mon, 11 Oct 2021 13:22:01 -0700 (PDT)
Received: from t ([2600:1700:4b80:20d0::31])
 by smtp.gmail.com with ESMTPSA id n25sm3401895ioz.51.2021.10.11.13.22.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 13:22:01 -0700 (PDT)
Date: Mon, 11 Oct 2021 16:21:58 -0400
From: docfate111 <tdwilliamsiv@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: harry.wentland@amd.com, sunpeng.li@amd.com
Subject: [PATCH] Size can be any value and is user controlled resulting in
 overwriting the 40 byte array wr_buf with an arbitrary length of data from
 buf.
Message-ID: <20211011202158.GA19208@t>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Tue, 12 Oct 2021 06:11:20 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: docfate111 <tdwilliamsiv@gmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
index 87daa78a32b8..17f2756a64dc 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
@@ -263,7 +263,7 @@ static ssize_t dp_link_settings_write(struct file *f, const char __user *buf,
 	if (!wr_buf)
 		return -ENOSPC;
 
-	if (parse_write_buffer_into_params(wr_buf, size,
+	if (parse_write_buffer_into_params(wr_buf, wr_buf_size,
 					   (long *)param, buf,
 					   max_param_num,
 					   &param_nums)) {
-- 
2.25.1

