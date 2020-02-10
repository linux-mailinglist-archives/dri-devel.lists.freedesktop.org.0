Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DA0157E69
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 16:09:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2E8D6EC7B;
	Mon, 10 Feb 2020 15:09:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62B996EC7B;
 Mon, 10 Feb 2020 15:09:16 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id s144so110512wme.1;
 Mon, 10 Feb 2020 07:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=7NSt6dO/qIhpURlhjYp6e2TctCtwYH9Uut8LFHRiJQ4=;
 b=DF8gi3dPbM9M/Xt1t3VzJ2F5WHP7VY8kXCaBWczLw+QiR3UPRYx0QgS9jHHSuoIw/d
 k+OyBk6qD0fnLtA1JMrEqEBEg7jbTVaNIfoZH+DTZj5ti+E6OzHkxCISok5PchL86fqR
 N3YigSO4Sdc2VPxIvbWBqwq/0LeTxUHZ/EICKVrbSMmmGkU81ri4XEnW6/f6+d2ePIAE
 R54ZetUG58XGKorR8cuSRA2Z8oFHCokkLexp4+xE3cau4HGoGCssTWjKxIC6Mo96aH9t
 Bar6JTyRw96BIiWDWUg4FqpyuFyjw4b1eCSTRe4Trsu6dFXIL2bX/ctDjYO0q4qkMy4I
 bT4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7NSt6dO/qIhpURlhjYp6e2TctCtwYH9Uut8LFHRiJQ4=;
 b=s/RBlfLTYMCTxL3BNOL9UakK8a5KHNg/AbkKLVoFD0hGiNaQnzSajOpSKp58yopwk6
 5Tj35qoCUduS5WOcRNjnLNx2UsXBHWVeV5QVoZKnVaGswj/XJ7VJH8tmBwb5K6uY2azo
 VNHWD5OkgjVEpdWfFhVTHmaHDyoC9gH/7uRoOt1zNbYq5U5OJDRVQ+TfUg1t8BSoRGMi
 fS5QZDqifr/8xCp3W57hQOzPJRxfpz7LBjwUpuz6gaj1h2D0jWtkKv0+VQC3kZP3HzhL
 3+2bgUIiOsuiE8bRpxoUzZSTlimaKFPWSsTt618G2V/mXDNNxPR/O8g9jL65p1tFUOwH
 ofzw==
X-Gm-Message-State: APjAAAUk9kLYSKxN4W4B30HW2SD9YZD2YhSxPMb+BLmA1LfTW2XGzoE3
 9gvYVKiR04x7b/PeB4k/mzrH9fDw
X-Google-Smtp-Source: APXvYqwUvJ7hsGR/wBw4lEgZ/tYu5llOIIuSS2/VrCRWiWww6WRI+mdqbjAHajMOkRyW6r3iQhS+CA==
X-Received: by 2002:a05:600c:2944:: with SMTP id
 n4mr15700211wmd.22.1581347355056; 
 Mon, 10 Feb 2020 07:09:15 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:7d3b:a71c:475c:1e99])
 by smtp.gmail.com with ESMTPSA id q10sm1021996wme.16.2020.02.10.07.09.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2020 07:09:14 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 3/6] drm/ttm: use RCU in ttm_bo_flush_all_fences
Date: Mon, 10 Feb 2020 16:09:04 +0100
Message-Id: <20200210150907.20616-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200210150907.20616-1-christian.koenig@amd.com>
References: <20200210150907.20616-1-christian.koenig@amd.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBhbGxvd3MgaXQgdG8gY2FsbCB0aGUgZnVuY3Rpb24gd2l0aG91dCB0aGUgbG9jayBoZWxk
LgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgfCAxMCArKysrKystLS0tCiAx
IGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0
bV9iby5jCmluZGV4IGMxMTA0Yzg4NTdiNy4uZTEyZmMyYzJkMTY1IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2Jv
LmMKQEAgLTQyOSwyMiArNDI5LDI0IEBAIHN0YXRpYyBpbnQgdHRtX2JvX2luZGl2aWR1YWxpemVf
cmVzdihzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvKQogCiBzdGF0aWMgdm9pZCB0dG1fYm9f
Zmx1c2hfYWxsX2ZlbmNlcyhzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvKQogeworCXN0cnVj
dCBkbWFfcmVzdiAqcmVzdiA9ICZiby0+YmFzZS5fcmVzdjsKIAlzdHJ1Y3QgZG1hX3Jlc3ZfbGlz
dCAqZm9iajsKIAlzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZTsKIAlpbnQgaTsKIAotCWZvYmogPSBk
bWFfcmVzdl9nZXRfbGlzdCgmYm8tPmJhc2UuX3Jlc3YpOwotCWZlbmNlID0gZG1hX3Jlc3ZfZ2V0
X2V4Y2woJmJvLT5iYXNlLl9yZXN2KTsKKwlyY3VfcmVhZF9sb2NrKCk7CisJZm9iaiA9IHJjdV9k
ZXJlZmVyZW5jZShyZXN2LT5mZW5jZSk7CisJZmVuY2UgPSByY3VfZGVyZWZlcmVuY2UocmVzdi0+
ZmVuY2VfZXhjbCk7CiAJaWYgKGZlbmNlICYmICFmZW5jZS0+b3BzLT5zaWduYWxlZCkKIAkJZG1h
X2ZlbmNlX2VuYWJsZV9zd19zaWduYWxpbmcoZmVuY2UpOwogCiAJZm9yIChpID0gMDsgZm9iaiAm
JiBpIDwgZm9iai0+c2hhcmVkX2NvdW50OyArK2kpIHsKLQkJZmVuY2UgPSByY3VfZGVyZWZlcmVu
Y2VfcHJvdGVjdGVkKGZvYmotPnNoYXJlZFtpXSwKLQkJCQkJZG1hX3Jlc3ZfaGVsZChiby0+YmFz
ZS5yZXN2KSk7CisJCWZlbmNlID0gcmN1X2RlcmVmZXJlbmNlKGZvYmotPnNoYXJlZFtpXSk7CiAK
IAkJaWYgKCFmZW5jZS0+b3BzLT5zaWduYWxlZCkKIAkJCWRtYV9mZW5jZV9lbmFibGVfc3dfc2ln
bmFsaW5nKGZlbmNlKTsKIAl9CisJcmN1X3JlYWRfdW5sb2NrKCk7CiB9CiAKIHN0YXRpYyB2b2lk
IHR0bV9ib19jbGVhbnVwX3JlZnNfb3JfcXVldWUoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpi
bykKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
