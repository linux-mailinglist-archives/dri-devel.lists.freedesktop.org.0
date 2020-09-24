Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9045B277C3E
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 01:14:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 903856E4B7;
	Thu, 24 Sep 2020 23:14:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEEB66E4B7
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 23:14:46 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id ay8so580977edb.8
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 16:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hSkSLRq5MVH71tUXWoLzt4YV/mJNHNBrX1N6KOeePN4=;
 b=UfIq0JI4TQNfqrqpYJStAhzDhNUa11TX6+X7izcGrmn20kV0hx7KRTsw/oyyfroFdA
 fNBfmj5dmCmy3K3Euvmr2+zixd/mpqTJbdz5Dki98RdWVmCE5m4IDV+019kPXCONrYl/
 ZPpnwKjygPOzQWJtUHwh/8taOQNqsHXF7RLsVdAsTeeZuKlE+c4bHbjIEm9uWXmfyEbO
 +izsd4ty5FbUzGHWXNcBVMGJ4JJvMQvSR/4qYa0KEorZ/hAs6MTtVUgFGI0kedTu0LnW
 MGtIXhkdTlw7kwKkggLa7vXSqZZUksp5BZ02aP4soBDdENWaymJz+YxTO6J7+VZzpUc/
 UL7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hSkSLRq5MVH71tUXWoLzt4YV/mJNHNBrX1N6KOeePN4=;
 b=QCsmpmLSUjmkIhyFR7vygB95VpaANqsBOtl9Itpm1b6I/DTEfjCXjwnZX0R17JptbA
 RO3kOaevLPtn0o6XIWBLMUCSF9KiHjZflZ0Pev1C59fK3ZdNKVl09NjKHUNPpWlxRFd+
 2Ec6DFKMBEMKttXdDfGT7EUmy7RZZleR7AZdOwzjsUU5Nx1fruQ5Csg5WgJZGQcWaUqY
 ww2xYXg1CzD43YsPeYTigG0befkVjnv+ikmuzW/BaANaBjdHH0Ax6pjX7ng4sy5Bcy1h
 YZsR3Bsa71JLseMZxeoIf0nfPIdIqHRI/exEtsXz0Ib/xBd49SiW6Ca0+EKL/1CPwNBQ
 Gczg==
X-Gm-Message-State: AOAM530dWcO0w2nHgL9mA/BJkonaYcYE7awB4lnMBe1xMWrtgYNaGtHo
 4lVxv/suoZHu/svdMYD/8aIqNG8On77f4zbgAzg=
X-Google-Smtp-Source: ABdhPJybBrOa2fiJ5YunqYBhMU1JMlbPhF9vq5+Yp7xNZ2HbgSsvROFL3W6RtKDxt6XBRnpKiEYIzB8+JgzDHaaLbLw=
X-Received: by 2002:a50:d987:: with SMTP id w7mr1118640edj.113.1600989285367; 
 Thu, 24 Sep 2020 16:14:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200924051845.397177-1-airlied@gmail.com>
 <20200924051845.397177-38-airlied@gmail.com>
 <39ca897a-e7f2-93c8-e844-449ccbfe6041@amd.com>
In-Reply-To: <39ca897a-e7f2-93c8-e844-449ccbfe6041@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 25 Sep 2020 09:14:34 +1000
Message-ID: <CAPM=9tw6a6E+KZV7LceHUj=SHFaTe9M+KjjYgouhdX0gkDsuzw@mail.gmail.com>
Subject: Re: [PATCH 37/45] drm/ttm: add a helper to allocate a temp tt for
 copies.
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Ben Skeggs <bskeggs@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyNCBTZXAgMjAyMCBhdCAyMjo0MiwgQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFu
LmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPgo+IEFtIDI0LjA5LjIwIHVtIDA3OjE4IHNjaHJpZWIg
RGF2ZSBBaXJsaWU6Cj4gPiBGcm9tOiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+
ID4KPiA+IEFsbCB0aGUgYWNjZWwgbW92ZXMgZG8gdGhlIHNhbWUgcGF0dGVybiBoZXJlLCBwcm92
aWRlIGEgaGVscGVyCj4KPiBBbmQgZXhhY3RseSB0aGF0IHBhdHRlcm4gSSB3YW50IHRvIGdldCBh
d2F5IGZyb20uCgpDdXJyZW50bHkgdGhpcyBpcyBqdXN0IHJlZmFjdG9yaW5nIG91dCB0aGUgaGVs
cGVyIGNvZGUgaW4gZWFjaCBkcml2ZXIsIGJ1dCBJIHNlZQpzaW5jZSBpdCBjYWxscyBib19tZW1f
c3BhY2Ugd2UgYXJlIHByb2JhYmx5IG1vdmluZyBhIGJpdCBpbiB0aGUgd3JvbmcgZGlyZWN0aW9u
LgoKPiBTZWUgd2hhdCBoYXBwZW5zIGlmIHdlIChmb3IgZXhhbXBsZSkgaGF2ZSBhIFZSQU0gLT4g
U1lTVEVNIG1vdmUgaXMgdGhlCj4gZm9sbG93aW5nOgo+Cj4gMS4gVFRNIGFsbG9jYXRlcyBhIG5l
dyB0dG1fcmVzb3VyY2Ugb2JqZWN0IGluIHRoZSBTWVNURU0gZG9tYWluLgo+IDIuIFdlIGNhbGwg
dGhlIGRyaXZlciB0byBtb3ZlIGZyb20gVlJBTSB0byBTWVNURU0uCj4gMy4gRHJpdmVyIGZpbmRz
IHRoYXQgaXQgY2FuJ3QgZG8gdGhpcyBhbmQgY2FsbHMgVFRNICB0byBhbGxvY2F0ZSBHVFQuCj4g
NC4gU2luY2Ugd2UgYXJlIG1heWJlIG91dCBvZiBHVFQgVFRNIGV2aWN0cyBhIGRpZmZlcmVudCBC
TyBmcm9tIEdUVCB0bwo+IFNZU1RFTSBhbmQgY2FsbCBkcml2ZXIgYWdhaW4uCj4KPiBUaGlzIGlz
IGEgaG9ycmlibGUgcGluZy9wb25nIGJldHdlZW4gZHJpdmVyL1RUTS9kcml2ZXIvVFRNL2RyaXZl
ciBhbmQgd2UKPiBzaG91bGQgc3RvcCB0aGF0IGltbWVkaWF0ZWx5Lgo+Cj4gTXkgc3VnZ2VzdGlv
biBpcyB0aGF0IHdlIHJld3JpdGUgaG93IGRyaXZlcnMgY2FsbCB0aGUgdHRtX2JvX3ZhbGlkYXRl
KCkKPiBmdW5jdGlvbiBzbyB0aGF0IHdlIGNhbiBndWFyYW50ZWUgdGhhdCB0aGlzIG5ldmVyIGhh
cHBlbnMuCj4KPiBXaGF0IGRvIHlvdSB0aGluaz8KCkkgdGhpbmsgdGhhdCBpcyBsaWtlbHkgdGhl
IG5leHQgc3RlcCBJJ2QgbGlrZSB0byB0YWtlIGFmdGVyIHRoaXMKcmVmYWN0b3IsIGl0J3MgYSBs
b3QgYmlnZ2VyLCBhbmQgSSdtIG5vdCBzdXJlIGhvdyBpdCB3aWxsIGxvb2sgeWV0LgoKRG8gd2Ug
ZW52aXNpb24gdGhlIGRyaXZlciBjYWxsaW5nIHZhbGlkYXRlIGluIGEgbG9vcCBidXQgd2hlbiBp
dCBjYW4ndApmaW5kIHNwYWNlIGl0IHRlbGxzIHRoZSBkcml2ZXIgYW5kIHRoZSBkcml2ZXIgZG9l
cyBldmljdGlvbiBhbmQKcmVjYWxscyB2YWxpZGF0ZT8KCkRhdmUuCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
