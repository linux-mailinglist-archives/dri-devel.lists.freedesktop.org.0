Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C9759C29
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 14:57:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79BC86E8EF;
	Fri, 28 Jun 2019 12:57:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20EE16E8E7;
 Fri, 28 Jun 2019 12:57:43 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id k21so10763093edq.3;
 Fri, 28 Jun 2019 05:57:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6ueum79s2anlYRWAS9FzgzUG5wD5wG/lgkeWFXCOZvM=;
 b=Z39AZmqRBfGwhBXFf1DwchlwqmRh4o+tmfbLoFV9/v8VUeyFwrMzlxbNj7cRSrL8G+
 SHsSJcnPJlh6AGJGRo09uwv5zefcNEDEICskmXQfJWrtwgMEJim+VOHZe/QIg921kumc
 UU7xmFFLZ2hfAkOq+RxcK6EcnMMBacch1He80/8t/9GqJTSYzMHXn1rV1Ll52D//mdcf
 IQj2pDEVVxFHY2guXBz7/hFWhxoEveQtIjl3eCzmOLBLSyRoL8q2gQjFXzjNRhPovbRv
 GaND0ZErCvpBQDffqzrSEh1Ae4ItkOmEvuKG+aIOz3yLa80PrE8fbffyri9iwrVX0zBz
 8wtw==
X-Gm-Message-State: APjAAAUNj2qSSeAz+I92yDcw8AiIVPmNYjlJE6XUB4LmBAVvwIzg8m/W
 dXyIA7Sm7a0RhAFeR7oBNTmNArvc93m02cvj8ArAHV5x
X-Google-Smtp-Source: APXvYqx/IMk24rdtcifnHuLMV6DCNhTAzYuxxQja93vW7hEYjOvG7wHyp/9qq5VtECkxVyq2rfOAvLhGOZyY7X4lzP4=
X-Received: by 2002:a17:906:951:: with SMTP id
 j17mr8540123ejd.174.1561726661672; 
 Fri, 28 Jun 2019 05:57:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190627020515.5660-1-masneyb@onstation.org>
In-Reply-To: <20190627020515.5660-1-masneyb@onstation.org>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 28 Jun 2019 05:57:26 -0700
Message-ID: <CAF6AEGvFE46aKCBP5de_Bx_hFcTyF0Vc9B1PebBZjGZmw9zh2g@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm: correct NULL pointer dereference in
 context_init
To: Brian Masney <masneyb@onstation.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=6ueum79s2anlYRWAS9FzgzUG5wD5wG/lgkeWFXCOZvM=;
 b=Vsvc9FDKFPgRzauk8Np3VxKo8ItjOarCG/RlvXleY2TbKd28c/x/ep7DNZ2QsaFtp+
 qPSDxgbdaCVLAqkDqePuAf4kl1Gs+fC421GxUCMubv5o3NHu37Q/B7uFx3zKlYCBCo62
 DmrkABGvkTzrFhmRrV2eZEswUp+1+/IH3k0Y4+9APWCbJK9CrbH8GWoTzvFwonJOEhod
 JSUAMZmjsu6UFkipC2194iWXuqzUzdV2EEHWRI5SVToBk2QGi6wnHjvqC7iL4i/QGyPe
 EChj5ytcdah2+5MBwfJQMcFvMc73KIHiTSIgRs7kmPMwFXI904fprhovqJVFndOWvapW
 fLWA==
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
 Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>,
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgNzowNSBQTSBCcmlhbiBNYXNuZXkgPG1hc25leWJAb25z
dGF0aW9uLm9yZz4gd3JvdGU6Cj4KPiBDb3JyZWN0IGF0dGVtcHRlZCBOVUxMIHBvaW50ZXIgZGVy
ZWZlcmVuY2UgaW4gY29udGV4dF9pbml0KCkgd2hlbgo+IHJ1bm5pbmcgd2l0aG91dCBhbiBJT01N
VS4KPgo+IFNpZ25lZC1vZmYtYnk6IEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0YXRpb24ub3Jn
Pgo+IEZpeGVzOiAyOTViMjJhZTU5NmMgKCJkcm0vbXNtOiBQYXNzIHRoZSBNTVUgZG9tYWluIGlu
ZGV4IGluIHN0cnVjdCBtc21fZmlsZV9wcml2YXRlIikKPiAtLS0KPiBUaGUgbm8gSU9NTVUgY2Fz
ZSBzZWVtcyBsaWtlIGZ1bmN0aW9uYWxpdHkgdGhhdCB3ZSBtYXkgd2FudCB0byBrZWVwCj4gYmFz
ZWQgb24gdGhpcyBjb21tZW50Ogo+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xh
dGVzdC9zb3VyY2UvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTN4eF9ncHUuYyNMNTIzCj4g
T25jZSBJIGdldCB0aGUgbXNtODk3NCBpbnRlcmNvbm5lY3QgZHJpdmVyIGRvbmUsIEknbSBnb2lu
ZyB0byBsb29rIGludG8KPiB3aGF0IG5lZWRzIHRvIGJlIGRvbmUgdG8gZ2V0IHRoZSBJT01NVSB3
b3JraW5nIG9uIHRoZSBOZXh1cyA1Lgo+Cj4gQWx0ZXJuYXRpdmVseSwgZm9yIGRldmVsb3BtZW50
IHB1cnBvc2VzLCBtYXliZSB3ZSBjb3VsZCBoYXZlIGEgTk9PUAo+IElPTU1VIGRyaXZlciB0aGF0
IHdvdWxkIGFsbG93IHVzIHRvIHJlbW92ZSB0aGVzZSBOVUxMIGNoZWNrcyB0aGF0IGFyZQo+IHNw
cmlua2xlZCB0aHJvdWdob3V0IHRoZSBjb2RlLiBJIGhhdmVuJ3QgbG9va2VkIGludG8gdGhpcyBp
biBkZXRhaWwuCj4gVGhvdWdodHM/Cgp5ZWFoLCB3ZSBwcm9iYWJseSB3YW50IHRvIGtlZXAgIWlv
bW11IHN1cHBvcnQsIGl0IGlzIGF0IGxlYXN0IHVzZWZ1bApmb3IgYnJpbmd1cCBvZiBuZXcgKG9y
IG9sZCkgZGV2aWNlcy4gIEJ1dCB0ZW5kcyB0byBiaXRyb3QgYSBzaW5jZSBpdAppc24ndCBhIGNh
c2UgdGhhdCBnZXRzIHRlc3RlZCBtdWNoIG9uY2UgaW9tbXUgaXMgaW4gcGxhY2UuICBQZXJoYXBz
CnRoZXJlIGlzIGEgd2F5IHRvIGhhdmUgYSBudWxsIGlvbW11L2FzcGFjZSwgYWx0aG91Z2ggSSdt
IG5vdCBxdWl0ZQpzdXJlIGhvdyB0aGF0IHdvdWxkIHdvcmsuLgoKQW55d2F5cywKClJldmlld2Vk
LWJ5OiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BnbWFpbC5jb20+CgooSSBndWVzcyB0aGlzIGNhbiBn
byBpbiB2aWEgZHJtLW1pc2MtZml4ZXMgdW5sZXNzIHdlIGdldCBzb21lIG1vcmUKZml4ZXMgdG8g
anVzdGlmeSBzZW5kaW5nIG1zbS1maXhlcyBNUi4uKQoKPgo+ICBkcml2ZXJzL2dwdS9kcm0vbXNt
L21zbV9kcnYuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZHJ2LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9kcnYuYwo+IGluZGV4IDQ1MWJkNDUwODc5My4uODMw
NDdjYjJjNzM1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2Rydi5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZHJ2LmMKPiBAQCAtNjE5LDcgKzYxOSw3IEBA
IHN0YXRpYyBpbnQgY29udGV4dF9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdCBk
cm1fZmlsZSAqZmlsZSkKPgo+ICAgICAgICAgbXNtX3N1Ym1pdHF1ZXVlX2luaXQoZGV2LCBjdHgp
Owo+Cj4gLSAgICAgICBjdHgtPmFzcGFjZSA9IHByaXYtPmdwdS0+YXNwYWNlOwo+ICsgICAgICAg
Y3R4LT5hc3BhY2UgPSBwcml2LT5ncHUgPyBwcml2LT5ncHUtPmFzcGFjZSA6IE5VTEw7Cj4gICAg
ICAgICBmaWxlLT5kcml2ZXJfcHJpdiA9IGN0eDsKPgo+ICAgICAgICAgcmV0dXJuIDA7Cj4gLS0K
PiAyLjIwLjEKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gRnJlZWRyZW5vIG1haWxpbmcgbGlzdAo+IEZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Zy
ZWVkcmVubwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
