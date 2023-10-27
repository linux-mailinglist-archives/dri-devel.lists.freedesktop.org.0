Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0D27D93B2
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 11:31:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B063F10E964;
	Fri, 27 Oct 2023 09:31:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4DF210E962
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 09:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698399060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XNrFs0h07QQ3WzL8XWJs8qa636YWY8uqFNGGrlBPzmc=;
 b=EyLAgwKsApJ79ck1X+VNA/mHB0H125uauEFQYpqkI/DAo4joRbKpQfu3mHdM4aszNA7B1E
 WBujZY+QM7H6sX3ddqhivzS4+wBN9/RkeTxSwJNubbAcIna/QTAVci4a8zNr9BOHage2em
 vpsz3lG45lp/hB659IXO2eyBf8UjAEU=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-abLS-_tCP2upAtOXrKgnhw-1; Fri, 27 Oct 2023 05:30:59 -0400
X-MC-Unique: abLS-_tCP2upAtOXrKgnhw-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-5079f6c127cso2071787e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 02:30:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698399058; x=1699003858;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XNrFs0h07QQ3WzL8XWJs8qa636YWY8uqFNGGrlBPzmc=;
 b=hyLT7W5+moEpJivT9RezequVHzXklqB+3vtwyFzpZjPYUqV9njgZUAudEuWXkaA5P0
 iu9/GcM8Dqcx8uI0QaGY/c5+Q1WPiYi58sVu54ewADElv3ekAblYZbfML0ORsjhaos+Z
 mVmmxcrF7T4gzD9q5gWE0JyAUWD8RqYc6mMfsMwqlEVPhJHswjPrq6+Eol6nqL6a96Tc
 0vCO8UYeEaSKENgISkwTGiDyfmlnn1TWfPLosdhn/WEYcCvhIPJEmpXbR1aomQ8oldyq
 wqE93El/IYyzSJUr4JevOsH/l/+UXfcsQxfv8ACZIJiE1LDXiVhStANj5tiYOhL8NHco
 sk8w==
X-Gm-Message-State: AOJu0Yyj3uA58YeoX4YdvI7BlqwYqJ+tOiYvGNrUklJxQJk0k23SeuCf
 il1n5e7p6bYAVzrvvO+rbqj+lJe+Iq2hkdNMXF3KfLwHGX8cFhJ7a/HSyNp///WFvlXE/YLuD/j
 /gwSSiml0n3YDqWg9+12puCn+pf0M
X-Received: by 2002:ac2:5449:0:b0:505:7371:ec83 with SMTP id
 d9-20020ac25449000000b005057371ec83mr1392683lfn.48.1698399058342; 
 Fri, 27 Oct 2023 02:30:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJVuGYSYuMReQZAoVFqQtGlXfjg/2jaYA5k0xGLUkM/iujstFcVk8aJjyyfMM1Ijuxe8lSmA==
X-Received: by 2002:ac2:5449:0:b0:505:7371:ec83 with SMTP id
 d9-20020ac25449000000b005057371ec83mr1392668lfn.48.1698399057931; 
 Fri, 27 Oct 2023 02:30:57 -0700 (PDT)
Received: from localhost ([212.80.183.76]) by smtp.gmail.com with ESMTPSA id
 a1-20020a05600c348100b00402ff8d6086sm1165870wmq.18.2023.10.27.02.30.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Oct 2023 02:30:57 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: display: ssd132x: Remove '-' before
 compatible enum
In-Reply-To: <169801218855.747717.5658253186246322717.robh@kernel.org>
References: <20231020223029.1667190-1-javierm@redhat.com>
 <169801218855.747717.5658253186246322717.robh@kernel.org>
Date: Fri, 27 Oct 2023 11:30:56 +0200
Message-ID: <87y1foo1in.fsf@minerva.mail-host-address-is-not-set>
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
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rob Herring <robh@kernel.org> writes:

> On Sat, 21 Oct 2023 00:30:17 +0200, Javier Martinez Canillas wrote:
>> This is a leftover from when the binding schema had the compatible string
>> property enum as a 'oneOf' child and the '-' was not removed when 'oneOf'
>> got dropped during the binding review process.
>> 
>> Reported-by: Rob Herring <robh@kernel.org>
>> Closes: https://lore.kernel.org/dri-devel/CAL_Jsq+h8DcnpKqhokQOODCc8+Qi3M0PrxRFKz_Y4v37yMJvvA@mail.gmail.com/
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>> ---
>> 
>>  .../devicetree/bindings/display/solomon,ssd132x.yaml      | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>> 
>
> Reviewed-by: Rob Herring <robh@kernel.org>
>

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

