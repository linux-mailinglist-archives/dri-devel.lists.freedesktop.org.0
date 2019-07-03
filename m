Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A27EB5F38C
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 09:26:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C4856E29C;
	Thu,  4 Jul 2019 07:25:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E2236E184
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 18:01:27 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id s22so3486022qkj.12
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jul 2019 11:01:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=a2vka/akssy/859dgmuGdTYFT4YH52SMxVHx2PN2EUA=;
 b=rCc444pWQXeztMVDs2Z7OcxlFXvvVW+DK3NuyjcbmWbbDlXWmKIpnONq+jc3GXBAfv
 iOhEm3casDew0CqPz0WelGhcmRycM/QLhX5DPCu9/8EjWu+eccEaFP6oIPYdoYTjDq4p
 UUukwyslVrhw4P4zNzjkc50aoPwYkodxbVJnFYBQhhii989/YfTsSH5DikL/aPmX6q8c
 6IvYQ5TmBBX8EUt/TXQxFrq6pTEhSYGnnVUXI0e+/bbVm48P1feuLzngvbmz5f0oB244
 lmA1d3W+VuODftbHzjRfcFJ3pdWpzrzgJV9Hlxp7lEMOJN6qa4Zu/CvMtQkitc0XEwmX
 dL9w==
X-Gm-Message-State: APjAAAWbRqkjHRAdrWFXupgVIYzjeVlrOl5c5dLQhAlVBy/zi7QvlTWf
 h2pUYAg66il4lyFh8PGnHYX2qQ==
X-Google-Smtp-Source: APXvYqydaJsLmmJTIUtSU+kahyTjsnRgAp4YEYaGKvpkMDRvv9xpp1xwyaxLhy2xlOb2NB+ML08lUQ==
X-Received: by 2002:a37:a413:: with SMTP id n19mr30343855qke.98.1562176886317; 
 Wed, 03 Jul 2019 11:01:26 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id u19sm1310165qka.35.2019.07.03.11.01.25
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 03 Jul 2019 11:01:25 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hijZN-0006oc-AR; Wed, 03 Jul 2019 15:01:25 -0300
Date: Wed, 3 Jul 2019 15:01:25 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 22/22] mm: remove the legacy hmm_pfn_* APIs
Message-ID: <20190703180125.GA18673@ziepe.ca>
References: <20190701062020.19239-1-hch@lst.de>
 <20190701062020.19239-23-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190701062020.19239-23-hch@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 04 Jul 2019 07:25:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=a2vka/akssy/859dgmuGdTYFT4YH52SMxVHx2PN2EUA=;
 b=UR+mB33wfBhu3cMDn/7EBIfgFaGZRuvY/6J1fd9PhMgOfBQW4lCtf4aW4cWrAUOg/V
 ysDxZJU9vC+aEmT4cwhxTIl4TYXWNEvXLnwzfoSFoTPuhqs/gUxKo54FOzEU1qF6lBPO
 BDzC9RkbmXZgFl5C89Dr/DavME/J23LtilDnr6BOfCLfGcmh3h3ZqRvCwPxs52Z9/ShV
 88aK4465TTIaWrpxAOzvxt4Awc0wM1VxGtTmtNuDdYn6htswBnMWDqrfqYcoFAAtYDKN
 PK+3yzvEgZr3lVoSgy+/yjpH/TVAkGrizrHi9TWzWfIHt86MDzHjD59dYGp18SQRc4c1
 cphA==
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

T24gTW9uLCBKdWwgMDEsIDIwMTkgYXQgMDg6MjA6MjBBTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gU3dpdGNoIHRoZSBvbmUgcmVtYWluaW5nIHVzZXIgaW4gbm91dmVhdSBvdmVy
IHRvIGl0cyByZXBsYWNlbWVudCwKPiBhbmQgcmVtb3ZlIGFsbCB0aGUgd3JhcHBlcnMuCj4gCj4g
U2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gIGRyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZG1lbS5jIHwgIDIgKy0KPiAgaW5jbHVkZS9saW51eC9o
bW0uaCAgICAgICAgICAgICAgICAgICAgfCAzNiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+
ICAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzNyBkZWxldGlvbnMoLSkKCkNocmlz
dG9waCwgSSBndWVzcyB5b3UgZGlkbid0IG1lYW4gdG8gc2VuZCB0aGlzIGJyYW5jaCB0byB0aGUg
bWFpbGluZwpsaXN0PwoKSW4gYW55IGV2ZW50IHNvbWUgb2YgdGhlc2UsIGxpa2UgdGhpcyBvbmUs
IGxvb2sgb2J2aW91cyBhbmQgSSBjb3VsZApzdGlsbCBncmFiIGEgZmV3IGZvciBobW0uZ2l0LgoK
TGV0IG1lIGtub3cgd2hhdCB5b3UnZCBsaWtlIHBsZWFzZQoKUmV2aWV3ZWQtYnk6IEphc29uIEd1
bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KClRoYW5rcywKSmFzb24KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
