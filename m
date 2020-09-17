Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B0626D394
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 08:23:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82BE56E0C5;
	Thu, 17 Sep 2020 06:23:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A25946E0C5
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 06:23:31 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id 185so1195561oie.11
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 23:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=t5xSYs5WyUHGoVugyXIsV4oBDVq0zP8fjjYyhPxmS5A=;
 b=VYwPjvy48TS158UnDBYgLFV8dLYTcm9kR1KQGEhIw/AOhPMVqcFjtf4qMuMDH5vVx+
 FPsUGl1T9D37jThKoIE1tgSPSJrgXvgVwjl3/lAkLs4w0OqP0vq1bkZMABCQ9059UFw9
 5vfWDwoa5rpsgJhfXrlf42ZrGwPdGMXJsMq00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=t5xSYs5WyUHGoVugyXIsV4oBDVq0zP8fjjYyhPxmS5A=;
 b=A5V4rfS1m82IjKibSh7fDl6geK7AcuI31tP2wz3JcmA3+4p+4ofxIj0pEPTAEDSfNZ
 mE8ljAifhvPuCxUJXnlzXafJj3f39L4Id1TW9kbzmNfXZMPd5ZSKiRH9RTYTZQOnxXup
 gWeWqefNFPh4H/diIndug72wRLCHKUELVktPIdoOUwPiNIMb7PA5PLiKJ2cX6GeVUMr7
 WEJoPjK33Z4XVsLs1c0U1BSofkadfUUfLQhcQaTTkiKGWtPelupnMvGQktjIQu8GI2qv
 tP4OiV8u3a2Xr86lg81rOsU5CXqrom8ZpLDBqFg760ym53T6wOrEGMdPZWZso6AJw5Gz
 cJrg==
X-Gm-Message-State: AOAM532yuhh2SccZcSp1j25BtDVKQjuN9lGOE3jX5DIblfgmqz9cZ4N0
 JOtQxNmIZNWO2NKwS6EppDxFMQK1VIH2vUggW+2cCQ==
X-Google-Smtp-Source: ABdhPJzB3ReC52Ku2iqgR54KZacCgPTbpQb6FYFGgv4R5udMulfkKOhc4e2KvAwA9Q2qQA7f0ioN8nPBsAA6wdCsyJs=
X-Received: by 2002:aca:6083:: with SMTP id u125mr5461400oib.14.1600323810870; 
 Wed, 16 Sep 2020 23:23:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200914132920.59183-1-christian.koenig@amd.com>
 <40cd26ae-b855-4627-5a13-4dcea5d622f6@gmail.com>
 <20200914140632.GD1221970@ziepe.ca>
 <9302e4e0-0ff0-8b00-ada1-85feefb49e88@gmail.com>
 <20200916095359.GD438822@phenom.ffwll.local>
 <20200916140710.GA8409@ziepe.ca>
 <8db2474f-ecb7-0e17-5f5b-145708fe44d5@amd.com>
 <CAKMK7uFdwrT3HACPh3ADAKvhXJ-Hf3dExZmgJVAQ1KKjSai_0w@mail.gmail.com>
 <aa953b09-53b1-104b-dc4b-156ad8a75e62@gmail.com>
In-Reply-To: <aa953b09-53b1-104b-dc4b-156ad8a75e62@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 17 Sep 2020 08:23:19 +0200
Message-ID: <CAKMK7uHJNRzCJfWVSmMrLmGXE0qo+OCXiMd+zPTOkeG2pnVrmQ@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] Changing vma->vm_file in dma_buf_mmap()
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
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Linux MM <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMTYsIDIwMjAgYXQgNTozMSBQTSBDaHJpc3RpYW4gS8O2bmlnCjxja29lbmln
LmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBBbSAxNi4wOS4yMCB1bSAxNzoy
NCBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4gPiBPbiBXZWQsIFNlcCAxNiwgMjAyMCBhdCA0OjE0
IFBNIENocmlzdGlhbiBLw7ZuaWcKPiA+IDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+IHdyb3Rl
Ogo+ID4+IEFtIDE2LjA5LjIwIHVtIDE2OjA3IHNjaHJpZWIgSmFzb24gR3VudGhvcnBlOgo+ID4+
PiBPbiBXZWQsIFNlcCAxNiwgMjAyMCBhdCAxMTo1Mzo1OUFNICswMjAwLCBEYW5pZWwgVmV0dGVy
IHdyb3RlOgo+ID4+Pgo+ID4+Pj4gQnV0IHdpdGhpbiB0aGUgZHJpdmVyLCB3ZSBnZW5lcmFsbHkg
bmVlZCB0aG91c2FuZHMgb2YgdGhlc2UsIGFuZCB0aGF0Cj4gPj4+PiB0ZW5kcyB0byBicmluZyBm
ZCBleGhhdXN0aW9uIHByb2JsZW1zIHdpdGggaXQuIFRoYXQncyB3aHkgYWxsIHRoZSBwcml2YXRl
Cj4gPj4+PiBidWZmZXIgb2JqZWN0cyB3aGljaCBhcmVuJ3Qgc2hhcmVkIHdpdGggb3RoZXIgcHJv
Y2VzcyBvciBvdGhlciBkcml2ZXJzIGFyZQo+ID4+Pj4gaGFuZGxlcyBvbmx5IHZhbGlkIGZvciBh
IHNwZWNpZmljIGZkIGluc3RhbmNlIG9mIHRoZSBkcm0gY2hhcmRldiAoZWFjaAo+ID4+Pj4gb3Bl
biBnZXRzIHRoZWlyIG93biBuYW1lc3BhY2UpLCBhbmQgb25seSBmb3IgaW9jdGxzIGRvbmUgb24g
dGhhdCBjaGFyZGV2Lgo+ID4+Pj4gQW5kIGZvciBtbWFwIHdlIGFzc2lnbiBmYWtlIChidXQgdW5p
cXVlIGFjcm9zcyBhbGwgb3BlbiBmZCBvbiBpdCkgb2Zmc2V0cwo+ID4+Pj4gd2l0aGluIHRoZSBv
dmVyYWxsIGNoYXJkZXYuIEhlbmNlIGFsbCB0aGUgcGdvZmYgbWFuZ2xpbmcgYW5kIHJlLW1hbmds
aW5nLgo+ID4+PiBBcmUgdGhleSBzdGlsbCB1bmlxdWUgc3RydWN0IGZpbGVzPyBKdXN0IHdpdGhv
dXQgYSBmZG5vPwo+ID4+IFllcywgZXhhY3RseS4KPiA+IE5vdCBlbnRpcmVseSwgc2luY2UgZG1h
LWJ1ZiBoYXBwZW5lZCBhZnRlciBkcm0gY2hhcmRldiwgc28gZm9yIHRoYXQKPiA+IGhpc3Rvcmlj
YWwgcmVhc29uIHRoZSB1bmRlcmx5aW5nIHN0cnVjdCBmaWxlIGlzIHNoYXJlZCwgc2luY2UgaXQn
cyB0aGUKPiA+IGRybSBjaGFyZGV2LiBCdXQgc2luY2UgdGhhdCdzIHBlci1kZXZpY2Ugd2UgZG9u
J3QgaGF2ZSBhIHByb2JsZW0gaW4KPiA+IHByYWN0aWNlIHdpdGggZGlmZmVyZW50IHZtX29wcywg
c2luY2UgdGhvc2UgYXJlIGFsc28gcGVyLWRldmljZS4gQnV0Cj4gPiB5ZWFoIHdlIGNvdWxkIGZp
c2ggb3V0IHNvbWUgZW50aXJlbHkgaGlkZGVuIHBlci1vYmplY3Qgc3RydWN0IGZpbGUgaWYKPiA+
IHRoYXQncyByZXF1aXJlZCBmb3Igc29tZSBtbSBpbnRlcm5hbCByZWFzb25zLgo+Cj4gSHVpPyBP
ayB0aGF0IGlzIGp1c3QgdGhlIGhhbmRsaW5nIGluIGk5MTUsIGlzbid0IGl0Pwo+Cj4gQXMgZmFy
IGFzIEkga25vdyB3ZSBjcmVhdGUgYW4gdW5pcXVlIHN0cnVjdCBmaWxlIGZvciBlYWNoIERNQS1i
dWYuCgpZZXMgZG1hLWJ1ZiwgYnV0IHRoYXQgZ2V0cyBmb3J3YXJkZWQgdG8gdGhlIG9yaWdpbmFs
IGRybSBjaGFyZGV2IHdoaWNoCm9yaWdpbmFsbHkgZXhwb3J0ZWQgdGhlIGJ1ZmZlci4gSXQncyBv
bmx5IHRoZXJlIHdoZXJlIHRoZSBmb3J3YXJkaW5nCmNoYWluIHN0b3BzLiBUaGUgb3RoZXIgdGhp
bmcgaXMgdGhhdCBpaXJjIHdlIGhhdmUgYSBzaW5nbGV0b24KYW5vbl9pbm9kZSBiZWhpbmQgYWxs
IHRoZSBkbWEtYnVmLCBzbyB0aGV5J2Qgc2hhcmUgYWxsIHRoZSBzYW1lCmFkZHJlc3Nfc3BhY2Ug
YW5kIHNvIHdvdWxkIGFsbCBhbGlhcyBmb3IgdW5tYXBfbWFwcGluZ19yYW5nZSAoSSB0aGluawph
dCBsZWFzdCkuCi1EYW5pZWwKCj4KPiBSZWdhcmRzLAo+IENocmlzdGlhbi4KPgo+Cj4gPiAtRGFu
aWVsCj4gPgo+ID4+Pj4gSGVuY2Ugd2h5IHdlJ2QgbGlrZSB0byBiZSBhYmxlIHRvIGZvcndhcmQg
YWxpYXNpbmcgbWFwcGluZ3MgYW5kIGFkanVzdCB0aGUKPiA+Pj4+IGZpbGUgYW5kIHBnb2ZmLCB3
aGlsZSBob3BlZnVsbHkgZXZlcnl0aGluZyBrZWVwcyB3b3JraW5nLiBJIHRob3VnaHQgdGhpcwo+
ID4+Pj4gd291bGQgd29yaywgYnV0IENocmlzdGlhbiBub3RpY2VkIGl0IGRvZXNuJ3QgcmVhbGx5
Lgo+ID4+PiBJdCBzZWVtcyByZWFzb25hYmxlIHRvIG1lIHRoYXQgdGhlIGRtYSBidWYgc2hvdWxk
IGJlIHRoZSBvd25lciBvZiB0aGUKPiA+Pj4gVk1BLCBvdGhlcndpc2UgbGlrZSB5b3Ugc2F5LCB0
aGVyZSBpcyBhIGJpZyBtZXNzIGF0dGFjaGluZyB0aGUgY3VzdG9tCj4gPj4+IHZtYSBvcHMgYW5k
IHdoYXQgbm90IHRvIHRoZSBwcm9wZXIgZG1hIGJ1Zi4KPiA+Pj4KPiA+Pj4gSSBkb24ndCBzZWUg
YW55dGhpbmcgb2J2aW91c2x5IGFnYWluc3QgdGhpcyBpbiBtbWFwX3JlZ2lvbigpIC0gd2h5IGRp
ZAo+ID4+PiBDaHJpdGlhbiBub3RpY2UgaXQgZG9lc24ndCByZWFsbHkgd29yaz8KPiA+PiBUbyBj
bGFyaWZ5IEkgdGhpbmsgdGhpcyBtaWdodCB3b3JrLgo+ID4+Cj4gPj4gSSBqdXN0IGhhZCB0aGUg
c2FtZSAiSXMgdGhhdCBsZWdhbD8iLCAiV2hhdCBhYm91dCBzZWN1cml0eT8iLCBldGMuLgo+ID4+
IHF1ZXN0aW9ucyB5b3UgcmFpc2VkIGFzIHdlbGwuCj4gPj4KPiA+PiBJdCBzZWVtcyBsaWtlIGEg
c291cmNlIG9mIHRyb3VibGUgc28gSSB0aG91Z2h0IGJldHRlciBhc2sgc29tZWJvZHkgbW9yZQo+
ID4+IGZhbWlsaWFyIHdpdGggdGhhdC4KPiA+Pgo+ID4+IENocmlzdGlhbi4KPiA+Pgo+ID4+PiBK
YXNvbgo+ID4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gPj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+ID4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPiA+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo+ID4KPiA+Cj4KCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdp
bmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
