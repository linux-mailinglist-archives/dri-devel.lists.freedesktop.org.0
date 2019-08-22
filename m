Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC8C99683
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 16:27:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D13316E4E8;
	Thu, 22 Aug 2019 14:27:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28A9A89FCE
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 14:27:31 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id e12so5598778otp.10
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 07:27:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HxSEtX2z/ZJV/B0XcD4BCr1O2HbvzOrzKNcLT4JypFY=;
 b=VNElcEC0tJSOwFvYDyfWL4PS0XMaOUbtO2ARu56/Lt+v3r4+f4g2mIGGpGBtgWYmzT
 gb5SN+H8J6K2zM4on6aQQVTMb6INzhV+LdSDkjugD1Sj5YjMZ3fnnyvB70hQB5ESRC/B
 4+n4p5IG1r0hhOtKw5ewJ27RQgNA39mwTKgkd6JrSovyrdYhvZS99Pd5KlWmqs6WrN7L
 1Zl4XZQxBrQ6qinYB8+J0U0oudv9CaaiWF1Z/Q8j7kbMYp3e77VvVycvalzaGDpk8n/u
 qLCCcx3eRson8LDS981zQA3kfrShm469dxZB3kSsmWdsYuNeZxFO74rB13PLyJc+YYOt
 /92Q==
X-Gm-Message-State: APjAAAVr7TRDeZ5XlI/yu+Dsw2/7CsnELPAgpLQ0G1cQVby5SUVWlSJi
 Bw67wf4In36MSSBkvWHHLHloQfHVFlUQ2rcNYdVPLg==
X-Google-Smtp-Source: APXvYqzrWuV30uDAlQUdwtvK/fFSj1j/bZ180iv5Fx+HFnPaAc75KsLZP2Z8mNCZI4plTUPZzv1Ihu5g4y0wy4zzZSI=
X-Received: by 2002:a9d:7087:: with SMTP id l7mr1213445otj.281.1566484050304; 
 Thu, 22 Aug 2019 07:27:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190820081902.24815-1-daniel.vetter@ffwll.ch>
 <20190820081902.24815-5-daniel.vetter@ffwll.ch>
 <20190820133418.GG29246@ziepe.ca>
 <20190820151810.GG11147@phenom.ffwll.local>
 <20190821154151.GK11147@phenom.ffwll.local>
 <20190821161635.GC8653@ziepe.ca>
 <CAKMK7uERsmgFqDVHMCWs=4s_3fHM0eRr7MV6A8Mdv7xVouyxJw@mail.gmail.com>
 <20190822142410.GB8339@ziepe.ca>
In-Reply-To: <20190822142410.GB8339@ziepe.ca>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 22 Aug 2019 16:27:18 +0200
Message-ID: <CAKMK7uF5CMSUrG2jTYJ9M7tDK_Saxmxk6yLs62tfc-Ozj3p2BQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] mm, notifier: Catch sleeping/blocking for !blockable
To: Jason Gunthorpe <jgg@ziepe.ca>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=HxSEtX2z/ZJV/B0XcD4BCr1O2HbvzOrzKNcLT4JypFY=;
 b=bThEovQjDRPbGQci1oGNwl98knwGtDbVI9tycUtNpAD5WH/u71hGUtM2xhNVyI5R1f
 fOd+c1dN12ruUyXlb/wEqY3WTmbAJQU4afNsp98FtxyMr/7sUppyEdf1DRZ18OTqR0+C
 AIRU6Cjy4Kh+FYM1N/+/DUewnmCrWcZwia6BI=
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
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 David Rientjes <rientjes@google.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMjIsIDIwMTkgYXQgNDoyNCBQTSBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVw
ZS5jYT4gd3JvdGU6Cj4KPiBPbiBUaHUsIEF1ZyAyMiwgMjAxOSBhdCAxMDo0MjozOUFNICswMjAw
LCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+Cj4gPiA+IFJETUEgaGFzIGEgbXV0ZXg6Cj4gPiA+Cj4g
PiA+IGliX3VtZW1fbm90aWZpZXJfaW52YWxpZGF0ZV9yYW5nZV9lbmQKPiA+ID4gICByYnRfaWJf
dW1lbV9mb3JfZWFjaF9pbl9yYW5nZQo+ID4gPiAgICBpbnZhbGlkYXRlX3JhbmdlX3N0YXJ0X3Ry
YW1wb2xpbmUKPiA+ID4gICAgIGliX3VtZW1fbm90aWZpZXJfZW5kX2FjY291bnQKPiA+ID4gICAg
ICAgbXV0ZXhfbG9jaygmdW1lbV9vZHAtPnVtZW1fbXV0ZXgpOwo+ID4gPgo+ID4gPiBJJ20gd29y
a2luZyB0byBkZWxldGUgdGhpcyBwYXRoIHRob3VnaCEKPiA+ID4KPiA+ID4gbm9uYmxvY2tpbmcg
b3Igbm90IGZvbGxvd3MgdGhlIHN0YXJ0LCB0aGUgc2FtZSBmbGFnIGdldHMgcGxhY2VkIGludG8K
PiA+ID4gdGhlIG1tdV9ub3RpZmllcl9yYW5nZSBzdHJ1Y3QgcGFzc2VkIHRvIGVuZC4KPiA+Cj4g
PiBPaywgbWFrZXMgc2Vuc2UuCj4gPgo+ID4gSSBndWVzcyB0aGF0IGFsc28gbWVhbnMgdGhlIG1p
Z2h0X3NsZWVwIChJIHN0YXJ0ZWQgb24gdGhhdCkgaW4KPiA+IGludmFsaWRhdGVfcmFuZ2VfZW5k
IGFsc28gbmVlZHMgdG8gYmUgY29uZGl0aW9uYWw/IE9yIG5vdCBib3RoZXIgd2l0aAo+ID4gYSBt
aWdodF9zbGVlcCBpbiBpbnZhbGlkYXRlX3JhbmdlX2VuZCBzaW5jZSB5b3UncmUgd29ya2luZyBv
biByZW1vdmluZwo+ID4gdGhlIGxhc3Qgc2xlZXAgaW4gdGhlcmU/Cj4KPiBJIG1pZ2h0IHN1Z2dl
c3QgdGhlIHNhbWUgcGF0dGVybiBhcyB1c2VkIGZvciBsb2NrZWQsIHRoZSBtaWdodF9zbGVlcAo+
IHVuY29uZGl0aW9uYWxseSBvbiB0aGUgc3RhcnQsIGFuZCBhIDJuZCBtaWdodCBzbGVlcCBhZnRl
ciB0aGUgSUYgaW4KPiBfX21tdV9ub3RpZmllcl9pbnZhbGlkYXRlX3JhbmdlX2VuZCgpCj4KPiBP
YnNlcnZpbmcgdGhhdCBieSBhdWRpdCBhbGwgdGhlIGNhbGxlcnMgYWxyZWFkeSBoYXZlIHRoZSBz
YW1lIGxvY2tpbmcKPiBjb250ZXh0IGZvciBzdGFydC9lbmQKCk15IHF1ZXN0aW9uIHdhcyBtb3Jl
IGFib3V0IGVuZm9yY2luZyB0aGF0IGdvaW5nIGZvcndhcmQsIHNpbmNlIHlvdSdyZQp3b3JraW5n
IHRvIHJlbW92ZSBhbGwgdGhlIHNsZWVwcyBmcm9tIGludmFsaWRhdGVfcmFuZ2VfZW5kLiBJIGRv
bid0CndhbnQgdG8gYWRkIGRlYnVnIGFubm90YXRpb25zIHdoaWNoIGFyZSBzdHJpY3RlciB0aGFu
IHdoYXQgdGhlIG90aGVyCnNpZGUgYWN0dWFsbHkgZXhwZWN0cy4gQnV0IHNpbmNlIGN1cnJlbnRs
eSB0aGVyZSBpcyBzdGlsbCBzbGVlcGluZwpsb2NrcyBpbiBpbnZhbGlkYXRlX3JhbmdlX2VuZCBJ
IHRoaW5rIEknbGwganVzdCBzdGljayB0aGVtIGluIGJvdGgKcGxhY2VzLiBZb3UgY2FuIHRoZW4g
KHJlKW1vdmUgaXQgd2hlbiB0aGUgY2xlYW51cCBsYW5kcy4KLURhbmllbAotLSAKRGFuaWVsIFZl
dHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KKzQxICgwKSA3OSAzNjUg
NTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
