Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A29F7E50F9
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 08:30:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 050F710E0B7;
	Wed,  8 Nov 2023 07:30:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0810A10E0B7;
 Wed,  8 Nov 2023 07:30:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 628F4B81590;
 Wed,  8 Nov 2023 07:30:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F2BDC433C8;
 Wed,  8 Nov 2023 07:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1699428601;
 bh=yo7b1LGNFyvDpF1t3rH3P/9deVIKXquQeoyvxzFhZ0M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CkhXJ7Ewr/fNRkHHqlD8wzG3L5thil15gOltKdbJxoYBn9ZW/PdFIWeOTEb95ES9h
 S062er0V6eQzPe82wMFHixIkfWeYoclSgNATcdBmNt9WIxjjIXNS4Q0yRmT6GAIE5+
 dFXsFvg2TYOp5HHIq7IR01jIPslm/BClcHAsS+0M=
Date: Wed, 8 Nov 2023 08:29:58 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: =?iso-8859-1?Q?Jos=E9?= Pekkarinen <jose.pekkarinen@foxhound.fi>
Subject: Re: [PATCH] drm/amd/pm: replace 1-element arrays with flexible-array
 members
Message-ID: <2023110835-magnolia-prune-02d0@gregkh>
References: <20231108065436.13969-1-jose.pekkarinen@foxhound.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231108065436.13969-1-jose.pekkarinen@foxhound.fi>
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
Cc: Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 skhan@linuxfoundation.org, alexander.deucher@amd.com, evan.quan@amd.com,
 christian.koenig@amd.com, linux-kernel-mentees@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 08, 2023 at 08:54:35AM +0200, José Pekkarinen wrote:
> The following case seems to be safe to be replaced with a flexible array
> to clean up the added coccinelle warning. This patch will just do it.
> 
> drivers/gpu/drm/amd/pm/powerplay/smumgr/smu8_smumgr.h:76:38-63: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> 
> Signed-off-by: José Pekkarinen <jose.pekkarinen@foxhound.fi>
> ---
>  drivers/gpu/drm/amd/pm/powerplay/smumgr/smu8_smumgr.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu8_smumgr.h b/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu8_smumgr.h
> index c7b61222d258..1ce4087005f0 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu8_smumgr.h
> +++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu8_smumgr.h
> @@ -73,7 +73,7 @@ struct smu8_register_index_data_pair {
>  
>  struct smu8_ih_meta_data {
>  	uint32_t command;
> -	struct smu8_register_index_data_pair register_index_value_pair[1];
> +	struct smu8_register_index_data_pair register_index_value_pair[];

Did you just change this structure size without any need to change any
code as well?  How was this tested?

thanks,

greg k-h
