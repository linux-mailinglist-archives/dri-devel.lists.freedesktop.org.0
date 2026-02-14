Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCCqDFfWj2noTwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 14 Feb 2026 02:56:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8019213AB98
	for <lists+dri-devel@lfdr.de>; Sat, 14 Feb 2026 02:56:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B682E10E19D;
	Sat, 14 Feb 2026 01:56:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="Sb+n9RJl";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kiWXtmdX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6606210E19D
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Feb 2026 01:56:33 +0000 (UTC)
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1771034191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6HUCehdSv7BWEJjhfmdtQXE6xdl/l2tpt/Faur9ywDM=;
 b=Sb+n9RJlLw5aRhJL1coedSR3IQEhPxX/eo229RhG4uPC2hnFkwLuT2zI+FdI6ZXzu3s5co
 KG1y+JSZU8IhSqjtOf3bOpOYdPeJXhepdXfcYVKnLdMVMjM3kRk3KMObWwypooQB3N2rOi
 8YkceM0/YY0nkhphPqPMlzZL2WHtk92ZyFbxn02Bquw/O4TYjw7/Yzv33TrTGo4dt5Fz20
 5jtoQjXrsAVovBDp44ErUhpBUOkR/XUjge0ZbxRAGyJxnh4iJnwWM/+L3UNqHZIP2fTKIe
 +xC8JMWnSqZBsE/NNrLv6aQgFhKIkBFisYtTD8Xd30riJa5sdXAcGPymVFO+jw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1771034191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6HUCehdSv7BWEJjhfmdtQXE6xdl/l2tpt/Faur9ywDM=;
 b=kiWXtmdX2JmlffBLFKeHYNy6wTbO5pOzAxmHN1tFbK0Ip2jAX3qWh022l6VUsKxHxT25z6
 j9oQv4p0GxM06vCQ==
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: Optimize partial write()
In-Reply-To: <aY76ixvOUEkvoPk0@smile.fi.intel.com>
References: <20260213085946.3673695-1-namcao@linutronix.de>
 <aY76ixvOUEkvoPk0@smile.fi.intel.com>
Date: Sat, 14 Feb 2026 08:56:09 +0700
Message-ID: <87bjhsqe9y.fsf@yellow.woof>
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[namcao@linutronix.de,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 8019213AB98
X-Rspamd-Action: no action

Andy Shevchenko <andriy.shevchenko@intel.com> writes:
> On Fri, Feb 13, 2026 at 09:59:46AM +0100, Nam Cao wrote:
>> When user write() only to part of the screen, the driver still updates the
>> entire screen. That wastes CPU cycles.
>> 
>> Optimize by updating only the changed lines. Improvement is measured by a
>> pair of trace_printk() at the beginning of fb_write() and at the end of
>> fbtft_deferred_io().
>
> Can you elaborate on the HW (the exact model of the panel and [sub]driver)
> in use?

My hardware is the Adafruit's ILI9340. Driver is fbtft/fb_ili9340.c.

...
>> -	/* special case, needed ? */
>
> Do you know the history of this comment? What is "special case" and when does it appear?

This allows caller to pass -1 to "make dirty" the entire screen. The
only caller that uses this special case is removed in this patch.

...
>>  static void fbtft_ops_damage_range(struct fb_info *info, off_t off, size_t len)
>>  {
>>  	struct fbtft_par *par = info->par;
>> +	u32 start, end;
>> +
>> +	start = off / info->fix.line_length;
>> +	end = (off + len - 1) / info->fix.line_length;
>>  
>> -	/* TODO: only mark changed area update all for now */
>
> Ah, this change actually targets the TODO!
>
>> -	par->fbtftops.mkdirty(info, -1, 0);
>> +	par->fbtftops.mkdirty(info, start, end - start + 1);
>>  }
>
> ...
>
> In light of the last TODO line I think that the change is desired by
> the original author. Nevertheless I am wondering about these side effects
> that might be (very unlikely?) considered if this code (partial refresh)
> runs for a significant period of time:
>
> - some bits of the screen (on non-updated part) might be flipped
> - the static picture may lead to wearing of (decolourisation) the panel
> - what is the thermal distribution (probably with backlight off)?
>
> Maybe it makes sense to refresh a full screen from time to time, but
> TBH my knowledge of TFT panels from last decade is quite limited. I only
> think from the point of the general physics and common sense. That's
> why this long footnote rather philosophical, but I would be glad to
> learn the state of affairs of the modern TFT panels in terms of the
> physical parameters lasting over the time under different application
> cases.

I can't tell you much about TFT panels, sorry. My company used to do a
demo board with one of them, that's how I have some hardware to play with.

If user uses mmap() instead of write(), then full refresh is never done
(well, unless user writes to the entire screen). So if lack of refresh
is a problem, someone should have noticed already.

Nam
