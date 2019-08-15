Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3600D91196
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:27:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E49BB882C2;
	Sat, 17 Aug 2019 15:24:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36D9B6E3DD
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 12:23:46 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id m2so1587957qki.12
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 05:23:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=h/NjbiF58YEr9Revz70cBCU6NfRlKsj4YDdyw6gTZ8c=;
 b=miRYrdzqZGRdagerYbM2QLak3GjssGfggExPtsnbShmJBkbb5rNTdwP2Mljl5usJsH
 N5MTQ2FhXnaXkpF9M8kpT7CuCF5YILy+stSXiYhvNmiNn8Hp2CLJFEBHoKqxQb049fFZ
 rKNSadFltKkdATsks7ajRR5yCwjPL/ubIe4in/cJ3+2QE0tKbpAvlopqU4ZfTgASbv5a
 mkhS584BKI00mIOjLI4p2n8r/pN6siZ0f3xgYEtTN3KqPXjGUn6gshjBbVJ3x9jElI5Q
 zUG88ucXi2jxDDZchyTqetKEek7YD5LR+9q+D4Vp4jbbKlh7MVGyuFMY3FN9JvjsAT07
 cg7A==
X-Gm-Message-State: APjAAAXQUK8giS1bfXJwsSJBbd1GQc86AD6YG6qrpPVK8u/v2AgiXdg1
 roTd1h67WDOjlVlV4s2Tw8EwEA==
X-Google-Smtp-Source: APXvYqxCyiP6QSE5R+6YFBEjPHkw2WqRgEuobxPJuNaULXaRzrprJ2WNqFxX5NyrcJoKKaFuoawKgg==
X-Received: by 2002:a37:6646:: with SMTP id a67mr3849693qkc.216.1565871825180; 
 Thu, 15 Aug 2019 05:23:45 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id y26sm1796517qta.39.2019.08.15.05.23.44
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 15 Aug 2019 05:23:44 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hyEnA-0005js-3K; Thu, 15 Aug 2019 09:23:44 -0300
Date: Thu, 15 Aug 2019 09:23:44 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@suse.com>,
 David Rientjes <rientjes@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, Wei Wang <wvw@google.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Jann Horn <jannh@google.com>,
 Feng Tang <feng.tang@intel.com>, Kees Cook <keescook@chromium.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Subject: Re: [PATCH 2/5] kernel.h: Add non_block_start/end()
Message-ID: <20190815122344.GA21596@ziepe.ca>
References: <20190814202027.18735-1-daniel.vetter@ffwll.ch>
 <20190814202027.18735-3-daniel.vetter@ffwll.ch>
 <20190814235805.GB11200@ziepe.ca>
 <20190815065829.GA7444@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190815065829.GA7444@phenom.ffwll.local>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=h/NjbiF58YEr9Revz70cBCU6NfRlKsj4YDdyw6gTZ8c=;
 b=QRZRxa6uW2hXnZ8eTQQopuiBP271xdX+fOVcfPMGphMyj4qkZvTA3bvr3NVcTUgJ4b
 g7cYi9DXfd0nx1PJiB9zbyYexUEnL/TyKFcnqlU9itbQYJHcBk+NvXCIHLr5vydDsaW9
 HxtfvgAhk6C9z6XxJVL8DA/IHRUSIdqgv2XFb6qgKqy9wN5SaMKB+tWodxYHj2Tazxb5
 wr/TBDbDuNuNTvUV0pyE8dW8Yn8CfWpaCEwqP98qN2Bz0do/zjPBG+R1JBOrTPi0uVf2
 Bhi3rzbQ6C2OZrhz/8Bcnwq3iay/pTHkFiKuorlhvYkpuVxUaUla+QeaeraKcsqaURqL
 xCIg==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMDg6NTg6MjlBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBXZWQsIEF1ZyAxNCwgMjAxOSBhdCAwODo1ODowNVBNIC0wMzAwLCBKYXNvbiBH
dW50aG9ycGUgd3JvdGU6Cj4gPiBPbiBXZWQsIEF1ZyAxNCwgMjAxOSBhdCAxMDoyMDoyNFBNICsw
MjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+ID4gPiBJbiBzb21lIHNwZWNpYWwgY2FzZXMgd2Ug
bXVzdCBub3QgYmxvY2ssIGJ1dCB0aGVyZSdzIG5vdCBhCj4gPiA+IHNwaW5sb2NrLCBwcmVlbXB0
LW9mZiwgaXJxcy1vZmYgb3Igc2ltaWxhciBjcml0aWNhbCBzZWN0aW9uIGFscmVhZHkKPiA+ID4g
dGhhdCBhcm1zIHRoZSBtaWdodF9zbGVlcCgpIGRlYnVnIGNoZWNrcy4gQWRkIGEgbm9uX2Jsb2Nr
X3N0YXJ0L2VuZCgpCj4gPiA+IHBhaXIgdG8gYW5ub3RhdGUgdGhlc2UuCj4gPiA+IAo+ID4gPiBU
aGlzIHdpbGwgYmUgdXNlZCBpbiB0aGUgb29tIHBhdGhzIG9mIG1tdS1ub3RpZmllcnMsIHdoZXJl
IGJsb2NraW5nIGlzCj4gPiA+IG5vdCBhbGxvd2VkIHRvIG1ha2Ugc3VyZSB0aGVyZSdzIGZvcndh
cmQgcHJvZ3Jlc3MuIFF1b3RpbmcgTWljaGFsOgo+ID4gPiAKPiA+ID4gIlRoZSBub3RpZmllciBp
cyBjYWxsZWQgZnJvbSBxdWl0ZSBhIHJlc3RyaWN0ZWQgY29udGV4dCAtIG9vbV9yZWFwZXIgLQo+
ID4gPiB3aGljaCBzaG91bGRuJ3QgZGVwZW5kIG9uIGFueSBsb2NrcyBvciBzbGVlcGFibGUgY29u
ZGl0aW9uYWxzLiBUaGUgY29kZQo+ID4gPiBzaG91bGQgYmUgc3dpZnQgYXMgd2VsbCBidXQgd2Ug
bW9zdGx5IGRvIGNhcmUgYWJvdXQgaXQgdG8gbWFrZSBhIGZvcndhcmQKPiA+ID4gcHJvZ3Jlc3Mu
IENoZWNraW5nIGZvciBzbGVlcGFibGUgY29udGV4dCBpcyB0aGUgYmVzdCB0aGluZyB3ZSBjb3Vs
ZCBjb21lCj4gPiA+IHVwIHdpdGggdGhhdCB3b3VsZCBkZXNjcmliZSB0aGVzZSBkZW1hbmRzIGF0
IGxlYXN0IHBhcnRpYWxseS4iCj4gPiAKPiA+IEJ1dCB0aGlzIGRlc2NyaWJlcyBmc19yZWNsYWlt
X2FjcXVpcmUoKSAtIGlzIHRoZXJlIHNvbWUgcmVhc29uIHdlIGFyZQo+ID4gY29uZmxhdGluZyBm
c19yZWNsYWltIHdpdGggbm9uLXNsZWVwaW5nPwo+IAo+IE5vIGlkZWEgd2h5IHlvdSB0aWUgdGhp
cyBpbnRvIGZzX3JlY2xhaW0uIFdlIGNhbiBkZWZpbml0bHkgc2xlZXAgaW4gdGhlcmUsCj4gYW5k
IGZvciBlLmcuIGtzd2FwZCAod2hpY2ggYWxzbyB3cmFwcyBldmVyeXRoaW5nIGluIGZzX3JlY2xh
aW0pIHdlJ3JlCj4gZXZlbnQgc3VwcG9zZWQgdG8gSSB0aG91Z2h0LiBUbyBtYWtlIHN1cmUgd2Ug
Y2FuIGdldCBhdCB0aGUgbGFzdCBiaXQgb2YKPiBtZW1vcnkgYnkgZmx1c2hpbmcgYWxsIHRoZSBx
dWV1ZXMgYW5kIHdhaXRpbmcgZm9yIGV2ZXJ5dGhpbmcgdG8gYmUgY2xlYW5lZAo+IG91dC4KCkFG
QUlLIHRoZSBwb2ludCBvZiBmc19yZWNsYWltIGlzIHRvIHByZXZlbnQgImluZGlyZWN0IGRlcGVu
ZGVuY3kgdXBvbgp0aGUgcGFnZSBhbGxvY2F0b3IiIGllIGEganVzdGlmaWNhdGlvbiB0aGF0IHdh
cyBnaXZlbiB0aGlzICFibG9ja2FibGUKc3R1ZmYuCgpGb3IgaW5zdGFuY2U6CgogIGZzX3JlY2xh
aW1fYWNxdWlyZSgpCiAga21hbGxvYyhHRlBfS0VSTkVMKSA8LSBsb2NrIGRlcCBhc3NlcnRpb24K
CkFuZCBmdXJ0aGVyLCBNaWNoYWwncyBjb25jZXJuIGFib3V0IGluZGlyZWN0bmVzcyB0aHJvdWdo
IGxvY2tzIGlzIGFsc28KaGFuZGxlZCBieSBsb2NrZGVwOgoKICAgICAgIENQVTAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBDUFUxCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBtdXRleF9sb2NrKCkKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGttYWxsb2MoR0ZQX0tFUk5FTCkKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIG11dGV4X3VubG9jaygpCiAgZnNfcmVjbGFpbV9hY3F1aXJlKCkKICBtdXRleF9s
b2NrKCkgPC0gbG9jayBkZXAgYXNzZXJ0aW9uCgpJbiBvdGhlciB3b3JkcywgdG8gcHJldmVudCBy
ZWN1cnNpb24gaW50byB0aGUgcGFnZSBhbGxvY2F0b3IgeW91IHVzZQpmc19yZWNsYWltX2FjcXVp
cmUoKSwgYW5kIGxvY2tkZXAgdmVyZmllcyBpdCBpbiBpdHMgdXN1YWwgcm9idXN0IHdheS4KCkkg
YXNrZWQgVGVqdW4gYWJvdXQgdGhpcyBvbmNlIGluIHJlZ2FyZHMgdG8gV1FfTUVNX1JFQ0xBSU0g
YW5kIGhlCmV4cGxhaW5lZCB0aGF0IGl0IG1lYW5zIHlvdSBjYW4ndCBjYWxsIHRoZSBhbGxvY2F0
b3IgZnVuY3Rpb25zIGluIGEKd2F5IHRoYXQgd291bGQgcmVjdXJzZSBpbnRvIHJlY2xhaW0gKGll
IGluc3RlYWQgdXNlIGluc3RlYWQgR0ZQX0FUT01JQywgb3IKdG9sZXJhdGUgYWxsb2NhdGlvbiBm
YWlsdXJlLCBvciB2YXJpb3VzIG90aGVyIHRoaW5ncykuCgpTbywgdGhlIHJlYXNvbiBJIGJyaW5n
IGl0IHVwIGlzIGhhbGYgdGhlIGp1c3RpZmljYXRpb25zIHlvdSBwb3N0ZWQgZm9yCmJsb2NrYWJs
ZSBoYWQgdG8gZG8gd2l0aCBub3QgcmVjdXJzaW5nIGludG8gcmVjbGFpbSBhbmQgZGVhZGxvY2tp
bmcsCmFuZCBkaWRuJ3Qgc2VlbSB0byBoYXZlIG11Y2ggdG8gZG8gd2l0aCBibG9ja2luZy4KCkkn
bSBhc2tpbmcgaWYgKm5vbi1ibG9ja2luZyogaXMgcmVhbGx5IHRoZSByZXF1aXJlbWVudCBvciBp
ZiB0aGlzIGlzCmp1c3QgdGhlIHVzdWFsICdkbyBub3QgZGVhZGxvY2sgb24gdGhlIGFsbG9jYXRv
cicgdGhpbmcgcmVjbGFpbSBwYXRocwphbHJlYWQgaGF2ZT8KCkphc29uCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
