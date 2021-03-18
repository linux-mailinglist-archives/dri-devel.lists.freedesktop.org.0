Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF203400B8
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 09:18:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BD366E0C8;
	Thu, 18 Mar 2021 08:18:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A40976E0CA
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 08:18:30 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id b83so3164212lfd.11
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 01:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qtec.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=O/WY2Bl4bEwXZZzzpuZUOllqUEJ+Z8Y/vfnp2iRL83U=;
 b=fDR0gy+9vrvudTQpd8ALd/Pi3bgro8qTAxQigVBuyYE5fefSUqrOPfNC94xzZedzqr
 hnq76OVGUfFwS258l8rVenrcSCgFjRhCa9YaAX7TnzAedyGfbM4+1uA/hycOT4YqveQS
 w0KJxg7X+yNYRMnow3I6GRXKOe3FCCuVG7vrk0qhV2jbEdiihLNndkQwV+e12UDRKlUO
 8HjL65l0MSrkY6pxpacWr5oD9JEIMF+jlWPlG7m53Y7Cm3EzOAGg52AHLRFVgQtPzWaY
 xHLP67ZuQ/DwGsmOM5ClC8/ngx/FaQSBvqSgeZhrmZ2se0TDayHUrvL8apgqXECSMHFJ
 nLuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=O/WY2Bl4bEwXZZzzpuZUOllqUEJ+Z8Y/vfnp2iRL83U=;
 b=jtB+XeMhCOurYpOVdblJZgIs4/Z6OmgBKYy1RQOv56tNN6No1GhyXt8Vdu0qmki2EE
 gWI0GZQc7nM1TCk7TPRCZPNk8B6bOPFMP68uKeJ+Tgdy9J1Frs6UoBWshLFP5ylK6N5b
 pi+ARzy765yZLgevC6OQKj+DKdbGCHoRaKAv4mDqtseuZKdbMpvwpIoDe6+TlnsEyH/s
 m2pwL25VbAuSO3iMQMFDWZYj4oVCI74jB2UDYffvPO507THABetM8mxuHWN8SloVukEg
 Pzwqs+7g+f7pgm5h6Yh7arNbsJ/sTQE0c6/eCTxbkX/REcDPL7tYXBo87nU+8CWWflbD
 odVA==
X-Gm-Message-State: AOAM532TbxhWLUvYgXENIWz7H1KgrOjAQtRAM8MQUANuZsddo+dGzovE
 NUTQhYZPbvVkzZeoAw0Q6uY0EbXSOwYZTGankwW2dQ==
X-Google-Smtp-Source: ABdhPJxeSEGQ5VxzxzzuKMz+JRZK3Y8C7XkLNiducFb7gkrMCDzzC+lAffXBLb1HjWZ0YQ0AsfAJEhTXxhi/sUbQYT4=
X-Received: by 2002:a19:791e:: with SMTP id u30mr4703038lfc.621.1616055509025; 
 Thu, 18 Mar 2021 01:18:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210317160840.36019-1-daniel@qtec.com>
 <bb94b582-a720-9c4f-3d37-d1f7fd29da44@amd.com>
In-Reply-To: <bb94b582-a720-9c4f-3d37-d1f7fd29da44@amd.com>
From: Daniel Gomez <daniel@qtec.com>
Date: Thu, 18 Mar 2021 09:18:17 +0100
Message-ID: <CAH1Ww+SBgw6-HikPBpE1_yLG-X75LfSBbNerzzqBzyCArgm1-Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/ttm: Fix memory leak userptr pages
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Daniel Gomez <dagmcr@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 Likun Gao <Likun.Gao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAxOCBNYXIgMjAyMSBhdCAwODo0OSwgQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFu
LmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPgo+IEFtIDE3LjAzLjIxIHVtIDE3OjA4IHNjaHJpZWIg
RGFuaWVsIEdvbWV6Ogo+ID4gSWYgdXNlcnB0ciBwYWdlcyBoYXZlIGJlZW4gcGlubmVkIGJ1dCBu
b3QgYm91bmRlZCwKPiA+IHRoZXkgcmVtYWluIHVuY2xlYXJlZC4KPiA+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBEYW5pZWwgR29tZXogPGRhbmllbEBxdGVjLmNvbT4KPgo+IEdvb2QgY2F0Y2gsIG5vdCBz
dXJlIGlmIHRoYXQgY2FuIGV2ZXIgaGFwcGVuIGluIHByYWN0aWNlIGJ1dCBiZXR0ZXIgc2F2ZQo+
IHRoYW4gc29ycnkuClRoYW5rcyEgV2UgYWN0dWFsbHkgaGFkIGEgY2FzZSB3aXRoIGNsRW5xdWV1
ZVdyaXRlQnVmZmVyIHdoZXJlIHRoZQpkcml2ZXIgd2FzIGxlYWtpbmcuCkkgY2FuIHNlZSB0aGUg
cHJvYmxlbSBhbHNvIGFmZmVjdHMgdG8gdGhlIHJhZGVvbiBkcml2ZXIgc28sIEknbGwgc2VuZAph
IHBhdGNoIGZvciB0aGF0IG9uZSBhcwp3ZWxsLgo+Cj4gUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBL
w7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPgo+ID4gLS0tCj4gPiAgIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyB8IDYgKysrLS0tCj4gPiAgIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwo+ID4gaW5kZXggOWZkMjE1N2IxMzNhLi41MGMy
YjQ4MjdjMTMgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfdHRtLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0u
Ywo+ID4gQEAgLTExNjIsMTMgKzExNjIsMTMgQEAgc3RhdGljIHZvaWQgYW1kZ3B1X3R0bV9iYWNr
ZW5kX3VuYmluZChzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwKPiA+ICAgICAgIHN0cnVjdCBh
bWRncHVfdHRtX3R0ICpndHQgPSAodm9pZCAqKXR0bTsKPiA+ICAgICAgIGludCByOwo+ID4KPiA+
IC0gICAgIGlmICghZ3R0LT5ib3VuZCkKPiA+IC0gICAgICAgICAgICAgcmV0dXJuOwo+ID4gLQo+
ID4gICAgICAgLyogaWYgdGhlIHBhZ2VzIGhhdmUgdXNlcnB0ciBwaW5uaW5nIHRoZW4gY2xlYXIg
dGhhdCBmaXJzdCAqLwo+ID4gICAgICAgaWYgKGd0dC0+dXNlcnB0cikKPiA+ICAgICAgICAgICAg
ICAgYW1kZ3B1X3R0bV90dF91bnBpbl91c2VycHRyKGJkZXYsIHR0bSk7Cj4gPgo+ID4gKyAgICAg
aWYgKCFndHQtPmJvdW5kKQo+ID4gKyAgICAgICAgICAgICByZXR1cm47Cj4gPiArCj4gPiAgICAg
ICBpZiAoZ3R0LT5vZmZzZXQgPT0gQU1ER1BVX0JPX0lOVkFMSURfT0ZGU0VUKQo+ID4gICAgICAg
ICAgICAgICByZXR1cm47Cj4gPgo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
