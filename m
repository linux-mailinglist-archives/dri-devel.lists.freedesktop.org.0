Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6294C2DF6
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 15:13:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CFBD10E79D;
	Thu, 24 Feb 2022 14:13:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CC9910E79D
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 14:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645712016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DI4zjY4lS3dLYa5nzsSOjq7YbhKMDTz4i784koPAZIE=;
 b=YRzqvLuVF73vgHGuk6nOG41GuDyWsM79scktHXY/g7QJYKnKktfQ7qCUc1ZPC6TfR0jEX+
 AKlqm+Zdm6gZtqNnK7SxVsj5DGCkz0iRKGfFRju/0zC7ZHSAkaJyOYUiRuNyFCP77CFPxt
 9gTu/G81/hEWAGJ6gSngLxS/wx15xo8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-336-4H4sphsdOTyF8U_MZ6tzvg-1; Thu, 24 Feb 2022 09:13:35 -0500
X-MC-Unique: 4H4sphsdOTyF8U_MZ6tzvg-1
Received: by mail-wr1-f70.google.com with SMTP id
 v17-20020adfc5d1000000b001e6405c2b56so820445wrg.7
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 06:13:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DI4zjY4lS3dLYa5nzsSOjq7YbhKMDTz4i784koPAZIE=;
 b=lNj6TMW825oCLAqiBEyElgL9cbST0YuOjUYgFD7TW5i8BGKt4FiB9f7OAwvUAdzVOr
 XqLVgwqRhWtXbPzl3HgjeNEA8ZnX3P1OTapLguUdTu+rnvnAmLqHkuSQFlSDTKMOWDTd
 z4bCE0GBiviAtAuuE6yz9OreSE5gmRGPMhJEAgM5ALcUTBluhItivLQfYZUbcqRfVt5f
 i0KBGwgxayOkTSEF10dW6A+UTx7Ut2V/38VeFxFwnkG8jrctycucj6ZxHeIKYdeFCzTD
 /71ud1qoIwZcU8mHo53HBxCnxPp4hknF15PCQ3+8WzGZz0hjagGqiZ6GGPjVDU69FZE5
 1VaQ==
X-Gm-Message-State: AOAM530wVJEWpE5m0eRi1QkatOgfBgavCuqDZPJek+5B9A0D5h/SwNDY
 k3k8eimJib2CxXcM1FSb9XiFDqxucxll4z72qQY4FRzQk1IjUDea8QPfd9BKTq4BZcrA3t8HXnk
 //dZbtPfvrxEOuF42wZZmjunmTi+6
X-Received: by 2002:a5d:598a:0:b0:1e6:29fa:bab1 with SMTP id
 n10-20020a5d598a000000b001e629fabab1mr2418374wri.671.1645712014042; 
 Thu, 24 Feb 2022 06:13:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwfe4fe2v5GNRVeILo1VPG5IYB2PUYvG9TFe/BPVsWuewrn8CyZCp4t8/Wq1fckULquHMMqfA==
X-Received: by 2002:a5d:598a:0:b0:1e6:29fa:bab1 with SMTP id
 n10-20020a5d598a000000b001e629fabab1mr2418357wri.671.1645712013830; 
 Thu, 24 Feb 2022 06:13:33 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id f3sm2887683wri.6.2022.02.24.06.13.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 06:13:33 -0800 (PST)
Message-ID: <fe202ad8-3035-6ff0-e298-8228c6aa61bb@redhat.com>
Date: Thu, 24 Feb 2022 15:13:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/repaper: Use format helper for xrgb8888 to monochrome
 conversion
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 linux-kernel@vger.kernel.org
References: <20220223193735.213185-1-javierm@redhat.com>
 <af865ac6-0353-0004-dec2-f227ee8bb01d@tronnes.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <af865ac6-0353-0004-dec2-f227ee8bb01d@tronnes.org>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Noralf,

On 2/24/22 15:04, Noralf Trønnes wrote:
> 
> 
> Den 23.02.2022 20.37, skrev Javier Martinez Canillas:
>> There is now a drm_fb_xrgb8888_to_mono_reversed() helper function to do
>> format conversion from XRGB8888 to reversed monochrome.
>>
>> Use that helper and remove the open coded version in the repaper driver.
>>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>> ---
> 
> Tested-by: Noralf Trønnes <noralf@tronnes.org>
> Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
>

Thanks a lot for testing and for your review.
 
> Do you have commit rights and will apply this patch?
>

Yes, I do. Can apply this later today.

Best regards, -- 
Javier Martinez Canillas
Linux Engineering
Red Hat

