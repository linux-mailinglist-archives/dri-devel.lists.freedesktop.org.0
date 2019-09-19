Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BABB8BD4
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 09:51:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 132236F4A6;
	Fri, 20 Sep 2019 07:51:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C87D6F860
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 14:06:34 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id q64so3694397ljb.12
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 07:06:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Jg7JcvREMiiX5x2HEJEjAcDv3XByVb0RNmStAp9nahQ=;
 b=UqT3Qrx4/WqgI0tiY88O43tNo24B4RDYxpezcG1wNEvD/8IausZ762SvIoHoEhl89s
 x5Kf3SIvFtW6XizpdBfkMG/qLCfaCceVZ08k9SvvPM1yPcAAO4AK58jW808NqKMgXxIN
 16lmu1p+Bs8sVVNkQ3zOGxzxTKqSrcXNvhUa/Wd7xGgHXDLobgCkaKTqXNkOJETCRRQl
 7nkomHj8taSvi3CiHh44v5i62CVdV510hQolTLQK8X6JyjJrBpahDYx3tRq48yeuFCUo
 mV5zasCQ+W9lIcsYWsnse5HeiyEg9AUh/dFcHkg6foYXYmsAw2gu3D917kN8tdEL3hLb
 4cog==
X-Gm-Message-State: APjAAAXlIZdH7XSHCOQQqDYGYRtgf03OzSZ4NVgsRcsCQ3clX+kTmc9g
 /EVof4n2iIwmACbdvsg9esZg9A==
X-Google-Smtp-Source: APXvYqwT7aVA83Vb4qPr4tBmMd1vi6mmQP81J4Kl4kTliuCxLy+GI3jRKm2Szplr4kWj55N1eonI9A==
X-Received: by 2002:a05:651c:c9:: with SMTP id 9mr107103ljr.29.1568901992739; 
 Thu, 19 Sep 2019 07:06:32 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id h3sm1687886ljf.12.2019.09.19.07.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2019 07:06:32 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 4/5] backlight: pwm_bl: switch to power-of-2 base for
 fixed-point math
Date: Thu, 19 Sep 2019 16:06:19 +0200
Message-Id: <20190919140620.32407-4-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190919140620.32407-1-linux@rasmusvillemoes.dk>
References: <20190919140620.32407-1-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 20 Sep 2019 07:51:39 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Jg7JcvREMiiX5x2HEJEjAcDv3XByVb0RNmStAp9nahQ=;
 b=MZKdSEpOEV+5iG16oW7TXFRd1eg5H9XeUG6b1t8t2jgOvEG6oGHacyhtyg3NPIEGY/
 uKiTYPItaGHpX/90K1aP/bPkpA8b+8k/Rldl4zxvx2B9det3NTU55vbdyWW1nSSp9eg3
 YRFw3EAaRrmgYhPjv9gwnV6JQyEwF2erlvjsw=
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNpbmcgYSBwb3dlci1vZi0yIGluc3RlYWQgb2YgcG93ZXItb2YtMTAgYmFzZSBtYWtlcyB0aGUg
Y29tcHV0YXRpb25zCm11Y2ggY2hlYXBlci4gMl4xNiBpcyBzYWZlOyByZXR2YWwgbmV2ZXIgYmVj
b21lcyBtb3JlIHRoYW4gMl40OCArCjJeMTYvMi4gT24gYSAzMiBiaXQgcGxhdGZvcm0sIHRoZSB2
ZXJ5IGV4cGVuc2l2ZSA2NC8zMiBkaXZpc2lvbiBhdCB0aGUKZW5kIG9mIGNpZTE5MzEoKSBpbnN0
ZWFkIGJlY29tZXMgZXNzZW50aWFsbHkgZnJlZSAoYSBzaGlmdCBieSAzMiBpcwpqdXN0IGEgcmVn
aXN0ZXIgcmVuYW1lKS4KClNpZ25lZC1vZmYtYnk6IFJhc211cyBWaWxsZW1vZXMgPGxpbnV4QHJh
c211c3ZpbGxlbW9lcy5kaz4KLS0tCiBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21fYmwuYyB8
IDIyICsrKysrKysrKysrKy0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25z
KCspLCAxMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdo
dC9wd21fYmwuYyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5jCmluZGV4IGFlZTY4
MzllMDI0YS4uMTAyYmMxOTEzMTBmIDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdo
dC9wd21fYmwuYworKysgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21fYmwuYwpAQCAtMTQ4
LDcgKzE0OCw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYmFja2xpZ2h0X29wcyBwd21fYmFja2xp
Z2h0X29wcyA9IHsKIH07CiAKICNpZmRlZiBDT05GSUdfT0YKLSNkZWZpbmUgUFdNX0xVTUlOQU5D
RV9TQ0FMRQkxMDAwMCAvKiBsdW1pbmFuY2Ugc2NhbGUgKi8KKyNkZWZpbmUgUFdNX0xVTUlOQU5D
RV9TSElGVAkxNgorI2RlZmluZSBQV01fTFVNSU5BTkNFX1NDQUxFCSgxIDw8IFBXTV9MVU1JTkFO
Q0VfU0hJRlQpIC8qIGx1bWluYW5jZSBzY2FsZSAqLwogCiAvKgogICogQ0lFIGxpZ2h0bmVzcyB0
byBQV00gY29udmVyc2lvbi4KQEAgLTE2NSwyMyArMTY2LDI1IEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgYmFja2xpZ2h0X29wcyBwd21fYmFja2xpZ2h0X29wcyA9IHsKICAqIFRoZSBmb2xsb3dpbmcg
ZnVuY3Rpb24gZG9lcyB0aGUgZml4ZWQgcG9pbnQgbWF0aHMgbmVlZGVkIHRvIGltcGxlbWVudCB0
aGUKICAqIGFib3ZlIGZvcm11bGEuCiAgKi8KLXN0YXRpYyB1NjQgY2llMTkzMSh1bnNpZ25lZCBp
bnQgbGlnaHRuZXNzLCB1bnNpZ25lZCBpbnQgc2NhbGUpCitzdGF0aWMgdTY0IGNpZTE5MzEodW5z
aWduZWQgaW50IGxpZ2h0bmVzcykKIHsKIAl1NjQgcmV0dmFsOwogCiAJLyoKIAkgKiBAbGlnaHRu
ZXNzIGlzIGdpdmVuIGFzIGEgbnVtYmVyIGJldHdlZW4gMCBhbmQgMSwgZXhwcmVzc2VkCi0JICog
YXMgYSBmaXhlZC1wb2ludCBudW1iZXIgaW4gc2NhbGUgQHNjYWxlLiBDb252ZXJ0IHRvIGEKLQkg
KiBwZXJjZW50YWdlLCBzdGlsbCBleHByZXNzZWQgYXMgYSBmaXhlZC1wb2ludCBudW1iZXIsIHNv
IHRoZQotCSAqIGFib3ZlIGZvcm11bGFzIGNhbiBiZSBhcHBsaWVkLgorCSAqIGFzIGEgZml4ZWQt
cG9pbnQgbnVtYmVyIGluIHNjYWxlCisJICogUFdNX0xVTUlOQU5DRV9TQ0FMRS4gQ29udmVydCB0
byBhIHBlcmNlbnRhZ2UsIHN0aWxsCisJICogZXhwcmVzc2VkIGFzIGEgZml4ZWQtcG9pbnQgbnVt
YmVyLCBzbyB0aGUgYWJvdmUgZm9ybXVsYXMKKwkgKiBjYW4gYmUgYXBwbGllZC4KIAkgKi8KIAls
aWdodG5lc3MgKj0gMTAwOwotCWlmIChsaWdodG5lc3MgPD0gKDggKiBzY2FsZSkpIHsKKwlpZiAo
bGlnaHRuZXNzIDw9ICg4ICogUFdNX0xVTUlOQU5DRV9TQ0FMRSkpIHsKIAkJcmV0dmFsID0gRElW
X1JPVU5EX0NMT1NFU1QobGlnaHRuZXNzICogMTAsIDkwMzMpOwogCX0gZWxzZSB7Ci0JCXJldHZh
bCA9IChsaWdodG5lc3MgKyAoMTYgKiBzY2FsZSkpIC8gMTE2OworCQlyZXR2YWwgPSAobGlnaHRu
ZXNzICsgKDE2ICogUFdNX0xVTUlOQU5DRV9TQ0FMRSkpIC8gMTE2OwogCQlyZXR2YWwgKj0gcmV0
dmFsICogcmV0dmFsOwotCQlyZXR2YWwgPSBESVZfUk9VTkRfQ0xPU0VTVF9VTEwocmV0dmFsLCAo
c2NhbGUgKiBzY2FsZSkpOworCQlyZXR2YWwgKz0gUFdNX0xVTUlOQU5DRV9TQ0FMRS8yOworCQly
ZXR2YWwgPj49IDIqUFdNX0xVTUlOQU5DRV9TSElGVDsKIAl9CiAKIAlyZXR1cm4gcmV0dmFsOwpA
QCAtMjE1LDggKzIxOCw3IEBAIGludCBwd21fYmFja2xpZ2h0X2JyaWdodG5lc3NfZGVmYXVsdChz
dHJ1Y3QgZGV2aWNlICpkZXYsCiAJLyogRmlsbCB0aGUgdGFibGUgdXNpbmcgdGhlIGNpZTE5MzEg
YWxnb3JpdGhtICovCiAJZm9yIChpID0gMDsgaSA8IGRhdGEtPm1heF9icmlnaHRuZXNzOyBpKysp
IHsKIAkJcmV0dmFsID0gY2llMTkzMSgoaSAqIFBXTV9MVU1JTkFOQ0VfU0NBTEUpIC8KLQkJCQkg
ZGF0YS0+bWF4X2JyaWdodG5lc3MsIFBXTV9MVU1JTkFOQ0VfU0NBTEUpICoKLQkJCQkgcGVyaW9k
OworCQkJCSBkYXRhLT5tYXhfYnJpZ2h0bmVzcykgKiBwZXJpb2Q7CiAJCXJldHZhbCA9IERJVl9S
T1VORF9DTE9TRVNUX1VMTChyZXR2YWwsIFBXTV9MVU1JTkFOQ0VfU0NBTEUpOwogCQlpZiAocmV0
dmFsID4gVUlOVF9NQVgpCiAJCQlyZXR1cm4gLUVJTlZBTDsKLS0gCjIuMjAuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
