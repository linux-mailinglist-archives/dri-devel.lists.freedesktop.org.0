Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 280EA77DDA3
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 11:45:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9920710E312;
	Wed, 16 Aug 2023 09:45:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3011710E312
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 09:45:02 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DAE141063;
 Wed, 16 Aug 2023 02:45:42 -0700 (PDT)
Received: from [10.57.34.128] (unknown [10.57.34.128])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3CB603F64C;
 Wed, 16 Aug 2023 02:44:59 -0700 (PDT)
Message-ID: <90efad3e-1cb8-f00c-a8f2-1ae140a4b8ec@arm.com>
Date: Wed, 16 Aug 2023 10:45:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/panfrost: Skip speed binning on EOPNOTSUPP
To: David Michael <fedora.dm0@gmail.com>, robh@kernel.org,
 tomeu.vizoso@collabora.com
References: <87msyryd7y.fsf@gmail.com>
Content-Language: en-GB
From: Steven Price <steven.price@arm.com>
In-Reply-To: <87msyryd7y.fsf@gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: boris.brezillon@collabora.com, alyssa.rosenzweig@collabora.com,
 dri-devel@lists.freedesktop.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/08/2023 02:42, David Michael wrote:
> Encountered on an ARM Mali-T760 MP4, attempting to read the nvmem
> variable can also return EOPNOTSUPP instead of ENOENT when speed
> binning is unsupported.
> 
> Cc: <stable@vger.kernel.org>
> Fixes: 7d690f936e9b ("drm/panfrost: Add basic support for speed binning")
> Signed-off-by: David Michael <fedora.dm0@gmail.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
> 
> Hi,
> 
> I upgraded an old Chromebook (veyron-minnie) to 6.4, and it fell back to
> software rendering with "Cannot read speed-bin (-95)." in dmesg.  Does
> this error code also make sense to skip?  Hardware acceleration seems to
> work as it did previously with this change.

I believe this is because the kernel is compiled without CONFIG_NVMEM so
the stub function is returning EOPNOTSUPP.

Since most platforms don't support speed binning just continuing is the
correct approach on those. For platforms with speed binning this means
the binning won't be applied if !CONFIG_NVMEM - but I don't think
there's much we can do about that.

Steve

> 
> Thanks.
> 
> David
> 
>  drivers/gpu/drm/panfrost/panfrost_devfreq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> index 58dfb15a8757..e78de99e9933 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> @@ -96,7 +96,7 @@ static int panfrost_read_speedbin(struct device *dev)
>  		 * keep going without it; any other error means that we are
>  		 * supposed to read the bin value, but we failed doing so.
>  		 */
> -		if (ret != -ENOENT) {
> +		if (ret != -ENOENT && ret != -EOPNOTSUPP) {
>  			DRM_DEV_ERROR(dev, "Cannot read speed-bin (%d).", ret);
>  			return ret;
>  		}

