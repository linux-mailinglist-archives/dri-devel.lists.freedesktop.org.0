Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB4D350D0
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 22:23:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3947989C6C;
	Tue,  4 Jun 2019 20:23:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AD1189C60
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2019 20:23:33 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.89)
 (envelope-from <l.stach@pengutronix.de>)
 id 1hYFxz-00086C-DZ; Tue, 04 Jun 2019 22:23:31 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH] udmabuf: actually unmap the scatterlist
Date: Tue,  4 Jun 2019 22:23:31 +0200
Message-Id: <20190604202331.17482-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 patchwork-lst@pengutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dW5tYXBfdWRtYWJ1ZiBmYWlscyB0byBhY3R1YWxseSB1bm1hcCB0aGUgc2NhdHRlcmxpc3QsIGxl
YXZpbmcgZGFuZ2xpbmcKbWFwcGluZ3MgYXJvdW5kLgoKRml4ZXM6IGZiYjBkZTc5NTA3OCAoQWRk
IHVkbWFidWYgbWlzYyBkZXZpY2UpClNpZ25lZC1vZmYtYnk6IEx1Y2FzIFN0YWNoIDxsLnN0YWNo
QHBlbmd1dHJvbml4LmRlPgotLS0KIGRyaXZlcnMvZG1hLWJ1Zi91ZG1hYnVmLmMgfCAxICsKIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1
Zi91ZG1hYnVmLmMgYi9kcml2ZXJzL2RtYS1idWYvdWRtYWJ1Zi5jCmluZGV4IGNkNTc3NDcyODZm
Mi4uOTYzNTg5NzQ1OGEwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2RtYS1idWYvdWRtYWJ1Zi5jCisr
KyBiL2RyaXZlcnMvZG1hLWJ1Zi91ZG1hYnVmLmMKQEAgLTc3LDYgKzc3LDcgQEAgc3RhdGljIHZv
aWQgdW5tYXBfdWRtYWJ1ZihzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2htZW50ICphdCwKIAkJCSAgc3Ry
dWN0IHNnX3RhYmxlICpzZywKIAkJCSAgZW51bSBkbWFfZGF0YV9kaXJlY3Rpb24gZGlyZWN0aW9u
KQogeworCWRtYV91bm1hcF9zZyhhdC0+ZGV2LCBzZy0+c2dsLCBzZy0+bmVudHMsIGRpcmVjdGlv
bik7CiAJc2dfZnJlZV90YWJsZShzZyk7CiAJa2ZyZWUoc2cpOwogfQotLSAKMi4yMC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
