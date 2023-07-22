Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0802375D870
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jul 2023 02:50:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C349F10E0A5;
	Sat, 22 Jul 2023 00:50:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA9610E0A5
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jul 2023 00:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689987032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sJYv5x+k3Q4NH1eRkFB8Sxq+BIWu4PhXjDBrAF/r5Hk=;
 b=D5mwopFN+qlWEZn/vviX/x1lBNOH8GNQx9mk1A3SEuuZIsuxeLJoZ/0z6k2pXSm2fT+JQv
 ekgkdkkXTS6kvD1ftdnpQCVDoGCsiv8nw6c+M5VJymG/MWmV53oc8D3M90KlNWO65pPei0
 J7cE69E/CRAM+f2zvJel5se0ywEPKFk=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-ZvD2p55FMsyJdR7eay65Og-1; Fri, 21 Jul 2023 20:50:31 -0400
X-MC-Unique: ZvD2p55FMsyJdR7eay65Og-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2b70bfc97e4so24827881fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 17:50:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689987029; x=1690591829;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sJYv5x+k3Q4NH1eRkFB8Sxq+BIWu4PhXjDBrAF/r5Hk=;
 b=cNraAt4xI+CHUPDKdt8vSD3WrY+rTt2Es1REUZAKVejshI5T89pEhisBTCIm9s72fn
 4rtJvRm1MLGgZnBKLTPWGpOQ1w3jGA/SWIM+dNg6ueYQL1qRmUnglKNqOe66gDXMOEGa
 evHBOJqPiiG7dRv2T39aqn9Yo0mRmMda1dk5pbs6TfHjjtU3fJyH/C3Oo6NOSrM+aZY7
 ve3Kr5g5XXDvPndPQGonmKbYPk5+jbyePzbQM0EKZ+w1LSPyo1+Rb/D+/6MUuGntuUOC
 X0OtD5kPFdDnzuR4hQcBHfXki87ZkyPxJd+qP+i2ZSV6YfIH3MRAAOKYizSXMgERM7/x
 Bstg==
X-Gm-Message-State: ABy/qLajMeLuLJz3apUtvh3PBxmERGrZleWx/DKT9FjFZ5z7VLobg663
 gZwB1LuSTHu7EloLVND7ZxBAhFEkXuWleK+sZjRB8zDLdl76EdYsYRQQjbMmvL/3xTRcdYMD58l
 vuTz1bC2S4omBMlXi+mJLv2kjKNY+
X-Received: by 2002:a2e:9b06:0:b0:2b9:601d:2c3 with SMTP id
 u6-20020a2e9b06000000b002b9601d02c3mr2616256lji.37.1689987029680; 
 Fri, 21 Jul 2023 17:50:29 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFD2Ck7YGPgxYDau0n94eHp8Rfq71xrJ0iC1YYZPposhWAbzYQSuWbwHpQN486Xy3RRLOn9ew==
X-Received: by 2002:a2e:9b06:0:b0:2b9:601d:2c3 with SMTP id
 u6-20020a2e9b06000000b002b9601d02c3mr2616243lji.37.1689987029310; 
 Fri, 21 Jul 2023 17:50:29 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q14-20020a1cf30e000000b003fbe561f6a3sm7028287wmq.37.2023.07.21.17.50.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jul 2023 17:50:28 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: Re: [PATCH v6 1/4] video: Add auxiliary display drivers to Graphics
 support menu
In-Reply-To: <CANiq72=RBUdFdt8=k-AACxXWrbnqfiaiViNUNxvwzGNCDkjwQA@mail.gmail.com>
References: <20230719081544.741051-1-javierm@redhat.com>
 <20230719081544.741051-2-javierm@redhat.com>
 <87sf9gublz.fsf@minerva.mail-host-address-is-not-set>
 <CANiq72=A3PLGGPGnwL=gjX7LFsQL9N8W__ojxmVpj2uCAKvhQA@mail.gmail.com>
 <87mszou7kz.fsf@minerva.mail-host-address-is-not-set>
 <CANiq72=RBUdFdt8=k-AACxXWrbnqfiaiViNUNxvwzGNCDkjwQA@mail.gmail.com>
Date: Sat, 22 Jul 2023 02:50:28 +0200
Message-ID: <87jzusu5uz.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Arnd Bergmann <arnd@arndb.de>, Nipun Gupta <nipun.gupta@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Miguel Ojeda <ojeda@kernel.org>,
 Pieter Jansen van Vuuren <pieter.jansen-van-vuuren@amd.com>,
 Oded Gabbay <ogabbay@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> writes:

> On Sat, Jul 22, 2023 at 2:13=E2=80=AFAM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>>
>> Oh, interesting. I wonder why that couldn't had been a fbdev driver then
>> using FB_VISUAL_MONO01? I'll reword then the commit message before apply
>> to the following instead:
>
> It is :)
>
>     .type =3D FB_TYPE_PACKED_PIXELS,
>     .visual =3D FB_VISUAL_MONO10,
>

Ah! Should had read the driver before commenting then :)

> The original distinction was more about having a place where to put
> small, simple displays that were not your usual "screen", where you
> would typically draw a custom UI, probably controlled with a few
> custom buttons, etc.
>

Got it. Then that's yet another argument for adding the auxdisplay
drivers under the same "Graphics support" menu.

>> Perfect, thanks!
>
> My pleasure!
>
> Cheers,
> Miguel
>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

