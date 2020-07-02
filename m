Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8E92117C1
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 03:25:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 931DC6E500;
	Thu,  2 Jul 2020 01:25:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AEFD6E4FF
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 01:25:31 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4868B20884;
 Thu,  2 Jul 2020 01:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593653131;
 bh=t14ieBLjcRC8mGAiZegb7Cr7kUc2KlBM9DA1w+vutoM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=1oXUp9wzNcRNNnwrckzit2GEfwWFu+UfjWuR9nCt19oi7MXiGAIdU5pz+4bswUwtI
 j3Z/A7ECNwnqIqUmFzLvit4dJ6ZrQ5KpXfIXdmclBUwKX5HB0XykY8LwVdic0sm9od
 WV0QX9DlyE0hFD1lbfD5S9J3a9xjciVdSV8f70Vc=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 05/40] drm/ttm: Fix dma_fence refcnt leak when
 adding move fence
Date: Wed,  1 Jul 2020 21:23:26 -0400
Message-Id: <20200702012402.2701121-5-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702012402.2701121-1-sashal@kernel.org>
References: <20200702012402.2701121-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Xin Tan <tanxin.ctf@gmail.com>,
 Xiyu Yang <xiyuyang19@fudan.edu.cn>, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogWGl5dSBZYW5nIDx4aXl1eWFuZzE5QGZ1ZGFuLmVkdS5jbj4KClsgVXBzdHJlYW0gY29t
bWl0IDExNDI1YzQ1MTllMmM5NzRhMTAwZmM5ODQ4NjcwNDZkOTA1YjkzODAgXQoKdHRtX2JvX2Fk
ZF9tb3ZlX2ZlbmNlKCkgaW52b2tlcyBkbWFfZmVuY2VfZ2V0KCksIHdoaWNoIHJldHVybnMgYQpy
ZWZlcmVuY2Ugb2YgdGhlIHNwZWNpZmllZCBkbWFfZmVuY2Ugb2JqZWN0IHRvICJmZW5jZSIgd2l0
aCBpbmNyZWFzZWQKcmVmY250LgoKV2hlbiB0dG1fYm9fYWRkX21vdmVfZmVuY2UoKSByZXR1cm5z
LCBsb2NhbCB2YXJpYWJsZSAiZmVuY2UiIGJlY29tZXMKaW52YWxpZCwgc28gdGhlIHJlZmNvdW50
IHNob3VsZCBiZSBkZWNyZWFzZWQgdG8ga2VlcCByZWZjb3VudCBiYWxhbmNlZC4KClRoZSByZWZl
cmVuY2UgY291bnRpbmcgaXNzdWUgaGFwcGVucyBpbiBvbmUgZXhjZXB0aW9uIGhhbmRsaW5nIHBh
dGggb2YKdHRtX2JvX2FkZF9tb3ZlX2ZlbmNlKCkuIFdoZW4gbm9fd2FpdF9ncHUgZmxhZyBpcyBl
cXVhbHMgdG8gdHJ1ZSwgdGhlCmZ1bmN0aW9uIGZvcmdldHMgdG8gZGVjcmVhc2UgdGhlIHJlZmNu
dCBpbmNyZWFzZWQgYnkgZG1hX2ZlbmNlX2dldCgpLApjYXVzaW5nIGEgcmVmY250IGxlYWsuCgpG
aXggdGhpcyBpc3N1ZSBieSBjYWxsaW5nIGRtYV9mZW5jZV9wdXQoKSB3aGVuIG5vX3dhaXRfZ3B1
IGZsYWcgaXMKZXF1YWxzIHRvIHRydWUuCgpTaWduZWQtb2ZmLWJ5OiBYaXl1IFlhbmcgPHhpeXV5
YW5nMTlAZnVkYW4uZWR1LmNuPgpTaWduZWQtb2ZmLWJ5OiBYaW4gVGFuIDx0YW54aW4uY3RmQGdt
YWlsLmNvbT4KUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdA
YW1kLmNvbT4KTGluazogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzM3
MDIyMS8KU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0Bh
bWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyB8IDQgKysrLQogMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS90dG0vdHRtX2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCmluZGV4IGFi
ZjE2NWIyZjY0ZmMuLjNjZThhZDc2MDNjN2YgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90
dG0vdHRtX2JvLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwpAQCAtOTQxLDgg
Kzk0MSwxMCBAQCBzdGF0aWMgaW50IHR0bV9ib19hZGRfbW92ZV9mZW5jZShzdHJ1Y3QgdHRtX2J1
ZmZlcl9vYmplY3QgKmJvLAogCWlmICghZmVuY2UpCiAJCXJldHVybiAwOwogCi0JaWYgKG5vX3dh
aXRfZ3B1KQorCWlmIChub193YWl0X2dwdSkgeworCQlkbWFfZmVuY2VfcHV0KGZlbmNlKTsKIAkJ
cmV0dXJuIC1FQlVTWTsKKwl9CiAKIAlkbWFfcmVzdl9hZGRfc2hhcmVkX2ZlbmNlKGJvLT5iYXNl
LnJlc3YsIGZlbmNlKTsKIAotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
