Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A4041CF2
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 08:56:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AAED8922A;
	Wed, 12 Jun 2019 06:55:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 537D88916D
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 14:24:10 +0000 (UTC)
Received: from [167.98.27.226] (helo=happy.office.codethink.co.uk)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1hahOT-0003vU-5W; Tue, 11 Jun 2019 15:04:57 +0100
From: Michael Drake <michael.drake@codethink.co.uk>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Michael Drake <michael.drake@codethink.co.uk>
Subject: [PATCH v1 05/11] ti948: Add alive check function using
 schedule_delayed_work()
Date: Tue, 11 Jun 2019 15:04:06 +0100
Message-Id: <20190611140412.32151-6-michael.drake@codethink.co.uk>
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

VGhpcyBzaW1wbHkgcnVucyB0aGUgZnVuY3Rpb24gb25jZSBldmVyeSA1IHNlY29uZHMsIHdoaWxl
IHRoZQpkZXZpY2UgaXMgc3VwcG9zZWQgdG8gYmUgYWN0aXZlLiAgVGhlIGFsaXZlIGNoZWNrIGZ1
bmN0aW9uIGlzCmN1cnJlbnRseSBzaW1wbHkgYSBzdHViLCB0aGF0IGxvZ3MgaXQgaGFzIGJlZW4g
Y2FsbGVkLCBhbmQKcmUtaW5zZXJ0cyBpdHNlbGYgaW50byB0aGUgd29yayBxdWV1ZS4KClNpZ25l
ZC1vZmYtYnk6IE1pY2hhZWwgRHJha2UgPG1pY2hhZWwuZHJha2VAY29kZXRoaW5rLmNvLnVrPgpD
YzogUGF0cmljayBHbGFzZXIgPHBnbGFzZXJAdGVzbGEuY29tPgpDYzogTmF0ZSBDYXNlIDxuY2Fz
ZUB0ZXNsYS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aTk0OC5jIHwgMzcgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDM2IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL3RpOTQ4LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpOTQ4LmMKaW5kZXggOWNiMzcy
MTVmMDQ5Li44NmRhYTM3MDFiOTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
dGk5NDguYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpOTQ4LmMKQEAgLTE2LDYgKzE2
LDcgQEAKIAogI2luY2x1ZGUgPGxpbnV4L3JlZ3VsYXRvci9jb25zdW1lci5oPgogI2luY2x1ZGUg
PGxpbnV4L29mX2RldmljZS5oPgorI2luY2x1ZGUgPGxpbnV4L3dvcmtxdWV1ZS5oPgogI2luY2x1
ZGUgPGxpbnV4L21vZHVsZS5oPgogI2luY2x1ZGUgPGxpbnV4L3JlZ21hcC5oPgogI2luY2x1ZGUg
PGxpbnV4L2RlbGF5Lmg+CkBAIC0yNSw2ICsyNiw5IEBACiAvKiBOdW1iZXIgb2YgdGltZXMgdG8g
dHJ5IGNoZWNraW5nIGZvciBkZXZpY2Ugb24gYnJpbmd1cC4gKi8KICNkZWZpbmUgVEk5NDhfREVW
SUNFX0lEX1RSSUVTIDEwCiAKKy8qIEFsaXZlIGNoZWNrIGV2ZXJ5IDUgc2Vjb25kcy4gKi8KKyNk
ZWZpbmUgVEk5NDhfQUxJVkVfQ0hFQ0tfREVMQVkgKDUgKiBIWikKKwogLyoqCiAgKiBlbnVtIHRp
OTQ4X3JlZyAtIFRJOTQ4IHJlZ2lzdGVycy4KICAqCkBAIC0zNzQsOSArMzc4LDI3IEBAIHN0YXRp
YyBpbmxpbmUgc3RydWN0IHRpOTQ4X2N0eCAqdGk5NDhfY3R4X2Zyb21fZGV2KHN0cnVjdCBkZXZp
Y2UgKmRldikKIAlyZXR1cm4gaTJjX2dldF9jbGllbnRkYXRhKGNsaWVudCk7CiB9CiAKK3N0YXRp
YyBpbmxpbmUgc3RydWN0IHRpOTQ4X2N0eCAqZGVsYXllZF93b3JrX3RvX3RpOTQ4X2N0eCgKKwkJ
c3RydWN0IGRlbGF5ZWRfd29yayAqZHdvcmspCit7CisJcmV0dXJuIGNvbnRhaW5lcl9vZihkd29y
aywgc3RydWN0IHRpOTQ4X2N0eCwgYWxpdmVfY2hlY2spOworfQorCitzdGF0aWMgdm9pZCB0aTk0
OF9hbGl2ZV9jaGVjayhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspCit7CisJc3RydWN0IGRlbGF5
ZWRfd29yayAqZHdvcmsgPSB0b19kZWxheWVkX3dvcmsod29yayk7CisJc3RydWN0IHRpOTQ4X2N0
eCAqdGk5NDggPSBkZWxheWVkX3dvcmtfdG9fdGk5NDhfY3R4KGR3b3JrKTsKKworCWRldl9pbmZv
KCZ0aTk0OC0+aTJjLT5kZXYsICIlcyBBbGl2ZSBjaGVjayFcbiIsIF9fZnVuY19fKTsKKworCS8q
IFJlc2NoZWR1bGUgb3Vyc2VsZiBmb3IgdGhlIG5leHQgY2hlY2suICovCisJc2NoZWR1bGVfZGVs
YXllZF93b3JrKCZ0aTk0OC0+YWxpdmVfY2hlY2ssIFRJOTQ4X0FMSVZFX0NIRUNLX0RFTEFZKTsK
K30KKwogc3RhdGljIGludCB0aTk0OF9wbV9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQogewog
CXN0cnVjdCB0aTk0OF9jdHggKnRpOTQ4ID0gdGk5NDhfY3R4X2Zyb21fZGV2KGRldik7CisJYm9v
bCBzY2hlZHVsZWQ7CiAJaW50IHJldDsKIAogCWlmICh0aTk0OCA9PSBOVUxMKQpAQCAtMzg2LDcg
KzQwOCwxOCBAQCBzdGF0aWMgaW50IHRpOTQ4X3BtX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYp
CiAJaWYgKHJldCAhPSAwKQogCQlyZXR1cm4gcmV0OwogCi0JcmV0dXJuIHRpOTQ4X3dyaXRlX2Nv
bmZpZ19zZXEodGk5NDgpOworCXJldCA9IHRpOTQ4X3dyaXRlX2NvbmZpZ19zZXEodGk5NDgpOwor
CWlmIChyZXQgIT0gMCkKKwkJcmV0dXJuIHJldDsKKworCUlOSVRfREVMQVlFRF9XT1JLKCZ0aTk0
OC0+YWxpdmVfY2hlY2ssIHRpOTQ4X2FsaXZlX2NoZWNrKTsKKworCXNjaGVkdWxlZCA9IHNjaGVk
dWxlX2RlbGF5ZWRfd29yaygKKwkJCSZ0aTk0OC0+YWxpdmVfY2hlY2ssIFRJOTQ4X0FMSVZFX0NI
RUNLX0RFTEFZKTsKKwlpZiAoIXNjaGVkdWxlZCkKKwkJZGV2X3dhcm4oJnRpOTQ4LT5pMmMtPmRl
diwgIkFsaXZlIGNoZWNrIGFscmVhZHkgc2NoZWR1bGVkXG4iKTsKKworCXJldHVybiAwOwogfQog
CiBzdGF0aWMgaW50IHRpOTQ4X3BtX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQpAQCAtMzk2
LDYgKzQyOSw4IEBAIHN0YXRpYyBpbnQgdGk5NDhfcG1fc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpk
ZXYpCiAJaWYgKHRpOTQ4ID09IE5VTEwpCiAJCXJldHVybiAwOwogCisJY2FuY2VsX2RlbGF5ZWRf
d29ya19zeW5jKCZ0aTk0OC0+YWxpdmVfY2hlY2spOworCiAJcmV0dXJuIHRpOTQ4X3Bvd2VyX29m
Zih0aTk0OCk7CiB9CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
