Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D74B293BDFF
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 10:33:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A977410E216;
	Thu, 25 Jul 2024 08:33:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="pm7w8hTW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFA9610E216
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 08:32:59 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-1fc6a017abdso4963305ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 01:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1721896379; x=1722501179; darn=lists.freedesktop.org; 
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fLpK4IsZZXZzigL8BlyMfcfMZdXZGh61R5/l1I9Kec4=;
 b=pm7w8hTWBlIVivrJlDB714G2urwOFkD5eRrEENSYQdrW8L0r10yOYgNOvMLApZRSas
 9h7RTqN7c/msYryfUDB/7unqIn7vag37000tjq4DXTTdX4wyBWV27ERaHOtlRdW79Qra
 avhnvqCu4jPWrmH6JfghiYB1nF5y4NoP7R8aPBvVs5Gih5YUx1xYUgKNxXHtLVGhnbXS
 /ygjJ2EeOCvPJiAnMU5TVD+9qKvv64gXaC2miEmQYkPOyt35bqaRfISIQ7Hc5w/Z05dE
 oLEACRLFPJSfBv9PauYh8v5zxsBipBWxb1F2rlQ1Ib4E1t0mb8zPhHgG8p5xatvM5Hhd
 K01A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721896379; x=1722501179;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fLpK4IsZZXZzigL8BlyMfcfMZdXZGh61R5/l1I9Kec4=;
 b=K1ObTIkTxQyCbE/4AhKjD894CNyb1oVhxRa6NHaRwlFZEd3HBc6FbdtW+FtNJL6eNY
 tfqTW3Cw4HJ3X/qo1cWwYRi5r2fB2ZaC2clKE116WBteyhzM3RgEez6tA0y+PyW3n/NC
 QZPmUMGdOwGVPQ/ZV2iR1nHha9J+s8yReXK9GDsL3aCiqHEGEf9jqHcL68WEsoGfnvLJ
 L7JqRFRGMqw1KjHkRZulm+KyhTSdRl7oPsLte9Ulbjnq+E3a/vJuizwAwil2S5yn4u/z
 5bKbIXu9UKFaAZsIuIziT2cFHa7sVvLTqwvWPlQ5CFN7ByX1QMcIX+bvXPXsjz8poCbr
 mTZA==
X-Gm-Message-State: AOJu0YzoungbUrHdgSKcVPt8dl8tIYg0djiNWaS88Uo4ZIJtR+q6tSp0
 Eg/UT8OcNWJEe/xy/QTYLuCNPyOuihceY+aYzVcINHIK6Z0+CmdayzHoSJp7Cu0=
X-Google-Smtp-Source: AGHT+IHy/fBf1qd+/nEshN4ReuVn5u49Z5q+4pzr0GkT9vCyfTYvvnbpFYFwUsXuej3/QfbhLNvy9w==
X-Received: by 2002:a17:902:d507:b0:1fd:ae10:7246 with SMTP id
 d9443c01a7336-1fed923f5d3mr12268465ad.5.1721896379132; 
 Thu, 25 Jul 2024 01:32:59 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fed7ff9086sm8595595ad.302.2024.07.25.01.32.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 01:32:58 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 dianders@chromium.org, hsinyi@google.com, airlied@gmail.com,
 daniel@ffwll.ch, jagan@edgeble.ai
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v1 0/2] Modify the method of sending 11/29 commands
Date: Thu, 25 Jul 2024 16:32:43 +0800
Message-Id: <20240725083245.12253-1-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
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

This 11/29 command needs to be sent in LP mode, so move 11/29 command
to the init() function.

Modify the Melfas panel init code to satisfy the gamma value of 2.2.

Zhaoxiong Lv (2):
  drm/panel: jd9365da: Move the sending location of the 11/29 command
  drm/panel: jd9365da: Modify the init code of Melfas

 .../gpu/drm/panel/panel-jadard-jd9365da-h3.c  | 137 +++++++++---------
 1 file changed, 71 insertions(+), 66 deletions(-)

-- 
2.17.1

