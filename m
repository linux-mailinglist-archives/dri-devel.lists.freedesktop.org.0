Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 783A84D136D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 10:31:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C5A10E3FE;
	Tue,  8 Mar 2022 09:31:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 145D110E3FE
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 09:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646731875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x4qouXnlwX5t+UMG1KaeRHyqe8z7wUEDOrDVLTeWY98=;
 b=MgSZENL3lgMSCiaqqZOrQucan+jpID4oE4QowBcinTgAWqNlgG/Nuj/vX1kHOlbyIVA003
 Nkby0VIO20ikb4IfJ7tZ3aZ9HNTioOzeLqWgzucGHwapjsSZYP5hns+666lcjksOXt3jyj
 rvM4NbYgmprTw+hOtmXefLrm2k2hnF0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-TvmmQpLMPom7T9LlIzYWMg-1; Tue, 08 Mar 2022 04:31:13 -0500
X-MC-Unique: TvmmQpLMPom7T9LlIzYWMg-1
Received: by mail-wm1-f69.google.com with SMTP id
 c19-20020a05600c0ad300b00385bb3db625so922477wmr.4
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 01:31:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=x4qouXnlwX5t+UMG1KaeRHyqe8z7wUEDOrDVLTeWY98=;
 b=xY9e7TCTy5FgsW4yCOJA1FX1mWgBCfDb9wBuJiUsk+Z0eXj7ChB7b5+ipFq+mP/Oys
 +f5vj5W7re1N94M58CtP9cKr3xi0U54QPGAPmNV8NhqL2cir/qycbDbvUcrrqu2eYvKZ
 74+wbGahcxCm87HnuetQhDvDQq8mtIfBL2MSKzwR7tsds1MRfIP/L2y46uVpkqJUk/BE
 jsggGwlDctV2tEBH0hGd42Nokr+pfm5XrdiZKOBoiwOEVWHtrHLZuQr1fFjkrfepmid9
 8rdG/DDwQNGkEjv6E2sQOUch6x1pKSi6bD1CjAaYqjFlNFGL+h7U1T2/sHntgkR9VnJA
 gVpg==
X-Gm-Message-State: AOAM5306603ImSMhqDisiTcmwf0UwRwQTi4yumNYFCTGUoJbn9lMa6Jq
 rPyVkdJ+4S4G6jfoU3R/MRPnXBFAG3c/4cqEYtq7Cem/ykVP9iCizRwMtfK4SB1bXlkxom8BKzI
 zj2NRz/HHLmIH6VyO9KfPnCPf1e8b
X-Received: by 2002:adf:ea0d:0:b0:1f1:f958:a90c with SMTP id
 q13-20020adfea0d000000b001f1f958a90cmr5983631wrm.22.1646731871990; 
 Tue, 08 Mar 2022 01:31:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz2YcYQtOKaJj6Kx9VJLZ9GXsAOh+8pPCVnE98u0EUxvrX5Nnbiit3xxbS2WR2MOzf0v5nzXg==
X-Received: by 2002:adf:ea0d:0:b0:1f1:f958:a90c with SMTP id
 q13-20020adfea0d000000b001f1f958a90cmr5983622wrm.22.1646731871789; 
 Tue, 08 Mar 2022 01:31:11 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 d18-20020adff2d2000000b001f025ea3a20sm22158909wrp.0.2022.03.08.01.31.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 01:31:10 -0800 (PST)
Message-ID: <a9e7aa2c-9954-94ee-6f7c-0d6822342897@redhat.com>
Date: Tue, 8 Mar 2022 10:31:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/9] drm/simpledrm: Use fbdev defaults for shadow buffering
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 deller@gmx.de
References: <20220303205839.28484-1-tzimmermann@suse.de>
 <20220303205839.28484-2-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220303205839.28484-2-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/3/22 21:58, Thomas Zimmermann wrote:
> Don't select shadow buffering for the fbdev console explicitly. The
> fbdev emulation's heuristic will enable it for any framebuffer with
> .dirty callback.
>

Indeed it does. Not related to your series but looking at this
patch I noticed that drivers/gpu/drm/tiny/bochs.c will be the
only driver that sets .prefer_shadow_fbdev after this lands.

The driver is using GEM so I wonder if after your series this
DRM driver could have a .dirty callback and the field just be
dropped? Or there would still be a case where it is needed ?

Anyway, just wanted to mention in case I forget later.

Your patch looks good to me and I think it could be pushed
without waiting for the other patches in the series.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

