Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F8638951A
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 20:11:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A02D6EE4D;
	Wed, 19 May 2021 18:11:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DA446EDA0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 18:11:41 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id q10so13649128qkc.5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 11:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=or1ZgkIQlqYFYsbWx3HhSVHrt7I2XsoIRsMCoyF7atA=;
 b=I/E/dqxF8ccpwh/ck606guAAMWoUat0ewjyFBZ9qGkhCu+vdKW45Md3waidHfBOcnl
 Eqf1Yqt6PeBfuumUioxkOduMozTmgdMFtcGyfioxsOPJPRJNLQ4jnjVT2qXlY+aMTE6E
 n7D/gwnI3FA/CndzpSeeQcEVAbeVLZcdSje0mF9X8XYry5kvfJA08rwWvgD4wPSJXSxT
 OsS/Aayfy63b6fpecJGRSsY77jP3vVkN8R6CGJWR1dZB/hRSXxQjJgultC8aiJBdp/z3
 sgzp5mgSXuEbYvHkj9t8yxM9KWR7IESTnh3nA7XZ90l/rulprpDCqqE41qNPvP+D22Cv
 UXhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=or1ZgkIQlqYFYsbWx3HhSVHrt7I2XsoIRsMCoyF7atA=;
 b=AvflFbfj0w6dGVbNQX+jRAkbqBSiL7V+hUmE4/DKePN4QI8mxBi2g9ikRGIlgXVOZi
 LakAcMdiaKeCKyeXMZ80UMio8GNE/Z+DkQ261L/QgAwdrbAlHaZi4fV510gQUNP7VhIZ
 wvwoM+hLJG9ra7r9ZdtUDQ2uPtTZxaBhx9UICB4n5o8G1AMUZHp9X2kSUG38o7F0PzNC
 mDbDys8SLTdAp+ZSxSxPvIHdXudaoPgGQCLCs0HjCPU7LMahDp1haqwP0SrNklfcNQFo
 GWq+V0ewWrs8zdC1/rAIoc29Ta9MSxYxIYC+/+xh4i4/v8PeKi1NBCxFyk0xUHkxL3nu
 LLDg==
X-Gm-Message-State: AOAM533wE5l4MPU5JWEdznlE6JNGDDUsAVA4cE545k4RoNDvXfKnKAPD
 DKd8teKMGLvXLr8hVih75CEblgLiDKYFsrCC
X-Google-Smtp-Source: ABdhPJx6qAlzcCgcAFZQhi8apeXZnalyGtzPK6kX7YL/irC69Yj1Id6m3qzKmV8x697R45dsX2JLtw==
X-Received: by 2002:a05:620a:2456:: with SMTP id
 h22mr691145qkn.292.1621447900188; 
 Wed, 19 May 2021 11:11:40 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-47-55-113-94.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.113.94])
 by smtp.gmail.com with ESMTPSA id g1sm136589qtr.32.2021.05.19.11.11.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:11:39 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1ljQfS-00AnPK-Mv; Wed, 19 May 2021 15:11:38 -0300
Date: Wed, 19 May 2021 15:11:38 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v8 5/8] mm: Device exclusive memory access
Message-ID: <20210519181138.GU1096940@ziepe.ca>
References: <47694715.suB6H4Uo8R@nvdebian> <YKP5Dj4Q/riGGc43@t490s>
 <20210518173334.GE1002214@nvidia.com> <YKQBACJCjsxeM3ro@t490s>
 <20210518194509.GF1002214@nvidia.com> <YKQjmtMo+YQGx/wZ@t490s>
 <20210518230327.GG1002214@nvidia.com> <YKRRgZmRMdk1vH7A@t490s>
 <20210519132842.GJ1002214@nvidia.com> <YKUcHfhQMbDnjXC7@t490s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YKUcHfhQMbDnjXC7@t490s>
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
Cc: rcampbell@nvidia.com, willy@infradead.org, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, bsingharora@gmail.com,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hch@infradead.org, linux-mm@kvack.org,
 jglisse@redhat.com, bskeggs@redhat.com, jhubbard@nvidia.com,
 akpm@linux-foundation.org, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Sorry for the noise.

Not at all, it is good that more people understand things!

Jason
