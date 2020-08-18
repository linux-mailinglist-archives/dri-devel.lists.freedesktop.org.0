Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 427F32486C4
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 16:11:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81A3A8857E;
	Tue, 18 Aug 2020 14:11:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC938857E
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 14:11:06 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D322E207FF;
 Tue, 18 Aug 2020 14:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597759866;
 bh=DzJlUfzeP0TeP+vMc/ad4LTrDoiIKji4+B8EHTU9I/A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gCPJn/wrcQ95a8TPz+YUVrgTmkvhitNJeu5xmHCElpo4dCNdiPzpvIxo+MXFEO1GF
 a3LVKzU7+aTXg5jVnxwH3LDejNJzX2b+wC11ikAOnDwHbeRfcBcBoKgSmn42TtuqoH
 mmjzET9NHi2j3wASZIxa364MtTW6kbTCRGoFdVTA=
Date: Tue, 18 Aug 2020 16:11:29 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Tomer Samara <tomersamara98@gmail.com>
Subject: Re: [PATCH v2 3/4] staging: android: Convert BUG to WARN
Message-ID: <20200818141129.GC562377@kroah.com>
References: <cover.1597602783.git.tomersamara98@gmail.com>
 <3a483158a742a38589c8322e96fc00734da441d9.1597602783.git.tomersamara98@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3a483158a742a38589c8322e96fc00734da441d9.1597602783.git.tomersamara98@gmail.com>
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
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
 Hridya Valsaraju <hridya@google.com>, Laura Abbott <labbott@redhat.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Aug 16, 2020 at 10:30:10PM +0300, Tomer Samara wrote:
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

Same question as before, I think this didn't really change anything :(

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
