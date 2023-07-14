Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F14753417
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 09:52:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 210AE10E812;
	Fri, 14 Jul 2023 07:52:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D10210E80D
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 07:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689321143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WC74EEKhJlhJoUZcemPJUMicIDs5RJVsAsHWl0ODu1o=;
 b=UaqtSABKdJjmu4EU1hxTfNZY5Jfnw1pFXtyZow/3q3Fr5F/VQ+bM6V26sECgu7CwgkmHKq
 r9jDnOnTVbBz5ltPiMcokS0C+65/0lIdr8lk1UWHjLJ4etgdMVILMduektFuuKtedBgKXF
 oXnl3dLVeWwzNuJ89AXiVvtGo5pxfng=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-465-TvtrfsAjN16RoNhKKsZ6Fg-1; Fri, 14 Jul 2023 03:52:22 -0400
X-MC-Unique: TvtrfsAjN16RoNhKKsZ6Fg-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3fbb0c01e71so8901345e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 00:52:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689321141; x=1691913141;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WC74EEKhJlhJoUZcemPJUMicIDs5RJVsAsHWl0ODu1o=;
 b=Jqd6j6oTzxIlWqiBmB2Jqp9mutcOFFpGdvy2mz3Bq+WHSMeednbr7wfADV19j3d8F1
 jyT/xN7umQrZ+RToOQjtv+mHwYyxhuuyX1p+3yT+lIvJspW9KcUUEQxLWYQr91U4aOiZ
 GOJy79cy/AWlsc0Rbn7vmNhQ/gd5mVGnndD5wRZgcFlhbjmATOjrfPtN3Wjf3B5Nb23M
 4SBOXuwncZ1va27j+nmloQoUBwS9Arm3YSVmprbHDXFj2hC87+hEW55m7hKjLLHmhuRR
 5QdOP81iPH3d9gGV+dqVhMtbIsjCHx0IefO9Xv5DonkqI484OErYemHTidEgmVatjaUT
 CBjQ==
X-Gm-Message-State: ABy/qLa6en/fgSG01/PQUC3rSUL6N9nCvroRxIHZFP6Hdnkj0U6rehwm
 bwg8+7+Tf+k/GIlllVPT6UZn0iNgOdi90Na9K1DFZOO5PRdCG2J12rzmZd/hgaqSj0DHK9gjrUh
 ClUbgFaejEVb1cltAHELcnycoore9
X-Received: by 2002:a7b:c04b:0:b0:3fa:97ad:2ba5 with SMTP id
 u11-20020a7bc04b000000b003fa97ad2ba5mr3249073wmc.31.1689321141245; 
 Fri, 14 Jul 2023 00:52:21 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEC1xgj6rDpPbnDj033RgOCZB0seoIVN0Wc0wMxtKEDxY5P9kWVI1zu27Jcd8L02JWvRUJPHA==
X-Received: by 2002:a7b:c04b:0:b0:3fa:97ad:2ba5 with SMTP id
 u11-20020a7bc04b000000b003fa97ad2ba5mr3249050wmc.31.1689321140927; 
 Fri, 14 Jul 2023 00:52:20 -0700 (PDT)
Received: from localhost ([90.167.94.6]) by smtp.gmail.com with ESMTPSA id
 c7-20020a5d4147000000b003141a3c4353sm10130634wrq.30.2023.07.14.00.52.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 00:52:20 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Aradhya Bhatia <a-bhatia1@ti.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v7 5/8] drm/bridge: sii902x: Support format negotiation
 hooks
In-Reply-To: <5bf5e4d1-546f-19fc-1647-7ece567d52f1@ti.com>
References: <20230606082142.23760-1-a-bhatia1@ti.com>
 <20230606082142.23760-6-a-bhatia1@ti.com>
 <20230710150822.GA5237@ravnborg.org>
 <5bf5e4d1-546f-19fc-1647-7ece567d52f1@ti.com>
Date: Fri, 14 Jul 2023 09:52:19 +0200
Message-ID: <87wmz3szf0.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Nishanth Menon <nm@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jayesh Choudhary <j-choudhary@ti.com>, Robert Foss <rfoss@kernel.org>,
 Tomi Valkeinen <tomba@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Vignesh Raghavendra <vigneshr@ti.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Swapnil Jakhade <sjakhade@cadence.com>, Devarsh Thakkar <devarsht@ti.com>,
 Rahul T R <r-ravikumar@ti.com>, Francesco Dolcini <francesco@dolcini.it>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Aradhya Bhatia <a-bhatia1@ti.com> writes:

Hello Aradhya,

> Hi Sam,
>

[...]

>> 
>> It would be even better to walk through other implementations of
>> get_input_bus_fmts and update them accordingly.
>> 
>> Again, sorry for being late here. Feel free to ignore if you already
>> moved on with something else.
>> 
>
> I am working on adding OLDI support for tidss, but if we can resolve the
> above concern, and Javier agrees, I will be happy to add an incremental
> fix for this! =)
>
>

Yes, an incremental patch on top of what has already been merged in
drm-misc-next works. Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

