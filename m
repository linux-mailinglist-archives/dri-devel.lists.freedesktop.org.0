Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90894AD10B5
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jun 2025 03:37:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A69C510E0AE;
	Sun,  8 Jun 2025 01:37:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="e5GFZ6Oa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEB0F10E0AE;
 Sun,  8 Jun 2025 01:37:34 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-22c336fcdaaso27079575ad.3; 
 Sat, 07 Jun 2025 18:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749346654; x=1749951454; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=2sqvYpLGb/0ZKu/5EGoiw9KApDKUisG2VJYva5h7mD0=;
 b=e5GFZ6OaWbkEfqlnB7/uyf6DzAC29c94c/0ZR/1np/GMrYBSp9gDUH7K1NqQ8mkaVA
 6F6C26jer7zplPloMBeyqyScb+AHHyy3bo4MyrQSizolhjpiXDyaHZtsJFpDu1cW8KCg
 5rIv3+fR6SVpdjZ94jDZQX0ga8PQ1miuh153RpDASA24jNELMpE1R3hD6gaDKBOrbn0k
 oYOlr7MbXOM0DDjdmZTTS/3Dveg+peYy8oP2cvFEO/j+CBXNTgPxh3uA/9tS2LUQ8b9f
 2TFbOnEGViUyvw361oXpsqaECnom/xs/cvreBBjU2+53vJ2QUf3VkdpnNNsrHd2VlZED
 Tl4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749346654; x=1749951454;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2sqvYpLGb/0ZKu/5EGoiw9KApDKUisG2VJYva5h7mD0=;
 b=KTXsUzXooklHc24OX5jkayJyunaV4ckj/JDqtnQLJNmx3v/UOyN4B/iPKaYLninRPO
 ELFXE+OF5nG39bkTlT+hEoQpcN+b9D8jovrlcNzeA0XyWxw6AxvDIoX8zVi5FKpUtpfI
 b/8WTqYM3JpNc7NwVJC4si8WB6r7uXkIXSUOpQpvDAx+sep3KshIMoqccGzeN701WF1K
 Fv8rby0FjHYnt8Sza0JTDnzFP9uVkoy7spO8r9zxO67oDBzYvBi+vl0EG2njmp6PIq19
 QsS4LLNhKmrA7k+5GQRh93sWKtRTjVf2YllzKHO2SpZr5uluQfrxc4bnMpGb3wz7ttDQ
 Uq2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhw8SK9ZaWzKG4nBlVn9oSs0UdAAHpSxE5Az1PySt19a42Qhy2jvOTJEPNQVT6FHutDMeybAggudU=@lists.freedesktop.org,
 AJvYcCXV6ILQmdjH4GM7B1qSR39BQ7yVR7xW2taICWXOSznHIgHLrukcFCl3Aima23ZlCOA2oDD5k7yq9qGd@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0lTuuaQrdbnmiUMSGpI9FNvPXqbIYSm0tP/etx/UOMQfUR7rP
 S+I8rLB/9hltpDGsooy7BaWY9ArDU4r6X4bdAc4K0tVv3PpuxENPQ2r+
X-Gm-Gg: ASbGncv0G56/+JmUq6vjvYo0n5qH1HrnxTeNp8ilFoabC5zZmRB+jsQg/BgqD0Px+HZ
 zKlE36koyo3BmGJVep2k8m5RAU2JrATMlE/+6zOoLdKAVn5/ZTMzxt1Cb0KCahow4V1xEy8ighf
 RI0h+q3FISB5rBbNLPxuPvYEBxfSx33OLi2OjSvab+yHWfXMTzHYvy/HlPz4YTooEU04seXvu/7
 iIeV9QLLAWL40NUWv+YuIU0GpIUP6GkPzdXbVZyzODEw9CRVS2pXg29pJuDiXVGCwjkOb/KyRvN
 Ozf3pUI1oC6EkoReK/5HhwF+xAAXAfBtTzHdzqnPvEW99tg8pfOCOSNXEKLT1LqPGu4k3krJ46E
 =
X-Google-Smtp-Source: AGHT+IEjsGLQhbeTJWsjluro9ebaeJGp9VHRlZ28GkxruIzIQd9kN018WpRicQMyZGKUiyZa1MSGIA==
X-Received: by 2002:a17:902:d484:b0:235:eb71:a37b with SMTP id
 d9443c01a7336-23601dce87dmr124564185ad.46.1749346654313; 
 Sat, 07 Jun 2025 18:37:34 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2360340f945sm32484705ad.192.2025.06.07.18.37.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jun 2025 18:37:33 -0700 (PDT)
Date: Sat, 7 Jun 2025 18:37:33 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Karthik Poosa <karthik.poosa@intel.com>,
 Reuven Abliyev <reuven.abliyev@intel.com>,
 Oren Weil <oren.jer.weil@intel.com>, linux-mtd@lists.infradead.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 01/11] mtd: core: always create master device
Message-ID: <9dfb2954-fc3e-464c-a4fd-8c1a4dffa327@roeck-us.net>
References: <20250302140921.504304-1-alexander.usyskin@intel.com>
 <20250302140921.504304-2-alexander.usyskin@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250302140921.504304-2-alexander.usyskin@intel.com>
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

Hi,

On Sun, Mar 02, 2025 at 04:09:11PM +0200, Alexander Usyskin wrote:
> Create master device without partition when
> CONFIG_MTD_PARTITIONED_MASTER flag is unset.
> 
> This streamlines device tree and allows to anchor
> runtime power management on master device in all cases.
> 
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>

Several of my qemu boot tests fail to boot from mtd devices with this patch
in the mainline kernel. Reverting it fixes the problem. As far as I can
see this affects configurations with CONFIG_MTD_PARTITIONED_MASTER=y when
trying to boot from an mtd partition other than mtdblock0, with the
mtd partition data in devicetree (.../aspeed/openbmc-flash-layout.dtsi).
Is there a guidance describing the changed behavior, by any chance,
and how the boot command line now needs to look like when using one of
the flash partitions as root file system ?

Thanks,
Guenter
