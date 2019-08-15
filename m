Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BABF91173
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:26:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1B406EA2B;
	Sat, 17 Aug 2019 15:24:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DD976E3E5
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 12:35:58 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id g17so1632540qkk.8
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 05:35:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dMM4Yh2lSK206Ipl1C50HgHP0mjyxRSuLJo2cy44isg=;
 b=BExtyTjBMa9A7lHXnnxgvz549vfAkzpx8czujmeAZUJFy9QSWraAgtGe1LwUCps82T
 76PsEkXL1WU9+DwJcyCo19NYfp61700mxp9kJ0I9VqKhkuB12O9Ga1SlRnjpixmuwTdh
 6MVnqRbwJdaCM1mwiU5uH5wl3JDWMqfqYE5mMLeNtgvA5llFUhDJpztSz1mBEp20MtZp
 17+Loxp6cFobpmkUaX8cxKjhupVcC7SiIJ9gjxGEf9NcBOJtVDbDjU2T3cX48ttnIE9w
 W5CVWIVEfTzCcgb3orxPgZfiRVMNkBEoEYYcesCJAK2t6JJEdBmOXYmh7O/HgUxo53M3
 8n8g==
X-Gm-Message-State: APjAAAUIsDFzyGsHF5pdXcogtWdcFhDOgZMuweM3srvq1nl96sFiY3rA
 ey3j4uBzaeR8RjsBaHUaWspB6A==
X-Google-Smtp-Source: APXvYqzZPQEBN057F2yrI4X3kt2D83j+OvSKMlIAqweM6AFW+AjersDlJeeVNu5FXC0uFyP+8gWENQ==
X-Received: by 2002:a37:96c7:: with SMTP id y190mr3700663qkd.111.1565872557356; 
 Thu, 15 Aug 2019 05:35:57 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id w10sm1320862qts.37.2019.08.15.05.35.56
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 15 Aug 2019 05:35:56 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hyEyy-00043M-ES; Thu, 15 Aug 2019 09:35:56 -0300
Date: Thu, 15 Aug 2019 09:35:56 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@suse.com>,
 David Rientjes <rientjes@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Subject: Re: [PATCH 3/5] mm, notifier: Catch sleeping/blocking for !blockable
Message-ID: <20190815123556.GB21596@ziepe.ca>
References: <20190814202027.18735-1-daniel.vetter@ffwll.ch>
 <20190814202027.18735-4-daniel.vetter@ffwll.ch>
 <20190815000029.GC11200@ziepe.ca>
 <20190815070249.GB7444@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190815070249.GB7444@phenom.ffwll.local>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=dMM4Yh2lSK206Ipl1C50HgHP0mjyxRSuLJo2cy44isg=;
 b=LcThbfWlDi/1kO+hot7trp2RyPL/m8trA/zLWvD92LpYSw9yeBGasQ9R8EuhQAD4Bt
 bKTs6mxBzCYP5bxVj7suBbpQpwPmyVk9+ValBigp6E3/dN66mhkX8Njt4ppVEZtvDs7I
 pFV8ElSL59gPu/AJrf/nBtVrnXSJNWNiktqRsXie0F6agJz4BKwmgdVzNu8UCtVSZyjt
 8Wo1tUaZ7v0gu4catDl7h/ooM4QQ31MZD++g646hqe9H7YlNvUSIJCxR7iEcgQ6UNJ9L
 6M/IYIm3vG+ItNPPGAvXI3A8PLTW1EGMyGgSG4iOIgZ0ADxVFk0nYIVgDLqPrtq/MGRs
 HJ9w==
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

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMDk6MDI6NDlBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBXZWQsIEF1ZyAxNCwgMjAxOSBhdCAwOTowMDoyOVBNIC0wMzAwLCBKYXNvbiBH
dW50aG9ycGUgd3JvdGU6Cj4gPiBPbiBXZWQsIEF1ZyAxNCwgMjAxOSBhdCAxMDoyMDoyNVBNICsw
MjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+ID4gPiBXZSBuZWVkIHRvIG1ha2Ugc3VyZSBpbXBs
ZW1lbnRhdGlvbnMgZG9uJ3QgY2hlYXQgYW5kIGRvbid0IGhhdmUgYQo+ID4gPiBwb3NzaWJsZSBz
Y2hlZHVsZS9ibG9ja2luZyBwb2ludCBkZWVwbHkgYnVycmllZCB3aGVyZSByZXZpZXcgY2FuJ3QK
PiA+ID4gY2F0Y2ggaXQuCj4gPiA+IAo+ID4gPiBJJ20gbm90IHN1cmUgd2hldGhlciB0aGlzIGlz
IHRoZSBiZXN0IHdheSB0byBtYWtlIHN1cmUgYWxsIHRoZQo+ID4gPiBtaWdodF9zbGVlcCgpIGNh
bGxzaXRlcyB0cmlnZ2VyLCBhbmQgaXQncyBhIGJpdCB1Z2x5IGluIHRoZSBjb2RlIGZsb3cuCj4g
PiA+IEJ1dCBpdCBnZXRzIHRoZSBqb2IgZG9uZS4KPiA+ID4gCj4gPiA+IEluc3BpcmVkIGJ5IGFu
IGk5MTUgcGF0Y2ggc2VyaWVzIHdoaWNoIGRpZCBleGFjdGx5IHRoYXQsIGJlY2F1c2UgdGhlCj4g
PiA+IHJ1bGVzIGhhdmVuJ3QgYmVlbiBlbnRpcmVseSBjbGVhciB0byB1cy4KPiA+IAo+ID4gSSB0
aG91Z2h0IGxvY2tkZXAgYWxyZWFkeSB3YXMgYWJsZSB0byBkZXRlY3Q6Cj4gPiAKPiA+ICBzcGlu
X2xvY2soKQo+ID4gIG1pZ2h0X3NsZWVwKCk7Cj4gPiAgc3Bpbl91bmxvY2soKQo+ID4gCj4gPiBB
bSBJIG1pc3Rha2VuPyBJZiB5ZXMsIGNvdWxkbid0IHRoaXMgcGF0Y2gganVzdCBpbmplY3QgYSBk
dW1teSBsb2NrZGVwCj4gPiBzcGlubG9jaz8KPiAKPiBIbSAuLi4gYXNzdW1pbmcgSSBkaWRuJ3Qg
Z2V0IGxvc3QgaW4gdGhlIG1hemUgSSB0aGluayBtaWdodF9zbGVlcCAod2VsbAo+IF9fX21pZ2h0
X3NsZWVwKSBkb2Vzbid0IGRvIGFueSBsb2NrZGVwIGNoZWNraW5nIGF0IGFsbC4gQW5kIHdlIHdh
bnQKPiBtaWdodF9zbGVlcCwgc2luY2UgdGhhdCBjYXRjaGVzIGEgbG90IG1vcmUgdGhhbiBsb2Nr
ZGVwLgoKRG9uJ3Qga25vdyBob3cgaXQgd29ya3MsIGJ1dCBpdCBzdXJlIGxvb2tzIGxpa2UgaXQg
ZG9lczoKClRoaXM6CglzcGluX2xvY2soJmZpbGUtPnVvYmplY3RzX2xvY2spOwoJZG93bl9yZWFk
KCZmaWxlLT5od19kZXN0cm95X3J3c2VtKTsKCXVwX3JlYWQoJmZpbGUtPmh3X2Rlc3Ryb3lfcndz
ZW0pOwoJc3Bpbl91bmxvY2soJmZpbGUtPnVvYmplY3RzX2xvY2spOwoKQ2F1c2VzOgoKWyAgIDMz
LjMyNDcyOV0gQlVHOiBzbGVlcGluZyBmdW5jdGlvbiBjYWxsZWQgZnJvbSBpbnZhbGlkIGNvbnRl
eHQgYXQga2VybmVsL2xvY2tpbmcvcndzZW0uYzoxNDQ0ClsgICAzMy4zMjU1OTldIGluX2F0b21p
YygpOiAxLCBpcnFzX2Rpc2FibGVkKCk6IDAsIHBpZDogMjQ3LCBuYW1lOiBpYnZfZGV2aW5mbwpb
ICAgMzMuMzI2MTE1XSAzIGxvY2tzIGhlbGQgYnkgaWJ2X2RldmluZm8vMjQ3OgpbICAgMzMuMzI2
NTU2XSAgIzA6IDAwMDAwMDAwOWVkZjgzNzkgKCZ1dmVyYnNfZGV2LT5kaXNhc3NvY2lhdGVfc3Jj
dSl7Li4uLn0sIGF0OiBpYl91dmVyYnNfb3BlbisweGZmLzB4NWYwIFtpYl91dmVyYnNdClsgICAz
My4zMjc2NTddICAjMTogMDAwMDAwMDA1ZTBlZGRmMSAoJnV2ZXJic19kZXYtPmxpc3RzX211dGV4
KXsrLisufSwgYXQ6IGliX3V2ZXJic19vcGVuKzB4MTZjLzB4NWYwIFtpYl91dmVyYnNdClsgICAz
My4zMjg2ODJdICAjMjogMDAwMDAwMDA1MDVmNTA5ZSAoJigmZmlsZS0+dW9iamVjdHNfbG9jaykt
PnJsb2NrKXsrLisufSwgYXQ6IGliX3V2ZXJic19vcGVuKzB4MzFhLzB4NWYwIFtpYl91dmVyYnNd
CgpBbmQgdGhpczoKCglzcGluX2xvY2soJmZpbGUtPnVvYmplY3RzX2xvY2spOwoJbWlnaHRfc2xl
ZXAoKTsKCXNwaW5fdW5sb2NrKCZmaWxlLT51b2JqZWN0c19sb2NrKTsKCkNhdXNlczoKClsgICAx
Ni44NjcyMTFdIEJVRzogc2xlZXBpbmcgZnVuY3Rpb24gY2FsbGVkIGZyb20gaW52YWxpZCBjb250
ZXh0IGF0IGRyaXZlcnMvaW5maW5pYmFuZC9jb3JlL3V2ZXJic19tYWluLmM6MTA5NQpbICAgMTYu
ODY3Nzc2XSBpbl9hdG9taWMoKTogMSwgaXJxc19kaXNhYmxlZCgpOiAwLCBwaWQ6IDI0NSwgbmFt
ZTogaWJ2X2RldmluZm8KWyAgIDE2Ljg2ODA5OF0gMyBsb2NrcyBoZWxkIGJ5IGlidl9kZXZpbmZv
LzI0NToKWyAgIDE2Ljg2ODM4M10gICMwOiAwMDAwMDAwMDRjNTk1NGZmICgmdXZlcmJzX2Rldi0+
ZGlzYXNzb2NpYXRlX3NyY3Upey4uLi59LCBhdDogaWJfdXZlcmJzX29wZW4rMHhmOC8weDYwMCBb
aWJfdXZlcmJzXQpbICAgMTYuODY4OTM4XSAgIzE6IDAwMDAwMDAwMjBhNmZhZTIgKCZ1dmVyYnNf
ZGV2LT5saXN0c19tdXRleCl7Ky4rLn0sIGF0OiBpYl91dmVyYnNfb3BlbisweDE2Yy8weDYwMCBb
aWJfdXZlcmJzXQpbICAgMTYuODY5NTY4XSAgIzI6IDAwMDAwMDAwMDM2ZTZhOTcgKCYoJmZpbGUt
PnVvYmplY3RzX2xvY2spLT5ybG9jayl7Ky4rLn0sIGF0OiBpYl91dmVyYnNfb3BlbisweDMxNy8w
eDYwMCBbaWJfdXZlcmJzXQoKSSB0aGluayB0aGlzIGlzIGRvbmUgaW4gc29tZSB2ZXJ5IGV4cGVu
c2l2ZSB3YXksIHNvIGl0IHByb2JhYmx5IG9ubHkKd29ya3Mgd2hlbiBsb2NrZGVwIGlzIGVuYWJs
ZWQuLgoKSmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
