Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C18A54B1E2
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 15:03:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8106F10E23B;
	Tue, 14 Jun 2022 13:03:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BE8910F802
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 13:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655211828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mlgbQ0d3whh0zJEXTO6q7zEd4mBZ0vUay1OEfrGzcmw=;
 b=e2mf8/J2emYNf5aHcMKfMB5uici3XFdsVjEfbKHqF1OPNwpxMn86JclgM7dx02yISQ+gNq
 oIPaecYrHLXUq7nwhanyBtBwut8yRUkXv8CWcLLYtlk5tc+d7DV/VK+bi4Ww2Mxap6M9JB
 /vQ6u62Fm3jutwCFFdvduzvB9UK6Zks=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-e_PqSvamPWqWcLx0Mk1fUw-1; Tue, 14 Jun 2022 09:03:44 -0400
X-MC-Unique: e_PqSvamPWqWcLx0Mk1fUw-1
Received: by mail-wr1-f71.google.com with SMTP id
 p8-20020a5d4588000000b0021033f1f79aso1282594wrq.5
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 06:03:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mlgbQ0d3whh0zJEXTO6q7zEd4mBZ0vUay1OEfrGzcmw=;
 b=po46kGCKWe6m0xZSsWDSInURFOf9V+EYdjvFB2Hy8cpse/GESn0sGRlWk4sf5XXdH4
 zI+9w3AAEf7jzepEo2fACb7qc4TrwtKsAddI+d8rLYGi9NNp79B/YII0Iyc6K4rzhqK8
 dM2XJMHSt0L+nKvZtZ0S1BqyHKBYTIKVLjKauDwtSPviP9jzz3Cf2yzvpUfT/6ysNaks
 nWFuGwugPUMd78iAqScmAS0SDxb9C4pX3o/sf9LIfMAww/TIDVrzjmuDHLvFFrnez42/
 TbsPS1YllbYb5IdYx0legYIfiNaVm2rCfg0rquTiEDOGnPsmMSk0n5/QbwlhmS82X0j6
 +ZyA==
X-Gm-Message-State: AJIora/uQKFdYD97QuDPC/P4O2T2iyqCvC4FCQVgEQS3Mfe6iEOLUZjl
 cSCUmZOhx68Yf5g9gZ3RdLYstIm24KvE56FNZ+5O+Q4kvqZqyObbz76aGDo1dNe25vJJfgqvFZZ
 cKeCyJOZd3fMDTdwohMe00hJt9lqt
X-Received: by 2002:a5d:4a4c:0:b0:210:27dd:e57 with SMTP id
 v12-20020a5d4a4c000000b0021027dd0e57mr4665441wrs.655.1655211823743; 
 Tue, 14 Jun 2022 06:03:43 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u8OOqxbEms0K2jYgdmxNRVT96IUT7mYE8cfIbeBLNLXDRPzxVHiTpZ6UYrmjBsW/c1GIrwAg==
X-Received: by 2002:a5d:4a4c:0:b0:210:27dd:e57 with SMTP id
 v12-20020a5d4a4c000000b0021027dd0e57mr4665418wrs.655.1655211823520; 
 Tue, 14 Jun 2022 06:03:43 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 v13-20020a5d610d000000b0020c5253d914sm11986843wrt.96.2022.06.14.06.03.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jun 2022 06:03:43 -0700 (PDT)
Message-ID: <15dac932-ab2d-1c2e-6438-75e8eda6dd62@redhat.com>
Date: Tue, 14 Jun 2022 15:03:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 0/3] KUnit tests for drm_format_helper
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
References: <20220613171738.111013-1-jose.exposito89@gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220613171738.111013-1-jose.exposito89@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel@lists.freedesktop.org, davidgow@google.com, airlied@linux.ie,
 dlatypov@google.com, linux-kernel@vger.kernel.org, tzimmermann@suse.de,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/13/22 19:17, José Expósito wrote:
> Hello everyone,
> 
> Here is the v3 of the series, including the documentation, previously
> sent as a standalone patch [1], and changes suggested during review.
> 
> Thanks a lot,
> José Expósito
> 

Before merging this, could you please reach the folks working on [0] ?

I think that would be good to have some consistency with regard to KUnit
tests from the start to avoid future refactorings. For instance, you are
adding the tests under a `kunit` sub-directory while they are doing it
in a `tests` sub-dir.

Also there may be other things that could be made more consistent, like
the naming conventions for the tests, suites, etc.

[0]: https://lore.kernel.org/all/20220608010709.272962-4-maira.canal@usp.br/T/

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

