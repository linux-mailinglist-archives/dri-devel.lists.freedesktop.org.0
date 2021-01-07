Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 155A52ED037
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 13:49:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CAE06E442;
	Thu,  7 Jan 2021 12:49:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27CE36E442
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 12:49:49 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id c124so5048836wma.5
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jan 2021 04:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=hla4d7gI/Vk3zVnP7eMMfHIYnMzETKxmxM+uIytR0tU=;
 b=Fla+sEsisOG0vfQiDbLkAiB1PgX4U8Su6/nhWDPC37qEj02/7fir698mbV9B9JZ5+O
 kYQTIhZpMd5FdhEbPqjnYcnR/3c+0+jLs+eVqmuSVCB7Qf3+IIeWiFsrZ8U++ssgfCsd
 WUEedS0voFVQibxKCOwS6IQF1+GfyggS/xNE17wBq9XZLiENmKBA0BJTSg5FOJIIZu2p
 kg26Ppv71ysJS46WDCluv8cEHgdhET0703QpY4fW5/R1VTi2xCm/vuH/rUMGmcNw6+gV
 kw1Yxhl3QFc8dkTZdLgIjUUVEys3Z5wK9XOk54HTnCM77z/IQanEqK8DgbGqFPcF9he0
 b8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=hla4d7gI/Vk3zVnP7eMMfHIYnMzETKxmxM+uIytR0tU=;
 b=cRlXoX2sxyEQySNZ8VoChxv6fCKTwuO1xcma2I2GymKBZ9AHesQa5ZoVclArP0R4Hm
 0tWcGUeeW+7NC4k/ZsjIkycAyYh0W1gMtt9i0/ETKvExVx7gNsby4laCtZRGE8o15mv6
 VcaAa3ygKb+WEoYcDxWhZuRjsMEHcys8dLSxPss1NEo2755tQMzUsUuUzr+iwe9J5117
 rwP9RuPbBqwvxbsTUPLT7R/oqL7p8WWy0E5xAOchu/kknkjtzN9EPVkFDN57bgD79pxh
 OVs5xu1kkUOY2zXPLCuKTOHk+AZVqb635wjIgl/SVY1gjMlXAqdmCtgzIXbQve7hjTJR
 j+cQ==
X-Gm-Message-State: AOAM530Ptcxu137qV617xxdrByfdQ3eCYe8qOxR4xlkCqtNMeQr+2ENu
 HuxbGNPovUMSE3POn3S1J6Q=
X-Google-Smtp-Source: ABdhPJztToi/iEaAxlnabZ/HTLu1MZB3NmW37xVPXKyc5IQS4RLjAFboJesglMas/jyBoYhz8nbCwg==
X-Received: by 2002:a05:600c:4e87:: with SMTP id
 f7mr3460436wmq.163.1610023787799; 
 Thu, 07 Jan 2021 04:49:47 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id j59sm8522308wrj.13.2021.01.07.04.49.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 04:49:47 -0800 (PST)
Subject: Re: [PATCH 4/4] drm/ttm: optimize ttm pool shrinker a bit
To: Daniel Vetter <daniel@ffwll.ch>
References: <20201218175538.1364-1-christian.koenig@amd.com>
 <20201218175538.1364-4-christian.koenig@amd.com>
 <X+H5+OuETFR7ePdp@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <9d9a41f7-20cd-c0e3-6438-e72bce57a5a4@gmail.com>
Date: Thu, 7 Jan 2021 13:49:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <X+H5+OuETFR7ePdp@phenom.ffwll.local>
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
Cc: ray.huang@amd.com, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjIuMTIuMjAgdW0gMTQ6NTEgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIEZyaSwgRGVj
IDE4LCAyMDIwIGF0IDA2OjU1OjM4UE0gKzAxMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+
IE9ubHkgaW5pdGlhbGl6ZSB0aGUgRE1BIGNvaGVyZW50IHBvb2xzIGlmIHRoZXkgYXJlIHVzZWQu
Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdA
YW1kLmNvbT4KPiBBaCwganVzdCByZWFsaXplZCB0aGUgYW5zd2VyIHRvIG15IHF1ZXN0aW9uIG9u
IHBhdGNoIDI6IFRoZSBwb29scyBhcmUKPiBwZXItZGV2aWNlLCBkdWUgdG8gZG1hX2FsbG9jX2Nv
aGVyZW50IGJlaW5nIHBlci1kZXZpY2UgKGJ1dCByZWFsbHkgbW9zdGx5Cj4gaXQgaXNuJ3QsIGJ1
dCB0aGF0J3Mgd2hhdCB3ZSBoYXZlIHRvIGRlYWwgd2l0aCBmaWdodGluZyB0aGUgZG1hLWFwaQo+
IGFic3RyYWN0aW9uKS4KPgo+IEkgdGhpbmsgdGhpcyB3b3VsZCBtYWtlIGEgbG90IG1vcmUgc2Vu
c2UgaWYgdGhlIHNocmlua2VycyBhcmUgcGVyLXBvb2wKPiAoYW5kIGFsc28gbW9zdCBvZiB0aGUg
ZGVidWdmcyBmaWxlcyksIHNpbmNlIGFzLWlzIGluIGEgbXVsdGktZ3B1IHN5c3RlbQo+IHRoZSBm
aXJzdCBncHUncyBwb29sIGdldHMgcHJlZmVycmVudGlhbGx5IHRocmFzaGVkLiBXaGljaCBpc24n
dCBhIG5pY2UKPiBkZXNpZ24uIFNwbGl0dGluZyB0aGF0IGludG8gcGVyIGdwdSBzaHJpbmtlcnMg
bWVhbnMgd2UgZ2V0IGVxdWFsIHNocmlua2luZwo+IHdpdGhvdXQgaGF2aW5nIHRvIG1haW50YWlu
IGEgZ2xvYmFsIGxydS4gVGhpcyBpcyBob3cgeGZzIHNlZW1zIHRvIHNldCB1cAo+IHRoZWlyIHNo
cmlua2VycywgYW5kIGluIGdlbmVyYWwgeGZzIHBlb3BsZSBoYXZlIGEgc29saWQgdW5kZXJzdGFu
ZGluZyBvZgo+IHRoaXMgc3R1ZmYuCgpXZWxsIGZhaXJuZXNzIGFuZCBub3QgdHJhc2hpbmcgdGhl
IGZpcnN0IEdQVXMgcG9vbCBpcyB0aGUgcmVhc29uIHdoeSBJIAppbXBsZW1lbnRlZCBqdXN0IG9u
ZSBzaHJpbmtlciBwbHVzIGEgZ2xvYmFsIExSVS4KCkluIG90aGVyIHdvcmRzIHNocmlua19zbGFi
KCkganVzdCB1c2VzIGxpc3RfZm9yX2VhY2hfZW50cnkoKSBvbiBhbGwgCnNocmlua2Vycy4KCklu
IHRoZSBwb29sIHNocmlua2VyIGNhbGxiYWNrIHNocmluayBvbmUgcG9vbCBhbmQgbW92ZSBpdCB0
byB0aGUgZW5kIG9mIAp0aGUgc2hyaW5rZXIgbGlzdC4KCj4KPiBBc2lkZTogSSB0aGluayBpdCBh
bHNvIHdvdWxkIG1ha2UgdG9ucyBvZiBzZW5zZSB0byBzcGxpdCB1cCB5b3VyIG5ldyB0dG0KPiBi
byBzaHJpbmtlciB1cCBpbnRvIGEgcGVyLWRldmljZSBscnUsIGFuZCB0aHJvdyB0aGUgZ2xvYmFs
IHN5c3RlbSBtZW1vcnkKPiBscnUgb3V0IHRoZSB3aW5kb3cgY29tcGxldGVseSA6LSkgQXNzdW1p
bmcgd2UgY2FuIGluZGVlZCBnZXQgcmlkIG9mIGl0LAo+IGFuZCB2bXdnZnggZG9lc24ndCBuZWVk
IGl0IHNvbWV3aGVyZSBzdGlsbC4KClllYWgsIEkgYWxyZWFkeSBoYXZlIHRoYXQgYXMgYSBwYXRj
aCBzZXQgaGVyZSwgYnV0IEkgaGF2ZSB0aGlzIGRlcGVuZGVudCAKb24gYSBsYXJnZXIgcmVuYW1l
IG9mIHRoZSBkZXZpY2Ugc3RydWN0dXJlcy4KCj4gQXNpZGUgZnJvbSB0aGlzIGxndG0sIGJ1dCBJ
IGd1ZXNzIHdpbGwgY2hhbmdlIGEgYml0IHdpdGggdGhhdCBzaHVmZmxpbmcuCgpUaGFua3MgZm9y
IHRoZSByZXZpZXcsIGdvaW5nIHRvIHNlbmQgb3V0IGEgbmV3IHZlcnNpb24gd2l0aCB0aGUgCmZz
X3JlY2xhaW1fYWNxdWlyZS9yZWxlYXNlIGFkZGVkIGluIGEgbWludXRlLgoKQ2hyaXN0aWFuLgoK
PiAtRGFuaWVsCj4KPj4gLS0tCj4+ICAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcG9vbC5jIHwg
MjMgKysrKysrKysrKysrKysrKy0tLS0tLS0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0
aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS90dG0vdHRtX3Bvb2wuYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3Bvb2wuYwo+PiBpbmRl
eCAxY2RhY2Q1ODc1M2EuLmYwOWUzNDYxNDIyNiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3R0bS90dG1fcG9vbC5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3Bvb2wu
Ywo+PiBAQCAtNTA0LDEwICs1MDQsMTIgQEAgdm9pZCB0dG1fcG9vbF9pbml0KHN0cnVjdCB0dG1f
cG9vbCAqcG9vbCwgc3RydWN0IGRldmljZSAqZGV2LAo+PiAgIAlwb29sLT51c2VfZG1hX2FsbG9j
ID0gdXNlX2RtYV9hbGxvYzsKPj4gICAJcG9vbC0+dXNlX2RtYTMyID0gdXNlX2RtYTMyOwo+PiAg
IAo+PiAtCWZvciAoaSA9IDA7IGkgPCBUVE1fTlVNX0NBQ0hJTkdfVFlQRVM7ICsraSkKPj4gLQkJ
Zm9yIChqID0gMDsgaiA8IE1BWF9PUkRFUjsgKytqKQo+PiAtCQkJdHRtX3Bvb2xfdHlwZV9pbml0
KCZwb29sLT5jYWNoaW5nW2ldLm9yZGVyc1tqXSwKPj4gLQkJCQkJICAgcG9vbCwgaSwgaik7Cj4+
ICsJaWYgKHVzZV9kbWFfYWxsb2MpIHsKPj4gKwkJZm9yIChpID0gMDsgaSA8IFRUTV9OVU1fQ0FD
SElOR19UWVBFUzsgKytpKQo+PiArCQkJZm9yIChqID0gMDsgaiA8IE1BWF9PUkRFUjsgKytqKQo+
PiArCQkJCXR0bV9wb29sX3R5cGVfaW5pdCgmcG9vbC0+Y2FjaGluZ1tpXS5vcmRlcnNbal0sCj4+
ICsJCQkJCQkgICBwb29sLCBpLCBqKTsKPj4gKwl9Cj4+ICAgfQo+PiAgIEVYUE9SVF9TWU1CT0wo
dHRtX3Bvb2xfaW5pdCk7Cj4+ICAgCj4+IEBAIC01MjMsOSArNTI1LDExIEBAIHZvaWQgdHRtX3Bv
b2xfZmluaShzdHJ1Y3QgdHRtX3Bvb2wgKnBvb2wpCj4+ICAgewo+PiAgIAl1bnNpZ25lZCBpbnQg
aSwgajsKPj4gICAKPj4gLQlmb3IgKGkgPSAwOyBpIDwgVFRNX05VTV9DQUNISU5HX1RZUEVTOyAr
K2kpCj4+IC0JCWZvciAoaiA9IDA7IGogPCBNQVhfT1JERVI7ICsraikKPj4gLQkJCXR0bV9wb29s
X3R5cGVfZmluaSgmcG9vbC0+Y2FjaGluZ1tpXS5vcmRlcnNbal0pOwo+PiArCWlmIChwb29sLT51
c2VfZG1hX2FsbG9jKSB7Cj4+ICsJCWZvciAoaSA9IDA7IGkgPCBUVE1fTlVNX0NBQ0hJTkdfVFlQ
RVM7ICsraSkKPj4gKwkJCWZvciAoaiA9IDA7IGogPCBNQVhfT1JERVI7ICsraikKPj4gKwkJCQl0
dG1fcG9vbF90eXBlX2ZpbmkoJnBvb2wtPmNhY2hpbmdbaV0ub3JkZXJzW2pdKTsKPj4gKwl9Cj4+
ICAgfQo+PiAgIEVYUE9SVF9TWU1CT0wodHRtX3Bvb2xfZmluaSk7Cj4+ICAgCj4+IEBAIC02MzAs
NiArNjM0LDExIEBAIGludCB0dG1fcG9vbF9kZWJ1Z2ZzKHN0cnVjdCB0dG1fcG9vbCAqcG9vbCwg
c3RydWN0IHNlcV9maWxlICptKQo+PiAgIHsKPj4gICAJdW5zaWduZWQgaW50IGk7Cj4+ICAgCj4+
ICsJaWYgKCFwb29sLT51c2VfZG1hX2FsbG9jKSB7Cj4+ICsJCXNlcV9wdXRzKG0sICJ1bnVzZWRc
biIpOwo+PiArCQlyZXR1cm4gMDsKPj4gKwl9Cj4+ICsKPj4gICAJdHRtX3Bvb2xfZGVidWdmc19o
ZWFkZXIobSk7Cj4+ICAgCj4+ICAgCXNwaW5fbG9jaygmc2hyaW5rZXJfbG9jayk7Cj4+IC0tIAo+
PiAyLjI1LjEKPj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
