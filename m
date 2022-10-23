Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 851506092C9
	for <lists+dri-devel@lfdr.de>; Sun, 23 Oct 2022 14:42:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90DEC10E1BE;
	Sun, 23 Oct 2022 12:41:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40DDD10E1BE
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Oct 2022 12:41:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 81084B80D94;
 Sun, 23 Oct 2022 12:41:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF01CC433C1;
 Sun, 23 Oct 2022 12:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1666528907;
 bh=ZcLrORXzdng+Ees4GQI/HwV2AU9kcNTHbFHlMCos+OI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ljwjrA4u4nC0E3yZ8ql4IzsHHP7gb7D18O91Zo4ZlTkDDNNwHq+MNzsmWMfETJnQT
 wEgYp84s9ywwf1p7Yi0La0tJWZL/hedl+jipvfli+2b9DuAZSr8d5fuGm1HXfWNqIo
 Ch7xjSuuFZFx3Yxl55GMLtwmYtyIJwca5PCr9h6s=
Date: Sun, 23 Oct 2022 14:41:44 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [RFC PATCH 3/3] drm: add dedicated minor for accelerator devices
Message-ID: <Y1U2iBedfSzqTjer@kroah.com>
References: <20221022214622.18042-1-ogabbay@kernel.org>
 <20221022214622.18042-4-ogabbay@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221022214622.18042-4-ogabbay@kernel.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Arnd Bergmann <arnd@arndb.de>,
 Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Jagan Teki <jagan@amarulasolutions.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Jiho Chu <jiho.chu@samsung.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christoph Hellwig <hch@infradead.org>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Oct 23, 2022 at 12:46:22AM +0300, Oded Gabbay wrote:
> +/**
> + * accel_open - open method for ACCEL file
> + * @inode: device inode
> + * @filp: file pointer.
> + *
> + * This function must be used by drivers as their &file_operations.open method.
> + * It looks up the correct ACCEL device and instantiates all the per-file
> + * resources for it. It also calls the &drm_driver.open driver callback.
> + *
> + * RETURNS:
> + *
> + * 0 on success or negative errno value on failure.
> + */
> +int accel_open(struct inode *inode, struct file *filp)
> +{
> +	struct drm_minor *minor;
> +
> +	minor = drm_minor_acquire(iminor(inode), true);
> +	if (IS_ERR(minor))
> +		return PTR_ERR(minor);
> +
> +	return __drm_open(inode, filp, minor);
> +}
> +EXPORT_SYMBOL(accel_open);

EXPORT_SYMBOL_GPL() please.

And again, this should probably to into drivers/accel/ not here.

thanks,

greg k-h
