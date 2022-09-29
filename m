Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4325EF785
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 16:28:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3B4610E296;
	Thu, 29 Sep 2022 14:28:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9767810EAA4
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 14:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664461709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/4Fj0Oo3eJsET2PPIA6x4dHyLWuTC8G70nIQNhebvYQ=;
 b=OA0dc2Lja3tCJffvkI8ORuwQn9Xa45BCs4siFFXxMn7LzGhLR5id4+Z3p3xB4UnS5IwDZu
 pwyGqz9G2HOHJzif3me9e+C7vmZ/nISSLI1X8JQNj9gP253DSf+5bVJ8IXg2PmP/G5RgPW
 Qi2sqQvof/GruY4xOOFgJtVTUhtC/Eg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-274-592bwJ-iOlK51jYzTdS9sQ-1; Thu, 29 Sep 2022 10:28:28 -0400
X-MC-Unique: 592bwJ-iOlK51jYzTdS9sQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 p9-20020a05600c23c900b003b48dc0cef1so492324wmb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 07:28:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=/4Fj0Oo3eJsET2PPIA6x4dHyLWuTC8G70nIQNhebvYQ=;
 b=GNnAqKChJ8xeF/wfZ4Err6ggdeOnQaEQwaBuE7xUsFtX1o7Xqn+kSWW6c7lQIAvKF6
 v0in59lfzLhpUFGauGsYQ89KJH8uFA8i4vDVCLpWZrQTKxuHqb188AK9V4kzB3SKI+9r
 dybRR8jdReIK9tMSqrADcLGHw5DcWyKnG1afp7+1SojRefjOWNdwWC4iB0d0PkA8+k5d
 PZxB2pCcrM12sPqmAVsTCVdWGOweZrXwqJkOAYLa6vuSD0B7BC3MQ2EEYq3c1ffCUbv4
 U2HDLsXVThZk06X/njzmFVN6RSE24FnwGTaK+V93NBGXF917eD+xc0bqQXgBIRhqEL5w
 dc4Q==
X-Gm-Message-State: ACrzQf3Sob35HfTc8qkGuMLNaTamNJnMoUYQcyuFTrKJFZMQrshO4D73
 E5Je/YT86I2w+MfL7FZC+yPndBNa4oabt1c+8+ZqgBz0lRdb3zgpFXP3u9OfDUVLMKci1xHFAiI
 0lBbvTlebqx8tsEwWYtl5ZKbazQrt
X-Received: by 2002:a05:6000:1d82:b0:22c:ae77:c8dc with SMTP id
 bk2-20020a0560001d8200b0022cae77c8dcmr2692532wrb.413.1664461707405; 
 Thu, 29 Sep 2022 07:28:27 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7aoniPnSey4HMTdNPeJzrDu1lqXMRqKuMvqygl6ikFGfQEfu1zUBerX2f2nJ1x9PmgkUnHQA==
X-Received: by 2002:a05:6000:1d82:b0:22c:ae77:c8dc with SMTP id
 bk2-20020a0560001d8200b0022cae77c8dcmr2692526wrb.413.1664461707231; 
 Thu, 29 Sep 2022 07:28:27 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 t20-20020a05600c199400b003b4fe03c881sm4556301wmq.48.2022.09.29.07.28.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Sep 2022 07:28:26 -0700 (PDT)
Message-ID: <4a50863e-e8c0-f25b-7ebd-69d6aaa4e57b@redhat.com>
Date: Thu, 29 Sep 2022 16:28:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 08/16] drm/udl: Simplify modesetting in CRTC's enable
 function
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 sean@poorly.run, daniel@ffwll.ch
References: <20220919130408.21486-1-tzimmermann@suse.de>
 <20220919130408.21486-9-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220919130408.21486-9-tzimmermann@suse.de>
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

On 9/19/22 15:04, Thomas Zimmermann wrote:
> Inline a modesetting helper in the CRTC's enable function. Build the
> command set directly in the USB URB's buffer and drop an intermediate
> buffer. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

