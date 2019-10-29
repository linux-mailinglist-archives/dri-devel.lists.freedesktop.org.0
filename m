Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA63E87D0
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2019 13:13:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21C6F6E25B;
	Tue, 29 Oct 2019 12:13:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A4D16E249
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2019 12:13:07 +0000 (UTC)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-ec6wTpMfP-mz7FUbyQsUbQ-1; Tue, 29 Oct 2019 08:13:04 -0400
Received: by mail-wm1-f70.google.com with SMTP id l184so589479wmf.6
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2019 05:13:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=d4g23g2C8WMztdC+E3C526OwCL6Fcv207kRTvCZWd+o=;
 b=LVz/mHVifb06ClilovziiB6zGZgZhiRP2Po7mVXMb+MVlRsxmpGyd+Wqis9KGMjSr1
 6Bqw1ve206G7JaYTghNBLt1M1cwRNlN9HhqHxkVRFJsW3+T9fO8LdOvLWBvP+dZYdbnx
 UAOZRqgZ4HEiqSqd9XAfDVyIiOVMcSsNKyvb4zsJujzPuWgIdcqNjmF9TXvhP4bW87Ln
 Tt299ooJjkL4VO4PDPnKJGRl/1rAY94mrNpjCBNHF46GUQjghm41R/SxFkFFadQaOTMu
 8cDgUyx/E71zqXH7YOuxOte+YDtKMC0R1qB+JFuueNVGiYNNBMG+Y+46PTMLZaazzvbJ
 BQ5Q==
X-Gm-Message-State: APjAAAU18QsmEjv9ZSZ+3M03hWRto16xVoXcfsxrU7/xo0WC+PGWKv3/
 MdUw72ANwFVTwqzSsZWVl0CXjcXZXLKFJvBVDmxIUXbK/y99/c5RMTQmBLGfFAZxWoMdsMdEOzf
 6J2d52gZDYnnKlmxpu3UIgiyGbxLv
X-Received: by 2002:adf:fe12:: with SMTP id n18mr20712193wrr.114.1572351183127; 
 Tue, 29 Oct 2019 05:13:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwGype9Z4/Da3yTBSa6n5zu6MnK490N2padYZ7gGPl1RLNZ0bCwwcjf0usiWahw6G3jTucc7A==
X-Received: by 2002:adf:fe12:: with SMTP id n18mr20712173wrr.114.1572351182961; 
 Tue, 29 Oct 2019 05:13:02 -0700 (PDT)
Received: from shalem.localdomain
 (2001-1c00-0c14-2800-ec23-a060-24d5-2453.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c14:2800:ec23:a060:24d5:2453])
 by smtp.gmail.com with ESMTPSA id s17sm2656475wmh.3.2019.10.29.05.13.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Oct 2019 05:13:02 -0700 (PDT)
Subject: Re: [PATCH] drm/vboxvideo: Use drm_gem_fb_create_with_dirty instead
 of drm_gem_fb_create
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
References: <20191028133159.236550-1-hdegoede@redhat.com>
 <7b86d793-645a-0d49-065f-3eb0a3e884a9@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <75bc83fa-35ac-9cad-4e1e-d04026082b59@redhat.com>
Date: Tue, 29 Oct 2019 13:13:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <7b86d793-645a-0d49-065f-3eb0a3e884a9@suse.de>
Content-Language: en-US
X-MC-Unique: ec6wTpMfP-mz7FUbyQsUbQ-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1572351186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f+jczVsl5L3NLVb1b7Q2vh3d8adMHIJJ+Z4V45GZ//I=;
 b=NZZWcVdJfTotxXxs7YVaf/y5wZY5mQE+a0ZqGr9hHKRHcSBZohCr886cudjv7jTXsFYhNO
 +YCWFBoDKMZcN+xVZ7wHpxtGfCHfFGU5prAr/PnDpvqm0ff5SBMKJKURfkn9d7F9hMhCF9
 kpTWKtijycF1Gp8voZekTkfLwN2SmN8=
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAyOC0xMC0yMDE5IDE0OjM4LCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToKPiAKPiBB
bSAyOC4xMC4xOSB1bSAxNDozMSBzY2hyaWViIEhhbnMgZGUgR29lZGU6Cj4+IENvbW1pdCA3ZDc5
YWE4NjI4ZmUgKCJkcm0vdmJveHZpZGVvOiBSZXBsYWNlIHN0cnVjdCB2cmFtX2ZyYW1lYnVmZmVy
Cj4+IHdpdGggZ2VuZXJpYyBpbXBsZW1lbmF0aW9uIikgcmVtb3ZlZCB0aGUgZGl5IGZyYW1lYnVm
ZmVyIGNvZGUgZnJvbQo+PiB0aGUgdmJveHZpZGVvIGRyaXZlciwgcmVzdWx0aW5nIGluIGEgbmlj
ZSBjbGVhbnVwLgo+Pgo+PiBCdXQgc2luY2UgdGhlIHZib3h2aWRlbyBkcml2ZXIgbmVlZHMgdGhl
IGdlbmVyaWMgZGlydHkgdHJhY2tpbmcgY29kZSwKPj4gaXQncyBkcm1fbW9kZV9jb25maWdfZnVu
Y3MuZmJfY3JlYXRlIHNob3VsZCBiZSBzZXQgdG8KPj4gZHJtX2dlbV9mYl9jcmVhdGVfd2l0aF9k
aXJ0eSBub3QgZHJtX2dlbV9mYl9jcmVhdGUuCj4+Cj4+IFRoaXMgY29tbWl0IGZpeGVzIHRoaXMs
IGZpeGluZyB0aGUgZnJhbWVidWZmZXIgbm90IGFsd2F5cyB1cGRhdGluZy4KPj4KPj4gQ2M6IFRo
b21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+PiBGaXhlczogQ29tbWl0IDdk
NzlhYTg2MjhmZSAoImRybS92Ym94dmlkZW86IFJlcGxhY2Ugc3RydWN0IHZyYW1fZnJhbWVidWZm
ZXIgd2l0aCBnZW5lcmljIGltcGxlbWVuYXRpb24iKQo+PiBTaWduZWQtb2ZmLWJ5OiBIYW5zIGRl
IEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgo+IAo+IEFja2VkLWJ5OiBUaG9tYXMgWmltbWVy
bWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KClRoYW5rcywgcHVzaGVkIHRvIGRybS1taXNjLW5l
eHQKClJlZ2FyZHMsCgpIYW5zCgoKPj4gLS0tCj4+ICAgZHJpdmVycy9ncHUvZHJtL3Zib3h2aWRl
by92Ym94X21vZGUuYyB8IDIgKy0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92Ym94dmlk
ZW8vdmJveF9tb2RlLmMgYi9kcml2ZXJzL2dwdS9kcm0vdmJveHZpZGVvL3Zib3hfbW9kZS5jCj4+
IGluZGV4IGQ5ODE4YThhMzJmYS4uZjE1ZWQyMjcyMjA1IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vdmJveHZpZGVvL3Zib3hfbW9kZS5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92
Ym94dmlkZW8vdmJveF9tb2RlLmMKPj4gQEAgLTgzOCw3ICs4MzgsNyBAQCBzdGF0aWMgaW50IHZi
b3hfY29ubmVjdG9yX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKPj4gICB9Cj4+ICAgCj4+
ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fbW9kZV9jb25maWdfZnVuY3MgdmJveF9tb2RlX2Z1
bmNzID0gewo+PiAtCS5mYl9jcmVhdGUgPSBkcm1fZ2VtX2ZiX2NyZWF0ZSwKPj4gKwkuZmJfY3Jl
YXRlID0gZHJtX2dlbV9mYl9jcmVhdGVfd2l0aF9kaXJ0eSwKPj4gICAJLmF0b21pY19jaGVjayA9
IGRybV9hdG9taWNfaGVscGVyX2NoZWNrLAo+PiAgIAkuYXRvbWljX2NvbW1pdCA9IGRybV9hdG9t
aWNfaGVscGVyX2NvbW1pdCwKPj4gICB9Owo+Pgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
