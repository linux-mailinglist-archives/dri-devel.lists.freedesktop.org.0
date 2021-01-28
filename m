Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6437A307ED2
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 20:45:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3422B6EA11;
	Thu, 28 Jan 2021 19:44:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 093506E216
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 18:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=WSA088UCU7vJ5O65853k6/CtLpkKovycTSMZnSw4wKM=; b=JNPamV4aYcwctosSBhjDc7FxuX
 4W/9tpZ+gRaZ2oeuPrKgdORGVPoObm6F2rtvqYgr8hld71klOQdyt4S9tb+LNVkxSMaBSxbgaIfIa
 doVye5nMckEHsOLvuLcvyOXD+kqKlhNIHq9IA9DzPKPAsVzC/2XzCE35OjNslnRqZ7CqJlM/smv94
 TTbdoGcF3RYGIuxB7FPgVsykFdladNfnk19iAWrQjqzUEK4Uqjv7lSuIawzJsuQTloUsI/wudGrba
 TsbVVIzXBRUQSykSVOxgUbeaYP+NBIj+sQfJVp9+tDM4U74a2GkgR/QZcagZW7hfOHyBmoV9MUFSD
 6CcNoNaA==;
Received: from [2601:1c0:6280:3f0::7650]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5CQ0-0003tf-7R; Thu, 28 Jan 2021 18:53:24 +0000
Subject: Re: [PATCH 2/2] dmabuf: Add dmabuf inode no to fdinfo
To: Kalesh Singh <kaleshsingh@google.com>
References: <20210128182432.2216573-1-kaleshsingh@google.com>
 <20210128182432.2216573-3-kaleshsingh@google.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <6fa38691-f5ba-6993-82a8-88836d8345a2@infradead.org>
Date: Thu, 28 Jan 2021 10:53:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210128182432.2216573-3-kaleshsingh@google.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 28 Jan 2021 19:44:35 +0000
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
Cc: dri-devel@lists.freedesktop.org, Andrei Vagin <avagin@gmail.com>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Michel Lespinasse <walken@google.com>, jeffv@google.com,
 kernel-team@android.com, Alexey Dobriyan <adobriyan@gmail.com>,
 linux-media@vger.kernel.org, keescook@chromium.org, jannh@google.com,
 linaro-mm-sig@lists.linaro.org, linux-fsdevel@vger.kernel.org,
 Bernd Edlinger <bernd.edlinger@hotmail.de>, surenb@google.com,
 Vlastimil Babka <vbabka@suse.cz>, Alexey Gladkov <gladkov.alexey@gmail.com>,
 linux-kernel@vger.kernel.org, minchan@kernel.org,
 Yafang Shao <laoar.shao@gmail.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>, hridya@google.com,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/28/21 10:24 AM, Kalesh Singh wrote:
> The dmabuf inode number allows userspace to uniquely identify the buffer
> and avoids a dependency on /proc/<pid>/fd/* when accounting per-process
> DMA buffer sizes.
> 
> Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
> ---
>  drivers/dma-buf/dma-buf.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 9ad6397aaa97..d869099ede83 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -414,6 +414,7 @@ static void dma_buf_show_fdinfo(struct seq_file *m, struct file *file)
>  {
>  	struct dma_buf *dmabuf = file->private_data;
>  
> +	seq_printf(m, "dmabuf_inode_no:\t%lu\n", file_inode(file)->i_ino);
>  	seq_printf(m, "size:\t%zu\n", dmabuf->size);
>  	/* Don't count the temporary reference taken inside procfs seq_show */
>  	seq_printf(m, "count:\t%ld\n", file_count(dmabuf->file) - 1);
> 

Hi,

The subject is a little confusing.
It seems to say that the dmabuf inode no is being added to /proc/<pid>/fdino,
but looking at the code, it is being added to /proc/dmabuf (or /proc/<pid>/dmabuf).

Please clarify.

and is the /proc file format documented anywhere?


thanks.

-- 
~Randy

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
