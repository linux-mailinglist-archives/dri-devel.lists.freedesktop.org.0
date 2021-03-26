Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 822D134B16A
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 22:41:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D3196F489;
	Fri, 26 Mar 2021 21:41:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51B6A6F489
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 21:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616794869;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2KYq2FimxUUOirhAHH7Y6K62w8Nvf75VdOPqqjNoVNY=;
 b=P568CWIASQHyVW765vVDWKQJdZRpEbzxzylzNY8K7gejdzKWiUWAm9bMHRo1/zIObfzsoI
 6ZKKgSeeZQAw+44y0SpcN9usokON9TFKb38WtC9MoB3xLGLTKEHT2W+v0IR22f6S4iEimo
 6cxEiL60B+iKaY+zp+7a6x12mMAZFfA=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-wbJOw0iRPbmXfuzc_P33pQ-1; Fri, 26 Mar 2021 17:41:08 -0400
X-MC-Unique: wbJOw0iRPbmXfuzc_P33pQ-1
Received: by mail-qk1-f198.google.com with SMTP id c131so7119614qkg.21
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 14:41:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=2KYq2FimxUUOirhAHH7Y6K62w8Nvf75VdOPqqjNoVNY=;
 b=hmaW9fo0S29fcR7XptKLJuZq41Yo8OYiw4H5JklKXBTvYoKf7x03UyAFbIT4BaUJNA
 v4VZ3pL7yrJ6fEOKX1NociKKVEUn6B/Z2HGfwCnl0nGSX1dCRbjKW26DnWQugsRbRQBj
 4m1BPxsjyrDsVFEoRDLUT667hWah+BhpZgDRuw2qOSkHpFXM7Tusn4Qp7S2jnGLw/UlK
 eU/1ftX2yBCXHHjOXXPfC+wrxJ4RxcCMmLEQwcpSJ6I8aUHC2Z/0AxmOxUfCWm3IUGqa
 ypc6NQYByx0I3gPJUl2Y9qeIOOIMLM+R5oYY10p9y1952j7Oq+3jCHZI+b9krrk7Lrxw
 1amw==
X-Gm-Message-State: AOAM5334f6I9UT04CF5I10wBwlkfPOCFx1815uguCnsEw2vua7ctPjO7
 rwVizHj/cULwkwh64Rre6Mt7bp6OksxeD5FK13zUaH+cv3bjVCxWFH5N1JS/vrKjc+3G3Rw8WX+
 EDVi+H1X6OlUrqI8rY4bfSTUjrlGZ
X-Received: by 2002:ac8:6789:: with SMTP id b9mr13776316qtp.103.1616794866632; 
 Fri, 26 Mar 2021 14:41:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxc8vW+QMW0U4nq1pb7zDYcwAwcJWPPX3yqc5y79GrncUcdi02PbcBkqm4COvoGtyLpXgXAgg==
X-Received: by 2002:ac8:6789:: with SMTP id b9mr13776303qtp.103.1616794866456; 
 Fri, 26 Mar 2021 14:41:06 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id l9sm6725962qtv.65.2021.03.26.14.41.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 14:41:05 -0700 (PDT)
Message-ID: <7f51dbe3dac85f692e01bb5cecdf4454a40b1893.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau: avoid a use-after-free when BO init fails
From: Lyude Paul <lyude@redhat.com>
To: Jeremy Cline <jcline@redhat.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Fri, 26 Mar 2021 17:41:05 -0400
In-Reply-To: <20201203000220.18238-1-jcline@redhat.com>
References: <20201203000220.18238-1-jcline@redhat.com>
Organization: Red Hat
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Reply-To: lyude@redhat.com
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 Thierry Reding <treding@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CgpPbiBXZWQsIDIwMjAt
MTItMDIgYXQgMTk6MDIgLTA1MDAsIEplcmVteSBDbGluZSB3cm90ZToKPiBub3V2ZWF1X2JvX2lu
aXQoKSBpcyBiYWNrZWQgYnkgdHRtX2JvX2luaXQoKSBhbmQgZmVycmllcyBpdHMgcmV0dXJuIGNv
ZGUKPiBiYWNrIHRvIHRoZSBjYWxsZXIuIE9uIGZhaWx1cmVzLCB0dG1fYm9faW5pdCgpIGludm9r
ZXMgdGhlIHByb3ZpZGVkCj4gZGVzdHJ1Y3RvciB3aGljaCBzaG91bGQgZGUtaW5pdGlhbGl6ZSBh
bmQgZnJlZSB0aGUgbWVtb3J5Lgo+IAo+IFRodXMsIHdoZW4gbm91dmVhdV9ib19pbml0KCkgcmV0
dXJucyBhbiBlcnJvciB0aGUgZ2VtIG9iamVjdCBoYXMgYWxyZWFkeQo+IGJlZW4gcmVsZWFzZWQg
YW5kIHRoZSBtZW1vcnkgZnJlZWQgYnkgbm91dmVhdV9ib19kZWxfdHRtKCkuCj4gCj4gRml4ZXM6
IDAxOWNiZDRhNGZlYiAoImRybS9ub3V2ZWF1OiBJbml0aWFsaXplIEdFTSBvYmplY3QgYmVmb3Jl
IFRUTSBvYmplY3QiKQo+IENjOiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+
IFNpZ25lZC1vZmYtYnk6IEplcmVteSBDbGluZSA8amNsaW5lQHJlZGhhdC5jb20+Cj4gLS0tCj4g
wqBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2dlbS5jIHwgNCArLS0tCj4gwqAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZ2VtLmMKPiBiL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L25vdXZlYXVfZ2VtLmMKPiBpbmRleCA3ODdkMDVlZWZkOWMuLmQzMDE1N2Nj
NzE2OSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2dlbS5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9nZW0uYwo+IEBAIC0yMTEs
MTAgKzIxMSw4IEBAIG5vdXZlYXVfZ2VtX25ldyhzdHJ1Y3Qgbm91dmVhdV9jbGkgKmNsaSwgdTY0
IHNpemUsIGludAo+IGFsaWduLCB1aW50MzJfdCBkb21haW4sCj4gwqDCoMKgwqDCoMKgwqDCoH0K
PiDCoAo+IMKgwqDCoMKgwqDCoMKgwqByZXQgPSBub3V2ZWF1X2JvX2luaXQobnZibywgc2l6ZSwg
YWxpZ24sIGRvbWFpbiwgTlVMTCwgTlVMTCk7Cj4gLcKgwqDCoMKgwqDCoMKgaWYgKHJldCkgewo+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBub3V2ZWF1X2JvX3JlZihOVUxMLCAmbnZi
byk7Cj4gK8KgwqDCoMKgwqDCoMKgaWYgKHJldCkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHJldHVybiByZXQ7Cj4gLcKgwqDCoMKgwqDCoMKgfQo+IMKgCj4gwqDCoMKgwqDCoMKg
wqDCoC8qIHdlIHJlc3RyaWN0IGFsbG93ZWQgZG9tYWlucyBvbiBudjUwKyB0byBvbmx5IHRoZSB0
eXBlcwo+IMKgwqDCoMKgwqDCoMKgwqAgKiB0aGF0IHdlcmUgcmVxdWVzdGVkIGF0IGNyZWF0aW9u
IHRpbWUuwqAgbm90IHBvc3NpYmx5IG9uCgotLSAKU2luY2VyZWx5LAogICBMeXVkZSBQYXVsIChz
aGUvaGVyKQogICBTb2Z0d2FyZSBFbmdpbmVlciBhdCBSZWQgSGF0CiAgIApOb3RlOiBJIGRlYWwg
d2l0aCBhIGxvdCBvZiBlbWFpbHMgYW5kIGhhdmUgYSBsb3Qgb2YgYnVncyBvbiBteSBwbGF0ZS4g
SWYgeW91J3ZlCmFza2VkIG1lIGEgcXVlc3Rpb24sIGFyZSB3YWl0aW5nIGZvciBhIHJldmlldy9t
ZXJnZSBvbiBhIHBhdGNoLCBldGMuIGFuZCBJCmhhdmVuJ3QgcmVzcG9uZGVkIGluIGEgd2hpbGUs
IHBsZWFzZSBmZWVsIGZyZWUgdG8gc2VuZCBtZSBhbm90aGVyIGVtYWlsIHRvIGNoZWNrCm9uIG15
IHN0YXR1cy4gSSBkb24ndCBiaXRlIQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
