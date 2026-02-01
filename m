Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCuVKjKBf2lysQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Feb 2026 17:37:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 057A7C684B
	for <lists+dri-devel@lfdr.de>; Sun, 01 Feb 2026 17:37:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60F0210E02D;
	Sun,  1 Feb 2026 16:37:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qg1h/jyj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 556C210E02D
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Feb 2026 16:37:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1DB3B41987;
 Sun,  1 Feb 2026 16:36:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4A1FC4CEF7;
 Sun,  1 Feb 2026 16:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769963818;
 bh=ZK8UH6lZb0WzcRQp7vKfUyuwca2Tzk21UZa2ha/5n44=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qg1h/jyjia2HFovgvsawWT2Uj72nQiYNBKxjj7a6dvwpWBFxHC5ww0x+UoZR0Pzlz
 gomt0vWyWLC2lEZb8gH8Sie02005eGfxc0Al9c9PVM5Ll5KIfggtoKgs6H6wtqPWrF
 JzuR6iuY3owfuLrh/Tm5oZLYHp84J5pBDEupB2iFjju7Wl+Pi0AW9QJ1/awVLWDrEr
 MOHjAOo016UXjmPXKiFzSiObnkN+ZiK/AZrLK/qcKu03NABmjai4QWNpPqLjrb9yq3
 aoEhfdHM+hEJGGYfe5ksGXU23tCVySMb6uvDwDK6oDilE6XlnxsvAq9WBh3TMsDThR
 FDMCrLOtoJBAw==
Date: Sun, 1 Feb 2026 06:36:57 -1000
From: Tejun Heo <tj@kernel.org>
To: Chen Ridong <chenridong@huaweicloud.com>
Cc: dev@lankhorst.se, mripard@kernel.org, natalie.vock@gmx.de,
 hannes@cmpxchg.org, mkoutny@suse.com, cgroups@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lujialin4@huawei.com
Subject: Re: [PATCH -next 0/3] cgroup/dmem: bugfixes
Message-ID: <aX-BKaEXXtgPaerw@slm.duckdns.org>
References: <20260131091202.344788-1-chenridong@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260131091202.344788-1-chenridong@huaweicloud.com>
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:chenridong@huaweicloud.com,m:dev@lankhorst.se,m:mripard@kernel.org,m:natalie.vock@gmx.de,m:hannes@cmpxchg.org,m:mkoutny@suse.com,m:cgroups@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:lujialin4@huawei.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[tj@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lankhorst.se,kernel.org,gmx.de,cmpxchg.org,suse.com,vger.kernel.org,lists.freedesktop.org,huawei.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tj@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[slm.duckdns.org:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 057A7C684B
X-Rspamd-Action: no action

On Sat, Jan 31, 2026 at 09:11:59AM +0000, Chen Ridong wrote:
> From: Chen Ridong <chenridong@huawei.com>
> 
> This series fix three bugs.
> 
> Chen Ridong (3):
>   cgroup/dmem: fix NULL pointer dereference when setting max
>   cgroup/dmem: avoid rcu warning when unregister region
>   cgroup/dmem: avoid pool UAF

Other than the exit path problem flagged by the kernel test bot in the first
patch, the series look correct to me. Maarten, any inputs?

Thanks.

-- 
tejun
