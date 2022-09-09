Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DB95B3B82
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 17:11:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6032D10EDFA;
	Fri,  9 Sep 2022 15:11:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C8BD10EDFA;
 Fri,  9 Sep 2022 15:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662736260; x=1694272260;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vGy4fIFwjFSNzA65qv4QDCYsy+swZzfD5tvaJcOb5X4=;
 b=maglAEPBCMFqi8C/cflgtKDpV2ASrc1p2Ui21rpg+cpNTeU4DHUrmCuV
 1RiybquVl3mCHYi5VNJFP7wRqL3RosMkboX0MnjApyQkAxkdfbUMMBAj7
 e6MfEdJ/8pQu6c8+oV7vWRIaggJdSTi2b/Q6jT0k6V12/vOF2V7DRklBa
 LAga3kgWGgMzFW7M/BBwAqOBD5JO5MT1vAS3XKupikCn+bKbEwdZ3K0CJ
 bUbSJHeShnH0YfMOAHVOcH6wTZX7/TNEcDPYXVLwLyYrJRm49Rz98BQA0
 +ZSbjsINIisT/JYC3tTioHrNyKIlyZCmBCUFHKftrpKhnmW9pBk4duokw Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10465"; a="323706436"
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; d="scan'208";a="323706436"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 08:10:59 -0700
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; d="scan'208";a="611085785"
Received: from jkrzyszt-mobl1.ger.corp.intel.com ([10.213.25.143])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 08:10:54 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/4] lib/igt_kmod.c: check if module is
 builtin before attempting to unload it
Date: Fri, 09 Sep 2022 17:10:52 +0200
Message-ID: <13576898.RDIVbhacDa@jkrzyszt-mobl1.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20220829000920.38185-3-isabbasso@riseup.net>
References: <20220829000920.38185-1-isabbasso@riseup.net>
 <20220829000920.38185-3-isabbasso@riseup.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: linux-kselftest@vger.kernel.org, magalilemes00@gmail.com,
 maira.canal@usp.br, dlatypov@google.com, tales.aparecida@gmail.com,
 brendanhiggins@google.com, linux-kernel@vger.kernel.org,
 leandro.ribeiro@collabora.com, dri-devel@lists.freedesktop.org,
 n@nfraprado.net, davidgow@google.com, skhan@linuxfoundation.org,
 andrealmeid@riseup.net, Isabella Basso <isabbasso@riseup.net>,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, 29 August 2022 02:09:18 CEST Isabella Basso wrote:
> This change makes `igt_module_unload_r` safer as it checks whether the

s/igt_module_unload_r/igt_kmod_unload_r/

> module can be unloaded before attempting it.
> 
> Signed-off-by: Isabella Basso <isabbasso@riseup.net>
> ---
>  lib/igt_kmod.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index bb6cb7bb..97cac7f5 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -256,6 +256,9 @@ static int igt_kmod_unload_r(struct kmod_module *kmod, unsigned int flags)
>  	struct kmod_list *holders, *pos;
>  	int err = 0;
>  
> +	if (kmod_module_get_initstate(kmod) == KMOD_MODULE_BUILTIN)
> +		return err;

NIT: I think that return 0; would be more clear.  Anyway,

Acked-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

> +
>  	holders = kmod_module_get_holders(kmod);
>  	kmod_list_foreach(pos, holders) {
>  		struct kmod_module *it = kmod_module_get_module(pos);
> 




