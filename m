Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 125A5553937
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 19:54:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB4A610E1B8;
	Tue, 21 Jun 2022 17:54:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B945410E1B8
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 17:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655834050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z2TVj/V0fyohRcTQKx5DNrvCftmUX5nWuAAQyDoWqzM=;
 b=esefm9+VHRohJEirZ5k6sVPDTv+ZKXtiAAY66X5vem7dFc5hieIdsaBNE7Wzzmspq3Qpsk
 INbX2J+FK+ei9OL+Th6U+LSozUsAJ1YjWKdO7MzESDtdu4cbT64bX6x29shFd091GQ8jTR
 cVHkyXHeqrC+xVjyI4JTI4+4unEb+uw=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-356-rAbEANxuMn-S_3FBobYntA-1; Tue, 21 Jun 2022 13:54:09 -0400
X-MC-Unique: rAbEANxuMn-S_3FBobYntA-1
Received: by mail-qv1-f69.google.com with SMTP id
 kd24-20020a056214401800b0046d7fd4a421so14983286qvb.20
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 10:54:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=z2TVj/V0fyohRcTQKx5DNrvCftmUX5nWuAAQyDoWqzM=;
 b=RZTKG0FTjmSLp8n1GoD62Ppk7bgVPIGZLov4IWbwKCVBymv1a+xf+uN6Vs305x/l71
 b68yQMOX5AtwECoOktHfhp0B1T42y8S2+eXhroJzxoVugctYb4lBf1S0FIbPGwOAo8RR
 xU70rIr7brD0OMYlIejHT+HYCFE1UvLJiw1S2TnpxhLCMcvhLGupyh2riJH/M0YkK410
 7FwDV8V6ij0UsJKrUjv+hILQ+J4YvmVEEFBNL8fwrwV+pAn8ED3ll/egGf9awAieNKC6
 oytGrBf2xRfx3Bhs1gHrbCYVGVGUlvmo84D/5h5qZfI3mPgz2m32FrPuelucUeo1W/B7
 tVwg==
X-Gm-Message-State: AJIora9DIW0wRJMmzRgOKR3dvX9H49yzyI0ZIimmznaXDv+FcSO42ITi
 SX/7WbdK7J77gkdLJUQHr26HOIUQsNhH0RUJPeq6vmEG9fWMA0jDTlxisI5YjrJXqShcApE/ExR
 2RXJPFpuZn2upn6Lw6/s0kILtlCg4
X-Received: by 2002:a37:98b:0:b0:6a6:b2ca:194c with SMTP id
 133-20020a37098b000000b006a6b2ca194cmr21249851qkj.470.1655834048816; 
 Tue, 21 Jun 2022 10:54:08 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1soAHOqb4MXqPTeezkpU2VvQM9OM3JOxIvP1wIm0b6wIr0e8TtoxRITOLc5AfvxkHElJBJgkw==
X-Received: by 2002:a37:98b:0:b0:6a6:b2ca:194c with SMTP id
 133-20020a37098b000000b006a6b2ca194cmr21249833qkj.470.1655834048539; 
 Tue, 21 Jun 2022 10:54:08 -0700 (PDT)
Received: from [192.168.8.138] ([141.154.49.182])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a05620a0c4c00b006a760640118sm14672911qki.27.2022.06.21.10.54.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 10:54:07 -0700 (PDT)
Message-ID: <4e772a9219177f548378ecac62e03be6c9928ead.camel@redhat.com>
Subject: Re: [PATCH] drm/display: drop unexpected word "the" in the comments
From: Lyude Paul <lyude@redhat.com>
To: Jiang Jian <jiangjian@cdjrlc.com>, airlied@linux.ie, daniel@ffwll.ch
Date: Tue, 21 Jun 2022 13:54:06 -0400
In-Reply-To: <20220621131440.1512-1-jiangjian@cdjrlc.com>
References: <20220621131440.1512-1-jiangjian@cdjrlc.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: jani.nikula@intel.com, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push to the appropriate branch in a moment

On Tue, 2022-06-21 at 21:14 +0800, Jiang Jian wrote:
> there is an unexpected word "the" in the comments that need to be dropped
> 
> file: drivers/gpu/drm/display/drm_dp_helper.c
> line: 1600
>   * Doesn't account the the "MOT" bit, and instead assumes each
> changed to
>   * Doesn't account the "MOT" bit, and instead assumes each
> 
> Signed-off-by: Jiang Jian <jiangjian@cdjrlc.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c
> b/drivers/gpu/drm/display/drm_dp_helper.c
> index e7c22c2ca90c..499f75768523 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -1597,7 +1597,7 @@ static int drm_dp_aux_reply_duration(const struct
> drm_dp_aux_msg *msg)
>   * Calculate the length of the i2c transfer in usec, assuming
>   * the i2c bus speed is as specified. Gives the the "worst"
>   * case estimate, ie. successful while as long as possible.
> - * Doesn't account the the "MOT" bit, and instead assumes each
> + * Doesn't account the "MOT" bit, and instead assumes each
>   * message includes a START, ADDRESS and STOP. Neither does it
>   * account for additional random variables such as clock stretching.
>   */

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

