Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 162D838966B
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 21:18:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABF256EE5C;
	Wed, 19 May 2021 19:18:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 739716EE5C;
 Wed, 19 May 2021 19:18:20 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id 6so10147371pgk.5;
 Wed, 19 May 2021 12:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qkzCD1nWkBURpBrpJXY23W3vLoZSck6AY/wcT/olSRk=;
 b=Jr32Uvht2cSrNILgfPTD5ViC6pT8b+8Rv+juxOSQTQwrJ1CAD0MBJHubcHjyOKsUbI
 JfDjb6IlvhZ8t3+ym7sOQ4a9U6dHEsOXxzesVMPv6UDrlo59kYq82tWRbs9w2uqU+yYo
 8oA/biTXJEGtIK7ZUbiBmZQYbJzsutIezjLCjW+be0py6uPVuz9vfS/rc828YcCt+zVs
 WRnXVlWSjrk7BMwlJdqMQwTvyoJQltUeu2a7CMQB207kX6rGqLkbNNdIKCNuEPYfxlj8
 c8CbGpi6xXQEr0VSmTVe/i1v9YaB96qj2/4NW8B/lTGCTjbb7h0/a34Yz4Z5jXjVRuz+
 oRyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qkzCD1nWkBURpBrpJXY23W3vLoZSck6AY/wcT/olSRk=;
 b=Ijk0k9IsnGt0bng3qwpqQC+P1uTBnQ9ft9ec5zDUYFsm3tLjM2mZx0Ayxm0vD4m1On
 SiQT13u9yr/VTxU0JlMOYYTqvdtUmtSuKCYsgdgccuHksOkRjHD84r7i0h+Wg9RrSNaF
 7vLDc29ybAq9AX/8kJGwNlO6fnBrlnFhoC5fMvFMen16mswyJGbwcIN7PQ56UFHVg2j6
 4H0ca3O2uU2nAzWA7VDNwGAXlc3VpAB808cGfobeR5plDVeXE5uvH8nipUUF3DaqHLVp
 L9zZXFasP4IBgXbm+7BLDmu1AGAKg2J7wbRQxI8CJj+EGoYYMlvZ37tUEbapfEoGrFQo
 woLQ==
X-Gm-Message-State: AOAM532sWpoJIbKJhMKLMqAouOVHWvRz73P5NiOZDsuAvUw17ekZAVt/
 tt0ysZa0H28aHka71ZJeZUA=
X-Google-Smtp-Source: ABdhPJyun5zEd3qUDcE/GtFSWzJiED1dVWEJkkT2Lvnwoihmboc879WuDVAjjHLr8vtaHKK8YVFCpg==
X-Received: by 2002:a65:4286:: with SMTP id j6mr636207pgp.261.1621451900054;
 Wed, 19 May 2021 12:18:20 -0700 (PDT)
Received: from [10.230.29.202] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id d131sm147671pfd.176.2021.05.19.12.18.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 12:18:19 -0700 (PDT)
Subject: Re: [PATCH v7 05/15] swiotlb: Add a new get_io_tlb_mem getter
To: Claire Chang <tientzu@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 mpe@ellerman.id.au, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
References: <20210518064215.2856977-1-tientzu@chromium.org>
 <20210518064215.2856977-6-tientzu@chromium.org>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <52714d95-3562-97fc-0dee-761adfc364cb@gmail.com>
Date: Wed, 19 May 2021 12:18:13 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210518064215.2856977-6-tientzu@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
 mingo@kernel.org, jxgao@google.com, sstabellini@kernel.org,
 Saravana Kannan <saravanak@google.com>, xypron.glpk@gmx.de,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 airlied@linux.ie, Robin Murphy <robin.murphy@arm.com>,
 Nicolas Boichat <drinkcat@chromium.org>, rodrigo.vivi@intel.com,
 bhelgaas@google.com, Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, tfiga@chromium.org,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/17/2021 11:42 PM, Claire Chang wrote:
> Add a new getter, get_io_tlb_mem, to help select the io_tlb_mem struct.
> The restricted DMA pool is preferred if available.
> 
> Signed-off-by: Claire Chang <tientzu@chromium.org>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
