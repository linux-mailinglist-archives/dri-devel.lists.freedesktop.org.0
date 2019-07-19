Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF11D6D9F5
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 05:59:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 956E86E4E3;
	Fri, 19 Jul 2019 03:58:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 986CB6E4DE
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 03:58:56 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D01A921855;
 Fri, 19 Jul 2019 03:58:55 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 059/171] drm/bridge: tfp410: fix use of
 cancel_delayed_work_sync
Date: Thu, 18 Jul 2019 23:54:50 -0400
Message-Id: <20190719035643.14300-59-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719035643.14300-1-sashal@kernel.org>
References: <20190719035643.14300-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563508736;
 bh=ArwmgiV1wSYko0c2MaUE0C7Iz4E5SJPnVJ/ZR/Lcg0c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bZptdSlyu+xpXNYOyLbzZ5/NU+ntd37BxinqRRk6RLSHfCC3Ij5F+pvYtos5v/Tb8
 aQBZ7h7qycjKr4GXlAHmV8ENAU9vNcXM2ScPkj7snGZm/YEXQ7q6PfYeF4L7QK8wE9
 v0mwxcHlVF6FyxpVcx4fqWUIT/yf8vFITMWBMg94=
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
Cc: Sasha Levin <sashal@kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KClsgVXBzdHJlYW0g
Y29tbWl0IGIxNjIyY2IzYmU0NTU3ZmQwODY4MzFjYTc0MjZlYWZlNWYxYWNjMmUgXQoKV2UgdXNl
IGRlbGF5ZWRfd29yayBpbiBIUEQgaGFuZGxpbmcsIGFuZCBjYW5jZWwgYW55IHNjaGVkdWxlZCB3
b3JrIGluCnRmcDQxMF9maW5pIHVzaW5nIGNhbmNlbF9kZWxheWVkX3dvcmtfc3luYygpLiBIb3dl
dmVyLCB3ZSBoYXZlIG9ubHkKaW5pdGlhbGl6ZWQgdGhlIGRlbGF5ZWQgd29yayBpZiB3ZSBhY3R1
YWxseSBoYXZlIGEgSFBEIGludGVycnVwdApjb25maWd1cmVkIGluIHRoZSBEVCwgYnV0IGluIHRo
ZSB0ZnA0MTBfZmluaSwgd2UgYWx3YXlzIGNhbmNlbCB0aGUgd29yaywKcG9zc2libHkgY2F1c2lu
ZyBhIFdBUk4oKS4KCkZpeCB0aGlzIGJ5IGRvaW5nIHRoZSBjYW5jZWwgb25seSBpZiB3ZSBhY3R1
YWxseSBoYWQgdGhlIGRlbGF5ZWQgd29yawpzZXQgdXAuCgpTaWduZWQtb2ZmLWJ5OiBUb21pIFZh
bGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbmRyemVqIEhh
amRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgpMaW5rOiBodHRwczovL3BhdGNod29yay5mcmVlZGVz
a3RvcC5vcmcvcGF0Y2gvbXNnaWQvMjAxOTA2MTAxMzU3MzkuNjA3Ny0yLXRvbWkudmFsa2VpbmVu
QHRpLmNvbQpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS10ZnA0MTAuYyB8IDMgKystCiAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS90aS10ZnA0MTAuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGkt
dGZwNDEwLmMKaW5kZXggYTg3OWFhYzIxMjQ2Li4zYThhZjk5NzhlYmQgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktdGZwNDEwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS90aS10ZnA0MTAuYwpAQCAtMzcyLDcgKzM3Miw4IEBAIHN0YXRpYyBpbnQgdGZwNDEwX2Zp
bmkoc3RydWN0IGRldmljZSAqZGV2KQogewogCXN0cnVjdCB0ZnA0MTAgKmR2aSA9IGRldl9nZXRf
ZHJ2ZGF0YShkZXYpOwogCi0JY2FuY2VsX2RlbGF5ZWRfd29ya19zeW5jKCZkdmktPmhwZF93b3Jr
KTsKKwlpZiAoZHZpLT5ocGRfaXJxID49IDApCisJCWNhbmNlbF9kZWxheWVkX3dvcmtfc3luYygm
ZHZpLT5ocGRfd29yayk7CiAKIAlkcm1fYnJpZGdlX3JlbW92ZSgmZHZpLT5icmlkZ2UpOwogCi0t
IAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
