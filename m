Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 889A54EE90C
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 09:24:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72C7010FE73;
	Fri,  1 Apr 2022 07:24:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C40A810FE76
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 07:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648797845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2oSGclBy438u/RoBzl9gqWnQIOvh0fU3X6NhgXoZwww=;
 b=IeZJZCOp5Qvsmsvu02F7R5Jjf/N0Ixf+R4xtaYh8kEHMAGP8KbvFwyojpxsq6x0CvFm4gs
 INJ/nzp1aVaLA3s/OfGAEwnJdtjn7wjInuS667Z5uqbtpBmwBatZL1NH7m1nd5oe+m+MrR
 lNjeKGB5svW1Mc6++FT7P0Eyc9HW4kk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-116-oe2pPdbFN5m279kttuYMbA-1; Fri, 01 Apr 2022 03:24:02 -0400
X-MC-Unique: oe2pPdbFN5m279kttuYMbA-1
Received: by mail-wm1-f70.google.com with SMTP id
 r64-20020a1c2b43000000b0038b59eb1940so2337415wmr.0
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Apr 2022 00:24:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2oSGclBy438u/RoBzl9gqWnQIOvh0fU3X6NhgXoZwww=;
 b=y0qTFWXgKVBoze2nJjCqCvYkycV6eoHN1fomMgV4Pr72IaeUpw4DdfRdjnadrAPwkQ
 G9Ng0lXtUbwMPQBMEzqelrotixXnKKwMlvjUeffFuTFE7c32YjJXf1Petj9tiKgVmtJX
 TvKDotlTs5eGGvrUxA7x04Nd/1WCKCXMu1IsyJz+fVzSUW2qv6c1y7PHCXVj2lFnrCMv
 BSH/1uHiqM/uPJeCZhf5Z7hg/WJlVzszyam+JWWiZ4MdpV/VqwuJBuwJYfakotZEhZDg
 SnE1h7vJq9cW5h0LKPzzQkCp3lih0MiRXObOQLVUqzNyUyf8tDlnzXWOgsHNJ8US5vyd
 ZpKw==
X-Gm-Message-State: AOAM532m1DoeUYdn3gbwWSwpnpKlt2ERoPyHHK5peERvp96jrb41fvcg
 6YtC4Yv578Lc/tSmfImhvCboie8sNo0J5gDXHCZnyFt6MTMN/p9b4+C06pU2DbBy0pEGMQj4WSA
 w2jBXYVioINJfSWm1ZcdE8xG728RH
X-Received: by 2002:a05:6000:2ca:b0:205:9e2d:ae37 with SMTP id
 o10-20020a05600002ca00b002059e2dae37mr6461452wry.128.1648797841111; 
 Fri, 01 Apr 2022 00:24:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsPWO0aP63w7RCr7r6in94LHC4KzeXquHlPh7x9xxo5foJfxVj+34G8/cjbyzXv325ypFulQ==
X-Received: by 2002:a05:6000:2ca:b0:205:9e2d:ae37 with SMTP id
 o10-20020a05600002ca00b002059e2dae37mr6461436wry.128.1648797840914; 
 Fri, 01 Apr 2022 00:24:00 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a5d6d89000000b00203d62072c4sm1423984wrs.43.2022.04.01.00.24.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Apr 2022 00:24:00 -0700 (PDT)
Message-ID: <98e71b4a-43b4-820b-cf2a-a680ca48abe4@redhat.com>
Date: Fri, 1 Apr 2022 09:23:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 5/8] drm/display: Move DSC header and helpers into
 display-helper module
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 jani.nikula@linux.intel.com, lyude@redhat.com
References: <20220322192743.14414-1-tzimmermann@suse.de>
 <20220322192743.14414-6-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220322192743.14414-6-tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/22/22 20:27, Thomas Zimmermann wrote:
> DSC is the Display Stream Compression standard for DisplayPort. Move
> the DSC code into display/ and split the header into files for protocol
> core and DRM helpers. Adapt all users of the code. No functional
> changes.
> 
> To avoid the proliferation of Kconfig options, DSC is part of DRM's
> support for DisplayPort. If necessary, a new option could make DSC an
> independent feature.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

