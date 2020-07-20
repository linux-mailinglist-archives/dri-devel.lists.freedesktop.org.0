Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AEA227070
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 23:37:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 171D46E0D1;
	Mon, 20 Jul 2020 21:37:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E27D89BBD;
 Mon, 20 Jul 2020 21:37:48 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1C9C422CBB;
 Mon, 20 Jul 2020 21:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595281068;
 bh=0EJWnODGD4TNz5brZBkLw/E00QZ4S2pmfWX1+6zrt28=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=2wjhfywzi36Au7Tjv1CxGKEkkDKr6WZg9mY4vReym24f06FEiFrOMj4NbHjgJzncw
 TG3y4P3YY+8svrDgPdzJnl5PO8bYsCzRys7Y21rqTkOMTxjg4fkFz4GE/UxhINpFSm
 fo6WlfkR79bHfFlRJyse4eIQc2Ai9HXJTSURqxRo=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 26/40] drm/amdgpu/gfx10: fix race condition for kiq
Date: Mon, 20 Jul 2020 17:37:01 -0400
Message-Id: <20200720213715.406997-26-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200720213715.406997-1-sashal@kernel.org>
References: <20200720213715.406997-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Jack Xiao <Jack.Xiao@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KClsgVXBzdHJlYW0gY29tbWl0IDdk
NjVhNTc3YmI1OGQ0ZjI3YTMzOThhNGMwY2IwYjAwYWI3ZDA1MTEgXQoKRHVyaW5nIHByZWVtcHRp
b24gdGVzdCBmb3IgZ2Z4MTAsIGl0IHVzZXMga2lxIHRvIHRyaWdnZXIKZ2Z4IHByZWVtcHRpb24s
IHdoaWNoIHdvdWxkIHJlc3VsdCBpbiByYWNlIGNvbmRpdGlvbgp3aXRoIGZsdXNoaW5nIFRMQiBm
b3Iga2lxLgoKU2lnbmVkLW9mZi1ieTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KUmV2
aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4KQWNrZWQtYnk6
IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KU2lnbmVkLW9mZi1i
eTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5
OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ2Z4X3YxMF8wLmMgfCA5ICsrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDggaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dmeF92MTBfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Yx
MF8wLmMKaW5kZXggMGUwZGFmMDAyMWI2MC4uZmY5NGY3NTY5NzhkNSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKQEAgLTQ3NDYsMTIgKzQ3NDYsMTcgQEAgc3RhdGljIGlu
dCBnZnhfdjEwXzBfcmluZ19wcmVlbXB0X2liKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZykKIAlz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IHJpbmctPmFkZXY7CiAJc3RydWN0IGFtZGdwdV9r
aXEgKmtpcSA9ICZhZGV2LT5nZngua2lxOwogCXN0cnVjdCBhbWRncHVfcmluZyAqa2lxX3Jpbmcg
PSAma2lxLT5yaW5nOworCXVuc2lnbmVkIGxvbmcgZmxhZ3M7CiAKIAlpZiAoIWtpcS0+cG1mIHx8
ICFraXEtPnBtZi0+a2lxX3VubWFwX3F1ZXVlcykKIAkJcmV0dXJuIC1FSU5WQUw7CiAKLQlpZiAo
YW1kZ3B1X3JpbmdfYWxsb2Moa2lxX3JpbmcsIGtpcS0+cG1mLT51bm1hcF9xdWV1ZXNfc2l6ZSkp
CisJc3Bpbl9sb2NrX2lycXNhdmUoJmtpcS0+cmluZ19sb2NrLCBmbGFncyk7CisKKwlpZiAoYW1k
Z3B1X3JpbmdfYWxsb2Moa2lxX3JpbmcsIGtpcS0+cG1mLT51bm1hcF9xdWV1ZXNfc2l6ZSkpIHsK
KwkJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgma2lxLT5yaW5nX2xvY2ssIGZsYWdzKTsKIAkJcmV0
dXJuIC1FTk9NRU07CisJfQogCiAJLyogYXNzZXJ0IHByZWVtcHRpb24gY29uZGl0aW9uICovCiAJ
YW1kZ3B1X3Jpbmdfc2V0X3ByZWVtcHRfY29uZF9leGVjKHJpbmcsIGZhbHNlKTsKQEAgLTQ3NjIs
NiArNDc2Nyw4IEBAIHN0YXRpYyBpbnQgZ2Z4X3YxMF8wX3JpbmdfcHJlZW1wdF9pYihzdHJ1Y3Qg
YW1kZ3B1X3JpbmcgKnJpbmcpCiAJCQkJICAgKytyaW5nLT50cmFpbF9zZXEpOwogCWFtZGdwdV9y
aW5nX2NvbW1pdChraXFfcmluZyk7CiAKKwlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZraXEtPnJp
bmdfbG9jaywgZmxhZ3MpOworCiAJLyogcG9sbCB0aGUgdHJhaWxpbmcgZmVuY2UgKi8KIAlmb3Ig
KGkgPSAwOyBpIDwgYWRldi0+dXNlY190aW1lb3V0OyBpKyspIHsKIAkJaWYgKHJpbmctPnRyYWls
X3NlcSA9PQotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
