Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2829FB3B0
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 16:26:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7294D6ED5E;
	Wed, 13 Nov 2019 15:26:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A785B6ED5E
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 15:26:47 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:58964
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1iUuXd-0003Ij-93; Wed, 13 Nov 2019 16:26:45 +0100
Subject: Re: [PATCH v4 1/3] drm/udl: Replace fbdev code with generic emulation
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 sean@poorly.run, daniel@ffwll.ch, b.zolnierkie@samsung.com,
 kraxel@redhat.com, sam@ravnborg.org, emil.velikov@collabora.com
References: <20191113115233.18483-1-tzimmermann@suse.de>
 <20191113115233.18483-2-tzimmermann@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <7c9289a6-1a4e-e0d3-ce9e-3f5d6305da69@tronnes.org>
Date: Wed, 13 Nov 2019 16:26:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191113115233.18483-2-tzimmermann@suse.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org
 ; s=ds201810; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=STND7ppMtYHEAvFWFNykvLeSriS2IF5Re1FLKaMiGiE=; b=Wf1KV3nYntBaHmmv1CRqmYz5os
 ZvIjGwRh97tw4x5I3D64AOQNhz5u3cNEmV4bG6VWr3aV1MStz+txzvPkHA3+F56Wp/uCDCPqbZ4G2
 FAq8gA4OzheKmG+bmMdEY3wV7s8d87XXzvx+M0InxjB8IiQnr+95BNorZkSJ+3eej6ipNeaSh6Ve4
 FQ5nUrUDyHk2Pe3TtSWai5DHCRy/T2G71kCh16BUCv++xLeAUMl+4JAAHcQ4I1dbPMs53wlz3aXjh
 PSL2O1Z42c8i2qsij40/pHd14BmgPlxcUAVd48zPjWf9eAanFzns6otoOFu5QsQW7L/9tD2p35FTL
 9GmNHpFg==;
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMTMuMTEuMjAxOSAxMi41Miwgc2tyZXYgVGhvbWFzIFppbW1lcm1hbm46Cj4gVGhlIHVk
bCBkcml2ZXIgY2FuIHVzZSB0aGUgZ2VuZXJpYyBmYmRldiBpbXBsZW1lbnRhdGlvbi4gQ29udmVy
dCBpdC4KPiAKPiB2NDoKPiAJKiBoYXJkY29kZSBjb25zb2xlIGJwcCB0byAxNgo+IHYzOgo+IAkq
IHJlbW92ZSBtb2R1bGUgcGFyYW1ldGVyIGZiX2JwcCBpbiBmYXZvciBvZiBmYmRldidzIHZpZGVv
Cj4gCSogY2FsbCBkcm1fZmJkZXZfZ2VuZXJpY19zZXR1cCgpIGRpcmVjdGx5OyByZW1vdmUgdWRs
X2ZiZGV2X2luaXQoKQo+IAkqIHVzZSBkZWZhdWx0IGZvciBzdHJ1Y3QgZHJtX21vZGVfY29uZmln
X2Z1bmNzLm91dHB1dF9wb2xsX2NoYW5nZWQKPiAJKiB1c2UgZGVmYXVsdCBmb3Igc3RydWN0IGRy
bV9kcml2ZXIubGFzdGNsb3NlCj4gCj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4g
PHR6aW1tZXJtYW5uQHN1c2UuZGU+Cj4gLS0tCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vdWRsL3VkbF9tYWluLmMgYi9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9tYWluLmMKPiBpbmRl
eCA0ZTg1NGUwMTczOTAuLjNiZTBjMGNlYzQ5ZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vdWRsL3VkbF9tYWluLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9tYWluLmMK
PiBAQCAtOSw2ICs5LDcgQEAKPiAgICovCj4gIAo+ICAjaW5jbHVkZSA8ZHJtL2RybS5oPgo+ICsj
aW5jbHVkZSA8ZHJtL2RybV9mYl9oZWxwZXIuaD4KPiAgI2luY2x1ZGUgPGRybS9kcm1fcHJpbnQu
aD4KPiAgI2luY2x1ZGUgPGRybS9kcm1fcHJvYmVfaGVscGVyLmg+Cj4gIAo+IEBAIC0zMzgsNyAr
MzM5LDcgQEAgaW50IHVkbF9pbml0KHN0cnVjdCB1ZGxfZGV2aWNlICp1ZGwpCj4gIAlpZiAocmV0
KQo+ICAJCWdvdG8gZXJyOwo+ICAKPiAtCXJldCA9IHVkbF9mYmRldl9pbml0KGRldik7Cj4gKwly
ZXQgPSBkcm1fZmJkZXZfZ2VuZXJpY19zZXR1cChkZXYsIDE2KTsKCkkgc3VnZ2VzdCB5b3UgcHV0
IHRoaXMgYWZ0ZXIgZHJtX2Rldl9yZWdpc3RlcigpIGluIF9wcm9iZSgpIHNpbmNlIGZiZGV2Cmlz
IGEgY2xpZW50LCBhIHVzZXIgb2YgdGhlIGRyaXZlciwgbm90IHBhcnQgb2YgaXQgYXMgc3VjaC4K
CkVpdGhlciB3YXkgeW91IGNob29zZToKClJldmlld2VkLWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5v
cmFsZkB0cm9ubmVzLm9yZz4KCkJ0dywgbmljZSBkaWZmc3RhdCEKCj4gIAlpZiAocmV0KQo+ICAJ
CWdvdG8gZXJyOwo+ICAKPiBAQCAtMzY3LDYgKzM2OCw0IEBAIHZvaWQgdWRsX2Zpbmkoc3RydWN0
IGRybV9kZXZpY2UgKmRldikKPiAgCj4gIAlpZiAodWRsLT51cmJzLmNvdW50KQo+ICAJCXVkbF9m
cmVlX3VyYl9saXN0KGRldik7Cj4gLQo+IC0JdWRsX2ZiZGV2X2NsZWFudXAoZGV2KTsKPiAgfQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
