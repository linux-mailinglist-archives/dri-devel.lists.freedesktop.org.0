Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 747BD9FD07
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 10:29:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1082589CF6;
	Wed, 28 Aug 2019 08:29:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9547689BB0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 22:50:04 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id p13so672419qkg.13
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 15:50:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wvbxx4ccqSopo6dw1T9H2ot9rAMHA6WLEPDaHjHucJY=;
 b=FrW+9mwczC/IorviCwof6d3kKEGYgMi0z86ohzgaPutDPBEOFzETzv6itIl3aCSEXp
 g1jvSqZ0OYcbP+6wx5o8buOXG/dQWrzOEev5WLYgwDe9vd9vTjhHu8ZOUeIvf1k8ed2z
 LDJc7mrEOcG1uQQd/dh1PRSq9ZUu5NTFnmA+IAw0kmM6xTdAZc3XbqDmQJuRqIQBGaGw
 Ix4l3gXAVaLnYfyotxFywf99rGysD0YLi3E0TFMwBKhk+R17Bn4HZS1I3gCNWaMCwLr7
 S+9knLMwXXK1v5FVgjI+OEnRRvlYt6GMGMeGL/mJoOXdp1Wn8Tr5BV/1ymqtqM/1WBM2
 /cJQ==
X-Gm-Message-State: APjAAAXQryYXwn0nssNh5pdfdS/m9Z/EJ+ulI+supE15NJnSaeIw7kx0
 3Jz2ti7eTlL6fg/yrYd9PgDjrw==
X-Google-Smtp-Source: APXvYqxqh4ld+dCY1F+Gxi2MvhzLzUFGX5vkgAecdyGzetWgXsgxRnoQk74kx0sQLjgzbiYeDG4CYw==
X-Received: by 2002:a05:620a:1181:: with SMTP id
 b1mr1065290qkk.390.1566946203681; 
 Tue, 27 Aug 2019 15:50:03 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-167-216-168.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.167.216.168])
 by smtp.gmail.com with ESMTPSA id n21sm267524qtc.70.2019.08.27.15.50.03
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 27 Aug 2019 15:50:03 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1i2kHq-0002zw-Kb; Tue, 27 Aug 2019 19:50:02 -0300
Date: Tue, 27 Aug 2019 19:50:02 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 3/5] kernel.h: Add non_block_start/end()
Message-ID: <20190827225002.GB30700@ziepe.ca>
References: <20190826201425.17547-1-daniel.vetter@ffwll.ch>
 <20190826201425.17547-4-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190826201425.17547-4-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 28 Aug 2019 08:28:09 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=wvbxx4ccqSopo6dw1T9H2ot9rAMHA6WLEPDaHjHucJY=;
 b=ZK51FUwvHLccMgAA0yWjpHkLs4LFcK2g5UlZlz76bZcr7FZPe2gjulNbPgD0jnIyar
 XXNn9AS3YfLa6c8O1XeFpP5YJXbcLHD4VcvJEtpEKVjcit7ToBwdJn7yqNz2POkatc6L
 ncshO5DzUExnF8JCtaP1I3KWUBarRmFWt9q0XNKiBE49HzCXPI2p1xxXOe04ytzaMFpn
 dnrKpg6aQBozNfP03E/nvYIxXNjYKB3Qx2GJCg5gytAUq0CSVOryjn/VA6GX4L3+of9e
 mmre0FUekO9C8vzem6bChjRnbmQziqa31OY44dR7wF2ErUekuM7GwNU3EwayaSQJ/GwU
 Ungg==
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
Cc: Feng Tang <feng.tang@intel.com>, Michal Hocko <mhocko@suse.com>,
 Kees Cook <keescook@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Peter Zijlstra <peterz@infradead.org>, Jann Horn <jannh@google.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Randy Dunlap <rdunlap@infradead.org>, David Rientjes <rientjes@google.com>,
 Wei Wang <wvw@google.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9rZXJuZWwuaCBiL2luY2x1ZGUvbGludXgva2Vy
bmVsLmgKPiBpbmRleCA0ZmEzNjBhMTNjMWUuLjgyZjg0Y2ZlMzcyZiAxMDA2NDQKPiArKysgYi9p
bmNsdWRlL2xpbnV4L2tlcm5lbC5oCj4gQEAgLTIxNyw3ICsyMTcsOSBAQCBleHRlcm4gdm9pZCBf
X2NhbnRfc2xlZXAoY29uc3QgY2hhciAqZmlsZSwgaW50IGxpbmUsIGludCBwcmVlbXB0X29mZnNl
dCk7Cj4gICAqIG1pZ2h0X3NsZWVwIC0gYW5ub3RhdGlvbiBmb3IgZnVuY3Rpb25zIHRoYXQgY2Fu
IHNsZWVwCj4gICAqCj4gICAqIHRoaXMgbWFjcm8gd2lsbCBwcmludCBhIHN0YWNrIHRyYWNlIGlm
IGl0IGlzIGV4ZWN1dGVkIGluIGFuIGF0b21pYwo+IC0gKiBjb250ZXh0IChzcGlubG9jaywgaXJx
LWhhbmRsZXIsIC4uLikuCj4gKyAqIGNvbnRleHQgKHNwaW5sb2NrLCBpcnEtaGFuZGxlciwgLi4u
KS4gQWRkaXRpb25hbCBzZWN0aW9ucyB3aGVyZSBibG9ja2luZyBpcwo+ICsgKiBub3QgYWxsb3dl
ZCBjYW4gYmUgYW5ub3RhdGVkIHdpdGggbm9uX2Jsb2NrX3N0YXJ0KCkgYW5kIG5vbl9ibG9ja19l
bmQoKQo+ICsgKiBwYWlycy4KPiAgICoKPiAgICogVGhpcyBpcyBhIHVzZWZ1bCBkZWJ1Z2dpbmcg
aGVscCB0byBiZSBhYmxlIHRvIGNhdGNoIHByb2JsZW1zIGVhcmx5IGFuZCBub3QKPiAgICogYmUg
Yml0dGVuIGxhdGVyIHdoZW4gdGhlIGNhbGxpbmcgZnVuY3Rpb24gaGFwcGVucyB0byBzbGVlcCB3
aGVuIGl0IGlzIG5vdAo+IEBAIC0yMzMsNiArMjM1LDI1IEBAIGV4dGVybiB2b2lkIF9fY2FudF9z
bGVlcChjb25zdCBjaGFyICpmaWxlLCBpbnQgbGluZSwgaW50IHByZWVtcHRfb2Zmc2V0KTsKPiAg
IyBkZWZpbmUgY2FudF9zbGVlcCgpIFwKPiAgCWRvIHsgX19jYW50X3NsZWVwKF9fRklMRV9fLCBf
X0xJTkVfXywgMCk7IH0gd2hpbGUgKDApCj4gICMgZGVmaW5lIHNjaGVkX2Fubm90YXRlX3NsZWVw
KCkJKGN1cnJlbnQtPnRhc2tfc3RhdGVfY2hhbmdlID0gMCkKPiArLyoqCj4gKyAqIG5vbl9ibG9j
a19zdGFydCAtIGFubm90YXRlIHRoZSBzdGFydCBvZiBzZWN0aW9uIHdoZXJlIHNsZWVwaW5nIGlz
IHByb2hpYml0ZWQKPiArICoKPiArICogVGhpcyBpcyBvbiBiZWhhbGYgb2YgdGhlIG9vbSByZWFw
ZXIsIHNwZWNpZmljYWxseSB3aGVuIGl0IGlzIGNhbGxpbmcgdGhlIG1tdQo+ICsgKiBub3RpZmll
cnMuIFRoZSBwcm9ibGVtIGlzIHRoYXQgaWYgdGhlIG5vdGlmaWVyIHdlcmUgdG8gYmxvY2sgb24s
IGZvciBleGFtcGxlLAo+ICsgKiBtdXRleF9sb2NrKCkgYW5kIGlmIHRoZSBwcm9jZXNzIHdoaWNo
IGhvbGRzIHRoYXQgbXV0ZXggd2VyZSB0byBwZXJmb3JtIGEKPiArICogc2xlZXBpbmcgbWVtb3J5
IGFsbG9jYXRpb24sIHRoZSBvb20gcmVhcGVyIGlzIG5vdyBibG9ja2VkIG9uIGNvbXBsZXRpb24g
b2YKPiArICogdGhhdCBtZW1vcnkgYWxsb2NhdGlvbi4gT3RoZXIgYmxvY2tpbmcgY2FsbHMgbGlr
ZSB3YWl0X2V2ZW50KCkgcG9zZSBzaW1pbGFyCj4gKyAqIGlzc3Vlcy4KPiArICovCj4gKyMgZGVm
aW5lIG5vbl9ibG9ja19zdGFydCgpIFwKPiArCWRvIHsgY3VycmVudC0+bm9uX2Jsb2NrX2NvdW50
Kys7IH0gd2hpbGUgKDApCj4gKy8qKgo+ICsgKiBub25fYmxvY2tfZW5kIC0gYW5ub3RhdGUgdGhl
IGVuZCBvZiBzZWN0aW9uIHdoZXJlIHNsZWVwaW5nIGlzIHByb2hpYml0ZWQKPiArICoKPiArICog
Q2xvc2VzIGEgc2VjdGlvbiBvcGVuZWQgYnkgbm9uX2Jsb2NrX3N0YXJ0KCkuCj4gKyAqLwo+ICsj
IGRlZmluZSBub25fYmxvY2tfZW5kKCkgXAo+ICsJZG8geyBXQVJOX09OKGN1cnJlbnQtPm5vbl9i
bG9ja19jb3VudC0tID09IDApOyB9IHdoaWxlICgwKQoKY2hlY2stcGF0Y2ggZG9lcyBub3QgbGlr
ZSB0aGVzZSwgYW5kIEkgYWdyZWUKCiMxMDE6IEZJTEU6IGluY2x1ZGUvbGludXgva2VybmVsLmg6
MjQ4OgorIyBkZWZpbmUgbm9uX2Jsb2NrX3N0YXJ0KCkgXAorCWRvIHsgY3VycmVudC0+bm9uX2Js
b2NrX2NvdW50Kys7IH0gd2hpbGUgKDApCgovdG1wL3RtcDFzcGZ4dWZ5LzAwMDYta2VybmVsLWgt
QWRkLW5vbl9ibG9ja19zdGFydC1lbmQtLnBhdGNoOjEwODogV0FSTklORzogU2luZ2xlIHN0YXRl
bWVudCBtYWNyb3Mgc2hvdWxkIG5vdCB1c2UgYSBkbyB7fSB3aGlsZSAoMCkgbG9vcAojMTA4OiBG
SUxFOiBpbmNsdWRlL2xpbnV4L2tlcm5lbC5oOjI1NToKKyMgZGVmaW5lIG5vbl9ibG9ja19lbmQo
KSBcCisJZG8geyBXQVJOX09OKGN1cnJlbnQtPm5vbl9ibG9ja19jb3VudC0tID09IDApOyB9IHdo
aWxlICgwKQoKUGxlYXNlIHVzZSBhIHN0YXRpYyBpbmxpbmU/CgpBbHNvLCBjYW4gd2UgZ2V0IG9u
ZSBtb3JlIGFjayBvbiB0aGlzIHBhdGNoPwoKSmFzb24KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
