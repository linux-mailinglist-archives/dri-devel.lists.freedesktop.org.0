Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02781197BEB
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 14:34:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16C7C6E293;
	Mon, 30 Mar 2020 12:34:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B63B96E293
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 12:34:28 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id u10so21388015wro.7
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 05:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u+3XfmHb8XcWJW00eEnFgNAjnyuiI2NfFxirSGxT3Yg=;
 b=oO6sku2eLVAANr0kYa/zMX4CqQH7xzW3dT79E3JuRTwMaoHYyCA5646fnvrcj+Qp2Q
 4XJy9FpXUd22hKKGxr37CsPFXlfOfxDrXdFIpGQdSBdz8+a0+J1K0i+plTLcgCjVSFBE
 YoM2vYwOH2+BwxwwnWI+9ZMuRUoZzFYJhof7TZCQKOdwHrTtOdoki8u4XotuINb3hRNw
 Uxrc1FE7cIt5cKAexF+16UFnjJ85u7Pe2WCbu3FVkKihaWeym1uPLqI9ff0WBB0V4g6q
 63KFanGmE1b0jrIf+0ImL5Q11I2hH2ES+7d5FPoGlTWWg0KR2oMD3a3Fuh8gx+66ALM3
 fcrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u+3XfmHb8XcWJW00eEnFgNAjnyuiI2NfFxirSGxT3Yg=;
 b=aCI3cyWeGM91otCIlFye0vEtKBYNujXK0o1QFdgWsS67Bt9HwuQ/Jg2L1Y6rK2y/Yn
 VwCDAJN8fZVxg5NqELaXXCmNByLf5Qpt6bRJdwgsMauvdsTY0BKdoQai4rEgcm2UeTIZ
 iYJwWJOfywLr9iyDaF/rwbQsUkgHutsnfV5zEQBskLH4y5mckF0Sb9VOPMngdTG0HggK
 PcOU2z9406nQUM+MTw6fHnHNgQmJNd6s0wW+Gtw0izNrt7k0dBfPXj2E/ICEFiHsHlIh
 riWisRT7KxtsD5/EyGtxQPVooYdAYP7Q7IC651OW8mDbtJDKk+LxPh6U8Pmo44h9Qtvq
 oQLg==
X-Gm-Message-State: ANhLgQ3t3BIEJA+ZiFaywbahnJqphCW3JLurmsVBRXOIcYNt3+3b+SOk
 dXbOPK3t9nwUbGHsjDayTolmsiTk
X-Google-Smtp-Source: ADFU+vtO8M0aw7ZjK5XfFKdCdbiaeqbLbU1wluPlS5VqnuQLbh4Cm8S55U5oV7vCe9qTs6B0AUDrQQ==
X-Received: by 2002:a5d:540c:: with SMTP id g12mr15547231wrv.178.1585571667360; 
 Mon, 30 Mar 2020 05:34:27 -0700 (PDT)
Received: from laptop.amd.com ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id g2sm22719933wrs.42.2020.03.30.05.34.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2020 05:34:26 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: chris@chris-wilson.co.uk, zbigniew.kempczynski@intel.com,
 andi.shyti@intel.com, joonas.lahtinen@linux.intel.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/mm: revert "Break long searches in fragmented address
 spaces"
Date: Mon, 30 Mar 2020 14:34:25 +0200
Message-Id: <20200330123425.3944-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyByZXZlcnRzIGNvbW1pdCA3YmUxYjliOGU5ZDFlOWVmMDM0MmQyZTAwMWY0NGVlYzQwMzBh
YTRkLgoKVGhlIGRybV9tbSBpcyBzdXBwb3NlZCB0byB3b3JrIGluIGF0b21pYyBjb250ZXh0LCBz
byBjYWxsaW5nIHNjaGVkdWxlKCkKb3IgaW4gdGhpcyBjYXNlIGNvbmRfcmVzY2hlZCgpIGlzIGls
bGVnYWwuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9tbS5jIHwgOCArLS0tLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fbW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW0uYwppbmRl
eCBiYzZlMjA4OTQ5ZTguLjg5ODFhYmU4YjdjOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2RybV9tbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW0uYwpAQCAtNDUsNyArNDUsNiBA
QAogI2luY2x1ZGUgPGxpbnV4L2V4cG9ydC5oPgogI2luY2x1ZGUgPGxpbnV4L2ludGVydmFsX3Ry
ZWVfZ2VuZXJpYy5oPgogI2luY2x1ZGUgPGxpbnV4L3NlcV9maWxlLmg+Ci0jaW5jbHVkZSA8bGlu
dXgvc2NoZWQvc2lnbmFsLmg+CiAjaW5jbHVkZSA8bGludXgvc2xhYi5oPgogI2luY2x1ZGUgPGxp
bnV4L3N0YWNrdHJhY2UuaD4KIApAQCAtMzY3LDExICszNjYsNiBAQCBuZXh0X2hvbGUoc3RydWN0
IGRybV9tbSAqbW0sCiAJICBzdHJ1Y3QgZHJtX21tX25vZGUgKm5vZGUsCiAJICBlbnVtIGRybV9t
bV9pbnNlcnRfbW9kZSBtb2RlKQogewotCS8qIFNlYXJjaGluZyBpcyBzbG93OyBjaGVjayBpZiB3
ZSByYW4gb3V0IG9mIHRpbWUvcGF0aWVuY2UgKi8KLQljb25kX3Jlc2NoZWQoKTsKLQlpZiAoZmF0
YWxfc2lnbmFsX3BlbmRpbmcoY3VycmVudCkpCi0JCXJldHVybiBOVUxMOwotCiAJc3dpdGNoICht
b2RlKSB7CiAJZGVmYXVsdDoKIAljYXNlIERSTV9NTV9JTlNFUlRfQkVTVDoKQEAgLTU2Myw3ICs1
NTcsNyBAQCBpbnQgZHJtX21tX2luc2VydF9ub2RlX2luX3JhbmdlKHN0cnVjdCBkcm1fbW0gKiBj
b25zdCBtbSwKIAkJcmV0dXJuIDA7CiAJfQogCi0JcmV0dXJuIHNpZ25hbF9wZW5kaW5nKGN1cnJl
bnQpID8gLUVSRVNUQVJUU1lTIDogLUVOT1NQQzsKKwlyZXR1cm4gLUVOT1NQQzsKIH0KIEVYUE9S
VF9TWU1CT0woZHJtX21tX2luc2VydF9ub2RlX2luX3JhbmdlKTsKIAotLSAKMi4yMC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
