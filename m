Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 863A918C878
	for <lists+dri-devel@lfdr.de>; Fri, 20 Mar 2020 09:01:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 972C86EAD7;
	Fri, 20 Mar 2020 08:01:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEB2B6EA03
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 11:50:30 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id l20so1466829qtp.4
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 04:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=lBTUj1y9VtUDCn4ytJFEQ/eoQI6G7k2EQxvY7AJpV3c=;
 b=Q9ERC6iPr6C3r4Aftx8b5gwyrS/P6NkAng74KreczcNsHr53jWHlVKuPvCBBh0StdU
 b7wzRK/4QaptzavqQqjoxQtuj+QaqaBcHLAt+n2RM2aODrw/YIvYJOcY6oY/jhXWMdNl
 gFsDyu8l5L6Q4p5/Vec/nQL4ZF96TI6lmJ+GksJOA5nnA/U56BWjdrmmQuHmwq16PEgF
 vEDyKh6pD2UZZlm0QaUjZJg9ezYYrp/3bLf3kWlZYm9kIylqHOwtEoZBn6QJwP79CInq
 PaTsPCn3AYjQRE8u84qlU4iAzPC4kAqGszh17G2RZLFuZX+xqHCLjAuidtRaW2LMrHIM
 4mJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=lBTUj1y9VtUDCn4ytJFEQ/eoQI6G7k2EQxvY7AJpV3c=;
 b=VVSVtAfluHt5EWaCXukXICcwMeGxhNTk2AF0qWWfbWTYd7Sx8OjT4hk1kxOZXxGSM6
 ND7U0hB5THAruRqhlQvkNwPH5tJ8pZ1FFH8aXoja31EsBTLhSHXy/A0WvxrrBlouuUZ5
 DAwHIngNkYdeyp1U8bFL3j1g4BQCdJxSSoFqgAKywhzzcO6LnPLziDiaY1ForsEWHJIA
 j8vFmGnYKlfyN/t9n0z6Yte21qJ4McJt2p8RsmY/kbCT0LcDmii3DVQWH8ojNtZz3AXm
 AYcTIyO8W6qBcq56CaqsVNJ/nhD91E1iKVMVxuyoqr+ykiUjT+HGKAFt42n2Di5d8jkR
 +QHg==
X-Gm-Message-State: ANhLgQ3mThFUNKahWJMYPljNdbiVMsjwISEv99S+/g03Hb70HrbrGe6J
 S8xje8UvVBokYf5oIj3nmZjCCw==
X-Google-Smtp-Source: ADFU+vsIVebb1InTyDcl4fZPuH+UAvQ5tH6FZmi6I4UE9Qq4JBH+2FeGy/XT9qJsD57BNhHjEf5qDA==
X-Received: by 2002:ac8:24a7:: with SMTP id s36mr2441422qts.357.1584618629621; 
 Thu, 19 Mar 2020 04:50:29 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id h138sm1339362qke.86.2020.03.19.04.50.28
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 19 Mar 2020 04:50:28 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jEtgx-0004ip-P2; Thu, 19 Mar 2020 08:50:27 -0300
Date: Thu, 19 Mar 2020 08:50:27 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: ensure device private pages have an owner v2
Message-ID: <20200319115027.GI20941@ziepe.ca>
References: <20200316193216.920734-1-hch@lst.de>
 <20200319002849.GG20941@ziepe.ca> <20200319071633.GA32522@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200319071633.GA32522@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Fri, 20 Mar 2020 08:01:25 +0000
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
Cc: amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kvm-ppc@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 19, 2020 at 08:16:33AM +0100, Christoph Hellwig wrote:
> On Wed, Mar 18, 2020 at 09:28:49PM -0300, Jason Gunthorpe wrote:
> > > Changes since v1:
> > >  - split out the pgmap->owner addition into a separate patch
> > >  - check pgmap->owner is set for device private mappings
> > >  - rename the dev_private_owner field in struct migrate_vma to src_owner
> > >  - refuse to migrate private pages if src_owner is not set
> > >  - keep the non-fault device private handling in hmm_range_fault
> > 
> > I'm happy enough to take this, did you have plans for a v3?
> 
> I think the only open question is if merging 3 and 4 might make sense.
> It's up to you if you want it resent that way or not.

Now that I understand that amdgpu doesn't set the 'do not return
device_private pages' flag, I think the split is fine, I'll grab it as
is then today

Thanks,
Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
