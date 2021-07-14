Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1903C7F7F
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 09:44:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 272826E176;
	Wed, 14 Jul 2021 07:44:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB27B6E141;
 Wed, 14 Jul 2021 00:06:38 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id m3so9736983qkm.10;
 Tue, 13 Jul 2021 17:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BRzBORQqhYkIvSSgRD10J8EaiYQ9ItZJaai9Sym40Us=;
 b=teI5WRKub2F/rwFPxCg0ZINCjBfRJc54nJqUFdAMXpGIMiTspU9RrcrUvARcHwoeMd
 CQXv1wJ/Fog/rhWZSvumcNrgcq+BxotT51h+tTiRDV8aZpevQuwsLDR4vyQtZSmmoC6h
 F9IEcsAuWnvI+dAhgG0Eo2jqsi01XmkKdYdzhKwGl4vTdbqsh5/P7DXsca+16o6s1nU2
 2kLICjJFyej3TGeGHMleEoqCSW2m15wa6CXhxq4NskVTucQzPb/x7tap01fpFeI4k0/I
 0oDywPh08J0yunT5JHEEyAcZVTBsHz7FszjRqikpByO6wq8hJu89C/WxnMp4EIv1s5qc
 +urw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=BRzBORQqhYkIvSSgRD10J8EaiYQ9ItZJaai9Sym40Us=;
 b=FmS314Bk2W+p9WMJMjQRzYUX91KKhjiDFp0WVGuPpzZyutkEgwmIncttjgsqG1iPZa
 qVrhdXU9UcCeOv4E3sdsD58QUziG8K1r8wm95X9yY5B4bG86kVAvX1AKiSR9DbaRy0CK
 SfSQHqH2QpcfZHZm8VzG0bXBnI69eV8lf86b4Vc5UU6j2HeeRRqhWBURYjD4qtlLdNK0
 AjFc2xSpzbdGfuBE8Qwt/qeKyXNQKsmSKPO36d40KIFB8jVrj8eTeIiNf1mLWfyuPoT9
 /+PLqj3mtREhBJUeJ5v9cPtuEe/IKQmVDvj67XbAhCbKk1UN8C1jGVlMun9RkRKa5Zdv
 u+ug==
X-Gm-Message-State: AOAM533GWgmhXxImdHwAFjsJCc1skp5yeUeu7KgYvmYNZ6pFbFlWYnrn
 A1aszRJhSaCk+Jy1Z7oBS9E=
X-Google-Smtp-Source: ABdhPJwNdfUqk7dW6v+BkJSkD78e6Hf5RHfzRN9m+TvOapNBOx9APu0hdr4kc7VyqpHBok4bqL0fFQ==
X-Received: by 2002:a05:620a:b85:: with SMTP id
 k5mr282577qkh.219.1626221197830; 
 Tue, 13 Jul 2021 17:06:37 -0700 (PDT)
Received: from fedora ([130.44.160.152])
 by smtp.gmail.com with ESMTPSA id o1sm128098qta.87.2021.07.13.17.06.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 17:06:37 -0700 (PDT)
Date: Tue, 13 Jul 2021 20:06:33 -0400
From: Konrad Rzeszutek Wilk <konrad@darnok.org>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH v15 06/12] swiotlb: Use is_swiotlb_force_bounce for
 swiotlb data bouncing
Message-ID: <YO4qifiYjL4BTMv4@fedora>
References: <YN/7xcxt/XGAKceZ@Ryzen-9-3900X.localdomain>
 <20210705190352.GA19461@willie-the-truck>
 <20210706044848.GA13640@lst.de>
 <20210706132422.GA20327@willie-the-truck>
 <a59f771f-3289-62f0-ca50-8f3675d9b166@arm.com>
 <20210706140513.GA26498@lst.de>
 <YORsr0h7u5l9DZwh@char.us.oracle.com>
 <20210706165720.GC20750@willie-the-truck>
 <YOSMDZmtfXEKerpf@char.us.oracle.com>
 <20210712135645.GA28881@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210712135645.GA28881@willie-the-truck>
X-Mailman-Approved-At: Wed, 14 Jul 2021 07:44:22 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Jim Quinlan <james.quinlan@broadcom.com>, heikki.krogerus@linux.intel.com,
 linux-devicetree <devicetree@vger.kernel.org>, peterz@infradead.org,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 grant.likely@arm.com, paulus@samba.org, Frank Rowand <frowand.list@gmail.com>,
 mingo@kernel.org, Jianxiong Gao <jxgao@google.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Saravana Kannan <saravanak@google.com>, mpe@ellerman.id.au,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, xypron.glpk@gmx.de,
 Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, matthew.auld@intel.com,
 Nicolas Boichat <drinkcat@chromium.org>, thomas.hellstrom@linux.intel.com,
 jgross@suse.com, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 intel-gfx@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, rodrigo.vivi@intel.com,
 Bjorn Helgaas <bhelgaas@google.com>, Claire Chang <tientzu@chromium.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 boris.ostrovsky@oracle.com, airlied@linux.ie, linuxppc-dev@lists.ozlabs.org,
 Randy Dunlap <rdunlap@infradead.org>, Qian Cai <quic_qiancai@quicinc.com>,
 lkml <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Greg KH <gregkh@linuxfoundation.org>, Tom Lendacky <thomas.lendacky@amd.com>,
 Robin Murphy <robin.murphy@arm.com>, bauerman@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

..snip..
> > > I think the main question I have is how would you like to see patches for
> > > 5.15? i.e. as patches on top of devel/for-linus-5.14 or something else?
> > 
> > Yes that would be perfect. If there are any dependencies on the rc1, I
> > can rebase it on top of that.
> 
> Yes, please, rebasing would be very helpful. The broader rework of
> 'io_tlb_default_mem' is going to conflict quite badly otherwise.

There is a devel/for-linus-5.15 (based on v5.14-rc1) now.

Thank you!
> 
> Cheers,
> 
> Will
