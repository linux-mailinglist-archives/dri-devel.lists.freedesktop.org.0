Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 060B3A7779
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 01:15:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D0908984C;
	Tue,  3 Sep 2019 23:15:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54F5F8984C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 23:15:52 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id y9so11883203pfl.4
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2019 16:15:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=0JNFzCpBJEdTemHS45RsytSZ45gxo6jwn6UP6l3k/q8=;
 b=LFdBksxomyKRhGGLvJ/xC27swJ/2ZYqDhxqkL3sp9AjD8fNQ5F139wkyeyh71bwAwy
 OrqN9I1FzVD933M4kp471IiKKWWys3vRPruCsnMPXrY7i8xfsu3y63Ir72QIy7vxnqt6
 jz1o8wzhK4WEROd1r5V3rci+2o76mtPYvzouIfaKXxe6m2hrV2sC5ZC8i9WHFOVgMS6S
 UADLvnbvyKWYe+GWvep/FOYA8USsO/58cn4+EYqC1/HbuEuey7DNe/3SQLcp9brXJDbF
 3GAMPdTKX1jeT6WHTkqlzxN1qFwh8F7LIb0e8M+RIn994B5/dx1HU7hF1o0axX/ZGgc3
 NNUQ==
X-Gm-Message-State: APjAAAXSbbJRmDFcqoYRJWx09d9UKi9d2OcmtYzVPuh+AkippFrsfKnx
 5hcDP6HQGQjVncna5uxZQLuKiQ==
X-Google-Smtp-Source: APXvYqwAy6VYf9bqsKAEfzgG8ON4zGp8+yZVa8O65Onr7XLG5rt2+zdJ8t0YJUfd0uch3XZDDrztnQ==
X-Received: by 2002:a17:90a:310:: with SMTP id
 16mr1910866pje.100.1567552551831; 
 Tue, 03 Sep 2019 16:15:51 -0700 (PDT)
Received: from [10.238.221.122] (129.sub-97-41-131.myvzw.com. [97.41.131.129])
 by smtp.gmail.com with ESMTPSA id
 s7sm29657053pfb.138.2019.09.03.16.15.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 03 Sep 2019 16:15:50 -0700 (PDT)
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v2 3/4] drm/ttm,
 drm/vmwgfx: Correctly support support AMD memory encryption
From: Andy Lutomirski <luto@amacapital.net>
X-Mailer: iPhone Mail (16G102)
In-Reply-To: <6d122d62-9c96-4c29-8d06-02f7134e5e2a@shipmail.org>
Date: Tue, 3 Sep 2019 16:15:47 -0700
Message-Id: <B3C5DD1B-A33C-417F-BDDC-73120A035EA5@amacapital.net>
References: <20190903131504.18935-1-thomas_os@shipmail.org>
 <20190903131504.18935-4-thomas_os@shipmail.org>
 <b54bd492-9702-5ad7-95da-daf20918d3d9@intel.com>
 <CAKMK7uFv+poZq43as8XoQaSuoBZxCQ1p44VCmUUTXOXt4Y+Bjg@mail.gmail.com>
 <6d0fafcc-b596-481b-7b22-1f26f0c02c5c@intel.com>
 <bed2a2d9-17f0-24bd-9f4a-c7ee27f6106e@shipmail.org>
 <7fa3b178-b9b4-2df9-1eee-54e24d48342e@intel.com>
 <ba77601a-d726-49fa-0c88-3b02165a9a21@shipmail.org>
 <CALCETrVnNpPwmRddGLku9hobE7wG30_3j+QfcYxk09hZgtaYww@mail.gmail.com>
 <44b094c8-63fe-d9e5-1bf4-7da0788caccf@shipmail.org>
 <6d122d62-9c96-4c29-8d06-02f7134e5e2a@shipmail.org>
To: =?utf-8?Q?"Thomas_Hellstr=C3=B6m_=28VMware=29"?= <thomas_os@shipmail.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amacapital-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=0JNFzCpBJEdTemHS45RsytSZ45gxo6jwn6UP6l3k/q8=;
 b=oW+6JVM7aPZ/oqfhrmtJXYQvAfuGgJF4dbb9hL8kr4pZK2F4F6EwJoIjBJ7cw8oBlX
 Bvzfs/LSK+TzZhBZn7kKrT9R+4+htcZ2uy7HX6SdhTwzWczYwgs379bPE/Wb4D35slh7
 UFBTtOd4DnDaEmUbsjxiKcaAzKvOD9GdejDNwBa+xt+CYqMSeaqmgYA2aX/QCwV2ly+L
 7pBaBkXGPO5KmO7F5GrEBc2v4xjZ7CYFa+GAZ5Ny1iqkMW7Ubn7z5PigzPoI5Qo7bahQ
 nBQiZWmZjmETlqZ9J/YqkaK5BsWicDUd27qtMXYAQuBx5lz2snBdq4IVnBYFLBfWEqd4
 N5gg==
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, Andy Lutomirski <luto@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, pv-drivers@vmware.com,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dave Hansen <dave.hansen@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cgo+IE9uIFNlcCAzLCAyMDE5LCBhdCAzOjE1IFBNLCBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJl
KSA8dGhvbWFzX29zQHNoaXBtYWlsLm9yZz4gd3JvdGU6Cj4gCj4+IE9uIDkvNC8xOSAxMjowOCBB
TSwgVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSkgd3JvdGU6Cj4+PiBPbiA5LzMvMTkgMTE6NDYg
UE0sIEFuZHkgTHV0b21pcnNraSB3cm90ZToKPj4+IE9uIFR1ZSwgU2VwIDMsIDIwMTkgYXQgMjow
NSBQTSBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKQo+Pj4gPHRob21hc19vc0BzaGlwbWFpbC5v
cmc+IHdyb3RlOgo+Pj4+IE9uIDkvMy8xOSAxMDo1MSBQTSwgRGF2ZSBIYW5zZW4gd3JvdGU6Cj4+
Pj4+PiBPbiA5LzMvMTkgMTozNiBQTSwgVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSkgd3JvdGU6
Cj4+Pj4+PiBTbyB0aGUgcXVlc3Rpb24gaGVyZSBzaG91bGQgcmVhbGx5IGJlLCBjYW4gd2UgZGV0
ZXJtaW5lIGFscmVhZHkgYXQgbW1hcAo+Pj4+Pj4gdGltZSB3aGV0aGVyIGJhY2tpbmcgbWVtb3J5
IHdpbGwgYmUgdW5lbmNyeXB0ZWQgYW5kIGFkanVzdCB0aGUgKnJlYWwqCj4+Pj4+PiB2bWEtPnZt
X3BhZ2VfcHJvdCB1bmRlciB0aGUgbW1hcF9zZW0/Cj4+Pj4+PiAKPj4+Pj4+IFBvc3NpYmx5LCBi
dXQgdGhhdCByZXF1aXJlcyBwb3B1bGF0aW5nIHRoZSBidWZmZXIgd2l0aCBtZW1vcnkgYXQgbW1h
cAo+Pj4+Pj4gdGltZSByYXRoZXIgdGhhbiBhdCBmaXJzdCBmYXVsdCB0aW1lLgo+Pj4+PiBJJ20g
bm90IGNvbm5lY3RpbmcgdGhlIGRvdHMuCj4+Pj4+IAo+Pj4+PiB2bWEtPnZtX3BhZ2VfcHJvdCBp
cyB1c2VkIHRvIGNyZWF0ZSBhIFZNQSdzIFBURXMgcmVnYXJkbGVzcyBvZiBpZiB0aGV5Cj4+Pj4+
IGFyZSBjcmVhdGVkIGF0IG1tYXAoKSBvciBmYXVsdCB0aW1lLiAgSWYgd2UgZXN0YWJsaXNoIGEg
Z29vZAo+Pj4+PiB2bWEtPnZtX3BhZ2VfcHJvdCwgY2FuJ3Qgd2UganVzdCB1c2UgaXQgZm9yZXZl
ciBmb3IgZGVtYW5kIGZhdWx0cz8KPj4+PiBXaXRoIFNFViBJIHRoaW5rIHRoYXQgd2UgY291bGQg
cG9zc2libHkgZXN0YWJsaXNoIHRoZSBlbmNyeXB0aW9uIGZsYWdzCj4+Pj4gYXQgdm1hIGNyZWF0
aW9uIHRpbWUuIEJ1dCB0aGlua2luZyBvZiBpdCwgaXQgd291bGQgYWN0dWFsbHkgYnJlYWsgd2l0
aAo+Pj4+IFNNRSB3aGVyZSBidWZmZXIgY29udGVudCBjYW4gYmUgbW92ZWQgYmV0d2VlbiBlbmNy
eXB0ZWQgc3lzdGVtIG1lbW9yeQo+Pj4+IGFuZCB1bmVuY3J5cHRlZCBncmFwaGljcyBjYXJkIFBD
SSBtZW1vcnkgYmVoaW5kIHVzZXItc3BhY2UncyBiYWNrLiBUaGF0Cj4+Pj4gd291bGQgaW1wbHkg
a2lsbGluZyBhbGwgdXNlci1zcGFjZSBlbmNyeXB0ZWQgUFRFcyBhbmQgYXQgZmF1bHQgdGltZSBz
ZXQKPj4+PiB1cCBuZXcgb25lcyBwb2ludGluZyB0byB1bmVuY3J5cHRlZCBQQ0kgbWVtb3J5Li4K
Pj4+PiAKPj4+Pj4gT3IsIGFyZSB5b3UgY29uY2VybmVkIHRoYXQgaWYgYW4gYXR0ZW1wdCBpcyBt
YWRlIHRvIGRlbWFuZC1mYXVsdCBwYWdlCj4+Pj4+IHRoYXQncyBpbmNvbXBhdGlibGUgd2l0aCB2
bWEtPnZtX3BhZ2VfcHJvdCB0aGF0IHdlIGhhdmUgdG8gU0VHVj8KPj4+Pj4gCj4+Pj4+PiBBbmQg
aXQgc3RpbGwgcmVxdWlyZXMga25vd2xlZGdlIHdoZXRoZXIgdGhlIGRldmljZSBETUEgaXMgYWx3
YXlzCj4+Pj4+PiB1bmVuY3J5cHRlZCAob3IgaWYgU0VWIGlzIGFjdGl2ZSkuCj4+Pj4+IEkgbWF5
IGJlIGdldHRpbmcgbWl4ZWQgdXAgb24gTUtUTUUgKHRoZSBJbnRlbCBtZW1vcnkgZW5jcnlwdGlv
bikgYW5kCj4+Pj4+IFNFVi4gIElzIFNFViBzdXBwb3J0ZWQgb24gYWxsIG1lbW9yeSB0eXBlcz8g
IFBhZ2UgY2FjaGUsIGh1Z2V0bGJmcywKPj4+Pj4gYW5vbnltb3VzPyAgT3IganVzdCBhbm9ueW1v
dXM/Cj4+Pj4gU0VWIEFGQUlLIGVuY3J5cHRzICphbGwqIG1lbW9yeSBleGNlcHQgRE1BIG1lbW9y
eS4gVG8gZG8gdGhhdCBpdCB1c2VzIGEKPj4+PiBTV0lPVExCIGJhY2tlZCBieSB1bmVuY3J5cHRl
ZCBtZW1vcnksIGFuZCBpdCBhbHNvIGZsaXBzIGNvaGVyZW50IERNQQo+Pj4+IG1lbW9yeSB0byB1
bmVuY3J5cHRlZCAod2hpY2ggaXMgYSB2ZXJ5IHNsb3cgb3BlcmF0aW9uIGFuZCBwYXRjaCA0IGRl
YWxzCj4+Pj4gd2l0aCBjYWNoaW5nIHN1Y2ggbWVtb3J5KS4KPj4+PiAKPj4+IEknbSBzdGlsbCBs
b3N0LiAgWW91IGhhdmUgc29tZSBmYW5jeSBWTUEgd2hlcmUgdGhlIGJhY2tpbmcgcGFnZXMKPj4+
IGNoYW5nZSBiZWhpbmQgdGhlIGFwcGxpY2F0aW9uJ3MgYmFjay4gIFRoaXMgaXNuJ3QgcGFydGlj
dWxhcmx5IG5vdmVsCj4+PiAtLSBwbGFpbiBvbGQgYW5vbnltb3VzIG1lbW9yeSBhbmQgcGxhaW4g
b2xkIG1hcHBlZCBmaWxlcyBkbyB0aGlzIHRvby4KPj4+IENhbid0IHlvdSBhbGwgdGhlIGluc2Vy
dF9wZm4gQVBJcyBhbmQgY2FsbCBpdCBhIGRheT8gIFdoYXQncyBzbwo+Pj4gc3BlY2lhbCB0aGF0
IHlvdSBuZWVkIGFsbCB0aGlzIG1hZ2ljPyAgSVNUTSB5b3Ugc2hvdWxkIGJlIGFibGUgdG8KPj4+
IGFsbG9jYXRlIG1lbW9yeSB0aGF0J3MgYWRkcmVzc2FibGUgYnkgdGhlIGRldmljZSAoZG1hX2Fs
bG9jX2NvaGVyZW50KCkKPj4+IG9yIHdoYXRldmVyKSBhbmQgdGhlbiBtYXAgaXQgaW50byB1c2Vy
IG1lbW9yeSBqdXN0IGxpa2UgeW91J2QgbWFwIGFueQo+Pj4gb3RoZXIgcGFnZS4KPj4+IAo+Pj4g
SSBmZWVsIGxpa2UgSSdtIG1pc3Npbmcgc29tZXRoaW5nIGhlcmUuCj4+IAo+PiBZZXMsIHNvIGlu
IHRoaXMgY2FzZSB3ZSB1c2UgZG1hX2FsbG9jX2NvaGVyZW50KCkuCj4+IAo+PiBXaXRoIFNFViwg
dGhhdCBnaXZlcyB1cyB1bmVuY3J5cHRlZCBwYWdlcy4gKFBhZ2VzIHdob3NlIGxpbmVhciBrZXJu
ZWwgbWFwIGlzIG1hcmtlZCB1bmVuY3J5cHRlZCkuIFdpdGggU01FIHRoYXQgKHR5cGNpYWxseSkg
Z2l2ZXMgdXMgZW5jcnlwdGVkIHBhZ2VzLiBJbiBib3RoIHRoZXNlIGNhc2VzLCB2bV9nZXRfcGFn
ZV9wcm90KCkgcmV0dXJucwo+PiBhbiBlbmNyeXB0ZWQgcGFnZSBwcm90ZWN0aW9uLCB3aGljaCBs
YW5kcyBpbiB2bWEtPnZtX3BhZ2VfcHJvdC4KPj4gCj4+IEluIHRoZSBTRVYgY2FzZSwgd2UgdGhl
cmVmb3JlIG5lZWQgdG8gbW9kaWZ5IHRoZSBwYWdlIHByb3RlY3Rpb24gdG8gdW5lbmNyeXB0ZWQu
IEhlbmNlIHdlIG5lZWQgdG8ga25vdyB3aGV0aGVyIHdlJ3JlIHJ1bm5pbmcgdW5kZXIgU0VWIGFu
ZCB0aGVyZWZvcmUgbmVlZCB0byBtb2RpZnkgdGhlIHByb3RlY3Rpb24uIElmIG5vdCwgdGhlIHVz
ZXItc3BhY2UgUFRFIHdvdWxkIGluY29ycmVjdGx5IGhhdmUgdGhlIGVuY3J5cHRpb24gZmxhZyBz
ZXQuCj4+IAoKSeKAmW0gc3RpbGwgY29uZnVzZWQuIFlvdSBnb3QgdW5lbmNyeXB0ZWQgcGFnZXMg
d2l0aCBhbiB1bmVuY3J5cHRlZCBQRk4uIFdoeSBkbyB5b3UgbmVlZCB0byBmaWRkbGU/ICBZb3Ug
aGF2ZSBhIFBGTiwgYW5kIHlvdeKAmXJlIGluc2VydGluZyBpdCB3aXRoIHZtZl9pbnNlcnRfcGZu
KCkuICBUaGlzIHNob3VsZCBqdXN0IHdvcmssIG5vPyAgVGhlcmUgZG9lc27igJl0IHNlZW0gdG8g
YmUgYW55IHJlYWwgZnVubnkgYnVzaW5lc3MgaW4gZG1hX21tYXBfYXR0cnMoKSBvciBkbWFfY29t
bW9uX21tYXAoKS4KCkJ1dCwgcmVhZGluZyB0aGlzLCBJIGhhdmUgbW9yZSBxdWVzdGlvbnM6CgpD
YW7igJl0IHlvdSBnZXQgcmlkIG9mIGN2bWEgYnkgdXNpbmcgdm1mX2luc2VydF9wZm5fcHJvdCgp
PwoKV291bGQgaXQgbWFrZSBzZW5zZSB0byBhZGQgYSB2bWZfaW5zZXJ0X2RtYV9wYWdlKCkgdG8g
ZGlyZWN0bHkgZG8gZXhhY3RseSB3aGF0IHlvdeKAmXJlIHRyeWluZyB0byBkbz8KCkFuZCBhIGJy
b2FkZXIgcXVlc3Rpb24ganVzdCBiZWNhdXNlIEnigJltIHN0aWxsIGNvbmZ1c2VkOiB3aHkgaXNu
4oCZdCB0aGUgZW5jcnlwdGlvbiBiaXQgaW4gdGhlIFBGTj8gIFRoZSB3aG9sZSBTRVYvU01FIHN5
c3RlbSBzZWVtcyBsaWtlIGl04oCZcyB0cnlpbmcgYSBiaXQgdG8gaGFyZCB0byBiZSBmdWxseSBp
bnZpc2libGUgdG8gdGhlIGtlcm5lbC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
