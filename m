Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CA33895FB
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 21:00:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 491D36E176;
	Wed, 19 May 2021 18:59:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27BF06E176;
 Wed, 19 May 2021 18:59:58 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id f22so2186572pfn.0;
 Wed, 19 May 2021 11:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=M073CmbM6OvFOLG+SWp0SNpXEbUxhFfHxxoda72NgXE=;
 b=Ekc2ScXY1SHvF4H29yTRhgjiTSWV6Cyne34MQrajkIT3p2pu6mu773Qlyr0kpC2NNU
 P+GJiyNV1K2vRtkjtAhIgI9VHVYmFkAxziAc3YITYD5dCFwhGNrQytvT7wWGVjrLLVt/
 Z+eGZOsPbQoTabmseviirRgNiL7jb93KoBbw+F8LkLIJVv78TKzBCCrYFTn6M7Wbv/bo
 0UQmBpP3G5FMrLaiP4lB4mvY0KeluMFddI6VD1W8D7dp8q/8Zp42g/wrvlGw3mxI6q03
 5p/katWWYvUn05FJWNltsTeqIMenps29TVH4Onz8E4y1A5fSnj1TT7Ka2b9bvOBYDjcG
 zYkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=M073CmbM6OvFOLG+SWp0SNpXEbUxhFfHxxoda72NgXE=;
 b=bzdCx59vaTi1rDScBSr2fueSsHBTwbdarqxySqMLvuV0/I1hyrnoSdmhfLZCpKR7Jq
 ccplnlIbbPfXo6F1nmkFpK42VyCTarC0GJN3Pm141cQRFQoQ9g+rAB8TPaHpljNZ39Ow
 nPUoJ1lvR3GwpVFprg0Ai8N9Q3FMeKgCqISWcbeXUGxXoHGo1SwbqO2z/yP8+nXtNlEs
 2f0nJnwiUszsosl8g7SKThu3s3k74FkyLvmfhs7SD28OLvJy/OtchnZKnn2yeQV8Ybjl
 gIQ4KXRNNm8eENaS+x8mfqn+c3ZzJPqfNcai25GLAsncWuLoACObQgn7h03myssDLl6S
 RIxg==
X-Gm-Message-State: AOAM531Gnh69q/XM2+1Rm/z6qagAHob2udoYk8WDVqt52sngufJpgS3s
 YACC+YgwgCIMoJfa4LcWyOs=
X-Google-Smtp-Source: ABdhPJyp0yRJO2tDNgGd4CfLo9HXihdjW7DvkJwzlUWA3fY93WK5PBHIJbH2WL1TmMBXCaStbeZwNQ==
X-Received: by 2002:a65:48c2:: with SMTP id o2mr575344pgs.376.1621450797716;
 Wed, 19 May 2021 11:59:57 -0700 (PDT)
Received: from [10.230.29.202] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id 63sm140020pfz.26.2021.05.19.11.59.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 11:59:57 -0700 (PDT)
Subject: Re: [PATCH v7 11/15] dma-direct: Add a new wrapper
 __dma_direct_free_pages()
To: Claire Chang <tientzu@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 mpe@ellerman.id.au, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
References: <20210518064215.2856977-1-tientzu@chromium.org>
 <20210518064215.2856977-12-tientzu@chromium.org>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <8c274da9-db90-cb42-c9b2-815ee0c6fca3@gmail.com>
Date: Wed, 19 May 2021 11:59:50 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210518064215.2856977-12-tientzu@chromium.org>
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
> Add a new wrapper __dma_direct_free_pages() that will be useful later
> for swiotlb_free().
> 
> Signed-off-by: Claire Chang <tientzu@chromium.org>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
