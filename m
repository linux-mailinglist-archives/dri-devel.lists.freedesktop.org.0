Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E447C2C995C
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 09:24:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2051C6E504;
	Tue,  1 Dec 2020 08:23:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C2E66E5AB
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 16:36:45 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id u4so11349083qkk.10
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 08:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=AaUf3CG+RcFh5tQVVsIeq45Vx/zPTvtcS7i+yqcSjjA=;
 b=NnABYn11On6vtQH6QKY/nfOi/tUVS5UiwT/xWZ5Tv2LttGw0LpcBdqycsgwmWK5igN
 am/SPBqXu98E42iWH/WFBVZRJRwj72LLAXPxZikCzprhFVe66LowfbsoozS3V+JynyJ4
 OCUSgn0CEvKx/PA3xL9T9Dhp36tXVXzNZsFT3h+ntYnQgAj4Z+DwpHbx981LR5Ey1oiQ
 ziTDd169OcXkIq8IUWzKFc2m0H1B1S8dcZ9yvh6elRCxTUwPsF3gt5qaAlp4UxeGtSj5
 87LoSlLgzro8oxxBG9YeEzsqBvDFJJQPYAg4N0HFECAj4WcJL9CfUYUncZMVY4eQ95Fc
 +gyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AaUf3CG+RcFh5tQVVsIeq45Vx/zPTvtcS7i+yqcSjjA=;
 b=OeVJrYvS1DoOTQ9lIXvFUjQEegjN2cxq/TJDXTgUItDBA3o55JOX5THfBbzvF4VLqK
 lnN33+/es0LXlICOFffagrNsiDD7h/px0E+pMKZxdEqGwkUIMWBPov2PYeeR78mu8d6T
 tpGOLBPngVW9SxE8S3XKVTQ36j8BySURibODTtX08hQRspnCsCNwUEzPpd4HclYhPdTb
 koJVa/2uUDeirEamvVV8sGLQmWZ3qLSYi5r68G9TlOCE1CFsdqJHIc6bnLLccSMj4BPW
 Vd+eHF5rNP0E17gcPF0ceCunqMPyzbyfsvvPmtflkAbfbXXwzfhVwSKiPbw0JASrZDnV
 Ibxw==
X-Gm-Message-State: AOAM531DS2gOsa1tLA+Mla4KpYJiypHQZTlPZZnU0jmX9bA7vYDsdcPv
 pOb2Q7/xIQQarrL3Ay5v77dchQ==
X-Google-Smtp-Source: ABdhPJzKNsp23aBi+eRv4c7tD+vWJaHBuGaIlVVwlleyqUuVecTg9HKnJ2+POP36Rxb98/cP/vFoBg==
X-Received: by 2002:a37:b302:: with SMTP id c2mr17538090qkf.166.1606754204209; 
 Mon, 30 Nov 2020 08:36:44 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id n21sm16948269qke.21.2020.11.30.08.36.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 08:36:43 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kjmAN-0045yW-01; Mon, 30 Nov 2020 12:36:43 -0400
Date: Mon, 30 Nov 2020 12:36:42 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH rdma-core v3 4/6] pyverbs: Add dma-buf based MR support
Message-ID: <20201130163642.GC5487@ziepe.ca>
References: <1606510543-45567-1-git-send-email-jianxin.xiong@intel.com>
 <1606510543-45567-5-git-send-email-jianxin.xiong@intel.com>
 <20201130145741.GP401619@phenom.ffwll.local>
 <20201130155544.GA5487@ziepe.ca>
 <20201130160443.GV401619@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201130160443.GV401619@phenom.ffwll.local>
X-Mailman-Approved-At: Tue, 01 Dec 2020 08:23:37 +0000
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
Cc: Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Doug Ledford <dledford@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Jianxin Xiong <jianxin.xiong@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 30, 2020 at 05:04:43PM +0100, Daniel Vetter wrote:
> On Mon, Nov 30, 2020 at 11:55:44AM -0400, Jason Gunthorpe wrote:
> > On Mon, Nov 30, 2020 at 03:57:41PM +0100, Daniel Vetter wrote:
> > > > +	err = ioctl(dri->fd, DRM_IOCTL_AMDGPU_GEM_CREATE, &gem_create);
> > > > +	if (err)
> > > > +		return err;
> > > > +
> > > > +	*handle = gem_create.out.handle;
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static int radeon_alloc(struct dri *dri, size_t size, uint32_t *handle)
> > > 
> > > Tbh radeon chips are old enough I wouldn't care. Also doesn't support p2p
> > > dma-buf, so always going to be in system memory when you share. Plus you
> > > also need some more flags like I suggested above I think.
> > 
> > What about nouveau?
> 
> Reallistically chances that someone wants to use rdma together with the
> upstream nouveau driver are roughly nil. Imo also needs someone with the
> right hardware to make sure it works (since the flags are all kinda arcane
> driver specific stuff testing is really needed).

Well, it would be helpful if we can test the mlx5 part of the
implementation, and I have a lab stocked with nouveau compatible HW..

But you are right someone needs to test/etc, so this does not seem
like Jianxin should worry

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
