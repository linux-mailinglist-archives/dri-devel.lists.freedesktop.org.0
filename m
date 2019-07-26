Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E59CD75C31
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 02:55:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7619A6E83E;
	Fri, 26 Jul 2019 00:55:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A7766E839;
 Fri, 26 Jul 2019 00:55:06 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d3a4f710000>; Thu, 25 Jul 2019 17:55:13 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Thu, 25 Jul 2019 17:55:05 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Thu, 25 Jul 2019 17:55:05 -0700
Received: from rcampbell-dev.nvidia.com (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 26 Jul 2019 00:55:01 +0000
Subject: Re: hmm_range_fault related fixes and legacy API removal v3
To: Jason Gunthorpe <jgg@mellanox.com>, Christoph Hellwig <hch@lst.de>
References: <20190724065258.16603-1-hch@lst.de>
 <20190726001622.GL7450@mellanox.com>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <a07dbc3b-7a54-e524-944a-b7e4e49b2a93@nvidia.com>
Date: Thu, 25 Jul 2019 17:55:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190726001622.GL7450@mellanox.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1564102514; bh=ZQ1jv0UqwPmyi2RPWuaB3X1EU0IchBq6t+yb1fsAdJ4=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=f/sh0ctgAZhMbKQYTlexXEJoHV0KQINhCO6bkbmGWeszkuNRymCHe6c6uyHeaJRwp
 IdW80YxJXLmIA9bww6UnsvMglS603q6J/FPGRo5T1A6lNQVbuaWsRyqwpYHVgcmXNh
 UVNtiEcG/fZ6RXNzjS/ieqwrVPvq0XJzR9/Q25hBThg4zIeFtHcA9oGuqam0AnJ+86
 AFks8u7GRmI/pKdsL+rL7Ka1XUn5B7rgGlDzoQhGPAXWPgdoFai5kyEz0/Vi/KvH6F
 ApgdyCFz+lDvtDwn5eJWUxVDfAtY/1iP4ObpuleyveRslqdMAWjzrbesvAWIM85Q1h
 mST41mPDE/GSA==
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDcvMjUvMTkgNToxNiBQTSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+IE9uIFdlZCwgSnVs
IDI0LCAyMDE5IGF0IDA4OjUyOjUxQU0gKzAyMDAsIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+
PiBIaSBKw6lyw7RtZSwgQmVuIGFuZCBKYXNvbiwKPj4KPj4gYmVsb3cgaXMgYSBzZXJpZXMgYWdh
aW5zdCB0aGUgaG1tIHRyZWUgd2hpY2ggZml4ZXMgdXAgdGhlIG1tYXBfc2VtCj4+IGxvY2tpbmcg
aW4gbm91dmVhdSBhbmQgd2hpbGUgYXQgaXQgYWxzbyByZW1vdmVzIGxlZnRvdmVyIGxlZ2FjeSBI
TU0gQVBJcwo+PiBvbmx5IHVzZWQgYnkgbm91dmVhdS4KPj4KPj4gVGhlIGZpcnN0IDQgcGF0Y2hl
cyBhcmUgYSBidWcgZml4IGZvciBub3V2ZWF1LCB3aGljaCBJIHN1c3BlY3Qgc2hvdWxkCj4+IGdv
IGludG8gdGhpcyBtZXJnZSB3aW5kb3cgZXZlbiBpZiB0aGUgY29kZSBpcyBtYXJrZWQgYXMgc3Rh
Z2luZywganVzdAo+PiB0byBhdm9pZCBwZW9wbGUgY29weWluZyB0aGUgYnJlYWthZ2UuCj4+Cj4+
IENoYW5nZXMgc2luY2UgdjI6Cj4+ICAgLSBuZXcgcGF0Y2ggZnJvbSBKYXNvbiB0byBkb2N1bWVu
dCBGQVVMVF9GTEFHX0FMTE9XX1JFVFJZIHNlbWFudGljcwo+PiAgICAgYmV0dGVyCj4+ICAgLSBy
ZW1vdmUgLUVBR0FJTiBoYW5kbGluZyBpbiBub3V2ZWF1IGVhcmxpZXIKPiAKPiBJIGRvbid0IHNl
ZSBSYWxwaCdzIHRlc3RlZCBieSwgZG8geW91IHRoaW5rIGl0IGNoYW5nZWQgZW5vdWdoIHRvCj4g
cmVxdWlyZSB0ZXN0aW5nIGFnYWluPyBJZiBzbywgUmFscGggd291bGQgeW91IGJlIHNvIGtpbmQ/
Cj4gCj4gSW4gYW55IGV2ZW50LCBJJ20gc2VuZGluZyB0aGlzIGludG8gbGludXgtbmV4dCBhbmQg
aW50ZW5kIHRvIGZvcndhcmQKPiB0aGUgZmlyc3QgZm91ciBuZXh0IHdlZWsuCj4gCj4gVGhhbmtz
LAo+IEphc29uCj4gCgpJIGhhdmUgYmVlbiB0ZXN0aW5nIENocmlzdG9waCdzIHYzIHdpdGggbXkg
c2V0IG9mIHYyIGNoYW5nZXMgc28KZmVlbCBmcmVlIHRvIGFkZCBteSB0ZXN0ZWQtYnkuCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
