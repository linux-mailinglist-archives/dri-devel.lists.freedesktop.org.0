Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A63A4A706E4
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 17:30:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40C5410E5B9;
	Tue, 25 Mar 2025 16:30:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="E2zCZPis";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23C4710E5B8;
 Tue, 25 Mar 2025 16:30:16 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-227b828de00so50504675ad.1; 
 Tue, 25 Mar 2025 09:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742920215; x=1743525015; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7XOEBoIoTxapXkqN32rureiAN9LUz3SUdTVTRufLCvo=;
 b=E2zCZPisw6e66W80iOuvnBstNiEliCj35cydJFnpHPDwB51ATRadgFzbdECtshNVC5
 AG4/ykXDt85eIdU50rTGBU1lHeoh3EUwvBSMFuRSBoPVjFrS64U02mQv+eS4/SM+I0mp
 rr6o6Y9Soo5UHT7dFLe197bzyD0kDsR0bXkX9wd1KjBSql2VV4d40xrmtNmV244wAUQ4
 mlRXr9G7b/bdkdk2qJZi0B6ir/IriNOHsUklDPDprMlJa6UyRXbalbEzIsfwA6K1yDnn
 StjkbUom6hKYZVtrAawpBL5pJbrD7vvM+6y+lrjE1j1PXMmVqPSyuxtW4vH3hAvUT7Ye
 c5mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742920215; x=1743525015;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7XOEBoIoTxapXkqN32rureiAN9LUz3SUdTVTRufLCvo=;
 b=Gt6drThCbKyx1oag7A94Ss9pAcY+R90siEvOnpFVVOxiLEzJWla9RdU0evFdNpPDyJ
 PxUL44YnBs/7CXeYWHJdexm1Fm4wH9WHbixTW0jQ6/M5kNydWtLjsm7o3P5OC9/RDdZw
 vQM7aQ793sift2OE/T2yfsF4FhcMG3Uz3CuVfvi1fb9cuJFZIQn53EDOa3usMrhGQGBb
 kUaEug0dbOX6YA18fzkICQ7Hb7X2IumhATu72xEtxyvI/VLhOjCAAcjHyn0LD9ZL2lNc
 mPH6sWNGsybMcA3tanrQsa1vBJDjWkGAPDMtg3gwfLsy3DkpKyZBqF5dGpr9cFiD7EYa
 Joiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcbJqjWR/D54w1d3lMbeDa0DW3isPN9ztkmq5lHPSvwNUvLHs1ruyOyEwtR7DW4wV0PM1x7mqSYR6w@lists.freedesktop.org,
 AJvYcCUiNZci/4sE4l+CmiYBpiqZMFYOvkKySjmKov0zqZaVMxOknulilgu1u+L6uxSOgAhJHsSIeEBFYJ4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyF6cMReDo2qghlvLFrCEFF6pQj57pgheApaElF/BT/M1h53E65
 PgEUC4uClpInxXcwxCTyACr2eJxlRkA9PARqBrDw9qR0dZXBStrr
X-Gm-Gg: ASbGncs1hmlfe+FBciECrWpEk9QsX7UwLuRTUShQdDC+q7qYVEgxHbWq7MeZBWBmsy8
 ADSA4JmbGEOOqcvnpflwUt23+jMHflrAshl4f/ezk0/G7QM4WN9bHZEmqLF8ikmMVUIxaGf4c3J
 UXjdqjwlOih4Cjg3JoGmthiG1BsjC2YPEbfHQJQ1EYETfaBxYPFvxB41EjUB63OF2cBYEN8yUGU
 jM8hPjzwullpyVdINTOpJsEh/QYpNJW7rTIpO2vgfrGmDTlGVg61krM+GcsO9Z4rc8RgluyhjTN
 s0EBPfnfzLf4aqxwZ7XXnn4yHV6LTzjia8OptBlGIyqe
X-Google-Smtp-Source: AGHT+IGcGh1uUnRJ1nh7gGywlabmECcecS4FX72r/Ur9GzJ48tu+/YOISn4PE+ECHi2P7HDwl8PEvg==
X-Received: by 2002:a17:902:ec87:b0:216:393b:23d4 with SMTP id
 d9443c01a7336-22780c68a0fmr268278305ad.11.1742920215330; 
 Tue, 25 Mar 2025 09:30:15 -0700 (PDT)
Received: from localhost ([216.228.125.131]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-227811b2bf0sm92890235ad.145.2025.03.25.09.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Mar 2025 09:30:14 -0700 (PDT)
Date: Tue, 25 Mar 2025 12:30:11 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 David Laight <David.Laight@aculab.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v7 0/5] bits: Fixed-type GENMASK_U*() and BIT_U*()
Message-ID: <Z-LaE8u8ZYsLxnrN@thinkpad>
References: <20250322-fixed-type-genmasks-v7-0-da380ff1c5b9@wanadoo.fr>
 <Z-FsJPA1aq7KyTlm@thinkpad>
 <7e114fdb-0340-4a3c-956f-b26c9373041d@wanadoo.fr>
 <Z-LKapMBpMfJwcL7@thinkpad>
 <58d6a3ba-4db9-4b17-a2ba-96d7f8b52e85@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58d6a3ba-4db9-4b17-a2ba-96d7f8b52e85@wanadoo.fr>
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

On Wed, Mar 26, 2025 at 01:13:28AM +0900, Vincent Mailhol wrote:
> On 26/03/2025 at 00:23, Yury Norov wrote:
> > On Tue, Mar 25, 2025 at 01:23:22AM +0900, Vincent Mailhol wrote:
> 
> (...)
> 
> > This series doesn't apply on 6.15-rc1 because test_bits.c has moved to
> > lib/tests. Can you please rebase your v8 and submit? I see no other
> > issues to merge it in bitmap-for-next.
> 
> git was smart enough to rebase everything automatically!
> 
> Here is the v8 (which includes the other few nitpicks from you and Andy):
> 
> https://lore.kernel.org/all/20250326-fixed-type-genmasks-v8-0-24afed16ca00@wanadoo.fr/
> 
> Do you also want me to rebase the other series which consolidates the
> GENMASK(), GENMASK_ULL() and GENMASK_U128() now? Or should I wait a while?

Let's wait for feedback, especially from ARM folks.
