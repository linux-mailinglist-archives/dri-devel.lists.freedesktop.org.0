Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1501140EB8
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 17:12:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E4B46F61D;
	Fri, 17 Jan 2020 16:12:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id EB5E86F61D
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 16:12:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F8B4113E;
 Fri, 17 Jan 2020 08:12:32 -0800 (PST)
Received: from arm.com (e112269-lin.cambridge.arm.com [10.1.194.52])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 74FA03F718;
 Fri, 17 Jan 2020 08:12:31 -0800 (PST)
Date: Fri, 17 Jan 2020 16:12:27 +0000
From: Steven Price <steven.price@arm.com>
To: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH AUTOSEL 5.4 002/205] drm/panfrost: Add missing check for
 pfdev->regulator
Message-ID: <20200117161226.GA8472@arm.com>
References: <20200116164300.6705-1-sashal@kernel.org>
 <20200116164300.6705-2-sashal@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200116164300.6705-2-sashal@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 16, 2020 at 04:39:37PM +0000, Sasha Levin wrote:
> From: Steven Price <steven.price@arm.com>
> 
> [ Upstream commit 52282163dfa651849e905886845bcf6850dd83c2 ]

This commit is effectively already in 5.4. Confusingly there were two
versions of this upstream:

52282163dfa6 ("drm/panfrost: Add missing check for pfdev->regulator")
c90f30812a79 ("drm/panfrost: Add missing check for pfdev->regulator")

It got merged both through a -fixes branch and through the normal merge
window. The two copies caused a bad merge in mainline and this was
effectively reverted in commit 603e398a3db2 ("drm/panfrost: Remove NULL
check for regulator").

c90f30812a79 is included in v5.4 so should already be in any v5.4.y
release.

Steve

> 
> When modifying panfrost_devfreq_target() to support a device without a
> regulator defined I missed the check on the error path. Let's add it.
> 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Fixes: e21dd290881b ("drm/panfrost: Enable devfreq to work without regulator")
> Signed-off-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20190822093218.26014-1-steven.price@arm.com
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  drivers/gpu/drm/panfrost/panfrost_devfreq.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> index 12ff77dacc95..c1eb8cfe6aeb 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> @@ -53,8 +53,10 @@ static int panfrost_devfreq_target(struct device *dev, unsigned long *freq,
>  	if (err) {
>  		dev_err(dev, "Cannot set frequency %lu (%d)\n", target_rate,
>  			err);
> -		regulator_set_voltage(pfdev->regulator, pfdev->devfreq.cur_volt,
> -				      pfdev->devfreq.cur_volt);
> +		if (pfdev->regulator)
> +			regulator_set_voltage(pfdev->regulator,
> +					      pfdev->devfreq.cur_volt,
> +					      pfdev->devfreq.cur_volt);
>  		return err;
>  	}
>  
> -- 
> 2.20.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
