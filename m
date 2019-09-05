Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D74A9B19
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 09:05:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B460189D8D;
	Thu,  5 Sep 2019 07:05:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3CD889D81;
 Thu,  5 Sep 2019 07:05:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5140B881351;
 Thu,  5 Sep 2019 07:05:16 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-72.ams2.redhat.com
 [10.36.117.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 02EC4600F8;
 Thu,  5 Sep 2019 07:05:11 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 507A631EEA; Thu,  5 Sep 2019 09:05:10 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/8] drm/nouveau: switch to gem vma offset manager
Date: Thu,  5 Sep 2019 09:05:03 +0200
Message-Id: <20190905070509.22407-3-kraxel@redhat.com>
In-Reply-To: <20190905070509.22407-1-kraxel@redhat.com>
References: <20190905070509.22407-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.69]); Thu, 05 Sep 2019 07:05:16 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Ben Skeggs <bskeggs@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UGFzcyBnZW0gdm1hX29mZnNldF9tYW5hZ2VyIHRvIHR0bV9ib19kZXZpY2VfaW5pdCgpLCBzbyB0
dG0gdXNlcyBpdAppbnN0ZWFkIG9mIGl0cyBvd24gZW1iZWRkZWQgc3RydWN0LiAgVGhpcyBtYWtl
cyBzb21lIGdlbSBmdW5jdGlvbnMKKHNwZWNpZmljYWxseSBkcm1fZ2VtX29iamVjdF9sb29rdXAp
IHdvcmsgb24gdHRtIG9iamVjdHMuCgpTaWduZWQtb2ZmLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4
ZWxAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3R0bS5j
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV90dG0uYyBiL2RyaXZl
cnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfdHRtLmMKaW5kZXggZTY3ZWIxMDg0M2QxLi43N2Ew
YzZhZDNjZWYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfdHRt
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV90dG0uYwpAQCAtMjM2LDcg
KzIzNiw3IEBAIG5vdXZlYXVfdHRtX2luaXQoc3RydWN0IG5vdXZlYXVfZHJtICpkcm0pCiAJcmV0
ID0gdHRtX2JvX2RldmljZV9pbml0KCZkcm0tPnR0bS5iZGV2LAogCQkJCSAgJm5vdXZlYXVfYm9f
ZHJpdmVyLAogCQkJCSAgZGV2LT5hbm9uX2lub2RlLT5pX21hcHBpbmcsCi0JCQkJIE5VTEwsCisJ
CQkJICBkZXYtPnZtYV9vZmZzZXRfbWFuYWdlciwKIAkJCQkgIGRybS0+Y2xpZW50Lm1tdS5kbWFi
aXRzIDw9IDMyID8gdHJ1ZSA6IGZhbHNlKTsKIAlpZiAocmV0KSB7CiAJCU5WX0VSUk9SKGRybSwg
ImVycm9yIGluaXRpYWxpc2luZyBibyBkcml2ZXIsICVkXG4iLCByZXQpOwotLSAKMi4xOC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
