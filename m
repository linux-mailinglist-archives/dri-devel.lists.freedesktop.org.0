Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FDD4D1ED2
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 18:22:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C56EC10E3C6;
	Tue,  8 Mar 2022 17:22:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 595EF10E405
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 17:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646760129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fJ7r5VyRgX3KAENICcL5S3qj/ix1OtYfo/guqTts9VM=;
 b=YL3DbxEHfAzZrw+jq+1PA33mOmLffVqgAHpz5Lh56+2GLksup+PhpgL7CkydiNP2exve7R
 9J+0wGzWTePDbycbCkYm8d31raNNLOxSI2nmP2XIb1Qa1Omyq5Zdkf56RWcTkUIyPwErA7
 CkCXnhY05A5/XfA3oci3K06ouZgaRkA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-543-7kW2duNYPdCiwBCFOZAx1A-1; Tue, 08 Mar 2022 12:22:08 -0500
X-MC-Unique: 7kW2duNYPdCiwBCFOZAx1A-1
Received: by mail-wm1-f72.google.com with SMTP id
 20-20020a05600c231400b00389886f6b23so1369273wmo.6
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 09:22:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fJ7r5VyRgX3KAENICcL5S3qj/ix1OtYfo/guqTts9VM=;
 b=QQy1hduYoYu17VkgXpUqJRJypkU0Kx6hAjtw9d3YoN+lQBlMfRbPgDjazSNK7WrvDU
 mrV+QZoRVmorkULHQ5DE+GjCd4ED7GVJzdCd+xA4Di7gYSNJtShuPtlHEzb1ddMSJjGC
 dSOiD22hY2qbH5susW0xY0QIDeNmpHWdfDrV3xyENnQ94xvIcqOQuc5H9Uw+O2jGRSIa
 BYblFPviC4NFJ67Mv28Z7j6c5zoD3K2UPLd3rhea54xNB2LjTvIVH2zB+o8m+HQPLkOw
 Xuc3NCjOZmv+Ao6C1KtBVVY49G7yXrqoNq63oHYQzwDG7N1tMJ3daSN7LD4LZ2Bte6jt
 jJ4w==
X-Gm-Message-State: AOAM533fDcGh5Yxn4c51+476/uY4da42BHRlF7WsFCG6s0LjqAQRbDTD
 7+x9VdnPQ5w1z0uaw1/hkUe5k3Lng43gHLyKvmZsQg9U0rbe5aTP+P8qfk7V5/oBfmmuk2mk7/Z
 o+L4NRGWpFE5Sp6EwSIDj6MHBjPsX
X-Received: by 2002:adf:f38d:0:b0:1f0:490a:92ae with SMTP id
 m13-20020adff38d000000b001f0490a92aemr12728362wro.497.1646760126927; 
 Tue, 08 Mar 2022 09:22:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwZCpZOxciK/Q29ufTNk0vHv88pvSmESMyFveChiU2+Box+IsygA4K4y+E7u/Ni9pLr9+r+uQ==
X-Received: by 2002:adf:f38d:0:b0:1f0:490a:92ae with SMTP id
 m13-20020adff38d000000b001f0490a92aemr12728334wro.497.1646760126672; 
 Tue, 08 Mar 2022 09:22:06 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 l126-20020a1c2584000000b00387d4f35651sm2752494wml.10.2022.03.08.09.21.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 09:21:59 -0800 (PST)
Message-ID: <c49bc1b5-6dcf-fb12-f0cf-837063db665c@redhat.com>
Date: Tue, 8 Mar 2022 18:21:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 4/9] fbdev: Export helper for implementing page_mkwrite
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 deller@gmx.de
References: <20220303205839.28484-1-tzimmermann@suse.de>
 <20220303205839.28484-5-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220303205839.28484-5-tzimmermann@suse.de>
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
> Refactor the page-write handler and export it as helper function
> fb_deferred_io_page_mkwrite(). Drivers that implement struct
> vm_operations_struct.page_mkwrite for deferred I/O should use the
> function to let fbdev track written pages of mmap'ed framebuffer
> memory.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

