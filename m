Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B24538541
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:44:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B56E89A20;
	Fri,  7 Jun 2019 07:43:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3BDF89686
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 18:44:47 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id w187so2102116qkb.11
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 11:44:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cKkqHG6lA8ec9OmOBivsmV6gRcE/obxU2CCqIDGlTpM=;
 b=OW8HXjmtaXRwYUkThC2IaQMpuSqhIuuEmq1Uvuo7bog7Jw0GHFILxACKfocz+OqaCJ
 trTabNlu1ESOh4oQLceE4oLlqHTXLjAlW5QtOtps+gA0+8xhu8yzB39U1m6uF3+Wl8H+
 M2B4a+0BYo8kHf7dJ+FmJrsM68raqZAViwH2KafqWDjXWBjgOYdiS6ACrzmNx8+BdyfM
 sBe5V2YbcLeAt8qVKGnBoyaegRCJX2Qdst8MU0DF64d9qkPZq31qPraeW40qfeNdcsts
 k9ToudYEfJF9QHt0QwfVQ/Xm7Oh+1QcT6gV5tO1RvtSTgjXK2TNxdl5L3gAAQq4Nr88V
 2pnQ==
X-Gm-Message-State: APjAAAUm8x7p3O5CBWyBc3pXgQKcSuE9PFGJk6/zTifIMhXz0VYT3Vfr
 OsjHYMZ76bg7Law61AU83944ud3neqLcqg==
X-Google-Smtp-Source: APXvYqwVkPweqvQyzdMm8hrdxDc8fcdFbLwJPBzLxuUMc6ON/X0Bc6zX6ARY8mPOX6I9iWyD4gOp2g==
X-Received: by 2002:a37:a0e:: with SMTP id 14mr21589009qkk.203.1559846687100; 
 Thu, 06 Jun 2019 11:44:47 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id e66sm1557234qtb.55.2019.06.06.11.44.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Jun 2019 11:44:46 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hYxNV-0008IB-G5; Thu, 06 Jun 2019 15:44:45 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com
Subject: [PATCH v2 hmm 02/11] mm/hmm: Use hmm_mirror not mm as an argument for
 hmm_range_register
Date: Thu,  6 Jun 2019 15:44:29 -0300
Message-Id: <20190606184438.31646-3-jgg@ziepe.ca>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190606184438.31646-1-jgg@ziepe.ca>
References: <20190606184438.31646-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 07 Jun 2019 07:43:40 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cKkqHG6lA8ec9OmOBivsmV6gRcE/obxU2CCqIDGlTpM=;
 b=jwj7m66yktUzAAVuBGGSCtyJS/egSnF1B/vxHFcHYcF2Uik/EqL4UNPU57byfvPnPV
 EUOhSE6Yc2ULsjPzk2Q0cPgGDWJT6t2SoK+wEhbAq1wIixyAii3w6eS/3F4aOcLSPwis
 wISfz8dx+YNMVHjshe7Qu1Sb1slKfIiBQMNHt3ytiNJzaiH2eoJOAMMz+9NSZ0N4cZIj
 IOJsM/44sVtvL3oMoPVTtng3fKxXbLORwQK9ZTj6pDXhMqEyH4epdWP8UfEJY1SfdN0a
 cUwOJj4KyRl8nUp5tdavSJ2m0nYwjfI9rz5uUmGGXTAadrKsObhys9ToUrWKVFbjE5E+
 wb4w==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, linux-rdma@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKUmFscGggb2JzZXJ2ZXMg
dGhhdCBobW1fcmFuZ2VfcmVnaXN0ZXIoKSBjYW4gb25seSBiZSBjYWxsZWQgYnkgYSBkcml2ZXIK
d2hpbGUgYSBtaXJyb3IgaXMgcmVnaXN0ZXJlZC4gTWFrZSB0aGlzIGNsZWFyIGluIHRoZSBBUEkg
YnkgcGFzc2luZyBpbiB0aGUKbWlycm9yIHN0cnVjdHVyZSBhcyBhIHBhcmFtZXRlci4KClRoaXMg
YWxzbyBzaW1wbGlmaWVzIHVuZGVyc3RhbmRpbmcgdGhlIGxpZmV0aW1lIG1vZGVsIGZvciBzdHJ1
Y3QgaG1tLCBhcwp0aGUgaG1tIHBvaW50ZXIgbXVzdCBiZSB2YWxpZCBhcyBwYXJ0IG9mIGEgcmVn
aXN0ZXJlZCBtaXJyb3Igc28gYWxsIHdlCm5lZWQgaW4gaG1tX3JlZ2lzdGVyX3JhbmdlKCkgaXMg
YSBzaW1wbGUga3JlZl9nZXQuCgpTdWdnZXN0ZWQtYnk6IFJhbHBoIENhbXBiZWxsIDxyY2FtcGJl
bGxAbnZpZGlhLmNvbT4KU2lnbmVkLW9mZi1ieTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFu
b3guY29tPgotLS0KdjIKLSBJbmNsdWRlIHRoZSBvbmVsaW5lIHBhdGNoIHRvIG5vdXZlYXVfc3Zt
LmMKLS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5jIHwgIDIgKy0KIGlu
Y2x1ZGUvbGludXgvaG1tLmggICAgICAgICAgICAgICAgICAgfCAgNyArKysrLS0tCiBtbS9obW0u
YyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMTUgKysrKysrLS0tLS0tLS0tCiAzIGZp
bGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfc3ZtLmMgYi9kcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5jCmluZGV4IDkzZWQ0M2M0MTNmMGJiLi44YzkyMzc0YWZj
ZjIyNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9zdm0uYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5jCkBAIC02NDksNyArNjQ5
LDcgQEAgbm91dmVhdV9zdm1fZmF1bHQoc3RydWN0IG52aWZfbm90aWZ5ICpub3RpZnkpCiAJCXJh
bmdlLnZhbHVlcyA9IG5vdXZlYXVfc3ZtX3Bmbl92YWx1ZXM7CiAJCXJhbmdlLnBmbl9zaGlmdCA9
IE5WSUZfVk1NX1BGTk1BUF9WMF9BRERSX1NISUZUOwogYWdhaW46Ci0JCXJldCA9IGhtbV92bWFf
ZmF1bHQoJnJhbmdlLCB0cnVlKTsKKwkJcmV0ID0gaG1tX3ZtYV9mYXVsdCgmc3ZtbS0+bWlycm9y
LCAmcmFuZ2UsIHRydWUpOwogCQlpZiAocmV0ID09IDApIHsKIAkJCW11dGV4X2xvY2soJnN2bW0t
Pm11dGV4KTsKIAkJCWlmICghaG1tX3ZtYV9yYW5nZV9kb25lKCZyYW5nZSkpIHsKZGlmZiAtLWdp
dCBhL2luY2x1ZGUvbGludXgvaG1tLmggYi9pbmNsdWRlL2xpbnV4L2htbS5oCmluZGV4IDY4OGM1
Y2E3MDY4Nzk1Li4yZDUxOTc5N2NiMTM0YSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9obW0u
aAorKysgYi9pbmNsdWRlL2xpbnV4L2htbS5oCkBAIC01MDUsNyArNTA1LDcgQEAgc3RhdGljIGlu
bGluZSBib29sIGhtbV9taXJyb3JfbW1faXNfYWxpdmUoc3RydWN0IGhtbV9taXJyb3IgKm1pcnJv
cikKICAqIFBsZWFzZSBzZWUgRG9jdW1lbnRhdGlvbi92bS9obW0ucnN0IGZvciBob3cgdG8gdXNl
IHRoZSByYW5nZSBBUEkuCiAgKi8KIGludCBobW1fcmFuZ2VfcmVnaXN0ZXIoc3RydWN0IGhtbV9y
YW5nZSAqcmFuZ2UsCi0JCSAgICAgICBzdHJ1Y3QgbW1fc3RydWN0ICptbSwKKwkJICAgICAgIHN0
cnVjdCBobW1fbWlycm9yICptaXJyb3IsCiAJCSAgICAgICB1bnNpZ25lZCBsb25nIHN0YXJ0LAog
CQkgICAgICAgdW5zaWduZWQgbG9uZyBlbmQsCiAJCSAgICAgICB1bnNpZ25lZCBwYWdlX3NoaWZ0
KTsKQEAgLTU0MSw3ICs1NDEsOCBAQCBzdGF0aWMgaW5saW5lIGJvb2wgaG1tX3ZtYV9yYW5nZV9k
b25lKHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlKQogfQogCiAvKiBUaGlzIGlzIGEgdGVtcG9yYXJ5
IGhlbHBlciB0byBhdm9pZCBtZXJnZSBjb25mbGljdCBiZXR3ZWVuIHRyZWVzLiAqLwotc3RhdGlj
IGlubGluZSBpbnQgaG1tX3ZtYV9mYXVsdChzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSwgYm9vbCBi
bG9jaykKK3N0YXRpYyBpbmxpbmUgaW50IGhtbV92bWFfZmF1bHQoc3RydWN0IGhtbV9taXJyb3Ig
Km1pcnJvciwKKwkJCQlzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSwgYm9vbCBibG9jaykKIHsKIAls
b25nIHJldDsKIApAQCAtNTU0LDcgKzU1NSw3IEBAIHN0YXRpYyBpbmxpbmUgaW50IGhtbV92bWFf
ZmF1bHQoc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UsIGJvb2wgYmxvY2spCiAJcmFuZ2UtPmRlZmF1
bHRfZmxhZ3MgPSAwOwogCXJhbmdlLT5wZm5fZmxhZ3NfbWFzayA9IC0xVUw7CiAKLQlyZXQgPSBo
bW1fcmFuZ2VfcmVnaXN0ZXIocmFuZ2UsIHJhbmdlLT52bWEtPnZtX21tLAorCXJldCA9IGhtbV9y
YW5nZV9yZWdpc3RlcihyYW5nZSwgbWlycm9yLAogCQkJCSByYW5nZS0+c3RhcnQsIHJhbmdlLT5l
bmQsCiAJCQkJIFBBR0VfU0hJRlQpOwogCWlmIChyZXQpCmRpZmYgLS1naXQgYS9tbS9obW0uYyBi
L21tL2htbS5jCmluZGV4IDU0NzAwMmY1NmExNjNkLi44Nzk2NDQ3Mjk5MDIzYyAxMDA2NDQKLS0t
IGEvbW0vaG1tLmMKKysrIGIvbW0vaG1tLmMKQEAgLTkyNSwxMyArOTI1LDEzIEBAIHN0YXRpYyB2
b2lkIGhtbV9wZm5zX2NsZWFyKHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlLAogICogVHJhY2sgdXBk
YXRlcyB0byB0aGUgQ1BVIHBhZ2UgdGFibGUgc2VlIGluY2x1ZGUvbGludXgvaG1tLmgKICAqLwog
aW50IGhtbV9yYW5nZV9yZWdpc3RlcihzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSwKLQkJICAgICAg
IHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLAorCQkgICAgICAgc3RydWN0IGhtbV9taXJyb3IgKm1pcnJv
ciwKIAkJICAgICAgIHVuc2lnbmVkIGxvbmcgc3RhcnQsCiAJCSAgICAgICB1bnNpZ25lZCBsb25n
IGVuZCwKIAkJICAgICAgIHVuc2lnbmVkIHBhZ2Vfc2hpZnQpCiB7CiAJdW5zaWduZWQgbG9uZyBt
YXNrID0gKCgxVUwgPDwgcGFnZV9zaGlmdCkgLSAxVUwpOwotCXN0cnVjdCBobW0gKmhtbTsKKwlz
dHJ1Y3QgaG1tICpobW0gPSBtaXJyb3ItPmhtbTsKIAogCXJhbmdlLT52YWxpZCA9IGZhbHNlOwog
CXJhbmdlLT5obW0gPSBOVUxMOwpAQCAtOTQ1LDE1ICs5NDUsMTIgQEAgaW50IGhtbV9yYW5nZV9y
ZWdpc3RlcihzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSwKIAlyYW5nZS0+c3RhcnQgPSBzdGFydDsK
IAlyYW5nZS0+ZW5kID0gZW5kOwogCi0JaG1tID0gaG1tX2dldF9vcl9jcmVhdGUobW0pOwotCWlm
ICghaG1tKQotCQlyZXR1cm4gLUVGQVVMVDsKLQogCS8qIENoZWNrIGlmIGhtbV9tbV9kZXN0cm95
KCkgd2FzIGNhbGwuICovCi0JaWYgKGhtbS0+bW0gPT0gTlVMTCB8fCBobW0tPmRlYWQpIHsKLQkJ
aG1tX3B1dChobW0pOworCWlmIChobW0tPm1tID09IE5VTEwgfHwgaG1tLT5kZWFkKQogCQlyZXR1
cm4gLUVGQVVMVDsKLQl9CisKKwlyYW5nZS0+aG1tID0gaG1tOworCWtyZWZfZ2V0KCZobW0tPmty
ZWYpOwogCiAJLyogSW5pdGlhbGl6ZSByYW5nZSB0byB0cmFjayBDUFUgcGFnZSB0YWJsZSB1cGRh
dGVzLiAqLwogCW11dGV4X2xvY2soJmhtbS0+bG9jayk7Ci0tIAoyLjIxLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
