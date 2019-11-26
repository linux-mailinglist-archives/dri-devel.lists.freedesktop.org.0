Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF0B109D82
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 13:08:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BEB06E07D;
	Tue, 26 Nov 2019 12:08:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F003E6E07D
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 12:08:09 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id i12so22222767wro.5
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 04:08:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=VQjjqFDsNM/6pE1oM/K01ML2mXuln8XPZDY4RZUivOc=;
 b=sQ5dYGFHToNzJgvJ/1dTEybYJbq8UaaRs2veug0XTvG5fGcJspZKKcjUNFIXJB5d78
 hIjky78bR54+H9S6eiluXDQzZljMwngjw05Zso2rjthuaIEhe/jlSlslTIAznGDOE50F
 rNMZ+oULwyvOZlsAzIWsnVV9JAQqQO8SyidXeqQeTyq3zT7O4gYhMZjY9eKqU1rAIV81
 IiqujZNUgn0/m8anyKm3E5GkPqEW4//fkA1G32qD3cqyltMFUId7mk4crUc3MXvxqwRH
 5bNzYiLI7P8U9ScIX6xY6TEljdUusaQThlZxHfhwPzCbKIXdU4wWWLn6RJ2rzOnxEf/c
 SuPg==
X-Gm-Message-State: APjAAAXSABMRE4flTjj0o+Taqb3xyroAeavfri30NF5b5dqHv/FB8fmk
 ZmxlHNRE+d9tCsQuBZeUVlRZWA==
X-Google-Smtp-Source: APXvYqyCVzH+f7yqTMpfD8vYQ/DrJUuOIE2WH3AwCdN2GqBS6WDrLDj1/zSPULNRsndeZMxFounfcA==
X-Received: by 2002:a5d:530f:: with SMTP id e15mr38041522wrv.119.1574770088328; 
 Tue, 26 Nov 2019 04:08:08 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id k1sm15080399wrp.29.2019.11.26.04.08.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2019 04:08:07 -0800 (PST)
Date: Tue, 26 Nov 2019 13:08:05 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Subject: Re: [PATCH v1 2/2] drm/komeda: Refactor sysfs node "config_id"
Message-ID: <20191126120805.GU29965@phenom.ffwll.local>
Mail-Followup-To: "james qian wang (Arm Technology China)"
 <james.qian.wang@arm.com>, 
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 Brian Starkey <Brian.Starkey@arm.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>, nd <nd@arm.com>,
 "Oscar Zhang (Arm Technology China)" <Oscar.Zhang@arm.com>,
 "Tiannan Zhu (Arm Technology China)" <Tiannan.Zhu@arm.com>,
 "Jonathan Chai (Arm Technology China)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin (Arm Technology China)" <Julien.Yin@arm.com>,
 "Channing Chen (Arm Technology China)" <Channing.Chen@arm.com>,
 "Thomas Sun (Arm Technology China)" <thomas.Sun@arm.com>,
 "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
References: <20191126105412.5978-1-james.qian.wang@arm.com>
 <20191126105412.5978-3-james.qian.wang@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191126105412.5978-3-james.qian.wang@arm.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=VQjjqFDsNM/6pE1oM/K01ML2mXuln8XPZDY4RZUivOc=;
 b=ftFJPVEttEP3GedBZ2x5HGNphCA2lsPKmm8UDIb+ofgtvrD6/sjW3i5b9NvBmdc+cl
 Q5yrnsC8K8rc1xA6pkrK2R0gaBfGM69vg1Xm7pCgBwXZntobK3Og7Wit2uTfM13ZwA04
 OQsBfBLFsgI67RfAezmcLQ5hd0LOFzwJtWdFk=
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
Cc: Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "Oscar Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>,
 "Tiannan Zhu \(Arm Technology China\)" <Tiannan.Zhu@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "Channing Chen \(Arm Technology China\)" <Channing.Chen@arm.com>,
 Ben Davis <Ben.Davis@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>, nd <nd@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMjYsIDIwMTkgYXQgMTA6NTQ6NDdBTSArMDAwMCwgamFtZXMgcWlhbiB3YW5n
IChBcm0gVGVjaG5vbG9neSBDaGluYSkgd3JvdGU6Cj4gRnJvbTogIkphbWVzIFFpYW4gV2FuZyAo
QXJtIFRlY2hub2xvZ3kgQ2hpbmEpIiA8amFtZXMucWlhbi53YW5nQGFybS5jb20+Cj4gCj4gU3Bs
aXQgc3lzZnMgY29uZmlnX2lkIGJpdGZpbGVzIHRvIG11bHRpcGxlIHNlcGFyYXRlZCBzeXNmcyBm
aWxlcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBRaWFuIFdhbmcgKEFybSBUZWNobm9sb2d5
IENoaW5hKSA8amFtZXMucWlhbi53YW5nQGFybS5jb20+CgpJIGd1ZXNzIERhdmUmbXkgcXVlc3Rp
b25zIHdlcmVudCBxdWl0ZSBjbGVhciwgdGhpcyBsb29rcyBsaWtlIHVhcGkgdGhhdCdzCmNvbnN1
bWVkIGJ5IGh3Yywgc28gdGhlIHVzZXJzcGFjZSBuZWVkcyB0byBiZSBvcGVuIHNvdXJjZS4gUGx1
cyBpdCBuZWVkcwp0byBiZSBkaXNjdXNzZWQvcmV2aWV3ZWQgbGlrZSBhbnkgb3RoZXIga21zIHVh
cGkgZXh0ZW5zaW9ucywgd2l0aCBhCmNyaXRpY2FsIGV5ZSB3aGV0aGVyIHRoaXMgbWFrZXMgc2Vu
c2UgdG8gYWRkIHRvIGEgc3VwcG9zZWRseSBjcm9zcy12ZW5kb3IKaW50ZXJmYWNlLgoKSSBzdXNw
ZWN0IHRoZSByaWdodCB0aGluZyB0byBkbyBoZXJlIGlzIHRvIHB1c2ggdGhlIHJldmVydC4gRnJv
bSBhIHF1aWNrCmxvb2sgYXQgZ2l0IGhpc3RvcnkgdGhpcyBsYW5kZWQgdG9nZXRoZXIgd2l0aCB0
aGUgb3RoZXIga21zIHByb3BlcnRpZXMgaW4Ka29tZWRhIHdoaWNoIHdlIHJldmVydGVkIGFscmVh
ZHkuCi1EYW5pZWwKCj4gLS0tCj4gIC4uLi9kcm0vYXJtL2Rpc3BsYXkvaW5jbHVkZS9tYWxpZHBf
cHJvZHVjdC5oICB8IDEzIC0tLQo+ICAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX3N5c2ZzLmMgfCA4MCArKysrKysrKysrKysrKy0tLS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwg
NjIgaW5zZXJ0aW9ucygrKSwgMzEgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9pbmNsdWRlL21hbGlkcF9wcm9kdWN0LmggYi9kcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkvaW5jbHVkZS9tYWxpZHBfcHJvZHVjdC5oCj4gaW5kZXggZGJk
M2Q0NzY1MDY1Li5iMjFmNGFhMTVjOTUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Fy
bS9kaXNwbGF5L2luY2x1ZGUvbWFsaWRwX3Byb2R1Y3QuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9pbmNsdWRlL21hbGlkcF9wcm9kdWN0LmgKPiBAQCAtMjEsMTcgKzIxLDQg
QEAKPiAgI2RlZmluZSBNQUxJRFBfRDcxX1BST0RVQ1RfSUQJMHgwMDcxCj4gICNkZWZpbmUgTUFM
SURQX0QzMl9QUk9EVUNUX0lECTB4MDAzMgo+ICAKPiAtdW5pb24ga29tZWRhX2NvbmZpZ19pZCB7
Cj4gLQlzdHJ1Y3Qgewo+IC0JCV9fdTMyCW1heF9saW5lX3N6OjE2LAo+IC0JCQluX3BpcGVsaW5l
czoyLAo+IC0JCQluX3NjYWxlcnM6MiwgLyogbnVtYmVyIG9mIHNjYWxlcnMgcGVyIHBpcGVsaW5l
ICovCj4gLQkJCW5fbGF5ZXJzOjMsIC8qIG51bWJlciBvZiBsYXllcnMgcGVyIHBpcGVsaW5lICov
Cj4gLQkJCW5fcmljaHM6MywgLyogbnVtYmVyIG9mIHJpY2ggbGF5ZXJzIHBlciBwaXBlbGluZSAq
Lwo+IC0JCQlzaWRlX2J5X3NpZGU6MSwgLyogaWYgSFcgd29ya3Mgb24gc2lkZV9ieV9zaWRlIG1v
ZGUgKi8KPiAtCQkJcmVzZXJ2ZWRfYml0czo1Owo+IC0JfTsKPiAtCV9fdTMyIHZhbHVlOwo+IC19
Owo+IC0KPiAgI2VuZGlmIC8qIF9NQUxJRFBfUFJPRFVDVF9IXyAqLwo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9zeXNmcy5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfc3lzZnMuYwo+IGluZGV4IDc0MGYw
OTViNGNhNS4uNWVmZmFiNzk1ZGMxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEva29tZWRhX3N5c2ZzLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2tvbWVkYV9zeXNmcy5jCj4gQEAgLTE4LDI4ICsxOCw2NyBAQCBjb3Jl
X2lkX3Nob3coc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0
ciwgY2hhciAqYnVmKQo+ICBzdGF0aWMgREVWSUNFX0FUVFJfUk8oY29yZV9pZCk7Cj4gIAo+ICBz
dGF0aWMgc3NpemVfdAo+IC1jb25maWdfaWRfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVj
dCBkZXZpY2VfYXR0cmlidXRlICphdHRyLCBjaGFyICpidWYpCj4gK2xpbmVfc2l6ZV9zaG93KHN0
cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIsIGNoYXIgKmJ1
ZikKPiAgewo+ICAJc3RydWN0IGtvbWVkYV9kZXYgKm1kZXYgPSBkZXZfdG9fbWRldihkZXYpOwo+
ICAJc3RydWN0IGtvbWVkYV9waXBlbGluZSAqcGlwZSA9IG1kZXYtPnBpcGVsaW5lc1swXTsKPiAt
CXVuaW9uIGtvbWVkYV9jb25maWdfaWQgY29uZmlnX2lkOwo+IC0JaW50IGk7Cj4gLQo+IC0JbWVt
c2V0KCZjb25maWdfaWQsIDAsIHNpemVvZihjb25maWdfaWQpKTsKPiAtCj4gLQljb25maWdfaWQu
bWF4X2xpbmVfc3ogPSBwaXBlLT5sYXllcnNbMF0tPmhzaXplX2luLmVuZDsKPiAtCWNvbmZpZ19p
ZC5zaWRlX2J5X3NpZGUgPSBtZGV2LT5zaWRlX2J5X3NpZGU7Cj4gLQljb25maWdfaWQubl9waXBl
bGluZXMgPSBtZGV2LT5uX3BpcGVsaW5lczsKPiAtCWNvbmZpZ19pZC5uX3NjYWxlcnMgPSBwaXBl
LT5uX3NjYWxlcnM7Cj4gLQljb25maWdfaWQubl9sYXllcnMgPSBwaXBlLT5uX2xheWVyczsKPiAt
CWNvbmZpZ19pZC5uX3JpY2hzID0gMDsKPiAtCWZvciAoaSA9IDA7IGkgPCBwaXBlLT5uX2xheWVy
czsgaSsrKSB7Cj4gKwo+ICsJcmV0dXJuIHNucHJpbnRmKGJ1ZiwgUEFHRV9TSVpFLCAiJWRcbiIs
IHBpcGUtPmxheWVyc1swXS0+aHNpemVfaW4uZW5kKTsKPiArfQo+ICtzdGF0aWMgREVWSUNFX0FU
VFJfUk8obGluZV9zaXplKTsKPiArCj4gK3N0YXRpYyBzc2l6ZV90Cj4gK25fcGlwZWxpbmVzX3No
b3coc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwgY2hh
ciAqYnVmKQo+ICt7Cj4gKwlzdHJ1Y3Qga29tZWRhX2RldiAqbWRldiA9IGRldl90b19tZGV2KGRl
dik7Cj4gKwo+ICsJcmV0dXJuIHNucHJpbnRmKGJ1ZiwgUEFHRV9TSVpFLCAiJWRcbiIsIG1kZXYt
Pm5fcGlwZWxpbmVzKTsKPiArfQo+ICtzdGF0aWMgREVWSUNFX0FUVFJfUk8obl9waXBlbGluZXMp
Owo+ICsKPiArc3RhdGljIHNzaXplX3QKPiArbl9sYXllcnNfc2hvdyhzdHJ1Y3QgZGV2aWNlICpk
ZXYsIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlICphdHRyLCBjaGFyICpidWYpCj4gK3sKPiArCXN0
cnVjdCBrb21lZGFfZGV2ICptZGV2ID0gZGV2X3RvX21kZXYoZGV2KTsKPiArCXN0cnVjdCBrb21l
ZGFfcGlwZWxpbmUgKnBpcGUgPSBtZGV2LT5waXBlbGluZXNbMF07Cj4gKwo+ICsJcmV0dXJuIHNu
cHJpbnRmKGJ1ZiwgUEFHRV9TSVpFLCAiJWRcbiIsIHBpcGUtPm5fbGF5ZXJzKTsKPiArfQo+ICtz
dGF0aWMgREVWSUNFX0FUVFJfUk8obl9sYXllcnMpOwo+ICsKPiArc3RhdGljIHNzaXplX3QKPiAr
bl9yaWNoX2xheWVyc19zaG93KHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZV9hdHRy
aWJ1dGUgKmF0dHIsIGNoYXIgKmJ1ZikKPiArewo+ICsJc3RydWN0IGtvbWVkYV9kZXYgKm1kZXYg
PSBkZXZfdG9fbWRldihkZXYpOwo+ICsJc3RydWN0IGtvbWVkYV9waXBlbGluZSAqcGlwZSA9IG1k
ZXYtPnBpcGVsaW5lc1swXTsKPiArCWludCBpLCBuX3JpY2hzID0gMDsKPiArCj4gKwlmb3IgKGkg
PSAwOyBpIDwgcGlwZS0+bl9sYXllcnM7IGkrKykKPiAgCQlpZiAocGlwZS0+bGF5ZXJzW2ldLT5s
YXllcl90eXBlID09IEtPTUVEQV9GTVRfUklDSF9MQVlFUikKPiAtCQkJY29uZmlnX2lkLm5fcmlj
aHMrKzsKPiAtCX0KPiAtCXJldHVybiBzbnByaW50ZihidWYsIFBBR0VfU0laRSwgIjB4JTA4eFxu
IiwgY29uZmlnX2lkLnZhbHVlKTsKPiArCQkJbl9yaWNocysrOwo+ICsKPiArCXJldHVybiBzbnBy
aW50ZihidWYsIFBBR0VfU0laRSwgIiVkXG4iLCBuX3JpY2hzKTsKPiArfQo+ICtzdGF0aWMgREVW
SUNFX0FUVFJfUk8obl9yaWNoX2xheWVycyk7Cj4gKwo+ICtzdGF0aWMgc3NpemVfdAo+ICtuX3Nj
YWxlcnNfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlICph
dHRyLCBjaGFyICpidWYpCj4gK3sKPiArCXN0cnVjdCBrb21lZGFfZGV2ICptZGV2ID0gZGV2X3Rv
X21kZXYoZGV2KTsKPiArCXN0cnVjdCBrb21lZGFfcGlwZWxpbmUgKnBpcGUgPSBtZGV2LT5waXBl
bGluZXNbMF07Cj4gKwo+ICsJcmV0dXJuIHNucHJpbnRmKGJ1ZiwgUEFHRV9TSVpFLCAiJWRcbiIs
IHBpcGUtPm5fc2NhbGVycyk7Cj4gK30KPiArc3RhdGljIERFVklDRV9BVFRSX1JPKG5fc2NhbGVy
cyk7Cj4gKwo+ICtzdGF0aWMgc3NpemVfdAo+ICtzaWRlX2J5X3NpZGVfc2hvdyhzdHJ1Y3QgZGV2
aWNlICpkZXYsIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlICphdHRyLCBjaGFyICpidWYpCj4gK3sK
PiArCXN0cnVjdCBrb21lZGFfZGV2ICptZGV2ID0gZGV2X3RvX21kZXYoZGV2KTsKPiArCj4gKwly
ZXR1cm4gc25wcmludGYoYnVmLCBQQUdFX1NJWkUsICIlZFxuIiwgbWRldi0+c2lkZV9ieV9zaWRl
KTsKPiAgfQo+IC1zdGF0aWMgREVWSUNFX0FUVFJfUk8oY29uZmlnX2lkKTsKPiArc3RhdGljIERF
VklDRV9BVFRSX1JPKHNpZGVfYnlfc2lkZSk7Cj4gIAo+ICBzdGF0aWMgc3NpemVfdAo+ICBhY2xr
X2h6X3Nob3coc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0
ciwgY2hhciAqYnVmKQo+IEBAIC01Miw3ICs5MSwxMiBAQCBzdGF0aWMgREVWSUNFX0FUVFJfUk8o
YWNsa19oeik7Cj4gIAo+ICBzdGF0aWMgc3RydWN0IGF0dHJpYnV0ZSAqa29tZWRhX3N5c2ZzX2Vu
dHJpZXNbXSA9IHsKPiAgCSZkZXZfYXR0cl9jb3JlX2lkLmF0dHIsCj4gLQkmZGV2X2F0dHJfY29u
ZmlnX2lkLmF0dHIsCj4gKwkmZGV2X2F0dHJfbGluZV9zaXplLmF0dHIsCj4gKwkmZGV2X2F0dHJf
bl9waXBlbGluZXMuYXR0ciwKPiArCSZkZXZfYXR0cl9uX2xheWVycy5hdHRyLAo+ICsJJmRldl9h
dHRyX25fcmljaF9sYXllcnMuYXR0ciwKPiArCSZkZXZfYXR0cl9uX3NjYWxlcnMuYXR0ciwKPiAr
CSZkZXZfYXR0cl9zaWRlX2J5X3NpZGUuYXR0ciwKPiAgCSZkZXZfYXR0cl9hY2xrX2h6LmF0dHIs
Cj4gIAlOVUxMLAo+ICB9Owo+IC0tIAo+IDIuMjAuMQo+IAo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdh
cmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
