Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 358C330E4D3
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 22:20:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFED16EB72;
	Wed,  3 Feb 2021 21:20:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5A9A6EBFB
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 21:19:59 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id 190so1167398wmz.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Feb 2021 13:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0KFkS15Rzk/OuayxNy0U6nwvFrwjvOdNgW3QDiU+4sc=;
 b=B7EMeYtWrV2AdNBT7y1PBSR9YxDl9aaGbp4q9BWq9AqSEZX9pd79s3t/xli9kTbRB6
 Xo/S/aN4oPc7Fu9md3ZQkcmMZ2qEZi9lZ8KtRMICl828jKRyISGJ6gnYUBenEUVvWGHs
 j5AjwWMz62ODeMu25iCr6b7IgeKTDPmOXwGoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0KFkS15Rzk/OuayxNy0U6nwvFrwjvOdNgW3QDiU+4sc=;
 b=AgaoTokwirOhYL+5t/hR3grz8lEh5Q7iXN0wONpbGK1bQ62H1B8l9Unprafq3BdPOV
 gtRHHPDWZiuCYlctDLjvGZ+UjyEU+0jKs7GiyrzLZL7qflW3Ry1y1c7y08KbCTyGGO5v
 D/muKj+DY7fWCC0/xxQpmryL98mN8oqoaavNsVCUNL1LPdDxHQLXr5d0csWiZcA38y2p
 ACk8GyC364GcSMRPwkFHreordEdgs12ZsvEHN1cAiF+xYn1qvVJGSZojAI3bQhdTuB68
 7+yK85SC275MHuV0jfQkwUGMLbA1M8zx8bb63ke16FntJhy5Cwh7xNdAQiObI0utrPNc
 sLTw==
X-Gm-Message-State: AOAM533+xZgr3jfxaBTzrT1fJn5WCM6KpluoPRcJUKpc9KdhwcpSzWod
 z+yFbAn9cFXYCLk1FhYL2VqF0vBhCmtTMvBt
X-Google-Smtp-Source: ABdhPJzmU+Or9jzYUxXpAPVaDeRxSWgaJEx85VA2rMsPqlZffUGrONNNs7GEJYIhtZkMGnZTZpPI4g==
X-Received: by 2002:a7b:c854:: with SMTP id c20mr4449864wml.127.1612387198566; 
 Wed, 03 Feb 2021 13:19:58 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j185sm4217399wma.1.2021.02.03.13.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 13:19:57 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] RFC: dma-buf: Require VM_SPECIAL vma for mmap
Date: Wed,  3 Feb 2021 22:19:48 +0100
Message-Id: <20210203211948.2529297-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.30.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Wilcox <willy@infradead.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Suren Baghdasaryan <surenb@google.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dGxkcjsgRE1BIGJ1ZmZlcnMgYXJlbid0IG5vcm1hbCBtZW1vcnksIGV4cGVjdGluZyB0aGF0IHlv
dSBjYW4gdXNlCnRoZW0gbGlrZSB0aGF0IChsaWtlIGNhbGxpbmcgZ2V0X3VzZXJfcGFnZXMgd29y
a3MsIG9yIHRoYXQgdGhleSdyZQphY2NvdW50aW5nIGxpa2UgYW55IG90aGVyIG5vcm1hbCBtZW1v
cnkpIGNhbm5vdCBiZSBndWFyYW50ZWVkLgoKU2luY2Ugc29tZSB1c2Vyc3BhY2Ugb25seSBydW5z
IG9uIGludGVncmF0ZWQgZGV2aWNlcywgd2hlcmUgYWxsCmJ1ZmZlcnMgYXJlIGFjdHVhbGx5IGFs
bCByZXNpZGVudCBzeXN0ZW0gbWVtb3J5LCB0aGVyZSdzIGEgaHVnZQp0ZW1wdGF0aW9uIHRvIGFz
c3VtZSB0aGF0IGEgc3RydWN0IHBhZ2UgaXMgYWx3YXlzIHByZXNlbnQgYW5kIHVzZWFibGUKbGlr
ZSBmb3IgYW55IG1vcmUgcGFnZWNhY2hlIGJhY2tlZCBtbWFwLiBUaGlzIGhhcyB0aGUgcG90ZW50
aWFsIHRvCnJlc3VsdCBpbiBhIHVhcGkgbmlnaHRtYXJlLgoKVG8gc3RvcCB0aGlzIGdhcCByZXF1
aXJlIHRoYXQgRE1BIGJ1ZmZlciBtbWFwcyBhcmUgVk1fU1BFQ0lBTCwgd2hpY2gKYmxvY2tzIGdl
dF91c2VyX3BhZ2VzIGFuZCBhbGwgdGhlIG90aGVyIHN0cnVjdCBwYWdlIGJhc2VkCmluZnJhc3Ry
dWN0dXJlIGZvciBldmVyeW9uZS4gSW4gc3Bpcml0IHRoaXMgaXMgdGhlIHVhcGkgY291bnRlcnBh
cnQgdG8KdGhlIGtlcm5lbC1pbnRlcm5hbCBDT05GSUdfRE1BQlVGX0RFQlVHLgoKTW90aXZhdGVk
IGJ5IGEgcmVjZW50IHBhdGNoIHdoaWNoIHdhbnRlZCB0byBzd2ljaCB0aGUgc3lzdGVtIGRtYS1i
dWYKaGVhcCB0byB2bV9pbnNlcnRfcGFnZSBpbnN0ZWFkIG9mIHZtX2luc2VydF9wZm4uCgpSZWZl
cmVuY2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sL0NBS01LN3VIaSttRzB6MEhVbU50
MTNRQ0N2dXR1UlZqcGNSME5qUkwxMmstV2JXemtSZ0BtYWlsLmdtYWlsLmNvbS8KQ2M6IEphc29u
IEd1bnRob3JwZSA8amdnQHppZXBlLmNhPgpDYzogU3VyZW4gQmFnaGRhc2FyeWFuIDxzdXJlbmJA
Z29vZ2xlLmNvbT4KQ2M6IE1hdHRoZXcgV2lsY294IDx3aWxseUBpbmZyYWRlYWQub3JnPgpDYzog
Sm9obiBTdHVsdHogPGpvaG4uc3R1bHR6QGxpbmFyby5vcmc+ClNpZ25lZC1vZmYtYnk6IERhbmll
bCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgpDYzogU3VtaXQgU2Vtd2FsIDxzdW1p
dC5zZW13YWxAbGluYXJvLm9yZz4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtv
ZW5pZ0BhbWQuY29tPgpDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCkNjOiBsaW5hcm8t
bW0tc2lnQGxpc3RzLmxpbmFyby5vcmcKLS0tCiBkcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jIHwg
MTUgKysrKysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jIGIvZHJp
dmVycy9kbWEtYnVmL2RtYS1idWYuYwppbmRleCBmMjY0YjcwYzM4M2UuLmQzMDgxZmMwNzA1NiAx
MDA2NDQKLS0tIGEvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYworKysgYi9kcml2ZXJzL2RtYS1i
dWYvZG1hLWJ1Zi5jCkBAIC0xMjcsNiArMTI3LDcgQEAgc3RhdGljIHN0cnVjdCBmaWxlX3N5c3Rl
bV90eXBlIGRtYV9idWZfZnNfdHlwZSA9IHsKIHN0YXRpYyBpbnQgZG1hX2J1Zl9tbWFwX2ludGVy
bmFsKHN0cnVjdCBmaWxlICpmaWxlLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKIHsKIAlz
dHJ1Y3QgZG1hX2J1ZiAqZG1hYnVmOworCWludCByZXQ7CiAKIAlpZiAoIWlzX2RtYV9idWZfZmls
ZShmaWxlKSkKIAkJcmV0dXJuIC1FSU5WQUw7CkBAIC0xNDIsNyArMTQzLDExIEBAIHN0YXRpYyBp
bnQgZG1hX2J1Zl9tbWFwX2ludGVybmFsKHN0cnVjdCBmaWxlICpmaWxlLCBzdHJ1Y3Qgdm1fYXJl
YV9zdHJ1Y3QgKnZtYSkKIAkgICAgZG1hYnVmLT5zaXplID4+IFBBR0VfU0hJRlQpCiAJCXJldHVy
biAtRUlOVkFMOwogCi0JcmV0dXJuIGRtYWJ1Zi0+b3BzLT5tbWFwKGRtYWJ1Ziwgdm1hKTsKKwly
ZXQgPSBkbWFidWYtPm9wcy0+bW1hcChkbWFidWYsIHZtYSk7CisKKwlXQVJOX09OKCEodm1hLT52
bV9mbGFncyAmIFZNX1NQRUNJQUwpKTsKKworCXJldHVybiByZXQ7CiB9CiAKIHN0YXRpYyBsb2Zm
X3QgZG1hX2J1Zl9sbHNlZWsoc3RydWN0IGZpbGUgKmZpbGUsIGxvZmZfdCBvZmZzZXQsIGludCB3
aGVuY2UpCkBAIC0xMjQ0LDYgKzEyNDksOCBAQCBFWFBPUlRfU1lNQk9MX0dQTChkbWFfYnVmX2Vu
ZF9jcHVfYWNjZXNzKTsKIGludCBkbWFfYnVmX21tYXAoc3RydWN0IGRtYV9idWYgKmRtYWJ1Ziwg
c3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCiAJCSB1bnNpZ25lZCBsb25nIHBnb2ZmKQogewor
CWludCByZXQ7CisKIAlpZiAoV0FSTl9PTighZG1hYnVmIHx8ICF2bWEpKQogCQlyZXR1cm4gLUVJ
TlZBTDsKIApAQCAtMTI2NCw3ICsxMjcxLDExIEBAIGludCBkbWFfYnVmX21tYXAoc3RydWN0IGRt
YV9idWYgKmRtYWJ1Ziwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCiAJdm1hX3NldF9maWxl
KHZtYSwgZG1hYnVmLT5maWxlKTsKIAl2bWEtPnZtX3Bnb2ZmID0gcGdvZmY7CiAKLQlyZXR1cm4g
ZG1hYnVmLT5vcHMtPm1tYXAoZG1hYnVmLCB2bWEpOworCXJldCA9IGRtYWJ1Zi0+b3BzLT5tbWFw
KGRtYWJ1Ziwgdm1hKTsKKworCVdBUk5fT04oISh2bWEtPnZtX2ZsYWdzICYgVk1fU1BFQ0lBTCkp
OworCisJcmV0dXJuIHJldDsKIH0KIEVYUE9SVF9TWU1CT0xfR1BMKGRtYV9idWZfbW1hcCk7CiAK
LS0gCjIuMzAuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
