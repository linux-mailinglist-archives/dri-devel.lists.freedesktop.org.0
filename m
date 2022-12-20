Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F01651ECB
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 11:27:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C70010E374;
	Tue, 20 Dec 2022 10:27:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35E6E10E374
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 10:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671532019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rjiGojIYvWrKQ82nWhvQA0dTaFlB1ke61shXGuJDDWY=;
 b=Es34/wBx1oIttVX9akeMZxjboIdTAJg8noIMc22mQXRpnBXsrpS0ihbtZp/2AWDqt6VVsv
 iyGHe4KbVjufE3fZvi2xtW7f2QV2UWDKzfx7kEne87ONs2DeO53PMcxGlJcsyZtRlAVE+b
 w8AtN7gqM9+ZaMYDsl+f7DcvJ90pT6o=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-627-yxdzz5DrPuqTE1yuGmqAgQ-1; Tue, 20 Dec 2022 05:26:58 -0500
X-MC-Unique: yxdzz5DrPuqTE1yuGmqAgQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 r67-20020a1c4446000000b003d09b0fbf54so7845678wma.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 02:26:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rjiGojIYvWrKQ82nWhvQA0dTaFlB1ke61shXGuJDDWY=;
 b=5gqLvRdcRgV/lX3vbXjArPNaKcZs7YFzy3aj2nBVP2mG3Wjdp8K6edH4ILD1QySb04
 WMcYhAKKJOtnbWhdSv72ygwoO6CEG/uqmWR5EhO3iGtyWrrr8S5GFuSYbHuhYKj5kV8y
 NOVl/5qBax+90qDgIMelqY8E50rO1MP0jlo/ONInVsfIBYgYIey3ApflhCo+doExY0Cb
 BDcb2ZWN8KE13/UK1xIb/0xU8Xo0GiGZItFnpm10Z9KWtBIr+wn/MX9/oyxTr7kvJ2N1
 Nj5ryqDRPG7REn7E6sHggkvk7PzfF4Kbcj5FrVdj8gz5bLhEeOVo5TDDXydNwM0ZKC7u
 /r4w==
X-Gm-Message-State: ANoB5plwb7FbjJRzYOtk5uqI5rX3uDVvnLHyhBFD7V5jqeWRePe9rkzA
 MfTjHQF07OOx8SbWjmkEq3yekQuaFH25G31LUf6sQlxQXrNPrG5Yv5t1wznQZrwnvllpEJ7tzVl
 9eQHd9gMYTbmp5q5sdbKjGn+1DSkV
X-Received: by 2002:a5d:5001:0:b0:242:86e7:72c2 with SMTP id
 e1-20020a5d5001000000b0024286e772c2mr37348374wrt.50.1671532017163; 
 Tue, 20 Dec 2022 02:26:57 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4YgLGbsns8VZggTlYJxuOcKHT3iplDn35V1/ZBxoM94W+VHULM5ACzzgl3QeaB6beaGjDj9w==
X-Received: by 2002:a5d:5001:0:b0:242:86e7:72c2 with SMTP id
 e1-20020a5d5001000000b0024286e772c2mr37348361wrt.50.1671532016960; 
 Tue, 20 Dec 2022 02:26:56 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 bo21-20020a056000069500b00228d52b935asm12474520wrb.71.2022.12.20.02.26.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 02:26:56 -0800 (PST)
Message-ID: <7c619f8c-02e8-74d1-3c83-37b1e3f5f45e@redhat.com>
Date: Tue, 20 Dec 2022 11:26:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 2/9] drm/format-helper: Flip src/dst-format branches in
 blit helper
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 jose.exposito89@gmail.com, mairacanal@riseup.net
References: <20221213201233.9341-1-tzimmermann@suse.de>
 <20221213201233.9341-3-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221213201233.9341-3-tzimmermann@suse.de>
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

On 12/13/22 21:12, Thomas Zimmermann wrote:
> Upcoming changes to the format conversion will mostly blit from
> XRGB8888 to some other format. So put the source format in blit's
> outer branches to make the code more readable. For cases where
> a format only changes its endianness, such as XRGB565, introduce
> dedicated branches that handle this for all formats.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

