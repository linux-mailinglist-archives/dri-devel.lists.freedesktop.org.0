Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E2114528
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 09:28:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 214D08929B;
	Mon,  6 May 2019 07:28:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 862606E215;
 Fri,  3 May 2019 13:27:45 +0000 (UTC)
Received: from willy by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1hMYDu-0006ZD-4h; Fri, 03 May 2019 13:27:34 +0000
Date: Fri, 3 May 2019 06:27:33 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Martin Schwidefsky <schwidefsky@de.ibm.com>
Subject: Re: [PATCH] mm/pgtable: Drop pgtable_t variable from pte_fn_t
 functions
Message-ID: <20190503132733.GA5201@bombadil.infradead.org>
References: <1556803126-26596-1-git-send-email-anshuman.khandual@arm.com>
 <20190502134623.GA18948@bombadil.infradead.org>
 <20190502161457.1c9dbd94@mschwideX1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190502161457.1c9dbd94@mschwideX1>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Mailman-Approved-At: Mon, 06 May 2019 07:27:59 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mkGg1i+EI0XU//yFAO+gJW+bQDnnQU83x/RNkUevVAw=; b=T9s51+W+nABH6PVAvlfgP+ohw
 RCDyHolxbxOczp+Cg0V5Q3SXBf36YHMOis1fkWWpWSE0zZx6A65FVoDithh+5zNBA/L+/pInK3O58
 PPdp9B6gb5Mj1aHlTOwgYd7feLRBi467iD6vPhfKK/abUZfZCHY1041K3TtWkrj1V0TUQ8aWIVhLI
 +/1YzsyjItpsKuqA6JsKXlZeS7WEi7325sCVTFrE7teQKa5lOodL28eu5Nt6D+miXBGjogCaXg8yc
 VVRuwIZrSBtfheGOujAaXemlnM9xeF/eEeaLHQrjpzSd4fVzD5UcaEhjqq1fDcHkpcop11b8UYehV
 hXvd6JaeQ==;
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
Cc: Michal Hocko <mhocko@suse.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will.deacon@arm.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, linux-efi@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>,
 xen-devel@lists.xenproject.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 intel-gfx@lists.freedesktop.org, jglisse@redhat.com,
 Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-kernel@vger.kernel.org,
 akpm@linux-foundation.org, Logan Gunthorpe <logang@deltatee.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMDIsIDIwMTkgYXQgMDQ6MTQ6NTdQTSArMDIwMCwgTWFydGluIFNjaHdpZGVm
c2t5IHdyb3RlOgo+IE9uIFRodSwgMiBNYXkgMjAxOSAwNjo0NjoyMyAtMDcwMAo+IE1hdHRoZXcg
V2lsY294IDx3aWxseUBpbmZyYWRlYWQub3JnPiB3cm90ZToKPiAKPiA+IE9uIFRodSwgTWF5IDAy
LCAyMDE5IGF0IDA2OjQ4OjQ2UE0gKzA1MzAsIEFuc2h1bWFuIEtoYW5kdWFsIHdyb3RlOgo+ID4g
PiBEcm9wIHRoZSBwZ3RhYmxlX3QgdmFyaWFibGUgZnJvbSBhbGwgaW1wbGVtZW50YXRpb24gZm9y
IHB0ZV9mbl90IGFzIG5vbmUgb2YKPiA+ID4gdGhlbSB1c2UgaXQuIGFwcGx5X3RvX3B0ZV9yYW5n
ZSgpIHNob3VsZCBzdG9wIGNvbXB1dGluZyBpdCBhcyB3ZWxsLiBTaG91bGQKPiA+ID4gaGVscCB1
cyBzYXZlIHNvbWUgY3ljbGVzLiAgCj4gPiAKPiA+IFlvdSBkaWRuJ3QgYWRkIE1hcnRpbiBTY2h3
aWRlZnNreSBmb3Igc29tZSByZWFzb24uICBIZSBpbnRyb2R1Y2VkCj4gPiBpdCBvcmlnaW5hbGx5
IGZvciBzMzkwIGZvciBzdWItcGFnZSBwYWdlIHRhYmxlcyBiYWNrIGluIDIwMDggKGNvbW1pdAo+
ID4gMmY1NjlhZmQ5YykuICBJIHRoaW5rIGhlIHNob3VsZCBjb25maXJtIHRoYXQgaGUgbm8gbG9u
Z2VyIG5lZWRzIGl0Lgo+IAo+IFdpdGggaXRzIDJLIHB0ZSB0YWJsZXMgczM5MCBjYW4gbm90IGRl
YWwgd2l0aCBhIChzdHJ1Y3QgcGFnZSAqKSBhcyBhIHJlZmVyZW5jZQo+IHRvIGEgcGFnZSB0YWJs
ZS4gQnV0IGlmIHRoZXJlIGFyZSBubyB1c2VyIG9mIHRoZSBhcHBseV90b19wYWdlX3JhbmdlKCkg
QVBJCj4gbGVmdCB3aGljaCBhY3R1YWxseSBtYWtlIHVzZSBvZiB0aGUgdG9rZW4gYXJndW1lbnQg
d2UgY2FuIHNhZmVseSBkcm9wIGl0LgoKSW50ZXJlc3RpbmdseSwgSSBkb24ndCB0aGluayB0aGVy
ZSBldmVyIHdhcyBhIHVzZXIgd2hpY2ggdXNlZCB0aGF0CmFyZ3VtZW50LiAgTG9va2luZyBhdCB5
b3VyIDJmNTYgcGF0Y2gsIHlvdSBvbmx5IGNvbnZlcnRlZCBvbmUgZnVuY3Rpb24KKHByZXN1bWFi
bHkgdGhlcmUgd2FzIG9ubHkgb25lIGNhbGxlciBvZiBhcHBseV90b19wYWdlX3JhbmdlKCkgYXQg
dGhlCnRpbWUpLCBhbmQgaXQgZGlkbid0IHUgc2UgYW55IG9mIHRoZSBhcmd1bWVudHMuICBYZW4g
d2FzIHRoZSBpbml0aWFsIHVzZXIsCmFuZCB0aGUgdHdvIG90aGVyIGZ1bmN0aW9ucyB0aGV5IGFk
ZGVkIGFsc28gZGlkbid0IHVzZSB0aGF0IGFyZ3VtZW50LgoKTG9va2luZyBhdCBhIHF1aWNrIHNh
bXBsZSBvZiB1c2VycyBhZGRlZCBzaW5jZSwgbm9uZSBvZiB0aGVtIGFwcGVhciB0bwpoYXZlIGV2
ZXIgdXNlZCB0aGF0IGFyZ3VtZW50LiAgU28gcmVtb3ZpbmcgaXQgc2VlbXMgYmVzdC4KCkFja2Vk
LWJ5OiBNYXR0aGV3IFdpbGNveCA8d2lsbHlAaW5mcmFkZWFkLm9yZz4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
