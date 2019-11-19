Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DF9103029
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 00:28:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 729E26E9EE;
	Tue, 19 Nov 2019 23:28:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 431156E311
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 14:28:13 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 3/6] gpu/drm: ingenic: Use the plane's src_[x,
 y] to configure DMA length
Date: Tue, 19 Nov 2019 15:17:33 +0100
Message-Id: <20191119141736.74607-3-paul@crapouillou.net>
In-Reply-To: <20191119141736.74607-1-paul@crapouillou.net>
References: <20191119141736.74607-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 19 Nov 2019 23:28:08 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; 
 s=mail; t=1574173066; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OS0h2Ggg0b56cOSobtp4VRoJMemsoZrzaLZRtyDPpVY=;
 b=U2Ab5tl5RgP93po3s3jGRYQnUOPa+NEAxx4xgdMlmqap1W9fZu5mv9FMBgfJkvuBUt77Ei
 h2f6TRrhQ2d6H4DGVqAYY0syO7SCXoh2vzPWAsOIYCgg/GtXBhdblt2K7Z+Q8dthB/eJCp
 P1WZdmqVNi0KtuNolxBY55l0FrsQA28=
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
Cc: Paul Cercueil <paul@crapouillou.net>, devicetree@vger.kernel.org,
 od@zcrc.me, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW5zdGVhZCBvZiBvYnRhaW5pbmcgdGhlIHdpZHRoL2hlaWdodCBvZiB0aGUgZnJhbWVidWZmZXIg
ZnJvbSB0aGUgQ1JUQwpzdGF0ZSwgb2J0YWluIGl0IGZyb20gdGhlIGN1cnJlbnQgcGxhbmUgc3Rh
dGUuCgpTaWduZWQtb2ZmLWJ5OiBQYXVsIENlcmN1ZWlsIDxwYXVsQGNyYXBvdWlsbG91Lm5ldD4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vaW5nZW5pYy9pbmdlbmljLWRybS5jIHwgNCArKy0tCiAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9pbmdlbmljL2luZ2VuaWMtZHJtLmMgYi9kcml2ZXJzL2dwdS9kcm0v
aW5nZW5pYy9pbmdlbmljLWRybS5jCmluZGV4IDZkYzRiMDZlN2U2OC4uN2ExNzIyNzFiZDYzIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaW5nZW5pYy9pbmdlbmljLWRybS5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9pbmdlbmljL2luZ2VuaWMtZHJtLmMKQEAgLTM3NCw4ICszNzQsOCBAQCBz
dGF0aWMgdm9pZCBpbmdlbmljX2RybV9wbGFuZV9hdG9taWNfdXBkYXRlKHN0cnVjdCBkcm1fcGxh
bmUgKnBsYW5lLAogCXN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiID0gc3RhdGUtPmZiOwogCiAJ
aWYgKGZiKSB7Ci0JCXdpZHRoID0gc3RhdGUtPmNydGMtPnN0YXRlLT5hZGp1c3RlZF9tb2RlLmhk
aXNwbGF5OwotCQloZWlnaHQgPSBzdGF0ZS0+Y3J0Yy0+c3RhdGUtPmFkanVzdGVkX21vZGUudmRp
c3BsYXk7CisJCXdpZHRoID0gc3RhdGUtPnNyY193ID4+IDE2OworCQloZWlnaHQgPSBzdGF0ZS0+
c3JjX2ggPj4gMTY7CiAJCWNwcCA9IGZiLT5mb3JtYXQtPmNwcFtwbGFuZS0+aW5kZXhdOwogCiAJ
CXByaXYtPmRtYV9od2Rlc2MtPmFkZHIgPSBkcm1fZmJfY21hX2dldF9nZW1fYWRkcihmYiwgc3Rh
dGUsIDApOwotLSAKMi4yNC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
