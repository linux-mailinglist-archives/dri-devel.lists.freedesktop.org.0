Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 863245E204
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 12:28:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D8DD6E10A;
	Wed,  3 Jul 2019 10:28:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1382D6E10A
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 10:28:07 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1hicUd-00027T-2A; Wed, 03 Jul 2019 12:28:03 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Subject: [PATCH] drm/scheduler: put killed job cleanup to worker
Date: Wed,  3 Jul 2019 12:28:02 +0200
Message-Id: <20190703102802.17004-1-l.stach@pengutronix.de>
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

ZHJtX3NjaGVkX2VudGl0eV9raWxsX2pvYnNfY2IoKSBpcyBjYWxsZWQgcmlnaHQgZnJvbSB0aGUg
bGFzdCBzY2hlZHVsZWQKam9iIGZpbmlzaGVkIGZlbmNlIHNpZ25hbGluZy4gQXMgdGhpcyBtaWdo
dCBoYXBwZW4gZnJvbSBJUlEgY29udGV4dCB3ZQpub3cgZW5kIHVwIGNhbGxpbmcgdGhlIEdQVSBk
cml2ZXIgZnJlZV9qb2IgY2FsbGJhY2sgaW4gSVJRIGNvbnRleHQsIHdoaWxlCmFsbCBvdGhlciBw
YXRocyBjYWxsIGl0IGZyb20gbm9ybWFsIHByb2Nlc3MgY29udGV4dC4KCkV0bmF2aXYgaW4gcGFy
dGljdWxhciBjYWxscyBjb3JlIGtlcm5lbCBmdW5jdGlvbnMgdGhhdCBhcmUgb25seSB2YWxpZCB0
bwpiZSBjYWxsZWQgZnJvbSBwcm9jZXNzIGNvbnRleHQgd2hlbiBmcmVlaW5nIHRoZSBqb2IuIE90
aGVyIGRyaXZlcnMgbWlnaHQKaGF2ZSBzaW1pbGFyIGlzc3VlcywgYnV0IEkgZGlkIG5vdCB2YWxp
ZGF0ZSB0aGlzLiBGaXggdGhpcyBieSBwdW50aW5nCnRoZSBjbGVhbnVwIHdvcmsgaW50byBhIHdv
cmsgaXRlbSwgc28gdGhlIGRyaXZlciBleHBlY3RhdGlvbnMgYXJlIG1ldC4KClNpZ25lZC1vZmYt
Ynk6IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4LmRlPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9zY2hlZHVsZXIvc2NoZWRfZW50aXR5LmMgfCAyOCArKysrKysrKysrKysrKy0tLS0tLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX2VudGl0eS5jIGIvZHJp
dmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9lbnRpdHkuYwppbmRleCAzNWRkYmVjMTM3NWEu
LmJhNGViNjY3ODRiOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hl
ZF9lbnRpdHkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX2VudGl0eS5j
CkBAIC0yMDIsMjMgKzIwMiwyMyBAQCBsb25nIGRybV9zY2hlZF9lbnRpdHlfZmx1c2goc3RydWN0
IGRybV9zY2hlZF9lbnRpdHkgKmVudGl0eSwgbG9uZyB0aW1lb3V0KQogfQogRVhQT1JUX1NZTUJP
TChkcm1fc2NoZWRfZW50aXR5X2ZsdXNoKTsKIAotLyoqCi0gKiBkcm1fc2NoZWRfZW50aXR5X2tp
bGxfam9icyAtIGhlbHBlciBmb3IgZHJtX3NjaGVkX2VudGl0eV9raWxsX2pvYnMKLSAqCi0gKiBA
Zjogc2lnbmFsZWQgZmVuY2UKLSAqIEBjYjogb3VyIGNhbGxiYWNrIHN0cnVjdHVyZQotICoKLSAq
IFNpZ25hbCB0aGUgc2NoZWR1bGVyIGZpbmlzaGVkIGZlbmNlIHdoZW4gdGhlIGVudGl0eSBpbiBx
dWVzdGlvbiBpcyBraWxsZWQuCi0gKi8KK3N0YXRpYyB2b2lkIGRybV9zY2hlZF9lbnRpdHlfa2ls
bF93b3JrKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKK3sKKwlzdHJ1Y3QgZHJtX3NjaGVkX2pv
YiAqam9iID0gY29udGFpbmVyX29mKHdvcmssIHN0cnVjdCBkcm1fc2NoZWRfam9iLAorCQkJCQkJ
IGZpbmlzaF93b3JrKTsKKworCWRybV9zY2hlZF9mZW5jZV9maW5pc2hlZChqb2ItPnNfZmVuY2Up
OworCVdBUk5fT04oam9iLT5zX2ZlbmNlLT5wYXJlbnQpOworCWpvYi0+c2NoZWQtPm9wcy0+ZnJl
ZV9qb2Ioam9iKTsKK30KKwogc3RhdGljIHZvaWQgZHJtX3NjaGVkX2VudGl0eV9raWxsX2pvYnNf
Y2Ioc3RydWN0IGRtYV9mZW5jZSAqZiwKIAkJCQkJICBzdHJ1Y3QgZG1hX2ZlbmNlX2NiICpjYikK
IHsKIAlzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqam9iID0gY29udGFpbmVyX29mKGNiLCBzdHJ1Y3Qg
ZHJtX3NjaGVkX2pvYiwKIAkJCQkJCSBmaW5pc2hfY2IpOwogCi0JZHJtX3NjaGVkX2ZlbmNlX2Zp
bmlzaGVkKGpvYi0+c19mZW5jZSk7Ci0JV0FSTl9PTihqb2ItPnNfZmVuY2UtPnBhcmVudCk7Ci0J
am9iLT5zY2hlZC0+b3BzLT5mcmVlX2pvYihqb2IpOworCXNjaGVkdWxlX3dvcmsoJmpvYi0+Zmlu
aXNoX3dvcmspOwogfQogCiAvKioKQEAgLTI0MCw2ICsyNDAsMTIgQEAgc3RhdGljIHZvaWQgZHJt
X3NjaGVkX2VudGl0eV9raWxsX2pvYnMoc3RydWN0IGRybV9zY2hlZF9lbnRpdHkgKmVudGl0eSkK
IAkJZHJtX3NjaGVkX2ZlbmNlX3NjaGVkdWxlZChzX2ZlbmNlKTsKIAkJZG1hX2ZlbmNlX3NldF9l
cnJvcigmc19mZW5jZS0+ZmluaXNoZWQsIC1FU1JDSCk7CiAKKwkJLyoKKwkJICogUmVwbGFjZSBy
ZWd1bGFyIGZpbmlzaCB3b3JrIGZ1bmN0aW9uIHdpdGggb25lIHRoYXQganVzdAorCQkgKiBraWxs
cyB0aGUgam9iLgorCQkgKi8KKwkJam9iLT5maW5pc2hfd29yay5mdW5jID0gZHJtX3NjaGVkX2Vu
dGl0eV9raWxsX3dvcms7CisKIAkJLyoKIAkJICogV2hlbiBwaXBlIGlzIGhhbmdlZCBieSBvbGRl
ciBlbnRpdHksIG5ldyBlbnRpdHkgbWlnaHQKIAkJICogbm90IGV2ZW4gaGF2ZSBjaGFuY2UgdG8g
c3VibWl0IGl0J3MgZmlyc3Qgam9iIHRvIEhXCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
