Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D5D66108D
	for <lists+dri-devel@lfdr.de>; Sat,  7 Jan 2023 18:37:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEFDB10E1AD;
	Sat,  7 Jan 2023 17:37:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9330310E1AD
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Jan 2023 17:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673113017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9gCpV0dGtCCGp1jPgBtNFnuKxWWQi0wqnd//45zEPmE=;
 b=ZHUfroq7g+bPPFzWwKWlCqaHzRv/WvNbvAKp6/IcPVtOhIkwTmrpLVPjBIQ98kd1SdhcGC
 l85EijLgmMoK+M9M4XU16eiq7128HeegIZZ5oBnyqOuMzTbJReYtntFVL27KOh+PLl0VG5
 gpkdtS+mNR5RSHxyWnba4qM7IBCpbOw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-656-P02C19GkPci5GpToL_omEA-1; Sat, 07 Jan 2023 12:36:55 -0500
X-MC-Unique: P02C19GkPci5GpToL_omEA-1
Received: by mail-wm1-f70.google.com with SMTP id
 i7-20020a05600c354700b003d62131fe46so4536130wmq.5
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Jan 2023 09:36:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9gCpV0dGtCCGp1jPgBtNFnuKxWWQi0wqnd//45zEPmE=;
 b=ATjZn1Gfr1drhEmxRN3I8+yvoa/V8wCLSfGFkjbEYTFfPrJ17INQNth098GTqt15nf
 mflAXIrmw5FnYQ8m/88vDDLx+gS0Db/JJHJVQLWVPaDjK0v5aNBxF13NBFLg/YEChQ5k
 ewRhZf6+IVYH9tofwtp5ljNclY0C/6JY4Zt0JJiDcSN6qevZ9b+gVwEpEyC6JASMBoh2
 VAxwmXEWuCUfhdQRl61JNtn82nD/tON4qlindF3RKvEwbfXbYn4inyjlCV/+0yZ/nZUw
 W23gZmhuIiVAGVCiMYkgr6NywbeatuQcE0RrbNXnqikb8/MGstcfWnx91KDa0B3oHZTk
 grLg==
X-Gm-Message-State: AFqh2koZgNOJJUWX5aR5IaJc6u2OPtAZP+wwP5gcJ8bYbA4bE+TKiDdY
 qECYVnLrHCDWgPNn7OJx1iM5hytwBSVwlKweKP1XDDNZLTYJhv5IV5wIyQT7frajg7TcNRO2QQY
 MEzhaYa3YkyEzmaFVHZSjh/JOz15R
X-Received: by 2002:a7b:cd99:0:b0:3d3:5506:1bac with SMTP id
 y25-20020a7bcd99000000b003d355061bacmr42940020wmj.30.1673113014604; 
 Sat, 07 Jan 2023 09:36:54 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtq5O2gMQwBFZYJBuaPTxiyhl5nYlsXlZhAewhas7TQGY9Hr/5ja8BEgFOpLT7ZHXkopoF13A==
X-Received: by 2002:a7b:cd99:0:b0:3d3:5506:1bac with SMTP id
 y25-20020a7bcd99000000b003d355061bacmr42940017wmj.30.1673113014449; 
 Sat, 07 Jan 2023 09:36:54 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m8-20020a5d6a08000000b002a1ae285bfasm4291978wru.77.2023.01.07.09.36.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Jan 2023 09:36:53 -0800 (PST)
Message-ID: <8110a6b7-dacb-57d3-a9fd-b2caf9899ab9@redhat.com>
Date: Sat, 7 Jan 2023 18:36:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 1/2] drm/mipi-dsi: Fix mipi_dsi_dcs_write_seq() macro
 definition format
To: Sam Ravnborg <sam@ravnborg.org>
References: <20230102202542.3494677-1-javierm@redhat.com>
 <Y7M+6gdQM/4DhQsP@ravnborg.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <Y7M+6gdQM/4DhQsP@ravnborg.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 dri-devel@lists.freedesktop.org, Tom Rix <trix@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/2/23 21:30, Sam Ravnborg wrote:
> On Mon, Jan 02, 2023 at 09:25:41PM +0100, Javier Martinez Canillas wrote:
>> Change made using a `clang-format -i include/drm/drm_mipi_dsi.h` command.
>>
>> Suggested-by: Sam Ravnborg <sam@ravnborg.org>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> 
> Thanks,
> 
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
>> ---

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

