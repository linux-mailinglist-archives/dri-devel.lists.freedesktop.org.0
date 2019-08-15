Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E99E38E6FD
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:38:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D17A76E902;
	Thu, 15 Aug 2019 08:38:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57B616E87E
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 00:13:21 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id r6so660613qkc.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 17:13:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qzhD8inHCWGPsSExfxoS4FMI+7+fcQwlxaBDgT12qb4=;
 b=taHJWNmw4AZbvC+B3vo1D+MaBq3O+HZiiVsLyBYGQSjLvgHOUDpCFHys06V5049M30
 UIcT9wlMuCT6He5z7f2kLrCVDqJWD860KAv4SeTXaEfGBFNUZI3vXpug9nenEcUdtDj0
 7Fm6uHdBiv7CaGQe8PJyV+iMvB+tStX4x2it+HSCFPPjhwLTF7c0P3ksrgM1lBDfUOVb
 VgGeXiqouYiOpbo+PfF1EKiGJfNfzjRzrZjJ4Z4/1Aw4J7bMh9k5UsmB49uhyVdMesD+
 4HQFknw1Rq2gAlFmWNyygKJxWE8Q8ZUGljxpQR2hXSWm8EhGBfhhEhhdTgmIJGuLx05K
 qlTw==
X-Gm-Message-State: APjAAAVnEiG7ian1BS9xIpNMgZhlv1D0jNEhGp8k3ylhd9rpWbjMSiUr
 ZhmOVgGHO0F74hnBMXNCyrm6/g==
X-Google-Smtp-Source: APXvYqxctXlgOtCTuI+nHfly9zVzKydMCFWuaFknzokpvDUX3JdzMaNu+TsBvuyQsnsSgXcVbMLc+w==
X-Received: by 2002:a05:620a:130d:: with SMTP id
 o13mr1851841qkj.285.1565828000618; 
 Wed, 14 Aug 2019 17:13:20 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id i5sm756517qti.0.2019.08.14.17.13.20
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 14 Aug 2019 17:13:20 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hy3OJ-0003bl-SN; Wed, 14 Aug 2019 21:13:19 -0300
Date: Wed, 14 Aug 2019 21:13:19 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH v3 hmm 03/11] mm/mmu_notifiers: add a get/put scheme for
 the registration
Message-ID: <20190815001319.GF11200@ziepe.ca>
References: <20190806231548.25242-1-jgg@ziepe.ca>
 <20190806231548.25242-4-jgg@ziepe.ca>
 <0a23adb8-b827-cd90-503e-bfa84166c67e@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0a23adb8-b827-cd90-503e-bfa84166c67e@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=qzhD8inHCWGPsSExfxoS4FMI+7+fcQwlxaBDgT12qb4=;
 b=kQ7rO4RrHFSZ6MZuuxxoF8VbnBnjRycJLb07elyvEnUiIa4wJgsVinEba3cE2MqTB9
 fJulQuWx6Y5tYTxlddWTc11PBfISadqD+ExfUHnpoPQON92Ku+S5Y/WG1rnAqUDmFm/t
 sZdh11B/5WH1wkWaQw580ROrmY5paRB/mKD6yO6YRdOAjXFOKeMa/lNRNHsDHR11a2YM
 fH5CrO9kz+3OETBgm2cIOfKwCC5iyZs6YtbJwN/rErrCwql6u7WwlNfS1W19r/IYCdLa
 OB/xGbNt8+DZYg3Zcz43LE9VgkFuylrF77Y+9lVNSAp5BzomHMMBV2AknnHcgTQXagXw
 j3Dg==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, Dimitri Sivanich <sivanich@sgi.com>,
 Gavin Shan <shangw@linux.vnet.ibm.com>, Andrea Righi <andrea@betterlinux.com>,
 linux-rdma@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 iommu@lists.linux-foundation.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, intel-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgMDI6MjA6MzFQTSAtMDcwMCwgUmFscGggQ2FtcGJlbGwg
d3JvdGU6Cj4gCj4gT24gOC82LzE5IDQ6MTUgUE0sIEphc29uIEd1bnRob3JwZSB3cm90ZToKPiA+
IEZyb206IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KPiA+IAo+ID4gTWFueSBw
bGFjZXMgaW4gdGhlIGtlcm5lbCBoYXZlIGEgZmxvdyB3aGVyZSB1c2Vyc3BhY2Ugd2lsbCBjcmVh
dGUgc29tZQo+ID4gb2JqZWN0IGFuZCB0aGF0IG9iamVjdCB3aWxsIG5lZWQgdG8gY29ubmVjdCB0
byB0aGUgc3Vic3lzdGVtJ3MKPiA+IG1tdV9ub3RpZmllciBzdWJzY3JpcHRpb24gZm9yIHRoZSBk
dXJhdGlvbiBvZiBpdHMgbGlmZXRpbWUuCj4gPiAKPiA+IEluIHRoaXMgY2FzZSB0aGUgc3Vic3lz
dGVtIGlzIHVzdWFsbHkgdHJhY2tpbmcgbXVsdGlwbGUgbW1fc3RydWN0cyBhbmQgaXQKPiA+IGlz
IGRpZmZpY3VsdCB0byBrZWVwIHRyYWNrIG9mIHdoYXQgc3RydWN0IG1tdV9ub3RpZmllcidzIGhh
dmUgYmVlbgo+ID4gYWxsb2NhdGVkIGZvciB3aGF0IG1tJ3MuCj4gPiAKPiA+IFNpbmNlIHRoaXMg
aGFzIGJlZW4gb3BlbiBjb2RlZCBpbiBhIHZhcmlldHkgb2YgZXhjaXRpbmcgd2F5cywgcHJvdmlk
ZSBjb3JlCj4gPiBmdW5jdGlvbmFsaXR5IHRvIGRvIHRoaXMgc2FmZWx5Lgo+ID4gCj4gPiBUaGlz
IGFwcHJvYWNoIHVzZXMgdGhlIHN0cmN0IG1tdV9ub3RpZmllcl9vcHMgKiBhcyBhIGtleSB0byBk
ZXRlcm1pbmUgaWYKPiAKPiBzL3N0cmN0L3N0cnVjdAoKWWVzLCB0aGFua3MgZm9yIGFsbCBvZiB0
aGlzLCBJIGxpa2UgaGF2aW5nIGNvbW1lbnRzLCBidXQgSSdtIGEKdGVycmlibGUgcHJvb2ZyZWFk
ZXIgOigKCkphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
