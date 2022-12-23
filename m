Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1106554A2
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 21:58:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FF1D10E254;
	Fri, 23 Dec 2022 20:58:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49BA110E254
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Dec 2022 20:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671829095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+fwm2GPP6ljPqAqBro6/G3VDNHOYIU57et0/yW+eCIc=;
 b=eF2JvtE7mYAbaI/6gMeyTMIMdUIBsHJPWk5UiA/SCJZjUy4DTJzW1hihgX9ry9BLn25QnQ
 lu/S5f++zgNNx8xjPK/vXyG8JNBlX6rISRasBGwPRSkr6hsJPvngXJM85lO6wtubv/YDkD
 m/S0a1WL4ALcvRGcpgCQEDdKwfgaypI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-556-u0gxlNyoOPigyhGB76NrlQ-1; Fri, 23 Dec 2022 15:58:13 -0500
X-MC-Unique: u0gxlNyoOPigyhGB76NrlQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 q19-20020a1cf313000000b003d96c95e2f9so821122wmq.2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Dec 2022 12:58:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+fwm2GPP6ljPqAqBro6/G3VDNHOYIU57et0/yW+eCIc=;
 b=3g0qYjsenKb/Qk5jNnvELG9G0UsHBo2T89PGXYIHiSZ5ekxqw7fAmTX2t5SeK4UkhO
 OFa6oj8Zh0s+YF7EbHhsoUMIXk+mHbZBYmskvm9QEYqKY05wRT8KcWswzo9FCkWjuYp7
 y1VsP8hSsQDltlT5a9DmO4n2Q6KWsb3kE8FzOyC7DWt5cEOapvJRuzNoYquCsDr7mhFp
 BuAbLsQCGgFL/tBM5XWBFAl54vAaP7wERQI/m/XVxuwwkBY1AdiQV1WIDsBf/5bXynx6
 ULczxreYI/02Vc0abwBKKqE4AS4G8/qkcQYVAG2vSlVir8qlZ2zdkUGPBG7231sUd6qS
 mR7g==
X-Gm-Message-State: AFqh2kojGxmOV7HNO4b55CETIYxORuknSC4DYpjwgO3TtL2Aqjb0734F
 +0CU+c3GS560DaceNHsWGg3hgQ4PL/lgZkfrwZMI72hb+F2062QtsmSJReGEWymn9994fwg/d7Q
 Vfvs6Qk7T7dy+Je3nsZCSHALwrrUY
X-Received: by 2002:a1c:4b04:0:b0:3c6:f0b8:74e6 with SMTP id
 y4-20020a1c4b04000000b003c6f0b874e6mr8362265wma.4.1671829092197; 
 Fri, 23 Dec 2022 12:58:12 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvwTJdWPrVbJTWxaWnNIPcDrG7XtjeUPiYxWUCSByVOVLFXktOF9FLaUHm7oBMX/AGjv+cu/w==
X-Received: by 2002:a1c:4b04:0:b0:3c6:f0b8:74e6 with SMTP id
 y4-20020a1c4b04000000b003c6f0b874e6mr8362254wma.4.1671829092002; 
 Fri, 23 Dec 2022 12:58:12 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 19-20020a05600c021300b003c5571c27a1sm6585681wmi.32.2022.12.23.12.58.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Dec 2022 12:58:11 -0800 (PST)
Message-ID: <ad5471ab-643c-fe4d-13cd-4984d4bb4ee9@redhat.com>
Date: Fri, 23 Dec 2022 21:58:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 1/4] drm: panel: Add Himax HX8394 panel controller driver
To: Sam Ravnborg <sam@ravnborg.org>
References: <20221222223830.2494900-1-javierm@redhat.com>
 <20221222223830.2494900-2-javierm@redhat.com> <Y6VyJhz9DTjaDUDa@ravnborg.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <Y6VyJhz9DTjaDUDa@ravnborg.org>
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
Cc: Robert Mader <robert.mader@posteo.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Martijn Braam <martijn@brixit.nl>,
 Thierry Reding <thierry.reding@gmail.com>, Ondrej Jirman <megi@xff.cz>,
 Peter Robinson <pbrobinson@gmail.com>,
 =?UTF-8?Q?Kamil_Trzci=c5=84ski?= <ayufan@ayufan.eu>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Sam,

On 12/23/22 10:17, Sam Ravnborg wrote:
> Hi Javier.
> 
> On Thu, Dec 22, 2022 at 11:38:27PM +0100, Javier Martinez Canillas wrote:
>> From: Kamil Trzciński <ayufan@ayufan.eu>
>>
>> The driver is for panels based on the Himax HX8394 controller, such as the
>> HannStar HSD060BHW4 720x1440 TFT LCD panel that uses a MIPI-DSI interface.
> 
> A few comments/nitpicks in the following.
> I have been away for a while, and paged out most of my panel knowledge,
> so read it all with that in mind.
>

Thanks a lot for your feedback! I agree with your comments and will address
those in the next iteration.
 
> In general - very nicely written driver.
> 
> 	Sam
> 

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

