Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B62459732
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 23:13:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A03D89C5E;
	Mon, 22 Nov 2021 22:13:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 608CA89C5E
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 22:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637619229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S+R9BINaX+51Qr2T4l6sCMbvLwjW2/vrLNYAwc3Z9lU=;
 b=a0FNjQrX25W6cBS98pe/IEN4EV5gwNZygkJUWNHahFAcuYhClzXidCKSvleiX9vtkytv7W
 3tuO+bH/1TUxVgrclhjr4obyIjtKh2+bGMzh5Qt1mkix0KhDuP4geyqi++QMCGg/V5RoEG
 mTRL4tUsQ6Kebox4kQhCPFkZ0oPKsfk=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-230-rOzaZgkbMxGDy3AvlsOdvg-1; Mon, 22 Nov 2021 17:13:46 -0500
X-MC-Unique: rOzaZgkbMxGDy3AvlsOdvg-1
Received: by mail-qk1-f198.google.com with SMTP id
 bq9-20020a05620a468900b004681cdb3483so15976548qkb.23
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 14:13:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=S+R9BINaX+51Qr2T4l6sCMbvLwjW2/vrLNYAwc3Z9lU=;
 b=LfRZ+snBMIKqOpwI19xntlu49Ja6F6a8UG1Sc/y1XQzHkBqLatJJz12fmHebHj20xo
 2hAbLCUVFltw4dK1YgwMuNlDEFCgSlcbULXI3ljnf7HNGhdLHbGcUE5s3xixylytz0kt
 E6yG+Sbms5PdDMogWrTXdsesc5qnopH88z36KC6QeQNI80nxVHtZh21dKDAY2hw5EHSd
 YWddw9hmKhMsHYMDzMc7qLP5eiiy4Sx70JJPshryT2C5g2dDAV8/OvzgsUR1XIkLtn66
 tvjD+IOKbELaDUoWu0tgnzeijxIsKP03fEJ4c9C2kFVRKKdYQX4rRIuf4uMCNMlLCNRV
 Ti1g==
X-Gm-Message-State: AOAM530ROsxdEp/87SKQl+MVcNik9PLtgrlW1UG6zjE5gnZrMuVSOSj1
 uO5LmGfMHMOicdQHWOeQcGI9O14s6unRzze+JITtLRnHf9TkmCkK6sqCbso70QCX0mbqK2v+g2q
 +yqT4+dKmnsjkB/ngwUdflvwivpOL
X-Received: by 2002:a05:620a:2686:: with SMTP id
 c6mr124715qkp.223.1637619225786; 
 Mon, 22 Nov 2021 14:13:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxjge0K0A/nuJhOKxTMumEKKOBE3aDs/sL07dbK3PKluKwLUOKRHtkgUX+iQF2cQOqBhIFyMQ==
X-Received: by 2002:a05:620a:2686:: with SMTP id
 c6mr124688qkp.223.1637619225558; 
 Mon, 22 Nov 2021 14:13:45 -0800 (PST)
Received: from [192.168.8.138] (pool-96-230-249-157.bstnma.fios.verizon.net.
 [96.230.249.157])
 by smtp.gmail.com with ESMTPSA id t15sm5265046qta.45.2021.11.22.14.13.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Nov 2021 14:13:45 -0800 (PST)
Message-ID: <60cfa0c45da408f1c87fc0e85bba389339ea9109.camel@redhat.com>
Subject: Re: [PATCH] drm/selftest: fix potential memleak in error branch
From: Lyude Paul <lyude@redhat.com>
To: Bernard Zhao <bernard@vivo.com>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Lee Jones <lee.jones@linaro.org>,
 dri-devel@lists.freedesktop.org,  linux-kernel@vger.kernel.org
Date: Mon, 22 Nov 2021 17:13:43 -0500
In-Reply-To: <20211117014834.36999-1-bernard@vivo.com>
References: <20211117014834.36999-1-bernard@vivo.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.1 (3.42.1-1.fc35)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I wonder what vivo's interested in this for!

Anyway:

Reviewed-by: Lyude Paul <lyude@redhat.com>

Do you need me to push this to drm-misc-next for you?

On Tue, 2021-11-16 at 17:48 -0800, Bernard Zhao wrote:
> This patch try to fix the potential memleak in error branch.
> 
> Signed-off-by: Bernard Zhao <bernard@vivo.com>
> ---
>  drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
> b/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
> index 6b4759ed6bfd..dbac073ed385 100644
> --- a/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
> +++ b/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
> @@ -131,8 +131,10 @@ sideband_msg_req_encode_decode(struct
> drm_dp_sideband_msg_req_body *in)
>                 return false;
>  
>         txmsg = kzalloc(sizeof(*txmsg), GFP_KERNEL);
> -       if (!txmsg)
> -               return false;
> +       if (!txmsg) {
> +               result = false;
> +               goto out;
> +       }
>  
>         drm_dp_encode_sideband_req(in, txmsg);
>         ret = drm_dp_decode_sideband_req(txmsg, out);

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

