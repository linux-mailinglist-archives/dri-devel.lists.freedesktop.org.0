Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9928BECB6
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 09:42:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D56D76EDE4;
	Thu, 26 Sep 2019 07:42:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F49C6EBEA
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 14:50:33 +0000 (UTC)
Date: Wed, 25 Sep 2019 16:50:25 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 29/36] drm/ingenic: use bpp instead of cpp for
 drm_format_info
To: Sandy Huang <hjc@rock-chips.com>
Message-Id: <1569423025.1909.1@crapouillou.net>
In-Reply-To: <1569243189-183445-4-git-send-email-hjc@rock-chips.com>
References: <1569243189-183445-1-git-send-email-hjc@rock-chips.com>
 <1569243189-183445-4-git-send-email-hjc@rock-chips.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 26 Sep 2019 07:42:05 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; 
 s=mail; t=1569423030; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZDBS8kzsJvkPXNA7E89mme3Edh+YPdmEM5FwJycTpEo=;
 b=lazSvqe+/UcqO20OmSwiSPUafrOafmGhAjFhLu4g0o10d9MQ2m7nnZG04er+DtGS71YLKt
 7bdANLZHL3Dr2qWisn7gqrm7wQy3Uk535r/HvbQZeN5mMZR/hMz0Tqeyc8hCRMTZ4a1WWC
 pKKvARrAkPtAVzvYkh7BR+AyhTlqY9E=
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2FuZHksCgoKTGUgbHVuLiAyMyBzZXB0LiAyMDE5IMOgIDE0OjUzLCBTYW5keSBIdWFuZyA8
aGpjQHJvY2stY2hpcHMuY29tPiBhIArDqWNyaXQgOgo+IGNwcFtCeXRlUGVyUGxhbmVdIGNhbid0
IGRlc2NyaWJlIHRoZSAxMGJpdCBkYXRhIGZvcm1hdCBjb3JyZWN0bHksCj4gU28gd2UgdXNlIGJw
cFtCaXRQZXJQbGFuZV0gdG8gaW5zdGVhZCBjcHAuCj4gCj4gU2lnbmVkLW9mZi1ieTogU2FuZHkg
SHVhbmcgPGhqY0Byb2NrLWNoaXBzLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2luZ2Vu
aWMvaW5nZW5pYy1kcm0uYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pbmdlbmlj
L2luZ2VuaWMtZHJtLmMgCj4gYi9kcml2ZXJzL2dwdS9kcm0vaW5nZW5pYy9pbmdlbmljLWRybS5j
Cj4gaW5kZXggZWMzMmUxYy4uNzBjY2VjNSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
aW5nZW5pYy9pbmdlbmljLWRybS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2luZ2VuaWMvaW5n
ZW5pYy1kcm0uYwo+IEBAIC0zNzUsNyArMzc1LDcgQEAgc3RhdGljIHZvaWQgCj4gaW5nZW5pY19k
cm1fcGxhbmVfYXRvbWljX3VwZGF0ZShzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwKPiAKPiAgCXdp
ZHRoID0gc3RhdGUtPmNydGMtPnN0YXRlLT5hZGp1c3RlZF9tb2RlLmhkaXNwbGF5Owo+ICAJaGVp
Z2h0ID0gc3RhdGUtPmNydGMtPnN0YXRlLT5hZGp1c3RlZF9tb2RlLnZkaXNwbGF5Owo+IC0JY3Bw
ID0gc3RhdGUtPmZiLT5mb3JtYXQtPmNwcFtwbGFuZS0+aW5kZXhdOwo+ICsJY3BwID0gc3RhdGUt
PmZiLT5mb3JtYXQtPmJwcFtwbGFuZS0+aW5kZXhdIC8gODsKClRoYXQgd291bGRuJ3Qgd29yayB3
aXRoIDE1LWJpdCByZ2I1NTUuLi4KCgo+IAo+ICAJcHJpdi0+ZG1hX2h3ZGVzYy0+YWRkciA9IGRy
bV9mYl9jbWFfZ2V0X2dlbV9hZGRyKHN0YXRlLT5mYiwgc3RhdGUsIAo+IDApOwo+ICAJcHJpdi0+
ZG1hX2h3ZGVzYy0+Y21kID0gd2lkdGggKiBoZWlnaHQgKiBjcHAgLyA0Owo+IC0tCj4gMi43LjQK
PiAKPiAKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
