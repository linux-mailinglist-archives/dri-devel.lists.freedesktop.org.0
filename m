Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C243C34B1AA
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 23:01:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EC0F6F49A;
	Fri, 26 Mar 2021 22:01:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37E176F49A
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 22:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616796058;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NwmpBP589O6V0JxrSUt13E4QZLT4xX4RH4BOYcChKvM=;
 b=dcXNIScZ2D4VKRyGMD0oJsSHa8s7f8Nv5pTT7euV3JO1HVzay7vzzi4mhMpdyzLk7IDOdJ
 vhmCxslOFV98I+i/uKfPIakqCW5Lo2Drstk/10BZZ8I0Y14g1qS2XkKZj5p0MUe+sm6zMK
 +z4Pd+PScv8bFQf3Vo/KsKt48lfjFho=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-598-ItYMxsXvPyyVBFrw5O5IGA-1; Fri, 26 Mar 2021 18:00:54 -0400
X-MC-Unique: ItYMxsXvPyyVBFrw5O5IGA-1
Received: by mail-qk1-f199.google.com with SMTP id 130so7198768qkm.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 15:00:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=NwmpBP589O6V0JxrSUt13E4QZLT4xX4RH4BOYcChKvM=;
 b=T/kDIOBeNzx4k8LINe44A4zZwKiyqULp8s1fpSRrdPMMbuxNoIpI8cofkTbb0g884B
 HzEl3iTycTQVLdyDPAoiXo+l1+fqp14MsKBwJXee3Q7yXzNGGZeAJMZmklt3L5eD26L5
 wiwPNosaqggil0K05DzRGYeATZrLHGvUVyjhxeMZ0ADyWXQ9J7bk/iy08jhaeota28pA
 qvm+lpZjI649fxNnXNZogmGs94vmkZEQDGO4aNbbyybjWCG1+YMJsAs2cSMedtsWppMc
 AtRnSov6tL3nx2z0kHbUbwiiokb849E6dlPs8ZM98jLLuH8Pf0sogudZVBUHW1k0EpYa
 YPxQ==
X-Gm-Message-State: AOAM533tr3pDq0JYAj4bgE4rl+q//Kyv0Y7uaDf83DEkM5oYnwfePYo6
 1AJYVH+23T3VR0V155y2xME9/0X5ce2xo0p05ZeJ5dCDcQHjOPD6qVt+Nn1us9SVpdbP9GVC+Y2
 NzQh7WU4/SNxPdAmJAAx9Vt7jZtgi
X-Received: by 2002:a37:a38e:: with SMTP id
 m136mr15199350qke.250.1616796053869; 
 Fri, 26 Mar 2021 15:00:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdjc8K+Reia9/uZrIZA0FnyV82RIoH05Va+FBTVeF7yBkyt1wnjDJ4h2zusGmfId1aYTbjwQ==
X-Received: by 2002:a37:a38e:: with SMTP id
 m136mr15199330qke.250.1616796053657; 
 Fri, 26 Mar 2021 15:00:53 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id 21sm7965657qkv.12.2021.03.26.15.00.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 15:00:52 -0700 (PDT)
Message-ID: <b4da382b17a77b66e45fd374c9d806dac6054e3a.camel@redhat.com>
Subject: Re: [PATCH v2 0/3] drm/nouveau: fix a use-after-free in postclose()
From: Lyude Paul <lyude@redhat.com>
To: Jeremy Cline <jcline@redhat.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Fri, 26 Mar 2021 18:00:51 -0400
In-Reply-To: <20201125202648.5220-1-jcline@redhat.com>
References: <20201103194912.184413-1-jcline@redhat.com>
 <20201125202648.5220-1-jcline@redhat.com>
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
 dri-devel@lists.freedesktop.org, Karol Herbst <kherbst@redhat.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBzZXJpZXMgaXM6CgpSZXZpZXdlZC1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVk
aGF0LmNvbT4KCkJ0dyAtIGluIHRoZSBmdXR1cmUgaWYgeW91IG5lZWQgdG8gc2VuZCBhIHJlc3Bp
biBvZiBtdWx0aXBsZSBwYXRjaGVzLCB5b3UgbmVlZAp0byBzZW5kIGl0IGFzIGl0J3Mgb3duIHNl
cGFyYXRlIHNlcmllcyBpbnN0ZWFkIG9mIHJlcGx5aW5nIHRvIHRoZSBwcmV2aW91cyBvbmUKKG9u
ZS1vZmYgcmVzcGlucyBjYW4ganVzdCBiZSBwb3N0ZWQgYXMgcmVwbGllcyB0aG91Z2gpLCBvdGhl
cndpc2UgcGF0Y2h3b3JrCndvbid0IHBpY2sgaXQgdXAKCk9uIFdlZCwgMjAyMC0xMS0yNSBhdCAx
NToyNiAtMDUwMCwgSmVyZW15IENsaW5lIHdyb3RlOgo+IFRoaXMgc2VyaWVzIGZpeGVzIGEgbnVt
YmVyIG9mIHVzZS1hZnRlci1mcmVlcyBpbiBub3V2ZWF1J3MgcG9zdGNsb3NlKCkKPiBoYW5kbGVy
LiBJdCB3YXMgZGlzY292ZXJlZCBieSBwb2ludGluZyBJR1QncyBjb3JlX2hvdHVucGx1ZyB0ZXN0
cyBhdCBhCj4gbm91dmVhdSBkZXZpY2UsIGJ1dCB0aGUgc3RlcHMgdG8gcmVwcm9kdWNlIGl0IGFy
ZSBzaW1wbGU6Cj4gCj4gMS4gT3BlbiB0aGUgZGV2aWNlIGZpbGUKPiAyLiBVbmJpbmQgdGhlIGRy
aXZlciBvciByZW1vdmUgdGhlIGRldmljZQo+IDMuIENsb3NlIHRoZSBmaWxlIG9wZW5lZCBpbiBz
dGVwIDEuCj4gCj4gRHVyaW5nIHRoZSBkZXZpY2UgcmVtb3ZhbCwgdGhlIG5vdXZlYXVfZHJtIHN0
cnVjdHVyZSBpcyBkZS1hbGxvY2F0ZWQsCj4gYnV0IGlzIGRlcmVmZXJlbmNlZCBpbiB0aGUgcG9z
dGNsb3NlKCkgaGFuZGxlci4KPiAKPiBPbmUgb2J2aW91cyBzb2x1dGlvbiBpcyB0byBlbnN1cmUg
YWxsIHRoZSBvcGVyYXRpb25zIGluIHRoZSBwb3N0Y2xvc2UoKQo+IGhhbmRsZXIgYXJlIHZhbGlk
IGJ5IGV4dGVuZGluZyB0aGUgbGlmZXRpbWUgb2YgdGhlIG5vdXZlYXVfZHJtCj4gc3RydWN0dXJl
LiBUaGlzIGlzIHBvc3NpYmxlIHdpdGggdGhlIG5ldyBkZXZtX2RybV9kZXZfYWxsb2MoKSBpbnRl
cmZhY2UsCj4gYnV0IHRoZSBjaGFuZ2UgaXMgc29tZXdoYXQgaW52YXNpdmUgc28gSSB0aG91Z2h0
IGl0IGJlc3QgdG8gc3VibWl0IHRoYXQKPiB3b3JrIHNlcGFyYXRlbHkuCj4gCj4gSW5zdGVhZCwg
d2UgbWFrZSB1c2Ugb2YgdGhlIGRybV9kZXZfdW5wbHVnKCkgQVBJLCBjbGVhbiB1cCBhbGwgY2xp
ZW50cwo+IGluIHRoZSBkZXZpY2UgcmVtb3ZhbCBjYWxsLCBhbmQgY2hlY2sgdG8gbWFrZSBzdXJl
IHRoZSBkZXZpY2UgaGFzIG5vdAo+IGJlZW4gdW5wbHVnZ2VkIGluIHRoZSBwb3N0Y2xvc2UoKSBo
YW5kbGVyLiBXaGlsZSB0aGlzIGRvZXMgbm90IGVuYWJsZQo+IGhvdC11bnBsdWcgc3VwcG9ydCBm
b3Igbm91dmVhdSwgaXQncyBlbm91Z2ggdG8gYXZvaWQgY3Jhc2hpbmcgdGhlIGtlcm5lbAo+IGFu
ZCBsZWFkcyB0byBhbGwgdGhlIGNvcmVfaG90dW5wbHVnIHRlc3RzIHRvIHBhc3MuCj4gCj4gVGhp
cyBzZXJpZXMgcmVyb2xsIGFkZHJlc3NlcyBhIG1pc3NpbmcgbXV0ZXhfZGVzdHJveSgpIGNhbGwg
YW5kIGEgdHlwbwo+IGluIGEgY29tbWl0IG1lc3NhZ2UuCj4gCj4gSmVyZW15IENsaW5lICgzKToK
PiDCoCBkcm0vbm91dmVhdTogdXNlIGRybV9kZXZfdW5wbHVnKCkgZHVyaW5nIGRldmljZSByZW1v
dmFsCj4gwqAgZHJtL25vdXZlYXU6IEFkZCBhIGRlZGljYXRlZCBtdXRleCBmb3IgdGhlIGNsaWVu
dHMgbGlzdAo+IMKgIGRybS9ub3V2ZWF1OiBjbGVhbiB1cCBhbGwgY2xpZW50cyBvbiBkZXZpY2Ug
cmVtb3ZhbAo+IAo+IMKgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcm0uYyB8IDQy
ICsrKysrKysrKysrKysrKysrKysrKysrLS0tLQo+IMKgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
bm91dmVhdV9kcnYuaCB8wqAgNSArKysrCj4gwqAyIGZpbGVzIGNoYW5nZWQsIDQyIGluc2VydGlv
bnMoKyksIDUgZGVsZXRpb25zKC0pCj4gCgotLSAKU2luY2VyZWx5LAogICBMeXVkZSBQYXVsIChz
aGUvaGVyKQogICBTb2Z0d2FyZSBFbmdpbmVlciBhdCBSZWQgSGF0CiAgIApOb3RlOiBJIGRlYWwg
d2l0aCBhIGxvdCBvZiBlbWFpbHMgYW5kIGhhdmUgYSBsb3Qgb2YgYnVncyBvbiBteSBwbGF0ZS4g
SWYgeW91J3ZlCmFza2VkIG1lIGEgcXVlc3Rpb24sIGFyZSB3YWl0aW5nIGZvciBhIHJldmlldy9t
ZXJnZSBvbiBhIHBhdGNoLCBldGMuIGFuZCBJCmhhdmVuJ3QgcmVzcG9uZGVkIGluIGEgd2hpbGUs
IHBsZWFzZSBmZWVsIGZyZWUgdG8gc2VuZCBtZSBhbm90aGVyIGVtYWlsIHRvIGNoZWNrCm9uIG15
IHN0YXR1cy4gSSBkb24ndCBiaXRlIQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
