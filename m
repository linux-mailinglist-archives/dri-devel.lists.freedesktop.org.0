Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF399114D
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:25:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 887076E9F0;
	Sat, 17 Aug 2019 15:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 766586E3C9
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 12:53:15 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id m2so1656351qki.12
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 05:53:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=fsjt4TH+C2jg5iRhddzc9X6b3PVGQt0GzJbT4+qTTks=;
 b=KKsaAD6oXwkQX5WsyPpaTnze8tJ6xJZN1uFC7YIP2HbF1iLxiCHprBA+d2AEnU0a+E
 5hjRsqK3xDDCJ9P7VTq5N3kHpC9sB0DMos1LC/ince3XZDbVzjqljbzb6HSKyfxQ13JA
 cHibRjHwjLHimoX31d1ajXw+xxF4M5McBnCtcZEV45LfHlfxv903he9ctDcuWplc78sh
 VGdeKFmXCciagKSR+/M+0y2GI3bA4cujEsjI476f2aBtmW1ygU1kLMmEqiXA+RVT6Bm2
 H87/WBrmQ0tVCN+nP4PLJYsaQBHSctoL4oFvYQdiinTIAZXJAyruL+ItRduwepsIqHFp
 LwTw==
X-Gm-Message-State: APjAAAUbdVt/0Ec5HApPHQDlqby/woFS23RTgkogxThE862BNTsu2eqW
 4/4mqxCUFC+HiNwyep4KXFUGBA==
X-Google-Smtp-Source: APXvYqzxadEVjz9zg9VAEExmW6NU01W2O/jedDj26RcK9MXYxH1BLTItzBlbTSuXQVQiYwDGXzxPoQ==
X-Received: by 2002:a05:620a:691:: with SMTP id
 f17mr3965584qkh.470.1565873594583; 
 Thu, 15 Aug 2019 05:53:14 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id s28sm1351035qkm.5.2019.08.15.05.53.13
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 15 Aug 2019 05:53:14 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hyFFh-0004DD-D7; Thu, 15 Aug 2019 09:53:13 -0300
Date: Thu, 15 Aug 2019 09:53:13 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Rientjes <rientjes@google.com>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Michal Hocko <mhocko@suse.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Subject: Re: [PATCH 4/5] mm, notifier: Add a lockdep map for
 invalidate_range_start
Message-ID: <20190815125313.GC21596@ziepe.ca>
References: <20190814202027.18735-1-daniel.vetter@ffwll.ch>
 <20190814202027.18735-5-daniel.vetter@ffwll.ch>
 <20190815000959.GD11200@ziepe.ca>
 <20190815071014.GC7444@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190815071014.GC7444@phenom.ffwll.local>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=fsjt4TH+C2jg5iRhddzc9X6b3PVGQt0GzJbT4+qTTks=;
 b=cQGnutdO0QYQIDqcrjKN5BavYsdcncw1zhfeROmvdu2Z+fNKnqUDT9Wjf0ZaC8+woY
 mA49R7yqHlsDyNq8SRnGzLNHTofoK9KeXLxCWCZ7bxFVXOg+VnWX1x4qivFyvZAPyLJv
 DkXZY75TD9L6FZeyzvaFaQX7mLon/xcopirlW0lsbXvyjx4+a563K5NQePEDDrpDSDzR
 XN3zdVxH1b4lDhDhp+UWdgbSsNNWkQMD1SD0VxNuoESSSsnXVC3JHbDnovZyn0AVDbha
 D6XTUwcSHCVhYpCGX9W5LVcIeR5TUa2A+V/UpZUi7LpQqwDAdORerckHT1WetGPAVJJS
 HkjA==
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

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMDk6MTA6MTRBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBXZWQsIEF1ZyAxNCwgMjAxOSBhdCAwOTowOTo1OVBNIC0wMzAwLCBKYXNvbiBH
dW50aG9ycGUgd3JvdGU6Cj4gPiBPbiBXZWQsIEF1ZyAxNCwgMjAxOSBhdCAxMDoyMDoyNlBNICsw
MjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+ID4gPiBUaGlzIGlzIGEgc2ltaWxhciBpZGVhIHRv
IHRoZSBmc19yZWNsYWltIGZha2UgbG9ja2RlcCBsb2NrLiBJdCdzCj4gPiA+IGZhaXJseSBlYXN5
IHRvIHByb3Zva2UgYSBzcGVjaWZpYyBub3RpZmllciB0byBiZSBydW4gb24gYSBzcGVjaWZpYwo+
ID4gPiByYW5nZTogSnVzdCBwcmVwIGl0LCBhbmQgdGhlbiBtdW5tYXAoKSBpdC4KPiA+ID4gCj4g
PiA+IEEgYml0IGhhcmRlciwgYnV0IHN0aWxsIGRvYWJsZSwgaXMgdG8gcHJvdm9rZSB0aGUgbW11
IG5vdGlmaWVycyBmb3IKPiA+ID4gYWxsIHRoZSB2YXJpb3VzIGNhbGxjaGFpbnMgdGhhdCBtaWdo
dCBsZWFkIHRvIHRoZW0uIEJ1dCBib3RoIGF0IHRoZQo+ID4gPiBzYW1lIHRpbWUgaXMgcmVhbGx5
IGhhcmQgdG8gcmVsaWFibGUgaGl0LCBlc3BlY2lhbGx5IHdoZW4geW91IHdhbnQgdG8KPiA+ID4g
ZXhlcmNpc2UgcGF0aHMgbGlrZSBkaXJlY3QgcmVjbGFpbSBvciBjb21wYWN0aW9uLCB3aGVyZSBp
dCdzIG5vdAo+ID4gPiBlYXN5IHRvIGNvbnRyb2wgd2hhdCBleGFjdGx5IHdpbGwgYmUgdW5tYXBw
ZWQuCj4gPiA+IAo+ID4gPiBCeSBpbnRyb2R1Y2luZyBhIGxvY2tkZXAgbWFwIHRvIHRpZSB0aGVt
IGFsbCB0b2dldGhlciB3ZSBhbGxvdyBsb2NrZGVwCj4gPiA+IHRvIHNlZSBhIGxvdCBtb3JlIGRl
cGVuZGVuY2llcywgd2l0aG91dCBoYXZpbmcgdG8gYWN0dWFsbHkgaGl0IHRoZW0KPiA+ID4gaW4g
YSBzaW5nbGUgY2hhbGxjaGFpbiB3aGlsZSB0ZXN0aW5nLgo+ID4gPiAKPiA+ID4gQXNpZGU6IFNp
bmNlIEkgdHlwZWQgdGhpcyB0byB0ZXN0IGk5MTUgbW11IG5vdGlmaWVycyBJJ3ZlIG9ubHkgcm9s
bGVkCj4gPiA+IHRoaXMgb3V0IGZvciB0aGUgaW52YWxpYXRlX3JhbmdlX3N0YXJ0IGNhbGxiYWNr
LiBJZiB0aGVyZSdzCj4gPiA+IGludGVyZXN0LCB3ZSBzaG91bGQgcHJvYmFibHkgcm9sbCB0aGlz
IG91dCB0byBhbGwgb2YgdGhlbS4gQnV0IG15Cj4gPiA+IHVuZGVzdGFuZGluZyBvZiBjb3JlIG1t
IGlzIHNlcmlvdXNseSBsYWNraW5nLCBhbmQgSSdtIG5vdCBjbGVhciBvbgo+ID4gPiB3aGV0aGVy
IHdlIG5lZWQgYSBsb2NrZGVwIG1hcCBmb3IgZWFjaCBjYWxsYmFjaywgb3Igd2hldGhlciBzb21l
IGNhbgo+ID4gPiBiZSBzaGFyZWQuCj4gPiAKPiA+IEkgd2FzIHRoaW5raW5nIGFib3V0IGRvaW5n
IHNvbWV0aGluZyBsaWtlIHRoaXMuLgo+ID4gCj4gPiBJTUhPIG9ubHkgcmFuZ2VfZW5kIG5lZWRz
IGFubm90YXRpb24sIHRoZSBvdGhlciBvcHMgYXJlIGVpdGhlciBhbHJlYWR5Cj4gPiBub24tc2xl
ZXBpbmcgb3Igb25seSB1c2VkIGJ5IEtWTS4KPgo+IFRoaXMgaXNudCcgYWJvdXQgc2xlZXBpbmcs
IHRoaXMgaXMgYWJvdXQgbG9ja2luZyBsb29wcy4gQW5kIHRoZSBiaWdnZXN0Cj4gcmlzayBmb3Ig
dGhhdCBpcyBmcm9tIGRyaXZlciBjb2RlLCBhbmQgYXQgbGVhc3QgaG1tX21pcnJvciBvbmx5IGhh
cyB0aGUKPiBkcml2ZXIgY29kZSBjYWxsYmFjayBvbiBpbnZhbGlkYXRlX3JhbmdlX3N0YXJ0LiBP
bmNlIHRoaW5nIEkgZGlzY292ZXJlZAo+IHVzaW5nIHRoaXMgKGFuZCBpdCB3b3VsZCBiZSByZWFs
bHkgaGFyZCB0byBzcG90LCBpdCdzIGRlZXBseSBuZWVzdGVkKSBpcwo+IHRoYXQgaTkxNSB1c2Vy
cHRyLgoKU29ycnksIHRoYXQgY2FtZSBvdXQgd3JvbmcsIHdoYXQgSSBtZW50IGlzIHRoYXQgb25s
eSByYW5nZV9lbmQgYW5kCnJhbmdlX3N0YXJ0IHJlYWxseSBuZWVkIGFubm90YXRpb24uCgpUaGUg
b3RoZXIgcGxhY2VzIGFyZSBvbmx5IHVzZWQgYnkgS1ZNIGFuZCBhcmUgY2FsbGVkIGluIG5vbi1z
bGVlcGluZwpjb250ZXh0cywgc28gdGhleSBhbHJlYWR5IGNhbid0IHJlY3Vyc2UgYmFjayBvbnRv
IHRoZSBwb3B1bGFyIHNsZWVwaW5nCmxvY2tzIGxpa2UgbW1hcF9zZW0gb3Igd2hhdCBub3QsIGNh
bid0IGRvIGFsbG9jYXRpb25zLCBldGMuICBJIGRvbid0CnNlZSBhbG90IG9mIHJldHVybiBpbiBp
bnZlc3RpbmcgaW4gdGhlbS4KCj4gPiBCVFcsIEkgaGF2ZSBmb3VuZCBpdCBzdHJhbmdlIHRoYXQg
aTkxNSBvbmx5IHVzZXMKPiA+IGludmFsaWRhdGVfcmFuZ2Vfc3RhcnQuIE5vdCByZWFsbHkgc3Vy
ZSBob3cgaXQgaXMgYWJsZSB0byBkbwo+ID4gdGhhdC4gV291bGQgbG92ZSB0byBrbm93IHRoZSBh
bnN3ZXIgOikKPiAKPiBJIHN1c3BlY3QgaXQncyBicm9rZW4gOi0vIE91ciB1c2VycHRyIGlzIC4u
LiBub3QgdGhlIGJlc3QuIFBhcnQgb2YgdGhlCj4gbW90aXZhdGlvbiBoZXJlLgoKSSB3YXMgd29u
ZGVyaW5nIGlmIGl0IGlzIHdoYXQgd2UgY2FsbCBpbiBSRE1BIGEgJ3JlZ2lzdHJhdGlvbiBjYWNo
ZScKaWUgeW91IGFzc3VtZSB0aGF0IHVzZXJzcGFjZSBpcyB3ZWxsIGJlaGF2ZWQgd2hpbGUgRE1B
IGlzIG9uZ29pbmcgYW5kCmp1c3QgdXNlIHRoZSBub3RpZmVyIHRvIGludmFsaWRhdGUgY2FjaGVk
IGRtYSBtYXBwaW5ncy4KClRoZSBoYWxsbWFyayBvZiB0aGlzIHBhdHRlcm4gaXMgdGhhdCBpdCBo
b2xkcyB0aGUgcGFnZSBwaW4gdGhlIGVudGlyZQp0aW1lIERNQSBpcyBhY3RpdmUsIHdoaWNoIGlz
IHdoeSBpdCBpc24ndCBhIGJ1ZywgaXQgaXMganVzdCBiZXN0CmRlc2NyaWJlZCBhcyBsb29zZWx5
IGNvaGVyZW50LgoKQnV0LCBpbiBSRE1BIHRoZSBiZXN0LXByYWN0aWNlIGlzIHRvIGRvIHRoaXMg
aW4gdXNlcnNwYWNlIHdpdGgKdXNlcmZhdWx0ZmQgYXMgaXQgaXMgdmVyeSBleHBlbnNpdmUgdG8g
dGFrZSBhIHN5c2NhbGwgb24gY29tbWFuZApzdWJtaXNzaW9uIHRvIGhhdmUgdGhlIGtlcm5lbCBm
aWd1cmUgaXQgb3V0LgoKPiA+IEFuZCBpZiB3ZSBkbyBkZWNpZGUgb24gdGhlIHJlY2xhaW0gdGhp
bmcgaW4gbXkgb3RoZXIgZW1haWwgdGhlbiB0aGUKPiA+IHJlY2xhaW0gZGVwZW5kZW5jeSBjYW4g
YmUgcmVsaWFibHkgaW5qZWN0ZWQgYnkgZG9pbmc6Cj4gPiAKPiA+ICBmc19yZWNsYWltX2FjcXVp
cmUoKTsKPiA+ICBsb2NrX21hcF9hY3F1aXJlKCZfX21tdV9ub3RpZmllcl9pbnZhbGlkYXRlX3Jh
bmdlX3N0YXJ0X21hcCk7Cj4gPiAgbG9ja19tYXBfcmVsZWFzZSgmX19tbXVfbm90aWZpZXJfaW52
YWxpZGF0ZV9yYW5nZV9zdGFydF9tYXApOwo+ID4gIGZzX3JlY2xhaW1fcmVsZWFzZSgpOwo+ID4g
Cj4gPiBJZiBJIHVuZGVyc3RhbmQgbG9ja2RlcCBwcm9wZXJseS4uCj4gCj4gSW1lIGZzX3JlY2xh
aW0gaW5qZWN0cyB0aGUgbW11X25vdGlmaWVyIG1hcCBoZXJlIHJlbGlhYmx5IGFzIHNvb24gYXMK
PiB5b3UndmUgdGhyb3duIG91dCB0aGUgZmlyc3QgcGFnZWNhY2hlIG1tYXAgb24gYW55IHByb2Nl
c3MuIFRoYXQgIm1ha2Ugc3VyZQo+IHdlIGluamVjdCBpdCBxdWlja2x5IiBpcyB3aHkgdGhlIGxv
Y2tkZXAgaXMgX291dHNpZGVfIG9mIHRoZQo+IG1tX2hhc19ub3RpZmllcnMoKSBjaGVjay4gU28g
bm8gZnVydGhlciBpbmplY3Rpb24gbmVlZGVkIGltby4KCkkgc3VzcGVjdCBhIGxvdCBvZiBvdXIg
YXV0b21hdGVkIHRlc3RpbmcsIGxpa2Ugc3l6a2FsbGVyIGluIHJlc3RyaWN0ZWQKa3ZtcywgcHJv
YmFibHkgZG9lcyBub3QgcmVsaWFibHkgdHJpZ2dlciBhIGZzX3JlY2xhaW0sIHNvIEkgd291bGQg
dmVyeQptdWNoIHByZWZlciB0byBpbmplY3QgaXQgMTAwJSBvZiB0aGUgdGltZSBkaXJlY3RseSBp
ZiB3ZSBhcmUgc3VyZSB0aGlzCmlzIGEgcmVjbGFpbSBjb250ZXh0IGJlY2F1c2Ugb2YgdGhlIGlf
bW1hcF9yd3NlbSBJIG1lbnRpb25lZCBiZWZvcmUuCgpKYXNvbgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
