Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7151D4B2956
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 16:47:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA12B10EA70;
	Fri, 11 Feb 2022 15:46:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BF1010EA70;
 Fri, 11 Feb 2022 15:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644594413; x=1676130413;
 h=message-id:subject:from:to:date:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=pVxiaW+vV0quQ79sfEqbYXTjlLZHvVBgUsqT5Tk+lEY=;
 b=T9CM3fi5XzxOKxmxDDFxrwCZ/7XfVh0QsmL3voYJQZylHhHJ880b8Shx
 koP20RAuzPuMChRyjBfHKqZo8dMi60p4EXh2GdWDbwz2pjyOynj31LLs1
 pAns0uY0l4hUcBuVqJoSDfM4WF6G8+ew4Pt1RGP3f6/Zd3BI9augt+rST
 scynOEDC8qL0YlcakcUT2elDZmilVwGd+Nm7wewsyz7uAFWl5QNA5UFUi
 pX+hvRfoyaPIcmSokxNoz1z8/zlQ8qVOUogTNOMJ6hZHYhWbnAGzz24zX
 DSnDV6ypiojXMvNL8Drzm7IinFHuq9xQSgeLiLHNg5JuXrJ6WCCl5Pn8f A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="230394983"
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; d="scan'208";a="230394983"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 07:46:52 -0800
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; d="scan'208";a="542134195"
Received: from ankitata-mobl1.amr.corp.intel.com (HELO
 spandruv-desk1.amr.corp.intel.com) ([10.212.170.20])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 07:46:51 -0800
Message-ID: <077501bfcb710c66754c61d69e45cac66fccf38a.camel@linux.intel.com>
Subject: Re: [PATCH V2 5/13] hid: use time_is_after_jiffies() instead of
 jiffies judgment
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: Qing Wang <wangqing@vivo.com>, Konrad Rzeszutek Wilk
 <konrad.wilk@oracle.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>, Jens Axboe <axboe@kernel.dk>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>,  Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,  Alex
 Deucher <alexander.deucher@amd.com>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>,  "Pan, Xinhui" <Xinhui.Pan@amd.com>, Jiri
 Kosina <jikos@kernel.org>, Benjamin Tissoires
 <benjamin.tissoires@redhat.com>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>,  Alasdair Kergon <agk@redhat.com>, Mike
 Snitzer <snitzer@redhat.com>, dm-devel@redhat.com,  Mauro Carvalho Chehab
 <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
 xen-devel@lists.xenproject.org, linux-block@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, linux-input@vger.kernel.org, 
 linux-media@vger.kernel.org
Date: Fri, 11 Feb 2022 07:46:51 -0800
In-Reply-To: <1644546640-23283-6-git-send-email-wangqing@vivo.com>
References: <1644546640-23283-1-git-send-email-wangqing@vivo.com>
 <1644546640-23283-6-git-send-email-wangqing@vivo.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35) 
MIME-Version: 1.0
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

On Thu, 2022-02-10 at 18:30 -0800, Qing Wang wrote:
> From: Wang Qing <wangqing@vivo.com>
> 
> It is better to use time_xxx() directly instead of jiffies judgment
> for understanding.
> 
> Signed-off-by: Wang Qing <wangqing@vivo.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

> ---
>  drivers/hid/intel-ish-hid/ipc/ipc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/intel-ish-hid/ipc/ipc.c b/drivers/hid/intel-
> ish-hid/ipc/ipc.c
> index 8ccb246..15e1423
> --- a/drivers/hid/intel-ish-hid/ipc/ipc.c
> +++ b/drivers/hid/intel-ish-hid/ipc/ipc.c
> @@ -578,7 +578,7 @@ static void _ish_sync_fw_clock(struct
> ishtp_device *dev)
>         static unsigned long    prev_sync;
>         uint64_t        usec;
>  
> -       if (prev_sync && jiffies - prev_sync < 20 * HZ)
> +       if (prev_sync && time_is_after_jiffies(prev_sync + 20 * HZ))
>                 return;
>  
>         prev_sync = jiffies;

