Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A43357A68
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 06:06:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FC306E594;
	Thu, 27 Jun 2019 04:06:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 622796E593;
 Thu, 27 Jun 2019 04:06:26 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id n4so714644wrw.13;
 Wed, 26 Jun 2019 21:06:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iNi33UsrcZabG2rtkEFPJo5DLbTb5NiEUTMbPl3SZiY=;
 b=Xp0uCnFlCR7K+vPe6C8yN9sOc5PhYnpJloBzRhPWLbVmqyaCSlTfysQvmBMwYQ0Cv/
 bsmXbDtXnnlsSg+o+FECoyN0VfRITShD4sCBepchF5b+LvNYX0T4Wey5b+LzAYCvmCME
 ndW5wTADXe4fG1gHGm0sCutIKcPEvF7oFLGM7BqnfHg5WYVOQOQpl4BZ3cNTyGVwtuBo
 GOGpueW548j9qgdtGQM6wlgXcCJ3oUsH/K/mKmHzV8T229oGh5k++qDgs4rFY5D8cQSl
 JKKoYy06F7J44zPkAb/AG/2oHoDN7+12RlLSGaXzxB4DkjHddWGu8P98MnYiDYQyQaYS
 1J8w==
X-Gm-Message-State: APjAAAUMTKUqH/eaNSmfq0IROZ5B+t3A4r2s5+0Q59n5NTtLqrnPbnTL
 HqGvx32fNqCctc8hynQig0tE6nsyLozaf5blFyl+RVOeODOFjkCK
X-Google-Smtp-Source: APXvYqw86bLPt4ODs+Zzk5ysYoOIt0guhmnBh3NUxccT3laCdm0JKQEWDvbao2XiWiRQ/jafWP1jF07OVnjQoqYa+94=
X-Received: by 2002:a05:6000:11cc:: with SMTP id
 i12mr1051293wrx.243.1561608384892; 
 Wed, 26 Jun 2019 21:06:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190626150522.11618-1-Kenny.Ho@amd.com>
 <20190626150522.11618-8-Kenny.Ho@amd.com>
 <20190626161254.GS12905@phenom.ffwll.local>
In-Reply-To: <20190626161254.GS12905@phenom.ffwll.local>
From: Kenny Ho <y2kenny@gmail.com>
Date: Thu, 27 Jun 2019 00:06:13 -0400
Message-ID: <CAOWid-f3kKnM=4oC5Bba5WW5WNV2MH5PvVamrhO6LBr5ydPJQg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 07/11] drm, cgroup: Add TTM buffer allocation stats
To: Daniel Vetter <daniel@ffwll.ch>, Brian Welty <brian.welty@intel.com>,
 kraxel@redhat.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=iNi33UsrcZabG2rtkEFPJo5DLbTb5NiEUTMbPl3SZiY=;
 b=ZJKgpHwHD/1e5tsbu0ItQYlEY4jZC0lTNEz5tt6LD3YfMeKWvBbANkR/8canqSYoqp
 TjfUjPVh5FWrbTtsM/b3h80D49l8V6iOVnz8zbUnNNG+lb4o2zT7AjvU55CKOihBKAhI
 2xjFVH4s5eUPw8My4SajXq/O0bnynwOW2FaORTXMcSm/62fmDosRUYX0d4yx5PjZjK0L
 KmijQUGbTH7l4kVzavshTjq8Ec7FQyv2z2+nAcS6vMdvhutWiRiBFLlL6MO4ms+nbwyz
 chrubA4NhImXhZGg+1KIovgikA34eOUTuLWgJb2poqn6xr35Jm+D7jii/3C2jkVhhHE7
 O4zw==
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
Cc: Kenny Ho <Kenny.Ho@amd.com>, jsparks@cray.com,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, lkaplan@cray.com,
 Alex Deucher <alexander.deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, joseph.greathouse@amd.com,
 Tejun Heo <tj@kernel.org>, cgroups@vger.kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMTI6MTIgUE0gRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZm
d2xsLmNoPiB3cm90ZToKPgo+IE9uIFdlZCwgSnVuIDI2LCAyMDE5IGF0IDExOjA1OjE4QU0gLTA0
MDAsIEtlbm55IEhvIHdyb3RlOgo+ID4gZHJtLm1lbW9yeS5zdGF0cwo+ID4gICAgICAgICBBIHJl
YWQtb25seSBuZXN0ZWQta2V5ZWQgZmlsZSB3aGljaCBleGlzdHMgb24gYWxsIGNncm91cHMuCj4g
PiAgICAgICAgIEVhY2ggZW50cnkgaXMga2V5ZWQgYnkgdGhlIGRybSBkZXZpY2UncyBtYWpvcjpt
aW5vci4gIFRoZQo+ID4gICAgICAgICBmb2xsb3dpbmcgbmVzdGVkIGtleXMgYXJlIGRlZmluZWQu
Cj4gPgo+ID4gICAgICAgICAgID09PT09PSAgICAgICAgID09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PQo+ID4gICAgICAgICAgIHN5c3RlbSAgICAgICAgIEhvc3Qv
c3lzdGVtIG1lbW9yeQo+Cj4gU2hvdWxkbid0IHRoYXQgYmUgY292ZXJlZCBieSBnZW0gYm8gc3Rh
dHMgYWxyZWFkeT8gQWxzbywgc3lzdGVtIG1lbW9yeSBpcwo+IGRlZmluaXRlbHkgc29tZXRoaW5n
IGEgbG90IG9mIG5vbi10dG0gZHJpdmVycyB3YW50IHRvIGJlIGFibGUgdG8gdHJhY2ssIHNvCj4g
dGhhdCBuZWVkcyB0byBiZSBzZXBhcmF0ZSBmcm9tIHR0bS4KVGhlIGdlbSBibyBzdGF0cyBjb3Zl
cnMgYWxsIG9mIHRoZXNlIHR5cGUuICBJIGFtIHRyZWF0IHRoZSBnZW0gc3RhdHMKYXMgbW9yZSBv
ZiB0aGUgZnJvbnQgZW5kIGFuZCBhIGhhcmQgbGltaXQgYW5kIHRoaXMgc2V0IG9mIHN0YXRzIGFz
IHRoZQpiYWNraW5nIHN0b3JlIHdoaWNoIGNhbiBiZSBvZiB2YXJpb3VzIHR5cGUuICBIb3cgZG9l
cyBub24tdHRtIGRyaXZlcnMKaWRlbnRpZnkgdmFyaW91cyBtZW1vcnkgdHlwZXM/Cgo+ID4gICAg
ICAgICAgIHR0ICAgICAgICAgICAgIEhvc3QgbWVtb3J5IHVzZWQgYnkgdGhlIGRybSBkZXZpY2Ug
KEdUVC9HQVJUKQo+ID4gICAgICAgICAgIHZyYW0gICAgICAgICAgIFZpZGVvIFJBTSB1c2VkIGJ5
IHRoZSBkcm0gZGV2aWNlCj4gPiAgICAgICAgICAgcHJpdiAgICAgICAgICAgT3RoZXIgZHJtIGRl
dmljZSwgdmVuZG9yIHNwZWNpZmljIG1lbW9yeQo+Cj4gU28gd2hhdCdzICJwcml2Ii4gSW4gZ2Vu
ZXJhbCBJIHRoaW5rIHdlIG5lZWQgc29tZSB3YXkgdG8gcmVnaXN0ZXIgdGhlCj4gZGlmZmVyZW50
IGtpbmRzIG9mIG1lbW9yeSwgZS5nLiBzdHVmZiBub3QgaW4geW91ciBsaXN0Ogo+Cj4gLSBtdWx0
aXBsZSBraW5kcyBvZiB2cmFtIChsaWtlIG51bWEtc3R5bGUgZ3B1cykKPiAtIGNtYSAoZm9yIGFs
bCB0aG9zZSBub24tdHRtIGRyaXZlcnMgdGhhdCdzIGEgYmlnIG9uZSwgaXQncyBsaWtlIHN5c3Rl
bQo+ICAgbWVtb3J5IGJ1dCBhbHNvIHRvdGFsbHkgZGlmZmVyZW50KQo+IC0gYW55IGNhcnZlb3V0
cyBhbmQgc3R1ZmYKcHJpdnMgYXJlIHZlbmRvciBzcGVjaWZpYywgd2hpY2ggaXMgd2h5IEkgaGF2
ZSB0cnVuY2F0ZWQgaXQuICBGb3IKZXhhbXBsZSwgQU1EIGhhcyBBTURHUFVfUExfR0RTLCBHV1Ms
IE9BCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y1LjItcmM2L3NvdXJjZS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmgjTDMwCgpTaW5jZSB3ZSBhcmUgdXNp
bmcga2V5ZWQgZmlsZSB0eXBlLCB3ZSBzaG91bGQgYmUgYWJsZSB0byBzdXBwb3J0CnZlbmRvciBz
cGVjaWZpYyBtZW1vcnkgdHlwZSBidXQgSSBhbSBub3Qgc3VyZSBpZiB0aGlzIGlzIGFjY2VwdGFi
bGUgdG8KY2dyb3VwIHVwc3RyZWFtLiAgVGhpcyBpcyB3aHkgSSBzdGljayB0byB0aGUgMyBtZW1v
cnkgdHlwZSB0aGF0IGlzCmNvbW1vbiBhY3Jvc3MgYWxsIHR0bSBkcml2ZXJzLgoKPiBJIHRoaW5r
IHdpdGggYWxsIHRoZSB0dG0gcmVmYWN0b3JpbmcgZ29pbmcgb24gSSB0aGluayB3ZSBuZWVkIHRv
IGRlLXR0bQo+IHRoZSBpbnRlcmZhY2UgZnVuY3Rpb25zIGhlcmUgYSBiaXQuIFdpdGggR2VyZCBI
b2ZmbWFucyBzZXJpZXMgeW91IGNhbiBqdXN0Cj4gdXNlIGEgZ2VtX2JvIHBvaW50ZXIgaGVyZSwg
c28gd2hhdCdzIGxlZnQgdG8gZG8gaXMgaGF2ZSBzb21lIGV4dHJhY3RlZAo+IHN0cnVjdHVyZSBm
b3IgdHJhY2tpbmcgbWVtb3J5IHR5cGVzLiBJIHRoaW5rIEJyaWFuIFdlbHR5IGhhcyBzb21lIGlk
ZWFzCj4gZm9yIHRoaXMsIGV2ZW4gaW4gcGF0Y2ggZm9ybS4gV291bGQgYmUgZ29vZCB0byBrZWVw
IGhpbSBvbiBjYyBhdCBsZWFzdCBmb3IKPiB0aGUgbmV4dCB2ZXJzaW9uLiBXZSdkIG5lZWQgdG8g
ZXhwbGljaXRseSBoYW5kIGluIHRoZSB0dG1fbWVtX3JlZyAob3IKPiB3aGF0ZXZlciB0aGUgc3Bl
Y2lmaWMgdGhpbmcgaXMgZ29pbmcgdG8gYmUpLgoKSSBhc3N1bWUgR2VyZCBIb2ZmbWFuJ3Mgc2Vy
aWVzIHlvdSBhcmUgcmVmZXJyaW5nIHRvIGlzIHRoaXMgb25lPwpodHRwczovL3d3dy5zcGluaWNz
Lm5ldC9saXN0cy9kcmktZGV2ZWwvbXNnMjE1MDU2Lmh0bWwKCkkgY2FuIGNlcnRhaW5seSBrZWVw
IGFuIGV5ZSBvdXQgZm9yIEdlcmQncyByZWZhY3RvcmluZyB3aGlsZQpyZWZhY3RvcmluZyBvdGhl
ciBwYXJ0cyBvZiB0aGlzIFJGQy4KCkkgaGF2ZSBhZGRlZCBCcmlhbiBhbmQgR2VyZCB0byB0aGUg
dGhyZWFkIGZvciBhd2FyZW5lc3MuCgpSZWdhcmRzLApLZW5ueQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
