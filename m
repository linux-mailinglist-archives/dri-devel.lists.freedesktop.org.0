Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 496062864DC
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 18:44:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2904E6E95F;
	Wed,  7 Oct 2020 16:44:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43C7F6E969
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 16:44:52 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id d4so3035039wmd.5
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Oct 2020 09:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dvMOl5qn3xQqngcKVpyNX+ax+2goWhkEVg7LeNCEKtI=;
 b=PbdDP59NrSDZxmLOWczSE2cRJJsMLzvw4mEtmBjBj9fgeRsN0fZSKVabWIN7hFcZtv
 xzAe3LJduGn0vaaDjiW4G/C3Uf4XUZO2JllwyTJ9Wsq0tezSYJkYYoiFOthcqAJ5SpO/
 3t8nzxUBbNP7hSXTX+L3BgEGTBUq+RyoYYKLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dvMOl5qn3xQqngcKVpyNX+ax+2goWhkEVg7LeNCEKtI=;
 b=pRY8IkgJ7mVrmu8LGQgtBjCKWiP8oYcaJilU+JmSVb9px9S7esiqE/xWKaHVNeVAhH
 m0e9ynfhayMG83uVZacI5h3ZC6EO8z1U4XBLx/y9B4SQPOCzWHaMUU5+LBHX2Ps3UW1+
 CQIYpYgqLJKk4qChVgbWm+JL7V3zQQzIhzk6dDxlOWetA44kMfm02ayoHysw62jpluqd
 zY27VHP+xJL3quGk0w5hUmDz9d7dX3/uiVcU8BkUhq0JxGbI3kN5RhL6YIZT75brRr1f
 LACd1tBmohZltImcCUax4f6p7O/mcFFt8fS4h8P87CPfdlbTVptQ9apR4Y4LKQ/RXp/W
 I/BQ==
X-Gm-Message-State: AOAM533xso1m2RnGwtXymj0NfmsgYTKTp11ImAOhFbXJn4S/oS4rHhdg
 GC96/VBhZqht9ir7VmKKWoscqYGqCUpQfwnx
X-Google-Smtp-Source: ABdhPJzw6PlCUbNqoLiPN5u1sFMl1viobOv7pIsUUzeqLWeTM2j6wE9ncJp2ranbphS6F7r51TbDeQ==
X-Received: by 2002:a1c:1905:: with SMTP id 5mr4404786wmz.32.1602089090410;
 Wed, 07 Oct 2020 09:44:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z191sm3332280wme.40.2020.10.07.09.44.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 09:44:49 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 12/13] media/videbuf1|2: Mark follow_pfn usage as unsafe
Date: Wed,  7 Oct 2020 18:44:25 +0200
Message-Id: <20201007164426.1812530-13-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201007164426.1812530-1-daniel.vetter@ffwll.ch>
References: <20201007164426.1812530-1-daniel.vetter@ffwll.ch>
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
 Jason Gunthorpe <jgg@ziepe.ca>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Pawel Osciak <pawel@osciak.com>, John Hubbard <jhubbard@nvidia.com>,
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
IG1lbW9yeSB3aWxsIGtlZXAgd29ya2luZyBhcy1pcy4KClNpZ25lZC1vZmYtYnk6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgpDYzogSmFzb24gR3VudGhvcnBlIDxqZ2dA
emllcGUuY2E+CkNjOiBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4KQ2M6IERhbiBX
aWxsaWFtcyA8ZGFuLmoud2lsbGlhbXNAaW50ZWwuY29tPgpDYzogQW5kcmV3IE1vcnRvbiA8YWtw
bUBsaW51eC1mb3VuZGF0aW9uLm9yZz4KQ2M6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlh
LmNvbT4KQ2M6IErDqXLDtG1lIEdsaXNzZSA8amdsaXNzZUByZWRoYXQuY29tPgpDYzogSmFuIEth
cmEgPGphY2tAc3VzZS5jej4KQ2M6IERhbiBXaWxsaWFtcyA8ZGFuLmoud2lsbGlhbXNAaW50ZWwu
Y29tPgpDYzogbGludXgtbW1Aa3ZhY2sub3JnCkNjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKQ2M6IGxpbnV4LXNhbXN1bmctc29jQHZnZXIua2VybmVsLm9yZwpDYzogbGlu
dXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCkNjOiBQYXdlbCBPc2NpYWsgPHBhd2VsQG9zY2lhay5j
b20+CkNjOiBNYXJlayBTenlwcm93c2tpIDxtLnN6eXByb3dza2lAc2Ftc3VuZy5jb20+CkNjOiBL
eXVuZ21pbiBQYXJrIDxreXVuZ21pbi5wYXJrQHNhbXN1bmcuY29tPgpDYzogVG9tYXN6IEZpZ2Eg
PHRmaWdhQGNocm9taXVtLm9yZz4KQ2M6IExhdXJlbnQgRHVmb3VyIDxsZHVmb3VyQGxpbnV4Lmli
bS5jb20+CkNjOiBWbGFzdGltaWwgQmFia2EgPHZiYWJrYUBzdXNlLmN6PgpDYzogRGFuaWVsIEpv
cmRhbiA8ZGFuaWVsLm0uam9yZGFuQG9yYWNsZS5jb20+CkNjOiBNaWNoZWwgTGVzcGluYXNzZSA8
d2Fsa2VuQGdvb2dsZS5jb20+Ci0tLQogZHJpdmVycy9tZWRpYS9jb21tb24vdmlkZW9idWYyL2Zy
YW1lX3ZlY3Rvci5jIHwgMiArLQogZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdmlkZW9idWYtZG1h
LWNvbnRpZy5jIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9jb21tb24vdmlkZW9idWYyL2Zy
YW1lX3ZlY3Rvci5jIGIvZHJpdmVycy9tZWRpYS9jb21tb24vdmlkZW9idWYyL2ZyYW1lX3ZlY3Rv
ci5jCmluZGV4IGI5NWY0ZjM3MTY4MS4uZDU2ZWI2MjU4ZjA5IDEwMDY0NAotLS0gYS9kcml2ZXJz
L21lZGlhL2NvbW1vbi92aWRlb2J1ZjIvZnJhbWVfdmVjdG9yLmMKKysrIGIvZHJpdmVycy9tZWRp
YS9jb21tb24vdmlkZW9idWYyL2ZyYW1lX3ZlY3Rvci5jCkBAIC03MSw3ICs3MSw3IEBAIGludCBn
ZXRfdmFkZHJfZnJhbWVzKHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGludCBucl9mcmFt
ZXMsCiAJCXVuc2lnbmVkIGxvbmcgKm51bXMgPSBmcmFtZV92ZWN0b3JfcGZucyh2ZWMpOwogCiAJ
CXdoaWxlIChyZXQgPCBucl9mcmFtZXMgJiYgc3RhcnQgKyBQQUdFX1NJWkUgPD0gdm1hLT52bV9l
bmQpIHsKLQkJCWVyciA9IGZvbGxvd19wZm4odm1hLCBzdGFydCwgJm51bXNbcmV0XSk7CisJCQll
cnIgPSB1bnNhZmVfZm9sbG93X3Bmbih2bWEsIHN0YXJ0LCAmbnVtc1tyZXRdKTsKIAkJCWlmIChl
cnIpIHsKIAkJCQlpZiAocmV0ID09IDApCiAJCQkJCXJldCA9IGVycjsKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbWVkaWEvdjRsMi1jb3JlL3ZpZGVvYnVmLWRtYS1jb250aWcuYyBiL2RyaXZlcnMvbWVk
aWEvdjRsMi1jb3JlL3ZpZGVvYnVmLWRtYS1jb250aWcuYwppbmRleCA1MjMxMmNlMmJhMDUuLjgy
MWM0YTc2YWI5NiAxMDA2NDQKLS0tIGEvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdmlkZW9idWYt
ZG1hLWNvbnRpZy5jCisrKyBiL2RyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3ZpZGVvYnVmLWRtYS1j
b250aWcuYwpAQCAtMTgzLDcgKzE4Myw3IEBAIHN0YXRpYyBpbnQgdmlkZW9idWZfZG1hX2NvbnRp
Z191c2VyX2dldChzdHJ1Y3QgdmlkZW9idWZfZG1hX2NvbnRpZ19tZW1vcnkgKm1lbSwKIAl1c2Vy
X2FkZHJlc3MgPSB1bnRhZ2dlZF9iYWRkcjsKIAogCXdoaWxlIChwYWdlc19kb25lIDwgKG1lbS0+
c2l6ZSA+PiBQQUdFX1NISUZUKSkgewotCQlyZXQgPSBmb2xsb3dfcGZuKHZtYSwgdXNlcl9hZGRy
ZXNzLCAmdGhpc19wZm4pOworCQlyZXQgPSB1bnNhZmVfZm9sbG93X3Bmbih2bWEsIHVzZXJfYWRk
cmVzcywgJnRoaXNfcGZuKTsKIAkJaWYgKHJldCkKIAkJCWJyZWFrOwogCi0tIAoyLjI4LjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
