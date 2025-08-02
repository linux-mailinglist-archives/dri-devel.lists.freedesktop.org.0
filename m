Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25876B18F1D
	for <lists+dri-devel@lfdr.de>; Sat,  2 Aug 2025 16:25:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60FDF10E0F6;
	Sat,  2 Aug 2025 14:25:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cai9xp9H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6741510E0F6;
 Sat,  2 Aug 2025 14:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754144735; x=1785680735;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=rLWXf4ZjY6LY6pmyrlBMaxAidY0l8NF0Guckbkm/X3k=;
 b=cai9xp9Hc66aZ+gSWL0ZJI+OSdzMdLvgEOyLV6VGWHdb7SizPfsMHp51
 WheETb0AC247JZHsWubX999tWJtAZyrlLuyiFEf+EDgxs/k+V8/3ZBCmV
 FACC5MbtZKJfQaks4rfUmDiVGl3lPIy2I86x7ZBvIA/LoZtQZ4C3Qn1Q2
 7cYvIM6KMO01GYlWclVJf83FysgJU3TNTFw4c3RIlDTWBScSbPO6dlTX2
 7CYccYY7ppvu3EIkr6/n+WW1CAFKEq1zwajwQFsqT6w12ocyEEGewTs22
 UKigL994qHGwchmwKpucFI2/DCg9O4LBy/A0CdrhnasADJ8j1Ya+fAoRD A==;
X-CSE-ConnectionGUID: DmJjyYiVQn+1TvbWyHvhxw==
X-CSE-MsgGUID: aRR8Wb+WQsCkO03Z5RC/xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11510"; a="60300805"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="60300805"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2025 07:25:34 -0700
X-CSE-ConnectionGUID: C6OPJy2TR/uOArSpSJGfOQ==
X-CSE-MsgGUID: 0ohjFIEWTKa4HRyggViNWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="164251233"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2025 07:25:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sat, 2 Aug 2025 07:25:32 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Sat, 2 Aug 2025 07:25:32 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.66)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sat, 2 Aug 2025 07:25:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hSCNEjXgTdhTwE0AEVoLWj7ZLCRewm3KXQkbYO2Gx1OAOI/jeXjtYnQUWj/4fkcp8xDqNGP2zGXJ+3TxksJpSlNCM8saCsmmiRAY0OZNXuzlbQuJo5gvW8ThoSnEguMoNk0ZS5+uUV3xvC4jT5i52BziS6hNwBb/UbcsboflO5BcuEkr08ddT3RDhjEMW3qEFDjPCa+K4JIW2b81Wkm9RTU7VlA7TmLi0Zz4XqRIzNdYQKt76kW8T0pYduY5dIGOf9xBlZG77NFHHRaz7xSDlLkTtVXnnmQv16AtJqQBgBLBNSyIR3vfvRvhN1M3babz45TUIZfrgie9Pf5zjuYt2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YdBgqHkmwZ0MqoYXjLuXOTgbEkj8ILpGEd5Jxp/elWE=;
 b=Nfn0RAedxJVDk3w7lnPDcR5jF3iyj4zHtxMh5Ynxhs9Gwc00l+QVaCY+2+jPXKKozVrUoAuTongLFwvTTVVIwU579EVbVJg00wA4FekLWy0es/wKxGMZ4hFvFMg/zSOlMi+EJRvdv0/wVcoD6WZ+BFm+jXt0XuD3IKC0UUYPnHk2PDfq2mjpNxiz6R9/0LBBRU+0BtMGsPNrbGbj5Q9LMhIpIYvx4jV2KY+bpgx4LM3BQgKqK4DmM2p3fFWVpJz+6AU7sBm9PeGU3o0GXI2itQISvWVCcHJBOLN+Q0I7qg8ngECcC/SvxxHvRiqVxBPw4QAdzZnRIaw+rVgNVFJhgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by DM4PR11MB6096.namprd11.prod.outlook.com (2603:10b6:8:af::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Sat, 2 Aug
 2025 14:24:50 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%5]) with mapi id 15.20.8989.017; Sat, 2 Aug 2025
 14:24:49 +0000
Date: Sat, 2 Aug 2025 17:24:38 +0300
From: Imre Deak <imre.deak@intel.com>
To: James Jones <jajones@nvidia.com>
CC: Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm/nouveau: Pass along the format info from
 .fb_create() nouveau_framebuffer_new()
Message-ID: <aI4exMOoMkskntNu@ideak-desk>
References: <20250731234104.25243-1-jajones@nvidia.com>
 <aIwmRwgOa3-YAhna@ideak-desk>
 <23dc5ff9-24fd-44ae-ba98-be848e8fce78@nvidia.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <23dc5ff9-24fd-44ae-ba98-be848e8fce78@nvidia.com>
X-ClientProxiedBy: LO4P265CA0151.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::6) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|DM4PR11MB6096:EE_
X-MS-Office365-Filtering-Correlation-Id: 10c50696-b3ac-45b4-5ef4-08ddd1d056d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?pNAibdi6/PLYWb2Ujpi9fQBxqndQXWTW47jgKZtUk8PHTjJj42RgEsFOb4?=
 =?iso-8859-1?Q?XBzLpc5TeRyzs/7bTl5XVUrMExg5bMoVDLRcuZvXnuh4ouzlpl5ICnVQDX?=
 =?iso-8859-1?Q?OCKBGfM683YQ1/2c/iGeIuwcnjNoqeYVdLUZok+briBY+IaV4GzLWyEATq?=
 =?iso-8859-1?Q?rWuUUvwRQBkwoVgdGTKu4mfoDfNAnrX3W28y6dsTgsezcfVel8ce3YzB/o?=
 =?iso-8859-1?Q?oQOxHPjSx/JMoecR7my5TfsUsw7n74aaTFKW1m3fg9enzPoOI47E4Av3B5?=
 =?iso-8859-1?Q?WXHrrl8na08PD06AOeAFweGV8jfRPlvb+hQhRgqSkc1ToFjYCopADFAx7J?=
 =?iso-8859-1?Q?oR4ZFI9aYHV5BCT+xpPo3ju7X+AIvLXvKNo7f39x7n5gOqWlPm6DItVNlr?=
 =?iso-8859-1?Q?e9H/4tS6/Jg+Ob3zpgC7O6nVzCoqDyYgRwTbpGOGwC0XyKH8KgKJBFv144?=
 =?iso-8859-1?Q?VBuGmAixTMiiAXEmbt/BjvZe8DArvRhbJKbnAPUk2moRDkVBZezqpvuIK/?=
 =?iso-8859-1?Q?ABWdSfKCPfCUUDG9vwFOiWFDWRrKfEB2eUXq/dS17zbVuVztGaDKQ2l7aH?=
 =?iso-8859-1?Q?Jklta3SxwO2TL2gMHPOcvYI50BGyPppvzMZkiolMEetSiLYEG8WR45HIL9?=
 =?iso-8859-1?Q?Vd4xjlFVF7OxHV7fBiRkG1gTbD/x9fNjft00KCCqJjgbnHi1h70JP+WLCC?=
 =?iso-8859-1?Q?hOb0kLosbsybXohsoVSqYvCrE7HdmoemLYEDSznXm05pyiLs+VjCgU8b0g?=
 =?iso-8859-1?Q?y9ucvNbtDn4qOOpBflu80iLaEiZWPw1elNeDQ9g4+n1p1XoEcdhJdw2RcH?=
 =?iso-8859-1?Q?CsvuSTXKZ/Ojz0QqBkxcOJpUEh4w1foLZMTBsvyKJRc6gz+DByqn6qxp19?=
 =?iso-8859-1?Q?Yqs+WmzynW2r1rCjTu4UrZmSvlG1Uyj5C6PvFrjugKnXVp3bTtWS7jPlIs?=
 =?iso-8859-1?Q?Zvc2y53OMAmEBtjGG3895ho0zb+8WknsklPLMuaxB/gCotypgrC1dNjIdG?=
 =?iso-8859-1?Q?fGRiTCrvS+wlCFUDTkLYp7+k8oMAsOtZS8ihOO3D5HuGvW3Z+8aRuG/WIq?=
 =?iso-8859-1?Q?94zE+mSELGRRmRUBFAg9Q3SG8u+oMI0SUylYnEhAuztEQG7+yaFfan1K4I?=
 =?iso-8859-1?Q?F57BP68xNcMzn0bSCdtzfxwAorwew2z7vc1dGhLTm+xuoBLndOd4rDPGdA?=
 =?iso-8859-1?Q?YD1PicJ8f/aQ/eIMpEZCU7JjO4UpTB27tvs2kW3jl8ppg1J+KaN2hQQSEO?=
 =?iso-8859-1?Q?9/mj1XJyml0AMCl8ROHy3eHjcqpEM9Uw20t3Mial3es/U1TnAhQf+rT5OI?=
 =?iso-8859-1?Q?I/BtZYK29grIMBCQplx+cZsdqEiv1eRGpirL0avJR0J4hr/Q5TrBNhopeQ?=
 =?iso-8859-1?Q?e22MaxvD5e9HKhhodPeCW6H4nWsCoT7cNUUpBKZuzXt9RU1qbO6U1rk63n?=
 =?iso-8859-1?Q?t3+3oJQPZvaJFW5Mp4KK6bEoTRLb+i7kXQzlAPd3bulUNhYrkJYPAwNpSk?=
 =?iso-8859-1?Q?s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?SNTGJ5IqS76F4fI8mbhLLbjwwz+c01Cz6+s3YMqAxAc2OloQySTp7PkZQd?=
 =?iso-8859-1?Q?ir24uh6leYGw1nbqnP9xU4uu81wkn649evnEcV+DI+nJuiImCqvk53KRG9?=
 =?iso-8859-1?Q?0Ww+rxqLYwhPwSmqk+cikCxrB+24GISZa41X37B63IsICsLorjiJnijv6h?=
 =?iso-8859-1?Q?mPxnehF3mTvL0uybEvTTYqUDn09rqPtOitqr7Hy11prw7PQWCn1nwvg3DE?=
 =?iso-8859-1?Q?L99bMetbOeA1E+p25lEEm+8JdcESctDD9fgSVFq1DllMVsuKWMqut31g3i?=
 =?iso-8859-1?Q?7OrsOnVmB20vv85RqqHKjdg42KBtWPCoIgi1KlkuAv+u77H8F6FME8QCXX?=
 =?iso-8859-1?Q?87kNYYC1AvVJn+WUOS+zTcNTNJ4yhna4+27TMVEeaLB8EFfMM7QMIK8a6N?=
 =?iso-8859-1?Q?6BTMz7mFV/F14nDBDXBzAotJ3ItPvybHxkE01f7AXy379AYKOpFRzO1POu?=
 =?iso-8859-1?Q?CUtH7kp9243CM9HevSODeUKky8n4J0hHCelljiox/04cDeFEcct6OPRnVo?=
 =?iso-8859-1?Q?ftvmt/NvW0W42Fw/Ukb8GV72gc4BIKmvcrqWKgqqJMic3xC74SdIZp9AOJ?=
 =?iso-8859-1?Q?iV2tEWHa2n+GNjOSJhgkAbaGmZDsWy3MbxFwQUzjC7+VYaetErK4fBO6ud?=
 =?iso-8859-1?Q?5aEeTVZwLQjTervis4AH1qbjUB8dqkjrYA3hXf4HSEgHgzUELXnLxY+vmH?=
 =?iso-8859-1?Q?UBEm6nJTVTifrYejSo0CTdGKgliDnd3iwXZNabBc0xpynMxbH7NtGtoT6f?=
 =?iso-8859-1?Q?rEh3bxAiF+eQ3dP8YlePzirXa6m2z/deq1jVtLReASqRhRlPVYtv7t0xGr?=
 =?iso-8859-1?Q?u3tdDhiUagn2MXgQD/ttsAVV16o/E1yeG8jx54vWilWuEHcXp7+mDzpdzg?=
 =?iso-8859-1?Q?fy2DGCRmtADkdZoozlHmPsJKmfbgswUgYPIBM6m+SBz81oGmFXVAhoZfMq?=
 =?iso-8859-1?Q?CIfxCrok2KxOForGD3UgOVirA4bItbVxjQcCz/JP7qXnW19jIOuj+VPnDs?=
 =?iso-8859-1?Q?6TxZbFWzS36aLPGtkUz8tjqIqMPa4HsxugAUPga9l86f1XvxzsLART7TJ/?=
 =?iso-8859-1?Q?BHuRIzaaL8yBIyhO/UImzjhKDKfaMtxeOqa+CgMqpH1/KDLbpEGX2m1FnV?=
 =?iso-8859-1?Q?PWzCsWKKYh0UuWvW63NC0TwIds/5VPJZWSZIjL4H/8DnRxO8tCpRXP5War?=
 =?iso-8859-1?Q?XtBt3qf94+0DLulQjY65XB6UBV4hpmbsGQvGrt6GKyTU0jAgxFCNOfR17M?=
 =?iso-8859-1?Q?CeF5LKsoWXzpE4EzZM/w5Mo3XFyXE2bzbg8UFwrA7e2bQTLkh/VVJtTtz5?=
 =?iso-8859-1?Q?9hTx+b2UzV6Yx6ynalR+U2OG+GW50fLxOY1HX4Px/rBYtq7Bsgli1xKYDt?=
 =?iso-8859-1?Q?x+jATSCjZ/Sxbna8/EbKobnadJ4xie3oLzCCb8sozQ93Zdj2iltmfjOQhy?=
 =?iso-8859-1?Q?+6M0gcApg0K7cbplXlYjENyiRUFo/MyHytxjhzH2cnJafR5AM66VjyAH1q?=
 =?iso-8859-1?Q?b1K1BEJwPyjnb8Cme9t1pmIyBqki+uxgdfaEfwJ11PCVu8Kn0VlnvkNMnx?=
 =?iso-8859-1?Q?4UeMmf+Y31D/SE19qGCccRFIiFRI/EmIUKEUBw5zMYxfEFHnngxDcpNeM6?=
 =?iso-8859-1?Q?eidMLi655nZFevw/0uESteEz3g11KG+iPbJpjLOBP+9tjsbQ8YhiSkCc3s?=
 =?iso-8859-1?Q?4cjxcZOQPYu/m1/R93kBV0ppvQYiZQ9Es7Id6eR0?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10c50696-b3ac-45b4-5ef4-08ddd1d056d5
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2025 14:24:49.9047 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lq8yeCskbb5jL6mVlgN7tvfkrBg4+8oMMsQrdEz4mu/amiiPv73DAvXeRuuS7HR37PWLjF2zcsxLcKVBFxXXxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6096
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

On Fri, Aug 01, 2025 at 01:30:02PM -0700, James Jones wrote:
> Apologies, I saw your changes for another chipset, but missed the nouveau
> part.

Ok, no problem, thanks for testing it and the review. The omap patch is
still missing an ack/review, the patchset can be merged after an
omap maintainer can provide that.

> I've responded to your thread now. Thanks for making the fix!
> 
> -James
> 
> On 7/31/25 19:28, Imre Deak wrote:
> > On Thu, Jul 31, 2025 at 04:41:04PM -0700, James Jones wrote:
> > > Plumb the format info from .fb_create() all the way to
> > > nouveau_framebuffer_new() to avoid the redundant lookup.
> > > Also plumb the format info from there down to
> > > drm_helper_mode_fill_fb_struct() as required, avoiding
> > > a WARN_ON() and failure every time this path is used,
> > > e.g., during fbdev init.
> > > 
> > > Fixes: 41ab92d35ccd ("drm: Make passing of format info to drm_helper_mode_fill_fb_struct() mandatory")
> > > Signed-off-by: James Jones <jajones@nvidia.com>
> > > CC: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > 
> > I posted this change already:
> > https://lore.kernel.org/all/20250728101603.243788-3-imre.deak@intel.com
> > 
> > > ---
> > >   drivers/gpu/drm/nouveau/nouveau_display.c | 9 +++------
> > >   drivers/gpu/drm/nouveau/nouveau_display.h | 1 +
> > >   2 files changed, 4 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
> > > index e1e542126310..805d0a87aa54 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> > > @@ -253,6 +253,7 @@ nouveau_check_bl_size(struct nouveau_drm *drm, struct nouveau_bo *nvbo,
> > >   int
> > >   nouveau_framebuffer_new(struct drm_device *dev,
> > > +			const struct drm_format_info *info,
> > >   			const struct drm_mode_fb_cmd2 *mode_cmd,
> > >   			struct drm_gem_object *gem,
> > >   			struct drm_framebuffer **pfb)
> > > @@ -260,7 +261,6 @@ nouveau_framebuffer_new(struct drm_device *dev,
> > >   	struct nouveau_drm *drm = nouveau_drm(dev);
> > >   	struct nouveau_bo *nvbo = nouveau_gem_object(gem);
> > >   	struct drm_framebuffer *fb;
> > > -	const struct drm_format_info *info;
> > >   	unsigned int height, i;
> > >   	uint32_t tile_mode;
> > >   	uint8_t kind;
> > > @@ -295,9 +295,6 @@ nouveau_framebuffer_new(struct drm_device *dev,
> > >   		kind = nvbo->kind;
> > >   	}
> > > -	info = drm_get_format_info(dev, mode_cmd->pixel_format,
> > > -				   mode_cmd->modifier[0]);
> > > -
> > >   	for (i = 0; i < info->num_planes; i++) {
> > >   		height = drm_format_info_plane_height(info,
> > >   						      mode_cmd->height,
> > > @@ -321,7 +318,7 @@ nouveau_framebuffer_new(struct drm_device *dev,
> > >   	if (!(fb = *pfb = kzalloc(sizeof(*fb), GFP_KERNEL)))
> > >   		return -ENOMEM;
> > > -	drm_helper_mode_fill_fb_struct(dev, fb, NULL, mode_cmd);
> > > +	drm_helper_mode_fill_fb_struct(dev, fb, info, mode_cmd);
> > >   	fb->obj[0] = gem;
> > >   	ret = drm_framebuffer_init(dev, fb, &nouveau_framebuffer_funcs);
> > > @@ -344,7 +341,7 @@ nouveau_user_framebuffer_create(struct drm_device *dev,
> > >   	if (!gem)
> > >   		return ERR_PTR(-ENOENT);
> > > -	ret = nouveau_framebuffer_new(dev, mode_cmd, gem, &fb);
> > > +	ret = nouveau_framebuffer_new(dev, info, mode_cmd, gem, &fb);
> > >   	if (ret == 0)
> > >   		return fb;
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_display.h b/drivers/gpu/drm/nouveau/nouveau_display.h
> > > index e45f211501f6..d569240df354 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_display.h
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_display.h
> > > @@ -10,6 +10,7 @@
> > >   int
> > >   nouveau_framebuffer_new(struct drm_device *dev,
> > > +			const struct drm_format_info *info,
> > >   			const struct drm_mode_fb_cmd2 *mode_cmd,
> > >   			struct drm_gem_object *gem,
> > >   			struct drm_framebuffer **pfb);
> > > -- 
> > > 2.50.1
> > > 
> 
