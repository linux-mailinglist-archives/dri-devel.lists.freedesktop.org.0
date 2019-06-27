Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 501E357B4A
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 07:24:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F7CF89DE5;
	Thu, 27 Jun 2019 05:24:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD25689DE5
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 05:24:33 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id j6so1998926ioa.5
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 22:24:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RIIwBX17xBmvmx1T+gcoOewCXOkdROxcqv1U8Dyz+oE=;
 b=IhrxlLpKTq8D7peiTwPzfKmflwoJFGzUMktWkN9zqKf2Aex0aDm0Dle7aBiSFFJHkb
 zMUf9mQ/ViqPdWiNYaytadvmrtmV75bZdx9uay9nSjfK5dlx9+x99l/nlygWWbJiF9ur
 oOqKfU65EolzZjT5BdKKed4qQBFVKz4W6OekaM9P95ZSR+vjRagoO2tcxqaZQHADOwvP
 64PmO7VyeBU4Efm9fcxHhnyGAAlnG7fiB0nlvs5h8PjGKdszckVpeab9VfzetSytuAI6
 wBiYbvr6WVCZ3tUtN0+V7mAufe5c/Uj0sk9ZBvzoC8ggK6fAfkpKDpxheNLP6yXvawFd
 5yYg==
X-Gm-Message-State: APjAAAU4NQnbCutLI3Yib2QJS4lsFcVJKlx9sXhtbJj2SvSsnVb38KEx
 sZe5VYK19D4ufUqvD+CrlC5m1wmr5Gxc4XBCdto=
X-Google-Smtp-Source: APXvYqzbfviqVNtJkE4LqaJax/YS9ZYRuR9tvoYRDCBiYHH3Lad0CksUqVzpaEfSLY8jg9WXf01iJSJx5T6KnqYmSdw=
X-Received: by 2002:a5d:97d8:: with SMTP id k24mr2531140ios.84.1561613072925; 
 Wed, 26 Jun 2019 22:24:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190619090420.6667-1-kraxel@redhat.com>
 <20190619090420.6667-9-kraxel@redhat.com>
 <20190619110902.GO12905@phenom.ffwll.local>
 <20190620060107.tdz3nrnsczkkv2a6@sirius.home.kraxel.org>
In-Reply-To: <20190620060107.tdz3nrnsczkkv2a6@sirius.home.kraxel.org>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 26 Jun 2019 22:24:20 -0700
Message-ID: <CAPaKu7SZr+wvoM8JgB=d4kHOJioPiG-hQbfU5mmT4iB9Kn4DgA@mail.gmail.com>
Subject: Re: [PATCH v3 08/12] drm/virtio: rework virtio_gpu_execbuffer_ioctl
 fencing
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=RIIwBX17xBmvmx1T+gcoOewCXOkdROxcqv1U8Dyz+oE=;
 b=OXZlLx/GhXOXqwsTB/C1LqW8uw0P35vMVrRjeFdl6kaABAlVKJvCh2sz/FruA5C2Ex
 CtdRjmzFIXxVXhTzYkM/TiPllk8gHaNR1ycXdrEV/HQQmkr97fic5QH1H4t3Q456NpnU
 JbbXYMBtrduGC7PuVPp3LcoQr3DU/6GGdkDRsKBpU7S/KRv8UoNS6g1TKxZnLy/axGJL
 BSL6szx5l6pkpSP5nwqNBrLHHlKBHAKbqR9Ja/f2lW4N4d/J2d1D4vlfWEAQiKHOJdiD
 QgO/LrKA+u3P49TJ18ExP908RZkdxXyz3LK7w/unBJsIs088mPd+25gXOsuF7AP0zguE
 1oDA==
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 open list <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SSB0cmllZCBteSBiZXN0IHRvIHJldmlldyB0aGlzIHNlcmllcy4gIEkgYW0gbm90IHJlYWxseSBh
IGtlcm5lbCBkZXYKc28gcGxlYXNlIHRha2UgdGhhdCB3aXRoIGEgZ3JhaW4gb2Ygc2FsdC4KCk9u
IFdlZCwgSnVuIDE5LCAyMDE5IGF0IDExOjAxIFBNIEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRo
YXQuY29tPiB3cm90ZToKPgo+ICAgSGksCj4KPiA+IEFsc28sIEkgc3Ryb25nbHkgcmVjb21tZW5k
IHlvdSBkbyBhIHZlcnkgYmFzaWMgaWd0IHRvIGV4ZXJjaXNlIHRoaXMsIGkuZS4KPiA+IGFsbG9j
YXRlIHNvbWUgYnVmZmVycywgc3VibWl0IHRoZW0gaW4gYSBkdW1tYnkgb3AsIHRoZW4gY2xvc2Ug
dGhlIGVudGlyZQo+ID4gZHJtZmQuIFRoZSBvbGQgdmVyc2lvbiBzaG91bGQgYXQgbGVhc3QgaGF2
ZSB0cmlwcGVkIG92ZXIga2FzYW4sIG1heWJlIGV2ZW4KPiA+IG9vcHNlcyBzb21ld2hlcmUuCj4K
PiBIbW0sIEkgc3VzcGVjdCBJIGhhdmUgdG8gZXh0ZW5kIGlndCBmb3IgdGhhdCAoYWRkaW5nIHN1
cHBvcnQgZm9yCj4gdmlydGlvIGlvY3RscyksIHJpZ2h0Pwo+Cj4gQSBxdWljayBhbmQgZGlydHkg
dGVzdCAocnVuIHdlYmdsIGRlbW8gaW4gZmlyZWZveCwgdGhlbiBraWxsIC05IGJvdGgKPiBmaXJl
Zm94IGFuZCBYb3JnKSBkaWRuJ3Qgc2hvdyBhbnkgbmFzdHkgc3VycHJpc2VzLgo+Cj4gY2hlZXJz
LAo+ICAgR2VyZAo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
