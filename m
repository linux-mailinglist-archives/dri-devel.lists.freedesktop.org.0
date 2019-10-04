Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A72FDCBEF0
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 17:19:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 028036EBC9;
	Fri,  4 Oct 2019 15:19:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E85696EBC9
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 15:19:26 +0000 (UTC)
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-Qp0WGv9VPCK29v9grag3wA-1; Fri, 04 Oct 2019 11:19:23 -0400
Received: by mail-qk1-f200.google.com with SMTP id 10so6643018qka.2
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Oct 2019 08:19:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=ncao/ozNvnUd97x7/M6BCXzpt9FxQvVzIoHb0MKueVw=;
 b=ptwDBa9fQmxCVEsO+7rQo4Xzg2QTxggJWF55pX6/QsBnOmQ/2uWxKfHppgjAhXE/au
 z4vMYHLL8y9YcAH8V9tVpYlfBpdbOtkBh2HhVFCw5R0he1gv6yMZCXa2S88zarJLKGc+
 aJo1sprZE+imJUm01+wtfetx6pJ/OpJPWUVIe2fN4NkSNVX4l7SACRPCovq12g430QQX
 KQC34Qv9DLTz6MMLkalGHRdgflZ7lCpnT1NHbnY+Osx8dbNR2oBeb1A9obtHG7Xugtpj
 Oeq1IrW/z8gJ3kOaV9cfzqEe4ZsT6uOE+4EsUsUJHIOhSSj5ahrZlHoOXAe8NMhWy8A1
 gYrw==
X-Gm-Message-State: APjAAAUSW+QxbZLi1H7AVvn30Jjz1sQ0hgXNc7SlVnZ911BQBWxBGV6H
 GYPUOtYo/XNxd3XLrEC2EfTU4OPhXvYDL/A3ykTjNejSHnnN53ZpacefUoFepvWylg9s3ixNJYy
 NIwcx/1FY6jwjX1i+/OaN3zfeLVwD
X-Received: by 2002:a37:2748:: with SMTP id n69mr10577684qkn.318.1570202362984; 
 Fri, 04 Oct 2019 08:19:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqysdiAVddSw8+4cgIHSrMPH3L1aS+TJtKnIf3bgXU7J6FkKzig/YMlnNJ6ZjjuJICe4pR5hBw==
X-Received: by 2002:a37:2748:: with SMTP id n69mr10577653qkn.318.1570202362711; 
 Fri, 04 Oct 2019 08:19:22 -0700 (PDT)
Received: from desoxy ([132.205.229.216])
 by smtp.gmail.com with ESMTPSA id r1sm3097476qti.4.2019.10.04.08.19.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2019 08:19:22 -0700 (PDT)
Message-ID: <33dcaf669eae3acfc3b716e68b69c0fe76dd2dbc.camel@redhat.com>
Subject: Re: [PATCH] drm/i915: customize DPCD brightness control for
 specific panel
From: Adam Jackson <ajax@redhat.com>
To: Lee Shawn C <shawn.c.lee@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Date: Fri, 04 Oct 2019 11:19:20 -0400
In-Reply-To: <20191004215851.31446-1-shawn.c.lee@intel.com>
References: <20191004215851.31446-1-shawn.c.lee@intel.com>
User-Agent: Evolution 3.34.0 (3.34.0-1.fc31)
MIME-Version: 1.0
X-MC-Unique: Qp0WGv9VPCK29v9grag3wA-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1570202366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3K3xC75ilE+H9/cYF04ApkMEs8MtE17gvhDKAopCzuo=;
 b=NprFsoscFNF0Vmvwvp8ft332Vq8towWZce3loKXbaTwLr1TWDn8+Wt/a8m3woCBTV9JY5P
 oXYJe1IU0xTImRJ1iqvh8gQv6KuDzZUo4RPB3YlVdVR38vbry1aKKLvtkqyCI/mstzH7Jv
 QokzSVhNWeuXVJbiJ+OlJmEdft8Dys8=
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
Cc: Jani Nikula <jani.nikula@intel.com>, Cooper Chiou <cooper.chiou@intel.com>,
 Gustavo Padovan <gustavo@padovan.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCAyMDE5LTEwLTA1IGF0IDA1OjU4ICswODAwLCBMZWUgU2hhd24gQyB3cm90ZToKPiBU
aGlzIHBhbmVsIChtYW51ZmFjdHVyZXIgaXMgU0RDLCBwcm9kdWN0IElEIGlzIDB4NDE0MSkKPiB1
c2VkIG1hbnVmYWN0dXJlciBkZWZpbmVkIERQQ0QgcmVnaXN0ZXIgdG8gY29udHJvbCBicmlnaHRu
ZXNzCj4gdGhhdCBub3QgZGVmaW5lZCBpbiBlRFAgc3BlYyBzbyBmYXIuIFRoaXMgY2hhbmdlIGZv
bGxvdyBwYW5lbAo+IHZlbmRvcidzIGluc3RydWN0aW9uIHRvIHN1cHBvcnQgYnJpZ2h0bmVzcyBh
ZGp1c3RtZW50LgoKSSdtIHN1cmUgdGhpcyB3b3JrcywgYnV0IHRoaXMgc21lbGxzIGEgbGl0dGxl
IGZ1bm55IHRvIG1lLgoKPiArCS8qIFNhbXN1bmcgZURQIHBhbmVsICovCj4gKwl7ICJTREMiLCAw
eDQxNDEsIEVESURfUVVJUktfTk9OX1NURF9CUklHSFRORVNTX0NPTlRST0wgfSwKCkl0IGZlZWxz
IGEgYml0IGxpa2UgYSBsYXllcmluZyB2aW9sYXRpb24gdG8gaWRlbnRpZnkgZURQIGJlaGF2aW9y
CmNoYW5nZXMgYmFzZWQgb24gRURJRC4gQnV0IEknbSBub3Qgc3VyZSB0aGVyZSdzIGFueSBvYnZp
b3VzIHdheSB0bwppZGVudGlmeSB0aGlzIGRldmljZSBieSBpdHMgRFBDRC4gVGhlIFNpbmsgT1VJ
IChmcm9tIHRoZSBsaW5rZWQKYnVnemlsbGEpIHNlZW1zIHRvIGJlIDAwMTFGOCwgd2hpY2ggZG9l
c24ndCBtYXRjaCB1cCB0byBhbnl0aGluZyBpbiBteQpvdWkudHh0Li4uCgo+IEBAIC0xOTUzLDYg
KzE5NTYsNyBAQCBzdGF0aWMgdTMyIGVkaWRfZ2V0X3F1aXJrcyhjb25zdCBzdHJ1Y3QgZWRpZCAq
ZWRpZCkKPiAgCj4gIAlyZXR1cm4gMDsKPiAgfQo+ICtFWFBPUlRfU1lNQk9MKGVkaWRfZ2V0X3F1
aXJrcyk7CgpJZiB3ZSdyZSBnb2luZyB0byBleHBvcnQgdGhpcyBpdCBzaG91bGQgcHJvYmFibHkg
Z2V0IGEgZHJtXyBwcmVmaXguCgo+ICsjZGVmaW5lIERQQ0RfRURQX0dFVFNFVF9DVFJMX1BBUkFN
UwkJMHgzNDQKPiArI2RlZmluZSBEUENEX0VEUF9DT05URU5UX0xVTUlOQU5DRQkJMHgzNDYKPiAr
I2RlZmluZSBEUENEX0VEUF9QQU5FTF9MVU1JTkFOQ0VfT1ZFUlJJREUJMHgzNGEKPiArI2RlZmlu
ZSBEUENEX0VEUF9CUklHSFRORVNTX05JVFMJCTB4MzU0Cj4gKyNkZWZpbmUgRFBDRF9FRFBfQlJJ
R0hUTkVTU19PUFRJTUlaQVRJT04JMHgzNTgKPiArCj4gKyNkZWZpbmUgRURQX0NVU1RPTUlaRV9N
QVhfQlJJR0hUTkVTU19MRVZFTAkoNTEyKQoKVGhpcyBhbHNvIHNlZW1zIGEgYml0IHdlaXJkLCB0
aGUgMHgzMDAtMHgzRkYgcmVnaXN0ZXJzIGJlbG9uZyB0byB0aGUKX3NvdXJjZV8gRFAgZGV2aWNl
LiBCdXQgdGhlbiBsYXRlci4uLgoKPiArCS8qIHdyaXRlIHNvdXJjZSBPVUkgKi8KPiArCXdyaXRl
X3ZhbFswXSA9IDB4MDA7Cj4gKwl3cml0ZV92YWxbMV0gPSAweGFhOwo+ICsJd3JpdGVfdmFsWzJd
ID0gMHgwMTsKCk9oIGhleSwgeW91J3JlIHdyaXRpbmcgKGFuKSBJbnRlbCBPVUkgdG8gdGhlIFNv
dXJjZSBPVUksIHNvIG5vdyBpdAptYWtlcyBzZW5zZSB0aGF0IHlvdSdyZSB3cml0aW5nIHRvIHJl
Z2lzdGVycyB3aG9zZSBiZWhhdmlvciB0aGUgc291cmNlCmRlZmluZXMuIEJ1dCB0aGlzIGRvZXMg
cmFpc2UgdGhlIHF1ZXN0aW9uOiBpcyB0aGlzIGp1c3QgYSBjb252ZW50aW9uCmJldHdlZW4gSW50
ZWwgYW5kIHRoaXMgcGFydGljdWxhciBwYW5lbD8gV291bGQgd2UgZXhwZWN0IHRoaXMgdG8gd29y
awp3aXRoIG90aGVyIHNpbWlsYXIgcGFuZWxzPyBJcyB0aGVyZSBhbnkgd2F5IHRvIGtub3cgdG8g
ZXhwZWN0IHRoaXMKY29udmVudGlvbiBmcm9tIERQQ0QgaW5zdGVhZD8KCi0gYWpheAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
