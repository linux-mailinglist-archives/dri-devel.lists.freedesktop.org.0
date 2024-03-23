Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C6D887926
	for <lists+dri-devel@lfdr.de>; Sat, 23 Mar 2024 15:53:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33AC010E555;
	Sat, 23 Mar 2024 14:53:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="mfrEyhHM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D19F10E555
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Mar 2024 14:52:58 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id
 6a1803df08f44-696499bd61eso30196816d6.0
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Mar 2024 07:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1711205577; x=1711810377;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=PQy0LgbNRS2IUlbgbrbirFDizWSucGasGxIZDrnu8QQ=;
 b=mfrEyhHMk2ojiwFiBd0KfwefIhiSc+2mfbA1yD+TnwWNP16E1qJYNa+ht0fTD+BKUv
 2pisD68T7Az/OTr1s7ZWnsRHKNPl/gsZzvGYO9tpQR/o+XO0a2XZYwAD9WaoiG3Loohj
 Kl+xG0jADd3atlbu349O6myW4Bd1ggd9bnoJdUW2E1cigPTflAEwY8oVlCbHHen1zDg/
 oZhlPead63vw1b2fwen1klRu7lnCRfCWQIRfHeDXZ1CPbksifgl1c7uEmA1s/zg7oBp8
 YXEAFVV6DvxGjKTfBvsyw34Ie9Qnv61AKaKu7CSFgYmDPYmKuPOjbZTbTFkd22ZhOHxW
 pI/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711205577; x=1711810377;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PQy0LgbNRS2IUlbgbrbirFDizWSucGasGxIZDrnu8QQ=;
 b=RYwNRknv+BOVL9BofACXHLnsiN4LGBE2OkTGyIKLt3MFz/QxWH3BLltWxMZuClhhsV
 wNp2trBL8bwL8IfEOFrkJ3e8Ssu23c1zQw6doQp1jQulPZ/reEmDHgquM86Xl+i2aIT1
 GrOFLOmaU5wMN9vpBgNxmOC8AQEfcjFzS+se1WWdgkGjNxfSKpjJ5KdmuARr49xOqp1l
 WkeIF0f94aMm1KOhg9KBMTg4ThmopzSU/PKi8AV10SLskuxvIL1eS9gC6OH7zRo8zENJ
 /NmGHTnOEu8iRgnYd6e/iC+wOlwHRMQJd/Upb8GUaEUsWgqMbfUl3eK8ujwi+bXspwBe
 BvQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1V7uyRi3Yi0068xVXsBbdQuWqifaz0Qo1wnyvUHSUvuEY2vSr6S27q4nXPO+ylB9mZ7wETBXqXDgqjiwQ4OOm3FatVSfHlMD9+QJh6/vr
X-Gm-Message-State: AOJu0YxrwX45mWQxGfqsVKTRCm+Cjh4lfCHN+8OSrLxECZXi8g5LNBb7
 D+9Alxg0b7CQSuXR6udfontij8X0hwiDyz7VObj6wZ6bXIHHIpRErBBWt2jT5M8=
X-Google-Smtp-Source: AGHT+IFLG11WgqsbhoxFVFpmyCIi7a1JxwIH7NvINLJUVPYcY+qqhDilTzhgQ5CdvjOQ3ISsPU74LQ==
X-Received: by 2002:a05:6214:4017:b0:696:8505:1947 with SMTP id
 kd23-20020a056214401700b0069685051947mr20765qvb.30.1711205577232; 
 Sat, 23 Mar 2024 07:52:57 -0700 (PDT)
Received: from localhost ([2620:10d:c091:400::5:16be])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a05621419e100b006968077890csm298604qvc.118.2024.03.23.07.52.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Mar 2024 07:52:56 -0700 (PDT)
Date: Sat, 23 Mar 2024 10:52:47 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 "Sharma, Shashank" <Shashank.Sharma@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/amdgpu: fix deadlock while reading mqd from debugfs
Message-ID: <20240323145247.GC448621@cmpxchg.org>
References: <20240307221609.7651-1-hannes@cmpxchg.org>
 <c411dce6-faaf-46c3-8bb6-8c4db871e598@gmail.com>
 <20240314170948.GA581298@cmpxchg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240314170948.GA581298@cmpxchg.org>
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

On Thu, Mar 14, 2024 at 01:09:57PM -0400, Johannes Weiner wrote:
> Hello,
> 
> On Fri, Mar 08, 2024 at 12:32:33PM +0100, Christian König wrote:
> > Am 07.03.24 um 23:07 schrieb Johannes Weiner:
> > > Lastly I went with an open loop instead of a memcpy() as I wasn't
> > > sure if that memory is safe to address a byte at at time.
> 
> Shashank pointed out to me in private that byte access would indeed be
> safe. However, after actually trying it it won't work because memcpy()
> doesn't play nice with mqd being volatile:
> 
> /home/hannes/src/linux/linux/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c: In function 'amdgpu_debugfs_mqd_read':
> /home/hannes/src/linux/linux/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:550:22: warning: passing argument 1 of '__builtin_dynamic_object_size' discards 'volatil' qualifier from pointer target type [-Wdiscarded-qualifiers]
>   550 |         memcpy(kbuf, mqd, ring->mqd_size);
> 
> So I would propose leaving the patch as-is. Shashank, does that sound
> good to you?

Friendly ping :)

Shashank, is your Reviewed-by still good for this patch, given the
above?

Thanks
