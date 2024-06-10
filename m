Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFB8901F21
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 12:20:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAC0510E3E2;
	Mon, 10 Jun 2024 10:20:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QAalyCpY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3F5B10E3E2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 10:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718014804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qMvcynBHrWYs0cALHqvZH4z7O+79T1qe0EY88237L2Q=;
 b=QAalyCpYmxcrn3LALqscy+UotpXtINeIETWMhCTtombsTjJQ8fQ1e75rWpqoXHD4YdMet1
 PowTo+s5436TFTlGKQy6r9IU2NSf1iy4JdqaHtfl1dGCgv0ffib2ruDQVkQ7iMaR+DvX/3
 NWEWJfLhf784NOsJnhidJCIOcv5lFsc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-L7s7ROOCPh2MdH2xd12CFQ-1; Mon, 10 Jun 2024 06:20:01 -0400
X-MC-Unique: L7s7ROOCPh2MdH2xd12CFQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-42180a0730dso1874165e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 03:20:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718014801; x=1718619601;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qMvcynBHrWYs0cALHqvZH4z7O+79T1qe0EY88237L2Q=;
 b=VKF+VKXot5LQHNLpnfDoZ7vdGO9zTIMjcLs0M/c0mm+Sj5scmIqJk07ePOOWN1A4p+
 72UQxctxuyaWu5sw3X64/R6wBH7sZUJTG19NHI3StEJ1LvJht4dQJ8FgDUin8P41v3V8
 H//3vOnuRGcZx8+A5nfBgwjBHshQDx1c9oIxjeMmV+TpK/LrnYtTtyZEDwryAWi6ITfa
 xq05R/NisDL2wbSpMVvCqU/vGoMbazM/1sjoV+igop+hdFQg5pSEOIxywKtVWeS5wo7d
 kZA+r9DWMbP8+BP+omrQb7aGP890dS7tnZzkDMwSwTtLP21LJ/TqCE0BlNvjhEyaN+hH
 gwVA==
X-Gm-Message-State: AOJu0YxEpW6/NWmgtPQbitenvvi5abnAWa2PXddVcLY1jl8sejKLrAjI
 7Mjtcouh/UbY3XTmHmUaGSBMdcQNoqL+AUyGAvQmn5iMfqCjtTvTtVYhufJ0IrEgaWfYQBIryHJ
 d1VHieih9LBDTkoBEHwJ0tM4CDsyLZJj15MmLPr5KQ7K3tCsWTWXhZvTMbTwIvNnGug==
X-Received: by 2002:a05:6000:1888:b0:35f:2584:7714 with SMTP id
 ffacd0b85a97d-35f258478aamr1140484f8f.5.1718014800751; 
 Mon, 10 Jun 2024 03:20:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVQ5ssyCFjkZt4UK3b3fOfN9lD0Xt7ezocPi7jiouFZYIFIOKhrohlDydb/DJLIIVw0DW8BA==
X-Received: by 2002:a05:6000:1888:b0:35f:2584:7714 with SMTP id
 ffacd0b85a97d-35f258478aamr1140471f8f.5.1718014800347; 
 Mon, 10 Jun 2024 03:20:00 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.remote.csb
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35f1846574esm5666493f8f.117.2024.06.10.03.19.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jun 2024 03:19:59 -0700 (PDT)
Message-ID: <bae495cf171db1415cf14c44fb450b81148a6e0d.camel@redhat.com>
Subject: Re: [PATCH v8 08/13] PCI: Move pinned status bit to struct pci_dev
From: Philipp Stanner <pstanner@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, Sam
 Ravnborg <sam@ravnborg.org>, dakr@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-pci@vger.kernel.org
Date: Mon, 10 Jun 2024 12:19:58 +0200
In-Reply-To: <20240610093149.20640-9-pstanner@redhat.com>
References: <20240610093149.20640-1-pstanner@redhat.com>
 <20240610093149.20640-9-pstanner@redhat.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDI0LTA2LTEwIGF0IDExOjMxICswMjAwLCBQaGlsaXBwIFN0YW5uZXIgd3JvdGU6
Cj4gVGhlIGJpdCBkZXNjcmliaW5nIHdoZXRoZXIgdGhlIFBDSSBkZXZpY2UgaXMgY3VycmVudGx5
IHBpbm5lZCBpcyBzdG9yZWQKPiBpbiBzdHJ1Y3QgcGNpX2RldnJlcy4gVG8gY2xlYW4gdXAgYW5k
IHNpbXBsaWZ5IHRoZSBQQ0kgZGV2cmVzIEFQSSwgaXQncwo+IGJldHRlciBpZiB0aGlzIGluZm9y
bWF0aW9uIGlzIHN0b3JlZCBpbiBzdHJ1Y3QgcGNpX2Rldi4KPiAKPiBUaGlzIHdpbGwgbGF0ZXIg
cGVybWl0IHNpbXBsaWZ5aW5nIHBjaW1fZW5hYmxlX2RldmljZSgpLgo+IAo+IE1vdmUgdGhlICdw
aW5uZWQnIGJvb2xlYW4gYml0IHRvIHN0cnVjdCBwY2lfZGV2Lgo+IAo+IFJlc3RydWN0dXJlIGJp
dHMgaW4gc3RydWN0IHBjaV9kZXYgc28gdGhlIHBtIC8gcG1lIGZpZWxkcyBhcmUgbmV4dCB0bwo+
IGVhY2ggb3RoZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGhpbGlwcCBTdGFubmVyIDxwc3Rhbm5l
ckByZWRoYXQuY29tPgo+IC0tLQo+IMKgZHJpdmVycy9wY2kvZGV2cmVzLmMgfCAxNCArKysrLS0t
LS0tLS0tLQo+IMKgZHJpdmVycy9wY2kvcGNpLmjCoMKgwqAgfMKgIDEgLQo+IMKgaW5jbHVkZS9s
aW51eC9wY2kuaMKgIHzCoCA0ICsrKy0KPiDCoDMgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25z
KCspLCAxMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvZGV2cmVz
LmMgYi9kcml2ZXJzL3BjaS9kZXZyZXMuYwo+IGluZGV4IDlkMjU5NDBjZTI2MC4uMjY5NmJhZWY1
YzJjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvcGNpL2RldnJlcy5jCj4gKysrIGIvZHJpdmVycy9w
Y2kvZGV2cmVzLmMKPiBAQCAtNDAzLDcgKzQwMyw3IEBAIHN0YXRpYyB2b2lkIHBjaW1fcmVsZWFz
ZShzdHJ1Y3QgZGV2aWNlICpnZW5kZXYsIHZvaWQgKnJlcykKPiDCoMKgwqDCoMKgwqDCoMKgaWYg
KHRoaXMtPnJlc3RvcmVfaW50eCkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHBj
aV9pbnR4KGRldiwgdGhpcy0+b3JpZ19pbnR4KTsKPiDCoAo+IC3CoMKgwqDCoMKgwqDCoGlmIChw
Y2lfaXNfZW5hYmxlZChkZXYpICYmICF0aGlzLT5waW5uZWQpCj4gK8KgwqDCoMKgwqDCoMKgaWYg
KHBjaV9pc19lbmFibGVkKGRldikgJiYgIWRldi0+cGlubmVkKQo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgcGNpX2Rpc2FibGVfZGV2aWNlKGRldik7Cj4gwqB9Cj4gwqAKPiBAQCAt
NDU5LDE4ICs0NTksMTIgQEAgRVhQT1JUX1NZTUJPTChwY2ltX2VuYWJsZV9kZXZpY2UpOwo+IMKg
ICogcGNpbV9waW5fZGV2aWNlIC0gUGluIG1hbmFnZWQgUENJIGRldmljZQo+IMKgICogQHBkZXY6
IFBDSSBkZXZpY2UgdG8gcGluCj4gwqAgKgo+IC0gKiBQaW4gbWFuYWdlZCBQQ0kgZGV2aWNlIEBw
ZGV2LsKgIFBpbm5lZCBkZXZpY2Ugd29uJ3QgYmUgZGlzYWJsZWQgb24KPiAtICogZHJpdmVyIGRl
dGFjaC7CoCBAcGRldiBtdXN0IGhhdmUgYmVlbiBlbmFibGVkIHdpdGgKPiAtICogcGNpbV9lbmFi
bGVfZGV2aWNlKCkuCj4gKyAqIFBpbiBtYW5hZ2VkIFBDSSBkZXZpY2UgQHBkZXYuIFBpbm5lZCBk
ZXZpY2Ugd29uJ3QgYmUgZGlzYWJsZWQgb24gZHJpdmVyCj4gKyAqIGRldGFjaC4gQHBkZXYgbXVz
dCBoYXZlIGJlZW4gZW5hYmxlZCB3aXRoIHBjaW1fZW5hYmxlX2RldmljZSgpLgo+IMKgICovCj4g
wqB2b2lkIHBjaW1fcGluX2RldmljZShzdHJ1Y3QgcGNpX2RldiAqcGRldikKPiDCoHsKPiAtwqDC
oMKgwqDCoMKgwqBzdHJ1Y3QgcGNpX2RldnJlcyAqZHI7Cj4gLQo+IC3CoMKgwqDCoMKgwqDCoGRy
ID0gZmluZF9wY2lfZHIocGRldik7Cj4gLcKgwqDCoMKgwqDCoMKgV0FSTl9PTighZHIgfHwgIXBj
aV9pc19lbmFibGVkKHBkZXYpKTsKPiAtwqDCoMKgwqDCoMKgwqBpZiAoZHIpCj4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRyLT5waW5uZWQgPSAxOwo+ICvCoMKgwqDCoMKgwqDCoHBk
ZXYtPnBpbm5lZCA9IHRydWU7Cj4gwqB9Cj4gwqBFWFBPUlRfU1lNQk9MKHBjaW1fcGluX2Rldmlj
ZSk7Cj4gwqAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvcGNpLmggYi9kcml2ZXJzL3BjaS9w
Y2kuaAo+IGluZGV4IGQ3ZjAwYjQzYjA5OC4uNmUwMmJhMWI1OTQ3IDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvcGNpL3BjaS5oCj4gKysrIGIvZHJpdmVycy9wY2kvcGNpLmgKPiBAQCAtODIxLDcgKzgy
MSw2IEBAIHN0YXRpYyBpbmxpbmUgcGNpX3Bvd2VyX3QgbWlkX3BjaV9nZXRfcG93ZXJfc3RhdGUo
c3RydWN0IHBjaV9kZXYgKnBkZXYpCj4gwqAgKiB0aGVuIHJlbW92ZSB0aGVtIGZyb20gaGVyZS4K
PiDCoCAqLwo+IMKgc3RydWN0IHBjaV9kZXZyZXMgewo+IC3CoMKgwqDCoMKgwqDCoHVuc2lnbmVk
IGludCBwaW5uZWQ6MTsKPiDCoMKgwqDCoMKgwqDCoMKgdW5zaWduZWQgaW50IG9yaWdfaW50eDox
Owo+IMKgwqDCoMKgwqDCoMKgwqB1bnNpZ25lZCBpbnQgcmVzdG9yZV9pbnR4OjE7Cj4gwqDCoMKg
wqDCoMKgwqDCoHVuc2lnbmVkIGludCBtd2k6MTsKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51
eC9wY2kuaCBiL2luY2x1ZGUvbGludXgvcGNpLmgKPiBpbmRleCBmYjAwNGZkNGU4ODkuLmNjOTI0
N2Y3ODE1OCAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L3BjaS5oCj4gKysrIGIvaW5jbHVk
ZS9saW51eC9wY2kuaAo+IEBAIC0zNjcsMTAgKzM2NywxMiBAQCBzdHJ1Y3QgcGNpX2RldiB7Cj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRoaXMgaXMgRDAtRDMsIEQwIGJlaW5nIGZ1bGx5
Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZ1bmN0aW9uYWwsIGFuZCBEMyBiZWluZyBv
ZmYuICovCj4gwqDCoMKgwqDCoMKgwqDCoHU4wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHBt
X2NhcDvCoMKgwqDCoMKgwqDCoMKgwqAvKiBQTSBjYXBhYmlsaXR5IG9mZnNldCAqLwo+IC3CoMKg
wqDCoMKgwqDCoHVuc2lnbmVkIGludMKgwqDCoMKgaW1tX3JlYWR5OjE7wqDCoMKgwqAvKiBTdXBw
b3J0cyBJbW1lZGlhdGUgUmVhZGluZXNzICovCj4gwqDCoMKgwqDCoMKgwqDCoHVuc2lnbmVkIGlu
dMKgwqDCoMKgcG1lX3N1cHBvcnQ6NTvCoMKgLyogQml0bWFzayBvZiBzdGF0ZXMgZnJvbSB3aGlj
aCBQTUUjCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNhbiBiZSBnZW5lcmF0ZWQgKi8K
PiDCoMKgwqDCoMKgwqDCoMKgdW5zaWduZWQgaW50wqDCoMKgwqBwbWVfcG9sbDoxO8KgwqDCoMKg
wqAvKiBQb2xsIGRldmljZSdzIFBNRSBzdGF0dXMgYml0ICovCj4gK8KgwqDCoMKgwqDCoMKgdW5z
aWduZWQgaW50wqDCoMKgwqBlbmFibGVkOjE7wqDCoMKgwqDCoMKgLyogV2hldGhlciB0aGlzIGRl
diBpcyBlbmFibGVkICovCgpBaCBjcmFwLCBoZXJlIGl0IHN1cnZpdmVkIGZvciBzb21lIHJlYXNv
bi4uLgoKU2hvdWxkIGp1c3QgYmUgZGVhZCBjb2RlIGFuZCBub3QgaGF2ZSBhbnkgZWZmZWN0LiBJ
biBhbnkgY2FzZSwgd2UKc2hvdWxkIHJlbW92ZSBpdC4KCkBCam9ybjogRmVlbCBmcmVlIHRvIHJl
bW92ZSBpdCB5b3Vyc2VsZi4gT3RoZXJ3aXNlIEkgY291bGQgcHJvdmlkZSBhIHY5CnRvZ2V0aGVy
IHdpdGggcG90ZW50aWFsIGZ1cnRoZXIgZmVlZGJhY2sgdGFrZW4gaW50byBhY2NvdW50IGluIGEg
ZmV3CmRheXMKClRoeCwKUC4KCj4gK8KgwqDCoMKgwqDCoMKgdW5zaWduZWQgaW50wqDCoMKgwqBw
aW5uZWQ6MTvCoMKgwqDCoMKgwqDCoC8qIFdoZXRoZXIgdGhpcyBkZXYgaXMgcGlubmVkICovCj4g
K8KgwqDCoMKgwqDCoMKgdW5zaWduZWQgaW50wqDCoMKgwqBpbW1fcmVhZHk6MTvCoMKgwqDCoC8q
IFN1cHBvcnRzIEltbWVkaWF0ZSBSZWFkaW5lc3MgKi8KPiDCoMKgwqDCoMKgwqDCoMKgdW5zaWdu
ZWQgaW50wqDCoMKgwqBkMV9zdXBwb3J0OjE7wqDCoMKgLyogTG93IHBvd2VyIHN0YXRlIEQxIGlz
IHN1cHBvcnRlZCAqLwo+IMKgwqDCoMKgwqDCoMKgwqB1bnNpZ25lZCBpbnTCoMKgwqDCoGQyX3N1
cHBvcnQ6MTvCoMKgwqAvKiBMb3cgcG93ZXIgc3RhdGUgRDIgaXMgc3VwcG9ydGVkICovCj4gwqDC
oMKgwqDCoMKgwqDCoHVuc2lnbmVkIGludMKgwqDCoMKgbm9fZDFkMjoxO8KgwqDCoMKgwqDCoC8q
IEQxIGFuZCBEMiBhcmUgZm9yYmlkZGVuICovCgo=

