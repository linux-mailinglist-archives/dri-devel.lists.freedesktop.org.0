Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E40217C6761
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 10:08:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1E8710E441;
	Thu, 12 Oct 2023 08:08:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 700E010E441
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 08:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697098108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D47gZcZq+oXV8zRmhANF/Ji/m46sA0vKkgErNq6R8Nw=;
 b=TKW7uJj3lO24WPVnloefliTcAXRC/42dwBziXlNEU85gBA+Mh3qcFECo6RiIYvRymwA7KE
 JH3lzbCCA0ghXjY9TrvhWrvriCePoTnuVkOkLoveMjiAF3+RROB/oya78Fw4S89Dq7GobN
 I5LzSYhUSwKrPAlKwI/lOHZSWv/VP9g=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-437-N1CfV0PsM9SFnr75dZ3uBw-1; Thu, 12 Oct 2023 04:08:25 -0400
X-MC-Unique: N1CfV0PsM9SFnr75dZ3uBw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4067f186039so5543325e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 01:08:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697098104; x=1697702904;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4sy1niajabmtfJtjCY77OzeeT/0lqMPwPT7C3Wbak1k=;
 b=qGWyZVwPBjLnpGq3ykll42ltVM3W8CSlP2+C9JW/naNAGVZ5pLwZ/5AKhi7mzWdQo+
 QQNxNQMstVGDoi0BhNzJ+7pBwIx6kL2KvQApc9m9WBIHfFEhrFxLI+DfQIE9fUzyxAQR
 C61SZF99VJ3q7IfO99EQmBLmpuNZvMNVyEkj05vqhu2VVLk9OpUj8QgTeqjPsIR3/3yu
 2fDMv2sM09zPteCGjB96RHCr++uZXWRxMprrDZQHiV3kblzOHlaoSCunWvL/IVIJFmvY
 k8nBD8MjsuhncHGmsoDLV/q9OzM3zW/GqRJARpg9WTSwCix/627g23g41y5c3oz0mYt3
 yHOA==
X-Gm-Message-State: AOJu0YxCv/DrUErALVbfMc6LyQPU45UrjAkA3kiQAoCxE1PoDCKehE3+
 t3Go1ueQ5u33UT6Zec54Er7Uoc77lKi+Yn6cjsyqpyYj9oRdYo+jWD8iMB2kmwj/VlkbbB4K3pF
 6HIoaNgF1uGCFO2uDBlwqU25Pq+sL
X-Received: by 2002:a05:600c:4fc4:b0:407:6911:447c with SMTP id
 o4-20020a05600c4fc400b004076911447cmr789179wmq.4.1697098104766; 
 Thu, 12 Oct 2023 01:08:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiZTBKUlCnAh+CV/NuP4uEbPNN+Std09KdK+CwQMNFHnOTkVZIvzDNtwZ5zDNL5/aKHpfW/g==
X-Received: by 2002:a05:600c:4fc4:b0:407:6911:447c with SMTP id
 o4-20020a05600c4fc400b004076911447cmr789152wmq.4.1697098104439; 
 Thu, 12 Oct 2023 01:08:24 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 19-20020a05600c025300b00401d8181f8bsm21134403wmj.25.2023.10.12.01.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 01:08:24 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 5/6] dt-bindings: display: Split common Solomon
 properties in their own schema
In-Reply-To: <CAMuHMdVR=aM-fr6SLfZMyA-Mdw23Tv+rX-iQQmw5u5U3vW5Ajg@mail.gmail.com>
References: <20231012065822.1007930-1-javierm@redhat.com>
 <20231012065822.1007930-6-javierm@redhat.com>
 <CAMuHMdVR=aM-fr6SLfZMyA-Mdw23Tv+rX-iQQmw5u5U3vW5Ajg@mail.gmail.com>
Date: Thu, 12 Oct 2023 10:08:23 +0200
Message-ID: <874jiw4614.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> Hi Javier,
>
> On Thu, Oct 12, 2023 at 8:58=E2=80=AFAM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>> There are DT properties that can be shared across different Solomon OLED
>> Display Controller families. Split them into a separate common schema to
>> avoid these properties to be duplicated in different DT bindings schemas=
.
>>
>> Suggested-by: Rob Herring <robh@kernel.org>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>> ---
>>
>> (no changes since v1)
>
> New patch in v2.
>

Yeah, I mention that in the cover letter. That "(no changes since...)"
message is automatically added by the tool I use to post patches (patman)
for all patches that don't have a change history, even for new patches in
a series revision. And I don't know of a way to disable it...

Maybe what I should do is to add a change history to new patches mentioned
that is a new patch to prevent this message to appear.

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

