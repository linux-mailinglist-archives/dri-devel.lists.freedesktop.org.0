Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FB77DA19F
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 22:08:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9422010EA36;
	Fri, 27 Oct 2023 20:07:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com (unknown [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C955910EA36
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 20:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698437275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TKT2siFILLclNs7DXkgdMslrVPbCgf+UzQ9e1S29k4Y=;
 b=EPxYkYql0Qwqg07x3T2do9bwkLn7sT/+5o957nQiU5YkPYv6v7Z6InpVX8ybjzr+GjeHoE
 B5WmN/Yhulc02NS1XFR8yH2aGofNbEInnCNQe46260+L6o/WV1ly9dwIMUg0mEN9PsPF1b
 yu+Fz9rkF9QwbPTJxNycePhhd8Bw9ZQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-161-MrjZEby1NKC3FA4Ixqlftg-1; Fri, 27 Oct 2023 16:07:53 -0400
X-MC-Unique: MrjZEby1NKC3FA4Ixqlftg-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-32f790a39d2so85087f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 13:07:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698437270; x=1699042070;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TKT2siFILLclNs7DXkgdMslrVPbCgf+UzQ9e1S29k4Y=;
 b=jvt3FQOqNzTdqDI1HAP18GNLXEJWRrejwepFxidCn8vhM+aVm12meMyS3RHBBXpI6s
 K8Ztysoomeq/zQHcNDLQfgn5hdgh8+/fwfMBBPHebRanC9Fs9jy2aTNLbogkY1uGXAVL
 vDm+Mdy7fAW8vGXjfykw8mfIhGMl7C6AUrW1OTF9z8aB/YVYjL62Wr1ayy55h7TDMWpg
 5vQaE+/9QqTB4O4W/yP6oz9tf3zhpVWFMa6Ds2pMbb1ujFJQP13cdFUvUw1cZPiyQA61
 JHExmfVMui8rD3uHyQmOE/Gm6AGWloqC6fryp6BT4GO9qO+dYHVAVFNWxo86xRoi09vk
 c1xQ==
X-Gm-Message-State: AOJu0Ywv12FkUrAZpd00NrY38wJG49grH/lA7VSwqWFkD851bHirUYQ9
 cgN9/ln+fQILcjQ4EaeIIs0FDLJ04T/nOuqhMXNCClQpRtVo5dwdf/RdSdl7dobSDSu2sTYrwmd
 OI+gpPti4DTswTY2eRg+wxE/Yyf3r
X-Received: by 2002:a05:6000:401f:b0:32d:b081:ff38 with SMTP id
 cp31-20020a056000401f00b0032db081ff38mr2954642wrb.0.1698437269876; 
 Fri, 27 Oct 2023 13:07:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkgUTGYjS6f4IS8gpL2kOvvhHnXXSaIDACgCVW9FuhNqYJjmfMRlQW2XMkSuftApFYRJIr7Q==
X-Received: by 2002:a05:6000:401f:b0:32d:b081:ff38 with SMTP id
 cp31-20020a056000401f00b0032db081ff38mr2954630wrb.0.1698437269519; 
 Fri, 27 Oct 2023 13:07:49 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 z9-20020a5d44c9000000b0032d9caeab0fsm2414342wrr.77.2023.10.27.13.07.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Oct 2023 13:07:49 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: display: ssd132x: Remove '-' before
 compatible enum
In-Reply-To: <20231027172753.GA2834192-robh@kernel.org>
References: <20231020223029.1667190-1-javierm@redhat.com>
 <169801218855.747717.5658253186246322717.robh@kernel.org>
 <87y1foo1in.fsf@minerva.mail-host-address-is-not-set>
 <20231027172753.GA2834192-robh@kernel.org>
Date: Fri, 27 Oct 2023 22:07:48 +0200
Message-ID: <87msw3omln.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rob Herring <robh@kernel.org> writes:

Hello Rob,

> On Fri, Oct 27, 2023 at 11:30:56AM +0200, Javier Martinez Canillas wrote:
>> Rob Herring <robh@kernel.org> writes:
>> 
>> > On Sat, 21 Oct 2023 00:30:17 +0200, Javier Martinez Canillas wrote:
>> >> This is a leftover from when the binding schema had the compatible string
>> >> property enum as a 'oneOf' child and the '-' was not removed when 'oneOf'
>> >> got dropped during the binding review process.
>> >> 
>> >> Reported-by: Rob Herring <robh@kernel.org>
>> >> Closes: https://lore.kernel.org/dri-devel/CAL_Jsq+h8DcnpKqhokQOODCc8+Qi3M0PrxRFKz_Y4v37yMJvvA@mail.gmail.com/
>> >> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>> >> ---
>> >> 
>> >>  .../devicetree/bindings/display/solomon,ssd132x.yaml      | 8 ++++----
>> >>  1 file changed, 4 insertions(+), 4 deletions(-)
>> >> 
>> >
>> > Reviewed-by: Rob Herring <robh@kernel.org>
>> >
>> 
>> Pushed to drm-misc (drm-misc-next). Thanks!
>
> Given what introduced this is before the drm-misc-next-2023-10-19 tag, 
> isn't it going into 6.7 and needs to be in the fixes branch? Though that 
> doesn't exist yet for 6.7 fixes. I don't understand why that's not done 
> as part of the last tag for a cycle. But drm-misc is special.
>

I pushed to drm-misc-next because I thought that there will be a last PR
of drm-misc-next for 6.7, but it seems I missed it for a couple of hours
(that is drm-misc-next-2023-10-27) :(

https://lists.freedesktop.org/archives/dri-devel/2023-October/425698.html

The solution now is to cherry-pick the fixes already in drm-misc-next to
drm-misc-next-fixes, to make sure that land in 6.7. I can do that once
drm-next is back merged to that branch, if you think the schema warning
fix must land in 6.7 and can't wait for the next release.

> Rob
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

