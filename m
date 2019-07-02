Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEC05CA43
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 10:01:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE16389A5D;
	Tue,  2 Jul 2019 08:01:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17B2889A4A
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 08:01:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5AE05B048;
 Tue,  2 Jul 2019 08:01:47 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, airlied@redhat.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, maxime.ripard@bootlin.com,
 sean@poorly.run, sam@ravnborg.org, z.liuxinliang@hisilicon.com,
 zourongrong@gmail.com, kong.kongxinwei@hisilicon.com,
 puck.chen@hisilicon.com, hdegoede@redhat.com
Subject: [PATCH v2 0/5] Convert VRAM helpers to GEM object functions
Date: Tue,  2 Jul 2019 10:01:34 +0200
Message-Id: <20190702080139.21814-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.21.0
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

VGhlIFBSSU1FIGNhbGxiYWNrIGZ1bmN0aW9ucyBpbiBzdHJ1Y3QgZHJtX2RyaXZlciBhcmUgZGVw
cmVjYXRlZCBpbgpmYXZvciBvZiB0aGVpciBjb3VudGVycGFydHMgaW4gc3RydWN0IGRybV9nZW1f
b2JqZWN0X2Z1bmNzLgoKVGhpcyBwYXRjaCBzZXQgaW50cm9kdWNlcyBHRU0gb2JqZWN0IGZ1bmN0
aW9ucyBmb3IgVlJBTSBoZWxwZXJzIGFuZApjb252ZXJ0cyBvdmVyIHRoZSBmcmVlIGFuZCBQUklN
RSBmdW5jdGlvbnMuIERyaXZlcnMgYWZmZWN0ZWQgYnkgdGhpcwpjaGFuZ2UsIG5hbWVseSBib2No
cyBhbmQgaGlibWMsIGFyZSBhZGFwdGVkIGFjY29yZGluZ2x5LgoKVGhlIHBhdGNoIHNldCdzIHYx
IHdhcyBhY2tlZCBieSBEYW5pZWwgVmV0dGVyLiBJIG9ubHkgdG9vayBpdCBmb3IgdGhlCmRyaXZl
ciBwYXRjaGVzLCBhcyB0aGUgVlJBTSBwYXRjaGVzIGhhdmUgY2hhbmdlZCBzaWduaWZpY2FudGx5
IGluIHYyLgoKdjI6CgkqIHJlbmFtZSBWUkFNIFBSSU1FIGZ1bmN0aW9ucyBpbnN0ZWFkIG9mIHJl
cGxhY2luZyB0aGVtCgkqIHNldCBzdHJ1Y3QgZHJtX2RyaXZlci5nZW1fcHJpbWVfbW1hcCBpbiBo
aWJtYwoJKiByZXBsYWNlIHZib3ggZHJpdmVyJ3MgZW1wdHkgUFJJTUUgaW1wbGVtZW50YXRpb24K
ClRob21hcyBaaW1tZXJtYW5uICg1KToKICBkcm0vdnJhbTogU2V0IEdFTSBvYmplY3QgZnVuY3Rp
b25zIGZvciBQUklNRQogIGRybS9ib2NoczogUmVtb3ZlIFBSSU1FIGhlbHBlcnMgZnJvbSBkcml2
ZXIgc3RydWN0dXJlCiAgZHJtL2hpYm1jOiBVcGRhdGUgc3RydWN0IGRybV9kcml2ZXIgZm9yIEdF
TSBvYmplY3QgZnVuY3Rpb25zCiAgZHJtL3Zib3g6IFJlbW92ZSBlbXB0eSBQUklNRSBmdW5jdGlv
bnMKICBkcm0vdnJhbTogRG9uJ3QgZXhwb3J0IGRyaXZlciBjYWxsYmFjayBmdW5jdGlvbnMgZm9y
IFBSSU1FCgogRG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3QgICAgICAgICAgICAgICAgICAgIHwg
ICA0ICstCiBkcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNfZHJ2LmMgICAgICAgICAgICAgfCAg
IDEgLQogZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuYyAgICAgICAgIHwgMTg4
ICsrKysrKystLS0tLS0tLS0tLQogLi4uL2dwdS9kcm0vaGlzaWxpY29uL2hpYm1jL2hpYm1jX2Ry
bV9kcnYuYyAgIHwgICAzICstCiBkcml2ZXJzL2dwdS9kcm0vdmJveHZpZGVvL01ha2VmaWxlICAg
ICAgICAgICAgfCAgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS92Ym94dmlkZW8vdmJveF9kcnYuYyAg
ICAgICAgICB8ICAgOSAtCiBkcml2ZXJzL2dwdS9kcm0vdmJveHZpZGVvL3Zib3hfZHJ2LmggICAg
ICAgICAgfCAgMTIgLS0KIGRyaXZlcnMvZ3B1L2RybS92Ym94dmlkZW8vdmJveF9wcmltZS5jICAg
ICAgICB8ICA1NiAtLS0tLS0KIGluY2x1ZGUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuaCAgICAg
ICAgICAgICB8ICAyNSArLS0KIDkgZmlsZXMgY2hhbmdlZCwgNzUgaW5zZXJ0aW9ucygrKSwgMjI1
IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS92Ym94dmlk
ZW8vdmJveF9wcmltZS5jCgotLQoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
