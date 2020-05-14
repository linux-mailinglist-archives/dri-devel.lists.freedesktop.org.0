Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D001D3EF2
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 22:23:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02CD86E0AD;
	Thu, 14 May 2020 20:23:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BAB56E0AD
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 20:23:04 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id g12so34656534wmh.3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 13:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JRs5CU7GCWwRnWiOKlI7YecBg0ycRjhicdBVLDNYVWw=;
 b=b9EI9yfm8lf+BKEol4YcKL97AJBGzIC4lzcoGXYXQOYsVy8XS+kA3WdEqJGO0QEK5d
 a8Tq0Y4FI+yb3jFB2/7ySUIRU3FTAY7qtdb4QLNFwHrqk7plBpbhb7Lw1858qs/v8QLs
 KaEIgd32kLkS3LcOjpKRhghq4Igmsp3OugipA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JRs5CU7GCWwRnWiOKlI7YecBg0ycRjhicdBVLDNYVWw=;
 b=nXXRtdr876Bv0+kJmOqEbVoavC3+jUBTw4jpxiqFUB1AYE/q01uWt0r0NFn7tIkn5y
 Td9SSJg55nBB7u9aH00SsL2hH/ZQppotZ0wrgSsDLvC+WtXZHM/OQEIEoKU2pLO3/6tv
 lodvBqdFRR3wSkY3k2IxgL3fn8P7pNIk1FAEOUtuxA00gorMXq3PletexsymF+/1vmRB
 cC3NSIkhV1kQYX3KxhRIOcdAaFgif6OT0ibbvHeAzPY13RQ307BU4g963pz62pNbMkHi
 zCYrg5XOm+DHwbjJ5UDrv8rpcJpo5kND1MnlyozUltQXjVynYdw2ozkvZyFgLd8V8lRN
 IE2Q==
X-Gm-Message-State: AOAM533xapQ82Mzb08wsYGKKoUh5MzgxD4UspLarBNdWmJhkJaPtV6RN
 dheYXWgUzpbZv9SEYB//rC2Vy09l2Zc=
X-Google-Smtp-Source: ABdhPJzyccl1mV4XJi4CbAsEjT1XeZQpj4rVc0OF0ECx7sS1tHHeaPkzaLfT0/cJnWDnCp+YysvsvQ==
X-Received: by 2002:a05:600c:230e:: with SMTP id 14mr95650wmo.45.1589487782556; 
 Thu, 14 May 2020 13:23:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l18sm263837wmj.22.2020.05.14.13.23.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 13:23:01 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/shmem-helpers: Don't call get/put_pages on imported
 dma-buf in vmap
Date: Thu, 14 May 2020 22:22:56 +0200
Message-Id: <20200514202256.490926-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <6910cb3c-7169-fe1c-efc1-3acb8a218384@suse.de>
References: <6910cb3c-7169-fe1c-efc1-3acb8a218384@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlcmUncyBubyBkaXJlY3QgaGFybSwgYmVjYXVzZSBmb3IgdGhlIHNobWVtIGhlbHBlcnMgdGhl
c2UgYXJlIG5vb3BzCm9uIGltcG9ydGVkIGJ1ZmZlcnMuIFRoZSB0cm91YmxlIGlzIGluIHRoZSBs
b2NrcyB0aGVzZSB0YWtlIC0gSSB3YW50CnRvIGNoYW5nZSBkbWFfYnVmX3ZtYXAgbG9ja2luZywg
YW5kIHNvIG5lZWQgdG8gbWFrZSBzdXJlIHRoYXQgd2Ugb25seQpldmVyIHRha2UgY2VydGFpbiBs
b2NrcyBvbiBvbmUgc2lkZSBvZiB0aGUgZG1hLWJ1ZiBpbnRlcmZhY2U6IEVpdGhlcgpmb3IgZXhw
b3J0ZXJzLCBvciBmb3IgaW1wb3J0ZXJzLgoKdjI6IENoYW5nZSB0aGUgY29udHJvbCBmbG93IGxl
c3MgY29tcGFyZWQgdG8gd2hhdCdzIHRoZXJlIChUaG9tYXMpCgpDYzogVGhvbWFzIFppbW1lcm1h
bm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+CkNjOiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0
LmNvbT4KQ2M6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+CkNjOiBOb3JhbGYgVHLDuG5u
ZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KQWNrZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emlt
bWVybWFubkBzdXNlLmRlPgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0
dGVyQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIu
YyB8IDExICsrKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA1IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3NobWVtX2hl
bHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMKaW5kZXggMmE3
MDE1OWQ1MGVmLi45NTQwNDc4ZTA0MzQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
Z2VtX3NobWVtX2hlbHBlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3NobWVtX2hl
bHBlci5jCkBAIC0yNTIsMTUgKzI1MiwxNSBAQCBzdGF0aWMgdm9pZCAqZHJtX2dlbV9zaG1lbV92
bWFwX2xvY2tlZChzdHJ1Y3QgZHJtX2dlbV9zaG1lbV9vYmplY3QgKnNobWVtKQogCWlmIChzaG1l
bS0+dm1hcF91c2VfY291bnQrKyA+IDApCiAJCXJldHVybiBzaG1lbS0+dmFkZHI7CiAKLQlyZXQg
PSBkcm1fZ2VtX3NobWVtX2dldF9wYWdlcyhzaG1lbSk7Ci0JaWYgKHJldCkKLQkJZ290byBlcnJf
emVyb191c2U7Ci0KIAlpZiAob2JqLT5pbXBvcnRfYXR0YWNoKSB7CiAJCXNobWVtLT52YWRkciA9
IGRtYV9idWZfdm1hcChvYmotPmltcG9ydF9hdHRhY2gtPmRtYWJ1Zik7CiAJfSBlbHNlIHsKIAkJ
cGdwcm90X3QgcHJvdCA9IFBBR0VfS0VSTkVMOwogCisJCXJldCA9IGRybV9nZW1fc2htZW1fZ2V0
X3BhZ2VzKHNobWVtKTsKKwkJaWYgKHJldCkKKwkJCWdvdG8gZXJyX3plcm9fdXNlOworCiAJCWlm
ICghc2htZW0tPm1hcF9jYWNoZWQpCiAJCQlwcm90ID0gcGdwcm90X3dyaXRlY29tYmluZShwcm90
KTsKIAkJc2htZW0tPnZhZGRyID0gdm1hcChzaG1lbS0+cGFnZXMsIG9iai0+c2l6ZSA+PiBQQUdF
X1NISUZULApAQCAtMjc2LDcgKzI3Niw4IEBAIHN0YXRpYyB2b2lkICpkcm1fZ2VtX3NobWVtX3Zt
YXBfbG9ja2VkKHN0cnVjdCBkcm1fZ2VtX3NobWVtX29iamVjdCAqc2htZW0pCiAJcmV0dXJuIHNo
bWVtLT52YWRkcjsKIAogZXJyX3B1dF9wYWdlczoKLQlkcm1fZ2VtX3NobWVtX3B1dF9wYWdlcyhz
aG1lbSk7CisJaWYgKCFvYmotPmltcG9ydF9hdHRhY2gpCisJCWRybV9nZW1fc2htZW1fcHV0X3Bh
Z2VzKHNobWVtKTsKIGVycl96ZXJvX3VzZToKIAlzaG1lbS0+dm1hcF91c2VfY291bnQgPSAwOwog
Ci0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
