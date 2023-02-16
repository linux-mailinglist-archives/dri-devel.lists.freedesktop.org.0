Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3952699124
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 11:28:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CD3210ED15;
	Thu, 16 Feb 2023 10:28:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D10510ED15
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 10:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676543305; x=1708079305;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9Q4sbX4/KawsBwP3EbTJaA3b63E1F+jOxphyvCxkMXo=;
 b=E66M2dP/9169yIZ6StUhAT9VXXvSf6Dp61CC0/yb+RFb2iPXTvce6qmx
 2Z1QhO/5Nkb8/65lx+w1q0RoDbFs4eXVqrgIMWUvFS2EmkBg6z2PPtBW4
 1SMt0kzvHg9BIbWoFdUS3J6puVQnYBYAm5XRxFsUcOqI1ZPYu+JJZgkb4
 E3LQb3Qh2EYnXbUltb8Mxu/RK1XkPdXRnR+0TQ8zNzaCzYDY5Xb4bIPOl
 Dx8sUxELTXC0VUomaGqdoxhTW2J/QbuPFI7ZUe1Gvi25lREjOCRYCIQ2g
 9K76G3AQIfJsniuztxk8gHPEhaRJP1fR0JDPbX9f1YQidrbyuRx+E2Y9L Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="417905734"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="417905734"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 02:28:25 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="702504176"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="702504176"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 02:28:23 -0800
Date: Thu, 16 Feb 2023 11:28:21 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [PATCH 18/27] habanalabs: change user interrupt to threaded IRQ
Message-ID: <20230216102821.GA2849548@linux.intel.com>
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

Hi

On Sun, Feb 12, 2023 at 10:44:45PM +0200, Oded Gabbay wrote:

>  irqreturn_t hl_irq_handler_user_interrupt(int irq, void *arg)
> +{
> +	return IRQ_WAKE_THREAD;
> +}

This is not needed. You can pass NULL to request_threaded_irq() and
the irq core will use irq_default_primary_handler() which is exactly
the same function :-)

Regards
Stanislaw


