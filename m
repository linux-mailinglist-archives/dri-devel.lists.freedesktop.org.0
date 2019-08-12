Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C4F89512
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2019 02:30:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EB966E3FC;
	Mon, 12 Aug 2019 00:30:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1340 seconds by postgrey-1.36 at gabe;
 Mon, 12 Aug 2019 00:30:26 UTC
Received: from gateway24.websitewelcome.com (gateway24.websitewelcome.com
 [192.185.51.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1390C6E3FC
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 00:30:26 +0000 (UTC)
Received: from cm14.websitewelcome.com (cm14.websitewelcome.com [100.42.49.7])
 by gateway24.websitewelcome.com (Postfix) with ESMTP id 9B7F5A677
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Aug 2019 19:08:05 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id wxsbhXKcf2qH7wxsbhXCD3; Sun, 11 Aug 2019 19:08:05 -0500
X-Authority-Reason: nr=8
Received: from [187.192.11.120] (port=52004 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.92)
 (envelope-from <gustavo@embeddedor.com>)
 id 1hwxsa-002WKs-7p; Sun, 11 Aug 2019 19:08:04 -0500
Date: Sun, 11 Aug 2019 19:08:01 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: "James (Qian) Wang" <james.qian.wang@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Brian Starkey <brian.starkey@arm.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/komeda: Fix potential integer overflow in
 komeda_crtc_update_clock_ratio
Message-ID: <20190812000801.GA29204@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.192.11.120
X-Source-L: No
X-Exim-ID: 1hwxsa-002WKs-7p
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [187.192.11.120]:52004
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 6
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
 Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HkwYskj4hcqhar/pMnuy1yYlf+y7tZmG56Gg3PFUL0k=; b=JPVkijILtRkj9igWsLFjuJmYKS
 F6CinifQtxXBv7RW3u4IN8In493M+5I2neJuiW7XfzXSqrDNg/Zr02XVfXlm/PwP29tt5KP4mMRie
 HPxbIABPA0ukRCfyr9UdHNomWKpYkYicF+0dCsZn/gkzvCeVt2j8HbbCg9w8D6iQjRj8Ew6RXazHW
 yAe8khiwLlq2fxLIVW8syIYNZSwcvOmeg+Xz+gOBqamAUuK0+UFrI/hDSZ9FPcnnYz6qMTqkgssXX
 6rKg1UaFiclhTCHAEO6rh5z+ZOPDg96QQQiWcAB9Eaa/iyoXblSQaa+nx5lWPw9qm3CCbjjESAFIS
 KM8pQ5uQ==;
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
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIHN1ZmZpeCBVTEwgdG8gY29uc3RhbnQgMTAwMCBpbiBvcmRlciB0byBhdm9pZCBhIHBvdGVu
dGlhbCBpbnRlZ2VyCm92ZXJmbG93IGFuZCBnaXZlIHRoZSBjb21waWxlciBjb21wbGV0ZSBpbmZv
cm1hdGlvbiBhYm91dCB0aGUgcHJvcGVyCmFyaXRobWV0aWMgdG8gdXNlLiBOb3RpY2UgdGhhdCB0
aGlzIGNvbnN0YW50IGlzIGJlaW5nIHVzZWQgaW4gYSBjb250ZXh0CnRoYXQgZXhwZWN0cyBhbiBl
eHByZXNzaW9uIG9mIHR5cGUgdTY0LCBidXQgaXQncyBjdXJyZW50bHkgZXZhbHVhdGVkCnVzaW5n
IDMyLWJpdCBhcml0aG1ldGljLgoKQWRkcmVzc2VzLUNvdmVyaXR5LUlEOiAxNDg1Nzk2ICgiVW5p
bnRlbnRpb25hbCBpbnRlZ2VyIG92ZXJmbG93IikKRml4ZXM6IGVkMjJjNmQ5MzA0ZCAoImRybS9r
b21lZGE6IFVzZSBkcm1fZGlzcGxheV9tb2RlICJjcnRjXyIgcHJlZml4ZWQgaGFyZHdhcmUgdGlt
aW5ncyIpClNpZ25lZC1vZmYtYnk6IEd1c3Rhdm8gQS4gUi4gU2lsdmEgPGd1c3Rhdm9AZW1iZWRk
ZWRvci5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
Y3J0Yy5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21l
ZGFfY3J0Yy5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0
Yy5jCmluZGV4IGZhOWE0NTkzYmIzNy4uNjI0ZDI1N2RhMjBmIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jcnRjLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jCkBAIC0yNyw3ICsyNyw3IEBA
IHN0YXRpYyB2b2lkIGtvbWVkYV9jcnRjX3VwZGF0ZV9jbG9ja19yYXRpbyhzdHJ1Y3Qga29tZWRh
X2NydGNfc3RhdGUgKmtjcnRjX3N0KQogCQlyZXR1cm47CiAJfQogCi0JcHhsY2xrID0ga2NydGNf
c3QtPmJhc2UuYWRqdXN0ZWRfbW9kZS5jcnRjX2Nsb2NrICogMTAwMDsKKwlweGxjbGsgPSBrY3J0
Y19zdC0+YmFzZS5hZGp1c3RlZF9tb2RlLmNydGNfY2xvY2sgKiAxMDAwVUxMOwogCWFjbGsgPSBr
b21lZGFfY3J0Y19nZXRfYWNsayhrY3J0Y19zdCk7CiAKIAlrY3J0Y19zdC0+Y2xvY2tfcmF0aW8g
PSBkaXY2NF91NjQoYWNsayA8PCAzMiwgcHhsY2xrKTsKLS0gCjIuMjIuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
