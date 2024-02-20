Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0309285B71E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 10:19:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E99C010E280;
	Tue, 20 Feb 2024 09:19:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GZMkmLF+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E15110E280
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 09:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708420769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QSKI5DJWNWiQUQy8PSHe+VdPXu7WJOu5tx0cx/gLfpc=;
 b=GZMkmLF+XXP/JcDRw4m4XKQPkvbOVzQ6RrgRA6dcuVOd6XjUPdy1vEwk4ZoYnZMmwZTn6H
 ydnlnWO62acFeMYwsxC79soUC6wJYD914K+FUigWxA0ZPxfe66mUSlbyoFTxfmxFWjFWQV
 sGi+Rn3ITUje0yNWgnWaTsgIRdHp620=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-3Eio3hchNcm-BK6ic3ECrg-1; Tue, 20 Feb 2024 04:19:28 -0500
X-MC-Unique: 3Eio3hchNcm-BK6ic3ECrg-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-33d10bd57d7so1619078f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 01:19:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708420767; x=1709025567;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QSKI5DJWNWiQUQy8PSHe+VdPXu7WJOu5tx0cx/gLfpc=;
 b=cAL8yhv4xI+C987/XWjLiN5EpQP7X8kO3lkFjCt/piEJWvdRpraHXnHhNfgqVi7yfJ
 4SseQzIxbI+GG0tUInnJdcCQTNruwnBF9Pfg7WgHVvUBUbhtZZofyDHHIxp5skCVYjSq
 PlfNNBKIeU2y2dQPsUoeJHAe+dYP47bOmaQv/kGoNi7rqkoLdhdhrKKtLMW0xQ3J4od0
 89D1Fr+kc1A+HsuShLD/0LuT80KOIfR+L1uX82oibZaTav/t1fDAfkgX5nx+GH8hYPPL
 SlmdSxHHvaOyzOGMXMh0zDCllaLYomuJPtpPYrcA2/MMyPXBzjmbdCsRlvnotg8b4fPD
 RGOA==
X-Gm-Message-State: AOJu0YxeLCF2NLSa63Bunq6B1QJAkWUiRSHzXaisPCFO41bYylFy/qhH
 d8goXdMvBKqPonc9rMrLpU+itfZ+6IWAJCL1GE2+s83POVzUW9ap+2eXqDCt6vN5m4pk1KxcPDq
 Xb7rS0UYtgkfm4s0lRGVCHxq+KupVSq/Xx0FpLZID3SFNNxrQQf+2L5fliGC3mjgefA==
X-Received: by 2002:a5d:6786:0:b0:33d:211a:7916 with SMTP id
 v6-20020a5d6786000000b0033d211a7916mr5926220wru.44.1708420766986; 
 Tue, 20 Feb 2024 01:19:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGTe50tTS4pbmxQYTMjD2j/YAzqOczhi1muOVjjeiUkN0RVGhBVXraWyeGB4LGC9gqQftjerg==
X-Received: by 2002:a5d:6786:0:b0:33d:211a:7916 with SMTP id
 v6-20020a5d6786000000b0033d211a7916mr5926210wru.44.1708420766657; 
 Tue, 20 Feb 2024 01:19:26 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 ay3-20020a5d6f03000000b0033d1b760125sm13186512wrb.92.2024.02.20.01.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 01:19:26 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, deller@gmx.de
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-input@vger.kernel.org, linux-pwm@vger.kernel.org, Thomas Zimmermann
 <tzimmermann@suse.de>, Bruno =?utf-8?Q?Pr=C3=A9mont?=
 <bonbons@linux-vserver.org>
Subject: Re: [PATCH 03/10] hid/hid-picolcd: Fix initialization order
In-Reply-To: <20240212162645.5661-4-tzimmermann@suse.de>
References: <20240212162645.5661-1-tzimmermann@suse.de>
 <20240212162645.5661-4-tzimmermann@suse.de>
Date: Tue, 20 Feb 2024 10:19:25 +0100
Message-ID: <875xyjjxwi.fsf@minerva.mail-host-address-is-not-set>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> For drivers that support backlight, LCD and fbdev devices, fbdev has
> to be initialized last. See documentation for struct fbinfo.bl_dev.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: "Bruno Pr=C3=A9mont" <bonbons@linux-vserver.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

