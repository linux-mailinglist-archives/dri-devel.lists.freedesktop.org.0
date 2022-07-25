Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D00955803C9
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 20:09:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 767C1C1509;
	Mon, 25 Jul 2022 18:09:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47718C1509
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 18:09:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C295BB810AA;
 Mon, 25 Jul 2022 18:09:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EAC8C341C6;
 Mon, 25 Jul 2022 18:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1658772564;
 bh=e7itVqVjwA+eZ0EqMCGIZYnb3yN+zl+pwcM1UzARAIE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lgS6TwMJQnYTdafIU4TN1pgn5ZzML0P93axloD2FTqZM7P9Wse6M9iIPBmcGSXz+w
 IWCXZFyxsQIKwcz3i9HszSY4ImSF+MaInaFnjaZQelgWZlDF9ZvdRjlpIvZYjEb0ef
 OWUruNXKQ9MyD8zWYLumNnjvLNYXsXFvgGI6mXp4=
Date: Mon, 25 Jul 2022 20:09:19 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH] component: try_module_get() to prevent unloading while
 in use
Message-ID: <Yt7cT66p0Bn+aXn5@kroah.com>
References: <20220725160859.1274472-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220725160859.1274472-1-rf@opensource.cirrus.com>
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
Cc: patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rafael@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 25, 2022 at 05:08:59PM +0100, Richard Fitzgerald wrote:
> Call try_module_get() on a component before attempting to call its
> bind() function, to ensure that a loadable module cannot be
> unloaded while we are executing its bind().

How can bind be called while the module is unloaded?

> If the bind is successful the module_put() is called only after it
> has been unbound. This ensures that the module cannot be unloaded
> while it is in use as an aggregate device.

That's almost never the correct thing to do, what problem is this
solving?

thanks,

greg k-h
