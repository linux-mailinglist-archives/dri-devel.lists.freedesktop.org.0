Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EA24E73B
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 13:37:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 604DA6E878;
	Fri, 21 Jun 2019 11:37:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3207C6E876;
 Fri, 21 Jun 2019 11:37:53 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 207so6049478wma.1;
 Fri, 21 Jun 2019 04:37:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=pStZf5AtUalhuMBmeeH+797eVA6nbSuA/Zo1DMq+nxE=;
 b=k/kLjxpJkRllVoxHGcwzlAD3UlFnVnS/PVATMsHCdw3kdTo6fn6e+IQq3fA6IhPf9/
 Bo005rFq7bAsECQFUsxQUhQ8h6P4hvz4d2wLUCKn+45v/NWPjlc5oxAc7reY4KVU0pyX
 wpYU1aBUOMaA/GdeB1mSSHREiPpmpUzEJLkzMhs2Kf1BYBQlw+/HC7DTHfSMsExXWLAj
 EVu9ycOSBWnycn/Lt113oW9nRw9NYA/UMloiW/fmSuq3TN/zoZA1G8Cl5rkhrzrIfIZz
 5y8ongLqVuVAFUbPQZreh8TQX1U4197nXDNqUiK1Mlwzx4r3i7u7tXmXvs/MvgzHhWo7
 ghnw==
X-Gm-Message-State: APjAAAWM4r/MCse5DVyrQD4/QODLAClOCVAfTVJJhLhmPMmQGhYv5LjU
 uLchvIFabHnVmDp5budybnuAj53n
X-Google-Smtp-Source: APXvYqxqvIJQkvDTjfNOcAXqxL2my7IgmO9GfqbU7pTHuMIDsDeSh+Q61cFwcqFpA2UJxsPOpU+tLA==
X-Received: by 2002:a7b:c247:: with SMTP id b7mr200977wmj.13.1561117071717;
 Fri, 21 Jun 2019 04:37:51 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id g8sm1810431wme.20.2019.06.21.04.37.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 21 Jun 2019 04:37:51 -0700 (PDT)
Subject: Re: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
To: Daniel Vetter <daniel@ffwll.ch>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
References: <20190527081741.14235-1-emil.l.velikov@gmail.com>
 <20190614120927.GA32412@arch-x1c3>
 <9dbdda6c-8916-e5ae-1676-86828b9890e7@amd.com>
 <20190614155325.GC32412@arch-x1c3>
 <84b3337c-0cdc-44d4-02c6-c56bd729ed47@amd.com>
 <20190620163012.GF1896@arch-x1c3>
 <9cad6e74-4751-0b0a-35d1-e8f0ac4d3efc@amd.com>
 <20190621090953.GZ12905@phenom.ffwll.local>
 <be9f38f5-6bb5-9535-f3d9-bafa83370e0f@amd.com>
 <CAKMK7uE5qO4q3RYNDp22gkMSSJGgz9ChxhuWPYqXO6D1UUvy6Q@mail.gmail.com>
 <20190621102015.GA21486@arch-x1c3>
 <d241fab3-b6f0-d38a-b83f-03b70736b355@amd.com>
 <CAKMK7uEVziNZJES9=JFBUu=LpmubS8=-A654cMN+QqhEmc8Fvw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <c92dc683-6815-dc5a-dc2b-54517cc027de@gmail.com>
Date: Fri, 21 Jun 2019 13:37:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uEVziNZJES9=JFBUu=LpmubS8=-A654cMN+QqhEmc8Fvw@mail.gmail.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=pStZf5AtUalhuMBmeeH+797eVA6nbSuA/Zo1DMq+nxE=;
 b=uXgl8GKHCnwYosoFH0UbONr677QGD82mvFGhEQn8EI/+iG5TiKAG2z49X2qnpcqt7d
 TDwDrnmQ8VMkWLXgoertHDiHGaloxifjbkDR08DsFpsSD9sWunnBxnbCdM9c+HLT8qlT
 CkDR0c8QvYj3nO51ni5DymXhSCA8TjlWE6fn4TWyQa4yo40Mon/Dr+Ua7qm7OItMU2BL
 mhJgOYwAVKqMmkamkQHuA/g9MB4XwDtKKiTNDQ7INZ8SlIH/yO3AshFgqD4hbuVxlMmA
 VO5dS9Ubjlty/otUSuJjLbqcXKBXjlyWMw+rz3S2HS8fPdVMiB1AgsaXxvO7Zj+8YEEG
 G59Q==
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
Reply-To: christian.koenig@amd.com
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 David Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjEuMDYuMTkgdW0gMTM6MDMgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIEZyaSwgSnVu
IDIxLCAyMDE5IGF0IDEyOjMxIFBNIEtvZW5pZywgQ2hyaXN0aWFuCj4gPENocmlzdGlhbi5Lb2Vu
aWdAYW1kLmNvbT4gd3JvdGU6Cj4+IEFtIDIxLjA2LjE5IHVtIDEyOjIwIHNjaHJpZWIgRW1pbCBW
ZWxpa292Ogo+Pj4gSW4gcGFydGljdWxhciwgdGhhdCB1c2VyLXNwYWNlIHdpbGwgInJlbW92ZSIg
cmVuZGVyIG5vZGVzLgo+PiBZZXMsIHRoYXQgaXMgbXkgbWFpbiBjb25jZXJuIGhlcmUuIFlvdSBi
YXNpY2FsbHkgbWFrZSByZW5kZXIgbm9kZXMKPj4gc3VwZXJmbHVvdXNseS4gVGhhdCBnaXZlcyB1
c2Vyc3BhY2UgYWxsIGxlZ2l0aW1pemF0aW9uIHRvIGFsc28gcmVtb3ZlCj4+IHN1cHBvcnQgZm9y
IHRoZW0uIFRoYXQgaXMgbm90IHN0dXBpZCBvciBldmlsIG9yIHdoYXRldmVyLCB1c2Vyc3BhY2UK
Pj4gd291bGQganVzdCBmb2xsb3cgdGhlIGtlcm5lbCBkZXNpZ24uCj4gVGhpcyBhbHJlYWR5IGhh
cHBlbmVkLiBBdCBsZWFzdCBmb3Iga21zLW9ubHkgZGlzcGxheSBzb2NzIHdlIGhhZCB0bwo+IGhp
ZGUgdGhlIHNlcGFyYXRlIHJlbmRlciBub2RlIChhbmQgdGhlcmUgeW91IHJlYWxseSBoYXZlIHRv
IGRlYWwgd2l0aAo+IHRoZSBzZXBhcmF0ZSByZW5kZXIgbm9kZSwgYmVjYXVzZSBpdCdzIGEgZGlz
dGluY3QgZHJpdmVyKSBlbnRpcmVseQo+IHdpdGhpbiBnYm0vbWVzYS4KCk9rLCB0aGF0IGlzIHNv
bWV0aGluZyBJIGRpZG4ndCBrbmV3IGJlZm9yZSBhbmQgaXMgcmF0aGVyIGludGVyZXN0aW5nLgoK
PiBTbyBpZiB5b3Ugd2FudCB0byBkZXByYWNhdGUgcmVuZGVyIGZ1bmN0aW9uYWxpdHkgb24gcHJp
bWFyeSBub2RlcywgeW91Cj4gX2hhdmVfIHRvIGRvIHRoYXQgaGlkaW5nIGluIHVzZXJzcGFjZS4g
T3IgeW91J2xsIGJyZWFrIGEgbG90IG9mCj4gY29tcG9zaXRvcnMgZXZlcnl3aGVyZS4gSnVzdCB0
ZXN0aW5nIC1hbWRncHUgZG9lc24ndCByZWFsbHkgcHJvdmUKPiBhbnl0aGluZyBoZXJlLiBTbyB5
b3Ugd29uJ3QgbW92ZSB0aGUgbGFyZ2VyIGVjb3N5c3RlbSB3aXRoIHRoaXMgYXQKPiBhbGwsIHRo
YXQgc2hpcCBzYWlsZWQuCgpTbyB3aGF0IGVsc2UgY2FuIHdlIGRvPyBUaGF0IHNvdW5kcyBsaWtl
IHlvdSBzdWdnZXN0IHdlIHNob3VsZCAKY29tcGxldGVseSBkcm9wIHJlbmRlciBub2RlIGZ1bmN0
aW9uYWxpdHkuCgpJIG1lYW4gaXQncyBub3QgbXkgcHJlZmVycmVkIG9wdGlvbiwgYnV0IGNlcnRh
aW5seSBzb21ldGhpbmcgdGhhdCAKZXZlcnlib2R5IGNvdWxkIGRvLgoKTXkgcHJpbWFyeSBjb25j
ZXJuIGlzIHRoYXQgd2Ugc29tZWhvdyBuZWVkIHRvIGdldCByaWQgb2YgdGhpbmtzIGxpa2UgR0VN
IApmbGluayBhbmQgYWxsIHRoYXQgb3RoZXIgY3J1ZnR5IHN0dWZmIHdlIHN0aWxsIGhhdmUgYXJv
dW5kIG9uIHRoZSAKcHJpbWFyeSBub2RlICh3ZSBzaG91bGQgcHJvYmFibHkgbWFrZSBhIGxpc3Qg
b2YgdGhhdCkuCgpTd2l0Y2hpbmcgZXZlcnl0aGluZyBvdmVyIHRvIHJlbmRlciBub2RlcyBqdXN0
IHNvdW5kZWQgbGlrZSB0aGUgYmVzdCAKYWx0ZXJuYXRpdmUgc28gZmFyIHRvIGFyY2hpdmUgdGhh
dC4KCj4gQXQgdGhhdCBwb2ludCB0aGlzIGFsbCBmZWVscyBsaWtlIGEgYmlrZXNoZWQsIGFuZCBm
b3IgYSBiaWtlc2hlZCBJCj4gZG9uJ3QgY2FyZSB3aGF0IHRoZSBjb2xvciBpcyB3ZSBwaWNrLCBh
cyBsb25nIGFzIHRoZXkncmUgYWxsIHBhaW50ZWQKPiB0aGUgc2FtZS4KPgo+IE9uY2Ugd2UgcGlj
a2VkIGEgY29sb3IgaXQncyBhIHNpbXBsZSB0ZWNobmljYWwgbWF0dGVyIG9mIGhvdyB0byByb2xs
Cj4gaXQgb3V0LCB1c2luZyBLY29uZmlnIG9wdGlvbnMsIG9yIG9ubHkgZW5hYmxpbmcgb24gbmV3
IGh3LCBvciAibWVyZ2UKPiBhbmQgZml4IHRoZSByZWdyZXNzaW9ucyBhcyB0aGV5IGNvbWUiIG9y
IGFueSBvZiB0aGUgb3RoZXIgd2VsbCBwcm92ZW4KPiBwYXRocyBmb3J3YXJkLgoKWWVhaCwgdGhl
IHByb2JsZW0gaXMgSSBkb24ndCBzZWUgYW4gb3B0aW9uIHdoaWNoIGN1cnJlbnRseSB3b3JrcyBm
b3IgCmV2ZXJ5b25lLgoKSSBhYnNvbHV0ZWx5IG5lZWQgYSBncmFjZSB0aW1lIG9mIG11bHRpcGxl
IHllYXJzIHVudGlsIHdlIGNhbiBhcHBseSB0aGlzIAp0byBhbWRncHUvcmFkZW9uLgoKQW5kIHRo
YXQgdW5kZXIgdGhlIHByZXJlcXVpc2l0ZSB0byBoYXZlIGEgcGxhbiB0byBzb21laG93IGVuYWJs
ZSB0aGF0IApmdW5jdGlvbmFsaXR5IG5vdyB0byBtYWtlIGl0IGF0IGxlYXN0IHBhaW5mdWwgZm9y
IHVzZXJzcGFjZSB0byByZWx5IG9uIApoYWNrIGFyb3VuZCB0aGF0LgoKPiBTbyBpZiB5b3Ugd2Fu
dCB0byBkbyB0aGlzLCBwbGVhc2Ugc3RhcnQgd2l0aCB0aGUgbWVzYSBzaWRlIHdvcmsgKGFzCj4g
dGhlIGJpZ2dlc3QgdXNlcnNwYWNlLCBub3QgYWxsIG9mIGl0KSB3aXRoIHBhdGNoZXMgdG8gcmVk
aXJlY3QgYWxsCj4gcHJpbWFyeSBub2RlIHJlbmRlcmluZyB0byByZW5kZXIgbm9kZXMuIFRoZSBj
b2RlIGlzIHRoZXJlIGFscmVhZHkgZm9yCj4gc29jcywganVzdCBuZWVkcyB0byBiZSByb2xsZWQg
b3V0IG1vcmUuIE9yIHdlIGdvIHdpdGggdGhlIERSTV9BVVRICj4gaG9ycm9ycy4gT3IgYSAzcmQg
b3B0aW9uLCBJIHJlYWxseSBkb24ndCBjYXJlIHdoaWNoIGl0IGlzLCBhcyBsb25nIGFzCj4gaXRz
IGNvbnNpc3RlbnQuCgpIb3cgYWJvdXQgdGhpczoKMS4gV2Uga2VlcCBEUk1fQVVUSCBhcm91bmQg
Zm9yIGFtZGdwdS9yYWRlb24gZm9yIG5vdy4KMi4gV2UgYWRkIGEgS2NvbmZpZyBvcHRpb24gdG8g
aWdub3JlIERSTV9BVVRILCBjdXJyZW50bHkgZGVmYXVsdCB0byBOLiAKVGhpcyBhbHNvIHdvcmtz
IGFzIGEgd29ya2Fyb3VuZCBmb3Igb2xkIFJBRFYuCjMuIFdlIHN0YXJ0IHRvIHdvcmsgb24gZnVy
dGhlciByZW1vdmluZyBvbGQgY3J1ZnQgZnJvbSB0aGUgcHJpbWFyeSBub2RlLiAKUG9zc2libGUg
dGhlIEtjb25maWcgb3B0aW9uIEkgc3VnZ2VzdGVkIHRvIGRpc2FibGUgR0VNIGZsaW5rLgoKUmVn
YXJkcywKQ2hyaXN0aWFuLgoKPgo+IHRsZHI7IGNvbnNpc3RlbnQgY29sb3IgY2hvaWNlIG9uIHRo
aXMgYmlrZXNoZWQgcGxlYXNlLgo+Cj4gVGhhbmtzLCBEYW5pZWwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
