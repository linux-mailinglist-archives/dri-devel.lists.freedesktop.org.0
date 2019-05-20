Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10572242F3
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 23:39:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 947D48919E;
	Mon, 20 May 2019 21:39:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A047089148
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 21:39:53 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id g57so25912704edc.12
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 14:39:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DucpRdkRgOoCBrOy6KiJUJJfWEr/7+ZCIIaJ4AvhfB0=;
 b=ZEsYg3FdMvIEeSLhEd8yXBaY52myPl7iINhNe4ozc+8+A4z902mUwXbZ/F/WaQVCGo
 A6e4ulEqrDOon3xPwOK+ZyxeVieg5wIDJ5TfWy7axiycfteTeWJJidhehO6W6qPtWmge
 OSWKqqiRxv1SD1mGf1+nLIcH/G26rx/7WmVpl4hnXHOt3Np60JBRNLKnkp++6dPyyJKr
 ifQcpPHLW2ctB9bA/sWS9cIy1k9x5c5qIJB9rpo7wwxE94cIoHQov2zJ7xapojJ92ewn
 zKUxIT2XT7f7kX4AnYGrH6W0sBv+XhP5SlTNh1W0TE2zGHJi3zQHRuqzZbMfdsecats6
 pPyA==
X-Gm-Message-State: APjAAAXmFCFpYCNGQknhl5DtdQmcvlw4nt1bPk36XcD6vtWb5n0ZC8FO
 P1vA3X8OxiMOi9UOKphTIaSD5cblyX0=
X-Google-Smtp-Source: APXvYqzzZ2kpVp8haHdbToY3y03B93IZ2fARLhOO1vyR6C1AaG3mgxQcALaUAvLZsqLVYAWfP3KDjg==
X-Received: by 2002:a50:b865:: with SMTP id k34mr79563563ede.16.1558388391895; 
 Mon, 20 May 2019 14:39:51 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id v27sm3285772eja.68.2019.05.20.14.39.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 May 2019 14:39:51 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/4] mm: Check if mmu notifier callbacks are allowed to fail
Date: Mon, 20 May 2019 23:39:42 +0200
Message-Id: <20190520213945.17046-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DucpRdkRgOoCBrOy6KiJUJJfWEr/7+ZCIIaJ4AvhfB0=;
 b=HKq8DuysKW6hx7l8Yig0NV9UpMzIOK98ALTyHYlWExOE6Pc4XsceN9CwZTMEZ+y6cw
 Cotb3dp0LmPi/TnfsGu9Mc8wGpsj9yCkmJXIekv1AWGWZdRazvo+2R7pulay1RKnKq5x
 V5EN38iDPb1UvcB2ERZ4RtefPoEDwb5qTXLcw=
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
Cc: Michal Hocko <mhocko@suse.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 David Rientjes <rientjes@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SnVzdCBhIGJpdCBvZiBwYXJhbm9pYSwgc2luY2UgaWYgd2Ugc3RhcnQgcHVzaGluZyB0aGlzIGRl
ZXAgaW50bwpjYWxsY2hhaW5zIGl0J3MgaGFyZCB0byBzcG90IGFsbCBwbGFjZXMgd2hlcmUgYW4g
bW11IG5vdGlmaWVyCmltcGxlbWVudGF0aW9uIG1pZ2h0IGZhaWwgd2hlbiBpdCdzIG5vdCBhbGxv
d2VkIHRvLgoKSW5zcGlyZWQgYnkgc29tZSBjb25mdXNpb24gd2UgaGFkIGRpc2N1c3NpbmcgaTkx
NSBtbXUgbm90aWZpZXJzIGFuZAp3aGV0aGVyIHdlIGNvdWxkIHVzZSB0aGUgbmV3bHktaW50cm9k
dWNlZCByZXR1cm4gdmFsdWUgdG8gaGFuZGxlIHNvbWUKY29ybmVyIGNhc2VzLiBVbnRpbCB3ZSBy
ZWFsaXplZCB0aGF0IHRoZXNlIGFyZSBvbmx5IGZvciB3aGVuIGEgdGFzawpoYXMgYmVlbiBraWxs
ZWQgYnkgdGhlIG9vbSByZWFwZXIuCgpBbiBhbHRlcm5hdGl2ZSBhcHByb2FjaCB3b3VsZCBiZSB0
byBzcGxpdCB0aGUgY2FsbGJhY2sgaW50byB0d28KdmVyc2lvbnMsIG9uZSB3aXRoIHRoZSBpbnQg
cmV0dXJuIHZhbHVlLCBhbmQgdGhlIG90aGVyIHdpdGggdm9pZApyZXR1cm4gdmFsdWUgbGlrZSBp
biBvbGRlciBrZXJuZWxzLiBCdXQgdGhhdCdzIGEgbG90IG1vcmUgY2h1cm4gZm9yCmZhaXJseSBs
aXR0bGUgZ2FpbiBJIHRoaW5rLgoKU3VtbWFyeSBmcm9tIHRoZSBtLWwgZGlzY3Vzc2lvbiBvbiB3
aHkgd2Ugd2FudCBzb21ldGhpbmcgYXQgd2FybmluZwpsZXZlbDogVGhpcyBhbGxvd3MgYXV0b21h
dGVkIHRvb2xpbmcgaW4gQ0kgdG8gY2F0Y2ggYnVncyB3aXRob3V0Cmh1bWFucyBoYXZpbmcgdG8g
bG9vayBhdCBldmVyeXRoaW5nLiBJZiB3ZSBqdXN0IHVwZ3JhZGUgdGhlIGV4aXN0aW5nCnByX2lu
Zm8gdG8gYSBwcl93YXJuLCB0aGVuIHdlJ2xsIGhhdmUgZmFsc2UgcG9zaXRpdmVzLiBBbmQgYXMt
aXMsIG5vCm9uZSB3aWxsIGV2ZXIgc3BvdCB0aGUgcHJvYmxlbSBzaW5jZSBpdCdzIGxvc3QgaW4g
dGhlIG1hc3NpdmUgYW1vdW50cwpvZiBvdmVyYWxsIGRtZXNnIG5vaXNlLgoKdjI6IERyb3AgdGhl
IGZ1bGwgV0FSTl9PTiBiYWNrdHJhY2UgaW4gZmF2b3VyIG9mIGp1c3QgYSBwcl93YXJuIGZvcgp0
aGUgcHJvYmxlbWF0aWMgY2FzZSAoTWljaGFsIEhvY2tvKS4KCnYzOiBSZWJhc2Ugb24gdG9wIG9m
IEdsaXNzZSdzIGFyZyByZXdvcmsuCgp2NDogTW9yZSByZWJhc2Ugb24gdG9wIG9mIEdsaXNzZSBy
ZXdvcmtpbmcgZXZlcnl0aGluZy4KCkNjOiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5k
YXRpb24ub3JnPgpDYzogTWljaGFsIEhvY2tvIDxtaG9ja29Ac3VzZS5jb20+CkNjOiAiQ2hyaXN0
aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IERhdmlkIFJpZW50amVz
IDxyaWVudGplc0Bnb29nbGUuY29tPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBm
ZndsbC5jaD4KQ2M6ICJKw6lyw7RtZSBHbGlzc2UiIDxqZ2xpc3NlQHJlZGhhdC5jb20+CkNjOiBs
aW51eC1tbUBrdmFjay5vcmcKQ2M6IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5jb20+
ClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
ClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgot
LS0KIG1tL21tdV9ub3RpZmllci5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9tbS9tbXVfbm90aWZpZXIuYyBiL21tL21tdV9ub3RpZmllci5j
CmluZGV4IGVlMzYwNjgwNzdiNi4uYzA1ZTQwNmE3Y2Q3IDEwMDY0NAotLS0gYS9tbS9tbXVfbm90
aWZpZXIuYworKysgYi9tbS9tbXVfbm90aWZpZXIuYwpAQCAtMTgxLDYgKzE4MSw5IEBAIGludCBf
X21tdV9ub3RpZmllcl9pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0KHN0cnVjdCBtbXVfbm90aWZpZXJf
cmFuZ2UgKnJhbmdlKQogCQkJCXByX2luZm8oIiVwUyBjYWxsYmFjayBmYWlsZWQgd2l0aCAlZCBp
biAlc2Jsb2NrYWJsZSBjb250ZXh0LlxuIiwKIAkJCQkJbW4tPm9wcy0+aW52YWxpZGF0ZV9yYW5n
ZV9zdGFydCwgX3JldCwKIAkJCQkJIW1tdV9ub3RpZmllcl9yYW5nZV9ibG9ja2FibGUocmFuZ2Up
ID8gIm5vbi0iIDogIiIpOworCQkJCWlmICghbW11X25vdGlmaWVyX3JhbmdlX2Jsb2NrYWJsZShy
YW5nZSkpCisJCQkJCXByX3dhcm4oIiVwUyBjYWxsYmFjayBmYWlsdXJlIG5vdCBhbGxvd2VkXG4i
LAorCQkJCQkJbW4tPm9wcy0+aW52YWxpZGF0ZV9yYW5nZV9zdGFydCk7CiAJCQkJcmV0ID0gX3Jl
dDsKIAkJCX0KIAkJfQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
