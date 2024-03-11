Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5941D8784CC
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 17:18:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87BAB112B72;
	Mon, 11 Mar 2024 16:18:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.b="qYQXlSiZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E07610E65C;
 Mon, 11 Mar 2024 16:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 In-Reply-To:References; bh=BQlVn0sfGO/6FRkWMHBIjA018n1pfP/VCDtJm/lkcHE=;
 t=1710173891; x=1710605891; b=qYQXlSiZxMka4Ablhx/E3AMgCxBZExYu5rCrcENQULZ7UUY
 fFrYCVHd/EPXSDTKYRghsinKQ56SubnKZK4Sbl2VsJ/sNnlBywvi6cpuirCEUIVPB4p22mkWEyfpZ
 deQvr3t/gAuEQ2mhPRO4TUD2EBMDAZQfEbkzYzfPi07LHy6HcU+kffym75UOxYpVjOxfbHNYUW3Zn
 sGgIN15Ydi3abVB7kEciD4EoTr1yPqGn+CvLTvGo6v2B7T6Mw+SOeWX1VOomcALBB1u7s/fkf8Btb
 Q5m+BiITSt+uPC8piqIr033EICzEsBis0w+PDID3z3FMBZ6L3YJL3RO7Be3PjKKw==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1rjiLo-0000Fx-4Z; Mon, 11 Mar 2024 17:18:08 +0100
Message-ID: <fc215679-e5f8-4d1e-bd70-c940d40a01e3@leemhuis.info>
Date: Mon, 11 Mar 2024 17:18:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Fix divide-by-zero on DP unplug with nouveau
Content-Language: en-US, de-DE
To: imre.deak@intel.com, Chris Bainbridge <chris.bainbridge@gmail.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 lyude@redhat.com, ville.syrjala@linux.intel.com,
 stanislav.lisovskiy@intel.com, mripard@kernel.org,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <ZcfpqwnkSoiJxeT9@debian.local>
 <Ze8suV5ox+43/wAC@ideak-desk.fi.intel.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <Ze8suV5ox+43/wAC@ideak-desk.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1710173891;
 3612b31d; 
X-HE-SMSGID: 1rjiLo-0000Fx-4Z
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11.03.24 17:09, Imre Deak wrote:
> On Sat, Feb 10, 2024 at 09:24:59PM +0000, Chris Bainbridge wrote:
> Sorry for the delay.

Happens, thx for looking onto this!

>> The following trace occurs when using nouveau and unplugging a DP MST
>> adaptor:
> [...] 
>> +	if (bpp_x16 == 0)
>> +		return 0;
> 
> Could you please move the check to the beginnig of the function and add
> a debug message in case bpp_x16 is 0?
> 
> It looks odd that a driver calls this function with a 0 bpp_x16, and
> ideally it should be fixed in the driver. However as it's a regression
> and we don't have a better idea now:
> 
> Acked-by: Imre Deak <imre.deak@intel.com>

Chris: as this went into 6.8, please consider adding a stable-tag to
ensure Greg picks this up.

Ciao, Thorsten

