Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D7B8A6B29
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 14:36:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5605112C3C;
	Tue, 16 Apr 2024 12:36:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NmcVaX9i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FA00112C3C
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 12:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1713271006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fzdzmaQpsP6qFq57RDebOQTXPO8ko95PIygsDfOUjtE=;
 b=NmcVaX9iElXZCR+/SyHYz2SO7KfLVhCXzSyYJRkBwfDUbdBBhDmMI2C/tHaA4yG7R6mJMX
 563ZmHRCgzcVFZ0tzM5Zd7+And4rGfLWxwhGhVJxfYAHhVMWPo8/nPt/eBEK/9guca4LWw
 5BSnzxO0PejsQ1S3+/hddVo36gTKG5k=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-0cR3URPSPVqeNszWNzE8Kg-1; Tue, 16 Apr 2024 08:36:45 -0400
X-MC-Unique: 0cR3URPSPVqeNszWNzE8Kg-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4183d08093bso10778715e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 05:36:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713271004; x=1713875804;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fzdzmaQpsP6qFq57RDebOQTXPO8ko95PIygsDfOUjtE=;
 b=NU3XaTQ/ZmE51vBiRoC9GNcN1oxW3UqpD0dTaqwn+kRhBXL0a/MX2FwvCnswM1+Eeg
 z7wVEkIYuPtmd+UkWHoiNp4+ty8doXW3McVshqRbAFwfAfOXxeiKVuaWSGL17hqt/5Sr
 l+GoPtlYTBLkXe4DAJJNfZnlgEnlXTDBAdpzH2hSDJ8lk5GPFd00gF9KmkpSmUXAJYrO
 V8rCNmovP9gEkJUyCYkenBLynpOnAkaphHFrzL9YGf3oCTE179jzsYDeTLa9fuFA3Qjc
 5EfCfsg6529nFhtHIfnk1CGuPkiQZzId2+Ko9/CrUfA7EwgazLBc6KhanRYukSDgIzk9
 0MOw==
X-Gm-Message-State: AOJu0Yz/AwIWO0rGgh4IVEaGtFVhtgcOCetoJlmn538ISBWrwjEwztfO
 pRFp97LsiDSm99UO18tthQegQoDvM6TYLtfPh+dMZF7kaRFUOr+MNZXpMgDe5e8x5XzX53DMVSq
 SvCZG3rKdIm400qwK7E7SiIYbNZkgH+MHSnJwK3EiAeBCrwR1T6ON8N6MDAe1WwZp74/Fb8Zj6w
 ==
X-Received: by 2002:a05:600c:35ca:b0:416:8091:a39e with SMTP id
 r10-20020a05600c35ca00b004168091a39emr10783138wmq.10.1713271003735; 
 Tue, 16 Apr 2024 05:36:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaadVrQyFNMHCnMTbyWE2LjjeIhfUT4D+QboertmyRjaD6xw/Yym7WIMwNnFYiLJ2zSjeUyw==
X-Received: by 2002:a05:600c:35ca:b0:416:8091:a39e with SMTP id
 r10-20020a05600c35ca00b004168091a39emr10783127wmq.10.1713271003372; 
 Tue, 16 Apr 2024 05:36:43 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 dl5-20020a0560000b8500b00345fb949c28sm14748889wrb.100.2024.04.16.05.36.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 05:36:43 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
 airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, Thomas
 Zimmermann <tzimmermann@suse.de>, Sandy Huang <hjc@rock-chips.com>, Heiko
 =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan
 <andy.yan@rock-chips.com>
Subject: Re: [PATCH v2 31/43] drm/rockchip: Use fbdev-dma
In-Reply-To: <20240410130557.31572-32-tzimmermann@suse.de>
References: <20240410130557.31572-1-tzimmermann@suse.de>
 <20240410130557.31572-32-tzimmermann@suse.de>
Date: Tue, 16 Apr 2024 14:36:41 +0200
Message-ID: <87jzkx5vs6.fsf@minerva.mail-host-address-is-not-set>
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

> Implement fbdev emulation with fbdev-dma. Fbdev-dma now supports
> damage handling, which is required by rockchip. Avoids the overhead of
> fbdev-generic's additional shadow buffering. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Sandy Huang <hjc@rock-chips.com>
> Cc: "Heiko St=C3=BCbner" <heiko@sntech.de>
> Cc: Andy Yan <andy.yan@rock-chips.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

