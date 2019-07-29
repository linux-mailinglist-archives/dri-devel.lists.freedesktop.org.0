Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A39F878625
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 09:18:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93BED89CD5;
	Mon, 29 Jul 2019 07:18:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7D2789BAC
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2019 05:33:53 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id x15so17276367pgg.8
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2019 22:33:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DPXHy1a69mKAzAt5eK/5mGSu5mMYfcr+qJqjDh7NSaQ=;
 b=SbB8oZgo7pDio+vG41xJesCPncdvpFy986q5Iut7o4vPp/OPDNKBj6r0+3vnYJmBrX
 5HuVLJIjcVH/aqhLyVAwurRTa1P74eoli7GMci/2c5iSHOiqSiEt/LTdPUUMH1T8zr+T
 vVudsWM2HqGO+F3B5UmwxwJDJFc37hDQ7U3Pi3kZPNN53AaIVLQnNaNfR63WoGYyYJQg
 zyYLpfDll31yTrGSmqzYgVT6JHE+ZHvEWTC01dMFSh5pDZkCYHoVVYhbEjY6FUrFhmtK
 22bGaDwWQrez0t5qQ5LH06af4T2ZsT2H2d3HCZiI71yufmPAoAvjY1JPxg/i3hj0I0Y9
 2YFg==
X-Gm-Message-State: APjAAAUJ2jM09Yh6iumMKtE6rVE8I8n+uks4FUpQhl9Fje8vfVL/Ruiy
 TOLEHGOuvpFjCHetfnThmFwHnw==
X-Google-Smtp-Source: APXvYqygDVAWdgpICHSE02DV6msSDKrPaHx2VAR3/vrWfQrTSpR/C3whA4rXoQaV+tRhbTuC/OWZhg==
X-Received: by 2002:a17:90a:1d8:: with SMTP id
 24mr111974489pjd.70.1564378433305; 
 Sun, 28 Jul 2019 22:33:53 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:4:4:9712:8cf1:d0f:7d33])
 by smtp.gmail.com with ESMTPSA id z4sm93792810pfg.166.2019.07.28.22.33.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 28 Jul 2019 22:33:52 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@chromium.org>
Subject: [PATCH v2 0/2] drm/mediatek: make imported PRIME buffers contiguous
Date: Mon, 29 Jul 2019 14:33:33 +0900
Message-Id: <20190729053335.251379-1-acourbot@chromium.org>
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 29 Jul 2019 07:16:44 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DPXHy1a69mKAzAt5eK/5mGSu5mMYfcr+qJqjDh7NSaQ=;
 b=X7ZzQJG0cNXQD6YQsemOKW/jT5dXIqlD5c4Jcz7JtWEhIqBe209fc02CAGpqr+SYx0
 gHPYOCrdYg3Ro7wBapt85n2eL90PlzXxI3QY75kWqphNBvBEhfTaqOY9NODoZZKpkG2h
 jgrZXO+DLTuPGvJ9LjyhDaLG7s2coSQiQVGuM=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Alexandre Courbot <acourbot@chromium.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGRlZmF1bHQgRE1BIHNlZ21lbnQgc2l6ZSB3YXMgdXNlZCB3aGVuIGltcG9ydGluZyBQUklN
RSBidWZmZXJzLAp3aGljaCByZXN1bHRlZCBpbiBhIGNoYW5jZSBvZiB0aGVtIG5vdCBiZWluZyBj
b250aWd1b3VzIGluIHRoZSB2aXJ0dWFsCklPIHNwYWNlIG9mIHRoZSBkZXZpY2UgYW5kIG10a19n
ZW1fcHJpbWVfaW1wb3J0X3NnX3RhYmxlKCkgY29tcGxhaW5pbmcKdGhhdCB0aGUgU0cgdGFibGUg
d2FzIG5vdCBjb250aWd1b3VzIGFzIGl0IGV4cGVjdHMuCgpUaGlzIHNlcmllcyBmaXhlcyB0aGlz
IGlzc3VlIGJ5CgoxKSBVc2luZyB0aGUgY29ycmVjdCBETUEgZGV2aWNlIHdoZW4gaW1wb3J0aW5n
IFBSSU1FIGJ1ZmZlcnMsCjIpIFNldHRpbmcgYSBtb3JlIHN1aXRhYmxlIERNQSBzZWdtZW50IHNp
emUgb24gdGhlIERNQSBkZXZpY2UgdGhhbiB0aGUKZGVmYXVsdCA2NEtCLgoKQ2hhbmdlcyBzaW5j
ZSB2MToKLSBTcGxpdCBpbnRvIHR3byBwYXRjaGVzLAotIEZpeGVkIGFuIGVycm9yIHBhdGggdGhh
dCB3b3VsZCBoYXZlIHJldHVybmVkIDAuCgpBbGV4YW5kcmUgQ291cmJvdCAoMik6CiAgZHJtL21l
ZGlhdGVrOiB1c2UgY29ycmVjdCBkZXZpY2UgdG8gaW1wb3J0IFBSSU1FIGJ1ZmZlcnMKICBkcm0v
bWVkaWF0ZWs6IHNldCBETUEgbWF4IHNlZ21lbnQgc2l6ZQoKIGRyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX2Rydi5jIHwgNDkgKysrKysrKysrKysrKysrKysrKysrKysrLS0KIGRyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5oIHwgIDIgKysKIDIgZmlsZXMgY2hhbmdl
ZCwgNDggaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCi0tIAoyLjIyLjAuNzA5LmcxMDIz
MDIxNDdiLWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
