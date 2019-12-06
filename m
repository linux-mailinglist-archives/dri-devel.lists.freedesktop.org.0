Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E5C115096
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 13:47:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D826FA02;
	Fri,  6 Dec 2019 12:47:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 111106F9F4
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2019 12:47:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6718DB3F4;
 Fri,  6 Dec 2019 12:47:16 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org, kraxel@redhat.com,
 emil.velikov@collabora.com, noralf@tronnes.org, zboszor@pr.hu
Subject: [PATCH v2 0/9] drm/udl: Convert to simple-pipe helpers and clean up
Date: Fri,  6 Dec 2019 13:47:04 +0100
Message-Id: <20191206124713.5748-1-tzimmermann@suse.de>
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

V2l0aCBvbmx5IGEgc2luZ2xlIGRpc3BsYXkgcGlwZWxpbmUgYW5kIHByaW1hcnkgcGxhbmUsIHVk
bCBpcyBwZXJmZWN0CmZvciBzaW1wbGUtcGlwZSBoZWxwZXJzLiBQYXRjaGVzIDEgdG8gNCBkbyB0
aGUgY29udmVydGlvbi4gVGhpcyBlbmFibGVzCmF0b21pYyBtb2Rlc2V0dGluZyBmb3IgdWRsIGRl
dmljZXMuCgpQYXRjaGVzIDUgdG8gOCBjbGVhbiB1cCBoYW5kbGluZyBvZiBjb2xvciBkZXB0aCBh
bmQgZnJhbWVidWZmZXJzLiBXaXRoCnVuaXZlcnNhbCBwbGFuZXMgdGhhdCBjb21lIHdpdGggc2lt
cGxlIHBpcGUsIGRpc3BsYXkgdXBkYXRlcyBjYW4gYmUKaW1wbGVtZW50ZWQgd2l0aCBEUk0ncyBk
YW1hZ2UgaGFuZGxlcnMuIFRoZSBwcmltYXJ5IHBsYW5lJ3MgZm9ybWF0cwphcnJheSBhbGxvd3Mg
dG8gZXhwb3J0IHRoZSBjb3JyZWN0IHByZWZlcnJlZCBjb2xvciBkZXB0aC4gVGhlIG9yaWdpbmFs
CnZhbHVlIHdhcyBjaG9vc2VuIGZvciBtYXhpbXVtIGNvbXBhdGliaWxpdHksIGJ1dCBkaWQgbm90
IHJlcHJlc2VudCB0aGUKZGV2aWNlJ3MgY2FwYWJpbGl0eS4KClBhdGNoIDkgcmVtb3ZlcyB1ZGwn
cyByZW1haW5pbmcsIHVudXNlZCBmYiBjb2RlLgoKVGhlIHBhdGNoc2V0IGhhcyBiZWVuIHRlc3Rl
ZCBieSBydW5uaW5nIHRoZSBmYiBjb25zb2xlLCBYMTEgYW5kIFdlc3RvbgpvbiBhIERpc3BsYXlM
aW5rIGFkYXB0ZXIuCgp2MjoKCSogcmViYXNlZCBvbiB0aGUgcmVjZW50IHVkbCBkYW1hZ2UtaGFu
ZGxlciBwYXRjaHNldAoJKiBtb3ZlZCBhdG9taWMgc3VzcGVuZC9yZXN1bWUgY29udmVyc2lvbiBp
bnRvIHNlcGFyYXRlIHBhdGNoCgkqIGRvbid0IGNhbGwgZHJtX2Nvbm5lY3Rvcl97cmVnaXN0ZXIs
dW5yZWdpc3Rlcn0oKQoKVGhvbWFzIFppbW1lcm1hbm4gKDkpOgogIGRybS91ZGw6IEluaXQgY29u
bmVjdG9yIGJlZm9yZSBlbmNvZGVyIGFuZCBDUlRDCiAgZHJtL3VkbDogQ29udmVydCB0byBzdHJ1
Y3QgZHJtX3NpbXBsZV9kaXNwbGF5X3BpcGUKICBkcm0vdWRsOiBTd2l0Y2ggdG8gYXRvbWljIHN1
c3BlbmQvcmVzdW1lIGhlbHBlcnMKICBkcm0vdWRsOiBJbmxpbmUgRFBNUyBjb2RlIGludG8gQ1JU
QyBlbmFibGUgYW5kIGRpc2FibGUgZnVuY3Rpb25zCiAgZHJtL3VkbDogU2V0IHByZWZlcnJlZCBj
b2xvciBkZXB0aCB0byAxNiBicHAKICBkcm0vdWRsOiBDb252ZXJ0IHRvIGRybV9hdG9taWNfaGVs
cGVyX2RpcnR5ZmIoKQogIGRybS91ZGw6IFJlbW92ZSBzdHJ1Y3QgdWRsX2RldmljZS5hY3RpdmVf
ZmJfMTYKICBkcm0vdWRsOiBNb3ZlIHVkbF9oYW5kbGVfZGFtYWdlKCkgaW50byB1ZGxfbW9kZXNl
dC5jCiAgZHJtL3VkbDogUmVtb3ZlIHVkbF9mYi5jCgogZHJpdmVycy9ncHUvZHJtL3VkbC9NYWtl
ZmlsZSAgICAgICAgfCAgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2Nvbm5lY3Rvci5j
IHwgIDIxICstCiBkcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9kcnYuYyAgICAgICB8ICAxMSArLQog
ZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZHJ2LmggICAgICAgfCAgMTkgKy0KIGRyaXZlcnMvZ3B1
L2RybS91ZGwvdWRsX2VuY29kZXIuYyAgIHwgIDcwIC0tLS0tLQogZHJpdmVycy9ncHUvZHJtL3Vk
bC91ZGxfZmIuYyAgICAgICAgfCAyMjIgLS0tLS0tLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2Ry
bS91ZGwvdWRsX21haW4uYyAgICAgIHwgICAzIC0KIGRyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX21v
ZGVzZXQuYyAgIHwgMzYzICsrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0KIDggZmlsZXMgY2hh
bmdlZCwgMjMwIGluc2VydGlvbnMoKyksIDQ4MSBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9lbmNvZGVyLmMKIGRlbGV0ZSBtb2RlIDEwMDY0
NCBkcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9mYi5jCgotLQoyLjIzLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
