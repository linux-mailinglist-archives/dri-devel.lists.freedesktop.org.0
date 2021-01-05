Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A41322EB227
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 19:12:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C91C6E071;
	Tue,  5 Jan 2021 18:12:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F0DA6E071
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 18:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609870357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3k5CIkKpGEjOG2rvxTC1E8muH9J84IbnUV5ZywKDqW4=;
 b=jAYzcuwoMreEXMGRGyiCMSuZNO24iO6+aGoI1ghwQIo8qgKfY2c62TuFQs4GdvrrJ1jXk7
 /tKlagHi2BM7xIdcNJ8TqIGDCRoyNjv/K6eKHODSH19jU4sZUmf/JhHacVopdwZez3Zo3C
 ZsN/jFPSspjTDR7nNUz1FTofe82mqUM=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-AXOvZTQrMWCdSPW0kt5ZaA-1; Tue, 05 Jan 2021 13:12:33 -0500
X-MC-Unique: AXOvZTQrMWCdSPW0kt5ZaA-1
Received: by mail-qv1-f70.google.com with SMTP id eb4so319699qvb.21
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Jan 2021 10:12:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=3k5CIkKpGEjOG2rvxTC1E8muH9J84IbnUV5ZywKDqW4=;
 b=FLrXq6Jijlx0Xb1p9ZVRa1l2Z5HB9QtGlIPp2xQEa4aDqjLrRZ+ICbZgTnBpBRIS9V
 B9SZ3RQ2MBgLOGRSnVNGamBn32n8Yg35TBMLhe6c1/J0XipzHURZVcQdyAommc+K2u+W
 OCvnDgHqCoZdnrAc7PYInPKWuMLPkA5kn9nJGirpq5Zli1Sbd0fjMO+MlNN+KgUBI35d
 s7rKcyihmgSTr0AjX0+fhhgM8arMP0edYc+PMD8HkQ8FDSbANR68O36vbj8XR+xh1RJ6
 +BbaRZBV2rSMgiC7fKhhHlJEF8yqncFFtZ0HGfI7GIYvxBeB7K5jGYaJ2dPbQhfrX8jp
 zUmw==
X-Gm-Message-State: AOAM530di3hsBBOR2Uu6jiAADQdhejTBAGYBDCeylQqQdvHRDfoxM8Cn
 f3hrGQVe+pnlhfAglsXFbeTfyGLgxD5Qbvlh0uRoBta/xsg8gptXODGNxOzsW+NzhxvMXRsi44b
 +Pfsp40IdDuFYrnQvnbAzVGYBTVWo
X-Received: by 2002:a05:6214:14ee:: with SMTP id
 k14mr594352qvw.36.1609870351563; 
 Tue, 05 Jan 2021 10:12:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwI5ex3N8MhmN5MWphSWTG3s2i/UP9nnDtkMjwVV0oG1tpjS0e7+NPUZuDPwgfR7mYDFWVUuA==
X-Received: by 2002:a05:6214:14ee:: with SMTP id
 k14mr594334qvw.36.1609870351268; 
 Tue, 05 Jan 2021 10:12:31 -0800 (PST)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id q3sm470774qkb.73.2021.01.05.10.12.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 10:12:30 -0800 (PST)
Message-ID: <938ae9d3a7ba4eadd36697a5d71d17508755a7c2.camel@redhat.com>
Subject: Re: [PATCH] drm/ttm: Remove pinned bos from LRU in
 ttm_bo_move_to_lru_tail() v2
From: Lyude Paul <lyude@redhat.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 dri-devel@lists.freedesktop.org
Date: Tue, 05 Jan 2021 13:12:29 -0500
In-Reply-To: <20210105114505.38210-1-christian.koenig@amd.com>
References: <20210105114505.38210-1-christian.koenig@amd.com>
Organization: Red Hat
User-Agent: Evolution 3.38.2 (3.38.2-1.fc33)
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CgpHdWVzc2luZyBpdCdz
IGZpbmUgaWYgSSBwdXNoIHRoaXMgd2l0aCB5b3VyIHNvYiBhbmQgcmV2aWV3IGFkZGVkPwoKT24g
VHVlLCAyMDIxLTAxLTA1IGF0IDEyOjQ1ICswMTAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+
IEZyb206IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+Cj4gCj4gUmVjZW50bHkgYSByZWdy
ZXNzaW9uIHdhcyBpbnRyb2R1Y2VkIHdoaWNoIGNhdXNlZCBUVE0ncyBidWZmZXIgZXZpY3Rpb24g
dG8KPiBhdHRlbXB0IHRvIGV2aWN0IGFscmVhZHktcGlubmVkIEJPcywgY2F1c2luZyBpc3N1ZXMg
d2l0aCBidWZmZXIgZXZpY3Rpb24KPiB1bmRlciBtZW1vcnkgcHJlc3N1cmUgYWxvbmcgd2l0aCBz
dXNwZW5kL3Jlc3VtZToKPiAKPiDCoCBub3V2ZWF1IDAwMDA6MWY6MDAuMDogRFJNOiBldmljdGlu
ZyBidWZmZXJzLi4uCj4gwqAgbm91dmVhdSAwMDAwOjFmOjAwLjA6IERSTTogTW92aW5nIHBpbm5l
ZCBvYmplY3QgMDAwMDAwMDBjNDI4YzNmZiEKPiDCoCBub3V2ZWF1IDAwMDA6MWY6MDAuMDogZmlm
bzogZmF1bHQgMDAgW1JFQURdIGF0IDAwMDAwMDAwMDAyMDAwMDAgZW5naW5lIDA0Cj4gwqAgW0JB
UjFdIGNsaWVudCAwNyBbSFVCL0hPU1RfQ1BVXSByZWFzb24gMDIgW1BURV0gb24gY2hhbm5lbCAt
MSBbMDBmZmVhYTAwMAo+IMKgIHVua25vd25dCj4gwqAgbm91dmVhdSAwMDAwOjFmOjAwLjA6IGZp
Zm86IERST1BQRURfTU1VX0ZBVUxUIDAwMDAxMDAwCj4gwqAgbm91dmVhdSAwMDAwOjFmOjAwLjA6
IGZpZm86IGZhdWx0IDAxIFtXUklURV0gYXQgMDAwMDAwMDAwMDAyMDAwMCBlbmdpbmUKPiDCoCAw
YyBbSE9TVDZdIGNsaWVudCAwNyBbSFVCL0hPU1RfQ1BVXSByZWFzb24gMDIgW1BURV0gb24gY2hh
bm5lbCAxCj4gwqAgWzAwZmZiMjgwMDAgRFJNXQo+IMKgIG5vdXZlYXUgMDAwMDoxZjowMC4wOiBm
aWZvOiBjaGFubmVsIDE6IGtpbGxlZAo+IMKgIG5vdXZlYXUgMDAwMDoxZjowMC4wOiBmaWZvOiBy
dW5saXN0IDA6IHNjaGVkdWxlZCBmb3IgcmVjb3ZlcnkKPiDCoCBbVFRNXSBCdWZmZXIgZXZpY3Rp
b24gZmFpbGVkCj4gwqAgbm91dmVhdSAwMDAwOjFmOjAwLjA6IERSTTogd2FpdGluZyBmb3Iga2Vy
bmVsIGNoYW5uZWxzIHRvIGdvIGlkbGUuLi4KPiDCoCBub3V2ZWF1IDAwMDA6MWY6MDAuMDogRFJN
OiBmYWlsZWQgdG8gaWRsZSBjaGFubmVsIDEgW0RSTV0KPiDCoCBub3V2ZWF1IDAwMDA6MWY6MDAu
MDogRFJNOiByZXN1bWluZyBkaXNwbGF5Li4uCj4gCj4gQWZ0ZXIgc29tZSBiaXNlY3Rpb24gYW5k
IGludmVzdGlnYXRpb24sIGl0IGFwcGVhcnMgdGhpcyByZXN1bHRlZCBmcm9tIHRoZQo+IHJlY2Vu
dCBjaGFuZ2VzIHRvIHR0bV9ib19tb3ZlX3RvX2xydV90YWlsKCkuIFByZXZpb3VzbHkgd2hlbiBh
IGJ1ZmZlciB3YXMKPiBwaW5uZWQsIHRoZSBidWZmZXIgd291bGQgYmUgcmVtb3ZlZCBmcm9tIHRo
ZSBMUlUgb25jZSB0dG1fYm9fdW5yZXNlcnZlCj4gdG8gbWFpbnRhaW4gdGhlIExSVSBsaXN0IHdo
ZW4gcGlubmluZyBvciB1bnBpbm5pbmcgQk9zLiBIb3dldmVyLCBzaW5jZToKPiAKPiBjb21taXQg
M2QxYTg4ZTEwNTFmICgiZHJtL3R0bTogY2xlYW51cCBMUlUgaGFuZGxpbmcgZnVydGhlciIpCj4g
Cj4gV2UndmUgYmVlbiBleGl0aW5nIGZyb20gdHRtX2JvX21vdmVfdG9fbHJ1X3RhaWwoKSBhdCB0
aGUgdmVyeSBiZWdpbm5pbmcgb2YKPiB0aGUgZnVuY3Rpb24gaWYgdGhlIGJvIHdlJ3JlIGxvb2tp
bmcgYXQgaXMgcGlubmVkLCByZXN1bHRpbmcgaW4gdGhlIHBpbm5lZAo+IEJPIG5ldmVyIGdldHRp
bmcgcmVtb3ZlZCBmcm9tIHRoZSBscnUgYW5kIGFzIGEgcmVzdWx0IC0gY2F1c2luZyBpc3N1ZXMg
d2hlbgo+IGl0IGV2ZW50dWFsbHkgYmVjb21lcyB0aW1lIGZvciBldmljdGlvbi4KPiAKPiBTbywg
bGV0J3MgZml4IHRoaXMgYnkgY2FsbGluZyB0dG1fYm9fZGVsX2Zyb21fbHJ1KCkgZnJvbQo+IHR0
bV9ib19tb3ZlX3RvX2xydV90YWlsKCkgaW4gdGhlIGV2ZW50IHRoYXQgd2UncmUgZGVhbGluZyB3
aXRoIGEgcGlubmVkCj4gYnVmZmVyLgo+IAo+IHYyIChjaGspOiByZWR1Y2UgdG8gb25seSB0aGUg
Zml4aW5nIG9uZSBsaW5lciBzaW5jZSB3ZSBhbHdheXMgd2FudCB0bwo+IGNhbGwgdGhlIGNhbGxi
YWNrIHdoZW5ldmVyIHdlIHdvdWxkIG1vdmUgb24gdGhlIExSVS4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgo+IEZpeGVzOiAzZDFhODhlMTA1MWYgKCJk
cm0vdHRtOiBjbGVhbnVwIExSVSBoYW5kbGluZyBmdXJ0aGVyIikKPiBDYzogQ2hyaXN0aWFuIEvD
tm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENjOiBEYXZlIEFpcmxpZSA8YWlybGll
ZEByZWRoYXQuY29tPgo+IC0tLQo+IMKgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyB8IDQg
KysrLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+
IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIGIvZHJpdmVycy9n
cHUvZHJtL3R0bS90dG1fYm8uYwo+IGluZGV4IDMxZThiM2RhNTU2My4uYjY1ZjRiMTJmOTg2IDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vdHRtL3R0bV9iby5jCj4gQEAgLTEzOCw4ICsxMzgsMTAgQEAgdm9pZCB0dG1fYm9f
bW92ZV90b19scnVfdGFpbChzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QKPiAqYm8sCj4gwqAKPiDC
oMKgwqDCoMKgwqDCoMKgZG1hX3Jlc3ZfYXNzZXJ0X2hlbGQoYm8tPmJhc2UucmVzdik7Cj4gwqAK
PiAtwqDCoMKgwqDCoMKgwqBpZiAoYm8tPnBpbl9jb3VudCkKPiArwqDCoMKgwqDCoMKgwqBpZiAo
Ym8tPnBpbl9jb3VudCkgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB0dG1fYm9f
ZGVsX2Zyb21fbHJ1KGJvKTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVy
bjsKPiArwqDCoMKgwqDCoMKgwqB9Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgbWFuID0gdHRtX21h
bmFnZXJfdHlwZShiZGV2LCBtZW0tPm1lbV90eXBlKTsKPiDCoMKgwqDCoMKgwqDCoMKgbGlzdF9t
b3ZlX3RhaWwoJmJvLT5scnUsICZtYW4tPmxydVtiby0+cHJpb3JpdHldKTsKCi0tIApDaGVlcnMs
CiBMeXVkZSBQYXVsIChzaGUvaGVyKQogU29mdHdhcmUgRW5naW5lZXIgYXQgUmVkIEhhdAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
