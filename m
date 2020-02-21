Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B11B81688DE
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 22:05:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F0C06F568;
	Fri, 21 Feb 2020 21:05:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D3296F54E
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 21:04:26 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id m10so6028107wmc.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 13:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GyxR3rEO1FZs5BIiNni8jF96PqjDo3eJFecq4xcaCuE=;
 b=FKqLbwYpCJh/G4beB3K01XZBRr88JdbyVsip7AJAXSusET0Yo7DyFeADuxBZ7pD+a6
 yqJFK+29ItSI31Jbt4X10v9Ak67WXCe6x58B1jb3qH4CwwVx5g9zmJNGTcf62zpXvPxl
 +ID1eRgtQlE0/mfsyou1E+B+AWtgeLSM23qQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GyxR3rEO1FZs5BIiNni8jF96PqjDo3eJFecq4xcaCuE=;
 b=KzPUBSc3LMj8koM44Lol/7yV0W2GghhH9UxCiROLyv4WbuTd2Xhd6C/pSxO8Ztdrpj
 ua6PRce0u5GQsgf+JIFLn8z/IKky+J6hd0puKXbiBt+nkITtJ9+HeX3A70YRojurhGQt
 QgJC1nwGChy5EMOO7CYl4Q5SgomdvjGpJxTTCAvAMhT8aILthD/gE7S9i1opaAPu0fqh
 6qQWUplFOCTd7W60Zjog2X5JN1KwWh5FM0A5hGgLjQgCdk+vS1XpOLL4fSpJh1u/Pjp9
 mAMDB/h4a/Yp0Ar+IlgXx0E7NjmsTHm0DL7evgZnoqXDh13NSgFTfRpp5KhNgSk6VfrF
 zJTQ==
X-Gm-Message-State: APjAAAVJGw4Im7ar1qh11ErY4Kn5DGcuMy3WbwlCPEaDNXGhQLyw1rsN
 2A899IC4QBais+dMSOwN2PwJRvFMWI8=
X-Google-Smtp-Source: APXvYqyIfandGDu5SDngcE91603NqzpDGsO2mWHGOc2I4/cSMYSqcTpzU6J4h7XgOzGxJx2ncmt4Lg==
X-Received: by 2002:a1c:c5:: with SMTP id 188mr5498490wma.187.1582319064492;
 Fri, 21 Feb 2020 13:04:24 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z6sm5483930wrw.36.2020.02.21.13.04.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 13:04:23 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 43/51] drm/gm12u320: Use devm_drm_dev_init
Date: Fri, 21 Feb 2020 22:03:11 +0100
Message-Id: <20200221210319.2245170-44-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200221210319.2245170-1-daniel.vetter@ffwll.ch>
References: <20200221210319.2245170-1-daniel.vetter@ffwll.ch>
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
 Hans de Goede <hdegoede@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T25seSBkcm9wcyB0aGUgZHJtX2Rldl9wdXQsIGJ1dCBoZXkgYSBmZXcgbGluZXMhCgpTaWduZWQt
b2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KQ2M6IEhhbnMg
ZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+CkNjOiAiTm9yYWxmIFRyw7hubmVzIiA8bm9y
YWxmQHRyb25uZXMub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS90aW55L2dtMTJ1MzIwLmMgfCAx
OSArKysrKysrLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAx
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGlueS9nbTEydTMy
MC5jIGIvZHJpdmVycy9ncHUvZHJtL3RpbnkvZ20xMnUzMjAuYwppbmRleCA1YmQyNmZjNmZhZmEu
LjY1ZGZiODdjY2IxMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3RpbnkvZ20xMnUzMjAu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vdGlueS9nbTEydTMyMC5jCkBAIC02NzgsNyArNjc4LDcg
QEAgc3RhdGljIGludCBnbTEydTMyMF91c2JfcHJvYmUoc3RydWN0IHVzYl9pbnRlcmZhY2UgKmlu
dGVyZmFjZSwKIAlpbml0X3dhaXRxdWV1ZV9oZWFkKCZnbTEydTMyMC0+ZmJfdXBkYXRlLndhaXRx
KTsKIAogCWRldiA9ICZnbTEydTMyMC0+ZGV2OwotCXJldCA9IGRybV9kZXZfaW5pdChkZXYsICZn
bTEydTMyMF9kcm1fZHJpdmVyLCAmaW50ZXJmYWNlLT5kZXYpOworCXJldCA9IGRldm1fZHJtX2Rl
dl9pbml0KCZpbnRlcmZhY2UtPmRldiwgZGV2LCAmZ20xMnUzMjBfZHJtX2RyaXZlcik7CiAJaWYg
KHJldCkgewogCQlrZnJlZShnbTEydTMyMCk7CiAJCXJldHVybiByZXQ7CkBAIC02ODgsNyArNjg4
LDcgQEAgc3RhdGljIGludCBnbTEydTMyMF91c2JfcHJvYmUoc3RydWN0IHVzYl9pbnRlcmZhY2Ug
KmludGVyZmFjZSwKIAogCXJldCA9IGRybV9tb2RlX2NvbmZpZ19pbml0KGRldik7CiAJaWYgKHJl
dCkKLQkJZ290byBlcnJfcHV0OworCQlyZXR1cm4gcmV0OwogCiAJZGV2LT5tb2RlX2NvbmZpZy5t
aW5fd2lkdGggPSBHTTEyVTMyMF9VU0VSX1dJRFRIOwogCWRldi0+bW9kZV9jb25maWcubWF4X3dp
ZHRoID0gR00xMlUzMjBfVVNFUl9XSURUSDsKQEAgLTY5OCwxNSArNjk4LDE1IEBAIHN0YXRpYyBp
bnQgZ20xMnUzMjBfdXNiX3Byb2JlKHN0cnVjdCB1c2JfaW50ZXJmYWNlICppbnRlcmZhY2UsCiAK
IAlyZXQgPSBnbTEydTMyMF91c2JfYWxsb2MoZ20xMnUzMjApOwogCWlmIChyZXQpCi0JCWdvdG8g
ZXJyX3B1dDsKKwkJcmV0dXJuIHJldDsKIAogCXJldCA9IGdtMTJ1MzIwX3NldF9lY29tb2RlKGdt
MTJ1MzIwKTsKIAlpZiAocmV0KQotCQlnb3RvIGVycl9wdXQ7CisJCXJldHVybiByZXQ7CiAKIAly
ZXQgPSBnbTEydTMyMF9jb25uX2luaXQoZ20xMnUzMjApOwogCWlmIChyZXQpCi0JCWdvdG8gZXJy
X3B1dDsKKwkJcmV0dXJuIHJldDsKIAogCXJldCA9IGRybV9zaW1wbGVfZGlzcGxheV9waXBlX2lu
aXQoJmdtMTJ1MzIwLT5kZXYsCiAJCQkJCSAgICZnbTEydTMyMC0+cGlwZSwKQEAgLTcxNiwyMiAr
NzE2LDE4IEBAIHN0YXRpYyBpbnQgZ20xMnUzMjBfdXNiX3Byb2JlKHN0cnVjdCB1c2JfaW50ZXJm
YWNlICppbnRlcmZhY2UsCiAJCQkJCSAgIGdtMTJ1MzIwX3BpcGVfbW9kaWZpZXJzLAogCQkJCQkg
ICAmZ20xMnUzMjAtPmNvbm4pOwogCWlmIChyZXQpCi0JCWdvdG8gZXJyX3B1dDsKKwkJcmV0dXJu
IHJldDsKIAogCWRybV9tb2RlX2NvbmZpZ19yZXNldChkZXYpOwogCiAJdXNiX3NldF9pbnRmZGF0
YShpbnRlcmZhY2UsIGRldik7CiAJcmV0ID0gZHJtX2Rldl9yZWdpc3RlcihkZXYsIDApOwogCWlm
IChyZXQpCi0JCWdvdG8gZXJyX3B1dDsKKwkJcmV0dXJuIHJldDsKIAogCWRybV9mYmRldl9nZW5l
cmljX3NldHVwKGRldiwgMCk7CiAKIAlyZXR1cm4gMDsKLQotZXJyX3B1dDoKLQlkcm1fZGV2X3B1
dChkZXYpOwotCXJldHVybiByZXQ7CiB9CiAKIHN0YXRpYyB2b2lkIGdtMTJ1MzIwX3VzYl9kaXNj
b25uZWN0KHN0cnVjdCB1c2JfaW50ZXJmYWNlICppbnRlcmZhY2UpCkBAIC03NDEsNyArNzM3LDYg
QEAgc3RhdGljIHZvaWQgZ20xMnUzMjBfdXNiX2Rpc2Nvbm5lY3Qoc3RydWN0IHVzYl9pbnRlcmZh
Y2UgKmludGVyZmFjZSkKIAogCWdtMTJ1MzIwX3N0b3BfZmJfdXBkYXRlKGdtMTJ1MzIwKTsKIAlk
cm1fZGV2X3VucGx1ZyhkZXYpOwotCWRybV9kZXZfcHV0KGRldik7CiB9CiAKIHN0YXRpYyBfX21h
eWJlX3VudXNlZCBpbnQgZ20xMnUzMjBfc3VzcGVuZChzdHJ1Y3QgdXNiX2ludGVyZmFjZSAqaW50
ZXJmYWNlLAotLSAKMi4yNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
