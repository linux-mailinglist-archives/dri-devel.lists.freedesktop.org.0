Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0D8B212AD
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 19:00:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E47C010E1ED;
	Mon, 11 Aug 2025 17:00:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TZTw2Z8o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 766D710E02B
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 17:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754931602; x=1786467602;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/wbSxH2esqMm2IRCdU4jcKetV00/yCPHdgOJ1UNO+Us=;
 b=TZTw2Z8obLslhIyn/lwrnWdAzHQLnGtvMF7cLi0CJzep5CiEElHYbFN0
 VxBoVTtOVRf+ksVERBISZEb6sEtYzhCcBENtJGhpnrBV9ufzyzKHaP5U0
 uoBO8RUIcDzPhhBvWe9lhM/0pPDxWhlyCaP1aD0+v2IAP3qS+lD7Dy9il
 YJU3W3gnUniHcPH5AWaoZE9CYsbZB6yEej2RXf5MFgXYngxKUuEQOjIce
 EqrfL17prDIYy/oiZcL0D3ahwYbea89OvEKzN9hp1L42QfqsnyFN7y+Pe
 +1RA4RgErw8cvA2KfuvXmMUzcxK7A6ptOhbYgSgJ4myB9gqTcXngs4yt7 Q==;
X-CSE-ConnectionGUID: NfBtf9YBTTybzUEcfhrC2g==
X-CSE-MsgGUID: f5bCNeZBSgmq4MbC7TJx7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="74640892"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="74640892"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 10:00:02 -0700
X-CSE-ConnectionGUID: wAXhy8VpRRKDjd+egqWgaQ==
X-CSE-MsgGUID: uhvVExRfRNmUR88jMxFNIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="170413145"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 10:00:02 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 10:00:00 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 11 Aug 2025 10:00:00 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.72)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 10:00:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EiEA/QNJFumlCN5Azwi59DQB3JEnpjw07qchmyGXNlEZC0AYtpBXN0M/nz8thCWDCZLvjoUKsR1NvTCmgBgxCFQWqw3exHHygA7kJCvTnqebE1d2As3VMX4F2vo9oNxiaRVOQBYqC8FK5CyZVBZd03N8JfkEU3HYQakzw0nOJeZt+M+TNMzVsgxg98jMqibl8HMoGdXuoIeQFjaeOoriW5LFT+yfOQ2MMaJLEeafkj4JJmzjcpf0mxfibq9v/k8pz3uxrmrwNxxMjs+Fgn8ZVUMegB4zPvo7TEELR0n2FNGsUDGVFSkNb6UE7j5uhWVoN3g/icVqvV9D7j4Y3uHKKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=whwEcZrB/m7E8yFOK5Yke3WDiPL9cXDQ025nvJ+fZyA=;
 b=UeS+Bb/8/mbke1zJpyiZ1gGpSeE70gInOsuDYUJllkV8+FszwhtjBHmyjUG4okuyZHKkKWj6JSrTLohOiu3H+/fMci8rPBJtXmu0hEPY9UWXQFxlLAyWTMEVVpR82Sc5FIRmGL2cBcdN5Zq046a5wwMJlOnMDJsEv9ienlaH+Z25bYH+/pxWLlGXsq0ldw9yeqfyvlulQiztw2eh6khE4c+dunmNgmlThT2KLtvcZ1giNO3mSXjMVoiFv5PIvRA4zFn8gkgdeqkTC5lUkqHHJWS5GBLmSmz0CW9gmxPRrEMAP0kxl1hDXYv6MSDTWpCXeutgKIg+txb+tU67WPCyyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by SA2PR11MB4956.namprd11.prod.outlook.com (2603:10b6:806:112::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 16:59:58 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%5]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 16:59:58 +0000
Date: Mon, 11 Aug 2025 19:59:49 +0300
From: Imre Deak <imre.deak@intel.com>
To: Laurent Bigonville <bigon@bigon.be>
CC: <dri-devel@lists.freedesktop.org>
Subject: Re: WARNING: CPU: 0 PID: 32608 at
 drivers/gpu/drm/i915/display/intel_tc.c:1744
 intel_tc_port_link_reset_work+0x398/0x3b0 [i915]
Message-ID: <aJohhWPYE4oHUneg@ideak-desk>
References: <6cb7c186-404c-448a-a368-64427f2ff530@bigon.be>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6cb7c186-404c-448a-a368-64427f2ff530@bigon.be>
X-ClientProxiedBy: DU6P191CA0003.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:540::29) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|SA2PR11MB4956:EE_
X-MS-Office365-Filtering-Correlation-Id: 95a48a70-5aa9-4400-4df1-08ddd8f880c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?BAqB1NvHhMGbyFJiUequv5BDz5Su1zSP2KJJLcB2eMrvaJUJhdJs0N5OIe?=
 =?iso-8859-1?Q?M45Sq2Re50OHgwCzBqDqjVtLlXA/LOOAewicaY9yA8Gd7FbQvNfQcZA939?=
 =?iso-8859-1?Q?D/QZSrhTNhwUIfLH1wi93N2ygqFbd4I0/nWFv7xWM9InX+b5WV5f7csVQE?=
 =?iso-8859-1?Q?bquyGOlcadmP34yZuW8sn3zn8WBirFxPHdBUFdpq7i0WBB9fE6sn7SVfuC?=
 =?iso-8859-1?Q?9T9Dti4U11A1Tm7wb+sPvt89Z+xjHbaUIclvScc/SxJh2a01v/VjW1khKc?=
 =?iso-8859-1?Q?5oSd9U6AEBfbvMTBM+DrMaBEPjIDyjZL8lsEFyZ0wBW9IhjBnF89dl/myC?=
 =?iso-8859-1?Q?1GbMByxcW4ZPtZ4K47pNTILzRhGe9DapoOiXawWxHKDT3loEDmOG+oHDQm?=
 =?iso-8859-1?Q?Bvr8WZXrkI7zvn6d33p8Y331DhfcsIMWUfyWM3xeIDzg5eItYYdDt7nFaG?=
 =?iso-8859-1?Q?cXTQdDRHgFC0RBLkxOp1bq0WS6ACM3l3jx26CAcbBr/ZHoIP0NlpmqHhoL?=
 =?iso-8859-1?Q?9WPZ8OqpBcnPyunvCzQ9xBTSjuLOCxeLaZjnZ//YOzgX5PbCBvzDLzO23D?=
 =?iso-8859-1?Q?l+5PKH/Iz7VHxaRfeqK4fSvEk5HfpJ1xZMnyKbKoVBWlqw8k7wuRvzMlnu?=
 =?iso-8859-1?Q?Qs1BgsiKdu22YEwpCazHBklPEG18TDlSDg8vzLK1ZexrYrKFwKy8Xwfcy+?=
 =?iso-8859-1?Q?0lS+qZSgHZIiDiNn9YeSF04OHNMzg3Rj3ILbsVlOy0xFSJWiv7k9TNrLVO?=
 =?iso-8859-1?Q?y+xeE0J4VOAmVt7MmBmxVbw0y15LakFcE2sJPBDPyim3AkYStdpm7mMr7v?=
 =?iso-8859-1?Q?oU47J/d/jD27e/oi2HbjcRa449BEF3W2Km67FArvFRifKM3DHMg33foPzW?=
 =?iso-8859-1?Q?DxyvVywbtvW9Fo69wnP4FbJyp6JI9O+Cs9DKi/Y4E8IzlcYVLhxz4oheHf?=
 =?iso-8859-1?Q?IS9W82tAF/bFI7VSvTe4UMXSe8A+C2ZC33EOIyDSskXu6veRpZjdS5N521?=
 =?iso-8859-1?Q?/mZdnhOAow85IgSGkcLR7kGuV4edbEe1k+LzLSihI+2AglTHngz99polb3?=
 =?iso-8859-1?Q?OqRyWuvAan1tbO90qNrcGnQ3As0vntvtW0+IEDhuFSsUJ5cHp29Ww+2v05?=
 =?iso-8859-1?Q?ir/8X62bAzjaSbAt+QvaA5EzEp2XZRXc4FB6624k1ebecw4kq7tknKpHiq?=
 =?iso-8859-1?Q?rg64VW27/9FYfZCpwE0SDRpRo6MJnkRJCBsKGu2rNzVOCByOeBmBHdkUD5?=
 =?iso-8859-1?Q?OesBsnoA4zrjsQMglB+TvvYx9HjsTUQfx8PF6tva9IgJyxu3ExRVbfGK6h?=
 =?iso-8859-1?Q?8f4bqAu4NSRNxUnHJjAvsOOd8qj76mfchByjidEc4FCj1szaexQOTGEQm/?=
 =?iso-8859-1?Q?m13HSJlnEiMHFCz+I2lNEXsJacvGwzS2iPCgr24UPb+6ettT9wVgk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?kC85pfELt6plLZEgL59BRKt3TinbqqP2jeWMDNyJkMEhM5BB1hOXA7Po1X?=
 =?iso-8859-1?Q?OZwliopv8tpD+xArZTWgCpBL4F0hbBQJPErM0AKdLq2ZqM50IMrRL56YEI?=
 =?iso-8859-1?Q?UC+ThhLjZggPudohfWcmIyfNwb+ciqETm2MT9bB4GB8Di/8+j5/Y4ra++I?=
 =?iso-8859-1?Q?2UA2dyNKassE4P/PYUTkEQkWh1EKuw2/X2Rujl3zzOPAWSGg+LvQbNqUvn?=
 =?iso-8859-1?Q?rVfPab42w8s79cPtV81a+s7DDIcA9d+s4H2B6/npywc898pUyHEbg77jig?=
 =?iso-8859-1?Q?bb9GDhCRyvGBlQPgijYKOWELFhLHF8ESmtbD7Y5PEpaak63GourXiUQmsd?=
 =?iso-8859-1?Q?/lJqhJmb6U2crCXfoisMHmjwl8+aTiQU2HkbyWpn/9uA2klix5NVD/FCu9?=
 =?iso-8859-1?Q?RaeLek0mA/6+moErc6um0Yg/esrd3p6R5YPJMJqfOhmutyUpy4c2vnSXWi?=
 =?iso-8859-1?Q?9+So4Q6JKndNvkUT588wlJfJHEFtCLZ70blFLmD+5kTglgfxKALJm48XFH?=
 =?iso-8859-1?Q?gEFMzeqG40cd0ePZK6LkGk6IluLzCGMs6+lweRxw/F69qzycNUXV9O2bp0?=
 =?iso-8859-1?Q?op5Sh5h3UvTBODI/Wn08N0kAkZmlpqcgG6jfvIYi7z14GTKr4t8bwareuF?=
 =?iso-8859-1?Q?NwJsu0zSyTiPHCPsrzD3Wuck6tLCIXnaKSNni5acwEL4ZO6ZneP8SFeMtc?=
 =?iso-8859-1?Q?1TUitjL4MdDVA5WaCg1ty0xlcXpjOgXs6HVn/Vu5qGjuNhnakKDlzhJ/ui?=
 =?iso-8859-1?Q?JNcmCrqwZIa1CN+25UVM5ViR4d9vy+/17rgnYekitetY0zj779nFvjFgFM?=
 =?iso-8859-1?Q?w4I7pvY2Ps3x/mog6vMc5RB1Mu4rFrpwYi5erZfOzfJ8bxKFm7jpZRzklw?=
 =?iso-8859-1?Q?TBzH3ZoIug8CYwxCobF6Sjn7cNxYSdvo6eyy0LpdCnSCFvY2t5xfppA0VI?=
 =?iso-8859-1?Q?KnVfqA1vo6TV/OpoTt1W9/cP+Lm85D66xjahYcwoXvHEfAS5fq+uC8TI0w?=
 =?iso-8859-1?Q?1IfKbOUSzR1goryugsBLPv00ZV9oJI+DGZMsDEaF7URn6VihlsRkLLrjIo?=
 =?iso-8859-1?Q?C8ilp0OgpfuGSRp6RceMqWgfo0ikaorHzJH+PM+J2+adth+YoT70BB7YED?=
 =?iso-8859-1?Q?jYYUL0GcEZDez94amLsHQn9fmQRk/Vz/ZeIyLy2LG8vbEdk6v/SC9Pnpaa?=
 =?iso-8859-1?Q?9d+PoIBmNdsmYaRIcZB0ibLm1yzFJyg81AN4KFsQ7lOMsCJwS6PZmo2HMh?=
 =?iso-8859-1?Q?JaH/KEK3JwpM7iQ/tu/QAei5e/CXoN2Z8SNysl9YC7AFR4e1da5vBWDL0o?=
 =?iso-8859-1?Q?BpjTmo74GHYVPWkNcQHi3HJPS5oH2EEfmW8r0HXAdy/aHVpsYcKkY0uWvi?=
 =?iso-8859-1?Q?4+O0epHMdesEa7f5ZJshj1q188t84OowlUb2q99mY9Q2gFjWv9+OW8pJ6W?=
 =?iso-8859-1?Q?Nmhd6Wasp9cyT0irUZuAsLiIXR0bqYsTj7rydj6/Gh1LtIATHdQp8H8AM0?=
 =?iso-8859-1?Q?NJAhyxEywVjZgyFHfUI0zZEYt4c19IOFVZrkev66oAb7RNYa8t8dhMlnbl?=
 =?iso-8859-1?Q?iW7+ry1cqPbbNafOl1hYfEL//orkGOTtYrae51/I3hyDvzg9a0Wbli2Ec+?=
 =?iso-8859-1?Q?4PV96cmdFd5CduHhxiv6WZCUgQcbN0SkD1YIrv2ohcy3QFSeEOsP2GOVtn?=
 =?iso-8859-1?Q?1rBEcVbMp8a60kel527uGdglddJD8ma+LINjr1zK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 95a48a70-5aa9-4400-4df1-08ddd8f880c8
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 16:59:58.2590 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rQK1V/cXnd0M0nh1JVj35kvNhV96c+1d4NBp2HHGYwZhTXlSTekMgxAU+FLWlbto8CurAaGSpPFSRj3wg5CACA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4956
X-OriginatorOrg: intel.com
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

could you please open a ticket at

https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/new

and attach there a dmesg log booting with drm.debug=0x15e and
reproducing the problem?

Thanks,
Imre

On Mon, Aug 11, 2025 at 04:52:55PM +0200, Laurent Bigonville wrote:
> Hello,
> 
> On my Dell Latitude 5530 laptop, with an external screen connected using
> USB-C, from time to time, when coming back after both screens have been put
> in powersave mode, I've the following warning in dmesg:
> 
> > [12292.586347] ------------[ cut here ]------------
> > [12292.586359] i915 0000:00:02.0: [drm] drm_WARN_ON(ret)
> > [12292.586512] WARNING: CPU: 0 PID: 32608 at
> > drivers/gpu/drm/i915/display/intel_tc.c:1744
> > intel_tc_port_link_reset_work+0x398/0x3b0 [i915]
> > [12292.587044] Modules linked in: tun sd_mod scsi_mod scsi_common
> > hid_logitech_hidpp uhid snd_seq_dummy snd_hrtimer snd_seq snd_seq_device
> > xt_CHECKSUM xt_MASQUERADE xt_conntrack ipt_REJECT xt_tcpudp nft_compat
> > nf_nat_tftp nf_conntrack_tftp bridge stp llc ccm nf_conntrack_netbios_ns
> > nf_conntrack_broadcast nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib
> > nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct
> > nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4
> > nf_tables overlay rfcomm qrtr cmac algif_hash algif_skcipher af_alg bnep
> > sunrpc binfmt_misc snd_sof_pci_intel_tgl snd_sof_pci_intel_cnl
> > snd_sof_intel_hda_generic soundwire_intel soundwire_generic_allocation
> > snd_sof_intel_hda_sdw_bpt snd_sof_intel_hda_common snd_soc_hdac_hda
> > snd_sof_intel_hda_mlink snd_sof_intel_hda soundwire_cadence
> > snd_hda_codec_hdmi snd_sof_pci snd_sof_xtensa_dsp snd_sof snd_sof_utils
> > snd_soc_acpi_intel_match snd_soc_acpi_intel_sdca_quirks snd_soc_acpi
> > crc8 soundwire_bus snd_soc_sdca snd_soc_avs intel_uncore_frequency
> > [12292.587154]  snd_soc_hda_codec intel_uncore_frequency_common
> > snd_hda_codec_realtek snd_hda_ext_core x86_pkg_temp_thermal
> > snd_hda_codec_generic snd_soc_core intel_powerclamp
> > snd_hda_scodec_component snd_compress nls_ascii coretemp iwlmvm
> > snd_pcm_dmaengine nls_cp437 snd_hda_intel vfat kvm_intel
> > snd_intel_dspcfg fat uvcvideo snd_intel_sdw_acpi btusb mac80211
> > processor_thermal_device_pci videobuf2_vmalloc snd_hda_codec dell_pc
> > btrtl processor_thermal_device kvm processor_thermal_wt_hint snd_ctl_led
> > uvc platform_profile snd_hda_core btintel libarc4
> > platform_temperature_control videobuf2_memops processor_thermal_rfim
> > dell_rbtn intel_rapl_msr irqbypass snd_hwdep btbcm mei_pxp mei_hdcp
> > videobuf2_v4l2 dell_wmi processor_thermal_rapl dell_laptop iwlwifi
> > intel_rapl_common rapl btmtk snd_pcm videodev dell_smbios intel_pmc_core
> > processor_thermal_wt_req intel_cstate dell_wmi_sysman
> > processor_thermal_power_floor snd_timer dcdbas intel_uncore pcspkr
> > cfg80211 videobuf2_common bluetooth mei_me pmt_telemetry dell_wmi_ddv
> > dell_smm_hwmon
> > [12292.587262]  int3403_thermal processor_thermal_mbox snd
> > firmware_attributes_class dell_wmi_descriptor wmi_bmof ee1004 mc mei
> > pmt_class cdc_acm rfkill intel_hid igen6_edac int3400_thermal
> > int340x_thermal_zone soundcore acpi_pad acpi_tad
> > intel_pmc_ssram_telemetry acpi_thermal_rel sparse_keymap joydev ac evdev
> > msr i2c_dev parport_pc ppdev lp parport efi_pstore nfnetlink ip_tables
> > x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_cryptoapi dm_crypt
> > dm_mod raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor
> > async_tx xor raid6_pq raid1 raid0 md_mod typec_displayport
> > hid_plantronics usbhid xe intel_vsec drm_gpuvm configfs drm_gpusvm
> > gpu_sched drm_ttm_helper drm_exec drm_suballoc_helper hid_sensor_custom
> > hid_sensor_hub intel_ishtp_hid i915 drm_buddy ttm ucsi_acpi i2c_algo_bit
> > typec_ucsi hid_multitouch iTCO_wdt drm_display_helper typec hid_generic
> > intel_pmc_bxt cec roles ghash_clmulni_intel iTCO_vendor_support xhci_pci
> > rc_core i2c_hid_acpi nvme sha512_ssse3 rtsx_pci_sdmmc watchdog
> > intel_lpss_pci xhci_hcd
> > [12292.587396]  drm_client_lib i2c_hid nvme_core sha1_ssse3 psmouse
> > mmc_core i2c_i801 intel_lpss intel_ish_ipc drm_kms_helper usbcore hid
> > nvme_keyring aesni_intel serio_raw e1000e video rtsx_pci i2c_smbus
> > thunderbolt idma64 intel_ishtp nvme_auth drm usb_common button battery
> > wmi efivarfs
> > [12292.587445] CPU: 0 UID: 0 PID: 32608 Comm: kworker/u48:12 Tainted: G 
> >       W           6.16-amd64 #1 PREEMPT(lazy) Debian 6.16-1~exp1
> > [12292.587458] Tainted: [W]=WARN
> > [12292.587462] Hardware name: Dell Inc. Latitude 5530/0C6CYC, BIOS
> > 1.30.1 05/01/2025
> > [12292.587467] Workqueue: events_unbound intel_tc_port_link_reset_work
> > [i915]
> > [12292.587823] RIP: 0010:intel_tc_port_link_reset_work+0x398/0x3b0 [i915]
> > [12292.588156] Code: 48 8b 5f 50 48 85 db 75 03 48 8b 1f e8 01 2e 70 cf
> > 48 c7 c1 10 96 49 c1 48 89 da 48 c7 c7 cc 95 49 c1 48 89 c6 e8 c8 5d de
> > ce <0f> 0b e9 32 ff ff ff e8 1c 87 ac cf 66 66 2e 0f 1f 84 00 00 00 00
> > [12292.588160] RSP: 0018:ffffd2e70c2e3db8 EFLAGS: 00010282
> > [12292.588167] RAX: 0000000000000000 RBX: ffff8ab0826f74b0 RCX:
> > 0000000000000027
> > [12292.588171] RDX: ffff8ab7ef41ce08 RSI: 0000000000000001 RDI:
> > ffff8ab7ef41ce00
> > [12292.588173] RBP: ffff8ab081795c90 R08: 0000000000000000 R09:
> > 0000000000000000
> > [12292.588176] R10: 0000000000000000 R11: 0000000000000004 R12:
> > ffff8ab1b4e75800
> > [12292.588179] R13: ffffd2e70c2e3de0 R14: ffff8ab08c744628 R15:
> > 00000000ffffffea
> > [12292.588183] FS:  0000000000000000(0000) GS:ffff8ab85cdc8000(0000)
> > knlGS:0000000000000000
> > [12292.588187] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [12292.588190] CR2: 00007f54af377160 CR3: 000000059042c002 CR4:
> > 0000000000f72ef0
> > [12292.588195] PKRU: 55555554
> > [12292.588197] Call Trace:
> > [12292.588205]  <TASK>
> > [12292.588216]  process_one_work+0x18a/0x340
> > [12292.588227]  worker_thread+0x256/0x3a0
> > [12292.588233]  ? __pfx_worker_thread+0x10/0x10
> > [12292.588239]  kthread+0xf9/0x240
> > [12292.588247]  ? __pfx_kthread+0x10/0x10
> > [12292.588253]  ? __pfx_kthread+0x10/0x10
> > [12292.588260]  ret_from_fork+0x15c/0x190
> > [12292.588268]  ? __pfx_kthread+0x10/0x10
> > [12292.588275]  ret_from_fork_asm+0x1a/0x30
> > [12292.588285]  </TASK>
> > [12292.588287] ---[ end trace 0000000000000000 ]---
> 
> The port it's connected to is a Thunderbolt port, but the screen only uses
> USB-C
> 
> An idea what's happening?
> 
> libdrm: 2.4.124
> mesa: 25.0.7
> 
> Kind regards,
> 
> Laurent Bigonville
> 


