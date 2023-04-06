Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 041666D9762
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 14:54:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C1110E21F;
	Thu,  6 Apr 2023 12:54:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58CD710E21F
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 12:54:02 +0000 (UTC)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi
 [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B561CE1F;
 Thu,  6 Apr 2023 14:53:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1680785640;
 bh=OKwpYB6xWphbMvw/yAZ4Bt3Lp8vsSXkmvqOy6cgRDkk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=tYhowJTI0r7xjw4tGiEXClAe0UHEaV9tBlATkpXUXmA4Xox+kjZ4N8u4aoqRo0yS6
 aipRnmL2qD3JizuKCmiUlbvK6EzyS9BrgtygzIlTvR0ZW+JlYNFDZ8eFTwbjkxk1BN
 RlFGdAxbgqiAyqlmyoWV9d0l0reSRuIiANCzVmdA=
Message-ID: <d107f9a4-cf84-3525-b336-2a281acd9a06@ideasonboard.com>
Date: Thu, 6 Apr 2023 15:53:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 0/5] drm/omapdrm: Convert fbdev to DRM client
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch
References: <20230403104035.15288-1-tzimmermann@suse.de>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230403104035.15288-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On 03/04/2023 13:40, Thomas Zimmermann wrote:
> Convert omapdrm's fbdev code to struct drm_client. Replaces the current
> ad-hoc integration. The conversion includes a number of cleanups. As
> with most other drivers' fbdev emulation, fbdev in omapdrm is now just
> another DRM client that runs after the DRM device has been registered.
> 
> Once all drivers' fbdev emulation has been converted to struct drm_client,
> we can attempt to add additional in-kernel clients. A DRM-based dmesg
> log or a bootsplash are commonly mentioned. DRM can then switch easily
> among the existing clients if/when required.
> 
> I did the conversion from similar experience with other drivers. But I
> don't have the hardware to test this. Any testing is welcome.
> 
> v2:
> 	* squashed patch 6 in to patch 5 (Tomi)
> 	* minor cleanups (Tomi)
> 
> Thomas Zimmermann (5):
>    drm/omapdrm: Include <linux/of.h>
>    drm/omapdrm: Remove fb from struct omap_fbdev
>    drm/omapdrm: Remove bo from struct omap_fbdev
>    drm/omapdrm: Remove fbdev from struct omap_drm_private
>    drm/omapdrm: Implement fbdev emulation as in-kernel client
> 
>   drivers/gpu/drm/omapdrm/omap_debugfs.c |   6 +-
>   drivers/gpu/drm/omapdrm/omap_drv.c     |  13 +-
>   drivers/gpu/drm/omapdrm/omap_drv.h     |   3 -
>   drivers/gpu/drm/omapdrm/omap_fbdev.c   | 163 ++++++++++++++++---------
>   drivers/gpu/drm/omapdrm/omap_fbdev.h   |   9 +-
>   5 files changed, 112 insertions(+), 82 deletions(-)
> 

I have pushed this to drm-misc-next. Thanks!

  Tomi

