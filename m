Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B76639B2FAF
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 13:07:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1685E10E351;
	Mon, 28 Oct 2024 12:07:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="w2ABnbm4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E67E10E351
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 12:06:59 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-539f1292a9bso4874979e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 05:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730117217; x=1730722017; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yvV5hGWWeFN5rUkig7q3oRLHUxqWQ6MdiNZiUO2eDYw=;
 b=w2ABnbm4nGjYaeBRlVSTjvybsAExxIU0ztsrocquJHXMr6Td2fPub9kxyMB8PKz5o1
 IPR6F21+bQXynCvlbbfPdZ+FGBboCiGWniJBPfOdcVuj8ZWats+ra2sos8ayXTF87HIu
 y1ANqqOUDAgvTTsgXk+UifZzLuflCJ1+jQStUhnKkUHAW0Kkhx/StCo/ZDk3pFdTgMvl
 9b4cZ9D6gwBOvpzvEJySWyjPA/BeeFzUdKMz1ESIAX/VieqOLlEA/Du+nQcHeFlI86Wc
 M4BONZK7KSX1jRUd479j53qDkRwMTeiDHTeXXmqplaL+/kCcOEVgF38SFmDvvhd2/+GQ
 ARKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730117217; x=1730722017;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yvV5hGWWeFN5rUkig7q3oRLHUxqWQ6MdiNZiUO2eDYw=;
 b=ZXqtZdni5knAV/RM2krDvVzUiWE7HwbMY2t9lajr7dasi4Lsv2qtDATp4SPrMX4BBr
 rl4iEfFb+bAO3PU+8SFwYl0ndyFpWHjOT8NvKo7/Co17cK23N78FzJCX2dOTk88BEInr
 hBUDPxTG3/N2mOjo3+RGQcS/sAXM6omn/tbZnV0ibqEOvm1iHNbp+7lDWkK1PV2sYTmk
 5aeEWTZsX49B06WedLtHFSkNaIwD9jUlMnFZS4pYZQGFNMoEueuuiKlqfMboB7q051UT
 HW/VcabgvxWui2nncajt9dTUXWc6LTigx1b1W19x/+sfF90cjICnKFy/kpa+ioQIc1OU
 02hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4WPkZHB3sA5PL7P1hBmWHixEL9Q6re2yIYvI/eQIpaldhlNrxaZrgpBpipJ3F8DsPkBC3HZ7XLLE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzppVX+vbt+qLzMl0frwRlRI6ZooQCUMUZ5LhGTwo09+GxVr9ap
 VkgRmuKeLcXRtytW9OKbg2BZod9QHGRPWqEr5qBTwvTe64D2ePga/EuIESQbpK8RbrWgJoIEWj6
 +
X-Google-Smtp-Source: AGHT+IE5ttRcl/11oqWt7LWA48nODyAc3M2AxGcKR636+4JvhticJ1WZicn2DdsAWLH/eET3V5bCbg==
X-Received: by 2002:a05:6512:3e1d:b0:539:fde9:4bbe with SMTP id
 2adb3069b0e04-53b348cb110mr3239205e87.20.1730117217512; 
 Mon, 28 Oct 2024 05:06:57 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53b2e1b0c79sm1057321e87.151.2024.10.28.05.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 05:06:57 -0700 (PDT)
Date: Mon, 28 Oct 2024 14:06:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, kong.kongxinwei@hisilicon.com, liangjian010@huawei.com, 
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com, 
 shenjian15@huawei.com, shaojijie@huawei.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 drm-dp 1/4] drm/hisilicon/hibmc: add dp aux in hibmc
Message-ID: <uoanbi6fk7ozdjms2zlavhm6n5jdus6boosa2xlpqbffaxu4nj@7bxpobenzjcp>
References: <20241022124148.1952761-1-shiyongbang@huawei.com>
 <20241022124148.1952761-2-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022124148.1952761-2-shiyongbang@huawei.com>
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

On Tue, Oct 22, 2024 at 08:41:45PM +0800, Yongbang Shi wrote:
> From: baihan li <libaihan@huawei.com>
> 
> Add dp aux read/write functions. They are basic functions
> and will be used later.
> 
> Signed-off-by: baihan li <libaihan@huawei.com>

Generic comment: all patches miss your SoB. This is SoB of the author,
so you as a submitted should add yours.


-- 
With best wishes
Dmitry
