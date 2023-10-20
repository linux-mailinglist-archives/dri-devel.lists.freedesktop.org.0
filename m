Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C281E7D1915
	for <lists+dri-devel@lfdr.de>; Sat, 21 Oct 2023 00:28:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50E9210E603;
	Fri, 20 Oct 2023 22:28:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1413210E603
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 22:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697840911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6WBYVjTA6Jk3GAZvnh+7RXQwGKV/swUxWZnIaQXvoxU=;
 b=QvIpX9Q72i3V6fpSwJFvr6ywaGIYdHODqxojKkFvPPEELEpOoESE9H7R+3F8YvXnAuTN70
 TMzOO7v1sVIxzDjp/+RdMMfE1IiCrON018SmrHO2thRfJYET74BiDLLSysH6xq2XGYY88D
 RMpVGvnuDrTNbJz38cS9AYNqETmEfXg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-quz1-WPQO4GbGCjqglGVjQ-1; Fri, 20 Oct 2023 18:28:27 -0400
X-MC-Unique: quz1-WPQO4GbGCjqglGVjQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-40845fe2d1cso7415635e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 15:28:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697840906; x=1698445706;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6WBYVjTA6Jk3GAZvnh+7RXQwGKV/swUxWZnIaQXvoxU=;
 b=rHSmcvxbpdHIer2GHaOp7EWQPpx9OSigoMAfMd2RRMruEOEyVDSho1zZv6pNFRPdmD
 bURAP3pUoaCs/Jenn3op77f1kNRC1BGVA3SEXP3dja2G9LSoloNn2jOgyLz5wpb7yiW1
 2ak/yG7JnSJ5GbjtYiX5PVrtijl5TDl06j2C67SUfDRct8jeEgNfoZF2Wtk1/Ey/jopv
 dJhd8AeOjBBASP5VtXQ3Rjk6Gp73EbWQwk47sSRe3TirjGuPEWxi4EIvAMrNVQlQ6PVK
 u6FvhQlAgpPo3VsEKrIikJK8JarKyzapUbuK3dLix+Uaa2EyDnC2sNX8x/5QFWnIQB92
 WmCQ==
X-Gm-Message-State: AOJu0YzIsJj1wu0AqRhueH4B8NgFOp+5Kl2Yzpivzw8/kvYVEu2k4Vtv
 9y7uDfH7oLs2bvJSCgJSi+4hUFNb1cEGVog59Ac4G+lOnVF2bfU5TIXVMaQkGuDcjWv6ePQ44bt
 wAQ8suirSbEWbdypqCieUxEQCNGmf
X-Received: by 2002:a05:600c:3502:b0:3fe:2bb1:11ba with SMTP id
 h2-20020a05600c350200b003fe2bb111bamr2550041wmq.27.1697840906530; 
 Fri, 20 Oct 2023 15:28:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTnnTeJTyNAw2QeFS5BxK7GMEmdb888js+Xuo4NjtnX6/IvU3LnEp5F1fCQHlS3MrK3LISAg==
X-Received: by 2002:a05:600c:3502:b0:3fe:2bb1:11ba with SMTP id
 h2-20020a05600c350200b003fe2bb111bamr2550029wmq.27.1697840906158; 
 Fri, 20 Oct 2023 15:28:26 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l23-20020a1c7917000000b004063cced50bsm3079357wme.23.2023.10.20.15.28.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Oct 2023 15:28:24 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 6/6] dt-bindings: display: Add SSD132x OLED controllers
In-Reply-To: <CAL_Jsq+h8DcnpKqhokQOODCc8+Qi3M0PrxRFKz_Y4v37yMJvvA@mail.gmail.com>
References: <20231014071520.1342189-1-javierm@redhat.com>
 <20231014071520.1342189-7-javierm@redhat.com>
 <CAL_Jsq+h8DcnpKqhokQOODCc8+Qi3M0PrxRFKz_Y4v37yMJvvA@mail.gmail.com>
Date: Sat, 21 Oct 2023 00:28:23 +0200
Message-ID: <87bkctj5dk.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Conor Dooley <conor@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rob Herring <robh@kernel.org> writes:

Hello Rob,

> On Sat, Oct 14, 2023 at 2:15=E2=80=AFAM Javier Martinez Canillas
> <javierm@redhat.com> wrote:

[...]

>> +maintainers:
>> +  - Javier Martinez Canillas <javierm@redhat.com>
>> +
>> +properties:
>> +  compatible:
>> +    - enum:
>
> Now this is a warning in linux-next. The '-' should not be there.
> Please send a fix.
>

Sure, I'll post a fix. Thanks for reporting the issue.

This is a leftover from when the compatible string enum was a 'oneOf'
child and the 'oneOf' got removed during the binding schema review.

> Not sure why there wasn't a report, but most likely it didn't apply to v6=
.6-rc1.
>

Yes, I'm not sure either. I didn't notice it when testing with:

make dt_binding_check DT_SCHEMA_FILES=3DDocumentation/devicetree/bindings/d=
isplay/solomon,ssd132x.yaml

> Rob
>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

