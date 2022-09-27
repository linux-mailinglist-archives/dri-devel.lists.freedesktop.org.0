Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9325ED108
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 01:32:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE3D310E18E;
	Tue, 27 Sep 2022 23:32:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E44810E18E;
 Tue, 27 Sep 2022 23:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=S8UJUP0VBuQngd2OEhP0OtJLPeHHAHk+DG1PtoI2pnk=; b=xRpltdoE+BX4wJj6Dn/xqNhxlx
 dNbrhZ20jxjllsS1ta1wO+7ebIr+chPK780UY/3Y9XqriWy5TXjz53IfQpA4PQyuszNpgBF79SQ90
 MKDt/qDALUhpwL/XrjAZzfRVunyxJkfVw3Ka5tk/dqfXjOlsuK0gfBzsGkVG8CToVfU/QRQ+T3nXY
 1wXjQlbfLxb9c/A3hML8pHwk6Qg0VU+eNHdUV1EmLgPH1LTXTjrJr6hx5jOyiC6Lyorup2B3f6XQb
 VQ5Y5BFREOKh5/3Wy8fn0pJIaHZ2+oVmAwD3b9hu1B7FEM9SmJs+RGTJBR8xNdMndP/c5/HTG1pcl
 VCYMtUqQ==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1odK3O-00D9Po-9y; Tue, 27 Sep 2022 23:31:54 +0000
Date: Tue, 27 Sep 2022 16:31:54 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: Re: [PATCH v6 0/4] Let userspace know when snd-hda-intel needs i915
Message-ID: <YzOH6oV6B6UKb7DF@bombadil.infradead.org>
References: <cover.1652113087.git.mchehab@kernel.org>
 <Ynl7xGy+a9MYjXi1@bombadil.infradead.org>
 <20220920072454.4cf91f24@maurocar-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220920072454.4cf91f24@maurocar-mobl2>
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
Cc: alsa-devel@alsa-project.org, Richard Weinberger <richard@nod.at>,
 Kai Vehmanen <kai.vehmanen@intel.com>, Greg KH <gregkh@linuxfoundation.org>,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 Takashi Iwai <tiwai@suse.com>, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, Vignesh Raghavendra <vigneshr@ti.com>,
 David Airlie <airlied@linux.ie>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-modules@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 linux-mtd@lists.infradead.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bart Van Assche <bvanassche@acm.org>, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 20, 2022 at 07:24:54AM +0200, Mauro Carvalho Chehab wrote:
> Hi Luis,
> 
> On Mon, 9 May 2022 13:38:28 -0700
> Luis Chamberlain <mcgrof@kernel.org> wrote:
> 
> > On Mon, May 09, 2022 at 06:23:35PM +0200, Mauro Carvalho Chehab wrote:
> > > Currently, kernel/module annotates module dependencies when
> > > request_symbol is used, but it doesn't cover more complex inter-driver
> > > dependencies that are subsystem and/or driver-specific.
> > >   
> > 
> > At this pount v5.18-rc7 is out and so it is too late to soak this
> > in for the proper level of testing I'd like to see for modules-next.
> > So I can review this after the next merge window. I'd want to beat
> > the hell out of this and if possible I'd like to see if we can have
> > some test coverage for the intended goal and how to break it.
> 
> Any news with regards to this patch series?

0-day had a rant about a bug with it, it would be wonderful if you can
fix that bug and rebase. Yet again we're now on v6.0-rc7 but it doesn't
mean we can't start testing all this on linux-next. I can just get this
merged to linux-next as soon as this is ready for a new spin, but we
certainly will have to wait until 6.2 as we haven't yet gotten proper
coverage for this on v6.1.

Is there any testing situations you can think of using which can demo
this a bit more separately from existing drivers, perhaps a new
selftests or something?

  Luis
