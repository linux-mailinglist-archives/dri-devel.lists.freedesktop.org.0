Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEB91B0D96
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 16:00:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAB9C6E28A;
	Mon, 20 Apr 2020 14:00:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF9226E28A
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 14:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587391234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ap4e89Z5vNdiNiGm/tjhzWgeUaBL0Wv/6U7AnurRbQ0=;
 b=hQCbZHoO5lkun0oPj9348wVbvz3Y2CVFm92AV0ujH85+h2w3AZkhFBhi4M2WvxHvEnB5Si
 zzf6o1i3Hpf4VyBitTIzcgkrqXU/ts22Ni28KOxTW/vB1bAU7Q27lC9d44zC+9YIfzGQSG
 zIf6+5e7WN3XzGemJrD+Rtnd+b2VsVs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-n5yBG0g_PUWPrtDLPgvJzA-1; Mon, 20 Apr 2020 10:00:25 -0400
X-MC-Unique: n5yBG0g_PUWPrtDLPgvJzA-1
Received: by mail-wr1-f70.google.com with SMTP id t8so5692090wrq.22
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 07:00:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ap4e89Z5vNdiNiGm/tjhzWgeUaBL0Wv/6U7AnurRbQ0=;
 b=s+pjM/VQ5OXX0y85NCstArv8KkfVz4LdsWRYGT1uDLWN9OvpXwnB1my5wNH77WD/pT
 1WhlB7UEuph9r+1XMjItNfyHJrLLrUjxp89j2/tqTfpR8TEI0zAqj0H8Sk6laY7ro/rV
 8AIPGxu4vwVGiiP1Xgwekb3WaZtyKfafIEFSIUUdemtlYN8FliDfCHhQ9R39R3IVj3w2
 pp8sDa+yoEU0ENgh69aqH0dgvStKb/TJGYnR9uYAjmaD+tbzFJOV1rIe6F77ldZ59IPU
 ++/gXe/HUMztxLLzfapon1KWI0OBqKAJzhw7nIs5Q4l2SMeQ7255AQ6EByurpvpXpRnP
 idng==
X-Gm-Message-State: AGi0PuaIH/ONmTm78etkG4KMNXPIcRuc4qEWXlqpIm3qKpISiF+tu+jr
 uEaTatnyW1ROMaY8J+pUDIXWzKCblwKivF0Uk8jnm+Nf+5lbtcjxXDXg/xKLDR6fJB6vdZq+SlE
 +SErlsTq3m+5i2ZsvyePd6qFaR2iE
X-Received: by 2002:a5d:60ca:: with SMTP id x10mr18569364wrt.407.1587391224624; 
 Mon, 20 Apr 2020 07:00:24 -0700 (PDT)
X-Google-Smtp-Source: APiQypLuajiTV7NEgCOZK10Fc0BkrmLxAQ9cfXlRSa6GAO61DcTGLWRq8QjX/dO+TqmoPL2oG86JsA==
X-Received: by 2002:a5d:60ca:: with SMTP id x10mr18569290wrt.407.1587391224344; 
 Mon, 20 Apr 2020 07:00:24 -0700 (PDT)
Received: from localhost.localdomain ([194.230.155.102])
 by smtp.gmail.com with ESMTPSA id p5sm1511446wrg.49.2020.04.20.07.00.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2020 07:00:23 -0700 (PDT)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH 1/8] apparmor: just use vfs_kern_mount to make .null
To: Luis Chamberlain <mcgrof@kernel.org>,
 Goldwyn Rodrigues <goldwynr@gmail.com>
References: <20200414124304.4470-1-eesposit@redhat.com>
 <20200414124304.4470-2-eesposit@redhat.com>
 <20200416064405.GP11244@42.do-not-panic.com>
Message-ID: <b5065645-1f80-27cb-52bd-a7748493967b@redhat.com>
Date: Mon, 20 Apr 2020 16:00:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200416064405.GP11244@42.do-not-panic.com>
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
 linux-s390@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Andrew Donnellan <ajd@linux.ibm.com>,
 Matthew Garrett <matthew.garrett@nebula.com>, linux-efi@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Daniel Borkmann <daniel@iogearbox.net>,
 Christian Borntraeger <borntraeger@de.ibm.com>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Mark Fasheh <mark@fasheh.com>,
 Anton Vorontsov <anton@enomsg.org>, John Fastabend <john.fastabend@gmail.com>,
 James Morris <jmorris@namei.org>, Ard Biesheuvel <ardb@kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>,
 Yonghong Song <yhs@fb.com>, Ian Kent <raven@themaw.net>,
 Andrii Nakryiko <andriin@fb.com>, Alexey Dobriyan <adobriyan@gmail.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, netdev@vger.kernel.org,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/16/20 8:44 AM, Luis Chamberlain wrote:
> On Tue, Apr 14, 2020 at 02:42:55PM +0200, Emanuele Giuseppe Esposito wrote:
>> aa_mk_null_file is using simple_pin_fs/simple_release_fs with local
>> variables as arguments, for what would amount to a simple
>> vfs_kern_mount/mntput pair if everything was inlined.  Just use
>> the normal filesystem API since the reference counting is not needed
>> here.
> 
> *Why* is refcounting not needed here?

The refcount is a local variable and is always 0 on entry and exit, so 
it is not necessary to have refcounting across function invocations, 
such as what simple_pin_fs and simple_release_fs provide.

Thank you,

Emanuele
> 
>     Luis
> 
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>   security/apparmor/apparmorfs.c | 12 ++++++------
>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.c
>> index 280741fc0f5f..828bb1eb77ea 100644
>> --- a/security/apparmor/apparmorfs.c
>> +++ b/security/apparmor/apparmorfs.c
>> @@ -2525,14 +2525,14 @@ struct path aa_null;
>>   
>>   static int aa_mk_null_file(struct dentry *parent)
>>   {
>> -	struct vfsmount *mount = NULL;
>> +	struct file_system_type *type = parent->d_sb->s_type;
>> +	struct vfsmount *mount;
>>   	struct dentry *dentry;
>>   	struct inode *inode;
>> -	int count = 0;
>> -	int error = simple_pin_fs(parent->d_sb->s_type, &mount, &count);
>>   
>> -	if (error)
>> -		return error;
>> +	mount = vfs_kern_mount(type, SB_KERNMOUNT, type->name, NULL);
>> +	if (IS_ERR(mount))
>> +		return PTR_ERR(mount);
>>   
>>   	inode_lock(d_inode(parent));
>>   	dentry = lookup_one_len(NULL_FILE_NAME, parent, strlen(NULL_FILE_NAME));
>> @@ -2561,7 +2561,7 @@ static int aa_mk_null_file(struct dentry *parent)
>>   	dput(dentry);
>>   out:
>>   	inode_unlock(d_inode(parent));
>> -	simple_release_fs(&mount, &count);
>> +	mntput(mount);
>>   	return error;
>>   }
>>   
>> -- 
>> 2.25.2
>>
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
