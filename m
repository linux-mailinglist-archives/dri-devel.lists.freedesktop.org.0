Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9220F8E6E2
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:37:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7FBB6E950;
	Thu, 15 Aug 2019 08:35:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3625F6E588
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 16:07:48 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id q4so13514784qtp.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 09:07:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=uSze5gwW1/nHV7sdPnwR3jTf0rLBBMNUn/+CnX7OfxQ=;
 b=s7OOEKMO3gS3vqflumVjdZaxP7vWcBFO/vW9DRfhE0Tqtbvq8lKNSmsPMaSMPpMn8e
 XxpPWiWiIiBHZr/h8cxIkQQEWrdGiepoC/goMJInKarkiWOhZ+8ibQF+TYLW/b0JW0WT
 Dzaur9gRz4vRCRc2QoWYFt1mqyIgYyWxSB0ERGihfWKiZe1H/SAQd4WM3OW7usDkapSR
 PkSmNJqdNom1M+JF3yzJYN3Me/gClIQr4aAVC/8M11u+eAucZL9aAOLdNH8/PPctSvyI
 MAYM+GRGfRfViaie8ZdPer/bavLjq70zI/Rps9xQi/31eAdyCI9GgWVjEXlILsHmsh2Z
 6tpg==
X-Gm-Message-State: APjAAAVoejInfJm/QimQWmMDEXILDIyH8HfiYQsp15aYZuIrSuIXHVeu
 QMVVAbrR+gay41rs4jXwGjIvOA==
X-Google-Smtp-Source: APXvYqyb9m87zjH3q35GhpgQm6CNCVSjTDXOgvHlJfjkQScATNdsG/TvzCk00mXmdZUVCVz5HTGwYA==
X-Received: by 2002:a0c:af33:: with SMTP id i48mr323000qvc.185.1565798867959; 
 Wed, 14 Aug 2019 09:07:47 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id h26sm52286qta.58.2019.08.14.09.07.47
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 14 Aug 2019 09:07:47 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hxvoR-0001J4-0D; Wed, 14 Aug 2019 13:07:47 -0300
Date: Wed, 14 Aug 2019 13:07:46 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: linux-mm@kvack.org
Subject: Re: [PATCH v3 hmm 08/11] drm/radeon: use mmu_notifier_get/put for
 struct radeon_mn
Message-ID: <20190814160746.GA4926@ziepe.ca>
References: <20190806231548.25242-1-jgg@ziepe.ca>
 <20190806231548.25242-9-jgg@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190806231548.25242-9-jgg@ziepe.ca>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=uSze5gwW1/nHV7sdPnwR3jTf0rLBBMNUn/+CnX7OfxQ=;
 b=m4NbZWWvLvFaknX0xdkPpgAtWEaAV8BPlNsV0QPnc6RgrYDmgG7AIsCG9ZHupO1OhY
 MK5GQaw5bosgo81D9cY6GHmq179L4OqwHK3M6QUinKEJeDqx/XxsudgIdbj6JCJJ8Mx4
 OEfKzvMu4bctJ4ELd7APkdehLFO1/45kAPB31gtLMFMBegBd1BaTmuRtXRxfaqmbb9j/
 7gcKiA8oYZgHtUpbyJxdB8Pj0Jf2ZLMQcL7IdGdjMoAq6vEQba2nasxNHi3QIdWTLTQH
 d/4ioF5GVIgVwgwhmehLPTTzbIryOo6apF1QStiPEI+ww2ZIZ0Kt7coH71+5OeY3wmmM
 wQUA==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>, Dimitri Sivanich <sivanich@sgi.com>,
 linux-rdma@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 iommu@lists.linux-foundation.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, intel-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMDYsIDIwMTkgYXQgMDg6MTU6NDVQTSAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IEZyb206IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KPiAKPiBy
YWRlb24gaXMgdXNpbmcgYSBkZXZpY2UgZ2xvYmFsIGhhc2ggdGFibGUgdG8gdHJhY2sgd2hhdCBt
bXVfbm90aWZpZXJzCj4gaGF2ZSBiZWVuIHJlZ2lzdGVyZWQgb24gc3RydWN0IG1tLiBUaGlzIGlz
IGJldHRlciBzZXJ2ZWQgd2l0aCB0aGUgbmV3Cj4gZ2V0L3B1dCBzY2hlbWUgaW5zdGVhZC4KPiAK
PiByYWRlb24gaGFzIGEgYnVnIHdoZXJlIGl0IHdhcyBub3QgYmxvY2tpbmcgbm90aWZpZXIgcmVs
ZWFzZSgpIHVudGlsIGFsbAo+IHRoZSBCTydzIGhhZCBiZWVuIGludmFsaWRhdGVkLiBUaGlzIGNv
dWxkIHJlc3VsdCBpbiBhIHVzZSBhZnRlciBmcmVlIG9mCj4gcGFnZXMgdGhlIEJPcy4gVGhpcyBp
cyB0aWVkIGludG8gYSBzZWNvbmQgYnVnIHdoZXJlIHJhZGVvbiBsZWZ0IHRoZQo+IG5vdGlmaWVy
cyBydW5uaW5nIGVuZGxlc3NseSBldmVuIG9uY2UgdGhlIGludGVydmFsIHRyZWUgYmVjYW1lCj4g
ZW1wdHkuIFRoaXMgY291bGQgcmVzdWx0IGluIGEgdXNlIGFmdGVyIGZyZWUgd2l0aCBtb2R1bGUg
dW5sb2FkLgo+IAo+IEJvdGggYXJlIGZpeGVkIGJ5IGNoYW5naW5nIHRoZSBsaWZldGltZSBtb2Rl
bCwgdGhlIEJPcyBleGlzdCBpbiB0aGUKPiBpbnRlcnZhbCB0cmVlIHdpdGggdGhlaXIgbmF0dXJh
bCBsaWZldGltZXMgaW5kZXBlbmRlbnQgb2YgdGhlIG1tX3N0cnVjdAo+IGxpZmV0aW1lIHVzaW5n
IHRoZSBnZXQvcHV0IHNjaGVtZS4gVGhlIHJlbGVhc2UgcnVucyBzeW5jaHJvbm91c2x5IGFuZCBq
dXN0Cj4gZG9lcyBpbnZhbGlkYXRlX3N0YXJ0IGFjcm9zcyB0aGUgZW50aXJlIGludGVydmFsIHRy
ZWUgdG8gY3JlYXRlIHRoZQo+IHJlcXVpcmVkIERNQSBmZW5jZS4KPiAKPiBBZGRpdGlvbnMgdG8g
dGhlIGludGVydmFsIHRyZWUgYWZ0ZXIgcmVsZWFzZSBhcmUgYWxyZWFkeSBpbXBvc3NpYmxlIGFz
Cj4gb25seSBjdXJyZW50LT5tbSBpcyB1c2VkIGR1cmluZyB0aGUgYWRkLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KPiAgZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9yYWRlb24uaCAgICAgICAgfCAgIDMgLQo+ICBkcml2ZXJzL2dwdS9kcm0vcmFk
ZW9uL3JhZGVvbl9kZXZpY2UuYyB8ICAgMiAtCj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFk
ZW9uX2Rydi5jICAgIHwgICAyICsKPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fbW4u
YyAgICAgfCAxNTcgKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICA0IGZpbGVzIGNoYW5nZWQs
IDM4IGluc2VydGlvbnMoKyksIDEyNiBkZWxldGlvbnMoLSkKCkFNRCB0ZWFtOiBBcmUgeW91IE9L
IHdpdGggdGhpcyBwYXRjaD8KCkphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
