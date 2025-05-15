Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8E0AB7D95
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 08:11:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D472810E158;
	Thu, 15 May 2025 06:11:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FnR2lEy3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6917C10E158
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 06:11:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D30AD5C06A5;
 Thu, 15 May 2025 06:08:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DFB8C4CEE7;
 Thu, 15 May 2025 06:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747289458;
 bh=uwAvIOKiGNt0V7PmuDj4HchROm9VjBjY9WBKCBQ84Vo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FnR2lEy3OYI8L29u3+QfR6kLHNYG5uKVEXFva5ImXpzBPvUaO6my2Aw3g3HOBWdlk
 Uf3VH8l98Ytodmjo29W9o3aHMa7N4L4CHr3H1aLyt2aeedcu8pYXLEHde9ihwiugD3
 F87YccKQCix44dQYaFuguQYij4bpo2xQ1czzJDceerUYkpZG1Tna25e5M8OYarjLDS
 FxcR3pTAC5l+fp6mesqZz9wJKoqwoBjqBb9LKjmudVy15r3PXs4Y8xg+Opyc6dS0/P
 LeeknhiFPRP+nli03LtsMR04uyawJKPPGjCH0Ldj3HvxNdyEdU3JLnmYaeKWjJEGJw
 OyOUetgHd11Dw==
Date: Thu, 15 May 2025 11:40:45 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Apurupa Pattapu <quic_apurupa@quicinc.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 05/11] firmware: qcom: scm: add support for object
 invocation
Message-ID: <aCWFZchX9nbZOC89@sumit-X1>
References: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-0-6a143640a6cb@oss.qualcomm.com>
 <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-5-6a143640a6cb@oss.qualcomm.com>
 <aCRkRTMFi65zBODh@sumit-X1>
 <CACMJSev2qqnxLN6OiSEKhUqxeewY09to0Jd2oPNoE39YFS6i3A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACMJSev2qqnxLN6OiSEKhUqxeewY09to0Jd2oPNoE39YFS6i3A@mail.gmail.com>
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

On Wed, May 14, 2025 at 05:27:44PM +0200, Bartosz Golaszewski wrote:
> On Wed, 14 May 2025 at 11:37, Sumit Garg <sumit.garg@kernel.org> wrote:
> >
> > Hi Amir,
> >
> > I am still unable to get the QCOMTEE driver to work on db845c. As I can
> > see machine: "qcom,sdm845" is not supported for tzmem based on SHM
> > brigde here: drivers/firmware/qcom/qcom_tzmem.c +81. I am still seeing
> > following logs from userspace:
> >
> > # /mnt/unittest -d
> > [test_print_diagnostics_info][31] test_get_client_env_object.
> > [test_supplicant_release][65] test_supplicant_worker killed.
> >
> > I think you should first check here for SHM bridge support. If available
> > then only add a QTEE platform device.
> >
> 
> On platforms not supporting SHM Bridge, the module should fall back to
> non-SHM mode. Isn't it the case?

Okay, I see. Amir clarified offline how the non-SHM mode works.
IIUC, the memory registration with QTEE is not required and instead QTEE
can directly work with memory references being passed as part of object
invocation.

So it looks like the user space app not working on db845c is another
issue with QTEE which needs to be fixed. 

-Sumit
