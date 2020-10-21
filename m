Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB9F2949AE
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 10:57:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49AC26F474;
	Wed, 21 Oct 2020 08:57:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8DD16EAC5
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 08:57:18 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id b8so2198581wrn.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 01:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=62xo6Yc+okj8E3g2nExt24JkphJyecIdIYx1MX/KcgQ=;
 b=K873XhCKhky8xYu7l9PH0L4vvRQ8W4kOqwGB7em4FSZU/FH2w3o/Fs6+QECyRAghOu
 8q8OodzeuuFUxMzw/vVk1/yMCBxwVGl1BeYckPl4pNsKxDrGH6PmKMHuJ2X/ASVVgbzy
 2gMkhgZs8aQVpZ+fDa84ImMGzU1FdBr7OgsW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=62xo6Yc+okj8E3g2nExt24JkphJyecIdIYx1MX/KcgQ=;
 b=pxYOhZ5ja58SaHQoovOe7kfhX6nmNGjLo82nCeUBPAAFgdxOLNiboO0xYt9Io8StJX
 b7mn7nW/li5klgppJDOdwLOJmhOUSh8lDvAU7+y5N6LwedKnbVE/+dIcy3izyzvGA4Gb
 McCqFpY6RpKIRaMNPgeBEFRjo7fTohnq+9Qgmrfe0T7dtb/DdOtgNflS2up4ctno7o9C
 MaURgp5d/N043szk9/vqihXiq4GvgUY0scqPZLo+uvfCtJOnF1q6JwKsP3UN33Tb8ip8
 DTR82+LfizsldEaUsmj2ZX9018J6E9wVH2RSYT1EHoclJu4QD6zbto55vg5E76O1T4Sw
 7YPQ==
X-Gm-Message-State: AOAM531DCW61vpFILTTso/G9gt29tnxFVGt2Sx+k6xw+NhArf+2zZvds
 6w91SK7UNR96S1uaXpvy1zW+yjj9V7n61pHC
X-Google-Smtp-Source: ABdhPJxBj+/fddzStMvRlNb0kPGellflBixkVVFjchw9D6JBYyFT9T4kixhMP79NqV0iv84nhiR1VA==
X-Received: by 2002:a5d:480a:: with SMTP id l10mr3285006wrq.238.1603270637190; 
 Wed, 21 Oct 2020 01:57:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q8sm2675939wro.32.2020.10.21.01.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2020 01:57:16 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 10/16] media/videbuf1|2: Mark follow_pfn usage as unsafe
Date: Wed, 21 Oct 2020 10:56:49 +0200
Message-Id: <20201021085655.1192025-11-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201021085655.1192025-1-daniel.vetter@ffwll.ch>
References: <20201021085655.1192025-1-daniel.vetter@ffwll.ch>
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
Cc: Jan Kara <jack@suse.cz>, kvm@vger.kernel.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-mm@kvack.org,
 Daniel Vetter <daniel.vetter@intel.com>, Michel Lespinasse <walken@google.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-s390@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, Daniel Jordan <daniel.m.jordan@oracle.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Daniel Vetter <daniel.vetter@ffwll.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Pawel Osciak <pawel@osciak.com>,
 John Hubbard <jhubbard@nvidia.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Laurent Dufour <ldufour@linux.ibm.com>, Vlastimil Babka <vbabka@suse.cz>,
 Tomasz Figa <tfiga@chromium.org>, Kyungmin Park <kyungmin.park@samsung.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIG1lZGlhIG1vZGVsIGFzc3VtZXMgdGhhdCBidWZmZXJzIGFyZSBhbGwgcHJlYWxsb2NhdGVk
LCBzbyB0aGF0CndoZW4gYSBtZWRpYSBwaXBlbGluZSBpcyBydW5uaW5nIHdlIG5ldmVyIG1pc3Mg
YSBkZWFkbGluZSBiZWNhdXNlIHRoZQpidWZmZXJzIGFyZW4ndCBhbGxvY2F0ZWQgb3IgYXZhaWxh
YmxlLgoKVGhpcyBtZWFucyB3ZSBjYW5ub3QgZml4IHRoZSB2NGwgZm9sbG93X3BmbiB1c2FnZSB0
aHJvdWdoCm1tdV9ub3RpZmllciwgd2l0aG91dCBicmVha2luZyBob3cgdGhpcyBhbGwgd29ya3Mu
IFRoZSBvbmx5IHJlYWwgZml4CmlzIHRvIGRlcHJlY2F0ZSB1c2VycHRyIHN1cHBvcnQgZm9yIFZN
X0lPIHwgVk1fUEZOTUFQIG1hcHBpbmdzIGFuZAp0ZWxsIGV2ZXJ5b25lIHRvIGN1dCBvdmVyIHRv
IGRtYS1idWYgbWVtb3J5IHNoYXJpbmcgZm9yIHplcm9jb3B5LgoKdXNlcnB0ciBmb3Igbm9ybWFs
IG1lbW9yeSB3aWxsIGtlZXAgd29ya2luZyBhcy1pcywgdGhpcyBvbmx5IGFmZmVjdHMKdGhlIHpl
cm9jb3B5IHVzZXJwdHIgdXNhZ2UgZW5hYmxlZCBpbiA1MGFjOTUyZDIyNjMgKCJbbWVkaWFdCnZp
ZGVvYnVmMi1kbWEtc2c6IFN1cHBvcnQgaW8gdXNlcnB0ciBvcGVyYXRpb25zIG9uIGlvIG1lbW9y
eSIpLgoKU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5j
b20+CkNjOiBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVwZS5jYT4KQ2M6IEtlZXMgQ29vayA8a2Vl
c2Nvb2tAY2hyb21pdW0ub3JnPgpDYzogRGFuIFdpbGxpYW1zIDxkYW4uai53aWxsaWFtc0BpbnRl
bC5jb20+CkNjOiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPgpDYzog
Sm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgpDYzogSsOpcsO0bWUgR2xpc3NlIDxq
Z2xpc3NlQHJlZGhhdC5jb20+CkNjOiBKYW4gS2FyYSA8amFja0BzdXNlLmN6PgpDYzogRGFuIFdp
bGxpYW1zIDxkYW4uai53aWxsaWFtc0BpbnRlbC5jb20+CkNjOiBsaW51eC1tbUBrdmFjay5vcmcK
Q2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpDYzogbGludXgtc2Ftc3Vu
Zy1zb2NAdmdlci5rZXJuZWwub3JnCkNjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6
IFBhd2VsIE9zY2lhayA8cGF3ZWxAb3NjaWFrLmNvbT4KQ2M6IE1hcmVrIFN6eXByb3dza2kgPG0u
c3p5cHJvd3NraUBzYW1zdW5nLmNvbT4KQ2M6IEt5dW5nbWluIFBhcmsgPGt5dW5nbWluLnBhcmtA
c2Ftc3VuZy5jb20+CkNjOiBUb21hc3ogRmlnYSA8dGZpZ2FAY2hyb21pdW0ub3JnPgpDYzogTGF1
cmVudCBEdWZvdXIgPGxkdWZvdXJAbGludXguaWJtLmNvbT4KQ2M6IFZsYXN0aW1pbCBCYWJrYSA8
dmJhYmthQHN1c2UuY3o+CkNjOiBEYW5pZWwgSm9yZGFuIDxkYW5pZWwubS5qb3JkYW5Ab3JhY2xl
LmNvbT4KQ2M6IE1pY2hlbCBMZXNwaW5hc3NlIDx3YWxrZW5AZ29vZ2xlLmNvbT4KU2lnbmVkLW9m
Zi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jb20+Ci0tCnYzOgotIFJl
ZmVyZW5jZSB0aGUgY29tbWl0IHRoYXQgZW5hYmxlZCB0aGUgemVyb2NvcHkgdXNlcnB0ciB1c2Ug
Y2FzZSB0bwogIG1ha2UgaXQgYWJ1bmRhbmR0bHkgY2xlYXIgdGhhdCB0aGlzIHBhdGNoIG9ubHkg
YWZmZWN0cyB0aGF0LCBhbmQgbm90CiAgbm9ybWFsIG1lbW9yeSB1c2VycHRyLiBUaGUgb2xkIGNv
bW1pdCBtZXNzYWdlIGFscmVhZHkgZXhwbGFpbmVkIHRoYXQKICBub3JtYWwgbWVtb3J5IHVzZXJw
dHIgaXMgdW5hZmZlY3RlZCwgYnV0IEkgZ3Vlc3MgdGhhdCB3YXMgbm90IGNsZWFyCiAgZW5vdWdo
LgotLS0KIGRyaXZlcnMvbWVkaWEvY29tbW9uL3ZpZGVvYnVmMi9mcmFtZV92ZWN0b3IuYyB8IDIg
Ky0KIGRyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3ZpZGVvYnVmLWRtYS1jb250aWcuYyB8IDIgKy0K
IDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbWVkaWEvY29tbW9uL3ZpZGVvYnVmMi9mcmFtZV92ZWN0b3IuYyBiL2Ry
aXZlcnMvbWVkaWEvY29tbW9uL3ZpZGVvYnVmMi9mcmFtZV92ZWN0b3IuYwppbmRleCA2NTkwOTg3
YzE0YmQuLmU2MzA0OTRkYTY1YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9tZWRpYS9jb21tb24vdmlk
ZW9idWYyL2ZyYW1lX3ZlY3Rvci5jCisrKyBiL2RyaXZlcnMvbWVkaWEvY29tbW9uL3ZpZGVvYnVm
Mi9mcmFtZV92ZWN0b3IuYwpAQCAtNjksNyArNjksNyBAQCBpbnQgZ2V0X3ZhZGRyX2ZyYW1lcyh1
bnNpZ25lZCBsb25nIHN0YXJ0LCB1bnNpZ25lZCBpbnQgbnJfZnJhbWVzLAogCQkJYnJlYWs7CiAK
IAkJd2hpbGUgKHJldCA8IG5yX2ZyYW1lcyAmJiBzdGFydCArIFBBR0VfU0laRSA8PSB2bWEtPnZt
X2VuZCkgewotCQkJZXJyID0gZm9sbG93X3Bmbih2bWEsIHN0YXJ0LCAmbnVtc1tyZXRdKTsKKwkJ
CWVyciA9IHVuc2FmZV9mb2xsb3dfcGZuKHZtYSwgc3RhcnQsICZudW1zW3JldF0pOwogCQkJaWYg
KGVycikgewogCQkJCWlmIChyZXQgPT0gMCkKIAkJCQkJcmV0ID0gZXJyOwpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdmlkZW9idWYtZG1hLWNvbnRpZy5jIGIvZHJpdmVycy9t
ZWRpYS92NGwyLWNvcmUvdmlkZW9idWYtZG1hLWNvbnRpZy5jCmluZGV4IDUyMzEyY2UyYmEwNS4u
ODIxYzRhNzZhYjk2IDEwMDY0NAotLS0gYS9kcml2ZXJzL21lZGlhL3Y0bDItY29yZS92aWRlb2J1
Zi1kbWEtY29udGlnLmMKKysrIGIvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdmlkZW9idWYtZG1h
LWNvbnRpZy5jCkBAIC0xODMsNyArMTgzLDcgQEAgc3RhdGljIGludCB2aWRlb2J1Zl9kbWFfY29u
dGlnX3VzZXJfZ2V0KHN0cnVjdCB2aWRlb2J1Zl9kbWFfY29udGlnX21lbW9yeSAqbWVtLAogCXVz
ZXJfYWRkcmVzcyA9IHVudGFnZ2VkX2JhZGRyOwogCiAJd2hpbGUgKHBhZ2VzX2RvbmUgPCAobWVt
LT5zaXplID4+IFBBR0VfU0hJRlQpKSB7Ci0JCXJldCA9IGZvbGxvd19wZm4odm1hLCB1c2VyX2Fk
ZHJlc3MsICZ0aGlzX3Bmbik7CisJCXJldCA9IHVuc2FmZV9mb2xsb3dfcGZuKHZtYSwgdXNlcl9h
ZGRyZXNzLCAmdGhpc19wZm4pOwogCQlpZiAocmV0KQogCQkJYnJlYWs7CiAKLS0gCjIuMjguMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
