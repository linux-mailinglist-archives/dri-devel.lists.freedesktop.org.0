Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9502497394
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 09:33:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5979A6E926;
	Wed, 21 Aug 2019 07:33:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE0496E5D2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 13:34:19 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id j15so5955680qtl.13
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 06:34:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=xkla8yZpkWsn7BQhjD5NVqgPEeC/v8sq4Q+tGQW7NAA=;
 b=YSrbjk9R0vgc1Mgl9AVzI7fJRtzn+pGR27JHs7E8+N2rc7H8DPsj4TWX7tnI8tofX1
 3ZD2vRB/RHMcDUUAmuHmI1+EmOWwFWJ1EX2j9lc2evWMvpEzBrgN5wCNNugalbJfkafh
 PA6sfyG/SAG2xfZZ6aJFt2lwzLmUyprBo8CWynOD+Yz8zh7SIxRCryYqWcDBs/QIm5Ks
 ptiMzOJ+D2peTH3V2XPPfm0cjBhT/dR1wFQIRxUFAXWLm5DK6inT5Md3gFe6zM55lp5G
 eIQk/q9OK/rCEJjtEnYOvfxl1u5GfCn1ykJejemKy1JnDdCXne9zRd+hzS4+AYyEgCMe
 RpLg==
X-Gm-Message-State: APjAAAULTSEl+rvD6JB9/7QEDfPkFYh9G9lCn1efevGgMOhed7w8zhoC
 Z4RjlEAcjFda1nNZGyTdUBQbgw==
X-Google-Smtp-Source: APXvYqwFrEe87m5OQXGPINdZ2bSNi3jP/uT5gUvqjHoY/CkByObbCPrlNUFCkrMtjbnMymplA2SbCQ==
X-Received: by 2002:ac8:53d3:: with SMTP id c19mr26516722qtq.225.1566308058877; 
 Tue, 20 Aug 2019 06:34:18 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id a23sm2037193qtj.5.2019.08.20.06.34.18
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 20 Aug 2019 06:34:18 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1i04HC-0000ct-4x; Tue, 20 Aug 2019 10:34:18 -0300
Date: Tue, 20 Aug 2019 10:34:18 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 4/4] mm, notifier: Catch sleeping/blocking for !blockable
Message-ID: <20190820133418.GG29246@ziepe.ca>
References: <20190820081902.24815-1-daniel.vetter@ffwll.ch>
 <20190820081902.24815-5-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190820081902.24815-5-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 21 Aug 2019 07:33:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=xkla8yZpkWsn7BQhjD5NVqgPEeC/v8sq4Q+tGQW7NAA=;
 b=EPfWbdLDIn9vYVNO92ekXg+Aqpk0N5AXlzR+0ptOOJgqHA7T2kwzvvGoWZuIvAfr/3
 0teKv2tf6kXm8zvOpJTZOgVyZgQEWvFiIxWu2cHJekpwmLDQC47QSg31UJZq5zb6Zu2R
 2IMDu+hVU12h9dIC7m/oQKnPEg4M1wIExBMafHRztS8uRKUSSBuZoFGd+3SaDkI6kpo9
 vvV6E/GjnRwfaJI3KJtUSJ1QIWuQ+GlNO4j01Dn9gcdYYIUQ/8xiMeu1LW4OuDyU/Q+B
 Nol5QsZWTj23vCJ3rkWepIYMWSEfA+1YPrUaB+2ZG3+Rn8BlPBDbWfse0wb2WYK0ODxI
 VHsw==
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
Cc: Michal Hocko <mhocko@suse.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 David Rientjes <rientjes@google.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMjAsIDIwMTkgYXQgMTA6MTk6MDJBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBXZSBuZWVkIHRvIG1ha2Ugc3VyZSBpbXBsZW1lbnRhdGlvbnMgZG9uJ3QgY2hlYXQg
YW5kIGRvbid0IGhhdmUgYQo+IHBvc3NpYmxlIHNjaGVkdWxlL2Jsb2NraW5nIHBvaW50IGRlZXBs
eSBidXJyaWVkIHdoZXJlIHJldmlldyBjYW4ndAo+IGNhdGNoIGl0Lgo+IAo+IEknbSBub3Qgc3Vy
ZSB3aGV0aGVyIHRoaXMgaXMgdGhlIGJlc3Qgd2F5IHRvIG1ha2Ugc3VyZSBhbGwgdGhlCj4gbWln
aHRfc2xlZXAoKSBjYWxsc2l0ZXMgdHJpZ2dlciwgYW5kIGl0J3MgYSBiaXQgdWdseSBpbiB0aGUg
Y29kZSBmbG93Lgo+IEJ1dCBpdCBnZXRzIHRoZSBqb2IgZG9uZS4KPiAKPiBJbnNwaXJlZCBieSBh
biBpOTE1IHBhdGNoIHNlcmllcyB3aGljaCBkaWQgZXhhY3RseSB0aGF0LCBiZWNhdXNlIHRoZQo+
IHJ1bGVzIGhhdmVuJ3QgYmVlbiBlbnRpcmVseSBjbGVhciB0byB1cy4KPiAKPiB2MjogVXNlIHRo
ZSBzaGlueSBuZXcgbm9uX2Jsb2NrX3N0YXJ0L2VuZCBhbm5vdGF0aW9ucyBpbnN0ZWFkIG9mCj4g
YWJ1c2luZyBwcmVlbXB0X2Rpc2FibGUvZW5hYmxlLgo+IAo+IHYzOiBSZWJhc2Ugb24gdG9wIG9m
IEdsaXNzZSdzIGFyZyByZXdvcmsuCj4gCj4gdjQ6IFJlYmFzZSBvbiB0b3Agb2YgbW9yZSBHbGlz
c2UgcmV3b3JrLgo+IAo+IENjOiBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVwZS5jYT4KPiBDYzog
QW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4KPiBDYzogTWljaGFsIEhv
Y2tvIDxtaG9ja29Ac3VzZS5jb20+Cj4gQ2M6IERhdmlkIFJpZW50amVzIDxyaWVudGplc0Bnb29n
bGUuY29tPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNv
bT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiBDYzogIkrD
qXLDtG1lIEdsaXNzZSIgPGpnbGlzc2VAcmVkaGF0LmNvbT4KPiBDYzogbGludXgtbW1Aa3ZhY2su
b3JnCj4gUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4KPiBSZXZpZXdlZC1ieTogSsOpcsO0bWUgR2xpc3NlIDxqZ2xpc3NlQHJlZGhhdC5jb20+
Cj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+
Cj4gIG1tL21tdV9ub3RpZmllci5jIHwgOCArKysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgNyBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL21tL21tdV9ub3Rp
Zmllci5jIGIvbW0vbW11X25vdGlmaWVyLmMKPiBpbmRleCA1MzhkM2JiODdmOWIuLjg1NjYzNmQw
NmVlMCAxMDA2NDQKPiArKysgYi9tbS9tbXVfbm90aWZpZXIuYwo+IEBAIC0xODEsNyArMTgxLDEz
IEBAIGludCBfX21tdV9ub3RpZmllcl9pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0KHN0cnVjdCBtbXVf
bm90aWZpZXJfcmFuZ2UgKnJhbmdlKQo+ICAJaWQgPSBzcmN1X3JlYWRfbG9jaygmc3JjdSk7Cj4g
IAlobGlzdF9mb3JfZWFjaF9lbnRyeV9yY3UobW4sICZyYW5nZS0+bW0tPm1tdV9ub3RpZmllcl9t
bS0+bGlzdCwgaGxpc3QpIHsKPiAgCQlpZiAobW4tPm9wcy0+aW52YWxpZGF0ZV9yYW5nZV9zdGFy
dCkgewo+IC0JCQlpbnQgX3JldCA9IG1uLT5vcHMtPmludmFsaWRhdGVfcmFuZ2Vfc3RhcnQobW4s
IHJhbmdlKTsKPiArCQkJaW50IF9yZXQ7Cj4gKwo+ICsJCQlpZiAoIW1tdV9ub3RpZmllcl9yYW5n
ZV9ibG9ja2FibGUocmFuZ2UpKQo+ICsJCQkJbm9uX2Jsb2NrX3N0YXJ0KCk7Cj4gKwkJCV9yZXQg
PSBtbi0+b3BzLT5pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0KG1uLCByYW5nZSk7Cj4gKwkJCWlmICgh
bW11X25vdGlmaWVyX3JhbmdlX2Jsb2NrYWJsZShyYW5nZSkpCj4gKwkJCQlub25fYmxvY2tfZW5k
KCk7CgpJZiBzb21lb25lIEFja3MgYWxsIHRoZSBzY2hlZCBjaGFuZ2VzIHRoZW4gSSBjYW4gcGlj
ayB0aGlzIGZvcgpobW0uZ2l0LCBidXQgSSBzdGlsbCB0aGluayB0aGUgZXhpc3RpbmcgcHJlLWVt
cHRpb24gZGVidWdnaW5nIGlzIGZpbmUKZm9yIHRoaXMgdXNlIGNhc2UuCgpBbHNvLCBzYW1lIGNv
bW1lbnQgYXMgZm9yIHRoZSBsb2NrZGVwIG1hcCwgdGhpcyBuZWVkcyB0byBhcHBseSB0byB0aGUK
bm9uLWJsb2NraW5nIHJhbmdlX2VuZCBhbHNvLgoKQW55aG93LCBzaW5jZSB0aGlzIHNlcmllcyBo
YXMgY29uZmxpY3RzIHdpdGggaG1tLmdpdCBpdCB3b3VsZCBiZSBiZXN0CnRvIGZsb3cgdGhyb3Vn
aCB0aGUgd2hvbGUgdGhpbmcgdGhyb3VnaCB0aGF0IHRyZWUuIElmIHRoZXJlIGFyZSBubwpyZW1h
cmtzIG9uIHRoZSBmaXJzdCB0d28gcGF0Y2hlcyBJJ2xsIGdyYWIgdGhlbSBpbiBhIGZldyBkYXlz
LgoKUmVnYXJkcywKSmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
