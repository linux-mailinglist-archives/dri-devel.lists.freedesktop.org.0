Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A2DF9166
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 15:04:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2B0D6E441;
	Tue, 12 Nov 2019 14:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96E1D6E441
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 14:04:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C1B86B166;
 Tue, 12 Nov 2019 14:04:33 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, sean@poorly.run, daniel@ffwll.ch,
 b.zolnierkie@samsung.com, noralf@tronnes.org, kraxel@redhat.com,
 sam@ravnborg.org, emil.velikov@collabora.com
Subject: [PATCH v3 0/5] drm/udl: Replace fbdev by generic emulation
Date: Tue, 12 Nov 2019 15:04:26 +0100
Message-Id: <20191112140431.7895-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHVkbCBkcml2ZXIgY2FuIHVzZSB0aGUgZ2VuZXJpYyBmYmRldiBlbXVsYXRpb24uIEFmdGVy
IGNvbnZlcnNpb24sCmEgbnVtYmVyIG9mIGNsZWFudXBzIGNhbiBiZSBhcHBsaWVkLgoKUGF0Y2gg
MSBwcmVwYXJlcyB0aGUgcHJlZmVyZWQgZGVmYXVsdHMuIDMyIGJwcCB3b3JrIHdlbGwgd2l0aCBk
cml2ZXIsCmNvbnNvbGUgYW5kIFgxMS4gVGhlIGZiZGV2IGNvbnZlcnNpb24gaXMgaW4gcGF0Y2gg
Mi4gVGhlIG9yaWdpbmFsIGZiZGV2CmNvZGUgaW4gdWRsIG1hcHBlZCB0aGUgZnJhbWVidWZmZXIn
cyBHRU0gb2JqZWN0IG1lbW9yeSB1bmNvbmRpdGlvbmFsbHksCmFuZCB1bm1hcHBlZCB0aGUgbWVt
b3J5IGluIHRoZSBvYmplY3QncyBmcmVlKCkgZnVuY3Rpb24uIFRoZSByZXNwZWN0aXZlCmNvZGUg
aW4gZnJlZSgpIGNhbiBub3cgYmUgcmVtb3ZlZCAoUGF0Y2ggMykuIEFuZCBhcyB1ZGwgd2FzIHRo
ZQpvbmx5IHJlbWFpbmluZyBleHRlcm5hbCB1c2VyIG9mIHVubGlua19mcmFtZWJ1ZmZlcigpLCB0
aGF0IGZ1bmN0aW9uCm5vdyBiZWNvbWVzIGFuIGludGVybmFsIGludGVyZmFjZSBvZiB0aGUgZmJk
ZXYgY29kZSAoUGF0Y2hlcyA0ICsgNSkuCgpUaGUgcGF0Y2hzZXQgaGFzIGJlZW4gdGVzdGVkIGJ5
IHJ1bm5pbmcgdGhlIGNvbnNvbGUsIFgxMSBhbmQgV2VzdG9uCm9uIGEgRGlzcGxheUxpbmsgYWRh
cHRlci4KCnYzOgoJKiB1c2UgMzIgYnBwIGJ5IGRlZmF1bHQKCSogdXNlIGRlZmF1bHRzIGZvciBz
ZXZlcmFsIGNhbGxiYWNrIGZ1bmN0aW9ucwoJKiByZW1vdmUgYWxsIGZiIG1vZHVsZSBwYXJhbWV0
ZXJzCgkqIHJlbW92ZSB1ZGxfZmJkZXZfaW5pdCgpCnYyOgoJKiBjb252ZXJ0ZWQgdWRsIHRvIFNI
TUVNIGFuZCByZWNyZWF0ZWQgZmJkZXYgcGF0Y2hzZXQgb24gdG9wCgpUaG9tYXMgWmltbWVybWFu
biAoNSk6CiAgZHJtL3VkbDogU2V0IGRlZmF1bHQgY29sb3IgZGVwdGggdG8gMzIgYnBwCiAgZHJt
L3VkbDogUmVwbGFjZSBmYmRldiBjb2RlIHdpdGggZ2VuZXJpYyBlbXVsYXRpb24KICBkcm0vdWRs
OiBSZW1vdmUgdWRsIGltcGxlbWVudGF0aW9uIG9mIEdFTSdzIGZyZWVfb2JqZWN0KCkKICBkcm0v
ZmItaGVscGVyOiBSZW1vdmUgZHJtX2ZiX2hlbHBlcl91bmxpbmtfZmJpKCkKICBmYmRldjogVW5l
eHBvcnQgdW5saW5rX2ZyYW1lYnVmZmVyKCkKCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBl
ci5jICAgfCAgMTYgKy0KIGRyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2Rydi5jICAgICB8ICAgMSAt
CiBkcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9kcnYuaCAgICAgfCAgIDYgLQogZHJpdmVycy9ncHUv
ZHJtL3VkbC91ZGxfZmIuYyAgICAgIHwgMjgyIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQogZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZ2VtLmMgICAgIHwgIDE4ICstCiBkcml2ZXJzL2dw
dS9kcm0vdWRsL3VkbF9tYWluLmMgICAgfCAgIDUgKy0KIGRyaXZlcnMvZ3B1L2RybS91ZGwvdWRs
X21vZGVzZXQuYyB8ICAgMyArLQogZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZibWVtLmMgIHwg
ICAzICstCiBpbmNsdWRlL2RybS9kcm1fZmJfaGVscGVyLmggICAgICAgfCAgIDYgLQogaW5jbHVk
ZS9saW51eC9mYi5oICAgICAgICAgICAgICAgIHwgICAxIC0KIDEwIGZpbGVzIGNoYW5nZWQsIDYg
aW5zZXJ0aW9ucygrKSwgMzM1IGRlbGV0aW9ucygtKQoKLS0KMi4yMy4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
