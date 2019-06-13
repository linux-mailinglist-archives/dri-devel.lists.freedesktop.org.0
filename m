Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B30AE45614
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:25:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3AD589873;
	Fri, 14 Jun 2019 07:22:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC04589AEE
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 15:02:01 +0000 (UTC)
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([2001:4d48:ad52:3201:222:68ff:fe15:37dd]:45338 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1hbREf-0003jD-N1; Thu, 13 Jun 2019 16:01:53 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim
 4.82_1-5b7a7c0-XX) (envelope-from <rmk@armlinux.org.uk>)
 id 1hbREd-00006m-Ia; Thu, 13 Jun 2019 16:01:51 +0100
In-Reply-To: <20190613150114.xqkyb7j7w4ve4yvr@shell.armlinux.org.uk>
References: <20190613150114.xqkyb7j7w4ve4yvr@shell.armlinux.org.uk>
From: Russell King <rmk+kernel@armlinux.org.uk>
To: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 02/18] drm/armada: use __drm_atomic_helper_plane_reset in
 overlay reset
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1hbREd-00006m-Ia@rmk-PC.armlinux.org.uk>
Date: Thu, 13 Jun 2019 16:01:51 +0100
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:21:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=51ybDZL5ICqBgHpzWFPJBJAExf58VodpQvGF1SWDfk4=; b=rf6HU56lWgQQMJOR1cHCMRIHOf
 GubzYpxMmL5t25hZxGDb4lCpdHsOPMyVtqck429IRDv4L5Hcgh9A2s7zVHcbxger9C9+toy7hhZzc
 2KDpH/0A4IYYLUD2CTIS4OiW4xY+AXSRL3VgGva1wmH+ZvzaKJfDFm98Sed242RVU49Kc7vwfvn0b
 l0S//uqhSo5qefGspFHa6hig6q6LV/0tcFSIXmAsopEgWABVwnZJzAq0Wczq84+vFmbnjt9weYdSV
 /+MQVGIroJleUiDMeYc5isDKKZI5MRtaVnYfUEO9fWYwfFV5TbnOr3blNObHl9Mx3fYKndyzRdk5R
 kU0hQfCg==;
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

VXNlIHRoZSBfX2RybV9hdG9taWNfaGVscGVyX3BsYW5lX3Jlc2V0KCkgaGVscGVyIGluIHRoZSBv
dmVybGF5IHJlc2V0CmNvZGUgdG8gZW5zdXJlIHRoYXQgZ2VuZXJpYyBmZWF0dXJlcyBhcmUgY29y
cmVjdGx5IHJlc2V0IGluIGZ1dHVyZS4KClNpZ25lZC1vZmYtYnk6IFJ1c3NlbGwgS2luZyA8cm1r
K2tlcm5lbEBhcm1saW51eC5vcmcudWs+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FybWFkYS9hcm1h
ZGFfb3ZlcmxheS5jIHwgOSArKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybWFkYS9h
cm1hZGFfb3ZlcmxheS5jIGIvZHJpdmVycy9ncHUvZHJtL2FybWFkYS9hcm1hZGFfb3ZlcmxheS5j
CmluZGV4IDhkNzcwNjQxZmNjNC4uZjgzMGY1M2Q3YWRmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYXJtYWRhL2FybWFkYV9vdmVybGF5LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybWFk
YS9hcm1hZGFfb3ZlcmxheS5jCkBAIC0zMDcsMTMgKzMwNywxMCBAQCBzdGF0aWMgdm9pZCBhcm1h
ZGFfb3ZlcmxheV9yZXNldChzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSkKIAlpZiAocGxhbmUtPnN0
YXRlKQogCQlfX2RybV9hdG9taWNfaGVscGVyX3BsYW5lX2Rlc3Ryb3lfc3RhdGUocGxhbmUtPnN0
YXRlKTsKIAlrZnJlZShwbGFuZS0+c3RhdGUpOworCXBsYW5lLT5zdGF0ZSA9IE5VTEw7CiAKIAlz
dGF0ZSA9IGt6YWxsb2Moc2l6ZW9mKCpzdGF0ZSksIEdGUF9LRVJORUwpOwogCWlmIChzdGF0ZSkg
ewotCQlzdGF0ZS0+YmFzZS5wbGFuZSA9IHBsYW5lOwotCQlzdGF0ZS0+YmFzZS5jb2xvcl9lbmNv
ZGluZyA9IERFRkFVTFRfRU5DT0RJTkc7Ci0JCXN0YXRlLT5iYXNlLmNvbG9yX3JhbmdlID0gRFJN
X0NPTE9SX1lDQkNSX0xJTUlURURfUkFOR0U7Ci0JCXN0YXRlLT5iYXNlLnJvdGF0aW9uID0gRFJN
X01PREVfUk9UQVRFXzA7CiAJCXN0YXRlLT5jb2xvcmtleV95ciA9IDB4ZmVmZWZlMDA7CiAJCXN0
YXRlLT5jb2xvcmtleV91ZyA9IDB4MDEwMTAxMDA7CiAJCXN0YXRlLT5jb2xvcmtleV92YiA9IDB4
MDEwMTAxMDA7CkBAIC0zMjMsOCArMzIwLDEwIEBAIHN0YXRpYyB2b2lkIGFybWFkYV9vdmVybGF5
X3Jlc2V0KHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lKQogCQlzdGF0ZS0+YnJpZ2h0bmVzcyA9IERF
RkFVTFRfQlJJR0hUTkVTUzsKIAkJc3RhdGUtPmNvbnRyYXN0ID0gREVGQVVMVF9DT05UUkFTVDsK
IAkJc3RhdGUtPnNhdHVyYXRpb24gPSBERUZBVUxUX1NBVFVSQVRJT047CisJCV9fZHJtX2F0b21p
Y19oZWxwZXJfcGxhbmVfcmVzZXQocGxhbmUsICZzdGF0ZS0+YmFzZSk7CisJCXN0YXRlLT5iYXNl
LmNvbG9yX2VuY29kaW5nID0gREVGQVVMVF9FTkNPRElORzsKKwkJc3RhdGUtPmJhc2UuY29sb3Jf
cmFuZ2UgPSBEUk1fQ09MT1JfWUNCQ1JfTElNSVRFRF9SQU5HRTsKIAl9Ci0JcGxhbmUtPnN0YXRl
ID0gJnN0YXRlLT5iYXNlOwogfQogCiBzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICoKLS0gCjIuNy40
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
