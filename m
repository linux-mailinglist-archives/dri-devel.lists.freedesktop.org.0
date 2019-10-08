Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2C1D07FB
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 09:13:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 590FE6E8FA;
	Wed,  9 Oct 2019 07:13:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ADBF89FA5
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 12:05:29 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id b20so17231246ljj.5
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2019 05:05:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TptQKMAgu40zPvzhQ1Z31J/pJlahQ9zU95/IQSGlotQ=;
 b=UIi9s4fVuke+PtrjwmyIzyN6/c7A8NUR0ebTQWd8/M/jLqWhK6DbH9+nxOZ5Zp5QMF
 UPMsdWg2x+waTJXDcHKLbPDw8Q8nfRA2uBRUZT13VAp/70LVK3xjw02n5aFaOR4wyrl4
 CCxfRelll09k6l8ZEGA55kPVLnF5Hf7zvY+xL4pwuLNOPfP1KVlZdH1RRMGW00H925cv
 imSi+psZdKdVLM9i8FuS0w/0C7qQ9NGQ8zbkv/O5PHmz6mWqyiVG2Dii7eDHH8HqltnN
 PbpNMGMNpj4ocMzk5POIc3zLt63oJl0KMDw4G3BP4AiHTy/DwLAaCcaa5escgsbD1/fx
 Eqrw==
X-Gm-Message-State: APjAAAXh8wEoPqYjjqQwVtHNGlHCXdeGWLenycAXGOQFWm6cqOyDxUiv
 SZD1v+jzKkZJYRv/ReNwzfSGYg==
X-Google-Smtp-Source: APXvYqz1ZVV6abC07XSZS+ewKWoIdZcZT75MUkfMcioX26MZiIhkt3Y7dE8w+s+hfv7TsUNPdK5xaw==
X-Received: by 2002:a2e:b045:: with SMTP id d5mr22159030ljl.105.1570536327398; 
 Tue, 08 Oct 2019 05:05:27 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id z18sm3918033ljh.17.2019.10.08.05.05.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 05:05:25 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH v2 4/4] backlight: pwm_bl: switch to power-of-2 base for
 fixed-point math
Date: Tue,  8 Oct 2019 14:03:27 +0200
Message-Id: <20191008120327.24208-5-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191008120327.24208-1-linux@rasmusvillemoes.dk>
References: <20191008120327.24208-1-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 09 Oct 2019 07:12:51 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TptQKMAgu40zPvzhQ1Z31J/pJlahQ9zU95/IQSGlotQ=;
 b=EQxxLJPuv5kKROn32XBozgwjwLwg89RorArcZU/g8cItI4zFmL7g+GBxM/Ahg/onYr
 /Qq6eZw1P0LGp4IiWbUpBRj0wt8o58C+ixmMvDPdQyY9ckNxJ8fwVC+8j5r3oWi+ocMe
 bAPIcSJt4aI9G1QMFztBqZWK5BjdSrlZzfkn0=
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
b21lcyBtb3JlIHRoYW4gMl40OCArCjJeMzIvMi4gT24gYSAzMiBiaXQgcGxhdGZvcm0sIHRoZSB2
ZXJ5IGV4cGVuc2l2ZSA2NC8zMiBkaXZpc2lvbiBhdCB0aGUKZW5kIG9mIGNpZTE5MzEoKSBpbnN0
ZWFkIGJlY29tZXMgZXNzZW50aWFsbHkgZnJlZSAoYSBzaGlmdCBieSAzMiBpcwpqdXN0IGEgcmVn
aXN0ZXIgcmVuYW1lKS4KClJldmlld2VkLWJ5OiBEYW5pZWwgVGhvbXBzb24gPGRhbmllbC50aG9t
cHNvbkBsaW5hcm8ub3JnPgpTaWduZWQtb2ZmLWJ5OiBSYXNtdXMgVmlsbGVtb2VzIDxsaW51eEBy
YXNtdXN2aWxsZW1vZXMuZGs+Ci0tLQogZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMg
fCAyMiArKysrKysrKysrKystLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9u
cygrKSwgMTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9iYWNrbGln
aHQvcHdtX2JsLmMgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21fYmwuYwppbmRleCAyNzNk
M2ZiNjI4YTAuLmE5OWMyMjEwYzkzNSAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9iYWNrbGln
aHQvcHdtX2JsLmMKKysrIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMKQEAgLTE0
OCw3ICsxNDgsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGJhY2tsaWdodF9vcHMgcHdtX2JhY2ts
aWdodF9vcHMgPSB7CiB9OwogCiAjaWZkZWYgQ09ORklHX09GCi0jZGVmaW5lIFBXTV9MVU1JTkFO
Q0VfU0NBTEUJMTAwMDAgLyogbHVtaW5hbmNlIHNjYWxlICovCisjZGVmaW5lIFBXTV9MVU1JTkFO
Q0VfU0hJRlQJMTYKKyNkZWZpbmUgUFdNX0xVTUlOQU5DRV9TQ0FMRQkoMSA8PCBQV01fTFVNSU5B
TkNFX1NISUZUKSAvKiBsdW1pbmFuY2Ugc2NhbGUgKi8KIAogLyoKICAqIENJRSBsaWdodG5lc3Mg
dG8gUFdNIGNvbnZlcnNpb24uCkBAIC0xNjUsMjMgKzE2NiwyNSBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGJhY2tsaWdodF9vcHMgcHdtX2JhY2tsaWdodF9vcHMgPSB7CiAgKiBUaGUgZm9sbG93aW5n
IGZ1bmN0aW9uIGRvZXMgdGhlIGZpeGVkIHBvaW50IG1hdGhzIG5lZWRlZCB0byBpbXBsZW1lbnQg
dGhlCiAgKiBhYm92ZSBmb3JtdWxhLgogICovCi1zdGF0aWMgdTY0IGNpZTE5MzEodW5zaWduZWQg
aW50IGxpZ2h0bmVzcywgdW5zaWduZWQgaW50IHNjYWxlKQorc3RhdGljIHU2NCBjaWUxOTMxKHVu
c2lnbmVkIGludCBsaWdodG5lc3MpCiB7CiAJdTY0IHJldHZhbDsKIAogCS8qCiAJICogQGxpZ2h0
bmVzcyBpcyBnaXZlbiBhcyBhIG51bWJlciBiZXR3ZWVuIDAgYW5kIDEsIGV4cHJlc3NlZAotCSAq
IGFzIGEgZml4ZWQtcG9pbnQgbnVtYmVyIGluIHNjYWxlIEBzY2FsZS4gQ29udmVydCB0byBhCi0J
ICogcGVyY2VudGFnZSwgc3RpbGwgZXhwcmVzc2VkIGFzIGEgZml4ZWQtcG9pbnQgbnVtYmVyLCBz
byB0aGUKLQkgKiBhYm92ZSBmb3JtdWxhcyBjYW4gYmUgYXBwbGllZC4KKwkgKiBhcyBhIGZpeGVk
LXBvaW50IG51bWJlciBpbiBzY2FsZQorCSAqIFBXTV9MVU1JTkFOQ0VfU0NBTEUuIENvbnZlcnQg
dG8gYSBwZXJjZW50YWdlLCBzdGlsbAorCSAqIGV4cHJlc3NlZCBhcyBhIGZpeGVkLXBvaW50IG51
bWJlciwgc28gdGhlIGFib3ZlIGZvcm11bGFzCisJICogY2FuIGJlIGFwcGxpZWQuCiAJICovCiAJ
bGlnaHRuZXNzICo9IDEwMDsKLQlpZiAobGlnaHRuZXNzIDw9ICg4ICogc2NhbGUpKSB7CisJaWYg
KGxpZ2h0bmVzcyA8PSAoOCAqIFBXTV9MVU1JTkFOQ0VfU0NBTEUpKSB7CiAJCXJldHZhbCA9IERJ
Vl9ST1VORF9DTE9TRVNUKGxpZ2h0bmVzcyAqIDEwLCA5MDMzKTsKIAl9IGVsc2UgewotCQlyZXR2
YWwgPSAobGlnaHRuZXNzICsgKDE2ICogc2NhbGUpKSAvIDExNjsKKwkJcmV0dmFsID0gKGxpZ2h0
bmVzcyArICgxNiAqIFBXTV9MVU1JTkFOQ0VfU0NBTEUpKSAvIDExNjsKIAkJcmV0dmFsICo9IHJl
dHZhbCAqIHJldHZhbDsKLQkJcmV0dmFsID0gRElWX1JPVU5EX0NMT1NFU1RfVUxMKHJldHZhbCwg
KHNjYWxlICogc2NhbGUpKTsKKwkJcmV0dmFsICs9IDFVTEwgPDwgKDIqUFdNX0xVTUlOQU5DRV9T
SElGVCAtIDEpOworCQlyZXR2YWwgPj49IDIqUFdNX0xVTUlOQU5DRV9TSElGVDsKIAl9CiAKIAly
ZXR1cm4gcmV0dmFsOwpAQCAtMjE1LDggKzIxOCw3IEBAIGludCBwd21fYmFja2xpZ2h0X2JyaWdo
dG5lc3NfZGVmYXVsdChzdHJ1Y3QgZGV2aWNlICpkZXYsCiAJLyogRmlsbCB0aGUgdGFibGUgdXNp
bmcgdGhlIGNpZTE5MzEgYWxnb3JpdGhtICovCiAJZm9yIChpID0gMDsgaSA8IGRhdGEtPm1heF9i
cmlnaHRuZXNzOyBpKyspIHsKIAkJcmV0dmFsID0gY2llMTkzMSgoaSAqIFBXTV9MVU1JTkFOQ0Vf
U0NBTEUpIC8KLQkJCQkgZGF0YS0+bWF4X2JyaWdodG5lc3MsIFBXTV9MVU1JTkFOQ0VfU0NBTEUp
ICoKLQkJCQkgcGVyaW9kOworCQkJCSBkYXRhLT5tYXhfYnJpZ2h0bmVzcykgKiBwZXJpb2Q7CiAJ
CXJldHZhbCA9IERJVl9ST1VORF9DTE9TRVNUX1VMTChyZXR2YWwsIFBXTV9MVU1JTkFOQ0VfU0NB
TEUpOwogCQlpZiAocmV0dmFsID4gVUlOVF9NQVgpCiAJCQlyZXR1cm4gLUVJTlZBTDsKLS0gCjIu
MjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
