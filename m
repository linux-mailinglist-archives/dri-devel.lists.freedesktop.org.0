Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 212A8A2B379
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 21:39:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F29B10E941;
	Thu,  6 Feb 2025 20:39:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=acm.org header.i=@acm.org header.b="YQauap5v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 456 seconds by postgrey-1.36 at gabe;
 Thu, 06 Feb 2025 20:39:04 UTC
Received: from 008.lax.mailroute.net (008.lax.mailroute.net [199.89.1.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65AC910E941
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 20:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by 008.lax.mailroute.net (Postfix) with ESMTP id 4YppfR5j1Hz6CmQyc;
 Thu,  6 Feb 2025 20:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
 content-transfer-encoding:content-type:content-type:in-reply-to
 :from:from:content-language:references:subject:subject
 :user-agent:mime-version:date:date:message-id:received:received;
 s=mr01; t=1738873880; x=1741465881; bh=2NJpuP8QAvrvl+PVL24frdpu
 VZt5EE9YT2b5o/wg7Sc=; b=YQauap5vt91p/64wa2xD++T/ZIQ2JWQO8wxX1/RH
 Xar37Pyvo92+OPWWeZ+xi1WOLRBHtV/o65PEcuTNSTtJhoelhJGqiaPtWgTRUMS4
 pzdDUvF+W7dBvu8Iczfu+BO9oGWPB+QYNrAW49iKHVKbA+09SWwrTFUeNbWCK7Sb
 4W/ktd5YuQuXCHFkGP1TvI5ywA0tdtuIbXEcRb0h4u/wbo/rCUB251x649M3BKc/
 alyVBChUDX8ea7FdZ6ocro8HJeCSx0ThYkXkNa+eUNbpHcy6ra1WUWuOITFRXX6G
 6fGY/AQhisdqp6w6+oLB0o1DknrAat3T/0tZOaVi0FKTLw==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id SA9dIvRNaZcF; Thu,  6 Feb 2025 20:31:20 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: bvanassche@acm.org)
 by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4YppfF2X6tz6CmQyZ;
 Thu,  6 Feb 2025 20:31:16 +0000 (UTC)
Message-ID: <373d62da-810f-492c-af2f-53b32cc90b33@acm.org>
Date: Thu, 6 Feb 2025 12:31:14 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm: zynqmp_dp: Use scope-based mutex helpers
To: Sean Anderson <sean.anderson@linux.dev>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 "open list:DRM DRIVERS FOR XILINX" <dri-devel@lists.freedesktop.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 "moderated list:ARM/ZYNQ ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>, David Airlie <airlied@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, Michal Simek
 <michal.simek@amd.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20250206194117.1496245-1-sean.anderson@linux.dev>
 <20250206194117.1496245-3-sean.anderson@linux.dev>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250206194117.1496245-3-sean.anderson@linux.dev>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/6/25 11:41 AM, Sean Anderson wrote:
>   static int zynqmp_dp_enhanced_set(void *data, u64 val)
>   {
>   	struct zynqmp_dp *dp = data;
> -	int ret = 0;
>   
> -	mutex_lock(&dp->lock);
> +	guard(mutex)(&dp->lock);
>   	dp->test.enhanced = val;
>   	if (dp->test.active)
> -		ret = zynqmp_dp_test_setup(dp);
> -	mutex_unlock(&dp->lock);
> +		return zynqmp_dp_test_setup(dp);
>   
> -	return ret;
> +	return 0;
>   }

Has it been considered to combine the two return statements into one
with the ternary operator (?:)?

>   static int zynqmp_dp_downspread_set(void *data, u64 val)
>   {
>   	struct zynqmp_dp *dp = data;
> -	int ret = 0;
>   
> -	mutex_lock(&dp->lock);
> +	guard(mutex)(&dp->lock);
>   	dp->test.downspread = val;
>   	if (dp->test.active)
> -		ret = zynqmp_dp_test_setup(dp);
> -	mutex_unlock(&dp->lock);
> +		return zynqmp_dp_test_setup(dp);
>   
> -	return ret;
> +	return 0;
>   }

Same question here.

> @@ -2053,7 +2039,8 @@ static ssize_t zynqmp_dp_custom_read(struct file *file, char __user *user_buf,
>   		return ret;
>   
>   	mutex_lock(&dp->lock);
> -	ret = simple_read_from_buffer(user_buf, count, ppos, &dp->test.custom,
> +	ret = simple_read_from_buffer(user_buf, count, ppos,
> +				      &dp->test.custom,
>   				      sizeof(dp->test.custom));

This change has not been mentioned in the patch description and is not
related to the other changes in this patch?

> -	return ret;
> +	dp->test.link_cnt = val;
> +	if (dp->test.active)
> +		return zynqmp_dp_test_setup(dp);
> +
> +	return 0;
>   }

Has it been considered to use the ternary operator here?

Thanks,

Bart.
