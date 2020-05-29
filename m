Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B491E7A82
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 12:26:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E9A36E8BB;
	Fri, 29 May 2020 10:26:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BFE26E8BA;
 Fri, 29 May 2020 10:26:46 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C26F9206A4;
 Fri, 29 May 2020 10:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590748006;
 bh=8bEWlZvRJTJSN5EFbE7fd2XRTFiSJ+Enlo+N8agFquw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=faxcz92sMN7eOu8oBUxaAuviQDXXeCuF2ty48gOQVoG5HKyRtgx+1j3jYaEufgT4v
 ps9TDuc6AUOCKrsn9WS7bIWuM8CHQAcMiGCY1kLVP1M2yVXU9+iLCJ5JPtqGZK78wI
 pz+6O4DU0xL3evrZoQJnm3ddwYf+9VKFG7x8HgYY=
Date: Fri, 29 May 2020 12:26:44 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [PATCH 11/13] random: simplify sysctl declaration with
 register_sysctl_subdir()
Message-ID: <20200529102644.GB1345939@kroah.com>
References: <20200529074108.16928-1-mcgrof@kernel.org>
 <20200529074108.16928-12-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200529074108.16928-12-mcgrof@kernel.org>
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
Cc: jack@suse.cz, rafael@kernel.org, airlied@linux.ie, amir73il@gmail.com,
 clemens@ladisch.de, dri-devel@lists.freedesktop.org,
 joseph.qi@linux.alibaba.com, sfr@canb.auug.org.au, mark@fasheh.com,
 rdna@fb.com, yzaikin@google.com, keescook@chromium.org, arnd@arndb.de,
 intel-gfx@lists.freedesktop.org, julia.lawall@lip6.fr, jlbec@evilplan.org,
 rodrigo.vivi@intel.com, nixiaoming@huawei.com, vbabka@suse.cz, axboe@kernel.dk,
 tytso@mit.edu, linux-kernel@vger.kernel.org, ebiederm@xmission.com,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 ocfs2-devel@oss.oracle.com, viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 29, 2020 at 07:41:06AM +0000, Luis Chamberlain wrote:
> From: Xiaoming Ni <nixiaoming@huawei.com>
> 
> Move random_table sysctl from kernel/sysctl.c to drivers/char/random.c
> and use register_sysctl_subdir() to help remove the clutter out of
> kernel/sysctl.c.
> 
> Signed-off-by: Xiaoming Ni <nixiaoming@huawei.com>
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
> ---
>  drivers/char/random.c  | 14 ++++++++++++--
>  include/linux/sysctl.h |  1 -
>  kernel/sysctl.c        |  5 -----
>  3 files changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/char/random.c b/drivers/char/random.c
> index a7cf6aa65908..73fd4b6e9c18 100644
> --- a/drivers/char/random.c
> +++ b/drivers/char/random.c
> @@ -2101,8 +2101,7 @@ static int proc_do_entropy(struct ctl_table *table, int write,
>  }
>  
>  static int sysctl_poolsize = INPUT_POOL_WORDS * 32;
> -extern struct ctl_table random_table[];
> -struct ctl_table random_table[] = {
> +static struct ctl_table random_table[] = {
>  	{
>  		.procname	= "poolsize",
>  		.data		= &sysctl_poolsize,
> @@ -2164,6 +2163,17 @@ struct ctl_table random_table[] = {
>  #endif
>  	{ }
>  };
> +
> +/*
> + * rand_initialize() is called before sysctl_init(),
> + * so we cannot call register_sysctl_init() in rand_initialize()
> + */
> +static int __init random_sysctls_init(void)
> +{
> +	register_sysctl_subdir("kernel", "random", random_table);

No error checking?

:(

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
