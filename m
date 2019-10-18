Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9F5DCEAC
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 20:49:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4309E6EBA8;
	Fri, 18 Oct 2019 18:49:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6CAD6EBA8
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 18:49:34 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id n14so7295515wrw.9
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 11:49:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aHwrkkqK+v7ttT3hkVnbsvrpjAbQK2fYZ6a+Ri81jgQ=;
 b=M/jQSqtZvxJSrd75HJ3ISahL8p7TIBfHV+KPy+EvM88vs0891Z4+Z/US+ehzgauYEY
 2QsBEVSzFzQolxIkMhmiidPr+TTrKKrBZjTwDOdYPejK1d3QSz0TzTnf/SEttY31vVre
 Y7jpAtDkcpu+gTg7tJsLyimBo+agAj+TMN30AYBNVlD8dZ5wse3rhWdI1qsJacQW/wVD
 7KHZnd7LUOGvTClbubt9e+4Cs7ZuzVquoXdu1NbMe14XEhn0RJCsn8dKq+KLxSyNmtPb
 D0Xmst9U3z1k4KpUiMAFJMdYV6uBivSdEaFjn5TgZjtegfck6k2gOWRgLFe+syFpiGXd
 kW9A==
X-Gm-Message-State: APjAAAV9vUD/GvHtByeeCIf3+vreBrq177qRnPdOIB6uiEwwxwPpWut8
 o+dHBccKMOtxesCeJuxp6uhnQFIkenEFYlwZMUK8NA==
X-Google-Smtp-Source: APXvYqzEAUVJXB6Gp+u1CbtLAoa/ziEMiFEWlTCerkSuIf0yRZwzZiVqQ9e0pvTxq8U6NBXXT02BZ5WPL3KU1SkqmaQ=
X-Received: by 2002:a5d:50c9:: with SMTP id f9mr8710623wrt.36.1571424573429;
 Fri, 18 Oct 2019 11:49:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAO_48GFHx4uK6cWwJ4oGdJ8HNZNZYDzdD=yR3VK0EXQ86ya9-g@mail.gmail.com>
 <20190924162217.GA12974@arm.com> <20191009173742.GA2682@arm.com>
 <f4fb09a5-999b-e676-0403-cc0de41be440@ti.com>
 <20191014090729.lwusl5zxa32a7uua@DESKTOP-E1NTVVP.localdomain>
 <a213760f-1f41-c4a3-7e38-8619898adecd@ti.com>
 <CALAqxLV6EBHKPEaEkyfhEYyw0TXayTeY_4AWXfuASLLyxZh5+Q@mail.gmail.com>
 <a3c66479-7433-ec29-fbec-81aef60cb063@ti.com>
 <CALAqxLWrsXG0XysL7RmhApbuZukDdG5VhdHOTS5odkG9f1ezwA@mail.gmail.com>
 <20191018095516.inwes5avdeixl5nr@DESKTOP-E1NTVVP.localdomain>
 <20191018184123.GA10634@arm.com>
In-Reply-To: <20191018184123.GA10634@arm.com>
From: John Stultz <john.stultz@linaro.org>
Date: Fri, 18 Oct 2019 11:49:22 -0700
Message-ID: <CALAqxLXzOjyD1MpGeuZKLz+RNz1Utd8QpbvtSOodeqT-gCu6kA@mail.gmail.com>
Subject: Re: [RESEND][PATCH v8 0/5] DMA-BUF Heaps (destaging ION)
To: Ayan Halder <Ayan.Halder@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=aHwrkkqK+v7ttT3hkVnbsvrpjAbQK2fYZ6a+Ri81jgQ=;
 b=C87WZN4lrYok7x6kNxv0f0V7ppeKpanyF4cDM/PfsE+M+YjE0iuSVN+/VcRd49e7LA
 YE5LPYMob7fMxbLpv+EoYWVR0inRsUItRnCdIt397m1VUWWqVVjuM4LV2vX49cSP8Rxm
 nUTrkPsAeE8JTzCJsyWV6DVzjCCsDRC94wvzybXU4QMjBBeSSVm9lJuPPzt6o+PjrX9T
 AlKObj5riecOiesJDhAZOw4aUgNmajjyk/183XTLhsiNsq8rtaBDNHJV94i/IMp5FIBY
 yVPl40u3fOh1qcLW0geb+swIlPmpweHyjqV4geYV557h3Xhlc+u4ylm2rQACxFKbjwlx
 q4zA==
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
Cc: Sudipto Paul <Sudipto.Paul@arm.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>,
 lkml <linux-kernel@vger.kernel.org>, Chenbo Feng <fengc@google.com>,
 Alistair Strachan <astrachan@google.com>, Liam Mark <lmark@codeaurora.org>,
 "Andrew F. Davis" <afd@ti.com>, Christoph Hellwig <hch@infradead.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>, nd <nd@arm.com>,
 Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMTgsIDIwMTkgYXQgMTE6NDEgQU0gQXlhbiBIYWxkZXIgPEF5YW4uSGFsZGVy
QGFybS5jb20+IHdyb3RlOgo+IE9uIEZyaSwgT2N0IDE4LCAyMDE5IGF0IDA5OjU1OjE3QU0gKzAw
MDAsIEJyaWFuIFN0YXJrZXkgd3JvdGU6Cj4gPiBPbiBUaHUsIE9jdCAxNywgMjAxOSBhdCAwMTo1
Nzo0NVBNIC0wNzAwLCBKb2huIFN0dWx0eiB3cm90ZToKPiA+ID4gT24gVGh1LCBPY3QgMTcsIDIw
MTkgYXQgMTI6MjkgUE0gQW5kcmV3IEYuIERhdmlzIDxhZmRAdGkuY29tPiB3cm90ZToKPiA+ID4g
PiBPbiAxMC8xNy8xOSAzOjE0IFBNLCBKb2huIFN0dWx0eiB3cm90ZToKPiA+ID4gPiA+IEJ1dCBp
ZiB0aGUgb2JqZWN0aW9uIHN0YW5kcywgZG8geW91IGhhdmUgYSBwcm9wb3NhbCBmb3IgYW4gYWx0
ZXJuYXRpdmUKPiA+ID4gPiA+IHdheSB0byBlbnVtZXJhdGUgYSBzdWJzZXQgb2YgQ01BIGhlYXBz
Pwo+ID4gPiA+ID4KPiA+ID4gPiBXaGVuIGluIHN0YWdpbmcgSU9OIGhhZCB0byByZWFjaCBpbnRv
IHRoZSBDTUEgZnJhbWV3b3JrIGFzIHRoZSBvdGhlcgo+ID4gPiA+IGRpcmVjdGlvbiB3b3VsZCBu
b3QgYmUgYWxsb3dlZCwgc28gY21hX2Zvcl9lYWNoX2FyZWEoKSB3YXMgYWRkZWQuIElmCj4gPiA+
ID4gRE1BLUJVRiBoZWFwcyBpcyBub3QgaW4gc3RhZ2luZyB0aGVuIHdlIGNhbiBkbyB0aGUgb3Bw
b3NpdGUsIGFuZCBoYXZlCj4gPiA+ID4gdGhlIENNQSBmcmFtZXdvcmsgcmVnaXN0ZXIgaGVhcHMg
aXRzZWxmIHVzaW5nIG91ciBmcmFtZXdvcmsuIFRoYXQgd2F5Cj4gPiA+ID4gdGhlIENNQSBzeXN0
ZW0gY291bGQgZGVjaWRlIHdoYXQgYXJlYXMgdG8gZXhwb3J0IG9yIG5vdCAobWF5YmUgYmFzZWQg
b24KPiA+ID4gPiBhIERUIHByb3BlcnR5IG9yIHNpbWlsYXIpLgo+ID4gPgo+ID4gPiBPay4gVGhv
dWdoIHRoZSBDTUEgY29yZSBkb2Vzbid0IGhhdmUgbXVjaCBzZW5zZSBvZiBEVCBkZXRhaWxzIGVp
dGhlciwKPiA+ID4gc28gaXQgd291bGQgcHJvYmFibHkgaGF2ZSB0byBiZSBkb25lIGluIHRoZSBy
ZXNlcnZlZF9tZW0gbG9naWMsIHdoaWNoCj4gPiA+IGRvZXNuJ3QgZmVlbCByaWdodCB0byBtZS4K
PiA+ID4KPiA+ID4gSSdkIHByb2JhYmx5IGd1ZXNzIHdlIHNob3VsZCBoYXZlIHNvbWUgc29ydCBv
ZiBkdCBiaW5kaW5nIHRvIGRlc2NyaWJlCj4gPiA+IGEgZG1hYnVmIGNtYSBoZWFwIGFuZCBmcm9t
IHRoYXQgbm9kZSBsaW5rIHRvIGEgQ01BIG5vZGUgdmlhIGEKPiA+ID4gbWVtb3J5LXJlZ2lvbiBw
aGFuZGxlLiBBbG9uZyB3aXRoIG1heWJlIHRoZSBkZWZhdWx0IGhlYXAgYXMgd2VsbD8gTm90Cj4g
PiA+IGVhZ2VyIHRvIGdldCBpbnRvIGFub3RoZXIgYmluZGluZyByZXZpZXcgY3ljbGUsIGFuZCBJ
J20gbm90IHN1cmUgd2hhdAo+ID4gPiBub24tRFQgc3lzdGVtcyB3aWxsIGRvIHlldCwgYnV0IEkn
bGwgdGFrZSBhIHNob3QgYXQgaXQgYW5kIGl0ZXJhdGUuCj4gPiA+Cj4gPiA+ID4gVGhlIGVuZCBy
ZXN1bHQgaXMgdGhlIHNhbWUgc28gd2UgY2FuIG1ha2UgdGhpcyBjaGFuZ2UgbGF0ZXIgKGl0IGhh
cyB0bwo+ID4gPiA+IGNvbWUgYWZ0ZXIgRE1BLUJVRiBoZWFwcyBpcyBpbiBhbnl3YXkpLgo+ID4g
Pgo+ID4gPiBXZWxsLCBJJ20gaGVzaXRhbnQgdG8gbWVyZ2UgY29kZSB0aGF0IGV4cG9zZXMgYWxs
IHRoZSBDTUEgaGVhcHMgYW5kCj4gPiA+IHRoZW4gYWRkIHBhdGNoZXMgdGhhdCBiZWNvbWVzIG1v
cmUgc2VsZWN0aXZlLCBzaG91bGQgYW55b25lIGRlcGVuZCBvbgo+ID4gPiB0aGUgaW5pdGlhbCBi
ZWhhdmlvci4gOi8KPiA+Cj4gPiBIb3cgYWJvdXQgb25seSBhdXRvLWFkZGluZyB0aGUgc3lzdGVt
IGRlZmF1bHQgQ01BIHJlZ2lvbiAoY21hLT5uYW1lID09Cj4gPiAicmVzZXJ2ZWQiKT8KPiA+Cj4g
PiBBbmQvb3IgdGhlIENNQSBhdXRvLWFkZCBjb3VsZCBiZSBiZWhpbmQgYSBjb25maWcgb3B0aW9u
PyBJdCBzZWVtcyBhCj4gPiBzaGFtZSB0byBmdXJ0aGVyIGRlbGF5IHRoaXMsIGFuZCB0aGUgQ01B
IGhlYXAgaXRzZWxmIHJlYWxseSBpcyB1c2VmdWwuCj4gPgo+IEEgYml0IG9mIGEgZGV0b3VyLCBj
b21taW5nIGJhY2sgdG8gdGhlIGlzc3VlIHdoeSB0aGUgZm9sbG93aW5nIG5vZGUKPiB3YXMgbm90
IGdldHRpbmcgZGV0ZWN0ZWQgYnkgdGhlIGRtYS1idWYgaGVhcHMgZnJhbWV3b3JrLgo+Cj4gICAg
ICAgICByZXNlcnZlZC1tZW1vcnkgewo+ICAgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9
IDwyPjsKPiAgICAgICAgICAgICAgICAgI3NpemUtY2VsbHMgPSA8Mj47Cj4gICAgICAgICAgICAg
ICAgIHJhbmdlczsKPgo+ICAgICAgICAgICAgICAgICBkaXNwbGF5X3Jlc2VydmVkOiBmcmFtZWJ1
ZmZlckA2MDAwMDAwMCB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJz
aGFyZWQtZG1hLXBvb2wiOwo+ICAgICAgICAgICAgICAgICAgICAgICAgIGxpbnV4LGNtYS1kZWZh
dWx0Owo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldXNhYmxlOyA8PDw8PDw8PDw8PDwtLS0t
LS0tLS0tLVRoaXMgd2FzIG1pc3NpbmcgaW4gb3VyCj4gZWFybGllciBub2RlCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgcmVnID0gPDAgMHg2MDAwMDAwMCAwIDB4MDgwMDAwMDA+Owo+ICAgICAg
ICAgICAgICAgICB9OwoKUmlnaHQuIEl0IGhhcyB0byBiZSBhIENNQSByZWdpb24gZm9yIHVzIHRv
IGV4cG9zZSBpdCBmcm9tIHRoZSBjbWEgaGVhcC4KCgo+IFdpdGggJ3JldXNhYmxlJywgcm1lbV9j
bWFfc2V0dXAoKSBzdWNjZWVkcyAsIGJ1dCB0aGUga2VybmVsIGNyYXNoZXMgYXMgZm9sbG93cyA6
LQo+Cj4gWyAgICAwLjQ1MDU2Ml0gV0FSTklORzogQ1BVOiAyIFBJRDogMSBhdCBtbS9jbWEuYzox
MTAgY21hX2luaXRfcmVzZXJ2ZWRfYXJlYXMrMHhlYy8weDIyYwoKSXMgdGhlIHZhbHVlIDB4NjAw
MDAwMDAgeW91J3JlIHVzaW5nIHNvbWV0aGluZyB5b3UganVzdCBndWVzc2VkIGF0PyBJdApzZWVt
cyBsaWtlIHRoZSB3YXJuaW5nIGhlcmUgaXMgc2F5aW5nIHRoZSBwZm4gY2FsY3VsYXRlZCBmcm9t
IHRoZSBiYXNlCmFkZHJlc3MgaXNuJ3QgdmFsaWQuCgp0aGFua3MKLWpvaG4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
