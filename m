Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D495F39E
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 09:26:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B8A16E2D4;
	Thu,  4 Jul 2019 07:25:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9C8E6E192
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 18:15:43 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id s22so3526467qkj.12
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jul 2019 11:15:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wryDEDMxoF6Vk+K+7duTnFgyottGCGFfZAdbutaWn2g=;
 b=o7o2aJH6d0HXfAytQdHGgzsgghCJdQh5zG+pbgACp5QU4Ehi8Z6+IWn9eKfvpnE98s
 jNHFXqVVIjU/CrQJ0ecOIUfVa9IGpIYlL0oQtFKX31qDSlR8YnNF1TtNZQ5qluXdwilE
 G5O8NqxCzFeGl+KICFdzRKQMZAybupkplkUq/JBht/VHasL4fLBe7F4jrQf3P3BMJtcQ
 oV4fEEB82oWP4RiDv5BFPTSkuhxrIBavvJc8Z+MXqT6w4ElJ4Z/DcQKE6uWuA44cZC3G
 dbPGY857D0NFl3fShLm526uPHptZRYI8ajJ6hUTL/y2qP+cn8rzfILuOB0cG09xePqoa
 ig0w==
X-Gm-Message-State: APjAAAUb9LTVd7Tvp1xu6JC2LTVIk9cGyhHhibecgdmdGRbyApWcJB0G
 +VQcJ8+zvmS/1wlXiz63yFhUzQ==
X-Google-Smtp-Source: APXvYqx+Obpp289GMjyQScpks1hosaCdzO2IJ2gOygQVUkXAuZU/IoXFFk8Hk2uU2aW+fFE5K61x4g==
X-Received: by 2002:a37:4914:: with SMTP id w20mr31403797qka.156.1562177743091; 
 Wed, 03 Jul 2019 11:15:43 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id j184sm1204269qkc.65.2019.07.03.11.15.42
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 03 Jul 2019 11:15:42 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hijnC-0000Ju-2z; Wed, 03 Jul 2019 15:15:42 -0300
Date: Wed, 3 Jul 2019 15:15:42 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 22/22] mm: remove the legacy hmm_pfn_* APIs
Message-ID: <20190703181542.GD18673@ziepe.ca>
References: <20190701062020.19239-1-hch@lst.de>
 <20190701062020.19239-23-hch@lst.de>
 <20190703180125.GA18673@ziepe.ca> <20190703180308.GA13656@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190703180308.GA13656@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 04 Jul 2019 07:25:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=wryDEDMxoF6Vk+K+7duTnFgyottGCGFfZAdbutaWn2g=;
 b=MGb4X8V0OjUmCxHXdwat5t//603Imvm3kttDyzPr4B1R8dke3zyk8pDWGq7fzjOf9T
 vhoLDzI6WCU5N4NrK/vZZAt9KDue5n72hIeNC1cz1j/ds592t4xYj0gPc7RQWN5tu3kK
 y/BZeSVV19CFNNBfNU5x0lM9OM/CH02xFeKxUrblZJMqjjhX0l4gjG924KSmb6umCVqY
 q+ZOkych1AFQ/2d82ikRe4cso3C8TVySqyZbPVlAYKLNARrOu29Nsf2uO3Rs45jVcEQb
 PCfasJR/oBWrfsPe016/1vxmUYZfy876Nti6m+RO+WQbCOzAxMa5i5a/ZdgHoU8lAwIn
 KN7g==
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
Cc: linux-nvdimm@lists.01.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, linux-pci@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, Ira Weiny <ira.weiny@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMDg6MDM6MDhQTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMDM6MDE6MjVQTSAtMDMwMCwgSmFz
b24gR3VudGhvcnBlIHdyb3RlOgo+ID4gQ2hyaXN0b3BoLCBJIGd1ZXNzIHlvdSBkaWRuJ3QgbWVh
biB0byBzZW5kIHRoaXMgYnJhbmNoIHRvIHRoZSBtYWlsaW5nCj4gPiBsaXN0Pwo+ID4gCj4gPiBJ
biBhbnkgZXZlbnQgc29tZSBvZiB0aGVzZSwgbGlrZSB0aGlzIG9uZSwgbG9vayBvYnZpb3VzIGFu
ZCBJIGNvdWxkCj4gPiBzdGlsbCBncmFiIGEgZmV3IGZvciBobW0uZ2l0Lgo+ID4gCj4gPiBMZXQg
bWUga25vdyB3aGF0IHlvdSdkIGxpa2UgcGxlYXNlCj4gPiAKPiA+IFJldmlld2VkLWJ5OiBKYXNv
biBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+Cj4gCj4gVGhhbmtzLiAgSSB3YXMgZ29pbmcg
dG8gc2VuZCB0aGlzIHNlcmllcyBvdXQgYXMgc29vbiBhcyB5b3UgaGFkCj4gYXBwbGllZCB0aGUg
cHJldmlvdXMgb25lLiAgTm93IHRoYXQgaXQgbGVha2VkIEknbSBoYXBweSB0byBjb2xsZWN0Cj4g
cmV2aWV3cy4gIEJ1dCB3aGlsZSBJJ3ZlIGdvdCB5b3VyIGF0dGVudGlvbjogIHRoZSByZG1hLmdp
dCBobW0KPiBicmFuY2ggaXMgc3RpbGwgYXQgdGhlIC1yYzcgbWVyZ2UgYW5kIGRvZW4ndCBoYXZl
IG15IHNlcmllcywgaXMgdGhhdAo+IGludGVudGlvbmFsPwoKU29ycnksIEkgcnVzaGVkIGl0IHRv
byBsYXRlIGF0IG5pZ2h0IHRvIGRvIGl0IHJpZ2h0IGFwcGFyZW50bHkuIEZpeGVkLgoKSmFzb24K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
