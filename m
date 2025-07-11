Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71943B01BEA
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 14:26:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C541910EA38;
	Fri, 11 Jul 2025 12:26:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FR3A/Pj3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71A3410EA38
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 12:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752236759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PQbXhH6ygojwyyDSCBsRIbueQ839E94dhCGHLW3ALzg=;
 b=FR3A/Pj306f3KAjiC3OMwbJzPyQeFBAjYt19bGCQ6ftv4cOHZHCcmjRgqK10iSef8QJ4iq
 w/M6GiIwV7cDLZoYGIrMuxfhCSFOtX4PoSyfcJeCMYPjYERgPMryJKfoCK3B4Chvyzs2na
 m6U/s3bxVg5temeu9SsadsQxeyDG3XI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-397-2wDdcsMwNZ680x86Pcwmfw-1; Fri, 11 Jul 2025 08:25:58 -0400
X-MC-Unique: 2wDdcsMwNZ680x86Pcwmfw-1
X-Mimecast-MFC-AGG-ID: 2wDdcsMwNZ680x86Pcwmfw_1752236757
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3a6df0c67a6so1282777f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 05:25:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752236757; x=1752841557;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PQbXhH6ygojwyyDSCBsRIbueQ839E94dhCGHLW3ALzg=;
 b=M8qxerPCvSdgMcpcuribzs4si8XKReqsRPEV723mk9o0H68ebBnvg2tW4gzpTPmwwG
 4+1gB16ED/HtgcZeiyqWqNVs2SqvhLjkwsDIIJJsIa1BaYMoXCvBjerJmfXbxGt1crya
 aLqukhtL8b5tgY6z4Zr+CudlwCM4X2FomI25QLsmlIQ9/UbGfbkfm9/DVxObzdX5u8xH
 1RFERnMCg6gBJqHSz4h0NM6NGJup91HW3/OoDrO8GCchqLauRGGq4smA17SMCGPxeS+I
 ole7yDOlPuj5yP91/v76fL02TYzRiLj4K8Hr1lngO3h/LQZehk77uI+0+x9Ggb/usAnR
 sVZQ==
X-Gm-Message-State: AOJu0Yy/NoDW22+CAcbv3nezb3xEgzneyaMx8ciDqysTR4NBnjE2N8qj
 xa1B54lYW4L3UILzQN9pAs/UlpyhCAMcRYF9/kR4VmvM/EcZoC2dt5H+52xYn8tdzxKkT929RN7
 9gkxgiXW2bsiylAUBX8kzIiyPufwe5a32jExCIKLFYgh5qAb1aOgWicJKXoDX/Xki3cFj8w==
X-Gm-Gg: ASbGncvDwQ7gBQm3UYPD5boj5FWJyttD2bPT94N6ro3HZR/HVzWdUnUeqV71MBApdMU
 2GwAWszhuXnPN2sVWquts1FsY2VL17YcAAa52IKQj2MSColaTtzuDc60t2iI2HGjKrUZtL4Wjy/
 DRqxEXtLZ5/v0N3UqIgL+m5UWPEhDKgMdxFBoAkD/DTIgqClNrbuWFA522tVwOJV6PkssHmQTDq
 ccrx3vet0RGeCWAQOxfb0JDt8T5ANsatVusNVh2JhRRGlcs5QnckC0WBk5dZ9L9dCnng4BREW6J
 WLkMtNhY2yTFLKSXTnk+1TysAKkMsYOiz03ZUupKrF/2QT2C5Kaj3KGHtnx85V1hmr3cvS5LsPH
 m3Xf5ucIq1MXMecBE8fJ+rQ==
X-Received: by 2002:a05:6000:18aa:b0:3b5:dfcb:7b34 with SMTP id
 ffacd0b85a97d-3b5f2dbf40amr2410108f8f.17.1752236757081; 
 Fri, 11 Jul 2025 05:25:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBbgX+tp81yerdaJfryAf0meH96Mbu4XOhBvvib+05WRH+XcmG1MgG6zL+E9lmA/Clye2fCA==
X-Received: by 2002:a05:6000:18aa:b0:3b5:dfcb:7b34 with SMTP id
 ffacd0b85a97d-3b5f2dbf40amr2410089f8f.17.1752236756647; 
 Fri, 11 Jul 2025 05:25:56 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e0dbddsm4390459f8f.63.2025.07.11.05.25.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 05:25:56 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 7/9] drm/vesadrm: Rename vesadrm_set_gamma_lut() to
 vesadrm_set_color_lut()
In-Reply-To: <20250617143649.143967-8-tzimmermann@suse.de>
References: <20250617143649.143967-1-tzimmermann@suse.de>
 <20250617143649.143967-8-tzimmermann@suse.de>
Date: Fri, 11 Jul 2025 14:25:55 +0200
Message-ID: <87jz4eewx8.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mQivZv1c02nL4vxiQdoB1QOWmOUp1PLW1Q79AU0HD6M_1752236757
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Rename vesadrm's gamma helpers in preparation of the upcoming support
> for color palettes. Gamma correction and color palettes share the same
> hardware features, but the driver's old naming only indicated support
> for gamma LUTs.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

