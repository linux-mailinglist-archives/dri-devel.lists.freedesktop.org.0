Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58721513A45
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 18:45:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 591AF10E48A;
	Thu, 28 Apr 2022 16:45:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAC6010E48A
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 16:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651164335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H4A0DVfkP3xKjUiu9Qd/IqxcEQnmDFxo7bw14RVMI0g=;
 b=OSTYnJevZjaQEMeE4sj7Tu0DXPYwJSjLX4TF75o3TLyxIs4DOfSlWbzS8qi+sWWorkkCXv
 Dh3Bg5WWXfu2EW8DKf/VGhtKofiFXChLWEMAgAdLXgITl7LyYzwsW43L2POPEpKgNraDua
 20faekiLdcYkWgzKzxghK7onyrxVNCU=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-qc7pfrOlMo6PyR1b6CwZhQ-1; Thu, 28 Apr 2022 12:45:34 -0400
X-MC-Unique: qc7pfrOlMo6PyR1b6CwZhQ-1
Received: by mail-qv1-f69.google.com with SMTP id
 kd3-20020a056214400300b004563804b906so4104226qvb.20
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 09:45:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=H4A0DVfkP3xKjUiu9Qd/IqxcEQnmDFxo7bw14RVMI0g=;
 b=fH8GxaKJ/YOKsu/Ey3it8T+TTpERSIo8ooSC4HhZ5tE1N0RwTHRVJpL+su5Y6A3o4t
 61nJHiXBVU/Ngsu/NJBH5ngV7a37nMI1K8rxSoVzJjlYS7i8WoTdSKGZPJ8FkC9zIRy3
 ycAHQjT6/jCSrNzoqs+1uqhkDAvqS5bdUEVLWkAiq2QlGk+7wA3WlQTpSvHXFiYAgBfC
 6ysLi3dwEEh3gpr0UnKV/YDk8R0MEABQ2fNydDWGb24bzogDbh+KG2eN/+Tii2MV+MlZ
 eRbSINs9ezGXz8spgPgG1VsD5z22w8iaBow0MijvFDqCSbjYXL6FlHnW6FJ8NXhAfqh2
 4B9Q==
X-Gm-Message-State: AOAM5324IcmLKoi9N0db32wFijmnoAISzg3rAbYmFDyFyZLh4b7DEey6
 sxSnaSvu5cEtit02JMm5z3g92O+rT6Gu+T6sPjLu0HttTH+9VeCIubarCNlwiv8q/uKYHxIvbgr
 xAwB5G/qQkhO9vE8knob6TgejMSHj
X-Received: by 2002:a05:622a:412:b0:2e1:de3b:d110 with SMTP id
 n18-20020a05622a041200b002e1de3bd110mr23802492qtx.420.1651164333830; 
 Thu, 28 Apr 2022 09:45:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJHR0JZ5BoBDr62uWaw9chIGJQeGTR0PGKbivpXiaN5X2ck1EqcgIEcMCnt87hcmVT39WWWQ==
X-Received: by 2002:a05:622a:412:b0:2e1:de3b:d110 with SMTP id
 n18-20020a05622a041200b002e1de3bd110mr23802470qtx.420.1651164333589; 
 Thu, 28 Apr 2022 09:45:33 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 y18-20020ac85f52000000b002ed08a7dc8dsm271886qta.13.2022.04.28.09.45.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 09:45:32 -0700 (PDT)
Message-ID: <274af067a52ce665def00170c35adb5002d500b2.camel@redhat.com>
Subject: Re: [PATCH] drm/dp_mst: Lower down debug info level when receive NAK
From: Lyude Paul <lyude@redhat.com>
To: Wayne Lin <Wayne.Lin@amd.com>, dri-devel@lists.freedesktop.org
Date: Thu, 28 Apr 2022 12:45:31 -0400
In-Reply-To: <20220428124944.1683680-1-Wayne.Lin@amd.com>
References: <20220428124944.1683680-1-Wayne.Lin@amd.com>
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
Cc: rodrigo.siqueira@amd.com, jerry.zuo@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push to drm-misc-next in a bit

On Thu, 2022-04-28 at 20:49 +0800, Wayne Lin wrote:
> [Why]
> It's reasonable that we receive NAK while doing DP_REMOTE_DPCD_READ.
> Downstream device might reply NAK with the reason and source should
> react accordingly.
> 
> e.g.
> 1. When downstream device can't handle corresponding message in time,
> it then replies NAK as reason been set as DEFER.
> 2. When multi-function branch-sink device doesn't enumerate virtual
> DP peer devices for those multi-function down facing ports. Without
> virtual DPCD, branch device might reply NAK with reason as BAD_PARAM
> indicating this port can't do aux DPCD read.
> 
> It's expected result. Not an error.
> 
> [How]
> Use drm_dbg_kms() to replace drm_err() when receive NAK.
> 
> Changes since v1:
> * drm_dp_mst_topology.c file path changed. Folder was rename from
>  'dp' to 'display'
> 
> Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
> ---
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> index 8526aae75c6d..f27aa0b95bea 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -3557,9 +3557,8 @@ static int drm_dp_send_dpcd_read(struct
> drm_dp_mst_topology_mgr *mgr,
>         if (ret < 0)
>                 goto fail_free;
>  
> -       /* DPCD read should never be NACKed */
>         if (txmsg->reply.reply_type == 1) {
> -               drm_err(mgr->dev, "mstb %p port %d: DPCD read on addr 0x%x
> for %d bytes NAKed\n",
> +               drm_dbg_kms(mgr->dev, "mstb %p port %d: DPCD read on addr
> 0x%x for %d bytes NAKed\n",
>                         mstb, port->port_num, offset, size);
>                 ret = -EIO;
>                 goto fail_free;

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

