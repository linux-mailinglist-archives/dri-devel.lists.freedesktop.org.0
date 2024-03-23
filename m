Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 590C6887A76
	for <lists+dri-devel@lfdr.de>; Sat, 23 Mar 2024 22:25:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F202910E6DD;
	Sat, 23 Mar 2024 21:25:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EqkcFqFp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00AC510E6DD
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Mar 2024 21:25:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B3E4D60ADD;
 Sat, 23 Mar 2024 21:25:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F0B2C433C7;
 Sat, 23 Mar 2024 21:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711229151;
 bh=ewbb3fGZ24mY6UOj2n/ZI82QsQGXdDkN3r2W4fSmfmE=;
 h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
 b=EqkcFqFpjaM+8tvpkykPmyU63xmAqu09XJoCsUBspu2o1DJkRmb+mcnzXQYMo/4Uo
 HJQbZZ+FHKExsRbaxOONgsRwx2VBBY0QRvJW/qQGUlTdWp+HS7rNR+xEpGE27ROtII
 9o+30gQOB4yvhejgGb+CBPkUzMyPFItiWZqumLu4SHe7FgYUsyppFN0C/G3YFROsn0
 LErzo/LwQ4p6t5cnX8Wdh7PmOofz2y2fiE90tXL+2BxvNxql6wQTCr8lSTDq7RIh9z
 C5u7ZFA9dJc38ohrd1EAA+3HUPT6NsBhHCB0yA/3sBzv5aGfEBroWu6UcbJX0SkpZt
 4kBo6WiR9ZA+w==
Date: Sat, 23 Mar 2024 22:25:06 +0100
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Jonathan.Cameron@huawei.com, Laurent.pinchart@ideasonboard.com,
 airlied@gmail.com, andrzej.hajda@intel.com, arm@kernel.org, arnd@arndb.de,
 bamv2005@gmail.com, brgl@bgdev.pl, daniel@ffwll.ch, davem@davemloft.net,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 eajames@linux.ibm.com, gaurav.jain@nxp.com, gregory.clement@bootlin.com,
 hdegoede@redhat.com, herbert@gondor.apana.org.au, horia.geanta@nxp.com,
 james.clark@arm.com, james@equiv.tech, jdelvare@suse.com,
 jernej.skrabec@gmail.com, jonas@kwiboo.se, linus.walleij@linaro.org,
 linux-crypto@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux@roeck-us.net, maarten.lankhorst@linux.intel.com,
 mazziesaccount@gmail.com, mripard@kernel.org, naresh.solanki@9elements.com,
 neil.armstrong@linaro.org, pankaj.gupta@nxp.com,
 patrick.rudolph@9elements.com, rfoss@kernel.org, soc@kernel.org,
 tzimmermann@suse.de
Subject: Re: [PATCH v5 08/11] devm-helpers: Add resource managed version of
 debugfs directory create function
Message-ID: <20240323222506.4ffbdd71@thinkpad>
In-Reply-To: <f7c64a5a-2abc-4b7e-95db-7ca57b5427c0@wanadoo.fr>
References: <20240323164359.21642-1-kabel@kernel.org>
 <20240323164359.21642-9-kabel__6885.49310886941$1711212291$gmane$org@kernel.org>
 <f7c64a5a-2abc-4b7e-95db-7ca57b5427c0@wanadoo.fr>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.39; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 23 Mar 2024 22:10:40 +0100
Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> > -	return devm_add_action_or_reset(dev, gpio_mockup_debugfs_cleanup, chip);
> > +	return devm_add_action_or_reset(dev, devm_debugfs_dir_recursive_drop,
> > +					chip->dbg_dir);  
> 
> This look strange. Shouldn't the debugfs_create_dir() call in 
> gpio_mockup_debugfs_setup() be changed, instead?
> 
> (I've not look in the previous version if something was said about it, 
> so apologies if already discussed)

Yeah, this specific user needs a more complicated refactoring.

I was reluctant to do more complicated refactors in the patch that also
introduces these helpers.

But Guenter asked me to split the patch anyway...

> >   static int pvt_ts_dbgfs_create(struct pvt_device *pvt, struct device *dev)
> >   {
> > -	pvt->dbgfs_dir = debugfs_create_dir(dev_name(dev), NULL);
> > +	pvt->dbgfs_dir = devm_debugfs_create_dir(dev, dev_name(dev), NULL);
> > +	if (IS_ERR(pvt->dbgfs_dir))
> > +		return PTR_ERR(pvt->dbgfs_dir);  
> 
> Not sure if the test and error handling should be added here.
> *If I'm correct*, functions related to debugfs already handle this case 
> and just do nothing. And failure in debugfs related code is not 
> considered as something that need to be reported and abort a probe function.
> 
> Maybe the same other (already existing) tests in this patch should be 
> removed as well, in a separated patch.

Functions related to debugfs maybe do, but devm_ resource management
functions may fail to allocate release structure, and those errors need
to be handled, AFAIK.

Marek
