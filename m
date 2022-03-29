Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 902DE4EA821
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 08:54:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3189110F0D5;
	Tue, 29 Mar 2022 06:54:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B9010F0D4;
 Tue, 29 Mar 2022 06:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id D34173F60C;
 Tue, 29 Mar 2022 08:54:07 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.11
X-Spam-Level: 
X-Spam-Status: No, score=-2.11 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Authentication-Results: pio-pvt-msa3.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yQPLlhiW3eEE; Tue, 29 Mar 2022 08:54:03 +0200 (CEST)
Received: by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 35CA83F53A;
 Tue, 29 Mar 2022 08:54:01 +0200 (CEST)
Received: from [192.168.0.209] (fmdmzpr02-ext.fm.intel.com [192.55.54.37])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 0D7D4360144;
 Tue, 29 Mar 2022 08:53:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1648536841; bh=wa3IUbQ7/C9USy7Ux9Ae4QUVcyTtMLSg9Gje+hXzLfs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=XWuVLlrEXQfoJuFLdLbICEU/GeQkM7ZQTtPgN6yOaFcJ67dXzrDP9iwbPCIL6OS+P
 D2SmgfVX4APgU+hguxC0aZ7t7cz4MtJYflWJlDvGgcJ7TVSiLbVqHeBMc0qR/agN8P
 RXtkK9v7YGBZClsOEOz9mUGtuKT3j7aL/SKIpsBA=
Message-ID: <3eeae3ed-f407-386f-8b04-ccf8f743935e@shipmail.org>
Date: Tue, 29 Mar 2022 08:53:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [Intel-gfx] [PATCH v7 5/9] drm/i915/selftest_migrate: Consider
 the possible roundup of size
Content-Language: en-US
To: Ramalingam C <ramalingam.c@intel.com>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20220328190736.19697-1-ramalingam.c@intel.com>
 <20220328190736.19697-6-ramalingam.c@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
In-Reply-To: <20220328190736.19697-6-ramalingam.c@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/28/22 21:07, Ramalingam C wrote:
> Consider the possible round up happened at obj size alignment to
> min_page_size during the obj allocation.
>
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> ---
>   drivers/gpu/drm/i915/gt/selftest_migrate.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/selftest_migrate.c b/drivers/gpu/drm/i915/gt/selftest_migrate.c
> index c9c4f391c5cc..b5da8b8cd039 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_migrate.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_migrate.c
> @@ -152,6 +152,9 @@ static int clear(struct intel_migrate *migrate,
>   	if (IS_ERR(obj))
>   		return 0;
>   
> +	/* Consider the rounded up memory too */
> +	sz = obj->base.size;
> +
>   	for_i915_gem_ww(&ww, err, true) {
>   		err = i915_gem_object_lock(obj, &ww);
>   		if (err)
