Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F788056D6
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 15:09:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50C6510E54C;
	Tue,  5 Dec 2023 14:09:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74F1C10E54C
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 14:09:43 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40c09f4814eso32580985e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 06:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701785382; x=1702390182; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OetAMAddY0Kvgc03SJD9zPupbx1ViU/NeH7cMTkTAv4=;
 b=xJZ85pi1KwS1YLb7uuV7GfsO454LR1dNP+N8em28xa+QfjBGqsrGrcqD9Javl6IolN
 jelE/EMZQIjqBe1eMt+qDZPH8wI4kcEeM3PUzL5ALXnK89OeQiQ8FSeH7xMad0ZMGQ88
 EtE0iSJLWxyMob7RCZkHkwxlkx7MnSKU8xNi3PP2EXQ3f8NzUfxZzhs7yn/Ucc4h2H31
 ZRDcJ8G9xhemHpCxKmoBlEU5P07Uhi86a0YwDsW6yQa8X0jQmiV82Wv6sIusQ/LbSWqT
 J8TrsG/lQG0l7TwpkTYM8AbEriC05RRYjKO37rCRj1aaQkMH0PHu2XA96qxhG1KEywLQ
 Injw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701785382; x=1702390182;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OetAMAddY0Kvgc03SJD9zPupbx1ViU/NeH7cMTkTAv4=;
 b=nqCaRyXHRIInE1EFRyCoJKwRMgGUQqI1zJ2QeoTlSwKxGsprXU9JlnIrjI+hIUGqGA
 KrDm3Qi6zUQAHMb2iljms07raKs5GGP7ffeR6ZHM/xcYWujSwIde8nbN2Un1To9GbMU6
 OMYrSVws2GWhazVgj0PzVN62flByQntQSFTZAx6u3/fCQBS5/2ndBSg2E9G9iDY7vhmX
 8VYKWLMAkv8A1bQY62CfVDySvcMdELyXOkNYPuscPnntmMkj2vGMPHKJ0J8icyKBfViW
 nMLNEi+0KRK84UsJ2K1TjILmoQJRLXBqkAC2zCc+HI7a0EDnzOBDGp7CxtI2wJL2C5UC
 7HHQ==
X-Gm-Message-State: AOJu0Yzc0USFniiwHTdVUIVQrojglFgh222TgO/Ff5/m9vAboFYbP7l4
 LVeT/q2gnLDrqcL3Wt+vjeQhIw==
X-Google-Smtp-Source: AGHT+IGjE7ABuNASpckDLdyxi0klki+3P/24IvfmCPYHlYSCTyShLyBe1GZt2tZF8GFux4EJenGyWA==
X-Received: by 2002:a05:600c:1c22:b0:40b:5e21:dd15 with SMTP id
 j34-20020a05600c1c2200b0040b5e21dd15mr569098wms.67.1701785381922; 
 Tue, 05 Dec 2023 06:09:41 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 t19-20020a05600c451300b0040a3f9862e3sm632489wmo.1.2023.12.05.06.09.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 06:09:41 -0800 (PST)
Date: Tue, 5 Dec 2023 17:09:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Robert Foss <rfoss@kernel.org>
Subject: Re: [PATCH] drm/bridge: nxp-ptn3460: fix i2c_master_send() error
 checking
Message-ID: <dfb64765-4b3b-4ef6-ad98-596f0d64f0ba@suswa.mountain>
References: <0cdc2dce-ca89-451a-9774-1482ab2f4762@moroto.mountain>
 <170178410677.683894.16036596185582079991.b4-ty@kernel.org>
 <a10a75c7-0626-454f-a3c4-d6031713f26f@suswa.mountain>
 <CAN6tsi6c7ncaiRAiAvrs_GoUMB8v9ciaMvu7s7hnPA0KN0xkWg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAN6tsi6c7ncaiRAiAvrs_GoUMB8v9ciaMvu7s7hnPA0KN0xkWg@mail.gmail.com>
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 05, 2023 at 03:04:49PM +0100, Robert Foss wrote:
> On Tue, Dec 5, 2023, 15:01 Dan Carpenter <dan.carpenter@linaro.org> wrote:
> 
> > On Tue, Dec 05, 2023 at 02:48:26PM +0100, Robert Foss wrote:
> > > On Mon, 4 Dec 2023 15:29:00 +0300, Dan Carpenter wrote:
> > > > The i2c_master_send/recv() functions return negative error codes or the
> > > > number of bytes that were able to be sent/received.  This code has
> > > > two problems.  1)  Instead of checking if all the bytes were sent or
> > > > received, it checks that at least one byte was sent or received.
> > > > 2) If there was a partial send/receive then we should return a negative
> > > > error code but this code returns success.
> > > >
> > > > [...]
> > >
> > > Applied, thanks!
> > >
> > > [1/1] drm/bridge: nxp-ptn3460: fix i2c_master_send() error checking
> > >       https://cgit.freedesktop.org/drm/drm-misc/commit/?id=914437992876
> > >
> >
> > Wait.  That was unexpected.  Neil's review comments were correct.  I was
> > planning to send a v2 patch which was just a cleanup.
> >
> 
> Sorry Dan, I was too quick on the draw. Can you send a fixup and I'll apply
> it too?
> 

Sure.  I will do that.

regards,
dan carpenter

