Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C21E241D153
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 04:16:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDBB66EB26;
	Thu, 30 Sep 2021 02:16:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 440 seconds by postgrey-1.36 at gabe;
 Thu, 30 Sep 2021 02:16:15 UTC
Received: from smtprelay.hostedemail.com (smtprelay0219.hostedemail.com
 [216.40.44.219])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBB246EB22;
 Thu, 30 Sep 2021 02:16:15 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave04.hostedemail.com (Postfix) with ESMTP id DFB6618113636;
 Thu, 30 Sep 2021 02:08:55 +0000 (UTC)
Received: from omf10.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay05.hostedemail.com (Postfix) with ESMTP id 7938418059B50;
 Thu, 30 Sep 2021 02:08:54 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf10.hostedemail.com (Postfix) with ESMTPA id 7F78F2351F3; 
 Thu, 30 Sep 2021 02:08:53 +0000 (UTC)
Message-ID: <a61f6bc2dc18397de92e4b7cdd9b37e2dff7e114.camel@perches.com>
Subject: Re: [PATCH 2/4] amdgpu_ucode: reduce number of pr_debug calls
From: Joe Perches <joe@perches.com>
To: Jim Cromie <jim.cromie@gmail.com>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Wed, 29 Sep 2021 19:08:51 -0700
In-Reply-To: <20210930014427.14239-3-jim.cromie@gmail.com>
References: <20210930014427.14239-1-jim.cromie@gmail.com>
 <20210930014427.14239-3-jim.cromie@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 7F78F2351F3
X-Spam-Status: No, score=0.10
X-Stat-Signature: anmt6jx4t6f7u5gh4einmjsx1txe8h6k
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18kGVBu/5EFA7vPk09h4PPRUG51zMWAUwg=
X-HE-Tag: 1632967733-854858
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

On Wed, 2021-09-29 at 19:44 -0600, Jim Cromie wrote:
> There are blocks of DRM_DEBUG calls, consolidate their args into
> single calls.  With dynamic-debug in use, each callsite consumes 56
> bytes of callsite data, and this patch removes about 65 calls, so
> it saves ~3.5kb.
> 
> no functional changes.

No functional change, but an output logging content change.

> RFC: this creates multi-line log messages, does that break any syslog
> conventions ?

It does change the output as each individual DRM_DEBUG is a call to
__drm_dbg which is effectively:

	printk(KERN_DEBUG "[" DRM_NAME ":%ps] %pV",
	       __builtin_return_address(0), &vaf);


> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
[]
> @@ -30,17 +30,26 @@
>  
> 
>  static void amdgpu_ucode_print_common_hdr(const struct common_firmware_header *hdr)
>  {
> -	DRM_DEBUG("size_bytes: %u\n", le32_to_cpu(hdr->size_bytes));
> -	DRM_DEBUG("header_size_bytes: %u\n", le32_to_cpu(hdr->header_size_bytes));
[]
> +	DRM_DEBUG("size_bytes: %u\n"
> +		  "header_size_bytes: %u\n"

etc...


