Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C509102DFD
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 22:09:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C124B6E8E6;
	Tue, 19 Nov 2019 21:08:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31B526E3F2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 21:08:55 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id c22so5492638wmd.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 13:08:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/J7G3D2ebt6Z0HB4QG8yK+4PVkYn3CZE5ldyfHzxSrE=;
 b=DctCufZUDCRSIGRJ3z66VuzrnHVjT65Q23IsvJpOEyPhIagCLxr9QEVhTIYC0azbQ2
 ebo1bLB716eIJBxXu7hdFXhHdO73jWrTfVhfPQqziqkmgcc4v7v92GUdQRtYSfytcwPp
 wMSyZc0A8DKPhhm+T0rKW/sGBY4SKQZtkxcClyRTpP4OsmQGBs+e25guq5oUxqTDVmHs
 wwH8bWy3UdczgSpmQHaag7E23S9dTdWJ7gT5XlNrCRC0v1VZiQ/PNKy2Vww/34AiE++B
 58t5DYmOWWftjtcjbkA+m/sxEJn6ilcMAJuuMDXl/O8BJKD83+mea2yG7ABpPR7qSunS
 6aGw==
X-Gm-Message-State: APjAAAVGp+MyrNMk3wel0Jvwty0DvnpCqCH9mJcho/gSHIVF9CeRliPZ
 +lH6eP1oASnJmsIeeKtJ8s/IVg==
X-Google-Smtp-Source: APXvYqweGr5lRb2H3jBAb7BO6vyXvuEU0Xn9y82lr1/l6PpO5IamxURKkygb4S/V5DyM3yZ+YUBQ7Q==
X-Received: by 2002:a1c:9a81:: with SMTP id c123mr8080941wme.118.1574197733780; 
 Tue, 19 Nov 2019 13:08:53 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id z14sm28005126wrl.60.2019.11.19.13.08.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 13:08:53 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/3] drm/msm: Don't init ww_mutec acquire ctx before needed
Date: Tue, 19 Nov 2019 22:08:44 +0100
Message-Id: <20191119210844.16947-4-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191119210844.16947-1-daniel.vetter@ffwll.ch>
References: <20191119210844.16947-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/J7G3D2ebt6Z0HB4QG8yK+4PVkYn3CZE5ldyfHzxSrE=;
 b=Y/D3zFMQVqiSBfqH6DZ+/jejFtdbuHL69Yvo58kYvUYGswh2OtzunEL51V44+jnRNa
 ri1kIAI1ZNJN/CtNFGIo+A400H2rA2nL/IEVUKaLYCYC1t/ulVTa46bNV8lnrM52+bJh
 1LyG44aDuM6YxyD6IdzCvZtz5DTf0tod3Ew+I=
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
Cc: Sean Paul <sean@poorly.run>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Daniel Vetter <daniel.vetter@intel.com>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rm9yIGxvY2tpbmcgc2VtYW50aWNzIGl0IHJlYWxseSBkb2Vzbid0IG1hdHRlciB3aGVuIHdlIGdy
YWIgdGhlCnRpY2tldC4gQnV0IGZvciBsb2NrZGVwIHZhbGlkYXRpb24gaXQgZG9lczogdGhlIGFj
cXVpcmUgY3R4IGlzIGEgZmFrZQpsb2NrZGVwLiBTaW5jZSBvdGhlciBkcml2ZXJzIG1pZ2h0IHdh
bnQgdG8gZG8gYSBmdWxsIG11bHRpLWxvY2sgZGFuY2UKaW4gdGhlaXIgZmF1bHQtaGFuZGxlciwg
bm90IGp1c3QgbG9jayBhIHNpbmdsZSBkbWFfcmVzdi4gVGhlcmVmb3JlIHdlCm11c3QgaW5pdCB0
aGUgYWNxdWlyZV9jdHggb25seSBhZnRlciB3ZSd2ZSBkb25lIGFsbCB0aGUgY29weV8qX3VzZXIg
b3IKYW55dGhpbmcgZWxzZSB0aGF0IG1pZ2h0IHRyaWdnZXIgYSBwYWdlZmF1bHQuIEZvciBtc20g
dGhpcyBtZWFucyB3ZQpuZWVkIHRvIG1vdmUgaXQgcGFzdCBzdWJtaXRfbG9va3VwX29iamVjdHMu
CgpBc2lkZTogV2h5IGlzIG1zbSBzdGlsbCB1c2luZyBzdHJ1Y3RfbXV0ZXgsIGl0IHNlZW1zIHRv
IGJlIHVzaW5nCmRtYV9yZXN2X2xvY2sgZm9yIGdlbmVyYWwgYnVmZmVyIHN0YXRlIHByb3RlY3Rp
b24/CgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNv
bT4KQ2M6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGdtYWlsLmNvbT4KQ2M6IFNlYW4gUGF1bCA8c2Vh
bkBwb29ybHkucnVuPgpDYzogbGludXgtYXJtLW1zbUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGZyZWVk
cmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9n
ZW1fc3VibWl0LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9nZW1fc3VibWl0
LmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9nZW1fc3VibWl0LmMKaW5kZXggZmIxZmRkN2Zh
M2VmLi4xMjZiMmY2MmJmZTcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2dl
bV9zdWJtaXQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9nZW1fc3VibWl0LmMKQEAg
LTU0LDcgKzU0LDYgQEAgc3RhdGljIHN0cnVjdCBtc21fZ2VtX3N1Ym1pdCAqc3VibWl0X2NyZWF0
ZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCiAJSU5JVF9MSVNUX0hFQUQoJnN1Ym1pdC0+bm9k
ZSk7CiAJSU5JVF9MSVNUX0hFQUQoJnN1Ym1pdC0+Ym9fbGlzdCk7Ci0Jd3dfYWNxdWlyZV9pbml0
KCZzdWJtaXQtPnRpY2tldCwgJnJlc2VydmF0aW9uX3d3X2NsYXNzKTsKIAogCXJldHVybiBzdWJt
aXQ7CiB9CkBAIC00ODksNiArNDg4LDcgQEAgaW50IG1zbV9pb2N0bF9nZW1fc3VibWl0KHN0cnVj
dCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCiAJaWYgKHJldCkKIAkJZ290byBvdXQ7CiAK
Kwl3d19hY3F1aXJlX2luaXQoJnN1Ym1pdC0+dGlja2V0LCAmcmVzZXJ2YXRpb25fd3dfY2xhc3Mp
OwogCXJldCA9IHN1Ym1pdF9sb2NrX29iamVjdHMoc3VibWl0KTsKIAlpZiAocmV0KQogCQlnb3Rv
IG91dDsKLS0gCjIuMjQuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
