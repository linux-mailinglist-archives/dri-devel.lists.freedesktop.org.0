Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A19490C8
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 22:04:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C17716E035;
	Mon, 17 Jun 2019 20:04:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F0B6E079
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 20:04:38 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id y57so12405132qtk.4
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 13:04:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hAfYkP7d2WvxOZhRBCRJTvRlF3xI0tTIFNDwNnfuAj0=;
 b=TNr28VXZyVp3zTif6Bp+EWDlR+qvoslPPq/wV2KchHw/sZQrGPY1YQZyylhfOQG8YM
 VpuZ0qIGvFC9fFWdosTEMLy+FNeP47FTuk3TMAyNkIx2FFxZzlh75G6h2bAy1fDO0fyA
 Iv6VqlxWldAMtSrlOBPP7zz02mys+BFeTAWbcoroocbGLZXG8XPMDy6i/z0x5/uOZD6B
 S99RlK6dwrGlRjf6waGO6QOLBwEW8OeS4GwlVXOVyRFmuEKvoUoDA6nB0dIecQX8YxpR
 NbJdN9h3x5v0O4DS9cnERSzXiIFXWaRCVm/0azxf2Txc+9ezbtnc+gCUOGC3YsOJMwPW
 NIug==
X-Gm-Message-State: APjAAAV41q1/MAUHlYQb+AFCOJ8+l1gepq/t/nQjataiBGgYc4tsvZxJ
 hx2qje0Eo5FgRw8PBGIzupsPHzSLSgs=
X-Google-Smtp-Source: APXvYqwF2TgSDN5Rp6djhjPuzRXU95E/oIoie46EqS3shh+tm7T9bkobuH8gat0UT8KQouFk+bGu9A==
X-Received: by 2002:ac8:38c5:: with SMTP id g5mr97751585qtc.299.1560801877766; 
 Mon, 17 Jun 2019 13:04:37 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([100.100.175.19])
 by smtp.gmail.com with ESMTPSA id j26sm8584794qtj.70.2019.06.17.13.04.37
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 13:04:37 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [RESEND PATCH 02/13] drm/msm/dpu: Fix mmu init/destroy functions
Date: Mon, 17 Jun 2019 16:03:46 -0400
Message-Id: <20190617200405.131843-2-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190617200405.131843-1-sean@poorly.run>
References: <20190617200405.131843-1-sean@poorly.run>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hAfYkP7d2WvxOZhRBCRJTvRlF3xI0tTIFNDwNnfuAj0=;
 b=IzC6Yy+dyUFQKAxj9w03NH/zDg/rd4E2TwI45rSFseDlnwX6v6+kw8gp9VzqmxCDIk
 vJB6gvNsKZeEfPQSLfmv0f8EIe9wnUf6b29SjNovXXgi/+5FcZo4I8vsBkGqRnRBL8XO
 5UwD/IvU1nCgpQ49aNWBT9qoVIaZlHeP3dAm+nYmmOxT0hjEWc7nC8OVfaARo5YOXAX2
 ktOc87n3NNWW3Ml6qgLtu2Rda09quP3phgUuyD52cU10F4aJFECK1Q6eqVeL+sCFoI9U
 KgMEtLHvE9NjShWyK6S6KFd1RIIxLzJgJuKZ2eTmlgTSNS5orC2XSbAbpY6KZkuBoH97
 kM0Q==
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Sean Paul <seanpaul@chromium.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpUaGVyZSdzIGEgY29tbWVu
dCBpbiBfZHB1X2ttc19od19kZXN0cm95KCkgdGhhdCByZWFkcyAic2FmZSB0byBjYWxsCnRoZXNl
IG1vcmUgdGhhbiBvbmNlIGR1cmluZyBzaHV0ZG93biIsIHJlZmVycmluZyB0bwpfZHB1X2ttc19t
bXVfZGVzdHJveSgpLiBVbmZvcnR1bmF0ZWx5IHRoYXQncyBub3QgdGhlIGNhc2UsIG1tdV9kZXN0
cm95CndpbGwgZmFpbCBoYXJkIGlmIGl0J3MgY2FsbGVkIHR3aWNlLiBTbyBmaXggdGhhdCBmdW5j
dGlvbiB0byBlbnN1cmUgaXQKY2FuIGJlIGNhbGxlZCBtdWx0aXBsZSB0aW1lcyB3aXRob3V0IGJ1
cm5pbmcuCgpXaGlsZSBJJ20gYXQgaXQsIGZpeCB0aGUgZXJyb3IgcGF0aHMgaW4gX2RwdV9rbXNf
bW11X2luaXQoKSB0byBwcm9wZXJseQpjbGVhbiB1cCB0aGUgaW9tbXUgZG9tYWluIGFuZCBub3Qg
Y2FsbCBfZHB1X2ttc19tbXVfZGVzdHJveSgpIHdoZW4KdGhpbmdzIGFyZSBvbmx5IHBhcnRpYWxs
eSBzZXR1cC4KClNpZ25lZC1vZmYtYnk6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3Jn
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9rbXMuYyB8IDE3ICsrKysr
KysrLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9rbXMu
YyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9rbXMuYwppbmRleCA4ODViZjg4
YWZhM2UuLmQ1MGFmYmIzN2EwYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNw
L2RwdTEvZHB1X2ttcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9r
bXMuYwpAQCAtNzI5LDEyICs3MjksMTYgQEAgc3RhdGljIGludCBfZHB1X2ttc19tbXVfZGVzdHJv
eShzdHJ1Y3QgZHB1X2ttcyAqZHB1X2ttcykKIHsKIAlzdHJ1Y3QgbXNtX21tdSAqbW11OwogCisJ
aWYgKCFkcHVfa21zLT5iYXNlLmFzcGFjZSkKKwkJcmV0dXJuIDA7CisKIAltbXUgPSBkcHVfa21z
LT5iYXNlLmFzcGFjZS0+bW11OwogCiAJbW11LT5mdW5jcy0+ZGV0YWNoKG1tdSwgKGNvbnN0IGNo
YXIgKiopaW9tbXVfcG9ydHMsCiAJCQlBUlJBWV9TSVpFKGlvbW11X3BvcnRzKSk7CiAJbXNtX2dl
bV9hZGRyZXNzX3NwYWNlX3B1dChkcHVfa21zLT5iYXNlLmFzcGFjZSk7CiAKKwlkcHVfa21zLT5i
YXNlLmFzcGFjZSA9IE5VTEw7CiAJcmV0dXJuIDA7CiB9CiAKQEAgLTc1NCwyNSArNzU4LDIwIEBA
IHN0YXRpYyBpbnQgX2RwdV9rbXNfbW11X2luaXQoc3RydWN0IGRwdV9rbXMgKmRwdV9rbXMpCiAJ
YXNwYWNlID0gbXNtX2dlbV9hZGRyZXNzX3NwYWNlX2NyZWF0ZShkcHVfa21zLT5kZXYtPmRldiwK
IAkJCWRvbWFpbiwgImRwdTEiKTsKIAlpZiAoSVNfRVJSKGFzcGFjZSkpIHsKLQkJcmV0ID0gUFRS
X0VSUihhc3BhY2UpOwotCQlnb3RvIGZhaWw7CisJCWlvbW11X2RvbWFpbl9mcmVlKGRvbWFpbik7
CisJCXJldHVybiBQVFJfRVJSKGFzcGFjZSk7CiAJfQogCi0JZHB1X2ttcy0+YmFzZS5hc3BhY2Ug
PSBhc3BhY2U7Ci0KIAlyZXQgPSBhc3BhY2UtPm1tdS0+ZnVuY3MtPmF0dGFjaChhc3BhY2UtPm1t
dSwgaW9tbXVfcG9ydHMsCiAJCQlBUlJBWV9TSVpFKGlvbW11X3BvcnRzKSk7CiAJaWYgKHJldCkg
ewogCQlEUFVfRVJST1IoImZhaWxlZCB0byBhdHRhY2ggaW9tbXUgJWRcbiIsIHJldCk7CiAJCW1z
bV9nZW1fYWRkcmVzc19zcGFjZV9wdXQoYXNwYWNlKTsKLQkJZ290byBmYWlsOworCQlyZXR1cm4g
cmV0OwogCX0KIAorCWRwdV9rbXMtPmJhc2UuYXNwYWNlID0gYXNwYWNlOwogCXJldHVybiAwOwot
ZmFpbDoKLQlfZHB1X2ttc19tbXVfZGVzdHJveShkcHVfa21zKTsKLQotCXJldHVybiByZXQ7CiB9
CiAKIHN0YXRpYyBzdHJ1Y3QgZHNzX2NsayAqX2RwdV9rbXNfZ2V0X2NsayhzdHJ1Y3QgZHB1X2tt
cyAqZHB1X2ttcywKLS0gClNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENo
cm9taXVtIE9TCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
