Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6284B523029
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 12:03:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8C9C10E08C;
	Wed, 11 May 2022 10:03:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98D3F10E08C
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 10:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652263412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/vtPNJw1+YnhXgRCJ8NELfFcD+FTH1I0JZLJZh7rb18=;
 b=JN+VbiMoZCOzR+ZMg7f4axfLqwA4zSa/U2pMPwTjQc8/rUMWKDl4AqlIE3xBXTJfzg4HUs
 VuYonyDBDnStWNQmO+qfc2VtLPYGpToNZZETqVkey/KDltTCRAuYJscfcbDCPeeornxW1i
 F6ltjOIiL0w1o5qzKROZUwM3nyedRL4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-PkV52Ub9NSawYO3c5fcQEw-1; Wed, 11 May 2022 06:03:31 -0400
X-MC-Unique: PkV52Ub9NSawYO3c5fcQEw-1
Received: by mail-wm1-f71.google.com with SMTP id
 m186-20020a1c26c3000000b003943e12185dso512896wmm.7
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 03:03:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/vtPNJw1+YnhXgRCJ8NELfFcD+FTH1I0JZLJZh7rb18=;
 b=ls1LniUb1wX3yL28mOa4zY6EdylwAWpbCNy3H63K7+Izgg+OtfaZbRoxV/BTzJ2+3w
 cI4HndUykwrO4817xCW8WGWAOFi9iTQSuJXzarmrT0OJyDi/mVrKHkHiIWxyesdbsuAx
 +mWmVFhE9SdMyGgK0+EKYNnoGDS33Ay8juDlSuKbwjx/gksNInRbhFloWtkGEQOTMGAb
 fqTjvy2oYBVeS6hvo8v/gACafGbyohYeEjFktKAa/y/tReHIyKpmangGSKB/9pXvXxW5
 qis7XW7Sq7QImT5FFQoC71o2wxDS86MfObbe0VYN6uS3Lt9uC/uh/M3QREoti7c/jgID
 twKQ==
X-Gm-Message-State: AOAM532FQvHAJVj9RK7bgt6ClFrCOnhX12IZhFoeM3i3KzKG80aJe9j6
 07hZYmHa6TBiR2UnWFWA/Ztrdt90zERK9frnSkIf7h8Ll177gPWkvxl/cztlLVXqVvviWH7utAZ
 IuMv8sqw48o0qupqh2U58zNoVAeed
X-Received: by 2002:a05:6000:1707:b0:20c:660c:7c78 with SMTP id
 n7-20020a056000170700b0020c660c7c78mr22100369wrc.150.1652263410712; 
 Wed, 11 May 2022 03:03:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/mtciUUA/2mXBlfux7nSrDs5vehkcW7+aoBUwQ+SGHeAN3Wa6iGwpRl/7vAo47q2NqMsjgA==
X-Received: by 2002:a05:6000:1707:b0:20c:660c:7c78 with SMTP id
 n7-20020a056000170700b0020c660c7c78mr22100313wrc.150.1652263410167; 
 Wed, 11 May 2022 03:03:30 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n42-20020a05600c3baa00b00394699f803dsm5480419wms.46.2022.05.11.03.03.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 03:03:29 -0700 (PDT)
Message-ID: <e5408379-ce8f-46dc-0673-71b10743b563@redhat.com>
Date: Wed, 11 May 2022 12:03:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] drm/todo: Add entry for converting kselftests to kunit
To: linux-kernel@vger.kernel.org
References: <20220509130846.694397-1-javierm@redhat.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220509130846.694397-1-javierm@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/9/22 15:08, Javier Martinez Canillas wrote:
> Many of the kselftests in DRM can be converted to kunit tests instead,
> since that framework is more suitable for unit testing.
> 
> Suggested-by: Maxime Ripard <maxime@cerno.tech>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---

Pushed this to drm-misc (drm-misc-next).

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

