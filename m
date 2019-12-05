Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CD1114D61
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 09:18:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59FEC88DDE;
	Fri,  6 Dec 2019 08:17:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A54036F912
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 22:11:28 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id w15so5584270wru.4
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2019 14:11:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CUi98cwSoCKi/I/0JIIfMi/RPZNRK6SsahfPRECZalM=;
 b=Tjz3QAQNkkVJnMNqRyZwNzDmJIBAatHZWlHCUwqmLDlv/HabG1Ew8GEu2YS1NMEiB6
 d+p0D3d/LE5dYdzQLfLnXNPllsTpIP9nLLV9DDSSAxMebnap1mpNXvPxdsZPlhh4rsWp
 2/m62SXhI1ntoytlE5RRCopt8fjrN5TVH+Ue6ISCy310Twm+KPriKEhnUsEysU79pbdB
 xnDMlH1XujJT9ThoeFQR209mQf/AlUXS3zcyyUHgJ2H5+VV52geZKWCsR5443s4eNAfh
 7352eviaDXZKGWoMCQtdt9FZuPXotsLuzovfBHsuI0euG8vR18EiL3Ah53dGoAZXENy0
 rIbQ==
X-Gm-Message-State: APjAAAWpamajWQUM//V9bhW3WvDbLglnEcrBL9Vg3l+axzp2grTV9h9z
 DmU7KYodFhfGVKfE72NECwc=
X-Google-Smtp-Source: APXvYqz1RLUsU0nkiHg33UXp6iDHMizIMj4ZHRsIh50USDPd8MMgZM/ReLIHHDN84SB7+V/LMsmYSw==
X-Received: by 2002:a5d:4acb:: with SMTP id y11mr12710232wrs.106.1575583887033; 
 Thu, 05 Dec 2019 14:11:27 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::42f0:c285])
 by smtp.gmail.com with ESMTPSA id r21sm1265490wmh.4.2019.12.05.14.11.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2019 14:11:26 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Subject: [PATCH] drm/panfrost: no need to display probe deferred error
Date: Thu,  5 Dec 2019 23:11:02 +0100
Message-Id: <20191205221102.28248-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 06 Dec 2019 08:17:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CUi98cwSoCKi/I/0JIIfMi/RPZNRK6SsahfPRECZalM=;
 b=UWwYuaEQz2jJLTXRR27FAvmeLUr7FTHVV1WSN3Z/262cU//30TQHE3UpyULyYYeywy
 q5uXuU2DurFK/gpxzvK4fazZJbM0Xn+QFk1k9UwwvwzX4E/2eVhRLx2CTO4RRVsiWnUj
 tPE2PS2zJEz8A3c40SVxU547YktUyuIx/5HW76ZGCDF33ghGJ3siOImXDwZUYbJq80GC
 klt/Ub6XkQGp/ge4Ue2soX9RcXgO+0TLY1aZuwhnv/rvo/ZLXxjiEefldBXH1AQShgGu
 /V+5lz3U4kXrSKAOAcTTZzYy1ip4g88OiRqzFiR1mbw76yH3zOwYxx6E/EZcuBvHPSpY
 VFqA==
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
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UGFuZnJvc3QgZHJpdmVyIGlzIHNob3V0aW5nIGFuIGVycm9yIGlmIHRoZSByZWd1bGF0b3IgaW5p
dApyZXR1cm4gYW4gLUVQUk9CRV9ERUZGRVIuIFRoaXMgaXMgYSBub3QgYSByZWFsIGVycm9yIGFu
ZAppdCBkb2Vzbid0IHJlcXVpcmUgdG8gYmUgZGlzcGxheS4KCkNoZWNrIGlmIHRoZSBlcnJvciBp
cyBub3QgYW4gRVBST0JFX0RFRkZFUiBiZWZvcmUgZGlzcGxheWluZyBpdC4KClNpZ25lZC1vZmYt
Ynk6IENsw6ltZW50IFDDqXJvbiA8cGVyb24uY2xlbUBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5jIHwgNiArKysrLS0KIDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL3Bh
bmZyb3N0L3BhbmZyb3N0X2RldmljZS5jCmluZGV4IDIzOGZiNmQ1NGRmNC4uMDBjZWYwNjJjMzVk
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5jCkBAIC05Miw3
ICs5Miw4IEBAIHN0YXRpYyBpbnQgcGFuZnJvc3RfcmVndWxhdG9yX2luaXQoc3RydWN0IHBhbmZy
b3N0X2RldmljZSAqcGZkZXYpCiAJcGZkZXYtPnJlZ3VsYXRvciA9IGRldm1fcmVndWxhdG9yX2dl
dChwZmRldi0+ZGV2LCAibWFsaSIpOwogCWlmIChJU19FUlIocGZkZXYtPnJlZ3VsYXRvcikpIHsK
IAkJcmV0ID0gUFRSX0VSUihwZmRldi0+cmVndWxhdG9yKTsKLQkJZGV2X2VycihwZmRldi0+ZGV2
LCAiZmFpbGVkIHRvIGdldCByZWd1bGF0b3I6ICVkXG4iLCByZXQpOworCQlpZiAocmV0ICE9IC1F
UFJPQkVfREVGRVIpCisJCQlkZXZfZXJyKHBmZGV2LT5kZXYsICJmYWlsZWQgdG8gZ2V0IHJlZ3Vs
YXRvcjogJWRcbiIsIHJldCk7CiAJCXJldHVybiByZXQ7CiAJfQogCkBAIC0xMzAsNyArMTMxLDgg
QEAgaW50IHBhbmZyb3N0X2RldmljZV9pbml0KHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2
KQogCiAJZXJyID0gcGFuZnJvc3RfcmVndWxhdG9yX2luaXQocGZkZXYpOwogCWlmIChlcnIpIHsK
LQkJZGV2X2VycihwZmRldi0+ZGV2LCAicmVndWxhdG9yIGluaXQgZmFpbGVkICVkXG4iLCBlcnIp
OworCQlpZiAoZXJyICE9IC1FUFJPQkVfREVGRVIpCisJCQlkZXZfZXJyKHBmZGV2LT5kZXYsICJy
ZWd1bGF0b3IgaW5pdCBmYWlsZWQgJWRcbiIsIGVycik7CiAJCWdvdG8gZXJyX291dDA7CiAJfQog
Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
