Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73194F979C
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 18:51:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28D8D6E219;
	Tue, 12 Nov 2019 17:51:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 401406E219
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 17:50:57 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id w9so12743709wrr.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 09:50:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wjc08cQ8DfPKqAVJ66PPF9CjaFQGNchiVtoePal1Ce0=;
 b=p7j6dB8qxlOF9b48riVZpAa6BLqFIi+gXE3A83lzF2wAabrX4DiCTnYZN7IxRZ1sWw
 oPDF0ZQkOIvb0lvFfsBPf/wWI2g1tfGNaamXP3M1KKUKZlbNdBrUXlOW12yy3PcOuZuC
 mvuc5Na2Ilxj8o6VeSMftHBZSuWLmZZWnQalSACW1gLvNs0EyfdzwlGRBObbyD6jeWqZ
 cG2y16rUNAF2dwVeKDpLCn8uE6cKdvS+p2qQri9lgesMsQgX41Wepjn5oNcbTV5+OP5L
 IkI/xLgWyGh0sr3j35pe2hiObwJRntsDx+8AowL0Qb/cf9XP7yMeyesOqA0hYNM16U3X
 +u3A==
X-Gm-Message-State: APjAAAWuTa1anFSW5oELUpEBV7Sc+vO2ksJ+7Fm/LHr5olxvUwcfMwwM
 e5QyXh4GbwjPu4EPUrXtsOqEpb0Mv8M=
X-Google-Smtp-Source: APXvYqyeZqt+ZgTjP3Ugu5/SixKU3Go4vXcIrYgw32gg1AGHdvFuLuMcuKexW6JJwtpQQVLTubO1dw==
X-Received: by 2002:adf:e68d:: with SMTP id r13mr28485832wrm.199.1573581055564; 
 Tue, 12 Nov 2019 09:50:55 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id d198sm5747051wmd.2.2019.11.12.09.50.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 09:50:54 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/fb-helper: refcount drm_device for generic support
Date: Tue, 12 Nov 2019 18:50:48 +0100
Message-Id: <20191112175048.1581-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191112175048.1581-1-daniel.vetter@ffwll.ch>
References: <20191112175048.1581-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wjc08cQ8DfPKqAVJ66PPF9CjaFQGNchiVtoePal1Ce0=;
 b=fND8VLTO29SgkX8RDz2898tWaCsOO7S7lpDnAPxPO+zMouXskppnY3ynHNeC28bEJo
 Xix8XK4vryZ4N105vsT212v96KV2CvLQuEo1EOO9G/yOKd2CYzt7DotqOozmzRCrkhes
 PXDtqCaKl6HC5AApGWW601ckbzoIP9rXagan0=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlcmUncyBhIHBpbGUgb2YgdGhpbmdzIHByb3RlY3RpbmcgYWdhaW5zdCByYWNpbmcgaG90dW5w
bHVnczoKLSBkcm1fZGV2X2VudGVyL2V4aXQgYWdhaW5zdCB0aGUgdW5kZXJseWluZyBkZXZpY2Ug
ZGlzYXBwZWFyaW5nCi0gZHJtX2Rldl9nZXQvcHV0IGFnYWluc3QgZHJtX2RldmljZSBkaXNhcHBl
YXJpbmcKLSB3ZSB1bnJlZ2lzdGVyIGV2ZXJ5dGhpbmcgaW4gZHJtX2Rldl91bnJlZ2lzdGVyIHRv
IHN0b3AgdXNlcnNwYWNlIGZyb20KICBjcmVhdGluZyBuZXcgb3BlbiBmaWxlcyB0byBhY2Nlc3Mg
dGhlIGRybV9kZXZpY2UKLSBmYmNvbiBnZXRzIHN5bmNocm9ub3VzbHkgdG9ybiBkb3duICh0aGUg
Y29uc29sZV9sb2NrIGlzIGh1Z2UsIHNvIHRoZXJlJ3MKICBhbiB1cHNpZGUgdG8gbW9ub2xpdGhp
YyBsb2NraW5nIGhlcmUpLgotIGFuZCBmb3IgZmJkZXYgdGhlcmUncyBnZXRfZmJfaW5mbyBhbmQg
cHV0X2ZiX2luZm8KCkFuZCBJIHRoaW5rIHdlJ3ZlIGFsbW9zdCBnb3QgdGhpcyByaWdodCwgZXhj
ZXB0IGZvciBhIHRpbnkgdGhpbmc6IEFuIGZiZGV2CmlvY3RsIG1pZ2h0IGhvbGQgYW4gZWxldmF0
ZSBmYl9pbmZvIHJlZmVyZW5jZSwgd2hpY2ggcHJldmVudHMgdXMgZnJvbQpkb2luZyB0aGUgZmlu
YWwgY2xlYW51cCBpbiBkcm1fZmJkZXZfcmVsZWFzZS4gQnV0IGl0IGRvZXNuJ3QgcHJldmVudAp0
aGUgZmluYWwgY2xlYW51cCBvZiBmYmhlbHBlci0+ZGV2LCB3aGljaCBtZWFucyBldmVuIGlmIHRo
ZSBkcml2ZXIgcHJvdGVjdHMKYWxsIGh3IGFjY2VzcyB3aXRoIGRybV9kZXZfZW50ZXIvZXhpdCwg
d2UgbWlnaHQgb29wcyB3YXkgYmVmb3JlIHRoYXQgd2hlbgp0cnlpbmcgdG8gYWNjZXNzIGZyZWVk
IG1lbW9yeS4KCkZpeCB0aGlzIGJ5IGhvbGRpbmcgYSBkcm1fZGV2aWNlIHJlZmVyZW5jZSBmb3Ig
ZmJkZXYsIHdoaWNoIHdlIGRyb3AgZnJvbQpkcm1fZmJkZXZfcmVsZWFzZS4KClRoaXMgbWlnaHQg
bGVhZCB0byBhIHJlZmVyZW5jZSBsb29wLCB3aGVyZSB0aGUgZHJtX2RldmljZSB3b24ndCBnZXQg
Y2xlYW5lZAp1cCBiZWNhdXNlIG9mIHRoZSBmYmRldiByZWZlcmVuY2UsIGFuZCBmYmRldiBpc24n
dCB0b3JuIGRvd24geWV0IGJlY2F1c2UKdGhlIGRybV9kZXZpY2UgY2xlYW51cCBjb2RlIGlzIHdy
aXR0ZW4gdGhlIHdyb25nIHdheSByb3VuZC4gQnV0IEkgdGhpbmsKYWxsIGRyaXZlcnMgdXNpbmcg
dGhlIGdlbmVyaWMgZmJkZXYgY29kZSBnZXQgdGhpcyByaWdodCAoYmVjYXVzZSB0aGV5IHVzZQpk
cm1fY2xpZW50LCBzbyByZWFsbHkgY2FuJ3QgZ2V0IGl0IHdyb25nKSwgaGVuY2UgdGhpcyBzaG91
bGQgYmUgb2suCgpBbHNvLCBtb3JlIHJlYXNvbnMgdG8gc3dpdGNoIGRyaXZlcnMgb3ZlciB0byBn
ZW5lcmljIGZiZGV2IHN1cHBvcnQuCgpTaW5jZSBJIGhhZCB0byByZS1yZXZpZXcgYSBwaWxlIG9m
IGNvZGUgYWxzbyBhZGQgYSBjb21tZW50IGFib3V0IHdoeQpkcm1fZmJkZXZfY2xpZW50X3VucmVn
aXN0ZXIgY2FuJ3QgcmFjZS4KCkNjOiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4K
Q2M6IE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMub3JnPgpDYzogVGhvbWFzIFppbW1l
cm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+ClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIg
PGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Ci0tCkVudGlyZWx5IHVudGVzdGVkIChhc2lkZSBmcm9t
IGl0IGNvbXBpbGVzKSwgYnV0IEkgdGhpbmsgd2UgbmVlZApzb21ldGhpbmcgbGlrZSB0aGlzIHRv
IGNvbXBsZXRlbHkgcGx1ZyBhbGwgZmJkZXYgcmVsYXRlZCBob3R1bnBsdWcKaXNzdWVzLiBObyBu
ZWVkIHRvIHJvbGwgb3V0IHNvbWUgZmFuY3kgc3JjdSBzY2hlbWUgdG8gZmJkZXYsIHRoaXMKc2Vl
bXMgdG8gYmUgc29sdmVkIHdpdGggcmVmY291bnRpbmcgYWxyZWFkeS4KLURhbmllbAotLS0KIGRy
aXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBl
ci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYwppbmRleCAwZWM5OGUwNDZiNTku
LjYyYTE5ODFkMzY5ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jCkBAIC0xOTkyLDYgKzE5OTIs
NyBAQCBzdGF0aWMgdm9pZCBkcm1fZmJkZXZfY2xlYW51cChzdHJ1Y3QgZHJtX2ZiX2hlbHBlciAq
ZmJfaGVscGVyKQogCiBzdGF0aWMgdm9pZCBkcm1fZmJkZXZfcmVsZWFzZShzdHJ1Y3QgZHJtX2Zi
X2hlbHBlciAqZmJfaGVscGVyKQogeworCWRybV9kZXZfcHV0KGZiX2hlbHBlci0+ZGV2KTsKIAlk
cm1fZmJkZXZfY2xlYW51cChmYl9oZWxwZXIpOwogCWRybV9jbGllbnRfcmVsZWFzZSgmZmJfaGVs
cGVyLT5jbGllbnQpOwogCWtmcmVlKGZiX2hlbHBlcik7CkBAIC0yMTIzLDYgKzIxMjQsNyBAQCBz
dGF0aWMgdm9pZCBkcm1fZmJkZXZfY2xpZW50X3VucmVnaXN0ZXIoc3RydWN0IGRybV9jbGllbnRf
ZGV2ICpjbGllbnQpCiB7CiAJc3RydWN0IGRybV9mYl9oZWxwZXIgKmZiX2hlbHBlciA9IGRybV9m
Yl9oZWxwZXJfZnJvbV9jbGllbnQoY2xpZW50KTsKIAorCS8qIFByb3RlY3RlZCBhZ2FpbnN0IHJh
Y2VzIGJ5IHRoZSBjbGllbnRsaXN0X211dGV4LiAqLwogCWlmIChmYl9oZWxwZXItPmZiZGV2KQog
CQkvKiBkcm1fZmJkZXZfZmJfZGVzdHJveSgpIHRha2VzIGNhcmUgb2YgY2xlYW51cCAqLwogCQlk
cm1fZmJfaGVscGVyX3VucmVnaXN0ZXJfZmJpKGZiX2hlbHBlcik7CkBAIC0yMjQzLDYgKzIyNDUs
OCBAQCBpbnQgZHJtX2ZiZGV2X2dlbmVyaWNfc2V0dXAoc3RydWN0IGRybV9kZXZpY2UgKmRldiwg
dW5zaWduZWQgaW50IHByZWZlcnJlZF9icHApCiAJCXByZWZlcnJlZF9icHAgPSAzMjsKIAlmYl9o
ZWxwZXItPnByZWZlcnJlZF9icHAgPSBwcmVmZXJyZWRfYnBwOwogCisJZHJtX2Rldl9nZXQoZGV2
KTsKKwogCXJldCA9IGRybV9mYmRldl9jbGllbnRfaG90cGx1ZygmZmJfaGVscGVyLT5jbGllbnQp
OwogCWlmIChyZXQpCiAJCURSTV9ERVZfREVCVUcoZGV2LT5kZXYsICJjbGllbnQgaG90cGx1ZyBy
ZXQ9JWRcbiIsIHJldCk7Ci0tIAoyLjI0LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
