Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54495B3595
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 09:28:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B76636E84D;
	Mon, 16 Sep 2019 07:28:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC9686E067
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Sep 2019 07:13:27 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id k1so15126755pls.11
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Sep 2019 00:13:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=9RsUkl6MEN71BO//b46KRM887milBSbG2u+IqiX1rgM=;
 b=NFJL3rZM3o14IPPNKJZKoi4fYC5vTCGtQ/OOCwdZHTV1hyuJYmysAJXEyaH0CQK80h
 ZOO4JUyVkrptCKO4C4sdYFLpMDhnXB9nNPotjxWuDSuBfqzEMI+1rcbfoUq9YdrKZVLv
 GogNVMiGPzd8KFENRaYl/Lynr+a3FgWql65GB8vCtLUW3Py5+aq6wGYaaK9kqUO/t/01
 Z9R1G5XubI+ECdQcZAnjO3hfUHymYbSFog+at7fhUw6vhY35FsD5SHze0lrkXzcK1uQM
 AbR2GIGCC3SOPMGEYUhG1Qfmv9SFKYzaXIljrzsRdSw4lY15fOEQZSMh2gXtyg6QQun1
 qoGA==
X-Gm-Message-State: APjAAAWYJqFUFz9UegCjloJnnDCrV69WqLJEwIcHlyea/hcNMQW2GOxb
 MjYHjYHTTP2GlHfYKJB/9ZU=
X-Google-Smtp-Source: APXvYqx75/bX6ZgLs/5GYKN91lU9aCoHIZOyWt9XH5ENUcWqcGQC61YP9nuIxCK/uDC1YZS4VL1NOA==
X-Received: by 2002:a17:902:7586:: with SMTP id
 j6mr57986217pll.8.1568531606466; 
 Sun, 15 Sep 2019 00:13:26 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
 by smtp.gmail.com with ESMTPSA id k5sm28129193pgo.45.2019.09.15.00.13.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2019 00:13:26 -0700 (PDT)
Date: Sun, 15 Sep 2019 00:13:23 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/tegra: switch to using devm_gpiod_get_optional
Message-ID: <20190915071323.GA36596@dtor-ws>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Mon, 16 Sep 2019 07:28:04 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=9RsUkl6MEN71BO//b46KRM887milBSbG2u+IqiX1rgM=;
 b=NtivAAM77GDp12fbYDh716oc0G9uYsGGnDGcKfDhDvYThgJ/8sfdOvaqtV/croIwHr
 /r+TKQW6PvyWCNK+z6shvTcxM0BJnOIQ4+SadvG/jn9vBuN32skVTgsd6jQ2I6khu+/v
 U18L5eJ1pqnqYpimgRGOAA5L3ciY1GflwlaHE5Z2Mw/4qQ9tuZ4SlqQN58C6noEJwOy/
 zFhsPmpe0Inp3cZmeP9uN9BygF2Zw3hoLZq5PX1zSWfbX4JOCZg+ZNH8CakevgcHR71Q
 BLOd+BEk+Ok6pq6LHMckAc4r31AizMBvy65zk95uDwaFf01+PzFt0Rz9KoddNnRMSovt
 Hupw==
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgZG8gbm90IHJlYWxseSBuZWVkIHRvIHVzZSBBUEkgdGhhdCBmZXRjaGVzIEdQSU8gZGF0YSBm
cm9tIGFuCmFyYml0cmFyeSBkZXZpY2UgdHJlZSBub2RlLCBhcyB3ZSBhcmUgZGVhbGluZyB3aXRo
IGRldmljZSB0cmVlIG5vZGUKYXNzaWduZWQgdG8gdGhlIGRldmljZSBzdHJ1Y3R1cmUuIFdlIGNh
biBlYXNpbHkgc3dpdGNoIHRvCmRldm1fZ3Bpb2RfZ2V0X29wdGlvbmFsKCkgcGx1cyBncGlvZF9z
ZXRfY29uc3VtZXJfbmFtZSgpIGFuZCBjbGVhbiB1cAp0aGUgY29kZS4KCk5vdGUgdGhpcyBpcyBw
YXJ0IG9mIGVmZm9ydHMgdG8gZ2V0IHJpZCBvZiBbZGV2bV9dZ3Bpb2RfZ2V0X2Zyb21fb2Zfbm9k
ZQppbiBkcml2ZXJzIHNvIHRoYXQgZ3Bpb2xpYiBjYW4gYmUgY2xlYW5lZCB1cC4KClNpZ25lZC1v
ZmYtYnk6IERtaXRyeSBUb3Jva2hvdiA8ZG1pdHJ5LnRvcm9raG92QGdtYWlsLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vdGVncmEvb3V0cHV0LmMgfCAxOCArKysrKysrLS0tLS0tLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9vdXRwdXQuYyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdy
YS9vdXRwdXQuYwppbmRleCBiZGNhYTRjNzE2OGMuLmI0MjQ4MTI1Yjg0NCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3RlZ3JhL291dHB1dC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdy
YS9vdXRwdXQuYwpAQCAtMTIxLDE5ICsxMjEsMTUgQEAgaW50IHRlZ3JhX291dHB1dF9wcm9iZShz
dHJ1Y3QgdGVncmFfb3V0cHV0ICpvdXRwdXQpCiAJCW9mX25vZGVfcHV0KGRkYyk7CiAJfQogCi0J
b3V0cHV0LT5ocGRfZ3BpbyA9IGRldm1fZ3Bpb2RfZ2V0X2Zyb21fb2Zfbm9kZShvdXRwdXQtPmRl
diwKLQkJCQkJCSAgICAgICBvdXRwdXQtPm9mX25vZGUsCi0JCQkJCQkgICAgICAgIm52aWRpYSxo
cGQtZ3BpbyIsIDAsCi0JCQkJCQkgICAgICAgR1BJT0RfSU4sCi0JCQkJCQkgICAgICAgIkhETUkg
aG90cGx1ZyBkZXRlY3QiKTsKLQlpZiAoSVNfRVJSKG91dHB1dC0+aHBkX2dwaW8pKSB7Ci0JCWlm
IChQVFJfRVJSKG91dHB1dC0+aHBkX2dwaW8pICE9IC1FTk9FTlQpCi0JCQlyZXR1cm4gUFRSX0VS
UihvdXRwdXQtPmhwZF9ncGlvKTsKLQotCQlvdXRwdXQtPmhwZF9ncGlvID0gTlVMTDsKLQl9CisJ
b3V0cHV0LT5ocGRfZ3BpbyA9IGRldm1fZ3Bpb2RfZ2V0X29wdGlvbmFsKG91dHB1dC0+ZGV2LAor
CQkJCQkJICAgIm52aWRpYSxocGQiLCBHUElPRF9JTik7CisJaWYgKElTX0VSUihvdXRwdXQtPmhw
ZF9ncGlvKSkKKwkJcmV0dXJuIFBUUl9FUlIob3V0cHV0LT5ocGRfZ3Bpbyk7CiAKIAlpZiAob3V0
cHV0LT5ocGRfZ3BpbykgeworCQlncGlvZF9zZXRfY29uc3VtZXJfbmFtZShvdXRwdXQtPmhwZF9n
cGlvLAorCQkJCQkiSERNSSBob3RwbHVnIGRldGVjdCIpOworCiAJCWVyciA9IGdwaW9kX3RvX2ly
cShvdXRwdXQtPmhwZF9ncGlvKTsKIAkJaWYgKGVyciA8IDApIHsKIAkJCWRldl9lcnIob3V0cHV0
LT5kZXYsICJncGlvZF90b19pcnEoKTogJWRcbiIsIGVycik7Ci0tIAoyLjIzLjAuMjM3LmdjNmE0
Y2U1MGEwLWdvb2cKCgotLSAKRG1pdHJ5Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
