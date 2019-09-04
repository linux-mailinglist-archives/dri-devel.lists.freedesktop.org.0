Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FF9A825A
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 14:30:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F4F3894A7;
	Wed,  4 Sep 2019 12:30:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93764894A7
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 12:30:39 +0000 (UTC)
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i5UQk-0005VG-SA; Wed, 04 Sep 2019 12:30:34 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 9E7B92742B45; Wed,  4 Sep 2019 13:30:33 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/panfrost: Fix regulator_get_optional() misuse
Date: Wed,  4 Sep 2019 13:30:32 +0100
Message-Id: <20190904123032.23263-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=sirena.org.uk; s=20170815-heliosphere; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g/BsOG3t1AtJ5lMidOZwhIOXQj5VBbo4erwS718yjdc=; b=R+3E/74urBfbdKLa0LkBouwQU
 82f/5/S15HmEO89PYuLHVCX06uO6Wz8UzeBYsQbrmSvLx4fZx7caz6juXIO0MA9kbjanRyfwYwk1t
 X60CYJj2Yx19r7Z29FAOmwm/jdiM7aUtzU5NmSCtATR9jMg38QTczNdolNhSUKms3sMyk=;
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
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHBhbmZyb3N0IGRyaXZlciByZXF1ZXN0cyBhIHN1cHBseSB1c2luZyByZWd1bGF0b3JfZ2V0
X29wdGlvbmFsKCkKYnV0IGJvdGggdGhlIG5hbWUgb2YgdGhlIHN1cHBseSBhbmQgdGhlIHVzYWdl
IHBhdHRlcm4gc3VnZ2VzdCB0aGF0IGl0IGlzCmJlaW5nIHVzZWQgZm9yIHRoZSBtYWluIHBvd2Vy
IGZvciB0aGUgZGV2aWNlIGFuZCBpcyBub3QgYXQgYWxsIG9wdGlvbmFsCmZvciB0aGUgZGV2aWNl
IGZvciBmdW5jdGlvbiwgdGhlcmUgaXMgbm8gbWVhbmluZ2Z1bCBoYW5kbGluZyBmb3IgYWJzZW50
CnN1cHBsaWVzLiAgU3VjaCByZWd1bGF0b3JzIHNob3VsZCB1c2UgdGhlIHZhbmlsbGEgcmVndWxh
dG9yX2dldCgpCmludGVyZmFjZSwgaXQgd2lsbCBlbnN1cmUgdGhhdCBldmVuIGlmIGEgc3VwcGx5
IGlzIG5vdCBkZXNjcmliZWQgaW4gdGhlCnN5c3RlbSBpbnRlZ3JhdGlvbiBvbmUgd2lsbCBiZSBw
cm92aWRlZCBpbiBzb2Z0d2FyZS4KClNpZ25lZC1vZmYtYnk6IE1hcmsgQnJvd24gPGJyb29uaWVA
a2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNl
LmMgfCA4ICsrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA2IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9k
ZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuYwppbmRl
eCA0NmIwYjAyZTQyODkuLjIzOGZiNmQ1NGRmNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9z
dC9wYW5mcm9zdF9kZXZpY2UuYwpAQCAtODksMTIgKzg5LDkgQEAgc3RhdGljIGludCBwYW5mcm9z
dF9yZWd1bGF0b3JfaW5pdChzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldikKIHsKIAlpbnQg
cmV0OwogCi0JcGZkZXYtPnJlZ3VsYXRvciA9IGRldm1fcmVndWxhdG9yX2dldF9vcHRpb25hbChw
ZmRldi0+ZGV2LCAibWFsaSIpOworCXBmZGV2LT5yZWd1bGF0b3IgPSBkZXZtX3JlZ3VsYXRvcl9n
ZXQocGZkZXYtPmRldiwgIm1hbGkiKTsKIAlpZiAoSVNfRVJSKHBmZGV2LT5yZWd1bGF0b3IpKSB7
CiAJCXJldCA9IFBUUl9FUlIocGZkZXYtPnJlZ3VsYXRvcik7Ci0JCXBmZGV2LT5yZWd1bGF0b3Ig
PSBOVUxMOwotCQlpZiAocmV0ID09IC1FTk9ERVYpCi0JCQlyZXR1cm4gMDsKIAkJZGV2X2Vycihw
ZmRldi0+ZGV2LCAiZmFpbGVkIHRvIGdldCByZWd1bGF0b3I6ICVkXG4iLCByZXQpOwogCQlyZXR1
cm4gcmV0OwogCX0KQEAgLTExMCw4ICsxMDcsNyBAQCBzdGF0aWMgaW50IHBhbmZyb3N0X3JlZ3Vs
YXRvcl9pbml0KHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2KQogCiBzdGF0aWMgdm9pZCBw
YW5mcm9zdF9yZWd1bGF0b3JfZmluaShzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldikKIHsK
LQlpZiAocGZkZXYtPnJlZ3VsYXRvcikKLQkJcmVndWxhdG9yX2Rpc2FibGUocGZkZXYtPnJlZ3Vs
YXRvcik7CisJcmVndWxhdG9yX2Rpc2FibGUocGZkZXYtPnJlZ3VsYXRvcik7CiB9CiAKIGludCBw
YW5mcm9zdF9kZXZpY2VfaW5pdChzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldikKLS0gCjIu
MjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
