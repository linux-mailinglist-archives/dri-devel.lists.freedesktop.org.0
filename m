Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A993F724A72
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 19:41:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 233CB10E23E;
	Tue,  6 Jun 2023 17:41:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D683610E23E
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 17:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686073310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1MCMKYfTU0gT+c8bYqPk/+QZwHogjhlIakDoeS9OEEc=;
 b=TFz3rTc+E0peiC+9OWMSbMYVlLXscFhgS4DcewtOQ4O00yQWXb8s9y7mpT5MsQkogUso68
 K2JpuAqAdohr/OnUIFP4J6BcmHGcN/h9VbPJvuBwN551uUra0+shi/tjwRdz0Btq3kuMAJ
 66vjQAnv6jlZGhZc6TBU1pH8H4NIhUA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-YLgnffrPN6aLv39ypLMCcw-1; Tue, 06 Jun 2023 13:41:49 -0400
X-MC-Unique: YLgnffrPN6aLv39ypLMCcw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f7678c74beso16528625e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jun 2023 10:41:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686073308; x=1688665308;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1MCMKYfTU0gT+c8bYqPk/+QZwHogjhlIakDoeS9OEEc=;
 b=izDFOJfF1VqN1nf043YKXPoTRJkwLek/jWtN2QTLl6SxBfYFYh7wKKBbLoiQAV1t0r
 whAYXhLKd3o61X36AvpXSf+vN3WlUJWUQRB53ZP51TxdR3QOW63yh/ZOrzJDibDrl8t0
 giKYkY5jMSOmeYthQ49ERpGEKAiZNkEJG4ZyhQ1YuPZP6QZDyyReWR4z65cXQU+3HcvV
 cQBpTKJjRaVpmeyNW1o+hGk4Ia+gByjy354UJLR0CzV+0NVxZCNAYDp3gq2amAIQwpT5
 Xt3IOyhzkrtOoMNoi5IoRGUuMpYlGoyXdxuRIm1RRJKIgcx3HajMY8FsAt8OlRm6WqTA
 N7Hg==
X-Gm-Message-State: AC+VfDwAEF9dEc2HqbQwQ4qZcrCx+Ri7Tu1vCJYx1mfBU5JE0niGdPka
 qkFKukzWVZkLw9k506h1DvfuuEea+ljqNbKhjs4vao1hHAR6oniFpmosYbF31A9djfnDrg9iYKk
 vuO2Hv7my+VBUxGdXJSzLIWdFVSd0
X-Received: by 2002:a7b:cb94:0:b0:3f7:381a:f5b5 with SMTP id
 m20-20020a7bcb94000000b003f7381af5b5mr2705791wmi.9.1686073307992; 
 Tue, 06 Jun 2023 10:41:47 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7TT3PU8FeJqr6tao5nCX61AA3MIz+86M7iY+HvCpefjVguBtREmKqO0Nn/jIqfr3vb0eg1VA==
X-Received: by 2002:a7b:cb94:0:b0:3f7:381a:f5b5 with SMTP id
 m20-20020a7bcb94000000b003f7381af5b5mr2705774wmi.9.1686073307737; 
 Tue, 06 Jun 2023 10:41:47 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q21-20020a1ce915000000b003f4fb5532a1sm14368326wmc.43.2023.06.06.10.41.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 10:41:47 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: =?utf-8?Q?Ma=C3=ADra?= Canal <mcanal@igalia.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rodrigo Siqueira
 <rodrigosiqueiramelo@gmail.com>, Melissa Wen <mwen@igalia.com>, Haneen
 Mohammed <hamohammed.sa@gmail.com>, Arthur Grillo <arthurgrillo@riseup.net>
Subject: Re: [PATCH 1/2] drm/vkms: Add kernel-doc to the function
 vkms_compose_row()
In-Reply-To: <20230508220030.434118-1-mcanal@igalia.com>
References: <20230508220030.434118-1-mcanal@igalia.com>
Date: Tue, 06 Jun 2023 19:41:46 +0200
Message-ID: <87legwh4it.fsf@minerva.mail-host-address-is-not-set>
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
Cc: =?utf-8?Q?Ma=C3=ADra?= Canal <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ma=C3=ADra Canal <mcanal@igalia.com> writes:

Hello Ma=C3=ADra,

> The function vkms_compose_row() was introduced in the code without any
> documentation. In order to make the function more clear, add a
> kernel-doc to it.
>
> Suggested-by: Melissa Wen <mwen@igalia.com>
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

