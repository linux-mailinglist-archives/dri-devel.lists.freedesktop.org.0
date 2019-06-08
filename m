Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBB839D6D
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jun 2019 13:40:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 710AE890E4;
	Sat,  8 Jun 2019 11:40:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7306A890E4
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jun 2019 11:40:46 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8DF2E208C0;
 Sat,  8 Jun 2019 11:40:45 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.1 36/70] drm/etnaviv: lock MMU while dumping core
Date: Sat,  8 Jun 2019 07:39:15 -0400
Message-Id: <20190608113950.8033-36-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190608113950.8033-1-sashal@kernel.org>
References: <20190608113950.8033-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1559994046;
 bh=pqEzLv81IrX0kqzgfw1hYmpQ73Vr7DSMGwdy294pxAU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pkXmtASyqET0+vZiJXrjN2BiSx2piRr1e9iF4VIcCTYNPWucUhat0J8oWncLe9EtD
 RTI5+ObfVH43rKWJsm8icTF9iVLwejmOVfEXIzACECb4lzX+TgqOoVPmcVOiy+XNc0
 Pqf+Dycmp9slr/TkPR5fFLIyP24JdllvP/emjMtg=
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
Cc: Sasha Levin <sashal@kernel.org>, David Jander <david@protonic.nl>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTHVjYXMgU3RhY2ggPGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU+CgpbIFVwc3RyZWFtIGNv
bW1pdCAxMzk2NTAwZDY3M2JkMDI3NjgzYTA2MDlmZjg0ZGNhN2ViNmVhMmU3IF0KClRoZSBkZXZj
b3JlZHVtcCBuZWVkcyB0byBvcGVyYXRlIG9uIGEgc3RhYmxlIHN0YXRlIG9mIHRoZSBNTVUgd2hp
bGUKaXQgaXMgd3JpdGluZyB0aGUgTU1VIHN0YXRlIHRvIHRoZSBjb3JlZHVtcC4gVGhlIG1pc3Np
bmcgbG9jawphbGxvd2VkIGJvdGggdGhlIHVzZXJzcGFjZSBzdWJtaXQsIGFzIHdlbGwgYXMgdGhl
IEdQVSBqb2IgZmluaXNoCnBhdGhzIHRvIG11dGF0ZSB0aGUgTU1VIHN0YXRlIHdoaWxlIGEgY29y
ZWR1bXAgaXMgdW5kZXIgd2F5LgoKRml4ZXM6IGE4YzIxYTU0NTFkOCAoZHJtL2V0bmF2aXY6IGFk
ZCBpbml0aWFsIGV0bmF2aXYgRFJNIGRyaXZlcikKUmVwb3J0ZWQtYnk6IERhdmlkIEphbmRlciA8
ZGF2aWRAcHJvdG9uaWMubmw+ClNpZ25lZC1vZmYtYnk6IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBl
bmd1dHJvbml4LmRlPgpUZXN0ZWQtYnk6IERhdmlkIEphbmRlciA8ZGF2aWRAcHJvdG9uaWMubmw+
ClJldmlld2VkLWJ5OiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgpTaWdu
ZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9kdW1wLmMgfCA1ICsrKysrCiAxIGZpbGUgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRu
YXZpdl9kdW1wLmMgYi9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2R1bXAuYwppbmRl
eCAzMzg1NGM5NGNiODUuLjUxNTUxNWVmMjRmOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2V0bmF2aXYvZXRuYXZpdl9kdW1wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRu
YXZpdl9kdW1wLmMKQEAgLTEyNSw2ICsxMjUsOCBAQCB2b2lkIGV0bmF2aXZfY29yZV9kdW1wKHN0
cnVjdCBldG5hdml2X2dwdSAqZ3B1KQogCQlyZXR1cm47CiAJZXRuYXZpdl9kdW1wX2NvcmUgPSBm
YWxzZTsKIAorCW11dGV4X2xvY2soJmdwdS0+bW11LT5sb2NrKTsKKwogCW1tdV9zaXplID0gZXRu
YXZpdl9pb21tdV9kdW1wX3NpemUoZ3B1LT5tbXUpOwogCiAJLyogV2UgYWx3YXlzIGR1bXAgcmVn
aXN0ZXJzLCBtbXUsIHJpbmcgYW5kIGVuZCBtYXJrZXIgKi8KQEAgLTE2Nyw2ICsxNjksNyBAQCB2
b2lkIGV0bmF2aXZfY29yZV9kdW1wKHN0cnVjdCBldG5hdml2X2dwdSAqZ3B1KQogCWl0ZXIuc3Rh
cnQgPSBfX3ZtYWxsb2MoZmlsZV9zaXplLCBHRlBfS0VSTkVMIHwgX19HRlBfTk9XQVJOIHwgX19H
RlBfTk9SRVRSWSwKIAkJCSAgICAgICBQQUdFX0tFUk5FTCk7CiAJaWYgKCFpdGVyLnN0YXJ0KSB7
CisJCW11dGV4X3VubG9jaygmZ3B1LT5tbXUtPmxvY2spOwogCQlkZXZfd2FybihncHUtPmRldiwg
ImZhaWxlZCB0byBhbGxvY2F0ZSBkZXZjb3JlZHVtcCBmaWxlXG4iKTsKIAkJcmV0dXJuOwogCX0K
QEAgLTIzNCw2ICsyMzcsOCBAQCB2b2lkIGV0bmF2aXZfY29yZV9kdW1wKHN0cnVjdCBldG5hdml2
X2dwdSAqZ3B1KQogCQkJCQkgb2JqLT5iYXNlLnNpemUpOwogCX0KIAorCW11dGV4X3VubG9jaygm
Z3B1LT5tbXUtPmxvY2spOworCiAJZXRuYXZpdl9jb3JlX2R1bXBfaGVhZGVyKCZpdGVyLCBFVERV
TVBfQlVGX0VORCwgaXRlci5kYXRhKTsKIAogCWRldl9jb3JlZHVtcHYoZ3B1LT5kZXYsIGl0ZXIu
c3RhcnQsIGl0ZXIuZGF0YSAtIGl0ZXIuc3RhcnQsIEdGUF9LRVJORUwpOwotLSAKMi4yMC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
