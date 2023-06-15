Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AEC732059
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 21:33:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1162910E19A;
	Thu, 15 Jun 2023 19:33:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1175310E19A
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 19:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686857601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qJ9fh5TisbZKUaORbgtmA89u4YsXzvNQtjxXBV2tisQ=;
 b=bbOTzQHFQZUnxusf+53lpPIqMQZ9jTA74BfRDp4i3/TPU7IZpw38lTM5xhKvO9CemgA7af
 Fno5aoSmPvABJ/c2mCThaVnf2+JLjZutzRSwQW7foRGwzsHpBH9ow+gponsXDn5oHVS1xt
 /PF/ttD3++kbggxBidCZgACBtm7EZHQ=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-DZme8ElHO6OVOjhIR0moyg-1; Thu, 15 Jun 2023 15:33:20 -0400
X-MC-Unique: DZme8ElHO6OVOjhIR0moyg-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-62ffa1214edso104106d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 12:33:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686857596; x=1689449596;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qJ9fh5TisbZKUaORbgtmA89u4YsXzvNQtjxXBV2tisQ=;
 b=HHvTtAfc0udqInYiTiVobf6qpWux4OeZR+C3ZlA6dukBzkCpi6dt0kOUhlQYUCzZit
 zO/B72ydSPDbwIhc8dXrbmko32CQkV0+1K9U8LqwiOzbRj4pPTyvzd4XV4Zv6QLi0kjA
 2wdd2xibzFCp6K/0MEYhQ88c+edWyvMBWYuhjmn7G0Hq/YYSD3khauwUYNf2tZImPyU0
 DDa0Qb7YIp2OTMjfn1V1/BJUPDSr/Tm6ddmUAC8Q4FKG5JSeow7coWrYTPzOk0WMQWov
 X945C2cqel6BM9HLUajHwmlf+cwB7o/7JJ4A6y+aOjHEElxis1DAJsXPEQH0jbdgVr5V
 Zkfg==
X-Gm-Message-State: AC+VfDx8hjY7wWW4kKNMvwJar7zdR9ntlAueOkhd0oMzlWcK8D4mLLxD
 IuduW94/78sA6W/oGY7p3X1l7FdCDfF5vhze7DyEuLUL9ZI7nrxPWv8BlY68YhvEZPHrsfq2/KJ
 D6WPoeTz0QM3Cw/+hiit5H9gvFSCc
X-Received: by 2002:ad4:5bca:0:b0:5ed:c96e:ca4a with SMTP id
 t10-20020ad45bca000000b005edc96eca4amr22503027qvt.1.1686857595819; 
 Thu, 15 Jun 2023 12:33:15 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5M13ke+gvL3VoDObxmyNhDkjVrjDagXp/R2MhL92zTstn0T61v6zTXVFTefmODf0p29xAboA==
X-Received: by 2002:ad4:5bca:0:b0:5ed:c96e:ca4a with SMTP id
 t10-20020ad45bca000000b005edc96eca4amr22503000qvt.1.1686857595549; 
 Thu, 15 Jun 2023 12:33:15 -0700 (PDT)
Received: from x1n (cpe5c7695f3aee0-cm5c7695f3aede.cpe.net.cable.rogers.com.
 [99.254.144.39]) by smtp.gmail.com with ESMTPSA id
 c20-20020a0cca14000000b0062ff47845fcsm719203qvk.48.2023.06.15.12.33.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 12:33:14 -0700 (PDT)
Date: Thu, 15 Jun 2023 15:33:12 -0400
From: Peter Xu <peterx@redhat.com>
To: Alex Sierra <alex.sierra@amd.com>
Subject: Re: [PATCH v9 02/14] mm: move page zone helpers from mm.h to mmzone.h
Message-ID: <ZItneGX+sqg7WApF@x1n>
References: <20220715150521.18165-1-alex.sierra@amd.com>
 <20220715150521.18165-3-alex.sierra@amd.com>
MIME-Version: 1.0
In-Reply-To: <20220715150521.18165-3-alex.sierra@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: rcampbell@nvidia.com, willy@infradead.org, david@redhat.com,
 Felix.Kuehling@amd.com, apopple@nvidia.com, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, jgg@nvidia.com, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello, all,

On Fri, Jul 15, 2022 at 10:05:09AM -0500, Alex Sierra wrote:
> +static inline enum zone_type page_zonenum(const struct page *page)
> +{
> +	ASSERT_EXCLUSIVE_BITS(page->flags, ZONES_MASK << ZONES_PGSHIFT);
> +	return (page->flags >> ZONES_PGSHIFT) & ZONES_MASK;
> +}

Sorry to hijack this patch - not directly relevant to the movement, but
relevant to this helper, so maybe I can leverage the cc list..

My question is whether page_zonenum() is ready for taking all kinds of tail
pages?

Zone device tail pages all look fine, per memmap_init_zone_device().  The
question was other kinds of usual compound pages, like either thp or
hugetlb.  IIUC page->flags can be uninitialized for those tail pages.

Asking because I noticed it seems possible that page_zonenum() can just
take any random tail page as input, e.g.:

try_grab_folio -> is_pci_p2pdma_page -> is_zone_device_page -> page_zonenum

I'm worried it'll just read fake things, but maybe I just missed something?

Thanks,

-- 
Peter Xu

