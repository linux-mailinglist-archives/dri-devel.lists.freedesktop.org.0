Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B807577717
	for <lists+dri-devel@lfdr.de>; Sun, 17 Jul 2022 17:32:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6292211ABE0;
	Sun, 17 Jul 2022 15:32:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AE6311AF91
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Jul 2022 15:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658071971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M/Q/hkmTNqE0ce2dPvd3gY/dc1o6CszSemLTD+GQwF4=;
 b=RcSUm+hNY2hYVyb0Zvi0wm7daS/Ay0zCyAzxjSUbDL9NEyegXmpWwDEBJJLVrGNGmTHPGc
 pD+Bh8cLu8MWon4O8eoccObPBsWVsP0KQO2568IiuJnMJ+C+aGfhtBUt2Au6PqLgdIjqxo
 jAtdivhapZsCAjkDL1VJ1w+DyVmoT9w=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-504-RnCB-bEXOgqy7hhxGaDyaw-1; Sun, 17 Jul 2022 11:32:50 -0400
X-MC-Unique: RnCB-bEXOgqy7hhxGaDyaw-1
Received: by mail-wm1-f70.google.com with SMTP id
 189-20020a1c02c6000000b003a2d01897e4so3448371wmc.9
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Jul 2022 08:32:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=M/Q/hkmTNqE0ce2dPvd3gY/dc1o6CszSemLTD+GQwF4=;
 b=dITDDmNyAUWffpjzMeOdMIIwWsvtLAMABCcq0x5yvbwtC6e883L8yMrWudlgT4jTzf
 MMh1QcD954xvtc6RZBfj96dGgfcx+KIyZ4UVHUSkEaMvTvKZZ+r+tkb9XbfrhNtQHa+e
 eWJoYEAihqRaXAn2XghbyyTn6vc5YO9WBV3p8cKsRBUBca1KUkZt0GijRnZpmA2+JmA6
 jRcQwwW3WfgfChgjv9/GrJZu5gQo6uagRH3RgPvsN3pDioXlN9QC5usjwGu5jzu2HdOK
 nzS5QkuXmZdkfLFCWKxvIlwX0eysPW1JqKcCWZiTvLdj98RjmtQ4SaxYOgGpSOLWQdg+
 B9gg==
X-Gm-Message-State: AJIora8PzpI/FfGk843YsMRkK7KPF5RMBZxLTpE3rk2LeAzevg43Y88F
 aBzPwYNxc51cGE73vomAEmNcsco9bZ4WugGv9gDIqDDmYVG5dI8tgftlSUEKeJe9IydEFpU9+pT
 Bfp2sZuJJcxfDCDBY8NgDiSenHvgA
X-Received: by 2002:a05:600c:1993:b0:3a1:918d:671b with SMTP id
 t19-20020a05600c199300b003a1918d671bmr21918054wmq.14.1658071968817; 
 Sun, 17 Jul 2022 08:32:48 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1symXtOjresE1+8/7WY0Yx+g0O1lCmWM50A/aeAeeXDBiORmpc8IltPcB1Naqb2gg1dgmAdOA==
X-Received: by 2002:a05:600c:1993:b0:3a1:918d:671b with SMTP id
 t19-20020a05600c199300b003a1918d671bmr21918047wmq.14.1658071968657; 
 Sun, 17 Jul 2022 08:32:48 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c9-20020a7bc009000000b003a2fb1224d9sm11887394wmb.19.2022.07.17.08.32.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Jul 2022 08:32:48 -0700 (PDT)
Message-ID: <0783cf83-b2ca-c05e-c341-a4a668658aeb@redhat.com>
Date: Sun, 17 Jul 2022 17:32:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 10/11] drm/dri1: Move Kconfig logic to drm/dri1
To: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
References: <20220716181750.3874838-1-sam@ravnborg.org>
 <20220716181750.3874838-11-sam@ravnborg.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220716181750.3874838-11-sam@ravnborg.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/16/22 20:17, Sam Ravnborg wrote:
> Move the DRI1 section from drm/Kconfig to a new Kconfig
> file that lives in the dri1/ directory.
> This isolates more of the DRI1 functionality.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

