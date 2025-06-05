Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1984AACF04D
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 15:23:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E72610E7FC;
	Thu,  5 Jun 2025 13:23:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IziuRdM+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3490310E2F6;
 Thu,  5 Jun 2025 13:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749129796; x=1780665796;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=f9MCw95Ia+dKe8PFPpTQUBdEJQthiQZ3b5iPF81Beos=;
 b=IziuRdM+CqNPGwNACqhTa8ix6RSAjr60G/Y+H315qHKcJVB1ZjVnmO6A
 Ifq6g3H3HlpMkSTtXy2MK8z4N+C3pvdvCe+T7SzRdKa+ScU/5OtGvZlfb
 Yze4WQ55CEGU89gP+t413iavwcRLTwDowYnRaUExp6g1zdaFRDaWNZYcr
 98NYws32U6yMwHhll0hNESoZv3tcHhRDiPhNVcrmAj6AZMrjlVWqO/STQ
 IX5KXMxZgvirS31G06UUTbHKqL5le4Ng/jtJ5Fx8Yl58vdATT6k424fei
 aTZORmMHYD85GkVqs6G5oWe7nZKW9rP0UD8vA0mM7p43dMm8CCmsMc+OP w==;
X-CSE-ConnectionGUID: 4eWmAfoCT6OCO31Ntcsy2w==
X-CSE-MsgGUID: Xafn0VGUS/aPq89Fr/BIdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="61911081"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="61911081"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 06:23:14 -0700
X-CSE-ConnectionGUID: ImCAsxSMRF27vGbhjrdN0Q==
X-CSE-MsgGUID: +4EYreDURXGfoZvqDIxHPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="150663011"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 06:23:11 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 06:23:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 5 Jun 2025 06:23:12 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.48)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 5 Jun 2025 06:23:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IvHi8hkDobBn230dQhKfp2Z0ohoOZyZIRZ4leOzU/SulhVN/ozjEZaTY3J+mrErhsZCGu1ygiP3mDjyM/2oYZuE46Cqgep1o8qKyp/E0MBifiHS+1qwyBTEZuG4v746Tr8J+09FXPpEZIwMLWmnmHFP/HeLB55CLbQtc2SSK1xTctnW+iGRTZf7UBFC/2iVoevjW41gPgTD08UJtMJsD5X07KDa6cSp870/fqrPvtr7A9TblI8iCl/EpBQ1anWrMI6GaeK7OcyFioaCKeVbdk6JixwyKLkuv/beVpXkaSWjJe+Jv9liVwuPFpZM/oe5lCZysHo7LRhAhBgXJoj8JhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p7s7V3gWjGmat1WaWmjQSz5pACI0pju2/CZwk8p7ztE=;
 b=Xg0aszA71IegoTas65M6N9E+e7Aj9jvAHN/4vQ7FHE9Qsn7qtzZwSbfoPfcGPwR8tu1qcvMChY7b/ASu4v15W4urlD3o6OmRuXUuhs1+6ZzGn2TJNlvPcm1AB88a6UKbtoGIIdS5GuIBXMF4tUaqaoxikereXMfd7xgXeX1+9M7t+1nKtFU/HAjlhBBzzteJjNC1t/aBCgvZ0NnxTIYWxeFXjgKIG0/sUpUdjuDQhjMlFDVA5XMUJmZ8algg9JqqKy5GGZY4ivB9OOImCOQXaLZZ7fMR/CnjomdGF1iPT14kEuEu5e5z63BTYi+TLIEqjGhID6fKPHFmrFoQZpJ6JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by SJ0PR11MB5816.namprd11.prod.outlook.com (2603:10b6:a03:427::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.31; Thu, 5 Jun
 2025 13:23:09 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%2]) with mapi id 15.20.8813.020; Thu, 5 Jun 2025
 13:23:09 +0000
Date: Thu, 5 Jun 2025 16:23:02 +0300
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v3 3/5] drm/edid: Add support for quirks visible to DRM
 core and drivers
Message-ID: <aEGaNoAz0CZL0hiU@ideak-desk>
References: <20250605082850.65136-1-imre.deak@intel.com>
 <20250605082850.65136-4-imre.deak@intel.com>
 <282001987f2a20ce67d5ca67298df1736242d218@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <282001987f2a20ce67d5ca67298df1736242d218@intel.com>
X-ClientProxiedBy: VE1PR03CA0010.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::22) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|SJ0PR11MB5816:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fedd1ec-ce81-48c4-d338-08dda4341d3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?FqIs+uAqM0Qw5GkN4d8sytcmwo0VLFo5MTFVQDtdMpoNhMuJIJ+kVuuemT?=
 =?iso-8859-1?Q?yj4WgtkjnLHcqiWyRG2JOcv5eWuGM3SLd1lqNf9l5otR0RV6JO07WmDAdC?=
 =?iso-8859-1?Q?X8u+fm2ClxJS5umm9xQTZcA7h8mJ4//zfhsmVgh2FHIJWFFzKW9i4zluvX?=
 =?iso-8859-1?Q?v2dqkI8asJd6sXQYOp28HvTE3K157bazmvibS9mhFHw7t14qOx/sQcml8F?=
 =?iso-8859-1?Q?xXWAJ4Ihsly13qhMZ7jH/3yX39d9DBx2KR67FtbuZ7Pqu572FXmoyUgjwU?=
 =?iso-8859-1?Q?RCzg2UsHTCLq4vN8EovC7UjSm72/uAtyVZpUiA+9y5OYYOKoM5RW4c8IDX?=
 =?iso-8859-1?Q?Jxv/OhfRhQFqZIwZrsAUxx/UhimzEPkUQYlVkXjCao64s+qc4d425R/36o?=
 =?iso-8859-1?Q?ZxzKUOBh61b6nRaT6ORiPmqKz+jc2vFVhxaCXgpeEXuVKbyvl0QaiQECZ2?=
 =?iso-8859-1?Q?EhwCUjfiuM9IFi/G8ZNIWo4oKB/q0k74iwteRepLdcMLieIxI91Q37zWTe?=
 =?iso-8859-1?Q?E0yVxMQYEqOkqbaNuXcROgk5GMCtZs5VhLIE3TW9WnUHYUE+1JoUfowGqT?=
 =?iso-8859-1?Q?ucMf+33TO33MzHDqU13G6A2lSKxjmFQJU4qP+BYmcubvQ7HmkP20j8PBVT?=
 =?iso-8859-1?Q?VjqFc9b2ZjB/MRNFEGjKZmQfxMA1GF5q+cz7ip0oZojWdYJJxPZZwPG2BJ?=
 =?iso-8859-1?Q?yNK8gV1SlYg95MPF7et6XAyU0dHjp2Fe4A5M4Z4KMtSriI34pzGOHDXbRb?=
 =?iso-8859-1?Q?4Y4bTJ7btUwcRqmbHbmzhGm3BjGnBS8bzCfYi/x3mb1W/fw0hec7WDSqS+?=
 =?iso-8859-1?Q?5LSn050vQ478pXqRCy3qgXHanz3cY6LmNecBx7+jV3M3UmWGhyrcTVxQJm?=
 =?iso-8859-1?Q?rbFCRtNcGqaSLVARNjnsxA6Jdx2B0gFirGsS+rCWVa5bnWHpDoqyIkQPhb?=
 =?iso-8859-1?Q?4pek0zh7H8Dj7OKCAUVihqtG6gnBr7PSycNsTiAsluzDCEZT3SJLccpDni?=
 =?iso-8859-1?Q?glmXVY9rqPydb4LMz/7dgDOXrhnej+kyDOBTJt6yxHEM3ORQC8u1hfN1U7?=
 =?iso-8859-1?Q?3rumWHHi9aFPyNTiYogHcRiShpDMeMQ5CRg8vk+YZAxON3TuV/e8ftO3ty?=
 =?iso-8859-1?Q?P1PCKVJEelpSP9BxouK0FSuFnQ0q/kAYGsRJI+YMHklSgsEb2XWqXwlYyo?=
 =?iso-8859-1?Q?rCC1A98gh6o7idrEsbQkeVYlHV64/limACe1nsBcKA2W0oaZBgzqLCKxOu?=
 =?iso-8859-1?Q?2O7MhZ26vHNARqPoXBt/ikX6Yy71TT7gw9Bl2RhmoMXVOQY7n0dETGGbMy?=
 =?iso-8859-1?Q?2DloUA3cavW378qNachirIFLRA4JBJO6ELGrUaG5igsH+esndBvphOYsJr?=
 =?iso-8859-1?Q?OlIOV750Bw5DrNB2Fdyp//XGnJOgd3A1h4cgMAa5nEnrjNOGTFs+7Ji6qe?=
 =?iso-8859-1?Q?88zDVbOtruTHOX6ewVKlxiEDV7+tc4S/42a/mRJXZpt5/N+twabeSa1Ylu?=
 =?iso-8859-1?Q?Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?CgM7qRTtQ4Csf+MTZXM0zr4OGYwXYc3tVe4R6oq5GOaWFdm2xSxeTTEuxU?=
 =?iso-8859-1?Q?GEukspfBT7xwYXi/wuW37yrSiUJzYPb2xMbOLOoyTOdnLPJR/JcKKVbtCv?=
 =?iso-8859-1?Q?fWHuOe/tFortxLqJcYN85IY5VExORztfIOdd57kGH7uo4O7Y4ZGx0lSVK3?=
 =?iso-8859-1?Q?gKjFtEko+MUQrP7fn8MiM00OjzvNV1bBpRteN/sZHzjcYNZ9VQLVDX5T0z?=
 =?iso-8859-1?Q?r2TFr9Mtp8HQVl10sIFT5p5Hs0E/YuuF7nVCYyyDh+WhEnlj+bMHu2+o5M?=
 =?iso-8859-1?Q?iWI1hZEcFPft9HGuWWn4u0oh2qJviIFVMhJgZICkh9IHEXr1G5ZWYqPZ9/?=
 =?iso-8859-1?Q?R2CG6DYdfGgnTS1pYjNgrX8kPn2P2o6OgSmVXrjOOkRE0eDxPUhnDki22q?=
 =?iso-8859-1?Q?Szvx/Guv1RuF+QdNXtXhIJR3UTk505RuLH38OoIJ9ytFBFPtwi+p/KN0DG?=
 =?iso-8859-1?Q?7oMMZVU8O34AwOV84WcUWeVX0HUNKak1W0T+lxsLF8cYDOoTMJKakpC6o/?=
 =?iso-8859-1?Q?LROS/dYGueMZMkQWUVEVYKmCfLU+mYkkIEedGGbQwV/cIYJ5YCD+VcAwkh?=
 =?iso-8859-1?Q?f05oxIzY3fNtzW/4u8jT3N1GHUs9QaSXkPTMgGCIgFR4jUoNDY8q10/Jzu?=
 =?iso-8859-1?Q?wLhNRgznCt9zi7Z7Mff+frNDt+141ECOww6nnOuZE6UJjaff1aMZDtqdoS?=
 =?iso-8859-1?Q?5+0s0hUV3lX42t78JUKtePR7ZXfoi8d8Tl4gGpqeimajKph1PJdu5aPlx1?=
 =?iso-8859-1?Q?hT+nfPH5Tvhlrc6PUeloJwQnmJg5cS5ACa6iahvZ/fvUs2wTMaMBWVLORC?=
 =?iso-8859-1?Q?SAyxsLZG1jI6XlGTB/YV2cRmXBoTygi0mpsMkVUvAjEIF9iH5r6X9QQxST?=
 =?iso-8859-1?Q?2W6n0EeLuvhrZj7OLdmNqj9NSbyy6Gw4k2g6IsImrSiCcGoOzFi/fHv+Cc?=
 =?iso-8859-1?Q?klQhTSBfOaidHiJ7i4oCZKeb6boX1gU2a3EloGCoD4Due6ZesArQulOLEI?=
 =?iso-8859-1?Q?OrMBWJoKnZsshlY0hbijBMrudNs0ZvfDODxQ94VX0+WJ2p8G2ThEnXQ8sA?=
 =?iso-8859-1?Q?UpmSYn3JU8v9P4jNPp/ac49kERh2GAKcTu5wrneDYzqNzdx5uzNWDTzRLg?=
 =?iso-8859-1?Q?vFXZq6HM5QY3qKjDVlxGPJKQVzloCh0aZxMBaJOoC8I5wJLp6otDMjipQD?=
 =?iso-8859-1?Q?/aFBmU6FD19j2JL9nTTqmJK4fv+ptzMVNxcPwK1g5Hiq1kBZAE0zM36aZ2?=
 =?iso-8859-1?Q?7SkOGAERhsvBRbt+EDs5lx1DUjWQ2s2AkTB7p8Qtj86BrlCpULflIuliHe?=
 =?iso-8859-1?Q?9iKCYar3bmZLkibJuZ+LnisEfoB8kLVLVg0ErudbApNEJm3jh6WDPnLM2n?=
 =?iso-8859-1?Q?WhRC2mYqlAz3D8pKoPC+9GK0VXUXrIBaQS+eqnkwr2QaHIi3zSrWngV4HZ?=
 =?iso-8859-1?Q?Lm3dcT5+hSfiK/RVSPRRGRd8Q0FZ5eKJ7uVxZpUEaVYHqllGPU17viMgmV?=
 =?iso-8859-1?Q?uLRM0GRlOjgDQ4LjDjTvEKGOqIb3Zh2IXoZBtrBRhZ5sr0QTfHndTOJWxL?=
 =?iso-8859-1?Q?21Xcz+AbaQIWa138X+UjPOjpBZQBSgSWvu4tIqNCrQSOXAYruKA7uPIsJY?=
 =?iso-8859-1?Q?HRq0qzGFcJIIvnICfqLYFsJkb8kQr9q9f/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fedd1ec-ce81-48c4-d338-08dda4341d3a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 13:23:09.4133 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IdZbiLBWfHUDVOTE8TgwiWNWcvCRj2majowK0xcUys6ILi+50u3IMtCsgMt3Q/o0MHZHKs6bsV6LAutfgUSTJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5816
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

On Thu, Jun 05, 2025 at 04:07:15PM +0300, Jani Nikula wrote:
> On Thu, 05 Jun 2025, Imre Deak <imre.deak@intel.com> wrote:
> > Add support for EDID based quirks which can be queried outside of the
> > EDID parser iteself by DRM core and drivers. There are at least two such
> > quirks applicable to all drivers: the DPCD register access probe quirk
> > and the 128b/132b DPRX Lane Count Conversion quirk (see 3.5.2.16.3 in
> > the v2.1a DP Standard). The latter quirk applies to panels with specific
> > EDID panel names, support for defining a quirk this way will be added as
> > a follow-up.
> >
> > v2: Reset global_quirks in drm_reset_display_info().
> > v3: (Jani)
> > - Use one list for both the global and internal quirks.
> > - Drop change for panel name specific quirks.
> > - Add comment about the way quirks should be queried.
> >
> > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > ---
> >  drivers/gpu/drm/drm_edid.c  | 8 +++++++-
> >  include/drm/drm_connector.h | 4 +++-
> >  include/drm/drm_edid.h      | 5 +++++
> >  3 files changed, 15 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> > index 857ae0c47a1c3..9cca1e6e4736c 100644
> > --- a/drivers/gpu/drm/drm_edid.c
> > +++ b/drivers/gpu/drm/drm_edid.c
> > @@ -68,7 +68,7 @@ static int oui(u8 first, u8 second, u8 third)
> >  
> >  enum drm_edid_internal_quirk {
> >  	/* First detailed mode wrong, use largest 60Hz mode */
> > -	EDID_QUIRK_PREFER_LARGE_60,
> > +	EDID_QUIRK_PREFER_LARGE_60 = DRM_EDID_QUIRK_NUM,
> >  	/* Reported 135MHz pixel clock is too high, needs adjustment */
> >  	EDID_QUIRK_135_CLOCK_TOO_HIGH,
> >  	/* Prefer the largest mode at 75 Hz */
> > @@ -2959,6 +2959,12 @@ static bool drm_edid_has_internal_quirk(struct drm_connector *connector,
> >  	return connector->display_info.quirks & BIT(quirk);
> >  }
> >  
> > +bool drm_edid_has_quirk(struct drm_connector *connector, enum drm_edid_quirk quirk)
> 
> Nitpick, this could've been const.

I'm unsure what rule to follow for atomic object pointers. Ville said
once that unlike atomic state pointers (i.e. drm_connector_state for
instance) these shouldn't be constified. Maybe that applies only to
cases where the object pointer is passed on to another function (so not
in this simple case clearly)?

> Regardless,
> 
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> 
> 
> 
> > +{
> > +	return connector->display_info.quirks & BIT(quirk);
> > +}
> > +EXPORT_SYMBOL(drm_edid_has_quirk);
> > +
> >  #define MODE_SIZE(m) ((m)->hdisplay * (m)->vdisplay)
> >  #define MODE_REFRESH_DIFF(c,t) (abs((c) - (t)))
> >  
> > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> > index 73903c3c842f3..137773dd138ea 100644
> > --- a/include/drm/drm_connector.h
> > +++ b/include/drm/drm_connector.h
> > @@ -843,7 +843,9 @@ struct drm_display_info {
> >  	int vics_len;
> >  
> >  	/**
> > -	 * @quirks: EDID based quirks. Internal to EDID parsing.
> > +	 * @quirks: EDID based quirks. DRM core and drivers can query the
> > +	 * @drm_edid_quirk quirks using drm_edid_has_quirk(), the rest of
> > +	 * the quirks also tracked here are internal to EDID parsing.
> >  	 */
> >  	u32 quirks;
> >  
> > diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> > index b38409670868d..77fd42608e706 100644
> > --- a/include/drm/drm_edid.h
> > +++ b/include/drm/drm_edid.h
> > @@ -109,6 +109,10 @@ struct detailed_data_string {
> >  #define DRM_EDID_CVT_FLAGS_STANDARD_BLANKING (1 << 3)
> >  #define DRM_EDID_CVT_FLAGS_REDUCED_BLANKING  (1 << 4)
> >  
> > +enum drm_edid_quirk {
> > +	DRM_EDID_QUIRK_NUM,
> > +};
> > +
> >  struct detailed_data_monitor_range {
> >  	u8 min_vfreq;
> >  	u8 max_vfreq;
> > @@ -476,5 +480,6 @@ void drm_edid_print_product_id(struct drm_printer *p,
> >  u32 drm_edid_get_panel_id(const struct drm_edid *drm_edid);
> >  bool drm_edid_match(const struct drm_edid *drm_edid,
> >  		    const struct drm_edid_ident *ident);
> > +bool drm_edid_has_quirk(struct drm_connector *connector, enum drm_edid_quirk quirk);
> >  
> >  #endif /* __DRM_EDID_H__ */
> 
> -- 
> Jani Nikula, Intel
