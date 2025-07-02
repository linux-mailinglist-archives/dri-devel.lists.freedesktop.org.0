Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EBCAF646F
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 23:56:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7102210E799;
	Wed,  2 Jul 2025 21:56:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="a0ea98PJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C135F10E719;
 Wed,  2 Jul 2025 14:12:35 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-74b56b1d301so376092b3a.1; 
 Wed, 02 Jul 2025 07:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751465555; x=1752070355; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3hi0b4Q2TMU9s9ow4O1FxnYpGW2LdSH037wzbnfcLAI=;
 b=a0ea98PJVNFGMl9rm2Yx4zynXvpGTlKl7yja1L7C5lWVhBWOwcIRJISletb4tK7NYw
 85oRHMS/9/HdPL4XzB8NQozztXScjtGlNErvnv9xy35fRrhlwwmnqV6yZU0hYP23QClT
 bVpA7usDKeDsah/lbG58U9X7/LKIj8vp4tFcNGysnAI6sadMSH11SSVWnBlnjDD5dAPY
 G2zFd5h5fvKnXtGKogUnNmWSdPJtRLEy4qyjKc5mHVpNXw66x7vJyrcBhQskuXJc657o
 /1BrT97/ZOuSIcShqS8v7IfxE5YoHsQzBFwCXfdiu3PhSu+IM2Vw4eOuiSSXyv9qrloS
 fXtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751465555; x=1752070355;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3hi0b4Q2TMU9s9ow4O1FxnYpGW2LdSH037wzbnfcLAI=;
 b=RbD9AwoBjgLawzq1b3zId6BqXSyW3iBXQ+E9PxwiIhXObjyJqHsUv6YGWvr6/HQW0n
 hXKelZM/m3DbFm9lHZPaqP+NmSHGpbasV41b0eKKDLhRRVxrI9MlYhdlrifc7QtHbjUi
 5MnQ8+yV0drNYv2fuD+Ud0LmH01HIPKE9Y9KnfztvhFkFAeyrOOYVHDQa5ponsja1cgi
 g1MPPHI6dyQwDQW/nm0KTge/WwnquP3bEidbBYMU74j88Rwnfs59ED/7eeuDNc4OlpbZ
 3fA6kmpmks2XiWuOlRqZ4F+8hR4OtY6SLIds05WMY7NNhi8hsi1FQgQhXWVEew+oBUus
 DVrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJykqWPNAt2XplixvWI62ZlzWspJvFncznK7eKukaYpsS5yhu6QF5h7RnTxaJ12t2RyXBMR9zgHJ4=@lists.freedesktop.org,
 AJvYcCVXw+owGl06MgFFTSh/c3teHMWpMj6LavPHXpQcrdftrTOwzJNWFpafWkWLJtIO06erUkQaNEsb3lgq@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4vlVhZOupxe9/zt/gZh/W1Re72vYXLOUg6JpnyHdtOjNGVRxf
 OolzclIxnBnfroM991xSZW5MeMlWkJiAMx2hS4BV5htQlpQ7ysmg3Oq1
X-Gm-Gg: ASbGncvt/zijfjErm/IpETRm3S+mhB2MYQgD7+Sh+DQeFCUJ2RcffwLFoQTc/JLhrrx
 /0zK3cedeQjkh4kXoUXxy6WLJKCHAJOUJE6yZLRZg8nKvaJ32GdRGm0n5fx7q/4bVarx7i6BOmr
 LxHff6iWN408kzTUprGzIygFVkWYhA5DbqIdxY06zJr616Rsc4YfpWVvvcmGHDY7j6SSFZBbPEF
 Wf/wuymxNce1wGEMLs/zKzeCmHsIHCWxF0cn5X4g+ir3tpQnhHiYqwZ7fSMJ47eUOfptItDVHIv
 D9HOktGBSg0ygmzGrzDwWsJgkbN28v3y/qitN3Elt/waJ4LYxiXG5+026INz9I+DfW4PSpCgnkY
 mfTLbnkdPpFP0aU0xO0t2LS17PjdXkGI7eZQHles=
X-Google-Smtp-Source: AGHT+IFKRDLioih13g48ycaXA5K8ysUyKk1vSQvjV96+wwiKTloc/oO2WVx/lFSAoNhOajXgeeSAFQ==
X-Received: by 2002:a05:6a20:a126:b0:21d:fd1:9be with SMTP id
 adf61e73a8af0-222d7de1c90mr4563817637.12.1751465555071; 
 Wed, 02 Jul 2025 07:12:35 -0700 (PDT)
Received: from ?IPV6:240e:305:798e:6800:ad23:906d:e07c:8a1e?
 ([240e:305:798e:6800:ad23:906d:e07c:8a1e])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af56ce9f3sm14100034b3a.122.2025.07.02.07.12.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 07:12:34 -0700 (PDT)
Message-ID: <54a85ec6-992d-4685-9031-114ba634e0a3@gmail.com>
Date: Wed, 2 Jul 2025 22:12:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] fs: change write_begin/write_end interface to take
 struct kiocb *
To: Matthew Wilcox <willy@infradead.org>
Cc: "tytso@mit.edu" <tytso@mit.edu>, "hch@infradead.org" <hch@infradead.org>, 
 "adilger.kernel@dilger.ca" <adilger.kernel@dilger.ca>,
 "brauner@kernel.org" <brauner@kernel.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 "tursulin@ursulin.net" <tursulin@ursulin.net>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "chentao325@qq.com" <chentao325@qq.com>,
 "frank.li@vivo.com" <frank.li@vivo.com>
References: <20250627110257.1870826-1-chentaotao@didiglobal.com>
 <20250627110257.1870826-4-chentaotao@didiglobal.com>
 <aF68sKzx24P1q54h@casper.infradead.org>
From: Taotao Chen <chentt325@gmail.com>
In-Reply-To: <aF68sKzx24P1q54h@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 02 Jul 2025 21:56:20 +0000
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


在 2025/6/27 23:45, Matthew Wilcox 写道:
> On Fri, Jun 27, 2025 at 11:03:11AM +0000, 陈涛涛 Taotao Chen wrote:
>> diff --git a/fs/exfat/file.c b/fs/exfat/file.c
>> index 841a5b18e3df..fdc2fa1e5c41 100644
>> --- a/fs/exfat/file.c
>> +++ b/fs/exfat/file.c
>> @@ -532,10 +532,12 @@ int exfat_file_fsync(struct file *filp, loff_t start, loff_t end, int datasync)
>>   	return blkdev_issue_flush(inode->i_sb->s_bdev);
>>   }
>>   
>> -static int exfat_extend_valid_size(struct file *file, loff_t new_valid_size)
>> +static int exfat_extend_valid_size(const struct kiocb *iocb,
>> +				   loff_t new_valid_size)
>>   {
>>   	int err;
>>   	loff_t pos;
>> +	struct file *file = iocb->ki_filp;
>>   	struct inode *inode = file_inode(file);
>>   	struct exfat_inode_info *ei = EXFAT_I(inode);
>>   	struct address_space *mapping = inode->i_mapping;
>> @@ -551,14 +553,14 @@ static int exfat_extend_valid_size(struct file *file, loff_t new_valid_size)
>>   		if (pos + len > new_valid_size)
>>   			len = new_valid_size - pos;
>>   
>> -		err = ops->write_begin(file, mapping, pos, len, &folio, NULL);
>> +		err = ops->write_begin(iocb, mapping, pos, len, &folio, NULL);
>>   		if (err)
>>   			goto out;
>>   
>>   		off = offset_in_folio(folio, pos);
>>   		folio_zero_new_buffers(folio, off, off + len);
>>   
>> -		err = ops->write_end(file, mapping, pos, len, len, folio, NULL);
>> +		err = ops->write_end(iocb, mapping, pos, len, len, folio, NULL);
>>   		if (err < 0)
>>   			goto out;
>>   		pos += len;
>> @@ -604,7 +606,7 @@ static ssize_t exfat_file_write_iter(struct kiocb *iocb, struct iov_iter *iter)
>>   	}
>>   
>>   	if (pos > valid_size) {
>> -		ret = exfat_extend_valid_size(file, pos);
>> +		ret = exfat_extend_valid_size(iocb, pos);
>>   		if (ret < 0 && ret != -ENOSPC) {
>>   			exfat_err(inode->i_sb,
>>   				"write: fail to zero from %llu to %llu(%zd)",
>> @@ -655,8 +657,11 @@ static vm_fault_t exfat_page_mkwrite(struct vm_fault *vmf)
>>   	struct file *file = vma->vm_file;
>>   	struct inode *inode = file_inode(file);
>>   	struct exfat_inode_info *ei = EXFAT_I(inode);
>> +	struct kiocb iocb;
>>   	loff_t start, end;
>>   
>> +	init_sync_kiocb(&iocb, file);
>> +
>>   	if (!inode_trylock(inode))
>>   		return VM_FAULT_RETRY;
>>   
>> @@ -665,7 +670,7 @@ static vm_fault_t exfat_page_mkwrite(struct vm_fault *vmf)
>>   			start + vma->vm_end - vma->vm_start);
>>   
>>   	if (ei->valid_size < end) {
>> -		err = exfat_extend_valid_size(file, end);
>> +		err = exfat_extend_valid_size(&iocb, end);
>>   		if (err < 0) {
>>   			inode_unlock(inode);
>>   			return vmf_fs_error(err);
> This is unnecessary work.  The only ->write_begin/write_end that we'll
> see here is exfat_write_begin() / exfat_write_end() which don't actually
> need iocb (or file).  Traditionally we pass NULL in these situations,
> but the exfat people probably weren't aware of this convention.
>
> exfat_extend_valid_size() only uses the file it's passed to get the
> inode, and both callers already have the inode.  So I'd change
> exfat_extend_valid_size() to take an inode instead of a file as its
> first argument, then you can skip the creation of an iocb in
> exfat_page_mkwrite().


My initial goal was to maintain consistency with the updated ->write_begin/

->write_end interfaces. That meant passing the iocb to avoid special cases

and keep the changes minimal and safe.

But you're right, since exfat_write_begin() and exfat_write_end() don't 
use the

iocb or file pointer, passing NULL is fine, and having 
exfat_extend_valid_size()

directly take an inode makes the code simpler and clearer.


In addition, inside the ntfs_extend_initialized_size() function, I also 
set the iocb

parameter to NULL when calling ntfs_write_begin() and ntfs_write_end().



