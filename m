Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75ED5455C5
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:23:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75A6B895B4;
	Fri, 14 Jun 2019 07:21:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78BB789AEE
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 15:03:02 +0000 (UTC)
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([2002:4e20:1eda:1:222:68ff:fe15:37dd]:44842 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1hbRFI-0003kG-FK; Thu, 13 Jun 2019 16:02:32 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim
 4.82_1-5b7a7c0-XX) (envelope-from <rmk@armlinux.org.uk>)
 id 1hbRFE-00007h-BQ; Thu, 13 Jun 2019 16:02:28 +0100
In-Reply-To: <20190613150114.xqkyb7j7w4ve4yvr@shell.armlinux.org.uk>
References: <20190613150114.xqkyb7j7w4ve4yvr@shell.armlinux.org.uk>
From: Russell King <rmk+kernel@armlinux.org.uk>
To: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 09/18] drm/armada: add drm_mode_set_crtcinfo() mode fixup
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1hbRFE-00007h-BQ@rmk-PC.armlinux.org.uk>
Date: Thu, 13 Jun 2019 16:02:28 +0100
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:21:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n1ADWfrxell8j9XL+nv+avELr5Unf4Y2nYepvE/ry4k=; b=FCpNXML7eB4LKnNfG4L87AFZ93
 8LhYoPHo/MaV4pC0wNp++yXBYBdqjZx4OS+fUtyzKo36/sUTJJFIO26EuGkytAv3LYhw/8ijTBGOT
 GGtRIxT9wIvbR2YCPUKwGQKukSw10YMG1D0CSbYRY27Nc7eFQc2wYdyvzdG/n/09p2rl56L2hOJCq
 XoqoJwdhm4Bo8qJQ5vjI1D/04K4C9DjvIWiZLpfBEhaQfF+1XkBeuSFPrG7oZYmlZxPiBWvAzW2m9
 Fw/iD4ozv0w1WhxBahcQ5s+VkE4v/8BzwHKOWE05uo2Q8jaI3p4Tft22EOscYAr4YWFjRXkAAwovr
 mkg1yt3g==;
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

QWRkIGEgZHJtX21vZGVfc2V0X2NydGNpbmZvKCkgY2FsbCBpbiBvdXIgQ1JUQydzIG1vZGVfZml4
dXAgY2FsbGJhY2sKdG8gZW5zdXJlIHRoYXQgYW55IGFkanVzdG1lbnRzIHRvIHRoZSBtb2RlIG1h
ZGUgYnkgY29ubmVjdG9ycyBldGMgYXJlCnByb3Blcmx5IGFjY291bnRlZCBmb3IgYnkgdGhlIENS
VEMuCgpTaWduZWQtb2ZmLWJ5OiBSdXNzZWxsIEtpbmcgPHJtaytrZXJuZWxAYXJtbGludXgub3Jn
LnVrPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hcm1hZGEvYXJtYWRhX2NydGMuYyB8IDcgKysrKysr
KwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hcm1hZGEvYXJtYWRhX2NydGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm1hZGEvYXJt
YWRhX2NydGMuYwppbmRleCBlODFlNTc4MjNiNjYuLmQ4MDJhNmJjMmQ5ZiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FybWFkYS9hcm1hZGFfY3J0Yy5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hcm1hZGEvYXJtYWRhX2NydGMuYwpAQCAtMTgwLDYgKzE4MCwxMyBAQCBzdGF0aWMgYm9vbCBh
cm1hZGFfZHJtX2NydGNfbW9kZV9maXh1cChzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCiAJICAgIGFk
ai0+ZmxhZ3MgJiBEUk1fTU9ERV9GTEFHX0lOVEVSTEFDRSkKIAkJcmV0dXJuIGZhbHNlOwogCisJ
LyoKKwkgKiBTZXQgQ1JUQyBtb2Rlc2V0dGluZyBwYXJhbWV0ZXJzIGZvciB0aGUgYWRqdXN0ZWQg
bW9kZS4gIFRoaXMgaXMKKwkgKiBhcHBsaWVkIGFmdGVyIHRoZSBjb25uZWN0b3JzLCBicmlkZ2Vz
LCBhbmQgZW5jb2RlcnMgaGF2ZSBmaXhlZCB1cAorCSAqIHRoaXMgbW9kZSwgYXMgZGVzY3JpYmVk
IGFib3ZlIGRybV9hdG9taWNfaGVscGVyX2NoZWNrX21vZGVzZXQoKS4KKwkgKi8KKwlkcm1fbW9k
ZV9zZXRfY3J0Y2luZm8oYWRqLCBDUlRDX0lOVEVSTEFDRV9IQUxWRV9WKTsKKwogCS8qIENoZWNr
IHdoZXRoZXIgdGhlIGRpc3BsYXkgbW9kZSBpcyBwb3NzaWJsZSAqLwogCXJldCA9IGRjcnRjLT52
YXJpYW50LT5jb21wdXRlX2Nsb2NrKGRjcnRjLCBhZGosIE5VTEwpOwogCWlmIChyZXQpCi0tIAoy
LjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
