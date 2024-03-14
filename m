Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 177CB87C2E8
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 19:41:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96F3910FCD7;
	Thu, 14 Mar 2024 18:41:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="dYYTe1XJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD7FE10EC23
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 17:09:58 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id
 6a1803df08f44-691583aebc7so4189096d6.3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 10:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1710436197; x=1711040997;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=wq3tDY8BbJifWyupgIyZpzh/9hWKNCkxl+BfruynXAQ=;
 b=dYYTe1XJU2M6Oz5ItN9uVdmRBCN8g8yCZFLPcCqbUuGVtA9frFsyByCCDSAoKGbypm
 ZVFqw2l32Vqebi0QaRzga3HaYVIBGZB6my60BL1Tb9IsAwqDjUSRVz4Qk1dZoEcdYxk3
 5tV0xm4ldx2CAW8TyMq6sUbagB51Zc6maBXYVDJG42Ci84/PkfnklzWVkugJ2dogsKMh
 4hJhpGOJtXpGwjAEGlRwmdMf4vzPo73n90x8BN9KpuBsQqWxAazFeDxYYWqGPkDLL69y
 cG0Cc6/gojglVk9ONICIXnlai4ZsDBE//wcZBPW35xQyX9krmVA9mqY6s3vqpGUqmlRF
 DTkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710436197; x=1711040997;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wq3tDY8BbJifWyupgIyZpzh/9hWKNCkxl+BfruynXAQ=;
 b=F8hNwvyo4Gs8IYbmGA2bwyTYw80sXwzw9oUg3zH2+Ncvr/Si14OuPxq4g55DfiAkTP
 4hSIDp1uqYrIDS4P67wX/68gSA3l//stuumxgJmg0cbHTBWCrvmfh9Q+oaFaJPn1fcC4
 IADgrVgiemLfaIV2+8cGcvB2hXXALzt06OsVkEqL3PIJF9dhP0yGVm0sIiyvIsXL5uIo
 S0HIVD8k1VJLsjRNf7+1OL7UVOdAPVVg9tfmNJbtdxmACx9QSVhkPYkqf9w4EPzbGKs9
 kT/0zwGbwwKUVAowX0K88ZMM7U5vwSAbfUCPMB2Pfh8HEOwr+p9G9fLSG+dhxJEUQ2sz
 RAIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEi6F0YvoUlmqAj0MTmuOG7oqu9/X3IyQDEqw4t3Z6KrbKplOHhrBzYGX+hKLFAwaM18hBz53O50BtZlRUJ1iXK0XtXsBz5KnGF5OuxsWS
X-Gm-Message-State: AOJu0YxxBTMivuayLFseO4hBOCwWaSBkCE8cIY91iFhpfMJIm53uXaur
 3ITafhKbGB3I7qUQtywHRv4x5IinZCsREE6seMt6WyhoIn8Vgiwh+AEe31j/qTU=
X-Google-Smtp-Source: AGHT+IG9aYKr3SLrUEGgyDZji2FG4IGp3KCRhhwIdIrak8oLuo4wulKWroEURFFbiWSVw95P6gj41A==
X-Received: by 2002:a0c:d989:0:b0:691:6dd8:4606 with SMTP id
 y9-20020a0cd989000000b006916dd84606mr65545qvj.30.1710436197410; 
 Thu, 14 Mar 2024 10:09:57 -0700 (PDT)
Received: from localhost
 (2603-7000-0c01-2716-da5e-d3ff-fee7-26e7.res6.spectrum.com.
 [2603:7000:c01:2716:da5e:d3ff:fee7:26e7])
 by smtp.gmail.com with ESMTPSA id
 z10-20020a056214040a00b00690d951b7d9sm700131qvx.6.2024.03.14.10.09.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Mar 2024 10:09:56 -0700 (PDT)
Date: Thu, 14 Mar 2024 13:09:48 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 "Sharma, Shashank" <Shashank.Sharma@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/amdgpu: fix deadlock while reading mqd from debugfs
Message-ID: <20240314170948.GA581298@cmpxchg.org>
References: <20240307221609.7651-1-hannes@cmpxchg.org>
 <c411dce6-faaf-46c3-8bb6-8c4db871e598@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c411dce6-faaf-46c3-8bb6-8c4db871e598@gmail.com>
X-Mailman-Approved-At: Thu, 14 Mar 2024 18:41:51 +0000
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

Hello,

On Fri, Mar 08, 2024 at 12:32:33PM +0100, Christian König wrote:
> Am 07.03.24 um 23:07 schrieb Johannes Weiner:
> > Lastly I went with an open loop instead of a memcpy() as I wasn't
> > sure if that memory is safe to address a byte at at time.

Shashank pointed out to me in private that byte access would indeed be
safe. However, after actually trying it it won't work because memcpy()
doesn't play nice with mqd being volatile:

/home/hannes/src/linux/linux/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c: In function 'amdgpu_debugfs_mqd_read':
/home/hannes/src/linux/linux/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:550:22: warning: passing argument 1 of '__builtin_dynamic_object_size' discards 'volatil' qualifier from pointer target type [-Wdiscarded-qualifiers]
  550 |         memcpy(kbuf, mqd, ring->mqd_size);

So I would propose leaving the patch as-is. Shashank, does that sound
good to you?

(Please keep me CC'd on replies, as I'm not subscribed to the graphics
lists.)

Thanks!
