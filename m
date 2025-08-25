Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BBFB34645
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 17:49:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAD0510E4F2;
	Mon, 25 Aug 2025 15:49:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="v5ridbbb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64B6E10E4F0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 15:49:49 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-246257e49c8so343775ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 08:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1756136989; x=1756741789;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=k+sdNCtHEDTDeDcug82C4JMMO/tNuG8fyuseyldRdnM=;
 b=v5ridbbbXGmaq9J34+WJz4BiHTxyTrBATVGvLVB60esbFoTSrhfBL0GK+VPSY8bDHf
 tboWdBVpvXhG+qO4P74IDBjOBXSsfrgHJimLITxv2raw5LdgjXCUXcWuGGtRkLnXKGy+
 IJ6Vut34YiOEOfuf9xYPPuy5TYnwbPhs0Q2c+9jLnVxAGTXugbIKmEt9He6+nEhKJ2Hc
 TEMJxV1RS1ET8wFCXi7wQ8UwZIB2mNYuGX94+szcOsYrh9j8uhYk6sBEGxafq0itFcw8
 os0qYu2b4Jfvdt7uFMqAsoihn0utsUYPENoIMH0ULGTWrFQBxX3b4VF3enUI+189pmwt
 25pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756136989; x=1756741789;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k+sdNCtHEDTDeDcug82C4JMMO/tNuG8fyuseyldRdnM=;
 b=JnNcSzbLriYsS2dQhGAUz21gnZgHIr2C/PiqaYErfU45G4NgQ2nFSAdNFFQD1sai9C
 CZnGb5Zg/xUYcvcTU90iIqRlHJO3w0mgZSW6Yi0q33T6zFG4n8UJ5gWu0i09eTAKMED/
 q61eANe7bJllshkA9Zw+se04EuFLOTTWrIZibj7hUPdX0uRf7vDIdF5YdJbAmzZHJyDA
 CGf9VNmNMX94Ppic8o7DsdeAX9UsN+TnB98M5D8tLWLmmoDSCMSCPkU9/oQj/bOfVYvH
 ENEVT4bPkgPCirHTeMLkje8q5Oa+TXanNaIF5mvse3Bpbcb7rGownV0qDiVgD9pvOjif
 7aoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/2fAi1KiVwJCwjchTG/QMhdmgtQMkaFDNkifYNXavG7X35Zjl/6tJipv8y6MeYUOh+m2oo5HzFsU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywnu4Hw4jG5W08CybG1ZzBOPQA3Wa4sjfj6TX2zDWUGB79AzHec
 OGKMaUbAdGXz+fPhcnpKR9Z782ubBfTvFFgY59V9VlcnOE3JrHjbkfWbzxBow2Csow==
X-Gm-Gg: ASbGncsgxNotIVOObmDdHLONLOnKudc2ckTW5jyxoKeVzsOgjlWLKO6+jGXuZy1PyC0
 pAVy5QQxzh1/K1WiUgw48FO2mlqJ1P+eOckIxKofUKxuVWUC5QtkXWEGSyXeocYUDf9qWJZzelG
 2c9HzTQJIx2eVlFLds1N/RZ/DpkfLfWThn6p5mVMhYGT7E7QfLboAXXhn5VfsIQQ+o/nzWiOd+d
 LKxqfROM4G0Euiy+40jGgeYdn0xsVkV8Zyn/IJ4S4tLQc2h1siAyokeJvPAT5i+l4UoJisAgF5V
 DzqIxBNm++fjop+KkXVskBjN21OmehckSwlSe2PDpLHZgquza5QS5V/tUIHmkLZ3RHnxNiCwwUP
 Upi+8EQW7ZaclSg8u/WyFy4TSo6ifQpZclmAIDDLb3bWZnIQwX/ucgd4fgCqYZWnJGV2vJHOX
X-Google-Smtp-Source: AGHT+IF/UUO3cGwP6E0MsYUN+8MvrQxpywYseDCjgMMrOlXWFlEY29LQ9QYboUALl8xCpqDFKif5XQ==
X-Received: by 2002:a17:902:e548:b0:240:6076:20cd with SMTP id
 d9443c01a7336-2467a3cf14fmr5259605ad.15.1756136988608; 
 Mon, 25 Aug 2025 08:49:48 -0700 (PDT)
Received: from google.com (3.32.125.34.bc.googleusercontent.com. [34.125.32.3])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24668880368sm71312425ad.109.2025.08.25.08.49.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 08:49:47 -0700 (PDT)
Date: Mon, 25 Aug 2025 15:49:42 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matt Atwood <matthew.s.atwood@intel.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, Tiffany Yang <ynaffit@google.com>,
 "open list:INTEL DRM XE DRIVER (Lunar Lake and newer)"
 <intel-xe@lists.freedesktop.org>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe: switch to local __basename() helper
Message-ID: <aKyGFnCJjlfsPU08@google.com>
References: <v5j6nxynzvvlcxu3m3mkeyjv5dlozzp7ixkgc6u6hdzh7en6jh@zvzqm5n7njfd>
 <20250821220054.3700783-1-cmllamas@google.com>
 <w4j3kzezrd4xqc4q4vkpbbxqvqxitam5htkex6rj6dguj5kbw5@27gqnp6veuu4>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <w4j3kzezrd4xqc4q4vkpbbxqvqxitam5htkex6rj6dguj5kbw5@27gqnp6veuu4>
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

On Sat, Aug 23, 2025 at 06:56:30AM -0500, Lucas De Marchi wrote:
> On Thu, Aug 21, 2025 at 10:00:53PM +0000, Carlos Llamas wrote:
> > Commit b0a2ee5567ab ("drm/xe: prepare xe_gen_wa_oob to be multi-use")
> > introduced a call to basename(). The GNU version of this function is not
> > portable and fails to build with alternative libc implementations like
> > musl or bionic. This causes the following build error:
> > 
> >  drivers/gpu/drm/xe/xe_gen_wa_oob.c:130:12: error: assignment to ‘const char *’ from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
> >    130 |         fn = basename(fn);
> >        |            ^
> > 
> > While a POSIX version of basename() could be used, it would require a
> > separate header plus the behavior differs from GNU version in that it
> > might modify its argument. Not great.
> > 
> > Instead, implement a local __basename() helper based on strrchr() that
> 
> double underscore is reserved for libc in userspace
> (https://www.gnu.org/software/libc/manual/html_node/Reserved-Names.html):
> 
> 	(...) all identifiers regardless of use that begin with either two
> 	underscores or an underscore followed by a capital letter are reserved
> 	names. This is so that the library and header files can define
> 	functions, variables, and macros for internal purposes without risk of
> 	conflict with names in user programs.
> 

I see, xbasename() it is then...
