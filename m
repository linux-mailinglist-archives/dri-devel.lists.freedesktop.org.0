Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 233961A64AC
	for <lists+dri-devel@lfdr.de>; Mon, 13 Apr 2020 11:29:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A476E419;
	Mon, 13 Apr 2020 09:29:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B3656E0E3
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Apr 2020 20:06:47 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id o81so131963wmo.2
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Apr 2020 13:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d/xeNUbJ170Rcks+8UPitiY+D8+oYUtGYjLPuwDIIMo=;
 b=pN0e9wGO3ZParlDyJdUgG4KPLkAkUE96VGull5/Xg47pWLrV50uqu0XeFtOOS9oB8u
 fBIvinRcku6msWIw7B/AMKi+0LCqk+Ns4xlEZamjwMFXLL9QSUDW6ytBAEZQBFXHI5on
 z8Yj6U87jwE6nEbVHCzuwVgNK1k2TmaslfzJYIkK46+OpDwXIl+zTYnk2Odcp632qAN6
 QjWwgMdKuIwQL2Dncj50HHxFaJDxiiub/Tgle6VEBEOpfymnW5vcLf4MDq1RetwkVVlt
 PErPBYXk+zMfMwQDtTZW4oaZ/T3FUPwZI8t9fpfUsYHO2XjvlOGkaNoKKsc03AN26rzo
 btaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d/xeNUbJ170Rcks+8UPitiY+D8+oYUtGYjLPuwDIIMo=;
 b=Un+sGeuWuGcOIbsFAYMrgStjMD0ujt9cx2+wn19X8MdcrajujcwtBeNR2HnH5Fr4cE
 yJTtfW8w81WNfQHniDa4F2XIV5FRVmE2ATdl/qOiVO9ZePcNqm9ktk7OZelcfakwqBip
 uhd1tqXaTTbe/qiJix6t323WzBjcdmQiwRwskVYmvw9p4iFT1Ekxc+e0kYpaFtrPnQCa
 9RTK8PnNpHKwIO/4ThxxOAzRvyDbEew65pnLd9Ydg+c30yn3kevEYWDsVxCt4Q4nbzBl
 CBokJekFoZYjOcVmL/+6q09t0+L7oHkCDsdgs7893p4FnCHg4HjflzifYjD7UgqvDIeU
 Rw4g==
X-Gm-Message-State: AGi0PuaEl1H/MYBwFUChAK6GJMNZAa0GjgtTYLh97y1d9N97RW+fQqvt
 oxjhH2A/OCcozCLJM9BB+SU=
X-Google-Smtp-Source: APiQypJiMElfxuS7xS/9PX6Fd45JEGZqUGPugBtGCjW8LaAD3OS3TMVizEGgTcv3ItEf4SBPhSxUkQ==
X-Received: by 2002:a1c:1bcb:: with SMTP id b194mr11698336wmb.4.1586635605589; 
 Sat, 11 Apr 2020 13:06:45 -0700 (PDT)
Received: from localhost.localdomain (91-167-199-67.subs.proxad.net.
 [91.167.199.67])
 by smtp.gmail.com with ESMTPSA id y5sm8712670wru.15.2020.04.11.13.06.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Apr 2020 13:06:44 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH 1/2] drm/panfrost: missing remove opp table in case of failure
Date: Sat, 11 Apr 2020 22:06:31 +0200
Message-Id: <20200411200632.4045-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 13 Apr 2020 09:29:25 +0000
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
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gY2FzZSBvZiBmYWlsdXJlIHdlIG5lZWQgdG8gcmVtb3ZlIE9QUCB0YWJsZS4KClVzZSBMaW51
eCBjbGFzc2ljIGVycm9yIGhhbmRsaW5nIHdpdGggZ290byB1c2FnZS4KClNpZ25lZC1vZmYtYnk6
IENsw6ltZW50IFDDqXJvbiA8cGVyb24uY2xlbUBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuYyB8IDE2ICsrKysrKysrKysrKy0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMgYi9kcml2ZXJz
L2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5jCmluZGV4IDQxMzk4NzAzOGZiZi4u
NjI1NDFmNGVkZDgxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJv
c3RfZGV2ZnJlcS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZm
cmVxLmMKQEAgLTkwLDggKzkwLDExIEBAIGludCBwYW5mcm9zdF9kZXZmcmVxX2luaXQoc3RydWN0
IHBhbmZyb3N0X2RldmljZSAqcGZkZXYpCiAJY3VyX2ZyZXEgPSBjbGtfZ2V0X3JhdGUocGZkZXYt
PmNsb2NrKTsKIAogCW9wcCA9IGRldmZyZXFfcmVjb21tZW5kZWRfb3BwKGRldiwgJmN1cl9mcmVx
LCAwKTsKLQlpZiAoSVNfRVJSKG9wcCkpCi0JCXJldHVybiBQVFJfRVJSKG9wcCk7CisJaWYgKElT
X0VSUihvcHApKSB7CisJCURSTV9ERVZfRVJST1IoZGV2LCAiRmFpbGVkIHRvIHNldCByZWNvbW1l
bmRlZCBPUFBcbiIpOworCQlyZXQgPSBQVFJfRVJSKG9wcCk7CisJCWdvdG8gZXJyX29wcDsKKwl9
CiAKIAlwYW5mcm9zdF9kZXZmcmVxX3Byb2ZpbGUuaW5pdGlhbF9mcmVxID0gY3VyX2ZyZXE7CiAJ
ZGV2X3BtX29wcF9wdXQob3BwKTsKQEAgLTEwMCw4ICsxMDMsOCBAQCBpbnQgcGFuZnJvc3RfZGV2
ZnJlcV9pbml0KHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2KQogCQkJCQkgIERFVkZSRVFf
R09WX1NJTVBMRV9PTkRFTUFORCwgTlVMTCk7CiAJaWYgKElTX0VSUihkZXZmcmVxKSkgewogCQlE
Uk1fREVWX0VSUk9SKGRldiwgIkNvdWxkbid0IGluaXRpYWxpemUgR1BVIGRldmZyZXFcbiIpOwot
CQlkZXZfcG1fb3BwX29mX3JlbW92ZV90YWJsZShkZXYpOwotCQlyZXR1cm4gUFRSX0VSUihkZXZm
cmVxKTsKKwkJcmV0ID0gUFRSX0VSUihkZXZmcmVxKTsKKwkJZ290byBlcnJfb3BwOwogCX0KIAlw
ZmRldi0+ZGV2ZnJlcS5kZXZmcmVxID0gZGV2ZnJlcTsKIApAQCAtMTEyLDYgKzExNSwxMSBAQCBp
bnQgcGFuZnJvc3RfZGV2ZnJlcV9pbml0KHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2KQog
CQlwZmRldi0+ZGV2ZnJlcS5jb29saW5nID0gY29vbGluZzsKIAogCXJldHVybiAwOworCitlcnJf
b3BwOgorCWRldl9wbV9vcHBfb2ZfcmVtb3ZlX3RhYmxlKGRldik7CisKKwlyZXR1cm4gcmV0Owog
fQogCiB2b2lkIHBhbmZyb3N0X2RldmZyZXFfZmluaShzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpw
ZmRldikKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
