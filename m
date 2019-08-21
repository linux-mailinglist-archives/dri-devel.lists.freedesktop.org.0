Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB50B98390
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 20:50:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 389DE6E38D;
	Wed, 21 Aug 2019 18:50:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8CBF6E340
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 18:50:15 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0A6C533D;
 Wed, 21 Aug 2019 20:50:13 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH/RFC 0/5] Decouple EDID retrieval from drm_connector
Date: Wed, 21 Aug 2019 21:50:00 +0300
Message-Id: <20190821185005.9789-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1566413414;
 bh=wlsR7rdAiklreUp0q7OxHNou6vm9GVZ8vCKTA3UcJd4=;
 h=From:To:Cc:Subject:Date:From;
 b=ZnUD/MpX+APEb96towEaTbztPgPZ6uA0Y8+iW8e1OLR1ULg9TMzqX/iKuUY4iHR4K
 c0uZqiaxxpCyM7KisNDz38JnA+b4EFc25hNIJCr6SRomI/xnYyWZOoOOnlNTYD18tk
 /Ni5SpmWyXRRQ6A/M2uLRnl1f7iHlfcSeEpHlRwg=
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8sCgpUaGlzIHNtYWxsIHBhdGNoIHNlcmllcyBhdHRlbXBzIGF0IGRlY291cGxpbmcgRURJ
RCByZXRyaWV2YWwgZnJvbQpkcm1fY29ubmVjdG9yLCBmb2xsb3dpbmcgYSBkaXNjdXNzaW9uIHdp
dGggRGFuaWVsIFZldHRlciBbMV0uIFdoaWxlCndvcmtpbmcgb24gdGhpcyBJIG5vdGljZWQgYSBm
ZXcgaXNzdWVzIHdpdGggRURJRCByZXRyaWV2YWwsIHdoaWNoIEkgaGF2ZQphdHRlbXB0ZWQgdG8g
Zml4IGluIHBhdGNoZXMgMS81IHRvIDQvNS4gUGF0Y2ggNS81IHRoZW4gdHJpZXMgdG8gZGVjb3Vw
bGUKdGhlIEVESUQgcmV0cmlldmFsIGZyb20gZHJtX2Nvbm5lY3RvciwgaW4gd2hhdCBJIHRoaW5r
IGlzIGEgcHJldHR5IGJhZAp3YXkuIEkgd291bGQgbGlrZSB0byBkaXNjdXNzIHRoaXMgZnVydGhl
ciB0byBzZWUgaWYgYSkgdGhlcmUncyBhbgppbnRlcmVzdCwgYW5kIGIpIHNvbWVvbmUgaGFzIGEg
YmV0dGVyIGlkZWEgOi0pCgpSZWdhcmRsZXNzIG9mIHRoZSBvdXRjb21lIG9mIHRoZSBkaXNjdXNz
aW9uIG9uIHBhdGNoIDUvNSwgdGhlIGZpcnN0IGZvdXIKcGF0Y2hlcyBhcmUgY2FuZGlkYXRlcyBm
b3IgdXBzdHJlYW1pbmcgYXMgdGhleSB0cnkgdG8gYWRkcmVzcyBleGlzdGluZwppc3N1ZXMgKHRo
ZXkgbWF5IGFsc28gaW50cm9kdWNlIG5ldyBidWdzLCBidXQgaG9wZWZ1bGx5IHRoZXkgd2lsbCBi
ZQpwb2ludGVkIG91dCBkdXJpbmcgcmV2aWV3KS4KClRoZSBwYXRjaGVzIGFyZSBhdmFpbGFibGUg
YXQKCglnaXQ6Ly9saW51eHR2Lm9yZy9waW5jaGFydGwvbWVkaWEuZ2l0IG9tYXBkcm0vZWRpZAoK
WzFdIGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2RyaS1kZXZlbC8yMDE5
LUF1Z3VzdC8yMzE5MzAuaHRtbAoKTGF1cmVudCBQaW5jaGFydCAoNSk6CiAgZHJtL2VkaWQ6IFJl
b3JnYW5pc2UgdGhlIERpc3BsYXlJRCBwYXJzaW5nIGNvZGUKICBkcm0vZWRpZDogTW92ZSBmdW5j
dGlvbnMgdG8gYXZvaWQgZm9yd2FyZCBkZWNsYXJhdGlvbgogIGRybS9lZGlkOiBNb3ZlIERpc3Bs
YXlJRCB0aWxlIHBhcnNpbmcgdG8gZHJtX2Nvbm5lY3Rvci5jCiAgZHJtL2VkaWQ6IEhvbm91ciBj
b25uZWN0b3ItPmZvcmNlIGluIGRybV9kb19nZXRfZWRpZCgpCiAgW0hBQ0tdIGRybS9lZGlkOiBE
ZWNvdXBsZSBFRElEIHJldHJpZXZhbCBmcm9tIGNvbm5lY3RvcgoKIGRyaXZlcnMvZ3B1L2RybS9k
cm1fY29ubmVjdG9yLmMgICAgICAgfCAxMzcgKysrLQogZHJpdmVycy9ncHUvZHJtL2RybV9kcF9t
c3RfdG9wb2xvZ3kuYyB8ICAgMyArLQogZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMgICAgICAg
ICAgICB8IDg1NyArKysrKysrKysrKystLS0tLS0tLS0tLS0tLQogaW5jbHVkZS9kcm0vZHJtX2Nv
bm5lY3Rvci5oICAgICAgICAgICB8ICAgMyArLQogaW5jbHVkZS9kcm0vZHJtX2Rpc3BsYXlpZC5o
ICAgICAgICAgICB8ICAgMiArCiBpbmNsdWRlL2RybS9kcm1fZWRpZC5oICAgICAgICAgICAgICAg
IHwgICAyICsKIDYgZmlsZXMgY2hhbmdlZCwgNTM0IGluc2VydGlvbnMoKyksIDQ3MCBkZWxldGlv
bnMoLSkKCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
