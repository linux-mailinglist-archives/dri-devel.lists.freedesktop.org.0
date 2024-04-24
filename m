Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA008AFE81
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 04:32:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 662AB10F562;
	Wed, 24 Apr 2024 02:32:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GnQN3WvR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5057A10E4BF;
 Wed, 24 Apr 2024 02:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713925971; x=1745461971;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=A2wC7w69mWoSCeTbpqMuOPvFUfW6wI38MGxD/pUYm9k=;
 b=GnQN3WvR+GrtP/LnuEcqbN6L1tlDGU6G9A3/ZsGntSlZDC30z7SI6aXC
 7ER3LFT01t9U1b1gUXRpUJZFHrTBMNdPZ6CkxOr5G/lJw6xEJ6N3BYv4E
 L3zE2HVEd/0S1DJXHsYBKdhca5miDpcAz3EFCRrRBB18eeHSH691yNwDz
 SfvWR2H8q+BuVLcZ3eIqGBp9FNXwGx7OWhGoZJn33hn1uqvlxO/d83zAy
 oLPa3xpy64yZ1d+CQGOBh520htJ3Yhgg1Me6BQBOsac3IBWjsGbkXppD6
 HMAw307ocmgGjq25Enh1HQJu9sbWGrE+SFGrNMTrQ7X2Q+eEHqtPSoC8l g==;
X-CSE-ConnectionGUID: 1Y0k0kFMTHaoDaL/07CfmA==
X-CSE-MsgGUID: 1MUdgTy3RKWrpBMhVj9afQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="10077406"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="10077406"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 19:32:14 -0700
X-CSE-ConnectionGUID: 2/9HcqHyTpqGr0Q28Y+PKg==
X-CSE-MsgGUID: ZR2PicKyRGapXBeGcweQFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="29202440"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Apr 2024 19:32:14 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 19:32:13 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 19:32:13 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 19:32:13 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Apr 2024 19:32:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VB8nqAj36XfN7SE056mMj8zcjhTKfg3SIOWmYSZ/omM4eAtMrYkdATqtPOwNq1YRs14q8gaTgsEOUjGbFfG54T3Obp4U9eFAEKdnxGmx/GjvqH38qQWxfX0+rTYRsjzq+jBxQCR6TuIkYjQdbOHAi0Sy6ok78OduEyAbkNDXLPyQeTelvIf9NsoNrEtB1wEt5DwUi/Fjr6lBuChof3Me1iFTDbUPOLlAOlDZinj4D/MUX9i5ouGiXdsqX63E7QYeiiyFIMt6p3YMypjUtWrXtrOR0pYhVoFaNFHoSNDn/ZKyfRxQeToBdDJG6p9jf3AU1Ttgh2HIa5zIp3VXmYv8FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PJERJFrkDl+NKdpn89or6VV0W9HOeVmK8NLyGqXXJjY=;
 b=SbTWT9ABM/QWOmdNcp4qqhK0QbZMrNTPY3E/EnzIbcSZDKfw1K4baif34uVw5CsVBxjVOFILBZvV0/+TZzcy0LNjQAokGMDo0KQDd9s+xsQ+1ZTAo/UA+Aowd9HgctPBLX7sv64LhtZizdN1QIvPg4gusT9VUMSVvLdAp9D9/Xwd2ePCNKzN4AIndCzIzkfXk7Dl+8ItVLNKg7H3AhJMy6cJgwZAipl1GjTVZVrJJDpMR+15OFCvIedaRUGlnuIZ3RAxXc43o/HCshmlyt7tCZGjSgcZqM6rwCoPNAwW3Ol6dkl4Evpt+I1DriIj1bcfT4xJ56S1RD1ZU1Yr5zfkHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7878.namprd11.prod.outlook.com (2603:10b6:8:f6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.49; Wed, 24 Apr
 2024 02:32:11 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7519.020; Wed, 24 Apr 2024
 02:32:10 +0000
Date: Wed, 24 Apr 2024 02:31:36 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: Jason Gunthorpe <jgg@nvidia.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Thomas.Hellstrom@linux.intel.com"
 <Thomas.Hellstrom@linux.intel.com>, "Welty, Brian" <brian.welty@intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Bommu,
 Krishnaiah" <krishnaiah.bommu@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>, Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH 06/23] drm/xe/svm: Introduce a helper to build sg table
 from hmm range
Message-ID: <ZihvCKYRRw1NzoNl@DUT025-TGLU.fm.intel.com>
References: <20240117221223.18540-1-oak.zeng@intel.com>
 <20240117221223.18540-7-oak.zeng@intel.com>
 <20240405003927.GA11940@nvidia.com>
 <SA1PR11MB6991E4CDCD61A5D1909BB4EF92032@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240405123725.GD5383@nvidia.com>
 <SA1PR11MB699170C0F6FFFA231985718092032@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240405180212.GG5383@nvidia.com>
 <SA1PR11MB6991A4BD0EDDDF051A9A2C5C92072@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240409172418.GA5383@nvidia.com>
 <SA1PR11MB6991EDB4351D99B4E76EBC2992112@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SA1PR11MB6991EDB4351D99B4E76EBC2992112@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY3PR04CA0019.namprd04.prod.outlook.com
 (2603:10b6:a03:217::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7878:EE_
X-MS-Office365-Filtering-Correlation-Id: fc0d7be3-38ab-43f2-a228-08dc6406bdf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/DgP9XIYPi7cgQOMAW4h7DnMqJ7o14bJGee4P1GaCbVO1I7pC6MjlzP+PWS/?=
 =?us-ascii?Q?lpS+lRKvyEEVnqp10O4bfSh8S2/fGfJVV8l039ocWgd01zvGOSKxZunMRLAk?=
 =?us-ascii?Q?TqJnivBosY86yl4cXZZDbXEY5yvEXdLr1hgjr+TPjwzaP+8xVQk7bhzrPMV1?=
 =?us-ascii?Q?aS4ldHhDiPmWV1zCpCxGtpAf3lVCTGv/QY10j1tpB/RuaKi/cGVAY+uGVovL?=
 =?us-ascii?Q?MWYDXio2wM2EWNuEHNXj7aOtSVAuN1tliqGIa0GMr/S66l0Fc2npZABEzmBx?=
 =?us-ascii?Q?r6A+yJe6HKpiqaljiacI0GTPdNqABbRBCs3gAeAzO/YkV/0TDxEr23iGcDp5?=
 =?us-ascii?Q?MzCrbbJtmztHq6wRCtdfjRapfWsctx7UUUlFnPJMvzV4Mq8Hbr5taEIcrZyC?=
 =?us-ascii?Q?1m8VAnom5IAiofPu71nR6DfGTflo7a5TCB4MugOcvj7S07ZOe762ZXPqUuEC?=
 =?us-ascii?Q?GXuYLoUdpDP8FmponYxII8QSFtJETEYNEZaSOSQoHsAcTZ3q+8m53EAwsrd7?=
 =?us-ascii?Q?0ZdYMd/E3xlCq/8Ny1Fzqr7BtTsNvdgvxaUrr/tGegr3AwJukDZmyJ9zEuz4?=
 =?us-ascii?Q?ESTWeluTWeQ3uxA/LkRpdm7c14/vNwh3/MX4Idqc5DW6CcCG2GdadTY7XkGp?=
 =?us-ascii?Q?1Cw9mKusH9l+YdzuR3AHJHpHhFt2pRHlBOl2Gh20NxLkg6bwetSgO75jrKFk?=
 =?us-ascii?Q?NGfUxtQ0T+9Ia7eZbG3ZKT0xIJFgRz6sgyjW7BLJ7lhGCs2+HcBIptDVOE20?=
 =?us-ascii?Q?fH+yQZlRfY6RwtYhQueH914+FQwImXUGdDxaBGWrfyYbnZ/tW5+LymZ70x9t?=
 =?us-ascii?Q?VuEGXMxOfzCzvzYhrf4/VYvEXnfcmdknQWoPQWl+MDEmT6PHOyXgY1KUuPkX?=
 =?us-ascii?Q?CN4hkNk3YAAtuutcAHhhy8GrK5yCyiNSegAPJzbaCqyoZHMaOSfs+E9Ij7H1?=
 =?us-ascii?Q?8XiCAVJTjUECWd8u7V/ul4lnXYMKLO2OF5MZvKd0Esl6PpIjI07w0ReVPCOx?=
 =?us-ascii?Q?pCytffpKElx7Kk4Oeq2+w+4jLwwcuNrKdBPwPTpT1ZSFWn8VM81K5YorME7S?=
 =?us-ascii?Q?5wodUGtpW7OBlg/IF1M3+GUdYnwpgKMxps3/se2Ieta9VqOJ189VBxddupcL?=
 =?us-ascii?Q?ozYRRAT56vy1O+v7WjNs02yaLsYmRUrWx1UTjheBFOkNQvmposG1reJCalMo?=
 =?us-ascii?Q?Y20cLJ6Yjm3ZvEx1U9OCkgK8UxB0qp7cJOnh1Tns0hx15ZFCkx+nywxe1pg?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w3ml/2mFghFWw+rvETLAN6teEsohxeFBuubrTq4dHUkIyU7Pzzf+SbIX9MTz?=
 =?us-ascii?Q?PH+6nDD2bnBuSaTkSFInwv/M0+ututfBFmm0MkUouNxGApz7JBeLJe5o0WQb?=
 =?us-ascii?Q?UVgwFBaJq6Nv/9ehX0buOeVK9VLO5RY3MR9SX+Zih5rRnyBGErl4bnPIoCmn?=
 =?us-ascii?Q?WvyTmVf2Lbpug6d4iTFksXWDpWFbSIXS2HqPQqX4238NSB6CHSXjpXRUgKK0?=
 =?us-ascii?Q?MAgUiOa5U4j70AO7naxyCsYIBIVgWNL9E9XqcW10vi8qK5KYhkdghU2Hj+AK?=
 =?us-ascii?Q?xGdF+kZ6RcQc8oCRvDkFa9Itb+KY9UBzFWXB2c5LcH//MCQRb4xTsiE7eVow?=
 =?us-ascii?Q?V0uWgQrdoFmE4WBc1BKshGKcq8S/fUC9+sEZ9C0Oz6gxUPFEv546mF1uvuOE?=
 =?us-ascii?Q?Q+9jSrl9n7nzoaBcVyOJhLho05n1MeYC6oGy8vm3axenvfDPGnCr15fGf6X8?=
 =?us-ascii?Q?1gqZk6zDrX87EJxbmkEka8NEao0r9zMp/LstMVpsx805KbQtG5tp6ntiKQda?=
 =?us-ascii?Q?v4LIyKhPZK+Eb1KgoH0qvTWa6CsUCZh1ETZ9mnmdphUeQ3VJcb0nEA0ZCjTA?=
 =?us-ascii?Q?5VPr65oNQrbExC4XGNUvDJ9+sxiwKZvkSKIuSBJmmUY7jw/OBTG/sDOebo45?=
 =?us-ascii?Q?HEzNyIexEJss23APg1t139uaqGBNtPRAf7MuoQHLHJhwEGWK3LWEfKMowTg7?=
 =?us-ascii?Q?+DEz/luHLLdGig87z0tWFFj2QsyS2MnqFHnAvKU640GTxtrHg/mqjaEptqGP?=
 =?us-ascii?Q?wmUhMgnG1jVElzgN7B5Cvh94eVQSs37HuheewsyDAuYXCvTxZpbEG4hCTbxC?=
 =?us-ascii?Q?lRZelqOPckyPnOHLgvKZQ13HdjJbAnYlGM6hOEkYhVYYEZcwYaU4g/x+dqiQ?=
 =?us-ascii?Q?Egpdh8/jmYHLIPfc8SBzC9KLsoxtu1T6Xqb8T9jghiVlqQzw120JpgPHJcuT?=
 =?us-ascii?Q?jasU0uA3m7WWgpjiFJEKN/jRFjJv+wTgptnLLQRcWn2TuPPrU6MIUEMlAPJZ?=
 =?us-ascii?Q?szB6+7TG+vUpg/pRD3rqCrcmXM9QWcjGtsnraVOC8HyBlPX3if/p+7N7lirb?=
 =?us-ascii?Q?aUYVK3YhRtu+F/WYr5se60CF/4JgOAKOxdDDwAJRlR4OyUSwdQEnGvdbg78u?=
 =?us-ascii?Q?+CNISWxeb7W+o/jXX521QgMDisr9CUzfKDwrez7RMIWE2kV8Zoi5expGYZnA?=
 =?us-ascii?Q?FajqnbdKAxpM2VEMpCYUSY6oDDnfT+KfE50pYOdVHKqEt3iclE3TV5XX2CfP?=
 =?us-ascii?Q?t6RwYpCSdDhafpigfncfvlp+bV1ImcXRHIExVW6e7irxqpQUdRAZRBuSCzvA?=
 =?us-ascii?Q?k8R3vUslIkX3fk0h1Ao6ghiKnOHP61+tlqXJ/y0DuQXca0oelxug24YZUkmH?=
 =?us-ascii?Q?okqX7QBZc6BNw/n4SDJca4d4YTTWNOiVQr0jDCcv0/Ec5IIFVhTqnd77vOJk?=
 =?us-ascii?Q?FJSIDQV0qdXF38B8bferB/QTYCMjt7qE3uLa3WZNibUpOkTCs6WG37lQW4i5?=
 =?us-ascii?Q?LBEcyc86wpawy+omtj7cpziNXF+ejDKEFeVFpxt7iAwUMFpfVkFJmyPDU8si?=
 =?us-ascii?Q?g+tDgD/4I6WxR26zX1YvuVFZQTazgToAwrOV1GM2/+1bs+9yzqNM9ST2CSAO?=
 =?us-ascii?Q?oQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc0d7be3-38ab-43f2-a228-08dc6406bdf7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 02:32:10.1037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yIltoFSBLzCrAcak7fsbsH7JGEJ0WxFMVnVm75zkg73hp6s4OTu4VamdmmpYLBm29q8RZ47BHjELA40/39u7xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7878
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

On Tue, Apr 23, 2024 at 03:17:03PM -0600, Zeng, Oak wrote:
> Hi Jason,
> 
> Sorry for a late reply. I have been working on a v2 of this series: https://patchwork.freedesktop.org/series/132229/. This version addressed some of your concerns, such as removing the global character device, removing svm process concept (need further clean up per Matt's feedback).
> 
> But the main concern you raised is not addressed yet. I need to further make sure I understand your concerns, See inline.
> 

A few extra comments with references below.

> 
> 
> > -----Original Message-----
> > From: Jason Gunthorpe <jgg@nvidia.com>
> > Sent: Tuesday, April 9, 2024 1:24 PM
> > To: Zeng, Oak <oak.zeng@intel.com>
> > Cc: dri-devel@lists.freedesktop.org; intel-xe@lists.freedesktop.org; Brost, Matthew
> > <matthew.brost@intel.com>; Thomas.Hellstrom@linux.intel.com; Welty, Brian
> > <brian.welty@intel.com>; Ghimiray, Himal Prasad
> > <himal.prasad.ghimiray@intel.com>; Bommu, Krishnaiah
> > <krishnaiah.bommu@intel.com>; Vishwanathapura, Niranjana
> > <niranjana.vishwanathapura@intel.com>; Leon Romanovsky <leon@kernel.org>
> > Subject: Re: [PATCH 06/23] drm/xe/svm: Introduce a helper to build sg table from
> > hmm range
> > 
> > On Tue, Apr 09, 2024 at 04:45:22PM +0000, Zeng, Oak wrote:
> > 
> > > > I saw, I am saying this should not be done. You cannot unmap bits of
> > > > a sgl mapping if an invalidation comes in.
> > >
> > > You are right, if we register a huge mmu interval notifier to cover
> > > the whole address space, then we should use dma map/unmap pages to
> > > map bits of the address space. We will explore this approach.
> > >
> > > Right now, in xe driver, mmu interval notifier is dynamically
> > > registered with small address range. We map/unmap the whole small
> > > address ranges each time. So functionally it still works. But it
> > > might not be as performant as the method you said.
> > 
> > Please don't do this, it is not how hmm_range_fault() should be
> > used.
> > 
> > It is intended to be page by page and there is no API surface
> > available to safely try to construct covering ranges. Drivers
> > definately should not try to invent such a thing.
>
> I need your help to understand this comment. Our gpu mirrors the whole CPU virtual address space. It is the first design pattern in your previous reply (entire exclusive owner of a single device private page table and fully mirrors the mm page table into the device table.) 
> 
> What do you mean by "page by page"/" no API surface available to safely try to construct covering ranges"? As I understand it, hmm_range_fault take a virtual address range (defined in hmm_range struct), and walk cpu page table in this range. It is a range based API.
> 
> From your previous reply ("So I find it a quite strange that this RFC is creating VMA's, notifiers and ranges on the fly "), it seems you are concerning why we are creating vma and register mmu interval notifier on the fly. Let me try to explain it. Xe_vma is a very fundamental concept in xe driver. The gpu page table update, invalidation are all vma-based. This concept exists before this svm work. For svm, we create a 2M (the size is user configurable) vma during gpu page fault handler and register this 2M range to mmu interval notifier.
> 
> Now I try to figure out if we don't create vma, what can we do? We can map one page (which contains the gpu fault address) to gpu page table. But that doesn't work for us because the GPU cache and TLB would not be performant for 4K page each time. One way to think of the vma is a chunk size which is good for GPU HW performance.
> 
> And the mmu notifier... if we don't register the mmu notifier on the fly, do we register one mmu notifier to cover the whole CPU virtual address space (which would be huge, e.g., 0~2^56 on a 57 bit machine, if we have half half user space kernel space split)? That won't be performant as well because for any address range that is unmapped from cpu program, but even if they are never touched by GPU, gpu driver still got a invalidation callback. In our approach, we only register a mmu notifier for address range that we know gpu would touch it. 
>

AMD seems to register notifiers on demand for parts of the address space
[1], I think Nvidia's open source driver does this too (can look this up
if needed). We (Intel) also do this in Xe and the i915 for userptrs
(explictly binding a user address via IOCTL) too and it seems to work
quite well.

[1] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c#L130
 
> > 
> > > > Please don't use sg list at all for this.
> > >
> > > As explained, we use sg list for device private pages so we can
> > > re-used the gpu page table update codes.
> > 
> > I'm asking you not to use SGL lists for that too. SGL lists are not
> > generic data structures to hold DMA lists.
> 
> Matt mentioned to use drm_buddy_block. I will see how that works out.
> 

Probably actually build a iterator (xe_res_cursor) for the device pages
returned from hmm_range_fault now that I think about this more.

> > 
> > > > This is not what I'm talking about. The GPU VMA is bound to a specific
> > > > MM VA, it should not be created on demand.
> > >
> > > Today we have two places where we create gpu vma: 1) create gpu vma
> > > during a vm_bind ioctl 2) create gpu vma during a page fault of the
> > > system allocator range (this will be in v2 of this series).
> > 
> > Don't do 2.

You have to create something, actually 2 things, on a GPU page fault.
Something to track the page table state and something to track VRAM
memory allocation. Both AMD and Nvidia's open source driver do this.

In AMD's driver the page table state is svm_range [2] and VRAM state is
svm_range_bo [3]. 

Nvidia's open source driver also does something similar (again can track
down a ref if needed).

Conceptually Xe will do something similiar, these are trending towards
an xe_vma and xe_bo respectfully, TBD on exact details but concept is
solid.

[2] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/amd/amdkfd/kfd_svm.h#L109
[3] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/amd/amdkfd/kfd_svm.h#L42 

> 
> As said, we will try the approach of one gigantic gpu vma with N page table states. We will create page table states in page fault handling. But this is only planned for stage 2. 
> 
> > 
> > > I suspect something dynamic is still necessary, either a vma or a
> > > page table state (1 vma but many page table state created
> > > dynamically, as planned in our stage 2).
> > 
> > I'm expecting you'd populate the page table memory on demand.
> 
> We do populate gpu page table on demand. When gpu access a virtual address, we populate the gpu page table.
> 
> 
> > 
> > > The reason is, we still need some gpu corresponding structure to
> > > match the cpu vm_area_struct.
> > 
> > Definately not.
> 
> See explanation above.
> 

Agree GPU doesn't need to match vm_area_struct but the allocation must
be subset (or equal) to a vm_area_struct. Again other driver do this
too.

e.g. You can't allocate a 2MB chunk if the vma_area_struct looked up is
only 64k.

> > 
> > > For example, when gpu page fault happens, you look
> > > up the cpu vm_area_struct for the fault address and create a
> > > corresponding state/struct. And people can have as many cpu
> > > vm_area_struct as they want.
> > 
> > No you don't.

Yes you do. See below.

> 
> See explains above. I need your help to understand how we can do it without a vma (or chunk). One thing GPU driver is different from RDMA driver is, RDMA doesn't have device private memory so no migration. It only need to dma-map the system memory pages and use them to fill RDMA page table. so RDMA don't need another memory manager such as our buddy. RDMA only deal with system memory which is completely struct page based management. Page by page make 100 % sense for RDMA. 
> 
> But for gpu, we need a way to use device local memory efficiently. This is the main reason we have vma/chunk concept.
> 
> Thanks,
> Oak
> 
> 
> > 
> > You call hmm_range_fault() and it does everything for you. A driver
> > should never touch CPU VMAs and must not be aware of them in any away.
> > 

struct vm_area_struct is an argument to the migrate_vma* functions [4], so
yes drivers need to be aware of CPU VMAs.

Again AMD [5], Nouveau [6] , and Nvidia's open source driver (again no
ref, but can dig one up) all lookup CPU VMAs on a GPU page fault or SVM
bind IOCTL.

[4] https://elixir.bootlin.com/linux/latest/source/include/linux/migrate.h#L186
[5] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c#L522
[6] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/nouveau/nouveau_svm.c#L182

Matt

> > Jason
