Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2CD938A3A
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 09:39:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE8B610E3AD;
	Mon, 22 Jul 2024 07:39:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LfywjiTh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D15EC10E3AD
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 07:39:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id ED09E60AC1;
 Mon, 22 Jul 2024 07:39:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47D40C116B1;
 Mon, 22 Jul 2024 07:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1721633980;
 bh=824pP1iK9VhmN65PhNriTvUG1w+JpngpsQe+FpwGwx4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LfywjiThkIMmuOu2ytMk7TmnpAbwvnez32yMdeHyPuY//m8+VdsGqMag0uzhYZdk8
 p7KHnlZD/ZrWTXHId21I6hUsq1xK3pSQhoXtdk4dfPIV6Z6y/aZ2amWc7kZbMVinKs
 F102SNTVfRQJBnSEpCK8pDG8J1Hx/vLfGND2xyZg=
Date: Mon, 22 Jul 2024 09:39:37 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
 arnd@arndb.de, stable <stable@kernel.org>
Subject: Re: [PATCH v5 1/2] misc: fastrpc: Define a new initmem size for user
 PD
Message-ID: <2024072227-purposely-swinger-86ad@gregkh>
References: <20240722055437.3467900-1-quic_ekangupt@quicinc.com>
 <20240722055437.3467900-2-quic_ekangupt@quicinc.com>
 <2024072234-slug-payer-2dec@gregkh>
 <607362f2-8ae5-46bd-a3a4-2d78da98b12a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <607362f2-8ae5-46bd-a3a4-2d78da98b12a@quicinc.com>
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

On Mon, Jul 22, 2024 at 11:42:52AM +0530, Ekansh Gupta wrote:
> 
> 
> On 7/22/2024 11:28 AM, Greg KH wrote:
> > On Mon, Jul 22, 2024 at 11:24:36AM +0530, Ekansh Gupta wrote:
> >> For user PD initialization, initmem is allocated and sent to DSP for
> >> initial memory requirements like shell loading. The size of this memory
> >> is decided based on the shell size that is passed by the user space.
> >> With the current implementation, a minimum of 2MB is always allocated
> >> for initmem even if the size passed by user is less than that. For this
> >> a MACRO is being used which is intended for shell size bound check.
> >> This minimum size of 2MB is not recommended as the PD will have very
> >> less memory for heap and will have to request HLOS again for memory.
> >> Define a new macro for initmem minimum length of 3MB.
> >>
> >> Fixes: d73f71c7c6ee ("misc: fastrpc: Add support for create remote init process")
> >> Cc: stable <stable@kernel.org>
> >> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> >> ---
> >>  drivers/misc/fastrpc.c | 3 ++-
> >>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> >> index a7a2bcedb37e..a3a5b745936e 100644
> >> --- a/drivers/misc/fastrpc.c
> >> +++ b/drivers/misc/fastrpc.c
> >> @@ -39,6 +39,7 @@
> >>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
> >>  #define FASTRPC_CTXID_MASK (0xFF0)
> >>  #define INIT_FILELEN_MAX (2 * 1024 * 1024)
> >> +#define FASTRPC_INITLEN_MIN (3 * 1024 * 1024)
> > Meta-comment, for a future change, why not tabs to line things up?
> Sure, I'll add a comment.

I didn't say anything about comments :(

> Should I line up all the MACRO definitions? If yes, should I send it as a separate patch?

As I said, yes, for a future change.

> > How was this tested?
> This is tested with fastrpc use cases available in hexagon SDK:
> https://developer.qualcomm.com/software/hexagon-dsp-sdk/sample-apps

Do you have regression tests that attempt to check the boundry
conditions and alignment here?

thanks,

greg k-h
