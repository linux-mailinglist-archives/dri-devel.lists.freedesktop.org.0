Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2216CA4C4E8
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 16:25:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BDCD10E461;
	Mon,  3 Mar 2025 15:25:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZAZRBFHu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA75C10E461
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 15:25:23 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-e60b81c29c5so1981115276.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Mar 2025 07:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741015522; x=1741620322; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=PCKvwZ5J/h+SCwpYc01AHUjT/aP2XxgC1fqBQTrA6YI=;
 b=ZAZRBFHuRx6BICpSAoS3ziRUsEzVk4UjN3AxbpMS+DlpFvSwbB5nCZNcLVUrGkTf6K
 9UBeC1ImC9ooYATHpqnd3x0BHjuwzS+R5kfYDGadEPLZmyP7NXQlk59L8a6tNvk39zZH
 CtGjfHmYO6UX4JDi29bQeiL1eqmfqQT0rnPvbcXOmn0ZabvDRZ7NfrqPgCtdlSjYc6gI
 NkKxfXjCsgkdtfEMxF1SzAZ99mC66EtoGIzBh8LwDjyhWIChzXkm2TG6/nbSDKoAo2jr
 wcKm34EflW/KleDC1TKUon8XKKMNJ6v8XHa9Ach5s4Mtkylt1hnYYIZlsgUw3uD/eonL
 SFUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741015522; x=1741620322;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PCKvwZ5J/h+SCwpYc01AHUjT/aP2XxgC1fqBQTrA6YI=;
 b=Q2FCcgGx2hIu2sw0T7HgttA7SAccMta+hyNnvdFpM8K6oSoKbq5xP7q0DtzEx/exSo
 lVSgttPGnYph43+kNLQToJZ1i8SIF9V73MJJWDdkwlg6mSPoBHMX2VXZrCm8+mTzDbo/
 CsoGhK3/mYt4xk7pcpOA/Cu7+bc+gE6UEzBwpPtk7RXldv3Flf+WcF+RbADBsP4cSdqC
 j4oY5Efp4s9M1seZ9llTpMPia0l6UPCwrPmdVRgQzoOOWGkPydwYwhAMId9oaQK/LJMu
 ox8Y59HMREKTfUY42GGBqZolb8Su4D52M40qJxudLypT0nXaFPG1YpiDvMUCHI9MXxpm
 9RqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2iDf2cfjSWg9Y0RHh/fxctQIEWpehPlNczAuny4ondbCWB6wuv0sCRFKzs3lKSRYdWUOq6tnmBpY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvvRIrCvwtZMr0uldHdoO4+CO2DbDYlFmtX7z0bwggFfRL9CGs
 xhT+iG9xg2x17vD4wLkqLcboOUNfAa6L4hflq087nIHQakIctRbW
X-Gm-Gg: ASbGnctAjuh6z81pt3VlivtjnfTZlqw+TU6dOnQq3JD5mFrMdDNZGUZ580shpawzXo9
 /DRWxyc6qBZvh3pNoviEniFobLGry5a+rSynsXDmvWZyVzlpLP6emiB0AIWGstqef07sEmjCVYW
 2MNhHCMVXKx6+/MkVqFBW/ChXQoABMIcbQmBI9I5qcsG/0L1Hm5/s7VxM6WcIH7TqxqsImhDKin
 BaLYHuo/bSBkJCEJ772/ZUoS0D2rYu7iUxuQ7lHdamMrpXWx4hRB59l56MiilWpTBEkH3vYXS2j
 4RpzVZYtpFFJYhwDqhuflrTrCe8NQkgRu+PFnZvVWQLkFenwMFRSLvHQQyHxhUmZ88jN9I2gRfn
 hwF+P
X-Google-Smtp-Source: AGHT+IHSscIa3DfqfeKZ+gYLGMqXfo4aPZUveIfgdEWZZaokGaxFBKrjGL5p4Mklbl9y612Oe7mv4g==
X-Received: by 2002:a05:6902:2006:b0:e58:2a5:241a with SMTP id
 3f1490d57ef6-e60b2377d4dmr14240074276.9.1741015522418; 
 Mon, 03 Mar 2025 07:25:22 -0800 (PST)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
 by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-e60a3aafebcsm3002012276.51.2025.03.03.07.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 07:25:21 -0800 (PST)
Date: Mon, 3 Mar 2025 10:25:21 -0500
From: Yury Norov <yury.norov@gmail.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, jk@ozlabs.org, joel@jms.id.au,
 eajames@linux.ibm.com, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.torokhov@gmail.com, mchehab@kernel.org,
 awalls@md.metrocast.net, hverkuil@xs4all.nl,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 louis.peens@corigine.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
 johannes@sipsolutions.net, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, akpm@linux-foundation.org, hpa@zytor.com,
 alistair@popple.id.au, linux@rasmusvillemoes.dk,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kuba@kernel.org,
 linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 oss-drivers@corigine.com, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
 bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 andrew.cooper3@citrix.com, Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v2 01/18] lib/parity: Add __builtin_parity() fallback
 implementations
Message-ID: <Z8XJ4XCByXOx4ZwY@thinkpad>
References: <20250301142409.2513835-1-visitorckw@gmail.com>
 <20250301142409.2513835-2-visitorckw@gmail.com>
 <Z8PMHLYHOkCZJpOh@thinkpad>
 <Z8QUsgpCB0m2qKJR@visitorckw-System-Product-Name>
 <Z8SBBM_81wyHfvC0@thinkpad>
 <Z8SVb4xD4tTiMEpL@visitorckw-System-Product-Name>
 <20250302190954.2d7e068f@pumpkin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250302190954.2d7e068f@pumpkin>
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

On Sun, Mar 02, 2025 at 07:09:54PM +0000, David Laight wrote:
> > #define parity(val)					\
> > ({							\
> > 	__auto_type __v = (val);			\
> > 	bool __ret;					\
> > 	switch (BITS_PER_TYPE(val)) {			\
> > 	case 64:					\
> > 		__v ^= __v >> 16 >> 16;			\
> > 		fallthrough;				\
> > 	case 32:					\
> > 		__v ^= __v >> 16;			\
> > 		fallthrough;				\
> > 	case 16:					\
> > 		__v ^= __v >> 8;			\
> > 		fallthrough;				\
> > 	case 8:						\
> > 		__v ^= __v >> 4;			\
> > 		__ret =  (0x6996 >> (__v & 0xf)) & 1;	\
> > 		break;					\
> > 	default:					\
> > 		BUILD_BUG();				\
> > 	}						\
> > 	__ret;						\
> > })
> 
> I'm seeing double-register shifts for 64bit values on 32bit systems.
> And gcc is doing 64bit double-register maths all the way down.

If you don't like GCC code generation why don't you discuss it in GCC
maillist?
 
> That is fixed by changing the top of the define to
> #define parity(val)					\
> ({							\
> 	unsigned int __v = (val);			\
> 	bool __ret;					\
> 	switch (BITS_PER_TYPE(val)) {			\
> 	case 64:					\
> 		__v ^= val >> 16 >> 16;			\
> 		fallthrough;				\
> 
> But it's need changing to only expand 'val' once.
> Perhaps:
> 	auto_type _val = (val);
> 	u32 __ret = val;
> and (mostly) s/__v/__ret/g

You suggest another complication to mitigate a problem that most
likely doesn't exist. I looked through the series and found that
parity64() is used for I2C, joystick and a netronome ethernet card.

For I2C and joystick performance is definitely not a problem. For
ethernet - maybe. But I feel like you didn't compile that driver
for any 32-bit arch, and didn't test with a real hardware. So your
concern is a pure speculation.

NAK.
