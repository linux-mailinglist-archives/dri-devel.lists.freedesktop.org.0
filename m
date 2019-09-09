Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4DAADABA
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 16:06:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B968A89C68;
	Mon,  9 Sep 2019 14:06:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA0BC89C80
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2019 14:06:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4599CAE8B;
 Mon,  9 Sep 2019 14:06:36 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@redhat.com, noralf@tronnes.org,
 rong.a.chen@intel.com, feng.tang@intel.com, ying.huang@intel.com
Subject: [PATCH 0/2] Rate-limit shadow-FB-to-console-update to screen refresh
Date: Mon,  9 Sep 2019 16:06:31 +0200
Message-Id: <20190909140633.31260-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QSBmdWxsLXNjcmVlbiBtZW1jcHkoKSBtb3ZlcyB0aGUgY29uc29sZSdzIHNoYWRvdyBidWZmZXIg
dG8gaGFyZHdhcmU7IHdpdGgKcG9zc2libHkgc2lnbmlmaWNhbnQgcnVudGltZSBvdmVyaGVhZC4g
WzFdCgpUaGUgY29uc29sZSdzIGRpcnR5IHdvcmtlciBub3cgd2FpdHMgZm9yIHRoZSB2Ymxhbmsg
dG8gcmF0ZSBsaW1pdCB0aGUKb3V0cHV0IGZyZXF1ZW5jeS4gU2NyZWVuIG91dHB1dCBjYW4gcGls
ZSB1cCB3aGlsZSB3YWl0aW5nIGFuZCB0aGVyZSdzIGEKY2hhbmNlIHRoYXQgbXVsdGlwbGUgc2Ny
ZWVuIHVwZGF0ZXMgY2FuIGJlIGhhbmRsZWQgd2l0aCBhIHNpbmdsZSBtZW1jcHkoKS4KTm90ZSB0
aGF0IHRoaXMgaGFzIG5vIGVmZmVjdCBvbiB0ZWFyaW5nOiB3aGlsZSB0aGUgZGlydHkgd29ya2Vy
IHVwZGF0ZXMKdGhlIGhhcmR3YXJlIGJ1ZmZlciwgbmV3IGRhdGEgY2FuIHN0aWxsIGFycml2ZSBp
biB0aGUgc2hhZG93IGJ1ZmZlci4gVGhpcwpjYW4gY3JlYXRlIGEgdGVhcmluZyBlZmZjZXQsIGV2
ZW4gdGhvdWdoIGNvbnNvbGUgb3V0cHV0IGlzIHN5bmNocm9uaXplZAp0byB2YmxhbmsuCgpUaGUg
cGF0Y2hzZXQgYWRkcyB2Ymxhbmsgc3VwcG9ydCB0byBtZ2FnMjAwLCBiZWNhdXNlIHRoZSBwcm9i
bGVtIHdhcyBmaXJzdApyZXBvcnRlZCB3aXRoIE1hdHJveCBoYXJkd2FyZS4KClsxXSBodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9kcmktZGV2ZWwvMjAxOS1KdWx5LzIyODY2
My5odG1sCgpUaG9tYXMgWmltbWVybWFubiAoMik6CiAgZHJtL2ZiLWhlbHBlcjogU3luY2hyb25p
emUgZGlydHkgd29ya2VyIHdpdGggdmJsYW5rCiAgZHJtL21nYWcyMDA6IEFkZCB2Ymxhbmsgc3Vw
cG9ydAoKIGRyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMgICAgICAgIHwgMTIgKysrKysr
KysKIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZHJ2LmMgIHwgIDEgKwogZHJpdmVy
cy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9kcnYuaCAgfCAgMSArCiBkcml2ZXJzL2dwdS9kcm0v
bWdhZzIwMC9tZ2FnMjAwX21haW4uYyB8IDMzICsrKysrKysrKysrKysrKysrKysrCiBkcml2ZXJz
L2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX21vZGUuYyB8IDQyICsrKysrKysrKysrKysrKysrKysr
KysrLS0tCiA1IGZpbGVzIGNoYW5nZWQsIDg1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
CgotLQoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
