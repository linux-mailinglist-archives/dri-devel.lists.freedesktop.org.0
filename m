Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B0D5A9B31
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 17:07:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1900110E05A;
	Thu,  1 Sep 2022 15:07:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18AE110E05A;
 Thu,  1 Sep 2022 15:07:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7286C61E1C;
 Thu,  1 Sep 2022 15:07:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D5A4C433C1;
 Thu,  1 Sep 2022 15:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1662044821;
 bh=0EYiNqzInprnyGSeiUuivjo8jAdgw+J0yepStj3mwpY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ItbtQHKXriLjzmC0qlxq6qY6V7BRjNH/e2CdPXV6oqQPOAhZs5QdvhH3wMEXEFVbH
 tUymXXcJlwF2PfiGdCGz7R1UOC/xq8bQu53M8trHQm1Vfa/1qW7YdKxvS4SQglnm4y
 z6hfOXTUgZcAg4Ko3aEsUuioDfSvnyrvdL6SFFw8=
Date: Thu, 1 Sep 2022 17:06:59 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v3 02/15] mei: add support to GSC extended header
Message-ID: <YxDKk++n5mbaqYAx@kroah.com>
References: <20220819225335.3947346-1-daniele.ceraolospurio@intel.com>
 <20220819225335.3947346-3-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220819225335.3947346-3-daniele.ceraolospurio@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Tomas Winkler <tomas.winkler@intel.com>,
 dri-devel@lists.freedesktop.org, Vitaly Lubart <vitaly.lubart@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 19, 2022 at 03:53:22PM -0700, Daniele Ceraolo Spurio wrote:
> --- a/drivers/misc/mei/hw-me.c
> +++ b/drivers/misc/mei/hw-me.c
> @@ -590,7 +590,10 @@ static int mei_me_hbuf_write(struct mei_device *dev,
>  	u32 dw_cnt;
>  	int empty_slots;
>  
> -	if (WARN_ON(!hdr || !data || hdr_len & 0x3))
> +	if (WARN_ON(!hdr || hdr_len & 0x3))
> +		return -EINVAL;
> +
> +	if (WARN_ON(!data && data_len))

Do not add more WARN_ON() calls, please just handle this properly and do
not reboot people's machines for a coding error :(

thanks,

greg k-h
