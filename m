Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 723AE6F6D6F
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 16:02:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFAA710E023;
	Thu,  4 May 2023 14:02:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C82910E023
 for <dri-devel@lists.freedesktop.org>; Thu,  4 May 2023 14:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 94DD33FBB2;
 Thu,  4 May 2023 16:02:11 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -3.531
X-Spam-Level: 
X-Spam-Status: No, score=-3.531 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 T_SCC_BODY_TEXT_LINE=-0.01, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Authentication-Results: pio-pvt-msa3.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4JwO5kl3RK6X; Thu,  4 May 2023 16:02:10 +0200 (CEST)
Received: by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id A839A3F803;
 Thu,  4 May 2023 16:02:09 +0200 (CEST)
Received: from [192.168.0.209] (unknown [134.191.233.202])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 3567736320A;
 Thu,  4 May 2023 16:02:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1683208929; bh=wji9d2iAOOfk/BDD0gA06+mO4zEdjUMCmHKkhpt8hVs=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=pgB3P/BH7h6fI9TW2wAwf2gZnsmk4m9bUiZ/+gTmciz8402U81jADeURWsaWkzwRE
 TzdF7Oi0LooH1VyuO+gAbY7GxKWgYXigb4BOMdKZeqc2OkT0PUPe2IQmn835gaWQmX
 YYf5uIoiDn/7mZKmAbwfZZmXunfU9kFN+mY+m0PM=
Message-ID: <dcbeab9f-489e-a9f8-b749-a0c40c4ec139@shipmail.org>
Date: Thu, 4 May 2023 16:02:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 01/13] drm: execution context for GEM buffers v4
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 francois.dugast@intel.com, felix.kuehling@amd.com,
 arunpravin.paneerselvam@amd.com, dakr@redhat.com, luben.tuikov@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20230504115159.2245-1-christian.koenig@amd.com>
 <20230504115159.2245-2-christian.koenig@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
In-Reply-To: <20230504115159.2245-2-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/4/23 13:51, Christian König wrote:
> This adds the infrastructure for an execution context for GEM buffers
> which is similar to the existing TTMs execbuf util and intended to replace
> it in the long term.
>
> The basic functionality is that we abstracts the necessary loop to lock
> many different GEM buffers with automated deadlock and duplicate handling.
>
> v2: drop xarray and use dynamic resized array instead, the locking
>      overhead is unecessary and measurable.
> v3: drop duplicate tracking, radeon is really the only one needing that.
> v4: fixes issues pointed out by Danilo, some typos in comments and a
>      helper for lock arrays of GEM objects.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
...
> +/**
> + * struct drm_exec - Execution context
> + */
> +struct drm_exec {
> +	/**
> +	 * @interruptible: If locks should be taken interruptible
> +	 */
> +	bool			interruptible;
> +
> +	/**
> +	 * @ticket: WW ticket used for acquiring locks
> +	 */
> +	struct ww_acquire_ctx	ticket;
> +
> +	/**
> +	 * @num_objects: number of objects locked
> +	 */
> +	unsigned int		num_objects;
> +
> +	/**
> +	 * @max_objects: maximum objects in array
> +	 */
> +	unsigned int		max_objects;
> +
> +	/**
> +	 * @objects: array of the locked objects
> +	 */
> +	struct drm_gem_object	**objects;

Hi, Christian. Did you consider using a list here with links embedded in 
gem objects, now that only locked objects are to be put on the list / array.

That should work as only the process owning the lock may access the list 
link. Apart from getting rid of reallocing this is beneficial for the 
more general types of ww transactions that are used by i915 (and to a 
minor extent xe as well, I think).

In those cases we would want to unlock a temporary held object within 
the while_not_all_locked() loop and would then have to search the entire 
array for the correct pointer. Instead one could just remove it from the 
list of locked objects.

Thanks,

Thomas

