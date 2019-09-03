Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB551A6E41
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 18:25:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 799A9897C3;
	Tue,  3 Sep 2019 16:25:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6FCD897C3
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 16:25:54 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 75A4823717;
 Tue,  3 Sep 2019 16:25:52 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 019/167] drm/atomic_helper: Disallow new modesets
 on unregistered connectors
Date: Tue,  3 Sep 2019 12:22:51 -0400
Message-Id: <20190903162519.7136-19-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190903162519.7136-1-sashal@kernel.org>
References: <20190903162519.7136-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1567527953;
 bh=qUDXs+NRk9kq4QOIe8TO4tnvqCIQP/qICPClCjAc3Kg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dmWpGoTvgLAU39UmPomTJN0cDldoLCAmFcFhgkXF/7hPqzeFCfo3PQRxaknskDlvn
 Hki1MiXQwZ3+1HJnxHqOT1rGq97dGgDqNrI/u7C8w+OyvENyYaklTy2tyfYXpKuxrv
 g9oavyA++9iG5MnftRgY0vzrVhW1kh7DmUNcHTq4=
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
Cc: Sasha Levin <sashal@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KClsgVXBzdHJlYW0gY29tbWl0IDRk
ODAyNzM5NzZiZjg4MGM0YmVkOTM1OWI4ZjJkNDU2NjMxNDBjODYgXQoKV2l0aCB0aGUgZXhjZXB0
aW9uIG9mIG1vZGVzZXRzIHdoaWNoIHdvdWxkIHN3aXRjaCB0aGUgRFBNUyBzdGF0ZSBvZiBhCmNv
bm5lY3RvciBmcm9tIG9uIHRvIG9mZiwgd2Ugd2FudCB0byBtYWtlIHN1cmUgdGhhdCB3ZSBkaXNh
bGxvdyBhbGwKbW9kZXNldHMgd2hpY2ggd291bGQgcmVzdWx0IGluIGVuYWJsaW5nIGEgbmV3IG1v
bml0b3Igb3IgYSBuZXcgbW9kZQpjb25maWd1cmF0aW9uIG9uIGEgbW9uaXRvciBpZiB0aGUgY29u
bmVjdG9yIGZvciB0aGUgZGlzcGxheSBpbiBxdWVzdGlvbgppcyBubyBsb25nZXIgcmVnaXN0ZXJl
ZC4gVGhpcyBhbGxvd3MgdXMgdG8gc3RvcCB1c2Vyc3BhY2UgZnJvbSB0cnlpbmcgdG8KZW5hYmxl
IG5ldyBkaXNwbGF5cyBvbiBjb25uZWN0b3JzIGZvciBhbiBNU1QgdG9wb2xvZ3kgdGhhdCB3ZXJl
IGp1c3QKcmVtb3ZlZCBmcm9tIHRoZSBzeXN0ZW0sIHdpdGhvdXQgcHJldmVudGluZyB1c2Vyc3Bh
Y2UgZnJvbSBkaXNhYmxpbmcKRFBNUyBvbiB0aG9zZSBjb25uZWN0b3JzLgoKQ2hhbmdlcyBzaW5j
ZSB2NToKLSBGaXggdHlwbyBpbiBjb21tZW50LCBub3RoaW5nIGVsc2UKClNpZ25lZC1vZmYtYnk6
IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+ClJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVy
IDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwpMaW5r
OiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvbXNnaWQvMjAxODEwMDgy
MzI0MzcuNTU3MS0yLWx5dWRlQHJlZGhhdC5jb20KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4g
PHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX2hlbHBl
ci5jIHwgMjEgKysrKysrKysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
YXRvbWljX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfaGVscGVyLmMKaW5k
ZXggYzIyMDYyY2M5OTkyMy4uNzFjNzBhMDMxYTA0MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9hdG9taWNfaGVscGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNf
aGVscGVyLmMKQEAgLTMwNyw2ICszMDcsMjYgQEAgdXBkYXRlX2Nvbm5lY3Rvcl9yb3V0aW5nKHN0
cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSwKIAkJcmV0dXJuIDA7CiAJfQogCisJY3J0Y19z
dGF0ZSA9IGRybV9hdG9taWNfZ2V0X25ld19jcnRjX3N0YXRlKHN0YXRlLAorCQkJCQkJICAgbmV3
X2Nvbm5lY3Rvcl9zdGF0ZS0+Y3J0Yyk7CisJLyoKKwkgKiBGb3IgY29tcGF0aWJpbGl0eSB3aXRo
IGxlZ2FjeSB1c2Vycywgd2Ugd2FudCB0byBtYWtlIHN1cmUgdGhhdAorCSAqIHdlIGFsbG93IERQ
TVMgT24tPk9mZiBtb2Rlc2V0cyBvbiB1bnJlZ2lzdGVyZWQgY29ubmVjdG9ycy4gTW9kZXNldHMK
KwkgKiB3aGljaCB3b3VsZCByZXN1bHQgaW4gYW55dGhpbmcgZWxzZSBtdXN0IGJlIGNvbnNpZGVy
ZWQgaW52YWxpZCwgdG8KKwkgKiBhdm9pZCB0dXJuaW5nIG9uIG5ldyBkaXNwbGF5cyBvbiBkZWFk
IGNvbm5lY3RvcnMuCisJICoKKwkgKiBTaW5jZSB0aGUgY29ubmVjdG9yIGNhbiBiZSB1bnJlZ2lz
dGVyZWQgYXQgYW55IHBvaW50IGR1cmluZyBhbgorCSAqIGF0b21pYyBjaGVjayBvciBjb21taXQs
IHRoaXMgaXMgcmFjeS4gQnV0IHRoYXQncyBPSzogYWxsIHdlIGNhcmUKKwkgKiBhYm91dCBpcyBl
bnN1cmluZyB0aGF0IHVzZXJzcGFjZSBjYW4ndCBkbyBhbnl0aGluZyBidXQgc2h1dCBvZmYgdGhl
CisJICogZGlzcGxheSBvbiBhIGNvbm5lY3RvciB0aGF0IHdhcyBkZXN0cm95ZWQgYWZ0ZXIgaXRz
IGJlZW4gbm90aWZpZWQsCisJICogbm90IGJlZm9yZS4KKwkgKi8KKwlpZiAoIVJFQURfT05DRShj
b25uZWN0b3ItPnJlZ2lzdGVyZWQpICYmIGNydGNfc3RhdGUtPmFjdGl2ZSkgeworCQlEUk1fREVC
VUdfQVRPTUlDKCJbQ09OTkVDVE9SOiVkOiVzXSBpcyBub3QgcmVnaXN0ZXJlZFxuIiwKKwkJCQkg
Y29ubmVjdG9yLT5iYXNlLmlkLCBjb25uZWN0b3ItPm5hbWUpOworCQlyZXR1cm4gLUVJTlZBTDsK
Kwl9CisKIAlmdW5jcyA9IGNvbm5lY3Rvci0+aGVscGVyX3ByaXZhdGU7CiAKIAlpZiAoZnVuY3Mt
PmF0b21pY19iZXN0X2VuY29kZXIpCkBAIC0zNTEsNyArMzcxLDYgQEAgdXBkYXRlX2Nvbm5lY3Rv
cl9yb3V0aW5nKHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSwKIAogCXNldF9iZXN0X2Vu
Y29kZXIoc3RhdGUsIG5ld19jb25uZWN0b3Jfc3RhdGUsIG5ld19lbmNvZGVyKTsKIAotCWNydGNf
c3RhdGUgPSBkcm1fYXRvbWljX2dldF9uZXdfY3J0Y19zdGF0ZShzdGF0ZSwgbmV3X2Nvbm5lY3Rv
cl9zdGF0ZS0+Y3J0Yyk7CiAJY3J0Y19zdGF0ZS0+Y29ubmVjdG9yc19jaGFuZ2VkID0gdHJ1ZTsK
IAogCURSTV9ERUJVR19BVE9NSUMoIltDT05ORUNUT1I6JWQ6JXNdIHVzaW5nIFtFTkNPREVSOiVk
OiVzXSBvbiBbQ1JUQzolZDolc11cbiIsCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
