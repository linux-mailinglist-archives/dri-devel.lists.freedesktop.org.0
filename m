Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B083FEA73
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 10:12:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 367C76E489;
	Thu,  2 Sep 2021 08:12:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sipsolutions.net (s3.sipsolutions.net
 [IPv6:2a01:4f8:191:4433::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AF8F6E489
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 08:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=T8iMcVMtgnL9iuUQ7xEHqtPN2nGklJHWa5SfBMcFyr0=; 
 t=1630570344; x=1631779944; b=tP0b8/gzyIIV5ohgiaDQZaVYlE/J/5rdWs1wtK6jrZPC9zj
 INPmNqAEQnkGVomGQtsuk1wAwoVXX9DHibzWH67wgqof+SAGZIVeP7aEpxn3Ooq/0J1oj236d+iYK
 4NZPDg4oJ16LkQC777OO2N/I4mcBVgsTGAmuqVI7FN+jh4qZR+JaQLs2QVZp0AU0KKYMJ0GVbpZaA
 /x07Y5ihdD30ElqTIdETjw3cr+4isYtxwyLDqagRFgL+v6V9/TBZnO+zpDicRxMtqDjXNahozFz4y
 f5wzZyneHpcKowHTLZCPqfUyjuxucNhtmwRXJSJZbKSbafszxt50dbXwfTOzzN4g==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <johannes@sipsolutions.net>)
 id 1mLhpI-001WhA-0D; Thu, 02 Sep 2021 10:12:00 +0200
Message-ID: <c5505b203829fbcafefc9ec34cc1d7d7158c7359.camel@sipsolutions.net>
Subject: Re: [PATCH] drm/ttm: provide default page protection for UML
From: Johannes Berg <johannes@sipsolutions.net>
To: Anton Ivanov <anton.ivanov@cambridgegreys.com>, Randy Dunlap
 <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, 
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Huang Rui
 <ray.huang@amd.com>,  dri-devel@lists.freedesktop.org, Jeff Dike
 <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>,
 linux-um@lists.infradead.org, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>
Date: Thu, 02 Sep 2021 10:11:59 +0200
In-Reply-To: <347e4cb8-a7c5-9e1b-16bc-96805442d35b@cambridgegreys.com>
References: <20210902020129.25952-1-rdunlap@infradead.org>
 <9faacbc8-3346-8033-5b4d-60543eae959e@cambridgegreys.com>
 <f978cae5-7275-6780-8a17-c6e61247bce7@infradead.org>
 <0887903c-483d-49c7-0d35-f59be2f85bac@cambridgegreys.com>
 <288a2d4dbcb1e6b0fbeff6da86569aa92df09202.camel@sipsolutions.net>
 <347e4cb8-a7c5-9e1b-16bc-96805442d35b@cambridgegreys.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-malware-bazaar: not-scanned
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2021-09-02 at 09:10 +0100, Anton Ivanov wrote:
> On 02/09/2021 08:43, Johannes Berg wrote:
> > On Thu, 2021-09-02 at 07:19 +0100, Anton Ivanov wrote:
> > > > > 
> > > > > I have a question though - why all of DRM is not !UML in config. Not
> > > > > like we can use them.
> > > > 
> > > > I have no idea about that.
> > > > Hopefully one of the (other) UML maintainers can answer you.
> > > 
> > > Touche.
> > > 
> > > We will discuss that and possibly push a patch to !UML that part of the
> > > tree. IMHO it is not applicable.
> > 
> > As I just said on the other patch, all of this is fallout from my commit
> > 68f5d3f3b654 ("um: add PCI over virtio emulation driver") which is the
> > first time that you could have PCI on UML.
> > 
> > Without having checked, in this particular case it's probably something
> > like
> > 
> > 	depends on PCI && X86_64
> > 
> > as we've seen in other drivers (idxd, ioat).
> > 
> > The biggest problem is probably that UML internally uses X86_64
> > (arch/x86/um/Kconfig), which is ... unexpected ... since CONFIG_X86_64
> > is typically considered the ARCH, and now the ARCH is actually um.
> > 
> > I think we can just fix that and get rid of this entire class of
> > problems? Something like
> > 
> > https://p.sipsolutions.net/fbac19d86637e286.txt
> 
> Good idea. I suspect that DRM will not be the only thing to pop up out 
> of this so we might as well fix it "at the top".

Yeah I sent like a handful of similar patches ...

I'll send that patch out in a minute, just writing a reasonable commit
log. Seems to build & work fine for me.

johannes

