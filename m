Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11255100283
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 11:36:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DE1289FA6;
	Mon, 18 Nov 2019 10:35:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C79DD89FA5
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 10:35:47 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id l7so18778955wrp.6
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 02:35:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YpxWMRcpbAZ8vRO0hhGeBAkizcjjb+EwGPq78LSGoIc=;
 b=pC0APSKgeSI8kjvP4MMiLrRPPajGN73LX12x2+W2slSAHNpGRsSbMg8jVLhzaau1ir
 /0BrnxlI6YDIY5a1fUBiwrWK38+lOPGWpdBXWV4gEk7dt0uY4urr55tZ8O+6k6wcVSwD
 1pDAyKaTpZ6n6BkvxD+wcLuocPQoQOJjbQsvPaWw/BxsSU6ShvN5QOXMCTGIEb7Qj3GC
 q9V63B5jea9oCHqR3D9sTDNFE3eDhPT64BgiIQa5jHyoLrr+3iPCPNwcAGtDyLdswoOU
 gaQBzhNuN12hPgQUZjICKtgpLjj/n9ZK/5drt7MLVH+K6nukhB4hbf0Ph5ZsaFXAFRhv
 kMig==
X-Gm-Message-State: APjAAAVtS4MUaPJ9kKLE37Pme+Kw7Jeo8nuWKjKpeADVuw8hT+ZfhA/S
 aUhSWNM18gwhz61QRhjA5KuRi/93bpw=
X-Google-Smtp-Source: APXvYqyOGusOciBfG2OBXh6PKwLGp9NKfOVa9T1VHeuE1aaABFM0YzolACCslDVyf3lAWPh08o1InA==
X-Received: by 2002:a5d:670a:: with SMTP id o10mr20215754wru.312.1574073346158; 
 Mon, 18 Nov 2019 02:35:46 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id j2sm22749200wrt.61.2019.11.18.02.35.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 02:35:45 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 02/15] drm/tegra: Delete host1x_bo_ops->k(un)map
Date: Mon, 18 Nov 2019 11:35:23 +0100
Message-Id: <20191118103536.17675-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
References: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YpxWMRcpbAZ8vRO0hhGeBAkizcjjb+EwGPq78LSGoIc=;
 b=JjYHPvN4fgfI7MF2pubeKuD+GYtD7BlbPRDIfYCkJ91CYZjGSX/+8DgwlDnPfkaXue
 6rRUxbjmyP4SYql5CzSTzlnPpS+reeUlWHSv1S63Wr5WTyDtWwKjPYLsOnGa8riu29zV
 4M8YnhhCfzJBXW7beNGhAMpJ2dNrzaWuwdBck=
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
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXQgZG9lc24ndCBoYXZlIGFueSBjYWxsZXJzIGFueW1vcmUuCgpBc2lkZTogVGhlIC0+bW1hcC9t
dW5tYXAgaG9va3MgaGF2ZSBhIGJpdCBhIGNvbmZ1c2luZyBuYW1lLCB0aGV5IGRvbid0CmRvIHVz
ZXJzcGFjZSBtbWFwcywgYnV0IGEga2VybmVsIHZtYXAuIEkgdGhpbmsgbW9zdCBwbGFjZXMgdXNl
IHZtYXAKZm9yIHRoaXMsIGV4Y2VwdCB0dG0sIHdoaWNoIHVzZXMga21hcCBmb3Igdm1hcCBmb3Ig
YWRkZWQgY29uZnVzaW9uLgptbWFwIHNlZW1zIGVudGlyZWx5IGZvciB1c2Vyc3BhY2UgbWFwcGlu
Z3Mgc2V0IHVwIHRocm91Z2ggbW1hcCgyKQpzeXNjYWxsLgoKU2lnbmVkLW9mZi1ieTogRGFuaWVs
IFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBUaGllcnJ5IFJlZGluZyA8dGhp
ZXJyeS5yZWRpbmdAZ21haWwuY29tPgpDYzogSm9uYXRoYW4gSHVudGVyIDxqb25hdGhhbmhAbnZp
ZGlhLmNvbT4KQ2M6IGxpbnV4LXRlZ3JhQHZnZXIua2VybmVsLm9yZwotLS0KIGRyaXZlcnMvZ3B1
L2RybS90ZWdyYS9nZW0uYyB8IDI4IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIGluY2x1
ZGUvbGludXgvaG9zdDF4LmggICAgICB8IDEzIC0tLS0tLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdl
ZCwgNDEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2dl
bS5jIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2dlbS5jCmluZGV4IDc0NmRhZTMyYzQ4NC4uNjYy
Y2I3Yzg3ZWY1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZ2VtLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2dlbS5jCkBAIC0xMDMsMzIgKzEwMyw2IEBAIHN0YXRpYyB2
b2lkIHRlZ3JhX2JvX211bm1hcChzdHJ1Y3QgaG9zdDF4X2JvICpibywgdm9pZCAqYWRkcikKIAkJ
dnVubWFwKGFkZHIpOwogfQogCi1zdGF0aWMgdm9pZCAqdGVncmFfYm9fa21hcChzdHJ1Y3QgaG9z
dDF4X2JvICpibywgdW5zaWduZWQgaW50IHBhZ2UpCi17Ci0Jc3RydWN0IHRlZ3JhX2JvICpvYmog
PSBob3N0MXhfdG9fdGVncmFfYm8oYm8pOwotCi0JaWYgKG9iai0+dmFkZHIpCi0JCXJldHVybiBv
YmotPnZhZGRyICsgcGFnZSAqIFBBR0VfU0laRTsKLQllbHNlIGlmIChvYmotPmdlbS5pbXBvcnRf
YXR0YWNoKQotCQlyZXR1cm4gZG1hX2J1Zl9rbWFwKG9iai0+Z2VtLmltcG9ydF9hdHRhY2gtPmRt
YWJ1ZiwgcGFnZSk7Ci0JZWxzZQotCQlyZXR1cm4gdm1hcChvYmotPnBhZ2VzICsgcGFnZSwgMSwg
Vk1fTUFQLAotCQkJICAgIHBncHJvdF93cml0ZWNvbWJpbmUoUEFHRV9LRVJORUwpKTsKLX0KLQot
c3RhdGljIHZvaWQgdGVncmFfYm9fa3VubWFwKHN0cnVjdCBob3N0MXhfYm8gKmJvLCB1bnNpZ25l
ZCBpbnQgcGFnZSwKLQkJCSAgICB2b2lkICphZGRyKQotewotCXN0cnVjdCB0ZWdyYV9ibyAqb2Jq
ID0gaG9zdDF4X3RvX3RlZ3JhX2JvKGJvKTsKLQotCWlmIChvYmotPnZhZGRyKQotCQlyZXR1cm47
Ci0JZWxzZSBpZiAob2JqLT5nZW0uaW1wb3J0X2F0dGFjaCkKLQkJZG1hX2J1Zl9rdW5tYXAob2Jq
LT5nZW0uaW1wb3J0X2F0dGFjaC0+ZG1hYnVmLCBwYWdlLCBhZGRyKTsKLQllbHNlCi0JCXZ1bm1h
cChhZGRyKTsKLX0KLQogc3RhdGljIHN0cnVjdCBob3N0MXhfYm8gKnRlZ3JhX2JvX2dldChzdHJ1
Y3QgaG9zdDF4X2JvICpibykKIHsKIAlzdHJ1Y3QgdGVncmFfYm8gKm9iaiA9IGhvc3QxeF90b190
ZWdyYV9ibyhibyk7CkBAIC0xNDUsOCArMTE5LDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBob3N0
MXhfYm9fb3BzIHRlZ3JhX2JvX29wcyA9IHsKIAkudW5waW4gPSB0ZWdyYV9ib191bnBpbiwKIAku
bW1hcCA9IHRlZ3JhX2JvX21tYXAsCiAJLm11bm1hcCA9IHRlZ3JhX2JvX211bm1hcCwKLQkua21h
cCA9IHRlZ3JhX2JvX2ttYXAsCi0JLmt1bm1hcCA9IHRlZ3JhX2JvX2t1bm1hcCwKIH07CiAKIHN0
YXRpYyBpbnQgdGVncmFfYm9faW9tbXVfbWFwKHN0cnVjdCB0ZWdyYV9kcm0gKnRlZ3JhLCBzdHJ1
Y3QgdGVncmFfYm8gKmJvKQpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9ob3N0MXguaCBiL2lu
Y2x1ZGUvbGludXgvaG9zdDF4LmgKaW5kZXggNmY4ZDc3MjU5MWJhLi42ZWRlYjkyMjhjNGUgMTAw
NjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvaG9zdDF4LmgKKysrIGIvaW5jbHVkZS9saW51eC9ob3N0
MXguaApAQCAtNzIsOCArNzIsNiBAQCBzdHJ1Y3QgaG9zdDF4X2JvX29wcyB7CiAJdm9pZCAoKnVu
cGluKShzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBzZ190YWJsZSAqc2d0KTsKIAl2b2lkICoo
Km1tYXApKHN0cnVjdCBob3N0MXhfYm8gKmJvKTsKIAl2b2lkICgqbXVubWFwKShzdHJ1Y3QgaG9z
dDF4X2JvICpibywgdm9pZCAqYWRkcik7Ci0Jdm9pZCAqKCprbWFwKShzdHJ1Y3QgaG9zdDF4X2Jv
ICpibywgdW5zaWduZWQgaW50IHBhZ2VudW0pOwotCXZvaWQgKCprdW5tYXApKHN0cnVjdCBob3N0
MXhfYm8gKmJvLCB1bnNpZ25lZCBpbnQgcGFnZW51bSwgdm9pZCAqYWRkcik7CiB9OwogCiBzdHJ1
Y3QgaG9zdDF4X2JvIHsKQEAgLTExOSwxNyArMTE3LDYgQEAgc3RhdGljIGlubGluZSB2b2lkIGhv
c3QxeF9ib19tdW5tYXAoc3RydWN0IGhvc3QxeF9ibyAqYm8sIHZvaWQgKmFkZHIpCiAJYm8tPm9w
cy0+bXVubWFwKGJvLCBhZGRyKTsKIH0KIAotc3RhdGljIGlubGluZSB2b2lkICpob3N0MXhfYm9f
a21hcChzdHJ1Y3QgaG9zdDF4X2JvICpibywgdW5zaWduZWQgaW50IHBhZ2VudW0pCi17Ci0JcmV0
dXJuIGJvLT5vcHMtPmttYXAoYm8sIHBhZ2VudW0pOwotfQotCi1zdGF0aWMgaW5saW5lIHZvaWQg
aG9zdDF4X2JvX2t1bm1hcChzdHJ1Y3QgaG9zdDF4X2JvICpibywKLQkJCQkgICAgdW5zaWduZWQg
aW50IHBhZ2VudW0sIHZvaWQgKmFkZHIpCi17Ci0JYm8tPm9wcy0+a3VubWFwKGJvLCBwYWdlbnVt
LCBhZGRyKTsKLX0KLQogLyoKICAqIGhvc3QxeCBzeW5jcG9pbnRzCiAgKi8KLS0gCjIuMjQuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
