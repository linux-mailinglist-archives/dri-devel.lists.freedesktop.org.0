Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF542BCDBC
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 18:50:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 432CB6EA75;
	Tue, 24 Sep 2019 16:50:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 922BA6EA5F
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 16:50:29 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6D144222C7;
 Tue, 24 Sep 2019 16:50:28 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 49/50] dma-buf/sw_sync: Synchronize signal vs
 syncpt free
Date: Tue, 24 Sep 2019 12:48:46 -0400
Message-Id: <20190924164847.27780-49-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924164847.27780-1-sashal@kernel.org>
References: <20190924164847.27780-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569343829;
 bh=Y7O/CJ4GQZDpiGBV9ktsPOEKJRsFVUj6tMUvdMunxdU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=2p06diMS7gR4UNc/MnL8LDYV+S+yCp6mpTunC1RqID8X2/seLCzmLPpBd12yhTqCL
 fH5mh4UkmZ0Vl2sHygJOC9fjQuzXvlP2ACWAAslW+JFnM+UnbdUTlBrMVOWSJ+3sX7
 cTM5Ei8xWRlHk2c0/xqVxibebm6mN3hFRfK5dyRA=
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
Cc: Sasha Levin <sashal@kernel.org>, Gustavo Padovan <gustavo@padovan.org>,
 dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CgpbIFVwc3RyZWFt
IGNvbW1pdCBkM2M2ZGQxZmIzMGQzODUzYzIwMTI1NDlhZmZlNzVjOTMwZjRhMmY5IF0KCkR1cmlu
ZyByZWxlYXNlIG9mIHRoZSBzeW5jcHQsIHdlIHJlbW92ZSBpdCBmcm9tIHRoZSBsaXN0IG9mIHN5
bmNwdCBhbmQKdGhlIHRyZWUsIGJ1dCBvbmx5IGlmIGl0IGlzIG5vdCBhbHJlYWR5IGJlZW4gcmVt
b3ZlZC4gSG93ZXZlciwgZHVyaW5nCnNpZ25hbGluZywgd2UgZmlyc3QgcmVtb3ZlIHRoZSBzeW5j
cHQgZnJvbSB0aGUgbGlzdC4gU28sIGlmIHdlCmNvbmN1cnJlbnRseSBmcmVlIGFuZCBzaWduYWwg
dGhlIHN5bmNwdCwgdGhlIGZyZWUgbWF5IGRlY2lkZSB0aGF0IGl0IGlzCm5vdCBwYXJ0IG9mIHRo
ZSB0cmVlIGFuZCBpbW1lZGlhdGVseSBmcmVlIGl0c2VsZiAtLSBtZWFud2hpbGUgdGhlCnNpZ25h
bGVyIGdvZXMgb24gdG8gdXNlIHRoZSBub3cgZnJlZWQgZGF0YXN0cnVjdHVyZS4KCkluIHBhcnRp
Y3VsYXIsIHdlIGdldCBzdHJ1Y2sgYnkgY29tbWl0IDBlMmY3MzNhZGRiZiAoImRtYS1idWY6IG1h
a2UKZG1hX2ZlbmNlIHN0cnVjdHVyZSBhIGJpdCBzbWFsbGVyIHYyIikgYXMgdGhlIGNiX2xpc3Qg
aXMgaW1tZWRpYXRlbHkKY2xvYmJlcmVkIGJ5IHRoZSBrZnJlZV9yY3UuCgp2MjogQXZvaWQgY2Fs
bGluZyBpbnRvIHRpbWVsaW5lX2ZlbmNlX3JlbGVhc2UoKSBmcm9tIHVuZGVyIHRoZSBzcGlubG9j
awoKQnVnemlsbGE6IGh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lk
PTExMTM4MQpGaXhlczogZDM4NjJlNDRkYWE3ICgiZG1hLWJ1Zi9zdy1zeW5jOiBGaXggbG9ja2lu
ZyBhcm91bmQgc3luY190aW1lbGluZSBsaXN0cyIpClJlZmVyZW5jZXM6IDBlMmY3MzNhZGRiZiAo
ImRtYS1idWY6IG1ha2UgZG1hX2ZlbmNlIHN0cnVjdHVyZSBhIGJpdCBzbWFsbGVyIHYyIikKU2ln
bmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CkNjOiBT
dW1pdCBTZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnPgpDYzogU2VhbiBQYXVsIDxzZWFu
cGF1bEBjaHJvbWl1bS5vcmc+CkNjOiBHdXN0YXZvIFBhZG92YW4gPGd1c3Rhdm9AcGFkb3Zhbi5v
cmc+CkNjOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiA8
c3RhYmxlQHZnZXIua2VybmVsLm9yZz4gIyB2NC4xNCsKQWNrZWQtYnk6IENocmlzdGlhbiBLw7Zu
aWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KTGluazogaHR0cHM6Ly9wYXRjaHdvcmsuZnJl
ZWRlc2t0b3Aub3JnL3BhdGNoL21zZ2lkLzIwMTkwODEyMTU0MjQ3LjIwNTA4LTEtY2hyaXNAY2hy
aXMtd2lsc29uLmNvLnVrClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVs
Lm9yZz4KLS0tCiBkcml2ZXJzL2RtYS1idWYvc3dfc3luYy5jIHwgMTYgKysrKysrKy0tLS0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2RtYS1idWYvc3dfc3luYy5jIGIvZHJpdmVycy9kbWEtYnVmL3N3X3N5
bmMuYwppbmRleCA1M2MxZDZkMzZhNjQyLi44MWJhNGViMzQ4OTA5IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2RtYS1idWYvc3dfc3luYy5jCisrKyBiL2RyaXZlcnMvZG1hLWJ1Zi9zd19zeW5jLmMKQEAg
LTE0MSwxNyArMTQxLDE0IEBAIHN0YXRpYyB2b2lkIHRpbWVsaW5lX2ZlbmNlX3JlbGVhc2Uoc3Ry
dWN0IGRtYV9mZW5jZSAqZmVuY2UpCiB7CiAJc3RydWN0IHN5bmNfcHQgKnB0ID0gZG1hX2ZlbmNl
X3RvX3N5bmNfcHQoZmVuY2UpOwogCXN0cnVjdCBzeW5jX3RpbWVsaW5lICpwYXJlbnQgPSBkbWFf
ZmVuY2VfcGFyZW50KGZlbmNlKTsKKwl1bnNpZ25lZCBsb25nIGZsYWdzOwogCisJc3Bpbl9sb2Nr
X2lycXNhdmUoZmVuY2UtPmxvY2ssIGZsYWdzKTsKIAlpZiAoIWxpc3RfZW1wdHkoJnB0LT5saW5r
KSkgewotCQl1bnNpZ25lZCBsb25nIGZsYWdzOwotCi0JCXNwaW5fbG9ja19pcnFzYXZlKGZlbmNl
LT5sb2NrLCBmbGFncyk7Ci0JCWlmICghbGlzdF9lbXB0eSgmcHQtPmxpbmspKSB7Ci0JCQlsaXN0
X2RlbCgmcHQtPmxpbmspOwotCQkJcmJfZXJhc2UoJnB0LT5ub2RlLCAmcGFyZW50LT5wdF90cmVl
KTsKLQkJfQotCQlzcGluX3VubG9ja19pcnFyZXN0b3JlKGZlbmNlLT5sb2NrLCBmbGFncyk7CisJ
CWxpc3RfZGVsKCZwdC0+bGluayk7CisJCXJiX2VyYXNlKCZwdC0+bm9kZSwgJnBhcmVudC0+cHRf
dHJlZSk7CiAJfQorCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoZmVuY2UtPmxvY2ssIGZsYWdzKTsK
IAogCXN5bmNfdGltZWxpbmVfcHV0KHBhcmVudCk7CiAJZG1hX2ZlbmNlX2ZyZWUoZmVuY2UpOwpA
QCAtMjc0LDcgKzI3MSw4IEBAIHN0YXRpYyBzdHJ1Y3Qgc3luY19wdCAqc3luY19wdF9jcmVhdGUo
c3RydWN0IHN5bmNfdGltZWxpbmUgKm9iaiwKIAkJCQlwID0gJnBhcmVudC0+cmJfbGVmdDsKIAkJ
CX0gZWxzZSB7CiAJCQkJaWYgKGRtYV9mZW5jZV9nZXRfcmN1KCZvdGhlci0+YmFzZSkpIHsKLQkJ
CQkJZG1hX2ZlbmNlX3B1dCgmcHQtPmJhc2UpOworCQkJCQlzeW5jX3RpbWVsaW5lX3B1dChvYmop
OworCQkJCQlrZnJlZShwdCk7CiAJCQkJCXB0ID0gb3RoZXI7CiAJCQkJCWdvdG8gdW5sb2NrOwog
CQkJCX0KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
