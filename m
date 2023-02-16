Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 233B86991CF
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 11:39:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 553D510ED25;
	Thu, 16 Feb 2023 10:39:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A94E10ED1C
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 10:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676543973; x=1708079973;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VpDkwib9b5Jg2Zr5F6aRX7t0TwQZWlLJXwWMX8yOwKw=;
 b=Lzxj2w8R9QNhmr6ekzCOwcN66U3Xru4Nh2ZJ97gMxbiUWUZbou91SZpu
 xAVM5J0h+MYFgF5CinmHUTIKf6gCpCQBLgqkYUQLvRxWI7+9NrMFyrUPG
 RkjRnQETHU/MlnJCdOZGNbZh1TTvKmnXMCatpi/SwslFero48uCRB6hMF
 S0jWIOg+jMa0JX8ZIFuQ7f+YZI6RYFihbwa2PQdLYP7IT9KLi3Seik8kL
 eN5Eib95fMMQatwVtN1L8p4AUp+RwrMguyBAFJr7Mkevv3qukOKahRxzf
 LxMFTm3wk+RYIiJznmXpSZFZJ1Xm92k32gra2sc/5X3+Ku+agk/PyB5zx g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="315362063"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="315362063"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 02:39:32 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="647632500"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="647632500"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 02:39:28 -0800
Date: Thu, 16 Feb 2023 11:39:26 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [PATCH 18/27] habanalabs: change user interrupt to threaded IRQ
Message-ID: <20230216103926.GB2849548@linux.intel.com>
References: <20230212204454.2938561-1-ogabbay@kernel.org>
 <20230212204454.2938561-18-ogabbay@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230212204454.2938561-18-ogabbay@kernel.org>
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
Cc: Tal Cohen <talcohen@habana.ai>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Feb 12, 2023 at 10:44:45PM +0200, Oded Gabbay wrote:
> -		rc = request_irq(irq, irq_handler, 0, gaudi2_irq_name(i), &hdev->user_interrupt[j]);
> +		rc = request_threaded_irq(irq, irq_handler, hl_irq_user_interrupt_thread_handler,
> +				IRQF_ONESHOT, gaudi2_irq_name(i), &hdev->user_interrupt[j]);
> +

Would be nice to change to devm_ and simplify exit paths. Up to you. 

Regards
Stanislaw

