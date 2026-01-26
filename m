Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICmWKiyHd2m9hgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 16:24:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 294E18A185
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 16:24:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 615D810E45C;
	Mon, 26 Jan 2026 15:24:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FIxvYjEC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C31210E450
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 15:24:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 396FB60130;
 Mon, 26 Jan 2026 15:24:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EF6DC116C6;
 Mon, 26 Jan 2026 15:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1769441061;
 bh=si1LFN6ROqn1g02PVvuwyz0atQYO6Ys4XxkHlnrqqPw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FIxvYjECDa2TDFkLGxmDy8w+xKoxWqx9f/rmgKo2ogvWI1uEl6uZUeuKrQE1m42hd
 07RbG3nFmTN+0jCPM9pjQE1CzOUziCJz6PW6FDuNv60jqtRmFwS970dcweGwhTl975
 nkGHqh9dm5R+jAv9l/MxTH8V6f7Y82xLBV3Ma3oQ=
Date: Mon, 26 Jan 2026 16:24:18 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Xingjing Deng <micro6947@gmail.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Xingjing Deng <xjdeng@buaa.edu.cn>,
 stable@vger.kernel.org
Subject: Re: [PATCH v3] misc: fastrpc: possible double-free of
 cctx->remote_heap
Message-ID: <2026012641-snazzy-upstate-a815@gregkh>
References: <20260117140959.879035-1-xjdeng@buaa.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260117140959.879035-1-xjdeng@buaa.edu.cn>
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
X-Spamd-Result: default: False [3.19 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:micro6947@gmail.com,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xjdeng@buaa.edu.cn,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 294E18A185
X-Rspamd-Action: no action

On Sat, Jan 17, 2026 at 10:09:59PM +0800, Xingjing Deng wrote:
> fastrpc_init_create_static_process() may free cctx->remote_heap on the
> err_map path but does not clear the pointer. Later, fastrpc_rpmsg_remove()
> frees cctx->remote_heap again if it is non-NULL, which can lead to a
> double-free if the INIT_CREATE_STATIC ioctl hits the error path and the rpmsg
> device is subsequently removed/unbound.
> Clear cctx->remote_heap after freeing it in the error path to prevent the
> later cleanup from freeing it again.
> 
> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
> Cc: stable@vger.kernel.org # 6.2+
> Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>
> 
> ---
> 
> v3:
> - Adjust the email format.
> - Link to v2: https://lore.kernel.org/linux-arm-msm/2026011650-gravitate-happily-5d0c@gregkh/T/#t
> 
> v2:
> - Add Fixes: and Cc: stable@vger.kernel.org.
> - Link to v1: https://lore.kernel.org/linux-arm-msm/2026011227-casualty-rephrase-9381@gregkh/T/#t
> 
>  drivers/misc/fastrpc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index ee652ef01534..fb3b54e05928 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1370,6 +1370,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  	}
>  err_map:
>  	fastrpc_buf_free(fl->cctx->remote_heap);
> +	fl->cctx->remote_heap = NULL;
>  err_name:
>  	kfree(name);
>  err:
> -- 
> 2.25.1
> 
> 

How was this found and tested?

And randomly setting a pointer to null doesn't really document what is
happening here, what would you want to see here if you were to look at
this code in 5 years?

thanks,

greg k-h
