Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2B1BF2916
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 18:59:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B28710E488;
	Mon, 20 Oct 2025 16:59:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="UPpU2Koj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7B4410E488;
 Mon, 20 Oct 2025 16:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760979541;
 bh=W5/9cUzx8mFHXlSOOHPt6EnGaX6UaZbSSHaXNYekbmY=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=UPpU2KojtgdPswvKeqbXUJWEA8dZPbeKenypejVEvLXGY1j71w2XRF7PyflnAiqMG
 PwssshWeSmAHUUhSLhC4wTOfmWpUfALFnsRNne3N90gQrPf0YVkq5n2H+/MJNj0yhL
 dLzN9Mq37uAnW20xhCQvmJeH8MVUHPQQmZbOlOFi+cRksBvL73JqC+KNPQSO6oNvsC
 8tStCFgnXvpvCCMZnMLBiP1KNrEyq7LhjsNjr1rP8Me8qlP3SLASx1YD6IvDVchF7C
 NslDB18KiMXZPmnR6IwtcZhTZhR23o3NANvg2dcCZw5DlLqOc5nQ8nkNX19uFO++N3
 /xTPmDIRRkOAg==
Received: from [192.168.200.105] (unknown [182.181.201.194])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: usama.anjum)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id CD9A917E1278;
 Mon, 20 Oct 2025 18:58:55 +0200 (CEST)
Message-ID: <c93821d6-2e59-481a-8119-1c00a3fdcd5e@collabora.com>
Date: Mon, 20 Oct 2025 21:58:51 +0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: usama.anjum@collabora.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Subject: Re: [RFC 1/3] PM: Mark device as suspended if it failed to resume
To: "Mario Limonciello (AMD)" <superm1@kernel.org>,
 mario.limonciello@amd.com, airlied@gmail.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, dakr@kernel.org, gregkh@linuxfoundation.org,
 lenb@kernel.org, pavel@kernel.org, rafael@kernel.org, simona@ffwll.ch
References: <20251020165317.3992933-1-superm1@kernel.org>
 <20251020165317.3992933-2-superm1@kernel.org>
Content-Language: en-US
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <20251020165317.3992933-2-superm1@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/20/25 9:50 PM, Mario Limonciello (AMD) wrote:
> From: Mario Limonciello <mario.limonciello@amd.com>
> 
> If a device failed to resume the PM core treats it as though it
> succeeded.  This could cause state machine problems.
> 
> Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>
> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
Tested-by: Muhammad Usama Anjum <usama.anjum@collabora.com>

> ---
>  drivers/base/power/main.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
> index e83503bdc1fdb..bf9c3d79c455f 100644
> --- a/drivers/base/power/main.c
> +++ b/drivers/base/power/main.c
> @@ -1104,6 +1104,9 @@ static void device_resume(struct device *dev, pm_message_t state, bool async)
>  	device_unlock(dev);
>  	dpm_watchdog_clear(&wd);
>  
> +	if (error)
> +		dev->power.is_suspended = true;
> +
>   Complete:
>  	complete_all(&dev->power.completion);
>  


-- 
---
Thanks,
Usama
