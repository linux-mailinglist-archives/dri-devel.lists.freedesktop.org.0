Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 758B8C9281C
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 17:07:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5672D10E735;
	Fri, 28 Nov 2025 16:07:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="E1u8bpBH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 155CB10E735
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 16:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764346028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bZy7R+pUhNnAxYbDd9Nal/7PKahT9rfxVvsH8RmVk6k=;
 b=E1u8bpBHJthQVD97W/PH5rtWn+/N9A3t83hQD0tky+/yP1LagGrtLMs20yUFJ7pXS+DbgL
 L1u9l5DMKiV8GbGkx4iCg46bixYz1oqA3n1KhKbkS3o8S6kwgFK4OFJot8d7q/atSa3dMh
 eAwvSNTBMPo6gfSD8Z/fIKimET9EiiU=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-373-fqY0_V3GPjOF1pLxt8HxJQ-1; Fri, 28 Nov 2025 11:07:07 -0500
X-MC-Unique: fqY0_V3GPjOF1pLxt8HxJQ-1
X-Mimecast-MFC-AGG-ID: fqY0_V3GPjOF1pLxt8HxJQ_1764346026
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-37bab6de7f8so6271601fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 08:07:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764346026; x=1764950826;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bZy7R+pUhNnAxYbDd9Nal/7PKahT9rfxVvsH8RmVk6k=;
 b=BF23xPgZm5yjp2fQlhfG0HW6rPj+T5Z23MF7lHaPMVEC8mlkzurioHXU95NZUWhWem
 SElhcgc71EBxA9INwMz0zuctKWWasROHnJxz0KLFvHIFAbWIXbLQPqU///t039eGUK/S
 0lscdyAUBwmWZoyfIAjzXpVbEB8zpeGQHkFXgMk5aufPcgAaQAXqyUTwR+UZHa23BXmg
 XNIo19Ir+P1ejfHGT7YxYLKs8WUUy+yKcXKmCtONqPdTOViafoobRC4vTRxUaaLApaeQ
 FHnXx0186qDWPP/FcPBWpoZZy/GR8ijJPaz7JItxn82WGD2Bt/7A8qZwaposDnT9FHeH
 D1Jg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTzEO2OLnM9AVJvhW3p0KW8sgXFAVZkODrPjFlFsxV298YlfDLO1ZcQN7dzpucvePFjE1eamJrQlE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCL2u96OvJexs52NdyTWPQiAiuSpwCQ+IZFsjrrNBMu+Kl64CE
 GPkc4tx9uwMOTnC91IIv3fBnHNekBhIgnSlgu2z35PpStZVESKBInQmkIlrBaQTJqDxmYkdkLBI
 TF6vA8iSyXn6+x7v3lrB0M0a5q/RvBP3aN1S/ROSiCN1Tb6l4WVy7F83DGSnrN98Bovql
X-Gm-Gg: ASbGnctiU6E601IOcVdMQjliRxxvH46bpyS+sNqimHGCeG7cdo4kLECw+MEaEwO09ta
 yJj/sJZX0kzs/aRpMtb/DDUs2mJLywsJvIiU00z7iWHygXihZ4GTWoHvg+3qPxK5ZOXwvPJJM0K
 BjWk91VeN2iyVcXM1yvKLf1pIsWsFGS8gcvJ/+mtCVhr2aEA/SIiyKwfMQPn1EJg/0rJtwDDVZa
 /9HFhGQo0daGDVFc6QKrMDWlxEqQ03NBpH8e+b9pbvt1HIGZ7sWPNrWmsdR2oaSHYXKPwAl3nVI
 FYAePeyScBnZfx5rKLsaEQEsB4baYStLYxh/JwTLh2SGG7MWcjfLS/KqeJrZyFgUzxrN8VO5Vh3
 uqYqHa4cacGp6rGyzMLZAlevjaZdi1x0BQh4=
X-Received: by 2002:a05:651c:31c5:b0:36d:114b:52e2 with SMTP id
 38308e7fff4ca-37d0790d453mr40868351fa.34.1764346025778; 
 Fri, 28 Nov 2025 08:07:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHaeDrW3aE2rJtyHnJXLuP6JMIkjJMIi3csdxl+Xm82rf0LDd0NXyBgcu2qlQnEwf+K3Fttpw==
X-Received: by 2002:a05:651c:31c5:b0:36d:114b:52e2 with SMTP id
 38308e7fff4ca-37d0790d453mr40868151fa.34.1764346025292; 
 Fri, 28 Nov 2025 08:07:05 -0800 (PST)
Received: from [192.168.1.86] (85-23-51-1.bb.dnainternet.fi. [85.23.51.1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37d240ec1fasm11118901fa.36.2025.11.28.08.07.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Nov 2025 08:07:04 -0800 (PST)
Message-ID: <584671b7-f1a5-4e9b-af94-3e284b3edcf3@redhat.com>
Date: Fri, 28 Nov 2025 18:07:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/6] Remove device private pages from physical address
 space
To: Jordan Niethe <jniethe@nvidia.com>, linux-mm@kvack.org
Cc: balbirs@nvidia.com, matthew.brost@intel.com, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 david@redhat.com, ziy@nvidia.com, apopple@nvidia.com,
 lorenzo.stoakes@oracle.com, lyude@redhat.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com, jgg@nvidia.com,
 willy@infradead.org
References: <20251128044146.80050-1-jniethe@nvidia.com>
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
In-Reply-To: <20251128044146.80050-1-jniethe@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4pAEBc2ZLHVr_fRmcnX9eAHVS2vaLm5ujfbGQFC8lHk_1764346026
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

Hi Jordan!

On 11/28/25 06:41, Jordan Niethe wrote:

> Today, when creating these device private struct pages, the first step
> is to use request_free_mem_region() to get a range of physical address
> space large enough to represent the devices memory. This allocated
> physical address range is then remapped as device private memory using
> memremap_pages.
>
I just did a quick read thru, and liked how it turned out to be, nice work!

--Mika


