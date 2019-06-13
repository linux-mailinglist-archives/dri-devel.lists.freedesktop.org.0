Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA081455E8
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:24:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFF2F897E3;
	Fri, 14 Jun 2019 07:22:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F42689AF3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 15:04:52 +0000 (UTC)
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([2001:4d48:ad52:3201:222:68ff:fe15:37dd]:45382 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1hbRFv-0003lH-RY; Thu, 13 Jun 2019 16:03:12 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim
 4.82_1-5b7a7c0-XX) (envelope-from <rmk@armlinux.org.uk>)
 id 1hbRFo-00008p-F9; Thu, 13 Jun 2019 16:03:04 +0100
In-Reply-To: <20190613150114.xqkyb7j7w4ve4yvr@shell.armlinux.org.uk>
References: <20190613150114.xqkyb7j7w4ve4yvr@shell.armlinux.org.uk>
From: Russell King <rmk+kernel@armlinux.org.uk>
To: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 16/18] drm/armada: replace the simple-framebuffer
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1hbRFo-00008p-F9@rmk-PC.armlinux.org.uk>
Date: Thu, 13 Jun 2019 16:03:04 +0100
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:21:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V7uQGsBSps5OtehC7jKDCOj7ey/BkwQGUrMcyiu617U=; b=FCaczxjel13UF0wFfzCKw7xyhk
 W9SLab/jiRYInWHnNL3eOJfEarknD57h1Uu9MjJ/f0RqoENXe7ubKW+frGHIg/qBAWRCGO7O2/zdY
 V3dsX7fCxlldV2fTUDyTHxi1ympF+NeJWp3/voGca6xR/3i2nMOs91i8m5Yk7YZotMOGoIkgZxPOI
 AvqP6BMwc/cpNb1BKisYmXyN0XXmGmLH1YoPrdjOy0l2V/peDlk6DBsld25AHb+Dx03KB/p+dbvkc
 GkxwPRm2Iyw9rNRY1x09HCFIiF/dOQKlldgGU9VCrPWghwNT41wrrwnk88Nb/MB4iA2M9Pddn0Bs9
 ybz4qMVw==;
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

RnJvbTogTHVib21pciBSaW50ZWwgPGxrdW5kcmFrQHYzLnNrPgoKSWYgdGhlcmUncyBhIHNpbXBs
ZS1mcmFtZWJ1ZmZlciBjYXJyaWVkIG92ZXIgZnJvbSBib290IGZpcm13YXJlLCBpdCdzIGdvaW5n
CnRvIHN0b3Agd29ya2luZyBvbmNlIHdlIHNldHVwIHRoZSBMQ0RDIGZvciB1c2UgdmlhIERSTS4g
S2ljayBpdCBvZmYgZnJvbQp0aGUgaGFyZHdhcmUuCgpTaWduZWQtb2ZmLWJ5OiBMdWJvbWlyIFJp
bnRlbCA8bGt1bmRyYWtAdjMuc2s+ClNpZ25lZC1vZmYtYnk6IFJ1c3NlbGwgS2luZyA8cm1rK2tl
cm5lbEBhcm1saW51eC5vcmcudWs+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FybWFkYS9hcm1hZGFf
ZHJ2LmMgfCAxMSArKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtYWRhL2FybWFkYV9kcnYuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hcm1hZGEvYXJtYWRhX2Rydi5jCmluZGV4IGU1MjRiZmZmMWM0OS4uMDVmYWI1
Y2I1YzJkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtYWRhL2FybWFkYV9kcnYuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtYWRhL2FybWFkYV9kcnYuYwpAQCAtMTAwLDYgKzEwMCwx
NyBAQCBzdGF0aWMgaW50IGFybWFkYV9kcm1fYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYpCiAJCXJl
dHVybiByZXQ7CiAJfQogCisJLyogUmVtb3ZlIGVhcmx5IGZyYW1lYnVmZmVycyAqLworCXJldCA9
IGRybV9mYl9oZWxwZXJfcmVtb3ZlX2NvbmZsaWN0aW5nX2ZyYW1lYnVmZmVycyhOVUxMLAorCQkJ
CQkJCSAgICAiYXJtYWRhLWRybS1mYiIsCisJCQkJCQkJICAgIGZhbHNlKTsKKwlpZiAocmV0KSB7
CisJCWRldl9lcnIoZGV2LCAiWyIgRFJNX05BTUUgIjolc10gY2FuJ3Qga2ljayBvdXQgc2ltcGxl
LWZiOiAlZFxuIiwKKwkJCV9fZnVuY19fLCByZXQpOworCQlrZnJlZShwcml2KTsKKwkJcmV0dXJu
IHJldDsKKwl9CisKIAlwcml2LT5kcm0uZGV2X3ByaXZhdGUgPSBwcml2OwogCiAJZGV2X3NldF9k
cnZkYXRhKGRldiwgJnByaXYtPmRybSk7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
