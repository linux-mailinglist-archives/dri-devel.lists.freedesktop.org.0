Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A84EDAB7E82
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 09:09:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15BD510E76E;
	Thu, 15 May 2025 07:09:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="a2A/HFyf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com
 [209.85.221.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E05A610E64A;
 Wed, 14 May 2025 17:43:28 +0000 (UTC)
Received: by mail-vk1-f180.google.com with SMTP id
 71dfb90a1353d-527a2b89a11so3111765e0c.2; 
 Wed, 14 May 2025 10:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747244608; x=1747849408; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5wcfHvWJFauA36svF44VDjuYHPwmu90HBftFvY1FZng=;
 b=a2A/HFyf/OP2XGiHX70d+inzA4FIaPPI+X0ul+0VUAm55eHSRgRw2gXa2i6beG2PuU
 jdHVODS3H7kiUHJ0EimUPLTosgqMsXlPBO4ovcJAG6wZIqjUao+wC31/SYcHJTY0kZn7
 dIgdhaIHtKpE1fV1YfYHB5DkwgZun0d4A1YSV8cqDhx3lh1Tbi2d3/MrtF557Y4acm0Q
 +6qD7WJBcI0ctotQYOjxWrIa3RNqD/FdcUzsApg+q0IpOxtpcWIAeFXArcI6VBDP07Kt
 jv2L2ylVTd48ylv55wNn0SmyheEr3CKirnM0LUpLKAhYpZjWzdOa8tdxhZz08G/bnH8X
 wbww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747244608; x=1747849408;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5wcfHvWJFauA36svF44VDjuYHPwmu90HBftFvY1FZng=;
 b=Dyh9tbBfRflfuAHtpZqaKY+YbsyLSKu6nXM8w94TwAr50qkxJhUfWknF0E6GSrCpFT
 mida/5nmiIS1ufehN6Sv+2zh/8skQmhqLKADuaaZPadWohL7wuoD/4TcAZ6U2CxHoDCd
 Z3plbwMGv0AQ7W0hddW3Qut9jIketgdOQIvDt1kDzA6tQ8BpghxTjhssyg0mOBAH/qbv
 IYDiZHM2mYbCXmQPWSEybwU8Mr4wDY6ZPeGN955s6nL+39gw8EqR/E6LccFcWNRdMO11
 M9ztc/F+u31jODCd5jm/oVCXpDk/2ZMsBL2oqfa4lj40Fck0qITVSKpty3k5+U3OljkH
 StzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVIBgzyn+M6XzvqR/rufikqPibTbBA5Zy6NW9a4m8yUOmrdlQ4JPnoM+bBVhG15BOU24QpiqsW@lists.freedesktop.org,
 AJvYcCXPwJ5yZFE60ZaqfeNGSGGi8aTwUr/4SEGaObwopNdab6Qn4WJ+CRiT6B2Qv6ckCj9e0WP0Rs261Js3@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzu82ExFdK40o8etY0/d1Y7qV/7p8Ntj63Fv9i85IwpiHAWmV9S
 6BEgpP/urTkVL195Jfdomw1HMwGL1XGftl/2sEdyRIzls6CO/F0l
X-Gm-Gg: ASbGncsKleVVitX69MbE4JrhkbwYd4qResHv01YuGOyHsjZ4Hw6a5p844H56T+alXyc
 Qt8MEg153KgczDJ8ZTuRdpcG0Fc9XtX+BiAFrAz+4lS/ldrT48Q8UfYo8gM4A9EgxsrwGa6/xJk
 agyj6MCr1PznAXRrEfaB5Kth/Lsk+LgHGNDz0EfRAV8Ejjcp+iiClQM2X5x+7J2hcmGrBB4IzQV
 J38kP8N+Ls224k0fgTUbLNN/Tz9UkQoNTkhcvZWi7WUkVoYBMYDrcaLnl2kNgQJlrxelQuBggXl
 cnpMFOCU4/cqVHYkUgKCdCU9JkZZJgxR13M5RPAIO7LG4DeiNWN3gfZ6rJQnz2NtTJa7z8/SnhR
 +DODmYRkbCZ8=
X-Google-Smtp-Source: AGHT+IHJOUCwnoPs0Er/5BjlK81uKphJbPONtR4Fdu7amF7p0jxbjHodh/F+0864Ygyec23YzKbIGQ==
X-Received: by 2002:a05:6122:1d0a:b0:52a:916e:91cf with SMTP id
 71dfb90a1353d-52d9c5a5dccmr4227515e0c.3.1747244607830; 
 Wed, 14 May 2025 10:43:27 -0700 (PDT)
Received: from xodo-linux.semfio.usp.br ([143.107.45.1])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-52c727f5d86sm6401595e0c.10.2025.05.14.10.43.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 10:43:27 -0700 (PDT)
From: Leonardo Gomes <leonardodasigomes@gmail.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch
Cc: derick.william.moraes@gmail.com,
 Leonardo Gomes <leonardodasigomes@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2 RESEND] drm/amd/display: Adjust set_value function with
 prefix to help in ftrace
Date: Wed, 14 May 2025 14:42:11 -0300
Message-ID: <20250514174306.82693-2-leonardodasigomes@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514174306.82693-1-leonardodasigomes@gmail.com>
References: <20250514174306.82693-1-leonardodasigomes@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 15 May 2025 07:09:42 +0000
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

Adjust set_value function in hw_hpd.c file to have
prefix to help in ftrace, the name change from
'set_value' to 'dal_hw_gpio_set_value'

Signed-off-by: Leonardo da Silva Gomes <leonardodasigomes@gmail.com>
Co-developed-by: Derick Frias <derick.william.moraes@gmail.com>
Signed-off-by: Derick Frias <derick.william.moraes@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c b/drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c
index b11ed1089589..03e773136189 100644
--- a/drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c
+++ b/drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c
@@ -85,7 +85,7 @@ static enum gpio_result dal_hw_gpio_get_value(
 	return dal_hw_gpio_get_value(ptr, value);
 }
 
-static enum gpio_result set_config(
+static enum gpio_result dal_hw_gpio_set_config(
 	struct hw_gpio_pin *ptr,
 	const struct gpio_config_data *config_data)
 {
@@ -106,7 +106,7 @@ static const struct hw_gpio_pin_funcs funcs = {
 	.open = dal_hw_gpio_open,
 	.get_value = dal_hw_gpio_get_value,
 	.set_value = dal_hw_gpio_set_value,
-	.set_config = set_config,
+	.set_config = dal_hw_gpio_set_config,
 	.change_mode = dal_hw_gpio_change_mode,
 	.close = dal_hw_gpio_close,
 };
-- 
2.43.0

