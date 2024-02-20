Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 469C185B717
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 10:18:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D10810E27B;
	Tue, 20 Feb 2024 09:18:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fzeibqOF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E9710E27B
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 09:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708420712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vkzby9wfQQhUZRcpTbjHhp7P8uZMSLkRfL4T/QvrGZM=;
 b=fzeibqOFR6I0bPKENMFbyZu99C1K7QyPoXCFajwmIV1UIhT0imIg0ngad+Ers4txEZqgqX
 tlH4D+U2kQi7IBFjR1OZGVzQq3ql6XF1Tm1lJzp7Dd1RzSWK6Z/m43V+7TKqgCgDGd2Lbj
 DWEtPDCBhcBuy9ZIGWUCK62ecjoM6IU=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-65-g_4z4CZcOcqoqkcjXtHxmw-1; Tue, 20 Feb 2024 04:18:30 -0500
X-MC-Unique: g_4z4CZcOcqoqkcjXtHxmw-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-511a4a286f2so4592909e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 01:18:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708420709; x=1709025509;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vkzby9wfQQhUZRcpTbjHhp7P8uZMSLkRfL4T/QvrGZM=;
 b=t05Xc0BlLJjbHV91ON/WNx+BdTfueea/dU0nitrbYs5D6sfWkZ0DyBhW6aNHA5Dpo0
 aia9ZNpgB5SisBZca6RogHYEjawJzptZ50hlTh577OtQpxHCUFKhvimQJwMNPT6jdqfc
 kkx1kfmHH6qDuwn9su/sK8Hs30PvX0j/f6vEtSxYDXKC8ZaSs6oXNE6Zcb/AoLYmBnuG
 f/06uu+cnuGttdiWnu099fscrxojrZy7RaYJdkClyWt3lLCy2IuIioVigqoaB6+2fh8O
 7Z+f5CLKtRf6l4o2T4LMkYvwNe/GUUqbQrdst99tTXMkK7TcA2PpYMhTbGtX7nrS30/D
 7hnA==
X-Gm-Message-State: AOJu0YwpJdLElSCrDidMNxahxeUsMvFH25DZlNy3zjyqVPm8aTT2rD/6
 TyfoS7PSIG649+d1lum/7RQuXoAQJ/Th5cgasqsdOM375Xm/hvAvb4H0jRVvCobxOBN0LwiVoQx
 UWcl1RtP+raCPaHE4D/D/J51RUqqTvEVtzF1SCOzPHQIfSbHxq2Otmwsu8gtXBIzhpw==
X-Received: by 2002:a05:6512:159:b0:512:a93a:f5a1 with SMTP id
 m25-20020a056512015900b00512a93af5a1mr4334354lfo.36.1708420708953; 
 Tue, 20 Feb 2024 01:18:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHEEqm11cyvxMjF1g+2iM0xRpkZ3M4fWTa6V4c4a2kufWdQQu89dk7xHknoOQDeqxrJBoK9pA==
X-Received: by 2002:a05:6512:159:b0:512:a93a:f5a1 with SMTP id
 m25-20020a056512015900b00512a93af5a1mr4334341lfo.36.1708420708638; 
 Tue, 20 Feb 2024 01:18:28 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 v21-20020a05600c445500b0041266f5b041sm5575587wmn.34.2024.02.20.01.18.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 01:18:28 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, deller@gmx.de
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-input@vger.kernel.org, linux-pwm@vger.kernel.org, Thomas Zimmermann
 <tzimmermann@suse.de>, Robin van der Gracht <robin@protonic.nl>
Subject: Re: [PATCH 02/10] auxdisplay/ht16k33: Remove struct
 backlight_ops.check_fb
In-Reply-To: <20240212162645.5661-3-tzimmermann@suse.de>
References: <20240212162645.5661-1-tzimmermann@suse.de>
 <20240212162645.5661-3-tzimmermann@suse.de>
Date: Tue, 20 Feb 2024 10:18:27 +0100
Message-ID: <878r3fjxy4.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

> The driver sets struct fb_info.bl_dev to the correct backlight
> device. Thus rely on the backlight core code to match backlight
> and framebuffer devices, and remove the extra check_fb function
> from struct backlight_ops.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Robin van der Gracht <robin@protonic.nl>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

