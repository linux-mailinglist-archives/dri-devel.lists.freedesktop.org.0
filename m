Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A25AF9D932
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 00:33:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 167776E31C;
	Mon, 26 Aug 2019 22:33:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91A7789CA8
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 22:33:27 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id y8so13416120oih.10
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 15:33:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ts2BNP4Mwcn8VDxGl/va9XJyRObd509hUDKfhgkialg=;
 b=UOyAs6Z+K3YZQWLxLWjENyJT8WX/I4Iy1AcxtYOifVgRdon0B9jOit4QWluOkOGV5B
 8go8ZBDZSHtztNWs90ZFVccXAUocwKBTqNzWAwy2kXr77i5n0cpFkkcGsDSCGloLOyIY
 dYBxNkvXMPPwleVi3AEIGhUOCcwY+j7KPoiWnBeQQsRCtzApyxrbSDyQqWiHVPXoBoCo
 noQ0ACcy672YMKT2z6BRHIiV+eb6iXizjIkNOhx8XG9bxf8u161hgObMZMV7j13a2n4N
 aLcqY7gQDF/lgcHL4iPHZB+yfMwwb45n8gPF0We+CAFqe98Bblcn5y2klZuihMNRCx32
 MB4Q==
X-Gm-Message-State: APjAAAWA3Fy0dXLCMrVvWcws1eZw7wQOLWYujRNGq9DpwnYPnZI2PxfV
 G+8WF50SGfFjsebhEJUTK0wacZM=
X-Google-Smtp-Source: APXvYqwy29VftBrD9mCH2oEn+r2wD6kBY07Tjox6ZEr9+qm4Ieb6Ht+jTMLpAyeBhM7Xp0gzADq0AA==
X-Received: by 2002:aca:c588:: with SMTP id
 v130mr13562313oif.165.1566858806147; 
 Mon, 26 Aug 2019 15:33:26 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id e22sm3668959oii.7.2019.08.26.15.33.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2019 15:33:25 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 7/8] drm/panfrost: Flush and disable address space when
 freeing page tables
Date: Mon, 26 Aug 2019 17:33:16 -0500
Message-Id: <20190826223317.28509-8-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190826223317.28509-1-robh@kernel.org>
References: <20190826223317.28509-1-robh@kernel.org>
MIME-Version: 1.0
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q3VycmVudGx5LCBwYWdlIHRhYmxlcyBhcmUgZnJlZWQgd2l0aG91dCBkaXNhYmxpbmcgdGhlIGFk
ZHJlc3Mgc3BhY2UgZmlyc3QuClRoaXMgcHJvYmFibHkgaXMgZmluZSBhcyB3ZSdsbCBzd2l0Y2gg
dG8gbmV3IHBhZ2UgdGFibGVzIHdoZW4gdGhlIGFkZHJlc3MKc3BhY2UgaXMgYWxsb2NhdGVkIGFn
YWluIGFuZCBydW50aW1lIFBNIHN1c3BlbmQgd2lsbCByZXNldCB0aGUgR1BVCmNsZWFyaW5nIHRo
ZSByZWdpc3RlcnMuIEhvd2V2ZXIsIGl0J3MgYmV0dGVyIHRvIGNsZWFuIHVwIGFmdGVyIG91cnNl
bHZlcy4KVGhlcmUgaXMgYWxzbyBhIHByb2JsZW0gdGhhdCB3ZSBjb3VsZCBiZSBhY2Nlc3Npbmcg
dGhlIGgvdyBpbgp0bGJfaW52X2NvbnRleHQoKSB3aGVuIHN1c3BlbmRlZC4KClJld29yayB0aGUg
ZGlzYWJsZSBjb2RlIHRvIG1ha2Ugc3VyZSB3ZSBmbHVzaCBjYWNoZXMvVExCcyBhbmQgZGlzYWJs
ZSB0aGUKYWRkcmVzcyBzcGFjZSBiZWZvcmUgZnJlZWluZyB0aGUgcGFnZSB0YWJsZXMgaWYgd2Ug
YXJlIG5vdCBzdXNwZW5kZWQuIEFzCnRoZSB0bGJfaW52X2NvbnRleHQoKSBob29rIGlzIG9ubHkg
Y2FsbGVkIHdoZW4gZnJlZWluZyB0aGUgcGFnZSB0YWJsZXMgYW5kCndlIGRvIGEgZmx1c2ggYmVm
b3JlIGRpc2FibGluZyB0aGUgQVMsIGxldHMgcmVtb3ZlIHRoZSBmbHVzaCBmcm9tCnRsYl9pbnZf
Y29udGV4dCBhbmQgYXZvaWQgYW55IHJ1bnRpbWUgUE0gaXNzdWVzLgoKRml4ZXM6IDcyODJmNzY0
NWQwNiAoImRybS9wYW5mcm9zdDogSW1wbGVtZW50IHBlciBGRCBhZGRyZXNzIHNwYWNlcyIpCkNj
OiBUb21ldSBWaXpvc28gPHRvbWV1LnZpem9zb0Bjb2xsYWJvcmEuY29tPgpDYzogU3RldmVuIFBy
aWNlIDxzdGV2ZW4ucHJpY2VAYXJtLmNvbT4KQ2M6IEFseXNzYSBSb3Nlbnp3ZWlnIDxhbHlzc2Eu
cm9zZW56d2VpZ0Bjb2xsYWJvcmEuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4
LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpTaWduZWQtb2ZmLWJ5OiBS
b2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgotLS0KdjM6CiAtIE5ldyBwYXRjaCByZXBsYWNp
bmcgImRybS9wYW5mcm9zdDogUmVtb3ZlIHVubmVjZXNzYXJ5IGZsdXNoaW5nIGZyb20gdGxiX2lu
dl9jb250ZXh0IgoKIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9tbXUuYyB8IDE2
ICsrKysrKysrKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDcgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0
X21tdS5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X21tdS5jCmluZGV4IGQx
ZWJkZTMzMjdmZS4uMzg3ZDgzMGNiN2NmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFu
ZnJvc3QvcGFuZnJvc3RfbW11LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZy
b3N0X21tdS5jCkBAIC0xMjksOCArMTI5LDEwIEBAIHN0YXRpYyB2b2lkIHBhbmZyb3N0X21tdV9l
bmFibGUoc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYsIHN0cnVjdCBwYW5mcm9zdF9tCiAJ
d3JpdGVfY21kKHBmZGV2LCBhc19uciwgQVNfQ09NTUFORF9VUERBVEUpOwogfQoKLXN0YXRpYyB2
b2lkIG1tdV9kaXNhYmxlKHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2LCB1MzIgYXNfbnIp
CitzdGF0aWMgdm9pZCBwYW5mcm9zdF9tbXVfZGlzYWJsZShzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNl
ICpwZmRldiwgdTMyIGFzX25yKQogeworCW1tdV9od19kb19vcGVyYXRpb25fbG9ja2VkKHBmZGV2
LCBhc19uciwgMCwgfjBVTCwgQVNfQ09NTUFORF9GTFVTSF9NRU0pOworCiAJbW11X3dyaXRlKHBm
ZGV2LCBBU19UUkFOU1RBQl9MTyhhc19uciksIDApOwogCW1tdV93cml0ZShwZmRldiwgQVNfVFJB
TlNUQUJfSEkoYXNfbnIpLCAwKTsKCkBAIC0zMjEsMTEgKzMyMyw3IEBAIHZvaWQgcGFuZnJvc3Rf
bW11X3VubWFwKHN0cnVjdCBwYW5mcm9zdF9nZW1fb2JqZWN0ICpibykKIH0KCiBzdGF0aWMgdm9p
ZCBtbXVfdGxiX2ludl9jb250ZXh0X3MxKHZvaWQgKmNvb2tpZSkKLXsKLQlzdHJ1Y3QgcGFuZnJv
c3RfZmlsZV9wcml2ICpwcml2ID0gY29va2llOwotCi0JbW11X2h3X2RvX29wZXJhdGlvbihwcml2
LT5wZmRldiwgJnByaXYtPm1tdSwgMCwgfjBVTCwgQVNfQ09NTUFORF9GTFVTSF9NRU0pOwotfQor
e30KCiBzdGF0aWMgdm9pZCBtbXVfdGxiX2ludl9yYW5nZV9ub3N5bmModW5zaWduZWQgbG9uZyBp
b3ZhLCBzaXplX3Qgc2l6ZSwKIAkJCQkgICAgIHNpemVfdCBncmFudWxlLCBib29sIGxlYWYsIHZv
aWQgKmNvb2tpZSkKQEAgLTM3NCw2ICszNzIsMTEgQEAgdm9pZCBwYW5mcm9zdF9tbXVfcGd0YWJs
ZV9mcmVlKHN0cnVjdCBwYW5mcm9zdF9maWxlX3ByaXYgKnByaXYpCgogCXNwaW5fbG9jaygmcGZk
ZXYtPmFzX2xvY2spOwogCWlmIChtbXUtPmFzID49IDApIHsKKwkJcG1fcnVudGltZV9nZXRfbm9y
ZXN1bWUocGZkZXYtPmRldik7CisJCWlmIChwbV9ydW50aW1lX2FjdGl2ZShwZmRldi0+ZGV2KSkK
KwkJCXBhbmZyb3N0X21tdV9kaXNhYmxlKHBmZGV2LCBtbXUtPmFzKTsKKwkJcG1fcnVudGltZV9w
dXRfYXV0b3N1c3BlbmQocGZkZXYtPmRldik7CisKIAkJY2xlYXJfYml0KG1tdS0+YXMsICZwZmRl
di0+YXNfYWxsb2NfbWFzayk7CiAJCWNsZWFyX2JpdChtbXUtPmFzLCAmcGZkZXYtPmFzX2luX3Vz
ZV9tYXNrKTsKIAkJbGlzdF9kZWwoJm1tdS0+bGlzdCk7CkBAIC02MTgsNSArNjIxLDQgQEAgaW50
IHBhbmZyb3N0X21tdV9pbml0KHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2KQogdm9pZCBw
YW5mcm9zdF9tbXVfZmluaShzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldikKIHsKIAltbXVf
d3JpdGUocGZkZXYsIE1NVV9JTlRfTUFTSywgMCk7Ci0JbW11X2Rpc2FibGUocGZkZXYsIDApOwog
fQotLQoyLjIwLjEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
