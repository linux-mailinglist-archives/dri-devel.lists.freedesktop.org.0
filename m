Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FC4A82FCF
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 20:59:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D95C10E26A;
	Wed,  9 Apr 2025 18:59:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="T3P+ZwCh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B58B10E26A
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 18:59:52 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-7399838db7fso63365b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 11:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744225191; x=1744829991; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=n1wi01EF8Z0TS5kAzJp4gC5MlmlCKp8z1jxkmp6i2uY=;
 b=T3P+ZwChEsJxeNFsEicjcdy217V7PHfPM8JOkYC3BoV5v38cw6k1Ut1LNRoPLGHYxi
 Ozn9ium6fxwRiXf8qF1ObiR/dZmzMC+laqEhOSpoHFV2YHQwsmVZRRw1pG52Wp+zgn4R
 7gy3YrJ0lBDnwuYXWCkCCE1ZYN+YsYwTF0NnM/OrLap1QUSuxkWaWd+jh/N0NEmmzx1s
 EkSanKGzC4bix9zCO1ewRge32IBMamfDDnwYDeHjiQO0nOyu7276VdHGtGQjYlICp/Zo
 y61NXsetqW29mvDP/3O0bAbXD8xH7T4RhOmDKWrwMqDZuscDr1aduLKZZnSS4Qq9ftkL
 z6/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744225191; x=1744829991;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n1wi01EF8Z0TS5kAzJp4gC5MlmlCKp8z1jxkmp6i2uY=;
 b=IkUb6siVLtsa27HFbTr+GcUS2/SJPn1WKT08pX6Ae9aE5mJpH67iVKMBUPqfURJ1R/
 yiwdGJ9wDmrVk5TZUiSEN04kUCtD+XubfkxEAVCI1v+RpGsXGGSQIbem2RgrWoU4BDAf
 oz6bZQWpLUvbi4p1tj3I3DlNS48wS7Evx/adUULCgD3+jmChC3TwLBzq9wOnE51E0SWc
 DnVmYAtr93a9P1dhmQtov3lbDRR06kNpk1Cuf2IOLjV5qyk8FEvlh58lrIKhzcYwKtZA
 gsu8G/kPN9uWST9ydJMvjE+7j9HE6vh39lbudpbkKkimHcDJeW4GDWpN2KbhgW8znrYr
 yygA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVr6A5pVv/TlNuCKD3noFzh3cIWMq4HD7GgH36Aj7nlAb0HdpqKR9ygGBs1cFftlDOx4PPjHDKoiJo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxhNg8CSJ8u7LtVORzrnoaTe6r1EZKk07Q9M6lwEH70A85ZmpLc
 ow2+Va8BBOLfYEVUHItRFe7E94l7u79Agv2maCBWRvRNXK21uJXf
X-Gm-Gg: ASbGncsBDZTziKOA8EKFUeF/Nb+uMqsF2P9dVQAr9gucseGOnD53YSxqmn7kUvwh5wX
 S+VGTdmgrs4F6Me3xV0uKyh6Fky5WD+FhYakdpyBc1u1ue/ZNKHxlhZk4gah05xEH/lIKkDQGrK
 IugHhYcg766qpV0wtkteDgWNAVFHeRI+OTh2RUAYawWYXIqQwTCvATLZh6aQVHv93yVBRjx+QgW
 x2eQY3FE6K6zPmKcE7WBNNP5mdDQZ9OWL3rSCVYodKS1EAU54VKmR2YKIzbzV+b21yaK07A89le
 bCmvpSjeWORRbjMWj1knBcfrBzoMDDbYkcFp14msZABIlYNqfIu+RjUqfu8nooIrTNX+12/Yk1n
 KY8w=
X-Google-Smtp-Source: AGHT+IECCxkkYx11FRXflSmygxg09UKvf+V06wtQrEcsVk2bA1aQzXREqWD22vkpXtX6pPvgieHcAA==
X-Received: by 2002:a05:6a00:22d4:b0:73b:ac3d:9d6b with SMTP id
 d2e1a72fcca58-73bbcc568a5mr921360b3a.4.1744225191359; 
 Wed, 09 Apr 2025 11:59:51 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73bb1e53e92sm1699061b3a.156.2025.04.09.11.59.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 11:59:50 -0700 (PDT)
Date: Thu, 10 Apr 2025 02:59:40 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org,
 joel@jms.id.au, eajames@linux.ibm.com, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.torokhov@gmail.com, mchehab@kernel.org,
 awalls@md.metrocast.net, hverkuil@xs4all.nl,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 louis.peens@corigine.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, johannes@sipsolutions.net,
 gregkh@linuxfoundation.org, jirislaby@kernel.org,
 yury.norov@gmail.com, akpm@linux-foundation.org, jdelvare@suse.com,
 linux@roeck-us.net, alexandre.belloni@bootlin.com, pgaj@cadence.com,
 hpa@zytor.com, alistair@popple.id.au, linux@rasmusvillemoes.dk,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kuba@kernel.org,
 linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 oss-drivers@corigine.com, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
 bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw, Frank.Li@nxp.com,
 linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org,
 david.laight.linux@gmail.com, andrew.cooper3@citrix.com,
 Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v4 03/13] media: pci: cx18-av-vbi: Replace open-coded
 parity calculation with parity_odd()
Message-ID: <Z/bDnLzcajzIxey3@visitorckw-System-Product-Name>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <20250409154356.423512-4-visitorckw@gmail.com>
 <25b7888d-f704-493b-a2d7-c5e8fff9cfb4@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25b7888d-f704-493b-a2d7-c5e8fff9cfb4@broadcom.com>
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

On Wed, Apr 09, 2025 at 08:43:09PM +0200, Arend van Spriel wrote:
> On 4/9/2025 5:43 PM, Kuan-Wei Chiu wrote:
> > Refactor parity calculations to use the standard parity_odd() helper.
> > This change eliminates redundant implementations.
> > 
> > Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > ---
> >   drivers/media/pci/cx18/cx18-av-vbi.c | 12 ++----------
> >   1 file changed, 2 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/media/pci/cx18/cx18-av-vbi.c b/drivers/media/pci/cx18/cx18-av-vbi.c
> > index 65281d40c681..15b515b95956 100644
> > --- a/drivers/media/pci/cx18/cx18-av-vbi.c
> > +++ b/drivers/media/pci/cx18/cx18-av-vbi.c
> 
> [...]
> 
> > @@ -278,7 +270,7 @@ int cx18_av_decode_vbi_line(struct v4l2_subdev *sd,
> >   		break;
> >   	case 6:
> >   		sdid = V4L2_SLICED_CAPTION_525;
> > -		err = !odd_parity(p[0]) || !odd_parity(p[1]);
> > +		err = !parity_odd(p[0]) || !parity_odd(p[1]);
> 
> No need to call parity_odd() twice here. Instead you could do:
> 
> 		err = !parity_odd(p[0] ^ p[1]);
> 
> This is orthogonal to the change to parity_odd() though. More specific to
> the new parity_odd() you can now do following as parity_odd() argument is
> u64:
> 
> 		err = !parity_odd(*(u16 *)p);
> 
> 
Thanks for the feedback!
Would you prefer this change to be part of the parity() conversion
patch, or in a separate one?

Regards,
Kuan-Wei
