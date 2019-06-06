Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C343438555
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:44:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFFE589ADC;
	Fri,  7 Jun 2019 07:43:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B86D2896E7
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 18:44:51 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id a132so2100760qkb.13
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 11:44:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nVAUpO+Ga9NYec9bVUlta7oVxGoK2kbyT+1hUTcsX2M=;
 b=Ko45GFesv1eN+hqRCOo/TB43LzjloKVZ5Ic/d1EjZh3U9wNKvbaVPU43UMhIHPCWyk
 VD1sYcFa+greGDl7uD9xlnr+FJkc2uTsteYanzhbxe/3ZQiA9e+9+V5fnCojbzL0RxJI
 d9+eCGZ37HLA/FC2y5Wiwddyek0kbi/RAYdasMUIPDyXDgQTe08XbdwKzKcxYxKHXlZs
 pwdy0MpTc6oHG/eTXEGMZJbPGytLOBeppjFBf9CMgzuFuWtbMIp7C+tSByaHvbQ07iZ7
 tjw4yi7aOcABU8QbBeAdu1nYFnF1c1jc7V6uC+vfBvd8Y4E4VcBGQmmIp6f6VbPICFfK
 YwLA==
X-Gm-Message-State: APjAAAUJ5NIcUQ6lELcYQcqifXPwMbzW8F6JJUzSx75iufHSkvDcsW3A
 ZloMRe/ywqAYtEQgDEGaAfXZFg==
X-Google-Smtp-Source: APXvYqy0lCJbH1BvPYOo0rOmLYXG/g+I9HtsZNodsB/KhCTBbD6BMVIIs/zFfGrbgs1cd5AeX+0slQ==
X-Received: by 2002:a05:620a:16cc:: with SMTP id
 a12mr32024122qkn.256.1559846690927; 
 Thu, 06 Jun 2019 11:44:50 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id q36sm1951613qtc.12.2019.06.06.11.44.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Jun 2019 11:44:46 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hYxNV-0008J3-Ud; Thu, 06 Jun 2019 15:44:45 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com
Subject: [PATCH v2 hmm 11/11] mm/hmm: Remove confusing comment and logic from
 hmm_release
Date: Thu,  6 Jun 2019 15:44:38 -0300
Message-Id: <20190606184438.31646-12-jgg@ziepe.ca>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190606184438.31646-1-jgg@ziepe.ca>
References: <20190606184438.31646-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 07 Jun 2019 07:43:40 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nVAUpO+Ga9NYec9bVUlta7oVxGoK2kbyT+1hUTcsX2M=;
 b=WgY47IGZKwCscEhmp/e1SH9Qdm9WcIPMWuHYPXHgf1Mke+ckY9UbBST6Yg3085YiGZ
 dcNR69Qrxwy8qK6hBe1Ue5L8mtizg8fgMYwpWlMDyzW4sJZM/YSdC7J0JCTA28fxl76n
 +LUXoIcNaktF9sMJ+8Tn9DSETKfpEaKYxfe0XcgkeYX9s25CuXN7zKQgSo93XiKMF8Ia
 uyDd1lBZZfguzvqyPsXI94pwdw1QaF2JfejyOIr3xXYPHSXV060VLQByKbXFlIqKGo61
 qP5nXZ0Y1Bzv69Slh4GEkWmlgkAOHNc2qWHPy706QC/VjevthD4d+IaR7G2877aUIVh2
 s12Q==
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

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKaG1tX3JlbGVhc2UoKSBp
cyBjYWxsZWQgZXhhY3RseSBvbmNlIHBlciBobW0uIG9wcy0+cmVsZWFzZSgpIGNhbm5vdAphY2Np
ZGVudGFsbHkgdHJpZ2dlciBhbnkgYWN0aW9uIHRoYXQgd291bGQgcmVjdXJzZSBiYWNrIG9udG8K
aG1tLT5taXJyb3JzX3NlbS4KClRoaXMgZml4ZXMgYSB1c2UgYWZ0ZXItZnJlZSByYWNlIG9mIHRo
ZSBmb3JtOgoKICAgICAgIENQVTAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIENQ
VTEKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGhtbV9yZWxlYXNl
KCkKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdXBfd3JpdGUo
JmhtbS0+bWlycm9yc19zZW0pOwogaG1tX21pcnJvcl91bnJlZ2lzdGVyKG1pcnJvcikKICBkb3du
X3dyaXRlKCZobW0tPm1pcnJvcnNfc2VtKTsKICB1cF93cml0ZSgmaG1tLT5taXJyb3JzX3NlbSk7
CiAga2ZyZWUobWlycm9yKQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBtaXJyb3ItPm9wcy0+cmVsZWFzZShtaXJyb3IpCgpUaGUgb25seSB1c2VyIHdlIGhhdmUg
dG9kYXkgZm9yIG9wcy0+cmVsZWFzZSBpcyBhbiBlbXB0eSBmdW5jdGlvbiwgc28gdGhpcwppcyB1
bmFtYmlndW91c2x5IHNhZmUuCgpBcyBhIGNvbnNlcXVlbmNlIG9mIHBsdWdnaW5nIHRoaXMgcmFj
ZSBkcml2ZXJzIGFyZSBub3QgYWxsb3dlZCB0bwpyZWdpc3Rlci91bnJlZ2lzdGVyIG1pcnJvcnMg
ZnJvbSB3aXRoaW4gYSByZWxlYXNlIG9wLgoKU2lnbmVkLW9mZi1ieTogSmFzb24gR3VudGhvcnBl
IDxqZ2dAbWVsbGFub3guY29tPgotLS0KIG1tL2htbS5jIHwgMjggKysrKysrKysrLS0tLS0tLS0t
LS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvbW0vaG1tLmMgYi9tbS9obW0uYwppbmRleCA3MDlkMTM4ZGQ0OTAy
Ny4uM2E0NWRkM2Q3NzgyNDggMTAwNjQ0Ci0tLSBhL21tL2htbS5jCisrKyBiL21tL2htbS5jCkBA
IC0xMzYsMjYgKzEzNiwxNiBAQCBzdGF0aWMgdm9pZCBobW1fcmVsZWFzZShzdHJ1Y3QgbW11X25v
dGlmaWVyICptbiwgc3RydWN0IG1tX3N0cnVjdCAqbW0pCiAJV0FSTl9PTighbGlzdF9lbXB0eSgm
aG1tLT5yYW5nZXMpKTsKIAltdXRleF91bmxvY2soJmhtbS0+bG9jayk7CiAKLQlkb3duX3dyaXRl
KCZobW0tPm1pcnJvcnNfc2VtKTsKLQltaXJyb3IgPSBsaXN0X2ZpcnN0X2VudHJ5X29yX251bGwo
JmhtbS0+bWlycm9ycywgc3RydWN0IGhtbV9taXJyb3IsCi0JCQkJCSAgbGlzdCk7Ci0Jd2hpbGUg
KG1pcnJvcikgewotCQlsaXN0X2RlbF9pbml0KCZtaXJyb3ItPmxpc3QpOwotCQlpZiAobWlycm9y
LT5vcHMtPnJlbGVhc2UpIHsKLQkJCS8qCi0JCQkgKiBEcm9wIG1pcnJvcnNfc2VtIHNvIHRoZSBy
ZWxlYXNlIGNhbGxiYWNrIGNhbiB3YWl0Ci0JCQkgKiBvbiBhbnkgcGVuZGluZyB3b3JrIHRoYXQg
bWlnaHQgaXRzZWxmIHRyaWdnZXIgYQotCQkJICogbW11X25vdGlmaWVyIGNhbGxiYWNrIGFuZCB0
aHVzIHdvdWxkIGRlYWRsb2NrIHdpdGgKLQkJCSAqIHVzLgotCQkJICovCi0JCQl1cF93cml0ZSgm
aG1tLT5taXJyb3JzX3NlbSk7CisJZG93bl9yZWFkKCZobW0tPm1pcnJvcnNfc2VtKTsKKwlsaXN0
X2Zvcl9lYWNoX2VudHJ5KG1pcnJvciwgJmhtbS0+bWlycm9ycywgbGlzdCkgeworCQkvKgorCQkg
KiBOb3RlOiBUaGUgZHJpdmVyIGlzIG5vdCBhbGxvd2VkIHRvIHRyaWdnZXIKKwkJICogaG1tX21p
cnJvcl91bnJlZ2lzdGVyKCkgZnJvbSB0aGlzIHRocmVhZC4KKwkJICovCisJCWlmIChtaXJyb3It
Pm9wcy0+cmVsZWFzZSkKIAkJCW1pcnJvci0+b3BzLT5yZWxlYXNlKG1pcnJvcik7Ci0JCQlkb3du
X3dyaXRlKCZobW0tPm1pcnJvcnNfc2VtKTsKLQkJfQotCQltaXJyb3IgPSBsaXN0X2ZpcnN0X2Vu
dHJ5X29yX251bGwoJmhtbS0+bWlycm9ycywKLQkJCQkJCSAgc3RydWN0IGhtbV9taXJyb3IsIGxp
c3QpOwogCX0KLQl1cF93cml0ZSgmaG1tLT5taXJyb3JzX3NlbSk7CisJdXBfcmVhZCgmaG1tLT5t
aXJyb3JzX3NlbSk7CiAKIAlobW1fcHV0KGhtbSk7CiB9CkBAIC0yODcsNyArMjc3LDcgQEAgdm9p
ZCBobW1fbWlycm9yX3VucmVnaXN0ZXIoc3RydWN0IGhtbV9taXJyb3IgKm1pcnJvcikKIAlzdHJ1
Y3QgaG1tICpobW0gPSBtaXJyb3ItPmhtbTsKIAogCWRvd25fd3JpdGUoJmhtbS0+bWlycm9yc19z
ZW0pOwotCWxpc3RfZGVsX2luaXQoJm1pcnJvci0+bGlzdCk7CisJbGlzdF9kZWwoJm1pcnJvci0+
bGlzdCk7CiAJdXBfd3JpdGUoJmhtbS0+bWlycm9yc19zZW0pOwogCWhtbV9wdXQoaG1tKTsKIAlt
ZW1zZXQoJm1pcnJvci0+aG1tLCBQT0lTT05fSU5VU0UsIHNpemVvZihtaXJyb3ItPmhtbSkpOwot
LSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
