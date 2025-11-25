Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B8EC874FD
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 23:28:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB04310E49C;
	Tue, 25 Nov 2025 22:28:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mGeDMHjf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B9D710E49C
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 22:28:33 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-42b32ff5d10so165124f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 14:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764109712; x=1764714512; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eCUVexFsXDWoIit+VMfgiiB5w9tt++PEcFHBr9yJ/KQ=;
 b=mGeDMHjfvcRjnBAs4kspkRqF+nRikOAM0n6+w/15WMBKS8vv2tSWmuP1SeV2hvESPz
 vKQoVG1rBI2cnayAfyXHHmrfkZz7VTpwcb3x50FjjXYiwsCxt4i8imKEoaDn6Gm84MKH
 5RY+SLXvV6jhjQoyI6UF8YcTWGNTbW/+8g/tK45nkAG7GoBWvyWgP1D6SnoQJA7pgiSK
 WzYCjOwzPALZFC0AxEGFqaM77u2k+y/L8UbCIC4hzcII/EVNpsypAtyeyZO7zGKiWzzP
 okqtYlTWWtz86V0pXi8uEIfbVcZVCQ1eCIx7LADOuroawIQihvky5aA6VtV3q8AMQgHC
 R0DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764109712; x=1764714512;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eCUVexFsXDWoIit+VMfgiiB5w9tt++PEcFHBr9yJ/KQ=;
 b=R8b7NSEnjF9fO8r/usZ7r2gvZUkcyL2GhM2dIucvQL7t8QLys01vWM16jsYdXXEFGd
 6ALYwXPdbwev1d6VwYzE3Po8RA1B0ATQVIgg/RlENr6c4rS+LIyhJXqZQOjtvOGTNsy7
 aBWqYHX+cO/CWwG8IbxKFPPWi3/Go/OPifQ2gxXjM9kTYgFAMDBjnVnxP86iXN9miS/p
 1OQ46VSMDyxuUYGeFopCqz7N+i19ZeZ25dBeuxMGb+8b+FRT2c96ZPX8ypvBluTS9os/
 /RASMIhwnijjnY8vIiMcWBUdayVG8Jb2u7ADJXNeJhDswkh92Q6DGUj9Uo1GtdRAuVlJ
 s2oA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHyCWqar+4tQR45+vbMIQflqCSjBqD5BZlBxg1H58SBIwUu1NJkTcMEwEHL1m7VzXpvmdvreYJPVo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRHqcEXzq6XN6zabm9R3WkI6unUSSHmpljV5hTqz3OXnyN6zI4
 SSsZO7ecwcD5dJJ3lCO7IvZjo6RyDl29zBPd4cmfkMBGFQKPDvJ3osKa
X-Gm-Gg: ASbGncsyfehdBdQOE52wIkpJLCAJalRYrDQgCJwNhlKY2nTVsTL0T+M3ond6vbK3M2s
 Xdzr0U5MktKn//yiRlAKzQhmAUlLidR4hJBhRJEYr10RN7DK0W0qzwN2sJJiHkvuGuEVzduahLw
 YBE3qeHCYEHi5CNRppBk0K34CwYDjAFE5wSgVyQzTRbrJIt/Oy5GJTtF8x8niaBty/0w1qHXji7
 X5e2qcXeYHdPFXIzUhk/cHbguzJqr2a4DXls6W9LHYuh8XJJb8gL+sbQNvG7gLHyS8R+c60N3Pz
 9EdMrmOQjxo0YKmJLV7clqAz2KsFtqITsrenwyqPRjaJgjeo5ZosnQFNgxC5goLVXDnR50BRMNg
 zpJlvusmcDp+gaYIDEIf0Ja0IDUodFdHkojpUITbAifPdAFowsA9hw/ju14lM9iA3BhUcX8Bf/s
 r7kbf0h+VjvhCHnw2Ioa1EfN20CNWW2s3CsjEn/BU3GCSw+xmYsRawNiqDFfUeU2w=
X-Google-Smtp-Source: AGHT+IGRix9H0ebsIu500KvnYNHS6p/T/0zRkM2JsHUpkoNOlZZtTgVh8WwiYXJTe0DH725xppC7Dw==
X-Received: by 2002:a05:6000:3101:b0:42b:3455:e4a1 with SMTP id
 ffacd0b85a97d-42cba7a3381mr24934723f8f.15.1764109711807; 
 Tue, 25 Nov 2025 14:28:31 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7f34ff3sm37550260f8f.16.2025.11.25.14.28.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Nov 2025 14:28:31 -0800 (PST)
Date: Tue, 25 Nov 2025 22:28:29 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
 troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com,
 ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] accel/qaic: Fix mismatched types in min()
Message-ID: <20251125222829.28ea138a@pumpkin>
In-Reply-To: <aSYMb4EKFCaYrWTI@black.igk.intel.com>
References: <20251015153715.184143-1-youssef.abdulrahman@oss.qualcomm.com>
 <aSYMb4EKFCaYrWTI@black.igk.intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 25 Nov 2025 21:07:11 +0100
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> +Cc: David
> 
> On Wed, Oct 15, 2025 at 05:37:15PM +0200, Youssef Samir wrote:
> > 
> > Use min_t() instead of min() to resolve compiler warnings for mismatched
> > types.  
> 
> I believe it's the opposite to what has to be done here.
> At first glance it should be umin(), but I Cc'ed David
> who is the expert in this topic.

The old code should compile fine - and did for my x86-64 'allmodconfig' build.
Both values are 'unsigned' types; one is u64 the other 0xfff0u - so unsigned int.

What are you compiling it for? and is it an old kernel with the old minmax.h?
I think the new minmax.h has been backported to quite a few of the stable kernels.

The correct 'fix' for the old min() is to change the type of SAHARA_READ_MAX_SIZE
to be u64 - the same as the LHS (so 0xfff0ull).
This probably has other repercussions.

Just adding 0ull will change integer type without any danger of changing the value.
so (to me at least):
	min(dump_length, SAHARA_MAX_READ + 0ull)
is actually much better than a (u64) cast.
(even if the value is a pointer, it is still one afterwards...)

But this shouldn't need changing for the current kernel.

	David

> 
> > --- a/drivers/accel/qaic/sahara.c
> > +++ b/drivers/accel/qaic/sahara.c
> > @@ -615,7 +615,7 @@ static void sahara_parse_dump_table(struct sahara_context *context)
> >  
> >  	/* Request the first chunk of the first image */
> >  	context->dump_image = &image_out_table[0];
> > -	dump_length = min(context->dump_image->length, SAHARA_READ_MAX_SIZE);
> > +	dump_length = min_t(u64, context->dump_image->length, SAHARA_READ_MAX_SIZE);
> >  	/* Avoid requesting EOI sized data so that we can identify errors */
> >  	if (dump_length == SAHARA_END_OF_IMAGE_LENGTH)
> >  		dump_length = SAHARA_END_OF_IMAGE_LENGTH / 2;
> > @@ -663,7 +663,7 @@ static void sahara_parse_dump_image(struct sahara_context *context)
> >  
> >  	/* Get next image chunk */
> >  	dump_length = context->dump_image->length - context->dump_image_offset;
> > -	dump_length = min(dump_length, SAHARA_READ_MAX_SIZE);
> > +	dump_length = min_t(u64, dump_length, SAHARA_READ_MAX_SIZE);
> >  	/* Avoid requesting EOI sized data so that we can identify errors */
> >  	if (dump_length == SAHARA_END_OF_IMAGE_LENGTH)
> >  		dump_length = SAHARA_END_OF_IMAGE_LENGTH / 2;  
> 

