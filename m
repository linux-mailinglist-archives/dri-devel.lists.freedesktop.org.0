Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5056C4A62BB
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 18:41:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BB7D10E2EA;
	Tue,  1 Feb 2022 17:41:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CFE310E189;
 Tue,  1 Feb 2022 17:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643737294; x=1675273294;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=rvV7v5jAez5oJGeUhjd3VaGKP17m0qSEWs2IYhNK24g=;
 b=FxBFZMdspZFwO6RkMeR4iXXWYw4atWCMO5jGI74hq5Jkoix5PtWIb4EE
 qv1ljTIY0EMEHDkMwSmTWQVz07ache5rC3BCCvhQPSKrCaPlttmqFkOmB
 8Epj1nepNWa1bAMhjiRYWmVe3+maio1pbH3Hl/OUmbJVotXWbfkHeM+lU
 hyW6HC9WP9M0R6WEj+3hYULYMDSg+PIcSZtzJteVov0Ojt7/slvuEg6Wa
 EsBYtgbsIbRQBbzrVID6x2BZTT8SSXVz0x6YWDTrwTV3fwxytEKJwiMmg
 mqlRSEQ9WnXDLni3Ecmxh9JoE9WkpCPyABQrvgk/qQbHX/qjEW6b54nDI Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10245"; a="227718256"
X-IronPort-AV: E=Sophos;i="5.88,334,1635231600"; d="scan'208";a="227718256"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 09:41:33 -0800
X-IronPort-AV: E=Sophos;i="5.88,334,1635231600"; d="scan'208";a="523130661"
Received: from manojbab-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.209.43.7])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 09:41:33 -0800
Date: Tue, 1 Feb 2022 09:41:33 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Subject: Re: [PATCH v3 1/3] drm: Stop spamming log with drm_cache message
Message-ID: <20220201174133.mxkwzofmocskoc5k@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220131165926.3230642-1-lucas.demarchi@intel.com>
 <20220131165926.3230642-2-lucas.demarchi@intel.com>
 <826ebabfb8a177cc451443763e274c9671a68121.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <826ebabfb8a177cc451443763e274c9671a68121.camel@intel.com>
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 01, 2022 at 09:12:05AM -0800, Jose Souza wrote:
>On Mon, 2022-01-31 at 08:59 -0800, Lucas De Marchi wrote:
>> Only x86 and in some cases PPC have support added in drm_cache.c for the
>> clflush class of functions. However warning once is sufficient to taint
>> the log instead of spamming it with "Architecture has no drm_cache.c
>> support" every few millisecond. Switch to WARN_ONCE() so we still get
>> the log message, but only once, together with the warning. E.g:
>>
>> 	------------[ cut here ]------------
>> 	Architecture has no drm_cache.c support
>> 	WARNING: CPU: 80 PID: 888 at drivers/gpu/drm/drm_cache.c:139 drm_clflush_sg+0x40/0x50 [drm]
>> 	...
>>
>> v2 (Jani): use WARN_ONCE() and keep the message previously on pr_err()
>
>Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
>
>But while at it, why not add a drm_device parameter to this function so we can use drm_WARN_ONCE()?
>Anyways, it is better than before.

I thought about that, but it didn't seem justifiable because:

1) drm_WARN_ONCE will basically add dev_driver_string() to the log.
However the warning message here is basically helping the bootstrap of
additional archs. They shouldn't be seen on anything properly supported.

2) This seems all to be a layer below drm anyway and could even be used
in places outside easy access to a drm pointer.

So, it seems the benefit of using the subsystem-specific drm_WARN_ONCE
doesn't justify the hassle of changing the callers, possibly adding
additional back pointers to have access to the drm device pointer.

thanks
Lucas De Marchi
