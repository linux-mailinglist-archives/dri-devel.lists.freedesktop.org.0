Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 663D336F5E6
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 08:48:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D836E48B;
	Fri, 30 Apr 2021 06:48:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 278D76E48B;
 Fri, 30 Apr 2021 06:48:36 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id y26so1718147eds.4;
 Thu, 29 Apr 2021 23:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=wr7vkFvkOO9C1IiTbS217AA3btEZiiIRnKxh2CRGTTk=;
 b=uvCDiVu1TLau3jWTAMHvbKhSSKcZ5RPZ9i3rCtgeHza9t9mivBL4f//W7bhJUmKx8b
 3AItqMKspCOq1l5OF3dg2IxU/kX30WEhIV2Nc2K5RHwr8Tged4hycBy88y6qpVTGUP4B
 BmcBShN7h8zSGCq966NAvaAtlwZ771UzGln3JIXxe/DU2YE3GWIeL303lNjKcw5+Z2dM
 uz1BG1ZlZmt85KefQeVyaWxm/fiKVq24YuUiEBdtZQ8rfdUAIBWumnyNgYg3r3UqeUdd
 DL8P3uP7nnnOSylX7a/0t8rkf5kPMezhiAcXD0D4s+5TVDOzJJxwkhEFxu6D3PX5MYtA
 1KOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=wr7vkFvkOO9C1IiTbS217AA3btEZiiIRnKxh2CRGTTk=;
 b=iArt797/mZfxUMzh1k/vpP/jkbEZMbHeQM4XjBS8yjiNBe73ewFAGXNF/Zi38gDzlQ
 HHJNqAuHHOX2fMeMKqG+Pcu6brl/hJmuFnUh4SM/bmPF1rsGnGcik1XS86VEGzxzxDlq
 G/5IJNoN8sy3wPkWgSXY+rywNiXvl2be33+ZSL4qZTAd6y7jx51kUPeYDSeWuqMTRbJF
 68f/tEHat1veBmj4Zw1HgCcTK5cVGTS0H5PGeUsl1GEadupMiYfAdHqHxqU9WQaXy9GY
 eKRELjYsXq8LPPe3lHTfNJIKmAGgePRXKg1yID0Wa/RDpb8TvsDJYjGG39GwZRnIYF9X
 /inw==
X-Gm-Message-State: AOAM531/ugmW1iAGU46S6N0vYPHaNVtoIrb0wSMd+lx3chcB0+IffC5P
 hseiK8S2fwOezAbZclxc3po=
X-Google-Smtp-Source: ABdhPJwvoIifIFy/20SIXJ/P+khoyaIP/F2WPtFaEJQ7tN06ppU13Nhn43CHFIFRYobFTqFdRLUQ3Q==
X-Received: by 2002:aa7:cf06:: with SMTP id a6mr3836998edy.340.1619765254710; 
 Thu, 29 Apr 2021 23:47:34 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:476:af65:610b:2d5d?
 ([2a02:908:1252:fb60:476:af65:610b:2d5d])
 by smtp.gmail.com with ESMTPSA id dk13sm562944edb.34.2021.04.29.23.47.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 23:47:34 -0700 (PDT)
Subject: Re: [PATCH v5 15/27] drm/scheduler: Fix hang when sched_entity
 released
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
References: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
 <20210428151207.1212258-16-andrey.grodzovsky@amd.com>
 <a8314d77-578f-e0df-5c49-77d5f10c76c7@amd.com>
 <9cb771f2-d52f-f14e-f3d4-b9488b353ae3@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <0c598888-d7d4-451a-3d4a-01c46ddda397@gmail.com>
Date: Fri, 30 Apr 2021 08:47:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <9cb771f2-d52f-f14e-f3d4-b9488b353ae3@amd.com>
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org, helgaas@kernel.org,
 Felix.Kuehling@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpBbSAyOS4wNC4yMSB1bSAxOTowNiBzY2hyaWViIEFuZHJleSBHcm9kem92c2t5Ogo+Cj4KPiBP
biAyMDIxLTA0LTI5IDM6MTggYS5tLiwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4gSSBuZWVk
IHRvIHRha2UgYW5vdGhlciBsb29rIGF0IHRoaXMgcGFydCB3aGVuIEkgZG9uJ3QgaGF2ZSBhIG1h
c3NpdmUgCj4+IGhlYWRhY2hlIGFueSBtb3JlLgo+Pgo+PiBNYXliZSBzcGxpdCB0aGUgcGF0Y2gg
c2V0IHVwIGludG8gZGlmZmVyZW50IHBhcnRzLCBzb21ldGhpbmcgbGlrZToKPj4gMS4gQWRkaW5n
IGdlbmVyYWwgaW5mcmFzdHJ1Y3R1cmUuCj4+IDIuIE1ha2luZyBzdXJlIGFsbCBtZW1vcnkgaXMg
dW5wb2xhdGVkLgo+PiAzLiBKb2IgYW5kIGZlbmNlIGhhbmRsaW5nCj4KPiBJIGFtIG5vdCBzdXJl
IHlvdSBtZWFuIHRoaXMgcGF0Y2ggaGVyZSwgbWF5YmUgYW5vdGhlciBvbmUgPwo+IEFsc28gbm90
ZSB5b3UgYWxyZWFkeSBSQmVkIGl0LgoKTm8gd2hhdCBJIG1lYW50IHdhcyB0byBzZW5kIG91dCB0
aGUgcGF0Y2hlcyBiZWZvcmUgdGhpcyBvbmUgYXMgIzEgYW5kICMyLgoKVGhhdCBpcyB0aGUgZWFz
aWVyIHN0dWZmIHdoaWNoIGNhbiBlYXNpbHkgZ28gaW50byB0aGUgZHJtLW1pc2MtbmV4dCBvciAK
YW1kLXN0YWdpbmctZHJtLW5leHQgYnJhbmNoLgoKVGhlIHNjaGVkdWxlciBzdHVmZiBjZXJ0YWlu
bHkgbmVlZCB0byBnbyBpbnRvIGRybS1taXNjLW5leHQuCgpDaHJpc3RpYW4uCgo+Cj4gQW5kcmV5
Cj4KPj4KPj4gQ2hyaXN0aWFuLgo+Pgo+PiBBbSAyOC4wNC4yMSB1bSAxNzoxMSBzY2hyaWViIEFu
ZHJleSBHcm9kem92c2t5Ogo+Pj4gUHJvYmxlbTogSWYgc2NoZWR1bGVyIGlzIGFscmVhZHkgc3Rv
cHBlZCBieSB0aGUgdGltZSBzY2hlZF9lbnRpdHkKPj4+IGlzIHJlbGVhc2VkIGFuZCBlbnRpdHkn
cyBqb2JfcXVldWUgbm90IGVtcHR5IEkgZW5jb3VudHJlZAo+Pj4gYSBoYW5nIGluIGRybV9zY2hl
ZF9lbnRpdHlfZmx1c2guIFRoaXMgaXMgYmVjYXVzZSAKPj4+IGRybV9zY2hlZF9lbnRpdHlfaXNf
aWRsZQo+Pj4gbmV2ZXIgYmVjb21lcyBmYWxzZS4KPj4+Cj4+PiBGaXg6IEluIGRybV9zY2hlZF9m
aW5pIGRldGFjaCBhbGwgc2NoZWRfZW50aXRpZXMgZnJvbSB0aGUKPj4+IHNjaGVkdWxlcidzIHJ1
biBxdWV1ZXMuIFRoaXMgd2lsbCBzYXRpc2Z5IGRybV9zY2hlZF9lbnRpdHlfaXNfaWRsZS4KPj4+
IEFsc28gd2FrZXVwIGFsbCB0aG9zZSBwcm9jZXNzZXMgc3R1Y2sgaW4gc2NoZWRfZW50aXR5IGZs
dXNoaW5nCj4+PiBhcyB0aGUgc2NoZWR1bGVyIG1haW4gdGhyZWFkIHdoaWNoIHdha2VzIHRoZW0g
dXAgaXMgc3RvcHBlZCBieSBub3cuCj4+Pgo+Pj4gdjI6Cj4+PiBSZXZlcnNlIG9yZGVyIG9mIGRy
bV9zY2hlZF9ycV9yZW1vdmVfZW50aXR5IGFuZCBtYXJraW5nCj4+PiBzX2VudGl0eSBhcyBzdG9w
cGVkIHRvIHByZXZlbnQgcmVpbnNlcmlvbiBiYWNrIHRvIHJxIGR1ZQo+Pj4gdG8gcmFjZS4KPj4+
Cj4+PiB2MzoKPj4+IERyb3AgZHJtX3NjaGVkX3JxX3JlbW92ZV9lbnRpdHksIG9ubHkgbW9kaWZ5
IGVudGl0eS0+c3RvcHBlZAo+Pj4gYW5kIGNoZWNrIGZvciBpdCBpbiBkcm1fc2NoZWRfZW50aXR5
X2lzX2lkbGUKPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5
Lmdyb2R6b3Zza3lAYW1kLmNvbT4KPj4+IFJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4+PiAtLS0KPj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9z
Y2hlZHVsZXIvc2NoZWRfZW50aXR5LmMgfMKgIDMgKystCj4+PiDCoCBkcml2ZXJzL2dwdS9kcm0v
c2NoZWR1bGVyL3NjaGVkX21haW4uY8KgwqAgfCAyNCAKPj4+ICsrKysrKysrKysrKysrKysrKysr
KysrKwo+Pj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRf
ZW50aXR5LmMgCj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfZW50aXR5LmMK
Pj4+IGluZGV4IGYwNzkwZTk0NzFkMS4uY2I1OGY2OTJkYWQ5IDEwMDY0NAo+Pj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9lbnRpdHkuYwo+Pj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3NjaGVkdWxlci9zY2hlZF9lbnRpdHkuYwo+Pj4gQEAgLTExNiw3ICsxMTYsOCBAQCBz
dGF0aWMgYm9vbCBkcm1fc2NoZWRfZW50aXR5X2lzX2lkbGUoc3RydWN0IAo+Pj4gZHJtX3NjaGVk
X2VudGl0eSAqZW50aXR5KQo+Pj4gwqDCoMKgwqDCoCBybWIoKTsgLyogZm9yIGxpc3RfZW1wdHkg
dG8gd29yayB3aXRob3V0IGxvY2sgKi8KPj4+IMKgwqDCoMKgwqAgaWYgKGxpc3RfZW1wdHkoJmVu
dGl0eS0+bGlzdCkgfHwKPj4+IC3CoMKgwqDCoMKgwqDCoCBzcHNjX3F1ZXVlX2NvdW50KCZlbnRp
dHktPmpvYl9xdWV1ZSkgPT0gMCkKPj4+ICvCoMKgwqDCoMKgwqDCoCBzcHNjX3F1ZXVlX2NvdW50
KCZlbnRpdHktPmpvYl9xdWV1ZSkgPT0gMCB8fAo+Pj4gK8KgwqDCoMKgwqDCoMKgIGVudGl0eS0+
c3RvcHBlZCkKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gdHJ1ZTsKPj4+IMKgwqDCoMKg
wqAgcmV0dXJuIGZhbHNlOwo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVs
ZXIvc2NoZWRfbWFpbi5jIAo+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21h
aW4uYwo+Pj4gaW5kZXggOTA4YjBiNTYwMzJkLi5iYTA4NzM1NGQwYTggMTAwNjQ0Cj4+PiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYwo+Pj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMKPj4+IEBAIC04OTcsOSArODk3LDMzIEBA
IEVYUE9SVF9TWU1CT0woZHJtX3NjaGVkX2luaXQpOwo+Pj4gwqDCoCAqLwo+Pj4gwqAgdm9pZCBk
cm1fc2NoZWRfZmluaShzdHJ1Y3QgZHJtX2dwdV9zY2hlZHVsZXIgKnNjaGVkKQo+Pj4gwqAgewo+
Pj4gK8KgwqDCoCBzdHJ1Y3QgZHJtX3NjaGVkX2VudGl0eSAqc19lbnRpdHk7Cj4+PiArwqDCoMKg
IGludCBpOwo+Pj4gKwo+Pj4gwqDCoMKgwqDCoCBpZiAoc2NoZWQtPnRocmVhZCkKPj4+IMKgwqDC
oMKgwqDCoMKgwqDCoCBrdGhyZWFkX3N0b3Aoc2NoZWQtPnRocmVhZCk7Cj4+PiArwqDCoMKgIGZv
ciAoaSA9IERSTV9TQ0hFRF9QUklPUklUWV9DT1VOVCAtIDE7IGkgPj0gCj4+PiBEUk1fU0NIRURf
UFJJT1JJVFlfTUlOOyBpLS0pIHsKPj4+ICvCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX3NjaGVk
X3JxICpycSA9ICZzY2hlZC0+c2NoZWRfcnFbaV07Cj4+PiArCj4+PiArwqDCoMKgwqDCoMKgwqAg
aWYgKCFycSkKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnRpbnVlOwo+Pj4gKwo+Pj4g
K8KgwqDCoMKgwqDCoMKgIHNwaW5fbG9jaygmcnEtPmxvY2spOwo+Pj4gK8KgwqDCoMKgwqDCoMKg
IGxpc3RfZm9yX2VhY2hfZW50cnkoc19lbnRpdHksICZycS0+ZW50aXRpZXMsIGxpc3QpCj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKgo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAq
IFByZXZlbnRzIHJlaW5zZXJ0aW9uIGFuZCBtYXJrcyBqb2JfcXVldWUgYXMgaWRsZSwKPj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBpdCB3aWxsIHJlbW92ZWQgZnJvbSBycSBpbiBkcm1f
c2NoZWRfZW50aXR5X2ZpbmkKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBldmVudHVh
bGx5Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICovCj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBzX2VudGl0eS0+c3RvcHBlZCA9IHRydWU7Cj4+PiArwqDCoMKgwqDCoMKgwqAgc3Bp
bl91bmxvY2soJnJxLT5sb2NrKTsKPj4+ICsKPj4+ICvCoMKgwqAgfQo+Pj4gKwo+Pj4gK8KgwqDC
oCAvKiBXYWtldXAgZXZlcnlvbmUgc3R1Y2sgaW4gZHJtX3NjaGVkX2VudGl0eV9mbHVzaCBmb3Ig
dGhpcyAKPj4+IHNjaGVkdWxlciAqLwo+Pj4gK8KgwqDCoCB3YWtlX3VwX2FsbCgmc2NoZWQtPmpv
Yl9zY2hlZHVsZWQpOwo+Pj4gKwo+Pj4gwqDCoMKgwqDCoCAvKiBDb25maXJtIG5vIHdvcmsgbGVm
dCBiZWhpbmQgYWNjZXNzaW5nIGRldmljZSBzdHJ1Y3R1cmVzICovCj4+PiDCoMKgwqDCoMKgIGNh
bmNlbF9kZWxheWVkX3dvcmtfc3luYygmc2NoZWQtPndvcmtfdGRyKTsKPj4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
