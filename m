Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19370B1286
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 18:00:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FB666EDB9;
	Thu, 12 Sep 2019 16:00:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C76F36EDB9
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 16:00:52 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id q5so16265696pfg.13
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 09:00:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fZDNqEnv4EmFhQfK0XZBrV/jYzvQOHibAKE2NrjIUg0=;
 b=JD35rxsrcRuHfBs6pYNEPu9qNS3R4T20th9+a2eDU0YiJB+ieLB4qJ1RMFad2mDAVI
 fMZW3oROAOYKiczfZ21dMSakP3laWHwx1qTcC2QVapQLazT4z57nkU7Mun0CQcD27Lvm
 1Z40gzaevddPZivFw7yPW3wwEmxJbHv3wkJpj45aD8vyQms2IBmQwY8bbb9ZYXPKwSkT
 0mFXP4uGte/xqxVCa3o5053YhtNSnvXuumekNgOd02+XSqx6Wrn8LSJ5Ssp4VABAetoB
 /9LaubLQpI0UsT/k8syVIQ2P/YX9oO7B6SDHjbRZQ9RtVY1F8RnMz3MlQ25WufxAYbsO
 fRsA==
X-Gm-Message-State: APjAAAWW1WOgDqTkxNduev5vwvgQMbFsCAmIEiEksF9cJQFCZLDlQol6
 X/D0yg1VR/PWn41H/dKAvo7BeEA44qM=
X-Google-Smtp-Source: APXvYqw/ay5iAGudFoue/juWTHwzUaTUPAvaaep73lKG3ftykR072bfY4K+CVgDD8Hjs5ekI18e+zA==
X-Received: by 2002:a62:5583:: with SMTP id j125mr5989380pfb.257.1568304052145; 
 Thu, 12 Sep 2019 09:00:52 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:e9ae:bd45:1bd9:e60d])
 by smtp.gmail.com with ESMTPSA id v18sm20573654pgl.87.2019.09.12.09.00.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2019 09:00:51 -0700 (PDT)
From: David Riley <davidriley@chromium.org>
To: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Subject: [PATCH] drm/virtio: Fix warning in
 virtio_gpu_queue_fenced_ctrl_buffer.
Date: Thu, 12 Sep 2019 09:00:48 -0700
Message-Id: <20190912160048.212495-1-davidriley@chromium.org>
X-Mailer: git-send-email 2.23.0.237.gc6a4ce50a0-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fZDNqEnv4EmFhQfK0XZBrV/jYzvQOHibAKE2NrjIUg0=;
 b=n9ZAP1ukn//d7pJMbvivuEhJH9dW8ljZ3TQSume+cAb44Ay5une9clipJXr+osOEVJ
 UmnNf68fglbomW2DPCZpTYraLXqQifTF+Ka9DIkPOtu2DnS8xS/cbfpahKe80ek4KW/F
 D1gSaIhFJjokLkMezGrZ1q7xVooMDYgUZZ6yc=
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
Cc: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4IHdhcm5pbmcgaW50cm9kdWNlZCB3aXRoIGNvbW1pdCBlMTIxOGI4YzBjYzEKKCJkcm0vdmly
dGlvOiBVc2Ugdm1hbGxvYyBmb3IgY29tbWFuZCBidWZmZXIgYWxsb2NhdGlvbnMuIikKZnJvbSBk
cm0tbWlzYy1uZXh0LgoKU2lnbmVkLW9mZi1ieTogRGF2aWQgUmlsZXkgPGRhdmlkcmlsZXlAY2hy
b21pdW0ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV92cS5jIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3ZxLmMgYi9kcml2ZXJzL2dwdS9k
cm0vdmlydGlvL3ZpcnRncHVfdnEuYwppbmRleCA5ZjliNzgyZGQzMzIuLjgwMTc2ZjM3OWFkNSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3ZxLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3ZxLmMKQEAgLTM1OCw3ICszNTgsNyBAQCBzdGF0
aWMgdm9pZCB2aXJ0aW9fZ3B1X3F1ZXVlX2ZlbmNlZF9jdHJsX2J1ZmZlcihzdHJ1Y3QgdmlydGlv
X2dwdV9kZXZpY2UgKnZnZGV2LAogCQkJc2d0ID0gdm1hbGxvY190b19zZ3QodmJ1Zi0+ZGF0YV9i
dWYsIHZidWYtPmRhdGFfc2l6ZSwKIAkJCQkJICAgICAmb3V0Y250KTsKIAkJCWlmICghc2d0KQot
CQkJCXJldHVybiAtRU5PTUVNOworCQkJCXJldHVybjsKIAkJCXZvdXQgPSBzZ3QtPnNnbDsKIAkJ
fSBlbHNlIHsKIAkJCXNnX2luaXRfb25lKCZzZywgdmJ1Zi0+ZGF0YV9idWYsIHZidWYtPmRhdGFf
c2l6ZSk7Ci0tIAoyLjIzLjAuMTYyLmcwYjlmYmIzNzM0LWdvb2cKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
