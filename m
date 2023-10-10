Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B81947BFE41
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 15:45:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F22F110E367;
	Tue, 10 Oct 2023 13:45:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDEDF10E367
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 13:45:17 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-692779f583fso3901291b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 06:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696945517; x=1697550317; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=8l2RdI3GFEPsUV4izDgB+ReS+fUuBzrkfgodsUfx59E=;
 b=WVAmW3+aaNbRdiuc3Wd3195kPaS2C/p63KfcuxgahRLeBFZ9nuww6IEJeLS1gF1IVD
 giCNbAQlHIhp951ppCtP9ib9ayiVx8ZQKi8uAGNI00rX49BVREwAti/SoWjK40h/zaJq
 FP/DGsj/pDJ4MZsVC8WJk/FOSo/c3fQ8wsQ+4ojPqEFI7zs4KMY5uoEWcnAk3fBMla50
 VwOgGrg6ap3pkBgE8DLNtjChOd3BspSC/H7K1O/KJH0qEflflOReag5cSEef1S+4o8aE
 F/31RKmlOjexK+RhTGGyX1LJSIZ8Bda5QHjl2KMKuROWptN4qXJ+s3iBfMfpxLbisA6P
 ftRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696945517; x=1697550317;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:sender:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=8l2RdI3GFEPsUV4izDgB+ReS+fUuBzrkfgodsUfx59E=;
 b=ClTRSsUCVVs0uxRYqoZc+/Y0tHCJiIGJ8erMP06LezVzNT6V689cgzFele9NgT10nq
 QGlLROC/NeoniZYcgdAvhlhYajFk+FrDrxro3EctSq1mXVhAB3DjRH5F3g53IgtIw0mz
 bXy33jRrL4lYxS1x829pHkfAoBZOU/MSdwGfKbftd9eVCvMNABdkinvf9Q2Ul26pwffB
 SIeDz4ViUPkqswbMuCOhEUdd979RTym8bkdIUEFtrYmfQkYxdaaxtjOnBcNr/Yr8QY5A
 uVmSqFfly5O5P7UnNi6LR9VqhHt0ReItTQOSfk8Wiqcdz1ci6tlmUSsHGAGZhJBZrlzp
 FThg==
X-Gm-Message-State: AOJu0YxgQRPZzI0Vcb2AS88FxyAyyVnwOlr5cIj9MFkS4NGFudE5qzME
 Jh3/NuFGcFrbnps1t+QS1jI=
X-Google-Smtp-Source: AGHT+IFXY9oUPaVxKEnn6g6JYYGtzSzrMoSdMofrv/KTOwLE9fLvIeTEWiBIFB3Tz8IdPnDmUMrc6Q==
X-Received: by 2002:a05:6a20:2451:b0:14d:5580:8ff0 with SMTP id
 t17-20020a056a20245100b0014d55808ff0mr18099934pzc.25.1696945517276; 
 Tue, 10 Oct 2023 06:45:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 j6-20020aa783c6000000b0068ffb8da107sm8231769pfn.212.2023.10.10.06.45.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 06:45:16 -0700 (PDT)
Date: Tue, 10 Oct 2023 06:45:15 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Wolfram Sang <wsa@kernel.org>, Lakshmi Yadlapati <lakshmiy@us.ibm.com>,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 jdelvare@suse.com, joel@jms.id.au, andrew@aj.id.au,
 eajames@linux.ibm.com, ninad@linux.ibm.com,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-hwmon@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1 0/2] [PATCH] hwmon: (pmbus/max31785) Add minimum delay
 between bus accesses
Message-ID: <1284830f-025e-4e25-8ed0-50a6cc00d223@roeck-us.net>
References: <20231009211420.3454026-1-lakshmiy@us.ibm.com>
 <ZSUaDIfWmEn5edrE@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZSUaDIfWmEn5edrE@shikoro>
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

On Tue, Oct 10, 2023 at 11:31:56AM +0200, Wolfram Sang wrote:
> Hi,
> 
> thanks for this series!
> 
> > Reference to Andrew's previous proposal:
> > https://lore.kernel.org/all/20200914122811.3295678-1-andrew@aj.id.au/
> 
> I do totally agree with Guenter's comment[1], though. This just affects
> a few drivers and this patch is way too intrusive for the I2C core. The
> later suggested prepare_device() callback[2] sounds better to me. I
> still haven't fully understood why this all cannot be handled in the
> driver's probe. Could someone give me a small summary about that?
> 

Lots of PMBus devices have the same problem, we have always handled
it in PMBus drivers by implementing local wait code, and your references
point that out. What other summary are you looking for ?

On a side note, if anyone plans to implement the prepare_device() callback,
please make sure that it covers all requirements. It would be unfortunate
if such a callback was implemented if that would still require per-driver
code (besides the callback).

Thanks,
Guenter
