Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 659D097C621
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 10:46:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2C9C10E6A5;
	Thu, 19 Sep 2024 08:46:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NHTPpAT3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5449810E6A5
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2024 08:46:23 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5367ae52a01so647535e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2024 01:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726735581; x=1727340381; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hJ12HbzQHhuObShUByJk3xORRM2O/FohuyVTNSBpDh8=;
 b=NHTPpAT3N3yMeLgZRflYUF/CuqWjD+YuMlc10Ix2nLt30wjL/vJ/x/jkj8cISbuA8v
 lNMGmR5luKXXFhqGWl577EuuzUG9OfWSZ2cMZyNR1r6REqQMbtsNWuHzAmq3+aSNhOcZ
 7b/1ocBloOvmDDOzMAmrbqa7L4aDQrpoLMnmgUGOJNxpgleofATvDJslC2zul1TQtE3y
 kOjSwmjklV8KNhVbjb/JDU8ssuVvJEjtBx2WBXE5e8bbg+9B97zRidUyfH3YRQ+Z4dNK
 eXVeuFX0J3dtHvQ9TkzCrG0v3slaGe1kc96A9KcAwfmTYPzNsjv28/A0GfQJlN4cgh05
 dVCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726735581; x=1727340381;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hJ12HbzQHhuObShUByJk3xORRM2O/FohuyVTNSBpDh8=;
 b=sG+vb+QcSXxYfn40XFAg+jbtTCZhuXgPnIJnF4yM+NROVIDSjf1RHdUTWQhYMi9tLz
 n2gWV5lWXNUiD4ID05gzRl2oKBoRreuvVCs1iavkUvzIFFMUnLzOqyd0xlY8UQJohdGx
 1IUk4p6hiWvypQADnKSC0oU1WX4q/oj7cGMRegaRkBWpY9OVYusLy9d/tP8h2RwdyPvZ
 U1jMHpBVGGYe9J3jDf54c/pxBL8JiEvUncPUBOVNgfyiYb3nGfETAxB2Kk4nsGFVw84k
 Em7FD0TvnQ3tPr1SxXQRq57/WxWe/sJDKTLsklPlr425eam9CPNSDecIjWm7P7yqK1V7
 6zrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSmrksCPZS2st8hTLK10MgILyTPn0GeSzG2PKyVq27t6enwtL+cvI1ZYDswdjcYqwAa8dtKyKCAEY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxm9w2VuOMhSNyT6Q7rAynzAitRIANzWWZBhlD1S7jh6TW0xISu
 dhtNjGO/7mJ7GYyf2mrIcTbtzf7FAXm5DF1PZbMA2lYN2B0xfFumV5/VCXOrS/w=
X-Google-Smtp-Source: AGHT+IEZElLzhpq+N2gsak+Pv41EuVKSdnqfaHqUixwI6vDwWQm809LovGIDQT7jKEi2wN/Tu8W/NA==
X-Received: by 2002:a05:6512:3ca5:b0:535:6cde:5c4d with SMTP id
 2adb3069b0e04-5367feb9b81mr13497263e87.3.1726735580856; 
 Thu, 19 Sep 2024 01:46:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-536870a86a4sm1771880e87.213.2024.09.19.01.46.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2024 01:46:19 -0700 (PDT)
Date: Thu, 19 Sep 2024 11:46:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, 
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de, 
 stable <stable@kernel.org>
Subject: Re: [PATCH v1 3/3] misc: fastrpc: Skip reference for DMA handles
Message-ID: <7ejauhf33nyt77ve26524rtvf46qohipztydjnbezlaz666cpg@3wfhpaxv3rd2>
References: <20240822105933.2644945-1-quic_ekangupt@quicinc.com>
 <20240822105933.2644945-4-quic_ekangupt@quicinc.com>
 <7q7rar7ssvzlkol46e5e4yecgt6n4b4oqueam4ywlxjeasx2dl@oydthy337t6i>
 <27ed94a1-eb60-43b1-b181-2b8270015a37@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27ed94a1-eb60-43b1-b181-2b8270015a37@quicinc.com>
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

On Thu, Sep 19, 2024 at 12:00:33PM GMT, Ekansh Gupta wrote:
> 
> 
> On 8/30/2024 3:03 PM, Dmitry Baryshkov wrote:
> > On Thu, Aug 22, 2024 at 04:29:33PM GMT, Ekansh Gupta wrote:
> >> If multiple dma handles are passed with same fd over a remote call
> >> the kernel driver takes a reference and expects that put for the
> >> map will be called as many times to free the map.
> >> But DSP only
> >> updates the fd one time in the fd list when the DSP refcount
> >> goes to zero
> > I'm sorry, I couldn't understand this phrase. Could you plese clarify
> > what do you mean here?
> DMA handle are buffers passed to DSP which are only unmapped when DSP updated
> the buffer fd in fdlist.
> fdlist implementation: misc: fastrpc: Add fdlist implementation - kernel/git/next/linux-next.git - The linux-next integration testing tree <https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/misc/fastrpc.c?id=8f6c1d8c4f0cc316b0456788fff8373554d1d99d>
> 
> A remote call payload carries both input/output buffers and dma handles. The lifetime
> of input/output buffer is a remote call which means that any buffer allocated or mapped
> for a remote call will be freed or unmapped when the remote call is completing. Whereas,
> dma handles can get freed over some other remote call whenever the DSP will update
> fdlist. So if a remote call passed multiple dma handles with same fd to DSP, on driver, ref
> count will be incremented, but DSP can update fdlist only 1 time for the same fd as DSP also
> has a ref counting happening for the dma handle and fdlist is updated when the DSP ref
> count goes to 0. In this case, the map will not get freed even though it is no longer in use.


OK, I started looking at the related code. Pleas fix possible map leak
in fastrpc_put_args(), happening if the copy_to_user() fails.

Second. Please merge fastrpc_map_lookup() + fastrpc_map_put() invocation
into a single call, effectively dropping take_ref argument from
fastrpc_map_lookup() (which can now become fastrpc_map_get()).

Now back to your patch.

Please clarify if my understanding is correct:

The driver maps dma bufs and passes them to DSP. Then once DSP firmware
finds out that a particular buffer is no longer needed, it returns
its fd via the fdlist part of the invoke_buf. As these buffers are
returned only once, when they are no longer necessary, the kernel should
not take additional references on the long-living dma-bufs.

If that's the case, see my comments below.

> >
> >> and hence kernel make put call only once for the
> >> fd. This can cause SMMU fault issue as the same fd can be used
> >> in future for some other call.
> >>
> >> Fixes: 35a82b87135d ("misc: fastrpc: Add dma handle implementation")
> >> Cc: stable <stable@kernel.org>
> >> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> >> ---
> >>  drivers/misc/fastrpc.c | 13 ++++++++-----
> >>  1 file changed, 8 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> >> index ebe828770a8d..ad56e918e1f8 100644
> >> --- a/drivers/misc/fastrpc.c
> >> +++ b/drivers/misc/fastrpc.c
> >> @@ -755,7 +755,7 @@ static const struct dma_buf_ops fastrpc_dma_buf_ops = {
> >>  
> >>  static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
> >>  				u64 va, u64 len, u32 attr,
> >> -				struct fastrpc_map **ppmap)
> >> +				struct fastrpc_map **ppmap, bool take_ref)
> >>  {
> >>  	struct fastrpc_session_ctx *sess = fl->sctx;
> >>  	struct fastrpc_map *map = NULL;
> >> @@ -763,7 +763,7 @@ static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
> >>  	struct scatterlist *sgl = NULL;
> >>  	int err = 0, sgl_index = 0;
> >>  
> >> -	if (!fastrpc_map_lookup(fl, fd, va, len, ppmap, true))
> >> +	if (!fastrpc_map_lookup(fl, fd, va, len, ppmap, take_ref))
> >>  		return 0;

Do not add the take_ref argument to fastrpc_map_create(). Instead
extract the rest of the code to the function fastrpc_map_attach() (or
something like that).

> >>  
> >>  	map = kzalloc(sizeof(*map), GFP_KERNEL);
> >> @@ -917,14 +917,17 @@ static int fastrpc_create_maps(struct fastrpc_invoke_ctx *ctx)
> >>  	int i, err;
> >>  
> >>  	for (i = 0; i < ctx->nscalars; ++i) {
> >> +		bool take_ref = true;
> >>  
> >>  		if (ctx->args[i].fd == 0 || ctx->args[i].fd == -1 ||
> >>  		    ctx->args[i].length == 0)
> >>  			continue;
> >>  
> >> +		if (i >= ctx->nbufs)
> >> +			take_ref = false;
> > Please clarify too.
> nbufs -> total input/output buffers
> nscalars -> nbufs + dma handles
> So here, avoiding ref increment for dma handles.
> >
> >>  		err = fastrpc_map_create(ctx->fl, ctx->args[i].fd,
> >>  				(u64)ctx->args[i].ptr, ctx->args[i].length,
> >> -				ctx->args[i].attr, &ctx->maps[i]);
> >> +				ctx->args[i].attr, &ctx->maps[i], take_ref);

Call conditionally either fastrpc_map_create() or fastrpc_map_attach().

> >>  		if (err) {
> >>  			dev_err(dev, "Error Creating map %d\n", err);
> >>  			return -EINVAL;
> >> @@ -1417,7 +1420,7 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
> >>  
> >>  	if (init.filelen && init.filefd) {
> >>  		err = fastrpc_map_create(fl, init.filefd, init.file,
> >> -				init.filelen, 0, &map);
> >> +				init.filelen, 0, &map, true);
> >>  		if (err)
> >>  			goto err;
> >>  	}
> >> @@ -2040,7 +2043,7 @@ static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
> >>  
> >>  	/* create SMMU mapping */
> >>  	err = fastrpc_map_create(fl, req.fd, req.vaddrin, req.length,
> >> -			0, &map);
> >> +			0, &map, true);
> >>  	if (err) {
> >>  		dev_err(dev, "failed to map buffer, fd = %d\n", req.fd);
> >>  		return err;
> >> -- 
> >> 2.34.1
> >>
> 

-- 
With best wishes
Dmitry
