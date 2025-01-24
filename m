Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38517A1B683
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 14:01:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9974310E975;
	Fri, 24 Jan 2025 13:01:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Kb28bA1Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9283710E975
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 13:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737723657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vo3fTWya9tHycVPx5tFin/qFgljd4EcPY6jTqMY9tdU=;
 b=Kb28bA1QHMrxWBuiHNiQuOhx2YsUYIn/FiJguQIEc6RRzFzL2pz27ppRBnY6PKEVdOwcIX
 vIsHFDDaON+PQBY5K9KUPDODrinF331C/idy7rzLWdyaQwXL4Ddwv3p1EqMtCQBO08/6J+
 9xYoi7U+1w5kQM4jRsiC9bgQOTfMgRI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-5x2naxpAMJiObtbpbFxH7g-1; Fri, 24 Jan 2025 08:00:56 -0500
X-MC-Unique: 5x2naxpAMJiObtbpbFxH7g-1
X-Mimecast-MFC-AGG-ID: 5x2naxpAMJiObtbpbFxH7g
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-38bee9ae3b7so1343539f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 05:00:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737723655; x=1738328455;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vo3fTWya9tHycVPx5tFin/qFgljd4EcPY6jTqMY9tdU=;
 b=np+/S8SrEUT86Sj1E6vjd8NmM+HakF78P9PdGnQTCMoCgZ+jnoAgktmiCOcHLdi41D
 B7QrByL0NWm86BtBiR1dxRUccpxXQmoZzGHd98pDvqFT3XMU9N9JNp1GpTwP5TYTqa73
 G47fHk9qapQ2KGI/Z602SUZgoukBL7i7EOJDoL5kHgvPYIb50rGyqP4zLcyIPJYS0x/U
 K7w5i2uj517G1diDfgfzDzYrWKHAT2RxA7c6yYQ5WrbMeUVngTMRXlB6vWGGkfljn4bW
 +DkPNBJjY+xlrqrBNJBgjcf7fyG48EczALLSdRMEn8BFrGbrPUZBNFTlkyAsdvqKrhXN
 BkJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqwKO8tVYcEZJHmbe5rsGDkVZeKTN2YPd6bwaO0msUqfSsTskj60fxZ8VYMvg+72i8pW9u+ACRfGE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxIyGuD0V8DDPQn1/ti6hN+VHF5E+BJvlvlWNGDGKcS8pIc4gb8
 GI3K3WncUrlCwVL38PltvvK5OsjD6Rq2yGGFdkv5huMqm1/cE6PvUDRYkJe1IS3h7X5bDySWmTI
 eQu25Kb7tRw0VaIsvOkDCnTh1pfQVt53Cbk6z8DfC9aejkVvjSAef7amZ9Dn76JBPZQ==
X-Gm-Gg: ASbGncu4XxEySl9M8BNEOXG9/cvUMwotK3ehXMn8/E3INrzYZzunCHU6KccvN8/XQvS
 Y09aDpt99Cd/KvPJLgsk21vz81vw8CkgK7UT+dbmPRfGlalLPdU9TaQVcgGJvtFPkIy5kXE++ZN
 W7i+pL3CfmDF4hZqi/wOpJkEm9uy54ND33J4wQfFxfG25PgUK0CkxIOJgc5LrS9TvCV4WpnMc5E
 RrGNUFqvk4H3E3YD8QwRrCHlhuljvRnIRSMVAPdGqp63P7aTPC8Y71nzeHVslEUBo6ogClJsfwD
 vCsgYycMt+WQWZiuKs7Li4CfKENrMTbHwFq52M6/ng4DcQ==
X-Received: by 2002:a5d:5f54:0:b0:385:fa33:29ed with SMTP id
 ffacd0b85a97d-38bf57d2cc4mr26674311f8f.47.1737723655053; 
 Fri, 24 Jan 2025 05:00:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7O6kDxKgj8QXof6pkh0HnABdfU01AfCfVNwm0lMd0ZfNC4JqKT86eG7V6rVx2a63lUIXoHw==
X-Received: by 2002:a5d:5f54:0:b0:385:fa33:29ed with SMTP id
 ffacd0b85a97d-38bf57d2cc4mr26674235f8f.47.1737723654623; 
 Fri, 24 Jan 2025 05:00:54 -0800 (PST)
Received: from [192.168.0.167] (h-185-57-5-149.na.cust.bahnhof.fi.
 [185.57.5.149]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd4857cesm25657015e9.13.2025.01.24.05.00.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 05:00:54 -0800 (PST)
Message-ID: <298675d0-ba19-4c87-b00d-57a5e31b05b6@redhat.com>
Date: Fri, 24 Jan 2025 15:00:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] kci-gitlab: Introducing GitLab-CI Pipeline for
 Kernel Testing
To: Jarkko Sakkinen <jarkko@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 =?UTF-8?Q?Leonardo_Br=C3=A1s?= <leobras.c@gmail.com>
Cc: Vignesh Raman <vignesh.raman@collabora.com>, kernelci@lists.linux.dev,
 linuxtv-ci@linuxtv.org, dave.pigott@collabora.com, mripard@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kselftest@vger.kernel.org, gustavo.padovan@collabora.com,
 pawiecz@collabora.com, spbnick@gmail.com, tales.aparecida@gmail.com,
 workflows@vger.kernel.org, skhan@linuxfoundation.org,
 kunit-dev@googlegroups.com, nfraprado@collabora.com, davidgow@google.com,
 cocci@inria.fr, Julia.Lawall@inria.fr, laura.nao@collabora.com,
 kernel@collabora.com, torvalds@linuxfoundation.org,
 gregkh@linuxfoundation.org, daniels@collabora.com,
 helen.koike@collabora.com, shreeya.patel@collabora.com,
 denys.f@collabora.com, nicolas.dufresne@collabora.com,
 louis.chauvet@bootlin.com, hamohammed.sa@gmail.com, melissa.srw@gmail.com,
 simona@ffwll.ch, airlied@gmail.com, Tim.Bird@sony.com, broonie@kernel.org,
 groeck@google.com, rdunlap@infradead.org, geert@linux-m68k.org,
 michel.daenzer@mailbox.org, sakari.ailus@iki.fi
References: <20250123135342.1468787-1-vignesh.raman@collabora.com>
 <f779c9af4133629f724e366241fab7421d13d227.camel@gmail.com>
 <20250124081250.GA24731@pendragon.ideasonboard.com>
 <D7AAOSNDJV11.AXVF80Z934BK@kernel.org>
From: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
In-Reply-To: <D7AAOSNDJV11.AXVF80Z934BK@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RBpVjZdbXQxPmZp8TlKt2AHWyz348McQnM4JknkerlQ_1737723655
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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

On 1/24/25 2:16 PM, Jarkko Sakkinen wrote:
> On Fri Jan 24, 2025 at 10:12 AM EET, Laurent Pinchart wrote:
>> Gitlab as an open-source software project (the community edition) is one
>> thing, but can we please avoid advertising specific proprietary services
>> in the kernel documentation ?
> 
> I don't think we should have any of this in the mainline kernel.
> 
> One angle is that "no regressions rule" applies also to the shenanigans.
> 
> Do we really spend energy on this proprietary crap to the eternity?

This is not getting included into the kernel itself, the contributed code is,
of course, open-source. And yes it would execute just fine on the fully
open-source community-edition GitLab. I don't think "no regressions rule"
should apply here. This is for developers only, and is a template for making
your own pipeline mostly, with pieces which can be reused.

Nick

