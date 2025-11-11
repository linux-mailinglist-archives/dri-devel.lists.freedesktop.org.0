Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB93C4D46F
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 12:04:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D38F210E551;
	Tue, 11 Nov 2025 11:04:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=aruba.it header.i=@aruba.it header.b="AXJ4e5dw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 422 seconds by postgrey-1.36 at gabe;
 Tue, 11 Nov 2025 08:17:03 UTC
Received: from smtpweb147.aruba.it (smtpweb147.aruba.it [62.149.158.147])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A32410E4FF
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 08:17:03 +0000 (UTC)
Received: from [192.168.1.56] ([79.0.204.227]) by Aruba SMTP with ESMTPSA
 id IjRpvB89Z3rWiIjRpvo9yP; Tue, 11 Nov 2025 09:09:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1762848599; bh=e2VKfhLBtfetGdLzQaFZSLBhdVbkUGkXPf4jjXRKteg=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=AXJ4e5dw+jSyszcMYBEFl9RCo64n6ctWLi7ALyEfBW2CsNHdns58uFEPi6BIP0fSo
 +tB0UztyXs5sQMBKQyycck0J3O4LR0Dnk3QAhsnI09tGu8FmU8DcYE1wR6HJcad5yZ
 TLc+0c06i9zJ5NVTRlQs5GjG5nsPj9le/gGOTqLTjYyWY5Qcu3FWjQq5gmMaKCWsin
 /zKDeh7ZKMAATnb3tk1WbFnrvz4a8/3SGmCbbZzLCD1af4amWVvDCH5XIDWdZFYyW6
 QyGNAYKhUugKEMfbzLpPCuFgDDAzuQZNrfICnaEmr/m/0fSopNWEOSkZx7p8Qn9Y80
 b8l0RNeGvbW6A==
Message-ID: <6c8b4205-e5d2-4bce-a1ab-addb099097b8@enneenne.com>
Date: Tue, 11 Nov 2025 09:09:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 18/23] pps: Switch to use %ptSp
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Corey Minyard <corey@minyard.net>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, "Dr. David Alan Gilbert" <linux@treblig.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Matthew Brost <matthew.brost@intel.com>, Hans Verkuil <hverkuil@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Vitaly Lifshits <vitaly.lifshits@intel.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Calvin Owens <calvin@wbinvd.org>, Sagi Maimon <maimon.sagi@gmail.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Karan Tilak Kumar <kartilak@cisco.com>,
 Casey Schaufler <casey@schaufler-ca.com>,
 Steven Rostedt <rostedt@goodmis.org>, Petr Mladek <pmladek@suse.com>,
 Max Kellermann <max.kellermann@ionos.com>, Takashi Iwai <tiwai@suse.de>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-mmc@vger.kernel.org, netdev@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-pci@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-staging@lists.linux.dev, ceph-devel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Jonathan Lemon <jonathan.lemon@gmail.com>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Richard Cochran <richardcochran@gmail.com>,
 Stefan Haberland <sth@linux.ibm.com>, Jan Hoeppner <hoeppner@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Satish Kharat <satishkh@cisco.com>,
 Sesidhar Baddela <sebaddel@cisco.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Xiubo Li
 <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
References: <20251110184727.666591-1-andriy.shevchenko@linux.intel.com>
 <20251110184727.666591-19-andriy.shevchenko@linux.intel.com>
From: Rodolfo Giometti <giometti@enneenne.com>
In-Reply-To: <20251110184727.666591-19-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: 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
X-Mailman-Approved-At: Tue, 11 Nov 2025 11:04:01 +0000
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

On 10/11/25 19:40, Andy Shevchenko wrote:
> Use %ptSp instead of open coded variants to print content of
> struct timespec64 in human readable format.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Rodolfo Giometti <giometti@enneenne.com>

Thanks,

Rodolfo Giometti

> ---
>   drivers/pps/generators/pps_gen_parport.c | 3 +--
>   drivers/pps/kapi.c                       | 3 +--
>   2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pps/generators/pps_gen_parport.c b/drivers/pps/generators/pps_gen_parport.c
> index f5eeb4dd01ad..05bbf8d30ef1 100644
> --- a/drivers/pps/generators/pps_gen_parport.c
> +++ b/drivers/pps/generators/pps_gen_parport.c
> @@ -80,8 +80,7 @@ static enum hrtimer_restart hrtimer_event(struct hrtimer *timer)
>   	/* check if we are late */
>   	if (expire_time.tv_sec != ts1.tv_sec || ts1.tv_nsec > lim) {
>   		local_irq_restore(flags);
> -		pr_err("we are late this time %lld.%09ld\n",
> -				(s64)ts1.tv_sec, ts1.tv_nsec);
> +		pr_err("we are late this time %ptSp\n", &ts1);
>   		goto done;
>   	}
>   
> diff --git a/drivers/pps/kapi.c b/drivers/pps/kapi.c
> index e9389876229e..6985c34de2ce 100644
> --- a/drivers/pps/kapi.c
> +++ b/drivers/pps/kapi.c
> @@ -163,8 +163,7 @@ void pps_event(struct pps_device *pps, struct pps_event_time *ts, int event,
>   	/* check event type */
>   	BUG_ON((event & (PPS_CAPTUREASSERT | PPS_CAPTURECLEAR)) == 0);
>   
> -	dev_dbg(&pps->dev, "PPS event at %lld.%09ld\n",
> -			(s64)ts->ts_real.tv_sec, ts->ts_real.tv_nsec);
> +	dev_dbg(&pps->dev, "PPS event at %ptSp\n", &ts->ts_real);
>   
>   	timespec_to_pps_ktime(&ts_real, ts->ts_real);
>   


-- 
GNU/Linux Solutions                  e-mail: giometti@enneenne.com
Linux Device Driver                          giometti@linux.it
Embedded Systems                     phone:  +39 349 2432127
UNIX programming
