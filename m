Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DAD5594CF
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 10:09:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2CAE10E471;
	Fri, 24 Jun 2022 08:09:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AC5F10E471
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 08:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656058185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F2CeosPm7EE/KeuL4B0OG+F/VtKUEZJ+55AGzWXOewc=;
 b=C65zUM45NcmkfZ/C6vCcatghC4Ti8ZIimb80fNRlvYaLYpf4Txx316MwIdaPXrRrRuF4Yh
 qtpuWzpZf9pehRNSjzSKMlxY/1eFyCnPcrNNwDgkGFnpiJymCWMSZdXFYFaFblTr5Y431t
 r7MT8gdLiKtMgC5zddaFtdM6hgGUPHc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-W72W5vFJN5G7uSdpfVXopQ-1; Fri, 24 Jun 2022 04:09:43 -0400
X-MC-Unique: W72W5vFJN5G7uSdpfVXopQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 r65-20020a1c4444000000b003a02a3f0beeso1137721wma.3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 01:09:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=F2CeosPm7EE/KeuL4B0OG+F/VtKUEZJ+55AGzWXOewc=;
 b=TO7EBIlSsIKf8OvkawvSCV7E4E94V2dRPo2OKP/+aITeQYbuMgksUZyudeDEaIkk1g
 wY9CrhZx/28iMmGAqToUBRihTMofl+Y8cZ45LuX4QUc/EM3YamYmHpEEgbUOfCM7pT04
 LEdnPfpS+f94ePoKGn5dq0mlPxKNapGgeSwZhGz+lYEL777qyaSi5tgZoKleDXy2sfBo
 tA6j4nRSInBUnRBczHgbMLiv/8hloHHIEvimG7iPlg8X+VvJSgaAfkbr0UvyEnATRmzW
 4GlahCxlWWhLQaZbRaOzfAf5xx99VqUpO8hAnnMxxqc3dc/Ufsn+oDA6RCSD5dfM3Xjx
 vV6Q==
X-Gm-Message-State: AJIora8+2fpbsVuFoI8xrlR4jdit7z4aiHcrvTA8x/vJeGABW/5rsGVG
 kNNFPehTLmZBnCIDWaNbcsbYosWzhjl26BhAvNZFhd6SoUiuPliel4p0YL1Fn5UI56ZdndIDiTX
 kGPOyomtmsTmFVGUdbZ2eRdIPL42k
X-Received: by 2002:adf:d1c1:0:b0:21b:a5e9:b7b2 with SMTP id
 b1-20020adfd1c1000000b0021ba5e9b7b2mr8281283wrd.405.1656058181331; 
 Fri, 24 Jun 2022 01:09:41 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ucF7WbSXEs8QpoL1meHcRYQToA/QWoEJxvRNzEV1vL8OgXnmR3xO5qKb4bmwwaDcV5DJxb5A==
X-Received: by 2002:adf:d1c1:0:b0:21b:a5e9:b7b2 with SMTP id
 b1-20020adfd1c1000000b0021ba5e9b7b2mr8281259wrd.405.1656058181027; 
 Fri, 24 Jun 2022 01:09:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:f4b2:2105:b039:7367?
 ([2a01:e0a:c:37e0:f4b2:2105:b039:7367])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a5d4305000000b00210bac248c8sm1610062wrq.11.2022.06.24.01.09.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jun 2022 01:09:40 -0700 (PDT)
Message-ID: <2aa56bc5-269f-07ee-47ad-e5639f05a941@redhat.com>
Date: Fri, 24 Jun 2022 10:09:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 0/3] drm: Test for primary plane in new
 drm_atomic_helper_check_crtc_state()
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 airlied@linux.ie, javierm@redhat.com, noralf@tronnes.org, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
References: <20220617103226.25617-1-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20220617103226.25617-1-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jfalempe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 17/06/2022 12:32, Thomas Zimmermann wrote:
> Provide drm_atomic_helper_check_crtc_state() for validating a CRTC
> state against common constraints. As many CRTC need a primary plane
> to work correctly, add this as the first test.
> 
> The simple-KMS helpers already contain related code. Convert it
> to the new helper. Also add this test to ast.
> 
> The simple-kms changes were tested with simpledrm. The ast changes
> were tested in AST2300 hardware.
> 
> Thomas Zimmermann (3):
>    drm/atomic-helper: Add helper drm_atomic_helper_check_crtc_state()
>    drm/simple-kms: Use drm_atomic_helper_check_crtc_state()
>    drm/ast: Enable primary plane with CRTC
> 
>   drivers/gpu/drm/ast/ast_mode.c          | 13 ++++--
>   drivers/gpu/drm/drm_atomic_helper.c     | 55 +++++++++++++++++++++++++
>   drivers/gpu/drm/drm_simple_kms_helper.c | 14 +++----
>   include/drm/drm_atomic_helper.h         |  2 +
>   4 files changed, 72 insertions(+), 12 deletions(-)
> 
> 
> base-commit: 822a8442835012ce405080cb40f6317ef1e854ac


the whole serie looks good to me,

Acked-by Jocelyn Falempe <jfalempe@redhat.com>

