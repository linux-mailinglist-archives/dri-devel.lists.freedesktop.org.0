Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD705344A3A
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 17:04:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7808189CA2;
	Mon, 22 Mar 2021 16:03:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8861789CA2;
 Mon, 22 Mar 2021 16:03:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4428761998;
 Mon, 22 Mar 2021 16:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616429036;
 bh=yFqEt0Vza9xx1ZEH6vpmadF/s9WD+9cr+PvfYFx1jTs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DnY2VvcIHWNR00CmYsS8o9sdpXW8IfqlUTn3pfDogyHxX/SIITlr8SG6GxkT3eSRZ
 a7K8jLXsPna4Mm190+MpWcuBICb/n+i193Sgx5UJVnr/NQaks4zNGBOOkdJN7kk+Zx
 IrtL2gHR1/fBjD9NvgLiYwkQqQ/EKWhfodExGrNMHcxDZouSH1dybJZC/EbBnOcXm9
 XQLG8dt1bjMaDOofLpAx013Fhy9k111G7DuVnc/32l3avRksgUDzsBf0x12znYeUYk
 RAdBhG+/y/EhxEsBwjpyhm77vbHfFV6Wbj7ETM5qbIRB/4/X2e34tKnfe8hgDnqlGY
 gToo1OwJ8lpqg==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kernel@vger.kernel.org, Martin Sebor <msebor@gcc.gnu.org>,
 Serge Hallyn <serge@hallyn.com>, James Morris <jmorris@namei.org>
Subject: [PATCH 03/11] security: commoncap: fix -Wstringop-overread warning
Date: Mon, 22 Mar 2021 17:02:41 +0100
Message-Id: <20210322160253.4032422-4-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210322160253.4032422-1-arnd@kernel.org>
References: <20210322160253.4032422-1-arnd@kernel.org>
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org,
 Christian Brauner <christian.brauner@ubuntu.com>, linux-scsi@vger.kernel.org,
 x86@kernel.org, James Smart <james.smart@broadcom.com>,
 tboot-devel@lists.sourceforge.net, Kalle Valo <kvalo@codeaurora.org>,
 ath11k@lists.infradead.org, Miklos Szeredi <mszeredi@redhat.com>,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, Ning Sun <ning.sun@intel.com>,
 Anders Larsen <al@alarsen.net>, cgroups@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-security-module@vger.kernel.org,
 "Eric W. Biederman" <ebiederm@xmission.com>, Tejun Heo <tj@kernel.org>,
 Simon Kelley <simon@thekelleys.org.uk>, intel-gfx@lists.freedesktop.org,
 Tycho Andersen <tycho@tycho.pizza>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KCmdjYy0xMSBpbnRyb2RjZXMgYSBo
YXJtbGVzcyB3YXJuaW5nIGZvciBjYXBfaW5vZGVfZ2V0c2VjdXJpdHk6CgpzZWN1cml0eS9jb21t
b25jYXAuYzogSW4gZnVuY3Rpb24g4oCYY2FwX2lub2RlX2dldHNlY3VyaXR54oCZOgpzZWN1cml0
eS9jb21tb25jYXAuYzo0NDA6MzM6IGVycm9yOiDigJhtZW1jcHnigJkgcmVhZGluZyAxNiBieXRl
cyBmcm9tIGEgcmVnaW9uIG9mIHNpemUgMCBbLVdlcnJvcj1zdHJpbmdvcC1vdmVycmVhZF0KICA0
NDAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1lbWNweSgmbnNjYXAtPmRhdGEs
ICZjYXAtPmRhdGEsIHNpemVvZihfX2xlMzIpICogMiAqIFZGU19DQVBfVTMyKTsKICAgICAgfCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgoKVGhlIHByb2JsZW0gaGVy
ZSBpcyB0aGF0IHRtcGJ1ZiBpcyBpbml0aWFsaXplZCB0byBOVUxMLCBzbyBnY2MgYXNzdW1lcwpp
dCBpcyBub3QgYWNjZXNzaWJsZSB1bmxlc3MgaXQgZ2V0cyBzZXQgYnkgdmZzX2dldHhhdHRyX2Fs
bG9jKCkuICBUaGlzIGlzCmEgbGVnaXRpbWF0ZSB3YXJuaW5nIGFzIGZhciBhcyBJIGNhbiB0ZWxs
LCBidXQgdGhlIGNvZGUgaXMgY29ycmVjdCBzaW5jZQppdCBjb3JyZWN0bHkgaGFuZGxlcyB0aGUg
ZXJyb3Igd2hlbiB0aGF0IGZ1bmN0aW9uIGZhaWxzLgoKQWRkIGEgc2VwYXJhdGUgTlVMTCBjaGVj
ayB0byB0ZWxsIGdjYyBhYm91dCBpdCBhcyB3ZWxsLgoKU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJn
bWFubiA8YXJuZEBhcm5kYi5kZT4KLS0tCiBzZWN1cml0eS9jb21tb25jYXAuYyB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L3NlY3VyaXR5L2NvbW1vbmNhcC5jIGIvc2VjdXJpdHkvY29tbW9uY2FwLmMKaW5kZXggMjhmNGQy
NTQ4MGRmLi45YTM2ZWQ2ZGQ3MzcgMTAwNjQ0Ci0tLSBhL3NlY3VyaXR5L2NvbW1vbmNhcC5jCisr
KyBiL3NlY3VyaXR5L2NvbW1vbmNhcC5jCkBAIC00MDAsNyArNDAwLDcgQEAgaW50IGNhcF9pbm9k
ZV9nZXRzZWN1cml0eShzdHJ1Y3QgdXNlcl9uYW1lc3BhY2UgKm1udF91c2VybnMsCiAJCQkJICAg
ICAgJnRtcGJ1Ziwgc2l6ZSwgR0ZQX05PRlMpOwogCWRwdXQoZGVudHJ5KTsKIAotCWlmIChyZXQg
PCAwKQorCWlmIChyZXQgPCAwIHx8ICF0bXBidWYpCiAJCXJldHVybiByZXQ7CiAKIAlmc19ucyA9
IGlub2RlLT5pX3NiLT5zX3VzZXJfbnM7Ci0tIAoyLjI5LjIKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
