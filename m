Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3D897C234
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 01:41:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D045A10E1CA;
	Wed, 18 Sep 2024 23:41:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ELXhnBVx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BDDE10E1CA
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2024 23:41:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B9BCA5C59C5;
 Wed, 18 Sep 2024 23:41:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 152A5C4CEC2;
 Wed, 18 Sep 2024 23:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726702866;
 bh=1C9SOnuSnT0Tp2Ar3WNtQJeS14t2wGBYD8udyPCVaVg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ELXhnBVxw4G/RXl2OyNr+TWbOLLOjj+gcsFRxt2tUfENFHm0h2RUWSaV6Kp2OXkht
 GXrG/3JCH/2tSS3zP8btrv47tKs5dzvGnwmjIRmAsaRqXYFnSbxWxggMyPN54GwgWK
 PF6/k87RHoO+qh/75yGfONrwu5tTWPDxCPzhWTgOueGz2wk9h5uTGn5duDLc27r6Pu
 Pbw7gCMpyhuIufLnvGUflgtYxk2opzlTdN4pb6L81EU+sGiwpzE7NbvXn6MSX6g1/j
 ZZ3FgyvmnD1KF9OZZ4XD07LHY6uChuPCDx45uEoRjPNxrF8NMKW9BWk+KcfxHDr44r
 uwIa9sGTXb9xg==
Message-ID: <630b2044-eaec-4a8a-bd29-d20751d33e2f@kernel.org>
Date: Thu, 19 Sep 2024 01:41:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Add crashdump to Sahara
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, andersson@kernel.org,
 jacek.lawrynowicz@linux.intel.com, quic_carlv@quicinc.com
Cc: ogabbay@kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20240918155254.3186031-1-quic_jhugo@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240918155254.3186031-1-quic_jhugo@quicinc.com>
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

On 18.09.2024 5:52 PM, Jeffrey Hugo wrote:
> The Sahara protocol has a crashdump functionality. In the hello
> exchange, the device can advertise it has a memory dump available for
> the host to collect. Instead of the device making requests of the host,
> the host requests data from the device which can be later analyzed.
> 
> Implement this functionality and utilize the devcoredump framework for
> handing the dump over to userspace.
> 
> Similar to how firmware loading in Sahara involves multiple files,
> crashdump can consist of multiple files for different parts of the dump.
> Structure these into a single buffer that userspace can parse and
> extract the original files from.
> 
> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---

I gave this a brief read, but.. aren't you dumping however much DRAM the
AIC100 has (and then some SRAM) onto the host machine without the user
asking for it (i.e. immediately after the AIC crashes)?

Konrad
