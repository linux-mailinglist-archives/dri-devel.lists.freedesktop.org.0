Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 530399113D
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:24:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80A366E523;
	Sat, 17 Aug 2019 15:24:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEFFB6E44A
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 17:16:24 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id k13so3066323qtm.12
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 10:16:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bWQUZxVbgX8q+7/XNaaPkBz6uudNI37srtiH/YJRLMA=;
 b=Q4rMn2bjeoKutAap2RbN+8M2cxcJ9L+sTYqgWRvxgVvZQOrf1nzTPer/6HOJtAauZR
 D8n0syFW4g29I5kpiTtiX2kuWVmH5dPx+hyCGS3D7sbu/NoFFXUpQm9ChjhWgeVfFJD5
 QYRwqFMANbsErSypOdm5XaxuqFI6Qpzb+3fe92RyTenXjK907nXRccFQKhW64FtKF1aF
 AlRgVWFqG5+LkhDvQHEXkNyB+95/XFM/DYmz/jGlbJXpvR3CAt7I6IfoSSlYYePI+QKy
 vBz2lAP2RJ8hjS5q0H2iNq8MmF/pBjoyh0gekHKkZ62Re6KE7bty/5ddHHnEpMQxOFZ8
 lHLw==
X-Gm-Message-State: APjAAAW6jS2xJYSXMObOWxgC8SFxwj4icbkQ/G8pMjpKjC5NQcOaBR9/
 HSRDPArL9vrELlgrQCehVDx1HQ==
X-Google-Smtp-Source: APXvYqzhMs0H6HOINgldm0wqFeedn0yeVMbyJrKiVDfNKdY5nOzLsfj8OD4YZcVQ3nL9Fvat5g8RJg==
X-Received: by 2002:a0c:9d0d:: with SMTP id m13mr4071346qvf.174.1565889383869; 
 Thu, 15 Aug 2019 10:16:23 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id l11sm1685225qtr.11.2019.08.15.10.16.23
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 15 Aug 2019 10:16:23 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hyJMM-0006lb-QQ; Thu, 15 Aug 2019 14:16:22 -0300
Date: Thu, 15 Aug 2019 14:16:22 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>
Subject: Re: [PATCH 2/5] kernel.h: Add non_block_start/end()
Message-ID: <20190815171622.GL21596@ziepe.ca>
References: <20190814202027.18735-1-daniel.vetter@ffwll.ch>
 <20190814202027.18735-3-daniel.vetter@ffwll.ch>
 <20190814134558.fe659b1a9a169c0150c3e57c@linux-foundation.org>
 <20190815084429.GE9477@dhcp22.suse.cz>
 <20190815130415.GD21596@ziepe.ca>
 <CAKMK7uE9zdmBuvxa788ONYky=46GN=5Up34mKDmsJMkir4x7MQ@mail.gmail.com>
 <20190815143759.GG21596@ziepe.ca>
 <CAKMK7uEJQ6mPQaOWbT_6M+55T-dCVbsOxFnMC6KzLAMQNa-RGg@mail.gmail.com>
 <20190815151028.GJ21596@ziepe.ca>
 <20190815163238.GA30781@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190815163238.GA30781@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=bWQUZxVbgX8q+7/XNaaPkBz6uudNI37srtiH/YJRLMA=;
 b=LyKrHHML5qsAHOuu+3liATWbTb6DyVTWCsOvlxwJdwkXlE0Lc7JX8x425zP9bIasr/
 z234649hCY9AqF83cc5SAoIRaIGSRUwvwesHrGgGC/flGkruF6oA300ue/onshbs0F/i
 avAkH6M1hqae7FbSfWx+SXEeVdRgVe8bp9cLBXMdWZAUwtclZPY109M3LnNxQRmTehbp
 A7+xYYueXtM+21QPDvDrdSYFg/+07W6wRbHEVPua8v1p5B4JKdw3uruExAedVopc4WP7
 Joi5pFjarqFpfyVffxS7kdZQFyZ5RbTa72w3H2Rr5rdf2MgdFsBu794ulKvyqyrX+GuO
 iHvQ==
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
Cc: Feng Tang <feng.tang@intel.com>, Randy Dunlap <rdunlap@infradead.org>,
 Kees Cook <keescook@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jann Horn <jannh@google.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Michal Hocko <mhocko@kernel.org>, Linux MM <linux-mm@kvack.org>,
 Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 David Rientjes <rientjes@google.com>, Wei Wang <wvw@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMTI6MzI6MzhQTSAtMDQwMCwgSmVyb21lIEdsaXNzZSB3
cm90ZToKPiBPbiBUaHUsIEF1ZyAxNSwgMjAxOSBhdCAxMjoxMDoyOFBNIC0wMzAwLCBKYXNvbiBH
dW50aG9ycGUgd3JvdGU6Cj4gPiBPbiBUaHUsIEF1ZyAxNSwgMjAxOSBhdCAwNDo0MzozOFBNICsw
MjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+ID4gCj4gPiA+IFlvdSBoYXZlIHRvIHdhaXQgZm9y
IHRoZSBncHUgdG8gZmlubmlzaCBjdXJyZW50IHByb2Nlc3NpbmcgaW4KPiA+ID4gaW52YWxpZGF0
ZV9yYW5nZV9zdGFydC4gT3RoZXJ3aXNlIHRoZXJlJ3Mgbm8gcG9pbnQgdG8gYW55IG9mIHRoaXMK
PiA+ID4gcmVhbGx5LiBTbyB0aGUgd2FpdF9ldmVudC9kbWFfZmVuY2Vfd2FpdCBhcmUgdW5hdm9p
ZGFibGUgcmVhbGx5Lgo+ID4gCj4gPiBJIGRvbid0IGVudnkgeW91ciB0YXNrIDp8Cj4gPiAKPiA+
IEJ1dCwgd2hhdCB5b3UgZGVzY3JpYmUgc3VyZSBzb3VuZHMgbGlrZSBhICdyZWdpc3RyYXRpb24g
Y2FjaGUnIG1vZGVsLAo+ID4gbm90IHRoZSAnc2hhZG93IHB0ZScgbW9kZWwgb2YgY29oZXJlbmN5
Lgo+ID4gCj4gPiBUaGUga2V5IGRpZmZlcmVuY2UgaXMgdGhhdCBhIHJlZ2lyc3RhdGlvbmNhY2hl
IGlzIGFsbG93ZWQgdG8gYmVjb21lCj4gPiBpbmNvaGVyZW50IHdpdGggdGhlIFZNQSdzIGJlY2F1
c2UgaXQgaG9sZHMgcGFnZSBwaW5zLiBJdCBpcyBhCj4gPiBwcm9ncmFtbWluZyBidWcgaW4gdXNl
cnNwYWNlIHRvIGNoYW5nZSBWQSBtYXBwaW5ncyB2aWEgbW1hcC9tdW5tYXAvZXRjCj4gPiB3aGls
ZSB0aGUgZGV2aWNlIGlzIHdvcmtpbmcgb24gdGhhdCBWQSwgYnV0IGl0IGRvZXMgbm90IGhhcm0g
c3lzdGVtCj4gPiBpbnRlZ3JpdHkgYmVjYXVzZSBvZiB0aGUgcGFnZSBwaW4uCj4gPiAKPiA+IFRo
ZSBjYWNoZSBlbnN1cmVzIHRoYXQgZWFjaCBpbml0aWF0ZWQgb3BlcmF0aW9uIHNlZXMgYSBETUEg
c2V0dXAgdGhhdAo+ID4gbWF0Y2hlcyB0aGUgY3VycmVudCBWQSBtYXAgd2hlbiB0aGUgb3BlcmF0
aW9uIGlzIGluaXRpYXRlZCBhbmQgYWxsb3dzCj4gPiBleHBlbnNpdmUgZGV2aWNlIERNQSBzZXR1
cHMgdG8gYmUgcmUtdXNlZC4KPiA+IAo+ID4gQSAnc2hhZG93IHB0ZScgbW9kZWwgKGllIGhtbSkg
KnJlYWxseSogbmVlZHMgZGV2aWNlIHN1cHBvcnQgdG8KPiA+IGRpcmVjdGx5IGJsb2NrIERNQSBh
Y2Nlc3MgLSBpZSB0cmlnZ2VyICdkZXZpY2UgcGFnZSBmYXVsdCcuIGllIHRoZQo+ID4gaW52YWxp
ZGF0ZV9zdGFydCBzaG91bGQgaW5mb3JtIHRoZSBkZXZpY2UgdG8gZW50ZXIgYSBmYXVsdCBtb2Rl
IGFuZAo+ID4gdGhhdCBpcyBpdC4gIElmIHRoZSBkZXZpY2UgY2FuJ3QgZG8gdGhhdCwgdGhlbiB0
aGUgZHJpdmVyIHByb2JhYmx5Cj4gPiBzaG91bGRuJ3QgcGVyc3VlIHRoaXMgbGV2ZWwgb2YgY29o
ZXJlbmN5LiBUaGUgZHJpdmVyIHdvdWxkIHF1aWNrbHkgZ2V0Cj4gPiBpbnRvIHRoZSBtZXNzeSBs
b2NraW5nIHByb2JsZW1zIGxpa2UgZG1hX2ZlbmNlX3dhaXQgZnJvbSBhIG5vdGlmaWVyLgo+IAo+
IEkgdGhpbmsgaGVyZSB3ZSBkbyBub3QgYWdyZWUgb24gdGhlIGhhcmR3YXJlIHJlcXVpcmVtZW50
LiBGb3IgR1BVCj4gd2Ugd2lsbCBhbHdheXMgbmVlZCB0byBiZSBhYmxlIHRvIHdhaXQgZm9yIHNv
bWUgR1BVIGZlbmNlIGZyb20gaW5zaWRlCj4gdGhlIG5vdGlmaWVyIGNhbGxiYWNrLCB0aGVyZSBp
cyBqdXN0IG5vIHdheSBhcm91bmQgdGhhdCBmb3IgbWFueSBvZgo+IHRoZSBHUFVzIHRvZGF5IChp
IGRvIG5vdCBzZWUgYW55IGluZGljYXRpb24gb2YgdGhhdCBjaGFuZ2luZykuCgpJIGRpZG4ndCBz
YXkgeW91IGNvdWxkbid0IHdhaXQsIEkgd2FzIHRyeWluZyB0byBzYXkgdGhhdCB0aGUgd2FpdApz
aG91bGQgb25seSBiZSBjb250aWdlbnQgb24gdGhlIEhXIGl0c2VsZi4gSWUgeW91IGNhbiB3YWl0
IG9uIGEgR1BVCnBhZ2UgdGFibGUgbG9jaywgYW5kIHlvdSBjYW4gd2FpdCBvbiBhIEdQVSBwYWdl
IHRhYmxlIGZsdXNoIGNvbXBsZXRpb24KdmlhIElSUS4KCldoYXQgaXMgdHJvdWJsaW5nIGlzIHRv
IHdhaXQgdGlsbCBzb21lIG90aGVyIHRocmVhZCBnZXRzIGEgR1BVIGNvbW1hbmQKY29tcGxldGlv
biBhbmQgZGVjcidzIGEga3JlZiBvbiB0aGUgRE1BIGJ1ZmZlciAtIHdoaWNoIGtpbmRhIGxvb2tz
Cmxpa2Ugd2hhdCB0aGlzIGRtYV9mZW5jZSgpIHN0dWZmIGlzIGFsbCBhYm91dC4gQSBkcml2ZXIg
bGlrZSB0aGF0CndvdWxkIGhhdmUgdG8gYmUgc3VwZXIgY2FyZWZ1bCB0byBlbnN1cmUgY29uc2lz
dGVudCBmb3J3YXJkIHByb2dyZXNzCnRvd2FyZCBkbWEgcmVmID09IDAgd2hlbiB0aGUgc3lzdGVt
IGlzIHVuZGVyIHJlY2xhaW0uIAoKaWUgYnkgcnVubmluZyBpdCdzIGVudGlyZSBJUlEgZmxvdyB1
bmRlciBmc19yZWNsYWltIGxvY2tpbmcuCgo+IGFzc29jaWF0ZWQgd2l0aCB0aGUgbW1fc3RydWN0
LiBJbiBhbGwgR1BVIGRyaXZlciBzbyBmYXIgaXQgaXMgYSBzaG9ydAo+IGxpdmVkIGxvY2sgYW5k
IG5vdGhpbmcgYmxvY2tpbmcgaXMgZG9uZSB3aGlsZSBob2xkaW5nIGl0IChpdCBpcyBqdXN0Cj4g
YWJvdXQgdXBkYXRpbmcgcGFnZSB0YWJsZSBkaXJlY3RvcnkgcmVhbGx5IHdldGhlciBpdCBpcyBm
aWxsaW5nIGl0IG9yCj4gY2xlYXJpbmcgaXQpLgoKVGhlIG1haW4gYmxvY2tpbmcgSSBleHBlY3Qg
aW4gYSBzaGFkb3cgUFRFIGZsb3cgaXMgd2FpdGluZyBmb3IgdGhlIEhXCnRvIGNvbXBsZXRlIGlu
dmFsaWRhdGlvbnMgb2YgaXRzIFBURSBjYWNoZS4KCj4gPiBJdCBpcyBpbXBvcnRhbnQgdG8gaWRl
bnRpZnkgd2hhdCBtb2RlbCB5b3UgYXJlIGdvaW5nIGZvciBhcyBkZWZpbmluZyBhCj4gPiAncmVn
aXN0cmF0aW9uIGNhY2hlJyBjb2hlcmVuY2UgZXhwZWN0YXRpb24gYWxsb3dzIHRoZSBkcml2ZXIg
dG8gc2tpcAo+ID4gYmxvY2tpbmcgaW4gaW52YWxpZGF0ZV9yYW5nZV9zdGFydC4gQWxsIGl0IGRv
ZXMgaXMgaW52YWxpZGF0ZSB0aGUKPiA+IGNhY2hlIHNvIHRoYXQgZnV0dXJlIG9wZXJhdGlvbnMg
cGljayB1cCB0aGUgbmV3IFZBIG1hcHBpbmcuCj4gPiAKPiA+IEludGVsJ3MgSEZJIFJETUEgZHJp
dmVyIHVzZXMgdGhpcyBtb2RlbCBleHRlbnNpdmVseSwgYW5kIEkgdGhpbmsgaXQgaXMKPiA+IHdl
bGwgcHJvdmVuLCB3aXRoaW4gc29tZSBsaW1pdGF0aW9ucyBvZiBjb3Vyc2UuCj4gPiAKPiA+IEF0
IGxlYXN0LCAncmVnaXN0cmF0aW9uIGNhY2hlJyBpcyB0aGUgb25seSB1c2UgbW9kZWwgSSBrbm93
IG9mIHdoZXJlCj4gPiBpdCBpcyBhY2NlcHRhYmxlIHRvIHNraXAgaW52YWxpZGF0ZV9yYW5nZV9l
bmQuCj4gCj4gSGVyZSBHUFUgYXJlIG5vdCBpbiB0aGUgcmVnaXN0cmF0aW9uIGNhY2hlIG1vZGVs
LCBpIGtub3cgaXQgbWlnaHQgbG9va3MKPiBsaWtlIGl0IGJlY2F1c2Ugb2YgR1VQIGJ1dCBHVVAg
d2FzIHVzZSBqdXN0IGJlY2F1c2UgaG1tIGRpZCBub3QgZXhpc3QKPiBhdCB0aGUgdGltZS4KCkl0
IGlzIG5vdCBiZWNhdXNlIG9mIEdVUCwgaXQgaXMgYmVjYXVzZSBvZiB0aGUgbGFjayBvZgppbnZh
bGlkYXRlX3JhbmdlX2VuZC4gQSBkcml2ZXIgY2Fubm90IGNvcnJlY3RseSBpbXBsZW1lbnQgdGhl
IFNQVEUKbW9kZWwgd2l0aG91dCBpbnZhbGlkYXRlX3JhbmdlX2VuZCwgZXZlbiBpZiBpdCBob2xk
cyB0aGUgcGFnZSBwaW5zIHZpYQpHVVAuCgpTbywgSSd2ZSBiZWVuIGFzc3VtaW5nIHRoZSBmZXcg
ZHJpdmVycyB3aXRob3V0IGludmFsaWRhdGVfcmFuZ2VfZW5kCmFyZSB0cnlpbmcgdG8gZG8gcmVn
aXN0cmF0aW9uIGNhY2hpbmcsIHJhdGhlciB0aGFuIGFzc3VtaW5nIHRoZXkgYXJlCmJyb2tlbi4K
Ckphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
