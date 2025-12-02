Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97747C99E1B
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 03:31:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC02D10E50A;
	Tue,  2 Dec 2025 02:31:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="P532wrAP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15C8310E50A
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 02:31:43 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-29808a9a96aso56167345ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Dec 2025 18:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764642702; x=1765247502; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=+gp3h6PDJrFjQ/i9BEQXXsbli1Le18PxsqaLSK45JE0=;
 b=P532wrAPHjTw5TpnLlQgPwbsPV5/TUaviNfuKDyPRxScbMIYfQJsQ5IfzN5YUuBxPV
 CQVBCrqlgkVGdQeQg4z3RKtxD+YMUkV7gB5y1thKiHx1MKtFBzYIcaFdACRbTiCJ16qj
 0fAbi3wqzSI8b0gvwuI3FNrgjO4moYWiN5xQB7Q2ur7h5AiHd2TTb5JJcPbUsbJNlluo
 ZE7l/QRo3aLZHGSsSy9kENSqVb7MQMBm7M+4KS0XPHMkz15oNopoezuAr39XQXzBmKCb
 ZrmBwR16vlu8o6Y3pVfeuLetitY4lXaj6tT+yFJ3h7a9j6KW017sCJcz4dfQoaqgaxVq
 Koqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764642702; x=1765247502;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=+gp3h6PDJrFjQ/i9BEQXXsbli1Le18PxsqaLSK45JE0=;
 b=L11f2lNaOU7VXGtelUDIvERj+Uuu6xDOFg6mweWc3FJHJLOmjpWrkeRVbL1ZJH6z1D
 XLco/Bok0lWVkVS53w4Qbyv4zOQkANeCyKy1Dg9O/pCN3wGLkJzBqbXdkhdyyZCpCzkJ
 m9lIONWsgjoS0QnS1i1RoicS5kv+o8yb9P5SSm6qk1JanWNBhMkn5C2/vp3vCg12o/hk
 zE59bxNhRZS/zzMcAMK2xCsr9SAYe9TzEg2+0wTKGd7EUaqabI/qmj5xkfAYQ1XMDHOA
 wZWsIS+nHUVq+MFFSmEhEmM2SfLgkOqzz7FkIb6x4+1gj8wVz2eSTMp3zomgjyTFEyxo
 2YeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQV0ycT/PjJeZYV5MOaDOp69hjTdZ9wNVGsEmLO7lddrQKDW8U88qX1xgSeDT3Lu/4UIOSeI8DVok=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwzRX8W0VaLxm+8n76IIXxPoBVrxWG9RDLIEaa68ctK69U3RG6t
 013rkpRlVe1yUzOwGGr/yhS6tdjEQwEYjCOzdrP9mzmP28t3a2d7Ohue
X-Gm-Gg: ASbGncuztwLXcFPLCFQsSpl9mjzmsl/NJqhTXNYmMGv/5bh18NacMfO6yTd32QBqaY5
 UyoNKIH73QmpBHJgd5hq/jxiINCHU6xxmV+/WvyJM+0okJ/IM3oshYvn7kgGtcEgLHPV1BCvjdO
 28bcnLnyLlpxWmPenhpBviVxvheYz0LyXN5zg3b40W35/pZ3Xg553LYa6aqIr1CDbU6d4S9fo8w
 eJb861Im1Hch/tP6xSXbbgmi7/FeDoeaA8C6Br11OjMX5D6u/etXFIom2YXKyy6CfUJr6HtcJsm
 8HOBjnxQeCDS+QVHWkB62yj/bA5RhUg3BTL8UhqGQaeSZOrPOxTQbol8gilTK5AUDMOmZSZAewz
 5qu3JE2iuNhgGomhdCqQiEk+5bT117i3Vo1MUaWb1TksjKp6EW6nQyUUQn9y8H56PyIbrNxAq/S
 OcHRPMr1kEyw+fAQJrAXzhQe8=
X-Google-Smtp-Source: AGHT+IGOriu2yyUHY9yb8FJoC+gkKNWxweR3s4/nUAw2SsEdpRaUGaSBOcwYKvayoTNR6hvb42S4fw==
X-Received: by 2002:a05:7022:6285:b0:119:e56b:9580 with SMTP id
 a92af1059eb24-11c9d61285bmr23737179c88.5.1764642702387; 
 Mon, 01 Dec 2025 18:31:42 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-11dcaed5f6bsm79049292c88.1.2025.12.01.18.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Dec 2025 18:31:41 -0800 (PST)
Date: Mon, 1 Dec 2025 18:31:40 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Alexander Deucher <Alexander.Deucher@amd.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx@lists.freedesktop.org, dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: Linux 6.18 amdgpu build error
Message-ID: <1eb24816-530b-4470-8e58-ce7d8297996c@roeck-us.net>
References: <74032153-813a-4a40-8363-cce264f4d5ea@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74032153-813a-4a40-8363-cce264f4d5ea@linuxfoundation.org>
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

On Mon, Dec 01, 2025 at 03:17:49PM -0700, Shuah Khan wrote:
> Hi Alex,
> 
> I am seeing the following make error on Linux 6.18.
> I started seeing build failures since rc7 and rc6
> build was just fine on the same config file.
> 
> LD [M]  drivers/gpu/drm/amd/amdgpu/amdgpu.o
> drivers/gpu/drm/amd/amdgpu/amdgpu.o: error: objtool: elf_init_reloc: .rela.orc_unwind_ip: reloc 39935 already initialized!
> make[6]: *** [scripts/Makefile.build:503: drivers/gpu/drm/amd/amdgpu/amdgpu.o] Error 255
> make[6]: *** Deleting file 'drivers/gpu/drm/amd/amdgpu/amdgpu.o'
> make[5]: *** [scripts/Makefile.build:556: drivers/gpu/drm/amd/amdgpu] Error 2
> make[4]: *** [scripts/Makefile.build:556: drivers/gpu/drm] Error 2
> make[3]: *** [scripts/Makefile.build:556: drivers/gpu] Error 2
> make[2]: *** [scripts/Makefile.build:556: drivers] Error 2
> make[1]: *** [/linux/linux_6.18/Makefile:2010: .] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
> 
> I tried "make clean" and "make distclean" just in case, still see
> the same error.
> 

My test system does not report any problems. What is the configuration
and compiler ?

Thanks,
Guenter
