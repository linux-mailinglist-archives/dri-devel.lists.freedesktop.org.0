Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFBE82671
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 22:55:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA2516E14B;
	Mon,  5 Aug 2019 20:55:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE06D6E14B
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 20:55:13 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7DA4A2173B
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 20:55:13 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id d15so61197889qkl.4
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 13:55:13 -0700 (PDT)
X-Gm-Message-State: APjAAAUWj+frIsA9KflhQ5INztqUTfXtI1m59hWp9OCiJ7Q7n/YDQ8Eg
 SZv8FgZPxc3Itf7OIKJkd+PqCaZ3+HIzh6zQbQ==
X-Google-Smtp-Source: APXvYqztUnE5/BFesJKQ3YdVmPrJJvCMqr29JZVUXjQzTD/1rU38ofLAp2HpRfX4MbpWflIgtfwsvthOCynY92uH6wY=
X-Received: by 2002:a05:620a:1447:: with SMTP id
 i7mr249257qkl.254.1565038512642; 
 Mon, 05 Aug 2019 13:55:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190805143358.21245-1-robh@kernel.org>
 <20190805143358.21245-2-robh@kernel.org>
 <20190805155209.GA5909@kevin>
In-Reply-To: <20190805155209.GA5909@kevin>
From: Rob Herring <robh@kernel.org>
Date: Mon, 5 Aug 2019 14:55:00 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL17x6nr9BzXGXeNimG5OwySsYCtBd6UtLEtATWR1jt4A@mail.gmail.com>
Message-ID: <CAL_JsqL17x6nr9BzXGXeNimG5OwySsYCtBd6UtLEtATWR1jt4A@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panfrost: Add madvise and shrinker support
To: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565038513;
 bh=XIaE0KT+Qm7n31wODCqRJU68MLVLIdD28MlM/Dmx2m8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=gntXa6g+P31R/p9GmWkonDY9BPSJysKTbIz8nW0sZ3l8sqwJVYumbg3OH+0C0BSQZ
 ldCXCxttbE6QX22hfzUN1cSGygkkizZsyC+DJkxdCUJLcc7Xyl+fs3MsEg+JgHI5Nd
 FfI3VXzyga//6bWe+48+lyvCeH5M+6kl/j4LURvk=
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgNSwgMjAxOSBhdCA5OjUyIEFNIEFseXNzYSBSb3Nlbnp3ZWlnCjxhbHlzc2Eu
cm9zZW56d2VpZ0Bjb2xsYWJvcmEuY29tPiB3cm90ZToKPgo+ID4gKy8qIG1hZHZpc2UgcHJvdmlk
ZXMgYSB3YXkgdG8gdGVsbCB0aGUga2VybmVsIGluIGNhc2UgYSBidWZmZXJzIGNvbnRlbnRzCj4g
PiArICogY2FuIGJlIGRpc2NhcmRlZCB1bmRlciBtZW1vcnkgcHJlc3N1cmUsIHdoaWNoIGlzIHVz
ZWZ1bCBmb3IgdXNlcnNwYWNlCj4gPiArICogYm8gY2FjaGUgd2hlcmUgd2Ugd2FudCB0byBvcHRp
bWlzdGljYWxseSBob2xkIG9uIHRvIGJ1ZmZlciBhbGxvY2F0ZQo+ID4gKyAqIGFuZCBwb3RlbnRp
YWwgbW1hcCwgYnV0IGFsbG93IHRoZSBwYWdlcyB0byBiZSBkaXNjYXJkZWQgdW5kZXIgbWVtb3J5
Cj4gPiArICogcHJlc3N1cmUuCj4gPiArICoKPiA+ICsgKiBUeXBpY2FsIHVzYWdlIHdvdWxkIGlu
dm9sdmUgbWFkdmlzZShET05UTkVFRCkgd2hlbiBidWZmZXIgZW50ZXJzIEJPCj4gPiArICogY2Fj
aGUsIGFuZCBtYWR2aXNlKFdJTExORUVEKSBpZiB0cnlpbmcgdG8gcmVjeWNsZSBidWZmZXIgZnJv
bSBCTyBjYWNoZS4KPiA+ICsgKiBJbiB0aGUgV0lMTE5FRUQgY2FzZSwgJ3JldGFpbmVkJyBpbmRp
Y2F0ZXMgdG8gdXNlcnNwYWNlIHdoZXRoZXIgdGhlCj4gPiArICogYmFja2luZyBwYWdlcyBzdGls
bCBleGlzdC4KPiA+ICsgKi8KPiA+ICsjZGVmaW5lIFBBTkZST1NUX01BRFZfV0lMTE5FRUQgMCAg
ICAgLyogYmFja2luZyBwYWdlcyBhcmUgbmVlZGVkLCBzdGF0dXMgcmV0dXJuZWQgaW4gJ3JldGFp
bmVkJyAqLwo+ID4gKyNkZWZpbmUgUEFORlJPU1RfTUFEVl9ET05UTkVFRCAxICAgICAvKiBiYWNr
aW5nIHBhZ2VzIG5vdCBuZWVkZWQgKi8KPiA+ICsKPiA+ICtzdHJ1Y3QgZHJtX3BhbmZyb3N0X21h
ZHZpc2Ugewo+ID4gKyAgICAgX191MzIgaGFuZGxlOyAgICAgICAgIC8qIGluLCBHRU0gaGFuZGxl
ICovCj4gPiArICAgICBfX3UzMiBtYWR2OyAgICAgICAgICAgLyogaW4sIFBBTkZST1NUX01BRFZf
eCAqLwo+ID4gKyAgICAgX191MzIgcmV0YWluZWQ7ICAgICAgIC8qIG91dCwgd2hldGhlciBiYWNr
aW5nIHN0b3JlIHN0aWxsIGV4aXN0cyAqLwo+ID4gK307Cj4KPiBKdXN0IHRvIGNsYXJpZnkgYWJv
dXQgdGhlIGByZXRhaW5lZGAgZmxhZzogaWYgdXNlcnNwYWNlIGRvZXMgYQo+IG1hZHZpc2UoV0lM
TE5FRUQpIGFuZCB3ZSBmaW5kIG91dCB0aGF0IHJldGFpbmVkPTAsIHdoYXQncyBzdXBwb3NlZCB0
bwo+IGhhcHBlbj8KPgo+IFNob3VsZCB1c2Vyc3BhY2UgZXZpY3QgdGhlIEJPIGZyb20gaXRzIGxv
Y2FsIGNhY2hlIGFuZCBhbGxvY2F0ZSBvbmUKPiBmcmVzaD8KClllcy4gSnVzdCBsaWtlIG1zbS9m
cmVlZHJlbm8uCgo+IE9yIGp1c3QgcmVtbWFwPyBPciBzb21ldGhpbmcgZWxzZT8KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
