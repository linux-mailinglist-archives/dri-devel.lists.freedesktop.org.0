Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8FB5FD73A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 11:43:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C06510E6ED;
	Thu, 13 Oct 2022 09:43:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88D7710E6ED
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 09:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665654199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eRHBo5SUeLCV/E2K6kx3b4+ZRZldTZk3UWnaaDGNeBs=;
 b=IZ0P4ZL3N0N1dGgsnjpik20U5UARDmcMJGw4/8TbfQv/hFnD5xdofyeZJknwVzkmrS51Qg
 q2B0yDwv2fSpdWnx5kMgOpddwztgXlGu51+Zx90JmQKpve4f2HczxsHP48bjUQZ5uEVuZk
 Rl8jBuTZLa89Afqkw9KYJFUcs2ZW+7Y=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-493-FBE4U2lHMpyUv5j2IB7w0Q-1; Thu, 13 Oct 2022 05:43:18 -0400
X-MC-Unique: FBE4U2lHMpyUv5j2IB7w0Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 h129-20020a1c2187000000b003bf635eac31so874554wmh.4
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 02:43:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eRHBo5SUeLCV/E2K6kx3b4+ZRZldTZk3UWnaaDGNeBs=;
 b=uPfn5OHXu+7tIZTi33s0pvV6g+vFYr+15X/Fm9fTHn8YhVxAHEMzSKQ+MKQz/u/vZm
 SoVXlB8mOf2xqjixsepST4fs48solGrRrK03JvR8u+mOGWwG3KtPnm5e5mxqZ2riyL12
 wTh7QPkZcdto1L4TomgpXwFl61/R0gB8zpbec/zoK4O6THUaWTyE0EBVbpU9DHiT+x4n
 FSYHJKsQuPpWxF/scehdbVv2k/i0pr5RCFnTSFlfH/aCsQLzlIqwcFLUst4urWysiJd1
 cuMwlhJYa8zXx5jmScNfeo/y/SrcL+L2zIZD3aZNrcDDlokxYUC8PGHe8cHjzhKt01wf
 6+ug==
X-Gm-Message-State: ACrzQf306UnK4Xgh6/p+4DyFPAFWfUVN0IkRK+N4D/JNulks7nyaGOKe
 AMA/yU40RUmQJ8AsyDjjx6jdtmXkCIhJqtcJ/v1o9sf82wqjBF+ZvRCKCWVxwGc6oN6Ud+3OnfH
 z1klNMmqPbugBDX5JA066wsr2BLLN
X-Received: by 2002:a05:600c:19c7:b0:3c6:dd03:2b26 with SMTP id
 u7-20020a05600c19c700b003c6dd032b26mr1846738wmq.37.1665654197400; 
 Thu, 13 Oct 2022 02:43:17 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM42THVg7nhaB7qLqF5GFVCwFxBO1/Ueag57fTSguAHHm0uXxPyMwk7RcOINk5grnJLE3KuYrw==
X-Received: by 2002:a05:600c:19c7:b0:3c6:dd03:2b26 with SMTP id
 u7-20020a05600c19c700b003c6dd032b26mr1846717wmq.37.1665654197222; 
 Thu, 13 Oct 2022 02:43:17 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 e14-20020adffc4e000000b002301c026acasm1570167wrs.85.2022.10.13.02.43.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Oct 2022 02:43:16 -0700 (PDT)
Message-ID: <44ac29ea-7836-1cd6-fced-9ffd88a7f056@redhat.com>
Date: Thu, 13 Oct 2022 11:43:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 2/2] drm/vc4: hdmi: Check the HSM rate at runtime_resume
To: Maxime Ripard <maxime@cerno.tech>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Emma Anholt <emma@anholt.net>
References: <20220929-rpi-pi3-unplugged-fixes-v1-0-cd22e962296c@cerno.tech>
 <20220929-rpi-pi3-unplugged-fixes-v1-2-cd22e962296c@cerno.tech>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220929-rpi-pi3-unplugged-fixes-v1-2-cd22e962296c@cerno.tech>
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/29/22 11:21, Maxime Ripard wrote:
> If our HSM clock has not been properly initialized, any register access
> will silently lock up the system.
> 
> Let's check that this can't happen by adding a check for the rate before
> any register access, and error out otherwise.
> 
> Link: https://lore.kernel.org/dri-devel/20220922145448.w3xfywkn5ecak2et@pengutronix.de/
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

