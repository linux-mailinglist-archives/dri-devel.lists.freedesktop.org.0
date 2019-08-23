Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 631369B19A
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 16:06:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E77656ECA9;
	Fri, 23 Aug 2019 14:06:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8DAD6ECA7;
 Fri, 23 Aug 2019 14:06:45 +0000 (UTC)
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1i1ACp-00023P-9v; Fri, 23 Aug 2019 14:06:19 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 6A117307510;
 Fri, 23 Aug 2019 16:05:43 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 99EF9202245FF; Fri, 23 Aug 2019 16:06:15 +0200 (CEST)
Date: Fri, 23 Aug 2019 16:06:15 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 3/4] kernel.h: Add non_block_start/end()
Message-ID: <20190823140615.GJ2369@hirez.programming.kicks-ass.net>
References: <20190820081902.24815-1-daniel.vetter@ffwll.ch>
 <20190820081902.24815-4-daniel.vetter@ffwll.ch>
 <20190820202440.GH11147@phenom.ffwll.local>
 <20190822161428.c9e4479207386d34745ea111@linux-foundation.org>
 <CAKMK7uGw_7uD=wH3bcR9xXSxAcAuYTLOZt3ue4TEvst1D0KzLQ@mail.gmail.com>
 <20190823121234.GB12968@ziepe.ca>
 <CAKMK7uHzSkd2j4MvSMoHhCaSE0BT0zMo9osF4FUBYwNZrVfYDA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uHzSkd2j4MvSMoHhCaSE0BT0zMo9osF4FUBYwNZrVfYDA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YKuQj4mAn7Ly5b7a4x9QRIt1a/TDbvR4K88H+PiPWaY=; b=pLeDF2JRWvn5cV6HVnEDw3VLF
 m6eg1WFTuIkTWXy/lA95iK0Ff+Ac3qqG7mLkMqzJnT5sh0kFAMPkyhTnHF0ObSzu5cOOSYXkv4tyS
 okxtf6Uc8yCdeZ7c236qvdKh/NoFGDK7/Ti7lMgUFd/or3ObdSQstPTL+isWWUyFCgJzKIwdrWHHk
 uLGRqW0XJlsVnbiO99fDPHpYfC+GXdqwSgf/L2sUCn3oi6eZ3yKbdS/Tkg4RD1eqsMG/kHAbOtFYt
 0i3/a/MJg+FHF9xSxttoVoi9RtyiTlKVAaynNJpYkhjPA4JQF/8KRtSwV6XEQw2gbS58lOIvz97TV
 NeA22XXQQ==;
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
Cc: Feng Tang <feng.tang@intel.com>, Michal Hocko <mhocko@suse.com>,
 Kees Cook <keescook@chromium.org>, Linux MM <linux-mm@kvack.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jann Horn <jannh@google.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Randy Dunlap <rdunlap@infradead.org>, David Rientjes <rientjes@google.com>,
 Wei Wang <wvw@google.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMjMsIDIwMTkgYXQgMDM6NDI6NDdQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBJJ20gYXNzdW1pbmcgdGhlIGxvY2tkZXAgb25lIHdpbGwgbGFuZCwgc28gbm90IGdv
aW5nIHRvIHJlc2VuZCB0aGF0LgoKSSB3YXMgYXNzdW1pbmcgeW91J2Qgd2FrZSB0aGUgbWlnaHRf
bG9ja19uZXN0ZWQoKSBhbG9uZyB3aXRoIHRoZSBpOTE1CnVzZXIgdGhyb3VnaCB0aGUgaTkxNS9k
cm0gdHJlZS4gSWYgd2FudCBtZSB0byB0YWtlIHNvbWUgb3IgYWxsIG9mIHRoYXQsCmxlbW1lIGtu
b3cuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
