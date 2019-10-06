Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 636F3CD47B
	for <lists+dri-devel@lfdr.de>; Sun,  6 Oct 2019 19:26:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A686E421;
	Sun,  6 Oct 2019 17:26:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C0906E421
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Oct 2019 17:26:21 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 90B082077B;
 Sun,  6 Oct 2019 17:26:20 +0000 (UTC)
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 4.14 04/68] drm/bridge: tc358767: Increase AUX transfer length
 limit
Date: Sun,  6 Oct 2019 19:20:40 +0200
Message-Id: <20191006171110.124883581@linuxfoundation.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191006171108.150129403@linuxfoundation.org>
References: <20191006171108.150129403@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570382781;
 bh=KlSB4HBw84tIqwEJl/ZN5F7suGhn/NvkDm8CJqPjPb0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oazCHXbnPqEadcW1M9plmFRnYV4MBcMCnZuyCm0qUIgCTyu2BpUR4fQOzsi4u+w7R
 SI5X/nP+SMd1TZdv4zwRrkiqictB7bXeuoYIKFtxDm01jyTh3ceQuAMFaau0+iOGjM
 3jidb5rKdjMjpf3xc8vVy3Sa8RdRlWLBhnjVsO2Q=
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
Cc: Cory Tusar <cory.tusar@zii.aero>, Sasha Levin <sashal@kernel.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>, stable@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQW5kcmV5IFNtaXJub3YgPGFuZHJldy5zbWlybm92QGdtYWlsLmNvbT4KClsgVXBzdHJl
YW0gY29tbWl0IGUwNjU1ZmVhZWM2MmQ1MTM5YjZiMTNhN2IxYmJiMWFiOGYxYzJkODMgXQoKQWNj
b3JkaW5nIHRvIHRoZSBkYXRhc2hlZXQgdGMzNTg3NjcgY2FuIHRyYW5zZmVyIHVwIHRvIDE2IGJ5
dGVzIHZpYQppdHMgQVVYIGNoYW5uZWwsIHNvIHRoZSBhcnRpZmljaWFsIGxpbWl0IG9mIDggYXBw
ZWFycyB0byBiZSB0b28KbG93LiBIb3dldmVyIG9ubHkgdXAgdG8gMTUtYnl0ZXMgc2VlbSB0byBi
ZSBhY3R1YWxseSBzdXBwb3J0ZWQgYW5kCnRyeWluZyB0byB1c2UgMTYtYnl0ZSB0cmFuc2ZlcnMg
cmVzdWx0cyBpbiB0cmFuc2ZlcnMgZmFpbGluZwpzcG9yYWRpY2FsbHkgKHdpdGggYm9ndXMgc3Rh
dHVzIGluIGNhc2Ugb2YgSTJDIHRyYW5zZmVycyksIHNvIGxpbWl0IGl0CnRvIDE1LgoKU2lnbmVk
LW9mZi1ieTogQW5kcmV5IFNtaXJub3YgPGFuZHJldy5zbWlybm92QGdtYWlsLmNvbT4KUmV2aWV3
ZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+ClJldmlld2VkLWJ5OiBU
b21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgpDYzogQW5kcnplaiBIYWpkYSA8
YS5oYWpkYUBzYW1zdW5nLmNvbT4KQ2M6IExhdXJlbnQgUGluY2hhcnQgPExhdXJlbnQucGluY2hh
cnRAaWRlYXNvbmJvYXJkLmNvbT4KQ2M6IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0
aS5jb20+CkNjOiBBbmRyZXkgR3VzYWtvdiA8YW5kcmV5Lmd1c2Frb3ZAY29nZW50ZW1iZWRkZWQu
Y29tPgpDYzogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4KQ2M6IENvcnkg
VHVzYXIgPGNvcnkudHVzYXJAemlpLmFlcm8+CkNjOiBDaHJpcyBIZWFseSA8Y3BoZWFseUBnbWFp
bC5jb20+CkNjOiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT4KQ2M6IGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmcKU2lnbmVkLW9mZi1ieTogQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KTGlu
azogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoL21zZ2lkLzIwMTkwNjE5
MDUyNzE2LjE2ODMxLTktYW5kcmV3LnNtaXJub3ZAZ21haWwuY29tClNpZ25lZC1vZmYtYnk6IFNh
c2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3RjMzU4NzY3LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKaW5kZXggOTcwNWNhMTk3YjkwZC4u
Y2VmYTJjMTY4NWJhNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2
Ny5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYwpAQCAtMzAwLDcgKzMw
MCw3IEBAIHN0YXRpYyBzc2l6ZV90IHRjX2F1eF90cmFuc2ZlcihzdHJ1Y3QgZHJtX2RwX2F1eCAq
YXV4LAogCQkJICAgICAgIHN0cnVjdCBkcm1fZHBfYXV4X21zZyAqbXNnKQogewogCXN0cnVjdCB0
Y19kYXRhICp0YyA9IGF1eF90b190YyhhdXgpOwotCXNpemVfdCBzaXplID0gbWluX3Qoc2l6ZV90
LCA4LCBtc2ctPnNpemUpOworCXNpemVfdCBzaXplID0gbWluX3Qoc2l6ZV90LCBEUF9BVVhfTUFY
X1BBWUxPQURfQllURVMgLSAxLCBtc2ctPnNpemUpOwogCXU4IHJlcXVlc3QgPSBtc2ctPnJlcXVl
c3QgJiB+RFBfQVVYX0kyQ19NT1Q7CiAJdTggKmJ1ZiA9IG1zZy0+YnVmZmVyOwogCXUzMiB0bXAg
PSAwOwotLSAKMi4yMC4xCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
