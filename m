Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B39B5AE6D7
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 11:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EB0789230;
	Tue, 10 Sep 2019 09:24:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A64EE6E872;
 Tue, 10 Sep 2019 09:24:37 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id i1so18052787wro.4;
 Tue, 10 Sep 2019 02:24:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tLgkT21pWdsDr5xoWMRhdoXz4bz3uDgTEs1kfuIOGpo=;
 b=Exvm8rLBXUuDwZgO+Lb/qLRvwy82LOi3TO+bQN+y0kEt9NfjWwNhdDquQnn6ud84mM
 eZ2Gnz7Q8G1cbpswi/bh55ubX5p1M8Krga85w0lESGYaBJtJQ3Eu9k3Ht100Iul/jDbG
 aPz4iha97/tZhBce29eZ6pW++Cs3N5Ey6nRf0lv/yMMXVzAc+xHiblnjP6Wb/UVfABRK
 rQfhKuDFdJD2C4WdAs7588pqqAs0RtNKHkdYklkY3RVS/q7Dh5osrul6zOkwnRR2fl1D
 R4+KVt3+972QdIY3Jzycx3Q+rCOg8z2izmLbXKCwwlZ4ci/8fttPQeHsI/+yrm1HBW7e
 FiFw==
X-Gm-Message-State: APjAAAV6/JQRxVavZ4bzFkElU7tipUMA8rNyc8nHvmR8JhnLGC8zMJ8X
 rTrPQlCJPemBi+Fga9QEBiMZtJZq
X-Google-Smtp-Source: APXvYqyDdq0q5uYU1GoQJCYGNlzocoTn4wiZ4C3PXvW84TijVuqabWFth5mxJ+PawEHiuND8h7I4YQ==
X-Received: by 2002:adf:fe4d:: with SMTP id m13mr20306218wrs.208.1568107476011; 
 Tue, 10 Sep 2019 02:24:36 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:1cd:7d57:6942:ab1b])
 by smtp.gmail.com with ESMTPSA id e12sm6107036wrw.37.2019.09.10.02.24.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2019 02:24:35 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 5/9] drm/amdgpu: allow direct submission of PTE updates
Date: Tue, 10 Sep 2019 11:24:27 +0200
Message-Id: <20190910092431.37471-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190910092431.37471-1-christian.koenig@amd.com>
References: <20190910092431.37471-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tLgkT21pWdsDr5xoWMRhdoXz4bz3uDgTEs1kfuIOGpo=;
 b=t158gh7LHcmJ15dB//dqSE/l88iSCXQM/blAu2zzsmVlUCtWXs3W+l5xHGQ3tAizO7
 FfbiEjPLmE+s8o6P3nXN1EW9a9zRHR0cUGnu3AT7VWsTdRiEflJepa+nh5m/9tpu79Tr
 hELPP2qts6wYwTbpW9tquP4mmDiLWeiJILFkKCeeVgOZLoVnEtbXRU0dTEi3gqECLbke
 izzxBPUeRcTa4uCWhDXPST5e9DDdHImiYm5ReUn/SUexnePqZXOi83sM0X51MdR/DZnX
 BFXwX8D1X3InAYMrVcQqpcSdW/YOm/t6Q14vF9cxm1pRVB8OHftAq2pZ+5JWjNt1hph6
 MF6Q==
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rm9yIGhhbmRsaW5nIFBURSB1cGRhdGVzIGRpcmVjdGx5IGluIHRoZSBmYXVsdCBoYW5kbGVyLgoK
U2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29t
PgpSZXZpZXdlZC1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMgfCAxOCArKysrKysrKysr
LS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMKaW5kZXggZmZmNTUzYTU5MWI2
Li5hZWQ2OGZhODhmMTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV92bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jCkBA
IC0xNDkyLDEzICsxNDkyLDE0IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3ZtX3VwZGF0ZV9wdGVzKHN0
cnVjdCBhbWRncHVfdm1fdXBkYXRlX3BhcmFtcyAqcGFyYW1zLAogICogYW1kZ3B1X3ZtX2JvX3Vw
ZGF0ZV9tYXBwaW5nIC0gdXBkYXRlIGEgbWFwcGluZyBpbiB0aGUgdm0gcGFnZSB0YWJsZQogICoK
ICAqIEBhZGV2OiBhbWRncHVfZGV2aWNlIHBvaW50ZXIKLSAqIEBleGNsdXNpdmU6IGZlbmNlIHdl
IG5lZWQgdG8gc3luYyB0bwotICogQHBhZ2VzX2FkZHI6IERNQSBhZGRyZXNzZXMgdG8gdXNlIGZv
ciBtYXBwaW5nCiAgKiBAdm06IHJlcXVlc3RlZCB2bQorICogQGRpcmVjdDogZGlyZWN0IHN1Ym1p
c3Npb24gaW4gYSBwYWdlIGZhdWx0CisgKiBAZXhjbHVzaXZlOiBmZW5jZSB3ZSBuZWVkIHRvIHN5
bmMgdG8KICAqIEBzdGFydDogc3RhcnQgb2YgbWFwcGVkIHJhbmdlCiAgKiBAbGFzdDogbGFzdCBt
YXBwZWQgZW50cnkKICAqIEBmbGFnczogZmxhZ3MgZm9yIHRoZSBlbnRyaWVzCiAgKiBAYWRkcjog
YWRkciB0byBzZXQgdGhlIGFyZWEgdG8KKyAqIEBwYWdlc19hZGRyOiBETUEgYWRkcmVzc2VzIHRv
IHVzZSBmb3IgbWFwcGluZwogICogQGZlbmNlOiBvcHRpb25hbCByZXN1bHRpbmcgZmVuY2UKICAq
CiAgKiBGaWxsIGluIHRoZSBwYWdlIHRhYmxlIGVudHJpZXMgYmV0d2VlbiBAc3RhcnQgYW5kIEBs
YXN0LgpAQCAtMTUwNywxMSArMTUwOCwxMSBAQCBzdGF0aWMgaW50IGFtZGdwdV92bV91cGRhdGVf
cHRlcyhzdHJ1Y3QgYW1kZ3B1X3ZtX3VwZGF0ZV9wYXJhbXMgKnBhcmFtcywKICAqIDAgZm9yIHN1
Y2Nlc3MsIC1FSU5WQUwgZm9yIGZhaWx1cmUuCiAgKi8KIHN0YXRpYyBpbnQgYW1kZ3B1X3ZtX2Jv
X3VwZGF0ZV9tYXBwaW5nKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAorCQkJCSAgICAgICBz
dHJ1Y3QgYW1kZ3B1X3ZtICp2bSwgYm9vbCBkaXJlY3QsCiAJCQkJICAgICAgIHN0cnVjdCBkbWFf
ZmVuY2UgKmV4Y2x1c2l2ZSwKLQkJCQkgICAgICAgZG1hX2FkZHJfdCAqcGFnZXNfYWRkciwKLQkJ
CQkgICAgICAgc3RydWN0IGFtZGdwdV92bSAqdm0sCiAJCQkJICAgICAgIHVpbnQ2NF90IHN0YXJ0
LCB1aW50NjRfdCBsYXN0LAogCQkJCSAgICAgICB1aW50NjRfdCBmbGFncywgdWludDY0X3QgYWRk
ciwKKwkJCQkgICAgICAgZG1hX2FkZHJfdCAqcGFnZXNfYWRkciwKIAkJCQkgICAgICAgc3RydWN0
IGRtYV9mZW5jZSAqKmZlbmNlKQogewogCXN0cnVjdCBhbWRncHVfdm1fdXBkYXRlX3BhcmFtcyBw
YXJhbXM7CkBAIC0xNTIxLDYgKzE1MjIsNyBAQCBzdGF0aWMgaW50IGFtZGdwdV92bV9ib191cGRh
dGVfbWFwcGluZyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAltZW1zZXQoJnBhcmFtcywg
MCwgc2l6ZW9mKHBhcmFtcykpOwogCXBhcmFtcy5hZGV2ID0gYWRldjsKIAlwYXJhbXMudm0gPSB2
bTsKKwlwYXJhbXMuZGlyZWN0ID0gZGlyZWN0OwogCXBhcmFtcy5wYWdlc19hZGRyID0gcGFnZXNf
YWRkcjsKIAogCS8qIHN5bmMgdG8gZXZlcnl0aGluZyBleGNlcHQgZXZpY3Rpb24gZmVuY2VzIG9u
IHVubWFwcGluZyAqLwpAQCAtMTYzMyw5ICsxNjM1LDkgQEAgc3RhdGljIGludCBhbWRncHVfdm1f
Ym9fc3BsaXRfbWFwcGluZyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAkJfQogCiAJCWxh
c3QgPSBtaW4oKHVpbnQ2NF90KW1hcHBpbmctPmxhc3QsIHN0YXJ0ICsgbWF4X2VudHJpZXMgLSAx
KTsKLQkJciA9IGFtZGdwdV92bV9ib191cGRhdGVfbWFwcGluZyhhZGV2LCBleGNsdXNpdmUsIGRt
YV9hZGRyLCB2bSwKKwkJciA9IGFtZGdwdV92bV9ib191cGRhdGVfbWFwcGluZyhhZGV2LCB2bSwg
ZmFsc2UsIGV4Y2x1c2l2ZSwKIAkJCQkJCXN0YXJ0LCBsYXN0LCBmbGFncywgYWRkciwKLQkJCQkJ
CWZlbmNlKTsKKwkJCQkJCWRtYV9hZGRyLCBmZW5jZSk7CiAJCWlmIChyKQogCQkJcmV0dXJuIHI7
CiAKQEAgLTE5MjksOSArMTkzMSw5IEBAIGludCBhbWRncHVfdm1fY2xlYXJfZnJlZWQoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJCSAgICBtYXBwaW5nLT5zdGFydCA8IEFNREdQVV9HTUNf
SE9MRV9TVEFSVCkKIAkJCWluaXRfcHRlX3ZhbHVlID0gQU1ER1BVX1BURV9ERUZBVUxUX0FUQzsK
IAotCQlyID0gYW1kZ3B1X3ZtX2JvX3VwZGF0ZV9tYXBwaW5nKGFkZXYsIE5VTEwsIE5VTEwsIHZt
LAorCQlyID0gYW1kZ3B1X3ZtX2JvX3VwZGF0ZV9tYXBwaW5nKGFkZXYsIHZtLCBmYWxzZSwgTlVM
TCwKIAkJCQkJCW1hcHBpbmctPnN0YXJ0LCBtYXBwaW5nLT5sYXN0LAotCQkJCQkJaW5pdF9wdGVf
dmFsdWUsIDAsICZmKTsKKwkJCQkJCWluaXRfcHRlX3ZhbHVlLCAwLCBOVUxMLCAmZik7CiAJCWFt
ZGdwdV92bV9mcmVlX21hcHBpbmcoYWRldiwgdm0sIG1hcHBpbmcsIGYpOwogCQlpZiAocikgewog
CQkJZG1hX2ZlbmNlX3B1dChmKTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
