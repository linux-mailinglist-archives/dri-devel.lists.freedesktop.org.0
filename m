Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26948766999
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 12:00:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AADC10E6C5;
	Fri, 28 Jul 2023 10:00:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95CF210E6D5
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 10:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690538402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pJQNnDwHhKTOa9Md7V1tRIFhNgoxjH5BC2RheBs12bw=;
 b=H/ksn9T/WRq3rasnzdF93g2CFkycL/pyoBQeAcPuCCoQAVrXNIDON6KUnr3IbGn4J/gRRz
 cDeUzKTTP8JFFaWdjEg6E5/oRy9RQPJBx2UT0oXOPLYjh/xyhEmhSRTCznmKhAjNHiM7jV
 OJyswh+u/CEKSZiRkSGszAOZRBgsdfg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-176-eR-kvi5rP8uRvqqeAt0axA-1; Fri, 28 Jul 2023 06:00:01 -0400
X-MC-Unique: eR-kvi5rP8uRvqqeAt0axA-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3fd2dec82b7so12876225e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 03:00:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690538400; x=1691143200;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pJQNnDwHhKTOa9Md7V1tRIFhNgoxjH5BC2RheBs12bw=;
 b=kdK2uKBgaR+y3T5C0XLl1u3yhtsffstJ5iwbztb/WJ1S4jhH9XkiEVTTZE8cEE/Gzf
 q3jG6Trp40jMaj6DaAz9lDxKRfK9BKwPVKe0+PpaqNHkEhvmv/1v302bLfzrywRRa9SR
 aCZlpty/0AG5DN1rVSpPN2srugFnWkNRrg7rG+ZdyPheV2vDpDoVqgiPmMDrZG7c9oG0
 TWIrZXFS5ODCkY5KURd03oGwxxWj04Jys4hW9wgrg2Tatg/3PQ+QsHj3y2eyekrW0axm
 2JdW1aG6+ePUF/vzKqyjm6o4r4ALa4f0QGB5KYE3Org/KJASt74ctOl03J3/2zDK3oRh
 Hbdg==
X-Gm-Message-State: ABy/qLbf7Etvdr5j9m288GLEq3Exy4peg6RvO/LJetI7/uGuUTow7RCs
 hxE9UyFtTsDEJD2zMTndoSOhBffR4sIuLmWF8dmIvkUNQpGoBssErd1032/ndRsJZ7eaxVKzJTx
 0akQCV/A2l1p704CRr4UyUsykUxnS
X-Received: by 2002:a5d:60cb:0:b0:316:f3f3:a1db with SMTP id
 x11-20020a5d60cb000000b00316f3f3a1dbmr1256316wrt.32.1690538400187; 
 Fri, 28 Jul 2023 03:00:00 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGvVFl/+QuEwGgOf0OtaVy3l68k8gnLu8HbhCGvW7QutT2/hBtKWwBTcx9gJSeg+UzoJSVcMg==
X-Received: by 2002:a5d:60cb:0:b0:316:f3f3:a1db with SMTP id
 x11-20020a5d60cb000000b00316f3f3a1dbmr1256306wrt.32.1690538399910; 
 Fri, 28 Jul 2023 02:59:59 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f14-20020adffcce000000b00316eb7770b8sm4437496wrs.5.2023.07.28.02.59.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jul 2023 02:59:59 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] drm/atomic-helper: Update reference to
 drm_crtc_force_disable_all()
In-Reply-To: <CAMuHMdXs47Jt9Kqf-Gm0eoFP8Wpe38cg4POO14GnPZCfWSs_FA@mail.gmail.com>
References: <b8c9c1a8a05dbf0be8e8be98cfdeafa9cecd8cef.1690535002.git.geert+renesas@glider.be>
 <87pm4ctl9b.fsf@minerva.mail-host-address-is-not-set>
 <CAMuHMdXs47Jt9Kqf-Gm0eoFP8Wpe38cg4POO14GnPZCfWSs_FA@mail.gmail.com>
Date: Fri, 28 Jul 2023 11:59:58 +0200
Message-ID: <87h6potkyp.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Sui Jingfeng <suijingfeng@loongson.cn>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> Hi Javier,
>
> On Fri, Jul 28, 2023 at 11:53=E2=80=AFAM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>> Geert Uytterhoeven <geert+renesas@glider.be> writes:
>> > drm_crtc_force_disable_all() was renamed to
>> > drm_helper_force_disable_all(), but one reference was not updated.
>> >
>> > Fixes: c2d88e06bcb98540 ("drm: Move the legacy kms disable_all helper =
to crtc helpers")
>>
>> The dim tool complains that:
>>
>> -:10: WARNING:BAD_FIXES_TAG: Please use correct Fixes: style 'Fixes: <12=
 chars of sha1> ("<title line>")'
>>
>> So I've fixed it locally to only use the first 12 chars of the sha1.
>
> Good luck restoring them in the future (you do care about Y2038,
> do you? ;-)
>

Fair. I fixed it not only because checkpatch complained but also to make
it consistent with the rest of the Fixes: tag in the tree, in case that
people have automation in place having the assumption of the 12 chars...

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

