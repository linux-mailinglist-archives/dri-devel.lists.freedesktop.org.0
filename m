Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8996BF68
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 18:01:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 867A16E0BA;
	Wed, 17 Jul 2019 16:01:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAC2B6E0BA
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 16:01:50 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id s41so7137997ybe.12
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 09:01:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5v/KSKjUEeP32VcuEgzbcQ/YndyePmg9yJEvo1CFkgE=;
 b=szlOcwDEvhqLnjVsGHWLrDB/Fyb+DJwDC8eIy0eBGMHsHzHh9gst/Qm/ff195bXt/b
 hmHlBMoT8fHaCurdMlbK6ZOeKGToRAx2YtLOujnqv44nmctKRHalms8rsXWWvTsMJObP
 MA6HanRb092olJQ/0pzJmAsKZGmlTA8VbLRJNhXIZhzMEN7o4pNAFl9D1++x9Uni0KMy
 SKiIsqyHI0JDdUQO2nPexNvcHXe9KT42Td1PMCPgqJRkrRA8DY5wOeQKYU2f40R1Smqx
 JiykLh1J98BvDBfCP25EuyJaKKWfzznuVoDR/70k0QefdiJg6Omz09U1Bo0oMHy/SkX6
 RtDw==
X-Gm-Message-State: APjAAAXyTwaU8nhe5TDta9QMNzmghoyswp1Ku5Hlzgi6WV8uGMr71s/S
 QaMEx3j2q7PlMnvqpUhAmK93z1+bwNCtjw==
X-Google-Smtp-Source: APXvYqy/shYDZ9RRKwBh0Tq2oyK1HBNYjy4eShnwLr3q4k+lR9uj9Dxhvtv/dxkzdkNFNbd2SwWkig==
X-Received: by 2002:a25:99c9:: with SMTP id q9mr18621198ybo.421.1563379309406; 
 Wed, 17 Jul 2019 09:01:49 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id 200sm6077892ywq.102.2019.07.17.09.01.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 17 Jul 2019 09:01:49 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: Make the bw/link rate calculations more forgiving
Date: Wed, 17 Jul 2019 12:01:48 -0400
Message-Id: <20190717160148.256826-1-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.510.g264f2c817a-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5v/KSKjUEeP32VcuEgzbcQ/YndyePmg9yJEvo1CFkgE=;
 b=U0aP974jBD4CyyqFIpOFa9CsjWut0EHHq1M8LbhYFIAoxiSyRHiwp1OjaWfmTM7nvV
 fSrXHm0pTUrNOFn+TdBCyFgDSGzc7cKpzp08mHSMetWPUsgZvKL9CGEjh7rUgPT2AQOW
 LZUzunETEvkX8NmMGkdBTXVC3ZvPYV2H6qBPGtSMk5PMBrb2rXjWokA6J0uHGlKVbHFr
 a2XVManApdkl04k+NrKucfXkr6RvmR5UbO/O1XhQ2IabfNgdp0JMC93WgaTZVN4VyR49
 +NBbotyO4iCKuURfqPsSLQudxhK9lYVC8txcfAcvCSUwGN6vy+KOOR3PEmW8sZHKRsB4
 A3Mw==
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
Cc: Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpBbHRob3VnaCB0aGUgRGlz
cGxheVBvcnQgc3BlYyBleHBsaWNpdGx5IGNhbGxzIG91dCB0aGUgMS42Mi8yLjcvNS40LzguMQps
aW5rIHJhdGVzLCB0aGUgdmFsdWUgb2YgTElOS19CV19TRVQgaXMgY2FsY3VsYXRlZC4gIFRoZSBE
aXNwbGF5UG9ydApzcGVjIHNheXMgIk1haW4tTGluayBCYW5kd2lkdGggU2V0dGluZyA9IFZhbHVl
IHggMC4yN0dicHMvbGFuZSIuCgpBIGJyaWRnZSB0aGF0IHdlJ3JlIGxvb2tpbmcgdG8gdXBzdHJl
YW0gdXNlcyA2Ljc1R2JwcyByYXRlICh2YWx1ZSAweDE5KQpbMV0sIGFuZCB0aGF0IHByZWNsdWRl
cyBpdCBmcm9tIHVzaW5nIHRoZXNlIGZ1bmN0aW9ucy4KClRoaXMgcGF0Y2ggY2FsY3VsYXRlcyB0
aGUgdmFsdWVzIGFjY29yZGluZyB0byBzcGVjIGluc3RlYWQgb2YKcmVzdHJpY3RpbmcgdGhlc2Ug
dmFsdWVzIHRvIG9uZSBvZiB0aGUgRFBfTElOS19CV18qICNkZWZpbmVzLgoKTm8gZnVuY3Rpb25h
bCBjaGFuZ2UgZm9yIHRoZSB3ZWxsLWRlZmluZWQgdmFsdWVzLCBidXQgd2UgbG9zZSB0aGUKd2Fy
bmluZyBmb3IgaWxsLWRlZmluZWQgYncgdmFsdWVzLgoKU2lnbmVkLW9mZi1ieTogU2VhbiBQYXVs
IDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpbMV0gaHR0cHM6Ly9jaHJvbWl1bS1yZXZpZXcuZ29v
Z2xlc291cmNlLmNvbS9jL2Nocm9taXVtb3MvdGhpcmRfcGFydHkva2VybmVsLysvMTY4OTI1MS8y
L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW54NzYyNS5jIzYzNgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMgfCAzMSArKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyNyBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jIGIvZHJpdmVycy9n
cHUvZHJtL2RybV9kcF9oZWxwZXIuYwppbmRleCAwYjk5NGQwODNhODkuLmZmYzY4ZDMwNWFmZSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jCkBAIC0xNTIsMzggKzE1MiwxNSBAQCBFWFBPUlRfU1lN
Qk9MKGRybV9kcF9saW5rX3RyYWluX2NoYW5uZWxfZXFfZGVsYXkpOwogCiB1OCBkcm1fZHBfbGlu
a19yYXRlX3RvX2J3X2NvZGUoaW50IGxpbmtfcmF0ZSkKIHsKLQlzd2l0Y2ggKGxpbmtfcmF0ZSkg
ewotCWRlZmF1bHQ6Ci0JCVdBUk4oMSwgInVua25vd24gRFAgbGluayByYXRlICVkLCB1c2luZyAl
eFxuIiwgbGlua19yYXRlLAotCQkgICAgIERQX0xJTktfQldfMV82Mik7Ci0JCS8qIGZhbGwgdGhy
b3VnaCAqLwotCWNhc2UgMTYyMDAwOgotCQlyZXR1cm4gRFBfTElOS19CV18xXzYyOwotCWNhc2Ug
MjcwMDAwOgotCQlyZXR1cm4gRFBfTElOS19CV18yXzc7Ci0JY2FzZSA1NDAwMDA6Ci0JCXJldHVy
biBEUF9MSU5LX0JXXzVfNDsKLQljYXNlIDgxMDAwMDoKLQkJcmV0dXJuIERQX0xJTktfQldfOF8x
OwotCX0KKwkvKiBTcGVjIHNheXMgbGlua19idyA9IGxpbmtfcmF0ZSAvIDAuMjdHYnBzICovCisJ
cmV0dXJuIGxpbmtfcmF0ZSAvIDI3MDAwOwogfQogRVhQT1JUX1NZTUJPTChkcm1fZHBfbGlua19y
YXRlX3RvX2J3X2NvZGUpOwogCiBpbnQgZHJtX2RwX2J3X2NvZGVfdG9fbGlua19yYXRlKHU4IGxp
bmtfYncpCiB7Ci0Jc3dpdGNoIChsaW5rX2J3KSB7Ci0JZGVmYXVsdDoKLQkJV0FSTigxLCAidW5r
bm93biBEUCBsaW5rIEJXIGNvZGUgJXgsIHVzaW5nIDE2MjAwMFxuIiwgbGlua19idyk7Ci0JCS8q
IGZhbGwgdGhyb3VnaCAqLwotCWNhc2UgRFBfTElOS19CV18xXzYyOgotCQlyZXR1cm4gMTYyMDAw
OwotCWNhc2UgRFBfTElOS19CV18yXzc6Ci0JCXJldHVybiAyNzAwMDA7Ci0JY2FzZSBEUF9MSU5L
X0JXXzVfNDoKLQkJcmV0dXJuIDU0MDAwMDsKLQljYXNlIERQX0xJTktfQldfOF8xOgotCQlyZXR1
cm4gODEwMDAwOwotCX0KKwkvKiBTcGVjIHNheXMgbGlua19yYXRlID0gbGlua19idyAqIDAuMjdH
YnBzICovCisJcmV0dXJuIGxpbmtfYncgKiAyNzAwMDsKIH0KIEVYUE9SVF9TWU1CT0woZHJtX2Rw
X2J3X2NvZGVfdG9fbGlua19yYXRlKTsKIAotLSAKU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVl
ciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
