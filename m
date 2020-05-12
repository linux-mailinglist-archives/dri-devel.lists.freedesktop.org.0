Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 422861CF025
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 11:00:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03E836E8A2;
	Tue, 12 May 2020 09:00:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8770A6E8B8
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 09:00:14 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id y24so22394847wma.4
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 02:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u5gM1ohPbNVORxsODI5ngB8Z3LljD1/NzUrdRFpQw6k=;
 b=eo6XCFnGqS3UTbV+XFLkZTkDoh8UHvgOyRRDESLFJ7MP+5Cj3/IxjzAl127GN5O9rY
 VXDXGt6n7g7rCnvzywPZOWCjrMfNywQXd3+W+fn3un22WolNWV/n9WI+YAZlftq1Ve6F
 gC89CnJ6agJOr1dSjp+3V/HsmrsJiwJEQFsVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u5gM1ohPbNVORxsODI5ngB8Z3LljD1/NzUrdRFpQw6k=;
 b=IK2An+7bU3SpyM1w36xyijs9/maI5luxuh3nvIOch/B3c8pqis27mKuo8HWfMvZp4O
 Gf4CowtRlAgQQ2xkrU8p24wffiRvIFmbaqGl8NnaM0MsXzh7QVFcfGAN6JHY0xXokkRk
 xoCH0rjWP+ysdztW73HgJlKhZ5kmov5uOwzKWz9SUtJ4aUUiy788tIZeYKcgDx4jPjdh
 S76zWKspnC8TItXkVGCTi284n49kb7t3tJsBhb0S0IM+/cld5P3CEiD+U0/ToICijSOy
 rgKtwWJDForOQWYHR+VzWvB1hSBtgKUplN78I6ayEnxD3jQ/kFO+u3fT1owAarSnf2AB
 N1FA==
X-Gm-Message-State: AGi0PuYW/Ei4HqZhV6sEg1IFSQCd3fLQ/X4uFXidDnTz3/DvGdP0SSvX
 YCDfV8I72NOPiBifXDDRvwPThdcLnI0=
X-Google-Smtp-Source: APiQypLTNXsQ8HlHPlHfp2Mll6IbSc871xkl7AkjDoENjAiQEoiFF4u2nMFQth6vdD3XxA2bFR9BoQ==
X-Received: by 2002:a1c:9e52:: with SMTP id h79mr35953921wme.84.1589274012210; 
 Tue, 12 May 2020 02:00:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y10sm18845457wrd.95.2020.05.12.02.00.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 02:00:11 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [RFC 14/17] drm/amdgpu: use dma-fence annotations for gpu reset code
Date: Tue, 12 May 2020 10:59:41 +0200
Message-Id: <20200512085944.222637-15-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512085944.222637-1-daniel.vetter@ffwll.ch>
References: <20200512085944.222637-1-daniel.vetter@ffwll.ch>
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
Cc: linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 linaro-mm-sig@lists.linaro.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VG8gaW1wcm92ZSBjb3ZlcmFnZSBhbHNvIGFubm90YXRlIHRoZSBncHUgcmVzZXQgY29kZSBpdHNl
bGYsIHNpbmNlCnRoYXQncyBjYWxsZWQgZnJvbSBvdGhlciBwbGFjZXMgdGhhbiBkcm0vc2NoZWR1
bGVyICh3aGljaCBpcyBhbHJlYWR5CmFubm90YXRlZCkuIEFubm90YXRpb25zIG5lc3RzLCBzbyB0
aGlzIGRvZXNuJ3QgYnJlYWsgYW55dGhpbmcsIGFuZAphbGxvd3MgZWFzaWVyIHRlc3RpbmcuCgpD
YzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCkNjOiBsaW5hcm8tbW0tc2lnQGxpc3RzLmxp
bmFyby5vcmcKQ2M6IGxpbnV4LXJkbWFAdmdlci5rZXJuZWwub3JnCkNjOiBhbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpDYzogaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzog
Q2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CkNjOiBNYWFydGVuIExhbmto
b3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgpDYzogQ2hyaXN0aWFuIEvD
tm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9kZXZpY2UuYyB8IDEwICsrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA5IGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZGV2aWNlLmMKaW5kZXggYjAzOGRkYmIyZWNlLi41NTYwZDA0NWIyZTAgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKQEAgLTQxNDAsNiArNDE0MCw5
IEBAIGludCBhbWRncHVfZGV2aWNlX2dwdV9yZWNvdmVyKHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2LAogCWJvb2wgdXNlX2JhY28gPQogCQkoYW1kZ3B1X2FzaWNfcmVzZXRfbWV0aG9kKGFkZXYp
ID09IEFNRF9SRVNFVF9NRVRIT0RfQkFDTykgPwogCQl0cnVlIDogZmFsc2U7CisJYm9vbCBmZW5j
ZV9jb29raWU7CisKKwlmZW5jZV9jb29raWUgPSBkbWFfZmVuY2VfYmVnaW5fc2lnbmFsbGluZygp
OwogCiAJLyoKIAkgKiBGbHVzaCBSQU0gdG8gZGlzayBzbyB0aGF0IGFmdGVyIHJlYm9vdApAQCAt
NDE2OCw2ICs0MTcxLDcgQEAgaW50IGFtZGdwdV9kZXZpY2VfZ3B1X3JlY292ZXIoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYsCiAJCURSTV9JTkZPKCJCYWlsaW5nIG9uIFREUiBmb3Igc19qb2I6
JWxseCwgaGl2ZTogJWxseCBhcyBhbm90aGVyIGFscmVhZHkgaW4gcHJvZ3Jlc3MiLAogCQkJICBq
b2IgPyBqb2ItPmJhc2UuaWQgOiAtMSwgaGl2ZS0+aGl2ZV9pZCk7CiAJCW11dGV4X3VubG9jaygm
aGl2ZS0+aGl2ZV9sb2NrKTsKKwkJZG1hX2ZlbmNlX2VuZF9zaWduYWxsaW5nKGZlbmNlX2Nvb2tp
ZSk7CiAJCXJldHVybiAwOwogCX0KIApAQCAtNDE3OCw4ICs0MTgyLDEwIEBAIGludCBhbWRncHVf
ZGV2aWNlX2dwdV9yZWNvdmVyKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCSAqLwogCUlO
SVRfTElTVF9IRUFEKCZkZXZpY2VfbGlzdCk7CiAJaWYgKGFkZXYtPmdtYy54Z21pLm51bV9waHlz
aWNhbF9ub2RlcyA+IDEpIHsKLQkJaWYgKCFoaXZlKQorCQlpZiAoIWhpdmUpIHsKKwkJCWRtYV9m
ZW5jZV9lbmRfc2lnbmFsbGluZyhmZW5jZV9jb29raWUpOwogCQkJcmV0dXJuIC1FTk9ERVY7CisJ
CX0KIAkJaWYgKCFsaXN0X2lzX2ZpcnN0KCZhZGV2LT5nbWMueGdtaS5oZWFkLCAmaGl2ZS0+ZGV2
aWNlX2xpc3QpKQogCQkJbGlzdF9yb3RhdGVfdG9fZnJvbnQoJmFkZXYtPmdtYy54Z21pLmhlYWQs
ICZoaXZlLT5kZXZpY2VfbGlzdCk7CiAJCWRldmljZV9saXN0X2hhbmRsZSA9ICZoaXZlLT5kZXZp
Y2VfbGlzdDsKQEAgLTQxOTQsNiArNDIwMCw3IEBAIGludCBhbWRncHVfZGV2aWNlX2dwdV9yZWNv
dmVyKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCQkJRFJNX0lORk8oIkJhaWxpbmcgb24g
VERSIGZvciBzX2pvYjolbGx4LCBhcyBhbm90aGVyIGFscmVhZHkgaW4gcHJvZ3Jlc3MiLAogCQkJ
CSAgam9iID8gam9iLT5iYXNlLmlkIDogLTEpOwogCQkJbXV0ZXhfdW5sb2NrKCZoaXZlLT5oaXZl
X2xvY2spOworCQkJZG1hX2ZlbmNlX2VuZF9zaWduYWxsaW5nKGZlbmNlX2Nvb2tpZSk7CiAJCQly
ZXR1cm4gMDsKIAkJfQogCkBAIC00MzE5LDYgKzQzMjYsNyBAQCBpbnQgYW1kZ3B1X2RldmljZV9n
cHVfcmVjb3ZlcihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAogCWlmIChyKQogCQlkZXZf
aW5mbyhhZGV2LT5kZXYsICJHUFUgcmVzZXQgZW5kIHdpdGggcmV0ID0gJWRcbiIsIHIpOworCWRt
YV9mZW5jZV9lbmRfc2lnbmFsbGluZyhmZW5jZV9jb29raWUpOwogCXJldHVybiByOwogfQogCi0t
IAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
