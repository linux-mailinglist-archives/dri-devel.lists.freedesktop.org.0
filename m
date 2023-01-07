Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FC066108E
	for <lists+dri-devel@lfdr.de>; Sat,  7 Jan 2023 18:37:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7D9710E340;
	Sat,  7 Jan 2023 17:37:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2EE810E1B4
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Jan 2023 17:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673113064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7UoklNV81MeruvhksD2tLEyE1RirxLyKZBOM7SqghhQ=;
 b=PP4ck2B4xeP44YfZuB1LIRXJhN3wxLez9icHyqUz1hOHYppbXcBeLhowdxNqqiDnTHV205
 K6EHCZKUMJ5GExL1PfHXxyJi9iuyNphp1LUHYutCMZSNhRGbptnlDgE7ef0W2KZLDMIuvs
 Z2QbZmm9M7ME9H/NtiCZIerCHxCJAIQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-22-upjMKCAANdyOWeigosyk-Q-1; Sat, 07 Jan 2023 12:37:42 -0500
X-MC-Unique: upjMKCAANdyOWeigosyk-Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 m7-20020a05600c4f4700b003d971a5e770so2626683wmq.3
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Jan 2023 09:37:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7UoklNV81MeruvhksD2tLEyE1RirxLyKZBOM7SqghhQ=;
 b=uqN46BcQPqb2dDpUijoOF5BEp3uoCSwQds5rDSrGU6AiBExw/SISIAxKdMgk6/tC+x
 bVinTe1KK4FxU5V+DCPB0llj3hSdOLLwSeWCCiimYFYs11VG3eQSsXt0tP/QX9CunPvT
 NxBvV2/uMCTHd90vBkbV6fCiMQikNg49ebGOTs06n91iAHNzfZhZ1mi9199j8yrHjKNF
 aw+Sju/rhJKCtO1Fv3fK6SmWRwbZYViMfvITeOVqyfQN2RT+JnaRfpx75Kyx/jMAFZeU
 GnxmHWOqii0mbZL3O408oDyB7CubKyvl2iYHvlzvpUZN5jtS/CEaLKiQw/hj0nfuvk9k
 nHQA==
X-Gm-Message-State: AFqh2krSZDNOfLveaMBUKrriGuXwai0PqY0ocAl5EIvZOpQWelsS4IbH
 BdLFIJpJrZ21afTRMgqUvYosD39eTetOgJR9K6q7/0R98ittWUdg2iariuJJ9Qu6S6GJ6CHT/jj
 XNsLttMB15FLx40rgLwA+tFaYqj+F
X-Received: by 2002:a5d:5085:0:b0:2bb:de29:5c16 with SMTP id
 a5-20020a5d5085000000b002bbde295c16mr239680wrt.71.1673113061452; 
 Sat, 07 Jan 2023 09:37:41 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuXSl8k0AQ+AaxiYKIpWccEMhElgIT4iXKymRjmLW3+uJy2TLemfEx8jQfkke3BL6dpkW4FoQ==
X-Received: by 2002:a5d:5085:0:b0:2bb:de29:5c16 with SMTP id
 a5-20020a5d5085000000b002bbde295c16mr239674wrt.71.1673113061253; 
 Sat, 07 Jan 2023 09:37:41 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 o14-20020a5d58ce000000b002879c013b8asm4292158wrf.42.2023.01.07.09.37.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Jan 2023 09:37:40 -0800 (PST)
Message-ID: <033857f1-f52d-1fec-b998-a801b04a7033@redhat.com>
Date: Sat, 7 Jan 2023 18:37:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 2/2] drm/mipi-dsi: Add a mipi_dsi_dcs_write_seq() macro
To: linux-kernel@vger.kernel.org
References: <20230102202542.3494677-1-javierm@redhat.com>
 <20230102202542.3494677-2-javierm@redhat.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20230102202542.3494677-2-javierm@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/2/23 21:25, Javier Martinez Canillas wrote:
> Many panel drivers define dsi_dcs_write_seq() and dsi_generic_write_seq()
> macros to send DCS commands and generic write packets respectively, with
> the payload specified as a list of parameters instead of using arrays.
> 
> There's already a macro for the former, introduced by commit 2a9e9daf75231
> ("drm/mipi-dsi: Introduce mipi_dsi_dcs_write_seq macro") so drivers can be
> changed to use that. But there isn't one yet for the latter, let's add it.
> 
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

