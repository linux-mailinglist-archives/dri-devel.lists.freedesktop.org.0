Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC167625747
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 10:49:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D662710E08D;
	Fri, 11 Nov 2022 09:49:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEA4710E08D
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 09:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668160149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5l8q5ZxVXaLzz8d0jV5gKO4snqYrCf3SKQpQlZuJqXk=;
 b=IQrLggejNP+Fpm6TMpNXlLoyk0jxWLnqRnan6m3ce0yvOuA4LxaGjV1c2BYqMx8BkhOec/
 +H6PIo6ZVijEEA8PJRGAfk5Lt6ANGuBXe3jXf16KRA6/2tfOVU98bxMNZYOJlVyzHANNZN
 N5ggEIg4bslIyCMVo54tZYqe2vaNwSc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-647-MOa9AefQM3a9tZIoS6Gj4w-1; Fri, 11 Nov 2022 04:49:08 -0500
X-MC-Unique: MOa9AefQM3a9tZIoS6Gj4w-1
Received: by mail-wr1-f69.google.com with SMTP id
 c18-20020adfa312000000b002364fabf2ceso864662wrb.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 01:49:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5l8q5ZxVXaLzz8d0jV5gKO4snqYrCf3SKQpQlZuJqXk=;
 b=2yMykE4mGEurs25Oq/8WVMxVgyue7T1pn50A+04DJygWSVk73PvS7UKfyXLLtq096M
 valP8qEsjACqtb0EATiheo55dfoJTydF7SDpNDxi2N3wjR5+M03jghYlv4gu35LBjoCl
 4wVuKBwpWpSSg6uI8m/0gsUfNHcvNJcVbE1QAtHVrENAgDd1CNGOVOoL3OWHPcNSkAUo
 9DUREU6h4zWMVA8VM6Oacwmez+HahiYBl7HB+3iTFb4utq3VUd2y0wzY1HMHrDbDub2h
 jaD8cW8yLYp4RHAEU4o1vmxCdVmMkme0auhWZTcxsCK/sgFep4CQ6AABxJX+vA9EaY1C
 47+g==
X-Gm-Message-State: ANoB5plRcV1EXs9ZMKitZpatSJLHSKGuHoQSvOUaOFc1nyvcz7/b24l6
 PNr88TvI27wxcgEnss7IdWA9EwAVWE+GKHc7c/Ls/VPNjdzAukhQBq/KidF1KJkWuxMRSRTmAWb
 K1UzP0DG/P0mdeWdQzTUJyVj8ks4L
X-Received: by 2002:adf:e78c:0:b0:236:704f:29f4 with SMTP id
 n12-20020adfe78c000000b00236704f29f4mr763409wrm.11.1668160146567; 
 Fri, 11 Nov 2022 01:49:06 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7OiT8Sbsve/sCxcNQRsa1xFTdkZSg0vhESZhI+f4jtxiLU7FrJfIbqBEHAWqPu0pqIqgIglw==
X-Received: by 2002:adf:e78c:0:b0:236:704f:29f4 with SMTP id
 n12-20020adfe78c000000b00236704f29f4mr763401wrm.11.1668160146404; 
 Fri, 11 Nov 2022 01:49:06 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 by11-20020a056000098b00b002258235bda3sm1431910wrb.61.2022.11.11.01.49.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 01:49:05 -0800 (PST)
Message-ID: <73c7243d-b1b7-ac3c-7b17-1f0084821aa4@redhat.com>
Date: Fri, 11 Nov 2022 10:49:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 2/2] fbdev: Add support for the nomodeset kernel parameter
To: Thomas Zimmermann <tzimmermann@suse.de>, Helge Deller <deller@gmx.de>,
 daniel@ffwll.ch
References: <20221107104916.18733-1-tzimmermann@suse.de>
 <20221107104916.18733-3-tzimmermann@suse.de>
 <2e2d23f3-9c2d-e75e-f390-4651a4da730f@gmx.de>
 <6547fba2-a002-f339-2997-5b28df794095@suse.de>
 <d21a0a0d-22fb-99bf-0d29-75b1fe1db677@gmx.de>
 <dfa83c75-4062-93ee-380c-3e0e4f41c448@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <dfa83c75-4062-93ee-380c-3e0e4f41c448@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/8/22 09:16, Thomas Zimmermann wrote:
> Hi

[...]

> 
> My proposal would be to add a little helper to fbdev that includes your 
> suggestions:
> 
>    bool fb_modesetting_disabled(const char *drvname)
>    {
>       fwonly = video_firmware_drivers_only()
>       if (fbonly && drvname)
> 	pr_warn("")
>       return fbonly;
>    }
> 

Agreed with this proposal.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

