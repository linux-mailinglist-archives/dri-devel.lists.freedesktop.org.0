Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A5C3A804F
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 15:36:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 213CB6E062;
	Tue, 15 Jun 2021 13:36:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B08B96E062
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 13:36:15 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id h5so6744970iok.5
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 06:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UDZeAXhtUGNxVigPWnCAmqvhZ5xmOZkpwoxu/kotpBc=;
 b=BkGuougKdpvJFSjPDCYcuDM+EfC9+Z6Iw8t63OKFUyvGcy9WEOaTZOyzUjDtlqxxWx
 b+f6+GiSSKCn4V8zlclen8CemZkaZyLB8FJKB0g3go6na2Mkb6J76IEsPQg2PB5YFP++
 oJX8/uFYscqhRRWgaBEXbZGZq7TD88YFqCsf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UDZeAXhtUGNxVigPWnCAmqvhZ5xmOZkpwoxu/kotpBc=;
 b=O9Sp/aHbJcw3xjVylz5ccaAZOgqz/3pjHukJGLi/SxLuDxXnXlU7NcqFCOYxPLyuf2
 1t6CBrTrSzFUrVwfRBiTfFxU10LH4txiT/oi/SDWSE7VumDDnJ03QQvySkGMR49JLZXy
 1bFJy5alZqwsJoUKxJDKAp7ewboodkyDCyPz8zTBAbTmymxgdRvpIUhFqfhkahw2wgL/
 MIAe8mldh32B6fz583whlR/6V6+8BM0YNR3KYccOZ1FRxO3NyhUa/nw9B4QorL2LE05j
 ChTkmI2r1wotIILEF4aaufA/o9UDviMmMK0M6gNIJT7uspjehfhxt0SFZXC+rB7UdreB
 d3Rg==
X-Gm-Message-State: AOAM532OnqmVxvAYukNGGARMEt38AtoCkNrEUr6slc4r/rXDZ+qKPrg3
 HICV/uRIar9Gnr+vcC/uLFev1CrblqV1Gg==
X-Google-Smtp-Source: ABdhPJyF0MggXjSFzWgcpIckOSagZEFZ6YStSgc1ZevGR9Yy8eu3TQyMgRdYnmZ/3kEWp7GMw9JXYA==
X-Received: by 2002:a05:6602:146:: with SMTP id
 v6mr17926259iot.117.1623764174480; 
 Tue, 15 Jun 2021 06:36:14 -0700 (PDT)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com.
 [209.85.166.170])
 by smtp.gmail.com with ESMTPSA id y8sm9264285ilg.27.2021.06.15.06.36.13
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 06:36:14 -0700 (PDT)
Received: by mail-il1-f170.google.com with SMTP id d1so15263855ils.5
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 06:36:13 -0700 (PDT)
X-Received: by 2002:a05:6e02:219d:: with SMTP id
 j29mr17936278ila.64.1623763835517; 
 Tue, 15 Jun 2021 06:30:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210611152659.2142983-1-tientzu@chromium.org>
In-Reply-To: <20210611152659.2142983-1-tientzu@chromium.org>
From: Claire Chang <tientzu@chromium.org>
Date: Tue, 15 Jun 2021 21:30:24 +0800
X-Gmail-Original-Message-ID: <CALiNf28fb4rZ0Afun8wAWRYJY4gqc+-vRvDBZT3x2JgSPL_iVQ@mail.gmail.com>
Message-ID: <CALiNf28fb4rZ0Afun8wAWRYJY4gqc+-vRvDBZT3x2JgSPL_iVQ@mail.gmail.com>
Subject: Re: [PATCH v9 00/14] Restricted DMA
To: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au,
 Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, 
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: heikki.krogerus@linux.intel.com, thomas.hellstrom@linux.intel.com,
 peterz@infradead.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, grant.likely@arm.com, paulus@samba.org,
 mingo@kernel.org, Jianxiong Gao <jxgao@google.com>, sstabellini@kernel.org,
 Saravana Kannan <saravanak@google.com>, xypron.glpk@gmx.de,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 airlied@linux.ie, Robin Murphy <robin.murphy@arm.com>,
 Nicolas Boichat <drinkcat@chromium.org>, rodrigo.vivi@intel.com,
 Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, Tomasz Figa <tfiga@chromium.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v10 here: https://lore.kernel.org/patchwork/cover/1446882/
