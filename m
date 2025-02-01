Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1FFA24AFE
	for <lists+dri-devel@lfdr.de>; Sat,  1 Feb 2025 18:19:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3793810E16C;
	Sat,  1 Feb 2025 17:19:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nqYumLYF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9185510E16C
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Feb 2025 17:19:02 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-540218726d5so2858045e87.2
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Feb 2025 09:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738430340; x=1739035140; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=71bnsC2oO6LHEbwy3diuH2zhR6b0aYnH+9+cp/aJomY=;
 b=nqYumLYFlUaorlq8OdQnrNUKew46qf7pm5RkxxzkbELBN9Z3aJdrKFDq+JPOVF6hm/
 Ya4fQr/z82zxDcalhxOTi3pITtqsghULwdianT5Yf0OA6k1xjTc3Lbl2siBX9uuJTMt/
 B19e9NDMzNo1sEnewNofmPqooP5ycdnuf+7H/syjVAOgCQJxTIGjgO5oDWqM4aCzp6RV
 QVau6xyr72KP43mwRTtsu5o8GfCu6fpVN8EMAirS59awUZQPMIpyLu/QSL2f7JKJB1Ud
 L/r7jDGlvpa4Xcd+T6k4JGkduEEktilr4F7vmCb1ec0OKZQJp1P8r9g88qacZJn0iCsG
 aJcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738430340; x=1739035140;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=71bnsC2oO6LHEbwy3diuH2zhR6b0aYnH+9+cp/aJomY=;
 b=RBVz3TywRUJFUqda2bFoeRUk8id9izzRxYKWsq/+Stp57DixYx319AzMcvaZXsqedK
 bNug42gbxagflZSfVa89Cpsw8/bzmyv83Fu21hZ8naDw+wDJwL5uZORXHnX4fLXSRU9D
 Fv9qEdiV1gdwwyOgt+GF4lR4UMx8qNz9AE4Cv+fCHdqcoJccUHhRYzis+9wB1bCwsx29
 KTba6WrWfh34dbekAQ7DiTRf7Z4Vt0YrQFC8wGWBDVPlvj73AakcHULfZf2qqRfLmTAN
 iEhK47OkaUE3ZiCin4kiZjqdYIr2z19aFLVoRSyBuD8BtxEayRxcXWpjfrletxoKrSkV
 iYpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoNg8o/f04H9i8F8QRD6eMYGXb2BAU/fwFLasei2EyK827gMPNjCZ6dKYHzoEmfcN9+GaxbbGvSDk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+YcfFJ5oKvP0pDbBU9FgNrPWdrdl6aBLUacTe+q905RYygsJT
 J+gXvSrPnMTTIQ+hWMuMBRjUoD5InoiwklciA5mCtjsxq4YZCR+f8WVciEfFsTc=
X-Gm-Gg: ASbGncsJbbtSJAXRzFZAXRQC6zAP7tqGH2wsvRvw7SbqL2uvdJqUFBam/s27Xpsp9kF
 OdaRp7+ij0xSSp8h3qKyBF6DQuyDBihZQW8PCBBKr1XZeY2QSq3/nddiPN2IgRSzplC/ZfVCKzb
 dQaTZMk7yQnvg3Q/srXhFHWIXsf0LK/uWQt5ezaQH2UDoI6AsBDY+58C5ZOFQDw9NFOQQ+VuBPc
 o3XQ3iAnCfPypconxVQwlv7/BhibNkWcV+R2KIWJOKx3zNaNNt+2bm8BoWwuy6HbjlxByE8gDQ2
 iC4CbzHyJ48YHh8ynk7axupNc67mY6AtgOrkaAyHjCGiOHjtYO6jdOayanQSdAli6YMse9U=
X-Google-Smtp-Source: AGHT+IGP/gG4Q+cDNWpkoWzbMqHda4mKxSbGl6ubfsg5AbMmMLOWCJBBnITp7IdIj8yWTDNIAVEjVA==
X-Received: by 2002:ac2:42c7:0:b0:540:2ef4:9cf0 with SMTP id
 2adb3069b0e04-543e4beac3emr4169598e87.18.1738430340412; 
 Sat, 01 Feb 2025 09:19:00 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543ebebea39sm780238e87.224.2025.02.01.09.18.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Feb 2025 09:18:58 -0800 (PST)
Date: Sat, 1 Feb 2025 19:18:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Danilo Krummrich <dakr@kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 1/1] regmap: Synchronize cache for the page selector
Message-ID: <eyjsejpx7klztr4k7xmrvceosfykyozs736kycdnf5uur5by43@5i5x7tsuxtpg>
References: <a193bcb5-1b35-48ba-801b-925ab2f92d6f@samsung.com>
 <Z4pktkZ1ihfkZjHm@smile.fi.intel.com>
 <Z4ppo8wV3nicOfAQ@smile.fi.intel.com>
 <8a7581e4-6422-4d77-8027-02df0d7da489@samsung.com>
 <Z4qTQ9ypkX6iS1Pl@smile.fi.intel.com>
 <42fe4488-0ff2-4b92-ae11-cce1664a7176@samsung.com>
 <Z4-hMdUUTeQHN5W_@smile.fi.intel.com>
 <6b4cba29-786c-4999-ac1d-27b3e4cea6f8@samsung.com>
 <Z5kJLrE6xOzOKaeb@smile.fi.intel.com>
 <Z5pESDSekep9ChAN@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z5pESDSekep9ChAN@smile.fi.intel.com>
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

On Wed, Jan 29, 2025 at 05:07:52PM +0200, Andy Shevchenko wrote:
> On Tue, Jan 28, 2025 at 06:43:26PM +0200, Andy Shevchenko wrote:
> > On Tue, Jan 28, 2025 at 05:08:08PM +0100, Marek Szyprowski wrote:
> > > On 21.01.2025 14:29, Andy Shevchenko wrote:
> > > > On Tue, Jan 21, 2025 at 08:33:09AM +0100, Marek Szyprowski wrote:
> > > >> On 17.01.2025 18:28, Andy Shevchenko wrote:
> > > >>> On Fri, Jan 17, 2025 at 05:05:42PM +0100, Marek Szyprowski wrote:
> > > >>>
> > > >>> Does it fail in the same way?
> > > >> Yes, the hw revision is reported as zero in this case: LT9611 revision:
> > > >> 0x00.00.00
> > > > Hmm... This is very interesting! It means that the page selector is a bit
> > > > magical there. Dmitry, can you chime in and perhaps shed some light on this?
> > > >
> > > >>>> Does it mean that there is really a bug in the driver?
> > > >>> Without looking at the datasheet it's hard to say. At least what I found so far
> > > >>> is one page of the I²C traffic dump on Windows as an example how to use their
> > > >>> evaluation board and software, but it doesn't unveil the bigger picture. At
> > > >>> least what I think is going on here is that the programming is not so easy as
> > > >>> just paging. Something is more complicated there.
> > > >>>
> > > >>> But at least (and as Mark said) the most of the regmap based drivers got
> > > >>> the ranges wrong (so, at least there is one bug in the driver).
> > > >> I can do more experiments if this helps. Do you need a dump of all
> > > >> regmap accesses or i2c traffic from this driver?
> > > > It would be helpful! Traces from the failed and non-failed cases
> > > > till the firmware revision and chip ID reading would be enough to
> > > > start with.
> > > 
> > > I'm sorry for the delay, I was a bit busy with other stuff.
> > 
> > No problem and thanks for sharing.
> > 
> > > Here are logs (all values are in hex):
> > > 
> > > next-20250128 (probe broken):
> > > root@target:~# dmesg | grep regmap
> > > [   14.817604] regmap_write reg 80ee <- 1
> > > [   14.823036] regmap_read reg 8100 -> 0
> > > [   14.827631] regmap_read reg 8101 -> 0
> > > [   14.832130] regmap_read reg 8102 -> 0
> > 
> > 
> > 
> > > next-20250128 + 1fd60ed1700c reverted (probe okay):
> > > root@target:~# dmesg | grep regmap
> > > [   13.565920] regmap_write reg 80ee <- 1
> > > [   13.567509] regmap_read reg 8100 -> 17
> > > [   13.568219] regmap_read reg 8101 -> 4
> > > [   13.568909] regmap_read reg 8102 -> 93
> > 
> > Something is missing here. Like we have an identical start and an immediate
> > failure. If you did it via printk() approach, it's probably wrong as my patch
> > uses internal regmap function. Most likely you need to enable trace events
> > for regmap and collect those for let's say 2 seconds:
> > 
> > 	echo 1 > ...trace events...
> > 	modprobe ...
> > 	sleep 2
> > 	echo 0 > ...trace events...
> > 
> > and dump the buffer to a file. It might have though more than needed
> > as some other devices might also use regmap at the same time. I don't remember
> > if the trace events for regmap have a device instance name field which can be
> > used as a filter.
> > 
> > Alternatively you may also try to add a printk() into regmap core, but I don't
> > think it's more practical than trace events.
> 
> Meanwhile, can you test this patch (on top of non-working case)?
> 
> diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
> index 2314744201b4..f799a7a80231 100644
> --- a/drivers/base/regmap/regmap.c
> +++ b/drivers/base/regmap/regmap.c
> @@ -1553,8 +1553,19 @@ static int _regmap_select_page(struct regmap *map, unsigned int *reg,
>  		 * virtual copy as well.
>  		 */
>  		if (page_chg &&
> -		    in_range(range->selector_reg, range->window_start, range->window_len))
> +		    in_range(range->selector_reg, range->window_start, range->window_len)) {
> +			bool bypass, cache_only;
> +
> +			bypass = map->cache_bypass;
> +			cache_only = map->cache_only;
> +			map->cache_bypass = false;
> +			map->cache_only = true;
> +
>  			_regmap_update_bits(map, sel_register, mask, val, NULL, false);
> +
> +			map->cache_bypass = bypass;
> +			map->cache_only = cache_only;
> +		}
>  	}
>  
>  	*reg = range->window_start + win_offset;
> 
> If I understood the case, the affected driver doesn't use case and we actually
> write to the selector register twice which most likely messes up the things.

Unfortunately I can not comment regarding the LT9611UXC itself, the
datasheet that I have here is pretty cryptic, incomplete and partially
written in Mandarin.

This patch though fixes an issue for me too, So:

Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # Qualcomm RB1

> But this is only a theory (since we don't have the traces yet).
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

-- 
With best wishes
Dmitry
