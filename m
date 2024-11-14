Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 836E49C8CDA
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 15:28:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98E0D10E349;
	Thu, 14 Nov 2024 14:28:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="XEKUfkmi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37DA010E2AE
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 14:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1731594511; x=1732199311; i=deller@gmx.de;
 bh=Bu7HzVxvf+qhq7carB/JfhIXKFB7FS8YnkynWm3iatM=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=XEKUfkmiui1tlGQMOciJB+maKwAcwF04+I4hJtk/hOF+ZDyS1kDEPEYxnCMOZNdn
 gjFvno1FEBSr6DoDVrNB1WPcXxPK68C34TwhVVzBs8spvNPi1iJzwdC6042O7LSg1
 DmcYhzWx2++LTfl+t+pETVJ+OlOH6wWROYNR9a+rSfLosrO8/E4I/kniflqVTcANq
 nnheEA+F5S+7gFghOMwl2sHnJC/5l6kHcB3W5XNwbGMxQ5fDbRU6lIx3YRvOlGPMk
 //aQn7AoxuRYn0UaHv+81TxQWemDc79Gva6Tpx23Wjbb0EVgTeXKtSfiDSqGwdLCc
 4zCo5cV54Ob5KEdRfQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.8.0.6] ([78.94.87.245]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MoO6M-1tZyMx0lfE-00c0Zz; Thu, 14
 Nov 2024 15:28:31 +0100
Message-ID: <c731e887-17f6-4c8e-84ef-19e299cfe4fb@gmx.de>
Date: Thu, 14 Nov 2024 15:28:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] video: sh7760fb: Fix a possible memory leak in
 sh7760fb_alloc_mem()
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Zhen Lei <thunder.leizhen@huawei.com>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20241026035634.467-1-thunder.leizhen@huawei.com>
 <ehzle6x534lfgxbcfisgpy3mmvggqlbh4zbrx2kl5sb2c3hnmn@biaxdd5cjcb4>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <ehzle6x534lfgxbcfisgpy3mmvggqlbh4zbrx2kl5sb2c3hnmn@biaxdd5cjcb4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ExHF39QlDqKJ+SeOC3n964+8HRVwai+Qpfy4HhtGB8OMsxPzQ8r
 MJ21DIWWehLnbAHFe1k/Tm6G+zB9HG5uN7WzAAtgQK9UhMVxSGV+3OeBYKpXa6kGzeFB2K/
 s+kwbYTQs48jtctKLC+ZFXNgI7hfPKLr5WKd+6KJXwISDuh4iy0Z+Lqfn8rroCJ0gYy+22A
 XKDN+m8qWntQBRAgpOOWg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:QbLQE5nPvws=;qvwhS6q/tEd9P8N7YuJ9Lngxkg3
 JbfZlsI5gTKzO9gI4hDO5yZjOaeQKOoN3OTaWIm3ShVjAick+GvmJmVWhsuq3V4GmoqJxVLpl
 lOxU2xausdZpONXuCMDG7TUczKSekmJpMa7/y5M+FvX6GDXMgZBifJLJIqYz8ICjFCtH+05Sh
 UrTW+lz/2+3QAxb1EFxH9vRxXPVGsqQZXk9ElfL1WdJVMwBbscFB5/tkv1mvLt5SzTSobvtN6
 x8irj9B6jaB65uI79UYq/UnDfKel/Rh4Pu2tc4mhud0VuKjZ0DodRUM/37KnqDM41fRa2ejoH
 DjdXJRFvJV7wHKFMF1uDYMCh94ext8nymn+jGUuzL4MriVoQad2rb0Edh07YQUNcaM62+K63y
 E/zSa2W5BdwNa2FDGNgwiP5navur2/JCpZxmM3B4r6alMUu1B0wPAw7B7PNQ3YAQWaf/mjNSn
 FTtG6Uh7OHbNjj9YuWa9H70qZnvRF2eSvT/PpGcymxDURgsu+AfB0JHnqqFZCsVevXJ5k1sMM
 oexbxUE9JQctfxlDR51IiDY3zCVgXp/hQIRIpjivJ9pHe1OH95KqztqHE7J0pvSPYZBj303YR
 JOdiZas93f73LcELohH84gOKwz9u24yPo3h0ZHviH3sCGha+rTNzZ8gj729/EeNLvv/o0b3qj
 jUhIeitZ+i3eWL4HkxmyaMrixM1bOpB+VQE5EwWLWTgQpCRu3gSyeIQPZBZ0BrN67+WCQlfqd
 O9qdxLoBoJioKuQ8aGScme83P4T8IVFz03MrOPsqwBb6j3vvfig6YeJulTcGtdtn5KxOt1jj3
 nW62Elexs1hv8AYc/KRF1k0hvqDyfhUN6SvGev+TBaAwLKQaulzz3ArPGVOejvWJGpnORgSmK
 b2yO1qDM4YcwOP5YFVs7lneG95kBgpPjQMaBPtfdMXqqymPyv4owwSAXC
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

On 10/28/24 11:41, Dmitry Baryshkov wrote:
> On Sat, Oct 26, 2024 at 11:56:34AM +0800, Zhen Lei wrote:
>> When information such as info->screen_base is not ready, calling
>> sh7760fb_free_mem() does not release memory correctly. Call
>> dma_free_coherent() instead.
>>
>> Fixes: 4a25e41831ee ("video: sh7760fb: SH7760/SH7763 LCDC framebuffer d=
river")
>> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
>> ---
>>   drivers/video/fbdev/sh7760fb.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

applied to fbdev git tree.

Thanks!
Helge

