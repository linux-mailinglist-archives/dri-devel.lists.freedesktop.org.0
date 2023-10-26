Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 455D77D7F8D
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 11:30:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A04F10E113;
	Thu, 26 Oct 2023 09:30:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2664410E113
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 09:30:28 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-307d58b3efbso445237f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 02:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698312626; x=1698917426; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=JzN3kghX0r8zpxRcc0ENszPUJaJiNNkjOsgmWnftG5k=;
 b=LGdsU+Vt0qN/Ob79GUN02k/rE1RK2OMGJ7f5tOBP0re1vMsHmmK+KxxVWGkDjxfvcu
 3c7xNWjb8RPMuPXuMBArQXnGrVtq+Jly82o2ojrTaLszzzAPcByZyX4RHArwrxLUO67P
 tcW7JaSLi6MX+HsVJnbUFcveVEohoY/D2wCeLkvA8EKsauq5NmOfteqvKTZB9l+xnPu8
 iDKkJLJXyf0wsUGR8tdQgjAhuwehv2LEwKC42jdSOmT/djcJoiQHUx1uxvu6tnrQKWu8
 VLrWRRSmEGxBv7Hp5l0Aeq81q9XVpdVJj9iAKIqii7zdwT1fL5JKFYQ2oCgFk/7J4zO2
 vV6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698312626; x=1698917426;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JzN3kghX0r8zpxRcc0ENszPUJaJiNNkjOsgmWnftG5k=;
 b=dsncXvN30yb35I/3za0dOnD8+At0x/q0FKn2IoIKFRmoWr3iYZQwjJnb28EN58+1s3
 zIPlRokhTqB2mTbqd68awkjHLbqDnlh5XBYDs3gOINxFmznUelHhZgbKr1l4TYbmjxWb
 xC1/chFYIYSZ2JRjniinb4oeodTbLXUB5D0hBR8Usde7Ox2O5YGbwaorepdRydmdUAcG
 c9rBKwfjyLj1fMdlJ6cBBQtOcPbMPDu7jLF1Dw6E+P/9R7bwlb7RoijHYCsGe8cSHuRv
 kBHThMR/jOCDWLe4trkOvIpwSF1Ppea77bk8Wd/FW4Rx8NWci0u3S94OuViByoe8VatV
 HKYA==
X-Gm-Message-State: AOJu0YzlZ4eEtPd05x6YLUQCI3nsWyXsM4Yr3FdpHmhkmN4Yp7f7ginl
 5X2nTIFdWxlFunbsjc4QR92iwQ==
X-Google-Smtp-Source: AGHT+IFbCJ2aNN5hfs6KLklgeQ8R+R7dBY0KqY6VDKCiFgk6oQIaJA1xQzDXWqNVc6p9WIW1ERMmVw==
X-Received: by 2002:a5d:4b4b:0:b0:32d:8401:4057 with SMTP id
 w11-20020a5d4b4b000000b0032d84014057mr11785427wrs.15.1698312626501; 
 Thu, 26 Oct 2023 02:30:26 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 p17-20020a5d68d1000000b0032d687fd9d0sm13842098wrw.19.2023.10.26.02.30.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 02:30:26 -0700 (PDT)
Date: Thu, 26 Oct 2023 12:30:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>
Subject: Re: [PATCH v2] vga_switcheroo: Fix impossible judgment condition
Message-ID: <6a5f2bff-cef4-4287-b72d-0db91c850de4@kadam.mountain>
References: <20231026091804.967960-1-suhui@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231026091804.967960-1-suhui@nfschina.com>
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
Cc: tzimmermann@suse.de, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, mripard@kernel.org, Jim.Qu@amd.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 26, 2023 at 05:18:04PM +0800, Su Hui wrote:
> 'id' is enum type like unsigned int, so it will never be less than zero.
> It's better to check VGA_SWITCHEROO_UNKNOWN_ID too.
> 
> Fixes: 4aaf448fa975 ("vga_switcheroo: set audio client id according to bound GPU id")
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
> v2:
>  - add check of VGA_SWITCHEROO_UNKNOWN_ID(Dan's suggestion). 
> 
> By the way, all functions of 'get_client_id' will never return error code
> or VGA_SWITCHEROO_UNKNOWN_ID，should we remove this check or keep it for
> future.
> 

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

