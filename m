Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBD51B0E58
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 16:28:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A9796E52F;
	Mon, 20 Apr 2020 14:28:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45E3B6E52F
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 14:28:45 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E7A96205C9;
 Mon, 20 Apr 2020 14:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587392924;
 bh=Xfhmbt3oILrMnmMSAOk0kNM8XdFhuXm9MUCUSzShG8g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LnzLHOGL3SfYzz4pLofCJ1ROQjqVMmfWQwIeMijgCZdRKOiLZgnrpkFWugSMer61U
 SUy1vwyCeMyLufrPfYFn9wMKcSES/m+B4D/DjqcEiwhebOFIg8iwdCJThhBrgF45My
 mDtP1iFIfm+kWnwF33LB3q5mplaFnA9YYIC790Wo=
Date: Mon, 20 Apr 2020 16:28:42 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH 6/8] simplefs: add file creation functions
Message-ID: <20200420142842.GA4125486@kroah.com>
References: <20200414124304.4470-1-eesposit@redhat.com>
 <20200414124304.4470-7-eesposit@redhat.com>
 <20200414125626.GC720679@kroah.com>
 <f371bcc0-266a-cb0b-3bde-fed336b8c9b5@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f371bcc0-266a-cb0b-3bde-fed336b8c9b5@redhat.com>
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

On Mon, Apr 20, 2020 at 03:57:48PM +0200, Emanuele Giuseppe Esposito wrote:
> 
> 
> On 4/14/20 2:56 PM, Greg Kroah-Hartman wrote:
> > On Tue, Apr 14, 2020 at 02:43:00PM +0200, Emanuele Giuseppe Esposito wrote:
> > > A bunch of code is duplicated between debugfs and tracefs, unify it to the
> > > simplefs library.
> > > 
> > > The code is very similar, except that dentry and inode creation are unified
> > > into a single function (unlike start_creating in debugfs and tracefs, which
> > > only takes care of dentries).  This adds an output parameter to the creation
> > > functions, but pushes all error recovery into fs/simplefs.c.
> > > 
> > > Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> > > ---
> > >   fs/simplefs.c            | 150 +++++++++++++++++++++++++++++++++++++++
> > >   include/linux/simplefs.h |  19 +++++
> > >   2 files changed, 169 insertions(+)
> > 
> > What's wrong with libfs, isn't that supposed to be for these types of
> > "common" filesystem interactions?
> > 
> > Why create a whole "new" fs for this?
> 
> I assume you meant a new file. These new functions are used only by a few
> filesystems, and I didn't want to include them in vmlinux unconditionally,
> so I introduced simplefs.c and CONFIG_SIMPLEFS instead of extending libfs.c.
> In this way only fs that need this code like debugfs and tracefs will load
> it.

Nothing "loads it", why not just make these libfs functions instead?  As
the difference between the two is not obvious at all, please don't make
things confusing.

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
