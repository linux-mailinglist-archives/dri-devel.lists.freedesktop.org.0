Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B411EDF40
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jun 2020 10:13:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7FEE6E2E2;
	Thu,  4 Jun 2020 08:12:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 237006E2D7
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jun 2020 08:12:40 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id f5so4624249wmh.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jun 2020 01:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z86jDMPjYosEVmpvz8g87itNg+tEFmiX7DLzwmjjruY=;
 b=IqxGBAw7Ux8mFxKbZqFfhWHBvUThVxHGPJeIMG6V8JAySneDzg1MMfr9dhIgUYw2Fn
 OTAZ0xbCrYCL4eXPkPqfd9hDPavzifvRAdCmfeUmSdOIDkGg1FY43BlyAFoqsAL1182F
 slvaQBsul976QOmZFtX03fE52IJl/0XI4phXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z86jDMPjYosEVmpvz8g87itNg+tEFmiX7DLzwmjjruY=;
 b=Di7QWUfIwXv/M0qNv3Qy8+G5Qtgch7zroFR+mrHELJUiuqqkfe6G2a5JIYFBWec2YY
 cllmJdrroKEIY+E3eCXGRTJtId2cb9kxiPSZJqcCIox0VV+8d85TkFsL3QfTIC62Xdtv
 BYsI2CsAveDZ9KPzU/KyQeAwuUc1KTX6Hj4RoEwHo3mGlrVjcp0PNqiMRIlc7BiMR/Q/
 t6Sb4jTwmXserAVQezUNXQc9R3CDxcqnBOvkzqNlqH1d7LaPANbIEKvN8Wxk2bNXjFw7
 DjsOp+v5h1aMoDsS0ZkPPlAiMM8qp1CTup0aXfepYL0cXxsqxfZ728tOf1Igtm7DbOj1
 RpnQ==
X-Gm-Message-State: AOAM532pl04RjVpIQhQcB3KKY8N0aszbM6F2r9kucbVo5F/mrn1FvfkG
 8N8bNoZ0Hbb7zimZvEIBhcr2ghv7nTM=
X-Google-Smtp-Source: ABdhPJyKQbuv5baACXqVPivWSRwfBW+Y73i/xXeG533ND6BCj6YxPKujbnsSL0XPuqc9zCvklUc7sg==
X-Received: by 2002:a7b:c385:: with SMTP id s5mr3041108wmj.121.1591258358519; 
 Thu, 04 Jun 2020 01:12:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f11sm6873305wrj.2.2020.06.04.01.12.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2020 01:12:37 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 05/18] drm/vkms: Annotate vblank timer
Date: Thu,  4 Jun 2020 10:12:11 +0200
Message-Id: <20200604081224.863494-6-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200604081224.863494-1-daniel.vetter@ffwll.ch>
References: <20200604081224.863494-1-daniel.vetter@ffwll.ch>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, linux-rdma@vger.kernel.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, amd-gfx@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, linaro-mm-sig@lists.linaro.org,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBpcyBuZWVkZWQgdG8gc2lnbmFsIHRoZSBmZW5jZXMgZnJvbSBwYWdlIGZsaXBzLCBhbm5v
dGF0ZSBpdAphY2NvcmRpbmdseS4gV2UgbmVlZCB0byBhbm5vdGF0ZSBlbnRpcmUgdGltZXIgY2Fs
bGJhY2sgc2luY2UgaWYgd2UgZ2V0CnN0dWNrIGFueXdoZXJlIGluIHRoZXJlLCB0aGVuIHRoZSB0
aW1lciBzdG9wcywgYW5kIGhlbmNlIGZlbmNlcyBzdG9wLgpKdXN0IGFubm90YXRpbmcgdGhlIHRv
cCBwYXJ0IHRoYXQgZG9lcyB0aGUgdmJsYW5rIGhhbmRsaW5nIGlzbid0CmVub3VnaC4KCkNjOiBs
aW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJv
Lm9yZwpDYzogbGludXgtcmRtYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCkNjOiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBDaHJp
cyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0
IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+CkNjOiBDaHJpc3RpYW4gS8O2bmln
IDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIg
PGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgpDYzogUm9kcmlnbyBTaXF1ZWlyYSA8cm9kcmlnb3Np
cXVlaXJhbWVsb0BnbWFpbC5jb20+CkNjOiBIYW5lZW4gTW9oYW1tZWQgPGhhbW9oYW1tZWQuc2FA
Z21haWwuY29tPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS92a21zL3ZrbXNfY3J0Yy5jIHwgOCArKysrKysrLQogMSBmaWxlIGNoYW5nZWQs
IDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS92a21zL3ZrbXNfY3J0Yy5jIGIvZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19jcnRjLmMK
aW5kZXggYWM4NWUxNzQyOGY4Li5hNTNhNDA4NDhhNzIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS92a21zL3ZrbXNfY3J0Yy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfY3J0
Yy5jCkBAIC0xLDUgKzEsNyBAQAogLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAr
CiAKKyNpbmNsdWRlIDxsaW51eC9kbWEtZmVuY2UuaD4KKwogI2luY2x1ZGUgPGRybS9kcm1fYXRv
bWljLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9hdG9taWNfaGVscGVyLmg+CiAjaW5jbHVkZSA8ZHJt
L2RybV9wcm9iZV9oZWxwZXIuaD4KQEAgLTE0LDcgKzE2LDkgQEAgc3RhdGljIGVudW0gaHJ0aW1l
cl9yZXN0YXJ0IHZrbXNfdmJsYW5rX3NpbXVsYXRlKHN0cnVjdCBocnRpbWVyICp0aW1lcikKIAlz
dHJ1Y3QgZHJtX2NydGMgKmNydGMgPSAmb3V0cHV0LT5jcnRjOwogCXN0cnVjdCB2a21zX2NydGNf
c3RhdGUgKnN0YXRlOwogCXU2NCByZXRfb3ZlcnJ1bjsKLQlib29sIHJldDsKKwlib29sIHJldCwg
ZmVuY2VfY29va2llOworCisJZmVuY2VfY29va2llID0gZG1hX2ZlbmNlX2JlZ2luX3NpZ25hbGxp
bmcoKTsKIAogCXJldF9vdmVycnVuID0gaHJ0aW1lcl9mb3J3YXJkX25vdygmb3V0cHV0LT52Ymxh
bmtfaHJ0aW1lciwKIAkJCQkJICBvdXRwdXQtPnBlcmlvZF9ucyk7CkBAIC00OSw2ICs1Myw4IEBA
IHN0YXRpYyBlbnVtIGhydGltZXJfcmVzdGFydCB2a21zX3ZibGFua19zaW11bGF0ZShzdHJ1Y3Qg
aHJ0aW1lciAqdGltZXIpCiAJCQlEUk1fREVCVUdfRFJJVkVSKCJDb21wb3NlciB3b3JrZXIgYWxy
ZWFkeSBxdWV1ZWRcbiIpOwogCX0KIAorCWRtYV9mZW5jZV9lbmRfc2lnbmFsbGluZyhmZW5jZV9j
b29raWUpOworCiAJcmV0dXJuIEhSVElNRVJfUkVTVEFSVDsKIH0KIAotLSAKMi4yNi4yCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
