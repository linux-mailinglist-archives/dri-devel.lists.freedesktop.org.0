Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B12C55939
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 22:42:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DF3A6E235;
	Tue, 25 Jun 2019 20:42:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 644706E22D
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 20:42:17 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id w20so21507679edd.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 13:42:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dTa7pMjmG8OazW16jHzeTKzzSmzFeuNnJmiuYsQc45s=;
 b=bqOitqzsQLg4FGD+YsaVXpbTm9+mCAYnjX91brvg8hHTuU/JZ+d2paHQZHkYOzVo6m
 nudjIoZia0fAk71ANRsHLYDENNqL6uEy5qAFpDPeEsVBG5lXemcJ+JgID5PzAtkbDC7Y
 /B8z2K73tFElOAmtVmIZmCeDAteIvrJLXRhZpMJONf2HEPpR/b9NgsM2dsxa0Pc1RUlm
 4guUxLth20uFZ/fYcXat0104ak9B5Vc+1dEeQU4dH8C8kaNkjGPTUQR/BlLlxgAxh1Rj
 Cj38muS1kcdTQkYPU+end94rnCvTDLN+VsQlwGswwrzRIhriZlwNC7c5ebxiAzW82Vvw
 HmSg==
X-Gm-Message-State: APjAAAXJRwnZTpJ0KeFvH+mv95WCyKgBw8JBzFiHSEwWqoThoJ+bEc7U
 pohMXNTuH1iwISY5dcKFO5p3x5cCJ98=
X-Google-Smtp-Source: APXvYqxqgAFX7h/8CFlC51HYmuHaJTKWDbvFFvJaZcVNio3W/AxPjv66qVseaEMNWlAm0fJAVy+EBg==
X-Received: by 2002:a50:b343:: with SMTP id r3mr562199edd.16.1561495335832;
 Tue, 25 Jun 2019 13:42:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id u9sm5187262edm.71.2019.06.25.13.42.14
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 25 Jun 2019 13:42:15 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/7] drm/msm: Use drm_gem_fb_prepare_fb
Date: Tue, 25 Jun 2019 22:42:03 +0200
Message-Id: <20190625204208.5614-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190625204208.5614-1-daniel.vetter@ffwll.ch>
References: <20190625204208.5614-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dTa7pMjmG8OazW16jHzeTKzzSmzFeuNnJmiuYsQc45s=;
 b=KNgeM6/NzCoejkijml2vqQBkXIiW87xIA+QMyI6j3rN6pajeCjOHMvYaa1Oqwp9y60
 3YFyyU7v7gLr4tWZ1N40CCqpJ6+dfK2cKoUBqiR35iXn7opLIHsu/xHwkfvXwqLjE7w7
 Q5MBNvRCijY/n0RIK0bfjOqJqd3YgrV2TZbd8=
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
Cc: freedreno@lists.freedesktop.org, Fritz Koenig <frkoenig@google.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Bruce Wang <bzwang@chromium.org>,
 linux-arm-msm@vger.kernel.org, Daniel Vetter <daniel.vetter@intel.com>,
 Sean Paul <sean@poorly.run>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

bXNtIGhhcyBzd2l0Y2hlZCBvdmVyIHRvIGRybV9mYi0+b2JqW10gYSB3aGlsZSBhZ28gYWxyZWFk
eSwgc28gd2UgY2FuCmp1c3QgdXNlIHRoZSBoZWxwZXIuCgp2MjogTWFrZSBpdCBjb21waWxlIC4u
LiBvb3BzLgoKQ2M6IEVyaWMgQW5ob2x0IDxlcmljQGFuaG9sdC5uZXQ+CkNjOiBFbWlsIFZlbGlr
b3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KQ2M6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGdt
YWlsLmNvbT4KQ2M6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgpDYzogSmV5a3VtYXIgU2Fu
a2FyYW4gPGpzYW5rYUBjb2RlYXVyb3JhLm9yZz4KQ2M6IEpvcmRhbiBDcm91c2UgPGpjcm91c2VA
Y29kZWF1cm9yYS5vcmc+CkNjOiBCcnVjZSBXYW5nIDxiendhbmdAY2hyb21pdW0ub3JnPgpDYzog
RnJpdHogS29lbmlnIDxmcmtvZW5pZ0Bnb29nbGUuY29tPgpDYzogRGFuaWVsIFZldHRlciA8ZGFu
aWVsLnZldHRlckBmZndsbC5jaD4KQ2M6IGxpbnV4LWFybS1tc21Admdlci5rZXJuZWwub3JnCkNj
OiBmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCi0tLQogZHJpdmVycy9ncHUvZHJtL21z
bS9kaXNwL2RwdTEvZHB1X3BsYW5lLmMgfCA4ICsrLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNt
L21zbV9hdG9taWMuYyAgICAgICAgICB8IDggKystLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vbXNtL2Rpc3AvZHB1MS9kcHVfcGxhbmUuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9k
cHUxL2RwdV9wbGFuZS5jCmluZGV4IDQ0YTcyZGE3MTQ4Mi4uY2MwOGY0MzY2YmRkIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfcGxhbmUuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfcGxhbmUuYwpAQCAtMTEsNiArMTEsNyBAQAog
I2luY2x1ZGUgPGxpbnV4L2RtYS1idWYuaD4KIAogI2luY2x1ZGUgPGRybS9kcm1fYXRvbWljX3Vh
cGkuaD4KKyNpbmNsdWRlIDxkcm0vZHJtX2dlbV9mcmFtZWJ1ZmZlcl9oZWxwZXIuaD4KIAogI2lu
Y2x1ZGUgIm1zbV9kcnYuaCIKICNpbmNsdWRlICJkcHVfa21zLmgiCkBAIC03NjMsOCArNzY0LDYg
QEAgc3RhdGljIGludCBkcHVfcGxhbmVfcHJlcGFyZV9mYihzdHJ1Y3QgZHJtX3BsYW5lICpwbGFu
ZSwKIAlzdHJ1Y3QgZHB1X3BsYW5lICpwZHB1ID0gdG9fZHB1X3BsYW5lKHBsYW5lKTsKIAlzdHJ1
Y3QgZHB1X3BsYW5lX3N0YXRlICpwc3RhdGUgPSB0b19kcHVfcGxhbmVfc3RhdGUobmV3X3N0YXRl
KTsKIAlzdHJ1Y3QgZHB1X2h3X2ZtdF9sYXlvdXQgbGF5b3V0OwotCXN0cnVjdCBkcm1fZ2VtX29i
amVjdCAqb2JqOwotCXN0cnVjdCBkbWFfZmVuY2UgKmZlbmNlOwogCXN0cnVjdCBkcHVfa21zICpr
bXMgPSBfZHB1X3BsYW5lX2dldF9rbXMoJnBkcHUtPmJhc2UpOwogCWludCByZXQ7CiAKQEAgLTc4
MSwxMCArNzgwLDcgQEAgc3RhdGljIGludCBkcHVfcGxhbmVfcHJlcGFyZV9mYihzdHJ1Y3QgZHJt
X3BsYW5lICpwbGFuZSwKIAkgKiAgICAgICB3ZSBjYW4gdXNlIG1zbV9hdG9taWNfcHJlcGFyZV9m
YigpIGluc3RlYWQgb2YgZG9pbmcgdGhlCiAJICogICAgICAgaW1wbGljaXQgZmVuY2UgYW5kIGZi
IHByZXBhcmUgYnkgaGFuZCBoZXJlLgogCSAqLwotCW9iaiA9IG1zbV9mcmFtZWJ1ZmZlcl9ibyhu
ZXdfc3RhdGUtPmZiLCAwKTsKLQlmZW5jZSA9IHJlc2VydmF0aW9uX29iamVjdF9nZXRfZXhjbF9y
Y3Uob2JqLT5yZXN2KTsKLQlpZiAoZmVuY2UpCi0JCWRybV9hdG9taWNfc2V0X2ZlbmNlX2Zvcl9w
bGFuZShuZXdfc3RhdGUsIGZlbmNlKTsKKwlkcm1fZ2VtX2ZiX3ByZXBhcmVfZmIocGxhbmUsIG5l
d19zdGF0ZSk7CiAKIAlpZiAocHN0YXRlLT5hc3BhY2UpIHsKIAkJcmV0ID0gbXNtX2ZyYW1lYnVm
ZmVyX3ByZXBhcmUobmV3X3N0YXRlLT5mYiwKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9t
c20vbXNtX2F0b21pYy5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fYXRvbWljLmMKaW5kZXgg
ZGQxNmJhYmRkOGMwLi4xNjlkNWY5MTVlNjggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9t
c20vbXNtX2F0b21pYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2F0b21pYy5jCkBA
IC01LDYgKzUsNyBAQAogICovCiAKICNpbmNsdWRlIDxkcm0vZHJtX2F0b21pY191YXBpLmg+Cisj
aW5jbHVkZSA8ZHJtL2RybV9nZW1fZnJhbWVidWZmZXJfaGVscGVyLmg+CiAKICNpbmNsdWRlICJt
c21fZHJ2LmgiCiAjaW5jbHVkZSAibXNtX2dlbS5oIgpAQCAtMzcsMTYgKzM4LDExIEBAIGludCBt
c21fYXRvbWljX3ByZXBhcmVfZmIoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCiB7CiAJc3RydWN0
IG1zbV9kcm1fcHJpdmF0ZSAqcHJpdiA9IHBsYW5lLT5kZXYtPmRldl9wcml2YXRlOwogCXN0cnVj
dCBtc21fa21zICprbXMgPSBwcml2LT5rbXM7Ci0Jc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmo7
Ci0Jc3RydWN0IGRtYV9mZW5jZSAqZmVuY2U7CiAKIAlpZiAoIW5ld19zdGF0ZS0+ZmIpCiAJCXJl
dHVybiAwOwogCi0Jb2JqID0gbXNtX2ZyYW1lYnVmZmVyX2JvKG5ld19zdGF0ZS0+ZmIsIDApOwot
CWZlbmNlID0gcmVzZXJ2YXRpb25fb2JqZWN0X2dldF9leGNsX3JjdShvYmotPnJlc3YpOwotCi0J
ZHJtX2F0b21pY19zZXRfZmVuY2VfZm9yX3BsYW5lKG5ld19zdGF0ZSwgZmVuY2UpOworCWRybV9n
ZW1fZmJfcHJlcGFyZV9mYihwbGFuZSwgbmV3X3N0YXRlKTsKIAogCXJldHVybiBtc21fZnJhbWVi
dWZmZXJfcHJlcGFyZShuZXdfc3RhdGUtPmZiLCBrbXMtPmFzcGFjZSk7CiB9Ci0tIAoyLjIwLjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
