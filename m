Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOFFK9UBpmmfIwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 22:32:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 145981E32F3
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 22:32:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51CA910E5D8;
	Mon,  2 Mar 2026 21:32:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QkBaKMi+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9CAB10E5D6;
 Mon,  2 Mar 2026 21:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772487123; x=1804023123;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=qPYSsf3dYUgHJlBQrwvDdhjAVGG37EoKFBHmDGDSC3o=;
 b=QkBaKMi+MoIwE3aWZWLeIaOmcssEyVH0s660b51k8WcvbocXL4yTSRgD
 zkyHlWLe3a+lSpCR5W4H1sWE6DCMkX8A2AF2i6gsKCR09yciSz7+vjfV6
 XaWBpIjmXnzdW0RgxkFV0/ULjnBtJTewdB3T0uC2UztJzo5jfsb9VpZl4
 Jper2iTBit1FGMZN44wtNSzGpNlPvEMhYZwZkcskdsFdF1DElh4v/YYu+
 0o7ldybYf5PVW851aGxGGE7onzhnGwjNlJXalP7uKkDkwzLFPPOSk7Igy
 iwy6U31qRBPDMSz49dCXDfcFejd1cxDqJRgOR+ChxwnalBZTG0JzJ5TV/ g==;
X-CSE-ConnectionGUID: hkHQn0euT3WP0ikSIUGugA==
X-CSE-MsgGUID: mBIcqId+Ta60/cCuu3fyFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73378436"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="73378436"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 13:32:02 -0800
X-CSE-ConnectionGUID: exMNqqJRQnKsfTcs/EqxLQ==
X-CSE-MsgGUID: 0R5ctQmrRL2bUmg+G3jPVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="215744091"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 13:32:00 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 13:31:59 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 2 Mar 2026 13:31:59 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.36) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 13:31:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pt7ajccWLrp8LFXtNj1SN86mUcNnoc1m/lJimH2xpCDKIEth33yVX1GxH9UTbGi6DtQAOMOOOMcyfhlj5LWyuiJzFeZmUma7bPdYKQFVLSZhsFOAbHvqvFDGux7CqRTsU6ovuN9sOMRgo08zUOOQwmTWPgMFxaVTTVQ6Y838mOLv4Smqxp3U7ySNQAueRj28Saicj1nNpfDhomz6+x40yo+Y46/8ZENlK23ReSZzDXebwxxPQT91PU2bdwhMEx4cncjdDUMmOnMl8vDy6Z7BgwFKJQnF44n7L9jLafo6rwe8mZHMjQDptpm2Wwgk7s2mr/ujjRrTYTubmup7DRDTxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ssbz4OydPa2rgLE04ZByp7FympIyySzNm2vZ3cKSsU4=;
 b=dl+lrH2HO6DyPDweevZJKyDmORwX+aXy1B+UL4iPKM8ZZADdxuuKS7ZEdjLJPhuAcAdw+Mk5S8aSXgWzmear/4A/yBkLJr3ycXeAfVJLSJB3BlBNWvlrOwewuIv3uip5mhkoehs+oNSc9NC6rEdXMq8iTTau6vZxGz1oEdAE3KnrX3/Tj7bxBcz7WPd+UDT5A9ky7AULYQZGPFG+6apDiItfxH++H9DJWoVY3c0TD6aQx3erUXydMAK+iJsEovOu7zLfPO4OJFNCHm04ydq/VlKdRUffHgC/mTzsOgpVpAdMYPaP/BqUkx2MhK0LlLWAIiIYpZnIakO4GZWQ5Q0XcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN2PR11MB4726.namprd11.prod.outlook.com (2603:10b6:208:269::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 21:31:57 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 21:31:57 +0000
Date: Mon, 2 Mar 2026 13:31:54 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>, "Jason
 Gunthorpe" <jgg@ziepe.ca>, Andrew Morton <akpm@linux-foundation.org>, "Simona
 Vetter" <simona.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>, "Alistair
 Popple" <apopple@nvidia.com>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/4] drm/xe: Split TLB invalidation into submit and
 wait steps
Message-ID: <aaYBykFBmhxj1Pl1@lstrano-desk.jf.intel.com>
References: <20260302163248.105454-1-thomas.hellstrom@linux.intel.com>
 <20260302163248.105454-4-thomas.hellstrom@linux.intel.com>
 <aaXfzrTSvRpiX8An@lstrano-desk.jf.intel.com>
 <d7a0cd033766d2fae1a62e35f5abcd7d701b7c80.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d7a0cd033766d2fae1a62e35f5abcd7d701b7c80.camel@linux.intel.com>
X-ClientProxiedBy: MW4P222CA0008.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN2PR11MB4726:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f1db186-349f-498f-e5b7-08de78a32193
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: dsSJ6+MNDvdjSzcC/M8bOlw/ZOetH6jfvKj/g+7Yl5N/0t8niu7Oz9UO/GBDtZqIi46s52XuAwCnnwry+qKSIgkONZ3PB9KAYlItJyuvooNJOgbb8jnFRLQlTB8Hyl4Rg3Q3KtRw5+DVbElkS4kjLNtmVPqo+6YQJsLL8ngq0FFUz+MKul8Nhta2BMdTSlBXgVqdaE0gdXFQBhK1cE2dJv2yWlVmnA43+NK69fLZmeyxGnOIORbFwsI0R4rTHqUBzhcl/D29Wo5fj76K2ssjYHkR9izp7VCpfhpw+9jgtvLyk6u3xUFNi7ihAxC4wKs0b9HYnNThtggPcN43deHxidZfmxyCsvPk9iL0w/bkDMWJD97Y830pRU3e46EcwKc+U9TpQkqYOxEopsbJDbQukyYEbi2LydLxmYa9tvysxtpJf9bgDWDV5SRsv3EQR2W6vN6vpWtyUymiGWrKaJ8BoNYFsiUkZ0U91dZFrCSSU9qdpStC5CSFexH+W2uH3dHqqsGWgsXkko5bnec1sjj1Q1KmKIQMY/65TBLnt0I5gxOaviiXSXmlvsif+QeWjnN8iWlqpQ4YG8ox4L5P2aj7I8IhM+J7c2A2pOkhUpj4rzjKnnA7od2NgO4nv/BqE5a7/Za+ijmFc94vSNgdAtjlCX471FEjUtXXDTvx/yixgwy1q0spVn2cKBLJUvxTf/EnMBcPXyelTYmjif5xZ8ZpUWlizpE88GF8UqP/uJ8BJxk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?D4b3cowHvwdxlduM+NBoMwTYipc6HUrIZFVgGnXL6kRbMQxB+6cgKrATvJ?=
 =?iso-8859-1?Q?bcCQa0rcH6kuHNsoh/BxVDfqkdHCLQO9NrvD9WD4uhRxH3DIgj435Q652c?=
 =?iso-8859-1?Q?Pg9NyrlC3ody/Vshpq/ZXsWHAxc4FULuqjuKlj/FZdVjOx4r5kXewhbodC?=
 =?iso-8859-1?Q?DNp7FFLKI3oZWaE3oNGao0+Q2HLT2G/SJXdvgt6ouifSDZsAFaIvjsTsnO?=
 =?iso-8859-1?Q?TGXIoBVc6Hn/zRivrKzXsFHgcpRetWq5fFrIQ85qCYjFctrBkQiELNeE5/?=
 =?iso-8859-1?Q?3WHd4QWW6Doydh26sPrwYF4PtjyKuFfSA/dqdkSpnQF0IsRxACJkspaOvn?=
 =?iso-8859-1?Q?JiiaxtbSJYI1Hmg9MhSVeZwrY33NbjIQt7DgSDSocgUfk9IxqdzjXdKu0T?=
 =?iso-8859-1?Q?4HfKx5UWUw3+2fLFxwFKLlU1x5l68QDoYN/dsg/Io0qlG83FVgOHpU3NFS?=
 =?iso-8859-1?Q?Hl3bxtZcE76BprXKmxfnfnnH0GHRTn/lptt8k/FXZdqDwqrcF90+rDq0Dr?=
 =?iso-8859-1?Q?mb3omWcSU2R6jVLnKczFhdmWRhUtHhEeXnwpzwBuapRzwuKWEuYvaJvksK?=
 =?iso-8859-1?Q?U5pA68jTJXhWl6b+SizzmlG2k9kn7ueNb/y3zRGbv5R0LvpZtRue/J68zk?=
 =?iso-8859-1?Q?yx8mbYy/t6b/PSZY7S3CNIH6YbCNpdbNd/ZdkhWQTyRACI71Z1nu4NKaMD?=
 =?iso-8859-1?Q?Cof2drGq3h3MA4xS+Jz4hp0yz0MYf+gKcBP/dIhrGsJEU09OzqHVYcYm+w?=
 =?iso-8859-1?Q?QGQStotRCgK8gR7ByltmiSZuiQmVmSPcEi6NBrfnQbAHID/tearYVdE4qf?=
 =?iso-8859-1?Q?yrHxnNbyp6V/t4EROd7XC6f6B4N6CsWj2V8jJLll7R5oE6bGazLKUoClCR?=
 =?iso-8859-1?Q?b1PtnSvqvM/dIYf3iFh5g3J2BT7Ev0+1t0rLGrmox3zg26LgntpfOJUyfE?=
 =?iso-8859-1?Q?SmPu6XG4a9x78rPFzOo+LIoH2kYXkG12QTwKbiFlb7dlPCjBb0G67eA1ws?=
 =?iso-8859-1?Q?bRRva6aPz2gl4lrUDGI5g8tEwkoqSSzGc5RF2413NOEB9Qscde9Rrv9Aph?=
 =?iso-8859-1?Q?hyJH+o4y3RmOIa1ztpMrpNgYDvD9Tw8D/jyFwlVrxkd03RUw7V6gc+V7uL?=
 =?iso-8859-1?Q?pxvwHcvKpDK19tO0w+mlsPiDlqGgxUFKfVHdWQTSnscWVTVk+JiUVFQvzU?=
 =?iso-8859-1?Q?14C9WAFcYd9PE0LyQEviROlQ8IMKRch2rA51RM/AOVlm7cYy4foKDxUVdK?=
 =?iso-8859-1?Q?lFICxlwEDBmTT/9O4BLGMiuPeouLWfnDtSeBqDQgtjO/g35E6sG7Rcp5hP?=
 =?iso-8859-1?Q?uGap5bgIR/poD6IaD7eP1NMwKJySgc22xmjwKk5pfEMMijxZWzoUDW2pbc?=
 =?iso-8859-1?Q?GT1sD8lG9ljAswAAhysSs0BnQMmR0A/oKZUZFqQY50NF+fjcL/Xm3kL7Ey?=
 =?iso-8859-1?Q?bPfkIHCVW80NmjpK0mylSFS2io1mQt7RCLYmsm8SZD2nv/m9znwJGj8E12?=
 =?iso-8859-1?Q?zLOMDxEodi20SlmnjeGuO8y0WniAnKyPCTxDJRTwZlT0cUSosRZsKnJ2kc?=
 =?iso-8859-1?Q?1mRk47K7LYE3YAqTPTJAWsSkpeHSupgbqBmwcxUw7n0GNzFeDFpEA+yiRw?=
 =?iso-8859-1?Q?LHpLlLrvjWPUGl9/W31+Z10qAEFrONj70UcMq00p22Y1UTkE/LqsYkt3Dt?=
 =?iso-8859-1?Q?k5b6CqetoLvxOAurDuLWyyBwhb9PmWojXrzP9X0TXi4Jcy9jcBXDZo0gp3?=
 =?iso-8859-1?Q?B5b6Fc4EP8Rq49R9vBFxHYX6b3EsRonTe218LplbLi7zscsjxwsriWHf4e?=
 =?iso-8859-1?Q?COkzDm8Ts3MizeEmLeA/WF3qsXuEgo0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f1db186-349f-498f-e5b7-08de78a32193
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 21:31:57.2903 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Navmfph2VP4rBTM1V7iOQ0go+bFzeoQkeHGhu6b/Juv8syXbREWY9i2w2jXq8San4nBA/sOtI6PWOrSPCVCWrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4726
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
X-Rspamd-Queue-Id: 145981E32F3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,amd.com,ziepe.ca,linux-foundation.org,ffwll.ch,gmail.com,nvidia.com,kvack.org,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lstrano-desk.jf.intel.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,intel.com:dkim,intel.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 10:29:22PM +0100, Thomas Hellström wrote:
> On Mon, 2026-03-02 at 11:06 -0800, Matthew Brost wrote:
> > On Mon, Mar 02, 2026 at 05:32:47PM +0100, Thomas Hellström wrote:
> > > xe_vm_range_tilemask_tlb_inval() submits TLB invalidation requests
> > > to
> > > all GTs in a tile mask and then immediately waits for them to
> > > complete
> > > before returning. This is fine for the existing callers, but a
> > > subsequent patch will need to defer the wait in order to overlap
> > > TLB
> > > invalidations across multiple VMAs.
> > > 
> > > Introduce xe_tlb_inval_range_tilemask_submit() and
> > > xe_tlb_inval_batch_wait() in xe_tlb_inval.c as the submit and wait
> > > halves respectively. The batch of fences is carried in the new
> > > xe_tlb_inval_batch structure. Remove
> > > xe_vm_range_tilemask_tlb_inval()
> > > and convert all three call sites to the new API.
> > > 
> > 
> > Mostly nits...
> > 
> > > Assisted-by: GitHub Copilot:claude-sonnet-4.6
> > > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_svm.c             |  6 +-
> > >  drivers/gpu/drm/xe/xe_tlb_inval.c       | 82
> > > +++++++++++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_tlb_inval.h       |  6 ++
> > >  drivers/gpu/drm/xe/xe_tlb_inval_types.h | 14 +++++
> > >  drivers/gpu/drm/xe/xe_vm.c              | 69 +++------------------
> > >  drivers/gpu/drm/xe/xe_vm.h              |  3 -
> > >  drivers/gpu/drm/xe/xe_vm_madvise.c      |  9 ++-
> > >  drivers/gpu/drm/xe/xe_vm_types.h        |  1 +
> > >  8 files changed, 123 insertions(+), 67 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > > b/drivers/gpu/drm/xe/xe_svm.c
> > > index 002b6c22ad3f..6ea4972c2791 100644
> > > --- a/drivers/gpu/drm/xe/xe_svm.c
> > > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > > @@ -19,6 +19,7 @@
> > >  #include "xe_pt.h"
> > >  #include "xe_svm.h"
> > >  #include "xe_tile.h"
> > > +#include "xe_tlb_inval.h"
> > >  #include "xe_ttm_vram_mgr.h"
> > >  #include "xe_vm.h"
> > >  #include "xe_vm_types.h"
> > > @@ -225,6 +226,7 @@ static void xe_svm_invalidate(struct drm_gpusvm
> > > *gpusvm,
> > >  			      const struct mmu_notifier_range
> > > *mmu_range)
> > >  {
> > >  	struct xe_vm *vm = gpusvm_to_vm(gpusvm);
> > > +	struct xe_tlb_inval_batch _batch;
> > >  	struct xe_device *xe = vm->xe;
> > >  	struct drm_gpusvm_range *r, *first;
> > >  	struct xe_tile *tile;
> > > @@ -276,7 +278,9 @@ static void xe_svm_invalidate(struct drm_gpusvm
> > > *gpusvm,
> > >  
> > >  	xe_device_wmb(xe);
> > >  
> > > -	err = xe_vm_range_tilemask_tlb_inval(vm, adj_start,
> > > adj_end, tile_mask);
> > > +	err = xe_tlb_inval_range_tilemask_submit(xe, vm->usm.asid,
> > > adj_start, adj_end,
> > > +						 tile_mask,
> > > &_batch);
> > > +	xe_tlb_inval_batch_wait(&_batch);
> > 
> > No need to call wait on an error but it is harmless.
> > 
> > So you could write it like this:
> > 
> > if (!WARN_ON_ONCE(err))
> > 	xe_tlb_inval_batch_wait(&_batch);
> 
> Sure.
> 
> > 
> > >  	WARN_ON_ONCE(err);
> > >  
> > >  range_notifier_event_end:
> > > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c
> > > b/drivers/gpu/drm/xe/xe_tlb_inval.c
> > > index 933f30fb617d..343e37cfe715 100644
> > > --- a/drivers/gpu/drm/xe/xe_tlb_inval.c
> > > +++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
> > > @@ -486,3 +486,85 @@ bool xe_tlb_inval_idle(struct xe_tlb_inval
> > > *tlb_inval)
> > >  	guard(spinlock_irq)(&tlb_inval->pending_lock);
> > >  	return list_is_singular(&tlb_inval->pending_fences);
> > >  }
> > > +
> > > +/**
> > > + * xe_tlb_inval_batch_wait() - Wait for all fences in a TLB
> > > invalidation batch
> > > + * @batch: Batch of TLB invalidation fences to wait on
> > > + *
> > > + * Waits for every fence in @batch to signal, then resets @batch
> > > so it can be
> > > + * reused for a subsequent invalidation.
> > > + */
> > > +void xe_tlb_inval_batch_wait(struct xe_tlb_inval_batch *batch)
> > > +{
> > > +	struct xe_tlb_inval_fence *fence = &batch->fence[0];
> > 
> > Would this be better:
> > 
> > s/&batch->fence[0]/batch->fence
> > 
> > Personal preference I guess.
> 
> Yeah, I typically use the former to make it easier for
> the reader to remember we're pointing to the first element of an array.
> 

Ok, fine with this. I know I have done it both ways more than once.

> > 
> > > +	unsigned int i;
> > > +
> > > +	for (i = 0; i < batch->num_fences; ++i)
> > > +		xe_tlb_inval_fence_wait(fence++);
> > > +
> > > +	batch->num_fences = 0;
> > > +}
> > > +
> > > +/**
> > > + * xe_tlb_inval_range_tilemask_submit() - Submit TLB invalidations
> > > for an
> > > + * address range on a tile mask
> > > + * @xe: The xe device
> > > + * @asid: Address space ID
> > > + * @start: start address
> > > + * @end: end address
> > > + * @tile_mask: mask for which gt's issue tlb invalidation
> > > + * @batch: Batch of tlb invalidate fences
> > > + *
> > > + * Issue a range based TLB invalidation for gt's in tilemask
> > > + *
> > 
> > Mention no need to wait on batch if this function returns an error?
> 
> Sure.
> 
> > 
> > > + * Returns 0 for success, negative error code otherwise.
> > > + */
> > > +int xe_tlb_inval_range_tilemask_submit(struct xe_device *xe, u32
> > > asid,
> > > +				       u64 start, u64 end, u8
> > > tile_mask,
> > > +				       struct xe_tlb_inval_batch
> > > *batch)
> > > +{
> > > +	struct xe_tlb_inval_fence *fence = &batch->fence[0];
> > > +	struct xe_tile *tile;
> > > +	u32 fence_id = 0;
> > > +	u8 id;
> > > +	int err;
> > > +
> > > +	batch->num_fences = 0;
> > > +	if (!tile_mask)
> > > +		return 0;
> > > +
> > > +	for_each_tile(tile, xe, id) {
> > > +		if (!(tile_mask & BIT(id)))
> > > +			continue;
> > > +
> > > +		xe_tlb_inval_fence_init(&tile->primary_gt-
> > > >tlb_inval,
> > > +					&fence[fence_id], true);
> > > +
> > > +		err = xe_tlb_inval_range(&tile->primary_gt-
> > > >tlb_inval,
> > > +					 &fence[fence_id], start,
> > > end,
> > > +					 asid, NULL);
> > > +		if (err)
> > > +			goto wait;
> > > +		++fence_id;
> > > +
> > > +		if (!tile->media_gt)
> > > +			continue;
> > > +
> > > +		xe_tlb_inval_fence_init(&tile->media_gt-
> > > >tlb_inval,
> > > +					&fence[fence_id], true);
> > > +
> > > +		err = xe_tlb_inval_range(&tile->media_gt-
> > > >tlb_inval,
> > > +					 &fence[fence_id], start,
> > > end,
> > > +					 asid, NULL);
> > > +		if (err)
> > > +			goto wait;
> > > +		++fence_id;
> > > +	}
> > > +
> > > +wait:
> > > +	batch->num_fences = fence_id;
> > 
> > Should 'batch->num_fences' only get set on success?
> 
> We need it for the error wait below, after which it gets cleared.
> 

Right, bad suggestion.

Matt

> > 
> > > +	if (err)
> > > +		xe_tlb_inval_batch_wait(batch);
> > > +
> > > +	return err;
> > > +}
> > > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.h
> > > b/drivers/gpu/drm/xe/xe_tlb_inval.h
> > > index 62089254fa23..a76b7823a5f2 100644
> > > --- a/drivers/gpu/drm/xe/xe_tlb_inval.h
> > > +++ b/drivers/gpu/drm/xe/xe_tlb_inval.h
> > > @@ -45,4 +45,10 @@ void xe_tlb_inval_done_handler(struct
> > > xe_tlb_inval *tlb_inval, int seqno);
> > >  
> > >  bool xe_tlb_inval_idle(struct xe_tlb_inval *tlb_inval);
> > >  
> > > +int xe_tlb_inval_range_tilemask_submit(struct xe_device *xe, u32
> > > asid,
> > > +				       u64 start, u64 end, u8
> > > tile_mask,
> > > +				       struct xe_tlb_inval_batch
> > > *batch);
> > > +
> > > +void xe_tlb_inval_batch_wait(struct xe_tlb_inval_batch *batch);
> > > +
> > >  #endif	/* _XE_TLB_INVAL_ */
> > > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> > > b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> > > index 3b089f90f002..3d1797d186fd 100644
> > > --- a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> > > @@ -9,6 +9,8 @@
> > >  #include <linux/workqueue.h>
> > >  #include <linux/dma-fence.h>
> > >  
> > > +#include "xe_device_types.h"
> > > +
> > >  struct drm_suballoc;
> > >  struct xe_tlb_inval;
> > >  
> > > @@ -132,4 +134,16 @@ struct xe_tlb_inval_fence {
> > >  	ktime_t inval_time;
> > >  };
> > >  
> > > +/**
> > > + * struct xe_tlb_inval_batch - Batch of TLB invalidation fences
> > > + *
> > > + * Holds one fence per GT covered by a TLB invalidation request.
> > > + */
> > > +struct xe_tlb_inval_batch {
> > > +	/** @fence: per-GT TLB invalidation fences */
> > > +	struct xe_tlb_inval_fence fence[XE_MAX_TILES_PER_DEVICE *
> > > XE_MAX_GT_PER_TILE];
> > > +	/** @num_fences: number of valid entries in @fence */
> > > +	unsigned int num_fences;
> > > +};
> > > +
> > >  #endif
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > > b/drivers/gpu/drm/xe/xe_vm.c
> > > index 548b0769b3ef..7f29d2b2972d 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -3966,66 +3966,6 @@ void xe_vm_unlock(struct xe_vm *vm)
> > >  	dma_resv_unlock(xe_vm_resv(vm));
> > >  }
> > >  
> > > -/**
> > > - * xe_vm_range_tilemask_tlb_inval - Issue a TLB invalidation on
> > > this tilemask for an
> > > - * address range
> > > - * @vm: The VM
> > > - * @start: start address
> > > - * @end: end address
> > > - * @tile_mask: mask for which gt's issue tlb invalidation
> > > - *
> > > - * Issue a range based TLB invalidation for gt's in tilemask
> > > - *
> > > - * Returns 0 for success, negative error code otherwise.
> > > - */
> > > -int xe_vm_range_tilemask_tlb_inval(struct xe_vm *vm, u64 start,
> > > -				   u64 end, u8 tile_mask)
> > > -{
> > > -	struct xe_tlb_inval_fence
> > > -		fence[XE_MAX_TILES_PER_DEVICE *
> > > XE_MAX_GT_PER_TILE];
> > > -	struct xe_tile *tile;
> > > -	u32 fence_id = 0;
> > > -	u8 id;
> > > -	int err;
> > > -
> > > -	if (!tile_mask)
> > > -		return 0;
> > > -
> > > -	for_each_tile(tile, vm->xe, id) {
> > > -		if (!(tile_mask & BIT(id)))
> > > -			continue;
> > > -
> > > -		xe_tlb_inval_fence_init(&tile->primary_gt-
> > > >tlb_inval,
> > > -					&fence[fence_id], true);
> > > -
> > > -		err = xe_tlb_inval_range(&tile->primary_gt-
> > > >tlb_inval,
> > > -					 &fence[fence_id], start,
> > > end,
> > > -					 vm->usm.asid, NULL);
> > > -		if (err)
> > > -			goto wait;
> > > -		++fence_id;
> > > -
> > > -		if (!tile->media_gt)
> > > -			continue;
> > > -
> > > -		xe_tlb_inval_fence_init(&tile->media_gt-
> > > >tlb_inval,
> > > -					&fence[fence_id], true);
> > > -
> > > -		err = xe_tlb_inval_range(&tile->media_gt-
> > > >tlb_inval,
> > > -					 &fence[fence_id], start,
> > > end,
> > > -					 vm->usm.asid, NULL);
> > > -		if (err)
> > > -			goto wait;
> > > -		++fence_id;
> > > -	}
> > > -
> > > -wait:
> > > -	for (id = 0; id < fence_id; ++id)
> > > -		xe_tlb_inval_fence_wait(&fence[id]);
> > > -
> > > -	return err;
> > > -}
> > > -
> > >  /**
> > >   * xe_vm_invalidate_vma - invalidate GPU mappings for VMA without
> > > a lock
> > >   * @vma: VMA to invalidate
> > > @@ -4040,6 +3980,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
> > >  {
> > >  	struct xe_device *xe = xe_vma_vm(vma)->xe;
> > >  	struct xe_vm *vm = xe_vma_vm(vma);
> > > +	struct xe_tlb_inval_batch _batch;
> > 
> > Why not just 'batch'?
> > 
> > >  	struct xe_tile *tile;
> > >  	u8 tile_mask = 0;
> > >  	int ret = 0;
> > > @@ -4080,12 +4021,16 @@ int xe_vm_invalidate_vma(struct xe_vma
> > > *vma)
> > >  
> > >  	xe_device_wmb(xe);
> > >  
> > > -	ret = xe_vm_range_tilemask_tlb_inval(xe_vma_vm(vma),
> > > xe_vma_start(vma),
> > > -					     xe_vma_end(vma),
> > > tile_mask);
> > > +	ret = xe_tlb_inval_range_tilemask_submit(xe,
> > > xe_vma_vm(vma)->usm.asid,
> > > +						
> > > xe_vma_start(vma), xe_vma_end(vma),
> > > +						 tile_mask,
> > > &_batch);
> > >  
> > >  	/* WRITE_ONCE pairs with READ_ONCE in
> > > xe_vm_has_valid_gpu_mapping() */
> > >  	WRITE_ONCE(vma->tile_invalidated, vma->tile_mask);
> > >  
> > > +	if (!ret)
> > > +		xe_tlb_inval_batch_wait(&_batch);
> > > +
> > 
> > Here we skip the wait on error, hence my suggestion to skip waits in
> > other code paths or at a minimum make call sematics consistent. 
> 
> Makes sense.
> 
> > 
> > >  	return ret;
> > >  }
> > >  
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.h
> > > b/drivers/gpu/drm/xe/xe_vm.h
> > > index f849e369432b..62f4b6fec0bc 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.h
> > > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > > @@ -240,9 +240,6 @@ struct dma_fence *xe_vm_range_rebind(struct
> > > xe_vm *vm,
> > >  struct dma_fence *xe_vm_range_unbind(struct xe_vm *vm,
> > >  				     struct xe_svm_range *range);
> > >  
> > > -int xe_vm_range_tilemask_tlb_inval(struct xe_vm *vm, u64 start,
> > > -				   u64 end, u8 tile_mask);
> > > -
> > >  int xe_vm_invalidate_vma(struct xe_vma *vma);
> > >  
> > >  int xe_vm_validate_protected(struct xe_vm *vm);
> > > diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c
> > > b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > > index 95bf53cc29e3..39717026e84f 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > > @@ -12,6 +12,7 @@
> > >  #include "xe_pat.h"
> > >  #include "xe_pt.h"
> > >  #include "xe_svm.h"
> > > +#include "xe_tlb_inval.h"
> > >  
> > >  struct xe_vmas_in_madvise_range {
> > >  	u64 addr;
> > > @@ -235,13 +236,19 @@ static u8 xe_zap_ptes_in_madvise_range(struct
> > > xe_vm *vm, u64 start, u64 end)
> > >  static int xe_vm_invalidate_madvise_range(struct xe_vm *vm, u64
> > > start, u64 end)
> > >  {
> > >  	u8 tile_mask = xe_zap_ptes_in_madvise_range(vm, start,
> > > end);
> > > +	struct xe_tlb_inval_batch batch;
> > > +	int err;
> > >  
> > >  	if (!tile_mask)
> > >  		return 0;
> > >  
> > >  	xe_device_wmb(vm->xe);
> > >  
> > > -	return xe_vm_range_tilemask_tlb_inval(vm, start, end,
> > > tile_mask);
> > > +	err = xe_tlb_inval_range_tilemask_submit(vm->xe, vm-
> > > >usm.asid, start, end,
> > > +						 tile_mask,
> > > &batch);
> > > +	xe_tlb_inval_batch_wait(&batch);
> > 
> > No need to wait on error.
> 
> Will fix
> 
> Thanks,
> Thomas
> 
> 
> 
> > 
> > > +
> > > +	return err;
> > >  }
> > >  
> > >  static bool madvise_args_are_sane(struct xe_device *xe, const
> > > struct drm_xe_madvise *args)
> > > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > > b/drivers/gpu/drm/xe/xe_vm_types.h
> > > index 1f6f7e30e751..de6544165cfa 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > > @@ -18,6 +18,7 @@
> > >  #include "xe_device_types.h"
> > >  #include "xe_pt_types.h"
> > >  #include "xe_range_fence.h"
> > > +#include "xe_tlb_inval_types.h"
> > >  #include "xe_userptr.h"
> > >  
> > >  struct drm_pagemap;
> > > -- 
> > > 2.53.0
> > > 
