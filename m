Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CCC9F0665
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 09:35:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 294AE10EF51;
	Fri, 13 Dec 2024 08:35:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jT2prM+g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA1FF10EF51;
 Fri, 13 Dec 2024 08:35:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E2DD85C5F33;
 Fri, 13 Dec 2024 08:34:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 048BCC4CED0;
 Fri, 13 Dec 2024 08:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734078909;
 bh=QP1IcOeCvYcZ0atShD+bUuKM45SXUGPe32/BoheXswE=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=jT2prM+gHqgOY35eQxxtPZwHA84An0lqy+jJ4VjIx/MgK1xmiD1DupxMjf1BS03DE
 jZKWiIDCMt1Dut/x6m5L9fRJeEudaFG0io8G3ncIqNeuSovHHU6r1ld8RMRlNvYDpa
 xrevaMDxiqOpjSDNbOBuOR7Vzdc+lUvOs1EjKeGIVmo5CDYD8xMYam7fQYbJQZ4t5y
 65QYPQFntmM6u8+bZMdZspFgP3N8nup2XcikiW16KkJNw/jEEdh3qWOP86QD6gwI1C
 TDF9UTrcZ/Kf8aeh/E/rxyUESdoujS5qHrLHpERCndLqc6ZpUushFrg5pfoKhQ2Mp/
 erc2nOq42tNsg==
From: Kalle Valo <kvalo@kernel.org>
To: Petr Mladek <pmladek@suse.com>
Cc: Yafang Shao <laoar.shao@gmail.com>,  torvalds@linux-foundation.org,
 akpm@linux-foundation.org,  linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org,  x86@kernel.org,
 linux-snps-arc@lists.infradead.org,  linux-wireless@vger.kernel.org,
 intel-gfx@lists.freedesktop.org,  intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org,  dri-devel@lists.freedesktop.org,
 ocfs2-devel@lists.linux.dev,  Steven Rostedt <rostedt@goodmis.org>,  Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>,  Rasmus Villemoes
 <linux@rasmusvillemoes.dk>,  Sergey Senozhatsky
 <senozhatsky@chromium.org>,  Andy Whitcroft <apw@canonical.com>,  Joe
 Perches <joe@perches.com>,  Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [PATCH 1/7] vsprintf: Add %pTN to print task name
References: <20241213054610.55843-1-laoar.shao@gmail.com>
 <20241213054610.55843-2-laoar.shao@gmail.com>
 <Z1vq2-V7vB5KhBR9@pathway.suse.cz>
Date: Fri, 13 Dec 2024 10:35:03 +0200
In-Reply-To: <Z1vq2-V7vB5KhBR9@pathway.suse.cz> (Petr Mladek's message of
 "Fri, 13 Dec 2024 09:05:47 +0100")
Message-ID: <87r06crnew.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
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

Petr Mladek <pmladek@suse.com> writes:

> On Fri 2024-12-13 13:46:04, Yafang Shao wrote:
>> Since the task->comm is guaranteed to be NUL-ternimated, we can print it
>> directly. Add a new vsnprintf format specifier "%pTN" to print task comm,
>> where 'p' represents the task Pointer, 'T' stands for Task, and 'N' denots
>> Name. With this abstraction, the user no longer needs to care about
>> retrieving task name.
>
> What is the advantage, please?
>
> Honestly, I believe that the meaning of
>
> 	printk("%s\n", task->comm);
>
> is much more clear than using a cryptic %pXYZ modifier:
>
> 	printk("%pTN\n", task);
>
>
> The %pXYZ modifiers makes sense only when the formatting of the printed
> information needs some processing. But this is a plain string.
> IMHO, it is not worth it. In fact, I believe that it is a
> counter productive.

I agree, it makes the code harder to read for someone who is not
familiar with all the %p magic we have (like me).

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
