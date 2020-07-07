Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 585D2217435
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 18:40:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE0206E247;
	Tue,  7 Jul 2020 16:40:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E57D66E247
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 16:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594140037;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vwaVw6ScF/asAaXXiwkvG8Que7bF6ccJVwuXrq86c9E=;
 b=Bol5e8/S7OQKELxvVow6414cL7Yq5yQjXr7l1rHhXMO7Mmlr7Kyna29nYx85D3PeM7NKCk
 LbmC526mltSSxjhXJrqs2OZWbdY5TpgfqdUeK+1yDK/sx8JzOjiX2eU59NLpilAvX4JZxG
 GPV6qL3a5j3wV3sG7r/cPEGzJ2j4iPY=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-mEF18-TIODCJ6pgAgrtaqQ-1; Tue, 07 Jul 2020 12:40:33 -0400
X-MC-Unique: mEF18-TIODCJ6pgAgrtaqQ-1
Received: by mail-qt1-f197.google.com with SMTP id t36so13118634qtc.16
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jul 2020 09:40:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=vwaVw6ScF/asAaXXiwkvG8Que7bF6ccJVwuXrq86c9E=;
 b=S9s/BE/YB+fA43gu0FFywljWGEFWE0XO9pDG5GRZxxbdCmAJDkccePwJWAghy9mn4j
 /hdGDBKfiCfkvQl9Bm3BG7qS8nMhVikXWKoJztbz116UamDP5sSCEyfKSgRsUH+RfFaF
 q10fuHicWOlMLaFbrjWcmrXLTFoBNqgmqa1AFEhE/chzzjVsPr8qTIfxcK4sSV0uc9Kd
 pfK17+c0DGR3Pu+dcK0tcneMj8DtzlB3vb9amR/u+cA2cfjpXnJ5GXH9/9C1NAvhsuEE
 29jxpzyzvGML80BKFj+8YFJN2AqyBVisKmBelzHjvUJptEkyVhJ7kVaVchtEilx0+Lwf
 jodQ==
X-Gm-Message-State: AOAM530oQ4vk8YO/+/KlWGLbYZk9YgUlM07dDNULKntfJ4+jAO3HJgnZ
 VLhqAqBnbNTVdb5vQPNNhJgWXPadoICgMZL29iTdrqlDOul/z4NdbRzk0g8fbGyUvx6f5xibUc0
 UnsyU+nzQXwsiwKKko13H1viw7Vvy
X-Received: by 2002:a0c:f105:: with SMTP id i5mr55147972qvl.120.1594140033116; 
 Tue, 07 Jul 2020 09:40:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8JvWON54NKB3Cot47xHyIwT7X/HsXWp/ySaloxs8fIGkGTI2F4c0LwjA5fiCJPM6cHJoFVw==
X-Received: by 2002:a0c:f105:: with SMTP id i5mr55147952qvl.120.1594140032855; 
 Tue, 07 Jul 2020 09:40:32 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id d135sm23093864qkg.117.2020.07.07.09.40.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 09:40:32 -0700 (PDT)
Message-ID: <db709fc4e8b038871b93897bfaa715dd4acea388.camel@redhat.com>
Subject: Re: [PATCH 0/7] drm/mgag200: Inline prepare/commit helpers
From: Lyude Paul <lyude@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com, 
 daniel@ffwll.ch, sam@ravnborg.org, emil.velikov@collabora.com,
 kraxel@redhat.com,  john.p.donnelly@oracle.com
Date: Tue, 07 Jul 2020 12:40:31 -0400
In-Reply-To: <20200707082411.6583-1-tzimmermann@suse.de>
References: <20200707082411.6583-1-tzimmermann@suse.de>
Organization: Red Hat
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Reply-To: lyude@redhat.com
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For context - I already reviewed this once, it just missed the dri-devel list by
accident

For the whole series:

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Tue, 2020-07-07 at 10:24 +0200, Thomas Zimmermann wrote:
> Mgag200's modesetting still utilizes the prepare and commit functions
> that were part of the non-atomic interface. This patchset integrates
> them into the simple-display's enable function.
> 
> Patch 1 disables CRTC write protection once when initializing the
> registers. Before, CRTC registers were temporarily write-protected for
> no apparent reason.
> 
> The screen is toggled on and off multiple times while setting a mode.
> Patch 3 removes any intermediate screen on/off changes.
> 
> In patch 4, DPMS functionality is reduced to on an off. The DPMS helper
> function implemements on, off, suspend and standby. In atomic modesetting,
> only on and off is required.
> 
> Tested on G200SE HW with Xorg, Weston and fbdev.
> 
> Thomas Zimmermann (7):
>   drm/mgag200: Don't write-protect CRTC 0-7 while in mga_crtc_prepare()
>   drm/mgag200: Move PLL setup out of mode-setting function
>   drm/mgag200: Don't set or clear <scroff> field during modeset
>   drm/mgag200: Split DPMS function into helpers
>   drm/mgag200: Set/clear <syncrst> field in display enable/disable
>     helpers
>   drm/mgag200: Rename G200WB prepare/commit function
>   drm/mgag200: Inline mga_crtc_{prepare,commit}() into enable function
> 
>  drivers/gpu/drm/mgag200/mgag200_drv.h  |   6 +
>  drivers/gpu/drm/mgag200/mgag200_mode.c | 168 +++++++++----------------
>  drivers/gpu/drm/mgag200/mgag200_reg.h  |  11 ++
>  3 files changed, 76 insertions(+), 109 deletions(-)
> 
> --
> 2.27.0
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
