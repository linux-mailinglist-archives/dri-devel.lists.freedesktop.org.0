Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C05AB344A4C
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 17:05:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C888D6E509;
	Mon, 22 Mar 2021 16:05:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 353626E505;
 Mon, 22 Mar 2021 16:05:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2816A619AD;
 Mon, 22 Mar 2021 16:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616429107;
 bh=hZ+CAtng3yIYZIb+ah3e8qtw8iX8HVHsX0ExOcLMkVU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dwkY1GeSKE6uqnx1AxEi3VFdRhYPg81cUVXGmS7VFECNmiWnHG9H8Xs03DE5r5UkI
 2VYRrKWZEbiYE/8Go+UBgggdeU5IHX8PCQyERsMz4uhXvD8S/WDGEhcAqel5lYAhxx
 GH5OrCzsuWJ7MemQavOxq36ZBrGw8QsN0rHVPucenBu12gisEUNifGSz6+0j2xJ9ZZ
 bEVaUqft+/YBHP8/oDZqfcdvztMrcHT8BJQ3udH192n6G7X4gUnHIGCuLP1ptF/QU4
 TnlXa1Qe8PUzWprVm8njgDc/yGpNfz20AWAFmYDGGOfZtOuyJUs4ZC7Fgr12Ezshk/
 OxLRDx1pnNY1A==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kernel@vger.kernel.org, Martin Sebor <msebor@gcc.gnu.org>,
 Simon Kelley <simon@thekelleys.org.uk>, Kalle Valo <kvalo@codeaurora.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH 08/11] atmel: avoid gcc -Wstringop-overflow warning
Date: Mon, 22 Mar 2021 17:02:46 +0100
Message-Id: <20210322160253.4032422-9-arnd@kernel.org>
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
Cc: dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>,
 linux-scsi@vger.kernel.org, x86@kernel.org,
 James Smart <james.smart@broadcom.com>, tboot-devel@lists.sourceforge.net,
 ath11k@lists.infradead.org, Serge Hallyn <serge@hallyn.com>,
 Arnd Bergmann <arnd@arndb.de>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Ning Sun <ning.sun@intel.com>, Anders Larsen <al@alarsen.net>,
 cgroups@vger.kernel.org, Pascal Terjan <pterjan@google.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-security-module@vger.kernel.org, Tejun Heo <tj@kernel.org>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KCmdjYy0xMSBub3RpY2VzIHRoYXQg
dGhlIGZpZWxkcyBhcyBkZWZpbmVkIGluIHRoZSBhc3NfcmVxX2Zvcm1hdApzdHJ1Y3R1cmUgZG8g
bm90IG1hdGNoIHRoZSBhY3R1YWwgdXNlIG9mIHRoYXQgc3RydWN0dXJlOgoKY2MxOiBlcnJvcjog
d3JpdGluZyA0IGJ5dGVzIGludG8gYSByZWdpb24gb2Ygc2l6ZSBiZXR3ZWVuIDE4NDQ2NzQ0MDcz
NzA5NTUxNjEzIGFuZCAyIFstV2Vycm9yPXN0cmluZ29wLW92ZXJmbG93PV0KZHJpdmVycy9uZXQv
d2lyZWxlc3MvYXRtZWwvYXRtZWwuYzoyODg0OjIwOiBub3RlOiBhdCBvZmZzZXQgWzQsIDZdIGlu
dG8gZGVzdGluYXRpb24gb2JqZWN0IOKAmGFw4oCZIG9mIHNpemUgNgogMjg4NCB8ICAgICAgICAg
ICAgICAgICB1OCBhcFtFVEhfQUxFTl07IC8qIG5vdGhpbmcgYWZ0ZXIgaGVyZSBkaXJlY3RseSBh
Y2Nlc3NpYmxlICovCiAgICAgIHwgICAgICAgICAgICAgICAgICAgIF5+CmRyaXZlcnMvbmV0L3dp
cmVsZXNzL2F0bWVsL2F0bWVsLmM6Mjg4NToyMDogbm90ZTogYXQgb2Zmc2V0IFs0LCA2XSBpbnRv
IGRlc3RpbmF0aW9uIG9iamVjdCDigJhzc2lkX2VsX2lk4oCZIG9mIHNpemUgMQogMjg4NSB8ICAg
ICAgICAgICAgICAgICB1OCBzc2lkX2VsX2lkOwogICAgICB8ICAgICAgICAgICAgICAgICAgICBe
fn5+fn5+fn5+CgpUaGlzIGlzIGV4cGVjdGVkIGhlcmUgYmVjYXVzZSB0aGUgYWN0dWFsIHN0cnVj
dHVyZSBsYXlvdXQgaXMgdmFyaWFibGUuCkFzIHRoZSBjb2RlIGRvZXMgbm90IGFjdHVhbGx5IGFj
Y2VzcyB0aGUgaW5kaXZpZHVhbCBmaWVsZHMsIHJlcGxhY2UKdGhlbSB3aXRoIGEgY29tbWVudCBh
bmQgZml4ZWQtbGVuZ3RoIGFycmF5IHNvIHByZXZlbnQgZ2NjIGZyb20KY29tcGxhaW5pbmcgYWJv
dXQgaXQuCgpTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgotLS0K
IGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0bWVsL2F0bWVsLmMgfCAyNSArKysrKysrKysrKysrKyst
LS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRtZWwvYXRtZWwuYyBiL2Ry
aXZlcnMvbmV0L3dpcmVsZXNzL2F0bWVsL2F0bWVsLmMKaW5kZXggNzA3ZmU2NjcyN2Y4Li5mZjkx
NTJkNjAwZTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0bWVsL2F0bWVsLmMK
KysrIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRtZWwvYXRtZWwuYwpAQCAtMjg4MSwxMyArMjg4
MSwxOCBAQCBzdGF0aWMgdm9pZCBzZW5kX2Fzc29jaWF0aW9uX3JlcXVlc3Qoc3RydWN0IGF0bWVs
X3ByaXZhdGUgKnByaXYsIGludCBpc19yZWFzc29jKQogCXN0cnVjdCBhc3NfcmVxX2Zvcm1hdCB7
CiAJCV9fbGUxNiBjYXBhYmlsaXR5OwogCQlfX2xlMTYgbGlzdGVuX2ludGVydmFsOwotCQl1OCBh
cFtFVEhfQUxFTl07IC8qIG5vdGhpbmcgYWZ0ZXIgaGVyZSBkaXJlY3RseSBhY2Nlc3NpYmxlICov
Ci0JCXU4IHNzaWRfZWxfaWQ7Ci0JCXU4IHNzaWRfbGVuOwotCQl1OCBzc2lkW01BWF9TU0lEX0xF
TkdUSF07Ci0JCXU4IHN1cF9yYXRlc19lbF9pZDsKLQkJdTggc3VwX3JhdGVzX2xlbjsKLQkJdTgg
cmF0ZXNbNF07CisJCXU4IHNzaWRfZWxbRVRIX0FMRU4gKyAyICsgTUFYX1NTSURfTEVOR1RIICsg
MiArIDRdOworCQkvKgorCQkgKiBub3RoaW5nIGFmdGVyIGhlcmUgZGlyZWN0bHkgYWNjZXNzaWJs
ZToKKwkJICoKKwkJICogdTggYXBbRVRIX0FMRU5dOworCQkgKiB1OCBzc2lkX2VsX2lkOworCQkg
KiB1OCBzc2lkX2xlbjsKKwkJICogdTggc3NpZFtNQVhfU1NJRF9MRU5HVEhdOworCQkgKiB1OCBz
dXBfcmF0ZXNfZWxfaWQ7CisJCSAqIHU4IHN1cF9yYXRlc19sZW47CisJCSAqIHU4IHJhdGVzWzRd
OworCQkgKi8KIAl9IGJvZHk7CiAKIAloZWFkZXIuZnJhbWVfY29udHJvbCA9IGNwdV90b19sZTE2
KElFRUU4MDIxMV9GVFlQRV9NR01UIHwKQEAgLTI5MDcsMTMgKzI5MTIsMTMgQEAgc3RhdGljIHZv
aWQgc2VuZF9hc3NvY2lhdGlvbl9yZXF1ZXN0KHN0cnVjdCBhdG1lbF9wcml2YXRlICpwcml2LCBp
bnQgaXNfcmVhc3NvYykKIAogCWJvZHkubGlzdGVuX2ludGVydmFsID0gY3B1X3RvX2xlMTYocHJp
di0+bGlzdGVuX2ludGVydmFsICogcHJpdi0+YmVhY29uX3BlcmlvZCk7CiAKKwlzc2lkX2VsX3Ag
PSBib2R5LnNzaWRfZWw7CiAJLyogY3VycmVudCBBUCBhZGRyZXNzIC0gb25seSBpbiByZWFzc29j
IGZyYW1lICovCiAJaWYgKGlzX3JlYXNzb2MpIHsKLQkJbWVtY3B5KGJvZHkuYXAsIHByaXYtPkN1
cnJlbnRCU1NJRCwgRVRIX0FMRU4pOwotCQlzc2lkX2VsX3AgPSAmYm9keS5zc2lkX2VsX2lkOwor
CQltZW1jcHkoc3NpZF9lbF9wLCBwcml2LT5DdXJyZW50QlNTSUQsIEVUSF9BTEVOKTsKKwkJc3Np
ZF9lbF9wICs9IEVUSF9BTEVOOwogCQlib2R5c2l6ZSA9IDE4ICsgcHJpdi0+U1NJRF9zaXplOwog
CX0gZWxzZSB7Ci0JCXNzaWRfZWxfcCA9ICZib2R5LmFwWzBdOwogCQlib2R5c2l6ZSA9IDEyICsg
cHJpdi0+U1NJRF9zaXplOwogCX0KIAotLSAKMi4yOS4yCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
