Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DBBC1F138
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 09:49:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7428C10E932;
	Thu, 30 Oct 2025 08:49:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=compal-corp-partner-google-com.20230601.gappssmtp.com header.i=@compal-corp-partner-google-com.20230601.gappssmtp.com header.b="is0D8+AI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2E5110E71A
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 08:11:01 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-b67684e2904so5042616a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 01:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=compal-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1761725461; x=1762330261; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=W4TBb1NGZPBKZvsq9zfR8xwiZbK0RiAI4Eb+zjEMiJg=;
 b=is0D8+AI6dEZ+WSAuqrz55YQV0pItIhnWqf1NHIxEduFXaNElfivd6ynjM8lLzGTUX
 UQ448iJwVOz09QJUr53VtSx8mPPITAwWwMgChTmgqZ8xtoTyr9tnftUM3JiQMMgwbcqJ
 7cO1c9TYLv7N7VY96FZjh2jgNFkf0lR06G6FCI75utiCmhV+s/s4Gq30zl5tGnME2qVD
 exdhxnOjzjrVoEf9FUVmPCDnqk6RgGAo2IXu1zcN+YFX41rw/m/YrrtCRPIsguWz6xut
 IsbO5Voam/wcu7XmSjtNbB9b6Tlp/JKn279cUbCpKaJcqyrOWdarNjZ8Wmj357cAHZg6
 x/sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761725461; x=1762330261;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W4TBb1NGZPBKZvsq9zfR8xwiZbK0RiAI4Eb+zjEMiJg=;
 b=Ppoa+TU/wwGyHoSTqTeWGjgYsilgFPvEKw5Vue5D0YCA/0K7odek0zI27a199Rhy10
 dtVmjzAEz0ADRNkrOywhC1RblnbCVuWtjuVmk/8/Y3YS2FYsUbrAWWCN5TrX0jnhctYF
 GMduEFr/NVKZXiOsQ6gT/s+MhqZZT87jTsfVYBenyLm/Ajv1/ZlNqW/NAZ2Ou9Cj5qL5
 9stVBYhybroL2FTfhjiHogPzZ5xzIv+OScY27st8H8fWv8kZ0YbvM9AgQV7KD4FMbtva
 B3F+QTLXURWZ/jJYxJyFlalDzLWLe7iHGwXVjYM6FARXSAlDKdt8F+YyRKcXklSMCjBs
 QHBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2h+uQL05LusGBeHE+9N8jAfYzOttfzCeKgeJcc8Ho+uBHiecKYkEen8Inua2lAotD992H9YjIK8A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsatHfh2B1ocpZ9yQFBTLJ+p8igfjsmtXKtB3XsFG+sS/KYSXB
 EHIHg8Ba+xnmhXY4WaHPv2bHNa13zGkRn9jR/VIAe6d0MQ9XTWqOKobTIHX+qTJQeIc=
X-Gm-Gg: ASbGncs4A4WmM0CVqSm/gBa5cUjgnAkoWlcecdByKlC0l3yhc6XzsfwWXreclH0r7/r
 /HpzROBVJ4YLaY0Ams7xF6cyJe5sCVWe1ObC4u9uwyzpne9jvNFNP4AFewSTuTfnY5lCH9A4ibu
 Oxatz5TfTHpUgiYB70WAOttuKvhzHSoahxUDQ0v/wk5+f0ebk+Y/VnNx2JojxSHiOvQXM+cDIM7
 x2E0eyF9xoVvFaDTTBfU0Iyz+0ps8htl51+wD2m6wJIKX+sOu9dM7/tI+THUgNS59G//Y97vZ8v
 /sDkV8F3ArOQxEOts1+V3myoWQB9PUwPI0fx44tE6E+JNaQ69gQtow1nYzZVSO3c5iVTHT9ObGf
 a9m8xAf2xqHlOl6jhO7jtX0U2Cm8I4MIjSEYSdH77qfIbGvAkeBIKwR1JPs/pI2vvQl6xr86z3e
 P1GxMW6I68FytZAFStcAWD6bPP5ovu22Eqcg2SjKWVzO9DjWfjDnOS08QPn9brUWH6dO4KfK+73
 Ns6bQEKyXkWWFLCy1SA7lSQ
X-Google-Smtp-Source: AGHT+IEcVGsW+DQZ98CiBxU6KG24EXGungrAvTUljhmtkrrdGkEJqJ2HiPOwNRPACMFE5LCNKepWsg==
X-Received: by 2002:a17:902:ea08:b0:250:643e:c947 with SMTP id
 d9443c01a7336-294deec67femr26359755ad.28.1761725461243; 
 Wed, 29 Oct 2025 01:11:01 -0700 (PDT)
Received: from ajye-OMEN-by-HP-Laptop-S.compal.com
 (61-219-175-100.hinet-ip.hinet.net. [61.219.175.100])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29498d23226sm143988155ad.49.2025.10.29.01.10.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Oct 2025 01:11:00 -0700 (PDT)
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Cc: Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>, jazhan@google.com
Subject: [PATCH v1 0/2] Add EDP_PANEL_ENTRY3 to override bpc
Date: Wed, 29 Oct 2025 16:10:46 +0800
Message-Id: <20251029081048.162374-1-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 30 Oct 2025 08:48:46 +0000
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

v1:
- EDP_PANEL_ENTRY3: 
  - "override_bpc" is used for override the value of panel's bpc.

Thanks for the review!

Ajye Huang (2):
  drm/panel-edp: Add override bpc quirk for generic edp
  drm/panel-edp: Modify LQ116M1JW10 panel's bpc to 6

 drivers/gpu/drm/panel/panel-edp.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

-- 
2.25.1

