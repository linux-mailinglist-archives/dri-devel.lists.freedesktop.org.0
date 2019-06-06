Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC94380A1
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 00:28:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6180289A1E;
	Thu,  6 Jun 2019 22:28:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62223899E8
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 22:28:08 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id z25so5520822edq.9
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 15:28:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M8aVV8Ycuq5zy2NbzxYuNuov6VzzXc/ZD8f0NVGDkY4=;
 b=L9O9y6+5Kb3uDJlKTF+E447vLPzytK2bs97TtMjHlFkX5Tt8uZeBkz4UwUmjU5aWmp
 RxCwzmRQp/I0nhgxfrn7YpRApee/CUVhO+gGa7mNIyX6YSSSyS9RVwhuNgJKPRbofwMG
 6odDod6JcVaDonR8oahFbJgj6MNmmTrXD9nnvYfRjaegV87VZBbVTLMlRwjwwt8zDwwz
 fZzzyTQQI7wUmmGCztOkaW/wQQNzRTI1NGnuX8vt2qQyatFH4o4YOc2SCV+iitcJgeNM
 f191Kh7C5M5dcbjaV+altNhrxHMkL3c+ZUrMwOKcTmr/jJnY2pn11qBvVNXoTG+2Xv+2
 DR9Q==
X-Gm-Message-State: APjAAAUvYRq+6bcuRfBNr1rZ9VVtV3yskya5LxLut7n0CzglFnAqnCRV
 05CKYAZaPKqNvFuHJY/G9duUc5HhMB8=
X-Google-Smtp-Source: APXvYqze8nixDCgbJZeZmta1OAUZvf3xuloQqTnO4cVn2C8/So0Qi4+nt8Hv0e5JZY7kj0vlmHJJGQ==
X-Received: by 2002:a17:906:421a:: with SMTP id
 z26mr37200213ejk.6.1559860086548; 
 Thu, 06 Jun 2019 15:28:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id z10sm54228edl.35.2019.06.06.15.28.05
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 06 Jun 2019 15:28:05 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 05/10] drm/vkms: Add our own commit_tail
Date: Fri,  7 Jun 2019 00:27:46 +0200
Message-Id: <20190606222751.32567-6-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190606222751.32567-1-daniel.vetter@ffwll.ch>
References: <20190606222751.32567-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M8aVV8Ycuq5zy2NbzxYuNuov6VzzXc/ZD8f0NVGDkY4=;
 b=A1kLRMnDvcFdxL9crW3qKCGX0rCjmJESBhvhw+OOWRXutSAgwVu/2wY69sdbnZ39/S
 hf3qg6aHY+ALVcr52hP2EF61rttWq4rpZQFpO5zC82P8SgTtKA4J0IA+F5LBZ6t5gOrk
 tY3o0t9wFp/UCtjJsD5uZo/EXlyGyKX9/P290=
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
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SnVzdCBwcmVwIHdvcmssIG1vcmUgd2lsbCBiZSBkb25lIGhlcmUgaW4gZm9sbG93aW5nIHBhdGNo
ZXMuCgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNv
bT4KQ2M6IFJvZHJpZ28gU2lxdWVpcmEgPHJvZHJpZ29zaXF1ZWlyYW1lbG9AZ21haWwuY29tPgpD
YzogSGFuZWVuIE1vaGFtbWVkIDxoYW1vaGFtbWVkLnNhQGdtYWlsLmNvbT4KQ2M6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2Ry
di5jIHwgMjUgKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDI1IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2Rydi5j
IGIvZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19kcnYuYwppbmRleCA3MzhkZDYyMDZkODUuLmY2
NzdhYjFkMDA5NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19kcnYuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2Rydi5jCkBAIC0xMSw2ICsxMSw3IEBACiAK
ICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KICNpbmNsdWRlIDxkcm0vZHJtX2dlbS5oPgorI2lu
Y2x1ZGUgPGRybS9kcm1fYXRvbWljLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9hdG9taWNfaGVscGVy
Lmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9nZW1fZnJhbWVidWZmZXJfaGVscGVyLmg+CiAjaW5jbHVk
ZSA8ZHJtL2RybV9mYl9oZWxwZXIuaD4KQEAgLTU4LDYgKzU5LDI1IEBAIHN0YXRpYyB2b2lkIHZr
bXNfcmVsZWFzZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQogCWRlc3Ryb3lfd29ya3F1ZXVlKHZr
bXMtPm91dHB1dC5jcmNfd29ya3EpOwogfQogCitzdGF0aWMgdm9pZCB2a21zX2F0b21pY19jb21t
aXRfdGFpbChzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqb2xkX3N0YXRlKQoreworCXN0cnVjdCBk
cm1fZGV2aWNlICpkZXYgPSBvbGRfc3RhdGUtPmRldjsKKworCWRybV9hdG9taWNfaGVscGVyX2Nv
bW1pdF9tb2Rlc2V0X2Rpc2FibGVzKGRldiwgb2xkX3N0YXRlKTsKKworCWRybV9hdG9taWNfaGVs
cGVyX2NvbW1pdF9wbGFuZXMoZGV2LCBvbGRfc3RhdGUsIDApOworCisJZHJtX2F0b21pY19oZWxw
ZXJfY29tbWl0X21vZGVzZXRfZW5hYmxlcyhkZXYsIG9sZF9zdGF0ZSk7CisKKwlkcm1fYXRvbWlj
X2hlbHBlcl9mYWtlX3ZibGFuayhvbGRfc3RhdGUpOworCisJZHJtX2F0b21pY19oZWxwZXJfY29t
bWl0X2h3X2RvbmUob2xkX3N0YXRlKTsKKworCWRybV9hdG9taWNfaGVscGVyX3dhaXRfZm9yX3Zi
bGFua3MoZGV2LCBvbGRfc3RhdGUpOworCisJZHJtX2F0b21pY19oZWxwZXJfY2xlYW51cF9wbGFu
ZXMoZGV2LCBvbGRfc3RhdGUpOworfQorCiBzdGF0aWMgc3RydWN0IGRybV9kcml2ZXIgdmttc19k
cml2ZXIgPSB7CiAJLmRyaXZlcl9mZWF0dXJlcwk9IERSSVZFUl9NT0RFU0VUIHwgRFJJVkVSX0FU
T01JQyB8IERSSVZFUl9HRU0sCiAJLnJlbGVhc2UJCT0gdmttc19yZWxlYXNlLApAQCAtODAsNiAr
MTAwLDEwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX21vZGVfY29uZmlnX2Z1bmNzIHZrbXNf
bW9kZV9mdW5jcyA9IHsKIAkuYXRvbWljX2NvbW1pdCA9IGRybV9hdG9taWNfaGVscGVyX2NvbW1p
dCwKIH07CiAKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX21vZGVfY29uZmlnX2hlbHBlcl9mdW5j
cyB2a21zX21vZGVfY29uZmlnX2hlbHBlcnMgPSB7CisJLmF0b21pY19jb21taXRfdGFpbCA9IHZr
bXNfYXRvbWljX2NvbW1pdF90YWlsLAorfTsKKwogc3RhdGljIGludCB2a21zX21vZGVzZXRfaW5p
dChzdHJ1Y3Qgdmttc19kZXZpY2UgKnZrbXNkZXYpCiB7CiAJc3RydWN0IGRybV9kZXZpY2UgKmRl
diA9ICZ2a21zZGV2LT5kcm07CkBAIC05MSw2ICsxMTUsNyBAQCBzdGF0aWMgaW50IHZrbXNfbW9k
ZXNldF9pbml0KHN0cnVjdCB2a21zX2RldmljZSAqdmttc2RldikKIAlkZXYtPm1vZGVfY29uZmln
Lm1heF93aWR0aCA9IFhSRVNfTUFYOwogCWRldi0+bW9kZV9jb25maWcubWF4X2hlaWdodCA9IFlS
RVNfTUFYOwogCWRldi0+bW9kZV9jb25maWcucHJlZmVycmVkX2RlcHRoID0gMjQ7CisJZGV2LT5t
b2RlX2NvbmZpZy5oZWxwZXJfcHJpdmF0ZSA9ICZ2a21zX21vZGVfY29uZmlnX2hlbHBlcnM7CiAK
IAlyZXR1cm4gdmttc19vdXRwdXRfaW5pdCh2a21zZGV2KTsKIH0KLS0gCjIuMjAuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
