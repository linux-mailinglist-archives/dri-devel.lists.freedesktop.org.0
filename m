Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E9561DAE3
	for <lists+dri-devel@lfdr.de>; Sat,  5 Nov 2022 15:18:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45B4C10E15E;
	Sat,  5 Nov 2022 14:18:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C520710E15E;
 Sat,  5 Nov 2022 14:18:20 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id v81so7959403oie.5;
 Sat, 05 Nov 2022 07:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=PYhR6hYWBdnOcbKjn7H8NpQf1Qg9j5JtEEKHrz9oi/g=;
 b=cEC5IT1XpqlAK68Dgo5+fxnDFCjVpzY0DRagRqxTDry42i1dK2tcbNHYd7Ayss+LTR
 Zq5Ih2v2443bsxwUvCZI2AevutQelDkhHOJqQhhh90RAdGwH1ztuIkNBULvbO0OWUDyB
 Zs3Rt+XqCTKE2Cs9eS/ndyLispMby6sUmCV9hIPpDCZ1JKOuE8AnRRE6npVgjTBnltto
 YYH4ZircOfT5HS0GEZGZOnxYVDveuMG1fd0QtTxHxYW8Huxn/roqBK+JFSqL6Tdp87g+
 GSZROE0361WHir4UDtfX6jA945ccs7fZ7mz9TOtoNTCBa80eZ2tSlHY0p6xlLXtkRQTo
 pyNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PYhR6hYWBdnOcbKjn7H8NpQf1Qg9j5JtEEKHrz9oi/g=;
 b=hREJs2Hl+3aNpRTqNaFNUH3z7QlN5EM+pzVFiUddxHfvoys9yOqSwT7NS185NcVHec
 pDBnFRb8Qfp52UA6J17etkMM3+5yuyN1u9h0IAPLIGhBTjJTpBRYte9v/rZApmpVXQeS
 9DP0xNWo2smNcgjscFcrU9V7fmIaHqAOf2eC9oCHy0jEb9NxSKk6sRqLvQRpTTPM7ls7
 kJbsIKtja7Y/xT8OL0pdTfCvZ3p2y3IX+k7LvmUepHFs/5zcuujQ8KhI89vF5KOqfRG3
 TTAMCioW12AOM2KUvgp/0tPwYLHmGowoG/oJpvGgclfduNJ5u7Ko5nh2HBRKGTMG2Hg5
 JzQQ==
X-Gm-Message-State: ACrzQf1UIOVs5ICaXjUfuHQ0QDxj3rn7YYRy/Mnl8AeqQ3EIJLDdxWmx
 IGwtJnQQqoLpdUm+cRVLwgo=
X-Google-Smtp-Source: AMsMyM5In/UjkQAOQkguZQ2rHL63I8msSs9c6an0J/9gKdjSX2hezT8PwL34Y+85tQUi0BEYyplo0Q==
X-Received: by 2002:a05:6808:2104:b0:35a:5e9:a411 with SMTP id
 r4-20020a056808210400b0035a05e9a411mr18764923oiw.168.1667657900081; 
 Sat, 05 Nov 2022 07:18:20 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a056870c0c100b00132741e966asm830469oad.51.2022.11.05.07.18.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 07:18:19 -0700 (PDT)
Date: Sat, 5 Nov 2022 07:18:17 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v4a 00/38] timers: Use timer_shutdown*() before freeing
 timers
Message-ID: <20221105141817.GF1606271@roeck-us.net>
References: <20221105060024.598488967@goodmis.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221105060024.598488967@goodmis.org>
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
Cc: alsa-devel@alsa-project.org, linux-staging@lists.linux.dev,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Thomas Gleixner <tglx@linutronix.de>,
 linux-leds@vger.kernel.org, drbd-dev@lists.linbit.com,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-atm-general@lists.sourceforge.net, linux-afs@lists.infradead.org,
 lvs-devel@vger.kernel.org, linux-acpi@vger.kernel.org, coreteam@netfilter.org,
 intel-wired-lan@lists.osuosl.org, linux-input@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, linux-ext4@vger.kernel.org,
 linux-media@vger.kernel.org, bridge@lists.linux-foundation.org,
 linux-pm@vger.kernel.org, intel-gfx@lists.freedesktop.org, rcu@vger.kernel.org,
 cgroups@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 Anna-Maria Gleixner <anna-maria@linutronix.de>, linux-edac@vger.kernel.org,
 linux-block@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-parisc@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, netfilter-devel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Nov 05, 2022 at 02:00:24AM -0400, Steven Rostedt wrote:
> 
> Back in April, I posted an RFC patch set to help mitigate a common issue
> where a timer gets armed just before it is freed, and when the timer
> goes off, it crashes in the timer code without any evidence of who the
> culprit was. I got side tracked and never finished up on that patch set.
> Since this type of crash is still our #1 crash we are seeing in the field,
> it has become a priority again to finish it.
> 
> The last version of that patch set is here:
> 
>   https://lore.kernel.org/all/20221104054053.431922658@goodmis.org/
> 
> I'm calling this version 4a as it only has obvious changes were the timer that
> is being shutdown is in the same function where it will be freed or released,
> as this series should be "safe" for adding. I'll be calling the other patches
> 4b for the next merge window.
> 

Just in case you didn't notice:

Looking through the resulting code, I think some of the remaining
calls to del_singleshot_timer_sync() can be converted as well.

The calls in drivers/staging/wlan-ng/prism2usb.c:prism2sta_disconnect_usb()
are obvious (the containing data structure is freed in the same function).
For drivers/char/tpm/tpm-dev-common.c:tpm_common_release(), the containing
data structure is freed in the calling code.

Thanks,
Guenter
