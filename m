Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 703DCF95B1
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 17:32:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 407A4890EE;
	Tue, 12 Nov 2019 16:32:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09253890EE;
 Tue, 12 Nov 2019 16:32:20 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id x11so15399378eds.13;
 Tue, 12 Nov 2019 08:32:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e2Jz3E/qC25NF9IiKUouiFwK/DvFsp3VH/99djW83Tw=;
 b=P77nKgPcV6gYOysy/LnS8Kj4DhQQdGsVbz1pj9AgeLkr8Yt5fGYHyWnECf6+3+dUpE
 UfPLc7TNCVfYvcdHjbZHPkE69EcteWMWMQx+q6xBFjT8+2j5xUDaXyNmdpme+47YTP4G
 BLQ+6FojrxofmZ8nTdC7gs2I09SnPdg/I8N/fMy8KltEdcboZ64r8sP3is/k1kkzyQpF
 wkgs7zR6XHk0PlVJDqr39pGwn+4iNbPEtl6YOyEiG4rBjXolhCldw+ni7eQ3Fqcwqs38
 Mlmvj4alg59PxiMuWc+U5AlgCQFNGlO62zse39zzR4zLX8VD1MimpV/63WRNt89Jyow9
 C9RQ==
X-Gm-Message-State: APjAAAXeGjxO+4DZ5ZVMEbxJaZOs8D221NhGTcNjFp2U59dWrCwJ+Tna
 eGkCAUagX/Wmfr3KeGAB03Bpt75TIt/DeiD8T6E=
X-Google-Smtp-Source: APXvYqxUJWvwSmr0nM3W2I8m8qS350GR+Yh1XQx0NXoCk7SkB+BvkcrjP5jRJcrXZBYMM4/uW4AMh0vphypZhJFQYwE=
X-Received: by 2002:a17:906:73d5:: with SMTP id
 n21mr29350021ejl.228.1573576338515; 
 Tue, 12 Nov 2019 08:32:18 -0800 (PST)
MIME-Version: 1.0
References: <20191010131333.23635-1-johan@kernel.org>
 <20191010131333.23635-2-johan@kernel.org>
 <20191030100146.GC4691@localhost> <20191112104001.GP11035@localhost>
 <20191112140155.GJ23790@phenom.ffwll.local>
In-Reply-To: <20191112140155.GJ23790@phenom.ffwll.local>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 12 Nov 2019 08:32:07 -0800
Message-ID: <CAF6AEGvom2wZ89434VLhhgAHCk_MMCGRbxSO+DQsX=+LPOCy8A@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/msm: fix memleak on release
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=e2Jz3E/qC25NF9IiKUouiFwK/DvFsp3VH/99djW83Tw=;
 b=juR6/t7s9JzCUry7/6lTMFF27i/rneVimIPKY2HgzFAnMiFuV1WmO2ww+Pj8PdVbej
 qP6gfhPakJK4d6SPvlUeYiQWRLeOka1T5sxZZLeaLfpdnYbQ46HBKD5amyqCU6c8u5nW
 m9YuvO9yG5zyNdHia7jl93PojR4QMnOZj/9qK/h2bw+OdnE5vgw/8B95LZ5HFdCvF500
 K9rOVtrRpx3vVI/iVCupSf21kBaSLBnRbBJdWNbM+WjxE8v33s1/0LZU/1bkbih/Uvk1
 H56RFOj2/JCuZqeW0hNsE0Gci+GtOe0ILTaF4vIDij05gs6AXmjaeyVB4RgsjMf+3uQh
 yXkA==
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Johan Hovold <johan@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Fabien Dessenne <fabien.dessenne@st.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>, stable <stable@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Paul <sean@poorly.run>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTIsIDIwMTkgYXQgNjowMSBBTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3
bGwuY2g+IHdyb3RlOgo+Cj4gT24gVHVlLCBOb3YgMTIsIDIwMTkgYXQgMTE6NDA6MDFBTSArMDEw
MCwgSm9oYW4gSG92b2xkIHdyb3RlOgo+ID4gT24gV2VkLCBPY3QgMzAsIDIwMTkgYXQgMTE6MDE6
NDZBTSArMDEwMCwgSm9oYW4gSG92b2xkIHdyb3RlOgo+ID4gPiBPbiBUaHUsIE9jdCAxMCwgMjAx
OSBhdCAwMzoxMzozMFBNICswMjAwLCBKb2hhbiBIb3ZvbGQgd3JvdGU6Cj4gPiA+ID4gSWYgYSBw
cm9jZXNzIGlzIGludGVycnVwdGVkIHdoaWxlIGFjY2Vzc2luZyB0aGUgImdwdSIgZGVidWdmcyBm
aWxlIGFuZAo+ID4gPiA+IHRoZSBkcm0gZGV2aWNlIHN0cnVjdF9tdXRleCBpcyBjb250ZW5kZWQs
IHJlbGVhc2UoKSBjb3VsZCByZXR1cm4gZWFybHkKPiA+ID4gPiBhbmQgZmFpbCB0byBmcmVlIHJl
bGF0ZWQgcmVzb3VyY2VzLgo+ID4gPiA+Cj4gPiA+ID4gTm90ZSB0aGF0IHRoZSByZXR1cm4gdmFs
dWUgZnJvbSByZWxlYXNlKCkgaXMgaWdub3JlZC4KPiA+ID4gPgo+ID4gPiA+IEZpeGVzOiA0Zjc3
NmY0NTExYzcgKCJkcm0vbXNtL2dwdTogQ29udmVydCB0aGUgR1BVIHNob3cgZnVuY3Rpb24gdG8g
dXNlIHRoZSBHUFUgc3RhdGUiKQo+ID4gPiA+IENjOiBzdGFibGUgPHN0YWJsZUB2Z2VyLmtlcm5l
bC5vcmc+ICAgICAjIDQuMTgKPiA+ID4gPiBDYzogSm9yZGFuIENyb3VzZSA8amNyb3VzZUBjb2Rl
YXVyb3JhLm9yZz4KPiA+ID4gPiBDYzogUm9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPgo+
ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEpvaGFuIEhvdm9sZCA8am9oYW5Aa2VybmVsLm9yZz4KPiA+
ID4gPiAtLS0KPiA+ID4KPiA+ID4gUm9iLCBTZWFuLAo+ID4gPgo+ID4gPiBTZW5kaW5nIGEgcmVt
aW5kZXIgYWJvdXQgdGhpcyBvbmUsIHdoaWNoIGlzIG5vdCB5ZXQgaW4gbGludXgtbmV4dC4KPiA+
ID4KPiA+ID4gUGVyaGFwcyBEYW5pZWwgY2FuIHBpY2sgaXQgdXAgb3RoZXJ3aXNlPwo+ID4KPiA+
IEFub3RoZXIgdHdvIHdlZWtzLCBhbm90aGVyIHJlbWluZGVyLiBUaGlzIG9uZSBpcyBzdGlsbCBu
b3QgaW4gLW5leHQuCj4KPiBXZWxsIG1zbSBpcyBtYWludGFpbmVkIGluIGEgc2VwYXJhdGUgdHJl
ZSwgc28gdGhlIHVzdWFsIGdyb3VwIG1haW50YWluZXIKPiBmYWxsYmFjayBmb3Igd2hlbiBwYXRj
aGVzIGFyZSBzdHVjayBkb2Vzbid0IGFwcGx5LgoKb2gsIHNvcnJ5LCB0aGlzIHdhc24ndCBzaG93
aW5nIHVwIGluIHBhdGNod29yay4uIG9yIHJhdGhlciBpdCBkaWQgYnV0CnRoZSBub24tbXNtIHJl
bGF0ZWQgc2VyaWVzIHN1YmplY3QgbWFkZSBtZSBvdmVybG9vayBpdC4KCkkndmUgYWxyZWFkeSBz
ZW50IGEgUFIsIGJ1dCB0aGlzIHNob3VsZG4ndCBjb25mbGljdCB3aXRoIGFueXRoaW5nIGFuZApJ
IHRoaW5rIGl0IGNhbiBnbyBpbiB2aWEgZHJtLW1pc2MvZml4ZXMKClJldmlld2VkLWJ5OiBSb2Ig
Q2xhcmsgPHJvYmRjbGFya0BnbWFpbC5jb20+Cgo+IFJvYiwgU2VhbiwgdGltZSB0byByZWNvbnNp
ZGVyIGRybS1taXNjIGZvciBtc20/IEkgdGhpbmsgdGhlcmUncyBzb21lIG1vcmUKPiBvZGRiYWxs
IHBhdGNoZXMgdGhhdCBvY2Nhc2lvbmFsbHkgZ2V0IHN0dWNrIGZvciBtc20gLi4uCj4KPiBBbHNv
ICtEYXZlLgo+IC1EYW5pZWwKPgo+ID4KPiA+IEpvaGFuCj4gPgo+ID4gPiA+ICBkcml2ZXJzL2dw
dS9kcm0vbXNtL21zbV9kZWJ1Z2ZzLmMgfCA2ICstLS0tLQo+ID4gPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDUgZGVsZXRpb25zKC0pCj4gPiA+ID4KPiA+ID4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZGVidWdmcy5jIGIvZHJpdmVycy9ncHUvZHJt
L21zbS9tc21fZGVidWdmcy5jCj4gPiA+ID4gaW5kZXggNmJlODc5NTc4MTQwLi4xYzc0MzgxYTRm
YzkgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZGVidWdmcy5j
Cj4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZGVidWdmcy5jCj4gPiA+ID4g
QEAgLTQ3LDEyICs0Nyw4IEBAIHN0YXRpYyBpbnQgbXNtX2dwdV9yZWxlYXNlKHN0cnVjdCBpbm9k
ZSAqaW5vZGUsIHN0cnVjdCBmaWxlICpmaWxlKQo+ID4gPiA+ICAgc3RydWN0IG1zbV9ncHVfc2hv
d19wcml2ICpzaG93X3ByaXYgPSBtLT5wcml2YXRlOwo+ID4gPiA+ICAgc3RydWN0IG1zbV9kcm1f
cHJpdmF0ZSAqcHJpdiA9IHNob3dfcHJpdi0+ZGV2LT5kZXZfcHJpdmF0ZTsKPiA+ID4gPiAgIHN0
cnVjdCBtc21fZ3B1ICpncHUgPSBwcml2LT5ncHU7Cj4gPiA+ID4gLSBpbnQgcmV0Owo+ID4gPiA+
IC0KPiA+ID4gPiAtIHJldCA9IG11dGV4X2xvY2tfaW50ZXJydXB0aWJsZSgmc2hvd19wcml2LT5k
ZXYtPnN0cnVjdF9tdXRleCk7Cj4gPiA+ID4gLSBpZiAocmV0KQo+ID4gPiA+IC0gICAgICAgICBy
ZXR1cm4gcmV0Owo+ID4gPiA+Cj4gPiA+ID4gKyBtdXRleF9sb2NrKCZzaG93X3ByaXYtPmRldi0+
c3RydWN0X211dGV4KTsKPiA+ID4gPiAgIGdwdS0+ZnVuY3MtPmdwdV9zdGF0ZV9wdXQoc2hvd19w
cml2LT5zdGF0ZSk7Cj4gPiA+ID4gICBtdXRleF91bmxvY2soJnNob3dfcHJpdi0+ZGV2LT5zdHJ1
Y3RfbXV0ZXgpOwo+Cj4gLS0KPiBEYW5pZWwgVmV0dGVyCj4gU29mdHdhcmUgRW5naW5lZXIsIElu
dGVsIENvcnBvcmF0aW9uCj4gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
