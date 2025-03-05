Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C83DDA5016B
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 15:08:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F0D610E733;
	Wed,  5 Mar 2025 14:07:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="J0oA6cBl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A89D910E733
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 14:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1741183673;
 bh=ylMxxZGDNV+12878qZV6Un+P+/ufktGGRokW3IlN2MA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=J0oA6cBlaf/d4hoCk55aUhPODHTrYMUo5qTT2Ofwbd2qyAFMkkcm++olxv9J7hSne
 JaNtjoN1juPP3N6TuxEZEVuW/MyiPtfTNuuEc9TEFqeVQCXaKYY4EZ7/QHmbGn4xhc
 wS+8kTLsk/9Q4Sq3cfcSCjLtL68uwhvmPXQ1v8a5GLREJSd16g8hMXkG4MUT4x48S3
 pomIFGhtpF5rpDpS2nmUZZYKefloiX5jcdeNgeMInqfpeQr/JwjK4IGYi6wl2A1h9E
 aClCfJybIGHrffuXF95yN5H1cy4m1PC+ka1jM7LxOauh0R/t7mBovjKRUyAGCCJBjf
 w18YPG7vmb0bw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B37FB17E0599;
 Wed,  5 Mar 2025 15:07:52 +0100 (CET)
Date: Wed, 5 Mar 2025 15:07:46 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: David Airlie <airlied@gmail.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann
 <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>
Subject: Re: [PATCH] drm/panthor: Clean up FW version information display
Message-ID: <20250305150746.5b5dabba@collabora.com>
In-Reply-To: <20250213161248.1642392-1-steven.price@arm.com>
References: <20250213161248.1642392-1-steven.price@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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

On Thu, 13 Feb 2025 16:12:48 +0000
Steven Price <steven.price@arm.com> wrote:

> Assigning a string to an array which is too small to include the NUL
> byte at the end causes a warning on some compilers. But this function
> also has some other oddities like the 'header' array which is only ever
> used within sizeof().
> 
> Tidy up the function by removing the 'header' array, allow the NUL byte
> to be present in git_sha_header, and calculate the length directly from
> git_sha_header.
> 
> Reported-by: Will Deacon <will@kernel.org>
> Fixes: 9d443deb0441 ("drm/panthor: Display FW version information")
> Signed-off-by: Steven Price <steven.price@arm.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
> Note that there should be no functional change from this patch.
> ---
>  drivers/gpu/drm/panthor/panthor_fw.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index 4a9c4afa9ad7..645fc6d2e63b 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -636,8 +636,8 @@ static int panthor_fw_read_build_info(struct panthor_device *ptdev,
>  				      u32 ehdr)
>  {
>  	struct panthor_fw_build_info_hdr hdr;
> -	char header[9];
> -	const char git_sha_header[sizeof(header)] = "git_sha: ";
> +	const char git_sha_header[] = "git_sha: ";
> +	const int header_len = sizeof(git_sha_header) - 1;
>  	int ret;
>  
>  	ret = panthor_fw_binary_iter_read(ptdev, iter, &hdr, sizeof(hdr));
> @@ -651,8 +651,7 @@ static int panthor_fw_read_build_info(struct panthor_device *ptdev,
>  		return 0;
>  	}
>  
> -	if (memcmp(git_sha_header, fw->data + hdr.meta_start,
> -		   sizeof(git_sha_header))) {
> +	if (memcmp(git_sha_header, fw->data + hdr.meta_start, header_len)) {
>  		/* Not the expected header, this isn't metadata we understand */
>  		return 0;
>  	}
> @@ -665,7 +664,7 @@ static int panthor_fw_read_build_info(struct panthor_device *ptdev,
>  	}
>  
>  	drm_info(&ptdev->base, "Firmware git sha: %s\n",
> -		 fw->data + hdr.meta_start + sizeof(git_sha_header));
> +		 fw->data + hdr.meta_start + header_len);
>  
>  	return 0;
>  }

