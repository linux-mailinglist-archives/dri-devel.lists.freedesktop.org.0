Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD483710C7
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 07:04:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A667489183;
	Tue, 23 Jul 2019 05:04:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C369A890CD
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 05:04:20 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 207so37145704wma.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 22:04:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8oVnWnzi5t2ouuMP0eGavMEOYBbckZs3soRWMye7A3o=;
 b=d8gck3/WcDmhmDspelYikDvDJMpBGZ6C5RQflRRg4JUsz6nm24OO8516LdQt7j4dOg
 docFbZPj1GrwEnRWE8v2Ejrph2szjUVs7eMER4rNjeXG40/wuDu/K8nMk3pzgJRTd0ZR
 +UHS+IFCL+5PWxzJJRR396fUHdz+jPSaXtBbGns+MXBXtCucFZcYl0jW5Rzsjr9gEykL
 C9Su2XNMSyENsE6fBKw0TQkEJor/kqQpE+x2OavnCeUflpt/oiMgjb92Sx2kSxHQlHih
 CUTA2vvKoAm0m3y6Fr8EGMuHbDlohAAjgCk5mfnFfMNLjuJAW+NxpnPvzn8cTEhS16lb
 B1Xg==
X-Gm-Message-State: APjAAAUt+ihKe5qxXKWhwtPRGr/M17g8ufADxToXdMOJp0H/HmP6Xz7C
 6KrZ2rAXV0HNyx9YrTlrrP/FJl/7KlgCxE6atXZLRA==
X-Google-Smtp-Source: APXvYqwLaS2TIIfJuchAuhHJsud5rGFa5EqNh0YWUyPNMsJANOOfza+5SubRnk7NDi1uUYWJdsfQ7Nag1k0pT6fZe/8=
X-Received: by 2002:a1c:d10c:: with SMTP id i12mr66789877wmg.152.1563858259317; 
 Mon, 22 Jul 2019 22:04:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190624194908.121273-1-john.stultz@linaro.org>
 <20190624194908.121273-5-john.stultz@linaro.org>
 <20190718100840.GB19666@infradead.org>
In-Reply-To: <20190718100840.GB19666@infradead.org>
From: John Stultz <john.stultz@linaro.org>
Date: Mon, 22 Jul 2019 22:04:06 -0700
Message-ID: <CALAqxLWLx_tHVjZqrSNWfQ_M2RGGqh4qth3hi9GGRdSPov-gcw@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] dma-buf: heaps: Add CMA heap to dmabuf heaps
To: Christoph Hellwig <hch@infradead.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=8oVnWnzi5t2ouuMP0eGavMEOYBbckZs3soRWMye7A3o=;
 b=coS07tBPBC7wYQb0eVBCkLCJHa4uo26V40PmAD1PciVsJ9+1hh8Sm5UEYObGVO9BS8
 fYSi/QHlhVoWMRoubXXhjAb0XeKWwvUKRxoDlnFaMRplWhdjd9PpR7S84tE/HxAJh3FG
 WydE/5pV6kYzUGuIlLDDCOOMAjLLEnakhWMOls8hMz8lJqj4rnEcrEKIF9OwwYFH260M
 yklxy5IVbUa66uso0MGCvPw4QdLDNT9A+/y39rvSm4nqLHSwh0O+hUaxivHVz7JNka6X
 iMRMF5Nou7E0g8FGl7rRGa6uP0e/j9AiyujcAcKjZBeLatsFzNa6vTOx+hth40ePL85e
 b+AQ==
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
Cc: Yudongbin <yudongbin@hisilicon.com>, Sudipto Paul <Sudipto.Paul@arm.com>,
 Xu YiPing <xuyiping@hisilicon.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>,
 "Chenfeng \(puck\)" <puck.chen@hisilicon.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 Alistair Strachan <astrachan@google.com>,
 "Xiaqing \(A\)" <saberlily.xia@hisilicon.com>, "Andrew F . Davis" <afd@ti.com>,
 Pratik Patel <pratikp@codeaurora.org>, butao <butao@hisilicon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgMzowOCBBTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGlu
ZnJhZGVhZC5vcmc+IHdyb3RlOgo+Cj4gVGhpcyBhbmQgdGhlIHByZXZpb3VzIG9uZSBzZWVtIHZl
cnkgbXVjaCBkdXBsaWNhdGVkIGJvaWxlcnBsYXRlCj4gY29kZS4KClNvIHllcywgdGhlcmUgaXMg
c29tZSBkdXBsaWNhdGUgYm9pbGVycGxhdGUgYmV0d2VlbiB0aGUgc3lzdGVtIGFuZCBjbWEKaGVh
cHMgcGFydGljdWxhcmx5IGluIHRoZSBhbGxvY2F0aW9uIGZ1bmN0aW9uLCB3aGVyZSB3ZSBhbGxv
Y2F0ZSBhbmQKc2V0IHVwIHRoZSBoZWxwZXIgYnVmZmVyIHN0cnVjdHVyZSwgYWxsb2NhdGUgdGhl
IHBhZ2VzLCB0aGVuIGNyZWF0ZQphbmQgZXhwb3J0IHRoZSBkbWFidWYuIEkgdG9vayBhIHBhc3Mg
YXQgdHJ5aW5nIHRvIG1pbmltaXplIHNvbWUgb2YKdGhpcyBlYXJsaWVyLCBidXQgdGhvc2UgZWZm
b3J0cyBlbmRlZCB1cCBhZGRpbmcgaGVscGVyIGZ1bmN0aW9ucyB0aGF0CnRha2UgYSB0b24gb2Yg
YXJndW1lbnRzLCBhbmQgaGFkIHNvbWUgdHJvdWJsZSBwcm9wZXJseSBoYW5kbGluZyBlcnJvcgpw
YXRocyB3aXRob3V0IGxlYWtpbmcgbWVtb3J5LCBzbyBJIGxlZnQgaXQgYXMgaXMuCgpJJ2xsIHRy
eSB0byB0YWtlIGFub3RoZXIgcGFzcyBteXNlbGYgYnV0IGlmIHlvdSBoYXZlIHNwZWNpZmljCnN1
Z2dlc3Rpb25zIGZvciBpbXByb3ZpbmcgaGVyZSwgSSdkIGJlIGhhcHB5IHRvIHRyeSB0aGVtLgoK
PiBXaHkgY2FuJ3QganVzdCBub3JtYWwgYnJhbmNoZXMgZm9yIGFsbG9jYXRpbmcgYW5kIGZyZWVp
bmcKPiBub3JtYWwgcGFnZXMgdnMgY21hPyAgV2UgZXZlbiBoYXZlIGFuIGV4aXN0aW5nIGhlbHBl
ciBmb3IgdGhhdAo+IHdpdGggZG1hX2FsbG9jX2NvbnRpZ3VvdXMoKS4KCkFwb2xvZ2llcywgSSdt
IG5vdCBzdXJlIEknbSB1bmRlcnN0YW5kaW5nIHlvdXIgc3VnZ2VzdGlvbiBoZXJlLgpkbWFfYWxs
b2NfY29udGlndW91cygpIGRvZXMgaGF2ZSBzb21lIGludGVyZXN0aW5nIG9wdGltaXphdGlvbnMK
KGF2b2lkaW5nIGFsbG9jYXRpbmcgc2luZ2xlIHBhZ2UgZnJvbSBjbWEpLCB0aG91Z2ggaXRzIGZv
Y3VzIG9uCmRlZmF1bHQgYXJlYSB2cyBzcGVjaWZpYyBkZXZpY2UgYXJlYSBkb2Vzbid0IHF1aXRl
IG1hdGNoIHVwIHRoZSB1c2FnZQptb2RlbCBmb3IgZG1hIGhlYXBzLiAgSW5zdGVhZCBvZiBhbGxv
Y2F0aW5nIG1lbW9yeSBmb3IgYSBzaW5nbGUKZGV2aWNlLCB3ZSB3YW50IHRvIGJlIGFibGUgdG8g
YWxsb3cgdXNlcmxhbmQsIGZvciBhIGdpdmVuIHVzYWdlIG1vZGUsCnRvIGJlIGFibGUgdG8gYWxs
b2NhdGUgYSBkbWFidWYgZnJvbSBhIHNwZWNpZmljIGhlYXAgb2YgbWVtb3J5IHdoaWNoCndpbGwg
c2F0aXNmeSB0aGUgdXNhZ2UgbW9kZSBmb3IgdGhhdCBidWZmZXIgcGlwZWxpbmUgKGFjcm9zcyBt
dWx0aXBsZQpkZXZpY2VzKS4KCk5vdywgaW5kZWVkLCB0aGUgc3lzdGVtIGFuZCBjbWEgaGVhcHMg
aW4gdGhpcyBwYXRjaHNldCBhcmUgYSBiaXQKc2ltcGxlL3RyaXZpYWwgKHRob3VnaCB1c2VmdWwg
d2l0aCBteSBkZXZpY2VzIHRoYXQgcmVxdWlyZSBjb250aWd1b3VzCmJ1ZmZlcnMgZm9yIHRoZSBk
aXNwbGF5IGRyaXZlciksIGJ1dCBtb3JlIGNvbXBsZXggSU9OIGhlYXBzIGhhdmUKdHJhZGl0aW9u
YWxseSBzdGF5ZWQgb3V0IG9mIHRyZWUgaW4gdmVuZG9yIGNvZGUsIGluIG1hbnkgY2FzZXMgbWFr
aW5nCmluY29tcGF0aWJsZSB0d2Vha3MgdG8gdGhlIElPTiBjb3JlIGRtYWJ1ZiBleHBvcnRlciBs
b2dpYy4gVGhhdCdzIHdoeQpkbWFidWYgaGVhcHMgaXMgdHJ5aW5nIHRvIGRlc3RhZ2UgSU9OIGlu
IGEgd2F5IHRoYXQgYWxsb3dzIGhlYXBzIHRvCmltcGxlbWVudCB0aGVpciBleHBvcnRlciBsb2dp
YyB0aGVtc2VsdmVzLCBzbyB3ZSBjYW4gc3RhcnQgcHVsbGluZwp0aG9zZSBtb3JlIGNvbXBsaWNh
dGVkIGhlYXBzIG91dCBvZiB0aGVpciB2ZW5kb3IgaGlkZXktaG9sZXMgYW5kIGdldApzb21lIHBy
b3BlciB1cHN0cmVhbSByZXZpZXcuCgpCdXQgSSBzdXNwZWN0IEkganVzdCBhbSBjb25mdXNlZCBh
cyB0byB3aGF0IHlvdXIgc3VnZ2VzdGluZy4gTWF5YmUKY291bGQgeW91IGV4cGFuZCBhIGJpdD8g
QXBvbG9naWVzIGZvciBiZWluZyBhIGJpdCBkZW5zZS4KClRoYW5rcyBhZ2FpbiBmb3IgdGhlIGlu
cHV0IQotam9obgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
