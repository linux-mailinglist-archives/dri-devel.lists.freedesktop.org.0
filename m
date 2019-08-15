Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D288F6D8
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 00:15:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFB2B6EA94;
	Thu, 15 Aug 2019 22:15:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 864566EA93;
 Thu, 15 Aug 2019 22:15:10 +0000 (UTC)
Received: from akpm3.svl.corp.google.com (unknown [104.133.8.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C578E20644;
 Thu, 15 Aug 2019 22:15:09 +0000 (UTC)
Date: Thu, 15 Aug 2019 15:15:09 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH 2/5] kernel.h: Add non_block_start/end()
Message-Id: <20190815151509.9ddbd1f11fb9c4c3e97a67a5@linux-foundation.org>
In-Reply-To: <20190815084429.GE9477@dhcp22.suse.cz>
References: <20190814202027.18735-1-daniel.vetter@ffwll.ch>
 <20190814202027.18735-3-daniel.vetter@ffwll.ch>
 <20190814134558.fe659b1a9a169c0150c3e57c@linux-foundation.org>
 <20190815084429.GE9477@dhcp22.suse.cz>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565907310;
 bh=uN4VcpeCW2jBJTI1Si370+ePLjzfshSmi9q5RwHK3zw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aTOvUoVh3yDGHY2VKKGjzrt2j37IUIAGRxiOv+BFw5caUUjN4/hUeJnHSChr2JqpI
 ttZvBwHNpv3VJSotvsrCun1FEqYSEDpoeVcWA9n9Ed8qlXTHvUVYtRTbD5b2RUVVCX
 GolZZPhsHLpPwXJ8M/alcsoSO7uLILhwTOk/xb7I=
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
Cc: Feng Tang <feng.tang@intel.com>, Randy Dunlap <rdunlap@infradead.org>,
 Kees Cook <keescook@chromium.org>, linux-mm@kvack.org,
 Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jann Horn <jannh@google.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 =?ISO-8859-1?Q?J=E9r=F4me?= Glisse <jglisse@redhat.com>,
 Ingo Molnar <mingo@redhat.com>, David Rientjes <rientjes@google.com>,
 Wei Wang <wvw@google.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAxNSBBdWcgMjAxOSAxMDo0NDoyOSArMDIwMCBNaWNoYWwgSG9ja28gPG1ob2Nrb0Br
ZXJuZWwub3JnPiB3cm90ZToKCj4gPiBJIGNvbnRpbnVlIHRvIHN0cnVnZ2xlIHdpdGggdGhpcy4g
IEl0IGludHJvZHVjZXMgYSBuZXcga2VybmVsIHN0YXRlCj4gPiAicnVubmluZyBwcmVlbXB0aWJs
eSBidXQgbXVzdCBub3QgY2FsbCBzY2hlZHVsZSgpIi4gIEhvdyBkb2VzIHRoaXMgbWFrZQo+ID4g
YW55IHNlbnNlPwo+ID4gCj4gPiBQZXJoYXBzIGEgbXVjaCwgbXVjaCBtb3JlIGRldGFpbGVkIGRl
c2NyaXB0aW9uIG9mIHRoZSBvb21fcmVhcGVyCj4gPiBzaXR1YXRpb24gd291bGQgaGVscCBvdXQu
Cj4gIAo+IFRoZSBwcmltYXJ5IHBvaW50IGhlcmUgaXMgdGhhdCB0aGVyZSBpcyBhIGRlbWFuZCBv
ZiBub24gYmxvY2thYmxlIG1tdQo+IG5vdGlmaWVycyB0byBiZSBjYWxsZWQgd2hlbiB0aGUgb29t
IHJlYXBlciB0ZWFycyBkb3duIHRoZSBhZGRyZXNzIHNwYWNlLgo+IEFzIHRoZSBvb20gcmVhcGVy
IGlzIHRoZSBwcmltYXJ5IGd1YXJhbnRlZSBvZiB0aGUgb29tIGhhbmRsaW5nIGZvcndhcmQKPiBw
cm9ncmVzcyBpdCBjYW5ub3QgYmUgYmxvY2tlZCBvbiBhbnl0aGluZyB0aGF0IG1pZ2h0IGRlcGVu
ZCBvbiBibG9ja2FibGUKPiBtZW1vcnkgYWxsb2NhdGlvbnMuIFRoZXNlIGFyZSBub3QgcmVhbGx5
IGVhc3kgdG8gdHJhY2sgYmVjYXVzZSB0aGV5Cj4gbWlnaHQgYmUgaW5kaXJlY3QgLSBlLmcuIG5v
dGlmaWVyIGJsb2NrcyBvbiBhIGxvY2sgd2hpY2ggb3RoZXIgY29udGV4dAo+IGhvbGRzIHdoaWxl
IGFsbG9jYXRpbmcgbWVtb3J5IG9yIHdhaXRpbmcgZm9yIGEgZmx1c2hlciB0aGF0IG5lZWRzIG1l
bW9yeQo+IHRvIHBlcmZvcm0gaXRzIHdvcmsuIElmIHN1Y2ggYSBibG9ja2luZyBzdGF0ZSBoYXBw
ZW5zIHRoYXQgd2UgY2FuIGVuZCB1cAo+IGluIGEgc2lsZW50IGhhbmcgd2l0aCBhbiB1bnVzYWJs
ZSBtYWNoaW5lLgo+IE5vdyB3ZSBob3BlIGZvciByZWFzb25hYmxlIGltcGxlbWVudGF0aW9ucyBv
ZiBtbXUgbm90aWZpZXJzIChzdHJvbmcKPiB3b3JkcyBJIGtub3cgOykgYW5kIHRoaXMgc2hvdWxk
IGJlIHJlbGF0aXZlbHkgc2ltcGxlIGFuZCBlZmZlY3RpdmUgY2F0Y2gKPiBhbGwgdG9vbCB0byBk
ZXRlY3Qgc29tZXRoaW5nIHN1c3BpY2lvdXMgaXMgZ29pbmcgb24uCj4gCj4gRG9lcyB0aGF0IG1h
a2UgdGhlIHNpdHVhdGlvbiBtb3JlIGNsZWFyPwoKWWVzLCB0aGFua3MsIG11Y2guICBNYXliZSBh
IGNvZGUgY29tbWVudCBhbG9uZyB0aGUgbGluZXMgb2YKCiAgVGhpcyBpcyBvbiBiZWhhbGYgb2Yg
dGhlIG9vbSByZWFwZXIsIHNwZWNpZmljYWxseSB3aGVuIGl0IGlzCiAgY2FsbGluZyB0aGUgbW11
IG5vdGlmaWVycy4gIFRoZSBwcm9ibGVtIGlzIHRoYXQgaWYgdGhlIG5vdGlmaWVyIHdlcmUKICB0
byBibG9jayBvbiwgZm9yIGV4YW1wbGUsIG11dGV4X2xvY2soKSBhbmQgaWYgdGhlIHByb2Nlc3Mg
d2hpY2ggaG9sZHMKICB0aGF0IG11dGV4IHdlcmUgdG8gcGVyZm9ybSBhIHNsZWVwaW5nIG1lbW9y
eSBhbGxvY2F0aW9uLCB0aGUgb29tCiAgcmVhcGVyIGlzIG5vdyBibG9ja2VkIG9uIGNvbXBsZXRp
b24gb2YgdGhhdCBtZW1vcnkgYWxsb2NhdGlvbi4KCmJ0dywgZG8gd2UgbmVlZCB0YXNrX3N0cnVj
dC5ub25fYmxvY2tfY291bnQ/ICBQZXJoYXBzIHRoZSBvb20gcmVhcGVyCnRocmVhZCBjb3VsZCBz
ZXQgYSBuZXcgUEZfTk9OQkxPQ0sgKHdoaWNoIHdvdWxkIGJlIG1vcmUgZ2VuZXJhbCB0aGFuClBG
X09PTV9SRUFQRVIpLiAgSWYgd2UgcnVuIG91dCBvZiBQRl8gZmxhZ3MsIHVzZSAoY3VycmVudCA9
PSBvb21fcmVhcGVyX3RoKS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
