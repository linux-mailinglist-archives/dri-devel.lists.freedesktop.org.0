Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD6CCCD66B
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 20:33:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D70910E6FB;
	Thu, 18 Dec 2025 19:33:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JQaO+5zp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B93DD10EB36;
 Thu, 18 Dec 2025 19:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766086393; x=1797622393;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=jwdaSpt3G1f4Qots5Ta9KFbMhIOq+EoQM9LE63TiHrw=;
 b=JQaO+5zpKzDgL4vsRXSVHXUxh+JFQbo6WBD5qy9uCzHAmbeAgb48RVeA
 GGeE+ILMIbWVswIxyCd84IUC4ZkKD0aNOPTJujfXlCXGp3GdVKSKxmHG9
 /NUNZfX4hQvFG6QQ5MtjiIK4xLaNXkogxU1efJc5veslh0qZYqYVXDfH6
 xrlofxtgqo1Th/2/umP0Q96BQU+0QvuReqtWFhLlHkfjYNcpFyy/ttIKm
 kt8ewlF2bapkSZX8CREJwx2yGpSNtL4YJ6QngsiDPWLEfFc2Hok40Gws0
 0M4PCvKenm3Edho0DWRkQ08iRmRvZDprjFmKtj9WYevqQAy5W10u7q6v0 A==;
X-CSE-ConnectionGUID: tWynT414RtiqXqWsuKWQwA==
X-CSE-MsgGUID: ZBjz9yIDSpyaYqMjOLsqbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="67047637"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="67047637"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 11:33:12 -0800
X-CSE-ConnectionGUID: 8O/KzKzMTVqCR2N/B/4DiA==
X-CSE-MsgGUID: nr3GCCbZSqWbWeSgIfWvkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="197809741"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 11:33:12 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 11:33:11 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 18 Dec 2025 11:33:11 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.35) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 11:33:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jtYIJE7SIFQBg+E2CksadAktU54CNSDhfYN+V2c+SAgh4o05cH+fBr8nB7B0v7e7UcS3kJL7cKthJ86Dq8corRYDsJuAFJ1CSwhAEu8lupQ+cJbtrv4sknJWMuKdPKM9QNTp7sI7r+9dKe4NWbqcHoX1d/Lbk7eUq3lFSIZPAUZY0yRRz3KtK7R+HwNzWPYw1PSuvFiL2dQwLBwrZvhC+devESINomenQnVk9envL+5pfYcj4P/wAmA/VJmaphr1g7LZ0RLfWY1bA58h63A+bm5FZK2kejOo1hXp4FXFKxVhUUpDvPJrBM9ClV82EeC3weINffMjqXKHBiBr5mmiJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PO/l8h1l34mB52soVvQ9T1p1lNwLfLibUccTt9DA0PM=;
 b=JhmEH9O47hqh0/AB3Lhj94bV4f8SRdPDc7cb4HBArJLoRNQWOzd1piLZDee5Ifw2LuV0oief3BB37QQD38AtQC3hdcb81DoKVY0okThgRCJKllhz7gHs6yUJ6kAtM1wUElsgwDLaq8cQJxTNF7bpB3iaEkAJ6xNsxH7/9SQn6PLCqCY/vDgZgw9EngUcoNw8dRl0x07tFNsKp/dhy2rjaaCmn8Wx4FojTY4V/Gx7NUc2/WWtpdpkJT4dFvFI+nUhWD1aYsZTFDABx6aXTXFYhcBuRBKgl7btlw7U/A69eZzYouA4RU/I10T/ogmChz6gzWqe7I7KuQz70JekPyLiqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6861.namprd11.prod.outlook.com (2603:10b6:303:213::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 19:33:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 19:33:08 +0000
Date: Thu, 18 Dec 2025 11:33:06 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stable@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <apopple@nvidia.com>, <airlied@gmail.com>, Simona Vetter
 <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, <dakr@kernel.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH v5 03/24] drm/pagemap, drm/xe: Ensure that the devmem
 allocation is idle before use
Message-ID: <aURW8sAjF7fDlU0n@lstrano-desk.jf.intel.com>
References: <20251218162101.605379-1-thomas.hellstrom@linux.intel.com>
 <20251218162101.605379-4-thomas.hellstrom@linux.intel.com>
 <aURI/tEMA6GInnCh@lstrano-desk.jf.intel.com>
 <8ed95ebd4525bbedbf62aa2ca26bcaf8ae1e4526.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8ed95ebd4525bbedbf62aa2ca26bcaf8ae1e4526.camel@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0085.namprd03.prod.outlook.com
 (2603:10b6:a03:331::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6861:EE_
X-MS-Office365-Filtering-Correlation-Id: 947d4b8a-5874-451f-4215-08de3e6c4626
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?ZMT88HsAeGk2mIh4RDdW9GzxJK2PUXvO1gVGjru/DshHcjRvJ5QLYMNJWc?=
 =?iso-8859-1?Q?UFhwR53mKhQd8uyquyziN2WMaUO+7/1kpUOkzke3w5E+DKgQCTxWTZ7NU3?=
 =?iso-8859-1?Q?PktrdRMS7FUrcwwVdDYOyufA62Aam6OJZ94c0K3wrTVlNKj82ZTM2UwYG7?=
 =?iso-8859-1?Q?3pE8BoPzsruKG/C5DyU8qQfk1/e5w/7tRrakoPDdY/biC+ND/7bed4m5u7?=
 =?iso-8859-1?Q?Fd63v9Fjx96z6qiB7ZV7M8lZ6C/+f/mm3predo5bDapECV1haD1uvS/IzS?=
 =?iso-8859-1?Q?+Rsk6ZasdP+uKqBC5d8+cdpa5iHupo0aYlxF83vHg4+ZUHUrYm6Hf4rPIt?=
 =?iso-8859-1?Q?swpusvt2Tyc6UHF0pwwBWfW12EM40LyYtWR23XRs7rVbe19tr7EzW/wgeC?=
 =?iso-8859-1?Q?DXmHHkunsKPXT6QoXf3QIendMiAAo86glOYqCaOzyTzcq1uI8HXLkXfu7t?=
 =?iso-8859-1?Q?/slG5Ox0JlpiGsI/tEepp0zjqHZ43HZoYsanxKRfkbMGJNYwnXKMAKkHdk?=
 =?iso-8859-1?Q?KcHMLdkjJABTHSnMJDKtx9VXjVKCegKhls5jKnMkx+X5NfFofkZgW3mxxo?=
 =?iso-8859-1?Q?BmCvstEs1j2U2MiS7CJ6rswyrntRLom+TME3sSWAEX3HGZDgElNaMyVaxw?=
 =?iso-8859-1?Q?XO1q4XU2VnZBA843cvlBKmAzn7uNX86Au1dVx8aSdKISSq0pSe93TILLW7?=
 =?iso-8859-1?Q?ZYQEd6dU7gAHxjd/BvcJ2jfXdPeMj1GHE7jUhdlDQVpvR78MhqvIxqITZx?=
 =?iso-8859-1?Q?OnsdQyY80ashvtrJxcly4yXw2QGpCqaUFyqXl+EDEBCIf1dNgg9ZPYdng6?=
 =?iso-8859-1?Q?Aiwjvsi8x13j1ia0SwdhqusKUAnyV+UhYX0LHJSDi/4kKmHQ35gc/OkqAV?=
 =?iso-8859-1?Q?8BQRw24mXb1CL9IXURbgnEnnYmpK2914s38+tbJF304MPI134mFW+uktCW?=
 =?iso-8859-1?Q?T9rJohLdHDsozvJ+312jNYAMnSBEtbae60Z6yfwh0iJHMbfchUwZbpSB6U?=
 =?iso-8859-1?Q?MiVK1/evwmjFCv9MXlvGMRyoD8piJLc4StbfvT184Vofs8g+8/tD8NGbB5?=
 =?iso-8859-1?Q?rCxreacNd/9HoLvh4pxyzFBamZR8Ct+A07apRngsWJSoCmW1T3HzLVtfKe?=
 =?iso-8859-1?Q?BNp7Rg003xF5RO+ScaC0WmVgFZbbMVqUJQiMHwhJF88/iovyFqTRNmF7AH?=
 =?iso-8859-1?Q?Z2auDWGQxB3lapmQEtRvHnKQNUIj4iBVR8jKnuJK9NqYyhrQ4aRHo0PApC?=
 =?iso-8859-1?Q?ZnHkpphADfKO/uoyOyksCY8XDfqboSzpCrT2HzhYy1zARXo6BDRWl0Ax3+?=
 =?iso-8859-1?Q?lCEFYWrlwYpOSUM2yVub2YrMUb1x9K1aHhp+i51qt1tOqL9MIHtSZFn1LW?=
 =?iso-8859-1?Q?JqxNihulLpHRxAURYIsd0cmwOO3YTiPA5fj2MmGl6Y8oohV/SAa3bFVNNE?=
 =?iso-8859-1?Q?rdnHRsnYfhXfRNwpNR60pHsNo+ThRXWgpJhI+2vjCYkTEdhitN58L+Tk47?=
 =?iso-8859-1?Q?oye4jxMZsBsKrQzeZrrsAY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?l3pbeD6XedoDXPBj2kyYVc0lZWNGedFirHpOcN8c7H68BdEjBws8LDYD8q?=
 =?iso-8859-1?Q?lTI8FBGci/aZuUD0q2p2Xhfa9yuSPbVnektWVwohvnzSUJQAsmNbJ2rwYN?=
 =?iso-8859-1?Q?j8B64R6QuYJJNaq8Bld7Q5J3QByaM/iH3Mae6pcGrn4I0uo6IHUsPfZ7r+?=
 =?iso-8859-1?Q?U+8IpjRLqBkF3+TyQlP7sYPt1XhpOkrvwy6Io9vn8NKCciBgnCnXR7G3cB?=
 =?iso-8859-1?Q?iFur4ihZDx985g159oyxN4T+1n4i15yPcPWcJiVnu74TI1EbTdGZysasS0?=
 =?iso-8859-1?Q?2DhStRs9B+1336XcUnMYkEbXiaZz4Z2e0HaOUDobFf7HgpjJR2qYTFaqKH?=
 =?iso-8859-1?Q?vdBNYedRqflLqnnBCeg8pLkqG55HYRtpzTa0fNP9d3itNvOoAwXOY2yM07?=
 =?iso-8859-1?Q?mq+5Pdz8T0wPgw/AO6Hzk55ZSsA5rjAZapF5Yb5DEHWLMHU2T0o/bGcRCs?=
 =?iso-8859-1?Q?X1hYhmDPEOSb/hNKW+6EBI+0LHgQEjB5aBkKbJ+xES/iOFAJCqO6gaKJx1?=
 =?iso-8859-1?Q?azqLVqokwdRleFNxed0V8TS+Rvn/PPdJY1I28zQguPnZDLzBnUKVHFD/Pb?=
 =?iso-8859-1?Q?LgbQFy942/5PyOrxdkDssBAOajDFR4I2DESm5GSVZm94K83mIJC7Cx1Gq6?=
 =?iso-8859-1?Q?ZWaqmuGZf2M0vCuyApFgNcKDtlCD5sCc8EKZhFdWHckWc0PPKKdl57dBh9?=
 =?iso-8859-1?Q?FGx8MHmbnJu8Cx8p6jsDsbUkH9Pamved1MkBWkzPFccmyHbiB/CqJhT42O?=
 =?iso-8859-1?Q?k+kdFMFE52L0ILo3jdF2S4g7oINPZvcwojyL1k4HBWYOLg7bvXmeBoCexK?=
 =?iso-8859-1?Q?jK3Al7un/E7jfgshn0cPwHvjtk50fs5VVJrxq8dK+5ySP9kWXXk6VPNvas?=
 =?iso-8859-1?Q?PQk6CUZwqtpOEv3VwBcSx/02gPVAhdZN+XqyXM4HNdQCa6eu7eLNhZD9H0?=
 =?iso-8859-1?Q?t+IpCEnG8pRZ7UD1aDDvrgonn2L1lf5SpSbnKmG5INrDVDpiEi63R+v4RS?=
 =?iso-8859-1?Q?ks+FFC0Rkmc0R+kf4s6taWoodQQ0I1WbVeyl8WOspZhJFlsayBnAQ/8KmG?=
 =?iso-8859-1?Q?WuOZkrHcsokxKa56iSqPwOJRNSfL4bH78cWJLc4rX4gu6bTXz+vMG9/xfB?=
 =?iso-8859-1?Q?l7tHi3C6QVdJ5LC6QJog+yNX0uyx44/XvwFz6I0vBEbAgMf1l3OSVKmbu3?=
 =?iso-8859-1?Q?NvbN7jUtgvyyLWbiTKjGQvWcsxTfv+9egkECieGB+rSGrrCu6uhx80xE/w?=
 =?iso-8859-1?Q?rgXK9y6WDA4wwGOPuwEv0e2ScOEuge6XBSd6fNfBl27GuTocrhmXHamFy+?=
 =?iso-8859-1?Q?mtaHjFRXLU4GG74eSz2v/dixKfBC9yMLDUF94zYwBLtE+f6baFq2HnyqEF?=
 =?iso-8859-1?Q?BPqwfkRz02Y7d1U9CYS9luha5H54eiZxlGAAmacxFXV8E5WLnqP3QiZHgO?=
 =?iso-8859-1?Q?jCMFS1IcmLQqI74+ZrPkMdE8fyjVTZr1TQvu5xgg9eeE2ZDmBfFdWAp7wA?=
 =?iso-8859-1?Q?VzYKKr4G9G2adr+7lfVMNDj1fnmMKdpglsTtP/y9Bf415WorQR9ZvFnE73?=
 =?iso-8859-1?Q?4upNHZD6ucI1Oc4onnpaebXSvDL/EkhAZcvgyuhNLfIyBwnTXqpy+WNvOH?=
 =?iso-8859-1?Q?pl2/SdZP+IOJSUU9xQxeB2DGCPjmGuCUDplb827b91Z0ErxfdX+PK+cA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 947d4b8a-5874-451f-4215-08de3e6c4626
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 19:33:08.8974 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Fl429TRnq4x69F13VZgzPYomEAzTHOlR3iQDEATWXir3PYqSMQezJKO4WxTyQ+L+UHNCxpBIDXB02eGobbZBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6861
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

On Thu, Dec 18, 2025 at 08:18:24PM +0100, Thomas Hellström wrote:
> On Thu, 2025-12-18 at 10:33 -0800, Matthew Brost wrote:
> > On Thu, Dec 18, 2025 at 05:20:40PM +0100, Thomas Hellström wrote:
> > > In situations where no system memory is migrated to devmem, and in
> > > upcoming patches where another GPU is performing the migration to
> > > the newly allocated devmem buffer, there is nothing to ensure any
> > > ongoing clear to the devmem allocation or async eviction from the
> > > devmem allocation is complete.
> 
> 
> > > 
> > > Address that by passing a struct dma_fence down to the copy
> > > functions, and ensure it is waited for before migration is marked
> > > complete.
> > > 
> > > v3:
> > > - New patch.
> > > v4:
> > > - Update the logic used for determining when to wait for the
> > >   pre_migrate_fence.
> > > - Update the logic used for determining when to warn for the
> > >   pre_migrate_fence since the scheduler fences apparently
> > >   can signal out-of-order.
> > > v5:
> > > - Fix a UAF (CI)
> > > - Remove references to source P2P migration (Himal)
> > > - Put the pre_migrate_fence after migration.
> > > 
> > > Fixes: c5b3eb5a906c ("drm/xe: Add GPUSVM device memory copy vfunc
> > > functions")
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: <stable@vger.kernel.org> # v6.15+
> > > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > ---
> > >  drivers/gpu/drm/drm_pagemap.c | 17 ++++++---
> > >  drivers/gpu/drm/xe/xe_svm.c   | 65 ++++++++++++++++++++++++++++++-
> > > ----
> > >  include/drm/drm_pagemap.h     | 17 +++++++--
> > >  3 files changed, 83 insertions(+), 16 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_pagemap.c
> > > b/drivers/gpu/drm/drm_pagemap.c
> > > index 4cf8f54e5a27..ac3832f85190 100644
> > > --- a/drivers/gpu/drm/drm_pagemap.c
> > > +++ b/drivers/gpu/drm/drm_pagemap.c
> > > @@ -3,6 +3,7 @@
> > >   * Copyright © 2024-2025 Intel Corporation
> > >   */
> > >  
> > > +#include <linux/dma-fence.h>
> > >  #include <linux/dma-mapping.h>
> > >  #include <linux/migrate.h>
> > >  #include <linux/pagemap.h>
> > > @@ -408,10 +409,14 @@ int drm_pagemap_migrate_to_devmem(struct
> > > drm_pagemap_devmem *devmem_allocation,
> > >  		drm_pagemap_get_devmem_page(page, zdd);
> > >  	}
> > >  
> > > -	err = ops->copy_to_devmem(pages, pagemap_addr, npages);
> > > +	err = ops->copy_to_devmem(pages, pagemap_addr, npages,
> > > +				  devmem_allocation-
> > > >pre_migrate_fence);
> > >  	if (err)
> > >  		goto err_finalize;
> > >  
> > > +	dma_fence_put(devmem_allocation->pre_migrate_fence);
> > > +	devmem_allocation->pre_migrate_fence = NULL;
> > > +
> > >  	/* Upon success bind devmem allocation to range and zdd */
> > >  	devmem_allocation->timeslice_expiration = get_jiffies_64()
> > > +
> > >  		msecs_to_jiffies(timeslice_ms);
> > > @@ -596,7 +601,7 @@ int drm_pagemap_evict_to_ram(struct
> > > drm_pagemap_devmem *devmem_allocation)
> > >  	for (i = 0; i < npages; ++i)
> > >  		pages[i] = migrate_pfn_to_page(src[i]);
> > >  
> > > -	err = ops->copy_to_ram(pages, pagemap_addr, npages);
> > > +	err = ops->copy_to_ram(pages, pagemap_addr, npages, NULL);
> > >  	if (err)
> > >  		goto err_finalize;
> > >  
> > > @@ -719,7 +724,7 @@ static int __drm_pagemap_migrate_to_ram(struct
> > > vm_area_struct *vas,
> > >  	for (i = 0; i < npages; ++i)
> > >  		pages[i] = migrate_pfn_to_page(migrate.src[i]);
> > >  
> > > -	err = ops->copy_to_ram(pages, pagemap_addr, npages);
> > > +	err = ops->copy_to_ram(pages, pagemap_addr, npages, NULL);
> > >  	if (err)
> > >  		goto err_finalize;
> > >  
> > > @@ -800,11 +805,14 @@
> > > EXPORT_SYMBOL_GPL(drm_pagemap_pagemap_ops_get);
> > >   * @ops: Pointer to the operations structure for GPU SVM device
> > > memory
> > >   * @dpagemap: The struct drm_pagemap we're allocating from.
> > >   * @size: Size of device memory allocation
> > > + * @pre_migrate_fence: Fence to wait for or pipeline behind before
> > > migration starts.
> > > + * (May be NULL).
> > >   */
> > >  void drm_pagemap_devmem_init(struct drm_pagemap_devmem
> > > *devmem_allocation,
> > >  			     struct device *dev, struct mm_struct
> > > *mm,
> > >  			     const struct drm_pagemap_devmem_ops
> > > *ops,
> > > -			     struct drm_pagemap *dpagemap, size_t
> > > size)
> > > +			     struct drm_pagemap *dpagemap, size_t
> > > size,
> > > +			     struct dma_fence *pre_migrate_fence)
> > >  {
> > >  	init_completion(&devmem_allocation->detached);
> > >  	devmem_allocation->dev = dev;
> > > @@ -812,6 +820,7 @@ void drm_pagemap_devmem_init(struct
> > > drm_pagemap_devmem *devmem_allocation,
> > >  	devmem_allocation->ops = ops;
> > >  	devmem_allocation->dpagemap = dpagemap;
> > >  	devmem_allocation->size = size;
> > > +	devmem_allocation->pre_migrate_fence = pre_migrate_fence;
> > >  }
> > >  EXPORT_SYMBOL_GPL(drm_pagemap_devmem_init);
> > >  
> > > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > > b/drivers/gpu/drm/xe/xe_svm.c
> > > index bab8e6cbe53d..b806a1fce188 100644
> > > --- a/drivers/gpu/drm/xe/xe_svm.c
> > > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > > @@ -472,11 +472,12 @@ static void xe_svm_copy_us_stats_incr(struct
> > > xe_gt *gt,
> > >  
> > >  static int xe_svm_copy(struct page **pages,
> > >  		       struct drm_pagemap_addr *pagemap_addr,
> > > -		       unsigned long npages, const enum
> > > xe_svm_copy_dir dir)
> > > +		       unsigned long npages, const enum
> > > xe_svm_copy_dir dir,
> > > +		       struct dma_fence *pre_migrate_fence)
> > >  {
> > >  	struct xe_vram_region *vr = NULL;
> > >  	struct xe_gt *gt = NULL;
> > > -	struct xe_device *xe;
> > > +	struct xe_device *xe = NULL;
> > >  	struct dma_fence *fence = NULL;
> > >  	unsigned long i;
> > >  #define XE_VRAM_ADDR_INVALID	~0x0ull
> > > @@ -485,6 +486,16 @@ static int xe_svm_copy(struct page **pages,
> > >  	bool sram = dir == XE_SVM_COPY_TO_SRAM;
> > >  	ktime_t start = xe_gt_stats_ktime_get();
> > >  
> > > +	if (pre_migrate_fence &&
> > > dma_fence_is_container(pre_migrate_fence)) {
> > > +		/*
> > > +		 * This would typically be a composite fence
> > > operation on the destination memory.
> > > +		 * Ensure that the other GPU operation on the
> > > destination is complete.
> > > +		 */
> > > +		err = dma_fence_wait(pre_migrate_fence, true);
> > > +		if (err)
> > > +			return err;
> > > +	}
> > > +
> > 
> > I'm not fully convienced this code works. Consider the case where we
> > allocate memory a device A and we copying from device B. In this case
> > device A issues the clear but device B issues the copy. The
> > pre_migrate_fence is not going be a container and I believe our
> > ordering
> > breaks.
> 
> So the logic to handle that case was moved to the patch that enables
> source migration, as per Himal's review comment. So consider this patch
> only for destination migration where the devmem allocation is allocated
> on the same gpu that migrates.
>

Ah, yes I see that logic in patch 23.
 
> > 
> > Would it be simplier to pass in the pre_migrate_fence fence a
> > dependency
> > to the first copy job issued, then set it to NULL. The drm scheduler
> > is
> > smart enough to squash the input fence into a NOP if a copy / clear
> > are
> > from the same devices queues.
> 
> I intended to do that as a follow-up if needed but since this is a fix
> that fixes an existing problem I wanted it to be lightweight. But let
> me take a quick look at that and probably resend only that patch.
> 

I'm fine with doing this in a follow up if that is the preference, I do
think that would be cleaner.

So if you prefer to leave this as is:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> /Thomas
> 
> 
