Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBAsGHp0gGnU8QIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 10:55:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF531CA535
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 10:55:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35B9E890B2;
	Mon,  2 Feb 2026 09:55:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="xe3ESWIN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCCC8890B2
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 09:55:01 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-48069a48629so43872325e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Feb 2026 01:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1770026100; x=1770630900;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=x69aZ/PCgH5m4sapPYNqP9yFQBKilACu2vK1FG07GVk=;
 b=xe3ESWINuQl4mAh4BihgetySJOD5PVIVr6YTMSJ4qbHn0h2xmC+DkHCvCfuQMf/wWM
 zhj/cUAu60selgIOAtSWY5Sa5yVbx2b8EtUYEKIhkVC/EVU649y+QO20rdVj1GtmMIoT
 leZ1GQrfTRsyZJJPusBuH7KdhYC5PWnh4E5rVBqYfFx+mKVv8x3yIM0mZD7gTEvZsv0Y
 aSpny/1DtEojyu87g2bWDO6hbxvfruX7jDra5Q8X3S1PVFMwtxP9OrB21g0PQKtQib4L
 SH312BXK7EMo22l+IKWQk8v/PI4RTk6mfA8cijycJRLzODMkzW20MhqAj2uPL6G/U8l4
 P84g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770026100; x=1770630900;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x69aZ/PCgH5m4sapPYNqP9yFQBKilACu2vK1FG07GVk=;
 b=gjE3P3kUkrqSKjnlt6VcjrcdTbBBuhaJDoeH2c8Pe8ZNfCLP+2BY/linNLGITD+TJe
 pfrkTdoMUveoXDdKUS85FJ85O8KO5CnyWz6jigjQUdKPuxLtsaKm16qrchICiSNc109r
 /xx/mbEYHnKw/IXxpgyA9WGm/gqJXd781VxZP+daQs07axgcgSL4fNtYPeOkucOom4x+
 UkuJsF8RejLDCc5XcgDIDd2n04s1JQHI7IWO3BfSvPllma/hZACPipPinJsdrUma00sU
 t0BcJbl2I044WDdVr51SUhko27+VuWryNTMlzaFaAtrAb5ZaXAhLeX//Tay8UTeifR8i
 CWgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwaFIPlNvQ8/n9MJSnukGzs7SuMXEmVlNKjNrfOTiJNCFKoeRELl3Ykm02rdJcNZPImKH1hBl/9Mk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwI4ZjyZej/8Ods+WggjbYKgZJhYOPQxDo24p/pDQUdiHuKES9e
 3mpDlx26zsaYtvPJ15trrnj35zlm8wSn7fJpLi0TLTEsl3egxa+sSU1VtHphIQS1RZg=
X-Gm-Gg: AZuq6aIhgfTI7MaZzJ7iv4HwGFXGwNC8pE83KQb46EIFYb1WDk/A+YmToUHgB5KaKLc
 w6vEiGJC/RH6rDhsW7+NnY7ILGEjbIl6krL3+De6yF++wiqrfE8LbzixioKq16X8xmurY46QZHl
 uuHajEjN5Aj83uJMYanmi03yms93Rjs7A/D7AZG3kzGNDz4Or4oKg6lhNkH/2Vdpwe/4GM2iu7I
 2h7AbE+4SBWblH3j5Glyd3TkviELNVLim5qv5/8EwKyd5bLcwbJ4gWEDkTaHb4Lv7A55mLtQJbI
 JNajueYPh2L5kGLZnDboCcOVxhczjQpx+NJ7anYcIatzS910Y5vB8zz0BbbLoy5UsxagbmP0aI0
 xfjixLOZiDzScgKg6a0qMuSdvEPmgSjMQ/iVhr8IsRZ+ETtmVHH6FR+1slGwAkfprY2CYgrL+/r
 o+UPWY+QsGZAj+LRRORG+4L5fhjwmTn4pjsRkwnJ1Gz78PHIUU7H3SapLBYVzqe1irIffC9GalF
 qqdj8ne6ouOCTxJAk47ggwgI+NnpYC84VRdt64/ZqJdcfgTMFU0hZxF6Z7xtTqj9HuK1Ag7
X-Received: by 2002:a05:600c:3b23:b0:477:af07:dd1c with SMTP id
 5b1f17b1804b1-482db49fbdfmr150380875e9.35.1770026100077; 
 Mon, 02 Feb 2026 01:55:00 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066c4f3edsm433200195e9.15.2026.02.02.01.54.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 01:54:59 -0800 (PST)
Date: Mon, 2 Feb 2026 09:54:57 +0000
From: Daniel Thompson <daniel@riscstar.com>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 linusw@kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] backlight: sky81452-backlight: Check return value of
 devm_gpiod_get_optional() in sky81452_bl_parse_dt()
Message-ID: <aYB0cRwmiIb0vVnq@aspen.lan>
References: <20260202075410.155375-1-nichen@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202075410.155375-1-nichen@iscas.ac.cn>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nichen@iscas.ac.cn,m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:deller@gmx.de,m:linusw@kernel.org,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[daniel@riscstar.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20230601.gappssmtp.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@riscstar.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: AF531CA535
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 03:54:10PM +0800, Chen Ni wrote:
> The devm_gpiod_get_optional() function may return an ERR_PTR in case of
> genuine GPIO acquisition errors, not just NULL which indicates the
> legitimate absence of an optional GPIO.
>
> Add an IS_ERR() check after the call in sky81452_bl_parse_dt(). On
> error, return the error code to ensure proper failure handling rather
> than proceeding with invalid pointers.
>
> Fixes: e1915eec54a6 ("backlight: sky81452: Convert to GPIO descriptors")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/video/backlight/sky81452-backlight.c | 4 ++++
>  1 file changed, 4 insertions(+)

Thanks for the fix.

Small review comment below:

> diff --git a/drivers/video/backlight/sky81452-backlight.c b/drivers/video/backlight/sky81452-backlight.c
> index 2749231f0385..e3e5306fab84 100644
> --- a/drivers/video/backlight/sky81452-backlight.c
> +++ b/drivers/video/backlight/sky81452-backlight.c
> @@ -202,6 +202,10 @@ static struct sky81452_bl_platform_data *sky81452_bl_parse_dt(
>  	pdata->dpwm_mode = of_property_read_bool(np, "skyworks,dpwm-mode");
>  	pdata->phase_shift = of_property_read_bool(np, "skyworks,phase-shift");
>  	pdata->gpiod_enable = devm_gpiod_get_optional(dev, NULL, GPIOD_OUT_HIGH);
> +	if (IS_ERR(pdata->gpiod_enable)) {
> +		dev_err(dev, "failed to get gpio\n");
> +		return ERR_CAST(pdata->gpiod_enable);
> +	}

Using dev_err_cast_probe() would make this change more compact and give
a better error message for the user.
>
>  	ret = of_property_count_u32_elems(np, "led-sources");
>  	if (ret < 0) {


Daniel.
