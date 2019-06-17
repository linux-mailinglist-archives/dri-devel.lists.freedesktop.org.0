Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C4A49220
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 23:10:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 956E56E0B0;
	Mon, 17 Jun 2019 21:10:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A6586E0AC
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 21:09:59 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E05292AF;
 Mon, 17 Jun 2019 23:09:54 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 07/10] drm: rcar-du: Provide for_each_group helper
Date: Tue, 18 Jun 2019 00:09:27 +0300
Message-Id: <20190617210930.6054-8-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190617210930.6054-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20190617210930.6054-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1560805795;
 bh=jykX+GW5ELgx/3v26bE+LaTvqVLuHhmEi55L841++20=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mCMnqLJE0xVh/VRSNYmlBgafugZhCeWxgxAPgzx9mOdzPhjF8/ezaM5GSoyUANsfr
 AxVIcnRyNZBTyoDQsnQBzL2nLhwXebpvEdSzuzpLp/dllr1tWGSJcK/h6yYzAKXkmO
 c231wgNs/d2b3YEFWE2KV+mxpbi3RtIMMSkTHenw=
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogS2llcmFuIEJpbmdoYW0gPGtpZXJhbi5iaW5naGFtK3JlbmVzYXNAaWRlYXNvbmJvYXJk
LmNvbT4KClJlZmFjdG9yaW5nIG9mIHRoZSBncm91cCBjb250cm9sIGNvZGUgd2lsbCBzb29uIHJl
cXVpcmUgbW9yZSBpdGVyYXRpb24Kb3ZlciB0aGUgYXZhaWxhYmxlIGdyb3Vwcy4gU2ltcGxpZnkg
dGhpcyBwcm9jZXNzIGJ5IGludHJvZHVjaW5nIGEgZ3JvdXAKaXRlcmF0aW9uIGhlbHBlci4KClNp
Z25lZC1vZmYtYnk6IEtpZXJhbiBCaW5naGFtIDxraWVyYW4uYmluZ2hhbStyZW5lc2FzQGlkZWFz
b25ib2FyZC5jb20+ClNpZ25lZC1vZmYtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGlu
Y2hhcnQrcmVuZXNhc0BpZGVhc29uYm9hcmQuY29tPgotLS0KQ2hhbmdlcyBzaW5jZSB2MjoKCi0g
RG9uJ3QgYXNzaWduIF9fZ3JvdXAgaW4gdGhlIGNvbmRpdGlvbiBwYXJ0IG9mIHRoZSBmb3Igc3Rh
dGVtZW50IG9mIHRoZQogIGZvcl9lYWNoX3JjZHVfZ3JvdXAoKSBtYWNybwotLS0KIGRyaXZlcnMv
Z3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfZHJ2LmggfCAgNSArKysrKwogZHJpdmVycy9ncHUvZHJt
L3JjYXItZHUvcmNhcl9kdV9rbXMuYyB8IDEwICsrLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwg
NyBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9yY2FyLWR1L3JjYXJfZHVfZHJ2LmggYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2Fy
X2R1X2Rydi5oCmluZGV4IDEzMjdjZDBkZjkwYS4uMGNjMDk4NGJmMmVhIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2Rydi5oCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9yY2FyLWR1L3JjYXJfZHVfZHJ2LmgKQEAgLTk2LDYgKzk2LDExIEBAIHN0cnVjdCByY2FyX2R1
X2RldmljZSB7CiAJdW5zaWduZWQgaW50IHZzcGQxX3Npbms7CiB9OwogCisjZGVmaW5lIGZvcl9l
YWNoX3JjZHVfZ3JvdXAoX19yY2R1LCBfX2dyb3VwLCBfX2kpIFwKKwlmb3IgKChfX2kpID0gMCwg
KF9fZ3JvdXApID0gJihfX3JjZHUpLT5ncm91cHNbMF07IFwKKwkgICAgIChfX2kpIDwgRElWX1JP
VU5EX1VQKChfX3JjZHUpLT5udW1fY3J0Y3MsIDIpOyBcCisJICAgICBfX2krKywgX19ncm91cCsr
KQorCiBzdGF0aWMgaW5saW5lIGJvb2wgcmNhcl9kdV9oYXMoc3RydWN0IHJjYXJfZHVfZGV2aWNl
ICpyY2R1LAogCQkJICAgICAgIHVuc2lnbmVkIGludCBmZWF0dXJlKQogewpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9rbXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9y
Y2FyLWR1L3JjYXJfZHVfa21zLmMKaW5kZXggMTQ0YzBjMWIxNTkxLi5jMDQxMzY2NzRlNTggMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfa21zLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9rbXMuYwpAQCAtNjI3LDkgKzYyNyw5IEBAIGlu
dCByY2FyX2R1X21vZGVzZXRfaW5pdChzdHJ1Y3QgcmNhcl9kdV9kZXZpY2UgKnJjZHUpCiAKIAlz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gcmNkdS0+ZGRldjsKIAlzdHJ1Y3QgZHJtX2VuY29kZXIg
KmVuY29kZXI7CisJc3RydWN0IHJjYXJfZHVfZ3JvdXAgKnJncnA7CiAJdW5zaWduZWQgaW50IGRw
YWQwX3NvdXJjZXM7CiAJdW5zaWduZWQgaW50IG51bV9lbmNvZGVyczsKLQl1bnNpZ25lZCBpbnQg
bnVtX2dyb3VwczsKIAl1bnNpZ25lZCBpbnQgc3dpbmRleDsKIAl1bnNpZ25lZCBpbnQgaHdpbmRl
eDsKIAl1bnNpZ25lZCBpbnQgaTsKQEAgLTY3MCwxMSArNjcwLDcgQEAgaW50IHJjYXJfZHVfbW9k
ZXNldF9pbml0KHN0cnVjdCByY2FyX2R1X2RldmljZSAqcmNkdSkKIAkJcmV0dXJuIHJldDsKIAog
CS8qIEluaXRpYWxpemUgdGhlIGdyb3Vwcy4gKi8KLQludW1fZ3JvdXBzID0gRElWX1JPVU5EX1VQ
KHJjZHUtPm51bV9jcnRjcywgMik7Ci0KLQlmb3IgKGkgPSAwOyBpIDwgbnVtX2dyb3VwczsgKytp
KSB7Ci0JCXN0cnVjdCByY2FyX2R1X2dyb3VwICpyZ3JwID0gJnJjZHUtPmdyb3Vwc1tpXTsKLQor
CWZvcl9lYWNoX3JjZHVfZ3JvdXAocmNkdSwgcmdycCwgaSkgewogCQltdXRleF9pbml0KCZyZ3Jw
LT5sb2NrKTsKIAogCQlyZ3JwLT5kZXYgPSByY2R1OwpAQCAtNzExLDggKzcwNyw2IEBAIGludCBy
Y2FyX2R1X21vZGVzZXRfaW5pdChzdHJ1Y3QgcmNhcl9kdV9kZXZpY2UgKnJjZHUpCiAKIAkvKiBD
cmVhdGUgdGhlIENSVENzLiAqLwogCWZvciAoc3dpbmRleCA9IDAsIGh3aW5kZXggPSAwOyBzd2lu
ZGV4IDwgcmNkdS0+bnVtX2NydGNzOyArK2h3aW5kZXgpIHsKLQkJc3RydWN0IHJjYXJfZHVfZ3Jv
dXAgKnJncnA7Ci0KIAkJLyogU2tpcCB1bnBvcHVsYXRlZCBEVSBjaGFubmVscy4gKi8KIAkJaWYg
KCEocmNkdS0+aW5mby0+Y2hhbm5lbHNfbWFzayAmIEJJVChod2luZGV4KSkpCiAJCQljb250aW51
ZTsKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
