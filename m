Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8701A7B68
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 14:54:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCD3B6E119;
	Tue, 14 Apr 2020 12:54:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E131E6E119
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 12:54:21 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3F0D220775;
 Tue, 14 Apr 2020 12:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586868861;
 bh=w6XXP195+Jxp1MIJYohG3U+bL2LY4rMomokRATUVj6Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KUUWawnRhZWVZA4Mx1xQ7dOhftFNPIxzf1waPD79QN2nHLTwGwIA6cevta1EjCSOo
 //wKDlEIhBkx41x9paKY8+IyKktSaZFdJL/+3KUH2daqkCRS3WinhuXoTw3ctowKfO
 34eA1F0TTUmwr4Vr1nPyvba5Bm60H1KoF4fIh+7c=
Date: Tue, 14 Apr 2020 14:54:18 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH 2/8] fs: extract simple_pin/release_fs to separate files
Message-ID: <20200414125418.GA720679@kroah.com>
References: <20200414124304.4470-1-eesposit@redhat.com>
 <20200414124304.4470-3-eesposit@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200414124304.4470-3-eesposit@redhat.com>
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
Cc: Song Liu <songliubraving@fb.com>, linux-usb@vger.kernel.org,
 bpf@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 David Airlie <airlied@linux.ie>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 Alexei Starovoitov <ast@kernel.org>, dri-devel@lists.freedesktop.org,
 "J. Bruce Fields" <bfields@fieldses.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, Hugh Dickins <hughd@google.com>,
 Paul Mackerras <paulus@samba.org>, John Johansen <john.johansen@canonical.com>,
 netdev@vger.kernel.org, ocfs2-devel@oss.oracle.com,
 Christoph Hellwig <hch@lst.de>, Andrew Donnellan <ajd@linux.ibm.com>,
 Matthew Garrett <matthew.garrett@nebula.com>, linux-efi@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Daniel Borkmann <daniel@iogearbox.net>,
 Christian Borntraeger <borntraeger@de.ibm.com>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Mark Fasheh <mark@fasheh.com>,
 Anton Vorontsov <anton@enomsg.org>, John Fastabend <john.fastabend@gmail.com>,
 James Morris <jmorris@namei.org>, Ard Biesheuvel <ardb@kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>,
 oprofile-list@lists.sf.net, Yonghong Song <yhs@fb.com>,
 Ian Kent <raven@themaw.net>, Andrii Nakryiko <andriin@fb.com>,
 Alexey Dobriyan <adobriyan@gmail.com>, "Serge E. Hallyn" <serge@hallyn.com>,
 Robert Richter <rric@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Vasily Gorbik <gor@linux.ibm.com>, Tony Luck <tony.luck@intel.com>,
 Kees Cook <keescook@chromium.org>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 autofs@vger.kernel.org, Mike Marciniszyn <mike.marciniszyn@intel.com>,
 linux-fsdevel@vger.kernel.org, "Manoj N. Kumar" <manoj@linux.ibm.com>,
 Uma Krishnan <ukrishn@linux.ibm.com>, Jakub Kicinski <kuba@kernel.org>,
 KP Singh <kpsingh@chromium.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 "Matthew R. Ochs" <mrochs@linux.ibm.com>,
 "David S. Miller" <davem@davemloft.net>, Felipe Balbi <balbi@kernel.org>,
 linux-nfs@vger.kernel.org, Iurii Zaikin <yzaikin@google.com>,
 linux-scsi@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-mm@kvack.org, linux-s390@vger.kernel.org,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 Miklos Szeredi <miklos@szeredi.hu>, linux-security-module@vger.kernel.org,
 linux-kernel@vger.kernel.org, Anna Schumaker <anna.schumaker@netapp.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Chuck Lever <chuck.lever@oracle.com>,
 Jeremy Kerr <jk@ozlabs.org>, Colin Cross <ccross@android.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Mike Kravetz <mike.kravetz@oracle.com>, linuxppc-dev@lists.ozlabs.org,
 Martin KaFai Lau <kafai@fb.com>, Joel Becker <jlbec@evilplan.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 14, 2020 at 02:42:56PM +0200, Emanuele Giuseppe Esposito wrote:
> We will augment this family of functions with inode management.  To avoid
> littering include/linux/fs.h and fs/libfs.c, move them to a separate header,
> with a Kconfig symbol to enable them.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

You have a lot of people on cc:, this is going to be hard for everyone
to review...


> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index d1398cef3b18..fc38a6f0fc11 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -288,12 +288,16 @@ config STRIP_ASM_SYMS
>  
>  config READABLE_ASM
>  	bool "Generate readable assembler code"
> -	depends on DEBUG_KERNEL
> -	help
> -	  Disable some compiler optimizations that tend to generate human unreadable
> -	  assembler output. This may make the kernel slightly slower, but it helps
> -	  to keep kernel developers who have to stare a lot at assembler listings
> -	  sane.
> +    depends on DEBUG_KERNEL
> +    help
> +      Disable some compiler optimizations that tend to generate human unreadable
> +      assembler output. This may make the kernel slightly slower, but it helps
> +      to keep kernel developers who have to stare a lot at assembler listings
> +      sane.
> +	  

Why did you loose the indentation here and add trailing whitespace?

> +config DEBUG_FS
> +	bool "Debug Filesystem"
> +	select SIMPLEFS
>  

We already have a DEBUG_FS config option in this file, why another one?
And what happened to the help text?

I think you need to rework your patch series to do smaller things on
each step, which would make it reviewable much easier, and prevent
mistakes like this one.

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
