Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A779777462
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 11:24:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E4910E168;
	Thu, 10 Aug 2023 09:24:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CE0710E168
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 09:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691659444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MgJznRW6COYgmWSteDKgszecQ7aSR0WLVQheeXmmJT0=;
 b=aoA9plKAB15xU+Ao1Kw1hnYT9hu/3pzAPU1KQFAegm9NwljSflUuYq3DYii8mdp2xqqVCz
 edjjDHEBGmsQgxXwnKyP3GN/oekMSAJeER8HUa4HM1T7BhEluwt1Qqwu7QeQOU4yYkoCMB
 eMDnEH7BRU8WtdRKGUHxZzuLOuUC1DM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-262-kDSHXx8MOdyyYzyo-VxxGw-1; Thu, 10 Aug 2023 05:24:01 -0400
X-MC-Unique: kDSHXx8MOdyyYzyo-VxxGw-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3fe182913c5so4102615e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 02:24:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691659440; x=1692264240;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MgJznRW6COYgmWSteDKgszecQ7aSR0WLVQheeXmmJT0=;
 b=G5vVVlPlldRGXLYWjzbWapel0az3xgr9Zn//+iqBtUMIjUrAtIIoOG4GD8c3SqnNhU
 LdT+put9kYF5eAEiyAcNz8CWsJPvDqGvXR+crRe6+Uybj5iwoT/syBShEqGTHCX9/ZEP
 NaDHPZDYlUPC6l7FrLqGiyEtyoJ1Gpbn67i8aVfKrBL0s3Jh6Tz/pfckWWN/wRfZQG49
 ST+Y+htPmcOCFDOBFV51xFvQAB0L2xig3Grv7L3KAcvKVRG9hzkaJFYXu9Poptthho92
 BdMFvq9DLZjFx54hyZYIf8D93yGezd/6zzvLzaOpKiLOmgtTs4VdEBDsq+LunYZJJGUa
 iswQ==
X-Gm-Message-State: AOJu0YxDupricztCz9gAfcuka7U06i6IKWlZ4OECcxhqzbAlJALEacZH
 swTngPhSHAICRxzvuEOu9qguVBPuRTt1TuX3z7U3hscsIlb3PVXZlaK2H8I58NlZPo2VRYUKMi4
 XZU4mOLis+KoMW3WwYa2fJVHRFGrG
X-Received: by 2002:a05:600c:218:b0:3fe:1b9e:e790 with SMTP id
 24-20020a05600c021800b003fe1b9ee790mr1416324wmi.2.1691659440341; 
 Thu, 10 Aug 2023 02:24:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcwbcVPTd0G5rpLYQaP+xG3yRnjd3OIKnJINBMIovDeDvzDtNdCHg99wK+165258p+DTB1/g==
X-Received: by 2002:a05:600c:218:b0:3fe:1b9e:e790 with SMTP id
 24-20020a05600c021800b003fe1b9ee790mr1416317wmi.2.1691659440063; 
 Thu, 10 Aug 2023 02:24:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 c19-20020a7bc853000000b003fbc0a49b57sm1521434wml.6.2023.08.10.02.23.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Aug 2023 02:23:59 -0700 (PDT)
Message-ID: <39fa372e-c828-dff0-e79f-5024b0a47e00@redhat.com>
Date: Thu, 10 Aug 2023 11:23:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/1] drm/fourcc: Add documentation about software color
 conversion.
To: Simon Ser <contact@emersion.fr>
References: <20230807140317.26146-1-jfalempe@redhat.com>
 <20230807140317.26146-2-jfalempe@redhat.com>
 <nQb7qV9Caf3Dz2iA2hmv_CC6zJ-7u7Odzz_NU2SB7AcbkGMq5pBnOhh7N2PtIPQfymH_N5wUfNKV1AkKqx36j-DiMVwDzHeH3wgwI5bUdNQ=@emersion.fr>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <nQb7qV9Caf3Dz2iA2hmv_CC6zJ-7u7Odzz_NU2SB7AcbkGMq5pBnOhh7N2PtIPQfymH_N5wUfNKV1AkKqx36j-DiMVwDzHeH3wgwI5bUdNQ=@emersion.fr>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: tzimmermann@suse.de, javierm@redhat.com, mripard@kernel.org,
 ppaalanen@gmail.com, dri-devel@lists.freedesktop.org, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/08/2023 18:29, Simon Ser wrote:
> Looks good to me.
> 
Thanks for reviewing it.

> Maybe the IN_FORMATS prop docs is a better place for this?
> 

you mean to move it here ?:
https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_plane.c#L132

I don't have a preference since it's my first contribution to the drm 
documentation.

-- 

Jocelyn

