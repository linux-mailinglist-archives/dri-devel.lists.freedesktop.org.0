Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E444D228C
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 21:26:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97BF410E5B1;
	Tue,  8 Mar 2022 20:26:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E2F10E5AA
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 20:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646771211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RMQmtW3v05zKNQrwevDEhtCno7x2QWP4Qsh7pV7OZ5s=;
 b=JP8E4EJqHqi9MDrssfgXrpnSK9Lga7/tsGoZPsR/9QZf/OAXao5ZgZCSEyavXhgaJ1ncrK
 kHKQ7HkRIgjxGpZC08/I15eBu51ortP8cIGKQv3unOUyG1Yex247S/WiPjvBYAxWky7Ni4
 9nFPv6LVTWja+xUNjYSWdGsn05v5TCU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-7TbCu2tZMPiz0Z_Wyy-eTQ-1; Tue, 08 Mar 2022 15:26:50 -0500
X-MC-Unique: 7TbCu2tZMPiz0Z_Wyy-eTQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 h131-20020a1c2189000000b003898de01de4so117050wmh.7
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 12:26:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RMQmtW3v05zKNQrwevDEhtCno7x2QWP4Qsh7pV7OZ5s=;
 b=yY4BTUXbNwhQgH4rN/YWGMghImMXfeesDXd92hJxW8Ll6MD2N5mu8uU3Nnw+NN5ys5
 OW7MNX7rptpnLp3Y08gHeaDAt2LonDNkk1sCfyBtYsdBtK76PO6fCb2DY+NaJXpPxmN5
 f0IDrk0X4vM1oAE6gAFrtOoVwEse5egRD+rSE3kEe6rX/X2meilnwwNouJzvz77eANSI
 ti8JUyOPV+cpf9jPkp1v8sTBaalTG+saLKs1aiID5c+2OslYVLhYVVRM//X8ogWyYQ9b
 u+joVjSbhJX2l0LRjKIFVCbxEWeznfTRqOM8XWmEZlgG1g6sxfXaBfhTz1Fm/g+WM0RB
 7TCA==
X-Gm-Message-State: AOAM533cVQMiV5iox41xHq3wZWuMxxySSi640gawRuQJ0kmMrNk7tHee
 EgO2xZGIo4HilXFqRWX1idrYKDfHe6td4nqQs/2GM/PQugih0FPIXJIXj2KhCBQ3zZynQ7Cn4Kh
 9cmk0aFd1+q3tLj7YHBYwpyl0ii2t
X-Received: by 2002:a5d:6c66:0:b0:1f1:f12d:442d with SMTP id
 r6-20020a5d6c66000000b001f1f12d442dmr10118541wrz.338.1646771209074; 
 Tue, 08 Mar 2022 12:26:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyKuAg1VR4l1vd12voS5+qOu/V/59vrX4cDu1pjnI1UYEckpmfcpauj2P20/BvN5ULfcP1YjA==
X-Received: by 2002:a5d:6c66:0:b0:1f1:f12d:442d with SMTP id
 r6-20020a5d6c66000000b001f1f12d442dmr10118534wrz.338.1646771208868; 
 Tue, 08 Mar 2022 12:26:48 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 i5-20020a1c3b05000000b00382871cf734sm3175363wma.25.2022.03.08.12.26.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 12:26:48 -0800 (PST)
Message-ID: <4bb757d3-bb2d-122f-1b13-25cf3ebb4407@redhat.com>
Date: Tue, 8 Mar 2022 21:26:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] drm: ssd130x: Fix COM scan direction register mask
To: Chen-Yu Tsai <wens@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20220308160758.26060-1-wens@kernel.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220308160758.26060-1-wens@kernel.org>
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
Cc: Chen-Yu Tsai <wens@csie.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Chen-Yu,

Thanks a lot for your patch.

On 3/8/22 17:07, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
> 
> The SSD130x's command to toggle COM scan direction uses bit 3 and only
> bit 3 to set the direction of the scanout. The driver has an incorrect
> GENMASK(3, 2), causing the setting to be set on bit 2, rendering it
> ineffective.
> 
> Fix the mask to only bit 3, so that the requested setting is applied
> correctly.
>

Sigh, you are correct. I thought that triple checked the datasheet
when writing this but I got it wrong anyways...
 
> Fixes: a61732e80867 ("drm: Add driver for Solomon SSD130x OLED displays")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

