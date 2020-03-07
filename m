Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF1217CDF7
	for <lists+dri-devel@lfdr.de>; Sat,  7 Mar 2020 13:05:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C2BE6E1C4;
	Sat,  7 Mar 2020 12:05:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 324756E1C4
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Mar 2020 12:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583582751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7AcRAGrNL7hMAFSFvgSDoGU3nXSDj1i4/Az12+SmLNs=;
 b=aeWjAUBQP2V9ZVEOifNwKyGHBEaf4v1W95zHxu7Gm3HkPBW7bEEQVZfJ58DGFbtVds9DJQ
 gbcKPG0D2fcq1nyES+R9rcYTSHjAw0JJrJ82iFvoNB5a8dzgy+YArCp/bfFaEckJKR8bcA
 YCW5Avw4MCoK0n3fqTVu8sUBYONJt3Q=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-Lf-YVBLaN3yOqgiBpQea8w-1; Sat, 07 Mar 2020 07:05:47 -0500
X-MC-Unique: Lf-YVBLaN3yOqgiBpQea8w-1
Received: by mail-wr1-f69.google.com with SMTP id n12so2323446wrp.19
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Mar 2020 04:05:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fvJgabj3nTJUkbCxeSwOD5bKpyXRPk1GpZ8xJvwqzQk=;
 b=mYu4cW4z8YCEYtU0/Z9WUYcjk4+geLJr2K5wnzbsngGDAUyrvS2240Tp9BLGelJPBq
 DGMECgmn8AedFG0Z/tmW3fwIJOhDu77p8GSqD1NRxcgZaSbVavgUl0tp+5V4W0DZX/KW
 sr5IGsHzjO8iT18V5OsSaXR8kRMc8v4F4qEzwTkwnN8bJMzKP1dMYvFwiFUTsMUgL9Ah
 ZZJxMBj3T2KQ1OA0uGVKW3HIqm3WCpyxhFE6ps+RtikP5wGz9K9G+9aFST9tYoWnhBwp
 WorIWJjcUO80BaQ8Ag8g3s76Ld4gt3i44FWs84dWNZG8qoBO9Wsz+mOVfPj6RbL4L3ZH
 fqeg==
X-Gm-Message-State: ANhLgQ2I/b28ycBXrqzc45BbVjDcb61xYiLVXymp905XsmTHr+BMT9iu
 rAaytLKzN9Lmaf4x+5cTKE9nEfYj8hTNa9muA0AjLak7LYByv3fy2Yxg1XdXbsmv0fIkF5Vzfan
 LMdEjI2fwENx/BS828hXU+qUHAA5I
X-Received: by 2002:a05:600c:301:: with SMTP id
 q1mr9892459wmd.182.1583582746498; 
 Sat, 07 Mar 2020 04:05:46 -0800 (PST)
X-Google-Smtp-Source: ADFU+vtcqSvMkLYigsEgmysDgrOMIgorxgb+49Gq6V9uAFR0HQduVQt4zAHXPJMq1m3LelhxCOkZDw==
X-Received: by 2002:a05:600c:301:: with SMTP id
 q1mr9892434wmd.182.1583582746220; 
 Sat, 07 Mar 2020 04:05:46 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
 by smtp.gmail.com with ESMTPSA id o3sm2465440wmc.38.2020.03.07.04.05.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Mar 2020 04:05:45 -0800 (PST)
Subject: Re: [PATCH v2 0/4] drm/dp_mst: Fix bandwidth checking regressions
 from DSC patches
To: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org
References: <20200306234623.547525-1-lyude@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <f2ad071d-ae50-d840-439b-dc2df85cc88f@redhat.com>
Date: Sat, 7 Mar 2020 13:05:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200306234623.547525-1-lyude@redhat.com>
Content-Language: en-US
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <seanpaul@google.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAzLzcvMjAgMTI6NDYgQU0sIEx5dWRlIFBhdWwgd3JvdGU6Cj4gQU1EJ3MgcGF0Y2gg
c2VyaWVzIGZvciBhZGRpbmcgRFNDIHN1cHBvcnQgdG8gdGhlIE1TVCBoZWxwZXJzCj4gdW5mb3J0
dW5hdGVseSBpbnRyb2R1Y2VkIGEgZmV3IHJlZ3Jlc3Npb25zIGludG8gdGhlIGtlcm5lbCB0aGF0
IEkgZGlkbid0Cj4gZ2V0IGFyb3VuZCB0byBmaXhpbmcgdW50aWwganVzdCBub3cuIEkgd291bGQg
aGF2ZSByZXZlcnRlZCB0aGUgY2hhbmdlcwo+IGVhcmxpZXIsIGJ1dCBzZWVpbmcgYXMgdGhhdCB3
b3VsZCBoYXZlIHJldmVydGVkIGFsbCBvZiBhbWQncyBEU0Mgc3VwcG9ydAo+ICsgZXZlcnl0aGlu
ZyB0aGF0IHdhcyBkb25lIG9uIHRvcCBvZiB0aGF0IEkgcmVhbGxsbGxseSB3YW50ZWQgdG8gYXZv
aWQKPiBkb2luZyB0aGF0Lgo+IAo+IEFueXdheSwgdGhpcyBzaG91bGQgZml4IGV2ZXJ5dGhpbmcg
YmFuZHdpZHRoLWNoZWNrIHJlbGF0ZWQgYXMgZmFyIGFzIEkKPiBjYW4gdGVsbCAoSSBmb3VuZCBz
b21lIG90aGVyIHJlZ3Jlc3Npb25zIHVucmVsYXRlZCB0byBBTUQncyBEU0MgcGF0Y2hlcwo+IHdo
aWNoIEknbGwgYmUgc2VuZGluZyBvdXQgcGF0Y2hlcyBmb3Igc2hvcnRseSkuIE5vdGUgdGhhdCBJ
IGRvbid0IGhhdmUKPiBhbnkgRFNDIGRpc3BsYXlzIGxvY2FsbHkgeWV0LCBzbyBpZiBzb21lb25l
IGZyb20gQU1EIGNvdWxkIHNhbml0eSBjaGVjawo+IHRoaXMgSSB3b3VsZCBhcHByZWNpYXRlIGl0
IOKZpS4KCkkgY2FuIGNvbmZpcm0gdGhhdCB0aGlzIHNlcmllcyBmaXhlcyBvbmx5IG9mIHRoZSAy
IEZIRCBtb25pdG9ycyBvbgpteSBMZW5vdm8gVEIzIGdlbiAyIGRvY2sgbGlnaHRpbmcgdXAsIHRo
YW5rIHlvdSEKClRoaXMgc2VyaWVzIGlzOgoKVGVzdGVkLWJ5OiBIYW5zIGRlIEdvZWRlIDxoZGVn
b2VkZUByZWRoYXQuY29tPgoKUmVnYXJkcywKCkhhbnMKCgoKPiAKPiBDYzogTWlraXRhIExpcHNr
aSA8bWlraXRhLmxpcHNraUBhbWQuY29tPgo+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5k
ZXVjaGVyQGFtZC5jb20+Cj4gQ2M6IFNlYW4gUGF1bCA8c2VhbnBhdWxAZ29vZ2xlLmNvbT4KPiBD
YzogSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4KPiAKPiBMeXVkZSBQYXVsICg0
KToKPiAgICBkcm0vZHBfbXN0OiBSZW5hbWUgZHJtX2RwX21zdF9pc19kcF9tc3RfZW5kX2Rldmlj
ZSgpIHRvIGJlIGxlc3MKPiAgICAgIHJlZHVuZGFudAo+ICAgIGRybS9kcF9tc3Q6IFVzZSBmdWxs
X3BibiBpbnN0ZWFkIG9mIGF2YWlsYWJsZV9wYm4gZm9yIGJhbmR3aWR0aCBjaGVja3MKPiAgICBk
cm0vZHBfbXN0OiBSZXByb2JlIHBhdGggcmVzb3VyY2VzIGluIENTTiBoYW5kbGVyCj4gICAgZHJt
L2RwX21zdDogUmV3cml0ZSBhbmQgZml4IGJhbmR3aWR0aCBsaW1pdCBjaGVja3MKPiAKPiAgIGRy
aXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgfCAxODUgKysrKysrKysrKysrKysr
KysrLS0tLS0tLS0KPiAgIGluY2x1ZGUvZHJtL2RybV9kcF9tc3RfaGVscGVyLmggICAgICAgfCAg
IDQgKy0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMTI5IGluc2VydGlvbnMoKyksIDYwIGRlbGV0aW9u
cygtKQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
