Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A128DFADA0
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 10:52:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 810746ECB4;
	Wed, 13 Nov 2019 09:52:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AF6D6ECB4
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 09:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id C5C493F3DA;
 Wed, 13 Nov 2019 10:52:12 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 49Wqusy4HXcO; Wed, 13 Nov 2019 10:52:11 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 8E8C83F3B6;
 Wed, 13 Nov 2019 10:52:05 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 871F23600C4;
 Wed, 13 Nov 2019 10:52:05 +0100 (CET)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/vmwgfx: Use coherent memory if there are dma mapping size
 restrictions
Date: Wed, 13 Nov 2019 10:51:43 +0100
Message-Id: <20191113095144.2981-2-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191113095144.2981-1-thomas_os@shipmail.org>
References: <20191113095144.2981-1-thomas_os@shipmail.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1573638725; bh=yOqitma9xpyTQXDOa24cTCPVhJZmeGDcLKEQLIr03Do=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=R1r6nqnfJ9GaQwaXnDalwPLugU8uJttr4PmG33XM4VGhl6ifR9PkIo/C35flNYQ84
 r8K/5hS3XtES9uvK7SndKFeaamJZmDbU0tf8CnGuhwBnd4nrnvjwH3TgGw0/w5vK7T
 +RYhEuKqB5ktvXqqsNX9fNBzieIXptVfpnx+FtB8=
X-Mailman-Original-Authentication-Results: pio-pvt-msa3.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=R1r6nqnf; 
 dkim-atps=neutral
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
Cc: Christoph Hellwig <hch@infradead.org>,
 Thomas Hellstrom <thellstrom@vmware.com>, Brian Paul <brianp@vmware.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgoKV2UncmUgZ3Jh
ZHVhbGx5IG1vdmluZyB0b3dhcmRzIHVzaW5nIERNQSBjb2hlcmVudCBtZW1vcnkgaW4gbW9zdApz
aXR1YXRpb25zLCBhbHRob3VnaCBUVE0gaW50ZXJhY3Rpb25zIHdpdGggdGhlIERNQSBsYXllcnMg
aXMgc3RpbGwgYQp3b3JrLWluLXByb2dyZXNzLiBNZWFud2hpbGUsIHVzZSBjb2hlcmVudCBtZW1v
cnkgd2hlbiB0aGVyZSBhcmUgc2l6ZQpyZXN0cmljdGlvbnMgbWVhbmluZyB0aGF0IHRoZXJlIGlz
IGEgY2hhbmNlIHRoYXQgc3RyZWFtaW5nIGRtYSBtYXBwaW5nCm9mIGxhcmdlIGJ1ZmZlciBvYmpl
Y3RzIG1heSBmYWlsLgpBbHNvIG1vdmUgRE1BIG1hc2sgc2V0dGluZ3MgdG8gdGhlIHZtd19kbWFf
c2VsZWN0X21vZGUgZnVuY3Rpb24sIHNpbmNlCml0J3MgaW1wb3J0YW50IHRoYXQgd2Ugc2V0IHRo
ZSBjb3JyZWN0IERNQSBtYXNrcyBiZWZvcmUgY2FsbGluZyB0aGUKZG1hX21heF9tYXBwaW5nX3Np
emUoKSBmdW5jdGlvbi4KCkNjOiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGluZnJhZGVhZC5vcmc+
ClNpZ25lZC1vZmYtYnk6IFRob21hcyBIZWxsc3Ryb20gPHRoZWxsc3Ryb21Adm13YXJlLmNvbT4K
UmV2aWV3ZWQtYnk6IEJyaWFuIFBhdWwgPGJyaWFucEB2bXdhcmUuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5jIHwgMzEgKysrKysrKy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDI0IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5jIGIvZHJpdmVy
cy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMKaW5kZXggZmMwMjgzNjU5YzQxLi4xZTFkZTgz
OTA4ZmUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5jCkBAIC01NjksNyArNTY5LDEw
IEBAIHN0YXRpYyBpbnQgdm13X2RtYV9zZWxlY3RfbW9kZShzdHJ1Y3Qgdm13X3ByaXZhdGUgKmRl
dl9wcml2KQogCQlbdm13X2RtYV9tYXBfcG9wdWxhdGVdID0gIkNhY2hpbmcgRE1BIG1hcHBpbmdz
LiIsCiAJCVt2bXdfZG1hX21hcF9iaW5kXSA9ICJHaXZpbmcgdXAgRE1BIG1hcHBpbmdzIGVhcmx5
LiJ9OwogCi0JaWYgKHZtd19mb3JjZV9jb2hlcmVudCkKKwkodm9pZCkgZG1hX3NldF9tYXNrX2Fu
ZF9jb2hlcmVudChkZXZfcHJpdi0+ZGV2LT5kZXYsIERNQV9CSVRfTUFTSyg2NCkpOworCisJaWYg
KHZtd19mb3JjZV9jb2hlcmVudCB8fAorCSAgICBkbWFfbWF4X21hcHBpbmdfc2l6ZShkZXZfcHJp
di0+ZGV2LT5kZXYpICE9IFNJWkVfTUFYKQogCQlkZXZfcHJpdi0+bWFwX21vZGUgPSB2bXdfZG1h
X2FsbG9jX2NvaGVyZW50OwogCWVsc2UgaWYgKHZtd19yZXN0cmljdF9pb21tdSkKIAkJZGV2X3By
aXYtPm1hcF9tb2RlID0gdm13X2RtYV9tYXBfYmluZDsKQEAgLTU4MiwzMCArNTg1LDE1IEBAIHN0
YXRpYyBpbnQgdm13X2RtYV9zZWxlY3RfbW9kZShzdHJ1Y3Qgdm13X3ByaXZhdGUgKmRldl9wcml2
KQogCQlyZXR1cm4gLUVJTlZBTDsKIAogCURSTV9JTkZPKCJETUEgbWFwIG1vZGU6ICVzXG4iLCBu
YW1lc1tkZXZfcHJpdi0+bWFwX21vZGVdKTsKLQlyZXR1cm4gMDsKLX0KIAotLyoqCi0gKiB2bXdf
ZG1hX21hc2tzIC0gc2V0IHJlcXVpcmVkIHBhZ2UtIGFuZCBkbWEgbWFza3MKLSAqCi0gKiBAZGV2
OiBQb2ludGVyIHRvIHN0cnVjdCBkcm0tZGV2aWNlCi0gKgotICogV2l0aCAzMi1iaXQgd2UgY2Fu
IG9ubHkgaGFuZGxlIDMyIGJpdCBQRk5zLiBPcHRpb25hbGx5IHNldCB0aGF0Ci0gKiByZXN0cmlj
dGlvbiBhbHNvIGZvciA2NC1iaXQgc3lzdGVtcy4KLSAqLwotc3RhdGljIGludCB2bXdfZG1hX21h
c2tzKHN0cnVjdCB2bXdfcHJpdmF0ZSAqZGV2X3ByaXYpCi17Ci0Jc3RydWN0IGRybV9kZXZpY2Ug
KmRldiA9IGRldl9wcml2LT5kZXY7Ci0JaW50IHJldCA9IDA7Ci0KLQlyZXQgPSBkbWFfc2V0X21h
c2tfYW5kX2NvaGVyZW50KGRldi0+ZGV2LCBETUFfQklUX01BU0soNjQpKTsKIAlpZiAoZGV2X3By
aXYtPm1hcF9tb2RlICE9IHZtd19kbWFfcGh5cyAmJgogCSAgICAoc2l6ZW9mKHVuc2lnbmVkIGxv
bmcpID09IDQgfHwgdm13X3Jlc3RyaWN0X2RtYV9tYXNrKSkgewogCQlEUk1fSU5GTygiUmVzdHJp
Y3RpbmcgRE1BIGFkZHJlc3NlcyB0byA0NCBiaXRzLlxuIik7Ci0JCXJldHVybiBkbWFfc2V0X21h
c2tfYW5kX2NvaGVyZW50KGRldi0+ZGV2LCBETUFfQklUX01BU0soNDQpKTsKKwkJcmV0dXJuIGRt
YV9zZXRfbWFza19hbmRfY29oZXJlbnQoZGV2X3ByaXYtPmRldi0+ZGV2LAorCQkJCQkJIERNQV9C
SVRfTUFTSyg0NCkpOwogCX0KIAotCXJldHVybiByZXQ7CisJcmV0dXJuIDA7CiB9CiAKIHN0YXRp
YyBpbnQgdm13X2RyaXZlcl9sb2FkKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHVuc2lnbmVkIGxv
bmcgY2hpcHNldCkKQEAgLTY3NCw3ICs2NjIsNiBAQCBzdGF0aWMgaW50IHZtd19kcml2ZXJfbG9h
ZChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB1bnNpZ25lZCBsb25nIGNoaXBzZXQpCiAJCWRldl9w
cml2LT5jYXBhYmlsaXRpZXMyID0gdm13X3JlYWQoZGV2X3ByaXYsIFNWR0FfUkVHX0NBUDIpOwog
CX0KIAotCiAJcmV0ID0gdm13X2RtYV9zZWxlY3RfbW9kZShkZXZfcHJpdik7CiAJaWYgKHVubGlr
ZWx5KHJldCAhPSAwKSkgewogCQlEUk1fSU5GTygiUmVzdHJpY3RpbmcgY2FwYWJpbGl0aWVzIGR1
ZSB0byBJT01NVSBzZXR1cC5cbiIpOwpAQCAtNzQ2LDEwICs3MzMsNiBAQCBzdGF0aWMgaW50IHZt
d19kcml2ZXJfbG9hZChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB1bnNpZ25lZCBsb25nIGNoaXBz
ZXQpCiAJaWYgKGRldl9wcml2LT5jYXBhYmlsaXRpZXMgJiBTVkdBX0NBUF9DQVAyX1JFR0lTVEVS
KQogCQl2bXdfcHJpbnRfY2FwYWJpbGl0aWVzMihkZXZfcHJpdi0+Y2FwYWJpbGl0aWVzMik7CiAK
LQlyZXQgPSB2bXdfZG1hX21hc2tzKGRldl9wcml2KTsKLQlpZiAodW5saWtlbHkocmV0ICE9IDAp
KQotCQlnb3RvIG91dF9lcnIwOwotCiAJZG1hX3NldF9tYXhfc2VnX3NpemUoZGV2LT5kZXYsIG1p
bl90KHVuc2lnbmVkIGludCwgVTMyX01BWCAmIFBBR0VfTUFTSywKIAkJCQkJICAgICBTQ0FUVEVS
TElTVF9NQVhfU0VHTUVOVCkpOwogCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
