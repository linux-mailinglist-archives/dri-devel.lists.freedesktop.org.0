Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJ2yBpV0fGmAMwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 10:06:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A996FB8B94
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 10:06:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A8AA10E963;
	Fri, 30 Jan 2026 09:06:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=orange.fr header.i=@orange.fr header.b="QyJd1PQL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-80.smtpout.orange.fr
 [80.12.242.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7649510E173
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 09:18:18 +0000 (UTC)
Received: from [IPV6:2a01:cb1c:8326:c500:bfc0:b7c5:d0ed:4f38]
 ([IPv6:2a01:cb1c:8326:c500:bfc0:b7c5:d0ed:4f38])
 by smtp.orange.fr with ESMTPA
 id lOAIvMmdHENaOlOAIvZhsQ; Thu, 29 Jan 2026 10:18:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.fr;
 s=t20230301; t=1769678296;
 bh=UM8iBqMDsUWhzMzQ9Tf5yBcRW3jJ9+1KuJO+unr000U=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=QyJd1PQLKzY43wAqv62nST6MyzBHr4Q3QvKVl9G3WHhmN9AW9He384fcZQJTpEgeS
 WzEczwkt1FtLrQc6zTFSCPoHs7eLRTpPFOzF8Z4iaatgjwdDm2eHESQYf/JdxH2VE7
 ZMKM0b8ViLwH+RNmorDev5XkQLth83aMRj+b65SlwFZhkvGWDBfqV7obbuQmA+FEMD
 xaTJwXBBiTjru+mcAyqXr7lELGpZRMAtO4ZsPNOqjFmUOkWpugwjlaIFucQR4EbPmy
 C+RxumUSqiFUfxARNSVwjMxDaqQVa3hHP89DVdtbgqxfMmzZ/LbQe37nHDXkUg5PK9
 mi7fpswEb5Wng==
X-ME-Helo: [IPV6:2a01:cb1c:8326:c500:bfc0:b7c5:d0ed:4f38]
X-ME-Auth: cGF1bC5yZXRvdXJuZUBvcmFuZ2UuZnI=
X-ME-Date: Thu, 29 Jan 2026 10:18:16 +0100
X-ME-IP: 2a01:cb1c:8326:c500:bfc0:b7c5:d0ed:4f38
Message-ID: <6606a440-546d-4b71-a244-86bb7c819d49@orange.fr>
Date: Thu, 29 Jan 2026 10:18:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: fbtft: use guard() to simplify code
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Paul Retourne <paul.retourne@orange.fr>
References: <20260128212644.1170970-1-paul.retourne@orange.fr>
 <aXqI7qbxZEulU_GO@smile.fi.intel.com>
Content-Language: en-US, fr
From: Paul Retourne <paul.retourne@orange.fr>
Autocrypt: addr=paul.retourne@orange.fr; keydata=
 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
In-Reply-To: <aXqI7qbxZEulU_GO@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 30 Jan 2026 09:06:10 +0000
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
	DMARC_POLICY_ALLOW(-0.50)[orange.fr,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[orange.fr:s=t20230301];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:paul.retourne@orange.fr,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,orange.fr];
	FREEMAIL_FROM(0.00)[orange.fr];
	FORGED_SENDER(0.00)[paul.retourne@orange.fr,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paul.retourne@orange.fr,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[orange.fr:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,orange.fr:mid,orange.fr:dkim]
X-Rspamd-Queue-Id: A996FB8B94
X-Rspamd-Action: no action

On 1/28/26 23:08, Andy Shevchenko wrote:
> Sorry, but I don't see much value in this change.

Understood, I see the problem, I'll try to do changes that are actually 
useful in the future.

Thank you for looking at it and taking the time to answer.

-- 
Paul Retourné
