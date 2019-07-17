Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BED6B2B3
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 02:13:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 964196E1C4;
	Wed, 17 Jul 2019 00:13:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFECA6E1C4;
 Wed, 17 Jul 2019 00:13:22 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id k8so22642959eds.7;
 Tue, 16 Jul 2019 17:13:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D/eYjZgozPvgUajffWeA6V7Zmj+rx5wYX1ns8tvrFbI=;
 b=Y3Wtqy//v0JiUzPfGQdhPw2jbO7FZ/PuVluY4ZmboacUVuB6Y8gfV0Q0wC5xwWNquS
 F33ZbmqT6ibKk7ESXoq3EvjGbfFJIsl3zLN7NJ+iCvCo4whA8ZLNxW30FUejV791iW1S
 G2BvdSrG/JqpkavVqdhQ3TtbRtIWES8d1m6ZNEun3cZ2Zn3qykMfbgGGKwSErLZZ1Twp
 iQ7RrwVmsoXiCG9mmrunonrHTsygRKqei2pdURyQ3yKZYBmJmOoT1HHTP8Gh5dIvBOBV
 V4UPYGqHVUzAOwF+AK1Ow8pH3HGTNjTT9tyXOVmeIDIbWugmMHYmiCpVVoVX2whZI/rj
 Ypkw==
X-Gm-Message-State: APjAAAUsT7VtLL3B2bqkVtuFF3coosOBs4CxJfGB8O1u/o9eCwn63FSa
 6ypwBqivU5hQdkPFmPlg14vuA1ZDDJuiR3rV4K8=
X-Google-Smtp-Source: APXvYqyHiCjJpxSGuBP6Fd33Qm/rC+RvBui769ELlk9BhgppASdcNbXIsf9BRgWPqBi8iO1wrRc2+n1oZ0BSQTOT0ls=
X-Received: by 2002:a50:9177:: with SMTP id f52mr32148765eda.294.1563322401427; 
 Tue, 16 Jul 2019 17:13:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190716213746.4670-1-robdclark@gmail.com>
 <20190716213746.4670-3-robdclark@gmail.com>
 <87lfwxh7mo.fsf@anholt.net>
In-Reply-To: <87lfwxh7mo.fsf@anholt.net>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 16 Jul 2019 17:13:10 -0700
Message-ID: <CAF6AEGsrJu8r+t35zWxbq8KXFSoyPSJ_3+MjTii00Pb=YOMxHQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] drm/vgem: use normal cached mmap'ings
To: Eric Anholt <eric@anholt.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=D/eYjZgozPvgUajffWeA6V7Zmj+rx5wYX1ns8tvrFbI=;
 b=RR2GArgAq8SesCevWMlZ5weS7j9gS98QGvXopun5L+UMHZUEPYDRk7AR/hrFKt2KFl
 3VNfgodCd8uXhPrO4XxCDQ2MG29ysjEOy6uPp3vv7bF74W6m+oPGR90Ourw+MKZJUzM5
 8pBDtTwWh8prYLzslqKOH0QEA+7njMI9z7kGUAlir6GHXr3ybP+rkZ4huzQ8QbY0SGeX
 xr4/4LAMBS2Q9OrUarPlsFPMDTnBlWfaFlS64HCXZuoSW7kDHtLF6p7oEHH4yMSkYRaV
 E7LC/1VEvDBR4r8tN4TmUxj4B3rZ8rH4z+5Z5EkYlH18TOM0uSrtrVcHxt5ZUl6bT15Z
 abeQ==
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

T24gVHVlLCBKdWwgMTYsIDIwMTkgYXQgNDozOSBQTSBFcmljIEFuaG9sdCA8ZXJpY0BhbmhvbHQu
bmV0PiB3cm90ZToKPgo+IFJvYiBDbGFyayA8cm9iZGNsYXJrQGdtYWlsLmNvbT4gd3JpdGVzOgo+
Cj4gPiBGcm9tOiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+Cj4gPgo+ID4gU2lu
Y2UgdGhlcmUgaXMgbm8gcmVhbCBkZXZpY2UgYXNzb2NpYXRlZCB3aXRoIFZHRU0sIGl0IGlzIGlt
cG9zc2libGUgdG8KPiA+IGVuZCB1cCB3aXRoIGFwcHJvcHJpYXRlIGRldi0+ZG1hX29wcywgbWVh
bmluZyB0aGF0IHdlIGhhdmUgbm8gd2F5IHRvCj4gPiBpbnZhbGlkYXRlIHRoZSBzaG1lbSBwYWdl
cyBhbGxvY2F0ZWQgYnkgVkdFTS4gIFNvLCBhdCBsZWFzdCBvbiBwbGF0Zm9ybXMKPiA+IHdpdGhv
dXQgZHJtX2NmbHVzaF9wYWdlcygpLCB3ZSBlbmQgdXAgd2l0aCBjb3JydXB0aW9uIHdoZW4gY2Fj
aGUgbGluZXMKPiA+IGZyb20gcHJldmlvdXMgdXNhZ2Ugb2YgVkdFTSBibyBwYWdlcyBnZXQgZXZp
Y3RlZCB0byBtZW1vcnkuCj4gPgo+ID4gVGhlIG9ubHkgc2FuZSBvcHRpb24gaXMgdG8gdXNlIGNh
Y2hlZCBtYXBwaW5ncy4KPgo+IFRoaXMgbWF5IGJlIGFuIGltcHJvdmVtZW50LCBidXQuLi4KPgo+
IHBpbi91bnBpbiBpcyBvbmx5IG9uIGF0dGFjaGluZy9jbG9zaW5nIHRoZSBkbWEtYnVmLCByaWdo
dD8gIFNvLCBncmVhdCwKPiB5b3UgZmx1c2hlZCB0aGUgY2FjaGVkIG1hcCBvbmNlIGFmdGVyIGV4
cG9ydGluZyB0aGUgdmdlbSBkbWEtYnVmIHRvIHRoZQo+IGFjdHVhbCBHUFUgZGV2aWNlLCBidXQg
ZnJvbSB0aGVuIG9uIHlvdSBzdGlsbCBoYXZlIG5vIGludGVyZmFjZSBmb3IKPiBnZXR0aW5nIGNv
aGVyZW50IGFjY2VzcyB0aHJvdWdoIFZHRU0ncyBtYXBwaW5nIGFnYWluLCB3aGljaCBzdGlsbAo+
IGV4aXN0cy4KCkluICp0aGVvcnkqIG9uZSB3b3VsZCBkZXRhY2ggYmVmb3JlIGRvaW5nIGZ1cnRo
ZXIgQ1BVIGFjY2VzcyB0bwpidWZmZXIsIGFuZCB0aGVuIHJlLWF0dGFjaCB3aGVuIHBhc3Npbmcg
YmFjayB0byBHUFUuCgpPZmMgdGhhdCBpc24ndCBob3cgYWN0dWFsIGRyaXZlcnMgZG8gdGhpbmdz
LiAgQnV0IG1heWJlIGl0IGlzIGVub3VnaApmb3IgdmdlbSB0byBzZXJ2ZSBpdCdzIHB1cnBvc2Ug
KGllLiB0ZXN0IGNvZGUpLgoKPiBJIGZlZWwgbGlrZSB0aGlzIGlzIHBhcGVyaW5nIG92ZXIgc29t
ZXRoaW5nIHRoYXQncyByZWFsbHkganVzdCBicm9rZW4sCj4gYW5kIHdlIHNob3VsZCBzdG9wIHBy
b3ZpZGluZyBWR0VNIGp1c3QgYmVjYXVzZSBzb21lb25lIHdhbnRzIHRvIHdyaXRlCj4gZG1hLWJ1
ZiB0ZXN0IGNvZGUgd2l0aG91dCBkcml2ZXItc3BlY2lmaWMgQk8gYWxsb2MgaW9jdGwgY29kZS4K
Cnl1cCwgaXQgaXMgdmdlbSB0aGF0IGlzIGZ1bmRhbWVudGFsbHkgYnJva2VuIChvciBtYXliZSBt
b3JlCnNwZWNpZmljYWxseSBkb2Vzbid0IGZpdCBpbiB3LyBkbWEtbWFwcGluZ3MgdmlldyBvZiBo
b3cgdG8gZG8gY2FjaGUKbWFpbnQpLCBhbmQgSSdtIGp1c3QgcGFwZXJpbmcgb3ZlciBpdCBiZWNh
dXNlIHBlb3BsZSBhbmQgQ0kgc3lzdGVtcwp3YW50IHRvIGJlIGFibGUgdG8gdXNlIGl0IHRvIGRv
IHNvbWUgZG1hLWJ1ZiB0ZXN0cyA7LSkKCkknbSBraW5kYSB3b25kZXJpbmcsIGF0IGxlYXN0IGZv
ciBhcm0vZHQgYmFzZWQgc3lzdGVtcywgaWYgdGhlcmUgaXMgYQp3YXkgKG90aGVyIHRoYW4gaW4g
ZWFybHkgYm9vdCkgdGhhdCB3ZSBjYW4gaW5qZWN0IGEgdmdlbSBkZXZpY2Ugbm9kZQppbnRvIHRo
ZSBkdGIuICBUaGF0IGlzbid0IGEgdGhpbmcgZHJpdmVycyBzaG91bGQgbm9ybWFsbHkgZG8sIGJ1
dCAoaWYKcG9zc2libGUpIHNpbmNlIHZnZW0gaXMgcmVhbGx5IGp1c3QgdGVzdCBpbmZyYXN0cnVj
dHVyZSwgaXQgY291bGQgYmUgYQp3YXkgdG8gbWFrZSBkbWEtbWFwcGluZyBoYXBwaWx5IHRoaW5r
IHZnZW0gaXMgYSByZWFsIGRldmljZS4KCkJSLAotUgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
