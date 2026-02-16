Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EqGDl2VkmnguwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 04:56:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C05E140CAF
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 04:56:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E09010E021;
	Mon, 16 Feb 2026 03:56:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Pbbf+85o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9134510E021
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 03:56:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E1C64409A5;
 Mon, 16 Feb 2026 03:56:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDED3C116C6;
 Mon, 16 Feb 2026 03:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771214167;
 bh=vBwVPkXHaAloXeyRNqYtL278gpP2AT8kuV0aHkehyJo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Pbbf+85o/bDwYQbt/j0GlE/sgl4LWPxO0soJKbz29+vgbCJGiDR3ZVZ88XxF0j17Q
 1ZpNfUURpcI8yEef37fKarBJYCZmoCxmCXiEiF0f6+1+gus55Uqp7H6Y8AI81RxcQ+
 9XdsAUgZhVPH43WnWNqfOxDh/mdAuyI9XFm8jkUYxbU6/ObmPGsh5rHvC5KaLqFUvz
 Ug+zwI1e8ixk2+0hrFnxOzw0NHZCDrlXwzlVUzwQFpK7hv2lzuu5pXp3AK2TUgvkyY
 /c4U6kaL+NpnC2anJNGOTr+ersBZG4sse3pgAHHEmRWELO/jsoERjDVn5ZleCROSDu
 HcAM4KBdi3g8A==
Date: Sun, 15 Feb 2026 21:56:05 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org, 
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, 
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de, 
 dmitry.baryshkov@oss.qualcomm.com
Subject: Re: [PATCH v6 1/4] misc: fastrpc: Move fdlist to invoke context
 structure
Message-ID: <uzhuta6ukkf5k3za6kzf24zsf6nwvneyrlaezte6z42ggok56w@nd4cdiqizld2>
References: <20260215182136.3995111-1-ekansh.gupta@oss.qualcomm.com>
 <20260215182136.3995111-2-ekansh.gupta@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260215182136.3995111-2-ekansh.gupta@oss.qualcomm.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ekansh.gupta@oss.qualcomm.com,m:srini@kernel.org,m:linux-arm-msm@vger.kernel.org,m:gregkh@linuxfoundation.org,m:quic_bkumar@quicinc.com,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:arnd@arndb.de,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andersson@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[131.252.210.177:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[100.75.92.58:received];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 9C05E140CAF
X-Rspamd-Action: no action

On Sun, Feb 15, 2026 at 11:51:32PM +0530, Ekansh Gupta wrote:
> The fdlist is currently part of the meta buffer,

Do you mean "already part of"?

> computed during
> put_args.

The only "computation" I can see wrt fdlist in fastrpc_put_args() is
where we calculate it to be at pages + inbufs + outbufs + handles.

So, why do you say that the content of the meta buffer is calculated
there? Did you mean fastrpc_get_args()?

PS. Use full function names and suffix them with (), to be clear in your
description.

> This leads to code duplication when preparing and reading
> critical meta buffer contents used by the FastRPC driver.

"used by the whole entire FastRPC driver" is rather broad... 

As far as I can tell, the thing this patch is doing is caching the
"fdlist" address, to avoid having to derive "pages" (and thereby
indirectly "list"), "outbufs", "handles", and then sum these up.

> 
> Move fdlist to the invoke context structure to improve maintainability
> and reduce redundancy. This centralizes its handling and simplifies
> meta buffer preparation and reading logic.

I think the patch looks good, but your commit message is too high-level
sales pitch.

Describe the specific problem that you're solving (i.e. you're
recalculating the offset which was known at the time of
fastrpc_get_args()) and leave it at that.

> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 16 +++++-----------
>  1 file changed, 5 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 4f5a79c50f58..ce397c687161 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -233,6 +233,7 @@ struct fastrpc_invoke_ctx {
>  	int pid;
>  	int client_id;
>  	u32 sc;
> +	u64 *fdlist;
>  	u32 *crc;
>  	u64 ctxid;
>  	u64 msg_sz;
> @@ -1018,6 +1019,7 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
>  	rpra = ctx->buf->virt;
>  	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
>  	pages = fastrpc_phy_page_start(list, ctx->nscalars);
> +	ctx->fdlist = (u64 *)(pages + ctx->nscalars);
>  	args = (uintptr_t)ctx->buf->virt + metalen;
>  	rlen = pkt_size - metalen;
>  	ctx->rpra = rpra;
> @@ -1120,18 +1122,10 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
>  	union fastrpc_remote_arg *rpra = ctx->rpra;
>  	struct fastrpc_user *fl = ctx->fl;
>  	struct fastrpc_map *mmap = NULL;
> -	struct fastrpc_invoke_buf *list;
> -	struct fastrpc_phy_page *pages;
> -	u64 *fdlist;
> -	int i, inbufs, outbufs, handles;
> +	int i, inbufs;
>  	int ret = 0;
>  
>  	inbufs = REMOTE_SCALARS_INBUFS(ctx->sc);
> -	outbufs = REMOTE_SCALARS_OUTBUFS(ctx->sc);
> -	handles = REMOTE_SCALARS_INHANDLES(ctx->sc) + REMOTE_SCALARS_OUTHANDLES(ctx->sc);
> -	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
> -	pages = fastrpc_phy_page_start(list, ctx->nscalars);
> -	fdlist = (uint64_t *)(pages + inbufs + outbufs + handles);
>  
>  	for (i = inbufs; i < ctx->nbufs; ++i) {
>  		if (!ctx->maps[i]) {
> @@ -1153,9 +1147,9 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
>  cleanup_fdlist:
>  	/* Clean up fdlist which is updated by DSP */
>  	for (i = 0; i < FASTRPC_MAX_FDLIST; i++) {
> -		if (!fdlist[i])
> +		if (!ctx->fdlist[i])

It wouldn't hurt to keep the local fdlist variable, keeps the code less
noisy - and you don't need to change these two places.

>  			break;
> -		if (!fastrpc_map_lookup(fl, (int)fdlist[i], &mmap))
> +		if (!fastrpc_map_lookup(fl, (int)ctx->fdlist[i], &mmap))

Why are the fds stored as u64 in the metadata? Are the actual fd numbers
somehow consumed by the DSP side?

Regards,
Bjorn

>  			fastrpc_map_put(mmap);
>  	}
>  
> -- 
> 2.34.1
> 
> 
