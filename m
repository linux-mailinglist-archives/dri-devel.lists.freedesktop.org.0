Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC27245D47
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:08:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9015C89D67;
	Mon, 17 Aug 2020 07:07:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA1706E364
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Aug 2020 17:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=DLYaepasdAjeb5hNRfAs0VZ5YHZCwzeLettMOwN8AHI=; b=aEz9nrCheqHQE/gVFCLAm73c0w
 qcaCdnPks7A+2ILLxH52KbdpfYb7q+K+XZKNvh7NsFhlVjHdPfXoLvWF4xDYFljU25tS8Ow1s3MJb
 6TKgQEdAskl7OnHszwhJ+4pkbB0lArHPkO8Q/OrtGXuB+/vpEfOnzNyudK+GH6TPHnCalvTucpfsn
 ZipVfQ9jPM2ckon2gMi6uJvSnMFJn6KFmOzhKeEW9NHiT8UV6Ddr8Tc1a3h/kK8JutsrmMaBpRuI7
 /XsGPt7ejMW1nTH7JGed3ih9zy9f5tbdf+wqPTArC/e4+rlgiKw02Fiizq0SjL8iptJvZ4lM/TOeG
 Y9ZzpC1Q==;
Received: from [2601:1c0:6280:3f0::19c2]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7MYa-00088L-Cr; Sun, 16 Aug 2020 17:34:57 +0000
Subject: Re: [PATCH 3/3] staging: androind: Convert BUG() to WARN()
To: Tomer Samara <tomersamara98@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <cover.1597597955.git.tomersamara98@gmail.com>
 <8df6206000524d4a0043a7a1df97b2be2d277995.1597597955.git.tomersamara98@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <df5e2206-51be-3fc7-ddc2-6f318a8e5a1a@infradead.org>
Date: Sun, 16 Aug 2020 10:34:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8df6206000524d4a0043a7a1df97b2be2d277995.1597597955.git.tomersamara98@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:42 +0000
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
Cc: devel@driverdev.osuosl.org, Todd Kjos <tkjos@android.com>,
 Martijn Coenen <maco@android.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Joel Fernandes <joel@joelfernandes.org>,
 Riley Andrews <riandrews@android.com>,
 =?UTF-8?Q?Arve_Hj=c3=b8nnev=c3=a5g?= <arve@android.com>,
 Hridya Valsaraju <hridya@google.com>, Laura Abbott <labbott@redhat.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/16/20 10:22 AM, Tomer Samara wrote:
> replace BUG() with WARN() at ion_sytem_heap.c, this
> fix the following checkpatch issue:
> Avoid crashing the kernel - try using WARN_ON &
> recovery code ratherthan BUG() or BUG_ON().
> 
> Signed-off-by: Tomer Samara <tomersamara98@gmail.com>
> ---
>  drivers/staging/android/ion/ion_system_heap.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/android/ion/ion_system_heap.c b/drivers/staging/android/ion/ion_system_heap.c
> index eac0632ab4e8..37065a59ca69 100644
> --- a/drivers/staging/android/ion/ion_system_heap.c
> +++ b/drivers/staging/android/ion/ion_system_heap.c
> @@ -30,7 +30,8 @@ static int order_to_index(unsigned int order)
>  	for (i = 0; i < NUM_ORDERS; i++)
>  		if (order == orders[i])
>  			return i;
> -	BUG();
> +
> +	WARN(1, "%s: Did not found index to order %d", __FUNCTION__, order);
>  	return -1;
>  }

Hi,
Did you look at what happens when order_to_index() returns -1
to its callers?


Also: fix spelling in Subjects: android and BUG/BUG_ON

-- 
~Randy

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
