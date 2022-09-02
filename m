Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFAB5AB133
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 15:10:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D2D510E63B;
	Fri,  2 Sep 2022 13:10:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4030910E63B;
 Fri,  2 Sep 2022 13:10:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C5EAEB82A93;
 Fri,  2 Sep 2022 13:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8696C433D7;
 Fri,  2 Sep 2022 13:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1662124223;
 bh=gyQWuNAPc+74rM0aS1MSJ4QJ6RbXShDyHWLyEiqRoQU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CQKn+VJGtrWnpB6WqDuCC3FzieeagB+gNRGChxvz9oDHXXmx2mDyYRnP3ZpCGjJUE
 hl7HBTss0CYdoTojxOhXu5oOiQljkG7Ke505YsbMeEwg8Vji18MsaotJ9qLIt/nOCC
 QNKvcStOo+s3Syd2kweL/NO710tSkB+KG4AQs0tk=
Date: Fri, 2 Sep 2022 15:10:20 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deuc her <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Xinhui.Pan@amd.com
Subject: Re: [PATCH] drm/amd/display: fix memory leak when using
 debugfs_lookup()
Message-ID: <YxIAvHOK7uNum9VI@kroah.com>
References: <20220902130105.139138-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220902130105.139138-1-gregkh@linuxfoundation.org>
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Leo Li <sunpeng.li@amd.com>, dri-devel@lists.freedesktop.org,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Wenjing Liu <wenjing.liu@amd.com>, linux-kernel@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 hersen wu <hersenxs.wu@amd.com>, amd-gfx@lists.freedesktop.org,
 Wayne Lin <Wayne.Lin@amd.com>, Sean Paul <seanpaul@chromium.org>,
 Yongzhi Liu <lyz_cs@pku.edu.cn>, Mikita Lipski <mikita.lipski@amd.com>,
 Thelford Williams <tdwilliamsiv@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 02, 2022 at 03:01:05PM +0200, Greg Kroah-Hartman wrote:
> When calling debugfs_lookup() the result must have dput() called on it,
> otherwise the memory will leak over time.  Fix this up by properly
> calling dput().
> 
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Wayne Lin <Wayne.Lin@amd.com>
> Cc: hersen wu <hersenxs.wu@amd.com>
> Cc: Wenjing Liu <wenjing.liu@amd.com>
> Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> Cc: Thelford Williams <tdwilliamsiv@gmail.com>
> Cc: Fangzhi Zuo <Jerry.Zuo@amd.com>
> Cc: Yongzhi Liu <lyz_cs@pku.edu.cn>
> Cc: Mikita Lipski <mikita.lipski@amd.com>
> Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Cc: Sean Paul <seanpaul@chromium.org>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---

Despite a zillion cc: items, I forgot to cc: stable on this.  Can the
maintainer add that here, or do you all want me to resend it with that
item added?

thanks,

greg k-h
