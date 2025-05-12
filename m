Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A517AB383B
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 15:16:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C22DB88EA1;
	Mon, 12 May 2025 13:16:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c77v8pCf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3EA610E417
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 13:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747055759; x=1778591759;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=N+0LFGTtI6zB+BSNgrVSHcilV81hSz+0mu8K+VGrGKw=;
 b=c77v8pCf31Dp+XRKPcC1GYt8Xn3Nm2L7O/Qf/X2Jhs5Rurg+WprNztdL
 aXcZjmiuzhuhPrQKzCyw4HPcoVMeCpXazY7QpLu6yNg/ONXAnMEaxterB
 iHRR8fruaiVMiUWUY9CHAINBZs3prcxZqc6qn1XutCUNa+m2n+jbUhLSG
 h7B4TSkzxZy89HNhXYqi0jwauZCxu+OMRECAK4iBof2FJVTOuMLWtIn0U
 zDbTwZlIU6OOGfWNSJXhRiebUf3XjANp9s3tBvaB6MzWzdkdARrpE3K5Y
 uGQrJFjtHKiV+d4EbEP80XGrI+0g8MbLjVYY2EN22ehW947b5tp/0qT6d A==;
X-CSE-ConnectionGUID: oe1FkHlERRGfhiBmPOpLYg==
X-CSE-MsgGUID: 9rLqA5gTSuuc6wjlciQUGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="74243969"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="74243969"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 06:15:57 -0700
X-CSE-ConnectionGUID: mF0Tr4TVTgSXs/DMLsD7rQ==
X-CSE-MsgGUID: /tqYRHGYSri+FGM+Rb+4MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="138329163"
Received: from tronach-mobl.ger.corp.intel.com (HELO [10.245.84.129])
 ([10.245.84.129])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 06:15:51 -0700
Message-ID: <c26c38da-401e-4044-8b9e-cd5547e61677@linux.intel.com>
Date: Mon, 12 May 2025 15:15:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] accel/ivpu: Use effective buffer size for zero
 terminator
To: Markus Burri <markus.burri@mt.com>, linux-kernel@vger.kernel.org
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Nuno Sa <nuno.sa@analog.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org,
 Markus Burri <markus.burri@bbv.ch>
References: <20250508130612.82270-1-markus.burri@mt.com>
 <20250508130612.82270-3-markus.burri@mt.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250508130612.82270-3-markus.burri@mt.com>
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

Thanks for the fix, applied to drm-misc-fixes

On 5/8/2025 3:06 PM, Markus Burri wrote:
> Use the effective written size instead of original size as index for zero
> termination. If the input from user-space is to larger and the input is
> truncated, the original size is out-of-bound.
> Since there is an upfront size check here, the change is for consistency.
> 
> Signed-off-by: Markus Burri <markus.burri@mt.com>
> ---
>  drivers/accel/ivpu/ivpu_debugfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_debugfs.c b/drivers/accel/ivpu/ivpu_debugfs.c
> index f0dad0c9ce33..cd24ccd20ba6 100644
> --- a/drivers/accel/ivpu/ivpu_debugfs.c
> +++ b/drivers/accel/ivpu/ivpu_debugfs.c
> @@ -455,7 +455,7 @@ priority_bands_fops_write(struct file *file, const char __user *user_buf, size_t
>  	if (ret < 0)
>  		return ret;
>  
> -	buf[size] = '\0';
> +	buf[ret] = '\0';
>  	ret = sscanf(buf, "%u %u %u %u", &band, &grace_period, &process_grace_period,
>  		     &process_quantum);
>  	if (ret != 4)

