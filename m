Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A07C6DF9C
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 11:27:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB0510E5CE;
	Wed, 19 Nov 2025 10:27:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a2rG3LKK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25DCE10E5CA;
 Wed, 19 Nov 2025 10:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763548034; x=1795084034;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jmw9bhTP6DqEEo8SaI642JH1s3dFqQGzetmEw8f3+f0=;
 b=a2rG3LKK7zrREVyFoZGBLCSXXmyycmw07I+jkBYSX7Nr0C7fZxXWQ6/6
 sV4QS3nac4iVTt3JF7DY7QLwtozDtpu0XpEdd8vGDTYpw1CNMC6bk3V6Q
 n2knbfUPLkQGNwvYcOqUCBd4zJlpKBsvKWZHmezcw8XNMwzm7V6QAuTMm
 +ZVDcml27L669p51xNQ/HRhUsjk51GQD1NwWp0ee52R70+hBsiX/lHoeA
 8hc0Ti9sdq60IJ1SRw33s8Tma2OXljTPTCiNOEN3CzSsfLdbnl5OlyR0s
 kWei3mTHywiE6Yzh5t/+DWPNgJs1r4hIryifVIvf7XKVgDSv/aknjjRJq Q==;
X-CSE-ConnectionGUID: BP1OGhOyR3G5u2l9w7QN6A==
X-CSE-MsgGUID: QWqZCdVVSOSZC73kQOkMbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65286208"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="65286208"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 02:27:12 -0800
X-CSE-ConnectionGUID: BabbyDhyQAOE+ZtEsTT7/g==
X-CSE-MsgGUID: bIH3DAOlTZmt1WuzGTp/dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="195322765"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.245])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 02:26:53 -0800
Date: Wed, 19 Nov 2025 12:26:51 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Petr Mladek <pmladek@suse.com>
Cc: Corey Minyard <corey@minyard.net>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Dr. David Alan Gilbert" <linux@treblig.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
 Vitaly Lifshits <vitaly.lifshits@intel.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Niklas Cassel <cassel@kernel.org>, Calvin Owens <calvin@wbinvd.org>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Sagi Maimon <maimon.sagi@gmail.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Karan Tilak Kumar <kartilak@cisco.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Casey Schaufler <casey@schaufler-ca.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>,
 Max Kellermann <max.kellermann@ionos.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-mmc@vger.kernel.org,
 netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
 linux-pci@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-staging@lists.linux.dev,
 ceph-devel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Rodolfo Giometti <giometti@enneenne.com>,
 Jonathan Lemon <jonathan.lemon@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Stefan Haberland <sth@linux.ibm.com>,
 Jan Hoeppner <hoeppner@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Satish Kharat <satishkh@cisco.com>,
 Sesidhar Baddela <sebaddel@cisco.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v3 19/21] scsi: fnic: Switch to use %ptSp
Message-ID: <aR2bazZn8m4EMHdW@smile.fi.intel.com>
References: <20251113150217.3030010-1-andriy.shevchenko@linux.intel.com>
 <20251113150217.3030010-20-andriy.shevchenko@linux.intel.com>
 <aR2XAYWTEgMZu_Mx@pathway.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aR2XAYWTEgMZu_Mx@pathway.suse.cz>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
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

On Wed, Nov 19, 2025 at 11:08:01AM +0100, Petr Mladek wrote:
> On Thu 2025-11-13 15:32:33, Andy Shevchenko wrote:
> > Use %ptSp instead of open coded variants to print content of
> > struct timespec64 in human readable format.
> 
> I was about to commit the changes into printk/linux.git and
> found a mistake during the final double check, see below.
> 
> > diff --git a/drivers/scsi/fnic/fnic_trace.c b/drivers/scsi/fnic/fnic_trace.c
> > index cdc6b12b1ec2..0a849a195a8e 100644
> > --- a/drivers/scsi/fnic/fnic_trace.c
> > +++ b/drivers/scsi/fnic/fnic_trace.c
> > @@ -215,30 +213,26 @@ int fnic_get_stats_data(struct stats_debug_info *debug,
> >  {
> >  	int len = 0;
> >  	int buf_size = debug->buf_size;
> > -	struct timespec64 val1, val2;
> > +	struct timespec64 val, val1, val2;
> >  	int i = 0;
> >  
> > -	ktime_get_real_ts64(&val1);
> > +	ktime_get_real_ts64(&val);
> >  	len = scnprintf(debug->debug_buffer + len, buf_size - len,
> >  		"------------------------------------------\n"
> >  		 "\t\tTime\n"
> >  		"------------------------------------------\n");
> >  
> > +	val1 = timespec64_sub(val, stats->stats_timestamps.last_reset_time);
> > +	val2 = timespec64_sub(val, stats->stats_timestamps.last_read_time);
> >  	len += scnprintf(debug->debug_buffer + len, buf_size - len,
> > -		"Current time :          [%lld:%ld]\n"
> > -		"Last stats reset time:  [%lld:%09ld]\n"
> > -		"Last stats read time:   [%lld:%ld]\n"
> > -		"delta since last reset: [%lld:%ld]\n"
> > -		"delta since last read:  [%lld:%ld]\n",
> > -	(s64)val1.tv_sec, val1.tv_nsec,
> > -	(s64)stats->stats_timestamps.last_reset_time.tv_sec,
> > -	stats->stats_timestamps.last_reset_time.tv_nsec,
> > -	(s64)stats->stats_timestamps.last_read_time.tv_sec,
> > -	stats->stats_timestamps.last_read_time.tv_nsec,
> > -	(s64)timespec64_sub(val1, stats->stats_timestamps.last_reset_time).tv_sec,
> > -	timespec64_sub(val1, stats->stats_timestamps.last_reset_time).tv_nsec,
> > -	(s64)timespec64_sub(val1, stats->stats_timestamps.last_read_time).tv_sec,
> > -	timespec64_sub(val1, stats->stats_timestamps.last_read_time).tv_nsec);
> > +			 "Current time :          [%ptSp]\n"
> > +			 "Last stats reset time:  [%ptSp]\n"
> > +			 "Last stats read time:   [%ptSp]\n"
> > +			 "delta since last reset: [%ptSp]\n"
> > +			 "delta since last read:  [%ptSp]\n",
> 
> Both delta times are printed at the end.
> 
> > +			 &val,
> > +			 &stats->stats_timestamps.last_reset_time, &val1,
> > +			 &stats->stats_timestamps.last_read_time, &val2);
> 
> I think that this should be:
> 
> 			 &stats->stats_timestamps.last_reset_time,
> 			 &stats->stats_timestamps.last_read_time,
> 			 &val1, &val2);
> 
> >  	stats->stats_timestamps.last_read_time = val1;
> 
> The original code stored the current time in "val1". This should be:
> 
> 	stats->stats_timestamps.last_read_time = val;
> 
> > @@ -416,8 +410,8 @@ int fnic_get_stats_data(struct stats_debug_info *debug,
> >  	jiffies_to_timespec64(stats->misc_stats.last_ack_time, &val2);
> 
> Just for record. Another values are stored into @val1 and @val2 at
> this point.
> 
> >  	len += scnprintf(debug->debug_buffer + len, buf_size - len,
> > -		  "Last ISR time: %llu (%8llu.%09lu)\n"
> > -		  "Last ACK time: %llu (%8llu.%09lu)\n"
> > +		  "Last ISR time: %llu (%ptSp)\n"
> > +		  "Last ACK time: %llu (%ptSp)\n"
> >  		  "Max ISR jiffies: %llu\n"
> >  		  "Max ISR time (ms) (0 denotes < 1 ms): %llu\n"
> >  		  "Corr. work done: %llu\n"
> > @@ -437,10 +431,8 @@ int fnic_get_stats_data(struct stats_debug_info *debug,
> >  		  "Number of rport not ready: %lld\n"
> >  		 "Number of receive frame errors: %lld\n"
> >  		 "Port speed (in Mbps): %lld\n",
> > -		  (u64)stats->misc_stats.last_isr_time,
> > -		  (s64)val1.tv_sec, val1.tv_nsec,
> > -		  (u64)stats->misc_stats.last_ack_time,
> > -		  (s64)val2.tv_sec, val2.tv_nsec,
> > +		  (u64)stats->misc_stats.last_isr_time, &val1,
> > +		  (u64)stats->misc_stats.last_ack_time, &val2,
> 
> So, this is correct!
> 
> >  		  (u64)atomic64_read(&stats->misc_stats.max_isr_jiffies),
> >  		  (u64)atomic64_read(&stats->misc_stats.max_isr_time_ms),
> >  		  (u64)atomic64_read(&stats->misc_stats.corr_work_done),
> 
> 
> Now, I think that there is no need to resend the entire huge patchset.
> 
> I could either fix this when comitting or commit the rest and
> you could send only this patch for review.

Thank you for the thoroughly done review, I changed that patch between the
versions and the problem is that for printf() specifiers (extensions) we do not
have an automatic type checking. We starve for a GCC plugin for that, yeah...

In any case, if you fold your changes in, I will appreciate that!
Otherwise it's also fine with me to send a patch separately later on.

> PS: All other patches look good. Well, nobody acked 7th patch yet.
>     But I think that the change is pretty straightforward and
>     we could do it even without an ack.

This is my understanding as well. It changes the output, but that output is
debug anyway. So I don't expect breakage of anything we have an obligation
to keep working.

-- 
With Best Regards,
Andy Shevchenko


