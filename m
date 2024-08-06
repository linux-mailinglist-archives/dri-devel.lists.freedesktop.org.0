Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 600569487F6
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 05:40:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B66689A16;
	Tue,  6 Aug 2024 03:40:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="0LQisyIk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAF9F89A16
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 03:40:27 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id
 5614622812f47-3db12a2f530so102375b6e.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2024 20:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1722915627; x=1723520427; darn=lists.freedesktop.org; 
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oUtLE+GRjq8+ez1aJNrMr18S+I/P61WDmzvbeDjFvn0=;
 b=0LQisyIkFOvgHB+wopGSAVZi+B0tcb92/yNocjwmMINrka+U9GPq+hTsxLfldajsPP
 b09ahIB4A7Vl9ZBrGgILOQ70iESWxgklQp+zcpNfMiigM1S6Rd+4Kuu3FkE4XpklBQnY
 pH3T7+HIZRC6nrhjCv9jEJMtruLSxKjN1VwY1luG4T72pf9UIXpcp6A1l04WZaUpjR1G
 XoxFINPc8pQueSLJLwFf5wUuWp0bJOOMVHnn0uII5/zGuSv8JbLsqJv4IHpfUCIeXF9+
 s4MTOIEwLG2gVIT/I3cjfGanPSp36D3UgK9iRAIEDlt5HbA3r/oJfxU8D6qu1uRv7D01
 1KwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722915627; x=1723520427;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oUtLE+GRjq8+ez1aJNrMr18S+I/P61WDmzvbeDjFvn0=;
 b=DhHmyGNmg8u28sy3IF9uJR77Dov2HM+DJTuZsjjrjPusYZMyEftYndZUmnvKNXLHQ9
 pXhPov7psOiPsjuoTfkNbhHLGZuFulSZCpbOODKabAEPrmcVWqlarDjOD7LegKeGZLGF
 TsRsxKSEeF2KgmW4VjpJWENWfJmfeWaMsHOa3suulhrre6gfsaYi69PrdAMWEaACRR2O
 0tkTHRkzxXtHUV9bCdQkBncvr6V1gfpN0rCr8ivKdYh5zp+aVXlLCtSSlrpFeKdAgkjN
 jLdvjE7lbitGxxYNr5+upgNUP+2gMlf+PDTJpkzSf56W/Sgg8uSq4JNjHJZ59LNFncB9
 pGgg==
X-Gm-Message-State: AOJu0YzYLQe6A4m6yKJMR4+ymsWcYwRIQF8SLFRcrSLd0s64Ot4KBCOo
 a7WBnKUhGTcN35WyV0Bm45b1P/RFGHvJpiaHsv1xhaw+38xUbjybJAFzJLfpJUI=
X-Google-Smtp-Source: AGHT+IF4ObCPxoLMRKSfEYyb6QRkFWDV2npxxccZHFEYp9HPYvXbumPJc8dx4/W3Ek9myBwG1p+/Dg==
X-Received: by 2002:a05:6808:218f:b0:3da:a793:f111 with SMTP id
 5614622812f47-3db557fca8emr19666426b6e.8.1722915626701; 
 Mon, 05 Aug 2024 20:40:26 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7106ec49486sm6134074b3a.55.2024.08.05.20.40.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Aug 2024 20:40:26 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 dianders@chromium.org, hsinyi@google.com, airlied@gmail.com,
 daniel@ffwll.ch, jagan@edgeble.ai, dmitry.baryshkov@linaro.org,
 jani.nikula@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v2 0/2] Modify the method of sending "exit sleep
Date: Tue,  6 Aug 2024 11:40:13 +0800
Message-Id: <20240806034015.11884-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

This "exit sleep mode" and "set display on" command needs to 
be sent in LP mode, so move "exit sleep mode" and "set display 
on" command to the init() function.

Modify the Melfas panel init code to satisfy the gamma value of 2.2.

Changes between V2 and V1:
- PATCH 1/2: Modify the commit message and subject.
- PATCH 2/2: No changes.
- Link to v1: https://lore.kernel.org/all/20240725083245.12253-1-lvzhaoxiong@huaqin.corp-partner.google.com/

Zhaoxiong Lv (2):
  drm/panel: jd9365da: Move the location of "exit sleep mode" and "set
    display on" commands
  drm/panel: jd9365da: Modify the init code of Melfas

 .../gpu/drm/panel/panel-jadard-jd9365da-h3.c  | 137 +++++++++---------
 1 file changed, 71 insertions(+), 66 deletions(-)

-- 
2.17.1

