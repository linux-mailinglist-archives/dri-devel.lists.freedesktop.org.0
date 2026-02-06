Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFToE4vJhWnAGAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 11:59:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB52EFCEC7
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 11:59:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E340D10E71D;
	Fri,  6 Feb 2026 10:59:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="E4r8xJd4";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3v0g1l0a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 438 seconds by postgrey-1.36 at gabe;
 Fri, 06 Feb 2026 10:59:19 UTC
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7196710E71D
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 10:59:19 +0000 (UTC)
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1770375119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bA2jDBMBJNWRCojORjUifOX6+Gj8jMwDTcaPo1p6gdA=;
 b=E4r8xJd4am3nlGbe9r4CDQD2YUK+g1GAyld8z3KaxY3niBmpNykDD+k/x+KXrJzq/n6qQD
 Hb5UTPVzrughCkHcB9Cm871kLQIPyGd6S5OKFtqpNWJZCzXaLlMLokliR+16/fU4NyGyFR
 WLX2x+4iXzW0PtjihcoQ2qZfXT+zvtn4Vo9OltAEDEl/xXTGBBlViO9G08kHmsU6uKwXeg
 uFYH0e9MWuqaaOT3lLJXR+VAXT/5xVyu2RN68g6NocgxceQ+X0GihfrAPkIaaz6CnGw7K6
 lV6/5vXy15bIv2yrjvOsJg3KKBhPgOEQhwd6mMe/ii23KpLgC3lgoWLC7TnK1w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1770375119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bA2jDBMBJNWRCojORjUifOX6+Gj8jMwDTcaPo1p6gdA=;
 b=3v0g1l0aiObSG/tRdfqHZr1qbUvJ5SjLDpCbtm5pYdBaEgFGlYZnJZbHvY6A8Ko/+sGyZC
 a1Sv3fFb6AFFsjCg==
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: ChanSoo Shin <csshin9928@gmail.com>, andy@kernel.org,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v5] fbtft: limit dirty rows based on damage range
In-Reply-To: <aYXEHajVeKvIMmL7@smile.fi.intel.com>
References: <20260128203938.962414-1-csshin9928@gmail.com>
 <87y0l668ki.fsf@yellow.woof> <aYXEHajVeKvIMmL7@smile.fi.intel.com>
Date: Fri, 06 Feb 2026 17:51:45 +0700
Message-ID: <87ms1mb0vy.fsf@yellow.woof>
MIME-Version: 1.0
Content-Type: text/plain
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,lists.freedesktop.org,vger.kernel.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:csshin9928@gmail.com,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[namcao@linutronix.de,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[namcao@linutronix.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:dkim,yellow.woof:mid,intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: CB52EFCEC7
X-Rspamd-Action: no action

Andy Shevchenko <andriy.shevchenko@intel.com> writes:
> Do you have an actual HW to test? If not, won't be applied either.

Yes, a pair with SPI interface.

Nam
