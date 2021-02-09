Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD4831506C
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 14:39:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A35036EB2B;
	Tue,  9 Feb 2021 13:39:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2486E6EB2B
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 13:39:35 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id q85so5581182qke.8
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Feb 2021 05:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=q4gBt83LBvEvfgqjMk5XxBqoQUgJu0Updm2eupI2oTY=;
 b=aQhoXa9jPalDWlVkfGxPk+c+I0Q9JZFKo47tCsmclHZEsPNYfreM817gCFAr4kOU8W
 fHBrAIQilQhVmk1iG9w5EWskZgjnukqG4cUDzLNZ6BylHXqnGvwuThK4UN4InIuRH/ze
 cvAS/4B/aBNt8AOe4VR/tiAtWA123wCajp47c9XzIXZFa0/I9e6/nmkjO6l7O80x9iCT
 kP9CrF06fB0beIFQO/9dbuqk7hvLl+4qLhMBYJj+SEwVoqE/HfXTlsjgBKUF7reYwTlf
 Ov9fDvgK+9WKyztUGrdI96zt7nHKT/h6nbpz8LPo9nETq4dWfycOqz7C26v5rJTgWElw
 YGyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=q4gBt83LBvEvfgqjMk5XxBqoQUgJu0Updm2eupI2oTY=;
 b=AQCM3sdPcDjvCq8ozTCJso+YipbjzcfTASHFt5MKFoKQ5uz0RtjIYhILhKkHEv2vjm
 vEozAHk6mpPnO73XclwBj08cRRXLbr2B0+0LiispdoDpKGMWvq2qUWbcEjAdsPQOyM9U
 gv5TLd+pt79m397x/zipMHTCxFziUU6VUoQW6VBlu1C66Tkmv3l71j/8EhPgniMnMSnz
 E56s1EvJQfjqw4Q4EmPk52CSwkTaSrXJ32uPcWQ2167sKV2AIX5qX4r35oBorpaGsqhj
 K2LCV3V740/OBT0P9qtxO9mrEqHLmGekI7aGauUF3UFCx+sSpQjCFuiLIgp5jsqSmuM8
 ueGw==
X-Gm-Message-State: AOAM5316/7fLBRv9rOwp5Jhw1UsexSzJfv4Ib0YnQdjgHUtf7HlqMex+
 3QRMz/aXOSuI675gePyy4p+Ypg==
X-Google-Smtp-Source: ABdhPJzETc8qT6BXd1BDQmX3B26rXpyj1TrCOmYb4Fqo0JHFF6LTk7HRkfK/22tofKGhVc50wAK02g==
X-Received: by 2002:a37:5a45:: with SMTP id o66mr21362019qkb.446.1612877974387; 
 Tue, 09 Feb 2021 05:39:34 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.115.133])
 by smtp.gmail.com with ESMTPSA id m21sm17197217qtq.52.2021.02.09.05.39.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 05:39:33 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1l9TEq-005RKt-Q3; Tue, 09 Feb 2021 09:39:32 -0400
Date: Tue, 9 Feb 2021 09:39:32 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH 1/9] mm/migrate.c: Always allow device private pages to
 migrate
Message-ID: <20210209133932.GD4718@ziepe.ca>
References: <20210209010722.13839-1-apopple@nvidia.com>
 <20210209010722.13839-2-apopple@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210209010722.13839-2-apopple@nvidia.com>
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
Cc: rcampbell@nvidia.com, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org, linux-mm@kvack.org,
 jglisse@redhat.com, bskeggs@redhat.com, jhubbard@nvidia.com,
 akpm@linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 09, 2021 at 12:07:14PM +1100, Alistair Popple wrote:
> Device private pages are used to represent device memory that is not
> directly accessible from the CPU. Extra references to a device private
> page are only used to ensure the struct page itself remains valid whilst
> waiting for migration entries. Therefore extra references should not
> prevent device private page migration as this can lead to failures to
> migrate pages back to the CPU which are fatal to the user process.

This should identify the extra references in expected_count, just
disabling this protection seems unsafe, ZONE_DEVICE is not so special
that the refcount means nothing

Is this a side effect of the extra refcounts that Ralph was trying to
get rid of? I'd rather see that work finished :)

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
