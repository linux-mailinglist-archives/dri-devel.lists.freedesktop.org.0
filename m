Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B794F7B0B
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 11:09:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A89D210E073;
	Thu,  7 Apr 2022 09:09:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A566E10E5B6
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 09:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649322558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hB372ZQZwFtHcO7eQrCjRw+uc8WqcWd1Sg3EXTJwdeA=;
 b=GnJ6CxzSRFKCCreCYoxq+Jz+y+QpF0Kti0oUp+HT5L0xjx4s2tPPl3hzkfQooIm/rde2ol
 B4OHa8KjOCpuwRJHffgXabtpGlAx+XM/WIfdW71uqGw1xVk7qTh9CV+mXqV933uQjCRCTn
 ONG6EuV38Bh+HnLTOxiaef2JifQAyHE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-363-c-ubSfCHPxORg1AMQ77WQA-1; Thu, 07 Apr 2022 05:09:17 -0400
X-MC-Unique: c-ubSfCHPxORg1AMQ77WQA-1
Received: by mail-wm1-f71.google.com with SMTP id
 189-20020a1c02c6000000b0038e6c4c6472so4309123wmc.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Apr 2022 02:09:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hB372ZQZwFtHcO7eQrCjRw+uc8WqcWd1Sg3EXTJwdeA=;
 b=y6L/XZ3XNA+5LDUPy8fOucFt3YUhfkYkchIXqoipDSoTXvINidwBP32LY+RKpeZOTA
 0H/OdwXQdaeSbtFzY4PuR7uIp+eZ2aIJNPn/W67lCqW95zaG4i1YrBq9szCqcNU6SBJa
 oQGu1JEYLSU4miLqt3JJ/JsvxhMrcPKcPvDIKwbcxKONLKuOmd0HapGotUs5P4nhg3hb
 q71n2q6JZiRK2w+DN11jERuWsc01/HhbAWhDQPP74FylZEiWKRiAuZt1LQurmloW49h6
 iYK8jeay4MP51hKi9OWJ8pj48PCPf1PSaim4I8XwivMs8gZozZJGQSlmWZcqOGweAQBd
 BDbw==
X-Gm-Message-State: AOAM5318v4B0l2DIwJnScepg2G8lGvgtIPukogR4Gfb2OUMYGwAeRiPQ
 mdbqcaDrdD+dI40dJfLjdKvIOGp04JdPTVX8bPKzPIf9eP1nZj+qUXqdgBSbxuAk3BbrpvExFYw
 A/ho/VHpdUjWjvIQpcmy8W+wysSZ4
X-Received: by 2002:a5d:4288:0:b0:206:b7b:db7a with SMTP id
 k8-20020a5d4288000000b002060b7bdb7amr10086632wrq.28.1649322556215; 
 Thu, 07 Apr 2022 02:09:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyl0hLCrJWyvNC3LHUnOPVnkuMzNK6MdN9AyHNReSrLGnx8hW5NAoD1FUkaGxU16mm66GKK9g==
X-Received: by 2002:a5d:4288:0:b0:206:b7b:db7a with SMTP id
 k8-20020a5d4288000000b002060b7bdb7amr10086613wrq.28.1649322555951; 
 Thu, 07 Apr 2022 02:09:15 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a05600c2cc500b0038e9ac68d54sm38955wmc.32.2022.04.07.02.09.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Apr 2022 02:09:15 -0700 (PDT)
Message-ID: <4957c527-3346-104e-0265-8231be093d1f@redhat.com>
Date: Thu, 7 Apr 2022 11:09:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RESEND RFC PATCH 1/5] firmware: sysfb: Make
 sysfb_create_simplefb() return a pdev pointer
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Borislav Petkov <bp@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miaoqian Lin <linmq006@gmail.com>
References: <20220406213919.600294-1-javierm@redhat.com>
 <20220406213919.600294-2-javierm@redhat.com>
 <Yk6o2MzkMQeSAcsb@phenom.ffwll.local>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <Yk6o2MzkMQeSAcsb@phenom.ffwll.local>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Daniel,

On 4/7/22 11:03, Daniel Vetter wrote:
> On Wed, Apr 06, 2022 at 11:39:15PM +0200, Javier Martinez Canillas wrote:
>> This function just returned 0 on success or an errno code on error, but it
>> could be useful to sysfb_init() to get a pointer to the device registered.
>>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> 
> You need to rebase this onto 202c08914ba5 ("firmware: sysfb: fix
> platform-device leak in error path") which fixes the same error path leak
> you are fixing in here too. Or we just have a neat conflict when merging
> :-) But in that case please mention that you fix the error path leak too
> so it's less confusing when Linus or someone needs to resolve the
> conflict.
>

Ups, I thought that had my local tree up-to-date but it seems that was a few
days old. I've updated my remote now and rebased, so will have this fixed in
the next revision of the series.

And this patch becomes smaller indeed :)
 
> Anyway Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 

Thanks!

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

