Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECAB5F386
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 09:26:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 430226E282;
	Thu,  4 Jul 2019 07:25:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A55336E186
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 18:03:58 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id 201so1398651qkm.9
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jul 2019 11:03:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=lYX4hArZqbN+eTGDydHx247smNMZP20ckzpDZYDyj70=;
 b=YCdCqwrA++La0qamHnvH1Cy8+2stRD+rcUmEIw5sTL5Fj28obFPYitqngpM2Gs+bXc
 l3h6hn0gRqIeE1wAJhCfH2kKlkMnyaRkHNikXQJaiuuLf1/xV2yTxX8cfkQyHP8h8Yz+
 3Vlj9GcOhz7wgKyhmygQVdVut29Ot/hYCyAmZuxcKKymj2mikY9ytKnVODHlRzmRNSl9
 zvmeE8YQ5zdjwdtcCPmWZM/8Px6Xt3w3DQTFucq3/3S/AP2v/azwniaoqA/BYVQT5U4Y
 EFCVmJ0nuLPjnu/6Ku2LHsDHKdwjTh6E7LotbTWPBGszNwSMwjAOOshpBL3fvVrZS4K7
 kaKw==
X-Gm-Message-State: APjAAAW0jairlYIs4MbOdkJq1YKWQDnTZJ/kc+mNNn9Xfe5SygZjoId/
 oHm7e5eYnifo3gMFlh32SNALlg==
X-Google-Smtp-Source: APXvYqwAIbwqmaDg6afMKDuszd1tCKqefer9BuJ/SUVOZEN2k8Xz9Vx5WhWvm0C4hIeiM5DGRjiLAw==
X-Received: by 2002:a37:a10b:: with SMTP id k11mr29660901qke.76.1562177037895; 
 Wed, 03 Jul 2019 11:03:57 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id f132sm1237440qke.88.2019.07.03.11.03.57
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 03 Jul 2019 11:03:57 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hijbp-0006qR-01; Wed, 03 Jul 2019 15:03:57 -0300
Date: Wed, 3 Jul 2019 15:03:56 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>, AlexDeucher <alexander.deucher@amd.com>
Subject: Re: [PATCH 20/22] mm: move hmm_vma_fault to nouveau
Message-ID: <20190703180356.GB18673@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190701062020.19239-21-hch@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 04 Jul 2019 07:25:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=lYX4hArZqbN+eTGDydHx247smNMZP20ckzpDZYDyj70=;
 b=GdaPl4pS25oGRqKqhYVZvbGMctmnAHGdnVDY5M9r5E2gXod6kvV8ztPBkFUZyGMM4s
 clYw/MlR3HpP4fUWkXGOqUyErs3qjITlzLbXXg12O9Tm+nYZZaTCWOpGAzeQajKuGTZU
 0wZmmTjqvm2YnyiIapY0xjU8UbEcBknZzuv1w7IATnd4Sq1IJThXnD3h4aGhqzdo2ww1
 6dYcSuMv9naAdmn53AoZUwIOgY2ixkhgWUgG5M3h3qNUG7OVco2Jf970+GkH9fxchzv1
 Bwym1bXm36Zd5IvXjxpJKkA7FdRhwbFO3vyAQP2p0NEj/n2Yq8GEnqIn5HF5aibZNjgw
 i3Ng==
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

T24gTW9uLCBKdWwgMDEsIDIwMTkgYXQgMDg6MjA6MThBTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gaG1tX3ZtYV9mYXVsdCBpcyBtYXJrZWQgYXMgYSBsZWdhY3kgQVBJIHRvIGdl
dCByaWQgb2YsIGJ1dCBxdWl0ZSBzdWl0ZXMKPiB0aGUgY3VycmVudCBub3V2ZWEgZmxvdy4gIE1v
dmUgaXQgdG8gdGhlIG9ubHkgdXNlciBpbiBwcmVwYXJhdGlvbiBmb3IKPiBmaXhpbmcgYSBsb2Nr
aW5nIGJ1ZyBpbnZvbHZpbmcgY2FsbGVyIGFuZCBjYWxsZWUuCj4gCj4gU2lnbmVkLW9mZi1ieTog
Q2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L25vdXZlYXVfc3ZtLmMgfCA1NCArKysrKysrKysrKysrKysrKysrKysrKysrKy0KPiAgaW5jbHVk
ZS9saW51eC9obW0uaCAgICAgICAgICAgICAgICAgICB8IDU0IC0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDUzIGluc2VydGlvbnMoKyksIDU1IGRlbGV0aW9u
cygtKQoKSSB3YXMgdGhpbmtpbmcgYWJvdXQgZG9pbmcgZXhhY3RseSB0aGlzIHRvbywgYnV0IGFt
ZGdwdSBzdGFydGVkIHVzaW5nCnRoaXMgYWxyZWFkeSBvYnNvbGV0ZSBBUEkgaW4gdGhlaXIgbGF0
ZXN0IGRyaXZlciA6KAoKU28sIHdlIG5vdyBuZWVkIHRvIGdldCBib3RoIGRyaXZlcnMgdG8gbW92
ZSB0byB0aGUgbW9kZXJuIEFQSS4KCkphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
