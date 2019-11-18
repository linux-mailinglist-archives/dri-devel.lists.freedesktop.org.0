Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA2E1007B9
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 15:56:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C1B6E52F;
	Mon, 18 Nov 2019 14:56:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE47F6E530
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 14:56:02 +0000 (UTC)
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-lIpJ-ca0MXSFXFbEVE_yVg-1; Mon, 18 Nov 2019 09:55:58 -0500
Received: by mail-qt1-f197.google.com with SMTP id 22so12394910qtw.10
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 06:55:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9XWpSHAGS/LkOq4pxWl24kYZw1xJNm2K16IYOEgWWcU=;
 b=n1HjtapMB1HojeJfZ8WvhzwPSAUjUqWNBHyytAO6TFH+pXxk+YYeFfSm4VYHvMZwlb
 312fOB6phO1BYxzyseVcUvt6DYtuF12RdSxRH1Q4/2CwZbi21Q8tYeqnMNBwm66TbFfT
 KT2BpTa990a+zf7maVGtQvVGVidUaicO/4wyedJwsbq4tvFUY27/xgntqSvFdUH9xCeb
 /FqlmzQTocM22HhNZ092l3AObclRT5QxIysk1PbcPLTJJPfpPFbMbS/oXqVhaZM0+AL0
 IEGVOQJ0hIparSk497Vw16l1z10Ocx7DtmjoAezXyXGO7AfNHt8FbQwR1smRwLQ8yA7r
 7pGQ==
X-Gm-Message-State: APjAAAUbiOChENjrQ0ITk012GlqYOq2c5kasb9vIoDG+eAIOn+izQTBO
 /JGnQ6oT5PL9gl204/YZkPrmcpUdgrjIyNdFhhE0RzFzytsmuc3krzqdSCjDjd/I/BPIvr3ulb3
 sQ/gY/F7rwvPfn0KdIXCq1Ou+++dp
X-Received: by 2002:aed:22b7:: with SMTP id p52mr27346899qtc.289.1574088957750; 
 Mon, 18 Nov 2019 06:55:57 -0800 (PST)
X-Google-Smtp-Source: APXvYqwQ2zLtsNPjhGQw+qC/tNWB8pkCVzPjy7p8sJe/UFhjlSYcxa7agBgFfSggwdfEjfuZQ4Zybw==
X-Received: by 2002:aed:22b7:: with SMTP id p52mr27346863qtc.289.1574088957498; 
 Mon, 18 Nov 2019 06:55:57 -0800 (PST)
Received: from [192.168.1.157] (pool-96-235-39-235.pitbpa.fios.verizon.net.
 [96.235.39.235])
 by smtp.gmail.com with ESMTPSA id a2sm8530549qkl.71.2019.11.18.06.55.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Nov 2019 06:55:56 -0800 (PST)
Subject: Re: [PATCH 04/15] staging/android/ion: delete dma_buf->kmap/unmap
 implemenation
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
 <20191118103536.17675-5-daniel.vetter@ffwll.ch>
From: Laura Abbott <labbott@redhat.com>
Message-ID: <02ba16cd-ec38-d503-ca8a-c848f433f6b8@redhat.com>
Date: Mon, 18 Nov 2019 09:55:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191118103536.17675-5-daniel.vetter@ffwll.ch>
Content-Language: en-US
X-MC-Unique: lIpJ-ca0MXSFXFbEVE_yVg-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574088961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Czfe8LxXhKNlOMEGZ0/2HSu9m2hQVtxcd/xFSnKoAZU=;
 b=VehsW3S2fbBX1HCtvSfjNzpM0FIPcQ1sSL6zS/gGkg6v4wSy7hWVVLVeTb90e3hSwe6w8w
 44ALHPeip+GYdkWRdc/1mEbUO6nfQrA1YwWhduY4m5WM9EplyXlHAnp8tnVD8zcxgOPTmn
 OMWHfQfijvl3pNKIk3XHQclpt05wsUQ=
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
Cc: devel@driverdev.osuosl.org, Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTEvMTgvMTkgNTozNSBBTSwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBUaGVyZSdzIG5vIGNh
bGxlcnMgaW4tdHJlZSBhbnltb3JlLgo+IAo+IEZvciBtZXJnaW5nIHByb2JhYmx5IGJlc3QgdG8g
c3R1ZmYgdGhpcyBpbnRvIGRybS1taXNjLCBzaW5jZSB0aGF0J3MKPiB3aGVyZSB0aGUgZG1hLWJ1
ZiBoZWFwcyB3aWxsIGxhbmQgdG9vLiBBbmQgdGhlIHJlc3VsdGluZyBjb25mbGljdAo+IGhvcGVm
dWxseSBlbnN1cmVzIHRoYXQgZG1hLWJ1ZiBoZWFwcyB3b250IGhhdmUgYSBuZXcgLT5rbWFwL3Vu
bWFwCj4gaW1wbGVtZW5hdGlvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxk
YW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiBDYzogTGF1cmEgQWJib3R0IDxsYWJib3R0QHJlZGhh
dC5jb20+Cj4gQ2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+Cj4gQ2M6
IGRldmVsQGRyaXZlcmRldi5vc3Vvc2wub3JnCj4gQ2M6IGxpbmFyby1tbS1zaWdAbGlzdHMubGlu
YXJvLm9yZwo+IC0tLQo+ICAgZHJpdmVycy9zdGFnaW5nL2FuZHJvaWQvaW9uL2lvbi5jIHwgMTQg
LS0tLS0tLS0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxNCBkZWxldGlvbnMoLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2FuZHJvaWQvaW9uL2lvbi5jIGIvZHJpdmVycy9z
dGFnaW5nL2FuZHJvaWQvaW9uL2lvbi5jCj4gaW5kZXggZTZiMWNhMTQxYjkzLi5iYjRlZGVkYzEx
NTAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9zdGFnaW5nL2FuZHJvaWQvaW9uL2lvbi5jCj4gKysr
IGIvZHJpdmVycy9zdGFnaW5nL2FuZHJvaWQvaW9uL2lvbi5jCj4gQEAgLTI3NCwxOCArMjc0LDYg
QEAgc3RhdGljIHZvaWQgaW9uX2RtYV9idWZfcmVsZWFzZShzdHJ1Y3QgZG1hX2J1ZiAqZG1hYnVm
KQo+ICAgCV9pb25fYnVmZmVyX2Rlc3Ryb3koYnVmZmVyKTsKPiAgIH0KPiAgIAo+IC1zdGF0aWMg
dm9pZCAqaW9uX2RtYV9idWZfa21hcChzdHJ1Y3QgZG1hX2J1ZiAqZG1hYnVmLCB1bnNpZ25lZCBs
b25nIG9mZnNldCkKPiAtewo+IC0Jc3RydWN0IGlvbl9idWZmZXIgKmJ1ZmZlciA9IGRtYWJ1Zi0+
cHJpdjsKPiAtCj4gLQlyZXR1cm4gYnVmZmVyLT52YWRkciArIG9mZnNldCAqIFBBR0VfU0laRTsK
PiAtfQo+IC0KPiAtc3RhdGljIHZvaWQgaW9uX2RtYV9idWZfa3VubWFwKHN0cnVjdCBkbWFfYnVm
ICpkbWFidWYsIHVuc2lnbmVkIGxvbmcgb2Zmc2V0LAo+IC0JCQkgICAgICAgdm9pZCAqcHRyKQo+
IC17Cj4gLX0KPiAtCj4gICBzdGF0aWMgaW50IGlvbl9kbWFfYnVmX2JlZ2luX2NwdV9hY2Nlc3Mo
c3RydWN0IGRtYV9idWYgKmRtYWJ1ZiwKPiAgIAkJCQkJZW51bSBkbWFfZGF0YV9kaXJlY3Rpb24g
ZGlyZWN0aW9uKQo+ICAgewo+IEBAIC0zNDksOCArMzM3LDYgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBkbWFfYnVmX29wcyBkbWFfYnVmX29wcyA9IHsKPiAgIAkuZGV0YWNoID0gaW9uX2RtYV9idWZf
ZGV0YXRjaCwKPiAgIAkuYmVnaW5fY3B1X2FjY2VzcyA9IGlvbl9kbWFfYnVmX2JlZ2luX2NwdV9h
Y2Nlc3MsCj4gICAJLmVuZF9jcHVfYWNjZXNzID0gaW9uX2RtYV9idWZfZW5kX2NwdV9hY2Nlc3Ms
Cj4gLQkubWFwID0gaW9uX2RtYV9idWZfa21hcCwKPiAtCS51bm1hcCA9IGlvbl9kbWFfYnVmX2t1
bm1hcCwKPiAgIH07Cj4gICAKPiAgIHN0YXRpYyBpbnQgaW9uX2FsbG9jKHNpemVfdCBsZW4sIHVu
c2lnbmVkIGludCBoZWFwX2lkX21hc2ssIHVuc2lnbmVkIGludCBmbGFncykKPiAKCkFja2VkLWJ5
OiBMYXVyYSBBYmJvdHQgPGxhYmJvdHRAcmVkaGF0LmNvbT4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
