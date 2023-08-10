Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5718777C77
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 17:41:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E380710E55B;
	Thu, 10 Aug 2023 15:41:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EF9210E55B;
 Thu, 10 Aug 2023 15:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=LZZwhU2q9tKRTuT4LMGtkLl/YytlWdJV5ADQ7yyf884=; b=nzCVWxdZKZwPPVrpb79vDihKKN
 YQMNeNih7Df6L+pZOvTjw50y9FCJs6aH8rL8h5X2REST5vdC3Wq9YdRoE5xnf6hw68vx0zt8985/4
 +9cDPaBlKuKeAHsCvu3wOh/4f+NA8FgH2SNngUajJxMQhE16KsGIQEWgQG79GUlXunzjgzLhpAOr+
 SYDCVy0iFP1vRNzRSbC+T0oIVVz6F2RvcjiMZYX3czR+nm5oLvCNzwtupO+DnMacrLMCIbCpZMS31
 kUka0xfiEZR78ZR0A8ZecYiCVpTdwXhUWyz2kMWRbBUeMIq9zHuWNHz7b8W60+R7DbtqAwg0Ryp6u
 XrPT05iA==;
Received: from [2601:1c2:980:9ec0::2764]
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qU7mf-0084NA-10; Thu, 10 Aug 2023 15:41:09 +0000
Message-ID: <efb2d30c-3945-a63d-9a3f-7cf39124f76a@infradead.org>
Date: Thu, 10 Aug 2023 08:41:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH V8 1/9] drivers core: Add support for Wifi band RF
 mitigations
Content-Language: en-US
To: Evan Quan <evan.quan@amd.com>, rafael@kernel.org, lenb@kernel.org,
 Alexander.Deucher@amd.com, Christian.Koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, johannes@sipsolutions.net,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, Mario.Limonciello@amd.com, mdaenzer@redhat.com,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, hdegoede@redhat.com,
 jingyuwang_vip@163.com, Lijo.Lazar@amd.com, jim.cromie@gmail.com,
 bellosilicio@gmail.com, andrealmeid@igalia.com, trix@redhat.com,
 jsg@jsg.id.au, arnd@arndb.de, andrew@lunn.ch
References: <20230810073803.1643451-1-evan.quan@amd.com>
 <20230810073803.1643451-2-evan.quan@amd.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230810073803.1643451-2-evan.quan@amd.com>
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-acpi@vger.kernel.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/10/23 00:37, Evan Quan wrote:
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index a1457995fd41..21f73a0bbd0b 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -7152,3 +7152,12 @@
>  				xmon commands.
>  			off	xmon is disabled.
>  
> +	wbrf=		[KNL]
> +			Format: { on | auto | off }
> +			Controls if WBRF features should be enabled or disabled
> +			forcely. Default is auto.

"forcely" is not a word. "forcedly" is a word, but it's not used very much
AFAIK.
I would probably write "Controls if WBRF features should be forced on or off."

> +			on	Force enable the WBRF features.
> +			auto	Up to the system to do proper checks to
> +				determine the WBRF features should be enabled
> +				or not.
> +			off	Force disable the WBRF features.

-- 
~Randy
