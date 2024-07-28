Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A193E93E52F
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jul 2024 14:57:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16D6610E15F;
	Sun, 28 Jul 2024 12:56:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="P0XCEvnE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 864AC10E15F
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2024 12:56:57 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-7a1d7a544e7so182501285a.3
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2024 05:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722171416; x=1722776216; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KTH+8E+6pDbaWYcbWv4zZJ4e3sHzdZrbTaO6H4PvA5I=;
 b=P0XCEvnEoYyCgVF3IWDC59IcZIrBDwcZ33SJeo6m63AhFMgldsKdV321hEvoIluMca
 d3gPinrmJp+kORV79jKNlDdcqC+/yz2kTHV7tUjViIZlWNtYgYJL3P8YP2qdXy9MK6QQ
 RqjjYalZJHinGx5x79KGEBc/NdyzMxqAsiDiZlDMpkPClW8FfKIDx6+uYXSH0wg8OaQR
 G2NncwMP7bJfz6gGRx/EoUhtZwk5qjtALR7mltA2Ra83L2MYwQa9OHhCsWnTC1UmGG+c
 W2xzlscZV8bGuPIzYTWumFqHRFLAB4UXY2ijBdiyhW4i+YgFOXUJCtM0R/1navWirVom
 pf9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722171416; x=1722776216;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KTH+8E+6pDbaWYcbWv4zZJ4e3sHzdZrbTaO6H4PvA5I=;
 b=OgKfrR4jsXFAALrUhIG9S/QRfKyviNxtydw65qNhoevRUN4vHl796vLJ/8Mvrtgva8
 uQoqVb7LYGZ1ocRclOYmMOXQgmZffsXH7p2DrDxTIcXZW486K56UWvxw35kFU006q25z
 MTZnQeD2e2mt/SM5H7hJQ7gnYJYsLqR6g4qDixdtg/mPt2w5c061/+hYUamQIGu0LJPr
 5hD7gAYMyFfHZ/YPT7WsD8a1xm0qO08OQehFqwKsEHD3IvY4ZFF3PdY2/jHib8oiXaf3
 q8x5q//xJSrtVtQSX/XDskx9077V2KF0kfOa0oo5NKcvywsquxPuGFj2Se9sQxVy72ZY
 12gQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjfMqsAsQNVGY1X247wgAJVt0B7YyW0KEpN+K2eSJ7dU0H1pYvc777Olevody6S038a9rJ8ytyIH2zY5ZdM8c0XpNh6UGxuZR5PN/sD9er
X-Gm-Message-State: AOJu0YzH1HIKhQZFvbtM/AK+oQx6HxCo2c+E7DJv7QxMvCCpznM0SOJ8
 IFPy94kPTdw+Om3Y6FxrppxJ9+0P5T24ng5kJglTKGI3nsyzb5bK
X-Google-Smtp-Source: AGHT+IGhbIGqc1OmhHlXFQ666LqZ0bP89hCnXiP2i+2pSwxBoUqfb6pq6hrjBqghA+dtI3IfFPHCkg==
X-Received: by 2002:ad4:5c4d:0:b0:6b0:6d7c:da02 with SMTP id
 6a1803df08f44-6bb5597d645mr74331016d6.11.1722171416138; 
 Sun, 28 Jul 2024 05:56:56 -0700 (PDT)
Received: from VM-Arch (ool-1826d901.dyn.optonline.net. [24.38.217.1])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb3fab9974sm42470086d6.108.2024.07.28.05.56.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jul 2024 05:56:55 -0700 (PDT)
Date: Sun, 28 Jul 2024 08:56:52 -0400
From: Alex Lanzano <lanzano.alex@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: mehdi.djait@bootlin.com, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: Add Sharp Memory LCD bindings
Message-ID: <ko6kavj46gm5py3vtfnt6zdka5ar2zigmpg72kt4zr6f3tbhwr@nbbhn726oo36>
References: <20240725004734.644986-1-lanzano.alex@gmail.com>
 <20240725004734.644986-2-lanzano.alex@gmail.com>
 <c7bf08aa-e7a0-4b60-b9fe-b43215ce3fb9@kernel.org>
 <7zpp4ebzj5xk3wbbpt7l5xnhqg3i52mdjhn3grmn562mres4k5@a3g2xxftk2td>
 <2d28134f-63d0-498c-8539-1cf2d0f1d68d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d28134f-63d0-498c-8539-1cf2d0f1d68d@kernel.org>
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

On Sun, Jul 28, 2024 at 10:40:23AM GMT, Krzysztof Kozlowski wrote:
> On 27/07/2024 18:30, Alex Lanzano wrote:
> > On Thu, Jul 25, 2024 at 08:17:01AM GMT, Krzysztof Kozlowski wrote:
> >> On 25/07/2024 02:47, Alex Lanzano wrote:
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    enum:
> >>> +      - sharp,ls010b7dh04
> >>> +      - sharp,ls011b7dh03
> >>> +      - sharp,ls012b7dd01
> >>> +      - sharp,ls013b7dh03
> >>> +      - sharp,ls013b7dh05
> >>> +      - sharp,ls018b7dh02
> >>> +      - sharp,ls027b7dh01
> >>> +      - sharp,ls027b7dh01a
> >>> +      - sharp,ls032b7dd02
> >>> +      - sharp,ls044q7dh01
> >>> +
> >>> +  reg:
> >>> +    maxItems: 1
> >>> +
> >>> +  spi-cs-high: true
> >>
> >> You can drop it.
> >>
> > 
> > This is a required property in order for the display to function correctly.
> > But I have no issues removing it if there's a better place to document it.
> 
> The sharp LCD device or the board (e.g. via some inversion)?
> 

The sharp LCD device itself.

https://cdn.sparkfun.com/assets/d/e/8/9/7/LS013B7DH03_datasheet.pdf
Page 16 of the PDF below shows the timing chart for it if interested
