Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D790010688A
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2019 10:01:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0EAE6F4FB;
	Fri, 22 Nov 2019 09:01:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1E9D6EF2E;
 Fri, 22 Nov 2019 01:26:58 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id B635A4FE48;
 Fri, 22 Nov 2019 01:26:57 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: robdclark@gmail.com,
	sean@poorly.run,
	robh+dt@kernel.org
Subject: [PATCH v2 3/4] drm/msm/a3xx: set interconnect bandwidth vote
Date: Thu, 21 Nov 2019 20:26:44 -0500
Message-Id: <20191122012645.7430-4-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191122012645.7430-1-masneyb@onstation.org>
References: <20191122012645.7430-1-masneyb@onstation.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 22 Nov 2019 09:00:44 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1574386018;
 bh=fYnaunSzeUztsvg24uhUc/JRPip4E9qdhSh557hA/nU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TTtFu67dU3/KFQBtae+aBO0uLSAzgTr5FnJE+GZBdaoiarPaUndLiOBzZrOc2fvJO
 i69TN56y014l8kJYpBlMiVBKlaD8RDYEGANKpX+tBfGWaPBmEhX+z5MzVUfN61bd6X
 JRkOkA/CyORl2IfXmK7/7u1/nFDK2cXMNw0I3gqQ=
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2V0IHRoZSB0d28gaW50ZXJjb25uZWN0IHBhdGhzIGZvciB0aGUgR1BVIHRvIG1heGltdW0gc3Bl
ZWQgZm9yIG5vdyB0bwp3b3JrIHRvd2FyZHMgZ2V0dGluZyB0aGUgR1BVIHdvcmtpbmcgdXBzdHJl
YW0uIFdlIGNhbiByZXZpc2l0IGEgbGF0ZXIKdGltZSB0byBvcHRpbWl6ZSB0aGlzIGZvciBiYXR0
ZXJ5IGxpZmUuCgpTaWduZWQtb2ZmLWJ5OiBCcmlhbiBNYXNuZXkgPG1hc25leWJAb25zdGF0aW9u
Lm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hM3h4X2dwdS5jIHwgOCArKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9tc20vYWRyZW5vL2EzeHhfZ3B1LmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Fk
cmVuby9hM3h4X2dwdS5jCmluZGV4IDA3ZGRjYzUyOTU3My4uZWZmMGVjZDRlODFhIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hM3h4X2dwdS5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9tc20vYWRyZW5vL2EzeHhfZ3B1LmMKQEAgLTUwNCw2ICs1MDQsMTQgQEAgc3RydWN0
IG1zbV9ncHUgKmEzeHhfZ3B1X2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldikKIAkJRFJNX0RF
Vl9FUlJPUihkZXYtPmRldiwgIk5vIG1lbW9yeSBwcm90ZWN0aW9uIHdpdGhvdXQgSU9NTVVcbiIp
OwogCX0KIAorCS8qCisJICogU2V0IHRoZSBJQ0MgcGF0aCB0byBtYXhpbXVtIHNwZWVkIGZvciBu
b3cgYnkgbXVsdGlwbHlpbmcgdGhlIGZhc3Rlc3QKKwkgKiBmcmVxdWVuY3kgYnkgdGhlIGJ1cyB3
aWR0aCAoOCkuIFdlJ2xsIHdhbnQgdG8gc2NhbGUgdGhpcyBsYXRlciBvbiB0bworCSAqIGltcHJv
dmUgYmF0dGVyeSBsaWZlLgorCSAqLworCWljY19zZXRfYncoZ3B1LT5pY2NfcGF0aCwgMCwgQnBz
X3RvX2ljYyhncHUtPmZhc3RfcmF0ZSkgKiA4KTsKKwlpY2Nfc2V0X2J3KGdwdS0+b2NtZW1faWNj
X3BhdGgsIDAsIEJwc190b19pY2MoZ3B1LT5mYXN0X3JhdGUpICogOCk7CisKIAlyZXR1cm4gZ3B1
OwogCiBmYWlsOgotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
