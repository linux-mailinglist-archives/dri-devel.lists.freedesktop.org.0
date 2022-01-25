Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EAD49BD54
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 21:40:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4F5C10E3ED;
	Tue, 25 Jan 2022 20:40:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAF7410E3ED
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 20:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=mvUJSAebKkRB+lgViRYbpCTTlvrAohmMaeU/GWRYPN8=; b=YTwMSEuPR7d+zRgdkpSBHn3QOM
 8N8N7raV22tIBHgVeYcKS0NQ2nKGsd6UTLl6e1WeveHS/ETV9KPODONVoNc2mF/EEYuw8YICsylAM
 RI8knU3CXNCS9QvuEXRmdU+w1ytqSDLg3y34FZ0p1EXrq9wIJ5KHNqLgFIEINHwY3ugv8kAUR0jbN
 XmpvyAxG1bw6XKVkZJNdTu8gk5dzB4iPa5K72YbrLjNq5FVClIo7RBJ3w5zo4/rJ9Y+fNwKcAb5ku
 c+JuGGiW+PCmjY/t+VVX8BJv1XsbdhS+F2i5PFLLlP9+LWN9JMzFE99PImgIAQny0AbjtHrL2Cbpb
 QvfHYGcg==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCSbz-003Ywk-Pp; Tue, 25 Jan 2022 20:40:20 +0000
Message-ID: <34f76f2a-1e41-d7ef-d135-7be56dba88ae@infradead.org>
Date: Tue, 25 Jan 2022 12:40:14 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 4/4] fbtft: Replace 'depends on FB_TFT' by 'if FB_TFT
 ... endif'
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Phillip Potter <phil@philpotter.co.uk>, Lee Jones <lee.jones@linaro.org>,
 Heiner Kallweit <hkallweit1@gmail.com>, Carlis <zhangxuezhi1@yulong.com>,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <20220125202118.63362-5-andriy.shevchenko@linux.intel.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220125202118.63362-5-andriy.shevchenko@linux.intel.com>
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
Cc: Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>,
 Michael Hennerich <michael.hennerich@analog.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/25/22 12:21, Andy Shevchenko wrote:
> Replace 'depends on FB_TFT' by 'if FB_TFT ... endif'
> for the sake of deduplication.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/video/fbtft/Kconfig | 33 ++++-----------------------------
>  1 file changed, 4 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/video/fbtft/Kconfig b/drivers/video/fbtft/Kconfig
> index 4d29e8c1014e..14ea3c6a60da 100644
> --- a/drivers/video/fbtft/Kconfig
> +++ b/drivers/video/fbtft/Kconfig
> @@ -10,87 +10,75 @@ menuconfig FB_TFT


Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

thanks.

-- 
~Randy
