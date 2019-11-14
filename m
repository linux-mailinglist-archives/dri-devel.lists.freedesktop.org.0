Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55746FC86D
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 15:10:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CF006E9D3;
	Thu, 14 Nov 2019 14:10:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 218946E9D0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 14:10:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 53469AFE1;
 Thu, 14 Nov 2019 14:10:29 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, sean@poorly.run, daniel@ffwll.ch, kraxel@redhat.com,
 emil.velikov@collabora.com, sam@ravnborg.org, noralf@tronnes.org
Subject: [PATCH 0/5] drm/udl: Convert to GEM framebuffer helpers
Date: Thu, 14 Nov 2019 15:10:20 +0100
Message-Id: <20191114141025.32198-1-tzimmermann@suse.de>
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

VWRsIHVzZXMgc3RydWN0IHVkbF9mcmFtZWJ1ZmZlciBmb3IgcmVwcmVzZW50aW5nIGl0cyBmcmFt
ZWJ1ZmZlci4gVGhlCnR5cGUgY2FuIGJlIHJlcGxhY2VkIGJ5IHRoZSBzdGFuZGFyZCBEUk0gZnJh
bWVidWZmZXIgc3RydWN0dXJlLgoKUGF0Y2hlcyAxIHRvIDQgcHJlcGFyZSB0aGUgZHJpdmVyIGZv
ciB0aGUgY29udmVyc2lvbi4gUGF0Y2ggNSByZXBsYWNlcwp0aGUgc3RydWN0dXJlLgoKVGhlIHBh
dGNoc2V0IGhhcyBiZWVuIHRlc3RlZCBieSBydW5uaW5nIHRoZSBmYiBjb25zb2xlLCBYMTEgYW5k
IFdlc3RvbgpvbiBhIERpc3BsYXlMaW5rIGFkYXB0ZXIuCgpUaG9tYXMgWmltbWVybWFubiAoNSk6
CiAgZHJtL3VkbDogVW5tYXAgYnVmZmVyIG9iamVjdCBhZnRlciBkYW1hZ2UgdXBkYXRlCiAgZHJt
L3VkbDogUmVtb3ZlIHVkbCBpbXBsZW1lbnRhdGlvbiBvZiBHRU0ncyBmcmVlX29iamVjdCgpCiAg
ZHJtL3VkbDogU3RvcmUgYWN0aXZlIGZyYW1lYnVmZmVyIGluIGRldmljZSBzdHJ1Y3R1cmUKICBk
cm0vdWRsOiBDYWxsIHVkbF9oYW5kbGVfZGFtYWdlKCkgd2l0aCBEUk0gZnJhbWVidWZmZXIKICBk
cm0vdWRsOiBSZXBsYWNlIHN0cnVjdCB1ZGxfZnJhbWVidWZmZXIgd2l0aCBnZW5lcmljIGltcGxl
bWVudGF0aW9uCgogZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZHJ2LmggICAgIHwgIDE0ICsrLS0K
IGRyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2ZiLmMgICAgICB8IDEzMSArKysrKysrKysrKy0tLS0t
LS0tLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2dlbS5jICAgICB8ICAxOCAr
LS0tCiBkcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9tYWluLmMgICAgfCAgIDMgKwogZHJpdmVycy9n
cHUvZHJtL3VkbC91ZGxfbW9kZXNldC5jIHwgIDMxICsrKy0tLS0KIDUgZmlsZXMgY2hhbmdlZCwg
NzAgaW5zZXJ0aW9ucygrKSwgMTI3IGRlbGV0aW9ucygtKQoKLS0KMi4yMy4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
