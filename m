Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5772A9171
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 09:35:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0211A6EE13;
	Fri,  6 Nov 2020 08:35:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 090F46E104
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 15:02:07 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id g17so1257331qts.5
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 07:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=aEjedQGnbvpDY6glZjQQcDKpPqhdsXXdZcrkeVyX5oQ=;
 b=Z2Uj4OilmylQVxDL+DU7Y5P/c8WGD1UFcOjbpAk03p2/6cc/znY23y8onLANtbgIe6
 Wzy12eNa7rr1nd6EhL1CVV5r/LS0Wi8ucJQLG4BximCQtOnGUwOu0FlP7ongNUuot0TB
 3/lpC5SO9WFUnvBE1kp8bt+EOXHfHVWzm2Wt756f7OqkcQxgRpgcjE3POCExH2zsanWs
 yANPGFQNLss2vNuYUoThphC/zkoB0lbsZ4yE67VYczwB71LWovITSngT1lwbpqgZqLuh
 mHe8PshigzPyRe0l+ujOnsVKK4nAhagz47twlmO32ddw2IiROoEK37k+ZQdAzbG7HcBL
 E7zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aEjedQGnbvpDY6glZjQQcDKpPqhdsXXdZcrkeVyX5oQ=;
 b=Mh6w29nDKrg38omBhYolO6zNhdny4l4s+TdAc0sHykiduyOJCAeVmi/jcYOaM6HH5c
 BqWuflKH+f94N4dtbNcEsw9yGbZPUX/Ntp33Zx57AHFvs8xyMwIaT4A+lmusaOzGtF2R
 ME0pZ46oEPbX7Sdr33HHfeOqk6e1Og0uML+TznLpLwqnwu7ONxZkQvKCP63YErGeRKc5
 FeTTtZO3D6571pZ0wVprmpary53b4c36A3HuqEioRw0Pln8z2nd/Lej/MkTfXaOl7X8M
 bl07diNCAJHECfm1Ce1EOl532KNnWY79rE0B6XxLKMpQQDi/JwTbf9Kz2jf0YOd37vaX
 J8kw==
X-Gm-Message-State: AOAM532lJOwD3wfYXmmfBpI0jbXKu8mbJWgriVqtEOGcFS+X8oV/4Hs1
 GqLDdo4cRvlfaC4Z0seZ0ijIpw==
X-Google-Smtp-Source: ABdhPJy8L6TLYOaMOx02cH+3l45WHaqYAs7U33rCwZ2gyd8yzEhDkMmQIxa3O/OlV15G2AWP4TENsA==
X-Received: by 2002:ac8:6683:: with SMTP id d3mr2286456qtp.137.1604588526219; 
 Thu, 05 Nov 2020 07:02:06 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id c12sm978506qtx.54.2020.11.05.07.02.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 07:02:05 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kagm4-00HODJ-GO; Thu, 05 Nov 2020 11:02:04 -0400
Date: Thu, 5 Nov 2020 11:02:04 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v6 1/4] RDMA/umem: Support importing dma-buf as user
 memory region
Message-ID: <20201105150204.GC36674@ziepe.ca>
References: <1603471201-32588-1-git-send-email-jianxin.xiong@intel.com>
 <1603471201-32588-2-git-send-email-jianxin.xiong@intel.com>
 <20201023164911.GF401619@phenom.ffwll.local>
 <20201023182005.GP36674@ziepe.ca>
 <CAKMK7uEZYdtwHKchNwiFjuYJDjA+F+qDgw64TNkchjp4uYUr6g@mail.gmail.com>
 <MW3PR11MB45553600E8A141CCDE52FABDE5110@MW3PR11MB4555.namprd11.prod.outlook.com>
 <CAKMK7uFMAiv27oRi98nAvx15M6jniUEb+hhe3mrY3mdYtzsmLg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uFMAiv27oRi98nAvx15M6jniUEb+hhe3mrY3mdYtzsmLg@mail.gmail.com>
X-Mailman-Approved-At: Fri, 06 Nov 2020 08:34:42 +0000
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
Cc: Leon Romanovsky <leon@kernel.org>, linux-rdma <linux-rdma@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Doug Ledford <dledford@redhat.com>, "Vetter, Daniel" <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>, "Xiong,
 Jianxin" <jianxin.xiong@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 03, 2020 at 09:43:17PM +0100, Daniel Vetter wrote:

> > > Yeah definitely don't call dma_buf_map_attachment and expect a page back. In practice you'll get a page back fairly often, but I don't think
> > > we want to bake that in, maybe we eventually get to non-hacky dma_addr_t only sgl.
> > >
> > > What I'm wondering is whether dma_buf_attach shouldn't reject such devices directly, instead of each importer having to do that.
> >
> > Come back here to see if consensus can be reached on who should do the check. My
> > thinking is that it could be over restrictive for dma_buf_attach to always reject
> > dma_virt_ops. According to dma-buf documentation the back storage would be
> > moved to system area upon mapping unless p2p is requested and can be supported
> > by the exporter. The sg_list for system memory would have struct page present.
> 
> So I'm not clear on what this dma_virt_ops stuff is for, but if it's
> an entirely virtual device with cpu access, then you shouldn't do
> dma_buf_map_attachment, and then peek at the struct page in the sgl.

Yes, so I think the answer is it is rdma device driver error to call these
new APIs and touch the struct page side of the SGL.

After Christophs series removign dma_virt_ops we could make that more
explicit, like was done for the pci p2p case.


> As a third option, if it's something about the connectivity between
> the importing and exporting device, then this should be checked in the
> ->attach callback the exporter can provide, like the p2p check. The

Drivers doing p2p are supposed to be calling the p2p distance stuff
and p2p dma map stuff which already has these checks.

Doing p2p and skipping all that in the dma buf side we already knew
was a hacky thing.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
