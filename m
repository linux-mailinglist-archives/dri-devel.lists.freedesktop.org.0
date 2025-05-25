Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B16D3AC3365
	for <lists+dri-devel@lfdr.de>; Sun, 25 May 2025 11:23:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 799C610E0CA;
	Sun, 25 May 2025 09:23:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MssJ1DTl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90C3B10E0D2
 for <dri-devel@lists.freedesktop.org>; Sun, 25 May 2025 09:23:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B612845109;
 Sun, 25 May 2025 09:23:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AD81C4CEED;
 Sun, 25 May 2025 09:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748165022;
 bh=8xJ/4cJzkengF8ieK0oPHmswKBr0WzC4IkIOgHiz8OY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MssJ1DTlorerzrvBZ0h4vsvrIEFfdcrfkqEUa2npxXjrdxEMK7wbDqdR5lHNfNcLD
 tu0B7WAPk+NpFWNPAreGfoyUJ8JJ9O2pvIkTJ9CfYSmibOjh/DGPYhGP067DDmnnzy
 yppRkwTZAED4PSUxIkMUbyeTWL1keMWrSPcSTanp/PrmuNHhK5p8QRusrfjBJhzvJv
 1793QewmP6CGsO0FjgNnWhIBD3WYK9SFox4uzhaV2eb3yfZBFY6cB7ooxROezwGjDb
 dnyXiZeM1qQKpNat8UKWUaOOV5FP+Yzo5E6Ff6BCxQW7BWAB0zyUANLZOWOTJikBuI
 jdvyzQ2bRHfiQ==
Date: Sun, 25 May 2025 10:23:31 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Markus Burri <markus.burri@mt.com>
Cc: linux-kernel@vger.kernel.org, Mahesh J Salgaonkar
 <mahesh@linux.ibm.com>, "Oliver O'Halloran" <oohall@gmail.com>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, Jacek
 Lawrynowicz <jacek.lawrynowicz@linux.intel.com>, Maciej Falkowski
 <maciej.falkowski@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, Linus
 Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Nuno Sa <nuno.sa@analog.com>, Olivier Moysan <olivier.moysan@foss.st.com>,
 Lars-Peter Clausen <lars@metafoo.de>, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org,
 linux-iio@vger.kernel.org, Markus Burri <markus.burri@bbv.ch>
Subject: Re: [PATCH v4 3/6] iio: fix potential out-of-bound write
Message-ID: <20250525102331.46a4d778@jic23-huawei>
In-Reply-To: <20250508130612.82270-4-markus.burri@mt.com>
References: <20250508130612.82270-1-markus.burri@mt.com>
 <20250508130612.82270-4-markus.burri@mt.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu,  8 May 2025 15:06:09 +0200
Markus Burri <markus.burri@mt.com> wrote:

> The buffer is set to 20 characters. If a caller write more characters,
> count is truncated to the max available space in "simple_write_to_buffer".
> To protect from OoB access, check that the input size fit into buffer and
> add a zero terminator after copy to the end of the copied data.
> 
> Signed-off-by: Markus Burri <markus.burri@mt.com>
> ---
Applied to the fixes-togreg branch of iio.git.

I'd still like some more eyes on this if anyone has time though as
experience teaches me that subtle tweaks to string manipulation end
conditions are easy places to make mistakes!

I'll not be pushing out as non rebasing until I rebase on rc1 anyway
so we have time.

Thanks,

Jonathan

>  drivers/iio/industrialio-core.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-core.c
> index b9f4113ae5fc..ebf17ea5a5f9 100644
> --- a/drivers/iio/industrialio-core.c
> +++ b/drivers/iio/industrialio-core.c
> @@ -410,12 +410,15 @@ static ssize_t iio_debugfs_write_reg(struct file *file,
>  	char buf[80];
>  	int ret;
>  
> +	if (count >= sizeof(buf))
> +		return -EINVAL;
> +
>  	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, userbuf,
>  				     count);
>  	if (ret < 0)
>  		return ret;
>  
> -	buf[count] = '\0';
> +	buf[ret] = '\0';
>  
>  	ret = sscanf(buf, "%i %i", &reg, &val);
>  

