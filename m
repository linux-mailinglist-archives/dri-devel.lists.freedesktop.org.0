Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B886F973DD3
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 18:55:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D74F110E12F;
	Tue, 10 Sep 2024 16:55:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EjkB9ZE6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EDC110E12F;
 Tue, 10 Sep 2024 16:55:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 28DC35C03B5;
 Tue, 10 Sep 2024 16:55:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA44DC4CEC3;
 Tue, 10 Sep 2024 16:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725987344;
 bh=JScXB/yDn/yMAalsJJVsnq7kUH4Esc0s3LoE68Z1fOE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EjkB9ZE6VOjrqBUcRfRB/IGW/03aiRntCIPbyiZBeqvHxaI5jKv9MwDaEG8DDCVms
 WBhJcAiQ4Cq9+12kFHqyGjbeONBmBIgn0n72KfpVQYgC8Cyl9UroP9T+nGG3iddOaY
 zmVEODx+AgQcJsB+zhOqAoZB7x3hKqjF50j3BlxAU9gjugH8ptsITaLY+Elxlr7MZi
 CpuAiqBlceiAqOg8kIcTrYvnqA9Bp0rCsSxI84V/pvG0URubh74hfOPnisgrrcm4Vb
 x73mUjdHWviA8aqphwPn8GbvnM48SNF3nyS6Gs/iX7VRUUVMeRdWM4apgyyiY+yvcF
 habjts3Llgr0g==
Date: Tue, 10 Sep 2024 09:55:42 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org,
 "Theodore Y. Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>
Subject: Re: [PATCH RESEND v2 07/19] fscrypt: Include <linux/once.h> in
 fs/crypto/keyring.c
Message-ID: <20240910165542.GA2642@sol.localdomain>
References: <20240909075641.258968-1-ubizjak@gmail.com>
 <20240909075641.258968-8-ubizjak@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240909075641.258968-8-ubizjak@gmail.com>
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

On Mon, Sep 09, 2024 at 09:53:50AM +0200, Uros Bizjak wrote:
> Include <linux/once.h> header to allow the removal of legacy
> inclusion of <linux/prandom.h> from <linux/random.h>.
> 
> Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> Cc: Eric Biggers <ebiggers@kernel.org>
> Cc: "Theodore Y. Ts'o" <tytso@mit.edu>
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
> v2: Include <linux/once.h> instead of <linux/prandom.h>
> ---
>  fs/crypto/keyring.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/fs/crypto/keyring.c b/fs/crypto/keyring.c
> index 6681a71625f0..82fcc5683649 100644
> --- a/fs/crypto/keyring.c
> +++ b/fs/crypto/keyring.c
> @@ -22,6 +22,7 @@
>  #include <crypto/skcipher.h>
>  #include <linux/key-type.h>
>  #include <linux/random.h>
> +#include <linux/once.h>
>  #include <linux/seq_file.h>
>  
>  #include "fscrypt_private.h"

Acked-by: Eric Biggers <ebiggers@google.com>

- Eric
