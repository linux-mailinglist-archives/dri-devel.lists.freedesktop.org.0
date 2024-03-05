Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BAA871EF8
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 13:21:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5914C112A8D;
	Tue,  5 Mar 2024 12:21:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.b="iJ+9TT5d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41287112A8D
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 12:21:23 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-5e4613f2b56so5064584a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 04:21:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709641282; x=1710246082;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:dkim-signature:from:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=RpDVIywGu+mJvIXOFGxusadZf1l18EI+lUGuf5OSG+4=;
 b=si6qQl+paLP8QqIQ8do7Fb0mUXDIDKGaIAIId+qG6HM6L/I8A0yQPniVA8A1cvTJKf
 +3959XD8lFR+ivJN8Mwds8MyxNJ3G7Dz41ewZqkLqeELvsdeg+Vcw3wpBDtZGw/fsKUa
 yYT7QDMSdbynU2YB28+VAiH/8q7vGpIKWuIA/40q+lrt85WvG4J0B85Nb68xhWOpYdMB
 tPXyMaPQ3i9sppRiY0bN2ugJLmvR/rXESd7/+hYcoG+kRMKnqeY/CDiPHvqdAjFY+QPp
 mzASm5wpHIY5XqB6qCizPLOPQs3uDxDlLgevfgKwrmmyZBEz9uIxcOtVyCLdZQtE2Py6
 DbyQ==
X-Gm-Message-State: AOJu0YzWiqri0SJvFD1KY+9/+L9anRpD7gUYsK/IRuy7AIl3clpjJvMI
 yTFRVsfSqdUy9S5fwyoEqqgOuNTInTQR+NY1Omuj2frZ6YCz0cRD4+KfO4WGJLZdlA==
X-Google-Smtp-Source: AGHT+IHpuMsf1ZJiOZka7p/FiwnMuc/YVUhf1GFTqo6hGAt/L35GMeh9daxAanvulu3wfU0Wk0zdRg==
X-Received: by 2002:a17:902:cec9:b0:1dd:151b:fa9e with SMTP id
 d9-20020a170902cec900b001dd151bfa9emr1851559plg.63.1709641282330; 
 Tue, 05 Mar 2024 04:21:22 -0800 (PST)
Received: from mail.marliere.net ([24.199.118.162])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170902c3cc00b001dca9a6fdf1sm10417663plj.183.2024.03.05.04.21.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 04:21:21 -0800 (PST)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
 s=2024; t=1709641280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RpDVIywGu+mJvIXOFGxusadZf1l18EI+lUGuf5OSG+4=;
 b=iJ+9TT5dKkMjIRx6HClkAtVYkv5PJw1hJ2pBMHTSHZAU2Cwwiaz6oDN1HQjLJZkZBkg44k
 oJwJV/wspoHpN/bhReO/C1kYz8Ym4d0pkvSjvWclaVcG6YejmoSD53YkjBY6sYYP9YcNdd
 Uu3q8tw1UaIWEcs/82XxeaN70bAlL075PlmMUgGL4zu7w82GZdmXRErGlrvHZJGkNl0H1o
 uZforwhiX9rLptLwKZ/ctiV/ER1IRtRMaKxzK9i9iLN7xSgDYIx0nThgdvopGvQvcpjafR
 utMLG3Znu6Scdkl+ZqeK2VsUQOmF7kgUZypSFQhilD2yop71ZgW7hje0cI4wRw==
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
Subject: [PATCH 0/2] video: backlight: constify struct class usage
Date: Tue, 05 Mar 2024 09:21:16 -0300
Message-Id: <20240305-class_cleanup-backlight-v1-0-c0e15cc25be1@marliere.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADwO52UC/x3MQQqDMBBA0avIrBsYEy21VykicRx1MKSSURHEu
 zd0+Rb/X6CchBXexQWJD1H5xozyUQDNPk5sZMgGi7ZCh7Wh4FU7Cuzjvpre0xJkmjfztH1Tkns
 h1gy5XhOPcv7Pn/a+fwyupjJpAAAA
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, "Ricardo B. Marliere" <ricardo@marliere.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=815; i=ricardo@marliere.net;
 h=from:subject:message-id; bh=GN1G4NyMvWBolsspYbu0gF+ZyFJ3Ms4SmSjQgZCesZk=;
 b=owEBbQKS/ZANAwAKAckLinxjhlimAcsmYgBl5w49ttMZGRTTzHYaea508k7VdAAv+U7ckzf2N
 /sm626lc0mJAjMEAAEKAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZecOPQAKCRDJC4p8Y4ZY
 pnYdD/9qO73gM1EqWw5mEM2tjBt0xEpPH7+BhtYqEeXSt9wLxreoBjFgEIIdt6Pjb8+HT0NMVOR
 7QFk/LhkWF0x3mRveAAeV9IpmlmwCynDkZmNq0S+Dzcb3vdONtUGfB10fBG1JQW8Rq2GSEMF4tl
 qVYEsSj/hqZ3I9Kbf8ZxaAqmEn53mF3AbsCq5HIr9RHASNjLyfLyIhKDvQ2M7cVjLZs+GAensbz
 cVIfpLdMVMjL500gO1kHvIu/OiO5A7YboYhzbluh/YKMqqVv7SmKnRUGWi3RE5xjue+hs+R9BvF
 QmGDYygj63SNsJMe/XHjq82KfdJIkK+7r3fGRCIcgW0kapVDj1JVwO1Jtia4r0bY3FnlCAmZZbE
 6BC/1AEtxu9Tqem9SpCQWR3cKppkNKiMKl3dmYwvJsYWIEwQpp7eD3i3BAVhaTAcr7WNKc6y74Y
 nOsYcoVypc5G4JiMc15z77lD5NcliNqbgss7rw+dNvSCvsohCN5Ft3MlyPr2HdBYRJ0YSK44TQz
 FAelFLufkW/fKuLgYG3p5u9BAkHm3w8FGZC5xeVXeiZs2JqRwgKWM8QFk6o5TKaaBU/Mp5+E6tR
 C4xA+ul3A24g6qGPW9HXD0WEFPrhRC6kjPJWciPAp1F1BE4QgheZULODGFmCqG8R0pz6Ash/CmY
 bcg2BTnQ5o9Ocug==
X-Developer-Key: i=ricardo@marliere.net; a=openpgp;
 fpr=030A8E9E424EE3C0655787E1C90B8A7C638658A6
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

This is a simple and straight forward cleanup series that aims to make the
class structures in backlight constant. This has been possible since 2023
[1].

[1]: https://lore.kernel.org/all/2023040248-customary-release-4aec@gregkh/

Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
---
Ricardo B. Marliere (2):
      video: backlight: make backlight_class constant
      video: backlight: lcd: make lcd_class constant

 drivers/video/backlight/backlight.c | 29 ++++++++++++++++-------------
 drivers/video/backlight/lcd.c       | 23 +++++++++++++----------
 2 files changed, 29 insertions(+), 23 deletions(-)
---
base-commit: cd1995b6ac7384149ad755b74e3c3eb25195ab81
change-id: 20240305-class_cleanup-backlight-62b91c38005e

Best regards,
-- 
Ricardo B. Marliere <ricardo@marliere.net>

