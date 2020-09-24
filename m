Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D81277B32
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 23:41:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECD166E49C;
	Thu, 24 Sep 2020 21:41:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE6596E49C
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 21:41:49 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600983708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pHEGyEcLx4wAmD4wOcYy6+1bBrCfu6/M5kZTaPojpLc=;
 b=I/AB1j0LIVIvtwDycuwEqhFK+iNVmK8RR3iOIdCMv3LBSCmbNgtzhUxFBiPyeI4PQ4BVmS
 IpOsA0wSYckfo2UaJpvezUcl3x/o9NZ8WGw5ea+5o7J1MyIMLurWQpcMsY/RiL5B5sWcxj
 2o+gTF0ufpb1K5D+W1crG0x6nvCWAuc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-s9rSCZ5bM424miOJHcrS5Q-1; Thu, 24 Sep 2020 17:41:44 -0400
X-MC-Unique: s9rSCZ5bM424miOJHcrS5Q-1
Received: by mail-wm1-f71.google.com with SMTP id r10so261147wmh.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 14:41:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=g/Xbd+gOY1D7k7S7s+pOd/hTecpIxif1KV3RUcYn5rQ=;
 b=CL2tguC7Se8EpWzPDcWlQJcrXMf+a9ZNvAQjg/sfVoq1U3ogGpzbsbMCcyv5zDDQGp
 kl106b6v/LMrTOsjMTZHI7oLGH99ieRyrqTgSNZk2NOT6ZSmg1PMNM2nhHB8IwXXcI8P
 Tayv4b47IGm2busu0AcGrlX1IAAT+tHw8mnL1qO1z08zBEPlJmtrVN0/n55M+TX7GT5H
 8hFniOQNaeZX2G/izg85zdOpP+3qG3VD+qODR2w0/WdfwtV2IA00Pcih/kemwyYAKyEB
 0vFFrVMNpwqhE4IxhCnbHOKqkKhqlXshL61Ah7dps9d2edisqK66NQJQcMwXXjcKF9+a
 fEpg==
X-Gm-Message-State: AOAM532vzg8hPtRmjdBFk0E+FT2AxElSBV+xom4QoX/WBByMjVTCvVSb
 1rVD2yZ7knDpFoFFR9PZ8NldFkD8x8bkiDCiGjO3OecE1zRs6dIfPrOJHDl3Ak8P7UhnzCkm7Pm
 95zMVNvjkRb9MAyC0ffleCC+eVn3D
X-Received: by 2002:adf:ff90:: with SMTP id j16mr1019726wrr.105.1600983703564; 
 Thu, 24 Sep 2020 14:41:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcmOcMLK9ieZTe6UE9SIsXG/tKkkWvHxZX+em+xkUyTPxjCgMj7blLOZyUvF+KwveIZvdq7w==
X-Received: by 2002:adf:ff90:: with SMTP id j16mr1019712wrr.105.1600983703320; 
 Thu, 24 Sep 2020 14:41:43 -0700 (PDT)
Received: from localhost.localdomain (p4ff23f51.dip0.t-ipconnect.de.
 [79.242.63.81])
 by smtp.gmail.com with ESMTPSA id e13sm490886wre.60.2020.09.24.14.41.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Sep 2020 14:41:42 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v4 11/23] device-dax: Kill dax_kmem_res
Date: Thu, 24 Sep 2020 23:41:41 +0200
Message-Id: <79BEC711-C769-432B-9A50-63C6A3AEB0E3@redhat.com>
References: <CAPcyv4iQ4VnXMU0+_7rfXwPowgcdoABSFUH4WO_3P9vHtWAzPg@mail.gmail.com>
In-Reply-To: <CAPcyv4iQ4VnXMU0+_7rfXwPowgcdoABSFUH4WO_3P9vHtWAzPg@mail.gmail.com>
To: Dan Williams <dan.j.williams@intel.com>
X-Mailer: iPhone Mail (18A373)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Pavel Tatashin <pasha.tatashin@soleen.com>,
 David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Vishal Verma <vishal.l.verma@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>, Joao Martins <joao.m.martins@oracle.com>,
 Linux ACPI <linux-acpi@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cgo+IEFtIDI0LjA5LjIwMjAgdW0gMjM6MjYgc2NocmllYiBEYW4gV2lsbGlhbXMgPGRhbi5qLndp
bGxpYW1zQGludGVsLmNvbT46Cj4gCj4g77u/Wy4uXQo+Pj4gSSdtIG5vdCBzdWdnZXN0aW5nIHRv
IGJ1c3kgdGhlIHdob2xlICJ2aXJ0aW8iIHJhbmdlLCBqdXN0IHRoZSBwb3J0aW9uCj4+PiB0aGF0
J3MgYWJvdXQgdG8gYmUgcGFzc2VkIHRvIGFkZF9tZW1vcnlfZHJpdmVyX21hbmFnZWQoKS4KPj4g
Cj4+IEknbSBhZnJhaWQgSSBkb24ndCBnZXQgeW91ciBwb2ludC4gRm9yIHZpcnRpby1tZW06Cj4+
IAo+PiBCZWZvcmU6Cj4+IAo+PiAxLiBDcmVhdGUgdmlydGlvMCBjb250YWluZXIgcmVzb3VyY2UK
Pj4gCj4+IDIuIChzb21ld2hlbiBpbiB0aGUgZnV0dXJlKSBhZGRfbWVtb3J5X2RyaXZlcl9tYW5h
Z2VkKCkKPj4gLSBDcmVhdGUgcmVzb3VyY2UgKFN5c3RlbSBSQU0gKHZpcnRpb19tZW0pKSwgbWFy
a2luZyBpdCBidXN5L2RyaXZlcgo+PiAgIG1hbmFnZWQKPj4gCj4+IEFmdGVyOgo+PiAKPj4gMS4g
Q3JlYXRlIHZpcnRpbzAgY29udGFpbmVyIHJlc291cmNlCj4+IAo+PiAyLiAoc29tZXdoZW4gaW4g
dGhlIGZ1dHVyZSkgQ3JlYXRlIHJlc291cmNlIChTeXN0ZW0gUkFNICh2aXJ0aW9fbWVtKSksCj4+
ICAgbWFya2luZyBpdCBidXN5L2RyaXZlciBtYW5hZ2VkCj4+IDMuIGFkZF9tZW1vcnlfZHJpdmVy
X21hbmFnZWQoKQo+PiAKPj4gTm90IGhlbHBmdWwgb3Igc2ltcGxlciBJTUhPLgo+IAo+IFRoZSBj
b25jZXJuIEknbSB0cnlpbmcgdG8gYWRkcmVzcyBpcyB0aGUgdGhlb3JldGljYWwgcmFjZSB3aW5k
b3cgYW5kCj4gbGF5ZXJpbmcgdmlvbGF0aW9uIGluIHRoaXMgc2VxdWVuY2UgaW4gdGhlIGttZW0g
ZHJpdmVyOgo+IAo+IDEvIHJlcyA9IHJlcXVlc3RfbWVtX3JlZ2lvbiguLi4pOwo+IDIvIHJlcy0+
ZmxhZ3MgPSBJT1JFU09VUkNFX01FTTsKPiAzLyBhZGRfbWVtb3J5X2RyaXZlcl9tYW5hZ2VkKCk7
Cj4gCj4gQmV0d2VlbiAyLyBhbmQgMy8gc29tZXRoaW5nIGNhbiByYWNlIGFuZCB0aGluayB0aGF0
IGl0IG93bnMgdGhlCj4gcmVnaW9uLiBEbyBJIHRoaW5rIGl0IHdpbGwgaGFwcGVuIGluIHByYWN0
aWNlLCBubywgYnV0IGl0J3Mgc3RpbGwgYQo+IHBhdHRlcm4gdGhhdCBkZXNlcnZlcyBjb21lIGNs
ZWFudXAuCgpJIHRoaW5rIGluIHRoYXQgdW5saWtlbHkgZXZlbnQgKHJhdGhlciBpbXBvc3NpYmxl
KSwgYWRkX21lbW9yeV9kcml2ZXJfbWFuYWdlZCgpIHNob3VsZCBmYWlsLCBkZXRlY3RpbmcgYSBj
b25mbGljdGluZyAoYnVzeSkgcmVzb3VyY2UuIE5vdCBzdXJlIHdoYXQgd2lsbCBoYXBwZW4gbmV4
dCAoIGFuZCBkaWQgbm90IGRvdWJsZS1jaGVjaykuCgpCdXQgeWVhaCwgdGhlIHdheSB0aGUgQlVT
WSBiaXQgaXMgY2xlYXJlZCBoZXJlIGlzIHdyb25nIC0gc2ltcGx5IG92ZXJ3cml0aW5nIG90aGVy
IGJpdHMuIEFuZCBpdCB3b3VsZCBiZSBldmVuIGJldHRlciBpZiB3ZSBjb3VsZCBhdm9pZCBtYW51
YWxseSBtZXNzaW5nIHdpdGggZmxhZ3MgaGVyZS4KPiAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
