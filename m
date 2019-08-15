Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 205938E54A
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 09:14:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 354026E8B0;
	Thu, 15 Aug 2019 07:14:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBAE76E8B0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 07:14:19 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id r12so1348989edo.5
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 00:14:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=rjonirMyNKFLmr6pNWt9/0hY9meFYjEaFyv9/3cyMYc=;
 b=LdWtvKoZPq6FC1mJJhsXNmmW0MTkIyARC2OlsbfnV2ANwGnAxwyHGPaKqjiPUbmQyi
 sQUIiUnIccZDAs4Vkk2TYCpSuMIfGWlS+gEF5t36+8/We9dFaZwqNajXaBLzeET583UL
 NVU8+TsTvQ/MZVRwnKWXM+ZvK+ujTtLBIdpwHbFKllT9NU+PcbIYOSnNkW4jz5MpURT4
 yeFGlWDhB90zOImxeL1qjXXNic5jnQg5XyD7PsKNfSzkEgwF8QHxYslfyCR74FOUe8Yp
 kpqBiNKipw1XOFElXYyuZ9sm4N1FL6qboOAnx7wzrgMu+vD49twsEyaCSdLvDLjTw33B
 7JMg==
X-Gm-Message-State: APjAAAWV43Ng1yidzoIUpwHH9pFxabbhNrHs1bL3/OlFCYbTY51ctf0b
 FWJxQ6Z4Drbp1uCJuHBfPJNDj9hiwz8Fwg==
X-Google-Smtp-Source: APXvYqxHFed471aqkz65evmjZ3bTGMMJcAWmhTm+eeuK6Ic5QidqvFlMXSewSwbHwYbGaD4JTt8JMw==
X-Received: by 2002:a17:906:504e:: with SMTP id
 e14mr178194ejk.204.1565853258482; 
 Thu, 15 Aug 2019 00:14:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id br8sm265471ejb.92.2019.08.15.00.14.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2019 00:14:17 -0700 (PDT)
Date: Thu, 15 Aug 2019 09:14:15 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 5/5] mm/hmm: WARN on illegal ->sync_cpu_device_pagetables
 errors
Message-ID: <20190815071415.GD7444@phenom.ffwll.local>
Mail-Followup-To: Jason Gunthorpe <jgg@ziepe.ca>,
 LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Matthew Wilcox <willy@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
 Balbir Singh <bsingharora@gmail.com>,
 Ira Weiny <ira.weiny@intel.com>,
 Souptick Joarder <jrdr.linux@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>
References: <20190814202027.18735-1-daniel.vetter@ffwll.ch>
 <20190814202027.18735-6-daniel.vetter@ffwll.ch>
 <20190815001137.GE11200@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190815001137.GE11200@ziepe.ca>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=rjonirMyNKFLmr6pNWt9/0hY9meFYjEaFyv9/3cyMYc=;
 b=VhXMIl/eHGwrgkMfakF/qwMwhZWtWXKUF49966PDQfDBaReTfTCf/9nggMPlMNxWd0
 5XGY5nleuGWkyUPLKbEn0i0w72q4fQknknNeCXEqoKNJzPn1PhygwPcQnXfTc4lcwPVZ
 nORHA6FNAFB2JO91ROMe5aGnJiwmdIbl2oD7w=
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
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-mm@kvack.org,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Matthew Wilcox <willy@infradead.org>, John Hubbard <jhubbard@nvidia.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Balbir Singh <bsingharora@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 Souptick Joarder <jrdr.linux@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgMDk6MTE6MzdQTSAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IE9uIFdlZCwgQXVnIDE0LCAyMDE5IGF0IDEwOjIwOjI3UE0gKzAyMDAsIERhbmll
bCBWZXR0ZXIgd3JvdGU6Cj4gPiBTaW1pbGFyIHRvIHRoZSB3YXJuaW5nIGluIHRoZSBtbXUgbm90
aWZlciwgd2FybmluZyBpZiBhbiBobW0gbWlycm9yCj4gPiBjYWxsYmFjayBnZXRzIGl0J3MgYmxv
Y2tpbmcgdnMuIG5vbmJsb2NraW5nIGhhbmRsaW5nIHdyb25nLCBvciBpZiBpdAo+ID4gZmFpbHMg
d2l0aCBhbnl0aGluZyBlbHNlIHRoYW4gLUVBR0FJTi4KPiA+IAo+ID4gQ2M6IEphc29uIEd1bnRo
b3JwZSA8amdnQHppZXBlLmNhPgo+ID4gQ2M6IFJhbHBoIENhbXBiZWxsIDxyY2FtcGJlbGxAbnZp
ZGlhLmNvbT4KPiA+IENjOiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Cj4gPiBD
YzogRGFuIFdpbGxpYW1zIDxkYW4uai53aWxsaWFtc0BpbnRlbC5jb20+Cj4gPiBDYzogRGFuIENh
cnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPgo+ID4gQ2M6IE1hdHRoZXcgV2lsY294
IDx3aWxseUBpbmZyYWRlYWQub3JnPgo+ID4gQ2M6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIu
ZGU+Cj4gPiBDYzogQmFsYmlyIFNpbmdoIDxic2luZ2hhcm9yYUBnbWFpbC5jb20+Cj4gPiBDYzog
SXJhIFdlaW55IDxpcmEud2VpbnlAaW50ZWwuY29tPgo+ID4gQ2M6IFNvdXB0aWNrIEpvYXJkZXIg
PGpyZHIubGludXhAZ21haWwuY29tPgo+ID4gQ2M6IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgt
Zm91bmRhdGlvbi5vcmc+Cj4gPiBDYzogIkrDqXLDtG1lIEdsaXNzZSIgPGpnbGlzc2VAcmVkaGF0
LmNvbT4KPiA+IENjOiBsaW51eC1tbUBrdmFjay5vcmcKPiA+IFNpZ25lZC1vZmYtYnk6IERhbmll
bCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+ID4gIG1tL2htbS5jIHwgMyArKysK
PiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4gPiAKPiA+IGRpZmYgLS1naXQg
YS9tbS9obW0uYyBiL21tL2htbS5jCj4gPiBpbmRleCAxNmI2NzMxYTM0ZGIuLjUyYWM1OTM4NDI2
OCAxMDA2NDQKPiA+ICsrKyBiL21tL2htbS5jCj4gPiBAQCAtMjA1LDYgKzIwNSw5IEBAIHN0YXRp
YyBpbnQgaG1tX2ludmFsaWRhdGVfcmFuZ2Vfc3RhcnQoc3RydWN0IG1tdV9ub3RpZmllciAqbW4s
Cj4gPiAgCQkJcmV0ID0gLUVBR0FJTjsKPiA+ICAJCQlicmVhazsKPiA+ICAJCX0KPiA+ICsJCVdB
Uk4ocmV0LCAiJXBTIGNhbGxiYWNrIGZhaWxlZCB3aXRoICVkIGluICVzYmxvY2thYmxlIGNvbnRl
eHRcbiIsCj4gPiArCQkgICAgIG1pcnJvci0+b3BzLT5zeW5jX2NwdV9kZXZpY2VfcGFnZXRhYmxl
cywgcmV0LAo+ID4gKwkJICAgICB1cGRhdGUuYmxvY2thYmxlID8gIiIgOiAibm9uLSIpOwo+ID4g
IAl9Cj4gPiAgCXVwX3JlYWQoJmhtbS0+bWlycm9yc19zZW0pOwo+IAo+IERpZG4ndCBJIGJlYXQg
eW91IHRvIHRoaXM/CgpWZXJ5IG11Y2ggcG9zc2libGUsIEkgdGhpbmsgSSBkaWRuJ3QgcmViYXNl
IHRoaXMgdG8gbGludXgtbmV4dCBiZWZvcmUKcmVzZW5kaW5nIC4uLiBoYXZlIGFuCgpSZXZpZXdl
ZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KCmluIGNhc2UgeW91
IG5lZWQuCgpDaGVlcnMsIERhbmllbAoKPiAKPiAJbGlzdF9mb3JfZWFjaF9lbnRyeShtaXJyb3Is
ICZobW0tPm1pcnJvcnMsIGxpc3QpIHsKPiAJCWludCByYzsKPiAKPiAJCXJjID0gbWlycm9yLT5v
cHMtPnN5bmNfY3B1X2RldmljZV9wYWdldGFibGVzKG1pcnJvciwgJnVwZGF0ZSk7Cj4gCQlpZiAo
cmMpIHsKPiAJCQlpZiAoV0FSTl9PTih1cGRhdGUuYmxvY2thYmxlIHx8IHJjICE9IC1FQUdBSU4p
KQo+IAkJCQljb250aW51ZTsKPiAJCQlyZXQgPSAtRUFHQUlOOwo+IAkJCWJyZWFrOwo+IAkJfQo+
IAl9Cj4gCj4gVGhhbmtzLAo+IEphc29uCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdp
bmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
