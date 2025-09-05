Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5428AB4596F
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 15:45:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E4DA10E2E8;
	Fri,  5 Sep 2025 13:45:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="COv6q+iC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E57BD10E2E8;
 Fri,  5 Sep 2025 13:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757079946; x=1788615946;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=97//ikfyKpPCfiQq/QiTW4yO3zrXHNKzUgDdMB1fcpY=;
 b=COv6q+iCvd1P13i7FZlsGa3FuRZPKTTgaxT1GfuLfNS2/XDwuUEylVHQ
 lufvW1yl64wLJdWbdk+XRNqqNZFldQF854DRdGlcbXUUOCQb2BE+y5oQI
 uwoJMnb5Vs/qmgOJCKZ54ucwsQ5h3oB2RbfiS362sb+LztIfB/UEnmZWM
 QX+l7OiFyYGc68ZFxGtZwr6e4Wy+UHAOIebbuumQU1dMJLm8Pf4okIET/
 W2U9ov3SfED0GeT62phdlZDT+VPE9x2QZOTF5c3zKuYS2Mp/aFUEMI4Br
 vHCL8vGbdoLXo22l/t470AMTQI/g4dDiar4GdaLsRzxwY68jo8eFzoxdQ g==;
X-CSE-ConnectionGUID: SclDrrTMRQ2kduEIsmfCYw==
X-CSE-MsgGUID: Yv1TPy4HQI+BtX5Pn7kurQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="59286003"
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; d="scan'208";a="59286003"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 06:45:46 -0700
X-CSE-ConnectionGUID: 6oKQnFCvQPmwIpwu4iKN/g==
X-CSE-MsgGUID: qS65cMwHQqyuQzIrTFHgbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; d="scan'208";a="172519897"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 06:45:45 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 5 Sep 2025 06:45:44 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 5 Sep 2025 06:45:44 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.79) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 5 Sep 2025 06:45:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zTp+qRini3fEYs5P8uEFf3ZGJ4tCRokukZoJ3Cp/QI2E7fx0bmK3pWkJvLerlflkhKaTYe7wZxepfeHTggAeRrEkxCCHeTrDAuCNzGKf+lG6sQkf0YAvuvrNzLObebJZxLGsXhS6huTY7pSmoWLAOE0J23HjubOLCvl0ILLC7wbtuqeGPTQymfG8GPRzKjBH24cfEWBEGrrjOJINyiQ83u6odq+wrFDFIjQcRJ2XL0vUzJgVsjDO1ZYzex5QB1sK6Anc3FMMZtE5A9AAziNxzOeCtYcQPl6NxH/Up06DBbUkvzHVb2fXS5RThbybXJJvU+eNE2UM2q3vsvM8hGguBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zx7hgb3R77Z9eYMs08C2TAxK663WH4wpTDJp1zzs8uE=;
 b=VUFPN3xF224PHIvip5YVR40S0ZHoET0GmxLbXC6HIocZFSDxHKpLxeHpVNiMtYubGOn7Pq7+AueRwFkgTyDU+to+4UObXU6fjTuSFo7BbgcvXEkmfI9FcbA0K0IUlD2kDGOKsNg82aICcBnCp3i/HGqdn3UJtfzkNamFcgM2dOzCaSk48J+0tqZPgcqjoWu/X9TV0aKnfGRZGd+koJTo9CSr+0dLu0UpXQ7dRp1/f/Tp3QUOka+BFpjeB2zUZ53bO7EQlNsPnH00JAGCJPonh+tXJQGsf/Bwh8VxDPz9D6956ZBO8hg0Tb+l1mM929z+yced2cg1D1FDpEWx+mwojQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by DS4PPFC77662F02.namprd11.prod.outlook.com (2603:10b6:f:fc02::4c)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Fri, 5 Sep
 2025 13:45:41 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9073.026; Fri, 5 Sep 2025
 13:45:40 +0000
Date: Fri, 5 Sep 2025 16:45:34 +0300
From: Imre Deak <imre.deak@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: <stable@vger.kernel.org>, <patches@lists.linux.dev>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Sasha
 Levin" <sashal@kernel.org>
Subject: Re: [PATCH 6.16 139/142] Revert "drm/dp: Change AUX DPCD probe
 address from DPCD_REV to LANE0_1_STATUS"
Message-ID: <aLrpfoemc6jCFNVO@ideak-desk>
References: <20250902131948.154194162@linuxfoundation.org>
 <20250902131953.603872091@linuxfoundation.org>
 <aLoJG4Tq4nNwFLu6@ideak-desk>
 <2025090551-setup-crescent-a670@gregkh>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2025090551-setup-crescent-a670@gregkh>
X-ClientProxiedBy: DU7P195CA0011.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:54d::14) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|DS4PPFC77662F02:EE_
X-MS-Office365-Filtering-Correlation-Id: 7043c7f3-b747-4d4e-802f-08ddec828099
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|10070799003|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yN4+PLxngG+Z5y0iC90xn4hXQ0xThaczUqvtJud6aZqy66K9DQjpP7dpQ9GX?=
 =?us-ascii?Q?RNIcAfaFNRrT3U085CWfws2UhU6QijCW6lXr2P8VaQKZGCKYI8ghYSjGsTbW?=
 =?us-ascii?Q?BfIw1ihd+gyC5IbsOHPZaJ3se3fotpqB0grO7LdZXZovmQf8RzI6Qtdp9Mqj?=
 =?us-ascii?Q?XpsnmC0tC7EkOP19VPJ1x1u+LE1qvqarYaMQG4h/gPbSc6Xv1N1oZjgO9c/A?=
 =?us-ascii?Q?NF6fgmd9eFIeNYH04DITWI8tTv8uvsFBw0bkrkN64J3mRMJOguuaj9VMT3X5?=
 =?us-ascii?Q?Wflbstxt058l7ZQbNQ84p7lyFEE1dxm5WyMb6gztH63Jf0nVTp8l2TqmjPoB?=
 =?us-ascii?Q?teSVQpTrrNMreEobATcnV3jExfgGprtFXOEEwgrokyL8TpkGyY6vHjrBrT3l?=
 =?us-ascii?Q?C79jsrZQZUvNNfemJoJEKtA5UgakuLJewZicG399V658gBxuq+j77fJtnbaM?=
 =?us-ascii?Q?Yp15taupdwP9PyZufvaQ8Is5vXviznu7MJ7QodMmzVyhm3PQwTXNrAwAJhah?=
 =?us-ascii?Q?fbxrwLOzDbzuCunVdkGqOwxu7TJ/qT+TsZ5pgP290BX83z5BYwPbPq4cRnqY?=
 =?us-ascii?Q?pptv/9cTMg5iPMKZUXtnKg19XpbcefSyqg+j4u1vpzeQgd/DZKNFulC0UWzq?=
 =?us-ascii?Q?QNl3v8iVPkcN5iAwk6cGh9+BseRoZ/qAvXhkyRjx+/ooEFDndsVrQCl+9sVb?=
 =?us-ascii?Q?RgUys+Z3h51QVj42XW498RhJ6GpE8fUc6c2ev/gXQIKGi2cGab+DmIioOA5N?=
 =?us-ascii?Q?7Y2I6UGTAuUh6+U69udcYCcmEDpmMqRcfjsXapszTNaTn62+9GCOpbb/NMTm?=
 =?us-ascii?Q?ENwgeWwMWTByedvo29+k5xJa0RkiGbwQhrRUPWSFsbbdCIhJwWRQzDFKddvx?=
 =?us-ascii?Q?yhe5HcxU0U111Q/Cl9CHDB9EviqNGawIQECKNYe+EXLDL3/X/n/48Wp1hxch?=
 =?us-ascii?Q?izLHi7rP4VslSiriZCkG0aisQsDUYYcAYtRxibyEYLplkvDw0Z9ft1tI/FNN?=
 =?us-ascii?Q?daMoiy5LBfcsM5f1k9V8HXBF2JQstLPZTrqc9Y254hMJewpAR1ELmtz3OwLK?=
 =?us-ascii?Q?VFUFZuh678QboTZbc3KNKKPVAqTudK+FcPL6fXb+L35gQOONI2GoGoptY58L?=
 =?us-ascii?Q?L4iMlY1vYnDj3PfT2UwkVzFBUKx/f1AW+U1JhuhJ2MLB4HurSnFqBv7XYibo?=
 =?us-ascii?Q?PG67zyLHfb9WP8/9Omf7xUBBrcpZB5FJL+nrGlHlUQaKbHk9Gh0thyF/TpR2?=
 =?us-ascii?Q?ZchTaHohqQOKNtRtBXV4fvmFksJ2SDcojdTNwdWQsyLVGwBfa65ChfX/00Xy?=
 =?us-ascii?Q?Bx/xL71LMoC1RyGvkQWroRd6dhpeua197GBJV+3CxBOgJ2B187l0gauYxnc2?=
 =?us-ascii?Q?6Hj7ikM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(10070799003)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AHFbeFBZdYPYj+V8cB/OqHeywNgI+++5xYbxVwHvA+MLPyiy/ErY3lEJTLJs?=
 =?us-ascii?Q?CyrLqcB3ZySXzNoGp8f1hvbKLZkZuPLWn0Ymbv6iu+ts47XxmPasPIe2DVyr?=
 =?us-ascii?Q?waUHRVZUAlkRCF5/7UY9YkiUc5L1L+QZ4pSoGP0b+t2OYvojQapiIpS8cBx0?=
 =?us-ascii?Q?MTxflo7EVF6HEzEP9BaVIuRh2EonvIHkyVhzxoAi1F7bdOh/YVXs34icUYCz?=
 =?us-ascii?Q?BUYnQ/JDqkoFstKMyrQk9Np8C8VWJ4+/O+modfYrDOlSX7Co5bH7lLDe32Nx?=
 =?us-ascii?Q?4B5Eec/zdL+yUsWHd6/FQ/KNQJCCscWgDYbinkPeydnrK0YyBYC5eNWdtPQR?=
 =?us-ascii?Q?ikiz24e8NH2N6mfE3dU95cC769NQBISDVhQLYHo9kDNNDIvE1IUo0rqTFzDR?=
 =?us-ascii?Q?UIxWg/mVJB/c4AvityldkRlGogBrOi59LGqPn6XQmTFTYnc8rK++xbk2flpn?=
 =?us-ascii?Q?WX9b1eh/nnhrdjny66cjfezn+v5zWvJMf6klX94iNod3glZF7/8XJrTkbh7P?=
 =?us-ascii?Q?0vAGg3Dp2TAn8rQTEwG7ho6Scn/sNdXnLGRtccD2uikwxRdWwRn4B4jlpNRO?=
 =?us-ascii?Q?RXi31S1pPgg8Bt++xnSB5d/Gxk4ytDubFHaA+6VFR14JlERDtZTRMO7dXp0V?=
 =?us-ascii?Q?Uq3o0S5IGcPCvhLJ33TJGpCDCDQjE/OlAi2lhiBTg4JLliAXhlIvZdD6mZ4c?=
 =?us-ascii?Q?KlD+bt3fDwQaFHU/59K3nLdH9C8kjgxe2orIHd8b/briq5EPiXm8X9P0auxO?=
 =?us-ascii?Q?kPlnIPefPwzh05/9G0vGvihU7mFSSOkt8Z3jcyTVdNgaGQou8+oCfKMCHn2R?=
 =?us-ascii?Q?xhmkgfO1+Zg9G71FGMlLHXFX2S6qUs28kaUvWI4ch2Y+TVrDpLPIp5vnyI6c?=
 =?us-ascii?Q?U6g3X6zwsMgzfRvu55W3We3t2OWa8+7Tq3y3AgCZQebMrWxd0WIwkrOWwdAM?=
 =?us-ascii?Q?m1cKd5ISnt2q/XemA6+Qb2NR4Rmk2UdwH2Q8ywKqaiyZIu84ATxsb+5kFHdR?=
 =?us-ascii?Q?ltwQJIgyf9KHeF5QK1gEixI5EChOWNVL8l8c4nejcnSVklOyriw9r2j/D3yb?=
 =?us-ascii?Q?SWoZsj7agK8++jbB3+VeYsek8sQ7Aqv/U9AVKn0RE8KB39ATolsXGsed4et5?=
 =?us-ascii?Q?e/n90VMDurNUEMGZzBgBKvIjv85TkCzluEeLk47i4DFAAbLRqDYNy2to7yPo?=
 =?us-ascii?Q?ZSufeKcJwpKeU5uw5KwBsEBJnrtpCbsRtZwOvjrFXx2mS3FSBX0A4C558w+V?=
 =?us-ascii?Q?gtQCWFuj2EWqDddaFrGzNyOXJ9CW4mJ3YNqc05YvZi7ZQOcH+pE0RD1XCXm5?=
 =?us-ascii?Q?f+EFcvZiNn9Gs7b6CCSM6uedbG3iq9dh7mHvxaBQwntbwp7gBP+YRRv2B3Pn?=
 =?us-ascii?Q?xUj6r/tEzd1FUfGymI8m/yE0wam7KuI/z4D5XqmW+6iQGnhzP2TLd7w84F+B?=
 =?us-ascii?Q?/PZyrZtQ4XhPoQnvLPb0khCIt2XrVLYt6NNrr8bCnhY12WLiHaB/jZ00lQzg?=
 =?us-ascii?Q?X19uUQdEcvhcEW2FXdG46DukQaIQjjM37DK6tBcx9tMDW5qICwK5PA8S168s?=
 =?us-ascii?Q?2dSrOUvA1DrWAQenIibUFS8MRWWxzigr5V1EAPb0Aluo72t8rvF3GWHlUqM1?=
 =?us-ascii?Q?9BYNCpGM/kImETbeS6GsKfaIj236Ws9huuSa2TPh27aL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7043c7f3-b747-4d4e-802f-08ddec828099
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 13:45:40.8619 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ECEmlnN8p5vDs/pN1UKQTVskRYPsCUF1HRm/OBt2X6OA9pfC5oyHWid/64yTPNV5v1mC09Y7qWrsnZ8HKD47Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFC77662F02
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

On Fri, Sep 05, 2025 at 07:07:40AM +0200, Greg Kroah-Hartman wrote:
> On Fri, Sep 05, 2025 at 12:48:11AM +0300, Imre Deak wrote:
> > Hi Greg,
> > 
> > On Tue, Sep 02, 2025 at 03:20:41PM +0200, Greg Kroah-Hartman wrote:
> > > 6.16-stable review patch.  If anyone has any objections, please let me know.
> > 
> > Thanks for queuing this and the corresponding reverts for the other
> > stable trees. This one patch doesn't match what I sent, the address
> > should be changed to DP_TRAINING_PATTERN_SET not to DP_DPCD_REV, see
> > [1]. I still think that's the correct thing to do here conforming to the
> > DP Standard and matching what the upstream kernel does, also solving a
> > link training issue for a DP2.0 docking station.
> > 
> > The reverts queued for the other stable trees are correct, since for
> > now I do not want to change the behavior in those (i.e. those trees
> > should continue to use the DP_DPCD_REV register matching what's been the
> > case since the DPCD probing was introduced).
> 
> Ick, why were the values different for different branches? That feels
> wrong, and is why I missed that.

The requirement for changing the DPCD probe address was only
introduced/clarified by a recent DP Standard version (with the
introducation of LTTPR / UHBR link rates), so in the DRM code this got
changed only in v6.16.0. However, this change revealed a bug in the
firmwares of an eDP panel and Thunderbolt host, which also had to be
fixed/worked around. The only such remaining issue is the latter one
tracked at [1], which is now fixed by [2].

Based on all the above I still would like to keep the change only in the
v6.16 tree and not backport it to earlier stable trees, until having
more confidence that the change doesn't cause an issue for any sink
device.

> Can you just send a fix-up patch for the one I got wrong?

Ok, I can send a patch for v6.16.y on top of what is already queued
there.

--Imre

[1] https://gitlab.freedesktop.org/drm/amd/-/issues/4500
[2] https://lore.kernel.org/all/20250904191351.746707-1-Jerry.Zuo@amd.com

> thanks,
> 
> greg k-h
