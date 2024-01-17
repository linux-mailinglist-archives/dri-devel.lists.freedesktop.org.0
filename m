Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2C783005C
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 08:10:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 760A210E053;
	Wed, 17 Jan 2024 07:10:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from zg8tmja2lje4os4yms4ymjma.icoremail.net
 (zg8tmja2lje4os4yms4ymjma.icoremail.net [206.189.21.223])
 by gabe.freedesktop.org (Postfix) with ESMTP id 18A1A10E053
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 07:10:36 +0000 (UTC)
Received: from alexious$zju.edu.cn ( [10.190.68.184] ) by
 ajax-webmail-mail-app3 (Coremail) ; Wed, 17 Jan 2024 15:10:19 +0800
 (GMT+08:00)
X-Originating-IP: [10.190.68.184]
Date: Wed, 17 Jan 2024 15:10:19 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: alexious@zju.edu.cn
To: "Qiang Yu" <yuq825@gmail.com>
Subject: Re: Re: [PATCH] drm/lima: fix a memleak in lima_heap_alloc
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT5 build
 20231205(37e20f0e) Copyright (c) 2002-2024 www.mailtech.cn
 mispb-4df6dc2c-e274-4d1c-b502-72c5c3dfa9ce-zj.edu.cn
In-Reply-To: <CAKGbVbswTUYJsZDLWao58MTyt7yAYMMXA5zjeYVBTRvd9X3n0g@mail.gmail.com>
References: <20240112084750.3729837-1-alexious@zju.edu.cn>
 <CAKGbVbswTUYJsZDLWao58MTyt7yAYMMXA5zjeYVBTRvd9X3n0g@mail.gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <397c98b.49eb.18d1641ad63.Coremail.alexious@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: cC_KCgA3XztcfadlY08uAA--.5780W
X-CM-SenderInfo: qrsrjiarszq6lmxovvfxof0/1tbiAg0DAGWmzmEUIgAEsS
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VW7Jw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, lima@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBUaGFua3MgZm9yIHRoZSBmaXguIEFzIHRoZSBlcnJvciBoYW5kbGluZyBnZXRzIGxvbmdlciBh
bmQgZHVwbGljYXRlZCwKPiBjb3VsZCB5b3UgcmVhcnJhbmdlIHRoZW0gbGlrZSB0aGUgbGltYV9n
ZW1fc3VibWl0KCk6Cj4gZXJyX291dDI6Cj4gICAgIGRtYV91bm1hcF9zZ3RhYmxlKGRldiwgJnNn
dCwgRE1BX0JJRElSRUNUSU9OQUwsIDApOwo+IGVycl9vdXQxOgo+ICAgICBrZnJlZShiby0+YmFz
ZS5zZ3QpOwo+ICAgICBiby0+YmFzZS5zZ3QgPSBOVUxMOwo+IGVycl9vdXQwOgo+ICAgICBzZ19m
cmVlX3RhYmxlKCZzZ3QpOwo+ICAgICByZXR1cm4gcmV0Lgo+IAo+IFJlZ2FyZHMsCj4gUWlhbmcK
PiAKClN1cmUsIEknbGwgc2VuZCBhIHYyIHZlcnNpb24gb2YgdGhpcyBwYXRjaCBsYXRlciBmb2xs
b3dpbmcgeW91ciBhZHZpc2UuCgpSZWdhcmRzLApaaGlwZW5nCgo+IE9uIEZyaSwgSmFuIDEyLCAy
MDI0IGF0IDQ6NDnigK9QTSBaaGlwZW5nIEx1IDxhbGV4aW91c0B6anUuZWR1LmNuPiB3cm90ZToK
PiA+Cj4gPiBXaGVuIGxpbWFfdm1fbWFwX2JvIGZhaWxzLCB0aGUgcmVzb3VyY2VzIG5lZWQgdG8g
YmUgZGVhbGxvY2F0ZWQsIG9yCj4gPiB0aGVyZSB3aWxsIGJlIG1lbWxlYWtzLgo+ID4KPiA+IEZp
eGVzOiA2YWViYzUxZDdhZWYgKCJkcm0vbGltYTogc3VwcG9ydCBoZWFwIGJ1ZmZlciBjcmVhdGlv
biIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBaaGlwZW5nIEx1IDxhbGV4aW91c0B6anUuZWR1LmNuPgo+
ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9nZW0uYyB8IDcgKysrKysrLQo+
ID4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9nZW0uYyBiL2RyaXZlcnMv
Z3B1L2RybS9saW1hL2xpbWFfZ2VtLmMKPiA+IGluZGV4IDRmOTczNmU1ZjkyOS4uODI0ZWQyMjE0
MWM3IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9nZW0uYwo+ID4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9nZW0uYwo+ID4gQEAgLTkyLDggKzkyLDEz
IEBAIGludCBsaW1hX2hlYXBfYWxsb2Moc3RydWN0IGxpbWFfYm8gKmJvLCBzdHJ1Y3QgbGltYV92
bSAqdm0pCj4gPgo+ID4gICAgICAgICBpZiAodm0pIHsKPiA+ICAgICAgICAgICAgICAgICByZXQg
PSBsaW1hX3ZtX21hcF9ibyh2bSwgYm8sIG9sZF9zaXplID4+IFBBR0VfU0hJRlQpOwo+ID4gLSAg
ICAgICAgICAgICAgIGlmIChyZXQpCj4gPiArICAgICAgICAgICAgICAgaWYgKHJldCkgewo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgZG1hX3VubWFwX3NndGFibGUoZGV2LCAmc2d0LCBETUFf
QklESVJFQ1RJT05BTCwgMCk7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICBzZ19mcmVlX3Rh
YmxlKCZzZ3QpOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAga2ZyZWUoYm8tPmJhc2Uuc2d0
KTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGJvLT5iYXNlLnNndCA9IE5VTEw7Cj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ID4gKyAgICAgICAgICAgICAgIH0K
PiA+ICAgICAgICAgfQo+ID4KPiA+ICAgICAgICAgYm8tPmhlYXBfc2l6ZSA9IG5ld19zaXplOwo+
ID4gLS0KPiA+IDIuMzQuMQo+ID4K
