Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD2F100289
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 11:36:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E66C6E083;
	Mon, 18 Nov 2019 10:35:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C2489FDE
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 10:35:52 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id f2so18786131wrs.11
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 02:35:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LJxEIZGHH8M3drJjaoOzPjkBzGIpJKPTjBWGtqQ4YAE=;
 b=SGURdmcZFE06+1E49xpBCTJJUwJ0pQITV4wxqGx98FynsjuaTK8lpnxg8hK88Fyc+P
 EVMwB+YN/IgqK8fr1Z2g2G9R/NqcYIifxTn4ASJWhLM9Th12ZeYh9Wx+NrKczYsqp8M9
 jMDmQLN/w7xuY0r72RLWPCwhekFKycrT/E73/YDli3ShebO2XoxEwZLUd+73rh5oiuzO
 oNvooIenR1ghKzRUvs+UI+RYAgkvzJhrhCpsz5t0qHPeYaCzO/tDR21HlbSNin/rlEPv
 cFcS8PO9tR2we1E2dKI9VjD6Keg4xGnEO2o93SKx2XJU+Lt1AzkPoK4Qjb7PerqdFJu8
 Mc2Q==
X-Gm-Message-State: APjAAAXYPuPt+94/rgU7DCQe1FNnhpVfKoHbovWLu9mXY79N9wgWlZdq
 +oOtGCRsxzU+sLXBdeSmjD8emfThpdQ=
X-Google-Smtp-Source: APXvYqzHJtGiZS/Lstzz2gIsBLR0N/5g/ik2uF3G5oFSfoo3hnghJYh8il4OYqw5bW/rdjVXPhiKGQ==
X-Received: by 2002:adf:f5c6:: with SMTP id k6mr28154611wrp.245.1574073350930; 
 Mon, 18 Nov 2019 02:35:50 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id j2sm22749200wrt.61.2019.11.18.02.35.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 02:35:50 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 06/15] drm/i915: Drop dma_buf->k(un)map
Date: Mon, 18 Nov 2019 11:35:27 +0100
Message-Id: <20191118103536.17675-7-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
References: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LJxEIZGHH8M3drJjaoOzPjkBzGIpJKPTjBWGtqQ4YAE=;
 b=iob00DFIp7F8+l0wsHW1V5nOi+O62T06QlHw9Xpx+o7641f9Hgv13W24BVFtFcje7O
 khpwjOaOjtdh+9qp+VDUJhyK5z6/muzt7V0zB+9809qRVs+S16Fjv+n8ZrTPrTObMwA9
 16T38k5Xz5HTAjGelKZehjfoDJ8INL4/EY7Ww=
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
Cc: Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm8gaW4tdHJlZSB1c2VycyBsZWZ0LgoKQXNpZGUsIEkgdGhpbmsgbW9ja19kbWFidWYgd291bGQg
YmUgYSBuaWNlIGFkZGl0aW9uIHRvIGRybQptb2NrL3NlbGZ0ZXN0IGhlbHBlcnMgKHdlIGhhdmUg
c29tZSBhbHJlYWR5KSwgd2l0aCBhbgpFWFBPUlRfU1lNQk9MX0ZPUl9URVNUU19PTkxZLgoKU2ln
bmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBD
aHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KQ2M6IE1hdHRoZXcgQXVsZCA8
bWF0dGhldy5hdWxkQGludGVsLmNvbT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJA
ZmZ3bGwuY2g+CkNjOiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPgpDYzogU2Ft
IFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVf
Z2VtX2RtYWJ1Zi5jICAgIHwgMzYgLS0tLS0tLS0tLS0tLS0tLS0tLQogLi4uL2dwdS9kcm0vaTkx
NS9nZW0vc2VsZnRlc3RzL21vY2tfZG1hYnVmLmMgIHwgMTYgLS0tLS0tLS0tCiAyIGZpbGVzIGNo
YW5nZWQsIDUyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2dlbS9pOTE1X2dlbV9kbWFidWYuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dl
bV9kbWFidWYuYwppbmRleCBlYWVhNDlkMDhlYjUuLjM3MmI1N2NhMGVmYyAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2RtYWJ1Zi5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9kbWFidWYuYwpAQCAtOTMsNDAgKzkzLDYgQEAgc3Rh
dGljIHZvaWQgaTkxNV9nZW1fZG1hYnVmX3Z1bm1hcChzdHJ1Y3QgZG1hX2J1ZiAqZG1hX2J1Ziwg
dm9pZCAqdmFkZHIpCiAJaTkxNV9nZW1fb2JqZWN0X3VucGluX21hcChvYmopOwogfQogCi1zdGF0
aWMgdm9pZCAqaTkxNV9nZW1fZG1hYnVmX2ttYXAoc3RydWN0IGRtYV9idWYgKmRtYV9idWYsIHVu
c2lnbmVkIGxvbmcgcGFnZV9udW0pCi17Ci0Jc3RydWN0IGRybV9pOTE1X2dlbV9vYmplY3QgKm9i
aiA9IGRtYV9idWZfdG9fb2JqKGRtYV9idWYpOwotCXN0cnVjdCBwYWdlICpwYWdlOwotCi0JaWYg
KHBhZ2VfbnVtID49IG9iai0+YmFzZS5zaXplID4+IFBBR0VfU0hJRlQpCi0JCXJldHVybiBOVUxM
OwotCi0JaWYgKCFpOTE1X2dlbV9vYmplY3RfaGFzX3N0cnVjdF9wYWdlKG9iaikpCi0JCXJldHVy
biBOVUxMOwotCi0JaWYgKGk5MTVfZ2VtX29iamVjdF9waW5fcGFnZXMob2JqKSkKLQkJcmV0dXJu
IE5VTEw7Ci0KLQkvKiBTeW5jaHJvbmlzYXRpb24gaXMgbGVmdCB0byB0aGUgY2FsbGVyICh2aWEg
LmJlZ2luX2NwdV9hY2Nlc3MoKSkgKi8KLQlwYWdlID0gaTkxNV9nZW1fb2JqZWN0X2dldF9wYWdl
KG9iaiwgcGFnZV9udW0pOwotCWlmIChJU19FUlIocGFnZSkpCi0JCWdvdG8gZXJyX3VucGluOwot
Ci0JcmV0dXJuIGttYXAocGFnZSk7Ci0KLWVycl91bnBpbjoKLQlpOTE1X2dlbV9vYmplY3RfdW5w
aW5fcGFnZXMob2JqKTsKLQlyZXR1cm4gTlVMTDsKLX0KLQotc3RhdGljIHZvaWQgaTkxNV9nZW1f
ZG1hYnVmX2t1bm1hcChzdHJ1Y3QgZG1hX2J1ZiAqZG1hX2J1ZiwgdW5zaWduZWQgbG9uZyBwYWdl
X251bSwgdm9pZCAqYWRkcikKLXsKLQlzdHJ1Y3QgZHJtX2k5MTVfZ2VtX29iamVjdCAqb2JqID0g
ZG1hX2J1Zl90b19vYmooZG1hX2J1Zik7Ci0KLQlrdW5tYXAodmlydF90b19wYWdlKGFkZHIpKTsK
LQlpOTE1X2dlbV9vYmplY3RfdW5waW5fcGFnZXMob2JqKTsKLX0KLQogc3RhdGljIGludCBpOTE1
X2dlbV9kbWFidWZfbW1hcChzdHJ1Y3QgZG1hX2J1ZiAqZG1hX2J1Ziwgc3RydWN0IHZtX2FyZWFf
c3RydWN0ICp2bWEpCiB7CiAJc3RydWN0IGRybV9pOTE1X2dlbV9vYmplY3QgKm9iaiA9IGRtYV9i
dWZfdG9fb2JqKGRtYV9idWYpOwpAQCAtMTk1LDggKzE2MSw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgZG1hX2J1Zl9vcHMgaTkxNV9kbWFidWZfb3BzID0gIHsKIAkubWFwX2RtYV9idWYgPSBpOTE1
X2dlbV9tYXBfZG1hX2J1ZiwKIAkudW5tYXBfZG1hX2J1ZiA9IGk5MTVfZ2VtX3VubWFwX2RtYV9i
dWYsCiAJLnJlbGVhc2UgPSBkcm1fZ2VtX2RtYWJ1Zl9yZWxlYXNlLAotCS5tYXAgPSBpOTE1X2dl
bV9kbWFidWZfa21hcCwKLQkudW5tYXAgPSBpOTE1X2dlbV9kbWFidWZfa3VubWFwLAogCS5tbWFw
ID0gaTkxNV9nZW1fZG1hYnVmX21tYXAsCiAJLnZtYXAgPSBpOTE1X2dlbV9kbWFidWZfdm1hcCwK
IAkudnVubWFwID0gaTkxNV9nZW1fZG1hYnVmX3Z1bm1hcCwKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2dlbS9zZWxmdGVzdHMvbW9ja19kbWFidWYuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2dlbS9zZWxmdGVzdHMvbW9ja19kbWFidWYuYwppbmRleCBiOWUwNTlkNDMyOGEuLjky
NzJiZWY1NzA5MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL3NlbGZ0ZXN0
cy9tb2NrX2RtYWJ1Zi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9zZWxmdGVzdHMv
bW9ja19kbWFidWYuYwpAQCAtNzYsMjAgKzc2LDYgQEAgc3RhdGljIHZvaWQgbW9ja19kbWFidWZf
dnVubWFwKHN0cnVjdCBkbWFfYnVmICpkbWFfYnVmLCB2b2lkICp2YWRkcikKIAl2bV91bm1hcF9y
YW0odmFkZHIsIG1vY2stPm5wYWdlcyk7CiB9CiAKLXN0YXRpYyB2b2lkICptb2NrX2RtYWJ1Zl9r
bWFwKHN0cnVjdCBkbWFfYnVmICpkbWFfYnVmLCB1bnNpZ25lZCBsb25nIHBhZ2VfbnVtKQotewot
CXN0cnVjdCBtb2NrX2RtYWJ1ZiAqbW9jayA9IHRvX21vY2soZG1hX2J1Zik7Ci0KLQlyZXR1cm4g
a21hcChtb2NrLT5wYWdlc1twYWdlX251bV0pOwotfQotCi1zdGF0aWMgdm9pZCBtb2NrX2RtYWJ1
Zl9rdW5tYXAoc3RydWN0IGRtYV9idWYgKmRtYV9idWYsIHVuc2lnbmVkIGxvbmcgcGFnZV9udW0s
IHZvaWQgKmFkZHIpCi17Ci0Jc3RydWN0IG1vY2tfZG1hYnVmICptb2NrID0gdG9fbW9jayhkbWFf
YnVmKTsKLQotCXJldHVybiBrdW5tYXAobW9jay0+cGFnZXNbcGFnZV9udW1dKTsKLX0KLQogc3Rh
dGljIGludCBtb2NrX2RtYWJ1Zl9tbWFwKHN0cnVjdCBkbWFfYnVmICpkbWFfYnVmLCBzdHJ1Y3Qg
dm1fYXJlYV9zdHJ1Y3QgKnZtYSkKIHsKIAlyZXR1cm4gLUVOT0RFVjsKQEAgLTk5LDggKzg1LDYg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkbWFfYnVmX29wcyBtb2NrX2RtYWJ1Zl9vcHMgPSAgewog
CS5tYXBfZG1hX2J1ZiA9IG1vY2tfbWFwX2RtYV9idWYsCiAJLnVubWFwX2RtYV9idWYgPSBtb2Nr
X3VubWFwX2RtYV9idWYsCiAJLnJlbGVhc2UgPSBtb2NrX2RtYWJ1Zl9yZWxlYXNlLAotCS5tYXAg
PSBtb2NrX2RtYWJ1Zl9rbWFwLAotCS51bm1hcCA9IG1vY2tfZG1hYnVmX2t1bm1hcCwKIAkubW1h
cCA9IG1vY2tfZG1hYnVmX21tYXAsCiAJLnZtYXAgPSBtb2NrX2RtYWJ1Zl92bWFwLAogCS52dW5t
YXAgPSBtb2NrX2RtYWJ1Zl92dW5tYXAsCi0tIAoyLjI0LjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
