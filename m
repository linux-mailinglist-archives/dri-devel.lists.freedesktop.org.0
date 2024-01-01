Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A28A58213AF
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jan 2024 13:10:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB5B810E0AC;
	Mon,  1 Jan 2024 12:09:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A1F710E0AC
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jan 2024 12:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704110995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Azch07lTg84aB2Rb6QjZFZSA7yP5wkRdozKvJbeWmDs=;
 b=BcVHR6JMFrGzVWgT5qSWrxvfgqyzsHSssOADI5IQ8p0InfRzs5nI+sz5r+jnMv7J7acXFv
 +nAafu9c8kpW7fBUymVUm1BrlJ+FqGwviffVBcxXjQAAnzOA1chuAMTDgLgBinJkC09X6P
 22X8vSKe96yvr9Smhl7N6IN3cIZeuM8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-64-7G_9IzmMPlKFFjbVWe7_iA-1; Mon, 01 Jan 2024 07:09:48 -0500
X-MC-Unique: 7G_9IzmMPlKFFjbVWe7_iA-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3367c893deeso6076237f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jan 2024 04:09:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704110987; x=1704715787;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Azch07lTg84aB2Rb6QjZFZSA7yP5wkRdozKvJbeWmDs=;
 b=aAs8Hxu4lR87ri1C8BFrRDkiABtO8msRSdIIsuUZ55eU/VEKT0L+gq6H3nIkIQLs7g
 eD1oVY/NPV3Fgo4gi4586LjEi3zmnMzD8TwlhRruEvP6E9amKGecU6Wd6NQnnCdh7TXP
 KuE19AjRm0SzPUUg8EkR8OtYT7Ggkf+KNPvMnLefd7c9MRhmN4S8HG3+N9MUx6I/Zauv
 vGe2M+DN4ofeLg50HjilXVLBLkTMK2S3YN4CJaBb6a/uUhlvx4u/o83Mi1s+SvZUzZcu
 1bojEEhSGSJiIBEA+3VUo+RpRMuymfb7RbeICWbxve2e3r6ojHrNYUdHZWif+s2RcGvN
 wPTQ==
X-Gm-Message-State: AOJu0YwrcvrOs3FJG5zfY6gyOjKFCSs8WS9BZzqQFqXIoCmX6Ixd4HVv
 nvQOCactzpokdjHkFtgCoJ/5Bk0DhAPO6wWChWLFk3eufFsxUwXBJyQwSOoL7S9JrBqvHCG2THp
 5uFZhY51YepPAKC7R7rr0fz8mG9o/WnsRLbv8
X-Received: by 2002:a5d:4491:0:b0:336:9ec:683 with SMTP id
 j17-20020a5d4491000000b0033609ec0683mr7965572wrq.24.1704110987782; 
 Mon, 01 Jan 2024 04:09:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGKWyLHJ5nrPlW/ehgVUQA9HtsiYksOgMjOeLi1VaymrGEKk3opJ5Q2oDMaXVlvjQ2jZaz94A==
X-Received: by 2002:a5d:4491:0:b0:336:9ec:683 with SMTP id
 j17-20020a5d4491000000b0033609ec0683mr7965565wrq.24.1704110987518; 
 Mon, 01 Jan 2024 04:09:47 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 p7-20020adfe607000000b00336843ae919sm25513643wrm.49.2024.01.01.04.09.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jan 2024 04:09:47 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/4] drm/solomon: Add support for the SSD133x
 controller family
In-Reply-To: <20231229112026.2797483-1-javierm@redhat.com>
References: <20231229112026.2797483-1-javierm@redhat.com>
Date: Mon, 01 Jan 2024 13:09:46 +0100
Message-ID: <87ttnx45md.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Conor Dooley <conor@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Javier Martinez Canillas <javierm@redhat.com> writes:

> Hello,
>
> This patch-set adds support for the family of SSD133x Solomon controllers,
> such as the SSD1331. These are used for RGB Dot Matrix OLED/PLED panels.
>
> This is a v5 that is basically the same than the previous v4 but dropping
> support for I2C since the ssd133x family does not support that interface.
>
> The patches were tested on a Waveshare SSD1331 display using glmark2-drm,
> fbcon, fbtests and the retroarch emulator. The binding schema were tested
> using the `make W=1 dt_binding_check` target.
>
> Patch #1 and #2 are fixes for the DT binding schema of the existing SSD130x
> and SSD132x families.
>
> Patch #3 adds a DT binding schema for the SSD133x controllers and patch #4
> extends the ssd130x DRM driver to support the SSD133x controller family.
>
> Best regards,
> Javier

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

