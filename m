Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 259DA2538A
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 17:09:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04E9989452;
	Tue, 21 May 2019 15:09:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FEC989452
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 15:09:44 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id w33so29875881edb.10
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 08:09:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=kGFA98E8YUTXSd1vlNUtmMd7zWl23WEkLkg7eY2TneA=;
 b=BJgx++DcJAEnG20tE5k8A1ulW8cpXI36auN/zIZwDO61EhE8FuAlqwcUC7RwVw4Zgq
 URzEdzqlGQlgcrmpVsOIMUMl/yYjE8e2UPz6v2pioD1Tye4sUeP9AEALCQJlid+NkttQ
 fMYrOiCuG+ryOTBWnUvwaCvMxQj4LZKKPZO12P3ZqzzyHHbQeXw94Fs0i5tzDP0z0MHC
 2Y/nuQTFp8CbKj4EvGlXqHipG9LyZP7TymAnIROR7+y0HhCbO3L+rmaAklFWcvZV7Hfu
 JdgzDjThke1/MtZI9/dhLSDgX00InGR7Cei8K7ZEpvdQ/BBvi9mmwWvq839q4efAYOW7
 dZbg==
X-Gm-Message-State: APjAAAUC8QMrYbjdYWduMRUKnHkA5dC6JYW/fpm40lIv2PZmPQ1GhioA
 2KGURgwFTjmazhMf6y2WR+gfuw==
X-Google-Smtp-Source: APXvYqxBhBhjiZm6DIIVQclLcEYKPK25uT4p++L6X7xVUHvTJFqOSCuMzHWwvHIYKInLQrZSLpB5Zg==
X-Received: by 2002:a17:906:1545:: with SMTP id
 c5mr65212434ejd.135.1558451383140; 
 Tue, 21 May 2019 08:09:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id v2sm6280163eds.69.2019.05.21.08.09.41
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 21 May 2019 08:09:42 -0700 (PDT)
Date: Tue, 21 May 2019 17:09:39 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 10/33] fbcon: call fbcon_fb_(un)registered directly
Message-ID: <20190521150939.GQ21222@phenom.ffwll.local>
Mail-Followup-To: Thomas Zimmermann <tzimmermann@suse.de>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Yisheng Xie <ysxie@foxmail.com>, Peter Rosin <peda@axentia.se>,
 =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Mikulas Patocka <mpatocka@redhat.com>, linux-fbdev@vger.kernel.org
References: <20190520082216.26273-1-daniel.vetter@ffwll.ch>
 <20190520082216.26273-11-daniel.vetter@ffwll.ch>
 <423eba4b-15e1-f10b-ae2d-855b8a585688@suse.de>
 <8aecc0d8-83a3-8144-a266-441a5c1d5db5@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8aecc0d8-83a3-8144-a266-441a5c1d5db5@suse.de>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=kGFA98E8YUTXSd1vlNUtmMd7zWl23WEkLkg7eY2TneA=;
 b=h1nN6R3DwWW3hI2z4yWrg3b88MlSB3Sz1499ALECkxeB07XI3zHEBAfxyBAOAKpZyh
 ni58vX4bzcyK4Tl2UsniaPoSgsZ4HnhkTAi5IWMz7lhnWJWjI9uLkK9nOnpL65yX5eHq
 8ZEyiszfX5wwtsgQcu2IkWyr6Vm9K/+1pmV0c=
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Yisheng Xie <ysxie@foxmail.com>, Hans de Goede <hdegoede@redhat.com>,
 Mikulas Patocka <mpatocka@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMjAsIDIwMTkgYXQgMTA6Mzc6NTNBTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gSGkKPiAKPiBBbSAyMC4wNS4xOSB1bSAxMDozMyBzY2hyaWViIFRob21hcyBa
aW1tZXJtYW5uOgo+ID4gSGkKPiA+IAo+ID4gQW0gMjAuMDUuMTkgdW0gMTA6MjEgc2NocmllYiBE
YW5pZWwgVmV0dGVyOgo+ID4gLi4uCj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJk
ZXYvY29yZS9mYm1lbS5jIGIvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZibWVtLmMKPiA+PiBp
bmRleCBmYzNkMzRhOGVhNWIuLmFlMmRiMzFlZWJhNyAxMDA2NDQKPiA+PiAtLS0gYS9kcml2ZXJz
L3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYwo+ID4+ICsrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYv
Y29yZS9mYm1lbS5jCj4gPj4gQEAgLTE2NjAsNyArMTY2MCw2IEBAIE1PRFVMRV9QQVJNX0RFU0Mo
bG9ja2xlc3NfcmVnaXN0ZXJfZmIsCj4gPj4gIHN0YXRpYyBpbnQgZG9fcmVnaXN0ZXJfZnJhbWVi
dWZmZXIoc3RydWN0IGZiX2luZm8gKmZiX2luZm8pCj4gPj4gIHsKPiA+PiAgCWludCBpLCByZXQ7
Cj4gPj4gLQlzdHJ1Y3QgZmJfZXZlbnQgZXZlbnQ7Cj4gPj4gIAlzdHJ1Y3QgZmJfdmlkZW9tb2Rl
IG1vZGU7Cj4gPj4gIAo+ID4+ICAJaWYgKGZiX2NoZWNrX2ZvcmVpZ25uZXNzKGZiX2luZm8pKQo+
ID4+IEBAIC0xNzIzLDcgKzE3MjIsNiBAQCBzdGF0aWMgaW50IGRvX3JlZ2lzdGVyX2ZyYW1lYnVm
ZmVyKHN0cnVjdCBmYl9pbmZvICpmYl9pbmZvKQo+ID4+ICAJZmJfYWRkX3ZpZGVvbW9kZSgmbW9k
ZSwgJmZiX2luZm8tPm1vZGVsaXN0KTsKPiA+PiAgCXJlZ2lzdGVyZWRfZmJbaV0gPSBmYl9pbmZv
Owo+ID4+ICAKPiA+PiAtCWV2ZW50LmluZm8gPSBmYl9pbmZvOwo+ID4+ICAJaWYgKCFsb2NrbGVz
c19yZWdpc3Rlcl9mYikKPiA+PiAgCQljb25zb2xlX2xvY2soKTsKPiA+PiAgCWVsc2UKPiA+PiBA
QCAtMTczMiw5ICsxNzMwLDggQEAgc3RhdGljIGludCBkb19yZWdpc3Rlcl9mcmFtZWJ1ZmZlcihz
dHJ1Y3QgZmJfaW5mbyAqZmJfaW5mbykKPiA+PiAgCQlyZXQgPSAtRU5PREVWOwo+ID4+ICAJCWdv
dG8gdW5sb2NrX2NvbnNvbGU7Cj4gPj4gIAl9Cj4gPj4gLQlyZXQgPSAwOwo+ID4+ICAKPiA+PiAt
CWZiX25vdGlmaWVyX2NhbGxfY2hhaW4oRkJfRVZFTlRfRkJfUkVHSVNURVJFRCwgJmV2ZW50KTsK
PiA+PiArCXJldCA9IGZiY29uX2ZiX3JlZ2lzdGVyZWQoZmJfaW5mbyk7Cj4gPiAKPiA+IFdoYXQg
YWJvdXQgYmFja2xpZ2h0IGRyaXZlcnM/IFsxXSBBcHBhcmVudGx5IHRoZXNlIGFsc28gdXNlIHRo
ZQo+ID4gbm90aWZpZXJzLiBbMl0gRnJvbSBteSB1bmRlcnN0YW5kaW5nLCBiYWNrbGlnaHQgZHJp
dmVycyB3b3VsZCBzdG9wCj4gPiB3b3JraW5nIHdpdGggdGhpcyBjaGFuZ2UuCj4gCj4gSSBqdXN0
IHNhdyB0aGF0IGJhY2tsaWdodCBkcml2ZXJzIG9ubHkgY2FyZSBhYm91dCBibGFua2luZyBhbmQK
PiB1bmJsYW5raW5nLiBOZXZlciBtaW5kIHRoZW4uCgpJIGRpZCBzY3JldyB0aGlzIHVwIGZvciBv
bmUgZXZlbnQgZm9yIHRoZSBtb2RlIGNoYW5nZXMuIEJ1dCBzaG91bGQgYmUKZml4ZWQgaW4gdGhl
IG5leHQgc2VyaWVzLgoKSSBhbHNvIGFkZGVkIGEgcGF0Y2ggdG8gc2ltcGxpZnkgdGhlIGJhY2ts
aWdodC9sY2Qgbm90aWZpZXIsIHNpbmNlIGl0CmRvZXNuJ3QgbmVlZCB0byBmaWx0ZXIgZXZlbnRz
IGFueW1vcmUgYWZ0ZXIgdGhpcyBzZXJpZXMgLSB0aGUgb25seSBldmVudHMKbGVmdCBhcmUgdGhl
IG9uZXMgYmFja2xpZ2h0IGNhcmVzIGFib3V0LgoKQ2hlZXJzLCBEYW5pZWwKCj4gCj4gQmVzdCBy
ZWdhcmRzCj4gVGhvbWFzCj4gCj4gPiAKPiA+IEJlc3QgcmVnYXJkcwo+ID4gVGhvbWFzCj4gPiAK
PiA+IFsxXQo+ID4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9n
aXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvZHJpdmVycy92aWRlby9iYWNrbGlnaHQKPiA+IFsy
XQo+ID4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9y
dmFsZHMvbGludXguZ2l0L3RyZWUvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvYmFja2xpZ2h0LmMj
bjQwCj4gPiAKPiA+PiAgCXVubG9ja19mYl9pbmZvKGZiX2luZm8pOwo+ID4+ICB1bmxvY2tfY29u
c29sZToKPiA+PiAgCWlmICghbG9ja2xlc3NfcmVnaXN0ZXJfZmIpCj4gPj4gQEAgLTE3NzEsNyAr
MTc2OCw2IEBAIHN0YXRpYyBpbnQgX191bmxpbmtfZnJhbWVidWZmZXIoc3RydWN0IGZiX2luZm8g
KmZiX2luZm8pOwo+ID4+ICAKPiA+PiAgc3RhdGljIGludCBkb191bnJlZ2lzdGVyX2ZyYW1lYnVm
ZmVyKHN0cnVjdCBmYl9pbmZvICpmYl9pbmZvKQo+ID4+ICB7Cj4gPj4gLQlzdHJ1Y3QgZmJfZXZl
bnQgZXZlbnQ7Cj4gPj4gIAlpbnQgcmV0Owo+ID4+ICAKPiA+PiAgCXJldCA9IHVuYmluZF9jb25z
b2xlKGZiX2luZm8pOwo+ID4+IEBAIC0xNzg5LDkgKzE3ODUsOCBAQCBzdGF0aWMgaW50IGRvX3Vu
cmVnaXN0ZXJfZnJhbWVidWZmZXIoc3RydWN0IGZiX2luZm8gKmZiX2luZm8pCj4gPj4gIAlyZWdp
c3RlcmVkX2ZiW2ZiX2luZm8tPm5vZGVdID0gTlVMTDsKPiA+PiAgCW51bV9yZWdpc3RlcmVkX2Zi
LS07Cj4gPj4gIAlmYl9jbGVhbnVwX2RldmljZShmYl9pbmZvKTsKPiA+PiAtCWV2ZW50LmluZm8g
PSBmYl9pbmZvOwo+ID4+ICAJY29uc29sZV9sb2NrKCk7Cj4gPj4gLQlmYl9ub3RpZmllcl9jYWxs
X2NoYWluKEZCX0VWRU5UX0ZCX1VOUkVHSVNURVJFRCwgJmV2ZW50KTsKPiA+PiArCWZiY29uX2Zi
X3VucmVnaXN0ZXJlZChmYl9pbmZvKTsKPiA+PiAgCWNvbnNvbGVfdW5sb2NrKCk7Cj4gPj4gIAo+
ID4+ICAJLyogdGhpcyBtYXkgZnJlZSBmYiBpbmZvICovCj4gPj4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvbGludXgvZmIuaCBiL2luY2x1ZGUvbGludXgvZmIuaAo+ID4+IGluZGV4IGY1MmVmMGFkNjc4
MS4uNzAxYWJhZjc5Yzg3IDEwMDY0NAo+ID4+IC0tLSBhL2luY2x1ZGUvbGludXgvZmIuaAo+ID4+
ICsrKyBiL2luY2x1ZGUvbGludXgvZmIuaAo+ID4+IEBAIC0xMzYsMTAgKzEzNiw2IEBAIHN0cnVj
dCBmYl9jdXJzb3JfdXNlciB7Cj4gPj4gICNkZWZpbmUgRkJfRVZFTlRfUkVTVU1FCQkJMHgwMwo+
ID4+ICAvKiAgICAgIEFuIGVudHJ5IGZyb20gdGhlIG1vZGVsaXN0IHdhcyByZW1vdmVkICovCj4g
Pj4gICNkZWZpbmUgRkJfRVZFTlRfTU9ERV9ERUxFVEUgICAgICAgICAgICAweDA0Cj4gPj4gLS8q
ICAgICAgQSBkcml2ZXIgcmVnaXN0ZXJlZCBpdHNlbGYgKi8KPiA+PiAtI2RlZmluZSBGQl9FVkVO
VF9GQl9SRUdJU1RFUkVEICAgICAgICAgIDB4MDUKPiA+PiAtLyogICAgICBBIGRyaXZlciB1bnJl
Z2lzdGVyZWQgaXRzZWxmICovCj4gPj4gLSNkZWZpbmUgRkJfRVZFTlRfRkJfVU5SRUdJU1RFUkVE
ICAgICAgICAweDA2Cj4gPj4gIC8qICAgICAgQ09OU09MRS1TUEVDSUZJQzogZ2V0IGNvbnNvbGUg
dG8gZnJhbWVidWZmZXIgbWFwcGluZyAqLwo+ID4+ICAjZGVmaW5lIEZCX0VWRU5UX0dFVF9DT05T
T0xFX01BUCAgICAgICAgMHgwNwo+ID4+ICAvKiAgICAgIENPTlNPTEUtU1BFQ0lGSUM6IHNldCBj
b25zb2xlIHRvIGZyYW1lYnVmZmVyIG1hcHBpbmcgKi8KPiA+PiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9saW51eC9mYmNvbi5oIGIvaW5jbHVkZS9saW51eC9mYmNvbi5oCj4gPj4gaW5kZXggZjY4YTdk
YjE0MTY1Li45NGE3MWU5ZTEyNTcgMTAwNjQ0Cj4gPj4gLS0tIGEvaW5jbHVkZS9saW51eC9mYmNv
bi5oCj4gPj4gKysrIGIvaW5jbHVkZS9saW51eC9mYmNvbi5oCj4gPj4gQEAgLTQsOSArNCwxMyBA
QAo+ID4+ICAjaWZkZWYgQ09ORklHX0ZSQU1FQlVGRkVSX0NPTlNPTEUKPiA+PiAgdm9pZCBfX2lu
aXQgZmJfY29uc29sZV9pbml0KHZvaWQpOwo+ID4+ICB2b2lkIF9fZXhpdCBmYl9jb25zb2xlX2V4
aXQodm9pZCk7Cj4gPj4gK2ludCBmYmNvbl9mYl9yZWdpc3RlcmVkKHN0cnVjdCBmYl9pbmZvICpp
bmZvKTsKPiA+PiArdm9pZCBmYmNvbl9mYl91bnJlZ2lzdGVyZWQoc3RydWN0IGZiX2luZm8gKmlu
Zm8pOwo+ID4+ICAjZWxzZQo+ID4+ICBzdGF0aWMgaW5saW5lIHZvaWQgZmJfY29uc29sZV9pbml0
KHZvaWQpIHt9Cj4gPj4gIHN0YXRpYyBpbmxpbmUgdm9pZCBmYl9jb25zb2xlX2V4aXQodm9pZCkg
e30KPiA+PiArc3RhdGljIGlubGluZSBpbnQgZmJjb25fZmJfcmVnaXN0ZXJlZChzdHJ1Y3QgZmJf
aW5mbyAqaW5mbykgeyByZXR1cm4gMDsgfQo+ID4+ICtzdGF0aWMgaW5saW5lIHZvaWQgZmJjb25f
ZmJfdW5yZWdpc3RlcmVkKHN0cnVjdCBmYl9pbmZvICppbmZvKSB7fQo+ID4+ICAjZW5kaWYKPiA+
PiAgCj4gPj4gICNlbmRpZiAvKiBfTElOVVhfRkJDT05fSCAqLwo+ID4+Cj4gPiAKPiAKPiAtLSAK
PiBUaG9tYXMgWmltbWVybWFubgo+IEdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXIKPiBTVVNFIExp
bnV4IEdtYkgsIE1heGZlbGRzdHJhc3NlIDUsIDkwNDA5IE51ZXJuYmVyZywgR2VybWFueQo+IEdG
OiBGZWxpeCBJbWVuZMO2cmZmZXIsIE1hcnkgSGlnZ2lucywgU3JpIFJhc2lhaAo+IEhSQiAyMTI4
NCAoQUcgTsO8cm5iZXJnKQo+IAoKCgoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5l
ZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
