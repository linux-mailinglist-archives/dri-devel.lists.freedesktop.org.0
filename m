Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C197F8865
	for <lists+dri-devel@lfdr.de>; Sat, 25 Nov 2023 06:02:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8871410E21F;
	Sat, 25 Nov 2023 05:02:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A30F710E21F
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Nov 2023 05:02:02 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-28041176e77so1957001a91.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 21:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700888522; x=1701493322; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1zU4LUKVhSEBAEyImAqsIdHza582cUZbQQkgImwexMQ=;
 b=fBShusRcuNO+uDF9rdpbjQS1mMCu7aiIE2TarqsHc9t5mbFO4VpYl42GNibGXx34CI
 fqdI9JXbcAATZF4bOTKtHtHv8wz6hvYd8UT00L7kSqti97yVh73XJdrOeVeyFtyy3wyM
 dI9ljYeMV6mnlXy5CkWwfCz2efY9kHAht+x0v8GS8TZt9sAcSzfefg8tUY3tJLQBN+bq
 lcvGkXp0kwUVdSt8exFVQq0+myfdzhT4ftFGPGSqoZUoq4NSFAVy4xF5gDLjaIb5RsJB
 AU8hsExmwPGRoDQF8eaKJ1D2hVnlzX6jaVjmU6WVTlBgUh+jwXbVH8CMZydchiuzxHM2
 Co8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700888522; x=1701493322;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1zU4LUKVhSEBAEyImAqsIdHza582cUZbQQkgImwexMQ=;
 b=vkXK4Qp5QhjcgDvl6URhvxbST2YkJwgJNAdeOhyrqgTZSb5M1ASZdvMRB7hPcuyH6g
 J8W5OqK0Yb4Q+hmyjkp7EVBDVgHBpBVrvrN5yfar8hdg/jTXRVQgG72xugkC+2Xxer29
 yQmKq4Lt1cIEUDulExDT0WfAQO8sD7OMKGondudiDfcBxUTaf5CN+z7eiBdcYCufSpb6
 sxnMqQg6CebTqUnGTdLWgBnK6YtEoK6rs3rvxmrJSTSbCNngOoXNTEQ2Au4Vfe0JqOdY
 fLUI7xP8ABCqZIxepqHmbBwqXF6rN0k33Pw3WAiU8VLMoKQy7XH1FxJKIhy90cprKXQ0
 U0Bg==
X-Gm-Message-State: AOJu0Yxcn7mLInKvhf/L0O+HwdhREY+cqdHloEMKG3SStKeiEUW3OTBX
 2Y0Qcl2BeXkZTh6Wh6tMJgw=
X-Google-Smtp-Source: AGHT+IG1IDjtyfsrrILxO18zuVqQT7XqP8yMv76aZUE10M3VFt0iss8rhyKJKH/e41UIHwf3Slp0HQ==
X-Received: by 2002:a17:903:228c:b0:1cc:ec21:9a64 with SMTP id
 b12-20020a170903228c00b001ccec219a64mr5277780plh.17.1700888521800; 
 Fri, 24 Nov 2023 21:02:01 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:8b5c:82d0:578f:d0])
 by smtp.gmail.com with ESMTPSA id
 ba8-20020a170902720800b001c7443d0890sm4029794plb.102.2023.11.24.21.02.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 21:02:01 -0800 (PST)
Date: Fri, 24 Nov 2023 21:01:58 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Alexey Makhalov <amakhalov@vmware.com>
Subject: Re: [PATCH 4/6] input/vmmouse: Use vmware_hypercall API
Message-ID: <ZWF_xnotegtBElA5@google.com>
References: <20231122233058.185601-1-amakhalov@vmware.com>
 <20231122233058.185601-5-amakhalov@vmware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122233058.185601-5-amakhalov@vmware.com>
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
Cc: pv-drivers@vmware.com, dri-devel@lists.freedesktop.org, namit@vmware.com,
 hpa@zytor.com, timothym@vmware.com, dave.hansen@linux.intel.co, x86@kernel.org,
 mingo@redhat.com, linux-graphics-maintainer@vmware.com,
 linux-input@vger.kernel.org, richardcochran@gmail.com,
 virtualization@lists.linux.dev, mripard@kernel.org, akaher@vmware.com,
 jsipek@vmware.com, tglx@linutronix.de, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, bp@alien8.d, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 22, 2023 at 03:30:49PM -0800, Alexey Makhalov wrote:
> Switch from VMWARE_HYPERCALL macro to vmware_hypercall API.
> Eliminate arch specific code. No functional changes intended.
> 
> Signed-off-by: Alexey Makhalov <amakhalov@vmware.com>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Please feel free to merge with the rest of the series.

Thanks.

-- 
Dmitry
