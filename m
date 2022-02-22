Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 888224C01F8
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 20:24:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9522710E3E5;
	Tue, 22 Feb 2022 19:24:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE65C10E463;
 Tue, 22 Feb 2022 19:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 74F464054D;
 Tue, 22 Feb 2022 20:24:33 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.11
X-Spam-Level: 
X-Spam-Status: No, score=-2.11 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Authentication-Results: pio-pvt-msa2.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LlINLLcYzaUD; Tue, 22 Feb 2022 20:24:32 +0100 (CET)
Received: by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 2D1BA3F5BF;
 Tue, 22 Feb 2022 20:24:31 +0100 (CET)
Received: from [192.168.0.209] (h-155-4-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id A3D9D362634;
 Tue, 22 Feb 2022 20:24:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1645557871; bh=gEHWLuiVnvtQeKNq+eqAIXkV3qSHpnorJSwC+JJcRs0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Ut/NILsf8Wz3HcejmzoeXEnkC2UFnb6uKVSHBft3q5f23qmpYwVNU5iYX8ZqqDrML
 AlPBELlpleYiLCt1hoUNcB2Gs0SelEol/3af4eytizhzCr/5DFSvTcn2EnKNOxt89C
 wn1MyDXGx88FONykZGrozb2fXBiaEiYWdnWh4f3Q=
Message-ID: <40f820e6-6b28-fd8a-b058-13f0bbbf71fc@shipmail.org>
Date: Tue, 22 Feb 2022 20:24:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [Intel-gfx] [PATCH v3 2/3] drm/i915/gem: Remove logic for
 wbinvd_on_all_cpus
Content-Language: en-US
To: Michael Cheng <michael.cheng@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220222172649.331661-1-michael.cheng@intel.com>
 <20220222172649.331661-3-michael.cheng@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
In-Reply-To: <20220222172649.331661-3-michael.cheng@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: lucas.demarchi@intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Michael,

On 2/22/22 18:26, Michael Cheng wrote:
> This patch removes logic for wbinvd_on_all_cpus and brings in
> drm_cache.h. This header has the logic that outputs a warning
> when wbinvd_on_all_cpus when its being used on a non-x86 platform.
>
> Signed-off-by: Michael Cheng <michael.cheng@intel.com>

Linus has been pretty clear that he won't accept patches that add macros 
that works on one arch and warns on others anymore in i915 and I figure 
even less so in drm code.

So we shouldn't try to move this out to drm. Instead we should restrict 
the wbinvd() inside our driver to integrated and X86 only. For discrete 
on all architectures we should be coherent and hence not be needing 
wbinvd().

Thanks,

/Thomas


