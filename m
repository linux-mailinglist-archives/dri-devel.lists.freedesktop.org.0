Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85568B358B
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 09:28:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCB116E840;
	Mon, 16 Sep 2019 07:28:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F3746F3ED
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 15:18:08 +0000 (UTC)
Received: from willy by bombadil.infradead.org with local (Exim 4.92.2 #3 (Red
 Hat Linux)) id 1i8nKl-0006KN-Pf; Fri, 13 Sep 2019 15:18:03 +0000
Date: Fri, 13 Sep 2019 08:18:03 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m_=28VMware=29?= <thomas_os@shipmail.org>
Subject: Re: [RFC PATCH 3/7] drm/ttm: TTM fault handler helpers
Message-ID: <20190913151803.GO29434@bombadil.infradead.org>
References: <20190913093213.27254-1-thomas_os@shipmail.org>
 <20190913093213.27254-4-thomas_os@shipmail.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190913093213.27254-4-thomas_os@shipmail.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Approved-At: Mon, 16 Sep 2019 07:28:04 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fxdx8ELT74pyYGT61OLGflIw6z6NXtnHEx3y22zF9/I=; b=HGJfCy214Ht+AD4xBmFC2EHL/h
 RGMiZnEGOa0ZkY+vilO/vwXrwlw5aVSIvlxTJlhfy35kx2Hk/aCz/fPXBIfh0u4xiRil59kS16WqN
 CY+c/HDv6hZES8flPhraJi79Tpz9SEavFg1fZFXMRI5mwNNJdUBiCFJFQIYl1DqSJWaXVqwotLrkI
 660Dzqxfp3iTpjh7kUAAzqrFPM72+Z6LiD0P9chN7sJkU1s05NXxtGy9NxaZYefRN/RG1jJscJbE4
 6htV+dd2KCxAB9XypgpTU4/6FN8Ci4QOP9ZyPmtmR7pOb2QB5fu/qm4PQs4IiI5fEeSy3ft9D+awP
 t+Sl2VEQ==;
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
Cc: =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, Michal Hocko <mhocko@suse.com>,
 Rik van Riel <riel@surriel.com>, pv-drivers@vmware.com,
 Minchan Kim <minchan@kernel.org>, Will Deacon <will.deacon@arm.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 Peter Zijlstra <peterz@infradead.org>, linux-graphics-maintainer@vmware.com,
 Souptick Joarder <jrdr.linux@gmail.com>, Huang Ying <ying.huang@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMTMsIDIwMTkgYXQgMTE6MzI6MDlBTSArMDIwMCwgVGhvbWFzIEhlbGxzdHLD
tm0gKFZNd2FyZSkgd3JvdGU6Cj4gK3ZtX2ZhdWx0X3QgdHRtX2JvX3ZtX2ZhdWx0X3Jlc2VydmVk
KHN0cnVjdCB2bV9mYXVsdCAqdm1mLAo+ICsJCQkJICAgIHBncHJvdF90IHByb3QsCj4gKwkJCQkg
ICAgcGdvZmZfdCBudW1fcHJlZmF1bHQpCj4gK3sKPiArCXN0cnVjdCB2bV9hcmVhX3N0cnVjdCAq
dm1hID0gdm1mLT52bWE7Cj4gKwlzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgY3ZtYSA9ICp2bWE7Cj4g
KwlzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvID0gKHN0cnVjdCB0dG1fYnVmZmVyX29iamVj
dCAqKQo+ICsJICAgIHZtYS0+dm1fcHJpdmF0ZV9kYXRhOwoKSXQncyBhIHZvaWQgKi4gIFRoZXJl
J3Mgbm8gbmVlZCB0byBjYXN0IGl0LgoKCXN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8gPSB2
bWEtPnZtX3ByaXZhdGVfZGF0YTsKCmNvbnZleXMgZXhhY3RseSB0aGUgc2FtZSBpbmZvcm1hdGlv
biB0byBib3RoIHRoZSByZWFkZXIgYW5kIHRoZSBjb21waWxlciwKZXhjZXB0IGl0J3MgYWxsIG9u
IG9uZSBsaW5lIGluc3RlYWQgb2Ygc3BsaXQgb3ZlciB0d28uCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
