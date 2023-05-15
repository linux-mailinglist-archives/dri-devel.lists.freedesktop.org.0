Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE659702C51
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 14:09:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B17510E056;
	Mon, 15 May 2023 12:09:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE15C10E1B7
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 12:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684152545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1OPYbFK1MaRB/Vx7gvgvUiirswNhs1Gc4aAk6bBszZU=;
 b=DY+biKCdzC3bZPaovA2/TToS1moklnugj18biaCaZVqZO1tn4YWpBhsq2q8xS2sapSmh+f
 VvWAhNPlmDv2g2cciXY0bovZlOkB0GTCgqxlmsDSvnicIkvlFRvrmdC5pa8jUDTbbIr93f
 reawKECdCULlm8psRkSbyqpEisX5br8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-bvyBE3ADNWODjICz_s27-Q-1; Mon, 15 May 2023 08:09:04 -0400
X-MC-Unique: bvyBE3ADNWODjICz_s27-Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f507596d9eso7237635e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 05:09:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684152543; x=1686744543;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1OPYbFK1MaRB/Vx7gvgvUiirswNhs1Gc4aAk6bBszZU=;
 b=kr2xZ2IJC+oEZhit8nbfbl4rdxhFdPfdpTVHVVCCb8H64spu9AW4NzXjlhzaT/w11G
 0VP+mUhD8BXJYKX788AztbrXU4jHjJPn3nXPIuRWgy2dU1BahHEBsINd7kV4wbgHfCir
 19EgnaxnM0g5xGtNZDOu2burqVYKecAC6pb5N7BxGm8unPg9WZ8xFN4SFknNmSadZZfG
 76eF38+1bn9rAd6BCHYaQPDIm2hkD4UC/GXmQvd9at+WTfRxkcHXYPbn7mn8IrXYGFH3
 AIzhXK4Sfpt6/gsRA6GuxGVq1dIQLsalAWPHpkcaHgK4u3Pxmqz8Wdv8JXfFdLqcwTVm
 PaUw==
X-Gm-Message-State: AC+VfDzvNJhLbsStwEmvs6ztrQAe+nfaUarxgmDgRNwEAGSgJTLDlsy2
 pOSCLW9Bqkx+fXyWFXuqsPTSR7fcAfunOxi7dP3L3HBUPzH2vBXciyqHMEFNnCv/vCtXAiEWx5E
 mJCg/mfQ/eu25AHjr2f70JzA876CU
X-Received: by 2002:a05:600c:cf:b0:3f4:9bee:b9c with SMTP id
 u15-20020a05600c00cf00b003f49bee0b9cmr13827117wmm.18.1684152543294; 
 Mon, 15 May 2023 05:09:03 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6cA1R4HrXV4puy/LOr07navRMi/rmZmaiDm/8VhAVfXpABZay9tsPMWtZHk7Tz8iknQ9yAiA==
X-Received: by 2002:a05:600c:cf:b0:3f4:9bee:b9c with SMTP id
 u15-20020a05600c00cf00b003f49bee0b9cmr13827106wmm.18.1684152543010; 
 Mon, 15 May 2023 05:09:03 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 z8-20020adfec88000000b003062675d4c9sm32285269wrn.39.2023.05.15.05.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 05:09:02 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Sui Jingfeng <15330273260@189.cn>, linux-kernel@vger.kernel.org
Subject: Re: drm/ssd130x: Fix include guard name
In-Reply-To: <ab3a2467-2236-604f-b4aa-862a7ac838e9@189.cn>
References: <20230512120232.304603-1-javierm@redhat.com>
 <ab3a2467-2236-604f-b4aa-862a7ac838e9@189.cn>
Date: Mon, 15 May 2023 14:09:02 +0200
Message-ID: <87jzx9aja9.fsf@minerva.mail-host-address-is-not-set>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sui Jingfeng <15330273260@189.cn> writes:

> Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>
>
>

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

