Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DACF78CC2A
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 20:33:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1A6710E47A;
	Tue, 29 Aug 2023 18:33:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A06AD10E477;
 Tue, 29 Aug 2023 18:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=cFaAbUJjl2UXtlahY+fCqV8++1uLiZUrQMG64DLh/k8=; b=Cv4sMiBtHPqhcvYzMcH9hdAWnx
 Q9OMnGzle6A0Gq2+3jpLjbG4PDAwEiqttJUNJ4wUs/N7xwqmORzj1ejuujmrSTPiaYYHlWgHo8Po3
 B+Y6zZ9XM5Grju4Ix49bxDj1xVGinBvTocE7RhIhZKYspCLdZiYMVaEncUMO0gwDZ3kt4goYO9pDL
 QqKjhBdI8nalakhFQ7nr7J6XWO959b4pV4nTTCVZ7SL6ud0RVTpFX/zAH5KAX/A5kNu5gaIeNS5DJ
 iDgFU04JUnx9wqoGys2nTQjPB/zBvXXMxFEsOSSVX00aevP7bdg8C5FPYVYnGgWrkt9y/PuswYK5z
 XpQg/jqg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1qb3Wo-0087wD-Ey; Tue, 29 Aug 2023 18:33:26 +0000
Date: Tue, 29 Aug 2023 19:33:26 +0100
From: Matthew Wilcox <willy@infradead.org>
To: James Zhu <jamesz@amd.com>
Subject: Re: [PATCH v6 1/4] drm: Use XArray instead of IDR for minors
Message-ID: <ZO459g+fCBxbwTAF@casper.infradead.org>
References: <20230724211428.3831636-1-michal.winiarski@intel.com>
 <20230724211428.3831636-2-michal.winiarski@intel.com>
 <10bb9689-9226-d47c-4cf1-7bf9d599456c@amd.com>
 <6qcxpntlr36itieyoyebsncwdv4vadr5ac7imgl4rdemoyedvp@a3m7l32pkcnf>
 <bcbfe6d5-da87-fa2b-c05a-8bea6e0004fb@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bcbfe6d5-da87-fa2b-c05a-8bea6e0004fb@amd.com>
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
Cc: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Emil Velikov <emil.l.velikov@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, James Zhu <James.Zhu@amd.com>,
 Oded Gabbay <ogabbay@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 29, 2023 at 01:34:22PM -0400, James Zhu wrote:
> > > > @@ -1067,7 +1055,7 @@ static void drm_core_exit(void)
> > > >    	unregister_chrdev(DRM_MAJOR, "drm");
> > > >    	debugfs_remove(drm_debugfs_root);
> > > >    	drm_sysfs_destroy();
> > > > -	idr_destroy(&drm_minors_idr);
> > > [JZ] Should we call xa_destroy instead here?
> > We could, if we expect the xarray to potentially not be empty.
> >  From what I understand - all minors should be released at this point.
> [JZ] In practice,  adding destroy here will be better.

Why do you say that?
