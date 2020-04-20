Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC841B0D89
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 15:58:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1750E6E1F8;
	Mon, 20 Apr 2020 13:58:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A491B6E1F8
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 13:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587391078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pK26z2Uz8J+xMXGm08XY3fCeYfVumTWEKpq3I9uMJ70=;
 b=R/JcZkwu1B4ZzBZFN6dQVIKNfDHLF067dQ/VbM9oDV5t6uYbWvbtuqkJ9oMnkSb3C77v7t
 1yPjEZDOHc00VQzqoNntmFnBvFO/HXlT5EDlCGiwLHrNXwGd/gcYA2HBJE1N6YCDVpaN8g
 mD6cuvyGnm1SBknkkG5Hn/NVkyctUqo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-49-CzBSCf4TNcqRjHdgJrl2VQ-1; Mon, 20 Apr 2020 09:57:54 -0400
X-MC-Unique: CzBSCf4TNcqRjHdgJrl2VQ-1
Received: by mail-wr1-f70.google.com with SMTP id 11so5757741wrc.3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 06:57:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pK26z2Uz8J+xMXGm08XY3fCeYfVumTWEKpq3I9uMJ70=;
 b=WPkGi6GLaqkxtGMMWMKn+0SPnuo4pVSnGOtqXUIpIWzFxJKMBpg69fR3/Sl+euVY+B
 QLxsfWdhwwcoL0LjmNhCYTgX4qdOp9qGNqEpxPgI22/mZUymjxTwHTEfaUfliyxjziZF
 /GVqoPzEBVtkTqDAAfZ4/EVYF502BnSh6k71NNxnGAtr76zYsqGJd09llWA7JiXSkSa4
 XwRGjseNEznv5smsg9QH7g5M7nBGSF2AQa9PILiMeJJDBLW8ocVhaiXHNb6ef5qsgljf
 OkUOU9eMTjSHm5Xy9UjctI6FmdpxS8M6roUUXvuzRXJpUvXl9gXLhMuZcKybIPWtqmIk
 HdDQ==
X-Gm-Message-State: AGi0PuY0rwj22JPPdGpOJcM+CSGJ5p7goJ0uL6j7ve2z8R0pfZqVC/+j
 vKbSap8O+3HglJTNX1ZCH98/Vmc31bmeV8oz7FR5pEC4kVM/oZUkZXX4I4dZck+7cIQICHcOjFT
 6RLWWsTzbLymaOallwNfnLGY4+siU
X-Received: by 2002:a7b:cf2b:: with SMTP id m11mr16860491wmg.147.1587391073773; 
 Mon, 20 Apr 2020 06:57:53 -0700 (PDT)
X-Google-Smtp-Source: APiQypKZBYixV5ajKWzxEAUUh742/WPOg+S3dMK8bDyvyM4eMw8EIY0hxy1C7QN16yJpeFB4fL8+FQ==
X-Received: by 2002:a7b:cf2b:: with SMTP id m11mr16860432wmg.147.1587391073551; 
 Mon, 20 Apr 2020 06:57:53 -0700 (PDT)
Received: from localhost.localdomain ([194.230.155.102])
 by smtp.gmail.com with ESMTPSA id l5sm1432890wmi.22.2020.04.20.06.57.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2020 06:57:52 -0700 (PDT)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH 6/8] simplefs: add file creation functions
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20200414124304.4470-1-eesposit@redhat.com>
 <20200414124304.4470-7-eesposit@redhat.com>
 <20200414125626.GC720679@kroah.com>
Message-ID: <f371bcc0-266a-cb0b-3bde-fed336b8c9b5@redhat.com>
Date: Mon, 20 Apr 2020 15:57:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200414125626.GC720679@kroah.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/14/20 2:56 PM, Greg Kroah-Hartman wrote:
> On Tue, Apr 14, 2020 at 02:43:00PM +0200, Emanuele Giuseppe Esposito wrote:
>> A bunch of code is duplicated between debugfs and tracefs, unify it to the
>> simplefs library.
>>
>> The code is very similar, except that dentry and inode creation are unified
>> into a single function (unlike start_creating in debugfs and tracefs, which
>> only takes care of dentries).  This adds an output parameter to the creation
>> functions, but pushes all error recovery into fs/simplefs.c.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>   fs/simplefs.c            | 150 +++++++++++++++++++++++++++++++++++++++
>>   include/linux/simplefs.h |  19 +++++
>>   2 files changed, 169 insertions(+)
> 
> What's wrong with libfs, isn't that supposed to be for these types of
> "common" filesystem interactions?
> 
> Why create a whole "new" fs for this?

I assume you meant a new file. These new functions are used only by a 
few filesystems, and I didn't want to include them in vmlinux 
unconditionally, so I introduced simplefs.c and CONFIG_SIMPLEFS instead 
of extending libfs.c. In this way only fs that need this code like 
debugfs and tracefs will load it.

Thank you,

Emanuele

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
