Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A95AEF321
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 11:22:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DD9B10E555;
	Tue,  1 Jul 2025 09:22:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="yVZVNZx+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41FCC10E56A
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 09:22:47 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-ae0e0271d82so945856966b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jul 2025 02:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751361766; x=1751966566;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QVT1yFp/HjeLlfeB/7qCKoB0uF7blBioZl7s6S0+Lag=;
 b=yVZVNZx+7wKo84nb0kDbBL5Iz2zgZOarlcOmEC6OZRoJ/4NBTE+XsTz9WAka3CS4cA
 9fqJ1IAWnTvOL1ULir8b2NTTRby05tzl2I/iSeAUOdDeVaACm9x/agZX9utfvnU8AaYr
 Pk+4UswtqcvZOI0hJ4hUFZLtsIixwaFVQ53lxeUQewU2vvHnCLvxmhA2tkz4Wex+J/og
 iEYSTMFN5za0wenA54MPbhJG3a3qyAaQYLGQP9yNFawLC2SVfe4WjXKsne99+XkA0Y4t
 Y0O3R5z/eXtPmaN+SYZWEBk0BpY6ochmTbGurADoUCUgO8WcS6I2ZM9KyumspBAD9TOq
 SFsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751361766; x=1751966566;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QVT1yFp/HjeLlfeB/7qCKoB0uF7blBioZl7s6S0+Lag=;
 b=AzmVGPYQN+P7g7mRptoDPX/025/Npnj83hrnXqBgWOLUnOIbaji+k+NV5ngIQxylsA
 TIOKFsk/t6azolBp7Q+qkLFKrJbOwPhVY7BzbrAQYcnWvU3czP4lniCcKciSjTP2XxEH
 FucB8U1jd8M620BbK/Ma85P78ias9THd1X/fhXv6sGBAWj32fk6AfTwCY6X+qUd1ZTT0
 AsbIZgTZb0mF2zcbjTk6OaiI2DAYt5WgTjhe6FEU51mdonqtSlKfcBpEr9BTByJvIUrr
 WFTP/eABrC50PbEER4xOirYZZtDvOu5odLEXlRENx29Xkvene60U3fDutHqO6RW5Uhjy
 3eNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/RB/cZwk9baH4fGOP0dQxPXLpIObr8MhVdx0uQYujvYMDKBN7tKhtxYJahxCko6+gkMULnkm3vJs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yydqc4fBZKHpvmINWJ10h63I29P6C7ZsQsMRbYQ1ctXeDK7xjbs
 HocrCNzcS17i247ldE0exW8MKuzjb46VrBuK30996UHfREJphMkqxg7N7tEzUnR5gNA=
X-Gm-Gg: ASbGncsFUyslu429Y+ISEEJvefdc5672RjW1m5NLLvVVYn5li2ELBkSWFUyxyMX52gj
 W7lQB9D5k7HGsiLJfvu4k8lXwR8WU5GSCi+asvr7jHw3/5aQNxniEIgNjNQMRmAY+sI6f9Q4fjG
 jJ0lYjBD3EAf1HKPcSBk+DGCHYa/+irIZSJLgCcQv2qecK2ixQrCrdiegui2TXtQoUnWIddcr+z
 B7TznfZ2Ga/VPcvjiDPwpxqZTBx/6kfvz90SFhbLFmq7NeiYe+Dr6SAczHQjO5Ffj/6NNwAGukD
 uX6RTAR1hgT8wphc/cFgw9335D+5taZRNSB8Y3pAvE+LzHVhqiiQcry0tLyyE4y9rWNFNYUG/PA
 kiWn7XKOJTSu3wsE4u1TMXaoHJjG8
X-Google-Smtp-Source: AGHT+IFZdq1NZHDIulXPlQuX5XMNUcKGdnIBul8pqvsYdBp1L4Bvr5WiImxevKRjwpv/ZiS3cZkfeg==
X-Received: by 2002:a17:907:3f0b:b0:ae0:ab07:7bba with SMTP id
 a640c23a62f3a-ae35011ff9amr1638414666b.45.1751361765635; 
 Tue, 01 Jul 2025 02:22:45 -0700 (PDT)
Received: from localhost
 (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de.
 [2003:f6:5f06:ab04::1b9]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ae353c0138bsm824291866b.85.2025.07.01.02.22.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jul 2025 02:22:45 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Flavio Suligoi <f.suligoi@asem.it>, Lee Jones <lee@kernel.org>,
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-pwm@vger.kernel.org
Subject: [PATCH 0/2] backlight: mp3309c: Drop pwm_apply_args()
Date: Tue,  1 Jul 2025 11:22:35 +0200
Message-ID: <cover.1751361465.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=882;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=WDPcSd680guMHutePUo2sb9AXNvKsSjrdc95DntYIlA=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoY6jbC5oB8EE9E9gtWZWsipYaB2TH8+5R6T5Kt
 9AdMrVoRX6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaGOo2wAKCRCPgPtYfRL+
 TrsqB/44H74MvsBOGODdUXEVTHE6B31qnZdJQ6m46uqyRYqAc1xTitz9fVs0tI7m8L/HO4vrsB9
 xhCPKF+qTY4FcR+zLCU6xw5xhp3J9Bcv+EPE4Yv34FVz2CgN32mvEW1HbkxHCCLyQDs1/087Po8
 9pJ0VkX2TRM27UKnNMo+EhZcmWzkfqaIF8MUaMDg8w9Y6DbyT0oaIiu4FlSgaccJEAAlFH2mn46
 clrJgdUXGGti2vmDiOC2u8d/cIftt+RAcFS5WW7zfUqwn55w846+sUf4I9mhrAGCBR9qtkLIP4K
 ASli44fO0rEJPMvs1HLHq+PuLP3k79oGPwxJrXX8Ft0ZKSzn
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
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

Hello,

the first patch of this series is what I really care about: There are
hardly any drivers left that use pwm_apply_args(). When all of them are
converted to not use it any more, I intend to drop that function.

The 2nd patch is just a change that I noticed while editing the driver
that is IMHO nice. If you don't agree and only apply the first patch, I
won't argue. It's an alternative approach to what Daniel Thompson did in
commit 7ee6478d5aa9 ("backlight: mp3309c: Fully initialize
backlight_properties during probe").

Best regards
Uwe

Uwe Kleine-König (2):
  backlight: mp3309c: Drop pwm_apply_args()
  backlight: mp3309c: Initialize backlight properties without memset

 drivers/video/backlight/mp3309c.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)


base-commit: 1343433ed38923a21425c602e92120a1f1db5f7a
-- 
2.49.0

