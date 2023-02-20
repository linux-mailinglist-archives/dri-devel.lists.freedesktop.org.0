Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D6869D0FB
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 16:54:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76AD110E695;
	Mon, 20 Feb 2023 15:54:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D02110E695
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Feb 2023 15:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676908487; x=1708444487;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pt7gPGTfVQvfWr8ld4Ya2vL4FKlhRuT8LA2fmg3mOKs=;
 b=fUtjlNQOGOMt/cT5Bw03aMKh54CX81NMhz+aJcLRH+MmcfIisc9x2lNV
 RWgjccaCUlPvzeGK07O9RwH8rcfjGAqJtR/bU9Gu0ze2oW+RnaDHIPBVA
 QZcjvXdvsT7ZZjX0DebZd6tdl3m6rqqjeVG5NM7ETZzSpi8lwgX5TiBL2
 ie2oMhodhYvaoFeEcLRpMNHvX1xKrXdz/NPmD/R+SeZMAv9fpUh0X8/d1
 X/71xr4n2OJE4/MslJmA+2HiO3xhB0cNfs7IaNzBkNm2dw0WVoKBM+Exi
 MXrGmx46gbHve0XTwqnmKjIcU+AlhMTEM2F9Ka6Ez4HmeCFbG7gztoIN/ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="320554813"
X-IronPort-AV: E=Sophos;i="5.97,313,1669104000"; d="scan'208";a="320554813"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2023 07:54:46 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="760213741"
X-IronPort-AV: E=Sophos;i="5.97,313,1669104000"; d="scan'208";a="760213741"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2023 07:54:45 -0800
Date: Mon, 20 Feb 2023 16:54:43 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Tomer Tayar <ttayar@habana.ai>
Subject: Re: [PATCH 08/27] habanalabs: add info when FD released while device
 still in use
Message-ID: <20230220155443.GF2862577@linux.intel.com>
References: <20230212204454.2938561-1-ogabbay@kernel.org>
 <20230212204454.2938561-8-ogabbay@kernel.org>
 <20230216122545.GE2849548@linux.intel.com>
 <CAFCwf13c6T-S2MgwmWJkrQTwdXYDGMK+GG8ZVUjPipsXNrW_ZQ@mail.gmail.com>
 <20230216150447.GJ2849548@linux.intel.com>
 <DU2PR02MB75734395957E6DC59D387B28D2A19@DU2PR02MB7573.eurprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DU2PR02MB75734395957E6DC59D387B28D2A19@DU2PR02MB7573.eurprd02.prod.outlook.com>
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
Cc: Oded Gabbay <ogabbay@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 17, 2023 at 11:34:39AM +0000, Tomer Tayar wrote:
 > 
> > Ok, just place replace compose_device_in_use_info() with snprintf().
> > I don't think you need custom implementation of snprintf().
> 
> compose_device_in_use_info() was added to handle in a single place the snprintf() return value and the buffer pointer moving.
> However, you are correct and it is too much here, as the local buffer size is set with a value that should be enough for max possible print.
> We will remove compose_device_in_use_info() and use snprintf() directly.

Actually the safer version would be scnprintf() since for that function
return value could not be bigger than passed len. Usage then could be
as simple as:

n += scnprintf(buf + n, len - n, ...);
n += scnprintf(buf + n, len - n, ...);

Regards
Stanislaw

