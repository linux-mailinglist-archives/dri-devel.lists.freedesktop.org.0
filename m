Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A455DA3D9E1
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 13:24:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E41C10E951;
	Thu, 20 Feb 2025 12:24:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TKg8UAfo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DC1110E951
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 12:24:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 177A761427;
 Thu, 20 Feb 2025 12:24:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05050C4CED6;
 Thu, 20 Feb 2025 12:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1740054280;
 bh=jeZaGJ0Th9HIcqwjSlE9Tz8JFbXgM8gbdWDsiOz2LIY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TKg8UAfokxUuTUDEW4ilTmSII+RH2e+Lvdb3EuHMfMrLcCKUtns1+F+I4ELT6H+0X
 IEAK9PiKQqZqZZkkGiNQIpYvu8hag6CdeOebEWQ5yUcXdd84kTdnMzYcBPOfhqTONj
 kkO+ArhRSMWA58ZV9uVeGHzUOqN2X8ikqTAQPltg=
Date: Thu, 20 Feb 2025 13:24:37 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: linux-kernel@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH 2/6] drivers: base: devres: Fix find_group() documentation
Message-ID: <2025022033-struck-employee-1960@gregkh>
References: <20250212200542.515493-1-lucas.demarchi@intel.com>
 <20250212200542.515493-3-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212200542.515493-3-lucas.demarchi@intel.com>
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

On Wed, Feb 12, 2025 at 12:05:38PM -0800, Lucas De Marchi wrote:
> It returns the last open group, not the last group.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/base/devres.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/base/devres.c b/drivers/base/devres.c
> index b955a2f9520bf..d8a733ea5e1ac 100644
> --- a/drivers/base/devres.c
> +++ b/drivers/base/devres.c
> @@ -576,7 +576,10 @@ void *devres_open_group(struct device *dev, void *id, gfp_t gfp)
>  }
>  EXPORT_SYMBOL_GPL(devres_open_group);
>  
> -/* Find devres group with ID @id.  If @id is NULL, look for the latest. */
> +/*
> + * Find devres group with ID @id.  If @id is NULL, look for the latest open
> + * group.
> + */
>  static struct devres_group *find_group(struct device *dev, void *id)
>  {
>  	struct devres_node *node;
> -- 
> 2.48.1
> 

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

