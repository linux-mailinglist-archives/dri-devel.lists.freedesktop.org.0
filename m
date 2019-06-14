Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9284D46A08
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 22:36:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AF1689337;
	Fri, 14 Jun 2019 20:36:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38A1E8932B
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 20:36:27 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id z25so5218973edq.9
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 13:36:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+s/xCHkIBaaa/efA9oI0iqK/HYOCsMR77Rs++MSH6us=;
 b=qNzG1YDDxbJLva0OHlbvZm1LBIBBJVMtlJvNOB3EBCSkkJGFYDHpH6LyaMlDGaS7V3
 vDJmIHC0NacnaXZPak26rMjWe7o/txFiKxNLEv+hr/EWCrIJx0BqkJ4+9WdS79OYsIQ/
 hw1XiokHjw7WX53GXB7MtJyMha6Oy2Y1XOb7hCVIpRCtDaufSNgzL+lf0TgQcr3j47+8
 n/d6q3+sjB4L9rRF8t7CrsPv0AlqOpiyPd0i12OeshdLlKILeOeL+58sp/kbk6CAPHTY
 P1s2m3rft9qacZFyboIMGfj+C5MobOnN35PmWWOPtFZyXMZOzEWRyX06XKZwCsZYkW/G
 csBQ==
X-Gm-Message-State: APjAAAVc2Seq1+GGnHHyjOY+hKmiPnT0u/YMIXOzznyS0LGLCrNPh/i5
 Cg709TbUQUURMgwKW7tQeeAh5PV5U1Q=
X-Google-Smtp-Source: APXvYqwH30ISnSIvOufNBuZsGAcrrjY89X9Gtls+pQmCi5pEqbB61IBYfKdyGzRD/b6YxXe/DHzSXw==
X-Received: by 2002:a05:6402:712:: with SMTP id
 w18mr15841558edx.201.1560544585392; 
 Fri, 14 Jun 2019 13:36:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id n15sm1166672edd.49.2019.06.14.13.36.24
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 13:36:24 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 04/59] drm/prime: Unconditionally set up the prime file private
Date: Fri, 14 Jun 2019 22:35:20 +0200
Message-Id: <20190614203615.12639-5-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+s/xCHkIBaaa/efA9oI0iqK/HYOCsMR77Rs++MSH6us=;
 b=ZjWQoV7m/l0XrJ+XWcQFTUIZ665q8kEoIGaqqtSHXwQ0x5tCGJSYAUxDpVacy75EFG
 1A0EXqVxIvH7/xtZaD/plTCAJob/mEDsOEfd9doMt9TeJiNa12n8QkF23k+f1x8k2Ns+
 Y6PfYa6bITC6ZkbZIoM/Gs+aAU/73wCLaYdOo=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXQncyB0aW55LCBhbHJlYWR5IGVtYmVkZGVkLCBhbmQgc2V0dXAvdGVhcmRvd24gY29zdCBpcyB0
cml2aWFsLgoKU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRl
bC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9maWxlLmMgfCA5ICsrKy0tLS0tLQogZHJp
dmVycy9ncHUvZHJtL2RybV9nZW0uYyAgfCAzICstLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9maWxlLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZpbGUuYwppbmRleCA3NTRhZjI1ZmUyNTUu
LmVhMzRiYzk5MTg1OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9maWxlLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9maWxlLmMKQEAgLTE0Nyw4ICsxNDcsNyBAQCBzdHJ1Y3Qg
ZHJtX2ZpbGUgKmRybV9maWxlX2FsbG9jKHN0cnVjdCBkcm1fbWlub3IgKm1pbm9yKQogCWlmIChk
cm1fY29yZV9jaGVja19mZWF0dXJlKGRldiwgRFJJVkVSX1NZTkNPQkopKQogCQlkcm1fc3luY29i
al9vcGVuKGZpbGUpOwogCi0JaWYgKGRybV9jb3JlX2NoZWNrX2ZlYXR1cmUoZGV2LCBEUklWRVJf
UFJJTUUpKQotCQlkcm1fcHJpbWVfaW5pdF9maWxlX3ByaXZhdGUoJmZpbGUtPnByaW1lKTsKKwlk
cm1fcHJpbWVfaW5pdF9maWxlX3ByaXZhdGUoJmZpbGUtPnByaW1lKTsKIAogCWlmIChkZXYtPmRy
aXZlci0+b3BlbikgewogCQlyZXQgPSBkZXYtPmRyaXZlci0+b3BlbihkZXYsIGZpbGUpOwpAQCAt
MTU5LDggKzE1OCw3IEBAIHN0cnVjdCBkcm1fZmlsZSAqZHJtX2ZpbGVfYWxsb2Moc3RydWN0IGRy
bV9taW5vciAqbWlub3IpCiAJcmV0dXJuIGZpbGU7CiAKIG91dF9wcmltZV9kZXN0cm95OgotCWlm
IChkcm1fY29yZV9jaGVja19mZWF0dXJlKGRldiwgRFJJVkVSX1BSSU1FKSkKLQkJZHJtX3ByaW1l
X2Rlc3Ryb3lfZmlsZV9wcml2YXRlKCZmaWxlLT5wcmltZSk7CisJZHJtX3ByaW1lX2Rlc3Ryb3lf
ZmlsZV9wcml2YXRlKCZmaWxlLT5wcmltZSk7CiAJaWYgKGRybV9jb3JlX2NoZWNrX2ZlYXR1cmUo
ZGV2LCBEUklWRVJfU1lOQ09CSikpCiAJCWRybV9zeW5jb2JqX3JlbGVhc2UoZmlsZSk7CiAJaWYg
KGRybV9jb3JlX2NoZWNrX2ZlYXR1cmUoZGV2LCBEUklWRVJfR0VNKSkKQEAgLTI1Myw4ICsyNTEs
NyBAQCB2b2lkIGRybV9maWxlX2ZyZWUoc3RydWN0IGRybV9maWxlICpmaWxlKQogCWlmIChkZXYt
PmRyaXZlci0+cG9zdGNsb3NlKQogCQlkZXYtPmRyaXZlci0+cG9zdGNsb3NlKGRldiwgZmlsZSk7
CiAKLQlpZiAoZHJtX2NvcmVfY2hlY2tfZmVhdHVyZShkZXYsIERSSVZFUl9QUklNRSkpCi0JCWRy
bV9wcmltZV9kZXN0cm95X2ZpbGVfcHJpdmF0ZSgmZmlsZS0+cHJpbWUpOworCWRybV9wcmltZV9k
ZXN0cm95X2ZpbGVfcHJpdmF0ZSgmZmlsZS0+cHJpbWUpOwogCiAJV0FSTl9PTighbGlzdF9lbXB0
eSgmZmlsZS0+ZXZlbnRfbGlzdCkpOwogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYwppbmRleCBhOGM0NDY4ZjAzZDkuLmU2
YzEyYzZlYzcyOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2dlbS5jCkBAIC0yNTQsOCArMjU0LDcgQEAgZHJtX2dlbV9vYmpl
Y3RfcmVsZWFzZV9oYW5kbGUoaW50IGlkLCB2b2lkICpwdHIsIHZvaWQgKmRhdGEpCiAJZWxzZSBp
ZiAoZGV2LT5kcml2ZXItPmdlbV9jbG9zZV9vYmplY3QpCiAJCWRldi0+ZHJpdmVyLT5nZW1fY2xv
c2Vfb2JqZWN0KG9iaiwgZmlsZV9wcml2KTsKIAotCWlmIChkcm1fY29yZV9jaGVja19mZWF0dXJl
KGRldiwgRFJJVkVSX1BSSU1FKSkKLQkJZHJtX2dlbV9yZW1vdmVfcHJpbWVfaGFuZGxlcyhvYmos
IGZpbGVfcHJpdik7CisJZHJtX2dlbV9yZW1vdmVfcHJpbWVfaGFuZGxlcyhvYmosIGZpbGVfcHJp
dik7CiAJZHJtX3ZtYV9ub2RlX3Jldm9rZSgmb2JqLT52bWFfbm9kZSwgZmlsZV9wcml2KTsKIAog
CWRybV9nZW1fb2JqZWN0X2hhbmRsZV9wdXRfdW5sb2NrZWQob2JqKTsKLS0gCjIuMjAuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
