Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C76224D30AC
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 14:59:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 414ED10EAAB;
	Wed,  9 Mar 2022 13:59:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDE6C10EA32
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 13:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646834369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sOZK+oC6WCadh4bBlqKBl3sP0Pq7K/G3eW+KWW9PmYo=;
 b=D47A2KT8e+4FosRFoui8WUaEIaOpOG9TM3vTXnCtcOR75iqmI982dOvSLB3gXOkPSf5+FD
 QXeZLazSTbg7tSgzE47mSWmSxayUOADdG7nJ+rhYDfEID48kfmolKdSSIszWpvHL3Gs4Mc
 WTVlND17mkCqozid2rNclCMMApEj9eM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-MB_-zXbfOc-1FH--aLThvA-1; Wed, 09 Mar 2022 08:59:27 -0500
X-MC-Unique: MB_-zXbfOc-1FH--aLThvA-1
Received: by mail-wm1-f72.google.com with SMTP id
 3-20020a05600c230300b00384e15ceae4so2610119wmo.7
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Mar 2022 05:59:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sOZK+oC6WCadh4bBlqKBl3sP0Pq7K/G3eW+KWW9PmYo=;
 b=oEHttn0R9LOqiFYBjclrCMw81wYmdVWGD4Z9HrCDvgJQqpahpK3WDfOmPsyq3bD/+p
 Gpwc8JHb8XmA5hNq201T3a3gGTq/PO1I/59aX8Nx1Bjzm4Xc7eZ4/5zMbJDvLaR73T3u
 +kIv8bSqm6rnKx+FlMvsGXZDXyv+RXaTe1USE/hgpvylY7iVDL8/UQ1GM11r1CRh9R+E
 csFc+Ad4h0XJ5B0VG/aguyjGvdrS3fq0xyBCB4uB3bR26GzBM984jSo1Mh+KqY8NyA8d
 t1DFtxorILo2tGUPyXabalCMbN3r+8lqBm7B3cbGn+h5eEjdR2QxCd8yVaduEnqRKO8k
 sgWQ==
X-Gm-Message-State: AOAM5331Jcw4sGKydpPaiCE7whq2PbgBWeWN9Ie4TMAtjwpoSBdIXxyw
 yNO0un+WEp2Y9s5ZUm2LCH8Is2biSBs9zBxPoO18f1BWLw+AVt9df7JDlJRv3sm/nFLKUUlTU9a
 sBvXN6V1fBNgrqjRPJbOa9O8uSePq
X-Received: by 2002:a05:600c:3391:b0:389:9c6e:c248 with SMTP id
 o17-20020a05600c339100b003899c6ec248mr7791295wmp.97.1646834366542; 
 Wed, 09 Mar 2022 05:59:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwIdcMORve4/7HEvkFPRK5YEwQuKdbb64jr1wA7wea0uD2fdT12WWdq9cokqRMc8K/PF2dnmw==
X-Received: by 2002:a05:600c:3391:b0:389:9c6e:c248 with SMTP id
 o17-20020a05600c339100b003899c6ec248mr7791281wmp.97.1646834366329; 
 Wed, 09 Mar 2022 05:59:26 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 p15-20020a05600c1d8f00b003899d50f01csm1702307wms.6.2022.03.09.05.59.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 05:59:25 -0800 (PST)
Message-ID: <cc1e4343-8a76-c42b-e7d6-e606afcef359@redhat.com>
Date: Wed, 9 Mar 2022 14:59:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] drm: ssd130x: Fix COM scan direction register mask
To: Geert Uytterhoeven <geert@linux-m68k.org>, Chen-Yu Tsai <wens@kernel.org>
References: <20220308160758.26060-1-wens@kernel.org>
 <CAMuHMdWuWFhs5-ezh_UriPzWsZt02A2AJOTJMiszGpu_3hoqfw@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAMuHMdWuWFhs5-ezh_UriPzWsZt02A2AJOTJMiszGpu_3hoqfw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/9/22 13:56, Geert Uytterhoeven wrote:
> On Wed, Mar 9, 2022 at 2:57 AM Chen-Yu Tsai <wens@kernel.org> wrote:
>> From: Chen-Yu Tsai <wens@csie.org>
>>
>> The SSD130x's command to toggle COM scan direction uses bit 3 and only
>> bit 3 to set the direction of the scanout. The driver has an incorrect
>> GENMASK(3, 2), causing the setting to be set on bit 2, rendering it
>> ineffective.
>>
>> Fix the mask to only bit 3, so that the requested setting is applied
>> correctly.
>>
>> Fixes: a61732e80867 ("drm: Add driver for Solomon SSD130x OLED displays")
>> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> 
> Thanks, this fixes the vertically-mirrored display on my Adafruit
> FeatherWing 128x32 OLED.
> Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
>

Thanks for the testing and review. I've pushed both patches to drm-misc-next.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

