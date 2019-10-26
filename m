Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B50BCE5AC9
	for <lists+dri-devel@lfdr.de>; Sat, 26 Oct 2019 15:17:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6466C6EC38;
	Sat, 26 Oct 2019 13:17:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33ED16EC25
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Oct 2019 13:17:52 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 66AC021E6F;
 Sat, 26 Oct 2019 13:17:51 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.3 61/99] drm/ttm: fix busy reference in
 ttm_mem_evict_first
Date: Sat, 26 Oct 2019 09:15:22 -0400
Message-Id: <20191026131600.2507-61-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191026131600.2507-1-sashal@kernel.org>
References: <20191026131600.2507-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1572095872;
 bh=+M/5ENxP6pEO4TqPPSztdt1841pC45RbxlaBLJurXks=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=xY7KcvWBD0hJQuvZiakv5ITNmtixPxbo8lj2TQpEmVMeQ/AhNWHyTmdbqn/T2rWQS
 4503FjBVyD4bNTrrH1nIsG6zX6zoR2mn9LKW1QaXC5+OOFTcXY6Tf/9fguyX44OHuZ
 nggvF0vGrEv35y9eI6/FJxm8mTDQlCNWtrZPjrZ0=
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
Cc: Sasha Levin <sashal@kernel.org>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thellstrom@vmware.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKWyBVcHN0
cmVhbSBjb21taXQgNzNhODhlNGNlMzEwNTVjNDE1ZjFkZGI1NWUzZjA4YzkzOTNjZjRlMyBdCgpU
aGUgYnVzeSBCTyBtaWdodCBhY3R1YWxseSBiZSBhbHJlYWR5IGRlbGV0ZWQsCnNvIGdyYWIgb25s
eSBhIGxpc3QgcmVmZXJlbmNlLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogVGhvbWFzIEhlbGxzdHLDtm0gPHRo
ZWxsc3Ryb21Adm13YXJlLmNvbT4KTGluazogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Au
b3JnL3BhdGNoLzMzMjg3Ny8KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJu
ZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgfCA0ICsrLS0KIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2Jv
LmMKaW5kZXggNThjNDAzZWRhMDRlNy4uYzJkZjczNWE4ZjgyYyAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fYm8uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5j
CkBAIC04NzQsMTEgKzg3NCwxMSBAQCBzdGF0aWMgaW50IHR0bV9tZW1fZXZpY3RfZmlyc3Qoc3Ry
dWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsCiAKIAlpZiAoIWJvKSB7CiAJCWlmIChidXN5X2JvKQot
CQkJdHRtX2JvX2dldChidXN5X2JvKTsKKwkJCWtyZWZfZ2V0KCZidXN5X2JvLT5saXN0X2tyZWYp
OwogCQlzcGluX3VubG9jaygmZ2xvYi0+bHJ1X2xvY2spOwogCQlyZXQgPSB0dG1fbWVtX2V2aWN0
X3dhaXRfYnVzeShidXN5X2JvLCBjdHgsIHRpY2tldCk7CiAJCWlmIChidXN5X2JvKQotCQkJdHRt
X2JvX3B1dChidXN5X2JvKTsKKwkJCWtyZWZfcHV0KCZidXN5X2JvLT5saXN0X2tyZWYsIHR0bV9i
b19yZWxlYXNlX2xpc3QpOwogCQlyZXR1cm4gcmV0OwogCX0KIAotLSAKMi4yMC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
