Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A6D1A9249
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 07:16:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A215D89948;
	Wed, 15 Apr 2020 05:16:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02CA26E843
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 05:16:19 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id i22so2160014otp.12
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 22:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UETgjLgGy1I8D/vK9hQsvwfCTgzWUx9NFafEAQacD6E=;
 b=F7vBBsb6EuShtNKrJqxknW9giKiJqe3/N8z/mYG48/aDXLbHF654CqZdbRpMn/wTGk
 ejJd/XN9ME8sUsM+DYAMJSN6J6gxmdghDCpc08SJOmBnSltQS/zl4hn7obWjD9lPN+x2
 cP4A0M5fBhyeKwlhk7aGqZejoaNgOX+6yHk6jpmCCUjRFI/OmbY0paA1ytezd6cvDw0F
 ukkGdEX2xV2p649BOCB92WZAKdRP8FxBnzzD16p/dLzZSf3tby53qr79TCn95taktjUM
 xj65E5akugViYZHtL83yL6vTDgQtLtz0xP6SW54QMximpjR33+0LPxCDniRUx35cfXz9
 WIwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UETgjLgGy1I8D/vK9hQsvwfCTgzWUx9NFafEAQacD6E=;
 b=bUbv523yItbNevXPI8pdcMiI9kwg5ynq2kyRSkqhKlAbPoDiz7R70HuWApp5UqTnRI
 toWnKy5ovRqY6tdQLs8WT3jLp49DQ7BZ1EvojbAelGqBe/rZwMGXZEfoFWxwZtRD9lCr
 0k7cCtmic3L7H8+5aokcuZTGkEmo4XDxoNc8N/ZFYkLEiqvH0mtvT17Xi/tojO6yMpCd
 +ljjURv8/4Z6ehnwbX31/Xzi9qyBLzDRhUPP5+bVg2mhsCqV+QW+C8VjaujNPdl3fWdA
 Xvht5navf2vIqjoTfT0/AgqJwineluTS+hPe9huPZpwvAsrUZxwPvX+sF/3qULmtDOP6
 CZYg==
X-Gm-Message-State: AGi0PuZtQ5YmWPbKbCed8s9gA1yJlxKh2V70SDDkSgiVf1g49O3RLaKQ
 U7iQUbhIz0hDkh6Bze3w0RL4AeC+Jm0Vq1sGfMZV7Q==
X-Google-Smtp-Source: APiQypIty2GFH7AT8Ct4yPfxkBQyl5Hh92NEBt4okHCUEtJD5zk9q94TPKfT/jPH6jgTg/aMTeFvV2K62fwQy8Poqnk=
X-Received: by 2002:a05:6830:22dc:: with SMTP id
 q28mr239826otc.221.1586927778029; 
 Tue, 14 Apr 2020 22:16:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200414134629.54567-1-orjan.eide@arm.com>
 <20200414141849.55654-1-orjan.eide@arm.com>
 <20200414142810.GA958163@kroah.com>
 <20200414161114.GA1949@e123356-lin.trondheim.arm.com>
In-Reply-To: <20200414161114.GA1949@e123356-lin.trondheim.arm.com>
From: John Stultz <john.stultz@linaro.org>
Date: Tue, 14 Apr 2020 22:16:06 -0700
Message-ID: <CALAqxLVM1i+Cj29h+kGfurEN9gEMwnD-9n9H1o0B4wRukmJRQw@mail.gmail.com>
Subject: Re: [PATCH] staging: android: ion: Skip sync if not mapped
To: =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>
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
Cc: driverdevel <devel@driverdev.osuosl.org>, Laura Abbott <labbott@redhat.com>,
 Todd Kjos <tkjos@android.com>, Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
 Anders Pedersen <anders.pedersen@arm.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Joel Fernandes <joel@joelfernandes.org>,
 "Darren Hart \(VMware\)" <dvhart@infradead.org>, nd <nd@arm.com>,
 Martijn Coenen <maco@android.com>, Christian Brauner <christian@brauner.io>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBcHIgMTQsIDIwMjAgYXQgOToxMSBBTSDDmHJqYW4gRWlkZSA8b3JqYW4uZWlkZUBh
cm0uY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgQXByIDE0LCAyMDIwIGF0IDA0OjI4OjEwUE0gKzAy
MDAsIEdyZWcgS3JvYWgtSGFydG1hbiB3cm90ZToKPiA+IE9uIFR1ZSwgQXByIDE0LCAyMDIwIGF0
IDA0OjE4OjQ3UE0gKzAyMDAsIO+/vXJqYW4gRWlkZSB3cm90ZToKPiA+ID4gT25seSBzeW5jIHRo
ZSBzZy1saXN0IG9mIGFuIElvbiBkbWEtYnVmIGF0dGFjaG1lbnQgd2hlbiB0aGUgYXR0YWNobWVu
dAo+ID4gPiBpcyBhY3R1YWxseSBtYXBwZWQgb24gdGhlIGRldmljZS4KPiA+ID4KPiA+ID4gZG1h
LWJ1ZnMgbWF5IGJlIHN5bmNlZCBhdCBhbnkgdGltZS4gSXQgY2FuIGJlIHJlYWNoZWQgZnJvbSB1
c2VyIHNwYWNlCj4gPiA+IHZpYSBETUFfQlVGX0lPQ1RMX1NZTkMsIHNvIHRoZXJlIGFyZSBubyBn
dWFyYW50ZWVzIGZyb20gY2FsbGVycyBvbiB3aGVuCj4gPiA+IHN5bmNzIG1heSBiZSBhdHRlbXB0
ZWQsIGFuZCBkbWFfYnVmX2VuZF9jcHVfYWNjZXNzKCkgYW5kCj4gPiA+IGRtYV9idWZfYmVnaW5f
Y3B1X2FjY2VzcygpIG1heSBub3QgYmUgcGFpcmVkLgo+ID4gPgo+ID4gPiBTaW5jZSB0aGUgc2df
bGlzdCdzIGRtYV9hZGRyZXNzIGlzbid0IHNldCB1cCB1bnRpbCB0aGUgYnVmZmVyIGlzIHVzZWQK
PiA+ID4gb24gdGhlIGRldmljZSwgYW5kIGRtYV9tYXBfc2coKSBpcyBjYWxsZWQgb24gaXQsIHRo
ZSBkbWFfYWRkcmVzcyB3aWxsIGJlCj4gPiA+IE5VTEwgaWYgc3luYyBpcyBhdHRlbXB0ZWQgb24g
dGhlIGRtYS1idWYgYmVmb3JlIGl0J3MgbWFwcGVkIG9uIGEgZGV2aWNlLgo+ID4gPgo+ID4gPiBC
ZWZvcmUgdjUuMCAoY29tbWl0IDU1ODk3YWY2MzA5MSAoImRtYS1kaXJlY3Q6IG1lcmdlIHN3aW90
bGJfZG1hX29wcwo+ID4gPiBpbnRvIHRoZSBkbWFfZGlyZWN0IGNvZGUiKSkgdGhpcyB3YXMgYSBw
cm9ibGVtIGFzIHRoZSBkbWEtYXBpIChhdCBsZWFzdAo+ID4gPiB0aGUgc3dpb3RsYl9kbWFfb3Bz
IG9uIGFybTY0KSB3b3VsZCB1c2UgdGhlIHBvdGVudGlhbGx5IGludmFsaWQKPiA+ID4gZG1hX2Fk
ZHJlc3MuIEhvdyB0aGF0IGZhaWxlZCBkZXBlbmRlZCBvbiBob3cgdGhlIGRldmljZSBoYW5kbGVk
IHBoeXNpY2FsCj4gPiA+IGFkZHJlc3MgMC4gSWYgMCB3YXMgYSB2YWxpZCBhZGRyZXNzIHRvIHBo
eXNpY2FsIHJhbSwgdGhhdCBwYWdlIHdvdWxkIGdldAo+ID4gPiBmbHVzaGVkIGEgbG90LCB3aGls
ZSB0aGUgYWN0dWFsIHBhZ2VzIGluIHRoZSBidWZmZXIgd291bGQgbm90IGdldCBzeW5jZWQKPiA+
ID4gY29ycmVjdGx5LiBXaGlsZSBpZiAwIGlzIGFuIGludmFsaWQgcGh5c2ljYWwgYWRkcmVzcyBp
dCBtYXkgY2F1c2UgYQo+ID4gPiBmYXVsdCBhbmQgdHJpZ2dlciBhIGNyYXNoLgo+ID4gPgo+ID4g
PiBJbiB2NS4wIHRoaXMgd2FzIGluY2lkZW50YWxseSBmaXhlZCBieSBjb21taXQgNTU4OTdhZjYz
MDkxICgiZG1hLWRpcmVjdDoKPiA+ID4gbWVyZ2Ugc3dpb3RsYl9kbWFfb3BzIGludG8gdGhlIGRt
YV9kaXJlY3QgY29kZSIpLCBhcyB0aGlzIG1vdmVkIHRoZQo+ID4gPiBkbWEtYXBpIHRvIHVzZSB0
aGUgcGFnZSBwb2ludGVyIGluIHRoZSBzZ19saXN0LCBhbmQgKGZvciBJb24gYnVmZmVycyBhdAo+
ID4gPiBsZWFzdCkgdGhpcyB3aWxsIGFsd2F5cyBiZSB2YWxpZCBpZiB0aGUgc2dfbGlzdCBleGlz
dHMgYXQgYWxsLgo+ID4gPgo+ID4gPiBCdXQsIHRoaXMgaXNzdWUgaXMgcmUtaW50cm9kdWNlZCBp
biB2NS4zIHdpdGgKPiA+ID4gY29tbWl0IDQ0OWZhNTRkNjgxNSAoImRtYS1kaXJlY3Q6IGNvcnJl
Y3QgdGhlIHBoeXNpY2FsIGFkZHIgaW4KPiA+ID4gZG1hX2RpcmVjdF9zeW5jX3NnX2Zvcl9jcHUv
ZGV2aWNlIikgbW92ZXMgdGhlIGRtYS1hcGkgYmFjayB0byB0aGUgb2xkCj4gPiA+IGJlaGF2aW91
ciBhbmQgcGlja3MgdGhlIGRtYV9hZGRyZXNzIHRoYXQgbWF5IGJlIGludmFsaWQuCj4gPiA+Cj4g
PiA+IGRtYS1idWYgY29yZSBkb2Vzbid0IGVuc3VyZSB0aGF0IHRoZSBidWZmZXIgaXMgbWFwcGVk
IG9uIHRoZSBkZXZpY2UsIGFuZAo+ID4gPiB0aHVzIGhhdmUgYSB2YWxpZCBzZ19saXN0LCBiZWZv
cmUgY2FsbGluZyB0aGUgZXhwb3J0ZXIncwo+ID4gPiBiZWdpbl9jcHVfYWNjZXNzLgo+ID4gPgo+
ID4gPiBTaWduZWQtb2ZmLWJ5OiDvv71yamFuIEVpZGUgPG9yamFuLmVpZGVAYXJtLmNvbT4KPiA+
ID4gLS0tCj4gPiA+ICBkcml2ZXJzL3N0YWdpbmcvYW5kcm9pZC9pb24vaW9uLmMgfCAxMiArKysr
KysrKysrKysKPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspCj4gPiA+Cj4g
PiA+IFJlc3VibWl0IHdpdGhvdXQgZGlzY2xhaW1lciwgc29ycnkgYWJvdXQgdGhhdC4KPiA+ID4K
PiA+ID4gVGhpcyBzZWVtcyB0byBiZSBwYXJ0IG9mIGEgYmlnZ2VyIGlzc3VlIHdoZXJlIGRtYS1i
dWYgZXhwb3J0ZXJzIGFzc3VtZQo+ID4gPiB0aGF0IHRoZWlyIGRtYS1idWYgYmVnaW5fY3B1X2Fj
Y2VzcyBhbmQgZW5kX2NwdV9hY2Nlc3MgY2FsbGJhY2tzIGhhdmUgYQo+ID4gPiBjZXJ0YWluIGd1
YXJhbnRlZWQgYmVoYXZpb3IsIHdoaWNoIGlzbid0IGVuc3VyZWQgYnkgZG1hLWJ1ZiBjb3JlLgo+
ID4gPgo+ID4gPiBUaGlzIHBhdGNoIGZpeGVzIHRoaXMgaW4gaW9uIG9ubHksIGJ1dCBpdCBhbHNv
IG5lZWRzIHRvIGJlIGZpeGVkIGZvcgo+ID4gPiBvdGhlciBleHBvcnRlcnMsIGVpdGhlciBoYW5k
bGVkIGxpa2UgdGhpcyBpbiBlYWNoIGV4cG9ydGVyLCBvciBpbgo+ID4gPiBkbWEtYnVmIGNvcmUg
YmVmb3JlIGNhbGxpbmcgaW50byB0aGUgZXhwb3J0ZXJzLgo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9zdGFnaW5nL2FuZHJvaWQvaW9uL2lvbi5jIGIvZHJpdmVycy9zdGFnaW5nL2Fu
ZHJvaWQvaW9uL2lvbi5jCj4gPiA+IGluZGV4IDM4YjUxZWFjZTRmOS4uN2I3NTJiYTBjYjZkIDEw
MDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL3N0YWdpbmcvYW5kcm9pZC9pb24vaW9uLmMKPiA+ID4g
KysrIGIvZHJpdmVycy9zdGFnaW5nL2FuZHJvaWQvaW9uL2lvbi5jCj4gPgo+ID4gTm93IHRoYXQg
d2UgaGF2ZSB0aGUgZG1hLWJ1ZmYgc3R1ZmYgaW4gdGhlIHRyZWUsIGRvIHdlIGV2ZW4gbmVlZCB0
aGUKPiA+IGlvbiBjb2RlIGluIHRoZSBrZXJuZWwgYW55bW9yZT8gIENhbid0IHdlIGRlbGV0ZSBp
dCBub3c/Cj4KPiBJdCBsb29rcyBsaWtlIHRoZSBuZXcgZG1hLWhlYXBzIGhhdmUgdGhlIHNhbWUg
aXNzdWUgYXMgaW9uLiBUaGUKPiBoZWFwLWhlbHBlcnMgYWxzbyBkbyBkbWFfc3luY19zZ19mb3Jf
ZGV2aWNlKCkgdW5jb25kaXRpb25hbGx5IG9uCj4gZW5kX2NwdV9hY2Nlc3Mgd2hpY2ggbWF5IGhh
cHBlbiBiZWZvcmUgZG1hX21hcF9zZygpLCBsZWFkaW5nIHRvIHVzZSBvZgo+IHRoZSAwIGRtYV9h
ZGRyZXNzIGluIHRoZSBzZyBsaXN0IG9mIGEsIHlldCB1bm1hcHBlZCwgYXR0YWNobWVudC4KClll
YSwgdGhlIGRtYS1idWYgaGVhcHMgY29kZSBjYW1lIGZyb20gdGhlIElPTiBsb2dpYywgc28gaXQg
bGlrZWx5IGhhcwp0aGUgc2FtZSBmYXVsdHMuCgo+IEl0IGNvdWxkIGJlIGZpeGVkIGluIGRtYS1o
ZWFwcyBqdXN0IGxpa2UgdGhpcyBwYXRjaCBkb2VzIGZvciBpb24uIElzCj4gcGF0Y2ggYSB2YWxp
ZCB3YXkgdG8gZml4IHRoaXMgcHJvYmxlbT8gT3IsIHNob3VsZCB0aGlzIHJhdGhlciBiZSBoYW5k
bGVkCj4gaW4gZG1hLWJ1ZiBjb3JlIGJ5IHRyYWNraW5nIHRoZSBtYXBwZWQgc3RhdGUgb2YgYXR0
YWNobWVudHMgdGhlcmU/CgpJbiB0aGUgc2hvcnQtdGVybSwgSSdkIGRlZmluaXRlbHkgcHJlZmVy
IHRvIGhhdmUgYSBmaXggdG8gZG1hYnVmIGhlYXBzCnJhdGhlciB0aGVuIElPTiwgYnV0IEkgYWxz
byBhZ3JlZSB0aGF0IGxvbmcgdGVybSBpdCBwcm9iYWJseSBzaG91bGRuJ3QKanVzdCBiZSB1cCB0
byB0aGUgZG1hLWJ1ZiBleHBvcnRlciAoYXMgdGhlcmUgYXJlIG90aGVyIGRtYWJ1ZgpleHBvcnRl
cnMgdGhhdCBtYXkgaGF2ZSBpdCB3cm9uZyB0b28pLCBhbmQgdGhhdCB3ZSBuZWVkIHRvIGFkZHJl
c3MKc29tZSBETUEgQVBJIGV4cGVjdGF0aW9ucy9saW1pdGF0aW9ucyB0byBiZXR0ZXIgaGFuZGxl
IG11bHRpcGxlIGRldmljZQpwaXBlbGluZXMuIChJIGFjdHVhbGx5IGdhdmUgYSB0YWxrIGxhc3Qg
ZmFsbCBvbiBzb21lIG9mIHRoZSBpc3N1ZXMgSQpzZWUgYXJvdW5kIGl0OiBodHRwczovL3lvdXR1
LmJlL1VzRVZvV0RfbzBjICkKCnRoYW5rcwotam9obgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
