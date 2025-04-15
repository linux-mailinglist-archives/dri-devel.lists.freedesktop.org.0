Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB7BA892AF
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 06:00:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49E7010E34F;
	Tue, 15 Apr 2025 04:00:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="B1xYE04Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (unknown [220.197.31.2])
 by gabe.freedesktop.org (Postfix) with ESMTP id DE93810E34F
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 04:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=HylZjV5hauLnNMJgjoU0Ktk/cYP5GO+ujr/E1VeMjtQ=; b=B
 1xYE04ZXsvfeOgzuJR8d8y3epOcp1mUp20qHGWl1m12nmc+kj6c+SJVs0A4923Zz
 eYSZdtjDPll5hADrFDt7jpIwY8FWu2hZmOWzElb3lThz3pPBTEmbCUajVXe5i6Z+
 x/kk7xqT3OCn0aUDYTaq1O0raMMndh/AJT0HAVaw98=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-120 (Coremail) ; Tue, 15 Apr 2025 12:00:03 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Tue, 15 Apr 2025 12:00:03 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: airlied@gmail.com, simona@ffwll.ch, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, dri-devel@lists.freedesktop.org,
 "Sandy Huang" <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 "Andy Yan" <andy.yan@rock-chips.com>
Subject: Re:[PATCH 05/11] drm/rockchip: Test for imported buffers with
 drm_gem_is_imported()
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20250414134821.568225-5-tzimmermann@suse.de>
References: <20250414134821.568225-5-tzimmermann@suse.de>
X-NTES-SC: AL_Qu2fBvqTtk4r5SmbZ+kfmkcVgOw9UcO5v/Qk3oZXOJF8jDLp/j0HdmVSAWfk9OO0GyOzmgmGQhZw7+16UYtfUYcQTiX8nz33WuI3QsDkGeITPg==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <38d09d34.4354.196379aa560.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: eCgvCgAXPPPE2f1nwDyXAA--.38685W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0hIwXmf92TENNAABsk
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpIaSBUaG9tYXPvvIwKCkF0IDIwMjUtMDQtMTQgMjE6NDg6MTIsICJUaG9tYXMgWmltbWVybWFu
biIgPHR6aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3RlOgo+SW5zdGVhZCBvZiB0ZXN0aW5nIGltcG9y
dF9hdHRhY2ggZm9yIGltcG9ydGVkIEdFTSBidWZmZXJzLCBpbnZva2UKPmRybV9nZW1faXNfaW1w
b3J0ZWQoKSB0byBkbyB0aGUgdGVzdC4gVGhlIGhlbHBlciB0ZXN0cyB0aGUgZG1hX2J1Zgo+aXRz
ZWxmIHdoaWxlIGltcG9ydF9hdHRhY2ggaXMganVzdCBhbiBhcnRpZmFjdCBvZiB0aGUgaW1wb3J0
LiBQcmVwYXJlcwo+dG8gbWFrZSBpbXBvcnRfYXR0YWNoIG9wdGlvbmFsLgo+Cj5TaWduZWQtb2Zm
LWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KPkNjOiBTYW5keSBI
dWFuZyA8aGpjQHJvY2stY2hpcHMuY29tPgo+Q2M6ICJIZWlrbyBTdMO8Ym5lciIgPGhlaWtvQHNu
dGVjaC5kZT4KPkNjOiBBbmR5IFlhbiA8YW5keS55YW5Acm9jay1jaGlwcy5jb20+Cj4tLS0KPiBk
cml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX2dlbS5jIHwgMiArLQo+IDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj5kaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV9nZW0uYyBiL2RyaXZlcnMvZ3B1
L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fZ2VtLmMKPmluZGV4IDYzMzBiODgzZWZjMy4uZTQ0
Mzk2ZDQ2ZGMxIDEwMDY0NAo+LS0tIGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlw
X2RybV9nZW0uYwo+KysrIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV9n
ZW0uYwo+QEAgLTMzMiw3ICszMzIsNyBAQCB2b2lkIHJvY2tjaGlwX2dlbV9mcmVlX29iamVjdChz
dHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaikKPiAJc3RydWN0IHJvY2tjaGlwX2RybV9wcml2YXRl
ICpwcml2YXRlID0gZHJtLT5kZXZfcHJpdmF0ZTsKPiAJc3RydWN0IHJvY2tjaGlwX2dlbV9vYmpl
Y3QgKnJrX29iaiA9IHRvX3JvY2tjaGlwX29iaihvYmopOwo+IAo+LQlpZiAob2JqLT5pbXBvcnRf
YXR0YWNoKSB7Cj4rCWlmIChkcm1fZ2VtX2lzX2ltcG9ydGVkKG9iaikpIHsKCgpBZnRlciBhcHBs
eWluZyB0aGlzIHBhdGNoLCB3aGVuIEkgdGVzdGVkIGdsbWFyazItZXMyLXdheWxhbmQgdW5kZXIg
V2VzdG9uLCB0aGUgd2VzdG9uIHdvdWxkIGZyZWV6ZS4KSXQgc2VlbXMgaXQgZ290byB0aGUgZWxz
ZSBwYXRoLgoKIEknbSBzdGlsbCBjb25kdWN0aW5nIGZ1cnRoZXIgYW5hbHlzaXMgdG8gZmlndXJl
IG91dCB0aGUgZXhhY3QgY2F1c2UuCgo+IAkJaWYgKHByaXZhdGUtPmRvbWFpbikgewo+IAkJCXJv
Y2tjaGlwX2dlbV9pb21tdV91bm1hcChya19vYmopOwo+IAkJfSBlbHNlIHsKPi0tIAo+Mi40OS4w
Cg==
