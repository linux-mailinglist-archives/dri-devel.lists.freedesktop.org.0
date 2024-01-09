Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D8A828618
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 13:34:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A880B10E428;
	Tue,  9 Jan 2024 12:34:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB1510E428
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 12:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704803678; x=1736339678;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=0+i9jNaZkLVNkMhEy1xoIRC1vMa04epFDEIpHpKX834=;
 b=dt/0d7kOENasR0IPGhNpLKMitI5U6Zn6qHD+bLaMk0qg960etGNcMfYs
 VjzIPA1m6wTOOnM/x0V8+DZbiuMaKG1DjJhV8/yQhnLDPBXh7BfVs3cQn
 AP/3xV6VGL6YG1EQceOp+thTfcZEYsokFqj9F6QYyi4VpMc7KLg9zWa4g
 SbZkg381FvFo2I/X4hf6Px0ZEPMDpBWr5GBtHEURIHQ9qaCJfHNMYqspp
 CbNAXEoKAJt+o8uxWYPEX5r51H93WBvCpfG1BZ+CAcXKyPQDoxpDrXHVq
 eQy3hQpHxviz65Kab4VFKMN74QEBZzvG9z7lpWUJHTfSnMEqUcs01G2jN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="11669982"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; d="scan'208";a="11669982"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 04:34:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="955003874"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; d="scan'208";a="955003874"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.217.160.86])
 ([10.217.160.86])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 04:34:36 -0800
Message-ID: <3f972271-cf39-49f7-8f2c-568a78cd57c6@linux.intel.com>
Date: Tue, 9 Jan 2024 13:34:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] accel/ivpu: Fix potential infinite loops in IRQ
 handlers
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, dri-devel@lists.freedesktop.org
References: <20240105112218.351265-1-jacek.lawrynowicz@linux.intel.com>
 <20240105112218.351265-6-jacek.lawrynowicz@linux.intel.com>
 <663dc292-0aa0-367c-e2f3-ade7ffba3b94@quicinc.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <663dc292-0aa0-367c-e2f3-ade7ffba3b94@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 05.01.2024 17:35, Jeffrey Hugo wrote:
> On 1/5/2024 4:22 AM, Jacek Lawrynowicz wrote:
>> Limit number of iterations in ivpu_mmu_irq_evtq_handler() and
>> ivpu_ipc_irq_handler().
> 
> "potential infinite loops" sounds like something that has not been observed.  Has a problem actually occurred?
> 
> Are you concerned that the FW is broken and spamming Linux with events?
> 
> Why a limit of 100 events?  Seems arbitrary.
> 
> I suspect threaded irqs might be useful here, but it is hard to tell.

No, these problems were not observed yet.
I think that the small size of the IPC/MMU queues and relatively fast host CPU prevent the host from being overloaded.
Maybe let's drop this patch until there is a real issue then :)

