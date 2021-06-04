Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F1B39BFE8
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 20:53:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15F826E252;
	Fri,  4 Jun 2021 18:53:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F54C6E252
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 18:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=KS6phxfdTRzT2U4OpA7PvjxoSBh4P43QxunbulqGWsI=; b=odv/QteUH4VQharTRxmoog5tl4
 kwQj4ZWY4rD3YBbo/V4h/aJw9v7eLrTEQUkhC7o0vaePeygVpUZfayjPGKcWdkRzNVomt4PzbQ113
 SbgdcfrnoHFkDlR+UVqiX30Slyh9psAjffNd3IRzC9XkRSW/E8Jw03aj02dDwimuhRsC3ga6Vh4kc
 fghPVIlSi7aQ105tjEwQd074J43bHCW8Tnaht+w0ltDMtZgFcPHvXkOYojRye8GJ+YzgEvKSUzsUl
 eJOcg3rcgAACgx6qpfSokAwSejtPTg2uJ/V2z05GOBh5Mw3ks5/HZPP5CskG6QzwyFvIUleDOPD3O
 ZFjM6QPQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lpEwA-00DUKC-F2; Fri, 04 Jun 2021 18:52:59 +0000
Date: Fri, 4 Jun 2021 19:52:54 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Dexuan Cui <decui@microsoft.com>
Subject: Re: [bug report] Commit ccf953d8f3d6 ("fb_defio: Remove custom
 address_space_operations") breaks Hyper-V FB driver
Message-ID: <YLp2hulQpBl7JRSO@casper.infradead.org>
References: <87v96tzujm.fsf@vitty.brq.redhat.com>
 <20210604130014.tkeozyn4wxdsr6o2@liuwe-devbox-debian-v2>
 <e5c90203-df8c-1e72-f77d-41db4ff5413f@linux.microsoft.com>
 <MW2PR2101MB0892518BB763E7D8137E2590BF3B9@MW2PR2101MB0892.namprd21.prod.outlook.com>
 <BYAPR21MB1270A0B5CEDBA1C0D2E290EBBF3B9@BYAPR21MB1270.namprd21.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BYAPR21MB1270A0B5CEDBA1C0D2E290EBBF3B9@BYAPR21MB1270.namprd21.prod.outlook.com>
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
Cc: 'Wei Liu' <wei.liu@kernel.org>,
 "'linux-hyperv@vger.kernel.org'" <linux-hyperv@vger.kernel.org>,
 "'dri-devel@lists.freedesktop.org'" <dri-devel@lists.freedesktop.org>,
 "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>,
 "'linux-fbdev@vger.kernel.org'" <linux-fbdev@vger.kernel.org>,
 vkuznets <vkuznets@redhat.com>, Michael Kelley <mikelley@microsoft.com>,
 'Vineeth Pillai' <viremana@linux.microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 04, 2021 at 06:37:49PM +0000, Dexuan Cui wrote:
> > From: Dexuan Cui
> > Sent: Friday, June 4, 2021 11:17 AM
> > > >> ...
> > > > I've heard a similar report from Vineeth but we didn't get to the bottom
> > > > of this.
> > > I have just tried reverting the commit mentioned above and it solves the
> > > GUI freeze
> > > I was also seeing. Previously, login screen was just freezing, but VM
> > > was accessible
> > > through ssh. With the above commit reverted, I can login to Gnome.
> > >
> > > Looks like I am also experiencing the same bug mentioned here.
> > >
> > > Thanks,
> > > Vineeth
> > 
> > As Matthew mentioned, this is a known issue:
> > https://lwn.net/ml/linux-kernel/YLZEhv0cpZp8uVE3@casper.infradead.org/
> > 
> > Matthew has reverted ccf953d8f3d6:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=
> > 0b78f8bcf4951af30b0ae83ea4fad27d641ab617
> > so the latest mainline should work now.
> > 
> > Thanks,
> > Dexuan
> 
> Hi Matthew,
> With today's latest mainline 16f0596fc1d78a1f3ae4628cff962bb297dc908c,
> the Xorg works again in Linux VM on Hyper-V, but when I reboot the VM, I
> always see a lot of "BUG: Bad page state in process Xorg " warnings (there
> are about 60 such warnings) before the VM reboots.
> 
> BTW, I happen to have an older Mar-28 mainline kernel (36a14638f7c0654),
> which has the same warnings. 
> 
> Any idea which change introduced the warnings? 

Looks like someone forgot to call fb_deferred_io_cleanup()?
