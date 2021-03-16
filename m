Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F71D33E1C2
	for <lists+dri-devel@lfdr.de>; Tue, 16 Mar 2021 23:56:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E93C489AEA;
	Tue, 16 Mar 2021 22:56:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 994C589AEA
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 22:56:41 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id n16so79874lfb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 15:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wLg47B/AUgciaorlDGJkN+ovMSLy89KbICE6kVN8kNo=;
 b=ueGVsl+nBjXtDGVKSJrlDWN3+r+4XYktLURYZS8E7OPlOb3VqBjNq8ymlog3Z8SBeM
 y+tBOebjwxc8/vhsTFYjzCGqyPOfTNoBFkG36KG6MG63DhPqJ2SvOXPI3EWE/xbivMSZ
 X2EXbxS6/lH+vxdnXxCOELjD+XwFqRUzwywsLiAjo2eW9U5IwpTP8+XQ4Eg2VEwCkiX8
 hzziE5vMrEtqTbebDR7aToxhQciDPxU+KYqGXA7DOM8UjGwaR9Efafw+lk+6Scbvl26n
 UiTW1dKNskJkRV7tlbkTTBC3gOSkOZomnqgbBUMUvPMZUy/T7SnXhCjyH0hDUv2H33f1
 bcSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wLg47B/AUgciaorlDGJkN+ovMSLy89KbICE6kVN8kNo=;
 b=YnK9yoZOLRyg+evzurEZ5CdjXNqzAdMoAgdOa+MHiUHfBts9YtQiD96P5pZotSo+WU
 JagplUqXlf9fqV8DyQYPUKvMCBo+iB97ptmMBH1HgxhSpw7+P0QgQ/32R1j9hdUx0prg
 ewipx1wcf17H+fiOwUxILpYxa0LbrDELRZe+506S/SPWxZKKB9d/RblYRtBaiSo2MmPU
 Xr+51ibW07wxXFOVFbkVR1k3CIJvW8PFaaaQjj4Ah83QI0F4DdeaqZG5pv/nTegTWVf4
 9kRGsshnvbL2brGC7lD/1rRu18u0SownznR98O8pjo35HfhZXnBHfKJObdLxK44IQ+tV
 FVDQ==
X-Gm-Message-State: AOAM532sU4IA4NHdfwYnZqjojqsP9RjzU0s2YB3b72ma550zZ8t+yeHd
 S9qJveF0m35OQ9QzkukVzr1/hGFsoPQ=
X-Google-Smtp-Source: ABdhPJzZ7uBVGHZZTofmoJL/AsPmI8yLkdkuqSbSTv013CXLLTBqYD/9Bh6EH8kl6rjB3TwFGmTsng==
X-Received: by 2002:ac2:51dc:: with SMTP id u28mr573234lfm.322.1615935399908; 
 Tue, 16 Mar 2021 15:56:39 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.googlemail.com with ESMTPSA id e18sm3324938ljl.92.2021.03.16.15.56.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 15:56:39 -0700 (PDT)
Subject: Re: [PATCH v15 1/2] drm/tegra: dc: Support memory bandwidth management
From: Dmitry Osipenko <digetx@gmail.com>
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
References: <20210311172255.25213-1-digetx@gmail.com>
 <20210311172255.25213-2-digetx@gmail.com>
 <20210314223119.GC2733@qmqm.qmqm.pl>
 <1158bbca-8880-918d-7564-e2e30552e6b3@gmail.com>
Message-ID: <49a69c69-44e7-741f-b86b-ef4fe83c76b1@gmail.com>
Date: Wed, 17 Mar 2021 01:56:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1158bbca-8880-918d-7564-e2e30552e6b3@gmail.com>
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
Cc: linux-pm@vger.kernel.org, Nicolas Chauvet <kwizart@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Matt Merhar <mattmerhar@protonmail.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTUuMDMuMjAyMSAyMTozOSwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4+PiArCS8qCj4+
PiArCSAqIEhvcml6b250YWwgZG93bnNjYWxlIG5lZWRzIGEgbG93ZXIgbWVtb3J5IGxhdGVuY3ks
IHdoaWNoIHJvdWdobHkKPj4+ICsJICogZGVwZW5kcyBvbiB0aGUgc2NhbGVkIHdpZHRoLiAgVHJ5
aW5nIHRvIHR1bmUgbGF0ZW5jeSBvZiBhIG1lbW9yeQo+Pj4gKwkgKiBjbGllbnQgYWxvbmUgd2ls
bCBsaWtlbHkgcmVzdWx0IGluIGEgc3Ryb25nIG5lZ2F0aXZlIGltcGFjdCBvbgo+Pj4gKwkgKiBv
dGhlciBtZW1vcnkgY2xpZW50cywgaGVuY2Ugd2Ugd2lsbCByZXF1ZXN0IGEgaGlnaGVyIGJhbmR3
aWR0aAo+Pj4gKwkgKiBzaW5jZSBsYXRlbmN5IGRlcGVuZHMgb24gYmFuZHdpZHRoLiAgVGhpcyBh
bGxvd3MgdG8gcHJldmVudCBtZW1vcnkKPj4+ICsJICogRklGTyB1bmRlcmZsb3dzIGZvciBhIGxh
cmdlIHBsYW5lIGRvd25zY2FsZXMsIG1lYW53aGlsZSBhbGxvd2luZwo+Pj4gKwkgKiBkaXNwbGF5
IHRvIHNoYXJlIGJhbmR3aWR0aCBmYWlybHkgd2l0aCBvdGhlciBtZW1vcnkgY2xpZW50cy4KPj4+
ICsJICovCj4+PiArCWlmIChzcmNfdyA+IGRzdF93KQo+Pj4gKwkJbXVsID0gKHNyY193IC0gZHN0
X3cpICogYnBwIC8gMjA0OCArIDE7Cj4+PiArCWVsc2UKPj4+ICsJCW11bCA9IDE7Cj4+IFsuLi5d
Cj4+Cj4+IE9uZSBwb2ludCBpcyB1bmV4cGxhaW5lZCB5ZXQ6IHdoeSBpcyB0aGUgbXVsdGlwbGll
ciBwcm9wb3J0aW9uYWwgdG8gYQo+PiAqZGlmZmVyZW5jZSogYmV0d2VlbiBzcmMgYW5kIGRzdCB3
aWR0aHM/IEFsc28sIEkgd291bGQgZXhwZWN0IG1heCAod29yc3QKPj4gY2FzZSkgaXMgcGl4Y2xv
Y2sgKiByZWFkX3NpemUgd2hlbiBzcmNfdy9kc3RfdyA+PSByZWFkX3NpemUuCj4gSUlSQywgdGhl
IGRpZmZlcmVuY2UgZ2l2ZXMgYSBtb3JlIGFkZXF1YXRlL3ByYWN0aWNhbCByZXN1bHQgdGhhbiB0
aGUKPiBwcm9wb3J0aW9uLiBBbHRob3VnaCwgZG93bnN0cmVhbSBkcml2ZXIgdXNlcyBwcm9wb3J0
aW9uLiBJJ2xsIHRyeSB0bwo+IHJldmlzaXQgdGhpcyBmb3IgdGhlIG5leHQgdmVyc2lvbiBvZiB0
aGUgcGF0Y2guCgpJIHRyaWVkIHRvIHJlLXRlc3QgZXZlcnl0aGluZyBhbmQgY2FuJ3QgcmVwcm9k
dWNlIHByb2JsZW1zIHRoYXQgZXhpc3RlZApwcmV2aW91c2x5LiBXZSBkaWRuJ3QgaGF2ZSBhIGZp
bmlzaGVkIG1lbW9yeSBkcml2ZXJzIGJhY2sgdGhlbiBhbmQgSQp0aGluayB0aGF0IFRlZ3JhMzAg
bGF0ZW5jeSB0dW5pbmcgc3VwcG9ydCBhbmQgdmFyaW91cyBUZWdyYTIwIGNoYW5nZXMKZml4ZWQg
dGhvc2UgcHJvYmxlbXMuIEknbGwgcmVtb3ZlIHRoaXMgaHVuayBpbiB0aGUgbmV4dCB2ZXJzaW9u
LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
