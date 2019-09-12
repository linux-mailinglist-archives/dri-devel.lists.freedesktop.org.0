Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B98B08F7
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 08:42:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36D676EB57;
	Thu, 12 Sep 2019 06:42:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 816EC6EB59
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 06:42:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id ADE72AE5E;
 Thu, 12 Sep 2019 06:42:36 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@redhat.com, noralf@tronnes.org,
 rong.a.chen@intel.com, feng.tang@intel.com, ying.huang@intel.com,
 kraxel@redhat.com, ville.syrjala@linux.intel.com
Subject: [PATCH v2 0/3] Rate-limit shadow-FB-to-console-update to screen
 refresh
Date: Thu, 12 Sep 2019 08:42:27 +0200
Message-Id: <20190912064230.27972-1-tzimmermann@suse.de>
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
bGVtIHdhcyBmaXJzdApyZXBvcnRlZCB3aXRoIE1hdHJveCBoYXJkd2FyZS4KCnYyOgoJKiByZW1v
dmUgbG9ja2luZyBmcm9tIGZiZGV2IHBhdGNoCgkqIHVzZSBjb25zdGFudHMgZnJvIG1nYWcyMDAg
cmVnaXN0ZXIgbmFtZXMgYW5kIGZpZWxkcwoJKiBkb3VibGUtY2hlY2sgdGhhdCBWTElORSBpcnEg
aXMgYWN0aXZlIG9uIG1nYWcyMDAKCSogb25seSBzaWduYWwgdmJsYW5rIG9uIENSVEMgMCBvZiBt
Z2FnMjAwCgkqIGNvZGluZy1zdHlsZSBmaXhlcwoKWzFdIGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL2FyY2hpdmVzL2RyaS1kZXZlbC8yMDE5LUp1bHkvMjI4NjYzLmh0bWwKClRob21hcyBa
aW1tZXJtYW5uICgzKToKICBkcm0vZmItaGVscGVyOiBTeW5jaHJvbml6ZSBkaXJ0eSB3b3JrZXIg
d2l0aCB2YmxhbmsKICBkcm0vbWdhZzIwMDogUmVuYW1lIGNvbnN0YW50IE1HQVJFR19TdGF0dXMg
dG8gTUdBUkVHX1NUQVRVUwogIGRybS9tZ2FnMjAwOiBBZGQgdmJsYW5rIHN1cHBvcnQKCiBkcml2
ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jICAgICAgICB8IDEwICsrKysrCiBkcml2ZXJzL2dw
dS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2Rydi5jICB8ICAxICsKIGRyaXZlcnMvZ3B1L2RybS9tZ2Fn
MjAwL21nYWcyMDBfZHJ2LmggIHwgIDEgKwogZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIw
MF9tYWluLmMgfCA0MCArKysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vbWdhZzIw
MC9tZ2FnMjAwX21vZGUuYyB8IDUzICsrKysrKysrKysrKysrKysrKysrKystLS0tCiBkcml2ZXJz
L2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX3JlZy5oICB8ICA3ICsrKy0KIDYgZmlsZXMgY2hhbmdl
ZCwgMTA0IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgotLQoyLjIzLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
