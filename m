Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE0169984B
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 16:05:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 903C410E33F;
	Thu, 16 Feb 2023 15:05:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7050310E33F
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 15:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676559899; x=1708095899;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=BFdqLxxg9pibzYNvmZ7ksdDne/wIzTtAPpB6bj0CDy0=;
 b=iTs/VLX5g8Bl5fhzD34Aa8h0NiPDEfWvvs9v90O0L/89SAEse6TGfaXK
 juVItSQvXy3Z07AcMRYMoV9AYI/L6VJMAJ0WhYQINH9fUjtjuDpiUSHUc
 OfpDBJFqsO2aItk95qOxp09/Ke/tF1f9obJRmzajcels+kqTTPsMR/19X
 jdH51RTs4lKjh+aXWVQW5FMWuGiLDoivsmI4btaWSL+WhJVGpuRJO76nQ
 QU/y8Pyp/UqZ8egYeU4xm+WMtgYll44E6QT5Gg90o2IUYIBsiTNzYgXTl
 0IL8JPhxYoIvxhRHY1QS8ffEyL830Up0T1iti02uTr22KvVwq5c9UULi9 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="333907103"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="333907103"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 07:04:57 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="733896512"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="733896512"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 07:04:51 -0800
Date: Thu, 16 Feb 2023 16:04:47 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [PATCH 08/27] habanalabs: add info when FD released while device
 still in use
Message-ID: <20230216150447.GJ2849548@linux.intel.com>
References: <20230212204454.2938561-1-ogabbay@kernel.org>
 <20230212204454.2938561-8-ogabbay@kernel.org>
 <20230216122545.GE2849548@linux.intel.com>
 <CAFCwf13c6T-S2MgwmWJkrQTwdXYDGMK+GG8ZVUjPipsXNrW_ZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFCwf13c6T-S2MgwmWJkrQTwdXYDGMK+GG8ZVUjPipsXNrW_ZQ@mail.gmail.com>
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
Cc: Tomer Tayar <ttayar@habana.ai>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 16, 2023 at 04:21:48PM +0200, Oded Gabbay wrote:
> On Thu, Feb 16, 2023 at 2:25 PM Stanislaw Gruszka
> <stanislaw.gruszka@linux.intel.com> wrote:
> >
> > On Sun, Feb 12, 2023 at 10:44:35PM +0200, Oded Gabbay wrote:
> > > From: Tomer Tayar <ttayar@habana.ai>
> > >
> > > When user closes the device file descriptor, it is checked whether the
> > > device is still in use, and a message is printed if it is.
> >
> > I guess this is only for debugging your user-space component?
> > Because kernel driver should not make any assumption about
> > user-space behavior. Closing whenever user wants should be
> > no problem.
> First of all, indeed the user can close the device whatever it wants.
> We don't limit him, but we do need to track the device state, because
> we can't allow a new user to acquire the device until it is idle (due
> to h/w limitations).
> Therefore, this print is not so much for debug, as it is for letting
> the user know the device wasn't idle after he closed it, and
> therefore, we are going to reset it to make it idle.
> So, it is a notification that is important imo.

This sounds like something that should be handed in open() with -EAGAIN
error with eventual message in dmesg. But you know best what info
is needed by user-space :-)

> > > +static void print_device_in_use_info(struct hl_device *hdev, const char *message)
> > > +{
> > > +     u32 active_cs_num, dmabuf_export_cnt;
> > > +     char buf[64], *buf_ptr = buf;
> > > +     size_t buf_size = sizeof(buf);
> > > +     bool unknown_reason = true;
> > > +
> > > +     active_cs_num = hl_get_active_cs_num(hdev);
> > > +     if (active_cs_num) {
> > > +             unknown_reason = false;
> > > +             compose_device_in_use_info(&buf_ptr, &buf_size, " [%u active CS]", active_cs_num);
> > > +     }
> > > +
> > > +     dmabuf_export_cnt = atomic_read(&hdev->dmabuf_export_cnt);
> > > +     if (dmabuf_export_cnt) {
> > > +             unknown_reason = false;
> > > +             compose_device_in_use_info(&buf_ptr, &buf_size, " [%u exported dma-buf]",
> > > +                                             dmabuf_export_cnt);
> > > +     }
> > > +
> > > +     if (unknown_reason)
> > > +             compose_device_in_use_info(&buf_ptr, &buf_size, " [unknown reason]");
> > > +
> > > +     dev_notice(hdev->dev, "%s%s\n", message, buf);
> >
> > why not print counters directly, i.e. "active cs count %u, dmabuf export count %u" ?
> Because we wanted to print the specific reason, or unknown reason, and
> not print all the possible counters in one line, because most of the
> time most of the counters will be 0.
> We plan to add more reasons so this helper simplifies the code.

Ok, just place replace compose_device_in_use_info() with snprintf().
I don't think you need custom implementation of snprintf().

> > > +             print_device_in_use_info(hdev, "User process closed FD but device still in use");
> > >               hl_device_reset(hdev, HL_DRV_RESET_HARD);
> >
> > You really need reset here ?
> Yes, our h/w requires that we reset the device after the user closed
> it. If the device is not idle after the user closed it, we hard reset
> it.
> If it is idle, we do a more graceful reset.

Hmm, ok.

Regards
Stanislaw

