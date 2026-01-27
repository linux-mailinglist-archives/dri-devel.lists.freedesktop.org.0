Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLmjLy5leGnTpgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 08:11:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C81090A0F
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 08:11:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC1C710E1DE;
	Tue, 27 Jan 2026 07:11:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TZ8orioz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 012D110E206
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 07:11:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DDAED429EB;
 Tue, 27 Jan 2026 07:11:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F6EDC116C6;
 Tue, 27 Jan 2026 07:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1769497898;
 bh=0Gfr1rwFWCkLVfSLU7RQ4F2QGghqpp1AJelz8j+FtMc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TZ8orioz4j2SFqJXJuM8/QzvqywsFCSqwUN33XoGzeACMUnZRDpYARrVTzGBhKGzQ
 Q9LGIOXcxcZEfrpcFwY5xLQVvMPVXkViB69nB94alr+rjG6rxQsf3rzqlL0fwzBK7l
 1EAf5oZl5bqMmWf+RfonCUAMkG66fkcUhI/c4qvM=
Date: Tue, 27 Jan 2026 08:11:35 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Xingjing Deng <micro6947@gmail.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Xingjing Deng <xjdeng@buaa.edu.cn>,
 stable@vger.kernel.org
Subject: Re: [PATCH v3] misc: fastrpc: possible double-free of
 cctx->remote_heap
Message-ID: <2026012748-unblock-vacation-70b8@gregkh>
References: <20260117140959.879035-1-xjdeng@buaa.edu.cn>
 <2026012641-snazzy-upstate-a815@gregkh>
 <CAK+ZN9r57ErbhCxX6hR8_G1G+eTh+UajdNftvKkUnyefYm3BhA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK+ZN9r57ErbhCxX6hR8_G1G+eTh+UajdNftvKkUnyefYm3BhA@mail.gmail.com>
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
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:micro6947@gmail.com,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xjdeng@buaa.edu.cn,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 5C81090A0F
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 10:19:50AM +0800, Xingjing Deng wrote:
> This issue was also identified through static program analysis and
> subsequently verified via manual inspection. I believe I have
> uncovered a potential risk of abnormal execution here, hence I’m
> reporting this problem.

Again, you need to document this fact, please read the rules for
submitting patches that are found by tools.  And say you have not tested
this, because that means there is a much lower chance that the change is
correct.

thanks,

greg k-h
