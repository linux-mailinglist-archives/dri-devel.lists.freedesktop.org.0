Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOj/Ek4igmmQPgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 17:29:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4C4DBF73
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 17:29:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E19A010E703;
	Tue,  3 Feb 2026 16:28:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="n7Ei7/gK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D54E810E703
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 16:28:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3F9B343DA1;
 Tue,  3 Feb 2026 16:28:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89252C16AAE;
 Tue,  3 Feb 2026 16:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1770136138;
 bh=QLM8Cd4lYQ1gk9LxsTCcNODV4GYG29LzN7JYwrYqBvw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n7Ei7/gK+3w3UVBbUFYUxCIGM74q6ghSuVmLT0GQjrLcpb2DVYFuvyEc4Fg2Oe5BZ
 9DA+SBIsrifVQiytUfgIkTTc876TPTUpb4vCU0rYb6BFbCe/K45ih3+SEqJQ9E8Vtb
 O4GGnM46moFdad62LnviYrIFwfSWdEShKShFmqEQ=
Date: Tue, 3 Feb 2026 17:28:55 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Matthew Maurer <mmaurer@google.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Satya Durga Srinivasu Prabhala <satyap@quicinc.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Michal Wilczynski <m.wilczynski@samsung.com>,
 Dave Ertman <david.m.ertman@intel.com>,
 Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>,
 Trilok Soni <tsoni@quicinc.com>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, rust-for-linux@vger.kernel.org,
 driver-core@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-pwm@vger.kernel.org
Subject: Re: [PATCH v2 6/6] soc: qcom: socinfo: Convert to Rust
Message-ID: <2026020315-conch-trickle-2d84@gregkh>
References: <20260203-qcom-socinfo-v2-0-d6719db85637@google.com>
 <20260203-qcom-socinfo-v2-6-d6719db85637@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203-qcom-socinfo-v2-6-d6719db85637@google.com>
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
X-Spamd-Result: default: False [4.69 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mmaurer@google.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:satyap@quicinc.com,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:daniel.almeida@collabora.com,m:rafael@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:m.wilczynski@samsung.com,m:david.m.ertman@intel.com,m:ira.weiny@intel.com,m:leon@kernel.org,m:tsoni@quicinc.com,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:driver-core@lists.linux.dev,m:linux-pwm@vger.kernel.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,quicinc.com,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,collabora.com,ffwll.ch,samsung.com,intel.com,vger.kernel.org,lists.linux.dev,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: CA4C4DBF73
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 03:46:35PM +0000, Matthew Maurer wrote:
> Convert the socinfo driver to Rust for a number of improvements:
> * Accessing IO mapped regions through the IO subsystem, rather than
>   through regular memory accesses.

That's good, but the C code could also be "fixed" to do this, right?

> * Binds the device as an auxiliary device rather than a platform device,
>   ensuring the mapped IO regions cannot be accessed after the smem
>   device is removed.

I'm all for this, but is this really an aux device?  What is the
"parent" device of this aux device?  Where are the "siblings"?  What
does sysfs look like before/after this?

> * Adds bounds-checking to all accesses, hardening against a repeat of
>   CVE-2024-58007

How do you now "know" that the bounds checking is correct?  The C
version also had this, it was just "not correct" :)

And which accesses are you referring to?  From userspace?  From the
kernel?  That CVE looks very odd, it's probably not even a real one and
should be revoked, right?


> diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
> index fef840b5457407a85051ded0e835430dbebfe8bb..dcea2d7f37067b0b6f801b3d2b457422ad9f342c 100644
> --- a/drivers/soc/qcom/smem.c
> +++ b/drivers/soc/qcom/smem.c
> @@ -4,6 +4,7 @@
>   * Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
>   */
>  
> +#include <linux/auxiliary_bus.h>
>  #include <linux/hwspinlock.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
> @@ -279,7 +280,6 @@ struct qcom_smem {
>  	struct hwspinlock *hwlock;
>  
>  	u32 item_count;
> -	struct platform_device *socinfo;
>  	struct smem_ptable *ptable;
>  	struct smem_partition global_partition;
>  	struct smem_partition partitions[SMEM_HOST_COUNT];
> @@ -675,6 +675,32 @@ static void *qcom_smem_get_private(struct qcom_smem *smem,
>  	return ERR_PTR(-EINVAL);
>  }
>  
> +/**
> + * qcom_smem_get_aux() - resolve ptr of size of a smem item
> + * @aux:        an aux device that should be our child
> + * @host:	the remote processor, or -1
> + * @item:	smem item handle
> + * @size:	pointer to be filled out with size of the item
> + *
> + * Looks up smem item and returns pointer to it. Size of smem
> + * item is returned in @size.
> + *
> + * The caller may take the loaded state of the provided aux device as
> + * an acceptable proxy for this memory being valid.
> + *
> + * Return: a pointer to an SMEM item on success, ERR_PTR() on failure.
> + */
> +void *qcom_smem_get_aux(struct auxiliary_device *aux, unsigned int host,
> +		unsigned int item, size_t *size)
> +{
> +	if (IS_ERR(__smem))
> +		return __smem;
> +	if (aux->dev.parent != __smem->dev)
> +		return ERR_PTR(-EINVAL);
> +	return qcom_smem_get(host, item, size);

So you are returning a void pointer?  But don't you really know the
"type" of what is being asked here?  It's a memory chunk, so u8?  Or
something else?  void * feels "rough" here.

> +}
> +EXPORT_SYMBOL_GPL(qcom_smem_get_aux);
> +
>  /**
>   * qcom_smem_get() - resolve ptr of size of a smem item
>   * @host:	the remote processor, or -1
> @@ -684,6 +710,9 @@ static void *qcom_smem_get_private(struct qcom_smem *smem,
>   * Looks up smem item and returns pointer to it. Size of smem
>   * item is returned in @size.
>   *
> + * It is up to the caller to ensure that the qcom_smem device remains
> + * loaded by some mechanism when accessing returned memory.

What do you mean by "loaded"?  You are saying that the caller needs to
rely on this driver remaining in memory for that memory to be "valid"?

If this is the case, why not take a reference count?

> +impl Smem {
> +    pub(crate) fn access<'a>(&'a self, dev: &'a Device<Bound>) -> Option<&'a Mmio> {
> +        if *dev != *self.dev {

How can this ever happen?

thanks,

greg k-h
