Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC8A9A8D0
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 09:31:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E22E76EBCA;
	Fri, 23 Aug 2019 07:31:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A366F6EB5A
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 14:24:12 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id 201so5265518qkm.9
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 07:24:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Dc5+B44d/riVZ4BUj5s+q3Lkc18YuwqlI4z9+Sq+DYI=;
 b=V0fhlb1XY5VkHsIPJDaT4lJ07/DhRCx6t/JIKeGIDPvrVptpuR9qRb2eiqkgoSmJvj
 LmpS8qhXUpu5uhVDhJ6mYk8Ig3xoQ6pirIZplD8UOZfD++YB78GRsrDDJjsIlovXB4or
 H8j39BxSF6vbO53Szvk7AgyGLU75VPVMmisv18x8LRNGH6JPj89XLLUlz/M3U3i3+FXK
 wDuEMDGbsDMm5NxC2kfhtkkYvJYNuLIdwZXvwdN3956MEEV5GzuuqAMEAgqw5PV1/gwL
 bDQznulBvJV30VznZp4lQkiEBk6y9uHf3yE9k5DxpXpnT3cAoKGKzOxAjm2yon3VU9nA
 Hrdw==
X-Gm-Message-State: APjAAAXZ4EGTXC9w3ulgvDevVsMeGIqstigljCCxfm1PxLh68vSsNT5t
 YuX6lKaUmlJKvH4kfL85vnBURg==
X-Google-Smtp-Source: APXvYqx1hDXEyXaCf4TQxuW7kB785QqUUNv48fJgwQaA1egBhvm9xoK/w0v99nR0V1KI+G1DH5vz7A==
X-Received: by 2002:a37:47d8:: with SMTP id
 u207mr20384093qka.255.1566483851626; 
 Thu, 22 Aug 2019 07:24:11 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id m3sm7668768qki.10.2019.08.22.07.24.10
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 22 Aug 2019 07:24:10 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1i0o0Y-000763-37; Thu, 22 Aug 2019 11:24:10 -0300
Date: Thu, 22 Aug 2019 11:24:10 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 4/4] mm, notifier: Catch sleeping/blocking for !blockable
Message-ID: <20190822142410.GB8339@ziepe.ca>
References: <20190820081902.24815-1-daniel.vetter@ffwll.ch>
 <20190820081902.24815-5-daniel.vetter@ffwll.ch>
 <20190820133418.GG29246@ziepe.ca>
 <20190820151810.GG11147@phenom.ffwll.local>
 <20190821154151.GK11147@phenom.ffwll.local>
 <20190821161635.GC8653@ziepe.ca>
 <CAKMK7uERsmgFqDVHMCWs=4s_3fHM0eRr7MV6A8Mdv7xVouyxJw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uERsmgFqDVHMCWs=4s_3fHM0eRr7MV6A8Mdv7xVouyxJw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Fri, 23 Aug 2019 07:30:43 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Dc5+B44d/riVZ4BUj5s+q3Lkc18YuwqlI4z9+Sq+DYI=;
 b=U5M7r7PIyUiUocgqIIxQGJhmG0OFdz9U6VAO0wM0x9A3Vm1DHeBBjWMEOm+kGH0+sZ
 DVv7IgnNa8XvXNx76i2JRGXB1VOoVy4HaRSd5Majxg2lBxexhTGf4IqG48SiOLjcbvhE
 Mgx+/6CT1tNcq2BuTPXz8aDbbkhIzpAZObMLT2Axn3xV8AUEPMljgWAa7yQMvm08Ssyj
 Z+5muEGCOJ/m+c/Z3hTPXgauluqi3fD9P9IRfcmxsuTg1tqEb+PCwj8pdWwr8DWOjvtw
 +g//1M+gbQ6xkkIk7Px0hFVwWYVOOI7HP4+k4bs2ecFl2T7g0x/XQiWSQxDtGK4KXiOT
 9sxg==
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

T24gVGh1LCBBdWcgMjIsIDIwMTkgYXQgMTA6NDI6MzlBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKCj4gPiBSRE1BIGhhcyBhIG11dGV4Ogo+ID4KPiA+IGliX3VtZW1fbm90aWZpZXJfaW52
YWxpZGF0ZV9yYW5nZV9lbmQKPiA+ICAgcmJ0X2liX3VtZW1fZm9yX2VhY2hfaW5fcmFuZ2UKPiA+
ICAgIGludmFsaWRhdGVfcmFuZ2Vfc3RhcnRfdHJhbXBvbGluZQo+ID4gICAgIGliX3VtZW1fbm90
aWZpZXJfZW5kX2FjY291bnQKPiA+ICAgICAgIG11dGV4X2xvY2soJnVtZW1fb2RwLT51bWVtX211
dGV4KTsKPiA+Cj4gPiBJJ20gd29ya2luZyB0byBkZWxldGUgdGhpcyBwYXRoIHRob3VnaCEKPiA+
Cj4gPiBub25ibG9ja2luZyBvciBub3QgZm9sbG93cyB0aGUgc3RhcnQsIHRoZSBzYW1lIGZsYWcg
Z2V0cyBwbGFjZWQgaW50bwo+ID4gdGhlIG1tdV9ub3RpZmllcl9yYW5nZSBzdHJ1Y3QgcGFzc2Vk
IHRvIGVuZC4KPiAKPiBPaywgbWFrZXMgc2Vuc2UuCj4gCj4gSSBndWVzcyB0aGF0IGFsc28gbWVh
bnMgdGhlIG1pZ2h0X3NsZWVwIChJIHN0YXJ0ZWQgb24gdGhhdCkgaW4KPiBpbnZhbGlkYXRlX3Jh
bmdlX2VuZCBhbHNvIG5lZWRzIHRvIGJlIGNvbmRpdGlvbmFsPyBPciBub3QgYm90aGVyIHdpdGgK
PiBhIG1pZ2h0X3NsZWVwIGluIGludmFsaWRhdGVfcmFuZ2VfZW5kIHNpbmNlIHlvdSdyZSB3b3Jr
aW5nIG9uIHJlbW92aW5nCj4gdGhlIGxhc3Qgc2xlZXAgaW4gdGhlcmU/CgpJIG1pZ2h0IHN1Z2dl
c3QgdGhlIHNhbWUgcGF0dGVybiBhcyB1c2VkIGZvciBsb2NrZWQsIHRoZSBtaWdodF9zbGVlcAp1
bmNvbmRpdGlvbmFsbHkgb24gdGhlIHN0YXJ0LCBhbmQgYSAybmQgbWlnaHQgc2xlZXAgYWZ0ZXIg
dGhlIElGIGluCl9fbW11X25vdGlmaWVyX2ludmFsaWRhdGVfcmFuZ2VfZW5kKCkKCk9ic2Vydmlu
ZyB0aGF0IGJ5IGF1ZGl0IGFsbCB0aGUgY2FsbGVycyBhbHJlYWR5IGhhdmUgdGhlIHNhbWUgbG9j
a2luZwpjb250ZXh0IGZvciBzdGFydC9lbmQKCkphc29uCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
