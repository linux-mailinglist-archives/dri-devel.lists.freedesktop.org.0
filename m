Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDBA326657
	for <lists+dri-devel@lfdr.de>; Fri, 26 Feb 2021 18:30:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 129486EE29;
	Fri, 26 Feb 2021 17:30:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4C416EE29
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Feb 2021 17:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=cUpjOvqMFT82ciPpS3h3o5kw6NB7VHxKS03NBNLEB6M=; b=UaiPO/LgLQiER5zhsEULNyTVN+
 TmwnBO4Z/tFKMrmlKMmPfy3CB92WJPrWm5gY5caTqf6W5/a0GCMl3c9P6N7gNrEgS05wSFMbNwT5f
 2Rd6M7cLbjEKvtQK6mlk31Dm2p5NIlLYHD5f/LhIBPuKcviX1awZ5SCECfRzjo4T0j/hIHpa9CgLb
 kwu6NBNJ5ZyuQO9/JJTJ/0fdO6GEHHhDV+G5pb1PHkL5LH0J5X8VLh82czZzVss4OjsPZDJ2k1Jv5
 8yqDLkvGm/0/UmRwr4IA391AoLwSSjO8i+0uahbG8XMPGSmh+Gvlu6cMV0/+P3FBh2sqVx3IWR+pP
 CkJVfmaQ==;
Received: from [2601:1c0:6280:3f0::3ba4] (helo=merlin.infradead.org)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFgwP-0008Ov-Tg; Fri, 26 Feb 2021 17:30:14 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH -next v2] fbdev: atyfb: use LCD management functions for
 PPC_PMAC also
Date: Fri, 26 Feb 2021 09:30:08 -0800
Message-Id: <20210226173008.18236-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Randy Dunlap <rdunlap@infradead.org>,
 Nick Desaulniers <ndesaulniers@google.com>, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW5jbHVkZSBQUENfUE1BQyBpbiB0aGUgY29uZmlncyB0aGF0IHVzZSBhdHlfbGRfbGNkKCkgYW5k
CmF0eV9zdF9sY2QoKSBpbXBsZW1lbnRhdGlvbnMgc28gdGhhdCB0aGUgUE0gY29kZSBtYXkgd29y
awpjb3JyZWN0bHkgZm9yIFBQQ19QTUFDLgoKU3VnZ2VzdGVkLWJ5OiBWaWxsZSBTeXJqw6Rsw6Qg
PHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBSYW5keSBEdW5s
YXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAZmZ3bGwuY2g+CkNjOiBOaWNrIERlc2F1bG5pZXJzIDxuZGVzYXVsbmllcnNAZ29vZ2xlLmNv
bT4KQ2M6IGxpbnV4LWZiZGV2QHZnZXIua2VybmVsLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpDYzogQmFydGxvbWllaiBab2xuaWVya2lld2ljeiA8Yi56b2xuaWVya2ll
QHNhbXN1bmcuY29tPgpDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpDYzogRGF2
aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxh
QGxpbnV4LmludGVsLmNvbT4KLS0tCkRhbmllbC0gV2UgYWxzbyBuZWVkIHRoaXMgcGF0Y2g6Cmh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2RyaS1kZXZlbC8yMDIxMDIyNDIxNTUyOC44MjItMS1yZHVu
bGFwQGluZnJhZGVhZC5vcmcvCnRvIGZpeCBhIGtlcm5lbCB0ZXN0IHJvYm90IGJ1aWxkIGVycm9y
LgoKdjI6IHNlbmQgdGhlIGNvcnJlY3QgdmVyc2lvbiBvZiB0aGlzIHBhdGNoICh0aGFua3MsIFZp
bGxlKQoKIGRyaXZlcnMvdmlkZW8vZmJkZXYvYXR5L2F0eWZiX2Jhc2UuYyB8ICAgIDkgKysrKyst
LS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKLS0t
IGxpbnV4LW5leHQtMjAyMTAyMTkub3JpZy9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2F0eS9hdHlmYl9i
YXNlLmMKKysrIGxpbnV4LW5leHQtMjAyMTAyMTkvZHJpdmVycy92aWRlby9mYmRldi9hdHkvYXR5
ZmJfYmFzZS5jCkBAIC0xMzMsNyArMTMzLDcgQEAKICNkZWZpbmUgUFJJTlRLRShmbXQsIGFyZ3Mu
Li4pCXByaW50ayhLRVJOX0VSUiAiYXR5ZmI6ICIgZm10LCAjIyBhcmdzKQogCiAjaWYgZGVmaW5l
ZChDT05GSUdfUE1BQ19CQUNLTElHSFQpIHx8IGRlZmluZWQoQ09ORklHX0ZCX0FUWV9HRU5FUklD
X0xDRCkgfHwgXAotZGVmaW5lZChDT05GSUdfRkJfQVRZX0JBQ0tMSUdIVCkKK2RlZmluZWQoQ09O
RklHX0ZCX0FUWV9CQUNLTElHSFQpIHx8IGRlZmluZWQgKENPTkZJR19QUENfUE1BQykKIHN0YXRp
YyBjb25zdCB1MzIgbHRfbGNkX3JlZ3NbXSA9IHsKIAlDTkZHX1BBTkVMX0xHLAogCUxDRF9HRU5f
Q05UTF9MRywKQEAgLTE3NSw4ICsxNzUsOCBAQCB1MzIgYXR5X2xkX2xjZChpbnQgaW5kZXgsIGNv
bnN0IHN0cnVjdCBhCiAJCXJldHVybiBhdHlfbGRfbGUzMihMQ0RfREFUQSwgcGFyKTsKIAl9CiB9
Ci0jZWxzZSAvKiBkZWZpbmVkKENPTkZJR19QTUFDX0JBQ0tMSUdIVCkgfHwgZGVmaW5lZChDT05G
SUdfRkJfQVRZX0JBQ0tMSUdIVCkgXAotCSBkZWZpbmVkKENPTkZJR19GQl9BVFlfR0VORVJJQ19M
Q0QpICovCisjZWxzZSAvKiBkZWZpbmVkKENPTkZJR19QTUFDX0JBQ0tMSUdIVCkgfHwgZGVmaW5l
ZChDT05GSUdfRkJfQVRZX0JBQ0tMSUdIVCkgfHwKKwkgZGVmaW5lZChDT05GSUdfRkJfQVRZX0dF
TkVSSUNfTENEKSB8fCBkZWZpbmVkKENPTkZJR19QUENfUE1BQykgKi8KIHZvaWQgYXR5X3N0X2xj
ZChpbnQgaW5kZXgsIHUzMiB2YWwsIGNvbnN0IHN0cnVjdCBhdHlmYl9wYXIgKnBhcikKIHsgfQog
CkBAIC0xODQsNyArMTg0LDggQEAgdTMyIGF0eV9sZF9sY2QoaW50IGluZGV4LCBjb25zdCBzdHJ1
Y3QgYQogewogCXJldHVybiAwOwogfQotI2VuZGlmIC8qIGRlZmluZWQoQ09ORklHX1BNQUNfQkFD
S0xJR0hUKSB8fCBkZWZpbmVkIChDT05GSUdfRkJfQVRZX0dFTkVSSUNfTENEKSAqLworI2VuZGlm
IC8qIGRlZmluZWQoQ09ORklHX1BNQUNfQkFDS0xJR0hUKSB8fCBkZWZpbmVkKENPTkZJR19GQl9B
VFlfQkFDS0xJR0hUKSB8fAorCSAgZGVmaW5lZCAoQ09ORklHX0ZCX0FUWV9HRU5FUklDX0xDRCkg
fHwgZGVmaW5lZChDT05GSUdfUFBDX1BNQUMpICovCiAKICNpZmRlZiBDT05GSUdfRkJfQVRZX0dF
TkVSSUNfTENECiAvKgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
