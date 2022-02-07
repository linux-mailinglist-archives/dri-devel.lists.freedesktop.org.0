Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 071794AC9B0
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 20:36:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA6AB10F968;
	Mon,  7 Feb 2022 19:36:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 961B610F979
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 19:36:19 +0000 (UTC)
Received: by mail-qv1-xf30.google.com with SMTP id d8so12263491qvv.2
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Feb 2022 11:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=AZb+VjqCK8DT8gUN4DVyYxz5ldTv3hxfq1kOHV3So/k=;
 b=KntHAMqOekGnRUkUpQJ4RmJ6jMnHjUV7NyerhvsEdoAGvARGmb4G3Wj/k8wnWrJ4v5
 8kPwNbh9XAYp6cLgi4gIv627uiqcRa+LFZjBeDErIxOg8LxHgVSzpBBgB4/02CnckDoW
 j/vS99YpkyicivGZvG7tPxKD1tg9I4Ra2r60sYYIh7hopzEEGFHdBxN13YaxsF1pjtQ4
 t2UWWLHBR9zIycMbU/55yGUwhwjflg+CGCZLsD+asK60z79VcLiGPwy6B0EGe8DupEXr
 Ad4Gbvw45NbEij0sfEUWdE7DXdHVlwqV31kqZB6dVE9msUcvQULHgg4p2QKDUMuJskEz
 lXAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AZb+VjqCK8DT8gUN4DVyYxz5ldTv3hxfq1kOHV3So/k=;
 b=AnuZ8YGW8j6k1tWftHZ354S1QcGmhiFD+la82E/87CArHsjxKfaYysvy7rZq2bIJC6
 1AH4UDT+7bznsJT4nn/JWPWQd3LbwkgzS6J8mr4C3iyGe/Eylb0dlOxofndh/cx8vnIN
 4ZHQbfhcC/G9hak6R1a34AzBI+OK9Yqb4NIslCoULbZO5OshMhscH7D0XYPMOfyT35VO
 FB4u8PlBTmBKEKO57m1lTzVOgqNN4BUdU2lx11/BYfswZ0zKl7KDLmsojXqTJLsfxwVs
 tDUGAIiNf41z3l/CgUks/MsyoKSnkFwvq13L3gg7owl1YgZxvJSbnS1JF6j6OXwsP5Vm
 nFEQ==
X-Gm-Message-State: AOAM530raZQXvZkptZ5Sn2lbcIHzCSnOueU31CgA80IzWelxOp0Z9Ypq
 f32JuJuD/OsaGDEwwR+s2Mmx0w==
X-Google-Smtp-Source: ABdhPJx0Ja9WLXhMDJ89Idc/sHv1PbTV/zifEfvcLL+6K0fCDuGFFRfG8vhitXIXvhCy0TtD+Fimvw==
X-Received: by 2002:a05:6214:2aad:: with SMTP id
 js13mr896600qvb.32.1644262578716; 
 Mon, 07 Feb 2022 11:36:18 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.129])
 by smtp.gmail.com with ESMTPSA id h1sm5945976qkn.71.2022.02.07.11.36.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 11:36:18 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1nH9o9-000I7B-La; Mon, 07 Feb 2022 15:36:17 -0400
Date: Mon, 7 Feb 2022 15:36:17 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 8/8] fsdax: depend on ZONE_DEVICE || FS_DAX_LIMITED
Message-ID: <20220207193617.GH49147@ziepe.ca>
References: <20220207063249.1833066-1-hch@lst.de>
 <20220207063249.1833066-9-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220207063249.1833066-9-hch@lst.de>
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
Cc: nvdimm@lists.linux.dev, Ralph Campbell <rcampbell@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, dri-devel@lists.freedesktop.org,
 Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, linux-mm@kvack.org,
 Ben Skeggs <bskeggs@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Logan Gunthorpe <logang@deltatee.com>, Dan Williams <dan.j.williams@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 07, 2022 at 07:32:49AM +0100, Christoph Hellwig wrote:
> Add a depends on ZONE_DEVICE support or the s390-specific limited DAX
> support, as one of the two is required at runtime for fsdax code to
> actually work.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/Kconfig | 1 +
>  1 file changed, 1 insertion(+)

Makes sense, but leaves me wonder why a kconfig randomizer didn't hit
this.. Or maybe it means some of the function stubs on !ZONE_DEVICE
are unnecessary now..

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
