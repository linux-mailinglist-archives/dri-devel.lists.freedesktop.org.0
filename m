Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFA66E32F
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 11:13:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07AE36E5D2;
	Fri, 19 Jul 2019 09:13:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CD486E5D3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 09:13:18 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id r12so33826403edo.5
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 02:13:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=Dy3eiftsHgEHO+bH2d+Vo7Yj2Uyc+Sk/TwZVrada+Bw=;
 b=VH22cX9kYeBoNxcTxuaHC5E5Uh8nllDzmk6zt4CCFw8bgHeK/AcHcXJKn/nwci+tsN
 cZr3t/xAxJ0UThdz/5kZPUywvbECz+3496T+Yo2O6a4Zm5bq00RwXJkfS/aWUOfnmqYX
 PjY4JKoxdJqUvsJ9aV+m+j1aHb9WN73xqEETxnapKOFzUQJgWAVOLnjjgH2CW7UQBiBI
 1P7jKcIJpbYRggnJF5R8JD4bBcovgPub+cx7JXNuIuUb+6qMP2wZDGGywJATy7QkIPs/
 3BpoPW/Q495mHpISXjM5A0liYimzJDRoVAnLxdKvZZ8MElztQS/HLg+bEIeTXUN0d0F2
 gXag==
X-Gm-Message-State: APjAAAURZC6jGMXKfVyK5M35VINbPJTvB0m+qbIsAw3D77nvH/tpsrC5
 fdsl/blsVRpu2e+KiKXJFWo=
X-Google-Smtp-Source: APXvYqz+3V8Aeo5Sma4Zyvs268t0Iez1pg+tIsq1r4Jm4RSqAPYUfQU3LmKxnxV+qOIMZvQ7pzoruw==
X-Received: by 2002:a50:e69a:: with SMTP id z26mr45147649edm.41.1563527597630; 
 Fri, 19 Jul 2019 02:13:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id f24sm8699434edf.30.2019.07.19.02.13.16
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 19 Jul 2019 02:13:16 -0700 (PDT)
Date: Fri, 19 Jul 2019 11:13:14 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v3 3/3] drm/vgem: use normal cached mmap'ings
Message-ID: <20190719091314.GH15868@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 Eric Anholt <eric@anholt.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 Emil Velikov <emil.velikov@collabora.com>,
 Eric Biggers <ebiggers@google.com>,
 Deepak Sharma <deepak.sharma@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20190716213746.4670-1-robdclark@gmail.com>
 <20190716213746.4670-3-robdclark@gmail.com>
 <87lfwxh7mo.fsf@anholt.net>
 <CAF6AEGsrJu8r+t35zWxbq8KXFSoyPSJ_3+MjTii00Pb=YOMxHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGsrJu8r+t35zWxbq8KXFSoyPSJ_3+MjTii00Pb=YOMxHQ@mail.gmail.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=Dy3eiftsHgEHO+bH2d+Vo7Yj2Uyc+Sk/TwZVrada+Bw=;
 b=NgzALEiEIP/wom8Q6GPOA1eTwCqfuDSwYRT4pTiN0svfxty8C46zOPR5oqWBl6sKYN
 c3tPHABjFwEJBusU078wzdryzWYwNGa6XkEBumqKeEoogixd5tOeF0yhtjpYLQ5f7P1Y
 F4yJCHJAwr+LS3OZyGjE2++8/S+TLAX14C0Wg=
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
Cc: Rob Clark <robdclark@chromium.org>, Deepak Sharma <deepak.sharma@amd.com>,
 Eric Biggers <ebiggers@google.com>, David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMTYsIDIwMTkgYXQgMDU6MTM6MTBQTSAtMDcwMCwgUm9iIENsYXJrIHdyb3Rl
Ogo+IE9uIFR1ZSwgSnVsIDE2LCAyMDE5IGF0IDQ6MzkgUE0gRXJpYyBBbmhvbHQgPGVyaWNAYW5o
b2x0Lm5ldD4gd3JvdGU6Cj4gPgo+ID4gUm9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPiB3
cml0ZXM6Cj4gPgo+ID4gPiBGcm9tOiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+
Cj4gPiA+Cj4gPiA+IFNpbmNlIHRoZXJlIGlzIG5vIHJlYWwgZGV2aWNlIGFzc29jaWF0ZWQgd2l0
aCBWR0VNLCBpdCBpcyBpbXBvc3NpYmxlIHRvCj4gPiA+IGVuZCB1cCB3aXRoIGFwcHJvcHJpYXRl
IGRldi0+ZG1hX29wcywgbWVhbmluZyB0aGF0IHdlIGhhdmUgbm8gd2F5IHRvCj4gPiA+IGludmFs
aWRhdGUgdGhlIHNobWVtIHBhZ2VzIGFsbG9jYXRlZCBieSBWR0VNLiAgU28sIGF0IGxlYXN0IG9u
IHBsYXRmb3Jtcwo+ID4gPiB3aXRob3V0IGRybV9jZmx1c2hfcGFnZXMoKSwgd2UgZW5kIHVwIHdp
dGggY29ycnVwdGlvbiB3aGVuIGNhY2hlIGxpbmVzCj4gPiA+IGZyb20gcHJldmlvdXMgdXNhZ2Ug
b2YgVkdFTSBibyBwYWdlcyBnZXQgZXZpY3RlZCB0byBtZW1vcnkuCj4gPiA+Cj4gPiA+IFRoZSBv
bmx5IHNhbmUgb3B0aW9uIGlzIHRvIHVzZSBjYWNoZWQgbWFwcGluZ3MuCj4gPgo+ID4gVGhpcyBt
YXkgYmUgYW4gaW1wcm92ZW1lbnQsIGJ1dC4uLgo+ID4KPiA+IHBpbi91bnBpbiBpcyBvbmx5IG9u
IGF0dGFjaGluZy9jbG9zaW5nIHRoZSBkbWEtYnVmLCByaWdodD8gIFNvLCBncmVhdCwKPiA+IHlv
dSBmbHVzaGVkIHRoZSBjYWNoZWQgbWFwIG9uY2UgYWZ0ZXIgZXhwb3J0aW5nIHRoZSB2Z2VtIGRt
YS1idWYgdG8gdGhlCj4gPiBhY3R1YWwgR1BVIGRldmljZSwgYnV0IGZyb20gdGhlbiBvbiB5b3Ug
c3RpbGwgaGF2ZSBubyBpbnRlcmZhY2UgZm9yCj4gPiBnZXR0aW5nIGNvaGVyZW50IGFjY2VzcyB0
aHJvdWdoIFZHRU0ncyBtYXBwaW5nIGFnYWluLCB3aGljaCBzdGlsbAo+ID4gZXhpc3RzLgo+IAo+
IEluICp0aGVvcnkqIG9uZSB3b3VsZCBkZXRhY2ggYmVmb3JlIGRvaW5nIGZ1cnRoZXIgQ1BVIGFj
Y2VzcyB0bwo+IGJ1ZmZlciwgYW5kIHRoZW4gcmUtYXR0YWNoIHdoZW4gcGFzc2luZyBiYWNrIHRv
IEdQVS4KPiAKPiBPZmMgdGhhdCBpc24ndCBob3cgYWN0dWFsIGRyaXZlcnMgZG8gdGhpbmdzLiAg
QnV0IG1heWJlIGl0IGlzIGVub3VnaAo+IGZvciB2Z2VtIHRvIHNlcnZlIGl0J3MgcHVycG9zZSAo
aWUuIHRlc3QgY29kZSkuCj4gCj4gPiBJIGZlZWwgbGlrZSB0aGlzIGlzIHBhcGVyaW5nIG92ZXIg
c29tZXRoaW5nIHRoYXQncyByZWFsbHkganVzdCBicm9rZW4sCj4gPiBhbmQgd2Ugc2hvdWxkIHN0
b3AgcHJvdmlkaW5nIFZHRU0ganVzdCBiZWNhdXNlIHNvbWVvbmUgd2FudHMgdG8gd3JpdGUKPiA+
IGRtYS1idWYgdGVzdCBjb2RlIHdpdGhvdXQgZHJpdmVyLXNwZWNpZmljIEJPIGFsbG9jIGlvY3Rs
IGNvZGUuCj4gCj4geXVwLCBpdCBpcyB2Z2VtIHRoYXQgaXMgZnVuZGFtZW50YWxseSBicm9rZW4g
KG9yIG1heWJlIG1vcmUKPiBzcGVjaWZpY2FsbHkgZG9lc24ndCBmaXQgaW4gdy8gZG1hLW1hcHBp
bmdzIHZpZXcgb2YgaG93IHRvIGRvIGNhY2hlCj4gbWFpbnQpLCBhbmQgSSdtIGp1c3QgcGFwZXJp
bmcgb3ZlciBpdCBiZWNhdXNlIHBlb3BsZSBhbmQgQ0kgc3lzdGVtcwo+IHdhbnQgdG8gYmUgYWJs
ZSB0byB1c2UgaXQgdG8gZG8gc29tZSBkbWEtYnVmIHRlc3RzIDstKQo+IAo+IEknbSBraW5kYSB3
b25kZXJpbmcsIGF0IGxlYXN0IGZvciBhcm0vZHQgYmFzZWQgc3lzdGVtcywgaWYgdGhlcmUgaXMg
YQo+IHdheSAob3RoZXIgdGhhbiBpbiBlYXJseSBib290KSB0aGF0IHdlIGNhbiBpbmplY3QgYSB2
Z2VtIGRldmljZSBub2RlCj4gaW50byB0aGUgZHRiLiAgVGhhdCBpc24ndCBhIHRoaW5nIGRyaXZl
cnMgc2hvdWxkIG5vcm1hbGx5IGRvLCBidXQgKGlmCj4gcG9zc2libGUpIHNpbmNlIHZnZW0gaXMg
cmVhbGx5IGp1c3QgdGVzdCBpbmZyYXN0cnVjdHVyZSwgaXQgY291bGQgYmUgYQo+IHdheSB0byBt
YWtlIGRtYS1tYXBwaW5nIGhhcHBpbHkgdGhpbmsgdmdlbSBpcyBhIHJlYWwgZGV2aWNlLgoKT3Ig
d2UganVzdCBleHRlbmQgZHJtX2NmbHVzaF9wYWdlcyB3aXRoIHRoZSBjZmx1c2hpbmcgd2UgbmVl
ZCAoYXQgbGVhc3QKZm9yIHRob3NlIGFybXMgd2hlcmUgdGhpcyBpcyBwb3NzaWJsZSwgbGV0J3Mg
aWdub3JlIHRoZSBvdGhlcnMpIGFuZCBhY2NlcHQKZm9yIGEgZmV3IG1vcmUgeWVhcnMgdGhhdCBk
bWEtYXBpIGRvZXNuJ3QgZml0PwoKTm90ZSB0aGlzIHdvdWxkIG5lZWQgdG8gYmUgYSBmdWxsIGNv
cHlwYXN0YSBvZiB3aGF0IHRoZSBhcmNoIGNvZGUgaGFzCihzaW5jZSBqdXN0IGV4cG9ydGluZyB0
aGUgZnVuY3Rpb24gd2FzIHNob3QgZG93biBiZWZvcmUpLCBidXQgSSByZWFsbHkKZG9uJ3QgY2Fy
ZSBhYm91dCB0aGUgcmVzdWx0aW5nIHdhaWxpbmcgaWYgd2UgZG8gdGhpcy4KLURhbmllbAotLSAK
RGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDov
L2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
