Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDBEA6E29
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 18:25:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87F8389686;
	Tue,  3 Sep 2019 16:25:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2958895B6;
 Tue,  3 Sep 2019 16:25:09 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C13DF23711;
 Tue,  3 Sep 2019 16:25:08 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 19/23] drm/i915: Support flags in whitlist WAs
Date: Tue,  3 Sep 2019 12:24:20 -0400
Message-Id: <20190903162424.6877-19-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190903162424.6877-1-sashal@kernel.org>
References: <20190903162424.6877-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1567527909;
 bh=YEKpx2P2hrGWksNlq1jYo57hOhkCpoZ8pPpWkNg0n7o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=y6tofRjy31mgcYBs/IyrFck/TggwP24LSg7gq6ugduq5ViEoFLxNMQ2SQhpeMnRvS
 f/ZgrDfmMvqk7+vCq2DHd6bbxrc31pHIlIOXQFzX/BhpVEiG7lANOS/ksiodX6CKZS
 JZUsT2VgOF1wxzYE2dmw24fOyLuuQIhCIqtuwFh4=
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
Cc: Sasha Levin <sashal@kernel.org>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 "Robert M . Fosha" <robert.m.fosha@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, John Harrison <John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSm9obiBIYXJyaXNvbiA8Sm9obi5DLkhhcnJpc29uQEludGVsLmNvbT4KClsgVXBzdHJl
YW0gY29tbWl0IDY4ODNlYWIyNzQ4MTNkMTU4YmZjZmI0OTlhYTIyNWVjZTYxYzBmMjkgXQoKTmV3
ZXIgaGFyZHdhcmUgYWRkcyBmbGFncyB0byB0aGUgd2hpdGVsaXN0IHdvcmstYXJvdW5kIHJlZ2lz
dGVyLiBUaGVzZQphbGxvdyBwZXIgYWNjZXNzIGRpcmVjdGlvbiBwcml2aWxlZ2VzIGFuZCByYW5n
ZXMuCgpTaWduZWQtb2ZmLWJ5OiBKb2huIEhhcnJpc29uIDxKb2huLkMuSGFycmlzb25ASW50ZWwu
Y29tPgpTaWduZWQtb2ZmLWJ5OiBSb2JlcnQgTS4gRm9zaGEgPHJvYmVydC5tLmZvc2hhQGludGVs
LmNvbT4KQ2M6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+CkNjOiBD
aHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KUmV2aWV3ZWQtYnk6IFR2cnRr
byBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+ClJldmlld2VkLWJ5OiBUdnJ0a28g
VXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBUdnJ0a28g
VXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgpMaW5rOiBodHRwczovL3BhdGNod29y
ay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvbXNnaWQvMjAxOTA2MTgwMTAxMDguMjc0OTktMi1Kb2hu
LkMuSGFycmlzb25ASW50ZWwuY29tCihjaGVycnkgcGlja2VkIGZyb20gY29tbWl0IDUzODBkMGI3
ODFjNDkxZDk0YjRmNDY5MGVjZjk3NjJjMTk0NmM0ZWMpClNpZ25lZC1vZmYtYnk6IEpvb25hcyBM
YWh0aW5lbiA8am9vbmFzLmxhaHRpbmVuQGxpbnV4LmludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTog
U2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2k5MTVfcmVnLmggICAgICAgICAgfCA3ICsrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2lu
dGVsX3dvcmthcm91bmRzLmMgfCA5ICsrKysrKysrLQogMiBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvaTkxNV9yZWcuaCBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcmVnLmgKaW5kZXggMTNk
NmJkNGUxN2IyMC4uY2Y3NDhiODBlNjQwMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvaTkxNV9yZWcuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3JlZy5oCkBAIC0y
NTEwLDYgKzI1MTAsMTMgQEAgZW51bSBpOTE1X3Bvd2VyX3dlbGxfaWQgewogI2RlZmluZSAgIFJJ
TkdfV0FJVF9TRU1BUEhPUkUJKDEgPDwgMTApIC8qIGdlbjYrICovCiAKICNkZWZpbmUgUklOR19G
T1JDRV9UT19OT05QUklWKGJhc2UsIGkpIF9NTUlPKCgoYmFzZSkgKyAweDREMCkgKyAoaSkgKiA0
KQorI2RlZmluZSAgIFJJTkdfRk9SQ0VfVE9fTk9OUFJJVl9SVwkJKDAgPDwgMjgpICAgIC8qIENG
TCsgJiBHZW4xMSsgKi8KKyNkZWZpbmUgICBSSU5HX0ZPUkNFX1RPX05PTlBSSVZfUkQJCSgxIDw8
IDI4KQorI2RlZmluZSAgIFJJTkdfRk9SQ0VfVE9fTk9OUFJJVl9XUgkJKDIgPDwgMjgpCisjZGVm
aW5lICAgUklOR19GT1JDRV9UT19OT05QUklWX1JBTkdFXzEJCSgwIDw8IDApICAgICAvKiBDRkwr
ICYgR2VuMTErICovCisjZGVmaW5lICAgUklOR19GT1JDRV9UT19OT05QUklWX1JBTkdFXzQJCSgx
IDw8IDApCisjZGVmaW5lICAgUklOR19GT1JDRV9UT19OT05QUklWX1JBTkdFXzE2CSgyIDw8IDAp
CisjZGVmaW5lICAgUklOR19GT1JDRV9UT19OT05QUklWX1JBTkdFXzY0CSgzIDw8IDApCiAjZGVm
aW5lICAgUklOR19NQVhfTk9OUFJJVl9TTE9UUyAgMTIKIAogI2RlZmluZSBHRU43X1RMQl9SRF9B
RERSCV9NTUlPKDB4NDcwMCkKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVs
X3dvcmthcm91bmRzLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF93b3JrYXJvdW5kcy5j
CmluZGV4IDJmYjcwZmFiMmQxYzYuLjFkYjgyNmIxMjc3NGUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2ludGVsX3dvcmthcm91bmRzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvaW50ZWxfd29ya2Fyb3VuZHMuYwpAQCAtOTgxLDcgKzk4MSw3IEBAIGJvb2wgaW50ZWxfZ3Rf
dmVyaWZ5X3dvcmthcm91bmRzKHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICppOTE1LAogfQogCiBz
dGF0aWMgdm9pZAotd2hpdGVsaXN0X3JlZyhzdHJ1Y3QgaTkxNV93YV9saXN0ICp3YWwsIGk5MTVf
cmVnX3QgcmVnKQord2hpdGVsaXN0X3JlZ19leHQoc3RydWN0IGk5MTVfd2FfbGlzdCAqd2FsLCBp
OTE1X3JlZ190IHJlZywgdTMyIGZsYWdzKQogewogCXN0cnVjdCBpOTE1X3dhIHdhID0gewogCQku
cmVnID0gcmVnCkBAIC05OTAsOSArOTkwLDE2IEBAIHdoaXRlbGlzdF9yZWcoc3RydWN0IGk5MTVf
d2FfbGlzdCAqd2FsLCBpOTE1X3JlZ190IHJlZykKIAlpZiAoR0VNX0RFQlVHX1dBUk5fT04od2Fs
LT5jb3VudCA+PSBSSU5HX01BWF9OT05QUklWX1NMT1RTKSkKIAkJcmV0dXJuOwogCisJd2EucmVn
LnJlZyB8PSBmbGFnczsKIAlfd2FfYWRkKHdhbCwgJndhKTsKIH0KIAorc3RhdGljIHZvaWQKK3do
aXRlbGlzdF9yZWcoc3RydWN0IGk5MTVfd2FfbGlzdCAqd2FsLCBpOTE1X3JlZ190IHJlZykKK3sK
Kwl3aGl0ZWxpc3RfcmVnX2V4dCh3YWwsIHJlZywgUklOR19GT1JDRV9UT19OT05QUklWX1JXKTsK
K30KKwogc3RhdGljIHZvaWQgZ2VuOV93aGl0ZWxpc3RfYnVpbGQoc3RydWN0IGk5MTVfd2FfbGlz
dCAqdykKIHsKIAkvKiBXYVZGRVN0YXRlQWZ0ZXJQaXBlQ29udHJvbHdpdGhNZWRpYVN0YXRlQ2xl
YXI6c2tsLGJ4dCxnbGssY2ZsICovCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
