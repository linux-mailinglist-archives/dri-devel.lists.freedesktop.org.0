Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5635D19D848
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 15:59:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D88276EBBA;
	Fri,  3 Apr 2020 13:59:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC9E6EBBF
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 13:59:01 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id j19so7823715wmi.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 06:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JTFc31a0+JMT1c1efx4ck7OuYVXoj2qV+2r041IFRE0=;
 b=dL1UZqlX5BOjlCUHFiE5o/70D/W650xWV7EbTdkuv6BN/7o/8YAhaNcANIT/GPY1eE
 b8hap82XHg3rJ24jB3qmqKoAkn5uLgqTWy0OpeGoNUvDL2jCKRHbgHb8Hm4kdfVXx4xO
 0tm3LaTZ/+lU408NauM+v1Jd205RgGUCsND9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JTFc31a0+JMT1c1efx4ck7OuYVXoj2qV+2r041IFRE0=;
 b=pObIt3uBJM//TvZQIHmZxb5nmuOAWD7qVvJ69qbDZ8owMSIrzjJw06Q45Rfdf7KVJN
 7shkLqvusWtQj52Ec3hbrzrJMMDYEy7QlaMDk0eOs6kl85G3izEyjy+s4qFXPNUilgz1
 X6E0eZuIEQwaxv05bFkJGqoRy/ZKuBFCsWWqRNtD53HjOHc6I+4+x6IXEyLlWp0LdA9d
 bRreVIQlVchS9VAJxq7FxJkJKbwOQD2RhpmF5xCabfOtplBSnDyFFfBOthq+kVUsAnwX
 zKcvUKUL8WKrr+zKNjyX9RpN6aiDnkFsr+1YaGpM2lyAciuX5Y32it6aWpnZMStH6BO7
 kcnA==
X-Gm-Message-State: AGi0PubdDnfVIRMFy3Zcz8Sy9YumLoa2s8CZxNv4lstEuvUnPVkWVtxv
 lHDYezPFLRf7gNPxjnHcbg9MoPhuFJ4mMg==
X-Google-Smtp-Source: APiQypIuWCAaOzwYiEIPYzSD8arsjEPVtqxDtFK9dHCbLieuzd0ZjDmt2WUJq9B+G8+LdnH6XRu5MA==
X-Received: by 2002:a7b:c842:: with SMTP id c2mr9309221wml.154.1585922340144; 
 Fri, 03 Apr 2020 06:59:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f141sm11783919wmf.3.2020.04.03.06.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 06:58:59 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 22/44] drm/ili9341: Use devm_drm_dev_alloc
Date: Fri,  3 Apr 2020 15:58:06 +0200
Message-Id: <20200403135828.2542770-23-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
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
Cc: David Lechner <david@lechnology.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWxyZWFkeSB1c2luZyBkZXZtX2RybV9kZXZfaW5pdCwgc28gdmVyeSBzaW1wbGUgcmVwbGFjbWVu
dC4KClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29t
PgpDYzogIk5vcmFsZiBUcsO4bm5lcyIgPG5vcmFsZkB0cm9ubmVzLm9yZz4KQ2M6IFNhbSBSYXZu
Ym9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJA
ZmZ3bGwuY2g+CkNjOiBFcmljIEFuaG9sdCA8ZXJpY0BhbmhvbHQubmV0PgpDYzogRGF2aWQgTGVj
aG5lciA8ZGF2aWRAbGVjaG5vbG9neS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3RpbnkvaWxp
OTM0MS5jIHwgMTMgKysrKy0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGlueS9pbGk5
MzQxLmMgYi9kcml2ZXJzL2dwdS9kcm0vdGlueS9pbGk5MzQxLmMKaW5kZXggZTE1MmRlMzY5MDE5
Li5iYjgxOWY0NWE1ZDMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90aW55L2lsaTkzNDEu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vdGlueS9pbGk5MzQxLmMKQEAgLTE4MywxOCArMTgzLDEz
IEBAIHN0YXRpYyBpbnQgaWxpOTM0MV9wcm9iZShzdHJ1Y3Qgc3BpX2RldmljZSAqc3BpKQogCXUz
MiByb3RhdGlvbiA9IDA7CiAJaW50IHJldDsKIAotCWRiaWRldiA9IGt6YWxsb2Moc2l6ZW9mKCpk
YmlkZXYpLCBHRlBfS0VSTkVMKTsKLQlpZiAoIWRiaWRldikKLQkJcmV0dXJuIC1FTk9NRU07CisJ
ZGJpZGV2ID0gZGV2bV9kcm1fZGV2X2FsbG9jKGRldiwgJmlsaTkzNDFfZHJpdmVyLAorCQkJCSAg
ICBzdHJ1Y3QgbWlwaV9kYmlfZGV2LCBkcm0pOworCWlmIChJU19FUlIoZGJpZGV2KSkKKwkJcmV0
dXJuIFBUUl9FUlIoZGJpZGV2KTsKIAogCWRiaSA9ICZkYmlkZXYtPmRiaTsKIAlkcm0gPSAmZGJp
ZGV2LT5kcm07Ci0JcmV0ID0gZGV2bV9kcm1fZGV2X2luaXQoZGV2LCBkcm0sICZpbGk5MzQxX2Ry
aXZlcik7Ci0JaWYgKHJldCkgewotCQlrZnJlZShkYmlkZXYpOwotCQlyZXR1cm4gcmV0OwotCX0K
LQlkcm1tX2FkZF9maW5hbF9rZnJlZShkcm0sIGRiaWRldik7CiAKIAlkYmktPnJlc2V0ID0gZGV2
bV9ncGlvZF9nZXRfb3B0aW9uYWwoZGV2LCAicmVzZXQiLCBHUElPRF9PVVRfSElHSCk7CiAJaWYg
KElTX0VSUihkYmktPnJlc2V0KSkgewotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
