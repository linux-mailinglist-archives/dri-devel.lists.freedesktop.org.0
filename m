Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C24C642C3
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 09:26:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87CA889CBE;
	Wed, 10 Jul 2019 07:25:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4AA689D5F
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 19:33:22 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id r6so50303qkc.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2019 12:33:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=TqnFX/ucbxcY5k2LU8B7XgzLfUpDzAFYa9LXap9J5UU=;
 b=Apx2W1oBPR4ttK4aSMTz9J93dqzK88inBMQZvUOY/2cpnGeEgLa+nnq5t1O0CIc1yi
 ub+4BcnM1l00aQf9rg2mXXp1q2OWl938Qls4aqFoIlDAaOGgEe9LSY8QyTDyYyfQm9TI
 liMgLtdE25o0hxbOaxBOcnPHuT8wd27jzCIJdVSwA3KCuJeOVr7It9gt+Rb+5JH9dj0W
 XpkU9a+9yNWKAXaJ0Kg0tzmrqc/UlMle3ROhpcyTnZx98fSDpSP+IyXckU9mIZAFyeAP
 oY+Mcxz8HAwoG75vTOxj91E5kkjYqETUDr/WyyLlAlh7wajtVqOcThhPEHJ0oefA6hpl
 6Kng==
X-Gm-Message-State: APjAAAUtm6YVGWpydKduQ1PNFj9H7L9cDFTNo2ygm0B2crHh83WqFtNq
 3rC6q8UKAqXBoX17AHfeltC0Qw==
X-Google-Smtp-Source: APXvYqwJv1A9aQVqldMtbeBQ5nnec3iTfBKL3S6OeKUyA3kkYjNI/CON0uVEHClqFsFEEJNKMO/I9A==
X-Received: by 2002:a05:620a:1006:: with SMTP id
 z6mr2854127qkj.312.1562700801760; 
 Tue, 09 Jul 2019 12:33:21 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id 67sm9662013qkh.108.2019.07.09.12.33.21
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 09 Jul 2019 12:33:21 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hkvrc-0003nt-Rl; Tue, 09 Jul 2019 16:33:20 -0300
Date: Tue, 9 Jul 2019 16:33:20 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: hmm_range_fault related fixes and legacy API removal v2
Message-ID: <20190709193320.GD3422@ziepe.ca>
References: <20190703220214.28319-1-hch@lst.de>
 <20190705123336.GA31543@ziepe.ca> <20190709143038.GA3092@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190709143038.GA3092@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 10 Jul 2019 07:25:19 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=TqnFX/ucbxcY5k2LU8B7XgzLfUpDzAFYa9LXap9J5UU=;
 b=nJSBYwdxUv5VMP0rEUMz93pcWQ28dTbOLxoOwrWHLWCf1MSxkLTpKz2x8fxtV2+E/R
 tXsUU3isWUYxjOPUM6t0qCMv560B5H1unNR0QcR5JPw3ycBYCoKo4LDe/wsMqNEhL/zl
 ZczdjxlpNisocOP3/OhjpkUf2xKW2V9mrCM6eDI3EmS5aK4e6AbXWsFA/MaZCNHhyEnk
 w4Z42pcMYK3A/nvN2x/95LPHdAv9lAcaP70awzU4Hvnyy2CUphCP4NqDwoLxyz/O5kpd
 AcIgjMsPHoTqJr8TeoXVzKWAKEnMRS83pZDgNEkgwGuWMagj18LeXUOa06mYcaDBm5pC
 i90Q==
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMDksIDIwMTkgYXQgMDQ6MzA6MzhQTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gRnJpLCBKdWwgMDUsIDIwMTkgYXQgMDk6MzM6MzZBTSAtMDMwMCwgSmFz
b24gR3VudGhvcnBlIHdyb3RlOgo+ID4gT24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMDM6MDI6MDhQ
TSAtMDcwMCwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gPiA+IEhpIErDqXLDtG1lLCBCZW4g
YW5kIEphc29uLAo+ID4gPiAKPiA+ID4gYmVsb3cgaXMgYSBzZXJpZXMgYWdhaW5zdCB0aGUgaG1t
IHRyZWUgd2hpY2ggZml4ZXMgdXAgdGhlIG1tYXBfc2VtCj4gPiA+IGxvY2tpbmcgaW4gbm91dmVh
dSBhbmQgd2hpbGUgYXQgaXQgYWxzbyByZW1vdmVzIGxlZnRvdmVyIGxlZ2FjeSBITU0gQVBJcwo+
ID4gPiBvbmx5IHVzZWQgYnkgbm91dmVhdS4KPiA+Cj4gPiBBcyBtdWNoIGFzIEkgbGlrZSB0aGlz
IHNlcmllcywgaXQgd29uJ3QgbWFrZSBpdCB0byB0aGlzIG1lcmdlIHdpbmRvdywKPiA+IHNvcnJ5
Lgo+IAo+IE5vdGUgdGhhdCBwYXRjaCA0IGZpeGVzIGEgcHJldHR5IHNldmVyZSBsb2NraW5nIGJ1
ZywgYW5kIDEtMyBpcyBqdXN0Cj4gcHJlcGFyYXRpb24gZm9yIHRoYXQuICAKClllcywgSSBrbm93
LCBidXQgdGhhdCBjb2RlIGlzIGFsbCBtYXJrZWQgU1RBR0lORyBsYXN0IEkgc2F3LCBzbyBJCmRv
bid0IGZlZWwgYW4gdXJnZW5jeSB0byBnZXQgc2V2ZXJlIGJ1ZyBmaXhlcyBpbiBmb3IgaXQgYWZ0
ZXIgdGhlCm1lcmdlIHdpbmRvdyBvcGVucy4KCkknZCBsaWtlIHRvIGFwcGx5IGl0IHRvIGhtbS5n
aXQgd2hlbiByYzEgY29tZXMgb3V0IHdpdGggUmFscGgncyB0ZXN0CnJlc3VsdC4uCgpKYXNvbgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
