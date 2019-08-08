Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 645F887392
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 10:00:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D95A6E1D7;
	Fri,  9 Aug 2019 08:00:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57A5E6E8B9
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 20:14:20 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id l21so44618914pgm.3
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Aug 2019 13:14:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z0p3Ly8nHWKqpQa5LOcPd33JTDmAKsWV1WiLmHuKK/c=;
 b=SbC3oui6lOGHgpsMFt35YZIRect4vDfMew4HFqamoetLZj3FIWduNNpZdE1T5YRA+H
 tBGfLQRUYfESW1O8pIlizxqn8sD/Ch3cBk5ldq9QWLGuYcR4uoraT6ELkCYRVjbPz3DU
 7i+XkwbgtnRGiROoQbdb0UXCUUSbOLR6gfTjjLZiZkZJMjd5L6IIYYW5zaFNeF/0Os62
 seK/lWkFeDrHHWoynUGiQ1iOybS78ybG3aK2SheRIEWvORX97g56bK5IP2OYocL4dk1W
 wk4bkVTiywEt5VQZn3SX4bIrHaUWnhCVnPigVsAF7IEC+VqNFQC4aavYNnllH8bm95J0
 0dIA==
X-Gm-Message-State: APjAAAWIEXuLHKP8VCrOTOfTbG+3d2Wp642dmXXdwn8U1KQun7gcJxKN
 +sl0kK02+j+77QQ90DhZgz7O4NjbXL5EKD1xwk8exw==
X-Google-Smtp-Source: APXvYqwMM3bTe1a8X7/bk1WvabwkVJjsrAV6LWJJGuK6xqAGZEZTlfxaSe6xG9A6Drpo6Z7vi0QRRwKq9aUYg1i5KRg=
X-Received: by 2002:a62:cec4:: with SMTP id y187mr17258563pfg.84.1565295259452; 
 Thu, 08 Aug 2019 13:14:19 -0700 (PDT)
MIME-Version: 1.0
References: <51a4155c5bc2ca847a9cbe85c1c11918bb193141.1564086017.git.jpoimboe@redhat.com>
 <alpine.DEB.2.21.1907252355150.1791@nanos.tec.linutronix.de>
 <156416793450.30723.5556760526480191131@skylake-alporthouse-com>
 <alpine.DEB.2.21.1907262116530.1791@nanos.tec.linutronix.de>
 <156416944205.21451.12269136304831943624@skylake-alporthouse-com>
 <CA+icZUXwBFS-6e+Qp4e3PhnRzEHvwdzWtS6OfVsgy85R5YNGOg@mail.gmail.com>
 <CA+icZUWA6e0Zsio6sthRUC=Ehb2-mw_9U76UnvwGc_tOnOqt7w@mail.gmail.com>
 <20190806125931.oqeqateyzqikusku@treble>
In-Reply-To: <20190806125931.oqeqateyzqikusku@treble>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 8 Aug 2019 13:14:07 -0700
Message-ID: <CAKwvOd=wa-XPCpoLQoQJH8Me7S=fXLfog0XsiKyFZKu8ojW_UQ@mail.gmail.com>
Subject: Re: [PATCH] drm/i915: Remove redundant user_access_end() from
 __copy_from_user() error path
To: Josh Poimboeuf <jpoimboe@redhat.com>, Thomas Gleixner <tglx@linutronix.de>
X-Mailman-Approved-At: Fri, 09 Aug 2019 08:00:16 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=z0p3Ly8nHWKqpQa5LOcPd33JTDmAKsWV1WiLmHuKK/c=;
 b=O6OSZhcXBZgZyNdlY3s601J/EcxhsFbK3UKxJbI8Q1ZH0FannIN7EVr4dW9DOOTAlJ
 +xYvBUx+rlrd+yHDDR+bw570HAkKPGVIO7Q4GE8HhvOtce/kyIWwsFsmJChnRbaM6jkl
 tRUp230O99CEXKGfY5vZdH1K9leNz5fbDziAGrHBmVwqROY8mo+D5064GSUDCw0h0BvR
 eDLhGZQwASVBZpnnjsyQ6cZwizRK2ao3vyBm+oEj6w8wgZkwqn6kBjm5rT72qv9noeBI
 7vjn5PVeN4gpKEK24UIwsAFsJBTma3KMC5vLd6qSh2q0a9XMjqpyaPKEMvROGYPKl1Il
 kw0A==
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
Cc: Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>,
 intel-gfx@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sedat Dilek <sedat.dilek@gmail.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgNiwgMjAxOSBhdCA1OjU5IEFNIEpvc2ggUG9pbWJvZXVmIDxqcG9pbWJvZUBy
ZWRoYXQuY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgQXVnIDA1LCAyMDE5IGF0IDA5OjI5OjUzUE0g
KzAyMDAsIFNlZGF0IERpbGVrIHdyb3RlOgo+ID4gT24gV2VkLCBKdWwgMzEsIDIwMTkgYXQgMjoy
NSBQTSBTZWRhdCBEaWxlayA8c2VkYXQuZGlsZWtAZ21haWwuY29tPiB3cm90ZToKPiA+ID4KPiA+
ID4gT24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgOTozMCBQTSBDaHJpcyBXaWxzb24gPGNocmlzQGNo
cmlzLXdpbHNvbi5jby51az4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBRdW90aW5nIFRob21hcyBH
bGVpeG5lciAoMjAxOS0wNy0yNiAyMDoxODozMikKPiA+ID4gPiA+IE9uIEZyaSwgMjYgSnVsIDIw
MTksIENocmlzIFdpbHNvbiB3cm90ZToKPiA+ID4gPiA+ID4gUXVvdGluZyBUaG9tYXMgR2xlaXhu
ZXIgKDIwMTktMDctMjUgMjI6NTU6NDUpCj4gPiA+ID4gPiA+ID4gT24gVGh1LCAyNSBKdWwgMjAx
OSwgSm9zaCBQb2ltYm9ldWYgd3JvdGU6Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+IE9i
anRvb2wgcmVwb3J0czoKPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiAgIGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9leGVjYnVmZmVyLm86IHdhcm5pbmc6IG9ianRvb2w6
IC5hbHRpbnN0cl9yZXBsYWNlbWVudCsweDM2OiByZWR1bmRhbnQgVUFDQ0VTUyBkaXNhYmxlCj4g
PiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gX19jb3B5X2Zyb21fdXNlcigpIGFscmVhZHkg
ZG9lcyBib3RoIFNUQUMgYW5kIENMQUMsIHNvIHRoZQo+ID4gPiA+ID4gPiA+ID4gdXNlcl9hY2Nl
c3NfZW5kKCkgaW4gaXRzIGVycm9yIHBhdGggYWRkcyBhbiBleHRyYSB1bm5lY2Vzc2FyeSBDTEFD
Lgo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+IEZpeGVzOiAwYjJjOGY4YjZiMGMgKCJp
OTE1OiBmaXggbWlzc2luZyB1c2VyX2FjY2Vzc19lbmQoKSBpbiBwYWdlIGZhdWx0IGV4Y2VwdGlv
biBjYXNlIikKPiA+ID4gPiA+ID4gPiA+IFJlcG9ydGVkLWJ5OiBUaG9tYXMgR2xlaXhuZXIgPHRn
bHhAbGludXRyb25peC5kZT4KPiA+ID4gPiA+ID4gPiA+IFJlcG9ydGVkLWJ5OiBTZWRhdCBEaWxl
ayA8c2VkYXQuZGlsZWtAZ21haWwuY29tPgo+ID4gPiA+ID4gPiA+ID4gQWNrZWQtYnk6IFBldGVy
IFppamxzdHJhIChJbnRlbCkgPHBldGVyekBpbmZyYWRlYWQub3JnPgo+ID4gPiA+ID4gPiA+ID4g
VGVzdGVkLWJ5OiBOaWNrIERlc2F1bG5pZXJzIDxuZGVzYXVsbmllcnNAZ29vZ2xlLmNvbT4KPiA+
ID4gPiA+ID4gPiA+IFRlc3RlZC1ieTogU2VkYXQgRGlsZWsgPHNlZGF0LmRpbGVrQGdtYWlsLmNv
bT4KPiA+ID4gPiA+ID4gPiA+IExpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9DbGFuZ0J1aWx0TGlu
dXgvbGludXgvaXNzdWVzLzYxNwo+ID4gPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogSm9zaCBQ
b2ltYm9ldWYgPGpwb2ltYm9lQHJlZGhhdC5jb20+Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4g
PiBSZXZpZXdlZC1ieTogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+Cj4gPiA+
ID4gPiA+Cj4gPiA+ID4gPiA+IFdoaWNoIHRyZWUgZG8geW91IHBsYW4gdG8gYXBwbHkgaXQgdG8/
IEkgY2FuIHB1dCBpbiBkcm0taW50ZWwsIGFuZCB3aXRoCj4gPiA+ID4gPiA+IHRoZSBmaXhlcyB0
YWcgaXQgd2lsbCBwZXJjb2xhdGUgdGhyb3VnaCB0byA1LjMgYW5kIGJleW9uZCwgYnV0IGlmIHlv
dQo+ID4gPiA+ID4gPiB3YW50IHRvIGFwcGx5IGl0IGRpcmVjdGx5IHRvIHNxdWFzaCB0aGUgYnVp
bGQgd2FybmluZ3MsIGZlZWwgZnJlZS4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBJdCB3b3VsZCBiZSBu
aWNlIHRvIGdldCBpdCBpbnRvIDUuMy4gSSBjYW4gcm91dGUgaXQgbGludXh3YXJkcyBpZiB5b3Ug
Z2l2ZQo+ID4gPiA+ID4gYW4gQWNrZWQtYnksIGJ1dCBJJ20gaGFwcHkgdG8gaGFuZCBpdCB0byB5
b3UgOikKPiA+ID4gPgo+ID4gPiA+IEFja2VkLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlz
LXdpbHNvbi5jby51az4KPiA+ID4KPiA+ID4gVGhvbWFzIGRpZCB5b3UgdGFrZSB0aGlzIHRocm91
Z2ggdGlwIHRyZWUgYWZ0ZXIgQ2hyaXMnIEFDSz8KPiA+ID4KPiA+Cj4gPiBIaSwKPiA+Cj4gPiBH
ZW50bGUgcGluZy4uLgo+ID4gVGhvbWFzIGFuZCBDaHJpczogV2lsbCBzb21lb25lIG9mIHlvdSBw
aWNrIHRoaXMgdXA/Cj4gPiBBcyAib2JqdG9vbDogSW1wcm92ZSBVQUNDRVNTIGNvdmVyYWdlIiBb
MV0gd2VudCB0cm91Z2ggdGlwIHRyZWUgSQo+ID4gaGlnaGx5IGFwcHJlY2lhdGUgdG8gZG8gc28g
d2l0aCB0aGlzIG9uZS4KPgo+IEkgdGhpbmsgVGhvbWFzIGhhcyBnb25lIG9uIGhvbGlkYXksIHNv
IGhvcGVmdWxseSBDaHJpcyBjYW4gcGljayBpdCB1cAo+IGFmdGVyIGFsbC4KCnRnbHgganVzdCBw
aWNrZWQgdXAgMiBvdGhlciBwYXRjaGVzIG9mIG1pbmUsIGJ1bXBpbmcganVzdCBpbiBjYXNlIGhl
J3MKbm90IHBpY2tpbmcgdXAgcGF0Y2hlcyB3aGlsZSBvbiB2YWNhdGlvbi4gOykKLS0gClRoYW5r
cywKfk5pY2sgRGVzYXVsbmllcnMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
