Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 105DF3F2CA9
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 15:01:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51948882AF;
	Fri, 20 Aug 2021 13:01:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C762882AF
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 13:01:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 240D760F91;
 Fri, 20 Aug 2021 13:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629464507;
 bh=hR9/dWKch9bWcZVekLGpeTN+QgH+wrPKEnQu7sKE6gE=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=iL5B0OnfS09Z6jgzNGIvcQFyqKtx0MIgVwjS6nXRztExcUS2/6XSytizisvwUSaBH
 A0JSHcr9CVtXdkxzt+kWsv5yS6u1cwiRgw5/B3WFYCgaMIs4xP6ri3x92TnItlwdzH
 6kLmpnpPgryp0SPPhYNqZh2RrqypcTQFBX9LbS6VjLhq+qXmPuGwzdRKiDm9GaBC0W
 Moy8HGrP/pCRHSH5Q0Qki/1eY7EPHmaczPRKJqimZYN33s08zrijFsE31SDeyowHxm
 E813jEqNaw7/Y6UHsN6VohsEPFQRSsv7+AeRbyiCVrSmxRUiseUY+uVSBXeikij8vf
 +8lrCMkrSIN7A==
Date: Fri, 20 Aug 2021 15:01:43 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Kees Cook <keescook@chromium.org>
cc: linux-kernel@vger.kernel.org, 
 Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
 linux-input@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andrew Morton <akpm@linux-foundation.org>, linux-wireless@vger.kernel.org, 
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-staging@lists.linux.dev, linux-block@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 22/63] HID: cp2112: Use struct_group() for memcpy()
 region
In-Reply-To: <20210818060533.3569517-23-keescook@chromium.org>
Message-ID: <nycvar.YFH.7.76.2108201501340.15313@cbobk.fhfr.pm>
References: <20210818060533.3569517-1-keescook@chromium.org>
 <20210818060533.3569517-23-keescook@chromium.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Tue, 17 Aug 2021, Kees Cook wrote:

> In preparation for FORTIFY_SOURCE performing compile-time and run-time
> field bounds checking for memcpy(), memmove(), and memset(), avoid
> intentionally writing across neighboring fields.
> 
> Use struct_group() in struct cp2112_string_report around members report,
> length, type, and string, so they can be referenced together. This will
> allow memcpy() and sizeof() to more easily reason about sizes, improve
> readability, and avoid future warnings about writing beyond the end of
> report.
> 
> "pahole" shows no size nor member offset changes to struct
> cp2112_string_report.  "objdump -d" shows no meaningful object
> code changes (i.e. only source line number induced differences.)
> 
> Cc: Jiri Kosina <jikos@kernel.org>
> Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

