Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE4EE2BD2
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 10:14:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70CFF6E16D;
	Thu, 24 Oct 2019 08:14:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CAB66E17C
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 08:14:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9F049B5F3;
 Thu, 24 Oct 2019 08:14:21 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, airlied@linux.ie, daniel@ffwll.ch,
 z.liuxinliang@hisilicon.com, zourongrong@gmail.com,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 hdegoede@redhat.com, sam@ravnborg.org
Subject: [PATCH v2 0/4] drm/vram: Provide helpers for prepare_fb() and
 cleanup_fb()
Date: Thu, 24 Oct 2019 10:14:00 +0200
Message-Id: <20191024081404.6978-1-tzimmermann@suse.de>
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

VGhlIGltcGxlbWVudGF0aW9uIG9mIHRoZSBwbGFuZSdzIGNhbGwtYmFjayBmdW5jdGlvbnMgcHJl
cGFyZV9mYigpIGFuZApjbGVhbnVwX2ZiKCkgZm9yIEdFTSBWUkFNIGhlbHBlcnMgYXJlIHNoYXJh
YmxlIGFtb25nIGRyaXZlcnMuCgpQYXRjaCAjMyBhbHNvIGZpeGVzIHR3byBidWdzIHRoYXQgaGF2
ZSBiZWVuIHByZXNlbnQgaW4gaGlibWMgc2luY2UgaXQgd2FzCmZpcnN0IGFkZGVkLiBUaGUgcHJp
bWFyeSBwbGFuZSdzIGF0b21pY191cGRhdGUoKSBpcyBub3QgcmVzcG9uc2libGUgZm9yCnBpbm5p
bmcgQk9zLiBBbmQgaXQgbmV2ZXIgdW5waW5uZWQgdW51c2VkIEJPcy4gVlJBTSBpcyBiZWluZyBl
eGF1c3RlZApvdmVyIHRpbWUuCgpUaGUgbmV3IGhlbHBlcnMgaGF2ZSBiZWVuIHRlc3RlZCB0byB3
b3JrLgoKdjI6CgkqIHByb3ZpZGUgaGVscGVycyBmb3Igc3RydWN0IGRybV9zaW1wbGVfZGlzcGxh
eV9waXBlX2Z1bmNzLCBhbmQuLi4KCSogLi4udXNlIHRoZW0gaW4gYm9jaHMKClRob21hcyBaaW1t
ZXJtYW5uICg0KToKICBkcm0vdnJhbS1oZWxwZXJzOiBBZGQgaGVscGVycyBmb3IgcHJlcGFyZV9m
YigpIGFuZCBjbGVhbnVwX2ZiKCkKICBkcm0vYm9jaHM6IFJlcGxhY2UgcHJlcGFyZV9mYigpL2Ns
ZWFudXBfZmIoKSB3aXRoIEdFTSBWUkFNIGhlbHBlcnMKICBkcm0vaGlzaWxpY29uL2hpYm1jOiBV
c2UgR0VNIFZSQU0ncyBwcmVwYXJlX2ZiKCkgYW5kIGNsZWFudXBfZmIoKQogICAgaGVscGVycwog
IGRybS92Ym94dmlkZW86IFJlcGxhY2UgcHJlcGFyZV9mYigpL2NsZWFudXBfZmIoKSB3aXRoIEdF
TSBWUkFNIGhlbHBlcnMKCiBkcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNfa21zLmMgICAgICAg
ICAgICAgfCAgMjYgKy0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuYyAg
ICAgICAgIHwgMTI2ICsrKysrKysrKysrKysrKysrKwogLi4uL2dwdS9kcm0vaGlzaWxpY29uL2hp
Ym1jL2hpYm1jX2RybV9kZS5jICAgIHwgIDE0ICstCiBkcml2ZXJzL2dwdS9kcm0vdmJveHZpZGVv
L3Zib3hfbW9kZS5jICAgICAgICAgfCAgNjEgKy0tLS0tLS0tCiBpbmNsdWRlL2RybS9kcm1fZ2Vt
X3ZyYW1faGVscGVyLmggICAgICAgICAgICAgfCAgMjUgKysrKwogNSBmaWxlcyBjaGFuZ2VkLCAx
NjEgaW5zZXJ0aW9ucygrKSwgOTEgZGVsZXRpb25zKC0pCgotLQoyLjIzLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
