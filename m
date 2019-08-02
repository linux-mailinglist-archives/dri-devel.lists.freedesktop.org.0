Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2395C7F885
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 15:21:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE5456EE36;
	Fri,  2 Aug 2019 13:21:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E87666EE34;
 Fri,  2 Aug 2019 13:21:19 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 001D02173E;
 Fri,  2 Aug 2019 13:21:18 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 41/76] drm/msm/dpu: Correct dpu encoder spinlock
 initialization
Date: Fri,  2 Aug 2019 09:19:15 -0400
Message-Id: <20190802131951.11600-41-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190802131951.11600-1-sashal@kernel.org>
References: <20190802131951.11600-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1564752079;
 bh=Z3+DlEgPPOfyTqSMYWiDIsaMH7bYjj3YAxmRj4cC21E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PeGbkyne4hjVzsD8BRlnd8sgaQMQeSbUTtq4sGfIRKyWWTcXCcooWt2I9XIk01dL2
 UKNjoskG0KTJgQCIB+nJFYAQY9bX6j9TuZee5Bfpq7mOVXynToHkewL4BwT7xVhsRb
 9yJ1TleS0L7/E4HScu5cs+Sb6mcMWJP2+AxOnwJg=
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
Cc: Sasha Levin <sashal@kernel.org>, Shubhashree Dhar <dhar@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2h1Ymhhc2hyZWUgRGhhciA8ZGhhckBjb2RlYXVyb3JhLm9yZz4KClsgVXBzdHJlYW0g
Y29tbWl0IDJlN2I4MDFlYWRiZjMyN2JmNjEwNDFjOTQzZTVjNDRhNWRlNGIwZTUgXQoKZHB1IGVu
Y29kZXIgc3BpbmxvY2sgc2hvdWxkIGJlIGluaXRpYWxpemVkIGR1cmluZyBkcHUgZW5jb2Rlcgpp
bml0IGluc3RlYWQgb2YgZHB1IGVuY29kZXIgc2V0dXAgd2hpY2ggaXMgcGFydCBvZiBtb2Rlc2V0
IGluaXQuCgpTaWduZWQtb2ZmLWJ5OiBTaHViaGFzaHJlZSBEaGFyIDxkaGFyQGNvZGVhdXJvcmEu
b3JnPgpbc2VhbnBhdWwgcmVzb2x2ZWQgY29uZmxpY3QgaW4gb2xkIGluaXQgcmVtb3ZhbCBhbmQg
cmV2aXNlZCB0aGUgY29tbWl0IG1lc3NhZ2VdClNpZ25lZC1vZmYtYnk6IFNlYW4gUGF1bCA8c2Vh
bnBhdWxAY2hyb21pdW0ub3JnPgpMaW5rOiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5v
cmcvcGF0Y2gvbXNnaWQvMTU2MTM1NzYzMi0xNTM2MS0xLWdpdC1zZW5kLWVtYWlsLWRoYXJAY29k
ZWF1cm9yYS5vcmcKU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3Jn
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9lbmNvZGVyLmMgfCAzICst
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9lbmNvZGVyLmMgYi9kcml2
ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5jb2Rlci5jCmluZGV4IDBlYTE1MDE5NjY1
OTQuLmM2MmY3YWJjZjUwOWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9k
cHUxL2RwdV9lbmNvZGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1
X2VuY29kZXIuYwpAQCAtMjIyNiw4ICsyMjI2LDYgQEAgaW50IGRwdV9lbmNvZGVyX3NldHVwKHN0
cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jLAogCWlmIChyZXQp
CiAJCWdvdG8gZmFpbDsKIAotCXNwaW5fbG9ja19pbml0KCZkcHVfZW5jLT5lbmNfc3BpbmxvY2sp
OwotCiAJYXRvbWljX3NldCgmZHB1X2VuYy0+ZnJhbWVfZG9uZV90aW1lb3V0X21zLCAwKTsKIAl0
aW1lcl9zZXR1cCgmZHB1X2VuYy0+ZnJhbWVfZG9uZV90aW1lciwKIAkJCWRwdV9lbmNvZGVyX2Zy
YW1lX2RvbmVfdGltZW91dCwgMCk7CkBAIC0yMjgxLDYgKzIyNzksNyBAQCBzdHJ1Y3QgZHJtX2Vu
Y29kZXIgKmRwdV9lbmNvZGVyX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAogCWRybV9l
bmNvZGVyX2hlbHBlcl9hZGQoJmRwdV9lbmMtPmJhc2UsICZkcHVfZW5jb2Rlcl9oZWxwZXJfZnVu
Y3MpOwogCisJc3Bpbl9sb2NrX2luaXQoJmRwdV9lbmMtPmVuY19zcGlubG9jayk7CiAJZHB1X2Vu
Yy0+ZW5hYmxlZCA9IGZhbHNlOwogCiAJcmV0dXJuICZkcHVfZW5jLT5iYXNlOwotLSAKMi4yMC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
