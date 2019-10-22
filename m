Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9330E0201
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 12:25:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D191E6E5AB;
	Tue, 22 Oct 2019 10:25:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61EAC6E59D
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 10:25:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D438DB11A;
 Tue, 22 Oct 2019 10:25:25 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, noralf@tronnes.org, sam@ravnborg.org, daniel@ffwll.ch,
 airlied@linux.ie, joel@jms.id.au, andrew@aj.id.au,
 z.liuxinliang@hisilicon.com, zourongrong@gmail.com,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 linus.walleij@linaro.org, marex@denx.de, stefan@agner.ch,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, eric@anholt.net,
 david@lechnology.com, hdegoede@redhat.com,
 oleksandr_andrushchenko@epam.com, liviu.dudau@arm.com, ck.hu@mediatek.com
Subject: [PATCH 0/5] drm/vram: Provide helpers for prepare_fb() and
 cleanup_fb()
Date: Tue, 22 Oct 2019 12:25:15 +0200
Message-Id: <20191022102520.13181-1-tzimmermann@suse.de>
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
YmxlIGFtb25nIGRyaXZlcnMuCgpUaGUgZmlyc3QgcGF0Y2ggYWRhcHRzIHRoZSB0aGUgaW50ZXJm
YWNlIG9mIHNpbXBsZSBLU00gaGVscGVycyBzdWNoIHRoYXQKYm9jaHMgY2FuIGJlbmVmaXQgZnJv
bSB0aGUgc2hhcmVkIGNvZGUuIFdlIGFkZCB0aGUgaGVscGVyIGZ1bmN0aW9ucyBpbgpwYXRjaCAj
Mi4gUGF0Y2hlcyAjMyB0byAjNSBjb3ZlcnQgc2V2ZXJhbCBkcml2ZXJzIHRvIHRoZSBuZXcgaGVs
cGVycy4KClBhdGNoICM0IGFsc28gZml4ZXMgdHdvIGJ1Z3MgdGhhdCBoYXZlIGJlZW4gcHJlc2Vu
dCBpbiBoaWJtYyBzaW5jZSBpdCB3YXMKZmlyc3QgYWRkZWQuIFRoZSBwcmltYXJ5IHBsYW5lJ3Mg
YXRvbWljX3VwZGF0ZSgpIGlzIG5vdCByZXNwb25zaWJsZSBmb3IKcGlubmluZyBCT3MuIEFuZCBp
dCBuZXZlciB1bnBpbm5lZCB1bnVzZWQgQk9zLiBWUkFNIGlzIGJlaW5nIGV4YXVzdGVkCm92ZXIg
dGltZS4KClRoZSBuZXcgaGVscGVycyBoYXZlIGJlZW4gdGVzdGVkIHRvIHdvcmsuIFRoZSBkcml2
ZXJzIGFmZmVjdGVkIGJ5IHRoZQppbnRlcmZhY2UgY2hhbmdlIGhhdmUgYmVlbiBjb21waWxlZCBh
dCBsZWFzdC4KClRob21hcyBaaW1tZXJtYW5uICg1KToKICBkcm0vc2ltcGxlLWttcy1oZWxwZXI6
IFBhc3MgcGxhbmUgdG8gcHJlcGFyZV9mYigpIGFuZCBjbGVhbnVwX2ZiKCkKICBkcm0vdnJhbS1o
ZWxwZXJzOiBBZGQgaGVscGVycyBmb3Igc3RydWN0IGRybV9wbGFuZV9oZWxwZXJfZnVuY3MKICBk
cm0vYm9jaHM6IFJlcGxhY2UgcHJlcGFyZV9mYigpL2NsZWFudXBfZmIoKSB3aXRoIEdFTSBWUkFN
IGhlbHBlcnMKICBkcm0vaGlzaWxpY29uL2hpYm1jOiBVc2UgR0VNIFZSQU0ncyBwcmVwYXJlX2Zi
KCkgYW5kIGNsZWFudXBfZmIoKQogICAgaGVscGVycwogIGRybS92Ym94dmlkZW86IFJlcGxhY2Ug
cHJlcGFyZV9mYigpL2NsZWFudXBfZmIoKSB3aXRoIEdFTSBWUkFNIGhlbHBlcnMKCiBkcml2ZXJz
L2dwdS9kcm0vYXNwZWVkL2FzcGVlZF9nZnhfY3J0Yy5jICAgICAgfCAgMiArLQogZHJpdmVycy9n
cHUvZHJtL2JvY2hzL2JvY2hzX2ttcy5jICAgICAgICAgICAgIHwgMjYgKy0tLS0tCiBkcml2ZXJz
L2dwdS9kcm0vZHJtX2dlbV9mcmFtZWJ1ZmZlcl9oZWxwZXIuYyAgfCAyMiAtLS0tLQogZHJpdmVy
cy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuYyAgICAgICAgIHwgODEgKysrKysrKysrKysr
KysrKysrKwogZHJpdmVycy9ncHUvZHJtL2RybV9zaW1wbGVfa21zX2hlbHBlci5jICAgICAgIHwg
IDQgKy0KIC4uLi9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJtY19kcm1fZGUuYyAgICB8IDE0
ICstLS0KIGRyaXZlcnMvZ3B1L2RybS9tY2RlL21jZGVfZGlzcGxheS5jICAgICAgICAgICB8ICAy
ICstCiBkcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfZHJ2LmMgICAgICAgICAgICAgfCAgMiAr
LQogZHJpdmVycy9ncHUvZHJtL3BsMTExL3BsMTExX2Rpc3BsYXkuYyAgICAgICAgIHwgIDIgKy0K
IGRyaXZlcnMvZ3B1L2RybS90aW55L2h4ODM1N2QuYyAgICAgICAgICAgICAgICB8ICAyICstCiBk
cml2ZXJzL2dwdS9kcm0vdGlueS9pbGk5MjI1LmMgICAgICAgICAgICAgICAgfCAgMiArLQogZHJp
dmVycy9ncHUvZHJtL3RpbnkvaWxpOTM0MS5jICAgICAgICAgICAgICAgIHwgIDIgKy0KIGRyaXZl
cnMvZ3B1L2RybS90aW55L21pMDI4M3F0LmMgICAgICAgICAgICAgICB8ICAyICstCiBkcml2ZXJz
L2dwdS9kcm0vdGlueS9yZXBhcGVyLmMgICAgICAgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9n
cHUvZHJtL3Rpbnkvc3Q3NTg2LmMgICAgICAgICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvZ3B1
L2RybS90aW55L3N0NzczNXIuYyAgICAgICAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL2dwdS9k
cm0vdHZlMjAwL3R2ZTIwMF9kaXNwbGF5LmMgICAgICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJt
L3Zib3h2aWRlby92Ym94X21vZGUuYyAgICAgICAgIHwgNjEgKy0tLS0tLS0tLS0tLS0KIGRyaXZl
cnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9rbXMuYyAgICAgICB8ICAyICstCiBpbmNsdWRl
L2RybS9kcm1fZ2VtX2ZyYW1lYnVmZmVyX2hlbHBlci5oICAgICAgfCAgNCArLQogaW5jbHVkZS9k
cm0vZHJtX2dlbV92cmFtX2hlbHBlci5oICAgICAgICAgICAgIHwgMTIgKysrCiBpbmNsdWRlL2Ry
bS9kcm1fcGxhbmUuaCAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQogaW5jbHVkZS9kcm0v
ZHJtX3NpbXBsZV9rbXNfaGVscGVyLmggICAgICAgICAgIHwgIDYgKy0KIDIzIGZpbGVzIGNoYW5n
ZWQsIDEyMyBpbnNlcnRpb25zKCspLCAxMzUgZGVsZXRpb25zKC0pCgotLQoyLjIzLjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
