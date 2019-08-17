Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1599E911E1
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 18:10:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E3596E556;
	Sat, 17 Aug 2019 16:10:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D34B6E556
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2019 16:10:06 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id z17so12264028otk.13
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2019 09:10:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/dLbDP+XbKcJMYntrsaFKnZVTIgZ0VHyMdGQlHN9qFU=;
 b=TwF4fBoj6g2bR+1VEGQwgAUmUfonb3YXvCR5/NFhyEuTJWok2psdZUjD0GLLswH2S9
 J4N51i4NhBBu5daPFGXOSPttG7o9vg5fkYSnE2z6LKTJv3DLF+k+X48QhnqUHf9P3dqq
 MIYxyrpcZNMBNdjueuF+pv589sfu0371eUETF32y9vGkIpgA3ReiGDIbdMz9P0S79oUu
 lhMRx0A1GwmSwXNdj5HP9c2mf1bhMvUIGv759XzynMBZmvh5yeMvr+TZhZCrdy7AL5x9
 o9VpmA1PBHrntddHtXyy6J8nM+FvuLeXLfXrWCdt50ztG4KSlg+rbguOA0iiWuKw2kxo
 KZMQ==
X-Gm-Message-State: APjAAAVojdMWHdXNE5zKIZQ6zBE1krM/aol+xJQvlhBL1PyPHnif3ypd
 RBTsmkgCedTrxOgbja90QpiW5+IoWWwS2avrXeMFcw==
X-Google-Smtp-Source: APXvYqzydMn1g2ReqTDUP6q5J7E16naHWiuE7+1VXp+Gur58sjaLDTfR2sEFLUfZsgF+0Z+C8/UELi+pyIE63v/mZBI=
X-Received: by 2002:a9d:590d:: with SMTP id t13mr660910oth.281.1566058205676; 
 Sat, 17 Aug 2019 09:10:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190814202027.18735-1-daniel.vetter@ffwll.ch>
 <20190814202027.18735-4-daniel.vetter@ffwll.ch>
 <20190815000029.GC11200@ziepe.ca>
 <20190815070249.GB7444@phenom.ffwll.local> <20190815123556.GB21596@ziepe.ca>
In-Reply-To: <20190815123556.GB21596@ziepe.ca>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Sat, 17 Aug 2019 18:09:54 +0200
Message-ID: <CAKMK7uFz1ZiUUK5+tGpf-9Gksu5uN72sFW_KpJ53BuSfKY8PVg@mail.gmail.com>
Subject: Re: [PATCH 3/5] mm, notifier: Catch sleeping/blocking for !blockable
To: Jason Gunthorpe <jgg@ziepe.ca>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=/dLbDP+XbKcJMYntrsaFKnZVTIgZ0VHyMdGQlHN9qFU=;
 b=B5UOJokGjOlBPz4rMQ3Si/DpHraMyEYjQZnsGkf6QDVaPp5z9cpjK1+gkfiq/zazff
 NL4cuOvDdj2IcVJLJ9P5XOOuwMQ+B+/YrCGP3oe4dPerl/SOJztR2seJqY/t5jIW2guZ
 0vUMVsA5mwUX/XZfEdCbwGtfe9HGRKda6wKfY=
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

T24gU2F0LCBBdWcgMTcsIDIwMTkgYXQgNToyNiBQTSBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVw
ZS5jYT4gd3JvdGU6Cj4KPiBPbiBUaHUsIEF1ZyAxNSwgMjAxOSBhdCAwOTowMjo0OUFNICswMjAw
LCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+ID4gT24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgMDk6MDA6
MjlQTSAtMDMwMCwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+ID4gPiBPbiBXZWQsIEF1ZyAxNCwg
MjAxOSBhdCAxMDoyMDoyNVBNICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+ID4gPiA+IFdl
IG5lZWQgdG8gbWFrZSBzdXJlIGltcGxlbWVudGF0aW9ucyBkb24ndCBjaGVhdCBhbmQgZG9uJ3Qg
aGF2ZSBhCj4gPiA+ID4gcG9zc2libGUgc2NoZWR1bGUvYmxvY2tpbmcgcG9pbnQgZGVlcGx5IGJ1
cnJpZWQgd2hlcmUgcmV2aWV3IGNhbid0Cj4gPiA+ID4gY2F0Y2ggaXQuCj4gPiA+ID4KPiA+ID4g
PiBJJ20gbm90IHN1cmUgd2hldGhlciB0aGlzIGlzIHRoZSBiZXN0IHdheSB0byBtYWtlIHN1cmUg
YWxsIHRoZQo+ID4gPiA+IG1pZ2h0X3NsZWVwKCkgY2FsbHNpdGVzIHRyaWdnZXIsIGFuZCBpdCdz
IGEgYml0IHVnbHkgaW4gdGhlIGNvZGUgZmxvdy4KPiA+ID4gPiBCdXQgaXQgZ2V0cyB0aGUgam9i
IGRvbmUuCj4gPiA+ID4KPiA+ID4gPiBJbnNwaXJlZCBieSBhbiBpOTE1IHBhdGNoIHNlcmllcyB3
aGljaCBkaWQgZXhhY3RseSB0aGF0LCBiZWNhdXNlIHRoZQo+ID4gPiA+IHJ1bGVzIGhhdmVuJ3Qg
YmVlbiBlbnRpcmVseSBjbGVhciB0byB1cy4KPiA+ID4KPiA+ID4gSSB0aG91Z2h0IGxvY2tkZXAg
YWxyZWFkeSB3YXMgYWJsZSB0byBkZXRlY3Q6Cj4gPiA+Cj4gPiA+ICBzcGluX2xvY2soKQo+ID4g
PiAgbWlnaHRfc2xlZXAoKTsKPiA+ID4gIHNwaW5fdW5sb2NrKCkKPiA+ID4KPiA+ID4gQW0gSSBt
aXN0YWtlbj8gSWYgeWVzLCBjb3VsZG4ndCB0aGlzIHBhdGNoIGp1c3QgaW5qZWN0IGEgZHVtbXkg
bG9ja2RlcAo+ID4gPiBzcGlubG9jaz8KPiA+Cj4gPiBIbSAuLi4gYXNzdW1pbmcgSSBkaWRuJ3Qg
Z2V0IGxvc3QgaW4gdGhlIG1hemUgSSB0aGluayBtaWdodF9zbGVlcCAod2VsbAo+ID4gX19fbWln
aHRfc2xlZXApIGRvZXNuJ3QgZG8gYW55IGxvY2tkZXAgY2hlY2tpbmcgYXQgYWxsLiBBbmQgd2Ug
d2FudAo+ID4gbWlnaHRfc2xlZXAsIHNpbmNlIHRoYXQgY2F0Y2hlcyBhIGxvdCBtb3JlIHRoYW4g
bG9ja2RlcC4KPgo+IERvbid0IGtub3cgaG93IGl0IHdvcmtzLCBidXQgaXQgc3VyZSBsb29rcyBs
aWtlIGl0IGRvZXM6Cj4KPiBUaGlzOgo+ICAgICAgICAgc3Bpbl9sb2NrKCZmaWxlLT51b2JqZWN0
c19sb2NrKTsKPiAgICAgICAgIGRvd25fcmVhZCgmZmlsZS0+aHdfZGVzdHJveV9yd3NlbSk7Cj4g
ICAgICAgICB1cF9yZWFkKCZmaWxlLT5od19kZXN0cm95X3J3c2VtKTsKPiAgICAgICAgIHNwaW5f
dW5sb2NrKCZmaWxlLT51b2JqZWN0c19sb2NrKTsKPgo+IENhdXNlczoKPgo+IFsgICAzMy4zMjQ3
MjldIEJVRzogc2xlZXBpbmcgZnVuY3Rpb24gY2FsbGVkIGZyb20gaW52YWxpZCBjb250ZXh0IGF0
IGtlcm5lbC9sb2NraW5nL3J3c2VtLmM6MTQ0NAo+IFsgICAzMy4zMjU1OTldIGluX2F0b21pYygp
OiAxLCBpcnFzX2Rpc2FibGVkKCk6IDAsIHBpZDogMjQ3LCBuYW1lOiBpYnZfZGV2aW5mbwo+IFsg
ICAzMy4zMjYxMTVdIDMgbG9ja3MgaGVsZCBieSBpYnZfZGV2aW5mby8yNDc6Cj4gWyAgIDMzLjMy
NjU1Nl0gICMwOiAwMDAwMDAwMDllZGY4Mzc5ICgmdXZlcmJzX2Rldi0+ZGlzYXNzb2NpYXRlX3Ny
Y3Upey4uLi59LCBhdDogaWJfdXZlcmJzX29wZW4rMHhmZi8weDVmMCBbaWJfdXZlcmJzXQo+IFsg
ICAzMy4zMjc2NTddICAjMTogMDAwMDAwMDA1ZTBlZGRmMSAoJnV2ZXJic19kZXYtPmxpc3RzX211
dGV4KXsrLisufSwgYXQ6IGliX3V2ZXJic19vcGVuKzB4MTZjLzB4NWYwIFtpYl91dmVyYnNdCj4g
WyAgIDMzLjMyODY4Ml0gICMyOiAwMDAwMDAwMDUwNWY1MDllICgmKCZmaWxlLT51b2JqZWN0c19s
b2NrKS0+cmxvY2speysuKy59LCBhdDogaWJfdXZlcmJzX29wZW4rMHgzMWEvMHg1ZjAgW2liX3V2
ZXJic10KPgo+IEFuZCB0aGlzOgo+Cj4gICAgICAgICBzcGluX2xvY2soJmZpbGUtPnVvYmplY3Rz
X2xvY2spOwo+ICAgICAgICAgbWlnaHRfc2xlZXAoKTsKPiAgICAgICAgIHNwaW5fdW5sb2NrKCZm
aWxlLT51b2JqZWN0c19sb2NrKTsKPgo+IENhdXNlczoKPgo+IFsgICAxNi44NjcyMTFdIEJVRzog
c2xlZXBpbmcgZnVuY3Rpb24gY2FsbGVkIGZyb20gaW52YWxpZCBjb250ZXh0IGF0IGRyaXZlcnMv
aW5maW5pYmFuZC9jb3JlL3V2ZXJic19tYWluLmM6MTA5NQo+IFsgICAxNi44Njc3NzZdIGluX2F0
b21pYygpOiAxLCBpcnFzX2Rpc2FibGVkKCk6IDAsIHBpZDogMjQ1LCBuYW1lOiBpYnZfZGV2aW5m
bwo+IFsgICAxNi44NjgwOThdIDMgbG9ja3MgaGVsZCBieSBpYnZfZGV2aW5mby8yNDU6Cj4gWyAg
IDE2Ljg2ODM4M10gICMwOiAwMDAwMDAwMDRjNTk1NGZmICgmdXZlcmJzX2Rldi0+ZGlzYXNzb2Np
YXRlX3NyY3Upey4uLi59LCBhdDogaWJfdXZlcmJzX29wZW4rMHhmOC8weDYwMCBbaWJfdXZlcmJz
XQo+IFsgICAxNi44Njg5MzhdICAjMTogMDAwMDAwMDAyMGE2ZmFlMiAoJnV2ZXJic19kZXYtPmxp
c3RzX211dGV4KXsrLisufSwgYXQ6IGliX3V2ZXJic19vcGVuKzB4MTZjLzB4NjAwIFtpYl91dmVy
YnNdCj4gWyAgIDE2Ljg2OTU2OF0gICMyOiAwMDAwMDAwMDAzNmU2YTk3ICgmKCZmaWxlLT51b2Jq
ZWN0c19sb2NrKS0+cmxvY2speysuKy59LCBhdDogaWJfdXZlcmJzX29wZW4rMHgzMTcvMHg2MDAg
W2liX3V2ZXJic10KPgo+IEkgdGhpbmsgdGhpcyBpcyBkb25lIGluIHNvbWUgdmVyeSBleHBlbnNp
dmUgd2F5LCBzbyBpdCBwcm9iYWJseSBvbmx5Cj4gd29ya3Mgd2hlbiBsb2NrZGVwIGlzIGVuYWJs
ZWQuLgoKVGhpcyBpcyB0aGUgbWlnaHRfc2xlZXAgZGVidWcgaW5mcmFzdHJ1Y3R1cmUgKGJvdGgg
b2YgdGhlbSksIG5vdApsb2NrZGVwLiBEaXNhYmxlIENPTkZJR19QUk9WRV9MT0NLSU5HIGFuZCB5
b3Ugc2hvdWxkIHN0aWxsIGdldCB0aGVzZS4KLURhbmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0
d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KKzQxICgwKSA3OSAzNjUgNTcgNDggLSBo
dHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
