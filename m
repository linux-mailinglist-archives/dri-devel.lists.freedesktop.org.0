Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBDE2B8E96
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 10:21:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D82886E511;
	Thu, 19 Nov 2020 09:21:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8F6F6E511
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 09:21:54 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id s25so6890494ejy.6
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 01:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=mUt6Blrw3N8cwhc05NT4wjTTu8HjH20ocM1BeUPSt1U=;
 b=c29Qjgxij3tGxfrOjUhTVSqZBhRJF0n987CPmhWsK+Zj7MAnV/XhdC1hb6AgeWi/8l
 0KZ5FFDcHcFEUqs9AAWDns4ojYe5h7Xxhw6y/OU1KwNhEFXnvR7HCArCdxBFDxEdpSvH
 elIpKNNf1lrb1OKUXMIK/x1jz6aHb47SkHX4sC2VI/4aU8zy60GxAWVDPiA9C1jTDa1o
 v7dVKKYDFcld8Z4H3kFJZHXr83co9bEcDsObRams41fi5w+VwC5uXvgO+7tvlEbDkLYy
 EdNHU4fqkV36mYnzHIKI1qWqxwWCLYgAI+PlWGliIn47EXqD9dRExNnKPJur5yC1J0pS
 HvQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=mUt6Blrw3N8cwhc05NT4wjTTu8HjH20ocM1BeUPSt1U=;
 b=SzomtrqvQ/c6STT2xuLzlVkGZ0mbxKsQXOblm7pf4r4KxRtRhEsV1mOqxv9ljbobQi
 FCamu+y8gZQP67Mp1/Bwd2zLTXYG2N4NhbKAaZxw/k7S3KiHabUtSVXNsdPKD7Vf5iyL
 +mBF8VArIeiCNPQgKbs56U0Lr4XECCt9WpJECl7oGIkBKBp3PZ82BpfXQKqnJhui/OGM
 /OFsw13M2oS2AefTgaZ5lHGOupbPcw19WyHFsYS3kaO21labxnYA1IbeZ6rPExB9kIvk
 39Z6W1kxng7oXgAdUS9Cfje364Wdntrn6I4clEbml8yf5khtVxVGdQWL/lloRgRJ8pmG
 hASQ==
X-Gm-Message-State: AOAM530OTZxr+OzBY+woiNT7hvvYfCa01Oh+wWbdmn3sFwddAGdyvYdl
 5MHNamnTe3MLoouybfi6/2A=
X-Google-Smtp-Source: ABdhPJz57pgxpsT5PFt70sY8ZSXYhj/Z6dpG5LUc3GtQHvDLY8Z/o4rHGtAsZSV0N0ElMVLYMEZ1Hg==
X-Received: by 2002:a17:906:e2c3:: with SMTP id
 gr3mr26919095ejb.471.1605777713300; 
 Thu, 19 Nov 2020 01:21:53 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id 65sm14952542edj.83.2020.11.19.01.21.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 01:21:52 -0800 (PST)
Subject: Re: [PATCH] drm/ttm: fix DMA32 handling in the global page pool
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 "Zhou, David(ChunMing)" <David1.Zhou@amd.com>, Huang Rui <ray.huang@amd.com>
References: <20201117155334.7855-1-christian.koenig@amd.com>
Message-ID: <cd99b824-f08b-f06c-bb0b-e25e6875f89a@gmail.com>
Date: Thu, 19 Nov 2020 10:21:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201117155334.7855-1-christian.koenig@amd.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UGluZywgY2FuIEkgZ2V0IGFuIHJiIG9yIGF0IGxlYXN0IEFja2VkLWJ5IGZvciB0aGlzPwoKVGhh
bmtzIGluIGFkdmFuY2UsCkNocmlzdGlhbi4KCkFtIDE3LjExLjIwIHVtIDE2OjUzIHNjaHJpZWIg
Q2hyaXN0aWFuIEvDtm5pZzoKPiBXaGVuIHdlIGhhdmUgbWl4ZWQgRE1BMzIgYW5kIG5vbiBETUEz
MiBkZXZpY2UgaW4gb25lIHN5c3RlbQo+IGl0IGNvdWxkIG90aGVyd2lzZSBoYXBwZW4gdGhhdCB0
aGUgRE1BMzIgZGV2aWNlIGdldHMgcGFnZXMKPiBpdCBjYW4ndCB3b3JrIHdpdGguCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4g
LS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wb29sLmMgfCAyMiArKysrKysrKysrKysr
KysrKysrKysrCj4gICAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3Bvb2wuYyBiL2RyaXZlcnMvZ3B1L2RybS90
dG0vdHRtX3Bvb2wuYwo+IGluZGV4IDFiOTY3ODBiNDk4OS4uNTQ1NWIyMDQ0NzU5IDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3Bvb2wuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS90dG0vdHRtX3Bvb2wuYwo+IEBAIC02Myw2ICs2Myw5IEBAIHN0YXRpYyBhdG9taWNfbG9u
Z190IGFsbG9jYXRlZF9wYWdlczsKPiAgIHN0YXRpYyBzdHJ1Y3QgdHRtX3Bvb2xfdHlwZSBnbG9i
YWxfd3JpdGVfY29tYmluZWRbTUFYX09SREVSXTsKPiAgIHN0YXRpYyBzdHJ1Y3QgdHRtX3Bvb2xf
dHlwZSBnbG9iYWxfdW5jYWNoZWRbTUFYX09SREVSXTsKPiAgIAo+ICtzdGF0aWMgc3RydWN0IHR0
bV9wb29sX3R5cGUgZ2xvYmFsX2RtYTMyX3dyaXRlX2NvbWJpbmVkW01BWF9PUkRFUl07Cj4gK3N0
YXRpYyBzdHJ1Y3QgdHRtX3Bvb2xfdHlwZSBnbG9iYWxfZG1hMzJfdW5jYWNoZWRbTUFYX09SREVS
XTsKPiArCj4gICBzdGF0aWMgc3BpbmxvY2tfdCBzaHJpbmtlcl9sb2NrOwo+ICAgc3RhdGljIHN0
cnVjdCBsaXN0X2hlYWQgc2hyaW5rZXJfbGlzdDsKPiAgIHN0YXRpYyBzdHJ1Y3Qgc2hyaW5rZXIg
bW1fc2hyaW5rZXI7Cj4gQEAgLTI5MCw4ICsyOTMsMTQgQEAgc3RhdGljIHN0cnVjdCB0dG1fcG9v
bF90eXBlICp0dG1fcG9vbF9zZWxlY3RfdHlwZShzdHJ1Y3QgdHRtX3Bvb2wgKnBvb2wsCj4gICAj
aWZkZWYgQ09ORklHX1g4Ngo+ICAgCXN3aXRjaCAoY2FjaGluZykgewo+ICAgCWNhc2UgdHRtX3dy
aXRlX2NvbWJpbmVkOgo+ICsJCWlmIChwb29sLT51c2VfZG1hMzIpCj4gKwkJCXJldHVybiAmZ2xv
YmFsX2RtYTMyX3dyaXRlX2NvbWJpbmVkW29yZGVyXTsKPiArCj4gICAJCXJldHVybiAmZ2xvYmFs
X3dyaXRlX2NvbWJpbmVkW29yZGVyXTsKPiAgIAljYXNlIHR0bV91bmNhY2hlZDoKPiArCQlpZiAo
cG9vbC0+dXNlX2RtYTMyKQo+ICsJCQlyZXR1cm4gJmdsb2JhbF9kbWEzMl91bmNhY2hlZFtvcmRl
cl07Cj4gKwo+ICAgCQlyZXR1cm4gJmdsb2JhbF91bmNhY2hlZFtvcmRlcl07Cj4gICAJZGVmYXVs
dDoKPiAgIAkJYnJlYWs7Cj4gQEAgLTU3MCw2ICs1NzksMTEgQEAgaW50IHR0bV9wb29sX2RlYnVn
ZnMoc3RydWN0IHR0bV9wb29sICpwb29sLCBzdHJ1Y3Qgc2VxX2ZpbGUgKm0pCj4gICAJc2VxX3B1
dHMobSwgInVjXHQ6Iik7Cj4gICAJdHRtX3Bvb2xfZGVidWdmc19vcmRlcnMoZ2xvYmFsX3VuY2Fj
aGVkLCBtKTsKPiAgIAo+ICsJc2VxX3B1dHMobSwgIndjIDMyXHQ6Iik7Cj4gKwl0dG1fcG9vbF9k
ZWJ1Z2ZzX29yZGVycyhnbG9iYWxfZG1hMzJfd3JpdGVfY29tYmluZWQsIG0pOwo+ICsJc2VxX3B1
dHMobSwgInVjIDMyXHQ6Iik7Cj4gKwl0dG1fcG9vbF9kZWJ1Z2ZzX29yZGVycyhnbG9iYWxfZG1h
MzJfdW5jYWNoZWQsIG0pOwo+ICsKPiAgIAlmb3IgKGkgPSAwOyBpIDwgVFRNX05VTV9DQUNISU5H
X1RZUEVTOyArK2kpIHsKPiAgIAkJc2VxX3B1dHMobSwgIkRNQSAiKTsKPiAgIAkJc3dpdGNoIChp
KSB7Cj4gQEAgLTY0MCw2ICs2NTQsMTEgQEAgaW50IHR0bV9wb29sX21ncl9pbml0KHVuc2lnbmVk
IGxvbmcgbnVtX3BhZ2VzKQo+ICAgCQl0dG1fcG9vbF90eXBlX2luaXQoJmdsb2JhbF93cml0ZV9j
b21iaW5lZFtpXSwgTlVMTCwKPiAgIAkJCQkgICB0dG1fd3JpdGVfY29tYmluZWQsIGkpOwo+ICAg
CQl0dG1fcG9vbF90eXBlX2luaXQoJmdsb2JhbF91bmNhY2hlZFtpXSwgTlVMTCwgdHRtX3VuY2Fj
aGVkLCBpKTsKPiArCj4gKwkJdHRtX3Bvb2xfdHlwZV9pbml0KCZnbG9iYWxfZG1hMzJfd3JpdGVf
Y29tYmluZWRbaV0sIE5VTEwsCj4gKwkJCQkgICB0dG1fd3JpdGVfY29tYmluZWQsIGkpOwo+ICsJ
CXR0bV9wb29sX3R5cGVfaW5pdCgmZ2xvYmFsX2RtYTMyX3VuY2FjaGVkW2ldLCBOVUxMLAo+ICsJ
CQkJICAgdHRtX3VuY2FjaGVkLCBpKTsKPiAgIAl9Cj4gICAKPiAgIAltbV9zaHJpbmtlci5jb3Vu
dF9vYmplY3RzID0gdHRtX3Bvb2xfc2hyaW5rZXJfY291bnQ7Cj4gQEAgLTY2MCw2ICs2NzksOSBA
QCB2b2lkIHR0bV9wb29sX21ncl9maW5pKHZvaWQpCj4gICAJZm9yIChpID0gMDsgaSA8IE1BWF9P
UkRFUjsgKytpKSB7Cj4gICAJCXR0bV9wb29sX3R5cGVfZmluaSgmZ2xvYmFsX3dyaXRlX2NvbWJp
bmVkW2ldKTsKPiAgIAkJdHRtX3Bvb2xfdHlwZV9maW5pKCZnbG9iYWxfdW5jYWNoZWRbaV0pOwo+
ICsKPiArCQl0dG1fcG9vbF90eXBlX2ZpbmkoJmdsb2JhbF9kbWEzMl93cml0ZV9jb21iaW5lZFtp
XSk7Cj4gKwkJdHRtX3Bvb2xfdHlwZV9maW5pKCZnbG9iYWxfZG1hMzJfdW5jYWNoZWRbaV0pOwo+
ICAgCX0KPiAgIAo+ICAgCXVucmVnaXN0ZXJfc2hyaW5rZXIoJm1tX3Nocmlua2VyKTsKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
