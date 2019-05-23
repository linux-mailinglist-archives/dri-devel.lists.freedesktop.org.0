Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 429D327E7D
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2019 15:44:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0F3889E5A;
	Thu, 23 May 2019 13:44:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE8E689DF9;
 Thu, 23 May 2019 13:44:36 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:53376
 helo=localhost.localdomain)
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_CBC_SHA1:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hTo1K-0002si-Hi; Thu, 23 May 2019 15:44:34 +0200
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 0/8] drm/fb-helper: Move modesetting code to drm_client
Date: Thu, 23 May 2019 15:44:05 +0200
Message-Id: <20190523134413.4210-1-noralf@tronnes.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From;
 bh=04vOmOssMCR8y1GJ9nMjEvusq9gmesShpexmPS5oIdw=; 
 b=CIUYrxcsdVvPix69QRR7oaO2l8/N5yBhBALPES9R8ZSwoynlAadP3PSVZn6N9eWoYJooluUE7Fz7RUrY78KR9SqQapoicpYATe6ZFx0wwLTZbCzYmR2rW95hKaUKpwGEHaJWYkLtsBWaMfBbUKAeatXWkHybbIH2tzoOdjbwRjIw8/Cnh6oBPPSp1cLUNMjVel4GUQxGlAd1cK6O+lWj+IP4/LXJYKqOJvdYOfogz2zUy/AMguwKXGu4t8GKIxPyIoTQBGvxNUhmoI0SwgPNoBXL1YAKYcFMeS0QDss3N2MQcnE8ZErv5eHqR27AFn5nzRs36EZyUQXZgpdpl+18ng==;
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBtb3ZlcyB0aGUgbW9kZXNldHRpbmcgY29kZSBmcm9tIGRybV9mYl9oZWxwZXIgdG8gZHJt
X2NsaWVudCBzbyBpdApjYW4gYmUgc2hhcmVkIGJ5IGFsbCBpbnRlcm5hbCBjbGllbnRzLgoKQ2hh
bmdlcyB0aGlzIHRpbWU6Ci0gSW1wcm92ZSBjb21taXQgbWVzc2FnZXMKCkFsbCBwYXRjaGVzIGhh
dmUgYmVlbiByZXZpZXdlZCBub3csIHRoYW5rcyBhbG90IGZvciByZXZpZXdpbmchCgpOb3JhbGYu
CgpOb3JhbGYgVHLDuG5uZXMgKDgpOgogIGRybS9hdG9taWM6IE1vdmUgX19kcm1fYXRvbWljX2hl
bHBlcl9kaXNhYmxlX3BsYW5lL3NldF9jb25maWcoKQogIGRybS9mYi1oZWxwZXI6IFJlbW92ZSBk
cm1fZmJfaGVscGVyX2NydGMKICBkcm0vZmItaGVscGVyOiBQcmVwYXJlIHRvIG1vdmUgb3V0IGNv
bW1pdCBjb2RlCiAgZHJtL2ZiLWhlbHBlcjogTW92ZSBvdXQgY29tbWl0IGNvZGUKICBkcm0vZmIt
aGVscGVyOiBSZW1vdmUgZHJtX2ZiX2hlbHBlcl9jb25uZWN0b3IKICBkcm0vZmItaGVscGVyOiBQ
cmVwYXJlIHRvIG1vdmUgb3V0IG1vZGVzZXQgY29uZmlnIGNvZGUKICBkcm0vZmItaGVscGVyOiBN
b3ZlIG91dCBtb2Rlc2V0IGNvbmZpZyBjb2RlCiAgZHJtL2NsaWVudDogSGFjazogQWRkIGJvb3Rz
cGxhc2ggZXhhbXBsZQoKIERvY3VtZW50YXRpb24vZ3B1L2RybS1jbGllbnQucnN0ICAgICB8ICAg
IDMgKwogRG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3QgICAgICAgICAgIHwgICAgNyArCiBkcml2
ZXJzL2dwdS9kcm0vS2NvbmZpZyAgICAgICAgICAgICAgfCAgICA1ICsKIGRyaXZlcnMvZ3B1L2Ry
bS9NYWtlZmlsZSAgICAgICAgICAgICB8ICAgIDMgKy0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fYXRv
bWljLmMgICAgICAgICB8ICAxNjggKysrKwogZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfaGVs
cGVyLmMgIHwgIDE2NCAtLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2Jvb3RzcGxhc2guYyAgICAg
fCAgMzU4ICsrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50LmMgICAgICAgICB8ICAg
MTcgKy0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50X21vZGVzZXQuYyB8IDEwODYgKysrKysr
KysrKysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2NydGNfaW50ZXJuYWwuaCAgfCAg
ICA1ICsKIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHJ2LmMgICAgICAgICAgICB8ICAgIDQgKwogZHJp
dmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYyAgICAgIHwgMTMwNSArKy0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQogaW5jbHVkZS9kcm0vZHJtX2F0b21pY19oZWxwZXIuaCAgICAgIHwgICAgNCAt
CiBpbmNsdWRlL2RybS9kcm1fY2xpZW50LmggICAgICAgICAgICAgfCAgIDQ5ICsKIGluY2x1ZGUv
ZHJtL2RybV9mYl9oZWxwZXIuaCAgICAgICAgICB8ICAgOTIgKy0KIDE1IGZpbGVzIGNoYW5nZWQs
IDE4MDAgaW5zZXJ0aW9ucygrKSwgMTQ3MCBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBkcml2ZXJzL2dwdS9kcm0vZHJtX2Jvb3RzcGxhc2guYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGRy
aXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50X21vZGVzZXQuYwoKLS0gCjIuMjAuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
