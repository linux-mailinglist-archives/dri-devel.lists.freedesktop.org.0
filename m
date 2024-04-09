Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C68489E1D1
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 19:46:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94E53112E8B;
	Tue,  9 Apr 2024 17:46:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NSjpwjyT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 185A110E070
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 17:28:27 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-2a528a1a1bdso1621839a91.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 10:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712683706; x=1713288506; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fa5Dmlr/NPrypZkGeE7E1g8PAi/Q7m7ruLjA0BtX6rQ=;
 b=NSjpwjyToKoUAX8Al2p0gqPYEVN1wKJt8le4VIinf2bbQmuR+ggvMS+EIGrF8L0NZU
 IxvNeqXcNUTl6MRe2IVZz4pAgh9cLew0FwEoKLx4QSP1Uo1rdptC4GLD5/gquB5tvwhS
 2BmaENTKCbbIt67XN9+dIeRc0Z0110G74fpfsgxwjHqSCrYMRp7AA8qP4DqOAugzcvIx
 xDklkMCrBpNiuscVwxVHxgpJha19t6IBl9PZ08inA91GpnVf/arGwCKqRXQ4kvwSkbgB
 t+X+NOGroIEbUVvckeun2TAkmff1KE5bRLMzZ4uOS9/H8C71wzb3KOKM7LstdSZAd4j6
 iCKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712683706; x=1713288506;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fa5Dmlr/NPrypZkGeE7E1g8PAi/Q7m7ruLjA0BtX6rQ=;
 b=Ru+RAcSFIGZvGymxUviZ5MjLgLEb9X7r05wB1xEGw1IaXAtudGxJNuld94pLh8rKZK
 f94/ggRGpk7RwgQwjcup1j0XOPX5eBGxtRQ9draQWY0lmJUpsEg3NRCojo37xwPcrjwN
 mtDhgaxAjdfNCQBh2Kfyava+AjYn4/J+AUGMhMFrb6IspgybWySeA42LH5I/rnGOVmye
 PbfJU42OykQmclqOt8ynhGK8zs/u3lgaYW8+Y0/OXuoKlIlEGg9BgQ25tspUh/oCpX7r
 a3PymLEVVALtV0eRvwarQ3BEXsi4cl85R2Xy+Gft9g3d6lJyvepA3xHGBqvnQoPVDWj3
 EV8g==
X-Gm-Message-State: AOJu0Yzb3WUAPCy9x/HEc0+3Cnf3/gO6IoMmAqKemoTX/kA7tmVmqkZO
 g2DEcTUiuOCp5LyrjeR6j3PhlEeGPEpIOJnVaJ3xa28nd7bytNTq
X-Google-Smtp-Source: AGHT+IHWbihX0WFZNpRScBdUcc2XFZ+GfokTuBZqI3IxOqoMWFCNXFSpx8VlYzMg+AyQE9dKmaJDug==
X-Received: by 2002:a17:90a:ac9:b0:29c:7566:a1d6 with SMTP id
 r9-20020a17090a0ac900b0029c7566a1d6mr330992pje.25.1712683706037; 
 Tue, 09 Apr 2024 10:28:26 -0700 (PDT)
Received: from localhost.localdomain ([172.93.220.120])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a17090a394500b002a55198259fsm2136700pjf.0.2024.04.09.10.28.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Apr 2024 10:28:25 -0700 (PDT)
From: Yuguo Pei <purofle@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, purofle@gmail.com
Subject: Re: [PATCH] staging: fbtft: fb_st7789v: support setting offset
Date: Wed, 10 Apr 2024 01:28:06 +0800
Message-ID: <20240409172806.8527-1-purofle@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <2024040935-naturist-skimmer-391f@gregkh>
References: <2024040935-naturist-skimmer-391f@gregkh>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 09 Apr 2024 17:46:15 +0000
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

On Tue, 9 Apr 2024 17:49:25 +0200, Greg KH wrote:
> So you are now hard-coding the size?

Yes, the change just helps developers who want to adapt to different screen sizes.

> Is this always going to be 0, if so, why need it at all?

Not sure. For example, when HEIGHT and WIDTH are 240 and 280, LEFT_OFFSET is 20 and TOP_OFFSET is 0. Different screens may have different offsets.

In addition, do I need to resend the patch to modify the Signed-off-by?

thanks,
purofle
