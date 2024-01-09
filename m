Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7F7828642
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 13:50:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19C5110E12C;
	Tue,  9 Jan 2024 12:50:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C93A910E12C
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 12:50:16 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a28f12a12e5so84883166b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jan 2024 04:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1704804615; x=1705409415; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z4HBT3vRdZsJHEbNKDeJKOCZfga8hHDywItcZI2H538=;
 b=Vjvp0xPD65EUJrCMcVZANyFMjpPWLm//XdGLlnFi/KQTf1j/LSVtuIYJcZIlFasvUY
 bzOgx83EOsfVhuCwNl0F5t3BtJmja900xqzWKV+oCS/2qKiQSyZ0e4f6JZkFJcUi/Bd7
 0Qean6iYPwYQAZpMgAb8agTIyb+cZH59E+F4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704804615; x=1705409415;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z4HBT3vRdZsJHEbNKDeJKOCZfga8hHDywItcZI2H538=;
 b=FQMBZXKaAFBGCytlFv8BNpDn5YFKjicEWqaEw+Cc8tFt8OOG2PXsbncOP0Eu+tLk3j
 BLJ8adOMakTqAr6it3HKSO46vA7MGtvaDFXutLD5f7FPxfEmuIRZgOd81U+SCorWEiYQ
 QPPeTbx8EE0Hsm8u51JGdkmFiZtGofhY8JTQbelG4Q+b+hO5iqIbWOhDO6xNd4m0J8tO
 RLLvpWzFQU1dHFoBOl3rC8k7KbJ9AiYr/ZohWSR/hbwjpgMMjjWtntSIcSyWxOhKTMvk
 x+2vDiW9iMZNTLXMf6KbpmmlFlZqJNIwRf7vJFMbJSjaTm0PbK0xAjDV8HmsZCITiFqg
 e1dA==
X-Gm-Message-State: AOJu0YxawdU/MxZ7QAcyc77/MrbQuUcy5/xznOOOPOclPyIYa843Zeho
 T6Bu9VwjUOG7kKZkl5vbGGNptl0jbxLh3A==
X-Google-Smtp-Source: AGHT+IEQLrFaUVEDnyO4kIJDI57CEii1UOqvOGAkct9whu6SzjHDG/l2Sd70k1spg79Oo5wAqtVJfA==
X-Received: by 2002:a17:907:2d09:b0:a27:4531:719f with SMTP id
 gs9-20020a1709072d0900b00a274531719fmr6140566ejc.2.1704804614942; 
 Tue, 09 Jan 2024 04:50:14 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 se12-20020a170906ce4c00b00a1d5c52d628sm1010517ejb.3.2024.01.09.04.50.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 04:50:14 -0800 (PST)
Date: Tue, 9 Jan 2024 13:50:12 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Michael Walle <mwalle@kernel.org>
Subject: Re: [PATCH] drm: bridge: samsung-dsim: Don't use FORCE_STOP_STATE
Message-ID: <ZZ1BBO2nNSp3g-gT@phenom.ffwll.local>
Mail-Followup-To: Michael Walle <mwalle@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 David Airlie <airlied@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Robert Foss <rfoss@kernel.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Tim Harvey <tharvey@gateworks.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 linux-kernel@vger.kernel.org,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Inki Dae <daeinki@gmail.com>
References: <20231113164344.1612602-1-mwalle@kernel.org>
 <631fe35a2a3b00781231e4f3f5094fae@kernel.org>
 <1ef3dad2-5f55-40e5-bba7-3c71d71c12e4@kontron.de>
 <CAAQKjZMccDwa63_PNJCP0rNOaHjTwcOz8AbKa=JXLQi-b0QVVw@mail.gmail.com>
 <2400535875c353ff7208be2d86d4556f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2400535875c353ff7208be2d86d4556f@kernel.org>
X-Operating-System: Linux phenom 6.5.0-4-amd64 
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
Cc: DRI mailing list <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Tim Harvey <tharvey@gateworks.com>, linux-kernel@vger.kernel.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Inki Dae <daeinki@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 09, 2024 at 09:47:20AM +0100, Michael Walle wrote:
> Hi,
> 
> > > Inki, are you picking this up? Or if not, who will?
> > 
> > I can pick it up but it would be better to go to the drm-misc tree. If
> > nobody cares about it then I will pick it up. :)
> > 
> > acked-by : Inki Dae <inki.dae@samsung.com>
> 
> Who is going to pick this up? Who has access to the drm-misc tree?

Inki has, so I'm assuming since he acked he'll also merge.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
