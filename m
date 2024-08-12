Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7D294E4A9
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 04:15:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DB5A10E030;
	Mon, 12 Aug 2024 02:14:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="FKAQFJvM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5C9A110E030
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 02:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=mAnLqpnosHJncWBPEzaGSYLYh9RjlL7gR1RI+PKKMlQ=; b=F
 KAQFJvM3hoo81UX2+KWY0KcSe9VwN2ccw2ypUgHzYJHBQzfid3OZNhme56HlA87K
 Emf67jsfjE+Zd4vvG53S5mlvZ8+cq3gjNo0PaUHO24+oUe5xJnnCfER8qpVML1Q6
 2DTWHmvBOxt2CbICrEs0bA/1FQLu5SxtFimgwSgntI=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-140 (Coremail) ; Mon, 12 Aug 2024 10:14:22 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Mon, 12 Aug 2024 10:14:22 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: "Sandy Huang" <hjc@rock-chips.com>, 
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 "Andy Yan" <andy.yan@rock-chips.com>, 
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, 
 "Maxime Ripard" <mripard@kernel.org>, 
 "Thomas Zimmermann" <tzimmermann@suse.de>, 
 "David Airlie" <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>, 
 "Sean Paul" <seanpaul@chromium.org>, 
 "Jeffy Chen" <jeffy.chen@rock-chips.com>, 
 "Andrzej Hajda" <andrzej.hajda@intel.com>, 
 "Mark Yao" <markyao0591@gmail.com>, kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re:[PATCH RESEND] drm/rockchip: Unregister platform drivers in
 reverse order
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20230109(dcb5de15)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <20240808-rk-drm-fix-unreg-v1-1-c30d9a754722@collabora.com>
References: <20240808-rk-drm-fix-unreg-v1-1-c30d9a754722@collabora.com>
X-NTES-SC: AL_Qu2ZAfiZt0At5CSaZOkXn0kXhec2W8Czvvgg34JRP5k0hyXh4w84enhsBWX50cSJNTCNtx+ebhV8+Ol2d45bUpoZ+ngIvVGIHVjhi9ZGMi7K
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <3649004a.1f69.191445d79dc.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: _____wD331_+b7lmxr8VAA--.36231W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0hM5XmWXzphY4gACs6
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

CkhpIENyaXN0aWFuLAoKQXQgMjAyNC0wOC0wOCAxOTo1ODowMiwgIkNyaXN0aWFuIENpb2NhbHRl
YSIgPGNyaXN0aWFuLmNpb2NhbHRlYUBjb2xsYWJvcmEuY29tPiB3cm90ZToKPk1vdmUgcm9ja2No
aXBfZHJtX3BsYXRmb3JtX2RyaXZlciB1bnJlZ2lzdHJhdGlvbiBhZnRlciBpdHMgc3ViLWRyaXZl
cnMsCj53aGljaCBlbnN1cmVzIGFsbCBkcml2ZXJzIGFyZSB1bnJlZ2lzdGVyZWQgaW4gdGhlIHJl
dmVyc2Ugb3JkZXIgdXNlZAo+d2hlbiB0aGV5IHdlcmUgcmVnaXN0ZXJlZC4KCldvdWxkIHlvdSBw
bGVhc2UgcHJvdmllZCBzb21lIGRldGFpbCBpbmZvcm1hdGlvbiBhYm91dCBob3cgdG8gcmVwcm9k
dWNlIHRoaXMKaXNzdWUgdGhpcyBwYXRjaCB0cnkgdG8gZml477yfT3Igc29tZSBrZXJuZWwgbG9n
IHdoZW4gdGhpcyBpc3N1ZSAgIHRyaWdnZXJlZOOAggo+Cj5GaXhlczogODgyMGI2OGJkMzc4ICgi
ZHJtL3JvY2tjaGlwOiBSZWZhY3RvciB0aGUgY29tcG9uZW50IG1hdGNoIGxvZ2ljLiIpCj5TaWdu
ZWQtb2ZmLWJ5OiBDcmlzdGlhbiBDaW9jYWx0ZWEgPGNyaXN0aWFuLmNpb2NhbHRlYUBjb2xsYWJv
cmEuY29tPgo+LS0tCj4gZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV9kcnYu
YyB8IDMgKy0tCj4gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygt
KQo+Cj5kaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV9k
cnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fZHJ2LmMKPmluZGV4
IDQ0ZDc2OWQ5MjM0ZC4uY2E3YjA3NTAzZmJlIDEwMDY0NAo+LS0tIGEvZHJpdmVycy9ncHUvZHJt
L3JvY2tjaGlwL3JvY2tjaGlwX2RybV9kcnYuYwo+KysrIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tj
aGlwL3JvY2tjaGlwX2RybV9kcnYuYwo+QEAgLTUyOCwxMCArNTI4LDkgQEAgc3RhdGljIGludCBf
X2luaXQgcm9ja2NoaXBfZHJtX2luaXQodm9pZCkKPiAKPiBzdGF0aWMgdm9pZCBfX2V4aXQgcm9j
a2NoaXBfZHJtX2Zpbmkodm9pZCkKPiB7Cj4tCXBsYXRmb3JtX2RyaXZlcl91bnJlZ2lzdGVyKCZy
b2NrY2hpcF9kcm1fcGxhdGZvcm1fZHJpdmVyKTsKPi0KPiAJcGxhdGZvcm1fdW5yZWdpc3Rlcl9k
cml2ZXJzKHJvY2tjaGlwX3N1Yl9kcml2ZXJzLAo+IAkJCQkgICAgbnVtX3JvY2tjaGlwX3N1Yl9k
cml2ZXJzKTsKPisJcGxhdGZvcm1fZHJpdmVyX3VucmVnaXN0ZXIoJnJvY2tjaGlwX2RybV9wbGF0
Zm9ybV9kcml2ZXIpOwo+IH0KPiAKPiBtb2R1bGVfaW5pdChyb2NrY2hpcF9kcm1faW5pdCk7Cj4K
Pi0tLQo+YmFzZS1jb21taXQ6IDFlYjU4NmE5NzgyY2RlOGU1MDkxYjlkZTc0NjAzZTBhODM4NmIw
OWUKPmNoYW5nZS1pZDogMjAyNDA3MDItcmstZHJtLWZpeC11bnJlZy05ZjNmMjk5OTZhMDAKPi0t
IAo+Q3Jpc3RpYW4gQ2lvY2FsdGVhIDxjcmlzdGlhbi5jaW9jYWx0ZWFAY29sbGFib3JhLmNvbT4K
Pgo+Cj5fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+TGlu
dXgtcm9ja2NoaXAgbWFpbGluZyBsaXN0Cj5MaW51eC1yb2NrY2hpcEBsaXN0cy5pbmZyYWRlYWQu
b3JnCj5odHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJv
Y2tjaGlwCg==
