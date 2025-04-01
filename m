Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88191A77E7E
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 17:05:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E74EC10E5D4;
	Tue,  1 Apr 2025 15:05:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eZ6zDwIa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A416A10E108;
 Tue,  1 Apr 2025 15:05:02 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-ac6e8cf9132so1001733366b.2; 
 Tue, 01 Apr 2025 08:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743519901; x=1744124701; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=THUVSVFJjh31HHA8u040m0ZL9VYtpo2fLTgN8aK+Thc=;
 b=eZ6zDwIawD1+k77PrfbNzPZLGofORlaRkTpH0+w+ChZtZSzRrbLXCYmbfofNbVsuO7
 wXsBXrZGfZQDVi2EwfgJdmpZ6UA+rUL6VJkQLylz3/WlNuc++G7moRWirdEe8IWDswgr
 bC7pmyYy2ZDn2yknO0KJP1Kgqg5s60voJdnfncIZaeMcATjRANXYN17jgSt+EUX8OFpw
 dVrEDQh9WiuHmafc+qsf8Vbzj9AoM1g5j1SB0aTMD8A7WgBJBDabDbFMdgO8HergXQEm
 pyhMATZBSaLzcurx/LP969HF2lJjYd5gNRl42Tv7/Gz0LcxPyslsajDvKEUY12drj8Ti
 wFGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743519901; x=1744124701;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=THUVSVFJjh31HHA8u040m0ZL9VYtpo2fLTgN8aK+Thc=;
 b=nHrDRpBVxo1R6D5IAGpArU9clY67ZJnZq7yagmak24Z6l/seCb1iz8alPx4glZ/vlI
 Rdw19C06S8zptsejlQnQID5Ct0MbrCSPRlz33XlVLdLRKEAIoH8pC/UGJhnLCS5TKxzD
 TJmwGo3dLPne63PWPpCSz9vR45UpGhPoHI9p9KTlURPKKTWNaVr/Hsiq6+t/ROEzd0Gw
 6a+F1tVr7mE0KT7wnxOYqx2CnTV3MVAdLNdHbO1x2kokeBsuoBJVWEAIyhtq38WDyLcC
 bPVphWNMdaAcnqVSh0tnhIKVvCHl5qR5knz6LC4yGXGDhc81eTj5gkkFHh0ntEiF8suT
 /IJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYiV8anKlklMFlRq4+iGp3a2xaxiKoK7/kC+4FUnM3TFUdGRLFK+co8haI8J5t0yDpo9Vbq93J6bHR@lists.freedesktop.org,
 AJvYcCW+u6WPoS4zB2iGh5gei4B4p+UKkrGy9e8ORGAR776kk4O/lGqFMCG90eAeBS4nqBhFvpL63MjY@lists.freedesktop.org,
 AJvYcCWk0LkcuarWyVLDnc81gLg/12iuaCVTyLD39xIoluYiN/ith7rAaluYI0GWLUQ7+WQOOV3JlCnRwGIEfe9DIA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0lUBFYqapy1GsFBBi+5khjkZ6MqcAjSbpXO/ADgxMvYtdTKhb
 zSW7cL1lQ5LkshhzyHesO6KXhk2cx513hIB8KqTohOySQhAOl0WSHgEam0D6Gsd6CrpaP9CCUO+
 lX7uWGCm/UVyCTzEIaudqGx8iwsE=
X-Gm-Gg: ASbGncsZ+xFEtcKBPuwdhfONlA55zeuZ1WVJH5+gkqtVFYLJKlDeZtI+esHGai6GNwJ
 I0zUj2VGrrQGXzzRncKKr0U3V8SSueEsKF1LNNvJBpburO8Dvhj/3sw0AwCsblQEoZARyDbIoBV
 PzrfpqdGKzMc2AQLRamN1JeqXNrWK9vTutPl9us0ljslaCe8GFT/Vw80ChLZ7j
X-Google-Smtp-Source: AGHT+IHKspXw0CRlgJHRgPMR2Vf2kx3yDHvd1fTjWCMFX+Z/CXBoy4+bqoqpf5ZMw1+JBmCTNbeBmTZ5ul/fV9sgB9M=
X-Received: by 2002:a17:907:9710:b0:ac7:3911:35e9 with SMTP id
 a640c23a62f3a-ac782eeb4ffmr329616666b.61.1743519900684; Tue, 01 Apr 2025
 08:05:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-25-alex.hung@amd.com>
 <TYCPR01MB8437BA1D5FFC25AE63F731D198A22@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <0add5ab1-0717-42a8-8994-a381b635040b@amd.com>
 <TYCPR01MB8437ADBCD38143B223E9384A98AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <9984f8e4-3f24-49d0-a7be-4f746dfbb4cc@amd.com>
 <TYCPR01MB8437D229F3DFFA7CA6CA02D198AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <a6489110-4e76-4977-a0d5-586e3b99ab0e@amd.com>
 <TYCPR01MB843722301025CE5047BCFA2898AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <e6bac4d3-d445-48d6-8121-39895a09ccff@amd.com>
 <TYCPR01MB84372C5EFC66F7CC9259FBBE98AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <TYCPR01MB843757F4E7BFF224712BD68F98AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <5eac0bab-60c2-4e94-9ab2-bad5f451c8c9@amd.com>
 <CAFZQkGyOvLyqVBRr5_mhApeEx2emoJ8KRp2_GDuF2rL-4zZ2bA@mail.gmail.com>
 <4198d3db-aa31-49c1-a8c0-ed8f40b7855d@amd.com>
In-Reply-To: <4198d3db-aa31-49c1-a8c0-ed8f40b7855d@amd.com>
From: Xaver Hugl <xaver.hugl@gmail.com>
Date: Tue, 1 Apr 2025 17:04:49 +0200
X-Gm-Features: AQ5f1Jqkruqp5MQzwLGiGwLHmZhYj8iSwAxvsJEM3bWsv0uXjBnsFN7baHt96cU
Message-ID: <CAFZQkGzDRz8jW3q-RfMeMbWF=N=AbaxNcmYr5vxdmFGiKCXyEA@mail.gmail.com>
Subject: Re: [PATCH V8 24/43] drm/amd/display: Skip color pipeline
 initialization for cursor plane
To: Alex Hung <alex.hung@amd.com>
Cc: Shengyu Qu <wiagn233@outlook.com>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org, 
 harry.wentland@amd.com, leo.liu@amd.com, ville.syrjala@linux.intel.com, 
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com, 
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com, 
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org, 
 victoria@system76.com, daniel@ffwll.ch, uma.shankar@intel.com, 
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, 
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com, 
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com
Content-Type: text/plain; charset="UTF-8"
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

Am Di., 1. Apr. 2025 um 02:29 Uhr schrieb Alex Hung <alex.hung@amd.com>:
>
>
>
> On 3/31/25 12:53, Xaver Hugl wrote:
> >> Cursor plane has no color pipeline and thus it has no colorop either. It
> >> inherits color processing from its parent plane.
> >
> > Just to be sure: That means amdgpu will reject atomic commits that try
> > to set a color pipeline on the primary plane while showing the cursor
> > plane on top of it? Just like with scaling?
>
>
> In theory that should be the case, and I will investigate and confirm
> it. Is this a beavhiour expected by a compositor?

It's not just an expectation, the API requires it. If you were to
apply a color pipeline to a plane that doesn't have any, or not apply
one that is set, then that would be incredibly broken. Commits where
that would happen must never ever pass atomic tests.
