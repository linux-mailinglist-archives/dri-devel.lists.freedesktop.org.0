Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA1D8A7F9E
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 11:28:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C1E710F4E3;
	Wed, 17 Apr 2024 09:28:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="t4oQDr5h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C941E10F368
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 09:28:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8A02DCE12CA;
 Wed, 17 Apr 2024 09:28:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61A6FC072AA;
 Wed, 17 Apr 2024 09:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1713346094;
 bh=E4NxfokkS134BQqYi4l9d24KTL7bidk0mUYpB0lh7pY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t4oQDr5h3H7bnXCR4Cr7SVoVflqDgciWtzCI+XZ1BRaSCxfdTgH/0Db67Z3HjnZGi
 M2rQLFsltdSnsvpgsnvu5zUe2b/7uWjUEE4xAL9nwxKI2yUJkdlYAtALzvMkg+FYcm
 ltWSGy0EFIIYcm6hQwSdQmADIwIeSTKtlluGXBm0=
Date: Wed, 17 Apr 2024 11:28:12 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Herman van Hazendonk <github.com@herrie.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] component: Support masters with no subcomponents
Message-ID: <2024041713-devalue-unsightly-56cb@gregkh>
References: <20240417-component-dummy-v1-1-b0854665c760@herrie.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240417-component-dummy-v1-1-b0854665c760@herrie.org>
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

On Wed, Apr 17, 2024 at 11:12:09AM +0200, Herman van Hazendonk wrote:
> This happens in the MSM DRM driver when it is used
> without any subcomponents, which is a special corner
> case.
> 
> If the MDP4 is used with nothing but the LVDS display,
> we get this problem that no components are found since
> the LVDS is part of the MDP4 itself.
> 
> We cannot use a NULL match, so create a dummy match
> with no components for this case so the driver will
> still probe nicely without adding a secondary
> complicated probe() path to the MSM DRM driver.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
> ---
> This happens in the MSM DRM driver when it is used
> without any subcomponents, which is a special corner
> case.
> 
> If the MDP4 is used with nothing but the LVDS display,
> we get this problem that no components are found since
> the LVDS is part of the MDP4 itself.
> 
> We cannot use a NULL match, so create a dummy match
> with no components for this case so the driver will
> still probe nicely without adding a secondary
> complicated probe() path to the MSM DRM driver.

Why is the text duplicated here twice?

Also, why are you adding complexity to the core for something that has
not been an issue for any other device?  Shouldn't the driver need to
handle this instead if it wishes to use the component code?  Will this
change affect any other in-tree user?

thanks,

greg k-h
