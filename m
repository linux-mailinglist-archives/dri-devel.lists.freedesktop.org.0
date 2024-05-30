Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 996E38D5264
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 21:37:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3159510E455;
	Thu, 30 May 2024 19:37:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q/sATynE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99C1110E455
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 19:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717097854; x=1748633854;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=s69XUBuNSqtW2N7py8+bRDlZkoqPxwARZ/NZbDuMcLk=;
 b=Q/sATynEdDFWZfCG97gLfQaxYXAdGijbEk8vrRIWkm++kTmtYsaDMbA5
 2Zgjqapr+BUNWEhzy7N8mbtdm1prJbOtWnEBPogk00o8SBl1To1C0QS6x
 Bcf45P4qYy1DYxZo0Zy8Qf5IVbZHKBTzA4mcb84FaiM4QVet7jkBedRVL
 R+94XLxh4DK3hL/ynEXxKtjhUlOChfEi5yht6r8d75xq9cFfBF9MqKCwU
 uiY7FERLrdNMPPW5i/YBvZrXTrcxtbylTBosYrJHdsAZAvCXkgtYjs14a
 Y2OFjTVEp299QTYPYC6/JAdrqxN77zcSorVuPX1+0oaP3upRySezPqtYJ Q==;
X-CSE-ConnectionGUID: AuCWNoOiSbScrefkmTxfMA==
X-CSE-MsgGUID: DcQuFbfrTYKqyoTnk2B+Xw==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="11825698"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; d="scan'208";a="11825698"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 12:37:32 -0700
X-CSE-ConnectionGUID: tlI6FsC7See4IdkDPoJUVg==
X-CSE-MsgGUID: 0FBFVQVsSU6QaRVhHHXaaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; d="scan'208";a="59107119"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.167])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 12:37:25 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: John Harrison <john.c.harrison@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/print: Introduce drm_line_printer
In-Reply-To: <146d5133-f3be-4411-b020-a177254a65bc@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240528130622.1152-1-michal.wajdeczko@intel.com>
 <1bf31a4b-fede-4044-8390-abb2b833608d@intel.com>
 <877cfbivrv.fsf@intel.com>
 <146d5133-f3be-4411-b020-a177254a65bc@intel.com>
Date: Thu, 30 May 2024 22:37:21 +0300
Message-ID: <87ed9jgkge.fsf@intel.com>
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

On Thu, 30 May 2024, John Harrison <john.c.harrison@intel.com> wrote:
> Except that the whole reason this was started was because Michal
> absolutely refuses to allow line counted output in a sysfs/debugfs
> file because "it is unnecessary and breaks the decoding tools".

I'm only looking at this patch at face value, it seems useful to me, but
I'm not aware of any deeper context. And judging by the tone of the
discussion, I also don't want to get into it.

That said, might be prudent to post a patch using the line printer along
with its addition.

Over and out.


BR,
Jani.

-- 
Jani Nikula, Intel
