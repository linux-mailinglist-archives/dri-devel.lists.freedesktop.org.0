Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D5D265DF
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 16:36:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B1889AB7;
	Wed, 22 May 2019 14:35:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 954DD898ED;
 Fri, 17 May 2019 21:43:01 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id n22so6287701lfe.12;
 Fri, 17 May 2019 14:43:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=omjLxmSNNYtnEPtdiIJhbdG0AmCOIUWMoRWyXDyjKSk=;
 b=dXXfN8mV1bzooasEiiTukX7pXUfJEPTApqWlLZoFCH+pP/tnD0Y1tMuSiwFL2s3uPB
 Elh1DbFXtYOJ/p2m1LVrxExDqSrfwSgaKJDY066u+Z4t75ISNJAbUBDNDRzyLKGAk13S
 bm3CZqEYBmZs2mE0zTBESSNkR6wso+J0BzIyLOKPUbe9RkdqJk1WAdrEh6PUXXcQBk9o
 lVajh2CtEiikXKvAPAo0z6RtntW4PEQdDkx2ZMu3fTFIVWzTxIBTyRqixn+0A/t0G+Y/
 17JZc8rb9f7EaEZ1CyDAoKZ/znUIFXnq8sLkEYN5rOVSum40fai69UxOeNuSnfMu3Wlb
 Z9sg==
X-Gm-Message-State: APjAAAW64jl3PNt5SZZ+9OaeP1h5Irb9iPTcyikUdd8DOD1XtsY1pX0+
 o2/fJJQeCzkbQY95mihDe4P8GKLcVk7SFiX6Dq0=
X-Google-Smtp-Source: APXvYqzSGvINuEYLuuI4wBmkMoxc4ZWZNXhJih8JBzvKPmfeWO0b6+C+XkiwzOHejoUQsFpNNmxVm6ZwOXDiH/0+dts=
X-Received: by 2002:a19:c7c3:: with SMTP id
 x186mr12266441lff.107.1558129380001; 
 Fri, 17 May 2019 14:43:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAK4VdL2wa=UrpRqfML-ymkEX7LkE6FP3ykgNUQonLdjmaydq_Q@mail.gmail.com>
 <3f1a556e-dd4c-3dc7-b966-a63baf1e7c52@amd.com>
In-Reply-To: <3f1a556e-dd4c-3dc7-b966-a63baf1e7c52@amd.com>
From: Erico Nunes <nunes.erico@gmail.com>
Date: Fri, 17 May 2019 23:42:48 +0200
Message-ID: <CAK4VdL26tEkW+6fU4DaXa8pGAfpQ5TfgiwNhyHXq=EJh72ak=Q@mail.gmail.com>
Subject: Re: lima_bo memory leak after drm_sched job destruction rework
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
X-Mailman-Approved-At: Wed, 22 May 2019 14:35:25 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=omjLxmSNNYtnEPtdiIJhbdG0AmCOIUWMoRWyXDyjKSk=;
 b=awM9LIkXbfvJC8kxK5lBdzKBmXoqYK5IlJKVJbOiZAKnT7m672mMM5PO3jANOKQj4I
 lgswmZH/UvjCU4kx1WsQFNRrB9e907+8jPGkP1auWCeU9wwngWpnELloUEKoTSwMcMJx
 SlcEfnfjwriU3TbvayoVB8DxC5f0PKMrV4TLyODK2csQsk3+/EvClTyIKf1MfR6dDTIw
 qn3VgM6alSAvDwQDrphXQWeksKUsVpx4SfHwmUgDs99osCnuzgGH0MQygNOJVKcAAyTy
 0iZEagPlOLc3NuIw9KzPQjd7Mm4Eg2xz8gpQtgcnn31SnfBoLalzEQi6VsEpf9+X+GRW
 RopQ==
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
Cc: "Deng, Emily" <Emily.Deng@amd.com>,
 "lima@lists.freedesktop.org" <lima@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Nayan Deshmukh <nayan26deshmukh@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, Qiang Yu <yuq825@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Rex Zhu <Rex.Zhu@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMTcsIDIwMTkgYXQgMTA6NDMgUE0gR3JvZHpvdnNreSwgQW5kcmV5CjxBbmRy
ZXkuR3JvZHpvdnNreUBhbWQuY29tPiB3cm90ZToKPiBPbiA1LzE3LzE5IDM6MzUgUE0sIEVyaWNv
IE51bmVzIHdyb3RlOgo+ID4gTGltYSBjdXJyZW50bHkgZGVmYXVsdHMgdG8gYW4gImluZmluaXRl
IiB0aW1lb3V0LiBTZXR0aW5nIGEgNTAwbXMKPiA+IGRlZmF1bHQgdGltZW91dCBsaWtlIG1vc3Qg
b3RoZXIgZHJtX3NjaGVkIHVzZXJzIGRvIGZpeGVkIHRoZSBsZWFrIGZvcgo+ID4gbWUuCj4KPiBJ
IGFtIG5vdCB2ZXJ5IGNsZWFyIGFib3V0IHRoZSBwcm9ibGVtIC0gc28geW91IGJhc2ljYWxseSBu
ZXZlciBhbGxvdyBhCj4gdGltZSBvdXQgaGFuZGxlciB0byBydW4gPyBBbmQgdGhlbiB3aGVuIHRo
ZSBqb2IgaGFuZ3MgZm9yIGV2ZXIgeW91IGdldAo+IHRoaXMgbWVtb3J5IGxlYWsgPyBIb3cgaXQg
d29ya2VkIGZvciB5b3UgYmVmb3JlIHRoaXMgcmVmYWN0b3JpbmcgPyBBcwo+IGZhciBhcyBJIHJl
bWVtYmVyICBzY2hlZC0+b3BzLT5mcmVlX2pvYiBiZWZvcmUgdGhpcyBjaGFuZ2Ugd2FzIGNhbGxl
ZAo+IGZyb20gZHJtX3NjaGVkX2pvYl9maW5pc2ggd2hpY2ggaXMgdGhlIHdvcmsgc2NoZWR1bGVk
IGZyb20gSFcgZmVuY2UKPiBzaWduYWxlZCBjYWxsYmFjayAtIGRybV9zY2hlZF9wcm9jZXNzX2pv
YiBzbyBpZiB5b3VyIGpvYiBoYW5ncyBmb3IgZXZlcgo+IGFueXdheSBhbmQgdGhpcyB3b3JrIGlz
IG5ldmVyIHNjaGVkdWxlZCAgd2hlbiB5b3VyIGZyZWVfam9iIGNhbGxiYWNrIHdhcwo+IGNhbGxl
ZCA/CgpJbiB0aGlzIHBhcnRpY3VsYXIgY2FzZSwgdGhlIGpvYnMgcnVuIHN1Y2Nlc3NmdWxseSwg
bm90aGluZyBoYW5ncy4KTGltYSBjdXJyZW50bHkgc3BlY2lmaWVzIGFuICJpbmZpbml0ZSIgdGlt
ZW91dCB0byB0aGUgZHJtIHNjaGVkdWxlciwKc28gaWYgYSBqb2IgZGlkIGRpZCBoYW5nLCBpdCB3
b3VsZCBoYW5nIGZvcmV2ZXIsIEkgc3VwcG9zZS4gQnV0IHRoaXMKaXMgbm90IHRoZSBpc3N1ZS4K
CklmIEkgdW5kZXJzdGFuZCBjb3JyZWN0bHkgaXQgd29ya2VkIHdlbGwgYmVmb3JlIHRoZSByZXdv
cmsgYmVjYXVzZSB0aGUKY2xlYW51cCB3YXMgdHJpZ2dlcmVkIGF0IHRoZSBlbmQgb2YgZHJtX3Nj
aGVkX3Byb2Nlc3Nfam9iCmluZGVwZW5kZW50bHkgb24gdGhlIHRpbWVvdXQuCgpXaGF0IEknbSBv
YnNlcnZpbmcgbm93IGlzIHRoYXQgZXZlbiB3aGVuIGpvYnMgcnVuIHN1Y2Nlc3NmdWxseSwgdGhl
eQphcmUgbm90IGNsZWFuZWQgYnkgdGhlIGRybSBzY2hlZHVsZXIgYmVjYXVzZSBkcm1fc2NoZWRf
Y2xlYW51cF9qb2JzCnNlZW1zIHRvIGdpdmUgdXAgYmFzZWQgb24gdGhlIHN0YXR1cyBvZiBhIHRp
bWVvdXQgd29ya2VyLgpJIHdvdWxkIGV4cGVjdCB0aGUgdGltZW91dCB2YWx1ZSB0byBvbmx5IGJl
IHJlbGV2YW50IGluIGVycm9yL2h1bmcgam9iIGNhc2VzLgoKSSB3aWxsIHByb2JhYmx5IHNldCB0
aGUgdGltZW91dCB0byBhIHJlYXNvbmFibGUgdmFsdWUgYW55d2F5LCBJIGp1c3QKcG9zdGVkIGhl
cmUgdG8gcmVwb3J0IHRoYXQgdGhpcyBjYW4gcG9zc2libHkgYmUgYSBidWcgaW4gdGhlIGRybQpz
Y2hlZHVsZXIgYWZ0ZXIgdGhhdCByZXdvcmsuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
