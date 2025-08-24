Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E03B33207
	for <lists+dri-devel@lfdr.de>; Sun, 24 Aug 2025 20:24:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59F4810E104;
	Sun, 24 Aug 2025 18:24:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LlRlBTif";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15E4410E04A;
 Sun, 24 Aug 2025 18:24:07 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-b49db86cac4so383060a12.3; 
 Sun, 24 Aug 2025 11:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756059846; x=1756664646; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=td123reH3egVHtGN6w8XXKv8wCXzpkQcOkeYMze3oQM=;
 b=LlRlBTifC4Ui4cuV1DlBPmDWa8fAxJyU0oMXtL/9RRfJDjQB5NQZN1U+7bgzY8LmdR
 4qIf6XmOEGPRYjPdQwwaEjHhwoUbn4vzTMRlX3pR6kuSGHUQ/Vjmi9ZmIqg9nKh1yLEe
 ODXSe6TeFYjf9Dfv16AGxzxQicyFa+FhaVdcJ7QAa8nJMrM1WOESnzsYjIK0j3D0YjLl
 AeVZ7V/1yoGaru2eWlIRdB3N6nonFVW9obFoda5+NcZrPx6HkRK1lUA1lqf28Rb3zbpi
 JiEH3/eu0qsSifrH/oEnGbzBnMm9t7D27RNFyxjpEhrhzoYfMVIA/ApxNBN4R3SRBxTC
 BQoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756059846; x=1756664646;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=td123reH3egVHtGN6w8XXKv8wCXzpkQcOkeYMze3oQM=;
 b=k9ib5IHWfAPlpJDsakG7QQYb7H3+RRHM7zX7Pl5b6Ww1qx5w1+XJJAH2xBjsw8R/v8
 9QTFLpUXiO7wEXsaRDm87ZAHgwavCYjW9s5RAEEJafS2SLXXb+QinCjWnm/m51w7Zbw3
 RnWhXBBYjUjk5vkfANhC4zUNppetegU823QTOqEL8Wgwfx7zLBxeOAhM9rDwv86WSYnH
 UTWTwqO5EiTwJDC9QrejwMfvqX8ZFLqpO2XiAYjfKylW3zsBCAcnS9B30fHvL906gb2+
 4MEzNsu5fuPg5LBdSh4tkAoQTARyKW+2qLcKwxc0dBIL67nKZbF6+HskE6tg9zhHxrjW
 ItXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlVULtFN6JjO1qlbwU63xQKTygTOtkgEcs0uQh90BEE2Qvn4nhrtqs0DW/WgWYitKdbd6Rqct7@lists.freedesktop.org,
 AJvYcCXnjGTW3yuKhnq++4iSHoSNR5MREWANhm+U8izGixzp3iEluKK5uM1CKRDFPwJ+3tDiGhp/AWtUsrpo@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0YWCGP4GIcKgxp/OZY7jxv8QdQuFnM6EWnobr+kk7Kr0bK5gy
 AgOTFBC9o27aXElhfxaxiBc9z2f809LJb6UmwZZWW8AfAXD1U4FMaHtA
X-Gm-Gg: ASbGncu+L+aAyP/1ft2RKV5vFffMTXuITx5JdPwUkUu6vTdRZvJnYUzvIS+rafGnBbR
 5skvb5M17/nGDNHaOVG9b16/qjKnPaZr4gmszddnVGTmweie/Vz8rgdMXDvAi8vP48/MgFuo4ux
 IWe6mHhBCxTxUlaHRw81DccpBJCTlQfk8uAVafLkSy7kNTKEO+NNcDJ/ClJZW3uirqJHmcfH25c
 Vmpe6e39qM/cVegTIHOf52H9GNHX0XvPXS+cj4WeK+EJPtchI4vmTJNbW+Ick/Jaq38UAPNPgdg
 RA6+psKGYAhf62pSR+inKaHrO2oB2SqHzPlgY3/4ukgXY2qBiQXZiJDTMAAFmxfo2a6xBvf/SOx
 wXFSzLr8wpQ96rCXegs7I65JGcGmMvUg++Cl6xk5DiBYEDQXyZ8wx0zHEdWEoigU=
X-Google-Smtp-Source: AGHT+IGT9tBLlZCE78lYvNE3BTz1JDfjZS14F9uHZP0BGeAleCnnJriFbG3R36j7yBUN0dX+0YEYag==
X-Received: by 2002:a17:902:c94c:b0:245:f0d8:6ee2 with SMTP id
 d9443c01a7336-2462efade2amr123629945ad.52.1756059846481; 
 Sun, 24 Aug 2025 11:24:06 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2466889f11esm47903635ad.150.2025.08.24.11.24.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Aug 2025 11:24:06 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: austin.zheng@amd.com, jun.lei@amd.com, harry.wentland@amd.com,
 sunpeng.li@amd.com, siqueira@igalia.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch
Cc: zaeem.mohamed@amd.com, wenjing.liu@amd.com, chiahsuan.chung@amd.com,
 Natanel.Roizenman@amd.com, Daniel.Sa@amd.com, jserv@ccns.ncku.edu.tw,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 0/2] drm/amd/display: optimize reserved time candidates
 handling
Date: Mon, 25 Aug 2025 02:23:57 +0800
Message-Id: <20250824182359.142050-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Optimize the handling of reserved time candidates by replacing the
custom bubble sort with the kernel's standard sort() and rewriting
duplicate removal with a linear-time fast/slow pointer method. The
changes improve sorting from O(N^2) to O(N log N) and duplicate removal
from O(N^2) to O(N), reducing computational overhead and eliminating
hand-rolled implementations, while correctness has been verified with
simple unit tests.

Kuan-Wei Chiu (2):
  drm/amd/display: Optimize reserved time candidates sorting using
    standard sort()
  drm/amd/display: Optimize remove_duplicates() from O(N^2) to O(N)

 .../dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c   | 41 ++++++++++---------
 1 file changed, 21 insertions(+), 20 deletions(-)

-- 
2.34.1

