Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0318647D08F
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 12:13:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A3A410E178;
	Wed, 22 Dec 2021 11:13:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B132110E178
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 11:13:20 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id v7so4089254wrv.12
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 03:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=HfBElawJtzhNrSHmlCYD39sP+XP1qxUfo+mL3a/bM8I=;
 b=Jjh1I9O7WdU7g2btQnmG84PwI44V9yfLrmt77SFDSJuEFNhQCFzqj9rVN99KvAWCUr
 REojul4yGIg8zLsYJ8OrToOFrPD4eJhnuL0CidyU2PaEKC0mj9kumW76q9TRVlmkFWRq
 Uvza4ZHd7FJOa1t6Oa+ZDlJlJ7zA4M3YWI//rUfCusEcfGnIb0lg3ItRHsc3t/S6PwOD
 fmomfU5WQGcjxYizt1fXbIvK7qA7y5K9fPaEGii7gfWSF4olAEBKxObnnI+iR2aokbfi
 HEcvuvsn3aehnWxmRY76jJAFsNCkrmuZMp1LmKXlIzZi7u9C519mAvn0Rh0RN00TAFah
 D63g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=HfBElawJtzhNrSHmlCYD39sP+XP1qxUfo+mL3a/bM8I=;
 b=D17RCi8x5Qmg7WsZX2EOxQdATA5CNq5np2Q7c4KTxST8YunAoAPMY3F0p9uBPjMCTA
 BCyy6MlbQW65R9q+HfaZXhBbrrMGJBPH0DCpP6nygaSlv3dZAAKQczRYpDtE7cCbecla
 D6uiaHv2AK/fHFtIqLeFsKSmZ8njsFY7Kt28qSDGAjBZ57UcneNfBwnhOpXPn4LGG72R
 g27eSo7B+d+bbhWJVikUEjFDj0TBMFaMNKIn5n8UD/CVMKeZIIM8Nj67OSfogvIJDOL6
 Z5lp/Xxhia5luIDh79jO3t3qedX8kkvEe4LXpLhY6cSiHvcr+4k/0RTzXwu+eKk2A3Bp
 o68g==
X-Gm-Message-State: AOAM532NDeQqVqFqID5+rpOJVNdfPpftp3WlQHPvVNVHSbGElYHaY/4W
 Ia7XXmjrZgJnQxJzBzbuGa99jw==
X-Google-Smtp-Source: ABdhPJzUUG4cG1zv1O67xCVnRg6aEBix0K14FY3aVSgrCUzZxhWS8d9KxrvjQ8RV7gKNXmf+y2j35Q==
X-Received: by 2002:adf:fb05:: with SMTP id c5mr1710185wrr.497.1640171599177; 
 Wed, 22 Dec 2021 03:13:19 -0800 (PST)
Received: from google.com ([2.31.167.18])
 by smtp.gmail.com with ESMTPSA id g6sm1641465wri.67.2021.12.22.03.13.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 03:13:18 -0800 (PST)
Date: Wed, 22 Dec 2021 11:13:17 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 1/3] backlight: lp855x: Move device_config setting out
 of lp855x_configure()
Message-ID: <YcMITVYgx6MXP9Kd@google.com>
References: <20211102225504.18920-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211102225504.18920-1-hdegoede@redhat.com>
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
Cc: Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tsuchiya Yuto <kitakar@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 02 Nov 2021, Hans de Goede wrote:

> Move the setting of the lp->cfg pointer to the chip specific
> lp855x_device_config struct from lp855x_configure() to
> lp855x_probe(), before calling lp855x_parse_dt().
> 
> This is a preperation patch for adding ACPI enumeration support.
> 
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Please keep sign-offs in chronological order.

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
