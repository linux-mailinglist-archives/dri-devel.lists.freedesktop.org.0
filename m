Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF091AB34ED
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 12:32:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F46910E355;
	Mon, 12 May 2025 10:32:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PeJ0af0/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6839010E355
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 10:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747045931; x=1778581931;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=LNx6d+LGN0UuAE1Kev9HiY5qljRgbBixlBjM7cy0ht4=;
 b=PeJ0af0/Pxq1vXe/yO/buDoD60wqeDV6ygTuqnofUSnA69enGLFM885J
 qZVDFvCxW0SurCPUC8qEQZ0iJDPM5HB1eC/aXuKBwdQitukTdzxzxnK9i
 St8S2H8I7qsdHYOzmOlCbalUVMl2nvZTJz3iY6bMfc/eh7drVbsKOV05O
 LWZm+1nxLu3KKgEamLI2xnZ6bDpFLYjc3+ymhX/dEYIzVpbbnzGm7k3+P
 lzCDKpTT4CLyCEaZQ6TipfesuDf4XjJiGqV+uNq6D9GmhBhyb2JwTRmsG
 51Dz4CUzhrb3h66kIjKNull7clkzbIZdumiPX+/9vGvvmEl5pAmX5dBUq w==;
X-CSE-ConnectionGUID: Z6/BgYIjSx6rreF4aVPAzg==
X-CSE-MsgGUID: iEO9BrMySy+njq4ECOWS1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="48832457"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="48832457"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 03:32:10 -0700
X-CSE-ConnectionGUID: /G0itieJSEKZW5XGggzgTA==
X-CSE-MsgGUID: y/nPGEjAS+ypF8F9DpOSLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="174474865"
Received: from snowacki-mobl1.ger.corp.intel.com (HELO [10.245.253.141])
 ([10.245.253.141])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 03:32:04 -0700
Message-ID: <60cf19a2-4f55-4330-991d-5ec76ab5a5f3@linux.intel.com>
Date: Mon, 12 May 2025 12:32:01 +0200
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

Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

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

