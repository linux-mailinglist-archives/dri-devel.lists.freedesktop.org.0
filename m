Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CCA1A90C
	for <lists+dri-devel@lfdr.de>; Sat, 11 May 2019 20:23:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFA2189453;
	Sat, 11 May 2019 18:22:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FD0F6E7CD
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2019 06:03:20 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id g3so4346127pfi.4
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2019 23:03:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kBIV0O0qGoeY97ZaUi2m9+lkbOG6A0guIBzLPEYh3y8=;
 b=YVnDFxirA5B8ivSxlJWEnvaS0BQuRoccVQFJcJenLmZs98jc2NjQp9fmg5BNk8edfi
 /Q47l74jsr0YaTcN1ulTOfaDEJ9RUM4u1grO4ovqdBwte8ouuYeHXmYqdYc6eXi19Tg6
 ULOVVl9RChwB9XAhQYtbewdizuPJOn3JWIcosFcvX994daPCo9dej7mxpaCDWQ5EQxaF
 M2egu3pa9rhyseveYeDeqoRSHULf2z+Cucc71Zt+8WYjKlERyWwemmJ8LH7vXYsayqbC
 qd/T8PUeHBf2k6HrIg+KS8atpqzytT/lZwwBO2iaxp4hAPnCAFQ//pGWu074cysoVCJG
 13sQ==
X-Gm-Message-State: APjAAAWoMD6ddSJtsvlMWWXCQjSBcNjPlkF210gjyzChMZ7zGW9blbuC
 Zt0VN0vxctNgkkWyZOqb9g0=
X-Google-Smtp-Source: APXvYqxZTw/+JETq1S5v5JxKB0pyLjUgcIwpOyyHOLrwQhYgB19EUcR23ia58Yj0e4cZbS6D2rfyjw==
X-Received: by 2002:a65:4589:: with SMTP id o9mr18550951pgq.381.1557554599593; 
 Fri, 10 May 2019 23:03:19 -0700 (PDT)
Received: from localhost.localdomain (115.193.225.49.dyn.cust.vf.net.nz.
 [49.225.193.115])
 by smtp.gmail.com with ESMTPSA id m17sm11687559pfi.17.2019.05.10.23.03.15
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 10 May 2019 23:03:19 -0700 (PDT)
From: Murray McAllister <murray.mcallister@gmail.com>
To: 
Subject: [PATCH] drm/vmwgfx: NULL pointer dereference from
 vmw_cmd_dx_view_define()
Date: Sat, 11 May 2019 18:01:37 +1200
Message-Id: <20190511060138.20592-1-murray.mcallister@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 11 May 2019 18:22:57 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kBIV0O0qGoeY97ZaUi2m9+lkbOG6A0guIBzLPEYh3y8=;
 b=XAqSgrQEObDwj/mPPtLgS0JSVjBIlJJ/0JJnvBFfJ+3+31lwnxrp1DvnQ57VnKE9X0
 EZD1SyQi6bcCqGn6+UpqH0tzOiXQ+9oiv1q8HTd7CvybmcfKD5FnLzKPbKIHKe30jCZL
 kDhbyCVATD5KXgcGwRtzAKeCmQqqVmR/QvJw5+IjT+el2LTK5cptFWDB8Xu85xZF5Afv
 qIjg/QHW4EmhVtP3c/SDYWnB7LFr3YATCix5ipOP+n+YAKyJiP4w0eza0J6qk5643WAU
 TqJnKWSMp8QAoSsfe03TaJlsv5O8DKGZO0dYjJRXkG5dEu9Em/oKJM29est7aD/uu5tN
 MFcg==
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 murray.mcallister@gmail.com,
 VMware Graphics <linux-graphics-maintainer@vmware.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgU1ZHQV8zRF9DTURfRFhfREVGSU5FX1JFTkRFUlRBUkdFVF9WSUVXIGlzIGNhbGxlZCB3aXRo
IGEgc3VyZmFjZQpJRCBvZiBTVkdBM0RfSU5WQUxJRF9JRCwgdGhlIHNyZiBzdHJ1Y3Qgd2lsbCBy
ZW1haW4gTlVMTCBhZnRlcgp2bXdfY21kX3Jlc19jaGVjaygpLCBsZWFkaW5nIHRvIGEgbnVsbCBw
b2ludGVyIGRlcmVmZXJlbmNlIGluCnZtd192aWV3X2FkZCgpLgoKU2lnbmVkLW9mZi1ieTogTXVy
cmF5IE1jQWxsaXN0ZXIgPG11cnJheS5tY2FsbGlzdGVyQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9leGVjYnVmLmMgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Zt
d2dmeF9leGVjYnVmLmMgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9leGVjYnVmLmMK
aW5kZXggMmZmN2JhMDRkOGM4Li40NDdhZmQwODYyMDYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS92bXdnZngvdm13Z2Z4X2V4ZWNidWYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4
L3Ztd2dmeF9leGVjYnVmLmMKQEAgLTI0MTQsNiArMjQxNCwxMCBAQCBzdGF0aWMgaW50IHZtd19j
bWRfZHhfdmlld19kZWZpbmUoc3RydWN0IHZtd19wcml2YXRlICpkZXZfcHJpdiwKIAkJcmV0dXJu
IC1FSU5WQUw7CiAKIAljbWQgPSBjb250YWluZXJfb2YoaGVhZGVyLCB0eXBlb2YoKmNtZCksIGhl
YWRlcik7CisJaWYgKHVubGlrZWx5KGNtZC0+c2lkID09IFNWR0EzRF9JTlZBTElEX0lEKSkgewor
CQlEUk1fRVJST1IoIkludmFsaWQgc3VyZmFjZSBpZC5cbiIpOworCQlyZXR1cm4gLUVJTlZBTDsK
Kwl9CiAJcmV0ID0gdm13X2NtZF9yZXNfY2hlY2soZGV2X3ByaXYsIHN3X2NvbnRleHQsIHZtd19y
ZXNfc3VyZmFjZSwKIAkJCQlWTVdfUkVTX0RJUlRZX05PTkUsIHVzZXJfc3VyZmFjZV9jb252ZXJ0
ZXIsCiAJCQkJJmNtZC0+c2lkLCAmc3JmKTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
