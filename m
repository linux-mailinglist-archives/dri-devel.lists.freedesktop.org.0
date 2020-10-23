Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9940B296EEB
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 14:24:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6F416F610;
	Fri, 23 Oct 2020 12:23:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63D2F6E5BB
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 12:23:03 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id j7so1563263wrt.9
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 05:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cXs1UvblKDwz1YQCIe37x2wwQ5T1EiKP8bli0y6YQUo=;
 b=AEIa/7RtMPcTkOS17xaoZ+tZ2WHJwDB/uLw+Jxwkknjzz0o8Pvb3jK8xNmI5+rkacH
 RvXPWyHDVHuGWcl22HeQn+NbqKDCOAf9Q9GDKtS71H17YcqVr/FxJsbfr3QL5ROHJrug
 tpVEoVnRUaDsKK3bbvDbpWdN2Mh/1JfyJptkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cXs1UvblKDwz1YQCIe37x2wwQ5T1EiKP8bli0y6YQUo=;
 b=l2sJeT5YB4s5iKmOQzeIA99bhcMVy6oo3QEPFEdUDSMTYj4F6qfxxk6zjIBBnnmfO+
 6szZXvorL4XK89Hx3yfPMs/9W4ZdrSXFzAzNLHmLskOxth/+SdN2hxfEgrCXTFMo2WqD
 W/glSRJTejYfxWoi0zA7KVjDIA/LWDcPlri42EBoriMTgkGwthMmqQ0tCWd6HWktszEH
 VSWC/PRycYfnlc8cole4PpiL9NcVqRvrW0gFXObNmD0xwSO6kG5lVSw4Ah7M+M8R/rtA
 FEVZmG1VUeT1L3nP78pmCNrbQV0B7FtKgPZg6NUzmUivEEAPE0Q8NUA1lX0ninPHVeR6
 jzIA==
X-Gm-Message-State: AOAM533Xvi1UmDt01U26wz6nD9aQxu6WrxADlN6ERQOkYO6E0PjLMwZn
 +SzoD64Kt3FmO3JVu5j1eol/eCz3fvQ86yS6
X-Google-Smtp-Source: ABdhPJwugsOja41agH4JeM0mB6q18uXcawtusiYBwFAiX2c/bgyl3tIOiZ8ZGxA9kMQgDSsksw1WPw==
X-Received: by 2002:adf:fd8a:: with SMTP id d10mr2236246wrr.85.1603455781768; 
 Fri, 23 Oct 2020 05:23:01 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y4sm3056484wrp.74.2020.10.23.05.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 05:23:01 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 34/65] mm/frame-vector: Use FOLL_LONGTERM
Date: Fri, 23 Oct 2020 14:21:45 +0200
Message-Id: <20201023122216.2373294-34-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
References: <20201021163242.1458885-1-daniel.vetter@ffwll.ch>
 <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
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
Cc: linux-samsung-soc@vger.kernel.org, Jan Kara <jack@suse.cz>,
 linux-media@vger.kernel.org, Pawel Osciak <pawel@osciak.com>,
 linux-mm@kvack.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Tomasz Figa <tfiga@chromium.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Kyungmin Park <kyungmin.park@samsung.com>, John Hubbard <jhubbard@nvidia.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBpcyB1c2VkIGJ5IG1lZGlhL3ZpZGVidWYyIGZvciBwZXJzaXN0ZW50IGRtYSBtYXBwaW5n
cywgbm90IGp1c3QKZm9yIGEgc2luZ2xlIGRtYSBvcGVyYXRpb24gYW5kIHRoZW4gZnJlZWQgYWdh
aW4sIHNvIG5lZWRzCkZPTExfTE9OR1RFUk0uCgpVbmZvcnR1bmF0ZWx5IGN1cnJlbnQgcHVwX2xv
Y2tlZCBkb2Vzbid0IHN1cHBvcnQgRk9MTF9MT05HVEVSTSBkdWUgdG8KbG9ja2luZyBpc3N1ZXMu
IFJld29yayB0aGUgY29kZSB0byBwdWxsIHRoZSBwdXAgcGF0aCBvdXQgZnJvbSB0aGUKbW1hcF9z
ZW0gY3JpdGljYWwgc2VjdGlvbiBhcyBzdWdnZXN0ZWQgYnkgSmFzb24uCgpCeSByZWx5aW5nIGVu
dGlyZWx5IG9uIHRoZSB2bWEgY2hlY2tzIGluIHBpbl91c2VyX3BhZ2VzIGFuZCBmb2xsb3dfcGZu
Cihmb3Igdm1fZmxhZ3MgYW5kIHZtYV9pc19mc2RheCkgd2UgY2FuIGFsc28gc3RyZWFtbGluZSB0
aGUgY29kZSBhIGxvdC4KClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAaW50ZWwuY29tPgpDYzogSmFzb24gR3VudGhvcnBlIDxqZ2dAemllcGUuY2E+CkNjOiBQYXdl
bCBPc2NpYWsgPHBhd2VsQG9zY2lhay5jb20+CkNjOiBNYXJlayBTenlwcm93c2tpIDxtLnN6eXBy
b3dza2lAc2Ftc3VuZy5jb20+CkNjOiBLeXVuZ21pbiBQYXJrIDxreXVuZ21pbi5wYXJrQHNhbXN1
bmcuY29tPgpDYzogVG9tYXN6IEZpZ2EgPHRmaWdhQGNocm9taXVtLm9yZz4KQ2M6IE1hdXJvIENh
cnZhbGhvIENoZWhhYiA8bWNoZWhhYkBrZXJuZWwub3JnPgpDYzogQW5kcmV3IE1vcnRvbiA8YWtw
bUBsaW51eC1mb3VuZGF0aW9uLm9yZz4KQ2M6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlh
LmNvbT4KQ2M6IErDqXLDtG1lIEdsaXNzZSA8amdsaXNzZUByZWRoYXQuY29tPgpDYzogSmFuIEth
cmEgPGphY2tAc3VzZS5jej4KQ2M6IERhbiBXaWxsaWFtcyA8ZGFuLmoud2lsbGlhbXNAaW50ZWwu
Y29tPgpDYzogbGludXgtbW1Aa3ZhY2sub3JnCkNjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKQ2M6IGxpbnV4LXNhbXN1bmctc29jQHZnZXIua2VybmVsLm9yZwpDYzogbGlu
dXgtbWVkaWFAdmdlci5rZXJuZWwub3JnClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRh
bmllbC52ZXR0ZXJAZmZ3bGwuY2g+Ci0tCnYyOiBTdHJlYW1saW5lIHRoZSBjb2RlIGFuZCBmdXJ0
aGVyIHNpbXBsaWZ5IHRoZSBsb29wIGNoZWNrcyAoSmFzb24pCi0tLQogbW0vZnJhbWVfdmVjdG9y
LmMgfCA1MCArKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDM1IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL21tL2ZyYW1lX3ZlY3Rvci5jIGIvbW0vZnJhbWVfdmVjdG9yLmMKaW5kZXggMTBmODJk
NTY0M2I2Li5kNDQ3NzllNTYzMTMgMTAwNjQ0Ci0tLSBhL21tL2ZyYW1lX3ZlY3Rvci5jCisrKyBi
L21tL2ZyYW1lX3ZlY3Rvci5jCkBAIC0zOCw3ICszOCw2IEBAIGludCBnZXRfdmFkZHJfZnJhbWVz
KHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGludCBucl9mcmFtZXMsCiAJc3RydWN0IHZt
X2FyZWFfc3RydWN0ICp2bWE7CiAJaW50IHJldCA9IDA7CiAJaW50IGVycjsKLQlpbnQgbG9ja2Vk
OwogCiAJaWYgKG5yX2ZyYW1lcyA9PSAwKQogCQlyZXR1cm4gMDsKQEAgLTQ4LDQwICs0NywyNSBA
QCBpbnQgZ2V0X3ZhZGRyX2ZyYW1lcyh1bnNpZ25lZCBsb25nIHN0YXJ0LCB1bnNpZ25lZCBpbnQg
bnJfZnJhbWVzLAogCiAJc3RhcnQgPSB1bnRhZ2dlZF9hZGRyKHN0YXJ0KTsKIAotCW1tYXBfcmVh
ZF9sb2NrKG1tKTsKLQlsb2NrZWQgPSAxOwotCXZtYSA9IGZpbmRfdm1hX2ludGVyc2VjdGlvbiht
bSwgc3RhcnQsIHN0YXJ0ICsgMSk7Ci0JaWYgKCF2bWEpIHsKLQkJcmV0ID0gLUVGQVVMVDsKLQkJ
Z290byBvdXQ7Ci0JfQotCi0JLyoKLQkgKiBXaGlsZSBnZXRfdmFkZHJfZnJhbWVzKCkgY291bGQg
YmUgdXNlZCBmb3IgdHJhbnNpZW50IChrZXJuZWwKLQkgKiBjb250cm9sbGVkIGxpZmV0aW1lKSBw
aW5uaW5nIG9mIG1lbW9yeSBwYWdlcyBhbGwgY3VycmVudAotCSAqIHVzZXJzIGVzdGFibGlzaCBs
b25nIHRlcm0gKHVzZXJzcGFjZSBjb250cm9sbGVkIGxpZmV0aW1lKQotCSAqIHBhZ2UgcGlubmlu
Zy4gVHJlYXQgZ2V0X3ZhZGRyX2ZyYW1lcygpIGxpa2UKLQkgKiBnZXRfdXNlcl9wYWdlc19sb25n
dGVybSgpIGFuZCBkaXNhbGxvdyBpdCBmb3IgZmlsZXN5c3RlbS1kYXgKLQkgKiBtYXBwaW5ncy4K
LQkgKi8KLQlpZiAodm1hX2lzX2ZzZGF4KHZtYSkpIHsKLQkJcmV0ID0gLUVPUE5PVFNVUFA7Ci0J
CWdvdG8gb3V0OwotCX0KLQotCWlmICghKHZtYS0+dm1fZmxhZ3MgJiAoVk1fSU8gfCBWTV9QRk5N
QVApKSkgeworCXJldCA9IHBpbl91c2VyX3BhZ2VzX2Zhc3Qoc3RhcnQsIG5yX2ZyYW1lcywKKwkJ
CQkgIEZPTExfRk9SQ0UgfCBGT0xMX1dSSVRFIHwgRk9MTF9MT05HVEVSTSwKKwkJCQkgIChzdHJ1
Y3QgcGFnZSAqKikodmVjLT5wdHJzKSk7CisJaWYgKHJldCA+IDApIHsKIAkJdmVjLT5nb3RfcmVm
ID0gdHJ1ZTsKIAkJdmVjLT5pc19wZm5zID0gZmFsc2U7Ci0JCXJldCA9IHBpbl91c2VyX3BhZ2Vz
X2xvY2tlZChzdGFydCwgbnJfZnJhbWVzLAotCQkJZ3VwX2ZsYWdzLCAoc3RydWN0IHBhZ2UgKiop
KHZlYy0+cHRycyksICZsb2NrZWQpOwotCQlnb3RvIG91dDsKKwkJZ290byBvdXRfdW5sb2NrZWQ7
CiAJfQogCisJbW1hcF9yZWFkX2xvY2sobW0pOwogCXZlYy0+Z290X3JlZiA9IGZhbHNlOwogCXZl
Yy0+aXNfcGZucyA9IHRydWU7CiAJZG8gewogCQl1bnNpZ25lZCBsb25nICpudW1zID0gZnJhbWVf
dmVjdG9yX3BmbnModmVjKTsKIAorCQl2bWEgPSBmaW5kX3ZtYV9pbnRlcnNlY3Rpb24obW0sIHN0
YXJ0LCBzdGFydCArIDEpOworCQlpZiAoIXZtYSkKKwkJCWJyZWFrOworCiAJCXdoaWxlIChyZXQg
PCBucl9mcmFtZXMgJiYgc3RhcnQgKyBQQUdFX1NJWkUgPD0gdm1hLT52bV9lbmQpIHsKIAkJCWVy
ciA9IGZvbGxvd19wZm4odm1hLCBzdGFydCwgJm51bXNbcmV0XSk7CiAJCQlpZiAoZXJyKSB7CkBA
IC05MiwxNyArNzYsMTMgQEAgaW50IGdldF92YWRkcl9mcmFtZXModW5zaWduZWQgbG9uZyBzdGFy
dCwgdW5zaWduZWQgaW50IG5yX2ZyYW1lcywKIAkJCXN0YXJ0ICs9IFBBR0VfU0laRTsKIAkJCXJl
dCsrOwogCQl9Ci0JCS8qCi0JCSAqIFdlIHN0b3AgaWYgd2UgaGF2ZSBlbm91Z2ggcGFnZXMgb3Ig
aWYgVk1BIGRvZXNuJ3QgY29tcGxldGVseQotCQkgKiBjb3ZlciB0aGUgdGFpbCBwYWdlLgotCQkg
Ki8KLQkJaWYgKHJldCA+PSBucl9mcmFtZXMgfHwgc3RhcnQgPCB2bWEtPnZtX2VuZCkKKwkJLyog
QmFpbCBvdXQgaWYgVk1BIGRvZXNuJ3QgY29tcGxldGVseSBjb3ZlciB0aGUgdGFpbCBwYWdlLiAq
LworCQlpZiAoc3RhcnQgPCB2bWEtPnZtX2VuZCkKIAkJCWJyZWFrOwotCQl2bWEgPSBmaW5kX3Zt
YV9pbnRlcnNlY3Rpb24obW0sIHN0YXJ0LCBzdGFydCArIDEpOwotCX0gd2hpbGUgKHZtYSAmJiB2
bWEtPnZtX2ZsYWdzICYgKFZNX0lPIHwgVk1fUEZOTUFQKSk7CisJfSB3aGlsZSAocmV0IDwgbnJf
ZnJhbWVzKTsKIG91dDoKLQlpZiAobG9ja2VkKQotCQltbWFwX3JlYWRfdW5sb2NrKG1tKTsKKwlt
bWFwX3JlYWRfdW5sb2NrKG1tKTsKK291dF91bmxvY2tlZDoKIAlpZiAoIXJldCkKIAkJcmV0ID0g
LUVGQVVMVDsKIAlpZiAocmV0ID4gMCkKLS0gCjIuMjguMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
