Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CED45617
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:25:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B81589838;
	Fri, 14 Jun 2019 07:22:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7EC989AF3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 15:03:32 +0000 (UTC)
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35426 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1hbRFl-0003kw-4t; Thu, 13 Jun 2019 16:03:01 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim
 4.82_1-5b7a7c0-XX) (envelope-from <rmk@armlinux.org.uk>)
 id 1hbRFe-00008U-6F; Thu, 13 Jun 2019 16:02:54 +0100
In-Reply-To: <20190613150114.xqkyb7j7w4ve4yvr@shell.armlinux.org.uk>
References: <20190613150114.xqkyb7j7w4ve4yvr@shell.armlinux.org.uk>
From: Russell King <rmk+kernel@armlinux.org.uk>
To: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 14/18] drm/armada: use mode_valid to validate the adjusted mode
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1hbRFe-00008U-6F@rmk-PC.armlinux.org.uk>
Date: Thu, 13 Jun 2019 16:02:54 +0100
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:21:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VdHoZhjdglNvGZZLS/THTRLcnp1kH8tvv7PiZLbCcbM=; b=DT8Wgy6/J16400/zTVbzORgcay
 T8jq3O2aIK8X24oEM3jhPOhw1hjG7ipBJFD0k38wSvOLqZeAW1FpgaqrwWfojzvlOoCyhdAkmGrX4
 yl1kXcHPbi89D0bFIbEH2IjasM49GXtOt+mfOHypQY7dhH9OkRgG4kirHQosiw/Z5XWRM5xwsYYgw
 mzzDkPeCW0CAOuR4CZ1vsxbTIQiawKEIwqfin5ZUTUUrHwDPlYuibwk3jL0CvOKH8zq7cdxa4B5iG
 wtodRAg5p0QjA6yDXW5R2aW93Af3yLkAYuPb/WXjwZQJLNhkzyKJIaIryJaQfHcgcs6F9Ps79ZEPD
 lrDqqdhg==;
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
Cc: David Airlie <airlied@linux.ie>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VmFsaWRhdGUgdGhlIGFkanVzdGVkIG1vZGUgaW4gdGhlIENSVEMgbW9kZV9maXh1cCgpIGNhbGwg
dG8gZW5zdXJlIHRoYXQKYW55IGVuY29kZXIgb3IgYnJpZGdlIGRvZXNuJ3Qgc3VwcGx5IHVzIHdp
dGggYSBtb2RlIHdlIGNhbid0IHN1cHBvcnQuCgpTaWduZWQtb2ZmLWJ5OiBSdXNzZWxsIEtpbmcg
PHJtaytrZXJuZWxAYXJtbGludXgub3JnLnVrPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hcm1hZGEv
YXJtYWRhX2NydGMuYyB8IDE5ICsrKysrKysrKysrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAx
NCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hcm1hZGEvYXJtYWRhX2NydGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm1hZGEvYXJtYWRh
X2NydGMuYwppbmRleCA5NDlhY2M4MjQwNmIuLmVjY2U3ZWZiMjcxZCAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FybWFkYS9hcm1hZGFfY3J0Yy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
cm1hZGEvYXJtYWRhX2NydGMuYwpAQCAtMTcxLDYgKzE3MSw4IEBAIHN0YXRpYyB2b2lkIGFybWFk
YV9kcm1fdXBkYXRlX2dhbW1hKHN0cnVjdCBkcm1fY3J0YyAqY3J0YykKIHN0YXRpYyBlbnVtIGRy
bV9tb2RlX3N0YXR1cyBhcm1hZGFfZHJtX2NydGNfbW9kZV92YWxpZChzdHJ1Y3QgZHJtX2NydGMg
KmNydGMsCiAJY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUpCiB7CisJc3RydWN0
IGFybWFkYV9jcnRjICpkY3J0YyA9IGRybV90b19hcm1hZGFfY3J0YyhjcnRjKTsKKwogCWlmICht
b2RlLT52c2NhbiA+IDEpCiAJCXJldHVybiBNT0RFX05PX1ZTQ0FOOwogCkBAIC0xODAsNiArMTgy
LDExIEBAIHN0YXRpYyBlbnVtIGRybV9tb2RlX3N0YXR1cyBhcm1hZGFfZHJtX2NydGNfbW9kZV92
YWxpZChzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCiAJaWYgKG1vZGUtPmZsYWdzICYgRFJNX01PREVf
RkxBR19IU0tFVykKIAkJcmV0dXJuIE1PREVfSF9JTExFR0FMOwogCisJLyogV2UgY2FuJ3QgZG8g
aW50ZXJsYWNlZCBtb2RlcyBpZiB3ZSBkb24ndCBoYXZlIHRoZSBTUFVfQURWX1JFRyAqLworCWlm
ICghZGNydGMtPnZhcmlhbnQtPmhhc19zcHVfYWR2X3JlZyAmJgorCSAgICBtb2RlLT5mbGFncyAm
IERSTV9NT0RFX0ZMQUdfSU5URVJMQUNFKQorCQlyZXR1cm4gTU9ERV9OT19JTlRFUkxBQ0U7CisK
IAlpZiAobW9kZS0+ZmxhZ3MgJiAoRFJNX01PREVfRkxBR19CQ0FTVCB8IERSTV9NT0RFX0ZMQUdf
UElYTVVYIHwKIAkJCSAgIERSTV9NT0RFX0ZMQUdfQ0xLRElWMikpCiAJCXJldHVybiBNT0RFX0JB
RDsKQEAgLTE5NCwxMSArMjAxLDYgQEAgc3RhdGljIGJvb2wgYXJtYWRhX2RybV9jcnRjX21vZGVf
Zml4dXAoc3RydWN0IGRybV9jcnRjICpjcnRjLAogCXN0cnVjdCBhcm1hZGFfY3J0YyAqZGNydGMg
PSBkcm1fdG9fYXJtYWRhX2NydGMoY3J0Yyk7CiAJaW50IHJldDsKIAotCS8qIFdlIGNhbid0IGRv
IGludGVybGFjZWQgbW9kZXMgaWYgd2UgZG9uJ3QgaGF2ZSB0aGUgU1BVX0FEVl9SRUcgKi8KLQlp
ZiAoIWRjcnRjLT52YXJpYW50LT5oYXNfc3B1X2Fkdl9yZWcgJiYKLQkgICAgYWRqLT5mbGFncyAm
IERSTV9NT0RFX0ZMQUdfSU5URVJMQUNFKQotCQlyZXR1cm4gZmFsc2U7Ci0KIAkvKgogCSAqIFNl
dCBDUlRDIG1vZGVzZXR0aW5nIHBhcmFtZXRlcnMgZm9yIHRoZSBhZGp1c3RlZCBtb2RlLiAgVGhp
cyBpcwogCSAqIGFwcGxpZWQgYWZ0ZXIgdGhlIGNvbm5lY3RvcnMsIGJyaWRnZXMsIGFuZCBlbmNv
ZGVycyBoYXZlIGZpeGVkIHVwCkBAIC0yMDYsNiArMjA4LDEzIEBAIHN0YXRpYyBib29sIGFybWFk
YV9kcm1fY3J0Y19tb2RlX2ZpeHVwKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKIAkgKi8KIAlkcm1f
bW9kZV9zZXRfY3J0Y2luZm8oYWRqLCBDUlRDX0lOVEVSTEFDRV9IQUxWRV9WKTsKIAorCS8qCisJ
ICogVmFsaWRhdGUgdGhlIGFkanVzdGVkIG1vZGUgaW4gY2FzZSBhbiBlbmNvZGVyL2JyaWRnZSBo
YXMgc2V0CisJICogc29tZXRoaW5nIHdlIGRvbid0IHN1cHBvcnQuCisJICovCisJaWYgKGFybWFk
YV9kcm1fY3J0Y19tb2RlX3ZhbGlkKGNydGMsIGFkaikgIT0gTU9ERV9PSykKKwkJcmV0dXJuIGZh
bHNlOworCiAJLyogQ2hlY2sgd2hldGhlciB0aGUgZGlzcGxheSBtb2RlIGlzIHBvc3NpYmxlICov
CiAJcmV0ID0gZGNydGMtPnZhcmlhbnQtPmNvbXB1dGVfY2xvY2soZGNydGMsIGFkaiwgTlVMTCk7
CiAJaWYgKHJldCkKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
