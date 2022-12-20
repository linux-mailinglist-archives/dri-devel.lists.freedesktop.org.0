Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 548CB651D79
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 10:34:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C685810E361;
	Tue, 20 Dec 2022 09:34:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BBCB10E360
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 09:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671528836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fVZMgP3yXzrzjDhtvsp+tMbNXy6x5UaaSyaJJzd0B0g=;
 b=e9TRzOd1GM9BZy7nwUeFTzI2fs+3M19xRDSziQ7diozTs1U+dG32FnVeAxrndE+2rscfhV
 6sZIO//1MHH0nEQuphwpdWDT0gBLnOIcHFvZ+SFr87IT8IcNP5ab2G/BsS2RWSaCKvsWYp
 tTh9xmVYGQ0Qy2zAiARa2HEbY71FJ/E=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-247-9wG_0uYUP7G490o0FrsQsg-1; Tue, 20 Dec 2022 04:33:55 -0500
X-MC-Unique: 9wG_0uYUP7G490o0FrsQsg-1
Received: by mail-wm1-f70.google.com with SMTP id
 g9-20020a7bc4c9000000b003d214cffa4eso2396304wmk.5
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 01:33:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fVZMgP3yXzrzjDhtvsp+tMbNXy6x5UaaSyaJJzd0B0g=;
 b=ypK3obLMW0Xh03xe+t2af74QMVth4h7Fx2QpmFoijCJ4lDHW/MzHTISoy9XSUHIxP/
 6/YU+Hf45NiHfc6lcPiclgV+nPIUC79deYO3Wl9FDzskRCqFQNnNHJ9ATUX8CV2huUx1
 rlyWUfzaNSRGvvGMk/yZZKPn0a1LjNALk1urcnmlROpuRX9A1JGirxYaYagu260GRR86
 CKFHxl6ww2jnHo58AapY2Jm/xJwk/4vyW5olWntjRkTe/f2pzTyhVOPnbK9zPrPHq0Ha
 LwzHBfugPJKbzQ+Qpu33NcNGQ4FcohchJNbh6AjDIpQ53zr8Bjz3v0GTMssy/LZ2DKyD
 Ljbg==
X-Gm-Message-State: AFqh2krL60iydutKrsf4dkdD24O06NdjFacF5Fi4pnn9x38nTPhxJVrB
 /xyfItxB39y7CcfAISZ16DrDr3xOhbVLEU0W+B1G3jmxilhVTxOvH++OW1ZV0UuX7dsO0QtAyx5
 Mx09bXbP05yCFwqGzFZrJX/WH+R77
X-Received: by 2002:a05:600c:b59:b0:3d6:4ba9:c111 with SMTP id
 k25-20020a05600c0b5900b003d64ba9c111mr241650wmr.40.1671528834237; 
 Tue, 20 Dec 2022 01:33:54 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsPd0UOZgaV2usn9FHot5yPumcQTQ0WuQ30V9fRvNh8brfS+c9839HDYnoS7vxUK6doBa1czQ==
X-Received: by 2002:a05:600c:b59:b0:3d6:4ba9:c111 with SMTP id
 k25-20020a05600c0b5900b003d64ba9c111mr241645wmr.40.1671528834044; 
 Tue, 20 Dec 2022 01:33:54 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 bd26-20020a05600c1f1a00b003d070e45574sm15319946wmb.11.2022.12.20.01.33.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 01:33:53 -0800 (PST)
Message-ID: <8f63bb10-e1e4-0111-5032-dca1b4a2f437@redhat.com>
Date: Tue, 20 Dec 2022 10:33:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 10/18] fbdev/efifb: Add struct efifb_par for driver data
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de
References: <20221219160516.23436-1-tzimmermann@suse.de>
 <20221219160516.23436-11-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221219160516.23436-11-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-hyperv@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/19/22 17:05, Thomas Zimmermann wrote:
> The efifb_par structure holds the palette for efifb. It will also
> be useful for storing the device's aperture range.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

