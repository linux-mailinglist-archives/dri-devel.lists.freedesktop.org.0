Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 765959739B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 09:34:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA74D6E932;
	Wed, 21 Aug 2019 07:34:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3781A6E5D2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 13:31:08 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id t12so5969351qtp.9
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 06:31:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=aYpPZYtqod+fTEVMSorWhJ9m+fKXe1m4+frfAcmvGyw=;
 b=WaJ9Z2RouyBwYzGbvcVCDMKdF/mg5Ek3RybcAfqrNYGwPGZMhRfHv+k6lUvqHnmPk8
 tBk9MUX4ZIKkAp/OUjBNlitl64XXOTcyO3E8VAJe1smxT4a2NKM3KRJBzwzI0ySm0fMi
 4odlMIDqZwLiDpxSTwXcLx7Fbm8GKTDXs8V4aR5aBlXsvBbXJHnPVaP5li2vl1y6tSYS
 nFdmIzPkfx1wyaOSCL568316sCii4yHcFkMD2kMIlOsqD4i7tmT2SwmTnkMcVs85vBTV
 LukBjNnlRd1AwdcnVxS30N5X7zSudYk4HP9STr86uS0B1rjuuMpb7He/acLQ5jYzAM4H
 NUoA==
X-Gm-Message-State: APjAAAW9sbtWsJKXY6eJf9AeqrFVoF59TEdhctzGqqetuVfP6tRZrXly
 1C5p61y+EpC3ASHOyk7oH4WBOQ==
X-Google-Smtp-Source: APXvYqxB6NZLC2rrQAg7I6KgD70/5Hu6l4Z9mEKxIX68NL5/RT6fP/bDpg9I56nVuVJ5jZ37fvu3SA==
X-Received: by 2002:a0c:ab49:: with SMTP id i9mr14487677qvb.142.1566307867024; 
 Tue, 20 Aug 2019 06:31:07 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id u23sm8481051qkj.98.2019.08.20.06.31.06
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 20 Aug 2019 06:31:06 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1i04E6-0000Y2-5B; Tue, 20 Aug 2019 10:31:06 -0300
Date: Tue, 20 Aug 2019 10:31:06 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 1/4] mm, notifier: Add a lockdep map for
 invalidate_range_start/end
Message-ID: <20190820133106.GE29246@ziepe.ca>
References: <20190820081902.24815-1-daniel.vetter@ffwll.ch>
 <20190820081902.24815-2-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190820081902.24815-2-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 21 Aug 2019 07:33:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=aYpPZYtqod+fTEVMSorWhJ9m+fKXe1m4+frfAcmvGyw=;
 b=kyQ9OWt0i7+BfpuIcyUPTFQLZeuohCEC5hlVUNQiEKpacPgte/tVYaXCcoWS0iNX46
 LbDElheqaJ2KHddRS3Bu1aFYUKIF2VpbD9EaDtyp4ulfo2y9LapY2j2xgHMY5n6AgQGw
 h4SFdWkbBCEN0DxcCvSoBBbBbofopvxvLfyOOYwAaZFocYVAJnpeBoqzpNLDQWNPUm6p
 i5owmJsN0JKV6XnsgkHqBSTsTXrlH7ufNqL47j8nTzIRKN8roxX/xH2mNEAvLkFk1b2T
 eLX65YwAZeD6TPycNJswzneMyzYbv45HIRhTCNU/IO+ns1pewbMV0/JRx5RbGFzoVUz2
 E1NA==
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Mike Rapoport <rppt@linux.vnet.ibm.com>, David Rientjes <rientjes@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMjAsIDIwMTkgYXQgMTA6MTg6NTlBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBUaGlzIGlzIGEgc2ltaWxhciBpZGVhIHRvIHRoZSBmc19yZWNsYWltIGZha2UgbG9j
a2RlcCBsb2NrLiBJdCdzCj4gZmFpcmx5IGVhc3kgdG8gcHJvdm9rZSBhIHNwZWNpZmljIG5vdGlm
aWVyIHRvIGJlIHJ1biBvbiBhIHNwZWNpZmljCj4gcmFuZ2U6IEp1c3QgcHJlcCBpdCwgYW5kIHRo
ZW4gbXVubWFwKCkgaXQuCj4gCj4gQSBiaXQgaGFyZGVyLCBidXQgc3RpbGwgZG9hYmxlLCBpcyB0
byBwcm92b2tlIHRoZSBtbXUgbm90aWZpZXJzIGZvcgo+IGFsbCB0aGUgdmFyaW91cyBjYWxsY2hh
aW5zIHRoYXQgbWlnaHQgbGVhZCB0byB0aGVtLiBCdXQgYm90aCBhdCB0aGUKPiBzYW1lIHRpbWUg
aXMgcmVhbGx5IGhhcmQgdG8gcmVsaWFibGUgaGl0LCBlc3BlY2lhbGx5IHdoZW4geW91IHdhbnQg
dG8KPiBleGVyY2lzZSBwYXRocyBsaWtlIGRpcmVjdCByZWNsYWltIG9yIGNvbXBhY3Rpb24sIHdo
ZXJlIGl0J3Mgbm90Cj4gZWFzeSB0byBjb250cm9sIHdoYXQgZXhhY3RseSB3aWxsIGJlIHVubWFw
cGVkLgo+IAo+IEJ5IGludHJvZHVjaW5nIGEgbG9ja2RlcCBtYXAgdG8gdGllIHRoZW0gYWxsIHRv
Z2V0aGVyIHdlIGFsbG93IGxvY2tkZXAKPiB0byBzZWUgYSBsb3QgbW9yZSBkZXBlbmRlbmNpZXMs
IHdpdGhvdXQgaGF2aW5nIHRvIGFjdHVhbGx5IGhpdCB0aGVtCj4gaW4gYSBzaW5nbGUgY2hhbGxj
aGFpbiB3aGlsZSB0ZXN0aW5nLgo+IAo+IE9uIEphc29uJ3Mgc3VnZ2VzdGlvbiB0aGlzIGlzIGlz
IHJvbGxlZCBvdXQgZm9yIGJvdGgKPiBpbnZhbGlkYXRlX3JhbmdlX3N0YXJ0IGFuZCBpbnZhbGlk
YXRlX3JhbmdlX2VuZC4gVGhleSBib3RoIGhhdmUgdGhlCj4gc2FtZSBjYWxsaW5nIGNvbnRleHQs
IGhlbmNlIHdlIGNhbiBzaGFyZSB0aGUgc2FtZSBsb2NrZGVwIG1hcC4gTm90ZQo+IHRoYXQgdGhl
IGFubm90YXRpb24gZm9yIGludmFsaWRhdGVfcmFuYWdlX3N0YXJ0IGlzIG91dHNpZGUgb2YgdGhl
Cj4gbW1faGFzX25vdGlmaWVycygpLCB0byBtYWtlIHN1cmUgbG9ja2RlcCBpcyBpbmZvcm1lZCBh
Ym91dCBhbGwgcGF0aHMKPiBsZWFkaW5nIHRvIHRoaXMgY29udGV4dCBpcnJlc3BlY3RpdmUgb2Yg
d2hldGhlciBtbXUgbm90aWZpZXJzIGFyZQo+IHByZXNlbnQgZm9yIGEgZ2l2ZW4gY29udGV4dC4g
V2UgZG9uJ3QgZG8gdGhhdCBvbiB0aGUKPiBpbnZhbGlkYXRlX3JhbmdlX2VuZCBzaWRlIHRvIGF2
b2lkIHBheWluZyB0aGUgb3ZlcmhlYWQgdHdpY2UsIHRoZXJlCj4gdGhlIGxvY2tkZXAgYW5ub3Rh
dGlvbiBpcyBwdXNoZWQgZG93biBiZWhpbmQgdGhlIG1tX2hhc19ub3RpZmllcnMoKQo+IGNoZWNr
Lgo+IAo+IHYyOiBVc2UgbG9ja19tYXBfYWNxdWlyZS9yZWxlYXNlKCkgbGlrZSBmc19yZWNsYWlt
LCB0byBhdm9pZCBjb25mdXNpb24KPiB3aXRoIHRoaXMgYmVpbmcgYSByZWFsIG11dGV4IChDaHJp
cyBXaWxzb24pLgo+IAo+IHYzOiBSZWJhc2Ugb24gdG9wIG9mIEdsaXNzZSdzIGFyZyByZXdvcmsu
Cj4gCj4gdjQ6IEFsc28gYW5ub3RhdGUgaW52YWxpZGF0ZV9yYW5nZV9lbmQgKEphc29uIEd1bnRo
b3JwZSkKPiBBbHNvIGFubm90YXRlIGludmFsaWRhdGVfcmFuZ2Vfc3RhcnRfbm9uYmxvY2ssIEkg
c29tZWhvdyBtaXNzZWQgdGhhdAo+IG9uZSBpbiB0aGUgZmlyc3QgdmVyc2lvbi4KPiAKPiBDYzog
SmFzb24gR3VudGhvcnBlIDxqZ2dAemllcGUuY2E+Cj4gQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXNA
Y2hyaXMtd2lsc29uLmNvLnVrPgo+IENjOiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5k
YXRpb24ub3JnPgo+IENjOiBEYXZpZCBSaWVudGplcyA8cmllbnRqZXNAZ29vZ2xlLmNvbT4KPiBD
YzogIkrDqXLDtG1lIEdsaXNzZSIgPGpnbGlzc2VAcmVkaGF0LmNvbT4KPiBDYzogTWljaGFsIEhv
Y2tvIDxtaG9ja29Ac3VzZS5jb20+Cj4gQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFu
LmtvZW5pZ0BhbWQuY29tPgo+IENjOiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZv
dW5kYXRpb24ub3JnPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNo
Pgo+IENjOiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4LnZuZXQuaWJtLmNvbT4KPiBDYzogbGlu
dXgtbW1Aa3ZhY2sub3JnCj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZl
dHRlckBpbnRlbC5jb20+Cj4gLS0tCj4gIGluY2x1ZGUvbGludXgvbW11X25vdGlmaWVyLmggfCA4
ICsrKysrKysrCj4gIG1tL21tdV9ub3RpZmllci5jICAgICAgICAgICAgfCA5ICsrKysrKysrKwo+
ICAyIGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKykKClJldmlld2VkLWJ5OiBKYXNvbiBH
dW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+CgpKYXNvbgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
