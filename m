Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2ED85FB9E
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 15:51:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BB6310E9FA;
	Thu, 22 Feb 2024 14:51:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="V7q1wUUq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 515A310E9E2;
 Thu, 22 Feb 2024 14:51:54 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-dc6d8bd612dso2043078276.1; 
 Thu, 22 Feb 2024 06:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708613513; x=1709218313; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OJ2JByNJlE66i73qtao/0q2KrYChhoP3YXn1jnSur1E=;
 b=V7q1wUUqhXdiAgtivOy6UQEs9O9zSYGmmumEBQKPpHUOw8/t2PRLLuoDQIuWh7EOCr
 ww2uA7wplslxahZddGRFn2nz3+gQKFqSiLra1ZRSRH7HYgakPEvRCODDHnAn7wVRiIjo
 n03rPQOX1K8QgPk87sKsDm4q0nc2wxw0gDwgrnn3ItHd5oyZ6P0+U/feYQjGkLNhkr1J
 gYjJgyJE3igLMIT0kHO/NBHD7NN3uwC/1VW7iCoHy7Q9X+AvWS+l9A3Dm+vrmxMpPsWv
 zGydmS8XHk/B175dA6IbCBqYK0dYls6qv0uqX+MuOLoYTZI5RQQ/lPWc5tB/Kr5Mqh/G
 zpdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708613513; x=1709218313;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OJ2JByNJlE66i73qtao/0q2KrYChhoP3YXn1jnSur1E=;
 b=YB7xU6czA8SzpNmR5/K6ScChcmDVLUSZ8rHcll1aqwwnCFzUYqc26oOu+PF01SyACL
 RADiBfMjshejk4Ifql7WAL3UYSG14JmVprH/9+H/vZCw2XQMOSGplFTBRrc0SCg7UwfL
 4B6BxIGv3/druKAuh+gYrNzN+tapDlcS2sF1JDPmqQ+pHcHuJwaQstowp0vSUwBeJfb0
 BH8HYnPZ9Hcxcpmmngy/IH8t8TY8v+8lM/JZ5YxsXWlDuMtvRmdy5LgiRmSzb17yoX4I
 l0uFjNvGhmJobei6xZSJXD8vtVu8AWud4b+H/EX/TJBcWYe6QNgBIwijZ0gz5tpzGa8X
 WcdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxWVE5eExsbOcKfPGZB3DOsOcIKN6AJgHS2cTmquCCU7FHdqqB/rE2/2grBXMUgK5XXPZYA4avCoEBR9EtLgdtd8fJtkSU8rboA4FP+P6iT18A56u/dp29wwE+i2aPvjNuAAT3nE4K0xyNRlKz3WcjFBrg5FUbOTEoTaW30FH2m1l5qtj3ks46jjcpEnuk8+U=
X-Gm-Message-State: AOJu0YzPQWpCe/1R6bRz/+Oz7u3dVAe/NcIdvMD8BqvjcKfd9e9ilxWn
 NZWUSE1FVr3vK1D4CVU2XqX8tWwOkAnF6ymu8+YJbFEM1vUsbD9x
X-Google-Smtp-Source: AGHT+IH54S4llmEMLtI0lCa40dhvFy/UZ9kCu89NGNN2HWU/bgqgeQAH0DpiGHYURTWMgtF+pv3x4g==
X-Received: by 2002:a25:a125:0:b0:dcc:a5dc:e9d6 with SMTP id
 z34-20020a25a125000000b00dcca5dce9d6mr2434580ybh.30.1708613513187; 
 Thu, 22 Feb 2024 06:51:53 -0800 (PST)
Received: from localhost ([2601:586:d030:4ea3:8dfa:1e5f:80e2:c7c])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a25f909000000b00dcdb3dffa3dsm2761141ybe.39.2024.02.22.06.51.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Feb 2024 06:51:52 -0800 (PST)
Date: Thu, 22 Feb 2024 06:51:52 -0800
From: Yury Norov <yury.norov@gmail.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: Re: [PATCH v3 2/3] bits: Introduce fixed-type BIT
Message-ID: <ZddfiNP5qGWNDtiT@yury-ThinkPad>
References: <20240208074521.577076-1-lucas.demarchi@intel.com>
 <20240208074521.577076-3-lucas.demarchi@intel.com>
 <ZcZYhZbLyzSXX8PU@yury-ThinkPad>
 <erg2ymp6raf7ru5ggj4hrrhet4i762msoqa2ronv4znfhlkc6o@nxu6ygtdfmrj>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <erg2ymp6raf7ru5ggj4hrrhet4i762msoqa2ronv4znfhlkc6o@nxu6ygtdfmrj>
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

On Mon, Feb 19, 2024 at 11:13:57PM -0600, Lucas De Marchi wrote:
> On Fri, Feb 09, 2024 at 08:53:25AM -0800, Yury Norov wrote:
> > On Wed, Feb 07, 2024 at 11:45:20PM -0800, Lucas De Marchi wrote:
> > > Implement fixed-type BIT() to help drivers add stricter checks, like was
> > > done for GENMASK.
> > > 
> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > Acked-by: Jani Nikula <jani.nikula@intel.com>
> > 
> > So I get v1 from Jan.23 in my mailbox, and this one is v3. Did I miss
> > a v2? Anyways, please bear my reviewed-by from v1 for this patch.
> 
> Jan 23 was actually the v2 and I missed the subject prefix.
> 
> My understanding was that you were going to apply this through some
> bitmap tree, but checking MAINTAINERS now it seems there's no git tree
> associated.  So I will just add your r-b and merge this through
> drm-xe.

I've got a bitmap-related branch. I can move this series in there if
you prefer. At your discretion.

https://github.com/norov/linux/tree/bitmap_for_next

Thanks,
Yury
