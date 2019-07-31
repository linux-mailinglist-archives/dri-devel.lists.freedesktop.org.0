Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAAC7BA6E
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 09:14:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D886E6AA;
	Wed, 31 Jul 2019 07:14:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35A986E657
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 02:46:00 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id c2so29730711plz.13
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 19:46:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=w5cOyOxhAUID1tCPC1X8j3Oj8XkaYtpNz6fVEgap7bY=;
 b=aR/jOyv1whV4KXQqe1BtY4fkLZzrXeUe+OsvC7EGn5XduehGw8hcqvFEuy7kd6nFqe
 SMroOh5GhdstXGCZUoTdORsAwCPBivKHKt3o27x4+CZtqbzZMiwa3SxjrAGSX2AegZnt
 0DT+Qxd622Z3VW0Zuwa+Sb6gL+L5fncJnNYyd8KbjxYnFaTPFtyEzYMCXknxYlKfiHFJ
 1LcGzpJQoqPiR3SBerX3b6TmmdsE6G1BGNQXE9E3JlL2wDB2mG/zqO/VW8Z1kSIc/4en
 NZE1d20TBg6DSUXtx3yANLwVTxUlJ1x9Ftt0TJbNCOlsEvO8PAGp5+Vcoka1byDWuSkL
 Sw2g==
X-Gm-Message-State: APjAAAWOAMeANcQR6KPhwEtX7GC/nuWVHjhTlJWJSXedol/3QWvSVJ1n
 +HkQlIAJWbufn1gt1hl83os=
X-Google-Smtp-Source: APXvYqxTJb5eodj2ckVumlL+0RDRIYaiUcKFGf7ihkxXWYXlVSjbmj8L5fzvw20rUBnlycwjnBJWyQ==
X-Received: by 2002:a17:902:106:: with SMTP id
 6mr120329921plb.64.1564541159865; 
 Tue, 30 Jul 2019 19:45:59 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.googlemail.com with ESMTPSA id q69sm230530pjb.0.2019.07.30.19.45.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Jul 2019 19:45:57 -0700 (PDT)
From: Fuqian Huang <huangfq.daxian@gmail.com>
To: 
Subject: [PATCH] drm: use trace_printk rather than printk in drm_dbg.
Date: Wed, 31 Jul 2019 10:45:33 +0800
Message-Id: <20190731024533.22264-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
X-Mailman-Approved-At: Wed, 31 Jul 2019 07:13:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=w5cOyOxhAUID1tCPC1X8j3Oj8XkaYtpNz6fVEgap7bY=;
 b=rnp1qCHcYJAwRdiabKV6cNpufFzp/A6Vxrprvi6fx4IJ8mS+WV2U6/yDr6/9+8xoY0
 VF5vHB0iDUOSz1JdcfyQVrrrpjJZjDPNUt/gTa59VrBZ+1PzA2n1Ulwyz4vqPPSyJljk
 i/MNLD59hZ+Tl+aC1fziE60Tdsxe7YvKmO88pQaQAoNIfEgYf5iHGvOBabPbUHhQuCNo
 ZEkAan+pqyvT5kmtZqR+0Bnx7DMNkzsAIBBRfGmPUUTlsZyeecKeCOT+qpxj6aVXJxGc
 QReanCXCCqmRJV3MFvkQBMu3pgnqs+aDI0rFoLyCe3OXABJ4+W1/BBgIAI0ko56UEtxM
 vDWg==
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Fuqian Huang <huangfq.daxian@gmail.com>, Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2loLmMsCmFtZGdwdV9paF9wcm9j
ZXNzIGNhbGxzIERSTV9ERUJVRyB3aGljaCBjYWxscyBkcm1fZGJnIGFuZApmaW5hbGx5IGNhbGxz
IHByaW50ay4KQXMgYW1kZ3B1X2loX3Byb2Nlc3MgaXMgY2FsbGVkIGZyb20gYW4gaW50ZXJydXB0
IGhhbmRsZXIsCmFuZCBpbnRlcnJ1cHQgaGFuZGxlciBzaG91bGQgYmUgc2hvcnQgYXMgcG9zc2li
bGUuCgpBcyBwcmludGsgbWF5IGxlYWQgdG8gYm9nZ2luZyBkb3duIHRoZSBzeXN0ZW0gb3IgY2Fu
IGV2ZW4KY3JlYXRlIGEgbGl2ZSBsb2NrLiBwcmludGsgc2hvdWxkIG5vdCBiZSB1c2VkIGluIElS
USBjb250ZXh0LgpJbnN0ZWFkLCB0cmFjZV9wcmludGsgaXMgcmVjb21tZW5kZWQuCkxpbms6IGh0
dHBzOi8vbHduLm5ldC9BcnRpY2xlcy8zNjU4MzUKClNpZ25lZC1vZmYtYnk6IEZ1cWlhbiBIdWFu
ZyA8aHVhbmdmcS5kYXhpYW5AZ21haWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fcHJp
bnQuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbnQuYyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fcHJpbnQuYwppbmRleCBhMTdjOGExNGRiYTQuLjkwY2RlZDE0MDE0NiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9wcmludC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9k
cm1fcHJpbnQuYwpAQCAtMjM2LDcgKzIzNiw3IEBAIHZvaWQgZHJtX2RiZyh1bnNpZ25lZCBpbnQg
Y2F0ZWdvcnksIGNvbnN0IGNoYXIgKmZvcm1hdCwgLi4uKQogCXZhZi5mbXQgPSBmb3JtYXQ7CiAJ
dmFmLnZhID0gJmFyZ3M7CiAKLQlwcmludGsoS0VSTl9ERUJVRyAiWyIgRFJNX05BTUUgIjolcHNd
ICVwViIsCisJdHJhY2VfcHJpbnRrKEtFUk5fREVCVUcgIlsiIERSTV9OQU1FICI6JXBzXSAlcFYi
LAogCSAgICAgICBfX2J1aWx0aW5fcmV0dXJuX2FkZHJlc3MoMCksICZ2YWYpOwogCiAJdmFfZW5k
KGFyZ3MpOwotLSAKMi4xMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
