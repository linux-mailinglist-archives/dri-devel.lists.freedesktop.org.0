Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E545F3AF
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 09:27:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29D066E2BE;
	Thu,  4 Jul 2019 07:25:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 933B889815;
 Wed,  3 Jul 2019 16:27:38 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id r1so1514420pfq.12;
 Wed, 03 Jul 2019 09:27:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=JOAvBtD07sBYTenk1Ld3G0gRN0kgMIcIX/hXrBaiC48=;
 b=NKpd7HnYPSShYV7dMbWv8VIHZpkQxS0b9jEadt+rBzp3DzSj9X5NntItixWcwxdc47
 QZTN0fpfEAu7L7nnojEI1NRXFfn+AFrRIF2b9pPROz8qmM5mk+M7IDXWr2Dd8UyF29Ux
 MzHMiWUqeryL7SgetMNtl8fuyybePVTcwn2+WyWCbONbmtN14wOceVcLUvWwQTOSk5Pv
 CkCBJlg+Hkpx5e6NgsAci2BCr1wHzWIDjkh2VEmdartmPDooU3OeCQk6xnIIQWmLS2zb
 ZZ7x+2UgZN6bbHEmqWew8VxI09FZMU7Kbf7H9TIIvHMfBc4xKcFmDcPPCiE/BdzeXAI4
 rWkQ==
X-Gm-Message-State: APjAAAVbdKEd6JNFKVL8VhRKU4/8LISfsnvuHXnCXZImyKUG17mvaYmK
 PnFBHSOigUDE7DTF9XcH/7D2hFTgypA=
X-Google-Smtp-Source: APXvYqwxisxAz70mUIcuNaWqws+r7Wyj6eH5XkoIzyb8MeIIkv07CAMI7ekDa2eTOk8igLTIOUxdPQ==
X-Received: by 2002:a63:4c46:: with SMTP id m6mr39207542pgl.59.1562171258154; 
 Wed, 03 Jul 2019 09:27:38 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.googlemail.com with ESMTPSA id h1sm2499433pgv.93.2019.07.03.09.27.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Jul 2019 09:27:37 -0700 (PDT)
From: Fuqian Huang <huangfq.daxian@gmail.com>
To: 
Subject: [PATCH v2 08/35] drm/i915: Use kmemdup rather than duplicating its
 implementation
Date: Thu,  4 Jul 2019 00:27:28 +0800
Message-Id: <20190703162728.32230-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
X-Mailman-Approved-At: Thu, 04 Jul 2019 07:25:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=JOAvBtD07sBYTenk1Ld3G0gRN0kgMIcIX/hXrBaiC48=;
 b=Cq4qRUeKmmr6VHzShTIBP5uJdaJ5TP3JSbHewKTET6tPfxhELWCppMDSPBfKFYw7mV
 M9V5TcaxpMI/wVTiVQAqgxwxxWMDpeplHLUPLaYn3kMptcKJZ0XHLsECdmeOSgxF50Wm
 +JFZWhFhw2Wa5At3DmWjdnIcPlKxzCoi3apzdrjDGrvmknCMiUdNbOYTXfr+oC26T9On
 2UCPiVYl4pCPue6kkDo2ldm3SAAA7WSpp4fIjbQRStZVhe+NIz52SArH+KT+oJewTNSQ
 MipHAVbq6krLiAnSl5FIdAhyHJ8mOnwQj7WrldWPg2sItR1hTk2DBqOlYZIBiudSb4AW
 DYtg==
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
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Fuqian Huang <huangfq.daxian@gmail.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

a21lbWR1cCBpcyBpbnRyb2R1Y2VkIHRvIGR1cGxpY2F0ZSBhIHJlZ2lvbiBvZiBtZW1vcnkgaW4g
YSBuZWF0IHdheS4KUmF0aGVyIHRoYW4ga21hbGxvYy9remFsbG9jICsgbWVtY3B5LCB3aGljaCB0
aGUgcHJvZ3JhbW1lciBuZWVkcyB0bwp3cml0ZSB0aGUgc2l6ZSB0d2ljZSAoc29tZXRpbWVzIGxl
YWQgdG8gbWlzdGFrZXMpLCBrbWVtZHVwIGltcHJvdmVzCnJlYWRhYmlsaXR5LCBsZWFkcyB0byBz
bWFsbGVyIGNvZGUgYW5kIGFsc28gcmVkdWNlIHRoZSBjaGFuY2VzIG9mIG1pc3Rha2VzLgpTdWdn
ZXN0aW9uIHRvIHVzZSBrbWVtZHVwIHJhdGhlciB0aGFuIHVzaW5nIGttYWxsb2Mva3phbGxvYyAr
IG1lbWNweS4KClNpZ25lZC1vZmYtYnk6IEZ1cWlhbiBIdWFuZyA8aHVhbmdmcS5kYXhpYW5AZ21h
aWwuY29tPgotLS0KQ2hhbmdlcyBpbiB2MjoKICAtIEZpeCBhIHR5cG8gaW4gY29tbWl0IG1lc3Nh
Z2UgKG1lbXNldCAtPiBtZW1jcHkpCgogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2RtYWJ1Zi5j
IHwgMyArLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZG1hYnVmLmMgYi9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9ndnQvZG1hYnVmLmMKaW5kZXggNDFjOGViYzYwYzYzLi5mZTZmYTk3OWYy
MmEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kbWFidWYuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZG1hYnVmLmMKQEAgLTQxMSwxNCArNDExLDEzIEBAIGlu
dCBpbnRlbF92Z3B1X3F1ZXJ5X3BsYW5lKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LCB2b2lkICph
cmdzKQogCQlnb3RvIG91dDsKIAl9CiAKLQlkbWFidWZfb2JqLT5pbmZvID0ga21hbGxvYyhzaXpl
b2Yoc3RydWN0IGludGVsX3ZncHVfZmJfaW5mbyksCisJZG1hYnVmX29iai0+aW5mbyA9IGttZW1k
dXAoJmZiX2luZm8sIHNpemVvZihzdHJ1Y3QgaW50ZWxfdmdwdV9mYl9pbmZvKSwKIAkJCQkgICBH
RlBfS0VSTkVMKTsKIAlpZiAodW5saWtlbHkoIWRtYWJ1Zl9vYmotPmluZm8pKSB7CiAJCWd2dF92
Z3B1X2VycigiYWxsb2NhdGUgaW50ZWwgdmdwdSBmYiBpbmZvIGZhaWxlZFxuIik7CiAJCXJldCA9
IC1FTk9NRU07CiAJCWdvdG8gb3V0X2ZyZWVfZG1hYnVmOwogCX0KLQltZW1jcHkoZG1hYnVmX29i
ai0+aW5mbywgJmZiX2luZm8sIHNpemVvZihzdHJ1Y3QgaW50ZWxfdmdwdV9mYl9pbmZvKSk7CiAK
IAkoKHN0cnVjdCBpbnRlbF92Z3B1X2ZiX2luZm8gKilkbWFidWZfb2JqLT5pbmZvKS0+b2JqID0g
ZG1hYnVmX29iajsKIAotLSAKMi4xMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
