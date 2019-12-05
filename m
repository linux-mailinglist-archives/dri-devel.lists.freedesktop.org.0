Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC88B114449
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 17:01:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6341D6E14F;
	Thu,  5 Dec 2019 16:01:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41DCF6E159
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 16:01:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 853C0ABC7;
 Thu,  5 Dec 2019 16:01:44 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@redhat.com, noralf@tronnes.org,
 rong.a.chen@intel.com, ying.huang@intel.com, ville.syrjala@linux.intel.com,
 sam@ravnborg.org, emil.velikov@collabora.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: [PATCH v3 0/4] Rate-limit shadow-FB-to-console-update to screen
 refresh
Date: Thu,  5 Dec 2019 17:01:38 +0100
Message-Id: <20191205160142.3588-1-tzimmermann@suse.de>
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
WzFdIFN5bmNocm9uaXppbmcgdGhlIHNjcmVlbiB1cGRhdGUKd2l0aCBWQkxBTksgZXZlbnRzIGNh
biBob3BlZnVsbHkgcmVkdWNlIHRoZSBudW1iZXIgb2Ygc2NyZWVuIHVwZGF0ZXMuCgpUaGUgcGF0
Y2hzZXQgZmlyc3QgYWRkcyB2Ymxhbmsgc3VwcG9ydCB0byBtZ2FnMjAwIGFzIHRoZSBwcm9ibGVt
IHdhcwppbml0aWFsbHkgcmVwb3J0ZWQgZm9yIE1hdHJveCBoYXJkd2FyZS4KClRoZSBjb25zb2xl
J3MgZGlydHkgd29ya2VyIG5vdyB3YWl0cyBmb3IgdGhlIHZibGFuayB0byByYXRlIGxpbWl0IHRo
ZQpvdXRwdXQgZnJlcXVlbmN5LiBTY3JlZW4gb3V0cHV0IGNhbiBwaWxlIHVwIHdoaWxlIHdhaXRp
bmcgYW5kIHRoZXJlJ3MgYQpjaGFuY2UgdGhhdCBtdWx0aXBsZSBzY3JlZW4gdXBkYXRlcyBjYW4g
YmUgaGFuZGxlZCB3aXRoIGEgc2luZ2xlIG1lbWNweSgpLgpOb3RlIHRoYXQgdGhpcyBoYXMgbm8g
ZWZmZWN0IG9uIHRlYXJpbmc6IHdoaWxlIHRoZSBkaXJ0eSB3b3JrZXIgdXBkYXRlcwp0aGUgaGFy
ZHdhcmUgYnVmZmVyLCBuZXcgZGF0YSBjYW4gc3RpbGwgYXJyaXZlIGluIHRoZSBzaGFkb3cgYnVm
ZmVyLiBUaGlzCmNhbiBjcmVhdGUgYSB0ZWFyaW5nIGVmZmNldCwgZXZlbiB0aG91Z2ggY29uc29s
ZSBvdXRwdXQgaXMgc3luY2hyb25pemVkCnRvIHZibGFuay4KCkluIHZlcnNpb24gMiBvZiB0aGlz
IHBhdGNoc2V0LCBmYmRldiBlbXVsYXRpb24gbWlzc2VkIHRoZSBmaXJzdCB2YmxhbmsKZXZlbnQg
YmVjYXVzZSBtZ2FnMjAwIGluaXRpYWxpemVkIHRoZSBmYmRldiBjb25zb2xlIGJlZm9yZSB0aGUg
aXJxLgpJbml0aWFsaXppbmcgZmJkZXYgbGFzdCBmaXhlcyB0aGlzIHByb2JsZW0uIElmIG90aGVy
IGRyaXZlcnMgbm93IHN0YXJ0CnJlcG9ydGluZyBhIG1pc3NlZCB2YmxhbmsgZHVyaW5nIGJvb3Qs
IHRoaXMgbWlnaHQgYmUgdGhlIHJlYXNvbi4KClRoZSBwYXRjaHNldCB3YXMgdGVzdGVkIGJ5IHJ1
bm5pbmcgZmJkZXYgZW11bGF0aW9uIGFuZCBHbm9tZSAoWDExKSBvbgptZ2FnMjAwIEhXLgoKdjM6
CgkqIGZiZGV2OiBob2xkIGhlbHBlci0+bXV0ZXgKCSogZmJkZXY6IGFjcXVpcmUgRFJNIG1hc3Rl
ciBzbyBvdGhlciBtYXN0ZXJzIGNhbm5vdCBpbnRlcmZlcmUKCSogbWdhZzIwMDogaW5pdCBmYmRl
diBhZnRlciBpcnEgYXZvaWRzIG1pc3NpbmcgZmlyc3QgdmJsYW5rCgkqIG1nYWcyMDA6IHRyaWdn
ZXIgaXJxIGF0IDx2ZGlzcGxheT4gKyAxIG1hdGNoZXMgdmJsYW5rCnYyOgoJKiByZW1vdmUgbG9j
a2luZyBmcm9tIGZiZGV2IHBhdGNoCgkqIHVzZSBjb25zdGFudHMgZm9yIG1nYWcyMDAgcmVnaXN0
ZXIgbmFtZXMgYW5kIGZpZWxkcwoJKiBkb3VibGUtY2hlY2sgdGhhdCBWTElORSBpcnEgaXMgYWN0
aXZlIG9uIG1nYWcyMDAKCSogb25seSBzaWduYWwgdmJsYW5rIG9uIENSVEMgMCBvZiBtZ2FnMjAw
CgkqIGNvZGluZy1zdHlsZSBmaXhlcwoKWzFdIGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L2FyY2hpdmVzL2RyaS1kZXZlbC8yMDE5LUp1bHkvMjI4NjYzLmh0bWwKClRob21hcyBaaW1tZXJt
YW5uICg0KToKICBkcm0vbWdhZzIwMDogQ3JlYXRlIGZiZGV2IGNvbnNvbGUgYWZ0ZXIgcmVnaXN0
ZXJpbmcgZGV2aWNlCiAgZHJtL21nYWcyMDA6IFJlbmFtZSBjb25zdGFudCBNR0FSRUdfU3RhdHVz
IHRvIE1HQVJFR19TVEFUVVMKICBkcm0vbWdhZzIwMDogQWRkIHZibGFuayBzdXBwb3J0CiAgZHJt
L2ZiLWhlbHBlcjogU3luY2hyb25pemUgZGlydHkgd29ya2VyIHdpdGggdmJsYW5rCgogZHJpdmVy
cy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYyAgICAgICAgfCAyMSArKysrKysrKysrCiBkcml2ZXJz
L2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2Rydi5jICB8ICA3ICsrKysKIGRyaXZlcnMvZ3B1L2Ry
bS9tZ2FnMjAwL21nYWcyMDBfZHJ2LmggIHwgIDEgKwogZHJpdmVycy9ncHUvZHJtL21nYWcyMDAv
bWdhZzIwMF9tYWluLmMgfCAzOCArKysrKysrKysrKysrKysrKy0KIGRyaXZlcnMvZ3B1L2RybS9t
Z2FnMjAwL21nYWcyMDBfbW9kZS5jIHwgNTQgKysrKysrKysrKysrKysrKysrKysrKy0tLS0KIGRy
aXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfcmVnLmggIHwgIDcgKysrLQogNiBmaWxlcyBj
aGFuZ2VkLCAxMTkgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCi0tCjIuMjMuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
