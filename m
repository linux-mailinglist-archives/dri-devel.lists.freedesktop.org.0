Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BF897140A
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 11:43:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3028910E359;
	Mon,  9 Sep 2024 09:43:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TnuY8dGc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29F6410E359
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 09:43:05 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-5c2561e8041so4523347a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Sep 2024 02:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725874983; x=1726479783; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ji0IvUtxVUfOYtXesPSGRkrVGhlLL5hSJeqIOnfvC5o=;
 b=TnuY8dGcPBNvLuZ1gCAPGHIs/rQ17vBWDq2Z4T4NiyCvLWduexCTJIwKmlZt/C0i0w
 4FrpILqA14obrZalFcxII0U/l+sXYGPPhl512qGa/jhgFQcP/GKOGCquLTiz1GLrcOi4
 S02dkClCi8J7LYMqEeN87dhm9lI0ivSgCESTqJAitgj0KJfs0AOiOz2CniZxZKso+Fca
 JJ1loRd5dlbViIXfvQRbTUeHZtUr6HshMlaRuX75XO3lWj2CVInAe1IkylYncjCGXkO3
 RDjzet8by2O+ModfRcVQTODWqLugXpz2AYQ+UuS4XutZyNDQyXJukkWCyz3zqxZXlnDq
 adDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725874983; x=1726479783;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ji0IvUtxVUfOYtXesPSGRkrVGhlLL5hSJeqIOnfvC5o=;
 b=GOvsPCflaMvWe7q6KTtaVE9JsSSYo9/hY24lxsnVLz1/HsEt4CMzz9V2QgAVWd9Tgl
 +tlgZyWXT2WRXMPnil78VweXddsNUyZVg6sUAM4t8kwcHV9OAff54hkQ5p07U/5SqZep
 oi4Gk6NBlacjlhBRHTLZw+0YGRnKEl+tBJJiiMaJ/Tx/wBcZQ7UeAjSEL6aCk9T+rvbt
 fk2GdBoVtCed0N3KTB/6mcZZTju5LFz8B9sfWUW/WTtgpag0JcTmvl2GtFr+1ksfW7Up
 tsaiklHD0cBT3pPDkiY9glQRuUIx6ilhOUoRbKLAX4svhvM8sDdoFbB3ljgNQosVhKI2
 +SxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsv/NbocUaNfjeKc31FhEsD5ykCjnstLniGylz9aKGy6OKbRtnD78DejsXsey/t1GvHMXSFhtSDNg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxoegBI4IvsR9fby2ZyJkWIeUuaDzfoN5UtSx+Ik7+rYNDZqBdV
 0KeBlvHydutkNGh1GyO8pkPpzi7aZXAyLiqLZ8Xu2Xk9Eep2cMgDGU3uLDOA
X-Google-Smtp-Source: AGHT+IHsut9MezX+RTKRlovYO1s+sRZbsf5akjJcSm8/w0bQW6T6B9e2Pa66ERuitPaxaEK8jwSRAA==
X-Received: by 2002:a05:6402:34d6:b0:5c3:1089:ff3c with SMTP id
 4fb4d7f45d1cf-5c3e974d9f6mr3460080a12.35.1725874983126; 
 Mon, 09 Sep 2024 02:43:03 -0700 (PDT)
Received: from toolbox (31-10-206-125.static.upc.ch. [31.10.206.125])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd4693fsm2812530a12.37.2024.09.09.02.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 02:43:02 -0700 (PDT)
Date: Mon, 9 Sep 2024 11:43:00 +0200
From: Max Krummenacher <max.oss.09@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
 Aradhya Bhatia <a-bhatia1@ti.com>, max.krummenacher@toradex.com,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Devicetree List <devicetree@vger.kernel.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@siemens.com>,
 Randolph Sapp <rs@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Jayesh Choudhary <j-choudhary@ti.com>, Jai Luthra <j-luthra@ti.com>
Subject: Re: [PATCH v3 0/4] drm/tidss: Add OLDI bridge support
Message-ID: <Zt7DJFM_xxOkhDwX@toolbox>
References: <20240716084248.1393666-1-a-bhatia1@ti.com>
 <20240906114311.GA32916@francesco-nb>
 <c60d518b-ace4-48a8-87e5-35de13bc426a@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c60d518b-ace4-48a8-87e5-35de13bc426a@ideasonboard.com>
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

On Mon, Sep 09, 2024 at 11:15:28AM +0300, Tomi Valkeinen wrote:
> Hi,
> 
> On 06/09/2024 14:43, Francesco Dolcini wrote:
> > +Max
> > 
> > Hello Aradhya,
> > 
> > On Tue, Jul 16, 2024 at 02:12:44PM +0530, Aradhya Bhatia wrote:
> > > The addition of the 2nd OLDI TX (and a 2nd DSS in AM62Px) creates a need
> > > for some major changes for a full feature experience.
> > > 
> > > 1. The OF graph needs to be updated to accurately show the data flow.
> > > 2. The tidss and OLDI drivers now need to support the dual-link and the
> > >     cloned single-link OLDI video signals.
> > > 3. The drivers also need to support the case where 2 OLDI TXes are
> > >     connected to 2 different VPs - thereby creating 2 independent streams
> > >     of single-link OLDI outputs.
> > 
> > Have you considered/tested the use case in which only single link is used?
> > You do not mention it here and to me this is a relevant use case.
> > 
> > There is a workaround for this (use option 2, cloned, even if nothing is
> > connected to the second link), but this seems not correct.
> > 
> > We (Max in Cc here) noticed that this specific use case is broken on
> > your downstream v6.6 TI branch.
> 
> What if you set "fw_devlink=off" kernel boot parameter?

Hi Tomi

My overlay specifing a single link which did not work by default
results in a working panel with "fw_devlink=off" on the cmdline.

Max
> 
>  Tomi
> 
