Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8CE8C0CA5
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 10:35:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C855910E57A;
	Thu,  9 May 2024 08:35:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="gMDwAlcy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com
 [209.85.161.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 569B010E281
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 08:35:04 +0000 (UTC)
Received: by mail-oo1-f50.google.com with SMTP id
 006d021491bc7-5b27369b0e3so160829eaf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2024 01:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1715243703; x=1715848503; darn=lists.freedesktop.org; 
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uVXaxhQDG/e+z0u9o3oNc0l0r1jC2rAcYMDmhF8XPmk=;
 b=gMDwAlcy60aBkXdXrThKd7zkY2WWpXLcQlA7kFgtdTTsV7bpFH8tEkgWfz/x+rC/uh
 jYC0L4I7czJy6mf70lGBZu3z5to9kyCpqfME/WJc+mzozs67Er/zPhKj4hW/v4a9T0JQ
 CARJb7DD5y358e1jtNZcyZLXhfiDzqrpUfoSYXD6dl2HXLaJ+5+SBkOpj90/1R1hK94p
 611uD5fqdEginajOmmT66Vwzpbk3/8hIaIGcMXmRC7c/r2QKoPfJjtNCQlX+ainIUnPf
 dVbrGb6XBhmNYUpVG+Nq4n2v0xRBKnjptw4in46g48JZPmRtx+4055+aU8dRfeuBnnyr
 tbrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715243703; x=1715848503;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uVXaxhQDG/e+z0u9o3oNc0l0r1jC2rAcYMDmhF8XPmk=;
 b=EcQmwSssz3DBjP88d6GwkHSUapRxL5J2ytSWS0gfN/HFB1S4jwz95kOg14XF4yzVJZ
 s0t5KeVi/aRwIeHcuoUPGvIrK5KRQ1eiTaVi3c7PLrWVncD33fj4/y7wX7rlMtli2UWt
 eANte/uoxXuRGe5LYsTqy1J3fooT0wANG+ewoOp5ra0474wSTOvKyXugB1vT6wb9cOsu
 R5xC6jd1HuPTLBXyC5yt5HjqRqjbB0402OBVZ4ccWQEjjun8fRaJq9ifDUzX0T8n9t4p
 qzcZ5vlFoJraNwUz5CFNnE+CkZkKUWKNQH9z+62HvZHiI1DqT9b+TJVWVmcXXB91domE
 v+8Q==
X-Gm-Message-State: AOJu0YyIV66sBiKjut3Yide4jsnZJyquEFTQtzFlTzqphHZeXMrSjWWz
 MVyjmmRmAPlqCPvUglDoITV24wUkDoNUl/PJxn1eV9O8yM/bcQbgcMb8YR+KKVY=
X-Google-Smtp-Source: AGHT+IH7FwkdXhpSDeH65odfeyLHVQOlJLZGrkXcbsYE5JHDKqIXGvBLy36PBQVCOir2q3dKH4RLxA==
X-Received: by 2002:a05:6358:8419:b0:18a:c679:39bb with SMTP id
 e5c5f4694b2df-192d2a131cemr599828855d.4.1715243703093; 
 Thu, 09 May 2024 01:35:03 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-6340c8a6967sm792643a12.44.2024.05.09.01.35.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 01:35:02 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: dmitry.torokhov@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org,
 benjamin.tissoires@redhat.co, dianders@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v2 0/2] Add starry bindings and driver
Date: Thu,  9 May 2024 16:34:51 +0800
Message-Id: <20240509083453.14073-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

Add bindings and driver for starry.
---
Modifications between V1 and V2:
Kconfig and Makefile configurations added for starry driver

---

Zhaoxiong Lv (2):
  dt-bindings: display: panel: Add Starry-er88577 support
  drm/panel: starry: add new panel driver

 .../display/panel/starry,er88577.yaml         |  59 +++
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-starry-er88577.c  | 444 ++++++++++++++++++
 4 files changed, 513 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/starry,er88577.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-starry-er88577.c

-- 
2.17.1

