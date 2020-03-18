Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E1B189585
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 07:03:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD6506E1C0;
	Wed, 18 Mar 2020 06:02:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 623116E1C0;
 Wed, 18 Mar 2020 06:02:57 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7D12920663;
 Wed, 18 Mar 2020 06:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584511376;
 bh=rrtQ7bSEmpqBZhNRWvjkSCXBWymjQBTAn4TLG3GnOZE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c0lVSe2EwSW1Aav+XG39anTMGM7F1meUK3FdwawjmTFjZlQyGLrGK9qqCHfcsct4T
 3lqrOWxqsAmxx40aM1cDyecMhZgbnZ5k5wj0V2uti4WJBtkKnM+UmoPt5KL77JlLLt
 y0o1GB0j+wSmprz+VHDU0o9yNTp6+PQkVm/JqTU4=
Date: Wed, 18 Mar 2020 07:02:54 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH 9/9] drm/nouveau/kms/nvd9-: Add CRC support
Message-ID: <20200318060254.GB1594891@kroah.com>
References: <20200318004159.235623-1-lyude@redhat.com>
 <20200318004159.235623-10-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200318004159.235623-10-lyude@redhat.com>
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Jani Nikula <jani.nikula@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>, Ben Skeggs <bskeggs@redhat.com>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 17, 2020 at 08:41:06PM -0400, Lyude Paul wrote:
> +	root = debugfs_create_dir("nv_crc", crtc->debugfs_entry);
> +	if (IS_ERR(root))
> +		return PTR_ERR(root);

No need to check this, just take the return value and move on.

> +
> +	dent = debugfs_create_file("flip_threshold", 0644, root, head,
> +				   &nv50_crc_flip_threshold_fops);
> +	if (IS_ERR(dent))
> +		return PTR_ERR(dent);

No need to check this either, in fact this test is incorrect :(

Just make the call, and move on.  See the loads of debugfs cleanups I
have been doing for examples.

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
