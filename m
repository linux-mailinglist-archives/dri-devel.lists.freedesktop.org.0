Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMwXNTdjgGml7gIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 09:41:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84ED3C9BE7
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 09:41:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D89D10E286;
	Mon,  2 Feb 2026 08:41:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Ap1dMETn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A820410E3B8
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 08:41:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DB24443646;
 Mon,  2 Feb 2026 08:41:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC40AC116C6;
 Mon,  2 Feb 2026 08:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1770021682;
 bh=VWE624fnqfngLIjj3E6rni5Z4zk7NcQkiYtzuCNihhQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ap1dMETnaV2kOMozl+c1GfWWGUBsB3q+c45vsyYZCdH3WWdDw4tGP3PB7Bm39Gi0C
 PgF7HWz1MNrk8nG1MS0P4dgOf0B6wc8+19KaCh7+fExkFkRQB8HCnR8tnR5wzjgjqG
 vk6Ekp9WzLrnBtVgbs4uPTMzZNIAMP9lXQ0nHXgA=
Date: Mon, 2 Feb 2026 09:41:18 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jianping <jianping.li@oss.qualcomm.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 linux-arm-msm@vger.kernel.org,
 Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
 thierry.escande@linaro.org, abelvesa@kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, stable@kernel.org
Subject: Re: [PATCH v2 1/4] misc: fastrpc: Add NULL check to fastrpc_buf_free
 to prevent crash
Message-ID: <2026020245-catalog-outburst-f805@gregkh>
References: <20260115082851.570-1-jianping.li@oss.qualcomm.com>
 <20260115082851.570-2-jianping.li@oss.qualcomm.com>
 <2026011621-fang-moneywise-d6b2@gregkh>
 <2255b500-f4fd-4d7a-a5d9-5b4fb55c78b2@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2255b500-f4fd-4d7a-a5d9-5b4fb55c78b2@oss.qualcomm.com>
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
X-Spamd-Result: default: False [3.19 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jianping.li@oss.qualcomm.com,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:linux-arm-msm@vger.kernel.org,m:ekansh.gupta@oss.qualcomm.com,m:thierry.escande@linaro.org,m:abelvesa@kernel.org,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:stable@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 84ED3C9BE7
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 03:13:10PM +0800, Jianping wrote:
> 
> 
> On 1/16/2026 10:49 PM, Greg KH wrote:
> > On Thu, Jan 15, 2026 at 04:28:48PM +0800, Jianping Li wrote:
> > > From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> > > 
> > > The fastrpc_buf_free function currently does not handle the case where
> > > the input buffer pointer (buf) is NULL. This can lead to a null pointer
> > > dereference, causing a crash or undefined behavior when the function
> > > attempts to access members of the buf structure. Add a NULL check to
> > > ensure safe handling of NULL pointers and prevent potential crashes.
> > 
> > What caller passes in NULL here?  I did a quick look, and see where the
> > callers check this properly if it could be NULL, otherwise it all looks
> > sane to me.  What in-kernel user is causing a crash here?  Why not fix
> > the caller up instead?
> > 
> > thanks,
> > 
> > greg k-h
> 
> It's a saftety coding: to eliminate NULL checks on the caller side, as we do
> in a lot of other kernel API.

But you do not do that for all functions in the kernel, otherwise the
kernel would be full of checks that are never hit at all.

> And it was pointed out in the v1 patch discussion that this change was
> needed:
> https://lore.kernel.org/all/c80c48a1-f1b6-4520-9d7c-3a83915c7717@oss.qualcomm.com/

Were the checks removed from the caller side like was asked for?

Also, your changelog makes it sound like this is a real bugfix for
something, when it is not at all, which is what I object to the most.
Don't make scary changelogs for things that are not actually happening.

thanks,

greg k-h
