Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9776F361A4E
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 09:08:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08F806E1A3;
	Fri, 16 Apr 2021 07:08:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79CC86E1A3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 07:08:56 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id d21so10890440edv.9
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 00:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=zLSMvZYRAJCsk2Rs4S2rsxdlqP0N63/bvG4UtBJlhds=;
 b=BlfiJ62lVmCMYByn7WvrksbbVI6TDARHp3g2O1W3ZtQwmxayq62Kf5FE0ajOQhHB26
 htlN704WKAY3fwWT25ySYXp46TeheqfnPYqTn7LL1Xm8/rvCPRrTHFX5lf0nkKQKh8P+
 15pSu5V0cHZrpjn83WWFePMOoOwlVnVlNoYNKRbxW5XEqi4ifSYHOIfL0H2hapsMAUNx
 CaBM7Jv9Pdmy8X1L123AXZniNoRhXalwQGdR3SDfq9od/K6Etk3U5GE99+JxY5Igv8+X
 pojj+Ob30ktvFVtClekEkCGrvmyeohvQUScQlV+EgfQQGqhkCz8+8DWzN43Ler/Ye98W
 IfFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=zLSMvZYRAJCsk2Rs4S2rsxdlqP0N63/bvG4UtBJlhds=;
 b=Q0syyYBc4g7Z9fS+8KN51c6O/NBrvfyZL6Ynh3L62gsXaweZ/Yt69Vog1G+JMcEg/q
 U/q9C0eExVVixa/n7VxMIBDQ5gDkA9Rpq8ih5uogk+yNLF+VbQOBwcygNc63g6E8bH/o
 zbyXPDylxjY5eSzscU2mc6R5Oz4u4VdLr0/beq4ydgxRudmjnNZr2CILkUv9ljgm4LaN
 c27L5mbNE75B9Nyz/JjTSOKvvFfkN00dc+pyJC3dFVPMIgNNlykHFX1zFCsMwDWBumA7
 1rCz2+VsNaoWAlsmpmPACi9Uo/af9VU4QfckYy+m1NawwURVdgrUFGVM/3sB+7dHG1T1
 fXww==
X-Gm-Message-State: AOAM530QLoqFE9QkIKKXg4LeEQbjs+bXWv5ogV2ZuRiY+b3fR683LuHy
 Q7edsXgs/3kvYAzo0SWPUkc=
X-Google-Smtp-Source: ABdhPJydJ7xvzJS0k7fG4gTWodX4tiWHFMzTnM+NC5HYG9Xb+seCqYMDtLNm+BvO9A97hGceLRSCXQ==
X-Received: by 2002:a05:6402:4405:: with SMTP id
 y5mr8598888eda.32.1618556935191; 
 Fri, 16 Apr 2021 00:08:55 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:c122:98c9:2964:3d64?
 ([2a02:908:1252:fb60:c122:98c9:2964:3d64])
 by smtp.gmail.com with ESMTPSA id k9sm3405159eje.102.2021.04.16.00.08.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Apr 2021 00:08:54 -0700 (PDT)
Subject: Re: [PATCH 2/2] drm/ttm: optimize the pool shrinker a bit v2
To: Andrew Morton <akpm@linux-foundation.org>
References: <20210415115624.2904-1-christian.koenig@amd.com>
 <20210415115624.2904-2-christian.koenig@amd.com>
 <20210415133310.1ee9df70a9eb887be937c3a3@linux-foundation.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <57572373-d68c-80de-7f9e-c04239d1b050@gmail.com>
Date: Fri, 16 Apr 2021 09:08:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210415133310.1ee9df70a9eb887be937c3a3@linux-foundation.org>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, ray.huang@amd.com, vbabka@suse.cz
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTUuMDQuMjEgdW0gMjI6MzMgc2NocmllYiBBbmRyZXcgTW9ydG9uOgo+IE9uIFRodSwgMTUg
QXByIDIwMjEgMTM6NTY6MjQgKzAyMDAgIkNocmlzdGlhbiBLw7ZuaWciIDxja29lbmlnLmxlaWNo
dHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPj4gQEAgLTUzMCw2ICs1MjUsMTEgQEAgdm9p
ZCB0dG1fcG9vbF9maW5pKHN0cnVjdCB0dG1fcG9vbCAqcG9vbCkKPj4gICAJCQlmb3IgKGogPSAw
OyBqIDwgTUFYX09SREVSOyArK2opCj4+ICAgCQkJCXR0bV9wb29sX3R5cGVfZmluaSgmcG9vbC0+
Y2FjaGluZ1tpXS5vcmRlcnNbal0pOwo+PiAgIAl9Cj4+ICsKPj4gKwkvKiBXZSByZW1vdmVkIHRo
ZSBwb29sIHR5cGVzIGZyb20gdGhlIExSVSwgYnV0IHdlIG5lZWQgdG8gYWxzbyBtYWtlIHN1cmUK
Pj4gKwkgKiB0aGF0IG5vIHNocmlua2VyIGlzIGNvbmN1cnJlbnRseSBmcmVlaW5nIHBhZ2VzIGZy
b20gdGhlIHBvb2wuCj4+ICsJICovCj4+ICsJc3luY19zaHJpbmtlcnMoKTsKPiBJdCBpc24ndCBp
bW1lZGlhdGVseSBjbGVhciB0byBtZSBob3cgdGhpcyB3b3Jrcy4gIHR0bV9wb29sX2ZpbmkoKSBo
YXMKPiBhbHJlYWR5IGZyZWVkIGFsbCB0aGUgcGFnZXMgaGFzbid0IGl0PyAgU28gd2h5IHdvdWxk
IGl0IGNhcmUgaWYgc29tZQo+IHNocmlua2VycyBhcmUgc3RpbGwgcGxheWluZyB3aXRoIHRoZSBw
YWdlcz8KClllcyB0dG1fcG9vbF9maW5pKCkgaGFzIGZyZWVkIHVwIGFsbCBwYWdlcyB3aGljaCBo
YWQgYmVlbiBpbiB0aGUgcG9vbCAKd2hlbiB0aGUgZnVuY3Rpb24gd2FzIGNhbGxlZC4KCkJ1dCB0
aGUgcHJvYmxlbSBpcyBpdCBpcyBwb3NzaWJsZSB0aGF0IGEgcGFyYWxsZWwgcnVubmluZyBzaHJp
bmtlciBoYXMgCnRha2VuIGEgcGFnZSBmcm9tIHRoZSBwb29sIGFuZCBpcyBpbiB0aGUgcHJvY2Vz
cyBvZiBmcmVlaW5nIGl0IHVwLgoKV2hlbiBJIHJldHVybiBoZXJlIHRoZSBwb29sIHN0cnVjdHVy
ZSBhbmQgZXNwZWNpYWxseSB0aGUgZGV2aWNlIApzdHJ1Y3R1cmUgYXJlIGZyZWVkIHdoaWxlIHRo
ZSBwYXJhbGxlbCBydW5uaW5nIHNocmlua2VyIGlzIHN0aWxsIHVzaW5nIHRoZW0uCgpJIGNvdWxk
IGdvIGZvciBhIGRlc2lnbiB3aGVyZSB3ZSBoYXZlIG9uZSBzaHJpbmtlciBwZXIgZGV2aWNlIGlu
c3RlYWQsIApidXQgdGhhdCB3b3VsZCBwdXQgYSBiaXQgdG8gbXVjaCBwcmVzc3VyZSBvbiB0aGUg
cG9vbCBpbiBteSBvcGluaW9uLgoKPiBPciBpcyBpdCB0aGUgY2FzZSB0aGF0IHR0bV9wb29sX2Zp
bmkoKSBpcyBhc3N1bWluZyB0aGF0IHRoZXJlIHdpbGwgYmUKPiBzb21lIGZ1cnRoZXIgYWN0aW9u
IGFnYWluc3QgdGhlc2UgcGFnZXMsIHdoaWNoIHJlcXVpcmVzIHRoYXQgc2hyaW5rZXJzCj4gbm8g
bG9uZ2VyIGJlIGFjY2Vzc2luZyB0aGUgcGFnZXMgYW5kIHdoaWNoIGZ1cnRoZXIgYXNzdW1lcyB0
aGF0IGZ1dHVyZQo+IHNocmlua2VyIGludm9jYXRpb25zIHdpbGwgbm90IGJlIGFibGUgdG8gbG9v
ayB1cCB0aGVzZSBwYWdlcz8KPgo+IElPVywgYSBiaXQgbW9yZSBleHBsYW5hdGlvbiBhYm91dCB0
aGUgZHluYW1pY3MgaGVyZSB3b3VsZCBoZWxwIQoKU29ycnksIEknbSBub3QgYSBuYXRpdmUgc3Bl
YWtlciBvZiBFbmdsaXNoIGFuZCBzb21ldGltZXMgc3RpbGwgaGF2ZSBhIApoYXJkIHRpbWUgZXhw
bGFpbmluZyB0aGluZ3MuCgpSZWdhcmRzLApDaHJpc3RpYW4uCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
