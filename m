Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7426F427B1
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 15:35:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D25589226;
	Wed, 12 Jun 2019 13:35:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F6C789226
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 13:35:06 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id 190so6637583vsf.9
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 06:35:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x2GsrM5xsH0GoRlOOAET1vp5rVqgxhde20w9n7K4PBc=;
 b=P+EsjWt6XPPDZeOiBxj1I0TXgsSQGgRgKV497CAfk7Jv01oCROEL1x5xl/CJSOt95G
 vBomdM9GQQk7VLh/u6EbkMO3wAN0PZpknTVtoNsuoU5ht3Kr+kEqOO7sqzelQZD+w/cH
 g0Kk6PVEYImFtlcakJpEQgGPqqNmn/R+NVwNdrLfUrncQe67KX5naGr+dB/3fSOOFdiJ
 3vdsCPMJJakuIFrCnM886nVgFze49rA3NlFTzrAskmCBVTb14mahe8l6HTR2HY8DbJpU
 WT3ucrD9hf+fbhMUoUwoq4OMg+sK6AlEVnLi7V8DEt0WGhVaTIJ6xF2RF/wa8OPyDgTk
 AG+Q==
X-Gm-Message-State: APjAAAU6V5211WV+Y+wbhkpGZ4Z8oGEUF287nrs4IgqsEvuqkKafX2DM
 tqQrGPb63IkfnjVnfkmpmCzY9vNBny/w39nMRQk/rSwR
X-Google-Smtp-Source: APXvYqwPIMsEubRx0/rYKJYcQcwcRMQlQo8j0Phs6P4RlhLNDbY1F8UhJXEJhWKzGXu+uFR1fqh6lengu5NIN4Mh1tg=
X-Received: by 2002:a67:fa08:: with SMTP id i8mr22525184vsq.140.1560346505256; 
 Wed, 12 Jun 2019 06:35:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190606222751.32567-1-daniel.vetter@ffwll.ch>
 <20190606222751.32567-3-daniel.vetter@ffwll.ch>
In-Reply-To: <20190606222751.32567-3-daniel.vetter@ffwll.ch>
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Date: Wed, 12 Jun 2019 10:34:55 -0300
Message-ID: <CADKXj+4HnVEoK7_RVVeicSgxgKe88zTG0HAUR-z1NJdtQs1i4g@mail.gmail.com>
Subject: Re: [PATCH 02/10] drm/vkms: Use spin_lock_irq in process context
To: Daniel Vetter <daniel.vetter@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=x2GsrM5xsH0GoRlOOAET1vp5rVqgxhde20w9n7K4PBc=;
 b=ClUhwseWKkQCbs7de30jXgOcf+6XM/mbt5S7adFKCAWNwXAO1aTGw0ekuppWCMtWvs
 7Kcgq08PN9b5xvAsvsu6o6BbFWSoI7mIuDDtk0dPiIkRhGtSg4F6abVhd4p3irIqJSD5
 OmSfoYuFCkv5RKAaG2nWrHobvIaPGu6FKsGuwUWAaxKtmnpF0H0CCdXLXhjqwMydblRH
 tifhJY6D59JHYNOxxZwbQViB2RCBEk0fpngKrh2Ok42xbr6OnDmJH3msdALOSxpmULUa
 zkxCS+qkaRc+QRbhJ4FS+A2tE5L1Ym5i9BxQOB+6w0YLxF7Bfb/3lecijUz83CI+vVr7
 ztDQ==
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
Cc: Shayenne Moura <shayenneluzmoura@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gNiwgMjAxOSBhdCA3OjI4IFBNIERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAZmZ3bGwuY2g+IHdyb3RlOgo+Cj4gVGhlIHdvcmtlciBpcyBhbHdheXMgaW4gcHJvY2VzcyBj
b250ZXh0LCBubyBuZWVkIGZvciB0aGUgX2lycXNhZmUKPiB2ZXJzaW9uLiBTYW1lIGZvciB0aGUg
c2V0X3NvdXJjZSBjYWxsYmFjaywgdGhhdCdzIG9ubHkgY2FsbGVkIGZyb20gdGhlCj4gZGVidWdm
cyBoYW5kbGVyIGluIGEgc3lzY2FsbC4KPgo+IENjOiBTaGF5ZW5uZSBNb3VyYSA8c2hheWVubmVs
dXptb3VyYUBnbWFpbC5jb20+Cj4gQ2M6IFJvZHJpZ28gU2lxdWVpcmEgPHJvZHJpZ29zaXF1ZWly
YW1lbG9AZ21haWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52
ZXR0ZXJAaW50ZWwuY29tPgo+IENjOiBIYW5lZW4gTW9oYW1tZWQgPGhhbW9oYW1tZWQuc2FAZ21h
aWwuY29tPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gLS0tCj4gIGRy
aXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfY3JjLmMgfCAxMCArKysrLS0tLS0tCj4gIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19jcmMuYyBiL2RyaXZlcnMvZ3B1L2RybS92a21zL3Zr
bXNfY3JjLmMKPiBpbmRleCA2NjYwM2RhNjM0ZmUuLjg4M2UzNmZlN2I2ZSAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2NyYy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3ZrbXMvdmttc19jcmMuYwo+IEBAIC0xNjcsMTYgKzE2NywxNSBAQCB2b2lkIHZrbXNfY3JjX3dv
cmtfaGFuZGxlKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKPiAgICAgICAgIHUzMiBjcmMzMiA9
IDA7Cj4gICAgICAgICB1NjQgZnJhbWVfc3RhcnQsIGZyYW1lX2VuZDsKPiAgICAgICAgIGJvb2wg
Y3JjX3BlbmRpbmc7Cj4gLSAgICAgICB1bnNpZ25lZCBsb25nIGZsYWdzOwo+Cj4gLSAgICAgICBz
cGluX2xvY2tfaXJxc2F2ZSgmb3V0LT5zdGF0ZV9sb2NrLCBmbGFncyk7Cj4gKyAgICAgICBzcGlu
X2xvY2tfaXJxKCZvdXQtPnN0YXRlX2xvY2spOwo+ICAgICAgICAgZnJhbWVfc3RhcnQgPSBjcnRj
X3N0YXRlLT5mcmFtZV9zdGFydDsKPiAgICAgICAgIGZyYW1lX2VuZCA9IGNydGNfc3RhdGUtPmZy
YW1lX2VuZDsKPiAgICAgICAgIGNyY19wZW5kaW5nID0gY3J0Y19zdGF0ZS0+Y3JjX3BlbmRpbmc7
Cj4gICAgICAgICBjcnRjX3N0YXRlLT5mcmFtZV9zdGFydCA9IDA7Cj4gICAgICAgICBjcnRjX3N0
YXRlLT5mcmFtZV9lbmQgPSAwOwo+ICAgICAgICAgY3J0Y19zdGF0ZS0+Y3JjX3BlbmRpbmcgPSBm
YWxzZTsKPiAtICAgICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJm91dC0+c3RhdGVfbG9jaywg
ZmxhZ3MpOwo+ICsgICAgICAgc3Bpbl91bmxvY2tfaXJxKCZvdXQtPnN0YXRlX2xvY2spOwo+Cj4g
ICAgICAgICAvKgo+ICAgICAgICAgICogV2UgcmFjZWQgd2l0aCB0aGUgdmJsYW5rIGhydGltZXIg
YW5kIHByZXZpb3VzIHdvcmsgYWxyZWFkeSBjb21wdXRlZAo+IEBAIC0yNDYsNyArMjQ1LDYgQEAg
aW50IHZrbXNfc2V0X2NyY19zb3VyY2Uoc3RydWN0IGRybV9jcnRjICpjcnRjLCBjb25zdCBjaGFy
ICpzcmNfbmFtZSkKPiAgewo+ICAgICAgICAgc3RydWN0IHZrbXNfb3V0cHV0ICpvdXQgPSBkcm1f
Y3J0Y190b192a21zX291dHB1dChjcnRjKTsKPiAgICAgICAgIGJvb2wgZW5hYmxlZCA9IGZhbHNl
Owo+IC0gICAgICAgdW5zaWduZWQgbG9uZyBmbGFnczsKPiAgICAgICAgIGludCByZXQgPSAwOwo+
Cj4gICAgICAgICByZXQgPSB2a21zX2NyY19wYXJzZV9zb3VyY2Uoc3JjX25hbWUsICZlbmFibGVk
KTsKPiBAQCAtMjU0LDkgKzI1Miw5IEBAIGludCB2a21zX3NldF9jcmNfc291cmNlKHN0cnVjdCBk
cm1fY3J0YyAqY3J0YywgY29uc3QgY2hhciAqc3JjX25hbWUpCj4gICAgICAgICAvKiBtYWtlIHN1
cmUgbm90aGluZyBpcyBzY2hlZHVsZWQgb24gY3J0YyB3b3JrcSAqLwo+ICAgICAgICAgZmx1c2hf
d29ya3F1ZXVlKG91dC0+Y3JjX3dvcmtxKTsKPgo+IC0gICAgICAgc3Bpbl9sb2NrX2lycXNhdmUo
Jm91dC0+bG9jaywgZmxhZ3MpOwo+ICsgICAgICAgc3Bpbl9sb2NrX2lycSgmb3V0LT5sb2NrKTsK
PiAgICAgICAgIG91dC0+Y3JjX2VuYWJsZWQgPSBlbmFibGVkOwo+IC0gICAgICAgc3Bpbl91bmxv
Y2tfaXJxcmVzdG9yZSgmb3V0LT5sb2NrLCBmbGFncyk7CgpJIHdhcyB3b25kZXJpbmcgaWYgd2Ug
Y291bGQgdXNlIGF0b21pY190IGZvciBjcmNfZW5hYmxlZCBhbmQgYXZvaWQKdGhpcyBzb3J0IG9m
IGxvY2suIEkgZGlkIG5vdCB0cnkgdG8gY2hhbmdlIHRoZSBkYXRhIHR5cGU7IHRoaXMgaXMganVz
dAphbiBpZGVhLgoKUmV2aWV3ZWQtYnk6IFJvZHJpZ28gU2lxdWVpcmEgPHJvZHJpZ29zaXF1ZWly
YW1lbG9AZ21haWwuY29tPgpUZXN0ZWQtYnk6IFJvZHJpZ28gU2lxdWVpcmEgPHJvZHJpZ29zaXF1
ZWlyYW1lbG9AZ21haWwuY29tPgoKPiArICAgICAgIHNwaW5fdW5sb2NrX2lycSgmb3V0LT5sb2Nr
KTsKPgo+ICAgICAgICAgcmV0dXJuIHJldDsKPiAgfQo+IC0tCj4gMi4yMC4xCj4KCgotLSAKClJv
ZHJpZ28gU2lxdWVpcmEKaHR0cHM6Ly9zaXF1ZWlyYS50ZWNoCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
