Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F757589774
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 07:47:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EE3E1121F8;
	Thu,  4 Aug 2022 05:47:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B18D211249A
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 05:47:12 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id y13so20985029ejp.13
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Aug 2022 22:47:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=+Qy5efYo9rDk2BsamMw6aPZr7j8DOLrxvf8t4GZMPAc=;
 b=c4i1LXWsip+MyvihhsYAC9rtDU9CZw/VBQru187NyOFyHxlhIciq4nF+WbGKZQ7akp
 njCtOx1Obp2UNCPnW0pIIp11Syh0plGpbHIXs+PCXPApUjN/AqDQADvuAl3qNHbwURa+
 /PNVIXmNbhl2sxNufhmjFcFyRbG7hzeL8q2dD6ugc8UYHjpd2NgGrHRW/T7aa9yg/B+U
 oXXyz0Eoc1nkvzLQnDvPFSeJg+PlT9dRCNBJtUS/PlmJBOvfp5ICFBae8xSfgYUxP4ER
 rP7FzyCYw5bebEVwWCVTpaix31+tULl+CDAO1HqKCaCvlxxPf7mbcDuv7f/XTJgA9kDw
 kCrA==
X-Gm-Message-State: ACgBeo0LaKcOUc/AMrThL/77jmxfmmOJIflNk7SC+tk6huAYqpK4JwUv
 BL2BgWxz9U9pdPaUVrNhtmg=
X-Google-Smtp-Source: AA6agR4oUuaNBzJoYT26uMDLtGGEjB1kpaM/SRsRVEbHpQbaFOy7rHx5Ud1iTdXfq+qFj1rrnNWe+Q==
X-Received: by 2002:a17:907:3ea8:b0:730:9756:7c81 with SMTP id
 hs40-20020a1709073ea800b0073097567c81mr189092ejc.726.1659592030840; 
 Wed, 03 Aug 2022 22:47:10 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
 by smtp.gmail.com with ESMTPSA id
 e3-20020a1709067e0300b0070efa110afcsm8002633ejr.83.2022.08.03.22.47.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Aug 2022 22:47:10 -0700 (PDT)
Message-ID: <1eb62346-304b-54d5-8a62-8a35888d51bd@kernel.org>
Date: Thu, 4 Aug 2022 07:47:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] tty: vt: selection: Add check for valid tiocl_selection
 values
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, Khalid Masum <khalid.masum.92@gmail.com>,
 syzbot <syzbot+14b0e8f3fd1612e35350@syzkaller.appspotmail.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <000000000000bbdd0405d120c155@google.com>
 <20220729065139.6529-1-khalid.masum.92@gmail.com>
 <eb4a26aa-da30-ceee-7d27-c1e902dd4218@gmx.de> <YuV9PybMPgc83Jis@p100>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <YuV9PybMPgc83Jis@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 30. 07. 22, 20:49, Helge Deller wrote:
> The line and column numbers for the selection need to start at 1.
> Add the checks to prevent invalid input.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> Reported-by: syzbot+14b0e8f3fd1612e35350@syzkaller.appspotmail.com
> 
> diff --git a/drivers/tty/vt/selection.c b/drivers/tty/vt/selection.c
> index f7755e73696e..58692a9b4097 100644
> --- a/drivers/tty/vt/selection.c
> +++ b/drivers/tty/vt/selection.c
> @@ -326,6 +326,9 @@ static int vc_selection(struct vc_data *vc, struct tiocl_selection *v,
>   		return 0;
>   	}
> 
> +	if (!v->xs || !v->ys || !v->xe || !v->ye)
> +		return -EINVAL;

Hmm, I'm not sure about this. It potentially breaks userspace (by 
returning EINVAL now). And the code below should handle this just fine, 
right:

> +
>   	v->xs = min_t(u16, v->xs - 1, vc->vc_cols - 1);
>   	v->ys = min_t(u16, v->ys - 1, vc->vc_rows - 1);
>   	v->xe = min_t(u16, v->xe - 1, vc->vc_cols - 1);

?

thanks,
-- 
js
suse labs
