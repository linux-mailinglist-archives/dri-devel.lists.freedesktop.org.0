Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E05DA6E39
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 18:25:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E38948955D;
	Tue,  3 Sep 2019 16:25:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E22689739;
 Tue,  3 Sep 2019 16:25:49 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 82C092343A;
 Tue,  3 Sep 2019 16:25:48 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 016/167] drm/i915: Fix intel_dp_mst_best_encoder()
Date: Tue,  3 Sep 2019 12:22:48 -0400
Message-Id: <20190903162519.7136-16-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190903162519.7136-1-sashal@kernel.org>
References: <20190903162519.7136-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1567527949;
 bh=rsK/26JHP6dw/JKoiZY1zzQkRQGxmrL23SyTuBKBINY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PSN5SPKZx1M8rpSjnl5/YDpUT3hw8zOI9YcSAnxn4/7JJU6coR8X0c1b0+NVPbFEZ
 viAv6/OhmbaFo8205hKFi6PSME7VAvBmLjpUXQKlYJkjLqVoBQy92tWv3CalKl9QdW
 tnBKFF91huhR6sJFKMiLK6/PHUJvmWgj50e4wT0s=
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
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KClsgVXBzdHJlYW0gY29tbWl0IGE5
ZjljYTMzZDFmZTkzMjVmNDE0OTE0YmU1MjZjMGZjNGJhNTI4MWMgXQoKQ3VycmVudGx5LCBpOTE1
IGFwcGVhcnMgdG8gcmVseSBvbiBibG9ja2luZyBtb2Rlc2V0cyBvbgpuby1sb25nZXItcHJlc2Vu
dCBNU1RCIHBvcnRzIGJ5IHNpbXBseSByZXR1cm5pbmcgTlVMTCBmb3IKLT5iZXN0X2VuY29kZXIo
KSwgd2hpY2ggaW4gdHVybiBjYXVzZXMgYW55IG5ldyBhdG9taWMgY29tbWl0cyB0aGF0IGRvbid0
CmRpc2FibGUgdGhlIENSVEMgdG8gZmFpbC4gVGhpcyBpcyB3cm9uZyBob3dldmVyLCBzaW5jZSB3
ZSBzdGlsbCB3YW50IHRvCmFsbG93IHVzZXJzcGFjZSB0byBkaXNhYmxlIENSVENzIG9uIG5vLWxv
bmdlci1wcmVzZW50IE1TVEIgcG9ydHMgYnkKY2hhbmdpbmcgdGhlIERQTVMgc3RhdGUgdG8gb2Zm
IGFuZCB0aGlzIHN0aWxsIHJlcXVpcmVzIHRoYXQgd2UgcmV0cmlldmUKYW4gZW5jb2Rlci4KClNv
LCBmaXggdGhpcyBieSBhbHdheXMgcmV0dXJuaW5nIGEgdmFsaWQgZW5jb2RlciByZWdhcmRsZXNz
IG9mIHRoZSBzdGF0ZQpvZiB0aGUgTVNUIHBvcnQuCgpDaGFuZ2VzIHNpbmNlIHYxOgotIFJlbW92
ZSBtc3QgYXRvbWljIGhlbHBlciwgc2luY2UgdGhpcyBnb3QgcmVwbGFjZWQgd2l0aCBhIG11Y2gg
c2ltcGxlcgogIHNvbHV0aW9uCgpTaWduZWQtb2ZmLWJ5OiBMeXVkZSBQYXVsIDxseXVkZUByZWRo
YXQuY29tPgpSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5j
aD4KQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKTGluazogaHR0cHM6Ly9wYXRjaHdvcmsuZnJl
ZWRlc2t0b3Aub3JnL3BhdGNoL21zZ2lkLzIwMTgxMDA4MjMyNDM3LjU1NzEtNi1seXVkZUByZWRo
YXQuY29tClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9kcF9tc3QuYyB8IDIgLS0KIDEgZmlsZSBjaGFu
Z2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2lu
dGVsX2RwX21zdC5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZHBfbXN0LmMKaW5kZXgg
MWZlYzBjNzFiNGQ5NS4uNThiYTE0OTY2ZDRmMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvaW50ZWxfZHBfbXN0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZHBf
bXN0LmMKQEAgLTQwOCw4ICs0MDgsNiBAQCBzdGF0aWMgc3RydWN0IGRybV9lbmNvZGVyICppbnRl
bF9tc3RfYXRvbWljX2Jlc3RfZW5jb2RlcihzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqYwogCXN0cnVj
dCBpbnRlbF9kcCAqaW50ZWxfZHAgPSBpbnRlbF9jb25uZWN0b3ItPm1zdF9wb3J0OwogCXN0cnVj
dCBpbnRlbF9jcnRjICpjcnRjID0gdG9faW50ZWxfY3J0YyhzdGF0ZS0+Y3J0Yyk7CiAKLQlpZiAo
IVJFQURfT05DRShjb25uZWN0b3ItPnJlZ2lzdGVyZWQpKQotCQlyZXR1cm4gTlVMTDsKIAlyZXR1
cm4gJmludGVsX2RwLT5tc3RfZW5jb2RlcnNbY3J0Yy0+cGlwZV0tPmJhc2UuYmFzZTsKIH0KIAot
LSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
