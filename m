Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E0967DFAD
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 10:08:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0E4110E42F;
	Fri, 27 Jan 2023 09:08:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AE4010E42E;
 Fri, 27 Jan 2023 09:08:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C7921B81ED1;
 Fri, 27 Jan 2023 09:08:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0390FC433D2;
 Fri, 27 Jan 2023 09:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1674810514;
 bh=2G/hsP8wZXgxnN+v9hmdG6FLAzuvTLuIT43qSfo4pAw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OlTurCqHgNxLsRw4T2KBUBILpX+noceshEsSxr4YH2jEYCUvVw5po3LapF/jPSC1b
 hkNREgPEJAoeONdvfDsnuqPVyfSHo7eZ2KGcFGFFmLJ0IeMyvrTv4qJHGvJlwUG8Hc
 NiEAClHSm8Kgq+dDnS2/lM0djVntMI3bIrytWKtg=
Date: Fri, 27 Jan 2023 10:08:31 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: Re: [PATCH v7 3/6] mei: clean pending read with vtag on bus
Message-ID: <Y9OUj3EhYqtS3o4L@kroah.com>
References: <20230125082637.118970-1-alan.previn.teres.alexis@intel.com>
 <20230125082637.118970-4-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230125082637.118970-4-alan.previn.teres.alexis@intel.com>
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
Cc: Juston Li <justonli@chromium.org>, intel-gfx@lists.freedesktop.org,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Vivi@kroah.com,
 Rodrigo <rodrigo.vivi@intel.com>, Tomas Winkler <tomas.winkler@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 25, 2023 at 12:26:34AM -0800, Alan Previn wrote:
> From: Alexander Usyskin <alexander.usyskin@intel.com>
> 
> Client on bus have only one vtag map slot and should disregard the vtag
> value when cleaning pending read flag.
> Fixes read flow control message unexpectedly generated when
> clent on bus send messages with different vtags.
> 
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> Reviewed-by: Tomas Winkler <tomas.winkler@intel.com>
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>  drivers/misc/mei/client.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/mei/client.c b/drivers/misc/mei/client.c
> index 9ddb854b8155..5c19097266fe 100644
> --- a/drivers/misc/mei/client.c
> +++ b/drivers/misc/mei/client.c
> @@ -1343,7 +1343,9 @@ static void mei_cl_reset_read_by_vtag(const struct mei_cl *cl, u8 vtag)
>  	struct mei_cl_vtag *vtag_l;
>  
>  	list_for_each_entry(vtag_l, &cl->vtag_map, list) {
> -		if (vtag_l->vtag == vtag) {
> +		/* The client on bus has one fixed vtag map */
> +		if ((cl->cldev && mei_cldev_enabled(cl->cldev)) ||
> +		    vtag_l->vtag == vtag) {
>  			vtag_l->pending_read = false;
>  			break;
>  		}
> -- 
> 2.39.0
> 

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
