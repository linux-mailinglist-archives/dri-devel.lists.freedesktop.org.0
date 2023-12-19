Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D03F819289
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 22:51:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B23DE10E01F;
	Tue, 19 Dec 2023 21:51:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBFB110E01F
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 21:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=OPsDtSH0h57ggP/qkMey9XPgpDBsMSDwy2BsxZjvi+w=; b=L4pWeTm2EiAaTLELNMoKdLNe2T
 Ti0MMjaiOL+aRrXQIbutRgZk+uCWXWGjhkWN3/7N+iGUPNBbq7iZqiSGTJYJPG0DQ3tCilpLfroc3
 zWLa8fLa/Tut06doC0+uC/R6YMdX/QcEOpmlW1pto/aXp/vPR8S28aNNtDa4ClX/kesfK0hb4C7XE
 I6VQim4B4+8/sj0yABV0qOKu2t6MokkhHSIATvD4YdS9shO2i9jaDuSodyNU8P1hqEH+iA0Sog2tl
 L+Aph8pXN0u6toRjEPkJu3Lv+w8zb+lllzVaPDH+HrU/F7Edc5ghe2oNI7W195jKLhSz6PBf4M0tn
 Z25vdYLg==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rFhzv-00FWry-24; Tue, 19 Dec 2023 21:51:31 +0000
Message-ID: <0f3bb667-a458-432e-b6bc-1ae8c4277b8e@infradead.org>
Date: Tue, 19 Dec 2023 13:51:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers: video: logo: use %u format specifier for
 unsigned int values
Content-Language: en-US
To: Colin Ian King <colin.i.king@gmail.com>, Helge Deller <deller@gmx.de>,
 Nikita Romanyuk <ufh8945@gmail.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20231219151436.368696-1-colin.i.king@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20231219151436.368696-1-colin.i.king@gmail.com>
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/19/23 07:14, Colin Ian King wrote:
> Currently the %d format specifier is being used for unsigned int values.
> Fix this by using the correct %u format specifier. Cleans up cppcheck
> warnings:
> 
> warning: %d in format string (no. 1) requires 'int' but the argument
> type is 'unsigned int'. [invalidPrintfArgType_sint]
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  drivers/video/logo/pnmtologo.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/video/logo/pnmtologo.c b/drivers/video/logo/pnmtologo.c
> index ada5ef6e51b7..2434a25afb64 100644
> --- a/drivers/video/logo/pnmtologo.c
> +++ b/drivers/video/logo/pnmtologo.c
> @@ -249,10 +249,10 @@ static void write_footer(void)
>  	fputs("\n};\n\n", out);
>  	fprintf(out, "const struct linux_logo %s __initconst = {\n", logoname);
>  	fprintf(out, "\t.type\t\t= %s,\n", logo_types[logo_type]);
> -	fprintf(out, "\t.width\t\t= %d,\n", logo_width);
> -	fprintf(out, "\t.height\t\t= %d,\n", logo_height);
> +	fprintf(out, "\t.width\t\t= %u,\n", logo_width);
> +	fprintf(out, "\t.height\t\t= %u,\n", logo_height);
>  	if (logo_type == LINUX_LOGO_CLUT224) {
> -		fprintf(out, "\t.clutsize\t= %d,\n", logo_clutsize);
> +		fprintf(out, "\t.clutsize\t= %u,\n", logo_clutsize);
>  		fprintf(out, "\t.clut\t\t= %s_clut,\n", logoname);
>  	}
>  	fprintf(out, "\t.data\t\t= %s_data\n", logoname);

-- 
#Randy
https://people.kernel.org/tglx/notes-about-netiquette
https://subspace.kernel.org/etiquette.html
