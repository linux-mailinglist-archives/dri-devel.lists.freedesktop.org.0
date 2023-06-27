Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A3173FA0C
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 12:20:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A1DC10E2D9;
	Tue, 27 Jun 2023 10:20:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C842810E2D9
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 10:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687861197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kIm9KSfT2c9bUO4vFJpcyhRBsP5P/LetqNHh8oI9wPE=;
 b=FveHwtTfwngFhy2HdqSwXENzfGMAPAYwN3g2Bp+raq0Mly1jiu1DoRSiY7TzylgKkEyw3b
 RMy5+FiZr+Jl5PrHzJOfOKziOQDXBRjleAHkKpdrk76+lVtZ05kF49yyOrLkTg3jyAn1dw
 ZEO/naQeIJ3C2O63KV14jVVYFp/UC90=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-255-6Q7BWv33MqWLyR7zkhwWQg-1; Tue, 27 Jun 2023 06:19:56 -0400
X-MC-Unique: 6Q7BWv33MqWLyR7zkhwWQg-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3fa871e1eaaso50996185e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 03:19:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687861195; x=1690453195;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kIm9KSfT2c9bUO4vFJpcyhRBsP5P/LetqNHh8oI9wPE=;
 b=JLMHSTIpvJ3fhwaDnQXsWMHVAio2Z2ebWdycZZjETHmmkUIEUGKOYVEc3gM8Lmy6VM
 BNIL05GkhXw1Ik/5ouXrY9gaNEaPS6djR/pt/LKJKhatC1DtZ2yxSGcpDSXmhOjuO2hv
 I5AqnsPqN3ZRgdqrhATpslfpaaME1l6VxsuYgPiPZMkvv3sYV6h+28g6G32HEJUpd7i7
 y8stZaFhYb72PndLNl76VZJdJ+qLI3ysZMukb/ChJMIMsLwfvF8iCMUZhXI44nLXEecI
 mzTrFBZwFHQcHOvm0enCcWHA6pX+EvfD26SB3lDiTcYLTvLgS1xxBvHrQxqfn1SXOnOV
 hDjg==
X-Gm-Message-State: AC+VfDxa0nY7OA3Xil0nuJH8+4A0lEn+lOhGtsC+s7PFrZILkBilp1VQ
 RrQur35GeNtHiA07qY779EYpfM6WFkUzdn8H70ZHS/xcAV/ED1sG/VRLgRAQps6/Oveua8sbVRe
 LjV0d8VIbuwRP6WyxlikJbkZx3nt/
X-Received: by 2002:a05:600c:28e:b0:3fa:8aed:d57f with SMTP id
 14-20020a05600c028e00b003fa8aedd57fmr7974613wmk.24.1687861195659; 
 Tue, 27 Jun 2023 03:19:55 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ58/DNWnDdVcu3sgbewfyw2IUjnXnDptKaKvSC16q+kzJIeHlExoAsEQNCoYpMcn3PfF7NIxw==
X-Received: by 2002:a05:600c:28e:b0:3fa:8aed:d57f with SMTP id
 14-20020a05600c028e00b003fa8aedd57fmr7974604wmk.24.1687861195361; 
 Tue, 27 Jun 2023 03:19:55 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 z12-20020a05600c114c00b003f8d0308616sm10295539wmz.32.2023.06.27.03.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jun 2023 03:19:54 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 8/8] drm: Introduce
 DRM_CLIENT_CAP_VIRTUALIZED_CURSOR_PLANE
In-Reply-To: <20230627035839.496399-9-zack@kde.org>
References: <20230627035839.496399-1-zack@kde.org>
 <20230627035839.496399-9-zack@kde.org>
Date: Tue, 27 Jun 2023 12:19:53 +0200
Message-ID: <87ilb92omu.fsf@minerva.mail-host-address-is-not-set>
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
Cc: David Airlie <airlied@linux.ie>, banackm@vmware.com, krastevm@vmware.com,
 ppaalanen@gmail.com, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, iforbes@vmware.com,
 mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Zack Rusin <zack@kde.org> writes:

> From: Zack Rusin <zackr@vmware.com>
>
> Virtualized drivers place additional restrictions on the cursor plane
> which breaks the contract of universal planes. To allow atomic
> modesettings with virtualized drivers the clients need to advertise
> that they're capable of dealing with those extra restrictions.
>
> To do that introduce DRM_CLIENT_CAP_VIRTUALIZED_CURSOR_PLANE which

I agree with Pekka that DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT is a better
name for this capability. I don't have a strong opinion though so I am
also OK with the chosen name.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

