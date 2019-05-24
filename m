Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B82293AE
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 10:55:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEE956E0DA;
	Fri, 24 May 2019 08:54:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0A736E0B7
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 08:54:28 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id p26so13357841edr.2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 01:54:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cm6Zk7GljL6jePfAIeGXLYQwMTWG8I+jBNPdQ08bAaA=;
 b=EfFzUi37mOQlWdgm0rqauRaS3TO5wk7ZqmoakrvcAGuwIr6nEevECxT6bZeumLzb8x
 FMt6PD0n5PAVfE8kDlrgc6rHgpgTTJMc1l+fFSzS6ClEHo6DH3RNBmM+qWmTJqibQN07
 68Mc6BGXKcZSsqIYC9dYP/hzrwIMVTwbAIkFpkyLZuBswo+q8e5BlAJZG5XFA37krRbS
 6ESyWKmphEb+XuDNGxL2HrbPbN9Wqj6CNqQPJWWaOQVBpDueX9IrZ4iyLFdw7l/lb7qJ
 Roql1YrpBQRDlosnNXAVnWUgX3CdPqXqUbtMcH3eB/4hx2E8m+Jn/9NB3C8e7k1gBkhi
 4m4A==
X-Gm-Message-State: APjAAAV8omoel6osHVLbsJ3IC54aMK5yrintNPg8MCPOnxz9CibxVeZB
 /iKxzzFS6+IEU2sfsouMyWTB1g==
X-Google-Smtp-Source: APXvYqyVkgMZkhO9exZuZqDajdXFWZm65cyatM+vsxYx3gghMw1oBX7yhuzBrT0RXlVCw+gR5jtxJQ==
X-Received: by 2002:a17:906:4442:: with SMTP id
 i2mr12809671ejp.178.1558688066918; 
 Fri, 24 May 2019 01:54:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id 96sm567082edq.68.2019.05.24.01.54.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 May 2019 01:54:26 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 19/33] fbdev: unify unlink_framebuffer paths
Date: Fri, 24 May 2019 10:53:40 +0200
Message-Id: <20190524085354.27411-20-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190524085354.27411-1-daniel.vetter@ffwll.ch>
References: <20190524085354.27411-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cm6Zk7GljL6jePfAIeGXLYQwMTWG8I+jBNPdQ08bAaA=;
 b=bRkx/z0EyYVtpBt/oj0ErHn1XAliHb9LCtrj5M5meP50p063vhmea6sd9/mf7IQiZz
 imaHmNxuAIW7JcxB2TRz7+ouZg/Qgzkry1168vXhgHsvyi2urrKimUEQAEQoTLV4Ney/
 u9++WAq/GqqyoMUXo87bavXa0VV8rwPCtdMpI=
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
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
 Hans de Goede <hdegoede@redhat.com>, Mikulas Patocka <mpatocka@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rm9yIHNvbWUgcmVhc29ucyB0aGUgcG1fdnRfc3dpdGNoX3VucmVnaXN0ZXIgY2FsbCB3YXMgbWlz
c2luZyBmcm9tIHRoZQpkaXJlY3QgdW5yZWdpc3Rlcl9mcmFtZWJ1ZmZlciBwYXRoLiBGaXggdGhp
cy4KCnYyOiBmYmluZm8tPmRldiBpcyB1c2VkIHRvIGRlY2lkZWQgd2hldGhlciB1bmxpbmtfZnJh
bWVidWZmZXIgaGFzIGJlZW4KY2FsbGVkIGFscmVhZHkuIEkgYm90Y2hlZCB0aGF0IGluIHYxLiBN
YWtlIHRoaXMgYWxsIGNsZWFyZXIgYnkKaW5saW5pbmcgX191bmxpbmtfZnJhbWVidWZmZXIuCgp2
MzogRml4IHR5cG9lIGluIHN1YmplY3QgKE1hYXJ0ZW4pLgoKU2lnbmVkLW9mZi1ieTogRGFuaWVs
IFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBNYWFydGVuIExhbmtob3JzdCA8
bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgpDYzogQmFydGxvbWllaiBab2xuaWVy
a2lld2ljeiA8Yi56b2xuaWVya2llQHNhbXN1bmcuY29tPgpDYzogRGFuaWVsIFZldHRlciA8ZGFu
aWVsLnZldHRlckBmZndsbC5jaD4KQ2M6ICJNaWNoYcWCIE1pcm9zxYJhdyIgPG1pcnEtbGludXhA
cmVyZS5xbXFtLnBsPgpDYzogUGV0ZXIgUm9zaW4gPHBlZGFAYXhlbnRpYS5zZT4KQ2M6IEhhbnMg
ZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+CkNjOiBNaWt1bGFzIFBhdG9ja2EgPG1wYXRv
Y2thQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZibWVtLmMgfCA0
NyArKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIwIGlu
c2VydGlvbnMoKyksIDI3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8v
ZmJkZXYvY29yZS9mYm1lbS5jIGIvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZibWVtLmMKaW5k
ZXggZjNiY2FkMzBkM2JhLi5iZWU0NWU5NDA1YjggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8v
ZmJkZXYvY29yZS9mYm1lbS5jCisrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1lbS5j
CkBAIC0xNzIyLDE1ICsxNzIyLDMwIEBAIHN0YXRpYyB2b2lkIHVuYmluZF9jb25zb2xlKHN0cnVj
dCBmYl9pbmZvICpmYl9pbmZvKQogCWNvbnNvbGVfdW5sb2NrKCk7CiB9CiAKLXN0YXRpYyB2b2lk
IF9fdW5saW5rX2ZyYW1lYnVmZmVyKHN0cnVjdCBmYl9pbmZvICpmYl9pbmZvKTsKLQotc3RhdGlj
IHZvaWQgZG9fdW5yZWdpc3Rlcl9mcmFtZWJ1ZmZlcihzdHJ1Y3QgZmJfaW5mbyAqZmJfaW5mbykK
K3ZvaWQgdW5saW5rX2ZyYW1lYnVmZmVyKHN0cnVjdCBmYl9pbmZvICpmYl9pbmZvKQogewotCXVu
YmluZF9jb25zb2xlKGZiX2luZm8pOworCWludCBpOworCisJaSA9IGZiX2luZm8tPm5vZGU7CisJ
aWYgKFdBUk5fT04oaSA8IDAgfHwgaSA+PSBGQl9NQVggfHwgcmVnaXN0ZXJlZF9mYltpXSAhPSBm
Yl9pbmZvKSkKKwkJcmV0dXJuOworCisJaWYgKCFmYl9pbmZvLT5kZXYpCisJCXJldHVybjsKKwor
CWRldmljZV9kZXN0cm95KGZiX2NsYXNzLCBNS0RFVihGQl9NQUpPUiwgaSkpOwogCiAJcG1fdnRf
c3dpdGNoX3VucmVnaXN0ZXIoZmJfaW5mby0+ZGV2KTsKIAotCV9fdW5saW5rX2ZyYW1lYnVmZmVy
KGZiX2luZm8pOworCXVuYmluZF9jb25zb2xlKGZiX2luZm8pOworCisJZmJfaW5mby0+ZGV2ID0g
TlVMTDsKK30KK0VYUE9SVF9TWU1CT0wodW5saW5rX2ZyYW1lYnVmZmVyKTsKKworc3RhdGljIHZv
aWQgZG9fdW5yZWdpc3Rlcl9mcmFtZWJ1ZmZlcihzdHJ1Y3QgZmJfaW5mbyAqZmJfaW5mbykKK3sK
Kwl1bmxpbmtfZnJhbWVidWZmZXIoZmJfaW5mbyk7CiAJaWYgKGZiX2luZm8tPnBpeG1hcC5hZGRy
ICYmCiAJICAgIChmYl9pbmZvLT5waXhtYXAuZmxhZ3MgJiBGQl9QSVhNQVBfREVGQVVMVCkpCiAJ
CWtmcmVlKGZiX2luZm8tPnBpeG1hcC5hZGRyKTsKQEAgLTE3NTMsMjggKzE3NjgsNiBAQCBzdGF0
aWMgdm9pZCBkb191bnJlZ2lzdGVyX2ZyYW1lYnVmZmVyKHN0cnVjdCBmYl9pbmZvICpmYl9pbmZv
KQogCXB1dF9mYl9pbmZvKGZiX2luZm8pOwogfQogCi1zdGF0aWMgdm9pZCBfX3VubGlua19mcmFt
ZWJ1ZmZlcihzdHJ1Y3QgZmJfaW5mbyAqZmJfaW5mbykKLXsKLQlpbnQgaTsKLQotCWkgPSBmYl9p
bmZvLT5ub2RlOwotCWlmIChXQVJOX09OKGkgPCAwIHx8IGkgPj0gRkJfTUFYIHx8IHJlZ2lzdGVy
ZWRfZmJbaV0gIT0gZmJfaW5mbykpCi0JCXJldHVybjsKLQotCWlmIChmYl9pbmZvLT5kZXYpIHsK
LQkJZGV2aWNlX2Rlc3Ryb3koZmJfY2xhc3MsIE1LREVWKEZCX01BSk9SLCBpKSk7Ci0JCWZiX2lu
Zm8tPmRldiA9IE5VTEw7Ci0JfQotfQotCi12b2lkIHVubGlua19mcmFtZWJ1ZmZlcihzdHJ1Y3Qg
ZmJfaW5mbyAqZmJfaW5mbykKLXsKLQlfX3VubGlua19mcmFtZWJ1ZmZlcihmYl9pbmZvKTsKLQot
CXVuYmluZF9jb25zb2xlKGZiX2luZm8pOwotfQotRVhQT1JUX1NZTUJPTCh1bmxpbmtfZnJhbWVi
dWZmZXIpOwotCiAvKioKICAqIHJlbW92ZV9jb25mbGljdGluZ19mcmFtZWJ1ZmZlcnMgLSByZW1v
dmUgZmlybXdhcmUtY29uZmlndXJlZCBmcmFtZWJ1ZmZlcnMKICAqIEBhOiBtZW1vcnkgcmFuZ2Us
IHVzZXJzIG9mIHdoaWNoIGFyZSB0byBiZSByZW1vdmVkCi0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
