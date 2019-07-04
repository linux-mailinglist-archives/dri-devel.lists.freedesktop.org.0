Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D74C85FD18
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 20:46:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D0E96E3B0;
	Thu,  4 Jul 2019 18:46:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D6346E3AE
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 18:46:24 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id u13so10148244iop.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jul 2019 11:46:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/EL1KLCRFQKW2ACCFaTqozaezf7EHz4hHVM/un1EcE4=;
 b=MXRuJcJaUKMOWGAEfgo1Iz9LWsB0aYoI3lPnvnW1k0L0/bJ1Pnwr/jyyXTq3L+7fZj
 FE3nJW5fBh6kZyoJghkFnuiGqbUja9XF55DSRlF7jEB8QjPLNtyGfYLRmI1VlzONWuIW
 j3Zxm8ZCLm/IoUMCOn0q815XnzviqQLClFAE8KORPGpBzL1FnXzdrEDRMI4rX1EfX69a
 0ZfHgYRMN/EV6Le1P/cP40zAD6FKA6B+udi8wgu2oi59Qit3hbRe/P1arklMfW6G16Hf
 iWVpcHhEs3OyaHgJkIZcwM627xPrky0D3I7QdVBajDdOt2J9O2AffHYIk6BFDZSwExqQ
 26jA==
X-Gm-Message-State: APjAAAU6rQpf5IJ50QJzN1/yM3j6+NQI/JIeGUcS1LqaNATaxlCgPps4
 FDKxBG+L4QgmzqKZuwaVjcYk2ldXGjOF42GggmiU1g==
X-Google-Smtp-Source: APXvYqw068LIiSNZG8tw6hH1iAgU3f8oV5wzSRuRWNvDNz3EezgtI9aQEHP/lGGiQvDKG3BtZpOWd1VgboUZlM9JGhc=
X-Received: by 2002:a05:6602:104:: with SMTP id
 s4mr39068278iot.200.1562265983623; 
 Thu, 04 Jul 2019 11:46:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190702141903.1131-1-kraxel@redhat.com>
 <20190702141903.1131-9-kraxel@redhat.com>
 <CAPaKu7QP=A2kV_kqcT20Pmc831HviaBJN1RpOFoa=V1g6SmE_g@mail.gmail.com>
 <20190704112534.v7icsuverf7wrbjq@sirius.home.kraxel.org>
In-Reply-To: <20190704112534.v7icsuverf7wrbjq@sirius.home.kraxel.org>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 4 Jul 2019 11:46:12 -0700
Message-ID: <CAPaKu7SQS5USJf0Y+K41tuRA=4qZJf5CnTu9EqAPZvz+GJCP2w@mail.gmail.com>
Subject: Re: [PATCH v6 08/18] drm/virtio: rework virtio_gpu_execbuffer_ioctl
 fencing
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=/EL1KLCRFQKW2ACCFaTqozaezf7EHz4hHVM/un1EcE4=;
 b=t5F5YNcug6hMseo0CGrmu4jtrScYyR5ptz8hoGQXZ2nAYmqEbnWUkptDsisVRn+DlR
 CwihM32a+oNgurJg0qF/nDO/Z7Use2bWSvL/B+Rs/djchh2zDLEkloovdGI54dEmg7Z7
 0ZcLtk9dxbf4JWb2t6EWq1MMcGyaVhvNZG3gucduuo5SYzlm2Ej4EDjeXGg2fUYsONWY
 wVSxZ+NiAJAy8IT861ZE5CZnGHPrrz8tDjXqwYFHsv145C6cr2YShpRTl8W7KSNlzkUK
 tR5Qy2gVPZtMNqRb6vSFgLcjAmVZ/dcSvndnrTJdKezTc/nvPEShNL2J6I+hSa2Pwbck
 a/OA==
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgNCwgMjAxOSBhdCA0OjI1IEFNIEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRo
YXQuY29tPiB3cm90ZToKPgo+ICAgSGksCj4KPiA+ID4gICAgICAgICBpZiAoZmVuY2UpCj4gPiA+
ICAgICAgICAgICAgICAgICB2aXJ0aW9fZ3B1X2ZlbmNlX2VtaXQodmdkZXYsIGhkciwgZmVuY2Up
Owo+ID4gPiArICAgICAgIGlmICh2YnVmLT5vYmpzKSB7Cj4gPiA+ICsgICAgICAgICAgICAgICB2
aXJ0aW9fZ3B1X2FycmF5X2FkZF9mZW5jZSh2YnVmLT5vYmpzLCAmZmVuY2UtPmYpOwo+ID4gPiAr
ICAgICAgICAgICAgICAgdmlydGlvX2dwdV9hcnJheV91bmxvY2tfcmVzdih2YnVmLT5vYmpzKTsK
PiA+ID4gKyAgICAgICB9Cj4gPiBUaGlzIGlzIHdpdGggdGhlIHNwaW5sb2NrIGhlbGQuICBNYXli
ZSB3ZSBzaG91bGQgbW92ZSB0aGUKPiA+IHZpcnRpb19ncHVfYXJyYXlfdW5sb2NrX3Jlc3YgY2Fs
bCBvdXQgb2YgdGhlIGNyaXRpY2FsIHNlY3Rpb24uCj4KPiBUaGF0IHdvdWxkIGJyaW5nIGJhY2sg
dGhlIHJhY2UgLi4uClJpZ2h0Li4uCj4KPiA+IEkgYW0gYWN0dWFsbHkgbW9yZSBjb25jZXJuZWQg
YWJvdXQgdmlydGlvX2dwdV9hcnJheV9hZGRfZmVuY2UsIGJ1dCBpdAo+ID4gaXMgYWxzbyBoYXJk
ZXIgdG8gbW92ZS4gIFNob3VsZCB3ZSBhZGQgYSBrcmVmIHRvIHRoZSBvYmplY3QgYXJyYXk/Cj4K
PiBZZXAsIHJlZmNvdW50aW5nIHdvdWxkIGJlIHRoZSBvdGhlciB3YXkgdG8gZml4IHRoZSByYWNl
Lgo+Cj4gPiBUaGlzIGJvdGhlcnMgbWUgYmVjYXVzZSBJIHJlY2VudGx5IHJhbiBpbnRvIGEgQ1BV
LWJvdW5kIGdhbWUgd2l0aCB2ZXJ5Cj4gPiBiYWQgbG9jayBjb250ZW50aW9uIGhlcmUuCj4KPiBI
bW0uICBBbnkgY2x1ZSB3aGVyZSB0aGlzIGNvbWVzIGZyb20/ICBNdWx0aXBsZSB0aHJlYWRzIGNv
bXBldGluZyBmb3IKPiB2aXJ0aW8gYnVmZmVycyBJIGd1ZXNzPyAgTWF5YmUgd2Ugc2hvdWxkIGhh
dmUgbGFyZ2VyIHZpcnRxdWV1ZXM/ClRoZSBnYW1lIHdhcyBzaW5nbGUtdGhyZWFkZWQuICBJIGd1
ZXNzIGl0IHdhcyB0aGUgZ2FtZSBhbmQgWG9yZwpjb21wZXRpbmcgZm9yIHZpcnRpbyBidWZmZXJz
LiAgVGhhdCB3YXMgYWxzbyBvbiBhbiBvbGRlciBrZXJuZWwKd2l0aG91dCBleHBsaWNpdCBmZW5j
ZXMuICBUaGUgdXNlcnNwYWNlIGhhZCB0byBjcmVhdGUgZHVtbXkgcmVzb3VyY2VzCmZyZXF1ZW50
bHkgdG8gZG8gVklSVElPX0lPQ1RMX1JFU09VUkNFX1dBSVQuCgpJIHRoaW5rIHRoaXMgaXMgZmlu
ZSBmb3Igbm93IGFzIGZhciBhcyBJIGFtIGNvbmNlcm5lZC4gIEkgY2FuIGxvb2sKaW50byB0aGlz
IG1vcmUgY2xvc2VseSBhZnRlciB0aGlzIHNlcmllcyBsYW5kcy4KCgo+Cj4gY2hlZXJzLAo+ICAg
R2VyZAo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
