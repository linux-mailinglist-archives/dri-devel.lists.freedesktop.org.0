Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1E0106823
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2019 09:30:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F05E6E2BD;
	Fri, 22 Nov 2019 08:30:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D73BA6E2ED
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2019 08:30:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3A969B394;
 Fri, 22 Nov 2019 08:30:47 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@linux.ie, z.liuxinliang@hisilicon.com, zourongrong@gmail.com,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com, sam@ravnborg.org,
 kraxel@redhat.com, hslester96@gmail.com, yuehaibing@huawei.com
Subject: [PATCH 0/4] Replace hibmc code with generic implmentation
Date: Fri, 22 Nov 2019 09:30:40 +0100
Message-Id: <20191122083044.6627-1-tzimmermann@suse.de>
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

VGhlIHBhdGNoIHNldCByZXBsYWNlcyBjb2RlIGluIGhpYm1jIHdpdGggZ2VuZXJpYyBpbXBsZW1l
bnRhdGlvbi4KClBhdGNoZXMgMSB0byAzIHJlcGxhY2UgZmJkZXYgZW11YXRpb24sIGZyYW1lYnVm
ZmVyIGFuZCBjcmVhdGlvbiBvZgpkdW1iIGJ1ZmZlcnMgd2l0aCByZXNwZWN0aXZlIGNvZGUgZnJv
bSBEUk0gaGVscGVycy4gUGF0Y2ggNCBhZGRzIGFuCmFkZGl0aW9uYWwgaW50ZXJmYWNlIHRvIGRl
YnVnZnMgdGhhdCBkaXNwbGF5cyB0aGUgYWxsb2NhdGVkIGFuZCBmcmVlCmFyZWFzIGluIHZpZGVv
IG1lbW9yeS4KClRoZSBwYXRjaGVzIGhhdmUgb25seSBiZWVuIGNvbXBpbGUtdGVzdGVkLiBGdXJ0
aGVyIHRlc3RpbmcgaXMKYXBwcmVjaWF0ZWQuCgpUaG9tYXMgWmltbWVybWFubiAoNCk6CiAgZHJt
L2hpc2lsaWNvbi9oaWJtYzogU3dpdGNoIHRvIGdlbmVyaWMgZmJkZXYgZW11bGF0aW9uCiAgZHJt
L2hpc2lsaWNvbi9oaWJtYzogUmVwbGFjZSBzdHJ1Y3QgaGlibWNfZnJhbWVidWZmZXIgd2l0aCBn
ZW5lcmljCiAgICBjb2RlCiAgZHJtL2hpc2lsaWNvbi9oaWJtYzogSW1wbGVtZW50IGhpYm1jX2R1
bWJfY3JlYXRlKCkgd2l0aCBnZW5lcmljCiAgICBoZWxwZXJzCiAgZHJtL2hpc2lsaWNvbi9oaWJt
YzogRXhwb3J0IFZSQU0gTU0gaW5mb3JtYXRpb24gdG8gZGVidWdmcwoKIGRyaXZlcnMvZ3B1L2Ry
bS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMgICAgICAgICB8ICAxMCArLQogZHJpdmVycy9ncHUvZHJt
L2hpc2lsaWNvbi9oaWJtYy9NYWtlZmlsZSAgICAgIHwgICAyICstCiAuLi4vZ3B1L2RybS9oaXNp
bGljb24vaGlibWMvaGlibWNfZHJtX2RlLmMgICAgfCAgIDQgKy0KIC4uLi9ncHUvZHJtL2hpc2ls
aWNvbi9oaWJtYy9oaWJtY19kcm1fZHJ2LmMgICB8ICAgNiArLQogLi4uL2dwdS9kcm0vaGlzaWxp
Y29uL2hpYm1jL2hpYm1jX2RybV9kcnYuaCAgIHwgIDI2IC0tCiAuLi4vZ3B1L2RybS9oaXNpbGlj
b24vaGlibWMvaGlibWNfZHJtX2ZiZGV2LmMgfCAyNDAgLS0tLS0tLS0tLS0tLS0tLS0tCiBkcml2
ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2hpYm1jL2hpYm1jX3R0bS5jICAgfCAxMTcgKy0tLS0tLS0t
CiBpbmNsdWRlL2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmggICAgICAgICAgICAgfCAgIDEgKwog
OCBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAzODkgZGVsZXRpb25zKC0pCiBkZWxl
dGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJtY19kcm1f
ZmJkZXYuYwoKLS0KMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
