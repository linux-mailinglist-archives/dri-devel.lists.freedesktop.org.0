Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F10AEEA13
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 00:20:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CA2910E121;
	Mon, 30 Jun 2025 22:20:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lrMHWKGv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32B5E10E121;
 Mon, 30 Jun 2025 22:20:06 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-747fc7506d4so2332357b3a.0; 
 Mon, 30 Jun 2025 15:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751322006; x=1751926806; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=NHiuZMzfMwC6+R9h6OiCUTROtFSvuO1j8HDLI3Uql14=;
 b=lrMHWKGvhuvz84FHtdXsRgm7DWCL2hIEoyQcEiHeksYL288FJiH87yqJzXByn3nQJO
 90Ya1dNed85B6o4JVjMANwFkUlXZaEscvHB9RVB/YvF3ukC1sjpgjASBnmJWU3guBRej
 WOfEVzah7zzGFGh8xDO2Qw3/effnmGD83QEgOVj26UJYiVrr9C5HQqlKSvwLr6BydwU0
 HGsUrrzV6mGQ+xbobHGsEhHLAHhR9u10SU9zSDahjtAZugI3ORpH1YKmFqzSUaG0c37U
 K1+Rki8b/tN1h7H+mCuuzP4sHe4nFBLULqFTV9vM4us+2INxij1YTQeGNxRw83KNIqx4
 L8mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751322006; x=1751926806;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NHiuZMzfMwC6+R9h6OiCUTROtFSvuO1j8HDLI3Uql14=;
 b=sPgqqvmicuoHVo2uwf2F0p5eMmV6TOtgAZUlc/k4kudIuzhff1Hd7W1TitYCKbtcT8
 CaMhk6q0aa/Ftd12T1UbfU6mwVKKVz+m8LjNtIkC2eX3x/Vn7jXRcBFd7kU/LNySztBL
 FOX9j9j9WgbbQiWIVQkpWSNakbaDZ/cTsp7wJD45LitrF6hK93Uzw0VtFCg9/TTL34l1
 sipTuZRri0ttbPO6k+RbWb/9iW7enUfCuHQKF1QVr+88SxvpKstH0Qqv6dyvQVR7a+V9
 aoDsVlmmQjdcDLFOjTUTEu4wGr5I30FHxeaOy6cDck7nVQK3GtaCKlIuBPn3nRVWkYyy
 tf5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCViJlz9H7DKiC1SoRG8fa27iRT9CdIumBhRzj7r3FnSLLFDO6wyMSg4WeNPPDzuOmCrTjLrvQrZYls=@lists.freedesktop.org,
 AJvYcCXbybIP4lWKpRIg3mPOtbPfgmO8gPXHCT9nokCCZLGEVrZM4uFGITG82F/uTi3jLX0WnDJ7jDWnPlK7@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3OR1N5jHnFFZ4/8LjmeaUN+h4q734oR/7nXLjNuuyCMl1YDiF
 So89/fWIIZ//rCj7LbDXNt5hvVDgpjzWj6lYxg/ImXZlQFrbSyJczQoFDQ8iwA==
X-Gm-Gg: ASbGncu+LE5su7EVbLb/zAlq6awnu98TlJalHN4nBPkGipgPBMYsEBpU+NI9GmVWE1E
 Gm5mJeSDefegJ7u/TdBrh0fUwtZSwdn1PNvEH5JDHXCSY1Nddxej5yEA8UHsMtKIQ7MCB/XAbK4
 dmsa3uLmI/ZlIsuITON1yxtOWDuDtgjg962MgD2e7w/9zJ9nFpZnuJOBbm/L9AOA/LyFAyZPkGr
 dI4M6irrN1n3m3EqyFQNZZaMiV7qESBQmWfTd5UsHtlFoUvTkH6fj2nL7MdVMvrqBen0w3mVdvj
 z2RMdhzExsl6wTUyD3lxtydSqPPcNjJpKY8RaRV+I+AFCu73qKsiKN6UvCFFkw==
X-Google-Smtp-Source: AGHT+IGBsxbNKvaAB+y/2y328Um5BPe7Wjg0g4g9kDG4VOXg1/QRqgyAXH7egABiIMDNmkwj7hYcHg==
X-Received: by 2002:a17:903:32c1:b0:235:e71e:a37b with SMTP id
 d9443c01a7336-23ac4633ccbmr244404305ad.34.1751322005549; 
 Mon, 30 Jun 2025 15:20:05 -0700 (PDT)
Received: from localhost ([216.228.127.130]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb3b7d97sm90566615ad.172.2025.06.30.15.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jun 2025 15:20:04 -0700 (PDT)
Date: Mon, 30 Jun 2025 18:20:02 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 David Laight <David.Laight@aculab.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v2 0/3] bits: Split asm and non-asm GENMASK*() and unify
 definitions
Message-ID: <aGMNhk0FrcQGcC5P@yury>
References: <20250609-consolidate-genmask-v2-0-b8cce8107e49@wanadoo.fr>
 <0e5988e2-eb98-4931-86b8-dcbb8b4cb605@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0e5988e2-eb98-4931-86b8-dcbb8b4cb605@wanadoo.fr>
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

On Mon, Jun 30, 2025 at 11:07:43PM +0900, Vincent Mailhol wrote:
> Hi Yury,

... 

> I didn't hear back from you on this series. Are you still interested in this
> cleanup or should I just abandon it?
> 
> Note that now that the GENMASK_U*() are upstream, I am done. I think that it
> will be better with this clean-up, but I do not mind if we keep it as it.
> 
> Just let me know what you think.

Hi Vincent,

Sorry for delay and thank you for pinging me on it.
I'll take a look on it at the weekend.

Thanks,
Yury
