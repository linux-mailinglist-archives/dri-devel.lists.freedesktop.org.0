Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D23CD8C3516
	for <lists+dri-devel@lfdr.de>; Sun, 12 May 2024 06:47:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8231510E02B;
	Sun, 12 May 2024 04:47:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DgkPBnrJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE0A910E02B
 for <dri-devel@lists.freedesktop.org>; Sun, 12 May 2024 04:47:03 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4200ee47de7so6628515e9.2
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2024 21:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715489222; x=1716094022; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KK6TsAwtGjBbTSQzMUzip8w3QmdfL6P+ac45Lx3W0NM=;
 b=DgkPBnrJ8qeGOppRssUzhSuhEBDliGmCp6rnWWQIue3srjtOXxRhjNqkIUeSyr17zs
 8ZgrT+mlk4Q628pRiUpYGQoFrlYl+Si7QytfPZWw/rhvEFdBxOSl5/hSBAoQI1QmSpMa
 oLvJHz0O9OMt8cs+yr0wmmF3du5/FsyzkyhehYiRlJeStfiXoxllpmqm1GfsDOryIekQ
 Dpx0BpMBkdILV6LryfR3cPLE2EGRB0Srimtpn31rsKxQc2oOsu4D74zSp1MI9unDGkdj
 vUI/wGNJhr0+DZHy2FHyt02c+7KVG3l+LwNqo4Nd1jBckjZnzm+K+a1BQyHDqnVuMEH2
 cksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715489222; x=1716094022;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KK6TsAwtGjBbTSQzMUzip8w3QmdfL6P+ac45Lx3W0NM=;
 b=DIiKx/1KSWt/uojFI5nAqCeh9kgHqe5sH6TZYPOTXMdYgjIrBvPKQlLut9FRIhRoOK
 jSp0UP47k4MNlseyGAqcC6BcDk5TE0JcO/TsRO0gL8hiXE549yx8XEeMiC8kueO+ESh+
 a41XEFN/2hNsMuVDkeO6qzkf1yTO0FjBRHXTMJ0Rp7U/DQ2q4wKm0VV639bZMXGwNNY3
 7T5sJNOHcwyMbLFS9kYBxbjxh/w+taDfnt9wFPjhsMh+RWxT2mnSFPXXXRYRZ0CTaQUW
 qyA2m2aeVM2uaCGpTSmSFll/Kek299tf7A8gTbX1M1yAw2gfDaxqVd6eY0YBXKdh7cea
 XVeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWe2VVxR/aLPq/yTttS87Akdbc7Ufhy7HhaTgk2H3WSbA0uMHK5gl6tNZu65znzUbtVE+Om4wvjuluuAYpr8pAcyIkYX/t+Mdw6TkZHa14h
X-Gm-Message-State: AOJu0YzkabO7DWI1ioYzlu1WNNXg9G+wrpU8eO1t3G/b4JS9EPWe/yNF
 L+gvGcPdZxnWoeGq2PPOOmjxcPiONwFK9FEkOapZujgHqxcj7So=
X-Google-Smtp-Source: AGHT+IF2rV2/5tiwIRZTS6xAYsYRSQHNfOqwPFODg+hwu4WCB8tZoVeySO0NHnVdDaz/CbLzulaUBA==
X-Received: by 2002:a05:600c:3508:b0:41a:7065:430a with SMTP id
 5b1f17b1804b1-41fead7b138mr40562765e9.41.1715489221923; 
 Sat, 11 May 2024 21:47:01 -0700 (PDT)
Received: from p183 ([46.53.251.9]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502b79bd09sm8074593f8f.14.2024.05.11.21.47.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 May 2024 21:47:01 -0700 (PDT)
Date: Sun, 12 May 2024 07:46:58 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, benjamin.gaignard@collabora.com,
 sebastian.fricke@collabora.com, akpm@linux-foundation.org,
 gregkh@linuxfoundation.org, jani.nikula@intel.com,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com,
 praneeth@ti.com, nm@ti.com, vigneshr@ti.com, a-bhatia1@ti.com,
 j-luthra@ti.com, b-brnich@ti.com, detheridge@ti.com,
 p-mantena@ti.com, vijayp@ti.com, andrzej.p@collabora.com,
 nicolas@ndufresne.ca
Subject: Re: [PATCH v7 6/8] math.h Add macros to round to closest specified
 power of 2
Message-ID: <0e72422c-8c83-4991-8def-97c40e0c06ff@p183>
References: <20240509183952.4064331-1-devarsht@ti.com>
 <Zj42vTpyH71TWeTk@smile.fi.intel.com>
 <7214a8b5-16d4-42a1-868e-9574c506be85@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7214a8b5-16d4-42a1-868e-9574c506be85@ti.com>
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

I think

	roundup(x, 1 << n)

is more readable.
