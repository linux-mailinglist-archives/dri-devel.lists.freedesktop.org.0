Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D272C5047
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 09:24:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A88A96E850;
	Thu, 26 Nov 2020 08:24:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 658236E0B7
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 23:57:23 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id q22so152719qkq.6
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 15:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1gLJhkwZL5WHnwEIFNB/JO9CIv8V2CHzH3Td89zgurk=;
 b=GSfuslRTJrgxqEjDVUBmPEGmyMIn2pC+5TfmYI0jmUTxknWfVqTuN+vWRct7yucSZb
 /pNmb3h40HTTGcy3Ru1Co7qqVywsR8Npt3aXTjec65ac4TIWAh5jwL1Gt5kQhOeGDdZ2
 Jtx16L3J0Ct2uGH7EcUaMgwvDmWbcOqUUIUFzOSrVcb7vwyb7rQx/d3vEIaOXKEIHCT5
 VWW0is8j2/kxqkVEwgvNjDgJNXvPtSpiqhfXUZTgg4kDxUPLVDwlhqSd42OX8SIB0MyG
 bhMCpQFCPF/wUgJcMI4+CjUNy8JwyOaqJPOHHoLhXx4N9ssLqfFUMA9SW1xc62E2wZ8I
 XxaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1gLJhkwZL5WHnwEIFNB/JO9CIv8V2CHzH3Td89zgurk=;
 b=WJeu7wOn6sjwuplB/0O0r8UQqI4F5S58pmQrafSFvTLLxfT98xM8kyMIUv5YhlYAM9
 XGumxdJw+T/+zE4Tq7PSrqEQd45o4nyjLtnbVnkwNAGYFRNzKqdyUy6ptUDpA/ZAvnBZ
 SKlHdl8CxIMU5a8JtPf/dHYIG17p2hVcthGCilb2cMUC0WbOm8QtuhC3TOt2jeXVj6mm
 JHGgtPIb1oYPz+41dWJU+j5NsZ9wFzDL6HaaWf39F67t3A2i2Wq3ZyMrjnxUnWya6pJ5
 DNhtwQM3hUsFuigNZXlGTLLOiD0bGAaacX4vKfsiWiEfOUoEC6JuTXYfJQzV7jJN5Rqk
 /ZpQ==
X-Gm-Message-State: AOAM533d4lMFKjrIlsEqdSpR7zwoZiRNNkIU42j1b5fbOz1KzZ81NA/M
 oddxq5mPFB4QGUclcWLXmITpUA==
X-Google-Smtp-Source: ABdhPJyaalvrOWdezNgB6SjAER/qll6NTs9Dt1njWus9sIdv1t5iA8R0eLQMngEdaAP+frmCSD+eGg==
X-Received: by 2002:a37:4893:: with SMTP id v141mr574084qka.361.1606348642398; 
 Wed, 25 Nov 2020 15:57:22 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id x19sm901590qtr.65.2020.11.25.15.57.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 15:57:21 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1ki4f2-001QAA-Pf; Wed, 25 Nov 2020 19:57:20 -0400
Date: Wed, 25 Nov 2020 19:57:20 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH] drm/ttm: don't set page->mapping
Message-ID: <20201125235720.GR5487@ziepe.ca>
References: <20201125162532.1299794-1-daniel.vetter@ffwll.ch>
 <20201125162532.1299794-5-daniel.vetter@ffwll.ch>
 <CAKMK7uGXfqaPUtnX=VgA3tFn3S+Gt9GV+kPguakZ6FF_n8LKuA@mail.gmail.com>
 <20201125180606.GQ5487@ziepe.ca>
 <20201125181129.GA1858@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201125181129.GA1858@infradead.org>
X-Mailman-Approved-At: Thu, 26 Nov 2020 08:24:08 +0000
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-xfs@vger.kernel.org,
 Linux MM <linux-mm@kvack.org>, Huang Rui <ray.huang@amd.com>,
 Brian Paul <brianp@vmware.com>, linux-fsdevel@vger.kernel.org,
 Daniel Vetter <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 25, 2020 at 06:11:29PM +0000, Christoph Hellwig wrote:
> On Wed, Nov 25, 2020 at 02:06:06PM -0400, Jason Gunthorpe wrote:
> > It uses a empty 'cover-letter' commit and automatically transforms it
> > into exactly the right stuff. Keeps track of everything you send in
> > git, and there is a little tool to auto-run git range-diff to help
> > build change logs..
> > 
> > https://github.com/jgunthorpe/Kernel-Maintainer-Tools/blob/master/gj_tools/cmd_send_patches.py
> > 
> > I've been occasionaly wondering if I should suggest Konstantin add a
> > sending side to b4, maybe using some of those ideas..
> > 
> > (careful if you run it, it does autosend without prompting)
> 
> The looks pretty fancy.  Here is my trivial patchbomb.sh script
> 
> #!/bin/sh
> 
> COVERLETTER=$1
> PATCHES=$2
> 
> git send-email --annotate --to-cover --cc-cover $1 $2
> 
> still needs the git basecommit..endcommit notation, but it fires
> up the series for review.

annotate is OK, I used that for a long time..

My main gripe was it didn't setup the to/cc until after the annotate
editor closes.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
