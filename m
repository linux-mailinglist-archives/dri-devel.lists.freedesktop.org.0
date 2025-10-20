Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE60BF291C
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 18:59:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D86C610E48C;
	Mon, 20 Oct 2025 16:59:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="WWyajdZj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4510210E48B;
 Mon, 20 Oct 2025 16:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760979549;
 bh=G7iQGFTjElvxnf59cDItFHSMkPqz6A/NDmQwvq/okdc=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=WWyajdZjmxz/WBOuB14W78E+DuNtJEYQjwW2ymcmVIObxjugvSigBuZF3CBG2NKto
 MVNzlzgfauJbhoxyMI1dXGR4cgZIORC+K4uX4bhFBmk/GvcWKmeqwbCvs5siB1GAG1
 Dmb7/RLRvabYkGBzqNl3Dld2wpMNEk4Qdkl+oESkwyKBmEs0f05KwLjmi/9SqwjALT
 xiIbI9+oLe8ap3YY5A1gdPnd6JGFHNcm6y5JrD8ATh9fXNfGtA+zc4JoFiIoSDnvaM
 8ooqduBQmVJ4hsS4p2W2+TfOt4cDTzamSxw0mOK319XzofBViCx8dVgERATlkFg9GI
 gDBvxlC28bMFQ==
Received: from [192.168.200.105] (unknown [182.181.201.194])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: usama.anjum)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5935617E127F;
 Mon, 20 Oct 2025 18:59:01 +0200 (CEST)
Message-ID: <73a9da49-1513-4eda-bfaa-c89160ed709e@collabora.com>
Date: Mon, 20 Oct 2025 21:58:57 +0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: usama.anjum@collabora.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Subject: Re: [RFC 2/3] PM: Don't pass up device_resume() -EBUSY errors
To: "Mario Limonciello (AMD)" <superm1@kernel.org>,
 mario.limonciello@amd.com, airlied@gmail.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, dakr@kernel.org, gregkh@linuxfoundation.org,
 lenb@kernel.org, pavel@kernel.org, rafael@kernel.org, simona@ffwll.ch
References: <20251020165317.3992933-1-superm1@kernel.org>
 <20251020165317.3992933-3-superm1@kernel.org>
Content-Language: en-US
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <20251020165317.3992933-3-superm1@kernel.org>
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
> If a device resume returns -EBUSY the device resume sequence has
> been skipped. Don't show errors for this or pass it up to async
> resume.  If resume is run again in another stage the device should
> try again.
> 
> Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>
> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
Tested-by: Muhammad Usama Anjum <usama.anjum@collabora.com>

> ---
>  drivers/base/power/main.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
> index bf9c3d79c455f..f6bc7ef9a8371 100644
> --- a/drivers/base/power/main.c
> +++ b/drivers/base/power/main.c
> @@ -1112,7 +1112,9 @@ static void device_resume(struct device *dev, pm_message_t state, bool async)
>  
>  	TRACE_RESUME(error);
>  
> -	if (error) {
> +	if (error == -EBUSY)
> +		pm_dev_dbg(dev, state, async ? " async" : "");
> +	else if (error) {
>  		WRITE_ONCE(async_error, error);
>  		dpm_save_failed_dev(dev_name(dev));
>  		pm_dev_err(dev, state, async ? " async" : "", error);


-- 
---
Thanks,
Usama
