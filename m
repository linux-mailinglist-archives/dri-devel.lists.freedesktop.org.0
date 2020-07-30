Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5515233140
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 13:50:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B10F46E1E2;
	Thu, 30 Jul 2020 11:50:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 999C36E1B9;
 Thu, 30 Jul 2020 11:50:50 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id q4so16508035edv.13;
 Thu, 30 Jul 2020 04:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=0LJvLxzTm9aHYZKGzyv9+v5HBrnybpG9cKyT7tNq2CM=;
 b=B0SMeO0zjiA7QNYS8DzQKJKJ8H+nWDO6QNSP0eFwJiLxrcD3MR27qFc8saMrjppc0d
 53eo9iYhsEBprWz+e2MWVKXtukOlegWBotHMMmv/dKlvXUA9RLomd1yU2Cc2Rs3s9U2q
 VwFr8jY/IBOoLO2tDoljlBoIFoMhAkVxq24/7rZPoGgaItFYe/TLqpjROW7ZHbABI5wW
 bpkTjU3idsbMXPbwn4zmuAEjP7iGx9jouAKqXfx+k2pDYvJjD7cG0v+he7qhYFlX0HbE
 zxM2onxLZOoIAi/HVJcQ4njBB/KPREDWyUQLwZGvGgVLZTaKyvvYqbswk+GslZx4z0Gs
 lcZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=0LJvLxzTm9aHYZKGzyv9+v5HBrnybpG9cKyT7tNq2CM=;
 b=btSn3aEdaveJkv52HHT9eFPOW1jNWpaI3ZBpkZ34dqWMoCPZMvtqXnXjeKqUpKK8eO
 Ka3T5tVsEgVKpZqLq18dhaTsNr415sMU5uYz0/6TT9OfXgRdJbqzcy/vKEkbSbcXIoGr
 GF+9zraVJ7ZnSsdQosfZzeuFmJL5vWGuN+fvfinQVzvbLrRHqHwzimLuT7lJIn0CXBci
 PvBnnbzz2rmDEE87l04ucUBIHm8yGzYWP43E0jKG9P7/3mmpEUb9/iYSm6et8zH4AkSQ
 lxP/qWVcNgefwv7namr9qxw99Nh2Mi7ypTQCIyhaUpnEFyvGZkJ0z3K6qE/H5XDJiaOI
 IMVg==
X-Gm-Message-State: AOAM5338C2CzKJCF/K6tSB6egLspplenwAejakv89wzp4W47C7ZQ7Pb2
 2sksRuOu6odYr4yxtJOTgO33cydG
X-Google-Smtp-Source: ABdhPJy2ThLbooSb6Y4T9la+Px0FZqtjwOUXFAEzClwYT7O/7T8ZtPXAf8hv8VsSWxiCzY/yXtE20g==
X-Received: by 2002:a50:bf09:: with SMTP id f9mr2186949edk.249.1596109849347; 
 Thu, 30 Jul 2020 04:50:49 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id p21sm6244736eds.11.2020.07.30.04.50.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2020 04:50:48 -0700 (PDT)
Subject: Re: [PATCH 1/1] drm/ttm: fix offset in VMAs with a pg_offs in
 ttm_bo_vm_access
To: Daniel Vetter <daniel@ffwll.ch>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
References: <20200728182704.1809-1-Felix.Kuehling@amd.com>
 <9994a650-8065-c51c-6454-47064d20c729@gmail.com>
 <7c389ab3-4322-ebd5-f042-e80204dbcfbc@amd.com>
 <MW3PR12MB4491D68CC4AEC80F9B724E46F7700@MW3PR12MB4491.namprd12.prod.outlook.com>
 <9b384c46-ec71-46be-ac60-1335e9682c05@email.android.com>
 <CAKMK7uEDPpqLtTqJztDNTUiG0UOZ7s75p3e4EqhMK98zc=fiAA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <cddf3671-b714-81df-e70b-6162250cd366@gmail.com>
Date: Thu, 30 Jul 2020 13:50:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uEDPpqLtTqJztDNTUiG0UOZ7s75p3e4EqhMK98zc=fiAA@mail.gmail.com>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, "Morichetti,
 Laurent" <Laurent.Morichetti@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMzAuMDcuMjAgdW0gMTM6NDAgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFdlZCwgSnVs
IDI5LCAyMDIwIGF0IDU6MzQgUE0gS29lbmlnLCBDaHJpc3RpYW4KPiA8Q2hyaXN0aWFuLktvZW5p
Z0BhbWQuY29tPiB3cm90ZToKPj4gU3VyZS4KPiBOb3RlIHRoYXQgZHJtLW1pc2MtbmV4dCBpc24n
dCB0aGUgcmlnaHQgYnJhbmNoIGZvciBjYzogc3RhYmxlIHN0dWZmLCBzZWUKPgo+IGh0dHBzOi8v
ZHJtLnBhZ2VzLmZyZWVkZXNrdG9wLm9yZy9tYWludGFpbmVyLXRvb2xzL2NvbW1pdHRlci1kcm0t
bWlzYy5odG1sI3doZXJlLWRvLWktYXBwbHktbXktcGF0Y2gKClNvIHRoaXMgc2hvdWxkIGdvIGlu
dG8gZHJtLW1pc2MtZml4ZXM/IFRoZSBidWcgaXMgdGhlcmUgZm9yIHF1aXRlIGEgd2hpbGUuCgpD
aHJpc3RpYW4uCgo+Cj4gSnVzdCB0byBhdm9pZCBjb25mdXNpb24gYW5kIG5lZWRsZXNzIGNoZXJy
eXBpY2tpbmcgYWNyb3NzIGJyYW5jaGVzLgo+IC1EYW5pZWwKPgo+PiBDaHJpc3RpYW4uCj4+Cj4+
IEFtIDI5LjA3LjIwMjAgMTc6MzAgc2NocmllYiAiRGV1Y2hlciwgQWxleGFuZGVyIiA8QWxleGFu
ZGVyLkRldWNoZXJAYW1kLmNvbT46Cj4+Cj4+IFtBTUQgUHVibGljIFVzZV0KPj4KPj4KPj4gQ2hy
aXN0aWFuLCBDYW4geW91IGNjIHN0YWJsZSB3aGVuIHlvdSBhcHBseSBpdCB0byBkcm0tbWlzYz8K
Pj4KPj4gQWxleAo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBGcm9tOiBL
dWVobGluZywgRmVsaXggPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+Cj4+IFNlbnQ6IFdlZG5lc2Rh
eSwgSnVseSAyOSwgMjAyMCAxMDoxNSBBTQo+PiBUbzogS29lbmlnLCBDaHJpc3RpYW4gPENocmlz
dGlhbi5Lb2VuaWdAYW1kLmNvbT47IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcgPGRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZyA8YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+OyBEZXVjaGVyLCBBbGV4YW5kZXIg
PEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+Cj4+IENjOiBNb3JpY2hldHRpLCBMYXVyZW50IDxM
YXVyZW50Lk1vcmljaGV0dGlAYW1kLmNvbT4KPj4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzFdIGRy
bS90dG06IGZpeCBvZmZzZXQgaW4gVk1BcyB3aXRoIGEgcGdfb2ZmcyBpbiB0dG1fYm9fdm1fYWNj
ZXNzCj4+Cj4+IEFtIDIwMjAtMDctMjkgdW0gNDowOCBhLm0uIHNjaHJpZWIgQ2hyaXN0aWFuIEvD
tm5pZzoKPj4+IEFtIDI4LjA3LjIwIHVtIDIwOjI3IHNjaHJpZWIgRmVsaXggS3VlaGxpbmc6Cj4+
Pj4gVk1BcyB3aXRoIGEgcGdfb2ZmcyB0aGF0J3Mgb2Zmc2V0IGZyb20gdGhlIHN0YXJ0IG9mIHRo
ZSB2bWFfbm9kZSBuZWVkCj4+Pj4gdG8gYWRqdXN0IHRoZSBvZmZzZXQgd2l0aGluIHRoZSBCTyBh
Y2NvcmRpbmdseS4gVGhpcyBtYXRjaGVzIHRoZQo+Pj4+IG9mZnNldCBjYWxjdWxhdGlvbiBpbiB0
dG1fYm9fdm1fZmF1bHRfcmVzZXJ2ZWQuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBGZWxpeCBL
dWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4KPj4+PiBUZXN0ZWQtYnk6IExhdXJlbnQg
TW9yaWNoZXR0aSA8bGF1cmVudC5tb3JpY2hldHRpQGFtZC5jb20+Cj4+PiBSZXZpZXdlZC1ieTog
Q2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+Pj4KPj4+IEdvaW5n
IHRvIHBpY2sgdGhhdCB1cCBmb3IgaW5jbHVzaW9uIGluIGRybS1taXNjLW5leHQuCj4+IFRoYW5r
cy4gSSdsbCBzdWJtaXQgaXQgdG8gYW1kLXN0YWdpbmctZHJtLW5leHQgc28gaXQgbWFrZXMgaXRz
IHdheSBpbnRvCj4+IG91ciBES01TIGJyYW5jaCBxdWlja2x5Lgo+Pgo+PiBBbGV4LCB3b3VsZCB5
b3UgcHVzaCB0aGlzIHRvIGRybS1maXhlcz8KPj4KPj4gUmVnYXJkcywKPj4gICAgRmVsaXgKPj4K
Pj4KPj4+PiAtLS0KPj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5jIHwgNCAr
KystCj4+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMK
Pj4+PiBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMKPj4+PiBpbmRleCAzODkxMjhi
OGM0ZGQuLjYwYjQxNDQ3YmVjOCAxMDA2NDQKPj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRt
L3R0bV9ib192bS5jCj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYwo+
Pj4+IEBAIC00MDUsOCArNDA1LDEwIEBAIHN0YXRpYyBpbnQgdHRtX2JvX3ZtX2FjY2Vzc19rbWFw
KHN0cnVjdAo+Pj4+IHR0bV9idWZmZXJfb2JqZWN0ICpibywKPj4+PiAgICBpbnQgdHRtX2JvX3Zt
X2FjY2VzcyhzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwgdW5zaWduZWQgbG9uZyBhZGRyLAo+
Pj4+ICAgICAgICAgICAgICAgICB2b2lkICpidWYsIGludCBsZW4sIGludCB3cml0ZSkKPj4+PiAg
ICB7Cj4+Pj4gLSAgICB1bnNpZ25lZCBsb25nIG9mZnNldCA9IChhZGRyKSAtIHZtYS0+dm1fc3Rh
cnQ7Cj4+Pj4gICAgICAgIHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8gPSB2bWEtPnZtX3By
aXZhdGVfZGF0YTsKPj4+PiArICAgIHVuc2lnbmVkIGxvbmcgb2Zmc2V0ID0gKGFkZHIpIC0gdm1h
LT52bV9zdGFydCArCj4+Pj4gKyAgICAgICAgKCh2bWEtPnZtX3Bnb2ZmIC0gZHJtX3ZtYV9ub2Rl
X3N0YXJ0KCZiby0+YmFzZS52bWFfbm9kZSkpCj4+Pj4gKyAgICAgICAgIDw8IFBBR0VfU0hJRlQp
Owo+Pj4+ICAgICAgICBpbnQgcmV0Owo+Pj4+ICAgICAgICAgIGlmIChsZW4gPCAxIHx8IChvZmZz
ZXQgKyBsZW4pID4+IFBBR0VfU0hJRlQgPiBiby0+bnVtX3BhZ2VzKQo+PiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBkcmktZGV2ZWwgbWFpbGluZyBs
aXN0Cj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4gaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKPgo+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
