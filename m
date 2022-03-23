Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D167D4E4CBC
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 07:29:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C41610E5D6;
	Wed, 23 Mar 2022 06:29:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D40210E5D6
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 06:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648016946; x=1679552946;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qYhCQK2IAIF2oV99iQJIbMz/f3LL+q6+1d0oNGCYkR4=;
 b=JKB6i9nY6aDCXCBf3apYOqYUg+nQSpimhOJGcxLlnKJsPyMQRNzJ1kck
 u+nM7BetD1AH+DZfoaKIoR+mmJoFyHHo9nWqz+LkqDadghqOuDGw7wsXe
 Z2t9TELLZkgZ5Bq+cVDeQX1crujX0KG7sZhihqXb6fglGFAfVxobxa429
 7kWzVZYLsSN1FZDshHARO315SthflZHeYOS4GsVduDLfmwNt6TEsgXq3Y
 nNigmLCfSefsNnDJUbI3wOZCTq0MWVD6RKyL2hTRkiBrpePJTOUY6wXQt
 XiPz9z/0yw/M/6JLetHZQMW5R6wBxg8Vs2jet4nuyEOiAluJeU4opZhGP A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10294"; a="321231931"
X-IronPort-AV: E=Sophos;i="5.90,203,1643702400"; d="scan'208";a="321231931"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 23:29:04 -0700
X-IronPort-AV: E=Sophos;i="5.90,203,1643702400"; d="scan'208";a="601184431"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 23:29:01 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 23 Mar 2022 08:28:58 +0200
Date: Wed, 23 Mar 2022 08:28:58 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Won Chung <wonchung@google.com>
Subject: Re: Question regarding using Driver Component Framework (crashing
 kernel)
Message-ID: <Yjq+KgyGQxVclz/d@lahna>
References: <CAOvb9yjqnqGL9s4dDKyBfyybFftFXKKOgTWAxPJ3WRHF6Tv1OQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOvb9yjqnqGL9s4dDKyBfyybFftFXKKOgTWAxPJ3WRHF6Tv1OQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: Benson Leung <bleung@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Prashant Malani <pmalani@google.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Don't you have like a serial port that you can turn on early debugging
to see where it blows up? If not that then at least the USB 3 DbC.

On Tue, Mar 22, 2022 at 12:01:15PM -0700, Won Chung wrote:
> Hi,
> 
> I am not sure if this is the correct mailing list to ask about Driver
> Component Framework, so if I am mistaken, I would appreciate it if
> anyone can correct me to the right direction.
> 
> I have a quick question on using driver component framework and a
> strange crash I am seeing when I use component framework.
> 
> There is then component framework currently being used for typec
> connector, as below
> https://elixir.bootlin.com/linux/latest/source/drivers/usb/typec/port-mapper.c
> We add component for usb port to link it with typec connector, as below
> https://elixir.bootlin.com/linux/latest/source/drivers/usb/core/port.c#L622
> https://elixir.bootlin.com/linux/latest/source/drivers/usb/core/port.c#L568
> 
> We are trying to do something similar for usb4 port, add component to
> link to typec connector.
> I have attached a patch to this email for reference.
> However, this change causes a crash in kernel for some devices.
> The crash is too early in the kernel that it is not giving any logs at all.
> This crash is somehow fixed when we change usb4 config from =y
> (built-in) to =m (loadable module).
> So, I am curious if there are some aspects in the component framework
> that depends on whether the device with a component added is a
> built-in or loadable module.
> 
> If anyone has seen a similar issue or have an idea on what is
> happening, can you share your thoughts on what might be the issue and
> how the crash can be avoided?
> Thank you very much!
> 
> Won


