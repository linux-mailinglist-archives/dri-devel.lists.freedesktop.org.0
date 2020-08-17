Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E52F247FFC
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 09:51:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84BCB89DC2;
	Tue, 18 Aug 2020 07:50:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 117AA6E0DB
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 13:56:51 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id f9so7720930pju.4
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 06:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EwBPUmMzjIeHY9w/IO7ylAcRHQqFTujUKmssL35PKKE=;
 b=NhI2wzO1qeTXti9CRXY54ifwyBrtv+1cyUKGAnmLB+qkI/Ad/ttTAE4MS6frrQZTIy
 UklMiOldDLEg/2iq8o/kwL7QcnM4PW5x4zDPOAw4vqJqExEiAt2la0jdn4Ko8+gWedCF
 YIOSIbD3Jt5xipp76Tv/sgFbnT9Vmjtq3ZshhjIZbjUpZ022ydnqam/S1LuGECtVj9bX
 fhuNy/pMsrgoBavqvtwD02Cnk4L6GfjTSHc6OhNlNM0LbhTMd5LzQmrN32S4NyJuGq7q
 aUyvx/VivDzdk17iJjbU5VzwHeSWBXq4ZhyaJmooHCDVq0kk5DtBsme/8jiml+FhEGej
 4Ozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EwBPUmMzjIeHY9w/IO7ylAcRHQqFTujUKmssL35PKKE=;
 b=Xz9we/fiqsuvY2k5Y10frvXpQskTORpvePj/bpheTjU50S7MFO4ZBywPya9WIhi210
 2jp7k2XPmAs97J/L1wt36L3OFsdx0gSCsTca1L/xX5WzT8Axv3BG2faYq5fyB8NjDUWw
 SDs+m4DhEjmBx8MaVcuRNtYjvHZl0GmgX6spPMeRfzH4hDgY5yKAFnGlUyUUwDRv7d/c
 wHXKMcmOYdhl92w2ltOREw65znzI21DgnVPLuF09y2o65BcDXJxW2hd/4clrIGYijkaX
 uZNb6n0unDsd6McGvicDXu+mIpbLtOIosJDY68OdSzsF3dEUkUcr+W0KKqEf5fzAuPVD
 V/rg==
X-Gm-Message-State: AOAM530pApAWy5/J6pBObMT0lr3MJWImPFeKz5lA+ffHZiztp4cRcj6I
 qZcgs5a09JTv3sdKlL5LLnBpqg==
X-Google-Smtp-Source: ABdhPJwFH7lYBEvzR88kR4QnSmlWPYxSL+tz5BkwayIdACL+uMf+Xuv3Zqrzz0fKeCUB4oQlNJhqsQ==
X-Received: by 2002:a17:90a:5aa2:: with SMTP id
 n31mr12383701pji.33.1597672611292; 
 Mon, 17 Aug 2020 06:56:51 -0700 (PDT)
Received: from ?IPv6:2605:e000:100e:8c61:ff2c:a74f:a461:daa2?
 ([2605:e000:100e:8c61:ff2c:a74f:a461:daa2])
 by smtp.gmail.com with ESMTPSA id y126sm5565062pfy.138.2020.08.17.06.56.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2020 06:56:50 -0700 (PDT)
Subject: Re: [PATCH] block: convert tasklets to use new tasklet_setup() API
To: Allen Pais <allen.cryptic@gmail.com>, jdike@addtoit.com, richard@nod.at,
 anton.ivanov@cambridgegreys.com, 3chas3@gmail.com,
 stefanr@s5r6.in-berlin.de, airlied@linux.ie, daniel@ffwll.ch,
 sre@kernel.org, James.Bottomley@HansenPartnership.com, kys@microsoft.com,
 deller@gmx.de, dmitry.torokhov@gmail.com, jassisinghbrar@gmail.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, maximlevitsky@gmail.com,
 oakad@yahoo.com, ulf.hansson@linaro.org, mporter@kernel.crashing.org,
 alex.bou9@gmail.com, broonie@kernel.org, martyn@welchs.me.uk,
 manohar.vanga@gmail.com, mitch@sfgoth.com, davem@davemloft.net,
 kuba@kernel.org
References: <20200817091617.28119-1-allen.cryptic@gmail.com>
 <20200817091617.28119-2-allen.cryptic@gmail.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <b5508ca4-0641-7265-2939-5f03cbfab2e2@kernel.dk>
Date: Mon, 17 Aug 2020 06:56:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817091617.28119-2-allen.cryptic@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 18 Aug 2020 07:50:42 +0000
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
Cc: devel@driverdev.osuosl.org, linux-s390@vger.kernel.org,
 linux-hyperv@vger.kernel.org, Romain Perier <romain.perier@gmail.com>,
 keescook@chromium.org, linux-parisc@vger.kernel.org,
 linux-ntb@googlegroups.com, netdev@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-atm-general@lists.sourceforge.net,
 linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org,
 linux-block@vger.kernel.org, Allen Pais <allen.lkml@gmail.com>,
 linux-input@vger.kernel.org, linux-mmc@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net,
 linux1394-devel@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/17/20 2:15 AM, Allen Pais wrote:
> From: Allen Pais <allen.lkml@gmail.com>
> 
> In preparation for unconditionally passing the
> struct tasklet_struct pointer to all tasklet
> callbacks, switch to using the new tasklet_setup()
> and from_tasklet() to pass the tasklet pointer explicitly.

Who came up with the idea to add a macro 'from_tasklet' that is just
container_of? container_of in the code would be _much_ more readable,
and not leave anyone guessing wtf from_tasklet is doing.

I'd fix that up now before everything else goes in...

-- 
Jens Axboe

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
