Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 340D25F4C51
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 01:00:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 748D410E2C7;
	Tue,  4 Oct 2022 23:00:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C57D710E147
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Oct 2022 23:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664924446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jAeQEYUAZ6I53s/cdATh1GT7cy/iOQBRZDUqnPn3+vI=;
 b=he76JeYQCbPt8Bn23IHuiyM6VrjomAqRVG9VQ2ZLT6MYuV/EsKnkN7diBTBm58GZkxmGEv
 ZzF5PdFJ5ZTGR0sqaZUxicxh7ACkcItGYEmF4k/XdK6ByRXzxZBg097RoaTJQGLqEZL2OD
 UMU4rFjogYuSanniRQJgFjer/5W2gCw=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-116-TPLs9P9SNxWGClHHzoFwcQ-1; Tue, 04 Oct 2022 19:00:45 -0400
X-MC-Unique: TPLs9P9SNxWGClHHzoFwcQ-1
Received: by mail-io1-f70.google.com with SMTP id
 n23-20020a056602341700b00689fc6dbfd6so9934753ioz.8
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Oct 2022 16:00:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=jAeQEYUAZ6I53s/cdATh1GT7cy/iOQBRZDUqnPn3+vI=;
 b=zZZiOhrdc2x9dTdHYnG1+aOQdkY/hNSvByhheJoaEC+9dznKvNBX8bGbWYcQkDW64S
 J/k4FXbDXVRzyBmdLT86rE2vDbOKXNVGYZUpy0BJvqsugjFz/LfgTExROXiE+dcvueDb
 SZ2LNG+on0DK7C7wA0NTi2LHoXk4sli9ezxU0xLnfnr6BjnIxXLdxL/OcLdSToZTPRcK
 WbjfHK8IwO0kNhS5RlTr2CojZVJpjrKRF/P7Nwy2AzhokMkTM34APC6Ub667Kdd2CLry
 AkxHkbIV5jgCNFUaD7gyKEZhEmPpC+bmDbpfMzOoZ/VTkzWqcAaksFmyurPBcwziN0kU
 r3Sg==
X-Gm-Message-State: ACrzQf1A2cyftVOMbwa/K1fs756lt5EBAXgt0I+S4vb7Xn1J/ls/hwxC
 JCEJblY2XdlkdhNMwsckmZwGIEbZ807QbKu/iF+Ew2NYenVoQ760Q79h3YPwx3dPDLFFkvY+kOW
 dNTr1slR5h3PSDXL+xQZxlGz9D0uD
X-Received: by 2002:a05:6e02:152e:b0:2f9:e082:7fc7 with SMTP id
 i14-20020a056e02152e00b002f9e0827fc7mr5251720ilu.167.1664924445207; 
 Tue, 04 Oct 2022 16:00:45 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5ss8PCH1HCIqK+ybjXbPKnDagaRmDjle3tbsyVA7q5V5VXSi76bqPh1mXwBjopmipBZ8qydg==
X-Received: by 2002:a05:6e02:152e:b0:2f9:e082:7fc7 with SMTP id
 i14-20020a056e02152e00b002f9e0827fc7mr5251706ilu.167.1664924444971; 
 Tue, 04 Oct 2022 16:00:44 -0700 (PDT)
Received: from [10.56.18.1] ([140.209.96.0]) by smtp.gmail.com with ESMTPSA id
 c26-20020a02331a000000b003627dc2a94esm3572311jae.96.2022.10.04.16.00.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Oct 2022 16:00:44 -0700 (PDT)
Message-ID: <8b5c4fb2-dd87-1b5a-b6e2-794f0f4264dd@redhat.com>
Date: Wed, 5 Oct 2022 01:00:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 16/16] drm/udl: Add constants for commands
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 sean@poorly.run, daniel@ffwll.ch
References: <20220919130408.21486-1-tzimmermann@suse.de>
 <20220919130408.21486-17-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220919130408.21486-17-tzimmermann@suse.de>
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
> Add constants for the various commands that the driver can send to
> the device and update the respective helper functions. No functional
> changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

