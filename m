Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B949D30A745
	for <lists+dri-devel@lfdr.de>; Mon,  1 Feb 2021 13:10:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9C1E6E523;
	Mon,  1 Feb 2021 12:10:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C3CC6E523
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 12:10:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7928C64E2C;
 Mon,  1 Feb 2021 12:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612181448;
 bh=VpXCDfyNDkFB6N2oS+yv9UYv1FFtVEhcO5B6o8eybU0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HaH7mujAr3wAdUU7Wbx8NZL1I+ehA6nkr8Ywa4kIYDvUwHUoZx2E28Pxr7ifUj0mt
 7ljJAQsR2C8cmJAhCEfFz7WlBbFbcYk6h1CXB2Y9PzQv9yo4WszIpL5OHIbr+huud/
 DTJ+YupZxs4692+MeXtltnemY6HxUucQSaELW53wykG+dmhx/UvhvmlITS+Idy3evG
 6qzrY4zJuBmI9bQgKtqj9S8Vxz3ss0nQSNYmw9hIaMuF6P5GYtPl/DuUcSxMjQJcLy
 tT307SwHtzy9d8kG545Zqjsb+38DqN6yFxfRVMnwI9dVoBzO/0f1HxxpxD93Q+NZid
 37O97iC4kLFKA==
Date: Mon, 1 Feb 2021 13:10:37 +0100
From: Jessica Yu <jeyu@kernel.org>
To: Miroslav Benes <mbenes@suse.cz>
Subject: Re: [PATCH 04/13] module: use RCU to synchronize find_module
Message-ID: <YBfvvdna9pSeu+1g@gunter>
References: <20210128181421.2279-1-hch@lst.de>
 <20210128181421.2279-5-hch@lst.de>
 <alpine.LSU.2.21.2101291626080.22237@pobox.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.LSU.2.21.2101291626080.22237@pobox.suse.cz>
X-OS: Linux gunter 5.10.9-1-default x86_64
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
Cc: Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, linux-kbuild@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Masahiro Yamada <masahiroy@kernel.org>,
 Jiri Kosina <jikos@kernel.org>, linux-kernel@vger.kernel.org,
 live-patching@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Frederic Barrat <fbarrat@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+++ Miroslav Benes [29/01/21 16:29 +0100]:
>On Thu, 28 Jan 2021, Christoph Hellwig wrote:
>
>> Allow for a RCU-sched critical section around find_module, following
>> the lower level find_module_all helper, and switch the two callers
>> outside of module.c to use such a RCU-sched critical section instead
>> of module_mutex.
>
>That's a nice idea.
>
>> @@ -57,7 +58,7 @@ static void klp_find_object_module(struct klp_object *obj)
>>  	if (!klp_is_module(obj))
>>  		return;
>>
>> -	mutex_lock(&module_mutex);
>> +	rcu_read_lock_sched();
>>  	/*
>>  	 * We do not want to block removal of patched modules and therefore
>>  	 * we do not take a reference here. The patches are removed by
>> @@ -74,7 +75,7 @@ static void klp_find_object_module(struct klp_object *obj)
>>  	if (mod && mod->klp_alive)
>
>RCU always baffles me a bit, so I'll ask. Don't we need
>rcu_dereference_sched() here? "mod" comes from a RCU-protected list, so I
>wonder.

Same here :-) I had to double check the RCU documentation. For our
modules list case I believe the rcu list API should take care of that
for us. Worth noting is this snippet from Documentation/RCU/whatisRCU.txt:

    rcu_dereference() is typically used indirectly, via the _rcu
    list-manipulation primitives, such as list_for_each_entry_rcu()


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
