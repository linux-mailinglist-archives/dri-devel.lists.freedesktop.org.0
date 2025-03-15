Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C77A62C13
	for <lists+dri-devel@lfdr.de>; Sat, 15 Mar 2025 12:49:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42AC610E3A2;
	Sat, 15 Mar 2025 11:49:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iOAMKRum";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C915B10E386;
 Sat, 15 Mar 2025 02:43:15 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id
 46e09a7af769-72737740673so1582071a34.3; 
 Fri, 14 Mar 2025 19:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742006594; x=1742611394; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=XT8HYn51QyYArt1rrJadjd/k3O2KfE7Vq5w9HaXKeH8=;
 b=iOAMKRumFFFe2WTU1WjltKHk8BPYFi/vjSTmfJr1+QdESsTf6VgX2wSOW3q2pwn39W
 lbM2oaEUtWA/2A5MjF1eG+WWHob+n7DFZRnENBNJ07QiQhZD1cNCY1bW3rT4hha9yhqv
 1RF9wd84+wt/1BBrIinKgRm3VnjJ4SV5+hWCmhSdfOPOTelXE8vg1mZd7ui5G6R4oudJ
 H8FtM7om1WznI7GefTXTv2vYBymU3BlLwmLb/U1YH2zLdPW7iaC+NJb2ujqHEk97V2MI
 y0g5QhZWMpXLVhmhHq8irUl7EomRCmU2VOKsvNHovx2W7r6aPHYo2wlvL5B/z4rj7CY4
 3O1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742006594; x=1742611394;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XT8HYn51QyYArt1rrJadjd/k3O2KfE7Vq5w9HaXKeH8=;
 b=uiQbMOTQLl3x1NqaBVRMT9M1ae2isP1fobQnmU7tC90XiUagSeMduhEWFa0pRRlLhU
 rlfCuF6QOhUbIZbixIQMefurwkvzYewlvU/k4QzSHnl4SEhNZ0SBG1WtksCnYQPGSW37
 MqYTGTxTDYDV6ZjoQqcEx0H6uWqV/DJh5/XJ5pjbVrW66K8Cq90BJNFI0LFwMStwh+US
 Bs0mQXTnX4/ozgG+MsStoDT5gsFjCw4fPythSus32TNK7djSqzp5kB2ZFWyDnPFdQqGB
 P4m5OdT1zKwLv53MFbDcfukdvc6H1XFxE/wAz27naSlpC1DgGA8wMW9mqT+zp2eN+kB8
 5ZlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCBp6b9OxV3+qYK/lxSMn32taJBBsVXO/vn/ANo4yCWWh+Gfn6jNaGiSAYcv+ift3+I8fOeALdog==@lists.freedesktop.org,
 AJvYcCWi88aCzoNbOCFaLV7ZqxL3rOptW0vGvos8Frlm0HhKjhFnyrWq5cIp3L5Bdwp72Gzfot4zwrkrow0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxfpBtZ0PPH4JpMe7gNjC4/4pNWBNqaKQniQnJZm4+YPjnU+4pV
 J9sOUrOBwbjpbPTraV2sfVVECTZZV/w2ZMeZE4egtCsVzLdNr/a4
X-Gm-Gg: ASbGnctE5ECKmJfolvr6yx8pDsbKK2CIqLWtLqFIivOGNxYv9T/yanVaCU8patYZe6t
 IjExcn83/oKUBpZdsHsY8v0J3tyNrqXuSDnFtkPzrkAXmFklz01i0MfTz538V+dg/oARur26Wah
 D+ZoGdDMCrqMfuTBf/O8/z0DP1WxR1vBSBm7hkIFlvTB/jCDY2y+kS4jIYRhCnLMTQhYIQb20Yb
 lXELgfnsAZwiTxfOt49g02m5ZORMVOXghFQ4tlIgZ8MbyyV6J7BzsMTyR77tTHUcdvpdV+F78DK
 CVBe9MUzP+LNmuZcDpif1VY9bY9sldIbeoZ1cQB01rSc8jg53a6F5DUo7Q1hH5bM/CrGgK1cH+R
 gcBK6uwLl4jik9nHr
X-Google-Smtp-Source: AGHT+IGOVE5wyNqOM7/fv6cFlMkko9+hHKdXOnxrJZVF0sr7+N4uWGsQlnAMOYDClGQej5nEuFl4MA==
X-Received: by 2002:a05:6830:2b28:b0:72b:98f8:5c95 with SMTP id
 46e09a7af769-72bbc23c75cmr2905119a34.1.1742006594247; 
 Fri, 14 Mar 2025 19:43:14 -0700 (PDT)
Received: from my-computer.lan (c-73-76-29-249.hsd1.tx.comcast.net.
 [73.76.29.249]) by smtp.googlemail.com with ESMTPSA id
 46e09a7af769-72bb26bb82dsm882990a34.32.2025.03.14.19.43.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 19:43:13 -0700 (PDT)
From: Andrew Ballance <andrewjballance@gmail.com>
To: dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 corbet@lwn.net, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, andrewjballance@gmail.com, acourbot@nvidia.com,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: [PATCH 0/3] rust: alloc: add Vec::resize and Vec::truncate
Date: Fri, 14 Mar 2025 21:42:32 -0500
Message-ID: <20250315024235.5282-1-andrewjballance@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 15 Mar 2025 11:49:29 +0000
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

This patch series implements the Vec::truncate and Vec::resize methods
that were needed by the nova driver and removes the corresponding item
from their task list

Andrew Ballance (3):
  rust: alloc: add Vec::truncate method
  rust: alloc: add Vec::resize method
  gpu: nova-core: remove completed Vec extentions from task list

 Documentation/gpu/nova/core/todo.rst | 10 -----
 rust/kernel/alloc/kvec.rs            | 61 ++++++++++++++++++++++++++++
 2 files changed, 61 insertions(+), 10 deletions(-)

-- 
2.48.1

