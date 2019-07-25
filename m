Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 346A875286
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 17:24:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E542D6E76E;
	Thu, 25 Jul 2019 15:24:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD1576E76E
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 15:24:04 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id w20so50563262edd.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 08:24:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gryz4oIs4ZZI3Q3VIYP2tloVo1WnPxPFcILb2RQ/dVY=;
 b=WVdhZAzEthFRg0dUXjU5ZVdIvqWU0ouXl2TCQymThqZyL9SYQ9K98cxjA3EXHDebZa
 HMR+E9F+oQeN8GgBE1ShpRNHiWMicOGmK7jLpvlbqLfTAAGMnSu9j1DyWcWBv+kw3RGd
 IJLYepfEhUl0T3OWCODqrIBr5O2qw0GKfr40UZw4TC3myXHW54rAIA9X8nn9paeHdKwQ
 vhWssfasQkhE03aQgskeWWdtJeH9KZDEk8zKIq3ZEA0QGJjzrE/n1V150X4OuAAZl+tT
 FA0XLvzplNgrg/AJbWABqa45XsNFsypR0/vNXl0MypGX2M+UezPGZ/qZjxHivHaULl60
 8ExQ==
X-Gm-Message-State: APjAAAUzN7XYYXLHMAru9JXWaWvts025we6Goje8yzUNdX0JHc1+lX50
 RKJpUpSiS6WSggmOrOJ6yZHTj/NhMfBSBmIvPA8=
X-Google-Smtp-Source: APXvYqxfWQXe/revetG8OcHxoLSO+C4rvtM+iZ2yDoeH5xVKQGVFekFfcpOY44B1y/zaBEGyqdSPVOGpL5oVH7m5U7Y=
X-Received: by 2002:a17:906:3f87:: with SMTP id
 b7mr66827074ejj.164.1564068243156; 
 Thu, 25 Jul 2019 08:24:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190624194908.121273-1-john.stultz@linaro.org>
 <20190624194908.121273-3-john.stultz@linaro.org>
 <20190718100654.GA19666@infradead.org>
 <CALAqxLX1s4mbitE-_1s1vFPJrbrCKqpyhYoFW0V6hMEqE=eKVw@mail.gmail.com>
 <CAF6AEGuM1+pimGNhyKHbYR0BdH=hH+Sai0es8RjGHE9jKHjngw@mail.gmail.com>
 <20190724065530.GA16225@infradead.org>
 <3966dff1-864d-cad4-565f-7c7120301265@ti.com>
 <20190725124142.GA20286@infradead.org>
In-Reply-To: <20190725124142.GA20286@infradead.org>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 25 Jul 2019 08:23:51 -0700
Message-ID: <CAF6AEGuKMu+=HYxmOPUL-5gkU1a1aqCxbx+E2ygYQqy4gmZ0Xw@mail.gmail.com>
Subject: Re: [PATCH v6 2/5] dma-buf: heaps: Add heap helpers
To: Christoph Hellwig <hch@infradead.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Gryz4oIs4ZZI3Q3VIYP2tloVo1WnPxPFcILb2RQ/dVY=;
 b=ANBhQPrdPAoKQK9ZXEyziioz5qPzys4ZEmCTpfUDM+q3SbNO22FbkK9vjIs+oQ0Dev
 9Zyre+uqD8+HU/EWmJdiAUvufYIPbuTBbC8fFXK4fr7UnXSqXY9bhftHjTozL4OtMDMx
 sclACmp1vP04jHyYKBP57S+LQeIXTwoiQrqiOJP+FfdhqqUknT/I2QwKD1awQMDzYxZn
 gr7RD2mRWHgnqzGuvA8ls4cLw7uYU3nltdXA3zE/V3W7zjI45VLrTM+9JL5wwhanzaC9
 0HooyMM/mL9u8dYl3RMmgayqNrqbjvMsd9WsF+Pv6K/fc2BcRIt4BmcTBuMwnZ1OI/be
 V3AQ==
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
Cc: Yudongbin <yudongbin@hisilicon.com>, Xu YiPing <xuyiping@hisilicon.com>,
 Sudipto Paul <Sudipto.Paul@arm.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>,
 "Chenfeng \(puck\)" <puck.chen@hisilicon.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 "Andrew F. Davis" <afd@ti.com>, Hridya Valsaraju <hridya@google.com>,
 "Xiaqing \(A\)" <saberlily.xia@hisilicon.com>,
 Alistair Strachan <astrachan@google.com>,
 Pratik Patel <pratikp@codeaurora.org>, butao <butao@hisilicon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMjUsIDIwMTkgYXQgNTo0MSBBTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGlu
ZnJhZGVhZC5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCBKdWwgMjQsIDIwMTkgYXQgMTE6MjA6MzFB
TSAtMDQwMCwgQW5kcmV3IEYuIERhdmlzIHdyb3RlOgo+ID4gV2VsbCB0aGVuIGxldHMgdGhpbmsg
b24gdGhpcy4gQSBnaXZlbiBidWZmZXIgY2FuIGhhdmUgMyBvd25lcnMgc3RhdGVzCj4gPiAoQ1BV
LW93bmVkLCBEZXZpY2Utb3duZWQsIGFuZCBVbi1vd25lZCkuIFRoZXNlIGFyZSBiYXNlZCBvbiB0
aGUgY2FjaGluZwo+ID4gc3RhdGUgZnJvbSB0aGUgQ1BVIHBlcnNwZWN0aXZlLgo+ID4KPiA+IElm
IGEgYnVmZmVyIGlzIENQVS1vd25lZCB0aGVuIHdlIChMaW51eCkgY2FuIHdyaXRlIHRvIHRoZSBi
dWZmZXIgc2FmZWx5Cj4gPiB3aXRob3V0IHdvcnJ5IHRoYXQgdGhlIGRhdGEgaXMgc3RhbGUgb3Ig
dGhhdCBpdCB3aWxsIGJlIGFjY2Vzc2VkIGJ5IHRoZQo+ID4gZGV2aWNlIHdpdGhvdXQgaGF2aW5n
IGJlZW4gZmx1c2hlZC4gRGV2aWNlLW93bmVkIGJ1ZmZlcnMgc2hvdWxkIG5vdCBiZQo+ID4gYWNj
ZXNzZWQgYnkgdGhlIENQVSwgYW5kIGludGVyLWRldmljZSBzeW5jaHJvbml6YXRpb24gc2hvdWxk
IGJlIGhhbmRsZWQKPiA+IGJ5IGZlbmNpbmcgYXMgUm9iIHBvaW50cyBvdXQuIFVuLW93bmVkIGlz
IGhvdyBhIGJ1ZmZlciBzdGFydHMgZm9yCj4gPiBjb25zaXN0ZW5jeSBhbmQgdG8gcHJldmVudCB1
bm5lZWRlZCBjYWNoZSBvcGVyYXRpb25zIG9uIHVud3JpdHRlbiBidWZmZXJzLgo+Cj4gQ1BVIG93
bmVkIGFsc28gbmVlZHMgdG8gYmUgc3BsaXQgaW50byB3aGljaCBtYXBwaW5nIG93bnMgaXQgLSBp
biB0aGUKPiBub3JtYWwgRE1BIHRoaXMgaXMgdGhlIGtlcm5lbCBkaXJlY3QgbWFwcGluZywgYnV0
IGluIGRtYS1idWYgaXQgc2VlbXMKPiB0aGUgcHJpbWFyeSB3YXkgb2YgdXNpbmcgaXQgaW4ga2Vy
bmVsIHNwYWNlIGlzIHRoZSB2bWFwLCBpbiBhZGRpdGlvbgo+IHRvIHRoYXQgdGhlIG1hcHBpbmdz
IGNhbiBhbHNvIGJlIGV4cG9ydGVkIHRvIHVzZXJzcGFjZSwgd2hpY2ggaXMgYW5vdGhlcgo+IG1h
cHBpbmcgdGhhdCBpcyBwb3NzaWJseSBub3QgY2FjaGUgY29oZXJlbnQgd2l0aCB0aGUga2VybmVs
IG9uZS4KCkp1c3QgZm9yIHNvbWUgaGlzdG9yeSwgZG1hYnVmLT52bWFwKCkgaXMgb3B0aW9uYWws
IGFuZCBtb3N0bHkgYWRkZWQKZm9yIHRoZSBiZW5lZml0IG9mIGRybS91ZGwgKHVzYiBkaXNwbGF5
LCB3aGVyZSBDUFUgbmVlZHMgdG8gcmVhZCBvdXQKYW5kIGVuY29kZSAoPykgdGhlIHZpZGVvIHN0
cmVhbS4uIG1vc3Qgb2YgdGhlIGRybSBkcml2ZXJzIGFyZSB1c2luZwp0bXBmcyB0byBnZXQgYmFj
a2luZyBwYWdlcywgYW5kIGlmIHRoZXJlIGlzIGFueSBrZXJuZWwgZGlyZWN0IG1hcHBpbmcKaXQg
aXMgdW51c2VkLgoKSXQgaXMgcHJvYmFibHkgb2sgZm9yIGFueSBhbGxvY2F0b3IgdGhhdCBkb2Vz
IGNhcmUgYWJvdXQgYSBrZXJuZWwKZGlyZWN0IG1hcHBpbmcgdG8gc2ltcGx5IG5vdCBpbXBsZW1l
bnQgdm1hcC4KCkJSLAotUgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
