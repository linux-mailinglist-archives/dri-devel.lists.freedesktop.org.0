Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9026B5F3A2
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 09:26:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 110926E2E5;
	Thu,  4 Jul 2019 07:25:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59F936E190
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 18:13:30 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id r4so3510232qkm.13
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jul 2019 11:13:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dIkgJeJBuw++uppqsU+TnGBul+EFF40cgrIXzTaEkqk=;
 b=ewyetNR9AZ8DREW9PB3/5gQ/pwsvn3+rZmvSWLln63lVsJILEVkgRMPqSwEtm4tyJU
 WdeMWHJkKC8ocgQSSLW5UbMFKOoMMmo3Q83OaJ6jdE/BjBMmanZrpstyTxpmtue8Fii/
 U0V3lMRx1M2zzJNxq7c4u1rJULlIFvnonC/NFOQ88bq4CY8ZpVZovnpycVb+2FNtLtG8
 JJfBFDoHywJlYRHPZ1BhO2l+/B5sbmxy5mc9poaZC71S+oO4b+pgfJwKekPPys/x3VrZ
 +eeO1spGFJff3tidT7NkJBQ+jyB4AD9XILtCS18Dm30LYTQ+dCUXIOEO72yodleGMJV4
 YxJQ==
X-Gm-Message-State: APjAAAUVkA2Jo0MggGWI7stnajmRbZHCbGWCgl5LWAJSmXxt5sw1L+ua
 /n9rYKXg+HWyqHvDP4yPAkcEAA==
X-Google-Smtp-Source: APXvYqwJ/Yia/+35gou6qrRAmIkzXiI4t3koOKtXe3iAnV4Brg/bboybUghnJVCplNkmCRgecJA4HA==
X-Received: by 2002:a37:ad0:: with SMTP id 199mr2986016qkk.90.1562177609563;
 Wed, 03 Jul 2019 11:13:29 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id i17sm1533124qta.6.2019.07.03.11.13.29
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 03 Jul 2019 11:13:29 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hijl2-0000Hu-Jr; Wed, 03 Jul 2019 15:13:28 -0300
Date: Wed, 3 Jul 2019 15:13:28 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 20/22] mm: move hmm_vma_fault to nouveau
Message-ID: <20190703181328.GC18673@ziepe.ca>
References: <20190701062020.19239-21-hch@lst.de>
 <20190703180356.GB18673@ziepe.ca> <20190703180525.GA13703@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190703180525.GA13703@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 04 Jul 2019 07:25:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=dIkgJeJBuw++uppqsU+TnGBul+EFF40cgrIXzTaEkqk=;
 b=BDcvXVU5S9Xe6RaZL1d/tzhqXI0ERzROC5Hwy70kI1UbibB5XGc2qktpp6KCRj2eJ8
 Cvf/ZQdisnA3SE13u0kPAYYcxD7/vjlMJCRXFqswT6wm7B/ZH66kJW3+LI/VOPZjovQN
 evL2O/4brhczby9X6zVffdg7OkrHAb/PwnzOSEYjUiLxJrWp9rpmHGHLGRdXBfZRWW4W
 JckFR0Y+fY+7lMoaMBwbiK+8lcXoBeP3tQ697oFwWt03yHVMREfyYMjvXlRNVt9JAfjh
 vs4ZSzvO0c/ohYv6r1U/r7F4radpVLs9xgn1pHEoMnI8AYroHgpDAIAg2e2jlz8s1P1X
 DWuA==
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
 AlexDeucher <alexander.deucher@amd.com>,
 Dan Williams <dan.j.williams@intel.com>, Ira Weiny <ira.weiny@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMDg6MDU6MjVQTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMDM6MDM6NTZQTSAtMDMwMCwgSmFz
b24gR3VudGhvcnBlIHdyb3RlOgo+ID4gSSB3YXMgdGhpbmtpbmcgYWJvdXQgZG9pbmcgZXhhY3Rs
eSB0aGlzIHRvbywgYnV0IGFtZGdwdSBzdGFydGVkIHVzaW5nCj4gPiB0aGlzIGFscmVhZHkgb2Jz
b2xldGUgQVBJIGluIHRoZWlyIGxhdGVzdCBkcml2ZXIgOigKPiA+IAo+ID4gU28sIHdlIG5vdyBu
ZWVkIHRvIGdldCBib3RoIGRyaXZlcnMgdG8gbW92ZSB0byB0aGUgbW9kZXJuIEFQSS4KPiAKPiBB
Y3R1YWxseSB0aGUgQU1EIGZvbGtzIGZpeGVkIHRoaXMgdXAgYWZ0ZXIgd2UgcG9pbnRlZCBpdCBv
dXQgdG8gdGhlbSwKPiBzbyBldmVuIGluIGxpbnV4LW5leHQgaXQganVzdCBpcyBub3V2ZWF1IHRo
YXQgbmVlZHMgZml4aW5nLgoKT2gsIEkgbG9va2VkIGF0IGFuIG9sZGVyIC1uZXh0LCBteSBtaXN0
YWtlLiBMZXRzIGRvIGl0IHRoZW4uCgpKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
