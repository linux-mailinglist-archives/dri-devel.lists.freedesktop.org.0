Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B1DD3ACCE
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 15:51:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B876A10E47A;
	Mon, 19 Jan 2026 14:51:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PEnNXf/D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05E9E10E47A
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 14:51:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0851060127;
 Mon, 19 Jan 2026 14:51:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92705C116C6;
 Mon, 19 Jan 2026 14:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768834275;
 bh=ySj2aNj606iYqabEio6O5eCs4M+kihBYdkQ8NbRj6UA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PEnNXf/DgIKOnD1rH3kHDLyzQbWdk9u6MUWFQ9Y4Hkmg5KtYfkUXJA5BBZd5eBF+f
 /nu9BHCrtZGPIDWhN+NKiiABtRhm7HgwURNrTzGxS70gcVyFEe25o9U2+onN281zM4
 VVTmuSgSN0kPDPFcULEbAH0nbzOQDo4Fa20u1jQjQmkO5zcd1jC9eJclxaGQ/8nW2h
 0lxUZ6inAkA8pWJ94jRqx5mmfdyxS0BAq/GGESj+WLfDPpddoVmJ1cPDmvxlcQMsSG
 EoJHLco+IlaOjPbpj0w9aA3wgg12d/+diocyvDrT3xAVYX8CyDbbf7wX1hL0Ke9iKT
 2068lGV+3sT9g==
Date: Mon, 19 Jan 2026 14:51:08 +0000
From: Daniel Thompson <danielt@kernel.org>
To: =?iso-8859-1?B?QmFybmFi4XMgQ3rpbeFu?= <barnabas.czeman@mainlining.org>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Kiran Gunda <quic_kgunda@quicinc.com>, Helge Deller <deller@gmx.de>,
 Luca Weiss <luca@lucaweiss.eu>, Konrad Dybcio <konradybcio@kernel.org>,
 Eugene Lepshy <fekz115@gmail.com>, Gianluca Boiano <morf3089@gmail.com>,
 Alejandro Tafalla <atafalla@dnyon.com>,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/7] backlight: qcom-wled: Support ovp values for
 PMI8994
Message-ID: <aW5E3HuAoCAC-APx@aspen.lan>
References: <20260116-pmi8950-wled-v3-0-e6c93de84079@mainlining.org>
 <20260116-pmi8950-wled-v3-2-e6c93de84079@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260116-pmi8950-wled-v3-2-e6c93de84079@mainlining.org>
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

On Fri, Jan 16, 2026 at 08:07:34AM +0100, Barnabás Czémán wrote:
> WLED4 found in PMI8994 supports different ovp values.
>
> Fixes: 6fc632d3e3e0 ("video: backlight: qcom-wled: Add PMI8994 compatible")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Thanks

Daniel
