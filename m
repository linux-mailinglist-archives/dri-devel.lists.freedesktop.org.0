Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A029761A4
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 08:40:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7982210E1F7;
	Thu, 12 Sep 2024 06:40:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xm24HfHt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 795FA10E1F7
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 06:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726123218; x=1757659218;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=E7OvWyg94LoVKtc4/zs7vQh3m3eh5TWkpO3fps71A1U=;
 b=Xm24HfHtxoWfcdKqwYtrkHHn8TtsKLD/kHEySrpjO0hLtHVn4eeo/E6i
 RpvLasU/FUACJIHZb4/HNWej3Qf3jhn6bAtSB4lyNGofKcQhy/fVSqw2d
 CFUeoeYJg2oysK6T05QfUfWrZ5idO3rJXBJNZvzfrkmcaXpAGGpI71PNR
 WBTm6NeYs3lu1WojWojf51A/RQaTkuqsmiPjyJlELA9j2ftUwdACYPL+e
 TKXSiXCFwQGTiI8Smra4F6tELmVYvD6aHrlEK5Zv0abNbQ6fGcrxYaY5F
 8DFr7tyE0AAL2UUG5KJa0N4ypbTrvgo03v2LCuVD+fVJc3je1/oX0CN0O g==;
X-CSE-ConnectionGUID: qOjWIHLIR/exbGp8tCU2BQ==
X-CSE-MsgGUID: W7SceH7oR3CWPPUSu5qJAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24893060"
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="24893060"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 23:40:15 -0700
X-CSE-ConnectionGUID: mf+CfZBKQeerJpCvw0dUiQ==
X-CSE-MsgGUID: bUEuZrmPQNi/m2kNLqot5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="72391932"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2024 23:40:15 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 23:40:15 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 23:40:14 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Sep 2024 23:40:14 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Sep 2024 23:40:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EkuPe+UrmEAuJ4Ht1Nd3sSrJ4+SFIjrCUlkyxJCgRRbfTEn5BT2DYAwY2woc5vpc3e2PKlFNhI/c3G1q26hDvgJSxjT6Tux2vMB0OT8bJzMQT7VY2xSduxoSZIFzw+HpNO4L07L7aWc/HCgKbn99LFZFki/0U3X1qRoPaVdGYcmjEUjfBxhzHkNesUsmA++bE5Y2zcr2cg7iSDHExWzHlmmEmj4289Lk47sirSzII3AGhvxmjZgdpbQy7H4Dekf+UmjnJp6zb0ntWib/K1zPSgnuVpOwAI+S5a5l5bV9Fgwvmkq8XzVGfAgwbmGuS6Cz8njvT5wwDLtZ523315lVbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NhxxD4R5gUdCMU2usx6bgHxbaunmrSdW4Zexix3kkrY=;
 b=C3Dny0gOSFtmuuJP2kFOkV4OCABDRVaRsF5r40zdBDXB+nm9b85CWnsKyTrLJZeUSMRLlIPgtklBQRs+NpxxLZveiXinNJI57clLgrNXPu+i9DW4M1eW4N5YuHD60YwWuAnrbWMUD+I5pByMajyovA1xFzEvSoSv9S+v2fJbgkQO+B40Y8ZOEp33I1b1L1TdLQ8H7sWEK0JfVXybo5Lx4/hRgsIBagmTgrDfVcwhsx6Jj+DMcC8XRg34XSLkO+80J88JfPrN8aGhHlNN8o8A4qOm5uyWJ4T4uY5thF+pT0xtcohwGV7YDahFZ4tAR41JldjChP3Jm9gGVRUvELce1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8587.namprd11.prod.outlook.com (2603:10b6:a03:568::21)
 by IA0PR11MB7308.namprd11.prod.outlook.com (2603:10b6:208:436::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.26; Thu, 12 Sep
 2024 06:40:09 +0000
Received: from SJ2PR11MB8587.namprd11.prod.outlook.com
 ([fe80::4050:8bc7:b7c9:c125]) by SJ2PR11MB8587.namprd11.prod.outlook.com
 ([fe80::4050:8bc7:b7c9:c125%3]) with mapi id 15.20.7918.024; Thu, 12 Sep 2024
 06:40:09 +0000
Date: Thu, 12 Sep 2024 14:39:59 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Linux Memory Management List
 <linux-mm@kvack.org>, Jocelyn Falempe <jfalempe@redhat.com>,
 <dri-devel@lists.freedesktop.org>, <ying.huang@intel.com>,
 <feng.tang@intel.com>, <fengwei.yin@intel.com>, <oliver.sang@intel.com>
Subject: [linux-next:master] [drm/ast]  2a2391f857:
 stress-ng.cpu-online.ops_per_sec 49.9% improvement
Message-ID: <202409111607.e8bb8112-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0068.apcprd02.prod.outlook.com
 (2603:1096:4:54::32) To SJ2PR11MB8587.namprd11.prod.outlook.com
 (2603:10b6:a03:568::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8587:EE_|IA0PR11MB7308:EE_
X-MS-Office365-Filtering-Correlation-Id: 16cb2cd7-067d-42e4-1250-08dcd2f5be8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?/neQRlARbY+/i4pBYXvuKezHEe5DcNIYHBh3tDTpEtw9QV87H4p8k6c7MT?=
 =?iso-8859-1?Q?Q2xRtwA4KH3vgjHykv46RflS6Nn3t9xH7oiFSJeSOcBPfmaDmH5wGC/C4D?=
 =?iso-8859-1?Q?vATVBhEoJpHdkYTRrcMEku6moBiR/Vm+HPDo6U8oxjlO4P9hfrCiN8TlCY?=
 =?iso-8859-1?Q?1B5wSHBildzTp9agFIJ/ynI+ODOfdVZNZLAur3v4L0Z2ks7Y0+KNgB2+Ik?=
 =?iso-8859-1?Q?axiYpn5DbxO0sBkD18pcrHHz2ngvIe29KfWhNVoEisUqHnFEXPXSQz2owo?=
 =?iso-8859-1?Q?59wvlt2Vri611h/WtcCbmnoyn2QgdtIbTrZjDR572jJTKIe/HVAnwx6mMG?=
 =?iso-8859-1?Q?A0x/bpnh3NfOksGP5zkvU9oZrn3NNSXaOehXpaj6E4s+8RbFXHtFX4edtX?=
 =?iso-8859-1?Q?YQ3hDzuIWWN0LIr5pMhN/uqL0/39l9nvIPEEj2ElEUaNliMGj7syun7Xww?=
 =?iso-8859-1?Q?rCyXS4/8jBOJAQWSak5QnNePFcMm5gB+kASbn4cQ0dLp5YX5y8Bypn+Ces?=
 =?iso-8859-1?Q?6hcu7GxpkjQ0/SDPKwWh021E5c/6f2X8aFt878r3s0iSbL0RVPzZwU4niR?=
 =?iso-8859-1?Q?bnUjgLZObwr30mP9Cxw+FEGXcw4uC0jmzS/elzGjm1HKLDR/7zsvdRqRKd?=
 =?iso-8859-1?Q?T1sqaaYjk7kIx+g7ZOB6RFlVmV8r1ndb7AZVGc8isBEau0gd5Grv6Js1oT?=
 =?iso-8859-1?Q?O4yOFt1Bgp/gtffMgz1bh7j9+NDzShiMPsabw+9UwJxzeA8TCz4G7QkvO5?=
 =?iso-8859-1?Q?WUh+18N/+vmiN0SFih8YFdxohLz029z0yo111flx002nqRgyGtqbHi3IEu?=
 =?iso-8859-1?Q?70U/aq6xKNvMmtwU+Isnb+cMTjR6FpbDd5jJjUbZ9im/QFsxPO+5QAQj8O?=
 =?iso-8859-1?Q?Byh2XDpB/4QfEGoo42NM+OvXxtrEisldeD2PjeUcl6pjyN9AI3F5yOWtZK?=
 =?iso-8859-1?Q?gmDc87lnDqlqy8REIF7EhKXXUZk0NxTmdyhMxTkl3Vj60XPTloCeKZCshb?=
 =?iso-8859-1?Q?xhxoxbycpTJ9Nt1O+x+9cUC+OUZZcXnBqiuYwu4V/3VduP0eYCaQvaFyZj?=
 =?iso-8859-1?Q?Kylwckzc0qPzIKWmJG9+xVOjm4T2nPdoZgIWtB6aqEp3Tm6kfdpdN1WFm2?=
 =?iso-8859-1?Q?VSsBSYNvHMhKPvsXGE+Cfnmm6xrNKOOvTpjHtrtBcowK3r6U96ISEee4h/?=
 =?iso-8859-1?Q?NannPiNL+dVqpEXgq2P944FJo5BGEFb5uc1pEubHF3SwgcCIrmgVjjTKgT?=
 =?iso-8859-1?Q?z27Z+9GuPJGU2zItAibADkFuyfEZ43UVGknVnOKnWKr2o9z875Y44oxgBV?=
 =?iso-8859-1?Q?fvtF1VI2NMeSMZ62gMms8w1Dnnp+mg8J7l1PUFVFOeQC7xeUdjdfbhDoDf?=
 =?iso-8859-1?Q?agJO+j7dn3uWdtVCuV6+dRUw28tMDgXLBdgGBNL2qQt+mAPZfiQEQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB8587.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?zMuffHJ99pxesQ99HW9ytd3ufm9lAdzWA+/sAB3DukucmDDiBK+Sz0Fghf?=
 =?iso-8859-1?Q?1JvMiKWzLZSYugHHH3ymTtrvpQqGirPULTpAEIUPFL8DUF7lEJqJQLBA8W?=
 =?iso-8859-1?Q?h7hseuQbxfZK7k3eytM9eEFpEOWDBd8AjJdWQomf3bh+AGSiS+vdme2BmV?=
 =?iso-8859-1?Q?vHs5HjQ6+q1kKa8Gk2a5nR9bJudO9YXlI0EjqjL0LWnTsKa2qh+wq83jff?=
 =?iso-8859-1?Q?IxtZi+NSg/ouoe2AKvHAsqmi2J3Jj1Mn52kHbPjRI4XV166qfOPSGIcBeG?=
 =?iso-8859-1?Q?PLbt5Zz4BGY0h8RkCQI/Pwi+k+OLH+4XrqGzVKybTIYAHNr+6X7ewgYmbD?=
 =?iso-8859-1?Q?xp/dTR+fyN3OE6rSZCV1e3XL75I+VDIx1hoT63O48TJUKonvLCEdU7zJll?=
 =?iso-8859-1?Q?cdXPPLfQPAz7bZKOOis3K61s2OwhLQeSvwChf3YgfZUPmzfu6Ql7thi0N9?=
 =?iso-8859-1?Q?63HotnG3yAiXTJl0Js1YateIb+MkrUGaDGBXlmNqUNO8Z4aTC/nw4tq2+l?=
 =?iso-8859-1?Q?s6ziSCANrP1M3jQkiLzSNWo7UK5NHGX/m51w1YvxVMgssXKLlS6XyOLkC0?=
 =?iso-8859-1?Q?FkeDbQIDryfF7DQ1h2BddW51cvG/6WpCbUKpx++Ef4jyM0rIngaIU2lqJU?=
 =?iso-8859-1?Q?fO11eHM8UlUXuIfEA2rIcVRc5UWwzJQK7rZMqNuoqw+Ks/FZ4qsJSbD0u3?=
 =?iso-8859-1?Q?R6f8o89Ia4w9NGdGUARKgD4KGQCKLGXzhuH7VqMbHKAoLY+5y84+DKkteC?=
 =?iso-8859-1?Q?TQ4KkPWyFWvkQrZdjRG8dXCtvxgjLNuPfVKryeMme4FAKxDGjRH1nBt2kq?=
 =?iso-8859-1?Q?BAJ321//hzlW3PtcvHGz3CWGPB75V9i9BHJrFS//hhe1Hr7CgLbYiqOes6?=
 =?iso-8859-1?Q?0eKfknPLzQ/1kE+BbzYSWitjaAxW+r3xVKDo00qT7YJBRWuZGPD0Y/7olc?=
 =?iso-8859-1?Q?UkGrRnJPxx/r1GnHaeb3Q8taU4jfrOq3EBmP4zs9rffAM+TPhjMU7bNB9L?=
 =?iso-8859-1?Q?YkTQ94XuR028zUUSzpEhYnO0ukVYESzQvlLvpE/et4KjHElo07ucXadcU7?=
 =?iso-8859-1?Q?noRyLbFhg+DiWKen6/kgjMxm92+CgjCVlKrx+MNq/oyCrgqHlgfV4Enamq?=
 =?iso-8859-1?Q?1zmCITbyFTwgDPu1QExIxPBx3P8V5w8LKIy3pUU4NEMPhnxSgTxQ5A5sC7?=
 =?iso-8859-1?Q?gltTPfq+ZQ27Pegwob2yVKH/c+5KfWXnhZ26DO6W+QMZXmDDzJAOyMUYLe?=
 =?iso-8859-1?Q?kBJUdyn71Tz8GuY1U47x5Dr1ysJ8nWoVF6K/WL8iGV4ZzY02JBLEBGjMjb?=
 =?iso-8859-1?Q?g/vu+XK1b60q3Smx81hgVUAch3wv06kKpQaLi1aRgiqFYAk2uD0xNtEDwp?=
 =?iso-8859-1?Q?Jp5sg5wXqAJmyEgg/M73h+Cvwl+iei45V8yZD53F5GbJm2jUDhqYMO/8Gh?=
 =?iso-8859-1?Q?4y4IYKmkqtQuRLL2awn42ZevtN4XiJJ/u0mL8jge+xbAPkdOgmSyuopoKN?=
 =?iso-8859-1?Q?a9RNsi91rIkqhNXULpu2dM4TdMDWV3ErHRJ+iqOkLW96+GYTK0W/U42lqg?=
 =?iso-8859-1?Q?k5syN8zlzkhtcHYamt/RE02/w49yky+xyAFb+YpOrX0gyP8NnaudJxcnCP?=
 =?iso-8859-1?Q?N6VN0n/Ds3gEwULOZ97ZHepd2r2R4NFXmOuw+73hHrL1e21j1cGIl8ug?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 16cb2cd7-067d-42e4-1250-08dcd2f5be8c
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8587.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 06:40:09.1498 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c4TWGwYslIVpJv/Kl9oNQck7fjc1Ov7t3yuAeRUebNv5YzXthXfO43zF0WhYpvxYieTfLlde68UhI0IWIEwBOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7308
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Hello,

bot doesn't have enough knowledge how this change could cause this significant
stress-ng.cpu-online performance improvement, but from perf-profile data, seems
code change is related.

      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.ast_vga_connector_helper_detect_ctx

also saw some thing such like (and much more)

      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.drm_connector_helper_detect_from_ddc
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.drm_do_probe_ddc_edid
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.drm_helper_probe_detect_ctx
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.drm_probe_ddc

so we still report this out FYI what we observed in our tests.
full comparison is in below table.



kernel test robot noticed a 49.9% improvement of stress-ng.cpu-online.ops_per_sec on:


commit: 2a2391f857cdc5cf16f8df030944cef8d3d2bc30 ("drm/ast: vga: Transparently handle BMC support")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

testcase: stress-ng
test machine: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: cpu-online
	cpufreq_governor: performance






Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240911/202409111607.e8bb8112-oliver.sang@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-12/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/lkp-icl-2sp8/cpu-online/stress-ng/60s

commit: 
  d20c2f8464 ("drm/ast: sil164: Transparently handle BMC support")
  2a2391f857 ("drm/ast: vga: Transparently handle BMC support")

d20c2f8464280550 2a2391f857cdc5cf16f8df03094 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
  2.43e+09 ±  3%      -0.7%  2.413e+09 ±  2%  cpuidle..time
    832474 ±  2%      +5.8%     880457        cpuidle..usage
    107.96            -2.2%     105.63        uptime.boot
      5370            +0.8%       5411 ±  2%  uptime.idle
     36.73            +1.3%      37.20 ±  2%  boot-time.boot
     25.58            +1.6%      26.00 ±  3%  boot-time.dhcp
      2132            +1.4%       2162 ±  3%  boot-time.idle
    151.17 ± 54%     -28.7%     107.83 ± 51%  perf-c2c.DRAM.local
    111.33 ± 69%      +4.8%     116.67 ± 62%  perf-c2c.DRAM.remote
    156.00 ± 65%     -24.8%     117.33 ± 62%  perf-c2c.HITM.local
     42.17 ± 63%     -15.0%      35.83 ± 55%  perf-c2c.HITM.remote
    198.17 ± 64%     -22.7%     153.17 ± 60%  perf-c2c.HITM.total
     86.51            +8.7       95.18        mpstat.cpu.all.idle%
      0.03 ± 42%      +0.0        0.03 ± 19%  mpstat.cpu.all.iowait%
      0.43 ±  4%      +0.2        0.61 ±  6%  mpstat.cpu.all.irq%
      0.07 ±  5%      +0.0        0.08 ± 11%  mpstat.cpu.all.soft%
     12.22 ±  3%      -8.9        3.30        mpstat.cpu.all.sys%
      0.75 ±  3%      +0.1        0.80 ±  3%  mpstat.cpu.all.usr%
     10.33 ± 59%     -21.0%       8.17 ± 90%  mpstat.max_utilization.seconds
     20.38 ±  4%     -56.2%       8.92 ±  9%  mpstat.max_utilization_pct
      0.00          -100.0%       0.00        numa-numastat.node0.interleave_hit
    118071 ± 40%     -17.2%      97755 ± 37%  numa-numastat.node0.local_node
    147394 ± 26%      -9.2%     133830 ± 15%  numa-numastat.node0.numa_hit
     29291 ± 53%     +23.2%      36074 ± 62%  numa-numastat.node0.other_node
      0.00          -100.0%       0.00        numa-numastat.node1.interleave_hit
    156995 ± 25%     +14.7%     180142 ± 20%  numa-numastat.node1.local_node
    186893 ± 14%     +10.0%     205510 ±  9%  numa-numastat.node1.numa_hit
     29908 ± 63%     -15.2%      25368 ± 79%  numa-numastat.node1.other_node
     68.19            -4.2%      65.34        time.elapsed_time
     68.19            -4.2%      65.34        time.elapsed_time.max
      3256 ± 16%     +19.6%       3894 ± 13%  time.involuntary_context_switches
      4.17 ±223%    -100.0%       0.00        time.major_page_faults
     83017            +0.3%      83264        time.maximum_resident_set_size
     27856            +0.0%      27860        time.minor_page_faults
      4096            +0.0%       4096        time.page_size
      9.00 ±  6%     +35.2%      12.17 ±  7%  time.percent_of_cpu_this_job_got
      6.13 ±  3%     +28.2%       7.85 ±  6%  time.system_time
      0.32 ± 12%      +4.2%       0.33 ± 10%  time.user_time
    577996            +3.1%     596173        time.voluntary_context_switches
     86.83            +9.7%      95.23        vmstat.cpu.id
     12.38 ±  3%     -68.3%       3.92        vmstat.cpu.sy
      0.73 ±  4%      +9.3%       0.79 ±  3%  vmstat.cpu.us
      0.07 ± 37%     -31.1%       0.05 ± 33%  vmstat.cpu.wa
     40.83            +3.4%      42.24        vmstat.io.bi
     72.00            +0.0%      72.00        vmstat.memory.buff
   3208980            -0.2%    3203242        vmstat.memory.cache
 2.588e+08            +0.0%  2.589e+08        vmstat.memory.free
      0.03 ± 38%     +12.6%       0.03        vmstat.procs.b
      5.51 ± 21%     -35.1%       3.58 ± 15%  vmstat.procs.r
     20546           +10.6%      22726        vmstat.system.cs
     23808 ±  3%     -16.2%      19941 ±  4%  vmstat.system.in
      1961 ± 49%     -36.5%       1245 ± 35%  stress-ng.cpu-online.millisecs_per_offline_action
    260.18 ± 46%     -16.2%     218.14 ± 15%  stress-ng.cpu-online.millisecs_per_online_action
    435.33 ±  2%     +44.2%     627.83        stress-ng.cpu-online.ops
      6.48 ±  2%     +49.9%       9.70 ±  2%  stress-ng.cpu-online.ops_per_sec
     68.19            -4.2%      65.34        stress-ng.time.elapsed_time
     68.19            -4.2%      65.34        stress-ng.time.elapsed_time.max
      3256 ± 16%     +19.6%       3894 ± 13%  stress-ng.time.involuntary_context_switches
      4.17 ±223%    -100.0%       0.00        stress-ng.time.major_page_faults
     83017            +0.3%      83264        stress-ng.time.maximum_resident_set_size
     27856            +0.0%      27860        stress-ng.time.minor_page_faults
      4096            +0.0%       4096        stress-ng.time.page_size
      9.00 ±  6%     +35.2%      12.17 ±  7%  stress-ng.time.percent_of_cpu_this_job_got
      6.13 ±  3%     +28.2%       7.85 ±  6%  stress-ng.time.system_time
      0.32 ± 12%      +4.2%       0.33 ± 10%  stress-ng.time.user_time
    577996            +3.1%     596173        stress-ng.time.voluntary_context_switches
     29031 ± 10%      -5.4%      27451 ± 21%  meminfo.Active
     28983 ± 10%      -5.5%      27402 ± 21%  meminfo.Active(anon)
     48.10            +0.0%      48.12        meminfo.Active(file)
     63693           -18.0%      52199 ±  8%  meminfo.AnonHugePages
    720202            +0.6%     724348        meminfo.AnonPages
      5.78 ± 11%      +4.1%       6.02        meminfo.Buffers
   3228010            -0.3%    3219849        meminfo.Cached
 1.319e+08            +0.0%  1.319e+08        meminfo.CommitLimit
   2100106            +0.6%    2112565        meminfo.Committed_AS
 2.538e+08            +0.5%   2.55e+08        meminfo.DirectMap1G
  16248149 ±  9%      -7.4%   15046656 ±  4%  meminfo.DirectMap2M
    174938 ±  7%     -12.5%     153093        meminfo.DirectMap4k
      2048            +0.0%       2048        meminfo.Hugepagesize
    794162            +0.4%     797638        meminfo.Inactive
    793946            +0.4%     797424        meminfo.Inactive(anon)
    216.26 ±  2%      -1.1%     213.90        meminfo.Inactive(file)
     91378            -0.3%      91069        meminfo.KReclaimable
     18844            -2.9%      18293        meminfo.KernelStack
    114595            -0.4%     114109        meminfo.Mapped
 2.578e+08            -0.0%  2.578e+08        meminfo.MemAvailable
 2.589e+08            +0.0%  2.589e+08        meminfo.MemFree
 2.638e+08            +0.0%  2.638e+08        meminfo.MemTotal
   4892591            -0.0%    4892436        meminfo.Memused
     11.52            +0.1%      11.52        meminfo.Mlocked
     24127 ±  3%      +3.7%      25014 ±  5%  meminfo.PageTables
     26379            -0.6%      26210        meminfo.Percpu
     91378            -0.3%      91069        meminfo.SReclaimable
    168071            -1.7%     165143        meminfo.SUnreclaim
     10280            +0.0%      10280        meminfo.SecPageTables
    112239 ±  2%      -7.3%     104041 ±  5%  meminfo.Shmem
    259449            -1.2%     256213        meminfo.Slab
   3124511            -0.2%    3118622        meminfo.Unevictable
 1.374e+13            +0.0%  1.374e+13        meminfo.VmallocTotal
    250024            -0.3%     249327        meminfo.VmallocUsed
   5386104            -0.3%    5372564        meminfo.max_used_kB
      0.34 ± 70%    -100.0%       0.00        perf-stat.i.MPKI
  31748066 ± 70%    -100.0%       0.00        perf-stat.i.branch-instructions
      2.88 ± 70%      -2.9        0.00        perf-stat.i.branch-miss-rate%
   1373199 ± 70%    -100.0%       0.00        perf-stat.i.branch-misses
     14.85 ± 70%     -14.9        0.00        perf-stat.i.cache-miss-rate%
     78007 ± 70%    -100.0%       0.00        perf-stat.i.cache-misses
    350229 ± 70%    -100.0%       0.00        perf-stat.i.cache-references
     10436 ± 17%      -5.6%       9852 ± 22%  perf-stat.i.context-switches
      0.45 ± 70%    -100.0%       0.00        perf-stat.i.cpi
     25951 ± 18%     -18.7%      21097 ± 25%  perf-stat.i.cpu-clock
 1.033e+08 ± 70%    -100.0%       0.00        perf-stat.i.cpu-cycles
    450.36 ± 21%      +6.0%     477.37 ± 22%  perf-stat.i.cpu-migrations
    883.12 ± 70%    -100.0%       0.00        perf-stat.i.cycles-between-cache-misses
 1.537e+08 ± 70%    -100.0%       0.00        perf-stat.i.instructions
      0.99 ± 70%    -100.0%       0.00        perf-stat.i.ipc
      0.06 ± 50%     -68.0%       0.02 ±102%  perf-stat.i.major-faults
      0.02 ±223%      +4.0%       0.02 ±186%  perf-stat.i.metric.K/sec
      1601 ± 19%      -3.1%       1552 ± 23%  perf-stat.i.minor-faults
      1602 ± 19%      -3.1%       1552 ± 23%  perf-stat.i.page-faults
     25951 ± 18%     -18.7%      21097 ± 25%  perf-stat.i.task-clock
      0.34 ± 70%    -100.0%       0.00        perf-stat.overall.MPKI
      2.88 ± 70%      -2.9        0.00        perf-stat.overall.branch-miss-rate%
     14.85 ± 70%     -14.9        0.00        perf-stat.overall.cache-miss-rate%
      0.45 ± 70%    -100.0%       0.00        perf-stat.overall.cpi
    883.12 ± 70%    -100.0%       0.00        perf-stat.overall.cycles-between-cache-misses
      0.99 ± 70%    -100.0%       0.00        perf-stat.overall.ipc
  30841511 ± 70%    -100.0%       0.00        perf-stat.ps.branch-instructions
   1333994 ± 70%    -100.0%       0.00        perf-stat.ps.branch-misses
     75781 ± 70%    -100.0%       0.00        perf-stat.ps.cache-misses
    340229 ± 70%    -100.0%       0.00        perf-stat.ps.cache-references
      8970 ± 47%      +8.3%       9712 ± 22%  perf-stat.ps.context-switches
     22507 ± 47%      -7.6%      20796 ± 25%  perf-stat.ps.cpu-clock
 1.003e+08 ± 70%    -100.0%       0.00        perf-stat.ps.cpu-cycles
    387.26 ± 49%     +21.4%     470.23 ± 22%  perf-stat.ps.cpu-migrations
 1.493e+08 ± 70%    -100.0%       0.00        perf-stat.ps.instructions
      0.06 ± 71%     -63.7%       0.02 ±102%  perf-stat.ps.major-faults
      1393 ± 47%      +9.7%       1529 ± 23%  perf-stat.ps.minor-faults
      1394 ± 47%      +9.7%       1529 ± 23%  perf-stat.ps.page-faults
     22507 ± 47%      -7.6%      20796 ± 25%  perf-stat.ps.task-clock
 1.039e+10 ± 70%    -100.0%       0.00        perf-stat.total.instructions
      3141 ± 25%     -30.3%       2188 ± 50%  numa-meminfo.node0.Active
      3117 ± 25%     -30.1%       2180 ± 50%  numa-meminfo.node0.Active(anon)
     24.04 ± 99%     -66.3%       8.10 ±220%  numa-meminfo.node0.Active(file)
     31794 ±100%      -6.0%      29879 ± 49%  numa-meminfo.node0.AnonHugePages
    299077 ± 67%     +55.7%     465777 ± 41%  numa-meminfo.node0.AnonPages
    311092 ± 65%     +58.4%     492852 ± 39%  numa-meminfo.node0.AnonPages.max
   1523363 ± 66%     +30.6%    1989616 ± 67%  numa-meminfo.node0.FilePages
    347710 ± 56%     +47.8%     514048 ± 40%  numa-meminfo.node0.Inactive
    347609 ± 56%     +47.9%     514008 ± 40%  numa-meminfo.node0.Inactive(anon)
    101.26 ± 99%     -60.9%      39.59 ±197%  numa-meminfo.node0.Inactive(file)
     56445 ± 22%      -5.4%      53375 ± 52%  numa-meminfo.node0.KReclaimable
     11183 ±  5%     -10.5%      10013 ±  6%  numa-meminfo.node0.KernelStack
     76733 ± 53%      -4.1%      73584 ± 37%  numa-meminfo.node0.Mapped
 1.293e+08            -0.5%  1.287e+08        numa-meminfo.node0.MemFree
 1.317e+08            +0.0%  1.317e+08        numa-meminfo.node0.MemTotal
   2346603 ± 45%     +26.8%    2975100 ± 42%  numa-meminfo.node0.MemUsed
      9.60 ± 44%     -20.1%       7.67 ± 70%  numa-meminfo.node0.Mlocked
     15538 ± 11%      +5.1%      16333 ± 16%  numa-meminfo.node0.PageTables
     56445 ± 22%      -5.4%      53375 ± 52%  numa-meminfo.node0.SReclaimable
    111516 ±  3%      -3.7%     107361 ±  2%  numa-meminfo.node0.SUnreclaim
      5140            +0.0%       5140        numa-meminfo.node0.SecPageTables
     60841 ± 55%     -11.8%      53647 ± 62%  numa-meminfo.node0.Shmem
    167962 ±  9%      -4.3%     160737 ± 18%  numa-meminfo.node0.Slab
   1471396 ± 67%     +31.8%    1938993 ± 70%  numa-meminfo.node0.Unevictable
     25891 ±  9%      -2.4%      25262 ± 24%  numa-meminfo.node1.Active
     25867 ±  9%      -2.5%      25222 ± 24%  numa-meminfo.node1.Active(anon)
     24.07 ± 99%     +66.3%      40.02 ± 44%  numa-meminfo.node1.Active(file)
     31870 ±100%     -30.1%      22284 ± 46%  numa-meminfo.node1.AnonHugePages
    421145 ± 48%     -38.6%     258605 ± 72%  numa-meminfo.node1.AnonPages
    432593 ± 47%     -31.5%     296295 ± 68%  numa-meminfo.node1.AnonPages.max
   1704667 ± 59%     -27.8%    1230075 ±109%  numa-meminfo.node1.FilePages
    446480 ± 44%     -36.5%     283446 ± 71%  numa-meminfo.node1.Inactive
    446365 ± 44%     -36.5%     283272 ± 72%  numa-meminfo.node1.Inactive(anon)
    114.99 ± 90%     +51.6%     174.31 ± 44%  numa-meminfo.node1.Inactive(file)
     34932 ± 36%      +7.9%      37693 ± 74%  numa-meminfo.node1.KReclaimable
      7656 ±  7%      +8.0%       8269 ±  6%  numa-meminfo.node1.KernelStack
     37990 ±107%      +6.5%      40474 ± 68%  numa-meminfo.node1.Mapped
 1.295e+08            +0.5%  1.301e+08        numa-meminfo.node1.MemFree
 1.321e+08            +0.0%  1.321e+08        numa-meminfo.node1.MemTotal
   2546426 ± 40%     -24.7%    1918243 ± 65%  numa-meminfo.node1.MemUsed
      1.92 ±223%     +99.5%       3.82 ±141%  numa-meminfo.node1.Mlocked
      8581 ± 21%      +1.0%       8668 ± 27%  numa-meminfo.node1.PageTables
     34932 ± 36%      +7.9%      37693 ± 74%  numa-meminfo.node1.SReclaimable
     56567 ±  6%      +2.2%      57784 ±  3%  numa-meminfo.node1.SUnreclaim
      5140            +0.0%       5140        numa-meminfo.node1.SecPageTables
     51412 ± 65%      -2.3%      50230 ± 66%  numa-meminfo.node1.Shmem
     91500 ± 17%      +4.3%      95477 ± 30%  numa-meminfo.node1.Slab
   1653115 ± 60%     -28.6%    1179628 ±115%  numa-meminfo.node1.Unevictable
     55.67 ± 12%     -17.1%      46.17        proc-vmstat.direct_map_level2_splits
      6.67 ± 29%      -5.0%       6.33 ±  7%  proc-vmstat.direct_map_level3_splits
      7244 ± 10%      -5.3%       6863 ± 21%  proc-vmstat.nr_active_anon
     12.03            +0.0%      12.03        proc-vmstat.nr_active_file
    180048            +0.6%     181073        proc-vmstat.nr_anon_pages
     30.97           -17.5%      25.54 ±  8%  proc-vmstat.nr_anon_transparent_hugepages
   6433817            +0.0%    6433879        proc-vmstat.nr_dirty_background_threshold
  12883365            +0.0%   12883490        proc-vmstat.nr_dirty_threshold
    807075            -0.3%     804909        proc-vmstat.nr_file_pages
  64717240            +0.0%   64717868        proc-vmstat.nr_free_pages
    198553            +0.4%     199268        proc-vmstat.nr_inactive_anon
     54.08 ±  2%      -1.1%      53.49        proc-vmstat.nr_inactive_file
      2570            +0.0%       2570        proc-vmstat.nr_iommu_pages
     18841            -3.0%      18278        proc-vmstat.nr_kernel_stack
     28920            -0.9%      28658        proc-vmstat.nr_mapped
   1047552            +0.0%    1047552        proc-vmstat.nr_memmap_boot
      2.90            -0.9%       2.87        proc-vmstat.nr_mlock
      6037 ±  3%      +3.4%       6243 ±  5%  proc-vmstat.nr_page_table_pages
      2570            +0.0%       2570        proc-vmstat.nr_sec_page_table_pages
     28132 ±  2%      -7.7%      25955 ±  6%  proc-vmstat.nr_shmem
     22846            -0.3%      22772        proc-vmstat.nr_slab_reclaimable
     42026            -1.7%      41291        proc-vmstat.nr_slab_unreclaimable
    781127            -0.2%     779656        proc-vmstat.nr_unevictable
      7244 ± 10%      -5.3%       6863 ± 21%  proc-vmstat.nr_zone_active_anon
     12.03            +0.0%      12.03        proc-vmstat.nr_zone_active_file
    198553            +0.4%     199268        proc-vmstat.nr_zone_inactive_anon
     54.08 ±  2%      -1.1%      53.49        proc-vmstat.nr_zone_inactive_file
    781127            -0.2%     779656        proc-vmstat.nr_zone_unevictable
      2519 ±219%    +237.2%       8497 ± 56%  proc-vmstat.numa_hint_faults
     17.33 ±208%   +4085.6%     725.50 ±216%  proc-vmstat.numa_hint_faults_local
    335683 ±  5%      +1.6%     341218 ±  5%  proc-vmstat.numa_hit
      0.00       +2.5e+103%      25.17 ± 57%  proc-vmstat.numa_huge_pte_updates
      0.00          -100.0%       0.00        proc-vmstat.numa_interleave
    276463 ±  4%      +1.2%     279775 ±  4%  proc-vmstat.numa_local
     59199 ±  9%      +3.8%      61443 ±  9%  proc-vmstat.numa_other
      2502 ±219%    +513.4%      15351 ± 48%  proc-vmstat.numa_pages_migrated
     12652 ±221%    +428.0%      66802 ± 47%  proc-vmstat.numa_pte_updates
     16442 ± 57%     +69.4%      27851 ±  8%  proc-vmstat.pgactivate
      0.00          -100.0%       0.00        proc-vmstat.pgalloc_dma
      0.00          -100.0%       0.00        proc-vmstat.pgalloc_dma32
    379957 ±  4%      +1.3%     384766 ±  4%  proc-vmstat.pgalloc_normal
    271148 ±  3%      +0.4%     272147 ±  2%  proc-vmstat.pgfault
    349570 ±  6%      +5.9%     370185 ±  3%  proc-vmstat.pgfree
      2502 ±219%    +513.4%      15351 ± 48%  proc-vmstat.pgmigrate_success
      2852            +0.0%       2852        proc-vmstat.pgpgin
     12038 ± 10%      +2.8%      12379 ±  5%  proc-vmstat.pgreuse
     54.67 ±  5%     -32.0%      37.17 ± 23%  proc-vmstat.thp_collapse_alloc
      0.00          -100.0%       0.00        proc-vmstat.thp_fault_alloc
      0.00       +1.5e+103%      14.83 ± 58%  proc-vmstat.thp_migration_success
      0.00          -100.0%       0.00        proc-vmstat.thp_split_pmd
      0.00          -100.0%       0.00        proc-vmstat.thp_zero_page_alloc
    467.17           +52.4%     711.83        proc-vmstat.unevictable_pgs_culled
      3.00            +0.0%       3.00        proc-vmstat.unevictable_pgs_mlocked
      1.00 ±141%    +200.0%       3.00        proc-vmstat.unevictable_pgs_munlocked
    779.50 ± 25%     -29.7%     547.69 ± 50%  numa-vmstat.node0.nr_active_anon
      6.01 ± 99%     -66.3%       2.02 ±220%  numa-vmstat.node0.nr_active_file
     74768 ± 67%     +55.7%     116435 ± 41%  numa-vmstat.node0.nr_anon_pages
     15.56 ±100%      -5.9%      14.65 ± 49%  numa-vmstat.node0.nr_anon_transparent_hugepages
    380796 ± 66%     +30.6%     497406 ± 67%  numa-vmstat.node0.nr_file_pages
  32337170            -0.5%   32180149        numa-vmstat.node0.nr_free_pages
     86852 ± 56%     +47.9%     128492 ± 40%  numa-vmstat.node0.nr_inactive_anon
     25.32 ± 99%     -60.9%       9.90 ±197%  numa-vmstat.node0.nr_inactive_file
      1285            +0.0%       1285        numa-vmstat.node0.nr_iommu_pages
      1.18 ±223%    -100.0%       0.00        numa-vmstat.node0.nr_isolated_anon
     11179 ±  5%     -10.5%      10008 ±  6%  numa-vmstat.node0.nr_kernel_stack
     19246 ± 53%      -4.1%      18458 ± 37%  numa-vmstat.node0.nr_mapped
    523264            +0.0%     523264        numa-vmstat.node0.nr_memmap_boot
      2.39 ± 44%     -19.8%       1.92 ± 70%  numa-vmstat.node0.nr_mlock
      3881 ± 11%      +5.1%       4079 ± 16%  numa-vmstat.node0.nr_page_table_pages
      1285            +0.0%       1285        numa-vmstat.node0.nr_sec_page_table_pages
     15166 ± 55%     -11.6%      13413 ± 62%  numa-vmstat.node0.nr_shmem
     14110 ± 22%      -5.4%      13344 ± 52%  numa-vmstat.node0.nr_slab_reclaimable
     27878 ±  3%      -3.7%      26845 ±  2%  numa-vmstat.node0.nr_slab_unreclaimable
    367849 ± 67%     +31.8%     484748 ± 70%  numa-vmstat.node0.nr_unevictable
    779.50 ± 25%     -29.7%     547.69 ± 50%  numa-vmstat.node0.nr_zone_active_anon
      6.01 ± 99%     -66.3%       2.02 ±220%  numa-vmstat.node0.nr_zone_active_file
     86852 ± 56%     +47.9%     128492 ± 40%  numa-vmstat.node0.nr_zone_inactive_anon
     25.32 ± 99%     -60.9%       9.90 ±197%  numa-vmstat.node0.nr_zone_inactive_file
    367849 ± 67%     +31.8%     484748 ± 70%  numa-vmstat.node0.nr_zone_unevictable
    146793 ± 26%      -9.3%     133115 ± 15%  numa-vmstat.node0.numa_hit
      0.00          -100.0%       0.00        numa-vmstat.node0.numa_interleave
    117501 ± 40%     -17.4%      97040 ± 37%  numa-vmstat.node0.numa_local
     29291 ± 53%     +23.2%      36074 ± 62%  numa-vmstat.node0.numa_other
      6499 ±  9%      -2.7%       6326 ± 24%  numa-vmstat.node1.nr_active_anon
      6.02 ± 99%     +66.3%      10.00 ± 44%  numa-vmstat.node1.nr_active_file
    105286 ± 48%     -38.6%      64646 ± 72%  numa-vmstat.node1.nr_anon_pages
     15.58 ±100%     -30.0%      10.90 ± 46%  numa-vmstat.node1.nr_anon_transparent_hugepages
    426166 ± 59%     -27.8%     307525 ±109%  numa-vmstat.node1.nr_file_pages
  32379915            +0.5%   32537079        numa-vmstat.node1.nr_free_pages
    111556 ± 44%     -36.5%      70797 ± 72%  numa-vmstat.node1.nr_inactive_anon
     28.75 ± 90%     +51.6%      43.58 ± 44%  numa-vmstat.node1.nr_inactive_file
      1285            +0.0%       1285        numa-vmstat.node1.nr_iommu_pages
      0.00       +1.3e+101%       0.13 ±223%  numa-vmstat.node1.nr_isolated_anon
      7655 ±  7%      +8.0%       8267 ±  6%  numa-vmstat.node1.nr_kernel_stack
      9539 ±107%      +7.0%      10206 ± 67%  numa-vmstat.node1.nr_mapped
    524288            +0.0%     524288        numa-vmstat.node1.nr_memmap_boot
      0.48 ±223%     +99.5%       0.96 ±141%  numa-vmstat.node1.nr_mlock
      2145 ± 22%      +0.7%       2161 ± 27%  numa-vmstat.node1.nr_page_table_pages
      1285            +0.0%       1285        numa-vmstat.node1.nr_sec_page_table_pages
     12852 ± 65%      -2.2%      12565 ± 66%  numa-vmstat.node1.nr_shmem
      8732 ± 36%      +7.9%       9423 ± 74%  numa-vmstat.node1.nr_slab_reclaimable
     14145 ±  6%      +2.2%      14453 ±  3%  numa-vmstat.node1.nr_slab_unreclaimable
    413278 ± 60%     -28.6%     294906 ±115%  numa-vmstat.node1.nr_unevictable
      6499 ±  9%      -2.7%       6326 ± 24%  numa-vmstat.node1.nr_zone_active_anon
      6.02 ± 99%     +66.3%      10.00 ± 44%  numa-vmstat.node1.nr_zone_active_file
    111556 ± 44%     -36.5%      70797 ± 72%  numa-vmstat.node1.nr_zone_inactive_anon
     28.75 ± 90%     +51.6%      43.58 ± 44%  numa-vmstat.node1.nr_zone_inactive_file
    413278 ± 60%     -28.6%     294906 ±115%  numa-vmstat.node1.nr_zone_unevictable
    186178 ± 14%      +9.7%     204302 ±  9%  numa-vmstat.node1.numa_hit
      0.00          -100.0%       0.00        numa-vmstat.node1.numa_interleave
    156279 ± 25%     +14.5%     178933 ± 20%  numa-vmstat.node1.numa_local
     29909 ± 63%     -15.2%      25368 ± 79%  numa-vmstat.node1.numa_other
      3981 ±  9%     -10.1%       3580 ±  9%  sched_debug.cfs_rq:/.avg_vruntime.avg
     31338 ± 17%     -11.2%      27843 ± 15%  sched_debug.cfs_rq:/.avg_vruntime.max
    301.24 ± 42%     -42.6%     172.96 ± 52%  sched_debug.cfs_rq:/.avg_vruntime.min
      5576 ± 15%     -15.3%       4723 ± 14%  sched_debug.cfs_rq:/.avg_vruntime.stddev
      0.26 ±  9%      -5.9%       0.25 ± 12%  sched_debug.cfs_rq:/.h_nr_running.avg
      1.33 ± 35%     -12.5%       1.17 ± 31%  sched_debug.cfs_rq:/.h_nr_running.max
      0.45 ±  5%      -3.4%       0.44 ±  6%  sched_debug.cfs_rq:/.h_nr_running.stddev
     40.37 ±133%     -80.2%       8.01 ±223%  sched_debug.cfs_rq:/.left_deadline.avg
      2583 ±133%     -80.2%     512.57 ±223%  sched_debug.cfs_rq:/.left_deadline.max
      0.00            +0.0%       0.00        sched_debug.cfs_rq:/.left_deadline.min
    320.42 ±133%     -80.2%      63.57 ±223%  sched_debug.cfs_rq:/.left_deadline.stddev
     39.85 ±133%     -81.5%       7.35 ±223%  sched_debug.cfs_rq:/.left_vruntime.avg
      2550 ±133%     -81.5%     470.70 ±223%  sched_debug.cfs_rq:/.left_vruntime.max
      0.00            +0.0%       0.00        sched_debug.cfs_rq:/.left_vruntime.min
    316.33 ±133%     -81.5%      58.38 ±223%  sched_debug.cfs_rq:/.left_vruntime.stddev
     26758 ± 29%     -69.1%       8273 ± 75%  sched_debug.cfs_rq:/.load.avg
   1398101 ± 35%     -84.4%     218463 ±172%  sched_debug.cfs_rq:/.load.max
    173091 ± 35%     -82.0%      31100 ±144%  sched_debug.cfs_rq:/.load.stddev
    828.45 ± 79%     -73.1%     222.79 ± 45%  sched_debug.cfs_rq:/.load_avg.avg
     41351 ± 92%     -86.3%       5683 ±115%  sched_debug.cfs_rq:/.load_avg.max
      5209 ± 89%     -83.8%     841.92 ± 86%  sched_debug.cfs_rq:/.load_avg.stddev
      3981 ±  9%     -10.1%       3580 ±  9%  sched_debug.cfs_rq:/.min_vruntime.avg
     31338 ± 17%     -11.2%      27843 ± 15%  sched_debug.cfs_rq:/.min_vruntime.max
    301.24 ± 42%     -42.6%     172.96 ± 52%  sched_debug.cfs_rq:/.min_vruntime.min
      5576 ± 15%     -15.3%       4723 ± 14%  sched_debug.cfs_rq:/.min_vruntime.stddev
      0.26 ±  9%      -5.9%       0.25 ± 12%  sched_debug.cfs_rq:/.nr_running.avg
      1.33 ± 35%     -12.5%       1.17 ± 31%  sched_debug.cfs_rq:/.nr_running.max
      0.45 ±  5%      -3.4%       0.44 ±  6%  sched_debug.cfs_rq:/.nr_running.stddev
    104.22 ± 26%      +2.2%     106.48 ± 16%  sched_debug.cfs_rq:/.removed.load_avg.avg
      1024            +0.0%       1024        sched_debug.cfs_rq:/.removed.load_avg.max
    302.38 ± 11%      +1.4%     306.72 ±  7%  sched_debug.cfs_rq:/.removed.load_avg.stddev
     32.75 ± 33%     +15.2%      37.71 ± 22%  sched_debug.cfs_rq:/.removed.runnable_avg.avg
    500.50 ±  9%      +6.9%     535.00 ±  3%  sched_debug.cfs_rq:/.removed.runnable_avg.max
    104.54 ± 25%     +13.8%     118.96 ± 14%  sched_debug.cfs_rq:/.removed.runnable_avg.stddev
     32.75 ± 33%     +15.1%      37.71 ± 22%  sched_debug.cfs_rq:/.removed.util_avg.avg
    500.50 ±  9%      +6.9%     535.00 ±  3%  sched_debug.cfs_rq:/.removed.util_avg.max
    104.54 ± 25%     +13.8%     118.95 ± 14%  sched_debug.cfs_rq:/.removed.util_avg.stddev
     39.85 ±133%     -81.5%       7.35 ±223%  sched_debug.cfs_rq:/.right_vruntime.avg
      2550 ±133%     -81.5%     470.70 ±223%  sched_debug.cfs_rq:/.right_vruntime.max
      0.00            +0.0%       0.00        sched_debug.cfs_rq:/.right_vruntime.min
    316.33 ±133%     -81.5%      58.38 ±223%  sched_debug.cfs_rq:/.right_vruntime.stddev
    450.36 ±  8%      -0.8%     446.96 ±  5%  sched_debug.cfs_rq:/.runnable_avg.avg
      1302 ± 15%      +5.3%       1372 ± 17%  sched_debug.cfs_rq:/.runnable_avg.max
      0.00          -100.0%       0.00        sched_debug.cfs_rq:/.runnable_avg.min
    315.44 ±  6%      +4.5%     329.70 ±  8%  sched_debug.cfs_rq:/.runnable_avg.stddev
    448.68 ±  8%      -0.9%     444.51 ±  5%  sched_debug.cfs_rq:/.util_avg.avg
      1302 ± 15%      +5.1%       1369 ± 17%  sched_debug.cfs_rq:/.util_avg.max
    315.25 ±  6%      +4.5%     329.55 ±  8%  sched_debug.cfs_rq:/.util_avg.stddev
     28.04 ± 16%      +9.2%      30.64 ± 26%  sched_debug.cfs_rq:/.util_est.avg
    501.33 ±  3%      -0.5%     499.00 ±  5%  sched_debug.cfs_rq:/.util_est.max
    107.11 ±  9%      +0.8%     107.96 ± 14%  sched_debug.cfs_rq:/.util_est.stddev
    687803 ±  3%      +2.7%     706278        sched_debug.cpu.avg_idle.avg
   1068990 ±  9%      +9.3%    1168870 ± 20%  sched_debug.cpu.avg_idle.max
      3653 ±  8%      +3.1%       3766 ± 22%  sched_debug.cpu.avg_idle.min
    270698 ±  6%      -0.3%     269976 ±  6%  sched_debug.cpu.avg_idle.stddev
     39047            +1.3%      39556 ±  2%  sched_debug.cpu.clock.avg
     39049            +1.3%      39558 ±  2%  sched_debug.cpu.clock.max
     39044            +1.3%      39553 ±  2%  sched_debug.cpu.clock.min
      1.44 ±  8%      +1.6%       1.47 ±  9%  sched_debug.cpu.clock.stddev
     38788            +1.3%      39286 ±  2%  sched_debug.cpu.clock_task.avg
     39035            +1.3%      39542 ±  2%  sched_debug.cpu.clock_task.max
     30929 ±  2%      +1.2%      31309 ±  2%  sched_debug.cpu.clock_task.min
      1004 ±  2%      +1.9%       1023 ±  4%  sched_debug.cpu.clock_task.stddev
    548.32 ± 11%      -2.3%     535.53 ± 10%  sched_debug.cpu.curr->pid.avg
      2416            -0.1%       2414        sched_debug.cpu.curr->pid.max
    959.07 ±  4%      +0.8%     966.30 ±  3%  sched_debug.cpu.curr->pid.stddev
    503827            +0.4%     505891        sched_debug.cpu.max_idle_balance_cost.avg
    653163 ± 12%     +14.0%     744772 ± 33%  sched_debug.cpu.max_idle_balance_cost.max
    500000            +0.0%     500000        sched_debug.cpu.max_idle_balance_cost.min
     21842 ± 47%     +56.0%      34074 ± 96%  sched_debug.cpu.max_idle_balance_cost.stddev
      4294            +0.0%       4294        sched_debug.cpu.next_balance.avg
      4294            +0.0%       4294        sched_debug.cpu.next_balance.max
      4294            +0.0%       4294        sched_debug.cpu.next_balance.min
      0.00 ± 45%     -46.6%       0.00 ± 11%  sched_debug.cpu.next_balance.stddev
      0.27 ±  7%      -8.7%       0.24 ± 12%  sched_debug.cpu.nr_running.avg
      1.33 ± 35%      +0.0%       1.33 ± 55%  sched_debug.cpu.nr_running.max
      0.45 ±  4%      -2.1%       0.44 ± 10%  sched_debug.cpu.nr_running.stddev
      1858 ± 13%      -7.3%       1722 ±  5%  sched_debug.cpu.nr_switches.avg
     12061 ± 60%     -34.0%       7955 ± 16%  sched_debug.cpu.nr_switches.max
    186.00 ± 24%     -10.6%     166.33 ± 12%  sched_debug.cpu.nr_switches.min
      2237 ± 36%     -21.3%       1759 ± 10%  sched_debug.cpu.nr_switches.stddev
     39044            +1.3%      39553 ±  2%  sched_debug.cpu_clk
    996147            +0.0%     996147        sched_debug.dl_rq:.dl_bw->bw.avg
    996147            +0.0%     996147        sched_debug.dl_rq:.dl_bw->bw.max
    996147            +0.0%     996147        sched_debug.dl_rq:.dl_bw->bw.min
 4.295e+09            +0.0%  4.295e+09        sched_debug.jiffies
     37881            +1.3%      38390 ±  2%  sched_debug.ktime
      0.00          -100.0%       0.00        sched_debug.rt_rq:.rt_nr_running.avg
      0.00          -100.0%       0.00        sched_debug.rt_rq:.rt_nr_running.max
      0.00          -100.0%       0.00        sched_debug.rt_rq:.rt_nr_running.stddev
    950.00            +0.0%     950.00        sched_debug.rt_rq:.rt_runtime.avg
    950.00            +0.0%     950.00        sched_debug.rt_rq:.rt_runtime.max
    950.00            +0.0%     950.00        sched_debug.rt_rq:.rt_runtime.min
      0.00          -100.0%       0.00        sched_debug.rt_rq:.rt_runtime.stddev
      0.00 ±110%     -36.3%       0.00 ±107%  sched_debug.rt_rq:.rt_time.avg
      0.10 ±110%     -36.3%       0.06 ±107%  sched_debug.rt_rq:.rt_time.max
      0.01 ±110%     -36.3%       0.01 ±107%  sched_debug.rt_rq:.rt_time.stddev
     40589 ±  3%      -0.1%      40565 ±  2%  sched_debug.sched_clk
      1.00            +0.0%       1.00        sched_debug.sched_clock_stable()
      3.00            +0.0%       3.00        sched_debug.sysctl_sched.sysctl_sched_base_slice
   6237751            +0.0%    6237751        sched_debug.sysctl_sched.sysctl_sched_features
      1.00            +0.0%       1.00        sched_debug.sysctl_sched.sysctl_sched_tunable_scaling
      8.31 ±141%      -0.2        8.07 ±100%  perf-profile.calltrace.cycles-pp.rcu_momentary_dyntick_idle.multi_cpu_stop.cpu_stopper_thread.smpboot_thread_fn.kthread
      0.00            +0.1        0.09 ±223%  perf-profile.calltrace.cycles-pp.ktime_get.cpuhp_wait_for_sync_state.cpuhp_bringup_ap.cpuhp_invoke_callback.__cpuhp_invoke_callback_range
      0.00            +0.1        0.10 ±223%  perf-profile.calltrace.cycles-pp.cpuhp_wait_for_sync_state.cpuhp_bringup_ap.cpuhp_invoke_callback.__cpuhp_invoke_callback_range._cpu_up
      0.00            +0.1        0.10 ±223%  perf-profile.calltrace.cycles-pp.wait_for_lsr.wait_for_xmitr.serial8250_console_write.console_flush_all.console_unlock
      0.00            +0.1        0.10 ±223%  perf-profile.calltrace.cycles-pp.wait_for_xmitr.serial8250_console_write.console_flush_all.console_unlock.vprintk_emit
      0.00            +0.1        0.10 ±223%  perf-profile.calltrace.cycles-pp.cpuhp_bringup_ap.cpuhp_invoke_callback.__cpuhp_invoke_callback_range._cpu_up.cpu_up
      0.00            +0.1        0.11 ±223%  perf-profile.calltrace.cycles-pp.sched_balance_rq.sched_balance_newidle.balance_fair.__schedule.schedule
      0.00            +0.1        0.11 ±223%  perf-profile.calltrace.cycles-pp.balance_fair.__schedule.schedule.smpboot_thread_fn.kthread
      0.00            +0.1        0.11 ±223%  perf-profile.calltrace.cycles-pp.sched_balance_newidle.balance_fair.__schedule.schedule.smpboot_thread_fn
      0.00            +0.1        0.13 ±223%  perf-profile.calltrace.cycles-pp.__schedule.schedule.smpboot_thread_fn.kthread.ret_from_fork
      0.00            +0.1        0.13 ±223%  perf-profile.calltrace.cycles-pp.schedule.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.00            +0.2        0.22 ±143%  perf-profile.calltrace.cycles-pp.sched_balance_rq.sched_balance_newidle.pick_next_task_fair.__schedule.schedule
      0.00            +0.2        0.24 ±143%  perf-profile.calltrace.cycles-pp.sched_balance_newidle.pick_next_task_fair.__schedule.schedule.schedule_timeout
      0.00            +0.2        0.24 ±143%  perf-profile.calltrace.cycles-pp.pick_next_task_fair.__schedule.schedule.schedule_timeout.msleep
      0.00            +0.3        0.26 ±144%  perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.rest_init
      0.00            +0.3        0.29 ±144%  perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.rest_init.start_kernel
      0.00            +0.3        0.30 ±143%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.rest_init.start_kernel.x86_64_start_reservations.x86_64_start_kernel
      0.00            +0.3        0.30 ±143%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.rest_init.start_kernel.x86_64_start_reservations
      0.00            +0.3        0.30 ±143%  perf-profile.calltrace.cycles-pp.rest_init.start_kernel.x86_64_start_reservations.x86_64_start_kernel.common_startup_64
      0.00            +0.3        0.30 ±143%  perf-profile.calltrace.cycles-pp.start_kernel.x86_64_start_reservations.x86_64_start_kernel.common_startup_64
      0.00            +0.3        0.30 ±143%  perf-profile.calltrace.cycles-pp.x86_64_start_kernel.common_startup_64
      0.00            +0.3        0.30 ±143%  perf-profile.calltrace.cycles-pp.x86_64_start_reservations.x86_64_start_kernel.common_startup_64
      0.00            +0.3        0.34 ±103%  perf-profile.calltrace.cycles-pp.asm_sysvec_call_function_single.acpi_safe_halt.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter
      0.00            +0.4        0.39 ±106%  perf-profile.calltrace.cycles-pp.__schedule.schedule.schedule_timeout.msleep.online_store
      0.00            +0.4        0.40 ±105%  perf-profile.calltrace.cycles-pp.schedule.schedule_timeout.msleep.online_store.kernfs_fop_write_iter
      0.00            +0.4        0.42 ±105%  perf-profile.calltrace.cycles-pp.schedule_timeout.msleep.online_store.kernfs_fop_write_iter.vfs_write
      0.00            +0.4        0.43 ±105%  perf-profile.calltrace.cycles-pp.msleep.online_store.kernfs_fop_write_iter.vfs_write.ksys_write
      0.00            +0.5        0.49 ±109%  perf-profile.calltrace.cycles-pp.mce_cpu_dead.cpuhp_invoke_callback.__cpuhp_invoke_callback_range._cpu_down.__cpu_down_maps_locked
      0.00            +0.5        0.49 ±109%  perf-profile.calltrace.cycles-pp.on_each_cpu_cond_mask.mce_cpu_dead.cpuhp_invoke_callback.__cpuhp_invoke_callback_range._cpu_down
      0.00            +0.5        0.49 ±109%  perf-profile.calltrace.cycles-pp.smp_call_function_many_cond.on_each_cpu_cond_mask.mce_cpu_dead.cpuhp_invoke_callback.__cpuhp_invoke_callback_range
      0.00            +0.7        0.68 ±112%  perf-profile.calltrace.cycles-pp.delay_tsc.wait_for_lsr.serial8250_console_write.console_flush_all.console_unlock
      0.19 ±141%      +0.8        1.02 ±108%  perf-profile.calltrace.cycles-pp.console_flush_all.console_unlock.vprintk_emit._printk.do_boot_cpu
      0.19 ±141%      +0.8        1.02 ±108%  perf-profile.calltrace.cycles-pp.console_unlock.vprintk_emit._printk.do_boot_cpu.native_kick_ap
      0.19 ±141%      +0.8        1.02 ±108%  perf-profile.calltrace.cycles-pp._printk.do_boot_cpu.native_kick_ap.cpuhp_invoke_callback.__cpuhp_invoke_callback_range
      0.19 ±141%      +0.8        1.02 ±108%  perf-profile.calltrace.cycles-pp.vprintk_emit._printk.do_boot_cpu.native_kick_ap.cpuhp_invoke_callback
      0.19 ±141%      +0.8        1.04 ±108%  perf-profile.calltrace.cycles-pp.do_boot_cpu.native_kick_ap.cpuhp_invoke_callback.__cpuhp_invoke_callback_range._cpu_up
      0.19 ±141%      +0.9        1.05 ±108%  perf-profile.calltrace.cycles-pp.native_kick_ap.cpuhp_invoke_callback.__cpuhp_invoke_callback_range._cpu_up.cpu_up
      0.24 ±141%      +1.1        1.30 ±106%  perf-profile.calltrace.cycles-pp.__cpuhp_invoke_callback_range._cpu_up.cpu_up.cpu_subsys_online.device_online
      0.24 ±141%      +1.1        1.30 ±106%  perf-profile.calltrace.cycles-pp._cpu_up.cpu_up.cpu_subsys_online.device_online.online_store
      0.24 ±141%      +1.1        1.30 ±106%  perf-profile.calltrace.cycles-pp.cpuhp_invoke_callback.__cpuhp_invoke_callback_range._cpu_up.cpu_up.cpu_subsys_online
      0.24 ±141%      +1.1        1.30 ±106%  perf-profile.calltrace.cycles-pp.device_online.online_store.kernfs_fop_write_iter.vfs_write.ksys_write
      0.24 ±141%      +1.1        1.30 ±106%  perf-profile.calltrace.cycles-pp.cpu_subsys_online.device_online.online_store.kernfs_fop_write_iter.vfs_write
      0.24 ±141%      +1.1        1.30 ±106%  perf-profile.calltrace.cycles-pp.cpu_up.cpu_subsys_online.device_online.online_store.kernfs_fop_write_iter
      0.23 ±143%      +1.2        1.46 ±105%  perf-profile.calltrace.cycles-pp.io_serial_in.wait_for_lsr.serial8250_console_write.console_flush_all.console_unlock
      0.42 ±142%      +1.2        1.67 ±103%  perf-profile.calltrace.cycles-pp.console_flush_all.console_unlock.vprintk_emit._printk.takedown_cpu
      0.42 ±142%      +1.2        1.67 ±103%  perf-profile.calltrace.cycles-pp.console_unlock.vprintk_emit._printk.takedown_cpu.cpuhp_invoke_callback
      0.42 ±142%      +1.3        1.67 ±103%  perf-profile.calltrace.cycles-pp._printk.takedown_cpu.cpuhp_invoke_callback.__cpuhp_invoke_callback_range._cpu_down
      0.42 ±142%      +1.3        1.67 ±103%  perf-profile.calltrace.cycles-pp.vprintk_emit._printk.takedown_cpu.cpuhp_invoke_callback.__cpuhp_invoke_callback_range
      0.43 ±142%      +1.3        1.70 ±103%  perf-profile.calltrace.cycles-pp.takedown_cpu.cpuhp_invoke_callback.__cpuhp_invoke_callback_range._cpu_down.__cpu_down_maps_locked
      0.00            +1.4        1.37 ±101%  perf-profile.calltrace.cycles-pp.touch_softlockup_watchdog.multi_cpu_stop.cpu_stopper_thread.smpboot_thread_fn.kthread
      0.36 ±141%      +1.4        1.74 ±105%  perf-profile.calltrace.cycles-pp.online_store.kernfs_fop_write_iter.vfs_write.ksys_write.do_syscall_64
      4.11 ±143%      +1.4        5.50 ±108%  perf-profile.calltrace.cycles-pp.ast_primary_plane_helper_atomic_update.drm_atomic_helper_commit_planes.drm_atomic_helper_commit_tail.ast_mode_config_helper_atomic_commit_tail.commit_tail
      4.11 ±143%      +1.4        5.50 ±108%  perf-profile.calltrace.cycles-pp.drm_fb_memcpy.ast_primary_plane_helper_atomic_update.drm_atomic_helper_commit_planes.drm_atomic_helper_commit_tail.ast_mode_config_helper_atomic_commit_tail
      4.11 ±143%      +1.4        5.51 ±108%  perf-profile.calltrace.cycles-pp.ast_mode_config_helper_atomic_commit_tail.commit_tail.drm_atomic_helper_commit.drm_atomic_commit.drm_atomic_helper_dirtyfb
      4.11 ±143%      +1.4        5.51 ±108%  perf-profile.calltrace.cycles-pp.commit_tail.drm_atomic_helper_commit.drm_atomic_commit.drm_atomic_helper_dirtyfb.drm_fbdev_shmem_helper_fb_dirty
      4.11 ±143%      +1.4        5.51 ±108%  perf-profile.calltrace.cycles-pp.drm_atomic_helper_commit_tail.ast_mode_config_helper_atomic_commit_tail.commit_tail.drm_atomic_helper_commit.drm_atomic_commit
      4.11 ±143%      +1.4        5.51 ±108%  perf-profile.calltrace.cycles-pp.drm_atomic_helper_commit_planes.drm_atomic_helper_commit_tail.ast_mode_config_helper_atomic_commit_tail.commit_tail.drm_atomic_helper_commit
      4.11 ±143%      +1.4        5.52 ±108%  perf-profile.calltrace.cycles-pp.drm_atomic_helper_commit.drm_atomic_commit.drm_atomic_helper_dirtyfb.drm_fbdev_shmem_helper_fb_dirty.drm_fb_helper_damage_work
      4.11 ±143%      +1.4        5.52 ±108%  perf-profile.calltrace.cycles-pp.drm_atomic_commit.drm_atomic_helper_dirtyfb.drm_fbdev_shmem_helper_fb_dirty.drm_fb_helper_damage_work.process_one_work
      4.11 ±143%      +1.4        5.52 ±108%  perf-profile.calltrace.cycles-pp.drm_atomic_helper_dirtyfb.drm_fbdev_shmem_helper_fb_dirty.drm_fb_helper_damage_work.process_one_work.worker_thread
      4.11 ±143%      +1.4        5.52 ±108%  perf-profile.calltrace.cycles-pp.drm_fbdev_shmem_helper_fb_dirty.drm_fb_helper_damage_work.process_one_work.worker_thread.kthread
      4.11 ±143%      +1.4        5.52 ±108%  perf-profile.calltrace.cycles-pp.drm_fb_helper_damage_work.process_one_work.worker_thread.kthread.ret_from_fork
      0.37 ±141%      +1.4        1.80 ±105%  perf-profile.calltrace.cycles-pp.kernfs_fop_write_iter.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      4.00 ±143%      +1.4        5.43 ±108%  perf-profile.calltrace.cycles-pp.memcpy_toio.drm_fb_memcpy.ast_primary_plane_helper_atomic_update.drm_atomic_helper_commit_planes.drm_atomic_helper_commit_tail
      0.38 ±141%      +1.5        1.83 ±105%  perf-profile.calltrace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      0.38 ±141%      +1.5        1.84 ±105%  perf-profile.calltrace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      0.18 ±141%      +1.5        1.66 ±100%  perf-profile.calltrace.cycles-pp.arch_touch_nmi_watchdog.multi_cpu_stop.cpu_stopper_thread.smpboot_thread_fn.kthread
      0.40 ±141%      +1.5        1.90 ±105%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      0.40 ±141%      +1.5        1.90 ±105%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.write
      0.42 ±141%      +1.5        1.94 ±105%  perf-profile.calltrace.cycles-pp.write
      0.58 ±141%      +1.7        2.30 ±103%  perf-profile.calltrace.cycles-pp.__cpuhp_invoke_callback_range._cpu_down.__cpu_down_maps_locked.work_for_cpu_fn.process_one_work
      0.58 ±141%      +1.7        2.30 ±103%  perf-profile.calltrace.cycles-pp.cpuhp_invoke_callback.__cpuhp_invoke_callback_range._cpu_down.__cpu_down_maps_locked.work_for_cpu_fn
      0.58 ±141%      +1.7        2.31 ±103%  perf-profile.calltrace.cycles-pp.__cpu_down_maps_locked.work_for_cpu_fn.process_one_work.worker_thread.kthread
      0.58 ±141%      +1.7        2.31 ±103%  perf-profile.calltrace.cycles-pp._cpu_down.__cpu_down_maps_locked.work_for_cpu_fn.process_one_work.worker_thread
      0.58 ±141%      +1.7        2.31 ±103%  perf-profile.calltrace.cycles-pp.work_for_cpu_fn.process_one_work.worker_thread.kthread.ret_from_fork
      0.48 ±141%      +1.8        2.27 ±101%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.cmci_discover.__flush_smp_call_function_queue.__sysvec_call_function
      0.42 ±149%      +1.8        2.22 ±104%  perf-profile.calltrace.cycles-pp.wait_for_lsr.serial8250_console_write.console_flush_all.console_unlock.vprintk_emit
      0.48 ±141%      +1.8        2.28 ±101%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.cmci_discover.__flush_smp_call_function_queue.__sysvec_call_function.sysvec_call_function
      0.50 ±141%      +1.9        2.40 ±101%  perf-profile.calltrace.cycles-pp.cmci_discover.__flush_smp_call_function_queue.__sysvec_call_function.sysvec_call_function.asm_sysvec_call_function
      0.50 ±141%      +1.9        2.40 ±101%  perf-profile.calltrace.cycles-pp.__flush_smp_call_function_queue.__sysvec_call_function.sysvec_call_function.asm_sysvec_call_function.acpi_safe_halt
      0.50 ±141%      +1.9        2.40 ±101%  perf-profile.calltrace.cycles-pp.__sysvec_call_function.sysvec_call_function.asm_sysvec_call_function.acpi_safe_halt.acpi_idle_enter
      0.50 ±141%      +1.9        2.41 ±101%  perf-profile.calltrace.cycles-pp.sysvec_call_function.asm_sysvec_call_function.acpi_safe_halt.acpi_idle_enter.cpuidle_enter_state
     12.83 ±141%      +1.9       14.74 ±101%  perf-profile.calltrace.cycles-pp.stop_machine_yield.multi_cpu_stop.cpu_stopper_thread.smpboot_thread_fn.kthread
      0.51 ±141%      +1.9        2.43 ±101%  perf-profile.calltrace.cycles-pp.asm_sysvec_call_function.acpi_safe_halt.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter
      0.56 ±141%      +2.0        2.56 ±104%  perf-profile.calltrace.cycles-pp.serial8250_console_write.console_flush_all.console_unlock.vprintk_emit._printk
      0.72 ±141%      +2.5        3.25 ±104%  perf-profile.calltrace.cycles-pp.acpi_safe_halt.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
      0.43 ±141%      +2.6        2.99 ±101%  perf-profile.calltrace.cycles-pp.wq_watchdog_touch.multi_cpu_stop.cpu_stopper_thread.smpboot_thread_fn.kthread
      0.84 ±141%      +2.6        3.48 ±103%  perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
      0.96 ±141%      +2.9        3.82 ±102%  perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      0.83 ±141%      +2.9        3.72 ±104%  perf-profile.calltrace.cycles-pp.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      0.83 ±141%      +2.9        3.74 ±104%  perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
      1.01 ±141%      +3.0        4.00 ±102%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      1.01 ±141%      +3.0        4.00 ±102%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.common_startup_64
      1.01 ±141%      +3.0        4.00 ±102%  perf-profile.calltrace.cycles-pp.start_secondary.common_startup_64
      4.71 ±143%      +3.2        7.86 ±106%  perf-profile.calltrace.cycles-pp.process_one_work.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      4.71 ±143%      +3.2        7.88 ±106%  perf-profile.calltrace.cycles-pp.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      1.12 ±141%      +3.2        4.37 ±103%  perf-profile.calltrace.cycles-pp.common_startup_64
     26.85 ±141%      +8.0       34.82 ±100%  perf-profile.calltrace.cycles-pp.cpu_stopper_thread.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     26.88 ±141%      +8.2       35.11 ±100%  perf-profile.calltrace.cycles-pp.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     29.96 ±141%      +9.5       39.49 ±100%  perf-profile.calltrace.cycles-pp.multi_cpu_stop.cpu_stopper_thread.smpboot_thread_fn.kthread.ret_from_fork
     31.62 ±141%     +11.4       43.02 ±100%  perf-profile.calltrace.cycles-pp.kthread.ret_from_fork.ret_from_fork_asm
     31.62 ±141%     +11.4       43.02 ±100%  perf-profile.calltrace.cycles-pp.ret_from_fork.ret_from_fork_asm
     31.62 ±141%     +11.4       43.02 ±100%  perf-profile.calltrace.cycles-pp.ret_from_fork_asm
      8.27 ±141%      -0.1        8.12 ±100%  perf-profile.children.cycles-pp.rcu_momentary_dyntick_idle
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.__cond_resched
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.__slab_free
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.__switch_to
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.__update_load_avg_se
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.__x64_sys_epoll_wait
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.arch_cpuhp_sync_state_poll
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.arch_do_signal_or_restart
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.cpu_stop_queue_work
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.cpu_uevent
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.d_alloc_parallel
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.do_epoll_wait
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.do_exit
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.do_vmi_align_munmap
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.do_vmi_munmap
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.ep_poll
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.filename_lookup
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.finish_task_switch
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.free_sched_groups
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.i2c_outb
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.ioread8
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.kernel_clone
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.kobject_uevent_env
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.ksys_mmap_pgoff
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.lookup_fast
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.migration_cpu_stop
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.mmap_region
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.print_cpu_modalias
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.queue_stop_cpus_work
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.sock_recvmsg
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.sysfs_emit_at
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.update_curr
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.vsnprintf
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.wake_affine
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.do_read_fault
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.irqentry_enter
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.rseq_ip_fixup
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.__i2c_transfer
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.__switch_to_asm
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.__wait_for_common
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.ast_vga_connector_helper_detect_ctx
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.bit_xfer
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.destroy_sched_domain
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.dev_uevent
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.drain_pages_zone
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.drm_connector_helper_detect_from_ddc
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.drm_do_probe_ddc_edid
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.drm_helper_probe_detect_ctx
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.drm_probe_ddc
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.free_pcppages_bulk
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.i2c_transfer
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.irqtime_account_irq
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.ktime_get_update_offsets_now
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.nohz_balance_exit_idle
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.output_poll_execute
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.tmigr_cpu_activate
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.try_address
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.x64_sys_call
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.percpu_counter_cpu_dead
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.destroy_sched_domains_rcu
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.handle_internal_command
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.main
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.nohz_balancer_kick
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.page_alloc_cpu_dead
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.restore_fpregs_from_fpstate
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.run_builtin
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.sched_clock
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.__smp_call_single_queue
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.llist_add_batch
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.native_sched_clock
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.sched_clock_cpu
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.stop_machine_cpuslocked
      0.00            +0.0        0.02 ±141%  perf-profile.children.cycles-pp.__rseq_handle_notify_resume
      0.00            +0.0        0.02 ±141%  perf-profile.children.cycles-pp.bprm_execve
      0.00            +0.0        0.02 ±141%  perf-profile.children.cycles-pp.exec_binprm
      0.00            +0.0        0.02 ±141%  perf-profile.children.cycles-pp.kmem_cache_free
      0.00            +0.0        0.02 ±141%  perf-profile.children.cycles-pp.load_elf_binary
      0.00            +0.0        0.02 ±141%  perf-profile.children.cycles-pp.search_binary_handler
      0.00            +0.0        0.02 ±223%  perf-profile.children.cycles-pp.finish_fault
      0.00            +0.0        0.02 ±142%  perf-profile.children.cycles-pp.do_mmap
      0.00            +0.0        0.02 ±142%  perf-profile.children.cycles-pp.lapic_next_deadline
      0.00            +0.0        0.02 ±142%  perf-profile.children.cycles-pp.openat64
      0.00            +0.0        0.02 ±142%  perf-profile.children.cycles-pp.path_lookupat
      0.00            +0.0        0.02 ±144%  perf-profile.children.cycles-pp.tick_nohz_next_event
      0.00            +0.0        0.02 ±144%  perf-profile.children.cycles-pp._raw_spin_lock_irq
      0.00            +0.0        0.02 ±144%  perf-profile.children.cycles-pp.kfree
      0.00            +0.0        0.02 ±141%  perf-profile.children.cycles-pp.prepare_task_switch
      0.00            +0.0        0.02 ±141%  perf-profile.children.cycles-pp.select_task_rq
      0.00            +0.0        0.02 ±141%  perf-profile.children.cycles-pp.select_task_rq_fair
      0.00            +0.0        0.02 ±141%  perf-profile.children.cycles-pp.timekeeping_advance
      0.00            +0.0        0.02 ±141%  perf-profile.children.cycles-pp.update_irq_load_avg
      0.00            +0.0        0.02 ±144%  perf-profile.children.cycles-pp.update_rq_clock
      0.00            +0.0        0.02 ±141%  perf-profile.children.cycles-pp.update_wall_time
      0.02 ±146%      +0.0        0.04 ±110%  perf-profile.children.cycles-pp.sched_tick
      0.00            +0.0        0.02 ±142%  perf-profile.children.cycles-pp.__update_load_avg_cfs_rq
      0.00            +0.0        0.02 ±146%  perf-profile.children.cycles-pp.build_sched_domains
      0.00            +0.0        0.02 ±142%  perf-profile.children.cycles-pp.cc_platform_has
      0.00            +0.0        0.02 ±142%  perf-profile.children.cycles-pp.switch_mm_irqs_off
      0.00            +0.0        0.02 ±143%  perf-profile.children.cycles-pp.epoll_wait
      0.00            +0.0        0.02 ±143%  perf-profile.children.cycles-pp.seq_read_iter
      0.00            +0.0        0.02 ±141%  perf-profile.children.cycles-pp.timerqueue_add
      0.01 ±223%      +0.0        0.03 ±155%  perf-profile.children.cycles-pp.native_irq_return_iret
      0.00            +0.0        0.02 ±145%  perf-profile.children.cycles-pp.cpuset_handle_hotplug
      0.00            +0.0        0.02 ±145%  perf-profile.children.cycles-pp.partition_sched_domains_locked
      0.00            +0.0        0.02 ±145%  perf-profile.children.cycles-pp.rebuild_sched_domains_locked
      0.00            +0.0        0.02 ±145%  perf-profile.children.cycles-pp.sched_cpu_deactivate
      0.00            +0.0        0.02 ±145%  perf-profile.children.cycles-pp.switch_fpu_return
      0.00            +0.0        0.02 ±145%  perf-profile.children.cycles-pp.tick_irq_enter
      0.00            +0.0        0.03 ±147%  perf-profile.children.cycles-pp.open64
      0.00            +0.0        0.03 ±223%  perf-profile.children.cycles-pp.do_fault
      0.00            +0.0        0.03 ±102%  perf-profile.children.cycles-pp.vm_mmap_pgoff
      0.02 ±142%      +0.0        0.05 ±107%  perf-profile.children.cycles-pp.clockevents_program_event
      0.06 ±154%      +0.0        0.09 ±107%  perf-profile.children.cycles-pp.irq_work_run
      0.00            +0.0        0.03 ±101%  perf-profile.children.cycles-pp.tick_nohz_get_sleep_length
      0.02 ±142%      +0.0        0.05 ±108%  perf-profile.children.cycles-pp.__update_blocked_fair
      0.02 ±143%      +0.0        0.06 ±106%  perf-profile.children.cycles-pp.update_load_avg
      0.00            +0.0        0.03 ±108%  perf-profile.children.cycles-pp._find_next_and_bit
      0.00            +0.0        0.03 ±102%  perf-profile.children.cycles-pp.hrtimer_start_range_ns
      0.01 ±223%      +0.0        0.04 ±111%  perf-profile.children.cycles-pp.irq_enter_rcu
      0.02 ±142%      +0.0        0.05 ±108%  perf-profile.children.cycles-pp.dequeue_task_fair
      0.01 ±223%      +0.0        0.04 ±107%  perf-profile.children.cycles-pp.tick_nohz_restart_sched_tick
      0.00            +0.0        0.04 ±104%  perf-profile.children.cycles-pp.__x64_sys_execve
      0.00            +0.0        0.04 ±104%  perf-profile.children.cycles-pp.do_execveat_common
      0.00            +0.0        0.04 ±104%  perf-profile.children.cycles-pp.execve
      0.00            +0.0        0.04 ±104%  perf-profile.children.cycles-pp.sched_setaffinity
      0.00            +0.0        0.04 ±147%  perf-profile.children.cycles-pp.cpuhp_thread_fun
      0.00            +0.0        0.04 ±118%  perf-profile.children.cycles-pp.ttwu_queue_wakelist
      0.00            +0.0        0.04 ±105%  perf-profile.children.cycles-pp.walk_component
      0.01 ±223%      +0.0        0.04 ±158%  perf-profile.children.cycles-pp.do_user_addr_fault
      0.01 ±223%      +0.0        0.05 ±100%  perf-profile.children.cycles-pp.vfs_read
      0.01 ±223%      +0.0        0.05 ±107%  perf-profile.children.cycles-pp.dequeue_entity
      0.01 ±223%      +0.0        0.05 ±111%  perf-profile.children.cycles-pp.update_rq_clock_task
      0.01 ±223%      +0.0        0.05 ±100%  perf-profile.children.cycles-pp.ksys_read
      0.04 ±142%      +0.0        0.08 ±105%  perf-profile.children.cycles-pp.fast_imageblit
      0.00            +0.0        0.04 ±115%  perf-profile.children.cycles-pp.deactivate_slab
      0.00            +0.0        0.04 ±101%  perf-profile.children.cycles-pp.idle_cpu
      0.02 ±149%      +0.0        0.06 ±102%  perf-profile.children.cycles-pp.enqueue_entity
      0.04 ±142%      +0.0        0.08 ±104%  perf-profile.children.cycles-pp.drm_fbdev_shmem_defio_imageblit
      0.02 ±142%      +0.0        0.06 ±106%  perf-profile.children.cycles-pp.menu_select
      0.04 ±142%      +0.0        0.08 ±104%  perf-profile.children.cycles-pp.sys_imageblit
      0.00            +0.0        0.04 ±105%  perf-profile.children.cycles-pp.link_path_walk
      0.01 ±223%      +0.0        0.05 ±107%  perf-profile.children.cycles-pp.tick_nohz_idle_exit
      0.01 ±223%      +0.0        0.05 ±127%  perf-profile.children.cycles-pp.exc_page_fault
      0.01 ±223%      +0.0        0.06 ±101%  perf-profile.children.cycles-pp.read
      0.00            +0.0        0.04 ±107%  perf-profile.children.cycles-pp.kick_ilb
      0.00            +0.0        0.04 ±112%  perf-profile.children.cycles-pp.rcu_do_batch
      0.00            +0.0        0.04 ±158%  perf-profile.children.cycles-pp.__handle_mm_fault
      0.00            +0.0        0.04 ±158%  perf-profile.children.cycles-pp.handle_mm_fault
      0.03 ±150%      +0.0        0.08 ±102%  perf-profile.children.cycles-pp.enqueue_task_fair
      0.02 ±141%      +0.0        0.06 ±118%  perf-profile.children.cycles-pp.asm_exc_page_fault
      0.00            +0.0        0.05 ±117%  perf-profile.children.cycles-pp.tmigr_cpu_deactivate
      0.00            +0.0        0.05 ±117%  perf-profile.children.cycles-pp.tmigr_inactive_up
      0.00            +0.1        0.05 ±116%  perf-profile.children.cycles-pp.slub_cpu_dead
      0.06 ±154%      +0.1        0.11 ±109%  perf-profile.children.cycles-pp.__sysvec_irq_work
      0.06 ±154%      +0.1        0.11 ±109%  perf-profile.children.cycles-pp.asm_sysvec_irq_work
      0.06 ±154%      +0.1        0.11 ±109%  perf-profile.children.cycles-pp.sysvec_irq_work
      0.02 ±141%      +0.1        0.08 ±108%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      0.02 ±141%      +0.1        0.07 ±105%  perf-profile.children.cycles-pp.__x64_sys_openat
      0.02 ±141%      +0.1        0.07 ±105%  perf-profile.children.cycles-pp.do_sys_openat2
      0.02 ±145%      +0.1        0.08 ±103%  perf-profile.children.cycles-pp.sched_ttwu_pending
      0.01 ±223%      +0.1        0.06 ±115%  perf-profile.children.cycles-pp.tmigr_update_events
      0.02 ±141%      +0.1        0.08 ±116%  perf-profile.children.cycles-pp.timer_expire_remote
      0.05 ±141%      +0.1        0.10 ±105%  perf-profile.children.cycles-pp.bit_putcs
      0.00            +0.1        0.06 ±111%  perf-profile.children.cycles-pp.rcu_core
      0.01 ±223%      +0.1        0.07 ±107%  perf-profile.children.cycles-pp.io_serial_out
      0.03 ±141%      +0.1        0.09 ±105%  perf-profile.children.cycles-pp.sched_balance_domains
      0.05 ±141%      +0.1        0.11 ±105%  perf-profile.children.cycles-pp.fbcon_putcs
      0.05 ±141%      +0.1        0.12 ±105%  perf-profile.children.cycles-pp.fbcon_redraw
      0.03 ±147%      +0.1        0.09 ±102%  perf-profile.children.cycles-pp.schedule_idle
      0.03 ±148%      +0.1        0.10 ±103%  perf-profile.children.cycles-pp.ttwu_do_activate
      0.04 ±144%      +0.1        0.10 ±110%  perf-profile.children.cycles-pp.call_timer_fn
      0.00            +0.1        0.07 ±104%  perf-profile.children.cycles-pp.path_openat
      0.02 ±145%      +0.1        0.09 ±103%  perf-profile.children.cycles-pp.tick_nohz_stop_tick
      0.03 ±144%      +0.1        0.10 ±101%  perf-profile.children.cycles-pp.tick_nohz_idle_stop_tick
      0.00            +0.1        0.07 ±104%  perf-profile.children.cycles-pp.do_filp_open
      0.05 ±141%      +0.1        0.12 ±104%  perf-profile.children.cycles-pp.con_scroll
      0.05 ±141%      +0.1        0.12 ±104%  perf-profile.children.cycles-pp.fbcon_scroll
      0.05 ±141%      +0.1        0.12 ±104%  perf-profile.children.cycles-pp.lf
      0.01 ±223%      +0.1        0.08 ±104%  perf-profile.children.cycles-pp.do_select
      0.01 ±223%      +0.1        0.08 ±108%  perf-profile.children.cycles-pp.schedule_hrtimeout_range_clock
      0.05 ±141%      +0.1        0.13 ±103%  perf-profile.children.cycles-pp.vt_console_print
      0.01 ±223%      +0.1        0.08 ±104%  perf-profile.children.cycles-pp.core_sys_select
      0.03 ±223%      +0.1        0.10 ±100%  perf-profile.children.cycles-pp.wake_up_klogd_work_func
      0.04 ±142%      +0.1        0.11 ±103%  perf-profile.children.cycles-pp.__sysvec_call_function_single
      0.05 ±141%      +0.1        0.13 ±106%  perf-profile.children.cycles-pp.sched_balance_update_blocked_averages
      0.01 ±223%      +0.1        0.09 ±104%  perf-profile.children.cycles-pp.do_pselect
      0.01 ±223%      +0.1        0.09 ±104%  perf-profile.children.cycles-pp.__x64_sys_pselect6
      0.04 ±143%      +0.1        0.13 ±111%  perf-profile.children.cycles-pp.__run_timers
      0.02 ±141%      +0.1        0.11 ±105%  perf-profile.children.cycles-pp.__select
      0.05 ±142%      +0.1        0.14 ±109%  perf-profile.children.cycles-pp.try_to_wake_up
      0.02 ±142%      +0.1        0.11 ±103%  perf-profile.children.cycles-pp.cmci_skip_bank
      0.04 ±141%      +0.1        0.13 ±110%  perf-profile.children.cycles-pp.tmigr_handle_remote_cpu
      0.09 ±142%      +0.1        0.18 ±104%  perf-profile.children.cycles-pp.default_idle
      0.09 ±142%      +0.1        0.18 ±104%  perf-profile.children.cycles-pp.default_idle_call
      0.09 ±166%      +0.1        0.19 ±102%  perf-profile.children.cycles-pp.irq_work_run_list
      0.09 ±166%      +0.1        0.19 ±102%  perf-profile.children.cycles-pp.irq_work_single
      0.04 ±141%      +0.1        0.14 ±109%  perf-profile.children.cycles-pp.tmigr_handle_remote_up
      0.07 ±141%      +0.1        0.18 ±108%  perf-profile.children.cycles-pp._nohz_idle_balance
      0.04 ±141%      +0.1        0.15 ±107%  perf-profile.children.cycles-pp.tmigr_handle_remote
      0.04 ±143%      +0.1        0.17 ±106%  perf-profile.children.cycles-pp.read_tsc
      0.07 ±142%      +0.1        0.21 ±105%  perf-profile.children.cycles-pp.update_sg_lb_stats
      0.08 ±146%      +0.2        0.24 ±100%  perf-profile.children.cycles-pp.update_process_times
      0.07 ±142%      +0.2        0.24 ±104%  perf-profile.children.cycles-pp.update_sd_lb_stats
      0.08 ±142%      +0.2        0.24 ±104%  perf-profile.children.cycles-pp.sched_balance_find_src_group
      0.09 ±146%      +0.2        0.28 ±101%  perf-profile.children.cycles-pp.tick_nohz_handler
      0.02 ±141%      +0.2        0.20 ±118%  perf-profile.children.cycles-pp.balance_fair
      0.04 ±141%      +0.2        0.24 ±105%  perf-profile.children.cycles-pp.cpuhp_wait_for_sync_state
      0.05 ±141%      +0.2        0.25 ±105%  perf-profile.children.cycles-pp.cpuhp_bringup_ap
      0.10 ±144%      +0.2        0.30 ±101%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.11 ±141%      +0.2        0.32 ±105%  perf-profile.children.cycles-pp.sysvec_call_function_single
      0.06 ±141%      +0.2        0.27 ±105%  perf-profile.children.cycles-pp.ktime_get
      0.05 ±141%      +0.2        0.28 ±131%  perf-profile.children.cycles-pp.wait_for_xmitr
      0.11 ±142%      +0.3        0.37 ±112%  perf-profile.children.cycles-pp.rest_init
      0.11 ±142%      +0.3        0.37 ±112%  perf-profile.children.cycles-pp.start_kernel
      0.11 ±142%      +0.3        0.37 ±112%  perf-profile.children.cycles-pp.x86_64_start_kernel
      0.11 ±142%      +0.3        0.37 ±112%  perf-profile.children.cycles-pp.x86_64_start_reservations
      0.11 ±143%      +0.3        0.43 ±105%  perf-profile.children.cycles-pp.msleep
      0.04 ±143%      +0.3        0.36 ±108%  perf-profile.children.cycles-pp.raw_spin_rq_lock_nested
      0.10 ±144%      +0.3        0.43 ±107%  perf-profile.children.cycles-pp.pick_next_task_fair
      0.16 ±141%      +0.3        0.49 ±107%  perf-profile.children.cycles-pp.__irq_exit_rcu
      0.11 ±143%      +0.3        0.45 ±105%  perf-profile.children.cycles-pp.schedule_timeout
      0.21 ±141%      +0.4        0.57 ±104%  perf-profile.children.cycles-pp.asm_sysvec_call_function_single
      0.12 ±141%      +0.4        0.49 ±109%  perf-profile.children.cycles-pp.mce_cpu_dead
      0.12 ±141%      +0.4        0.49 ±109%  perf-profile.children.cycles-pp.on_each_cpu_cond_mask
      0.12 ±141%      +0.4        0.49 ±109%  perf-profile.children.cycles-pp.smp_call_function_many_cond
      0.07 ±143%      +0.4        0.49 ±108%  perf-profile.children.cycles-pp._raw_spin_lock
      0.11 ±143%      +0.5        0.62 ±106%  perf-profile.children.cycles-pp.sched_balance_newidle
      0.11 ±142%      +0.5        0.63 ±105%  perf-profile.children.cycles-pp.sched_balance_rq
      0.15 ±143%      +0.6        0.77 ±106%  perf-profile.children.cycles-pp.schedule
      0.18 ±143%      +0.7        0.86 ±106%  perf-profile.children.cycles-pp.__schedule
      0.20 ±141%      +0.7        0.90 ±103%  perf-profile.children.cycles-pp.delay_tsc
      0.19 ±141%      +0.8        1.04 ±108%  perf-profile.children.cycles-pp.do_boot_cpu
      0.19 ±141%      +0.9        1.05 ±108%  perf-profile.children.cycles-pp.native_kick_ap
      0.21 ±141%      +1.0        1.23 ±101%  perf-profile.children.cycles-pp.touch_softlockup_watchdog
      0.24 ±141%      +1.1        1.30 ±106%  perf-profile.children.cycles-pp._cpu_up
      0.24 ±141%      +1.1        1.30 ±106%  perf-profile.children.cycles-pp.device_online
      0.24 ±141%      +1.1        1.30 ±106%  perf-profile.children.cycles-pp.cpu_subsys_online
      0.24 ±141%      +1.1        1.30 ±106%  perf-profile.children.cycles-pp.cpu_up
      0.43 ±142%      +1.3        1.70 ±103%  perf-profile.children.cycles-pp.takedown_cpu
      0.28 ±141%      +1.3        1.60 ±100%  perf-profile.children.cycles-pp.arch_touch_nmi_watchdog
      0.44 ±145%      +1.3        1.78 ±105%  perf-profile.children.cycles-pp.io_serial_in
      0.36 ±141%      +1.4        1.74 ±105%  perf-profile.children.cycles-pp.online_store
      4.11 ±143%      +1.4        5.50 ±108%  perf-profile.children.cycles-pp.memcpy_toio
      4.11 ±143%      +1.4        5.50 ±108%  perf-profile.children.cycles-pp.ast_primary_plane_helper_atomic_update
      4.11 ±143%      +1.4        5.50 ±108%  perf-profile.children.cycles-pp.drm_fb_memcpy
      4.11 ±143%      +1.4        5.51 ±108%  perf-profile.children.cycles-pp.ast_mode_config_helper_atomic_commit_tail
      4.11 ±143%      +1.4        5.51 ±108%  perf-profile.children.cycles-pp.commit_tail
      4.11 ±143%      +1.4        5.51 ±108%  perf-profile.children.cycles-pp.drm_atomic_helper_commit_planes
      4.11 ±143%      +1.4        5.51 ±108%  perf-profile.children.cycles-pp.drm_atomic_helper_commit_tail
      4.11 ±143%      +1.4        5.52 ±108%  perf-profile.children.cycles-pp.drm_atomic_helper_commit
      4.11 ±143%      +1.4        5.52 ±108%  perf-profile.children.cycles-pp.drm_atomic_commit
      4.11 ±143%      +1.4        5.52 ±108%  perf-profile.children.cycles-pp.drm_atomic_helper_dirtyfb
      4.11 ±143%      +1.4        5.52 ±108%  perf-profile.children.cycles-pp.drm_fbdev_shmem_helper_fb_dirty
      4.11 ±143%      +1.4        5.52 ±108%  perf-profile.children.cycles-pp.drm_fb_helper_damage_work
      0.37 ±141%      +1.4        1.80 ±105%  perf-profile.children.cycles-pp.kernfs_fop_write_iter
      0.38 ±141%      +1.5        1.84 ±105%  perf-profile.children.cycles-pp.vfs_write
      0.39 ±141%      +1.5        1.85 ±105%  perf-profile.children.cycles-pp.ksys_write
      0.42 ±141%      +1.5        1.96 ±104%  perf-profile.children.cycles-pp.write
      0.58 ±141%      +1.7        2.31 ±103%  perf-profile.children.cycles-pp.__cpu_down_maps_locked
      0.58 ±141%      +1.7        2.31 ±103%  perf-profile.children.cycles-pp._cpu_down
      0.58 ±141%      +1.7        2.31 ±103%  perf-profile.children.cycles-pp.work_for_cpu_fn
      0.54 ±141%      +1.8        2.39 ±104%  perf-profile.children.cycles-pp.do_syscall_64
      0.54 ±141%      +1.9        2.39 ±104%  perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.50 ±141%      +1.9        2.36 ±102%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      0.50 ±141%      +1.9        2.41 ±101%  perf-profile.children.cycles-pp.__sysvec_call_function
      0.51 ±141%      +1.9        2.41 ±101%  perf-profile.children.cycles-pp.cmci_discover
      0.51 ±141%      +1.9        2.41 ±101%  perf-profile.children.cycles-pp.sysvec_call_function
      0.51 ±141%      +1.9        2.43 ±101%  perf-profile.children.cycles-pp.asm_sysvec_call_function
      0.54 ±141%      +2.0        2.52 ±101%  perf-profile.children.cycles-pp.__flush_smp_call_function_queue
      0.62 ±143%      +2.0        2.67 ±104%  perf-profile.children.cycles-pp.wait_for_lsr
      0.64 ±143%      +2.1        2.74 ±104%  perf-profile.children.cycles-pp.serial8250_console_write
      0.67 ±142%      +2.1        2.78 ±105%  perf-profile.children.cycles-pp._printk
      0.67 ±142%      +2.1        2.78 ±105%  perf-profile.children.cycles-pp.vprintk_emit
      0.51 ±141%      +2.2        2.66 ±102%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      0.70 ±143%      +2.2        2.88 ±104%  perf-profile.children.cycles-pp.console_flush_all
      0.70 ±143%      +2.2        2.88 ±104%  perf-profile.children.cycles-pp.console_unlock
      0.48 ±141%      +2.5        3.01 ±101%  perf-profile.children.cycles-pp.wq_watchdog_touch
      0.82 ±141%      +2.8        3.60 ±103%  perf-profile.children.cycles-pp.__cpuhp_invoke_callback_range
      0.83 ±141%      +2.8        3.64 ±104%  perf-profile.children.cycles-pp.cpuhp_invoke_callback
      0.91 ±141%      +2.9        3.77 ±103%  perf-profile.children.cycles-pp.acpi_safe_halt
      0.91 ±141%      +2.9        3.78 ±103%  perf-profile.children.cycles-pp.acpi_idle_enter
      0.92 ±141%      +2.9        3.80 ±103%  perf-profile.children.cycles-pp.cpuidle_enter_state
      0.92 ±141%      +2.9        3.80 ±103%  perf-profile.children.cycles-pp.cpuidle_enter
      1.01 ±141%      +3.0        4.00 ±102%  perf-profile.children.cycles-pp.start_secondary
      1.06 ±141%      +3.1        4.18 ±103%  perf-profile.children.cycles-pp.cpuidle_idle_call
      4.71 ±143%      +3.2        7.86 ±106%  perf-profile.children.cycles-pp.process_one_work
      4.71 ±143%      +3.2        7.88 ±106%  perf-profile.children.cycles-pp.worker_thread
      1.12 ±141%      +3.2        4.36 ±103%  perf-profile.children.cycles-pp.do_idle
      1.12 ±141%      +3.2        4.37 ±103%  perf-profile.children.cycles-pp.common_startup_64
      1.12 ±141%      +3.2        4.37 ±103%  perf-profile.children.cycles-pp.cpu_startup_entry
     16.18 ±141%      +3.4       19.57 ±101%  perf-profile.children.cycles-pp.stop_machine_yield
     26.84 ±141%      +8.0       34.80 ±100%  perf-profile.children.cycles-pp.multi_cpu_stop
     26.85 ±141%      +8.0       34.82 ±100%  perf-profile.children.cycles-pp.cpu_stopper_thread
     26.88 ±141%      +8.2       35.11 ±100%  perf-profile.children.cycles-pp.smpboot_thread_fn
     31.62 ±141%     +11.4       43.02 ±100%  perf-profile.children.cycles-pp.kthread
     31.62 ±141%     +11.4       43.03 ±100%  perf-profile.children.cycles-pp.ret_from_fork
     31.62 ±141%     +11.4       43.03 ±100%  perf-profile.children.cycles-pp.ret_from_fork_asm
      7.84 ±141%      -0.1        7.73 ±100%  perf-profile.self.cycles-pp.rcu_momentary_dyntick_idle
      0.03 ±141%      -0.0        0.01 ±223%  perf-profile.self.cycles-pp.asm_sysvec_call_function_single
      0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.__flush_smp_call_function_queue
      0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.__slab_free
      0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.__switch_to
      0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.ioread8
      0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.update_rq_clock
      0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.__run_timers
      0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.bit_putcs
      0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.__switch_to_asm
      0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.cpuhp_wait_for_sync_state
      0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.ktime_get_update_offsets_now
      0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.nohz_balance_exit_idle
      0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.sched_balance_newidle
      0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.update_sd_lb_stats
      0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.menu_select
      0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.native_sched_clock
      0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.restore_fpregs_from_fpstate
      0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.llist_add_batch
      0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.sched_balance_domains
      0.00            +0.0        0.02 ±142%  perf-profile.self.cycles-pp.kick_ilb
      0.00            +0.0        0.02 ±142%  perf-profile.self.cycles-pp.lapic_next_deadline
      0.00            +0.0        0.02 ±141%  perf-profile.self.cycles-pp.switch_mm_irqs_off
      0.00            +0.0        0.02 ±141%  perf-profile.self.cycles-pp.timerqueue_add
      0.00            +0.0        0.02 ±141%  perf-profile.self.cycles-pp.update_irq_load_avg
      0.00            +0.0        0.02 ±146%  perf-profile.self.cycles-pp.__update_blocked_fair
      0.00            +0.0        0.02 ±142%  perf-profile.self.cycles-pp.__update_load_avg_cfs_rq
      0.00            +0.0        0.02 ±142%  perf-profile.self.cycles-pp.cc_platform_has
      0.00            +0.0        0.02 ±149%  perf-profile.self.cycles-pp._find_next_and_bit
      0.01 ±223%      +0.0        0.03 ±155%  perf-profile.self.cycles-pp.native_irq_return_iret
      0.00            +0.0        0.02 ±145%  perf-profile.self.cycles-pp.update_rq_clock_task
      0.00            +0.0        0.03 ±100%  perf-profile.self.cycles-pp.update_load_avg
      0.00            +0.0        0.04 ±107%  perf-profile.self.cycles-pp.__schedule
      0.00            +0.0        0.04 ±118%  perf-profile.self.cycles-pp.deactivate_slab
      0.04 ±142%      +0.0        0.08 ±105%  perf-profile.self.cycles-pp.fast_imageblit
      0.00            +0.0        0.04 ±101%  perf-profile.self.cycles-pp.idle_cpu
      0.03 ±148%      +0.0        0.08 ±104%  perf-profile.self.cycles-pp.default_idle
      0.02 ±141%      +0.1        0.08 ±107%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.01 ±223%      +0.1        0.07 ±107%  perf-profile.self.cycles-pp.io_serial_out
      0.04 ±141%      +0.1        0.11 ±104%  perf-profile.self.cycles-pp._raw_spin_lock
      0.02 ±141%      +0.1        0.10 ±106%  perf-profile.self.cycles-pp.ktime_get
      0.02 ±142%      +0.1        0.11 ±103%  perf-profile.self.cycles-pp.cmci_skip_bank
      0.05 ±143%      +0.1        0.17 ±106%  perf-profile.self.cycles-pp.update_sg_lb_stats
      0.04 ±142%      +0.1        0.17 ±105%  perf-profile.self.cycles-pp.read_tsc
      0.12 ±141%      +0.4        0.48 ±109%  perf-profile.self.cycles-pp.smp_call_function_many_cond
      0.14 ±142%      +0.4        0.53 ±105%  perf-profile.self.cycles-pp.acpi_safe_halt
      0.13 ±141%      +0.6        0.76 ±101%  perf-profile.self.cycles-pp.touch_softlockup_watchdog
      0.20 ±141%      +0.7        0.90 ±103%  perf-profile.self.cycles-pp.delay_tsc
      0.18 ±141%      +0.8        1.03 ±100%  perf-profile.self.cycles-pp.arch_touch_nmi_watchdog
      2.34 ±141%      +0.9        3.24 ±100%  perf-profile.self.cycles-pp.multi_cpu_stop
      0.43 ±145%      +1.3        1.78 ±105%  perf-profile.self.cycles-pp.io_serial_in
      4.07 ±143%      +1.4        5.42 ±108%  perf-profile.self.cycles-pp.memcpy_toio
      0.51 ±141%      +2.2        2.66 ±102%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      0.42 ±141%      +2.2        2.67 ±101%  perf-profile.self.cycles-pp.wq_watchdog_touch
     15.81 ±141%      +3.4       19.19 ±101%  perf-profile.self.cycles-pp.stop_machine_yield
      1665 ±  2%      +1.8%       1695 ±  2%  slabinfo.Acpi-State.active_objs
     33.33 ±  2%      +1.7%      33.90 ±  2%  slabinfo.Acpi-State.active_slabs
      1699 ±  2%      +1.7%       1728 ±  2%  slabinfo.Acpi-State.num_objs
     33.33 ±  2%      +1.7%      33.90 ±  2%  slabinfo.Acpi-State.num_slabs
      5.71 ± 51%      -2.7%       5.55 ± 62%  slabinfo.DCCP.active_objs
      1.00            +0.0%       1.00        slabinfo.DCCP.active_slabs
     18.00            +0.0%      18.00        slabinfo.DCCP.num_objs
      1.00            +0.0%       1.00        slabinfo.DCCP.num_slabs
      5.41 ± 51%      -5.6%       5.10 ± 67%  slabinfo.DCCPv6.active_objs
      1.00            -8.3%       0.92 ± 20%  slabinfo.DCCPv6.active_slabs
     17.00            -8.3%      15.58 ± 20%  slabinfo.DCCPv6.num_objs
      1.00            -8.3%       0.92 ± 20%  slabinfo.DCCPv6.num_slabs
    290.57 ± 20%     -11.5%     257.04 ± 24%  slabinfo.PING.active_objs
     15.38 ± 13%      -6.0%      14.46 ± 11%  slabinfo.PING.active_slabs
    492.18 ± 13%      -6.0%     462.58 ± 11%  slabinfo.PING.num_objs
     15.38 ± 13%      -6.0%      14.46 ± 11%  slabinfo.PING.num_slabs
     99.89 ±  6%      -3.7%      96.20        slabinfo.RAW.active_objs
      3.17 ±  7%      +0.0%       3.17 ±  7%  slabinfo.RAW.active_slabs
    101.33 ±  7%      +0.0%     101.33 ±  7%  slabinfo.RAW.num_objs
      3.17 ±  7%      +0.0%       3.17 ±  7%  slabinfo.RAW.num_slabs
     78.05 ±  4%      -5.0%      74.12 ±  7%  slabinfo.RAWv6.active_objs
      3.92 ±  4%      -2.1%       3.83 ±  6%  slabinfo.RAWv6.active_slabs
    101.83 ±  4%      -2.1%      99.67 ±  6%  slabinfo.RAWv6.num_objs
      3.92 ±  4%      -2.1%       3.83 ±  6%  slabinfo.RAWv6.num_slabs
      8.56 ± 54%     -18.2%       7.00 ± 43%  slabinfo.TCP.active_objs
      1.42 ± 13%      -0.1%       1.42 ± 12%  slabinfo.TCP.active_slabs
     18.46 ± 13%      -0.1%      18.45 ± 12%  slabinfo.TCP.num_objs
      1.42 ± 13%      -0.1%       1.42 ± 12%  slabinfo.TCP.num_slabs
      4.94 ± 74%      -4.4%       4.72 ± 43%  slabinfo.TCPv6.active_objs
      0.92 ± 20%      +9.1%       1.00        slabinfo.TCPv6.active_slabs
     11.00 ± 20%      +9.1%      12.00        slabinfo.TCPv6.num_objs
      0.92 ± 20%      +9.1%       1.00        slabinfo.TCPv6.num_slabs
     22.84 ± 62%     -30.0%      15.98 ± 86%  slabinfo.UDPv6.active_objs
      2.00            -8.3%       1.83 ± 12%  slabinfo.UDPv6.active_slabs
     48.00            -8.3%      44.00 ± 12%  slabinfo.UDPv6.num_objs
      2.00            -8.3%       1.83 ± 12%  slabinfo.UDPv6.num_slabs
      8999 ±  2%      -2.2%       8798 ±  3%  slabinfo.anon_vma.active_objs
    233.38 ±  2%      -2.0%     228.70 ±  3%  slabinfo.anon_vma.active_slabs
      9101 ±  2%      -2.0%       8919 ±  3%  slabinfo.anon_vma.num_objs
    233.38 ±  2%      -2.0%     228.70 ±  3%  slabinfo.anon_vma.num_slabs
     18575 ±  2%      -0.6%      18466        slabinfo.anon_vma_chain.active_objs
    294.78 ±  2%      -0.2%     294.30        slabinfo.anon_vma_chain.active_slabs
     18866 ±  2%      -0.2%      18834        slabinfo.anon_vma_chain.num_objs
    294.78 ±  2%      -0.2%     294.30        slabinfo.anon_vma_chain.num_slabs
     30.82 ± 16%      +1.5%      31.29 ± 23%  slabinfo.bdev_cache.active_objs
      2.92 ± 18%      +8.6%       3.17 ±  7%  slabinfo.bdev_cache.active_slabs
     58.33 ± 18%      +8.6%      63.33 ±  7%  slabinfo.bdev_cache.num_objs
      2.92 ± 18%      +8.6%       3.17 ±  7%  slabinfo.bdev_cache.num_slabs
     41.44 ± 16%      -8.5%      37.94 ± 29%  slabinfo.bio-120.active_objs
      3.67 ± 10%      +6.8%       3.92 ±  4%  slabinfo.bio-120.active_slabs
    117.33 ± 10%      +6.8%     125.33 ±  4%  slabinfo.bio-120.num_objs
      3.67 ± 10%      +6.8%       3.92 ±  4%  slabinfo.bio-120.num_slabs
    146.86 ± 12%     -29.8%     103.07 ± 27%  slabinfo.bio-184.active_objs
      7.41 ±  6%      -6.9%       6.90 ± 10%  slabinfo.bio-184.active_slabs
    311.25 ±  6%      -6.9%     289.84 ± 10%  slabinfo.bio-184.num_objs
      7.41 ±  6%      -6.9%       6.90 ± 10%  slabinfo.bio-184.num_slabs
     16.00            +0.0%      16.00        slabinfo.bio-240.active_objs
      0.50            +0.0%       0.50        slabinfo.bio-240.active_slabs
     16.00            +0.0%      16.00        slabinfo.bio-240.num_objs
      0.50            +0.0%       0.50        slabinfo.bio-240.num_slabs
      6.52 ± 73%     -41.6%       3.81 ± 63%  slabinfo.bio-248.active_objs
      0.50            +0.0%       0.50        slabinfo.bio-248.active_slabs
     16.00            +0.0%      16.00        slabinfo.bio-248.num_objs
      0.50            +0.0%       0.50        slabinfo.bio-248.num_slabs
      2.39 ± 33%    +305.0%       9.69 ± 93%  slabinfo.bio-296.active_objs
      0.50            +0.0%       0.50        slabinfo.bio-296.active_slabs
     25.50            +0.0%      25.50        slabinfo.bio-296.num_objs
      0.50            +0.0%       0.50        slabinfo.bio-296.num_slabs
     13.04 ± 35%     +60.2%      20.89 ± 70%  slabinfo.bio-360.active_objs
      1.50            +0.0%       1.50        slabinfo.bio-360.active_slabs
     63.00            +0.0%      63.00        slabinfo.bio-360.num_objs
      1.50            +0.0%       1.50        slabinfo.bio-360.num_slabs
      2.14 ± 30%    +278.8%       8.10 ± 91%  slabinfo.bio-376.active_objs
      0.50            +0.0%       0.50        slabinfo.bio-376.active_slabs
     21.00            +0.0%      21.00        slabinfo.bio-376.num_objs
      0.50            +0.0%       0.50        slabinfo.bio-376.num_slabs
      1.97 ± 27%    +257.6%       7.03 ± 89%  slabinfo.bio-432.active_objs
      0.50            +0.0%       0.50        slabinfo.bio-432.active_slabs
     18.00            +0.0%      18.00        slabinfo.bio-432.num_objs
      0.50            +0.0%       0.50        slabinfo.bio-432.num_slabs
     74.09 ± 11%      -9.8%      66.82 ±  5%  slabinfo.bio_post_read_ctx.active_objs
      1.00            +0.0%       1.00        slabinfo.bio_post_read_ctx.active_slabs
     85.00            +0.0%      85.00        slabinfo.bio_post_read_ctx.num_objs
      1.00            +0.0%       1.00        slabinfo.bio_post_read_ctx.num_slabs
     20.01 ± 26%     -23.6%      15.28 ± 28%  slabinfo.biovec-128.active_objs
      2.49            -0.0%       2.49 ± 23%  slabinfo.biovec-128.active_slabs
     39.81            -0.0%      39.80 ± 23%  slabinfo.biovec-128.num_objs
      2.49            -0.0%       2.49 ± 23%  slabinfo.biovec-128.num_slabs
     25.97 ±  3%      -1.6%      25.56        slabinfo.biovec-max.active_objs
      3.50            +0.0%       3.50        slabinfo.biovec-max.active_slabs
     28.00            +0.0%      28.00        slabinfo.biovec-max.num_objs
      3.50            +0.0%       3.50        slabinfo.biovec-max.num_slabs
     13.95 ± 16%     +18.0%      16.47 ± 38%  slabinfo.btrfs_extent_buffer.active_objs
      1.00            +0.0%       1.00        slabinfo.btrfs_extent_buffer.active_slabs
     34.00            +0.0%      34.00        slabinfo.btrfs_extent_buffer.num_objs
      1.00            +0.0%       1.00        slabinfo.btrfs_extent_buffer.num_slabs
      1.95 ±184%     +33.7%       2.61 ±155%  slabinfo.btrfs_free_space.active_objs
      0.17 ±141%     +50.0%       0.25 ±100%  slabinfo.btrfs_free_space.active_slabs
      6.50 ±141%     +50.0%       9.75 ±100%  slabinfo.btrfs_free_space.num_objs
      0.17 ±141%     +50.0%       0.25 ±100%  slabinfo.btrfs_free_space.num_slabs
     20.13 ± 53%      -8.4%      18.44 ± 46%  slabinfo.btrfs_inode.active_objs
      2.00           -16.7%       1.67 ± 14%  slabinfo.btrfs_inode.active_slabs
     64.00           -16.7%      53.33 ± 14%  slabinfo.btrfs_inode.num_objs
      2.00           -16.7%       1.67 ± 14%  slabinfo.btrfs_inode.num_slabs
     33.08 ± 57%      +7.6%      35.61 ± 40%  slabinfo.btrfs_path.active_objs
      2.83 ±  6%      +5.7%       2.99        slabinfo.btrfs_path.active_slabs
    101.80 ±  6%      +5.7%     107.64        slabinfo.btrfs_path.num_objs
      2.83 ±  6%      +5.7%       2.99        slabinfo.btrfs_path.num_slabs
     40.38 ± 24%     -13.4%      34.97 ± 29%  slabinfo.buffer_head.active_objs
      3.17 ± 11%      +2.6%       3.25 ±  7%  slabinfo.buffer_head.active_slabs
    123.50 ± 11%      +2.6%     126.75 ±  7%  slabinfo.buffer_head.num_objs
      3.17 ± 11%      +2.6%       3.25 ±  7%  slabinfo.buffer_head.num_slabs
     13.58 ± 57%      +2.5%      13.92 ± 47%  slabinfo.configfs_dir_cache.active_objs
      1.17 ± 20%      +0.0%       1.17 ± 20%  slabinfo.configfs_dir_cache.active_slabs
     53.67 ± 20%      +0.0%      53.67 ± 20%  slabinfo.configfs_dir_cache.num_objs
      1.17 ± 20%      +0.0%       1.17 ± 20%  slabinfo.configfs_dir_cache.num_slabs
      2096 ±  7%      -2.8%       2037 ±  4%  slabinfo.cred.active_objs
     52.15 ±  6%      -1.7%      51.27 ±  3%  slabinfo.cred.active_slabs
      2190 ±  6%      -1.7%       2153 ±  3%  slabinfo.cred.num_objs
     52.15 ±  6%      -1.7%      51.27 ±  3%  slabinfo.cred.num_slabs
      6.31 ±107%     +31.1%       8.28 ± 84%  slabinfo.dax_cache.active_objs
      0.50            +0.0%       0.50        slabinfo.dax_cache.active_slabs
     21.00            +0.0%      21.00        slabinfo.dax_cache.num_objs
      0.50            +0.0%       0.50        slabinfo.dax_cache.num_slabs
     45171            -0.4%      44986        slabinfo.dentry.active_objs
      1104            -0.0%       1104        slabinfo.dentry.active_slabs
     46393            -0.0%      46371        slabinfo.dentry.num_objs
      1104            -0.0%       1104        slabinfo.dentry.num_slabs
      3.05 ± 67%     +19.2%       3.63 ± 72%  slabinfo.dmaengine-unmap-128.active_objs
      0.50            +0.0%       0.50        slabinfo.dmaengine-unmap-128.active_slabs
     15.00            +0.0%      15.00        slabinfo.dmaengine-unmap-128.num_objs
      0.50            +0.0%       0.50        slabinfo.dmaengine-unmap-128.num_slabs
      1.73 ± 57%     +16.3%       2.01 ± 63%  slabinfo.dmaengine-unmap-256.active_objs
      0.50            +0.0%       0.50        slabinfo.dmaengine-unmap-256.active_slabs
      7.50            +0.0%       7.50        slabinfo.dmaengine-unmap-256.num_objs
      0.50            +0.0%       0.50        slabinfo.dmaengine-unmap-256.num_slabs
      2115 ± 19%     -11.0%       1881 ± 22%  slabinfo.ep_head.active_objs
     18.60 ± 12%      +5.6%      19.65 ±  8%  slabinfo.ep_head.active_slabs
      4762 ± 12%      +5.6%       5030 ±  8%  slabinfo.ep_head.num_objs
     18.60 ± 12%      +5.6%      19.65 ±  8%  slabinfo.ep_head.num_slabs
    433.98 ± 17%      -4.8%     413.35 ± 15%  slabinfo.file_lock_cache.active_objs
     13.73 ± 11%      -6.2%      12.87 ± 11%  slabinfo.file_lock_cache.active_slabs
    576.69 ± 11%      -6.2%     540.70 ± 11%  slabinfo.file_lock_cache.num_objs
     13.73 ± 11%      -6.2%      12.87 ± 11%  slabinfo.file_lock_cache.num_slabs
      1225 ±  6%     -11.0%       1090 ±  5%  slabinfo.files_cache.active_objs
     30.81 ±  4%      -4.4%      29.46 ±  2%  slabinfo.files_cache.active_slabs
      1417 ±  4%      -4.4%       1355 ±  2%  slabinfo.files_cache.num_objs
     30.81 ±  4%      -4.4%      29.46 ±  2%  slabinfo.files_cache.num_slabs
      2803 ±  3%      -2.8%       2724        slabinfo.filp.active_objs
     90.42 ±  3%      -2.1%      88.54 ±  2%  slabinfo.filp.active_slabs
      2893 ±  3%      -2.1%       2833 ±  2%  slabinfo.filp.num_objs
     90.42 ±  3%      -2.1%      88.54 ±  2%  slabinfo.filp.num_slabs
      5182            +1.1%       5237        slabinfo.ftrace_event_field.active_objs
     71.67            +1.0%      72.40        slabinfo.ftrace_event_field.active_slabs
      5231            +1.0%       5285        slabinfo.ftrace_event_field.num_objs
     71.67            +1.0%      72.40        slabinfo.ftrace_event_field.num_slabs
     13.82 ± 72%     +72.7%      23.86 ± 58%  slabinfo.hugetlbfs_inode_cache.active_objs
      1.00            +0.0%       1.00        slabinfo.hugetlbfs_inode_cache.active_slabs
     51.00            +0.0%      51.00        slabinfo.hugetlbfs_inode_cache.num_objs
      1.00            +0.0%       1.00        slabinfo.hugetlbfs_inode_cache.num_slabs
     35874            -0.4%      35748        slabinfo.inode_cache.active_objs
    703.17            -0.2%     701.78        slabinfo.inode_cache.active_slabs
     36564            -0.2%      36492        slabinfo.inode_cache.num_objs
    703.17            -0.2%     701.78        slabinfo.inode_cache.num_slabs
     89.10 ± 23%     -39.3%      54.09 ± 20%  slabinfo.iommu_iova_magazine.active_objs
      5.99 ± 11%     -11.1%       5.33 ± 13%  slabinfo.iommu_iova_magazine.active_slabs
    191.82 ± 11%     -11.1%     170.46 ± 13%  slabinfo.iommu_iova_magazine.num_objs
      5.99 ± 11%     -11.1%       5.33 ± 13%  slabinfo.iommu_iova_magazine.num_slabs
     37.10 ± 67%     -35.4%      23.96 ± 60%  slabinfo.ip_fib_alias.active_objs
      1.42 ± 13%     -17.6%       1.17 ± 20%  slabinfo.ip_fib_alias.active_slabs
    103.42 ± 13%     -17.6%      85.17 ± 20%  slabinfo.ip_fib_alias.num_objs
      1.42 ± 13%     -17.6%       1.17 ± 20%  slabinfo.ip_fib_alias.num_slabs
     42.86 ± 68%     -36.0%      27.41 ± 61%  slabinfo.ip_fib_trie.active_objs
      1.42 ± 13%     -17.6%       1.17 ± 20%  slabinfo.ip_fib_trie.active_slabs
    120.42 ± 13%     -17.6%      99.17 ± 20%  slabinfo.ip_fib_trie.num_objs
      1.42 ± 13%     -17.6%       1.17 ± 20%  slabinfo.ip_fib_trie.num_slabs
     39354            +0.1%      39387        slabinfo.kernfs_node_cache.active_objs
    659.54            +0.1%     659.91        slabinfo.kernfs_node_cache.active_slabs
     39572            +0.1%      39594        slabinfo.kernfs_node_cache.num_objs
    659.54            +0.1%     659.91        slabinfo.kernfs_node_cache.num_slabs
    747.57 ± 21%     -23.5%     571.73 ± 27%  slabinfo.khugepaged_mm_slot.active_objs
     11.25 ± 16%     -17.3%       9.31 ± 21%  slabinfo.khugepaged_mm_slot.active_slabs
      1147 ± 16%     -17.3%     949.12 ± 21%  slabinfo.khugepaged_mm_slot.num_objs
     11.25 ± 16%     -17.3%       9.31 ± 21%  slabinfo.khugepaged_mm_slot.num_slabs
      2032            +1.7%       2068        slabinfo.kmalloc-128.active_objs
     64.08            +1.8%      65.21        slabinfo.kmalloc-128.active_slabs
      2050            +1.8%       2086        slabinfo.kmalloc-128.num_objs
     64.08            +1.8%      65.21        slabinfo.kmalloc-128.num_slabs
     14777 ±  2%      +0.9%      14907 ±  2%  slabinfo.kmalloc-16.active_objs
     63.69 ±  2%      +3.1%      65.68        slabinfo.kmalloc-16.active_slabs
     16304 ±  2%      +3.1%      16813        slabinfo.kmalloc-16.num_objs
     63.69 ±  2%      +3.1%      65.68        slabinfo.kmalloc-16.num_slabs
      2650            +1.8%       2697 ±  4%  slabinfo.kmalloc-192.active_objs
     63.74            +1.8%      64.85 ±  4%  slabinfo.kmalloc-192.active_slabs
      2677            +1.8%       2723 ±  4%  slabinfo.kmalloc-192.num_objs
     63.74            +1.8%      64.85 ±  4%  slabinfo.kmalloc-192.num_slabs
      2006            +0.6%       2018        slabinfo.kmalloc-1k.active_objs
     63.66            +0.2%      63.82        slabinfo.kmalloc-1k.active_slabs
      2037            +0.2%       2042        slabinfo.kmalloc-1k.num_objs
     63.66            +0.2%      63.82        slabinfo.kmalloc-1k.num_slabs
      3216            +1.2%       3255        slabinfo.kmalloc-256.active_objs
    101.94            +1.2%     103.16        slabinfo.kmalloc-256.active_slabs
      3262            +1.2%       3301        slabinfo.kmalloc-256.num_objs
    101.94            +1.2%     103.16        slabinfo.kmalloc-256.num_slabs
      1433            +1.5%       1454 ±  2%  slabinfo.kmalloc-2k.active_objs
     90.76            +1.1%      91.77        slabinfo.kmalloc-2k.active_slabs
      1452            +1.1%       1468        slabinfo.kmalloc-2k.num_objs
     90.76            +1.1%      91.77        slabinfo.kmalloc-2k.num_slabs
     20747            -0.8%      20588        slabinfo.kmalloc-32.active_objs
    163.60            -1.1%     161.82        slabinfo.kmalloc-32.active_slabs
     20940            -1.1%      20713        slabinfo.kmalloc-32.num_objs
    163.60            -1.1%     161.82        slabinfo.kmalloc-32.num_slabs
    543.37 ±  2%      +3.0%     559.52 ±  3%  slabinfo.kmalloc-4k.active_objs
     68.62 ±  2%      +2.7%      70.51 ±  3%  slabinfo.kmalloc-4k.active_slabs
    548.99 ±  2%      +2.7%     564.05 ±  3%  slabinfo.kmalloc-4k.num_objs
     68.62 ±  2%      +2.7%      70.51 ±  3%  slabinfo.kmalloc-4k.num_slabs
      5604 ±  4%      -1.3%       5532        slabinfo.kmalloc-512.active_objs
    181.77 ±  4%      -0.5%     180.89 ±  2%  slabinfo.kmalloc-512.active_slabs
      5816 ±  4%      -0.5%       5788 ±  2%  slabinfo.kmalloc-512.num_objs
    181.77 ±  4%      -0.5%     180.89 ±  2%  slabinfo.kmalloc-512.num_slabs
     26179            +0.7%      26359        slabinfo.kmalloc-64.active_objs
    414.95            +0.5%     417.14        slabinfo.kmalloc-64.active_slabs
     26557            +0.5%      26696        slabinfo.kmalloc-64.num_objs
    414.95            +0.5%     417.14        slabinfo.kmalloc-64.num_slabs
     24522 ±  3%      +1.9%      24984 ±  2%  slabinfo.kmalloc-8.active_objs
     50.47 ±  2%      +1.7%      51.31        slabinfo.kmalloc-8.active_slabs
     25839 ±  2%      +1.7%      26269        slabinfo.kmalloc-8.num_objs
     50.47 ±  2%      +1.7%      51.31        slabinfo.kmalloc-8.num_slabs
    243.86            +1.3%     247.05        slabinfo.kmalloc-8k.active_objs
     61.78            +1.1%      62.44        slabinfo.kmalloc-8k.active_slabs
    247.14            +1.1%     249.75        slabinfo.kmalloc-8k.num_objs
     61.78            +1.1%      62.44        slabinfo.kmalloc-8k.num_slabs
      4728 ±  4%      +0.9%       4768 ±  2%  slabinfo.kmalloc-96.active_objs
    114.07 ±  3%      +0.8%     115.01 ±  2%  slabinfo.kmalloc-96.active_slabs
      4791 ±  3%      +0.8%       4830 ±  2%  slabinfo.kmalloc-96.num_objs
    114.07 ±  3%      +0.8%     115.01 ±  2%  slabinfo.kmalloc-96.num_slabs
    215.73 ±  5%      -9.2%     195.92 ±  7%  slabinfo.kmalloc-cg-128.active_objs
     10.32 ±  5%      -0.8%      10.25 ±  6%  slabinfo.kmalloc-cg-128.active_slabs
    330.38 ±  5%      -0.8%     327.89 ±  6%  slabinfo.kmalloc-cg-128.num_objs
     10.32 ±  5%      -0.8%      10.25 ±  6%  slabinfo.kmalloc-cg-128.num_slabs
    933.59 ± 19%     -15.2%     791.36 ± 28%  slabinfo.kmalloc-cg-16.active_objs
      8.27 ± 10%      -4.3%       7.91 ± 10%  slabinfo.kmalloc-cg-16.active_slabs
      2116 ± 10%      -4.3%       2024 ± 10%  slabinfo.kmalloc-cg-16.num_objs
      8.27 ± 10%      -4.3%       7.91 ± 10%  slabinfo.kmalloc-cg-16.num_slabs
      1232 ±  6%      -8.0%       1134 ±  5%  slabinfo.kmalloc-cg-192.active_objs
     32.39 ±  4%      -4.3%      31.01 ±  3%  slabinfo.kmalloc-cg-192.active_slabs
      1360 ±  4%      -4.3%       1302 ±  3%  slabinfo.kmalloc-cg-192.num_objs
     32.39 ±  4%      -4.3%      31.01 ±  3%  slabinfo.kmalloc-cg-192.num_slabs
    893.12 ±  6%     -14.3%     765.64 ±  9%  slabinfo.kmalloc-cg-1k.active_objs
     32.06 ±  2%      -6.9%      29.84 ±  7%  slabinfo.kmalloc-cg-1k.active_slabs
      1025 ±  2%      -6.9%     954.82 ±  7%  slabinfo.kmalloc-cg-1k.num_objs
     32.06 ±  2%      -6.9%      29.84 ±  7%  slabinfo.kmalloc-cg-1k.num_slabs
    170.58 ±  6%      -7.2%     158.27 ±  6%  slabinfo.kmalloc-cg-256.active_objs
      7.92 ±  5%      -1.5%       7.80 ±  4%  slabinfo.kmalloc-cg-256.active_slabs
    253.33 ±  5%      -1.5%     249.52 ±  4%  slabinfo.kmalloc-cg-256.num_objs
      7.92 ±  5%      -1.5%       7.80 ±  4%  slabinfo.kmalloc-cg-256.num_slabs
    203.09 ±  8%      -4.9%     193.19 ±  5%  slabinfo.kmalloc-cg-2k.active_objs
     16.63 ±  4%      -1.8%      16.33 ±  3%  slabinfo.kmalloc-cg-2k.active_slabs
    266.11 ±  4%      -1.8%     261.25 ±  3%  slabinfo.kmalloc-cg-2k.num_objs
     16.63 ±  4%      -1.8%      16.33 ±  3%  slabinfo.kmalloc-cg-2k.num_slabs
      2463 ±  4%     -14.6%       2103 ±  7%  slabinfo.kmalloc-cg-32.active_objs
     22.45 ±  4%     -12.6%      19.62 ±  7%  slabinfo.kmalloc-cg-32.active_slabs
      2874 ±  4%     -12.6%       2511 ±  7%  slabinfo.kmalloc-cg-32.num_objs
     22.45 ±  4%     -12.6%      19.62 ±  7%  slabinfo.kmalloc-cg-32.num_slabs
    274.20 ±  8%      -3.8%     263.76 ±  7%  slabinfo.kmalloc-cg-4k.active_objs
     36.51 ±  7%      -3.9%      35.08 ±  7%  slabinfo.kmalloc-cg-4k.active_slabs
    292.07 ±  7%      -3.9%     280.68 ±  7%  slabinfo.kmalloc-cg-4k.num_objs
     36.51 ±  7%      -3.9%      35.08 ±  7%  slabinfo.kmalloc-cg-4k.num_slabs
    562.49 ± 11%      -8.8%     513.06 ±  6%  slabinfo.kmalloc-cg-512.active_objs
     22.81 ±  7%      -9.2%      20.71 ±  4%  slabinfo.kmalloc-cg-512.active_slabs
    729.98 ±  7%      -9.2%     662.68 ±  4%  slabinfo.kmalloc-cg-512.num_objs
     22.81 ±  7%      -9.2%      20.71 ±  4%  slabinfo.kmalloc-cg-512.num_slabs
    557.88 ± 14%     -10.9%     496.89 ± 13%  slabinfo.kmalloc-cg-64.active_objs
     13.51 ±  9%      +1.0%      13.65 ±  4%  slabinfo.kmalloc-cg-64.active_slabs
    864.61 ±  9%      +1.0%     873.45 ±  4%  slabinfo.kmalloc-cg-64.num_objs
     13.51 ±  9%      +1.0%      13.65 ±  4%  slabinfo.kmalloc-cg-64.num_slabs
     15076 ±  9%     -10.3%      13524 ±  3%  slabinfo.kmalloc-cg-8.active_objs
     33.96 ±  3%      -4.3%      32.49        slabinfo.kmalloc-cg-8.active_slabs
     17390 ±  3%      -4.3%      16635        slabinfo.kmalloc-cg-8.num_objs
     33.96 ±  3%      -4.3%      32.49        slabinfo.kmalloc-cg-8.num_slabs
      6.03 ± 29%     +38.0%       8.32 ± 20%  slabinfo.kmalloc-cg-8k.active_objs
      4.10 ±  8%      +6.8%       4.38 ±  4%  slabinfo.kmalloc-cg-8k.active_slabs
     16.42 ±  8%      +6.8%      17.53 ±  4%  slabinfo.kmalloc-cg-8k.num_objs
      4.10 ±  8%      +6.8%       4.38 ±  4%  slabinfo.kmalloc-cg-8k.num_slabs
      1048 ±  9%     -14.6%     895.73 ±  7%  slabinfo.kmalloc-cg-96.active_objs
     27.09 ±  7%     -12.4%      23.72 ±  6%  slabinfo.kmalloc-cg-96.active_slabs
      1137 ±  7%     -12.4%     996.23 ±  6%  slabinfo.kmalloc-cg-96.num_objs
     27.09 ±  7%     -12.4%      23.72 ±  6%  slabinfo.kmalloc-cg-96.num_slabs
     88.79 ± 32%     -12.4%      77.78 ± 23%  slabinfo.kmalloc-rcl-128.active_objs
      4.95 ±  4%      -0.4%       4.93 ±  8%  slabinfo.kmalloc-rcl-128.active_slabs
    158.28 ±  4%      -0.4%     157.65 ±  8%  slabinfo.kmalloc-rcl-128.num_objs
      4.95 ±  4%      -0.4%       4.93 ±  8%  slabinfo.kmalloc-rcl-128.num_slabs
     39.14 ± 24%     -20.6%      31.06 ± 50%  slabinfo.kmalloc-rcl-192.active_objs
      2.50            -3.3%       2.42 ±  7%  slabinfo.kmalloc-rcl-192.active_slabs
    105.00            -3.3%     101.50 ±  7%  slabinfo.kmalloc-rcl-192.num_objs
      2.50            -3.3%       2.42 ±  7%  slabinfo.kmalloc-rcl-192.num_slabs
      1377 ± 10%     -13.6%       1190 ± 10%  slabinfo.kmalloc-rcl-64.active_objs
     33.28 ±  4%      -9.4%      30.15 ±  9%  slabinfo.kmalloc-rcl-64.active_slabs
      2129 ±  4%      -9.4%       1929 ±  9%  slabinfo.kmalloc-rcl-64.num_objs
     33.28 ±  4%      -9.4%      30.15 ±  9%  slabinfo.kmalloc-rcl-64.num_slabs
    620.25 ± 12%      -8.6%     566.82 ± 13%  slabinfo.kmalloc-rcl-96.active_objs
     24.91 ±  4%      -6.9%      23.19 ±  6%  slabinfo.kmalloc-rcl-96.active_slabs
      1046 ±  4%      -6.9%     973.98 ±  6%  slabinfo.kmalloc-rcl-96.num_objs
     24.91 ±  4%      -6.9%      23.19 ±  6%  slabinfo.kmalloc-rcl-96.num_slabs
    173.57 ± 11%      -6.8%     161.75 ±  9%  slabinfo.kmem_cache.active_objs
      9.75 ±  6%      -1.7%       9.58 ±  6%  slabinfo.kmem_cache.active_slabs
    312.00 ±  6%      -1.7%     306.67 ±  6%  slabinfo.kmem_cache.num_objs
      9.75 ±  6%      -1.7%       9.58 ±  6%  slabinfo.kmem_cache.num_slabs
    347.28 ± 12%      -8.1%     319.12 ± 10%  slabinfo.kmem_cache_node.active_objs
     10.25 ±  6%      -1.6%      10.08 ±  6%  slabinfo.kmem_cache_node.active_slabs
    656.00 ±  6%      -1.6%     645.33 ±  6%  slabinfo.kmem_cache_node.num_objs
     10.25 ±  6%      -1.6%      10.08 ±  6%  slabinfo.kmem_cache_node.num_slabs
      6978 ±  9%      -4.2%       6683 ±  4%  slabinfo.lsm_file_cache.active_objs
     43.58 ±  7%      -4.0%      41.86 ±  3%  slabinfo.lsm_file_cache.active_slabs
      7409 ±  7%      -4.0%       7115 ±  3%  slabinfo.lsm_file_cache.num_objs
     43.58 ±  7%      -4.0%      41.86 ±  3%  slabinfo.lsm_file_cache.num_slabs
     42710            -0.4%      42554        slabinfo.lsm_inode_cache.active_objs
    678.57            -0.0%     678.35        slabinfo.lsm_inode_cache.active_slabs
     43428            -0.0%      43414        slabinfo.lsm_inode_cache.num_objs
    678.57            -0.0%     678.35        slabinfo.lsm_inode_cache.num_slabs
      4012 ±  2%      -8.0%       3690 ±  3%  slabinfo.maple_node.active_objs
    143.72 ±  3%      -5.7%     135.56 ±  2%  slabinfo.maple_node.active_slabs
      4599 ±  3%      -5.7%       4338 ±  2%  slabinfo.maple_node.num_objs
    143.72 ±  3%      -5.7%     135.56 ±  2%  slabinfo.maple_node.num_slabs
    854.47 ± 10%      -7.2%     792.87 ±  4%  slabinfo.mm_struct.active_objs
     38.24 ±  7%      -5.4%      36.19 ±  3%  slabinfo.mm_struct.active_slabs
    917.86 ±  7%      -5.4%     868.54 ±  3%  slabinfo.mm_struct.num_objs
     38.24 ±  7%      -5.4%      36.19 ±  3%  slabinfo.mm_struct.num_slabs
    271.97 ± 15%      -9.8%     245.33 ± 17%  slabinfo.mnt_cache.active_objs
     13.12 ±  8%      -1.6%      12.91 ±  4%  slabinfo.mnt_cache.active_slabs
    551.11 ±  8%      -1.6%     542.32 ±  4%  slabinfo.mnt_cache.num_objs
     13.12 ±  8%      -1.6%      12.91 ±  4%  slabinfo.mnt_cache.num_slabs
      5.83 ± 96%     -53.5%       2.71 ±103%  slabinfo.mqueue_inode_cache.active_objs
      0.50            +0.0%       0.50        slabinfo.mqueue_inode_cache.active_slabs
     17.00            +0.0%      17.00        slabinfo.mqueue_inode_cache.num_objs
      0.50            +0.0%       0.50        slabinfo.mqueue_inode_cache.num_slabs
    256.94 ± 10%      -1.0%     254.36 ±  6%  slabinfo.names_cache.active_objs
     34.03 ± 10%      -1.2%      33.61 ±  6%  slabinfo.names_cache.active_slabs
    272.21 ± 10%      -1.2%     268.88 ±  6%  slabinfo.names_cache.num_objs
     34.03 ± 10%      -1.2%      33.61 ±  6%  slabinfo.names_cache.num_slabs
      0.70 ± 96%     +63.6%       1.15 ±101%  slabinfo.net_namespace.active_objs
      0.50            +0.0%       0.50        slabinfo.net_namespace.active_slabs
      3.50            +0.0%       3.50        slabinfo.net_namespace.num_objs
      0.50            +0.0%       0.50        slabinfo.net_namespace.num_slabs
     12.09 ± 68%     -60.2%       4.82 ± 74%  slabinfo.nfs_commit_data.active_objs
      0.50            +0.0%       0.50        slabinfo.nfs_commit_data.active_slabs
     23.00            +0.0%      23.00        slabinfo.nfs_commit_data.num_objs
      0.50            +0.0%       0.50        slabinfo.nfs_commit_data.num_slabs
    116.95 ± 33%     -19.0%      94.77 ± 41%  slabinfo.nsproxy.active_objs
      3.95 ±  5%     -12.2%       3.47 ± 16%  slabinfo.nsproxy.active_slabs
    221.30 ±  5%     -12.2%     194.30 ± 16%  slabinfo.nsproxy.num_objs
      3.95 ±  5%     -12.2%       3.47 ± 16%  slabinfo.nsproxy.num_slabs
    180.49 ± 19%      -3.9%     173.52 ± 24%  slabinfo.numa_policy.active_objs
      6.08 ± 11%      +2.0%       6.20 ±  9%  slabinfo.numa_policy.active_slabs
    364.57 ± 11%      +2.0%     372.02 ±  9%  slabinfo.numa_policy.num_objs
      6.08 ± 11%      +2.0%       6.20 ±  9%  slabinfo.numa_policy.num_slabs
    874.04 ±  3%      -3.3%     845.11 ±  7%  slabinfo.perf_event.active_objs
     46.36 ±  2%      -0.9%      45.94 ±  3%  slabinfo.perf_event.active_slabs
      1112 ±  2%      -0.9%       1102 ±  3%  slabinfo.perf_event.num_objs
     46.36 ±  2%      -0.9%      45.94 ±  3%  slabinfo.perf_event.num_slabs
      1604 ±  5%      -4.9%       1526 ±  2%  slabinfo.pid.active_objs
     53.35 ±  2%      -2.1%      52.22        slabinfo.pid.active_slabs
      1707 ±  2%      -2.1%       1670        slabinfo.pid.num_objs
     53.35 ±  2%      -2.1%      52.22        slabinfo.pid.num_slabs
      2682            -1.0%       2655        slabinfo.pool_workqueue.active_objs
     87.67            -0.6%      87.18        slabinfo.pool_workqueue.active_slabs
      2805            -0.6%       2789        slabinfo.pool_workqueue.num_objs
     87.67            -0.6%      87.18        slabinfo.pool_workqueue.num_slabs
     61.09 ± 40%     -10.9%      54.43 ± 44%  slabinfo.posix_timers_cache.active_objs
      4.01 ± 16%      -2.1%       3.93 ±  8%  slabinfo.posix_timers_cache.active_slabs
    128.46 ± 16%      -2.1%     125.78 ±  8%  slabinfo.posix_timers_cache.num_objs
      4.01 ± 16%      -2.1%       3.93 ±  8%  slabinfo.posix_timers_cache.num_slabs
      1357 ±  2%      -2.5%       1323 ±  2%  slabinfo.proc_dir_entry.active_objs
     36.81 ±  2%      -1.5%      36.27 ±  2%  slabinfo.proc_dir_entry.active_slabs
      1546 ±  2%      -1.5%       1523 ±  2%  slabinfo.proc_dir_entry.num_objs
     36.81 ±  2%      -1.5%      36.27 ±  2%  slabinfo.proc_dir_entry.num_slabs
      5538 ±  2%      -2.7%       5391 ±  3%  slabinfo.proc_inode_cache.active_objs
    121.57            -1.6%     119.64 ±  3%  slabinfo.proc_inode_cache.active_slabs
      5713            -1.6%       5622 ±  3%  slabinfo.proc_inode_cache.num_objs
    121.57            -1.6%     119.64 ±  3%  slabinfo.proc_inode_cache.num_slabs
     15608            +0.1%      15629        slabinfo.radix_tree_node.active_objs
    280.04            +0.1%     280.20        slabinfo.radix_tree_node.active_slabs
     15682            +0.1%      15691        slabinfo.radix_tree_node.num_objs
    280.04            +0.1%     280.20        slabinfo.radix_tree_node.num_slabs
     89.60 ± 36%     -12.7%      78.22 ± 36%  slabinfo.request_queue.active_objs
      5.73 ± 11%      -2.6%       5.58 ± 19%  slabinfo.request_queue.active_slabs
    194.91 ± 11%      -2.6%     189.84 ± 19%  slabinfo.request_queue.num_objs
      5.73 ± 11%      -2.6%       5.58 ± 19%  slabinfo.request_queue.num_slabs
     11.15 ± 31%      -2.3%      10.89 ± 49%  slabinfo.rpc_inode_cache.active_objs
      0.50            +0.0%       0.50        slabinfo.rpc_inode_cache.active_slabs
     23.00            +0.0%      23.00        slabinfo.rpc_inode_cache.num_objs
      0.50            +0.0%       0.50        slabinfo.rpc_inode_cache.num_slabs
      1793            -1.0%       1776        slabinfo.scsi_sense_cache.active_objs
     56.83            -0.6%      56.50        slabinfo.scsi_sense_cache.active_slabs
      1818            -0.6%       1808        slabinfo.scsi_sense_cache.num_objs
     56.83            -0.6%      56.50        slabinfo.scsi_sense_cache.num_slabs
      1129 ± 10%      -0.6%       1122 ±  9%  slabinfo.seq_file.active_objs
     34.99 ±  9%      -0.6%      34.78 ±  8%  slabinfo.seq_file.active_slabs
      1189 ±  9%      -0.6%       1182 ±  8%  slabinfo.seq_file.num_objs
     34.99 ±  9%      -0.6%      34.78 ±  8%  slabinfo.seq_file.num_slabs
     11336            -1.1%      11211        slabinfo.shared_policy_node.active_objs
    137.55            -1.2%     135.86        slabinfo.shared_policy_node.active_slabs
     11692            -1.2%      11547        slabinfo.shared_policy_node.num_objs
    137.55            -1.2%     135.86        slabinfo.shared_policy_node.num_slabs
      1612            -4.3%       1543 ±  2%  slabinfo.shmem_inode_cache.active_objs
     45.60            -2.3%      44.55        slabinfo.shmem_inode_cache.active_slabs
      1960            -2.3%       1915        slabinfo.shmem_inode_cache.num_objs
     45.60            -2.3%      44.55        slabinfo.shmem_inode_cache.num_slabs
    888.84 ±  3%      -6.1%     834.91 ±  2%  slabinfo.sighand_cache.active_objs
     61.93 ±  2%      -3.7%      59.64        slabinfo.sighand_cache.active_slabs
    928.96 ±  2%      -3.7%     894.55        slabinfo.sighand_cache.num_objs
     61.93 ±  2%      -3.7%      59.64        slabinfo.sighand_cache.num_slabs
      1205 ±  4%      -7.7%       1112 ±  4%  slabinfo.signal_cache.active_objs
     47.68 ±  2%      -3.3%      46.12 ±  3%  slabinfo.signal_cache.active_slabs
      1334 ±  2%      -3.3%       1291 ±  3%  slabinfo.signal_cache.num_objs
     47.68 ±  2%      -3.3%      46.12 ±  3%  slabinfo.signal_cache.num_slabs
      1625 ± 10%     -12.0%       1430 ±  6%  slabinfo.sigqueue.active_objs
     33.78 ±  9%     -10.8%      30.14 ±  5%  slabinfo.sigqueue.active_slabs
      1722 ±  9%     -10.8%       1536 ±  5%  slabinfo.sigqueue.num_objs
     33.78 ±  9%     -10.8%      30.14 ±  5%  slabinfo.sigqueue.num_slabs
    164.29 ±  8%      -7.0%     152.72 ±  5%  slabinfo.skbuff_ext_cache.active_objs
     10.13 ±  4%      -3.6%       9.77 ±  2%  slabinfo.skbuff_ext_cache.active_slabs
    324.29 ±  4%      -3.6%     312.72 ±  2%  slabinfo.skbuff_ext_cache.num_objs
     10.13 ±  4%      -3.6%       9.77 ±  2%  slabinfo.skbuff_ext_cache.num_slabs
      1402 ±  7%      -2.8%       1363 ±  6%  slabinfo.skbuff_head_cache.active_objs
     44.44 ±  7%      -2.8%      43.21 ±  6%  slabinfo.skbuff_head_cache.active_slabs
      1422 ±  7%      -2.8%       1382 ±  6%  slabinfo.skbuff_head_cache.num_objs
     44.44 ±  7%      -2.8%      43.21 ±  6%  slabinfo.skbuff_head_cache.num_slabs
      1911 ±  3%      -1.2%       1889 ±  3%  slabinfo.skbuff_small_head.active_objs
     38.10 ±  3%      -1.1%      37.70 ±  3%  slabinfo.skbuff_small_head.active_slabs
      1943 ±  3%      -1.1%       1922 ±  3%  slabinfo.skbuff_small_head.num_objs
     38.10 ±  3%      -1.1%      37.70 ±  3%  slabinfo.skbuff_small_head.num_slabs
    597.00 ± 12%      -5.3%     565.26 ± 14%  slabinfo.sock_inode_cache.active_objs
     23.62 ±  7%      -2.9%      22.94 ±  6%  slabinfo.sock_inode_cache.active_slabs
    921.18 ±  7%      -2.9%     894.62 ±  6%  slabinfo.sock_inode_cache.num_objs
     23.62 ±  7%      -2.9%      22.94 ±  6%  slabinfo.sock_inode_cache.num_slabs
    281.57 ± 19%     -12.4%     246.64 ± 23%  slabinfo.task_group.active_objs
     10.97 ±  8%      -5.7%      10.34 ±  8%  slabinfo.task_group.active_slabs
    559.44 ±  8%      -5.7%     527.56 ±  8%  slabinfo.task_group.num_objs
     10.97 ±  8%      -5.7%      10.34 ±  8%  slabinfo.task_group.num_slabs
    695.67            -5.2%     659.30 ±  2%  slabinfo.task_struct.active_objs
    350.01            -4.8%     333.21 ±  2%  slabinfo.task_struct.active_slabs
    700.02            -4.8%     666.42 ±  2%  slabinfo.task_struct.num_objs
    350.01            -4.8%     333.21 ±  2%  slabinfo.task_struct.num_slabs
    235.19 ± 24%     -41.3%     138.08 ± 29%  slabinfo.taskstats.active_objs
      9.64 ± 23%     -27.5%       6.99 ± 20%  slabinfo.taskstats.active_slabs
    356.80 ± 23%     -27.5%     258.57 ± 20%  slabinfo.taskstats.num_objs
      9.64 ± 23%     -27.5%       6.99 ± 20%  slabinfo.taskstats.num_slabs
      1123            -0.9%       1113        slabinfo.trace_event_file.active_objs
     28.00            -0.9%      27.75        slabinfo.trace_event_file.active_slabs
      1176            -0.9%       1165        slabinfo.trace_event_file.num_objs
     28.00            -0.9%      27.75        slabinfo.trace_event_file.num_slabs
    397.17 ±  2%      -3.4%     383.83 ±  5%  slabinfo.tracefs_inode_cache.active_objs
      9.19 ±  2%      -1.6%       9.05        slabinfo.tracefs_inode_cache.active_slabs
    450.45 ±  2%      -1.6%     443.44        slabinfo.tracefs_inode_cache.num_objs
      9.19 ±  2%      -1.6%       9.05        slabinfo.tracefs_inode_cache.num_slabs
      7.90 ± 78%     -52.6%       3.74 ±146%  slabinfo.tw_sock_TCP.active_objs
      0.50            +0.0%       0.50        slabinfo.tw_sock_TCP.active_slabs
     16.00            +0.0%      16.00        slabinfo.tw_sock_TCP.num_objs
      0.50            +0.0%       0.50        slabinfo.tw_sock_TCP.num_slabs
     50.28            -0.0%      50.27        slabinfo.user_namespace.active_objs
      1.00            +0.0%       1.00        slabinfo.user_namespace.active_slabs
     51.00            +0.0%      51.00        slabinfo.user_namespace.num_objs
      1.00            +0.0%       1.00        slabinfo.user_namespace.num_slabs
     16.70 ± 64%     -20.3%      13.30 ± 49%  slabinfo.uts_namespace.active_objs
      1.00            +0.0%       1.00        slabinfo.uts_namespace.active_slabs
     37.00            +0.0%      37.00        slabinfo.uts_namespace.num_objs
      1.00            +0.0%       1.00        slabinfo.uts_namespace.num_slabs
     19825 ±  2%      -1.0%      19622 ±  2%  slabinfo.vm_area_struct.active_objs
    435.46 ±  2%      -0.8%     432.02 ±  2%  slabinfo.vm_area_struct.active_slabs
     20031 ±  2%      -0.8%      19872 ±  2%  slabinfo.vm_area_struct.num_objs
    435.46 ±  2%      -0.8%     432.02 ±  2%  slabinfo.vm_area_struct.num_slabs
     20895 ±  3%      -2.1%      20465 ±  2%  slabinfo.vma_lock.active_objs
    210.24 ±  2%      -1.2%     207.81 ±  2%  slabinfo.vma_lock.active_slabs
     21444 ±  2%      -1.2%      21196 ±  2%  slabinfo.vma_lock.num_objs
    210.24 ±  2%      -1.2%     207.81 ±  2%  slabinfo.vma_lock.num_slabs
    111201            -0.0%     111165        slabinfo.vmap_area.active_objs
      1986            -0.0%       1985        slabinfo.vmap_area.active_slabs
    111238            -0.0%     111192        slabinfo.vmap_area.num_objs
      1986            -0.0%       1985        slabinfo.vmap_area.num_slabs
      2.59 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.__kmalloc_cache_noprof.drm_atomic_state_alloc.drm_atomic_helper_dirtyfb.drm_fbdev_shmem_helper_fb_dirty
      0.00        +6.7e+98%       0.00 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.__kmalloc_node_noprof.__vmalloc_area_node.__vmalloc_node_range_noprof.alloc_thread_stack_node
      9.70 ±103%     -10.2%       8.71 ±111%  perf-sched.sch_delay.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
    833.47 ± 19%     -18.3%     680.83 ± 62%  perf-sched.sch_delay.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.set_cpus_allowed_ptr
      0.00        +3.2e+99%       0.00 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.cgroup_rstat_flush_locked.cgroup_rstat_flush.flush_memcg_stats_dwork.process_one_work
      0.01 ±223%  +1.2e+06%     173.42 ±163%  perf-sched.sch_delay.avg.ms.__cond_resched.do_select.core_sys_select.do_pselect.constprop
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.down_read.walk_component.link_path_walk.part
      0.00          +5e+98%       0.00 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.dput.step_into.open_last_lookups.path_openat
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.vma_expand
      0.00          +5e+98%       0.00 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.prepare_creds.copy_creds.copy_process
      0.00       +1.2e+101%       0.12 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.migrate_pages_batch.migrate_pages.migrate_misplaced_folio.do_numa_page
     15.62 ± 78%     -35.9%      10.01 ± 79%  perf-sched.sch_delay.avg.ms.__cond_resched.mutex_lock.cpuhp_bringup_ap.cpuhp_invoke_callback.__cpuhp_invoke_callback_range
      1.55 ±121%     -53.7%       0.72 ± 74%  perf-sched.sch_delay.avg.ms.__cond_resched.mutex_lock.crash_handle_hotplug_event.crash_cpuhp_offline.cpuhp_invoke_callback
      0.00 ±186%  +15544.4%       0.70 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.mutex_lock.lockup_detector_cleanup._cpu_down.__cpu_down_maps_locked
      1.61 ± 45%     -59.8%       0.65 ± 50%  perf-sched.sch_delay.avg.ms.__cond_resched.mutex_lock.page_alloc_cpu_dead.cpuhp_invoke_callback.__cpuhp_invoke_callback_range
      0.00 ±107%     -46.2%       0.00 ±104%  perf-sched.sch_delay.avg.ms.__cond_resched.mutex_lock.perf_event_exit_cpu_context.perf_event_exit_cpu.cpuhp_invoke_callback
      0.00          +1e+99%       0.00 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.mutex_lock.pipe_write.vfs_write.ksys_write
      0.01 ±  9%      +6.1%       0.01 ±  6%  perf-sched.sch_delay.avg.ms.__cond_resched.mutex_lock.slub_cpu_dead.cpuhp_invoke_callback.__cpuhp_invoke_callback_range
      4.00 ±222%     -99.7%       0.01 ±188%  perf-sched.sch_delay.avg.ms.__cond_resched.process_one_work.worker_thread.kthread.ret_from_fork
      0.00 ± 84%      +4.5%       0.00 ± 93%  perf-sched.sch_delay.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.00 ±107%     -77.8%       0.00 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.synchronize_rcu.sched_cpu_deactivate.cpuhp_invoke_callback.cpuhp_thread_fun
     27.47 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.task_work_run.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.29 ±223%     -99.8%       0.00 ±159%  perf-sched.sch_delay.avg.ms.__cond_resched.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.06 ± 32%     -43.1%       0.60 ± 52%  perf-sched.sch_delay.avg.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_gem_fb_vunmap.drm_atomic_helper_commit_planes
     44.44 ±214%    +150.2%     111.20 ±223%  perf-sched.sch_delay.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.d_alloc_parallel.__lookup_slow.walk_component.path_lookupat
     38.05 ±102%     +43.0%      54.41 ± 90%  perf-sched.sch_delay.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      0.00 ±141%  +53250.0%       0.18 ±223%  perf-sched.sch_delay.avg.ms.devtmpfs_work_loop.devtmpfsd.kthread.ret_from_fork
      0.01 ±120%     -75.3%       0.00 ± 72%  perf-sched.sch_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
     64.44 ± 82%     -38.0%      39.95 ±126%  perf-sched.sch_delay.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      0.00 ±223%     +50.0%       0.00 ±223%  perf-sched.sch_delay.avg.ms.io_schedule.folio_wait_bit_common.filemap_fault.__do_fault
      0.00 ±141%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.ipmi_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.00 ±223%    +114.3%       0.00 ±141%  perf-sched.sch_delay.avg.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
     20.74 ±140%      -9.4%      18.79 ± 74%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
      0.00 ±223%  +1.9e+07%     504.53 ±223%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
     50.04 ±117%    +200.6%     150.43 ±205%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
    178.28 ±218%     -57.6%      75.57 ±223%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown].[unknown]
    380.64 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.kthreadd.ret_from_fork.ret_from_fork_asm
      2.52 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.percpu_down_write._cpu_down.__cpu_down_maps_locked.work_for_cpu_fn
    367.25 ±209%    -100.0%       0.00 ± 39%  perf-sched.sch_delay.avg.ms.percpu_rwsem_wait.__percpu_down_read.cpus_read_lock.all_vm_events
      4.37 ±124%     -26.7%       3.20 ±223%  perf-sched.sch_delay.avg.ms.percpu_rwsem_wait.__percpu_down_read.cpus_read_lock.vmstat_shepherd
     26.14 ± 81%     -35.9%      16.76 ± 51%  perf-sched.sch_delay.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      3.68 ± 41%    +312.0%      15.16 ±157%  perf-sched.sch_delay.avg.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
    122.48 ±140%     -92.7%       8.97 ±222%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
     86.79 ± 61%     +20.5%     104.56 ± 64%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.do_pselect.constprop
      2.39 ±159%    +301.3%       9.59 ± 45%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
     62.51 ± 45%     -27.3%      45.42 ± 74%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.usleep_range_state.cpuhp_wait_for_sync_state.cpuhp_bringup_ap
      0.01 ±206%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.usleep_range_state.ipmi_thread.kthread
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.online_show
      0.00 ± 36%     -24.1%       0.00 ± 74%  perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.uevent_show
      0.00 ± 82%     -62.5%       0.00 ±223%  perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.kthread.ret_from_fork.ret_from_fork_asm
      0.00 ± 74%     +10.0%       0.00 ± 73%  perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.kernfs_dop_revalidate
      0.00 ±223%    +100.0%       0.00 ±141%  perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.kernfs_iop_lookup
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.open_last_lookups
      0.00 ±100%     -25.0%       0.00 ± 99%  perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.walk_component
      0.00        +4.8e+99%       0.00 ±141%  perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read_killable.lock_mm_and_find_vma
      0.00 ±223%    +200.0%       0.00 ±152%  perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.__flush_work.__lru_add_drain_all
      0.00 ±152%    +200.0%       0.00 ±195%  perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.__flush_work.work_on_cpu_key
      0.02 ±223%     -93.3%       0.00 ±223%  perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr
      8.81 ±101%     -90.1%       0.87 ±121%  perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.cpuhp_bringup_ap.cpuhp_invoke_callback
      0.72 ± 82%     -95.4%       0.03 ±182%  perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.cpuhp_kick_ap_work._cpu_down
      0.00 ± 74%     -22.2%       0.00 ± 58%  perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.devtmpfs_submit_req.devtmpfs_delete_node
      1.90 ± 51%     -29.5%       1.34 ± 13%  perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.stop_machine_cpuslocked.takedown_cpu
      5.61 ±105%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_killable.__kthread_create_on_node
      5.44 ±108%     +84.0%      10.01 ±108%  perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.__wait_rcu_gp
      7.83 ±155%    +312.6%      32.31 ±163%  perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
     43.46 ±215%    -100.0%       0.01 ± 68%  perf-sched.sch_delay.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.00        +8.3e+98%       0.00 ±223%  perf-sched.sch_delay.avg.ms.schedule_timeout.khugepaged_wait_work.khugepaged.kthread
      7.13 ± 25%     +13.0%       8.06 ± 53%  perf-sched.sch_delay.avg.ms.schedule_timeout.msleep.online_store.kernfs_fop_write_iter
     24.27 ±150%     -41.6%      14.17 ±155%  perf-sched.sch_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      0.14 ± 32%     -41.2%       0.08 ± 54%  perf-sched.sch_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    344.20 ±107%     -17.1%     285.45 ±132%  perf-sched.sch_delay.avg.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.00 ± 76%     +28.6%       0.00 ±107%  perf-sched.sch_delay.avg.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
      7.87 ± 63%     -68.4%       2.49 ±132%  perf-sched.sch_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      2.59 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.__kmalloc_cache_noprof.drm_atomic_state_alloc.drm_atomic_helper_dirtyfb.drm_fbdev_shmem_helper_fb_dirty
      0.00        +6.7e+98%       0.00 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.__kmalloc_node_noprof.__vmalloc_area_node.__vmalloc_node_range_noprof.alloc_thread_stack_node
    601.05 ± 97%      +3.5%     621.97 ± 60%  perf-sched.sch_delay.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      3319 ± 23%     -20.6%       2635 ± 58%  perf-sched.sch_delay.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.set_cpus_allowed_ptr
      0.00        +3.2e+99%       0.00 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.cgroup_rstat_flush_locked.cgroup_rstat_flush.flush_memcg_stats_dwork.process_one_work
      0.01 ±223%  +1.4e+06%     204.44 ±147%  perf-sched.sch_delay.max.ms.__cond_resched.do_select.core_sys_select.do_pselect.constprop
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.down_read.walk_component.link_path_walk.part
      0.00          +5e+98%       0.00 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.dput.step_into.open_last_lookups.path_openat
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.vma_expand
      0.00          +5e+98%       0.00 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.prepare_creds.copy_creds.copy_process
      0.00       +1.2e+101%       0.12 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.migrate_pages_batch.migrate_pages.migrate_misplaced_folio.do_numa_page
    131.62 ± 46%      -1.5%     129.68 ± 82%  perf-sched.sch_delay.max.ms.__cond_resched.mutex_lock.cpuhp_bringup_ap.cpuhp_invoke_callback.__cpuhp_invoke_callback_range
      4.44 ±170%     -80.3%       0.87 ± 70%  perf-sched.sch_delay.max.ms.__cond_resched.mutex_lock.crash_handle_hotplug_event.crash_cpuhp_offline.cpuhp_invoke_callback
      0.00 ±186%  +31177.8%       1.41 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.mutex_lock.lockup_detector_cleanup._cpu_down.__cpu_down_maps_locked
     17.35 ± 60%     -67.1%       5.71 ±132%  perf-sched.sch_delay.max.ms.__cond_resched.mutex_lock.page_alloc_cpu_dead.cpuhp_invoke_callback.__cpuhp_invoke_callback_range
      0.00 ±101%     -42.9%       0.00 ±111%  perf-sched.sch_delay.max.ms.__cond_resched.mutex_lock.perf_event_exit_cpu_context.perf_event_exit_cpu.cpuhp_invoke_callback
      0.00          +1e+99%       0.00 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.mutex_lock.pipe_write.vfs_write.ksys_write
      0.01 ± 24%     +48.7%       0.02 ± 35%  perf-sched.sch_delay.max.ms.__cond_resched.mutex_lock.slub_cpu_dead.cpuhp_invoke_callback.__cpuhp_invoke_callback_range
      4.00 ±222%     -99.7%       0.01 ±188%  perf-sched.sch_delay.max.ms.__cond_resched.process_one_work.worker_thread.kthread.ret_from_fork
      0.00 ± 91%      +7.1%       0.01 ± 92%  perf-sched.sch_delay.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.00 ±104%     -75.0%       0.00 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.synchronize_rcu.sched_cpu_deactivate.cpuhp_invoke_callback.cpuhp_thread_fun
     27.47 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.task_work_run.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.29 ±223%     -99.7%       0.01 ±182%  perf-sched.sch_delay.max.ms.__cond_resched.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
     17.72 ± 16%     -72.7%       4.83 ± 65%  perf-sched.sch_delay.max.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_gem_fb_vunmap.drm_atomic_helper_commit_planes
    176.52 ±211%     +89.0%     333.59 ±223%  perf-sched.sch_delay.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.d_alloc_parallel.__lookup_slow.walk_component.path_lookupat
      1612 ± 64%     -12.6%       1409 ± 74%  perf-sched.sch_delay.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      0.00 ± 71%  +9.5e+05%      33.42 ±223%  perf-sched.sch_delay.max.ms.devtmpfs_work_loop.devtmpfsd.kthread.ret_from_fork
      0.02 ± 95%     -78.7%       0.00 ± 71%  perf-sched.sch_delay.max.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      1677 ± 44%     -10.0%       1510 ±100%  perf-sched.sch_delay.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      0.00 ±223%      +0.0%       0.00 ±223%  perf-sched.sch_delay.max.ms.io_schedule.folio_wait_bit_common.filemap_fault.__do_fault
      0.00 ±141%    -100.0%       0.00        perf-sched.sch_delay.max.ms.ipmi_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.00 ±223%    +114.3%       0.00 ±141%  perf-sched.sch_delay.max.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
    374.06 ±147%      +7.5%     402.07 ± 50%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
      0.00 ±223%  +1.9e+07%     504.53 ±223%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
    651.25 ±158%     -13.4%     563.95 ±157%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
    178.28 ±218%     -57.6%      75.57 ±223%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown].[unknown]
    380.64 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.kthreadd.ret_from_fork.ret_from_fork_asm
      2.52 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.percpu_down_write._cpu_down.__cpu_down_maps_locked.work_for_cpu_fn
    871.06 ±174%    -100.0%       0.01 ± 61%  perf-sched.sch_delay.max.ms.percpu_rwsem_wait.__percpu_down_read.cpus_read_lock.all_vm_events
     12.40 ±121%     -22.7%       9.59 ±223%  perf-sched.sch_delay.max.ms.percpu_rwsem_wait.__percpu_down_read.cpus_read_lock.vmstat_shepherd
      2520 ± 30%      -6.8%       2348 ± 47%  perf-sched.sch_delay.max.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
     27.53 ±  5%    +945.7%     287.93 ± 99%  perf-sched.sch_delay.max.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
    992.40 ±149%     -83.1%     167.40 ±222%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      3741 ± 13%      -3.3%       3617 ±  9%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.do_pselect.constprop
    571.37 ±130%    +189.7%       1655 ± 31%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
    711.95 ± 40%     -14.8%     606.74 ± 49%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.usleep_range_state.cpuhp_wait_for_sync_state.cpuhp_bringup_ap
      4.84 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.usleep_range_state.ipmi_thread.kthread
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.online_show
      0.01 ± 24%      +6.6%       0.01 ± 86%  perf-sched.sch_delay.max.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.uevent_show
      0.00 ± 73%     -72.7%       0.00 ±223%  perf-sched.sch_delay.max.ms.schedule_preempt_disabled.kthread.ret_from_fork.ret_from_fork_asm
      0.00 ± 72%     +16.7%       0.00 ± 48%  perf-sched.sch_delay.max.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.kernfs_dop_revalidate
      0.00 ±223%    +125.0%       0.00 ±142%  perf-sched.sch_delay.max.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.kernfs_iop_lookup
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.open_last_lookups
      0.00 ±101%     -18.2%       0.00 ±107%  perf-sched.sch_delay.max.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.walk_component
      0.00        +4.8e+99%       0.00 ±141%  perf-sched.sch_delay.max.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read_killable.lock_mm_and_find_vma
      0.00 ±223%    +200.0%       0.00 ±152%  perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.__flush_work.__lru_add_drain_all
      0.01 ±151%    +344.2%       0.03 ±198%  perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.__flush_work.work_on_cpu_key
      0.02 ±223%     -93.3%       0.00 ±223%  perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr
    233.29 ± 98%     -89.3%      24.98 ±133%  perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.cpuhp_bringup_ap.cpuhp_invoke_callback
     14.31 ± 74%     -93.5%       0.94 ±201%  perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.cpuhp_kick_ap_work._cpu_down
      0.00 ± 70%     +16.7%       0.00 ± 47%  perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.devtmpfs_submit_req.devtmpfs_delete_node
      8.92 ±119%     -57.5%       3.79 ±109%  perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.stop_machine_cpuslocked.takedown_cpu
      8.82 ±100%    -100.0%       0.00        perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_killable.__kthread_create_on_node
    109.19 ± 83%     +90.9%     208.45 ± 79%  perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.__wait_rcu_gp
    334.37 ±141%    +100.2%     669.37 ±141%  perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    515.37 ±218%    -100.0%       0.03 ±113%  perf-sched.sch_delay.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.00        +8.3e+98%       0.00 ±223%  perf-sched.sch_delay.max.ms.schedule_timeout.khugepaged_wait_work.khugepaged.kthread
      2368 ± 32%     -10.9%       2109 ± 31%  perf-sched.sch_delay.max.ms.schedule_timeout.msleep.online_store.kernfs_fop_write_iter
      1885 ± 36%     -55.0%     847.53 ± 39%  perf-sched.sch_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
     32.64 ± 12%      -2.6%      31.80 ± 68%  perf-sched.sch_delay.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    838.68 ±121%     -13.5%     725.63 ±121%  perf-sched.sch_delay.max.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.02 ±106%     +81.5%       0.03 ±187%  perf-sched.sch_delay.max.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
      1055 ±146%     -59.2%     431.08 ±145%  perf-sched.sch_delay.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
     11.11 ± 29%     +17.1%      13.01 ± 38%  perf-sched.total_sch_delay.average.ms
      4069 ±  5%      -1.3%       4016 ±  9%  perf-sched.total_sch_delay.max.ms
     42.25 ± 16%      +7.4%      45.37 ± 21%  perf-sched.total_wait_and_delay.average.ms
     27952 ± 16%      -1.1%      27639 ± 24%  perf-sched.total_wait_and_delay.count.ms
      7713 ±  9%      +3.2%       7958 ± 10%  perf-sched.total_wait_and_delay.max.ms
     31.14 ± 12%      +3.9%      32.36 ± 15%  perf-sched.total_wait_time.average.ms
      4204 ±  6%      -0.4%       4189 ± 10%  perf-sched.total_wait_time.max.ms
      0.00       +1.7e+104%     166.69 ±223%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__alloc_pages_noprof.alloc_pages_mpol_noprof.get_free_pages_noprof.pgd_alloc
      0.00       +8.1e+102%       8.14 ±223%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__kmalloc_node_noprof.sched_setaffinity.__x64_sys_sched_setaffinity.do_syscall_64
     45.55 ± 32%     +12.5%      51.26 ± 32%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      1667 ± 19%     -18.3%       1361 ± 62%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.set_cpus_allowed_ptr
      0.00       +3.6e+104%     360.90 ±162%  perf-sched.wait_and_delay.avg.ms.__cond_resched.do_select.core_sys_select.do_pselect.constprop
     10.25 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.dput.step_into.open_last_lookups.path_openat
      0.00         +7e+104%     700.33 ±223%  perf-sched.wait_and_delay.avg.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
      0.00       +8.2e+102%       8.21 ±223%  perf-sched.wait_and_delay.avg.ms.__cond_resched.kmem_cache_alloc_lru_noprof.shmem_alloc_inode.alloc_inode.new_inode
     35.60 ±109%     -82.6%       6.18 ±223%  perf-sched.wait_and_delay.avg.ms.__cond_resched.mutex_lock.cpuhp_bringup_ap.cpuhp_invoke_callback.__cpuhp_invoke_callback_range
     53.25 ±223%   +2452.6%       1359 ±142%  perf-sched.wait_and_delay.avg.ms.__cond_resched.mutex_lock.perf_poll.do_poll.constprop
     42.96 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.process_one_work.worker_thread.kthread.ret_from_fork
    248.97 ±152%     -80.1%      49.50 ±223%  perf-sched.wait_and_delay.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     54.94 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.task_work_run.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      5.75 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
    148.41 ± 49%     -12.5%     129.93 ± 59%  perf-sched.wait_and_delay.avg.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_gem_fb_vunmap.drm_atomic_helper_commit_planes
    746.34 ± 49%     -19.6%     600.27 ±120%  perf-sched.wait_and_delay.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
     11.22 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
     90.18 ± 45%     +20.0%     108.18 ± 60%  perf-sched.wait_and_delay.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
     12.40 ±141%     +35.4%      16.79 ± 70%  perf-sched.wait_and_delay.avg.ms.devtmpfs_work_loop.devtmpfsd.kthread.ret_from_fork
     68.81 ±223%     -49.7%      34.64 ±223%  perf-sched.wait_and_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
     17.07 ±223%    +355.6%      77.79 ±141%  perf-sched.wait_and_delay.avg.ms.do_task_dead.do_exit.__x64_sys_exit.x64_sys_call.do_syscall_64
     45.82 ±106%     +17.1%      53.66 ± 81%  perf-sched.wait_and_delay.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
    104.26 ± 70%     -56.7%      45.12 ±116%  perf-sched.wait_and_delay.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
     28.20 ±223%     -13.8%      24.31 ±147%  perf-sched.wait_and_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
      0.00         +5e+104%     504.53 ±223%  perf-sched.wait_and_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
     93.96 ±129%    +209.3%     290.59 ±214%  perf-sched.wait_and_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
    366.23 ±212%     -58.7%     151.14 ±223%  perf-sched.wait_and_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown].[unknown]
    691.05 ±108%     -59.2%     281.91 ±223%  perf-sched.wait_and_delay.avg.ms.kthreadd.ret_from_fork.ret_from_fork_asm
    583.82 ±123%     -36.2%     372.56 ± 71%  perf-sched.wait_and_delay.avg.ms.percpu_rwsem_wait.__percpu_down_read.cpus_read_lock.all_vm_events
    134.91 ± 53%    +184.3%     383.59 ±101%  perf-sched.wait_and_delay.avg.ms.percpu_rwsem_wait.__percpu_down_read.cpus_read_lock.vmstat_shepherd
    154.44 ± 49%     -24.1%     117.16 ± 22%  perf-sched.wait_and_delay.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      0.00       +2.3e+103%      23.01 ±223%  perf-sched.wait_and_delay.avg.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
    665.57 ± 41%     -31.0%     459.04 ± 49%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
    211.81 ± 50%     +16.8%     247.42 ± 50%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.do_pselect.constprop
     44.38 ± 39%     -10.5%      39.71 ± 47%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
    134.30 ± 44%     -36.8%      84.94 ± 88%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.usleep_range_state.cpuhp_wait_for_sync_state.cpuhp_bringup_ap
      0.08 ±144%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.usleep_range_state.ipmi_thread.kthread
     60.42 ±141%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.open_last_lookups
     79.34 ± 80%     -14.1%      68.13 ± 50%  perf-sched.wait_and_delay.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.walk_component
      6.01 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.schedule_timeout.__wait_for_common.__flush_work.work_on_cpu_key
      8.57 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.schedule_timeout.__wait_for_common.__synchronize_srcu._ipmi_destroy_user
     68.15 ±  9%     -16.4%      56.97 ± 13%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.__wait_for_common.cpuhp_kick_ap_work._cpu_down
     26.13 ±103%      +8.5%      28.35 ±111%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.__wait_rcu_gp
     18.52 ±144%     +78.6%      33.08 ±161%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    531.31 ± 33%     -30.1%     371.52 ± 44%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
     21.45 ± 16%     +10.4%      23.69 ± 35%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.msleep.online_store.kernfs_fop_write_iter
     40.35 ±124%     -22.4%      31.31 ±130%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
     61.67 ±  3%     -27.3%      44.86 ±  3%  perf-sched.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    567.81 ±108%      +1.7%     577.58 ±132%  perf-sched.wait_and_delay.avg.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
    357.10 ±  8%      +1.2%     361.50 ±  9%  perf-sched.wait_and_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.00       +1.7e+101%       0.17 ±223%  perf-sched.wait_and_delay.count.__cond_resched.__alloc_pages_noprof.alloc_pages_mpol_noprof.get_free_pages_noprof.pgd_alloc
      0.00       +1.7e+101%       0.17 ±223%  perf-sched.wait_and_delay.count.__cond_resched.__kmalloc_node_noprof.sched_setaffinity.__x64_sys_sched_setaffinity.do_syscall_64
    270.33 ± 23%      -0.9%     268.00 ± 20%  perf-sched.wait_and_delay.count.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
     12.00 ± 30%     -25.0%       9.00 ± 48%  perf-sched.wait_and_delay.count.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.set_cpus_allowed_ptr
      0.00       +6.7e+101%       0.67 ±165%  perf-sched.wait_and_delay.count.__cond_resched.do_select.core_sys_select.do_pselect.constprop
      0.33 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.dput.step_into.open_last_lookups.path_openat
      0.00       +1.7e+101%       0.17 ±223%  perf-sched.wait_and_delay.count.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
      0.00       +1.7e+101%       0.17 ±223%  perf-sched.wait_and_delay.count.__cond_resched.kmem_cache_alloc_lru_noprof.shmem_alloc_inode.alloc_inode.new_inode
      6.33 ±104%     -18.4%       5.17 ±223%  perf-sched.wait_and_delay.count.__cond_resched.mutex_lock.cpuhp_bringup_ap.cpuhp_invoke_callback.__cpuhp_invoke_callback_range
      0.17 ±223%    +100.0%       0.33 ±141%  perf-sched.wait_and_delay.count.__cond_resched.mutex_lock.perf_poll.do_poll.constprop
      0.17 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.process_one_work.worker_thread.kthread.ret_from_fork
      0.83 ±145%     -80.0%       0.17 ±223%  perf-sched.wait_and_delay.count.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.17 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.task_work_run.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.17 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
     46.50 ± 11%     -55.2%      20.83 ± 52%  perf-sched.wait_and_delay.count.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_gem_fb_vunmap.drm_atomic_helper_commit_planes
      4.00 ± 45%     -45.8%       2.17 ±104%  perf-sched.wait_and_delay.count.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.17 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.count.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
     79.67 ± 41%     -35.6%      51.33 ± 57%  perf-sched.wait_and_delay.count.devkmsg_read.vfs_read.ksys_read.do_syscall_64
     44.33 ±141%    +194.0%     130.33 ± 70%  perf-sched.wait_and_delay.count.devtmpfs_work_loop.devtmpfsd.kthread.ret_from_fork
      0.83 ±223%      +0.0%       0.83 ±223%  perf-sched.wait_and_delay.count.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      5.00 ±223%     -20.0%       4.00 ±142%  perf-sched.wait_and_delay.count.do_task_dead.do_exit.__x64_sys_exit.x64_sys_call.do_syscall_64
     24.33 ±108%      +8.2%      26.33 ± 82%  perf-sched.wait_and_delay.count.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
     43.00 ± 52%     -51.9%      20.67 ±105%  perf-sched.wait_and_delay.count.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      4.67 ±223%    +185.7%      13.33 ±142%  perf-sched.wait_and_delay.count.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
      0.00       +1.7e+101%       0.17 ±223%  perf-sched.wait_and_delay.count.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
      9.67 ±136%     -36.2%       6.17 ±202%  perf-sched.wait_and_delay.count.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
      0.33 ±141%     -50.0%       0.17 ±223%  perf-sched.wait_and_delay.count.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown].[unknown]
      4.83 ± 93%     -93.1%       0.33 ±223%  perf-sched.wait_and_delay.count.kthreadd.ret_from_fork.ret_from_fork_asm
      3.83 ± 88%     +13.0%       4.33 ± 77%  perf-sched.wait_and_delay.count.percpu_rwsem_wait.__percpu_down_read.cpus_read_lock.all_vm_events
      4.00 ± 14%     -37.5%       2.50 ± 60%  perf-sched.wait_and_delay.count.percpu_rwsem_wait.__percpu_down_read.cpus_read_lock.vmstat_shepherd
    377.00 ± 35%      -8.8%     343.67 ± 33%  perf-sched.wait_and_delay.count.pipe_read.vfs_read.ksys_read.do_syscall_64
      0.00       +1.8e+102%       1.83 ±223%  perf-sched.wait_and_delay.count.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
     12.83 ± 29%      +6.5%      13.67 ± 48%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      1621 ± 49%      +7.6%       1745 ± 32%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.do_select.core_sys_select.do_pselect.constprop
    641.83 ± 39%     +11.8%     717.50 ± 41%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
     36.33 ±  7%     +23.9%      45.00 ± 52%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.usleep_range_state.cpuhp_wait_for_sync_state.cpuhp_bringup_ap
    460.17 ±189%    -100.0%       0.00        perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.usleep_range_state.ipmi_thread.kthread
      0.33 ±141%    -100.0%       0.00        perf-sched.wait_and_delay.count.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.open_last_lookups
      2.83 ± 89%     +82.4%       5.17 ± 76%  perf-sched.wait_and_delay.count.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.walk_component
      3.00 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.count.schedule_timeout.__wait_for_common.__flush_work.work_on_cpu_key
      0.17 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.count.schedule_timeout.__wait_for_common.__synchronize_srcu._ipmi_destroy_user
     32.67 ±  5%     +50.0%      49.00 ±  3%  perf-sched.wait_and_delay.count.schedule_timeout.__wait_for_common.cpuhp_kick_ap_work._cpu_down
     13.17 ±100%     +62.0%      21.33 ±104%  perf-sched.wait_and_delay.count.schedule_timeout.__wait_for_common.wait_for_completion_state.__wait_rcu_gp
     16.67 ±155%     -19.0%      13.50 ±164%  perf-sched.wait_and_delay.count.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
     12.67 ± 30%      +1.3%      12.83 ± 50%  perf-sched.wait_and_delay.count.schedule_timeout.kcompactd.kthread.ret_from_fork
     20606 ± 16%      -3.8%      19825 ± 24%  perf-sched.wait_and_delay.count.schedule_timeout.msleep.online_store.kernfs_fop_write_iter
    359.17 ± 55%     +28.3%     460.67 ± 49%  perf-sched.wait_and_delay.count.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      2380 ± 15%     +22.7%       2920 ± 26%  perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      3.67 ±136%      -4.5%       3.50 ± 67%  perf-sched.wait_and_delay.count.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
    273.00 ±  8%      +0.4%     274.00 ± 21%  perf-sched.wait_and_delay.count.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.00       +1.7e+104%     166.69 ±223%  perf-sched.wait_and_delay.max.ms.__cond_resched.__alloc_pages_noprof.alloc_pages_mpol_noprof.get_free_pages_noprof.pgd_alloc
      0.00       +8.1e+102%       8.14 ±223%  perf-sched.wait_and_delay.max.ms.__cond_resched.__kmalloc_node_noprof.sched_setaffinity.__x64_sys_sched_setaffinity.do_syscall_64
      1513 ± 44%      -2.2%       1479 ± 35%  perf-sched.wait_and_delay.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      6638 ± 23%     -20.6%       5270 ± 58%  perf-sched.wait_and_delay.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.set_cpus_allowed_ptr
      0.00       +4.3e+104%     426.01 ±147%  perf-sched.wait_and_delay.max.ms.__cond_resched.do_select.core_sys_select.do_pselect.constprop
     20.51 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.dput.step_into.open_last_lookups.path_openat
      0.00         +7e+104%     700.33 ±223%  perf-sched.wait_and_delay.max.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
      0.00       +8.2e+102%       8.21 ±223%  perf-sched.wait_and_delay.max.ms.__cond_resched.kmem_cache_alloc_lru_noprof.shmem_alloc_inode.alloc_inode.new_inode
    164.77 ±100%     -66.3%      55.52 ±223%  perf-sched.wait_and_delay.max.ms.__cond_resched.mutex_lock.cpuhp_bringup_ap.cpuhp_invoke_callback.__cpuhp_invoke_callback_range
     53.25 ±223%   +2452.6%       1359 ±142%  perf-sched.wait_and_delay.max.ms.__cond_resched.mutex_lock.perf_poll.do_poll.constprop
     42.96 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.process_one_work.worker_thread.kthread.ret_from_fork
    495.00 ±152%     -90.0%      49.50 ±223%  perf-sched.wait_and_delay.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     54.94 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.task_work_run.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      5.75 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1625 ± 66%     -34.4%       1065 ± 64%  perf-sched.wait_and_delay.max.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_gem_fb_vunmap.drm_atomic_helper_commit_planes
      1186 ± 76%      -1.6%       1167 ±151%  perf-sched.wait_and_delay.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
     11.22 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      2555 ± 43%     -10.4%       2288 ± 51%  perf-sched.wait_and_delay.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
     43.07 ±141%    +101.6%      86.82 ± 84%  perf-sched.wait_and_delay.max.ms.devtmpfs_work_loop.devtmpfsd.kthread.ret_from_fork
    166.68 ±223%      +0.0%     166.68 ±223%  perf-sched.wait_and_delay.max.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
    177.20 ±223%    +323.2%     749.89 ±153%  perf-sched.wait_and_delay.max.ms.do_task_dead.do_exit.__x64_sys_exit.x64_sys_call.do_syscall_64
      1069 ±100%     +55.2%       1659 ± 90%  perf-sched.wait_and_delay.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
      2348 ± 53%     -28.6%       1676 ±102%  perf-sched.wait_and_delay.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
    518.68 ±223%     -21.3%     408.33 ±142%  perf-sched.wait_and_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
      0.00         +5e+104%     504.53 ±223%  perf-sched.wait_and_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
      1291 ±160%     -26.2%     952.69 ±193%  perf-sched.wait_and_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
    366.23 ±212%     -58.7%     151.14 ±223%  perf-sched.wait_and_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown].[unknown]
      1084 ± 66%     -48.0%     563.82 ±223%  perf-sched.wait_and_delay.max.ms.kthreadd.ret_from_fork.ret_from_fork_asm
      1549 ±100%     -56.7%     671.02 ± 70%  perf-sched.wait_and_delay.max.ms.percpu_rwsem_wait.__percpu_down_read.cpus_read_lock.all_vm_events
    317.72 ± 66%    +154.9%     809.86 ± 92%  perf-sched.wait_and_delay.max.ms.percpu_rwsem_wait.__percpu_down_read.cpus_read_lock.vmstat_shepherd
      4876 ± 32%     -34.4%       3198 ± 11%  perf-sched.wait_and_delay.max.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      0.00       +2.5e+104%     246.50 ±223%  perf-sched.wait_and_delay.max.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      4231 ± 43%     -71.8%       1194 ± 79%  perf-sched.wait_and_delay.max.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      7508 ± 13%      -3.1%       7276 ±  9%  perf-sched.wait_and_delay.max.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.do_pselect.constprop
      1056 ± 86%    +154.0%       2684 ± 24%  perf-sched.wait_and_delay.max.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      1510 ± 48%     -27.7%       1092 ± 68%  perf-sched.wait_and_delay.max.ms.schedule_hrtimeout_range_clock.usleep_range_state.cpuhp_wait_for_sync_state.cpuhp_bringup_ap
      9.95 ±217%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.schedule_hrtimeout_range_clock.usleep_range_state.ipmi_thread.kthread
     60.42 ±141%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.open_last_lookups
    129.80 ± 86%     -30.2%      90.59 ± 46%  perf-sched.wait_and_delay.max.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.walk_component
      9.12 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.schedule_timeout.__wait_for_common.__flush_work.work_on_cpu_key
      8.57 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.schedule_timeout.__wait_for_common.__synchronize_srcu._ipmi_destroy_user
    198.36 ± 35%      -1.0%     196.42 ± 98%  perf-sched.wait_and_delay.max.ms.schedule_timeout.__wait_for_common.cpuhp_kick_ap_work._cpu_down
    151.74 ±124%    +124.3%     340.35 ±116%  perf-sched.wait_and_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.__wait_rcu_gp
    836.55 ±145%     -20.1%     668.62 ±141%  perf-sched.wait_and_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      1535 ±146%     -72.3%     425.38 ± 44%  perf-sched.wait_and_delay.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      4744 ± 32%     -14.5%       4054 ± 35%  perf-sched.wait_and_delay.max.ms.schedule_timeout.msleep.online_store.kernfs_fop_write_iter
      2653 ± 41%     -36.1%       1694 ± 39%  perf-sched.wait_and_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      2350 ± 15%     +20.3%       2827 ± 34%  perf-sched.wait_and_delay.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      1632 ±124%     -10.6%       1459 ±122%  perf-sched.wait_and_delay.max.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      3071 ± 26%      -7.9%       2829 ± 15%  perf-sched.wait_and_delay.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.00       +1.7e+104%     166.69 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages_noprof.alloc_pages_mpol_noprof.get_free_pages_noprof.pgd_alloc
      2.59 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__kmalloc_cache_noprof.drm_atomic_state_alloc.drm_atomic_helper_dirtyfb.drm_fbdev_shmem_helper_fb_dirty
      0.00         +3e+100%       0.03 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.__kmalloc_node_noprof.__vmalloc_area_node.__vmalloc_node_range_noprof.alloc_thread_stack_node
      0.00       +8.1e+102%       8.14 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.__kmalloc_node_noprof.sched_setaffinity.__x64_sys_sched_setaffinity.do_syscall_64
      0.00       +1.2e+102%       1.16 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.__kmalloc_noprof.kernfs_fop_write_iter.vfs_write.ksys_write
     35.85 ± 16%     +18.7%      42.55 ± 19%  perf-sched.wait_time.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
    833.54 ± 19%     -18.3%     680.83 ± 62%  perf-sched.wait_time.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.set_cpus_allowed_ptr
      0.00 ±  8%   +1476.0%       0.07 ±205%  perf-sched.wait_time.avg.ms.__cond_resched.__wait_for_common.stop_machine_cpuslocked.takedown_cpu.cpuhp_invoke_callback
      0.00       +1.9e+104%     187.47 ±161%  perf-sched.wait_time.avg.ms.__cond_resched.do_select.core_sys_select.do_pselect.constprop
      5.79 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.dput.path_openat.do_filp_open.do_sys_openat2
      4.43 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.dput.path_put.vfs_statx.vfs_fstatat
     10.25 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.dput.step_into.open_last_lookups.path_openat
      0.00         +7e+104%     700.33 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
      0.00       +8.2e+102%       8.21 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_lru_noprof.shmem_alloc_inode.alloc_inode.new_inode
      0.00         +5e+101%       0.50 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_noprof.acpi_ut_create_generic_state.acpi_ps_push_scope.acpi_ps_parse_loop
      0.00       +7.2e+100%       0.07 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_noprof.prepare_creds.copy_creds.copy_process
      0.00       +1.2e+101%       0.12 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.migrate_pages_batch.migrate_pages.migrate_misplaced_folio.do_numa_page
     36.10 ± 38%     -34.7%      23.57 ± 32%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.cpuhp_bringup_ap.cpuhp_invoke_callback.__cpuhp_invoke_callback_range
      1.55 ±121%     -53.7%       0.72 ± 73%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.crash_handle_hotplug_event.crash_cpuhp_offline.cpuhp_invoke_callback
      0.00 ±186%  +15544.4%       0.70 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.lockup_detector_cleanup._cpu_down.__cpu_down_maps_locked
      1.97 ± 23%     -51.0%       0.97 ± 20%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.page_alloc_cpu_dead.cpuhp_invoke_callback.__cpuhp_invoke_callback_range
      0.48 ±222%     -99.4%       0.00 ±113%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.perf_event_exit_cpu_context.perf_event_exit_cpu.cpuhp_invoke_callback
     53.25 ±223%   +2452.6%       1359 ±142%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.perf_poll.do_poll.constprop
      0.01 ±  9%      +6.1%       0.01 ±  6%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.slub_cpu_dead.cpuhp_invoke_callback.__cpuhp_invoke_callback_range
     38.98 ±223%    -100.0%       0.01 ±188%  perf-sched.wait_time.avg.ms.__cond_resched.process_one_work.worker_thread.kthread.ret_from_fork
    248.97 ±152%     -79.6%      50.83 ±216%  perf-sched.wait_time.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
     27.47 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.task_work_run.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.46 ±223%     -32.5%       2.33 ±141%  perf-sched.wait_time.avg.ms.__cond_resched.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
    147.36 ± 49%      -8.2%     135.32 ± 50%  perf-sched.wait_time.avg.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_gem_fb_vunmap.drm_atomic_helper_commit_planes
    701.91 ± 45%     -30.3%     489.07 ±106%  perf-sched.wait_time.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
     11.22 ±223%     +53.2%      17.20 ±100%  perf-sched.wait_time.avg.ms.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
     52.13 ± 30%      +3.1%      53.77 ± 50%  perf-sched.wait_time.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
     38.60 ±  4%     -45.3%      21.12 ± 44%  perf-sched.wait_time.avg.ms.devtmpfs_work_loop.devtmpfsd.kthread.ret_from_fork
     90.42 ±160%     -49.2%      45.94 ±159%  perf-sched.wait_time.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
     17.07 ±223%    +385.5%      82.88 ±129%  perf-sched.wait_time.avg.ms.do_task_dead.do_exit.__x64_sys_exit.x64_sys_call.do_syscall_64
     52.72 ± 81%      +2.4%      53.99 ± 80%  perf-sched.wait_time.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
     41.79 ± 78%     -76.0%      10.01 ±163%  perf-sched.wait_time.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      0.07 ±141%    -100.0%       0.00        perf-sched.wait_time.avg.ms.ipmi_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.01 ±195%     -76.6%       0.00 ±141%  perf-sched.wait_time.avg.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
     20.74 ±140%      -9.4%      18.79 ± 74%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
      0.00       +1.2e+102%       1.17 ±223%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
     50.04 ±117%    +201.3%     150.78 ±204%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
    187.95 ±207%     -59.8%      75.57 ±223%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown].[unknown]
    310.41 ± 88%      -9.2%     281.91 ±223%  perf-sched.wait_time.avg.ms.kthreadd.ret_from_fork.ret_from_fork_asm
      1.51 ±222%    -100.0%       0.00        perf-sched.wait_time.avg.ms.percpu_down_write._cpu_down.__cpu_down_maps_locked.work_for_cpu_fn
    223.72 ±113%     +67.5%     374.81 ± 70%  perf-sched.wait_time.avg.ms.percpu_rwsem_wait.__percpu_down_read.cpus_read_lock.all_vm_events
    130.55 ± 56%    +196.6%     387.25 ± 98%  perf-sched.wait_time.avg.ms.percpu_rwsem_wait.__percpu_down_read.cpus_read_lock.vmstat_shepherd
    128.30 ± 47%     -21.7%     100.40 ± 21%  perf-sched.wait_time.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      7.71 ± 20%    +150.3%      19.29 ±123%  perf-sched.wait_time.avg.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
    543.09 ± 38%     -17.1%     450.12 ± 49%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
    125.02 ± 42%     +14.3%     142.85 ± 41%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.do_pselect.constprop
     41.99 ± 37%     -28.3%      30.13 ± 58%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
     71.79 ± 44%     -34.1%      47.30 ± 72%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.usleep_range_state.cpuhp_wait_for_sync_state.cpuhp_bringup_ap
      0.10 ±100%    -100.0%       0.00        perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.usleep_range_state.ipmi_thread.kthread
      1.13 ±223%    +203.6%       3.43 ±223%  perf-sched.wait_time.avg.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.online_show
     11.11 ± 11%     -46.0%       6.00 ± 71%  perf-sched.wait_time.avg.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.uevent_show
     14.80 ± 73%     -36.4%       9.41 ± 47%  perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.kernfs_dop_revalidate
      0.00 ±141%     -50.0%       0.00 ±223%  perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.kernfs_iop_getattr
      4.30 ±188%     -51.5%       2.08 ±101%  perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.kernfs_iop_lookup
     60.41 ±141%    -100.0%       0.00        perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.open_last_lookups
     79.33 ± 80%     -14.1%      68.13 ± 50%  perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.walk_component
      0.00        +4.8e+99%       0.00 ±141%  perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read_killable.lock_mm_and_find_vma
      6.41 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.schedule_timeout.___down_common.__down_timeout.down_timeout
      0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.__flush_work.__lru_add_drain_all
     38.79 ± 17%     -35.6%      24.97 ±  8%  perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.__flush_work.work_on_cpu_key
      8.57 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.__synchronize_srcu._ipmi_destroy_user
      0.02 ±223%     -93.3%       0.00 ±223%  perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr
     19.02 ± 22%     -53.9%       8.76 ± 18%  perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.cpuhp_bringup_ap.cpuhp_invoke_callback
     67.42 ±  8%     -15.5%      56.94 ± 13%  perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.cpuhp_kick_ap_work._cpu_down
      8.38 ± 71%     -32.9%       5.62 ± 45%  perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.devtmpfs_submit_req.devtmpfs_delete_node
     25.47 ±  4%     -33.9%      16.85 ±  2%  perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.kthread_park.takedown_cpu
      1.90 ± 51%     -29.5%       1.34 ± 13%  perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.stop_machine_cpuslocked.takedown_cpu
      5.80 ±166%    -100.0%       0.00        perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_killable.__kthread_create_on_node
     33.91 ± 29%      -7.2%      31.47 ± 31%  perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.__wait_rcu_gp
     12.95 ±105%     -83.2%       2.17 ± 63%  perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    487.85 ± 16%     -23.8%     371.51 ± 44%  perf-sched.wait_time.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.32 ±223%    +123.1%       0.72 ±172%  perf-sched.wait_time.avg.ms.schedule_timeout.khugepaged_wait_work.khugepaged.kthread
     14.32 ± 12%      +9.1%      15.62 ± 26%  perf-sched.wait_time.avg.ms.schedule_timeout.msleep.online_store.kernfs_fop_write_iter
     16.07 ± 85%      +6.6%      17.14 ±109%  perf-sched.wait_time.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
     61.53 ±  3%     -27.2%      44.78 ±  3%  perf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    229.67 ±127%     +27.8%     293.56 ±131%  perf-sched.wait_time.avg.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.00 ±152%    -100.0%       0.00        perf-sched.wait_time.avg.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
    349.24 ±  7%      +2.8%     359.01 ±  9%  perf-sched.wait_time.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.00       +1.7e+104%     166.69 ±223%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages_noprof.alloc_pages_mpol_noprof.get_free_pages_noprof.pgd_alloc
      2.59 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__kmalloc_cache_noprof.drm_atomic_state_alloc.drm_atomic_helper_dirtyfb.drm_fbdev_shmem_helper_fb_dirty
      0.00         +3e+100%       0.03 ±223%  perf-sched.wait_time.max.ms.__cond_resched.__kmalloc_node_noprof.__vmalloc_area_node.__vmalloc_node_range_noprof.alloc_thread_stack_node
      0.00       +8.1e+102%       8.14 ±223%  perf-sched.wait_time.max.ms.__cond_resched.__kmalloc_node_noprof.sched_setaffinity.__x64_sys_sched_setaffinity.do_syscall_64
      0.00       +1.2e+102%       1.16 ±223%  perf-sched.wait_time.max.ms.__cond_resched.__kmalloc_noprof.kernfs_fop_write_iter.vfs_write.ksys_write
      1076 ± 13%     +12.6%       1212 ± 25%  perf-sched.wait_time.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      3319 ± 23%     -20.6%       2635 ± 58%  perf-sched.wait_time.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.set_cpus_allowed_ptr
      0.01 ± 23%  +30756.1%       2.93 ±220%  perf-sched.wait_time.max.ms.__cond_resched.__wait_for_common.stop_machine_cpuslocked.takedown_cpu.cpuhp_invoke_callback
      0.00       +2.2e+104%     221.57 ±146%  perf-sched.wait_time.max.ms.__cond_resched.do_select.core_sys_select.do_pselect.constprop
      5.79 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.dput.path_openat.do_filp_open.do_sys_openat2
      4.43 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.dput.path_put.vfs_statx.vfs_fstatat
     20.51 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.dput.step_into.open_last_lookups.path_openat
      0.00         +7e+104%     700.33 ±223%  perf-sched.wait_time.max.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
      0.00       +8.2e+102%       8.21 ±223%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_lru_noprof.shmem_alloc_inode.alloc_inode.new_inode
      0.00         +5e+101%       0.50 ±223%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_noprof.acpi_ut_create_generic_state.acpi_ps_push_scope.acpi_ps_parse_loop
      0.00       +7.2e+100%       0.07 ±223%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_noprof.prepare_creds.copy_creds.copy_process
      0.00       +1.2e+101%       0.12 ±223%  perf-sched.wait_time.max.ms.__cond_resched.migrate_pages_batch.migrate_pages.migrate_misplaced_folio.do_numa_page
    139.44 ± 31%      -2.2%     136.41 ± 72%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.cpuhp_bringup_ap.cpuhp_invoke_callback.__cpuhp_invoke_callback_range
      4.44 ±170%     -80.3%       0.87 ± 70%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.crash_handle_hotplug_event.crash_cpuhp_offline.cpuhp_invoke_callback
      0.00 ±186%  +31177.8%       1.41 ±223%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.lockup_detector_cleanup._cpu_down.__cpu_down_maps_locked
     18.69 ± 46%     -53.5%       8.70 ± 70%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.page_alloc_cpu_dead.cpuhp_invoke_callback.__cpuhp_invoke_callback_range
      0.48 ±222%     -99.4%       0.00 ±108%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.perf_event_exit_cpu_context.perf_event_exit_cpu.cpuhp_invoke_callback
     53.25 ±223%   +2452.6%       1359 ±142%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.perf_poll.do_poll.constprop
      0.01 ± 24%     +48.7%       0.02 ± 35%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.slub_cpu_dead.cpuhp_invoke_callback.__cpuhp_invoke_callback_range
     38.98 ±223%    -100.0%       0.01 ±188%  perf-sched.wait_time.max.ms.__cond_resched.process_one_work.worker_thread.kthread.ret_from_fork
    494.99 ±152%     -89.5%      52.15 ±210%  perf-sched.wait_time.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
     27.47 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.task_work_run.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.46 ±223%     -32.4%       2.34 ±141%  perf-sched.wait_time.max.ms.__cond_resched.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1623 ± 66%     -26.2%       1197 ± 44%  perf-sched.wait_time.max.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_gem_fb_vunmap.drm_atomic_helper_commit_planes
      1009 ± 57%     -17.4%     834.02 ±128%  perf-sched.wait_time.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
     11.22 ±223%     +62.8%      18.28 ±100%  perf-sched.wait_time.max.ms.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
    963.98 ± 72%      -1.2%     952.82 ± 61%  perf-sched.wait_time.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
    137.01 ± 16%     -34.8%      89.33 ± 52%  perf-sched.wait_time.max.ms.devtmpfs_work_loop.devtmpfsd.kthread.ret_from_fork
    211.89 ±167%     -10.8%     189.07 ±192%  perf-sched.wait_time.max.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
    177.20 ±223%    +351.9%     800.79 ±140%  perf-sched.wait_time.max.ms.do_task_dead.do_exit.__x64_sys_exit.x64_sys_call.do_syscall_64
      1397 ± 58%     +19.5%       1670 ± 89%  perf-sched.wait_time.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
      1174 ± 58%     -57.1%     503.20 ±152%  perf-sched.wait_time.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      0.07 ±141%    -100.0%       0.00        perf-sched.wait_time.max.ms.ipmi_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.02 ±208%     -87.6%       0.00 ±141%  perf-sched.wait_time.max.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
    374.06 ±147%      +7.5%     402.07 ± 50%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
      0.00       +1.2e+102%       1.17 ±223%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
    651.25 ±158%     -13.4%     563.95 ±157%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
    187.95 ±207%     -59.8%      75.57 ±223%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown].[unknown]
    703.70 ± 81%     -19.9%     563.82 ±223%  perf-sched.wait_time.max.ms.kthreadd.ret_from_fork.ret_from_fork_asm
      3.01 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.percpu_down_write._cpu_down.__cpu_down_maps_locked.work_for_cpu_fn
    699.82 ±106%      -2.9%     679.18 ± 68%  perf-sched.wait_time.max.ms.percpu_rwsem_wait.__percpu_down_read.cpus_read_lock.all_vm_events
    314.55 ± 67%    +157.4%     809.59 ± 91%  perf-sched.wait_time.max.ms.percpu_rwsem_wait.__percpu_down_read.cpus_read_lock.vmstat_shepherd
      2701 ± 46%     -42.4%       1556 ± 30%  perf-sched.wait_time.max.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
     32.19 ±  4%    +828.3%     298.78 ± 95%  perf-sched.wait_time.max.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      3417 ± 36%     -65.0%       1194 ± 79%  perf-sched.wait_time.max.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      3766 ± 13%      -2.9%       3658 ±  9%  perf-sched.wait_time.max.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.do_pselect.constprop
    698.18 ± 55%     +98.3%       1384 ± 23%  perf-sched.wait_time.max.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
    798.94 ± 55%     -22.0%     622.93 ± 47%  perf-sched.wait_time.max.ms.schedule_hrtimeout_range_clock.usleep_range_state.cpuhp_wait_for_sync_state.cpuhp_bringup_ap
      5.15 ±209%    -100.0%       0.00        perf-sched.wait_time.max.ms.schedule_hrtimeout_range_clock.usleep_range_state.ipmi_thread.kthread
      1.13 ±223%    +203.6%       3.43 ±223%  perf-sched.wait_time.max.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.online_show
     43.73 ± 52%     -59.9%      17.54 ±104%  perf-sched.wait_time.max.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.uevent_show
     33.39 ± 70%     -39.2%      20.30 ± 47%  perf-sched.wait_time.max.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.kernfs_dop_revalidate
      0.00 ±141%     -50.0%       0.00 ±223%  perf-sched.wait_time.max.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.kernfs_iop_getattr
     11.64 ±148%     -20.0%       9.31 ±105%  perf-sched.wait_time.max.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.kernfs_iop_lookup
     60.41 ±141%    -100.0%       0.00        perf-sched.wait_time.max.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.open_last_lookups
    129.80 ± 86%     -30.2%      90.59 ± 46%  perf-sched.wait_time.max.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.walk_component
      0.00        +4.8e+99%       0.00 ±141%  perf-sched.wait_time.max.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read_killable.lock_mm_and_find_vma
      6.41 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.schedule_timeout.___down_common.__down_timeout.down_timeout
      0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.__flush_work.__lru_add_drain_all
     65.54 ± 14%     -41.3%      38.45 ±  4%  perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.__flush_work.work_on_cpu_key
      8.57 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.__synchronize_srcu._ipmi_destroy_user
      0.02 ±223%     -93.3%       0.00 ±223%  perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr
    134.94 ± 89%     -71.5%      38.45 ± 68%  perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.cpuhp_bringup_ap.cpuhp_invoke_callback
    190.34 ± 33%      +2.7%     195.56 ± 98%  perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.cpuhp_kick_ap_work._cpu_down
     28.04 ± 75%     -46.2%      15.07 ± 51%  perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.devtmpfs_submit_req.devtmpfs_delete_node
     54.42 ±  2%     -26.6%      39.96 ± 36%  perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.kthread_park.takedown_cpu
      8.92 ±119%     -57.5%       3.79 ±109%  perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.stop_machine_cpuslocked.takedown_cpu
      8.89 ±141%    -100.0%       0.00        perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_killable.__kthread_create_on_node
    145.16 ± 44%     +94.5%     282.28 ± 53%  perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.__wait_rcu_gp
    546.64 ±135%     -90.2%      53.59 ±119%  perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      1021 ±109%     -58.3%     425.38 ± 44%  perf-sched.wait_time.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.32 ±223%    +123.1%       0.72 ±172%  perf-sched.wait_time.max.ms.schedule_timeout.khugepaged_wait_work.khugepaged.kthread
      2376 ± 32%     -14.4%       2033 ± 35%  perf-sched.wait_time.max.ms.schedule_timeout.msleep.online_store.kernfs_fop_write_iter
      1072 ± 69%     -20.1%     857.37 ± 40%  perf-sched.wait_time.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      2346 ± 15%     +20.5%       2827 ± 34%  perf-sched.wait_time.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    823.63 ±122%     -10.4%     737.88 ±121%  perf-sched.wait_time.max.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.01 ±124%     -92.6%       0.00 ±223%  perf-sched.wait_time.max.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
      2774 ± 24%      +2.0%       2829 ± 15%  perf-sched.wait_time.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm


Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

