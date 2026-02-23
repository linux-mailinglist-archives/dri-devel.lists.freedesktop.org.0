Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MD5NDfxpnGlnGAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 15:53:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0935178443
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 15:53:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30D7A10E3D0;
	Mon, 23 Feb 2026 14:53:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="gvPA+MB/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 495 seconds by postgrey-1.36 at gabe;
 Mon, 23 Feb 2026 14:53:33 UTC
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com
 [95.215.58.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1540210E3A8
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 14:53:33 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1771857916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jrdY52taT3U/NZQPuGXBlMxO3l3XijeN4kwKfbf/UaA=;
 b=gvPA+MB/3rPZe3/+/xAdy7rLGGsuixZx+6Lg/SFcdvj7Pne2gcTVBzuqWYk6/eSywKtBCg
 /+sZ+33MMW3OoWIFucMMZgXUSMYkPwnWDirsMg0jvpEzROz4AOTFePeJ+p4rAiMfDKgcVO
 5d9tzkSlI2GvoE75tBd7urtM5+ANWj4=
From: Usama Arif <usama.arif@linux.dev>
To: Zi Yan <ziy@nvidia.com>
Cc: Usama Arif <usama.arif@linux.dev>, linux-mm@kvack.org,
 David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-erofs@lists.ozlabs.org,
 linux-block@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jason Xing <kernelxing@tencent.com>,
 Yushan Zhou <katrinzhou@tencent.com>,
 "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Subject: Re: [PATCH v1 01/11] relay: zero page->private when freeing pages
Date: Mon, 23 Feb 2026 06:45:06 -0800
Message-ID: <20260223144507.3065618-1-usama.arif@linux.dev>
In-Reply-To: <20260223032641.1859381-2-ziy@nvidia.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[usama.arif@linux.dev,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ziy@nvidia.com,m:usama.arif@linux.dev,m:linux-mm@kvack.org,m:david@kernel.org,m:akpm@linux-foundation.org,m:linux-erofs@lists.ozlabs.org,m:linux-block@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kernelxing@tencent.com,m:katrinzhou@tencent.com,m:mhiramat@kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[linux.dev:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[usama.arif@linux.dev,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:mid,linux.dev:dkim,nvidia.com:email,tencent.com:email]
X-Rspamd-Queue-Id: D0935178443
X-Rspamd-Action: no action

On Sun, 22 Feb 2026 22:26:31 -0500 Zi Yan <ziy@nvidia.com> wrote:

> This prepares for upcoming page->private checks in page freeing path.
> 
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> Cc: Jason Xing <kernelxing@tencent.com>
> Cc: Yushan Zhou <katrinzhou@tencent.com>
> Cc: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
> ---
>  kernel/relay.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/relay.c b/kernel/relay.c
> index 5c665b729132..d16f9966817f 100644
> --- a/kernel/relay.c
> +++ b/kernel/relay.c
> @@ -131,8 +131,10 @@ static void *relay_alloc_buf(struct rchan_buf *buf, size_t *size)
>  	return mem;
>  
>  depopulate:
> -	for (j = 0; j < i; j++)
> +	for (j = 0; j < i; j++) {
> +		set_page_private(buf->page_array[i], 0);

Hi Zi,

Should the index into page_array be j and not i over here?

>  		__free_page(buf->page_array[j]);
> +	}
>  	relay_free_page_array(buf->page_array);
>  	return NULL;
>  }
> @@ -196,8 +198,10 @@ static void relay_destroy_buf(struct rchan_buf *buf)
>  
>  	if (likely(buf->start)) {
>  		vunmap(buf->start);
> -		for (i = 0; i < buf->page_count; i++)
> +		for (i = 0; i < buf->page_count; i++) {
> +			set_page_private(buf->page_array[i], 0);
>  			__free_page(buf->page_array[i]);
> +		}
>  		relay_free_page_array(buf->page_array);
>  	}
>  	*per_cpu_ptr(chan->buf, buf->cpu) = NULL;
> -- 
> 2.51.0
> 
> 
