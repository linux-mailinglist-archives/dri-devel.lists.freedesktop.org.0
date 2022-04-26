Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4CE50F28D
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 09:33:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 475DE10EDC9;
	Tue, 26 Apr 2022 07:33:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5203510EDC9
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 07:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650958432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wRmC1DQ/k6agU2m3aQwj/AgJmdIsJv8Dw+NR+8WEVp4=;
 b=OOu/+Ug/pMnEOT0ZmFPJ21IO1gWR+wkmn1HClUtoz7efywkpGc+VFAM3o1cD6oQNknifEl
 p6S9FbEQA74d769Fu360uo3M6K+Ru80NHzlc2LWesQyR7oGb071pHu7RuyHGhDQF0hN0jT
 O1xw6Wy3k/RJ8CV9nH5dPkYvQ6cFHFA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-5-FGM_BkKYPoiWrM1fPQZ6mQ-1; Tue, 26 Apr 2022 03:33:48 -0400
X-MC-Unique: FGM_BkKYPoiWrM1fPQZ6mQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 k20-20020adfc714000000b001e305cd1597so4127610wrg.19
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 00:33:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wRmC1DQ/k6agU2m3aQwj/AgJmdIsJv8Dw+NR+8WEVp4=;
 b=4oVFhfsiPNyxASC+PHnTDpIlt+LmyCVrCxh0bOZ2AIAoh2PhzoACCKfDOYmNhK4oI2
 x0f/cmBxy/U0bH/h5duoXnPxSqvDMaNx6MBr+wtA9iHGdxo7k/+0SjHKa/4B36ci0Egm
 inOpUB5RfP3BKPJ2GshqGf3EeYM4y/+27Ev3DrbQKAHpv5OcDS009NuPLAqOwnW7Gwm+
 iFbNPbn8B5mQ+KQ2LsFAjkdiyKkZOwJCojXtil4g0vrCtahaEQR1FWSuMI1OHEYywKEH
 NmVXfBHBvf3bIyWOQk7Rlngn3Zuy9MBTmL8hD1SA7o90ajo7gHJAZKju7LdUHxY7MWAJ
 c5sQ==
X-Gm-Message-State: AOAM5310tdK9GCDRFk1pkpF+3vD7pTLw4cwmcDj+Wmv1+8tJ8X65RN0T
 mQhWW3yIB87oMXImyI0V04nn2zMa7G/Ah6pX+0VH0Wda4+yVzMgYJcgpVKgDrMyaDs6pAi8NWV8
 SV7KDBveSHT1zRsGoTBu3rxoQ8Cr6
X-Received: by 2002:a5d:5228:0:b0:20a:d7e9:7ed8 with SMTP id
 i8-20020a5d5228000000b0020ad7e97ed8mr8744221wra.687.1650958427479; 
 Tue, 26 Apr 2022 00:33:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0pJ74DGIlfq53uBbPfFdrOsGvhcsvRNZnwKjFDboyUo35G+GdHkK13CDw3mb3Dr8jjxermQ==
X-Received: by 2002:a5d:5228:0:b0:20a:d7e9:7ed8 with SMTP id
 i8-20020a5d5228000000b0020ad7e97ed8mr8744199wra.687.1650958427130; 
 Tue, 26 Apr 2022 00:33:47 -0700 (PDT)
Received: from [192.168.1.129] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a05600c4e4100b00392910b276esm10388007wmq.9.2022.04.26.00.33.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 00:33:46 -0700 (PDT)
Message-ID: <9b2241cd-1440-4a9b-2ff9-ea92326c2b87@redhat.com>
Date: Tue, 26 Apr 2022 09:33:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] drm/ssd130x: Make ssd130x_remove() return void
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20220425192306.59800-1-u.kleine-koenig@pengutronix.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220425192306.59800-1-u.kleine-koenig@pengutronix.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Uwe,

Thanks for your patch.

On 4/25/22 21:23, Uwe Kleine-König wrote:
> This function returns zero unconditionally, so there isn't any benefit
> of returning a value. Make it return void to be able to see at a glance
> that the return value of ssd130x_i2c_remove() is always zero.
> 
> This patch is a preparation for making i2c remove callbacks return void.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

and I'll push to drm-misc (drm-misc-next) now.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

