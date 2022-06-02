Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A7053C13C
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 01:07:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E127D113A19;
	Thu,  2 Jun 2022 23:07:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FE34113A19
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 23:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654211237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9w8a+aZNsc7t/O1IsQf36DrBygwItUKqS/tF9xS7NKI=;
 b=fL3QkAa5t3AatY3swws1S3tev/IZeF87TyTU5y6z3LkRiwwWhMHZWjyYU2rEgrmmdLFzWD
 47bHDH9pqorq1MAEXM1kh+tsTKpQW67J5ADUk2JwUfr6qgEzKDG3siiUinGbzsBXHaaBjm
 a3E3Gt2qETa85BWB/hE0uH5Ky3W9HnE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-473-7G1bVoAMNbGbqmaJx2lnAg-1; Thu, 02 Jun 2022 19:07:16 -0400
X-MC-Unique: 7G1bVoAMNbGbqmaJx2lnAg-1
Received: by mail-wm1-f72.google.com with SMTP id
 o3-20020a05600c4fc300b003946a9764baso5843855wmq.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 16:07:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9w8a+aZNsc7t/O1IsQf36DrBygwItUKqS/tF9xS7NKI=;
 b=RkUncShX42EHHcMzy4vsyG9Vxb4tjK6t03RYEXwqDLULuw3//im39hbbJmqm5TogcA
 H5iZSRP+ASw8Wu9/56B3fWgLXyJ6kqLLo8mX+9PkCYAK+umABD/nOw8RqZFDBTZwztW6
 ARgWIXRYSQYiY3T4Sg9cz2mznH5reVP5keHFKEnqDlloF9SkQTkWVi0ypDByoDS1hv4J
 nvk/cuw0FN1Z6KN4SMYqDaYQBp3Z58V60yXPYE6M7eZQc4JKAW74ursmD+ibBbGLhlFv
 2CwepFJF8CDYXu0rNGuuhrInsjGpeE1OPyFDUw1Oo63OP1KA8b6etrJOFESetErbtgbr
 ATmg==
X-Gm-Message-State: AOAM533Psr29G1SCEnzgW7RUvek8jb+/B0iJ9g8o/DtzM8mw2UZ7fRFz
 zd2teV7/IxTyeaTqnWwDyNXr5XPX7KW/37XXS3uPQ/NcV0cwgRW2dM3eIuqvaXAObA9a0yKOy4d
 RkuaTmmPRrzISWgixKCw/flkXy9F+
X-Received: by 2002:a05:6000:11:b0:210:302d:e787 with SMTP id
 h17-20020a056000001100b00210302de787mr5469836wrx.535.1654211235501; 
 Thu, 02 Jun 2022 16:07:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNv713vUNRan7JINMr8dLkMgL44Cxs0UXh6wkgp5nMJrYtLvv31xo8KA1AaI96DIcAHFDjJQ==
X-Received: by 2002:a05:6000:11:b0:210:302d:e787 with SMTP id
 h17-20020a056000001100b00210302de787mr5469827wrx.535.1654211235306; 
 Thu, 02 Jun 2022 16:07:15 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 r9-20020adfe689000000b0020c5253d8d0sm5508418wrm.28.2022.06.02.16.07.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jun 2022 16:07:14 -0700 (PDT)
Message-ID: <ba65a70f-6274-a824-e589-5195e37b2be0@redhat.com>
Date: Fri, 3 Jun 2022 01:07:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 4/6] ARM: dts: bcm2711: Enable V3D
To: Peter Robinson <pbrobinson@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 bcm-kernel-feedback-list@broadcom.com, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Emma Anholt <emma@anholt.net>,
 Florian Fainelli <f.fainelli@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 maxime@cerno.tech, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Stefan Wahren <stefan.wahren@i2se.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
References: <20220601110249.569540-1-pbrobinson@gmail.com>
 <20220601110249.569540-5-pbrobinson@gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220601110249.569540-5-pbrobinson@gmail.com>
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
Cc: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/1/22 13:02, Peter Robinson wrote:
> This adds the entry for V3D for bcm2711 (used in the Raspberry Pi 4)
> and the associated firmware clock entry.
> 
> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> ---

Once you fix the typo mentioned by Stefan already:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

