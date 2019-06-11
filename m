Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F6041CCD
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 08:54:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A505589294;
	Wed, 12 Jun 2019 06:53:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C42589165
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 14:24:08 +0000 (UTC)
Received: from [167.98.27.226] (helo=happy.office.codethink.co.uk)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1hahOT-0003vU-LT; Tue, 11 Jun 2019 15:04:57 +0100
From: Michael Drake <michael.drake@codethink.co.uk>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Michael Drake <michael.drake@codethink.co.uk>
Subject: [PATCH v1 06/11] ti948: Reconfigure in the alive check when device
 returns
Date: Tue, 11 Jun 2019 15:04:07 +0100
Message-Id: <20190611140412.32151-7-michael.drake@codethink.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611140412.32151-1-michael.drake@codethink.co.uk>
References: <20190611140412.32151-1-michael.drake@codethink.co.uk>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 12 Jun 2019 06:53:41 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-kernel@lists.codethink.co.uk,
 David Airlie <airlied@linux.ie>, Nate Case <ncase@tesla.com>,
 Rob Herring <robh+dt@kernel.org>, Patrick Glaser <pglaser@tesla.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgdGhlIGFsaXZlIGNoZWNrIGRldGVjdHMgYSB0cmFuc2l0aW9uIHRvIHRoZSBhbGl2ZSBzdGF0
ZSwKdGhlIGRldmljZSBjb25maWd1cmF0aW9uIGlzIHJld3JpdHRlbi4KClNpZ25lZC1vZmYtYnk6
IE1pY2hhZWwgRHJha2UgPG1pY2hhZWwuZHJha2VAY29kZXRoaW5rLmNvLnVrPgpDYzogUGF0cmlj
ayBHbGFzZXIgPHBnbGFzZXJAdGVzbGEuY29tPgpDYzogTmF0ZSBDYXNlIDxuY2FzZUB0ZXNsYS5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aTk0OC5jIHwgMTkgKysrKysrKysrKysr
KysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpOTQ4LmMgYi9kcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL3RpOTQ4LmMKaW5kZXggODZkYWEzNzAxYjkxLi5iNWM3NjY3MTFjNGIgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGk5NDguYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL3RpOTQ4LmMKQEAgLTEzMiw2ICsxMzIsOCBAQCBzdHJ1Y3QgdGk5NDhfcmVn
X3ZhbCB7CiAgKiBAcmVnX25hbWVzOiAgIEFycmF5IG9mIHJlZ3VsYXRvciBuYW1lcywgb3IgTlVM
TC4KICAqIEByZWdzOiAgICAgICAgQXJyYXkgb2YgcmVndWxhdG9ycywgb3IgTlVMTC4KICAqIEBy
ZWdfY291bnQ6ICAgTnVtYmVyIG9mIGVudHJpZXMgaW4gcmVnX25hbWVzIGFuZCByZWdzIGFycmF5
cy4KKyAqIEBhbGl2ZV9jaGVjazogQ29udGV4dCBmb3IgdGhlIGFsaXZlIGNoZWNraW5nIHdvcmsg
aXRlbS4KKyAqIEBhbGl2ZTogICAgICAgV2hldGhlciB0aGUgZGV2aWNlIGlzIGFsaXZlIG9yIG5v
dCAoYWxpdmVfY2hlY2spLgogICovCiBzdHJ1Y3QgdGk5NDhfY3R4IHsKIAlzdHJ1Y3QgaTJjX2Ns
aWVudCAqaTJjOwpAQCAtMTQxLDYgKzE0Myw4IEBAIHN0cnVjdCB0aTk0OF9jdHggewogCWNvbnN0
IGNoYXIgKipyZWdfbmFtZXM7CiAJc3RydWN0IHJlZ3VsYXRvciAqKnJlZ3M7CiAJc2l6ZV90IHJl
Z19jb3VudDsKKwlzdHJ1Y3QgZGVsYXllZF93b3JrIGFsaXZlX2NoZWNrOworCWJvb2wgYWxpdmU7
CiB9OwogCiBzdGF0aWMgYm9vbCB0aTk0OF9yZWFkYWJsZV9yZWcoc3RydWN0IGRldmljZSAqZGV2
LCB1bnNpZ25lZCBpbnQgcmVnKQpAQCAtMzQ2LDYgKzM1MCw4IEBAIHN0YXRpYyBpbnQgdGk5NDhf
cG93ZXJfb24oc3RydWN0IHRpOTQ4X2N0eCAqdGk5NDgpCiAJaWYgKHJldCAhPSAwKQogCQlyZXR1
cm4gcmV0OwogCisJdGk5NDgtPmFsaXZlID0gdHJ1ZTsKKwogCW1zbGVlcCg1MDApOwogCiAJcmV0
dXJuIDA7CkBAIC0zNTYsNiArMzYyLDggQEAgc3RhdGljIGludCB0aTk0OF9wb3dlcl9vZmYoc3Ry
dWN0IHRpOTQ4X2N0eCAqdGk5NDgpCiAJaW50IGk7CiAJaW50IHJldDsKIAorCXRpOTQ4LT5hbGl2
ZSA9IGZhbHNlOworCiAJZm9yIChpID0gdGk5NDgtPnJlZ19jb3VudDsgaSA+IDA7IGktLSkgewog
CQlkZXZfaW5mbygmdGk5NDgtPmkyYy0+ZGV2LCAiRGlzYWJsaW5nICVzIHJlZ3VsYXRvclxuIiwK
IAkJCQl0aTk0OC0+cmVnX25hbWVzW2kgLSAxXSk7CkBAIC0zODgsOCArMzk2LDE3IEBAIHN0YXRp
YyB2b2lkIHRpOTQ4X2FsaXZlX2NoZWNrKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKIHsKIAlz
dHJ1Y3QgZGVsYXllZF93b3JrICpkd29yayA9IHRvX2RlbGF5ZWRfd29yayh3b3JrKTsKIAlzdHJ1
Y3QgdGk5NDhfY3R4ICp0aTk0OCA9IGRlbGF5ZWRfd29ya190b190aTk0OF9jdHgoZHdvcmspOwor
CWludCByZXQgPSB0aTk0OF9kZXZpY2VfY2hlY2sodGk5NDgpOwogCi0JZGV2X2luZm8oJnRpOTQ4
LT5pMmMtPmRldiwgIiVzIEFsaXZlIGNoZWNrIVxuIiwgX19mdW5jX18pOworCWlmICh0aTk0OC0+
YWxpdmUgPT0gZmFsc2UgJiYgcmV0ID09IDApIHsKKwkJZGV2X2luZm8oJnRpOTQ4LT5pMmMtPmRl
diwgIkRldmljZSBoYXMgY29tZSBiYWNrIHRvIGxpZmUhXG4iKTsKKwkJdGk5NDhfd3JpdGVfY29u
ZmlnX3NlcSh0aTk0OCk7CisJCXRpOTQ4LT5hbGl2ZSA9IHRydWU7CisKKwl9IGVsc2UgaWYgKHRp
OTQ4LT5hbGl2ZSA9PSB0cnVlICYmIHJldCAhPSAwKSB7CisJCWRldl9pbmZvKCZ0aTk0OC0+aTJj
LT5kZXYsICJEZXZpY2UgaGFzIHN0b3BwZWQgcmVzcG9uZGluZ1xuIik7CisJCXRpOTQ4LT5hbGl2
ZSA9IGZhbHNlOworCX0KIAogCS8qIFJlc2NoZWR1bGUgb3Vyc2VsZiBmb3IgdGhlIG5leHQgY2hl
Y2suICovCiAJc2NoZWR1bGVfZGVsYXllZF93b3JrKCZ0aTk0OC0+YWxpdmVfY2hlY2ssIFRJOTQ4
X0FMSVZFX0NIRUNLX0RFTEFZKTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
