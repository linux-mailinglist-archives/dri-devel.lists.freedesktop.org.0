Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4162A401B
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 10:30:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB5346E8A9;
	Tue,  3 Nov 2020 09:30:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTP id D19236E894;
 Tue,  3 Nov 2020 09:30:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AEAE2AF4F;
 Tue,  3 Nov 2020 09:30:18 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, sam@ravnborg.org, alexander.deucher@amd.com,
 christian.koenig@amd.com, kraxel@redhat.com, l.stach@pengutronix.de,
 linux+etnaviv@armlinux.org.uk, christian.gmeiner@gmail.com,
 inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, kgene@kernel.org, krzk@kernel.org,
 yuq825@gmail.com, bskeggs@redhat.com, robh@kernel.org,
 tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, hjc@rock-chips.com, heiko@sntech.de,
 hdegoede@redhat.com, sean@poorly.run, eric@anholt.net,
 oleksandr_andrushchenko@epam.com, ray.huang@amd.com,
 sumit.semwal@linaro.org, emil.velikov@collabora.com, luben.tuikov@amd.com,
 apaneers@amd.com, linus.walleij@linaro.org, melissa.srw@gmail.com,
 chris@chris-wilson.co.uk, miaoqinglang@huawei.com
Subject: [PATCH v7 01/10] drm/vram-helper: Remove invariant parameters from
 internal kmap function
Date: Tue,  3 Nov 2020 10:30:06 +0100
Message-Id: <20201103093015.1063-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201103093015.1063-1-tzimmermann@suse.de>
References: <20201103093015.1063-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 etnaviv@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linaro-mm-sig@lists.linaro.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, xen-devel@lists.xenproject.org,
 spice-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHBhcmFtZXRlcnMgbWFwIGFuZCBpc19pb21lbSBhcmUgYWx3YXlzIG9mIHRoZSBzYW1lIHZh
bHVlLiBSZW1vdmVkIHRoZW0KdG8gcHJlcGFyZXMgdGhlIGZ1bmN0aW9uIGZvciBjb252ZXJzaW9u
IHRvIHN0cnVjdCBkbWFfYnVmX21hcC4KCnY0OgoJKiBkb24ndCBjaGVjayBmb3IgIWttYXAtPnZp
cnR1YWw7IHdpbGwgYWx3YXlzIGJlIGZhbHNlCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVy
bWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRh
bmllbC52ZXR0ZXJAZmZ3bGwuY2g+ClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb20+ClRlc3RlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJv
cmcub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMgfCAxOCAr
KysrLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDE0IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVs
cGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5jCmluZGV4IDE2ZDY4
YzA0ZWE1ZC4uZTMwNWZhZGI4YmM4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dl
bV92cmFtX2hlbHBlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVy
LmMKQEAgLTM3OCwzMiArMzc4LDIyIEBAIGludCBkcm1fZ2VtX3ZyYW1fdW5waW4oc3RydWN0IGRy
bV9nZW1fdnJhbV9vYmplY3QgKmdibykKIH0KIEVYUE9SVF9TWU1CT0woZHJtX2dlbV92cmFtX3Vu
cGluKTsKIAotc3RhdGljIHZvaWQgKmRybV9nZW1fdnJhbV9rbWFwX2xvY2tlZChzdHJ1Y3QgZHJt
X2dlbV92cmFtX29iamVjdCAqZ2JvLAotCQkJCSAgICAgIGJvb2wgbWFwLCBib29sICppc19pb21l
bSkKK3N0YXRpYyB2b2lkICpkcm1fZ2VtX3ZyYW1fa21hcF9sb2NrZWQoc3RydWN0IGRybV9nZW1f
dnJhbV9vYmplY3QgKmdibykKIHsKIAlpbnQgcmV0OwogCXN0cnVjdCB0dG1fYm9fa21hcF9vYmog
KmttYXAgPSAmZ2JvLT5rbWFwOworCWJvb2wgaXNfaW9tZW07CiAKIAlpZiAoZ2JvLT5rbWFwX3Vz
ZV9jb3VudCA+IDApCiAJCWdvdG8gb3V0OwogCi0JaWYgKGttYXAtPnZpcnR1YWwgfHwgIW1hcCkK
LQkJZ290byBvdXQ7Ci0KIAlyZXQgPSB0dG1fYm9fa21hcCgmZ2JvLT5ibywgMCwgZ2JvLT5iby5u
dW1fcGFnZXMsIGttYXApOwogCWlmIChyZXQpCiAJCXJldHVybiBFUlJfUFRSKHJldCk7CiAKIG91
dDoKLQlpZiAoIWttYXAtPnZpcnR1YWwpIHsKLQkJaWYgKGlzX2lvbWVtKQotCQkJKmlzX2lvbWVt
ID0gZmFsc2U7Ci0JCXJldHVybiBOVUxMOyAvKiBub3QgbWFwcGVkOyBkb24ndCBpbmNyZW1lbnQg
cmVmICovCi0JfQogCSsrZ2JvLT5rbWFwX3VzZV9jb3VudDsKLQlpZiAoaXNfaW9tZW0pCi0JCXJl
dHVybiB0dG1fa21hcF9vYmpfdmlydHVhbChrbWFwLCBpc19pb21lbSk7Ci0JcmV0dXJuIGttYXAt
PnZpcnR1YWw7CisJcmV0dXJuIHR0bV9rbWFwX29ial92aXJ0dWFsKGttYXAsICZpc19pb21lbSk7
CiB9CiAKIHN0YXRpYyB2b2lkIGRybV9nZW1fdnJhbV9rdW5tYXBfbG9ja2VkKHN0cnVjdCBkcm1f
Z2VtX3ZyYW1fb2JqZWN0ICpnYm8pCkBAIC00NDgsNyArNDM4LDcgQEAgdm9pZCAqZHJtX2dlbV92
cmFtX3ZtYXAoc3RydWN0IGRybV9nZW1fdnJhbV9vYmplY3QgKmdibykKIAlyZXQgPSBkcm1fZ2Vt
X3ZyYW1fcGluX2xvY2tlZChnYm8sIDApOwogCWlmIChyZXQpCiAJCWdvdG8gZXJyX3R0bV9ib191
bnJlc2VydmU7Ci0JYmFzZSA9IGRybV9nZW1fdnJhbV9rbWFwX2xvY2tlZChnYm8sIHRydWUsIE5V
TEwpOworCWJhc2UgPSBkcm1fZ2VtX3ZyYW1fa21hcF9sb2NrZWQoZ2JvKTsKIAlpZiAoSVNfRVJS
KGJhc2UpKSB7CiAJCXJldCA9IFBUUl9FUlIoYmFzZSk7CiAJCWdvdG8gZXJyX2RybV9nZW1fdnJh
bV91bnBpbl9sb2NrZWQ7Ci0tIAoyLjI5LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
