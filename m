Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE0FB358C
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 09:28:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E70036E842;
	Mon, 16 Sep 2019 07:28:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 431 seconds by postgrey-1.36 at gabe;
 Fri, 13 Sep 2019 13:50:33 UTC
Received: from mail3-162.sinamail.sina.com.cn (mail3-162.sinamail.sina.com.cn
 [202.108.3.162])
 by gabe.freedesktop.org (Postfix) with SMTP id B23156F3BC
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 13:50:33 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([222.131.67.234])
 by sina.com with ESMTP
 id 5D7B9C62000035C8; Fri, 13 Sep 2019 21:40:53 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 3162149284474
From: Hillf Danton <hdanton@sina.com>
To: Thomas Hellstrom <thomas_os@shipmail.org>,
 Thomas Hellstrom <thellstrom@vmware.com>
Subject: Re: [RFC PATCH 3/7] drm/ttm: TTM fault handler helpers
Date: Fri, 13 Sep 2019 21:40:39 +0800
Message-Id: <20190913134039.3164-1-hdanton@sina.com>
In-Reply-To: <20190913093213.27254-1-thomas_os@shipmail.org>
References: <20190913093213.27254-1-thomas_os@shipmail.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 16 Sep 2019 07:28:04 +0000
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
Cc: jglisse@redhat.com, Michal Hocko <mhocko@suse.com>,
 Rik van Riel <riel@surriel.com>, pv-drivers@vmware.com,
 Minchan Kim <minchan@kernel.org>, Will Deacon <will.deacon@arm.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 Peter Zijlstra <peterz@infradead.org>, linux-graphics-maintainer@vmware.com,
 Matthew Wilcox <willy@infradead.org>, Huang Ying <ying.huang@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, christian.koenig@amd.com,
 Souptick Joarder <jrdr.linux@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIEZyaSwgMTMgU2VwIDIwMTkgMTE6MzI6MDkgKzAyMDAKPiAKPiAgCWVyciA9IHR0bV9tZW1f
aW9fbG9jayhtYW4sIHRydWUpOwo+IC0JaWYgKHVubGlrZWx5KGVyciAhPSAwKSkgewo+IC0JCXJl
dCA9IFZNX0ZBVUxUX05PUEFHRTsKPiAtCQlnb3RvIG91dF91bmxvY2s7Cj4gLQl9Cj4gKwlpZiAo
dW5saWtlbHkoZXJyICE9IDApKQo+ICsJCXJldHVybiBWTV9GQVVMVF9OT1BBR0U7Cj4gIAllcnIg
PSB0dG1fbWVtX2lvX3Jlc2VydmVfdm0oYm8pOwo+IC0JaWYgKHVubGlrZWx5KGVyciAhPSAwKSkg
ewo+IC0JCXJldCA9IFZNX0ZBVUxUX1NJR0JVUzsKPiAtCQlnb3RvIG91dF9pb191bmxvY2s7Cj4g
LQl9Cj4gKwlpZiAodW5saWtlbHkoZXJyICE9IDApKQo+ICsJCXJldHVybiBWTV9GQVVMVF9TSUdC
VVM7Cj4gCkhlaGUsIG5vIGh1cnJ5LgoKPiBAQCAtMjk1LDggKzMwNywyOCBAQCBzdGF0aWMgdm1f
ZmF1bHRfdCB0dG1fYm9fdm1fZmF1bHQoc3RydWN0IHZtX2ZhdWx0ICp2bWYpCj4gIAlyZXQgPSBW
TV9GQVVMVF9OT1BBR0U7Cj4gIG91dF9pb191bmxvY2s6Cj4gIAl0dG1fbWVtX2lvX3VubG9jayht
YW4pOwo+IC1vdXRfdW5sb2NrOgo+ICsJcmV0dXJuIHJldDsKPiArfQo+ICtFWFBPUlRfU1lNQk9M
KHR0bV9ib192bV9mYXVsdF9yZXNlcnZlZCk7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
