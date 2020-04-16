Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 219D51AB91A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 09:00:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D66B6EB17;
	Thu, 16 Apr 2020 06:59:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7B736EAEA
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 06:59:24 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id x26so1192687pgc.10
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 23:59:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5dFbWwPMLFdLLdwYDe+nstRRn0RE7K4B+Qa2HC0tOOY=;
 b=KCxcavUgeDdyoN0i6Un6/uWEbwt22nXA+8CbtXjmFjZ8XZ7pykXJCw4wk43fC+97y7
 h1xUEqSX7rkycdlIf1TRsjk9Lutx1TndfiUgQgDLfhdAGBYtXhGhLARkNCAyGsIfcgJz
 SEdfxKqwU0YTZ93gTtj/U7LD5ImBPmzrzPcSjV3OmDY1aHQlFu4dJtWbxSG9VqEBY4pc
 DbYyk+oCzqBc0BuK9tOjX6P1mM3B5kFbftOkHV1dDqFAKtjmpWN/nUz5H2Vo0k52i/kM
 j4jfR3aH30LfEx6q5cgD2x8x0H0kT4+Y/SrPe855utt8akFIWblHlQVZrsqeYfe0/dvb
 zJ0Q==
X-Gm-Message-State: AGi0PuZljVv/fsv2Iqb0EP/qPOdy8vOvLOeDPkMILMZFOo1Ru0UB1ceT
 l4f6sO5ZrQpBhBup80YYE0M=
X-Google-Smtp-Source: APiQypJZGq5fLgrVy29taLiihHKxD4A1T8eXY4M60RzcYsImGLylhhpJZd5BDHXDMlwu9qPWflNP1A==
X-Received: by 2002:a63:4526:: with SMTP id s38mr7330142pga.410.1587020364470; 
 Wed, 15 Apr 2020 23:59:24 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id v24sm15687796pfm.94.2020.04.15.23.59.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 23:59:23 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id 6A84140277; Thu, 16 Apr 2020 06:59:22 +0000 (UTC)
Date: Thu, 16 Apr 2020 06:59:22 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH 0/8] Simplefs: group and simplify linux fs code
Message-ID: <20200416065922.GS11244@42.do-not-panic.com>
References: <20200414124304.4470-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200414124304.4470-1-eesposit@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 linux-s390@vger.kernel.org, ocfs2-devel@oss.oracle.com,
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
 netdev@vger.kernel.org, Robert Richter <rric@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Vasily Gorbik <gor@linux.ibm.com>,
 Tony Luck <tony.luck@intel.com>, Kees Cook <keescook@chromium.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, autofs@vger.kernel.org,
 Mike Marciniszyn <mike.marciniszyn@intel.com>, linux-fsdevel@vger.kernel.org,
 "Manoj N. Kumar" <manoj@linux.ibm.com>, Uma Krishnan <ukrishn@linux.ibm.com>,
 Jakub Kicinski <kuba@kernel.org>, KP Singh <kpsingh@chromium.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 "Matthew R. Ochs" <mrochs@linux.ibm.com>,
 "David S. Miller" <davem@davemloft.net>, Felipe Balbi <balbi@kernel.org>,
 linux-nfs@vger.kernel.org, Iurii Zaikin <yzaikin@google.com>,
 linux-scsi@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 Miklos Szeredi <miklos@szeredi.hu>, linux-kernel@vger.kernel.org,
 Anna Schumaker <anna.schumaker@netapp.com>,
 linux-security-module@vger.kernel.org, Chuck Lever <chuck.lever@oracle.com>,
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

On Tue, Apr 14, 2020 at 02:42:54PM +0200, Emanuele Giuseppe Esposito wrote:
> This series of patches introduce wrappers for functions,
> arguments simplification in functions calls and most importantly
> groups duplicated code in a single header, simplefs, to avoid redundancy
> in the linux fs, especially debugfs and tracefs.

The general goal seems worthy, but here I don't see explained why hasn't
this gone through libfs, and what the intention was long term. For
instance, you added some other generalizations which you have found. It
was not clear that this was the goal here, to expand on these paths.

What if common code on fs is found which are not part of debugfs and
tracefs, how does one decide if to move to libfs or simplefs?

  Luis
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
