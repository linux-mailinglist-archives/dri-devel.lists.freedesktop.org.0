Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 309FA1C69B2
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 09:03:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 407BC6E829;
	Wed,  6 May 2020 07:02:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 451 seconds by postgrey-1.36 at gabe;
 Wed, 06 May 2020 01:40:03 UTC
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A741289DB4
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 01:40:03 +0000 (UTC)
Received: from localhost (unknown [192.168.167.13])
 by lucky1.263xmail.com (Postfix) with ESMTP id 503E8814BF
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 09:32:27 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 0
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from [172.16.12.182] (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P17827T139806099281664S1588728740400757_; 
 Wed, 06 May 2020 09:32:27 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <941eb64e3dfe7b11a57b828211107603>
X-RL-SENDER: hjc@rock-chips.com
X-SENDER: hjc@rock-chips.com
X-LOGIN-NAME: hjc@rock-chips.com
X-FST-TO: hjc@rock-chips.com
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
Subject: Re: [PATCH] drm/rockchip: vop: call vop_cfg_done() under reg_lock
To: Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200505151613.2932456-1-emil.l.velikov@gmail.com>
From: Sandy Huang <hjc@rock-chips.com>
Message-ID: <92d34b33-d550-af6f-25a0-6d2ae2cbe4e6@rock-chips.com>
Date: Wed, 6 May 2020 09:32:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200505151613.2932456-1-emil.l.velikov@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 06 May 2020 07:02:40 +0000
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRW1pbCBWZWxpa292LAoK5ZyoIDIwMjAvNS81IOS4i+WNiDExOjE2LCBFbWlsIFZlbGlrb3Yg
5YaZ6YGTOgo+IEZyb206IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+
Cj4KPiBUaGUgZnVuY3Rpb24gdm9wX2NmZ19kb25lKCkgaXMgYSBzaW1wbGUgVk9QX1JFR19TRVQo
KS4gQXMgc3VjaCBpdCBzaG91bGQKPiBiZSBkb25lIHVuZGVyIGEgcmVnX2xvY2suIEEgcXVpY2sg
bG9vayB0aHJvdWdoIHRoZSBkcml2ZXIgc2hvd3MgdGhhdCBhbGwKPiBvdGhlciBpbnN0YW5jZXMg
KGFwYXJ0IGZyb20gZHJpdmVyIGluaXQpIGhhdmUgdGhlIGxvY2suIERvIHRoZSBzYW1lIGhlcmUK
Pgo+IENjOiBTYW5keSBIdWFuZyA8aGpjQHJvY2stY2hpcHMuY29tPgo+IENjOiBIZWlrbyBTdMO8
Ym5lciA8aGVpa29Ac250ZWNoLmRlPgo+IFNpZ25lZC1vZmYtYnk6IEVtaWwgVmVsaWtvdiA8ZW1p
bC52ZWxpa292QGNvbGxhYm9yYS5jb20+Cj4gLS0tCj4gTm90aWNlZCB3aGlsZSBza2ltbWluZyB0
aHJvdWdoIHRoZSBjb2RlIGFuZCB0aHVzIHVudGVzdGVkLgo+IC0tLQo+ICAgZHJpdmVycy9ncHUv
ZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AuYyB8IDQgKystLQo+ICAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcC5jIGIvZHJpdmVycy9ncHUvZHJt
L3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AuYwo+IGluZGV4IDMzNDYzYjc5YTM3Yi4uMWQ3NjQ1
NWNhOTMzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9k
cm1fdm9wLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3Zv
cC5jCj4gQEAgLTY0NSwxMCArNjQ1LDEwIEBAIHN0YXRpYyBpbnQgdm9wX2VuYWJsZShzdHJ1Y3Qg
ZHJtX2NydGMgKmNydGMsIHN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqb2xkX3N0YXRlKQo+ICAgCQlz
LT5lbmFibGVfYWZiYyA9IGZhbHNlOwo+ICAgCX0KPiAgIAo+IC0Jc3Bpbl91bmxvY2soJnZvcC0+
cmVnX2xvY2spOwo+IC0KPiAgIAl2b3BfY2ZnX2RvbmUodm9wKTsKPiAgIAo+ICsJc3Bpbl91bmxv
Y2soJnZvcC0+cmVnX2xvY2spOwo+ICsKPiAgIAkvKgo+ICAgCSAqIEF0IGhlcmUsIHZvcCBjbG9j
ayAmIGlvbW11IGlzIGVuYWJsZSwgUi9XIHZvcCByZWdzIHdvdWxkIGJlIHNhZmUuCj4gICAJICov
Cgp0aGFua3MgZm9yIHlvdXIgcGF0Y2gKUmV2aWV3ZWQtYnk6IFNhbmR5IEh1YW5nIDxoamNAcm9j
ay1jaGlwcy5jb20+CgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
