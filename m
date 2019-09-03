Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9C0A6F1D
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 18:32:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95703898A4;
	Tue,  3 Sep 2019 16:32:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0B0589664;
 Tue,  3 Sep 2019 16:32:10 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A261D23431;
 Tue,  3 Sep 2019 16:32:09 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 161/167] drm/i915: Make sure cdclk is high enough
 for DP audio on VLV/CHV
Date: Tue,  3 Sep 2019 12:25:13 -0400
Message-Id: <20190903162519.7136-161-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190903162519.7136-1-sashal@kernel.org>
References: <20190903162519.7136-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1567528330;
 bh=Jvlr+/GHOOvy+yQ3yEMx9Hkjl4JaRxByu0xjJgI4RrI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=urJ2D/z+0F+nRLYdy+Pnxo9LHoCIZV3oFwu/ZJTwWREjrA3JWQvsPyvpZRuLOkYpw
 mwZy8oWCEOx1GZDOqez6Fif+sHS6RV+8dT5cL8WCac3n4dzfj1osEmYGUOn/25sctF
 /qjX0zMgsAdDiZz+q4JlZTNnVXODJK/xBOaL2HFs=
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
Cc: Sasha Levin <sashal@kernel.org>, Jani Nikula <jani.nikula@intel.com>,
 intel-gfx@lists.freedesktop.org, Stefan Gottwald <gottwald@igel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClsg
VXBzdHJlYW0gY29tbWl0IGE4ZjE5NmEwZmE2MzkxYTQzNmY2M2YzNjBhMWZiNTcwMzFmZGYyNmMg
XQoKT24gVkxWL0NIViB0aGVyZSBpcyBzb21lIGtpbmQgb2YgbGlua2FnZSBiZXR3ZWVuIHRoZSBj
ZGNsayBmcmVxdWVuY3kKYW5kIHRoZSBEUCBsaW5rIGZyZXF1ZW5jeS4gVGhlIHNwZWMgc2F5czoK
IkZvciBEUCBhdWRpbyBjb25maWd1cmF0aW9uLCBjZGNsayBmcmVxdWVuY3kgc2hhbGwgYmUgc2V0
IHRvCiBtZWV0IHRoZSBmb2xsb3dpbmcgcmVxdWlyZW1lbnRzOgogRFAgTGluayBGcmVxdWVuY3ko
TUh6KSB8IENkY2xrIGZyZXF1ZW5jeShNSHopCiAyNzAgICAgICAgICAgICAgICAgICAgIHwgMzIw
IG9yIGhpZ2hlcgogMTYyICAgICAgICAgICAgICAgICAgICB8IDIwMCBvciBoaWdoZXIiCgpJIHN1
c3BlY3QgdGhhdCB3b3VsZCBtb3JlIGFjY3VyYXRlbHkgYmUgZXhwcmVzc2VkIGFzCiJjZGNsayA+
PSBEUCBsaW5rIGNsb2NrIiwgYW5kIGluIGFueSBjYXNlIHdlIGNhbiBleHByZXNzIGl0IGxpa2UK
dGhhdCBpbiB0aGUgY29kZSBiZWNhdXNlIG9mIHRoZSBsaW1pdGVkIHNldCBvZiBjZGNsayAoMjAw
LCAyNjYsCjMyMCwgNDAwIE1IeikgYW5kIGxpbmsgZnJlcXVlbmNpZXMgKDE2MiBhbmQgMjcwIE1I
eikgd2Ugc3VwcG9ydC4KCldpdGhvdXQgdGhpcyB3ZSBjYW4gZW5kIHVwIGluIGEgc2l0dWF0aW9u
IHdoZXJlIHRoZSBjZGNsawppcyB0b28gbG93IGFuZCBlbmFibGluZyBEUCBhdWRpbyB3aWxsIGtp
bGwgdGhlIHBpcGUuIEhhcHBlbnMKZWcuIHdpdGggMjU2MHgxNDQwIG1vZGVzIHdoZXJlIHRoZSAy
NjZNSHogY2RjbGsgaXMgc3VmZmljaWVudAp0byBwdW1wIHRoZSBwaXhlbHMgKDI0MS41IE1IeiBk
b3RjbG9jaykgYnV0IGlzIHRvbyBsb3cgZm9yCnRoZSBEUCBhdWRpbyBkdWUgdG8gdGhlIGxpbmsg
ZnJlcXVlbmN5IGJlaW5nIDI3MCBNSHouCgp2MjogU3BlbGwgb3V0IHRoZSBjZGNsayBhbmQgbGlu
ayBmcmVxdWVuY2llcyB3ZSBhY3R1YWxseSBzdXBwb3J0CgpDYzogc3RhYmxlQHZnZXIua2VybmVs
Lm9yZwpUZXN0ZWQtYnk6IFN0ZWZhbiBHb3R0d2FsZCA8Z290dHdhbGRAaWdlbC5jb20+CkJ1Z3pp
bGxhOiBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0xMTExNDkK
U2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVs
LmNvbT4KTGluazogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoL21zZ2lk
LzIwMTkwNzE3MTE0NTM2LjIyOTM3LTEtdmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20KQWNr
ZWQtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgooY2hlcnJ5IHBp
Y2tlZCBmcm9tIGNvbW1pdCBiZmZiMzFmNzNiMjlhNjBlZjY5Mzg0MmQ4NzQ0OTUwYzI4MTk4NTFk
KQpTaWduZWQtb2ZmLWJ5OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2k5MTUvaW50ZWxfY2RjbGsuYyB8IDExICsrKysrKysrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgMTEgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2lu
dGVsX2NkY2xrLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9jZGNsay5jCmluZGV4IDI5
MDc1Yzc2MzQyODAuLjdiNDkwNmVkZTE0OGIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2ludGVsX2NkY2xrLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfY2RjbGsu
YwpAQCAtMjIwOCw2ICsyMjA4LDE3IEBAIGludCBpbnRlbF9jcnRjX2NvbXB1dGVfbWluX2NkY2xr
KGNvbnN0IHN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlICpjcnRjX3N0YXRlKQogCWlmIChJTlRFTF9H
RU4oZGV2X3ByaXYpID49IDkpCiAJCW1pbl9jZGNsayA9IG1heCgyICogOTYwMDAsIG1pbl9jZGNs
ayk7CiAKKwkvKgorCSAqICJGb3IgRFAgYXVkaW8gY29uZmlndXJhdGlvbiwgY2RjbGsgZnJlcXVl
bmN5IHNoYWxsIGJlIHNldCB0bworCSAqICBtZWV0IHRoZSBmb2xsb3dpbmcgcmVxdWlyZW1lbnRz
OgorCSAqICBEUCBMaW5rIEZyZXF1ZW5jeShNSHopIHwgQ2RjbGsgZnJlcXVlbmN5KE1IeikKKwkg
KiAgMjcwICAgICAgICAgICAgICAgICAgICB8IDMyMCBvciBoaWdoZXIKKwkgKiAgMTYyICAgICAg
ICAgICAgICAgICAgICB8IDIwMCBvciBoaWdoZXIiCisJICovCisJaWYgKChJU19WQUxMRVlWSUVX
KGRldl9wcml2KSB8fCBJU19DSEVSUllWSUVXKGRldl9wcml2KSkgJiYKKwkgICAgaW50ZWxfY3J0
Y19oYXNfZHBfZW5jb2RlcihjcnRjX3N0YXRlKSAmJiBjcnRjX3N0YXRlLT5oYXNfYXVkaW8pCisJ
CW1pbl9jZGNsayA9IG1heChjcnRjX3N0YXRlLT5wb3J0X2Nsb2NrLCBtaW5fY2RjbGspOworCiAJ
LyoKIAkgKiBPbiBWYWxsZXl2aWV3IHNvbWUgRFNJIHBhbmVscyBsb3NlICh2fGgpc3luYyB3aGVu
IHRoZSBjbG9jayBpcyBsb3dlcgogCSAqIHRoYW4gMzIwMDAwS0h6LgotLSAKMi4yMC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
