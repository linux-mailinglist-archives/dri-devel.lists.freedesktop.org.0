Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 426FD17DC2
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2019 18:09:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D397A8982A;
	Wed,  8 May 2019 16:09:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9A4D89817
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2019 16:09:36 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id c13so23831006qtn.8
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2019 09:09:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SSjzGScI7FWnThDcb7L6+9NbYWPOU1oEmSq7ubXMBrA=;
 b=UTaXsU6orzSBvnNABi0sbHbcWGPK/aiCkMjgdyafTAoaPsBCm+btpLsSkhP4e0QqXS
 Ns+HRugpTTMEmdeskoVA7qwxmpGsZfMZrnrTv0+ypfGcvUVXnTdxbKxIxecwdQGFbupV
 RHoQpgiVQ0O6tVthuvNRsIL9BVu58wy+bVLHuDoftZYhGdYJEKpdFmfUMbWDpxr58JBk
 6Hs0GFBsaYzC6GzyRmRv+bcNRuRKQ93Ha6ROFlEmhXU36NjSYGTjq52F2mXr1LkfUFev
 JzsWZVjFB1lTlDj3Tf2+4Ig2Z0fdLQtGbhZHffPEjDWlLKfaAgUKLt9OxM6Yyo2HD/Xp
 HaHg==
X-Gm-Message-State: APjAAAXGM5/XQIwSSs4K/tUOG9SuHOSP2dQN2DoACU9J1BdJ9eHL9GpO
 HAM1qz9MtJVYnc8Xj/m66i7JIa2GUBU=
X-Google-Smtp-Source: APXvYqyZLDk2aXR6xfKMLulFGaYRoZh1EvXTEYMzxva9aBfDueLN4c20IV9V9OJciZpl/JQmHfwuKQ==
X-Received: by 2002:ac8:2cc1:: with SMTP id 1mr32738783qtx.389.1557331775692; 
 Wed, 08 May 2019 09:09:35 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id s50sm10936877qts.39.2019.05.08.09.09.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 May 2019 09:09:35 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 06/11] drm/rockchip: Use dirtyfb helper
Date: Wed,  8 May 2019 12:09:11 -0400
Message-Id: <20190508160920.144739-7-sean@poorly.run>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190508160920.144739-1-sean@poorly.run>
References: <20190508160920.144739-1-sean@poorly.run>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SSjzGScI7FWnThDcb7L6+9NbYWPOU1oEmSq7ubXMBrA=;
 b=b/Mzvp9NPtpNHKqVRbANgyrQcwT3N1aJFNvie3Z04eQTbUk6Qao33USN2IESlcHCOO
 4qnWQ0OSFA9kRNfw0U84tm6awagkWYPwG6lxiGHkQlacBIqYLmHbCoID7pE85RwJ6oWW
 fxCjWj0loJl7dr1aQl440frgop0Fsx3+xqDuR0iu3DGH+kYO/XBZ91bJw22MT3cefWmv
 9y+gjvaQnQ096PQRKvgg8gbPFShyevAenHdukkPFwgfEZVmYe7qW4oVd48HxFgI6IQar
 Fn788RAuaJM5XZ7ORF6O6nrqX9mxUfX5QCSmGbyiJwTNTf6qDqASZNABfmLhhypMhWKJ
 h7ag==
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Sean Paul <seanpaul@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpJbnN0ZWFkIG9mIGZsdXNo
aW5nIGFsbCB2b3BzIGV2ZXJ5IHRpbWUgd2UgZ2V0IGEgZGlydHlmYiBjYWxsLCB1c2UgdGhlCmRh
bWFnZSBoZWxwZXIgdG8ga2ljayBvZmYgYW4gYXRvbWljIGNvbW1pdC4gRXZlbiB0aG91Z2ggd2Ug
ZG9uJ3QgdXNlCmRhbWFnZSBjbGlwcywgdGhlIGhlbHBlciBjb21taXQgd2lsbCBmb3JjZSB1cyB0
aHJvdWdoIHRoZSBub3JtYWwKcHNyX2luaGliaXRfZ2V0L3B1dCBzZXF1ZW5jZS4KCkNoYW5nZXMg
aW4gdjM6Ci0gQWRkZWQgdG8gdGhlIHNldApDaGFuZ2VzIGluIHY0OgotIE5vbmUKCkxpbmsgdG8g
djM6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC9tc2dpZC8yMDE5MDUw
MjE5NDk1Ni4yMTg0NDEtNy1zZWFuQHBvb3JseS5ydW4KClN1Z2dlc3RlZC1ieTogRGFuaWVsIFZl
dHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpTaWduZWQtb2ZmLWJ5OiBTZWFuIFBhdWwgPHNlYW5wYXVs
QGNocm9taXVtLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJt
X2ZiLmMgfCAxMyArKy0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAxMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAv
cm9ja2NoaXBfZHJtX2ZiLmMgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJt
X2ZiLmMKaW5kZXggOTc0MzhiYmJlMzg5Li4wMmU4MWNhMmQ5MzMgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fZmIuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX2ZiLmMKQEAgLTE2LDYgKzE2LDcgQEAKICNpbmNsdWRl
IDxkcm0vZHJtLmg+CiAjaW5jbHVkZSA8ZHJtL2RybVAuaD4KICNpbmNsdWRlIDxkcm0vZHJtX2F0
b21pYy5oPgorI2luY2x1ZGUgPGRybS9kcm1fZGFtYWdlX2hlbHBlci5oPgogI2luY2x1ZGUgPGRy
bS9kcm1fZmJfaGVscGVyLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9nZW1fZnJhbWVidWZmZXJfaGVs
cGVyLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9wcm9iZV9oZWxwZXIuaD4KQEAgLTI1LDIwICsyNiwx
MCBAQAogI2luY2x1ZGUgInJvY2tjaGlwX2RybV9nZW0uaCIKICNpbmNsdWRlICJyb2NrY2hpcF9k
cm1fcHNyLmgiCiAKLXN0YXRpYyBpbnQgcm9ja2NoaXBfZHJtX2ZiX2RpcnR5KHN0cnVjdCBkcm1f
ZnJhbWVidWZmZXIgKmZiLAotCQkJCSBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGUsCi0JCQkJIHVuc2ln
bmVkIGludCBmbGFncywgdW5zaWduZWQgaW50IGNvbG9yLAotCQkJCSBzdHJ1Y3QgZHJtX2NsaXBf
cmVjdCAqY2xpcHMsCi0JCQkJIHVuc2lnbmVkIGludCBudW1fY2xpcHMpCi17Ci0Jcm9ja2NoaXBf
ZHJtX3Bzcl9mbHVzaF9hbGwoZmItPmRldik7Ci0JcmV0dXJuIDA7Ci19Ci0KIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyX2Z1bmNzIHJvY2tjaGlwX2RybV9mYl9mdW5jcyA9IHsK
IAkuZGVzdHJveSAgICAgICA9IGRybV9nZW1fZmJfZGVzdHJveSwKIAkuY3JlYXRlX2hhbmRsZSA9
IGRybV9nZW1fZmJfY3JlYXRlX2hhbmRsZSwKLQkuZGlydHkJICAgICAgID0gcm9ja2NoaXBfZHJt
X2ZiX2RpcnR5LAorCS5kaXJ0eQkgICAgICAgPSBkcm1fYXRvbWljX2hlbHBlcl9kaXJ0eWZiLAog
fTsKIAogc3RhdGljIHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKgotLSAKU2VhbiBQYXVsLCBTb2Z0
d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
