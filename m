Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8F18D14A5
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 08:46:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A35410FFFB;
	Tue, 28 May 2024 06:46:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.b="xLYc97HZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C124710FFFB;
 Tue, 28 May 2024 06:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 In-Reply-To:References; bh=Om+3DdDNz34eTk9PGG2WbSavGEIpa9Fm2b7xW+H1qWQ=;
 t=1716878796; x=1717310796; b=xLYc97HZ1/a987w9u1HjNlURGoUAlHCrPZudu2MRN2DFeSB
 0Rs23nuHi/z9o77/Qhjya9Hg3ulI0lHYAggY/F8b3K/umGYbsrfEBir/ZHlbWw4I5NJLWY+OuoBzv
 I9XJFO+ZOhltkVjLxtbZVFtMnoWi4Mmhx8aT0Uy3BMuzz4eWipafspjFgcLV3aPCXz/orUMUZF06+
 Ucpb3xJnrWmgY8HAFhhU8/slIovXsrU13J0ZykAI4I2/krAPmcTUBs+oQqLVLYBWnR8PewnqAA7kP
 PCccfbUTWAouaFNP2tu0uZB6Ytbepr1B2qv9BB30D2DtYb3t3UZsBtM0lwhmnDTA==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1sBqbP-0007a4-SQ; Tue, 28 May 2024 08:46:31 +0200
Message-ID: <de703fe7-1cf8-4f51-a282-bdca4a3c6634@leemhuis.info>
Date: Tue, 28 May 2024 08:46:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: 6.10/regression/bisected commit c4cb23111103 causes sleeping
 function called from invalid context at kernel/locking/mutex.c:585
To: Chris Bainbridge <chris.bainbridge@gmail.com>,
 Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Cc: regressions@lists.linux.dev, vasant.hegde@amd.com,
 suravee.suthikulpanit@amd.com, jgg@nvidia.com, jroedel@suse.de,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 Borislav Petkov <bp@alien8.de>
References: <CABXGCsN1z2gj99zSdhQWynpTXBymrqHejDfF8axxxoiZ_0g_-g@mail.gmail.com>
 <Zk5hJrY_lGmuW1G9@debian.local>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <Zk5hJrY_lGmuW1G9@debian.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1716878796;
 3bfcac6a; 
X-HE-SMSGID: 1sBqbP-0007a4-SQ
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

On 22.05.24 23:18, Chris Bainbridge wrote:
> On Tue, May 21, 2024 at 02:39:06PM +0500, Mikhail Gavrilov wrote:
>> Yesterday on the fresh kernel snapshot
>> I spotted a new bug message with follow stacktrace:
>> [    4.307097] BUG: sleeping function called from invalid context at
>> kernel/locking/mutex.c:585
> I am also getting this error on every boot. Decoded stacktrace:

TWIMC & for the record: Boris also reported this; Vasant Hegde replied
and said a fix is in the works:

https://lore.kernel.org/all/898d356d-ec7d-41de-82d8-3ed4dc5598b3@amd.com/

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot dup:
https://lore.kernel.org/all/CABXGCsN1z2gj99zSdhQWynpTXBymrqHejDfF8axxxoiZ_0g_-g@mail.gmail.com/
