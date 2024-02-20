Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4B485BFDE
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 16:30:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEDDE10E4AE;
	Tue, 20 Feb 2024 15:30:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RW4ubThI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86BCE10E4AE
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 15:30:17 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4126d65ace3so7347525e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 07:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708443016; x=1709047816; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IY5Fl8EiIpjATBqz7xetWyCUjSktN1KtrnTN2tZhCTw=;
 b=RW4ubThIEyE5S2dcq+5JWDblXDJ9Trw4k1ENc74Hblny3iJkxhcJkuPVWq+fqc3ZIi
 RmgWQDgXGqcR+Yxpxsl7kPLJ+1w2OnUQkASdZ6vz1BhhfOuDAlO4KHQnEfDw3clGEOok
 5e3kxgYx6ldJhOz+nsIlwjmV2TEIMNoMjWr+zEYsDoGaIuUYIwJwpWHIV2M5MRfJ3akg
 OhDtKYA/pCM6UQzrZ1r/YVNbsKMpvCLqCjtAZ+c/s9Y6qtShosCeZzgK+AEZmplhM1S1
 VflUfbnnZdrIDLjzNcI5wV8GFiEx555ZMiS4olcF2g7xbB6Gkga4+S6NMeOgiKDu/oX+
 Lsrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708443016; x=1709047816;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IY5Fl8EiIpjATBqz7xetWyCUjSktN1KtrnTN2tZhCTw=;
 b=FlhygMrEiyTzP+itFFIz08sP+cJBe8KdD8foWilbvp5M1EGoulxfdVndfTnkFzRU+n
 szD2Zcz/jWtemKMelnHAkS2lqhZAea0ETkVhFbcAdFyYFBVxerlaPBHv03olxx0CCtDe
 6R73fFLX2hh3oAi2m7mEoPr4FIFiCnjhiURlVY7dtRW6b/zeQOcsfUYURgSmgyUjdPXA
 vJwtkabfXz5pzht9YIuytcnmouHpd9oR+yxPc6VplPwrjCzM9z1u5HNPd9cdLNFxds76
 WTLYd39JiWwz2e8pn1csfR9uefBvz1rsRm1sm5aYfjKcse8m/2ormibdsAteAHzrVFdV
 vR0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmYubrDpceVvP5uJGVDgLwDzu4HE29mtc0VaguV5chzLq6/ed7J3XAWXkCJ+/NQVTd6K4L2a0zXDAPHEze4y+3c8P4JFX61IcrKEuVSxsl
X-Gm-Message-State: AOJu0YxO1Sj36jc2Zn7lRhxguR18nzhUIyQOH7w/R53OaH84I3VOg721
 /5//clR+isCr60o2Zt4YtMAa6kRZWsgwEIPgxxtBqUsohd1GxAY6C6LJolwf6vk=
X-Google-Smtp-Source: AGHT+IERmi+P7yWUq4uVJnrZIJuMSM97Nq4UuUDoxY46okU9MBfkMBuvnG45Q1sfupCdozb8l8+9Hg==
X-Received: by 2002:a05:600c:4f49:b0:412:5670:e5c6 with SMTP id
 m9-20020a05600c4f4900b004125670e5c6mr8316824wmq.13.1708443015690; 
 Tue, 20 Feb 2024 07:30:15 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a05600c280400b0040fe308ff25sm14691564wmb.24.2024.02.20.07.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 07:30:14 -0800 (PST)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Lee Jones <lee.jones@linaro.org>,
	Jingoo Han <jingoohan1@gmail.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Luca Weiss <luca@z3ntu.xyz>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] Ensure all backlight drivers zero the properties structure
Date: Tue, 20 Feb 2024 15:30:04 +0000
Message-ID: <20240220153010.76238-1-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.43.0
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

Luca Weiss recently shared a patch to zero the properties structure for
lm3630a... and shortly afterwards I realized I should probably scan for
a similar class of errors in other drivers.

Results follow in the next four patches (they could all be one patch but
for the fact there are different Fixes: tags)!

Daniel Thompson (4):
  backlight: da9052: Fully initialize backlight_properties during probe
  backlight: lm3639: Fully initialize backlight_properties during probe
  backlight: lp8788: Fully initialize backlight_properties during probe
  backlight: mp3309c: Fully initialize backlight_properties during probe

 drivers/video/backlight/da9052_bl.c | 1 +
 drivers/video/backlight/lm3639_bl.c | 1 +
 drivers/video/backlight/lp8788_bl.c | 1 +
 drivers/video/backlight/mp3309c.c   | 1 +
 4 files changed, 4 insertions(+)


base-commit: b401b621758e46812da61fa58a67c3fd8d91de0d
--
2.43.0

