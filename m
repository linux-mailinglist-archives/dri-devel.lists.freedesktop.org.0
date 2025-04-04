Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B192A7B92A
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 10:46:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CA2D10EB89;
	Fri,  4 Apr 2025 08:46:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AFnRqyi+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F8410EB8D
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Apr 2025 08:46:47 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-736c1138ae5so1702885b3a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Apr 2025 01:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743756407; x=1744361207; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XEr/lesTAhWcQcf7iA9OshZymqi1lesrw8RKfhNHVDw=;
 b=AFnRqyi+jAi/tR9bqirLzYNxgXVUgFWChbcdG0VqoDxKUwUIujHlejsHb+oVxbVDrE
 JXbkk4LUk9bZnSVsMQYkV+AOjnt1TyGU8B9BF+LYABLbD4EcdG1bsA17D+eYT2n2Fdat
 LI+ZSFjAQ2Hx8B8xIVxJrXmd53AxAtsiWFDp9toPwomNX6MNbCSzBB+vGRy2uCWQhBiu
 LgtWbT54b/lpGb/pv7nxUukdHSNXOfv2AIo0NVYHM9NH6H/aXxJF0Lu06Tl5KUyxbNfV
 IbX3Lleyp3JEi6Z4DRUDnao5YP8Eh2/in3r6inc3YezkXm4Xmt2LZvHJjF8zRU+rqeom
 pHJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743756407; x=1744361207;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XEr/lesTAhWcQcf7iA9OshZymqi1lesrw8RKfhNHVDw=;
 b=HfDQDZFCisKqIc51jaPBg0FSs15A/UQAFsKTXTKiXZP+L9CX6V5yseEMT5eR1hbQJZ
 3essDTNGghXkSR0N6CgqqJQOBZoL8Sv0HCVx84AKRH9807nUgyQZHiHTYqft6SOTBoDN
 ns1Tic7BzNaxu2q+Md7hmwLY4Tlr0xcpo93jUovg8SJ9PVVhTllEKH3WtLtN63m0mFnj
 7v+rdGzYikDtV8u6EVNWj1fGaYN9x8Lkll1TeurHku0sAURjn1+jC4IoLACZ5qUwicRq
 QZB4z8RtRAdD5S0hTH7FACD6KClm/sPNRC4gvxOqNuXZPN8bdndPdrbsgB8RFtbfNirX
 XGsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWP7d3d4ON/wX60M68O3ObrTkJlp+llrnvCJ3jv90HKXTUo5VJ2vrMKrXsNUSXsioEeTEpFZA0Vk/I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6zS0zSLq3eg6lyI5VNsod5eeGmBCJDJ/jkbcmiFvhH3Je4bTC
 VZ9qyzJmICWxFCv49drUvaxLG6yG54jG5I/nOVcOLdV+kK7y8aHI
X-Gm-Gg: ASbGncvycvlPMGnNj4xrHsEv5Zrf5YQKVQ/CV8fiH1nRGDLxIbX0bvpoBxsDraYRbAH
 I43VB44GUY8kBdg8rnEeuvuGiAjdl6x2MLaQfGKhd4PSK4O4mznTUYH9LTRuu/lYYewMhg1GuX+
 5r/ZQRb+meAurBkWZBZV08QY8TWdQzYW+Dvlac4yheMdVSX5SirmtwPqoYQUJhf0NcJGZ5li2hm
 d07WCwEiMWlJNbcS8Q1nRsSsG9x1JOCmrVzr5I+GqetaISelaYOwiHu9Tk6XCvbD3F1p00jMb9I
 FfOQaa1M/AdqI+TwxHNT6+P/J3Ikr68VBejqenNUgXC/vTCUEH5H73RaM3+33bw7ebMEW6TD
X-Google-Smtp-Source: AGHT+IGnBuGwhOqlkhsoqT0zhJln64liGpkRA7l3PCCq0BqnYRQF3lpkwuYz5g4xSoDa+vLjvXq3Yw==
X-Received: by 2002:a05:6a21:483:b0:1fe:61a4:71d8 with SMTP id
 adf61e73a8af0-20104666844mr3980332637.22.1743756407334; 
 Fri, 04 Apr 2025 01:46:47 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af9bc34ec32sm2448099a12.35.2025.04.04.01.46.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Apr 2025 01:46:46 -0700 (PDT)
Date: Fri, 4 Apr 2025 16:46:37 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Jeremy Kerr <jk@ozlabs.org>
Cc: Yury Norov <yury.norov@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>,
 David Laight <david.laight.linux@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
 akpm@linux-foundation.org, alistair@popple.id.au,
 andrew+netdev@lunn.ch, andrzej.hajda@intel.com,
 arend.vanspriel@broadcom.com, awalls@md.metrocast.net, bp@alien8.de,
 bpf@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com,
 brcm80211@lists.linux.dev, dave.hansen@linux.intel.com,
 davem@davemloft.net, dmitry.torokhov@gmail.com,
 dri-devel@lists.freedesktop.org, eajames@linux.ibm.com,
 edumazet@google.com, eleanor15x@gmail.com,
 gregkh@linuxfoundation.org, hverkuil@xs4all.nl,
 jernej.skrabec@gmail.com, jirislaby@kernel.org, joel@jms.id.au,
 johannes@sipsolutions.net, jonas@kwiboo.se, jserv@ccns.ncku.edu.tw,
 kuba@kernel.org, linux-fsi@lists.ozlabs.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-serial@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux@rasmusvillemoes.dk, louis.peens@corigine.com,
 maarten.lankhorst@linux.intel.com, mchehab@kernel.org,
 mingo@redhat.com, miquel.raynal@bootlin.com, mripard@kernel.org,
 neil.armstrong@linaro.org, netdev@vger.kernel.org,
 oss-drivers@corigine.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, rfoss@kernel.org,
 richard@nod.at, simona@ffwll.ch, tglx@linutronix.de,
 tzimmermann@suse.de, vigneshr@ti.com, x86@kernel.org
Subject: Re: [PATCH v3 00/16] Introduce and use generic parity16/32/64 helper
Message-ID: <Z++cbTTp8leOJ5O+@visitorckw-System-Product-Name>
References: <Z9CyuowYsZyez36c@thinkpad>
 <80771542-476C-493E-858A-D2AF6A355CC1@zytor.com>
 <Z9GtcNJie8TRKywZ@thinkpad>
 <Z9G2Tyypb3iLoBjn@visitorckw-System-Product-Name>
 <Z9KMKwnZXA2mkD2s@visitorckw-System-Product-Name>
 <Z+AlyB461xwMxMtG@visitorckw-System-Product-Name>
 <eec0dfd7-5e4f-4a08-928c-b7714dbc4a17@zytor.com>
 <Z+6dh1ZVIKWWOKaP@visitorckw-System-Product-Name>
 <Z-6zzP2O-Q7zvTLt@thinkpad>
 <3ebd280e6697790da55f88a5e9e87b4cab407253.camel@ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ebd280e6697790da55f88a5e9e87b4cab407253.camel@ozlabs.org>
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

Hi Jeremy,

On Fri, Apr 04, 2025 at 10:51:55AM +0800, Jeremy Kerr wrote:
> Hi Yuri & Kuan-Wei:
> 
> > Thank you for sharing your opinion on this fixed parity(). Your
> > arguments may or may not be important, depending on what existing
> > users actually need. Unfortunately, Kuan-Wei didn't collect
> > performance numbers and opinions from those proposed users.
> 
> For the fsi-i2c side: this isn't a performance-critical path, and any
> reasonable common approach would likely perform better that the current
> per-bit implementation.
> 
> Our common targets for this driver would be arm and powerpc64le. In case
> it's useful as a reference, using the kernel compilers I have to hand, a
> __builtin_parity() is a library call on the former, and a two-instruction
> sequence for the latter.
> 
Thanks for your feedback.

IIUC, from the fsi-i2c perspective, parity efficiency isn't a major
concern, but you still prefer optimizing with methods like
__builtin_parity(). I'm just unsure if this aligns with Yury's point
about needing "evidence that performance and/or code generation is
important here."

Regards,
Kuna-Wei
