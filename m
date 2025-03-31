Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FED3A764C1
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 13:11:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FF8310E104;
	Mon, 31 Mar 2025 11:11:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="WhZPoZGy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93B3E10E11D
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 11:11:37 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-39ac8e7688aso3472876f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 04:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1743419496; x=1744024296;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=A/z9KaeViB+nABb+i0f3FPF1rJaPqOeT5WIFGvfG0zY=;
 b=WhZPoZGyOkHXY8bVFi3Na0jVYDmP2+DWAuHOTRVNuuTHAqr2yxHUSsG+NEqu7b9FF5
 ESB0lFRU4h1mRwSMp/npD0dKf2Od3NJHUHT+NVusTcMIt6/BWAcBJ8gvsNDGdGuKjdJm
 bA6fOEn3KoT8JL/jNzOuoVm4qc0zgZkoaKz4Iu90QhD4qjdE1z7csmslzn+Ehu+lGOtf
 3PnWiTu8XsvghuMPJ/z0G2dFcqYKWKvPXc8CAFUu+vdbG5rkpvdxMRDadc7sKsXoiFaz
 UpTGKt2dR/jf9ee1EK2x26izt8qyUFmM1H7fGYo+90OKRPFy/idDTObG0NpXsIQFgO3B
 zfaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743419496; x=1744024296;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A/z9KaeViB+nABb+i0f3FPF1rJaPqOeT5WIFGvfG0zY=;
 b=D0e9jh9PXZSTrWoV3/R5LyUT093zu5TPw3VS5dd10oC+Jd0b5naAwdziQFVulXGJNP
 wbtnPpVSulgVIBdsWpQhzoZhEVJQmhYRpUFCl6I/M1HO1Bm7QMpxRCKsXiOzfP/U7MZr
 B/nxSCYvvNuXpafb+t7ErfZxDXNap+3iPm2ru8H6zvl9Un5epNVv7e4J7eQMqrUN5Cwa
 zaBegMJglycpvzCLeFV7u/ifUgcOnDPUMX2QaZgdIIRAO2czObQRaiZH4O1tJ/82Sls+
 AYA+M3LX6gX6HEb6dW5pMZm0Ynnnee7VQ4uCHeom7ZpaRvOYJIwXxBN4vrxb5hWuDkyA
 /IoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuRUKJx5ZWs61Dn4NYIvk5q1pZpX7ejOGACZ3K5vO7/7iS9PPbqdeW5GNwDDGXU75e4CBxPs97RTk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxxqCU+Hp4LTu6FNWTAqJehJ1H46qIfSlr9MbqhAq142RVmcIEa
 TtQex2XWnzHjiiQFb/uF0r8YhOFPCgDNMt4gtuutUX9dNFv41qf+6DRw2ffGQhg=
X-Gm-Gg: ASbGncse9W+1MmSW4dDLLQQZ2VYRf+AOtTewGJtD0EWhZIGAPRY58OXNfuaWUWVsslL
 /XHURW9RHHTlLQvWfgSb3iNcAdAg8JSV6at75sOCzheFtzqSNETSCtjtOAIriPiuiYZhsRwR/t1
 2arODCj0Ze2h+eWqD/QoRkZonYJdTHkPoTsheu79c6DRGtLnSOKP800tqdNdd/43yzMa32YimVX
 ihHwGpl1Yw3ZCBXO3l3TpZ0P8BAzsJm4M+fA58Scj+1hbOfK2cP0H+35HKONlanTUTzG8XgxlXB
 iguZ6QthM3EfVgjg+nOxXX3vwiueysA5fxdHfL+URNbjxHPLVPhvLt5WQ5Q9fIlVsZz2aqSanI3
 jx1slGcbAqhTYj94A3HBIBy8JF0sH4WNVZ99pOw==
X-Google-Smtp-Source: AGHT+IHbzgndrMf5AmHgtnob+9Zffklj+mzgcK1rt8g4VD0vaNiQLwfQIes1v+pMENrKBCJDAmITYA==
X-Received: by 2002:a05:6000:2d10:b0:38f:23f4:2d7a with SMTP id
 ffacd0b85a97d-39c12117dc4mr4659354f8f.40.1743419495944; 
 Mon, 31 Mar 2025 04:11:35 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d82efdff2sm161702445e9.17.2025.03.31.04.11.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Mar 2025 04:11:34 -0700 (PDT)
Date: Mon, 31 Mar 2025 12:11:32 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Henry Martin <bsdhenrymartin@gmail.com>
Cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] backlight: qcom-wled: Add NULL check in the wled_configure
Message-ID: <Z-p4ZLkyIIeyVzPm@aspen.lan>
References: <20250331091245.6668-1-bsdhenrymartin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331091245.6668-1-bsdhenrymartin@gmail.com>
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

On Mon, Mar 31, 2025 at 05:12:45PM +0800, Henry Martin wrote:
> When devm_kasprintf() fails, it returns a NULL pointer. However, this return value is not properly checked in the function wled_configure.
>
> A NULL check should be added after the devm_kasprintf call to prevent potential NULL pointer dereference error.
>
> Fixes: f86b77583d88c ("backlight: pm8941: Convert to using %pOFn instead of device_node.name")
>
> Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> ---
>  drivers/video/backlight/qcom-wled.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> index 9afe701b2a1b..db5eda8ec37e 100644
> --- a/drivers/video/backlight/qcom-wled.c
> +++ b/drivers/video/backlight/qcom-wled.c
> @@ -1406,8 +1406,14 @@ static int wled_configure(struct wled *wled)
>  	wled->ctrl_addr = be32_to_cpu(*prop_addr);
>
>  	rc = of_property_read_string(dev->of_node, "label", &wled->name);
> -	if (rc)
> +	if (rc) {
>  		wled->name = devm_kasprintf(dev, GFP_KERNEL, "%pOFn", dev->of_node);
> +		if (!wled->name) {
> +			dev_err(dev, "Failed to allocate memory for wled name\n");
> +			return -ENOMEM;
> +		}
> +	}
> +

No objections to the check but I don't think it needs a dev_err(). It
is a waste of .text to store a string that is likely never to be
printed.


Daniel.
