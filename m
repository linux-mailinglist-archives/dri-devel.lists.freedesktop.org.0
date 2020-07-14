Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B3D21EDAC
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 12:11:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6A976E0D7;
	Tue, 14 Jul 2020 10:11:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 741186E0D7
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 10:11:34 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id j4so20572639wrp.10
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 03:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=OqMAzxBrcdwm6YGTWbUrnUhO2V+3iZLXbZ6mNMhNbgU=;
 b=YrcDDo2hP5M68Ak8M7jsKPUTs7yD6/ADyMMgpPJg442GJRgPGP+jCxljWP3trEqyTE
 QOK/gRwpRbKojsplhpXoZipPym/tq9vaDlYDnM8AoXUuGx1MmGgAD38eAYYxbNAHn1aX
 z8h9SSiDlHidMaX1MKCyAlI/GZvt0IAKvagEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=OqMAzxBrcdwm6YGTWbUrnUhO2V+3iZLXbZ6mNMhNbgU=;
 b=Ba2tyat4u8Wvq0NQd0MmZAPRHpOz24fBhqmWb1lhs8oE+hZRTdttrX/LzFzCj2xcd1
 qbW4I+B1vTZjzbuK8ELO5rcocqhrHJp/ISc+TQVq66Hx6zyrikVS+8CkgRK+VN76uAIe
 s3ATDR3J9YqiWrN5y7Yjo9BxRBjU/RBQN8FMcM4tNtT+gjZbVkXa8oeIXKcYotso5itP
 f8RRVZgqKt1lvkrYZ6773akr2HfnCi/erixsifqnvJjNh2P5tSG/61TOd1uhGtPpcFFG
 dF/w5NqKQkPM7gp06YjdzocvxnPqqREYoizQJLYXVdKMi/2ilPgbu/QXyhR4Qy1LHVEY
 h1vw==
X-Gm-Message-State: AOAM5338AscxfKBABFjVLXFmRkNJl1NVQ7whi9n5y2QI9ESjrcRAt9dD
 qO432KUlAsdf73W1rpdDywWhyg==
X-Google-Smtp-Source: ABdhPJwmiWZVvfzELvtSnftev0XNz5kRmchhtWQAJnH3b79CIxD1ms2dJU5USjC+U/HesEOe1K7f7A==
X-Received: by 2002:adf:8444:: with SMTP id 62mr4044229wrf.278.1594721493115; 
 Tue, 14 Jul 2020 03:11:33 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d201sm3498227wmd.34.2020.07.14.03.11.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 03:11:32 -0700 (PDT)
Date: Tue, 14 Jul 2020 12:11:29 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-mm@vger.kernel.org, Mike Rapoport <rppt@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 kgdb-bugreport@lists.sourceforge.net, Wu Hao <hao.wu@intel.com>,
 linux-fpga@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>,
 Mali DP Maintainers <malidp@foss.arm.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
 Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>,
 Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
 linux-leds@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org, Derek Kiernan <derek.kiernan@xilinx.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 Tony Krowiak <akrowiak@linux.ibm.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, linux-s390@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>,
 Hannes Reinecke <hare@suse.com>, linux-scsi@vger.kernel.org,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 Mimi Zohar <zohar@linux.ibm.com>, linux-integrity@vger.kernel.org,
 keyrings@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 kvm@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, nd@arm.com
Subject: Re: [PATCH 06/20] Documentation: gpu/komeda-kms: eliminate
 duplicated word
Message-ID: <20200714101129.GB3278063@phenom.ffwll.local>
Mail-Followup-To: "james qian wang (Arm Technology China)"
 <james.qian.wang@arm.com>, 
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-mm@vger.kernel.org, Mike Rapoport <rppt@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 kgdb-bugreport@lists.sourceforge.net, Wu Hao <hao.wu@intel.com>,
 linux-fpga@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>,
 Mali DP Maintainers <malidp@foss.arm.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
 Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>,
 Michal Marek <michal.lkml@markovi.net>,
 linux-kbuild@vger.kernel.org,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
 linux-leds@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Pierre Morel <pmorel@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, linux-s390@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>,
 Hannes Reinecke <hare@suse.com>, linux-scsi@vger.kernel.org,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 Mimi Zohar <zohar@linux.ibm.com>, linux-integrity@vger.kernel.org,
 keyrings@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 kvm@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 nd@arm.com
References: <20200707180414.10467-1-rdunlap@infradead.org>
 <20200707180414.10467-7-rdunlap@infradead.org>
 <20200708050821.GA1121718@jamwan02-TSP300>
 <20200714101005.GA3278063@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200714101005.GA3278063@phenom.ffwll.local>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 14, 2020 at 12:10:05PM +0200, Daniel Vetter wrote:
> This and next patch merged to drm-misc-next, thanks.

Oops strike this, I just noticed that Jon said he's picked it all up.

Oh well, the confusion, I managed to stop the script before it published
anything at least :-)
-Daniel

> 
> On Wed, Jul 08, 2020 at 01:08:21PM +0800, james qian wang (Arm Technology China) wrote:
> > Hi Randy
> > 
> > On Tue, Jul 07, 2020 at 11:04:00AM -0700, Randy Dunlap wrote:
> > > Drop the doubled word "and".
> > > 
> > > Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> > > Cc: Jonathan Corbet <corbet@lwn.net>
> > > Cc: linux-doc@vger.kernel.org
> > > Cc: James (Qian) Wang <james.qian.wang@arm.com>
> > > Cc: Liviu Dudau <liviu.dudau@arm.com>
> > > Cc: Mihail Atanassov <mihail.atanassov@arm.com>
> > > Cc: Mali DP Maintainers <malidp@foss.arm.com>
> > > ---
> > >  Documentation/gpu/komeda-kms.rst |    2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > --- linux-next-20200701.orig/Documentation/gpu/komeda-kms.rst
> > > +++ linux-next-20200701/Documentation/gpu/komeda-kms.rst
> > > @@ -41,7 +41,7 @@ Compositor blends multiple layers or pix
> > >  frame. its output frame can be fed into post image processor for showing it on
> > >  the monitor or fed into wb_layer and written to memory at the same time.
> > >  user can also insert a scaler between compositor and wb_layer to down scale
> > > -the display frame first and and then write to memory.
> > > +the display frame first and then write to memory.
> > 
> > Thank you for the patch.
> > 
> > Reviewed-by: James Qian Wang <james.qian.wang@arm.com>
> 
> James, for simple patches like this just go ahead and merge them. You're
> the maintainer for this, just slapping an r-b onto a patch and no
> indiciation whether you will pick it up only confuses people and increases
> the risk that patches get lost.
> 
> So either pick up right away, or state clearly that you will pick it up
> later, or that you expect someone else to merge this.
> 
> Thanks, Daniel
> > 
> > >  Writeback Layer (wb_layer)
> > >  --------------------------
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
