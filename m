Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00128BB3FAD
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 15:05:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CAE210E7E3;
	Thu,  2 Oct 2025 13:05:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b8SrYz2j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED72E10E7DC;
 Thu,  2 Oct 2025 13:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759410345; x=1790946345;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=eByqrun1MDar51M+tUsdYzMD7nDDGpZpUEPRywabV9c=;
 b=b8SrYz2jNvFRENvM5l2Cl94LB8goy0LM9QQoeoA2QbtP4QuPERy4QYRi
 YaXtXo2VTv6cESsdnyu00ZaBXeGs4SkuZduNp0g3VrFXOGk0lFV8COHyT
 VRHB6993QfPOo/68kaPN5tFrBmqa1NsTB3Rsiz5DbN0/FyyZnLEgD2Uwh
 IyKDB1EAxcxKK36wHqlnYytVuI2/4exj8IZ3HWciYWQ4n/H7eVBbv1BJK
 Kiipns62Qjm9jgO9X1XhqMkTzlNn/AP5HaqNL0SwBaFxMlNcvN948Okv2
 iZ38dad6OBvL5ms4fcvFuRLrH/xv10qBMV39/F+d8nayRJqeVXI65rv09 Q==;
X-CSE-ConnectionGUID: ZGDwvC43Ql6F8TfzziIE9A==
X-CSE-MsgGUID: oSUBmkJpQqOIFXyQQ5GtNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="61794695"
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="61794695"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 06:05:45 -0700
X-CSE-ConnectionGUID: tjYMFPxaTiax+h77LI/o3A==
X-CSE-MsgGUID: CFnL76C0RaWYWGxvOfkRuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="178989865"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 06:05:44 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 06:05:44 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 2 Oct 2025 06:05:44 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.58) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 06:05:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VxMj7lkUU0AVGg/iV4W0kFuX7xGBBIXM/pMHAK3dk/PWlW96M4uxOWRyvf8iSBk3yEacol/ZQ/v4xno4T6PVXActEmE1QLS5/8h1bLyAo8QLVzfKZOXU24/Jd4fwd0qm/5KhpmJVegLffXFBK/1Igo6i6cNJ+iO7TT+2Ab/BOQy+upB8GtnEmdvmzIl/uYKdqGGWk3OEFsNbLHqsknF3r6KTe9w/JftjHC15A/Tk7x8eiYZYogfos+QoV5SjRq7F3vt7cRvJaB3H4UYvVbqhIYHiaM/aYSL5AOtYcBFHY1C9odgeJvqIxANKpxjcCpaaWwcA5uLoHpQW8XHDDZLvdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YdCbeVau+1s8HhtDHo3jROanYPo5UwUL+nF5aGXpWRw=;
 b=xvYfCHFbLhesYOSs7OBOgC7NrsXV2uMKPaAEOEG7B2s5ucZHIiDcj9dzf6tiWnpYPlh+SEOZ/D5D/MBgvCwT6TobXgwdxAh3FYpi1cfgpRDPOqPcVll9LVweock0AN9XPLoU6nSPu0U2VrdLXSEBvQIKMQfLF23JURyN4fnHPwbpSLVo2kbV1VeVyCMocBMGLsgysYFVpiQ2DXGkgW2lG3HWYHwxX0Gg9ZvqkpdxxGQibFrX5A4m638b4cQDOEeE9qAx9ddWBjvOvskGGO8tsLRds2P8jitxgF7tgsCno7eyOgL5lUwiFcz7VK0upT27adItO34080CymZTaFsZXUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CYXPR11MB8691.namprd11.prod.outlook.com (2603:10b6:930:d5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Thu, 2 Oct
 2025 13:05:37 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9160.018; Thu, 2 Oct 2025
 13:05:37 +0000
Date: Thu, 2 Oct 2025 09:05:32 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
CC: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Alex
 Deucher" <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Michael J <michael.j.ruhl@intel.com>, Riana
 Tauro <riana.tauro@intel.com>, Anshuman Gupta <anshuman.gupta@intel.com>
Subject: Re: [RFC v5 1/5] drm/netlink: Add netlink infrastructure
Message-ID: <aN54nJahNKHQ3Tcr@intel.com>
References: <20250730064956.1385855-1-aravind.iddamsetty@linux.intel.com>
 <20250730064956.1385855-2-aravind.iddamsetty@linux.intel.com>
 <b84ccec7-3971-4497-b563-21b4807f0c98@oss.qualcomm.com>
 <b0447abc-5082-4c87-a21d-6a43de5c788c@linux.intel.com>
 <b92002ac-0fc7-404f-92b6-6bfe9964dfac@oss.qualcomm.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b92002ac-0fc7-404f-92b6-6bfe9964dfac@oss.qualcomm.com>
X-ClientProxiedBy: SJ0PR03CA0149.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::34) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CYXPR11MB8691:EE_
X-MS-Office365-Filtering-Correlation-Id: bc2d4a4c-15a2-4a6e-a21f-08de01b46137
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?cGXrjhUF8Q/HJ3pDTkwNd+x3n5OIUSVauqZnNHd2lDukifr6FAEFSRY0Tw?=
 =?iso-8859-1?Q?xBF1qFAV/Wl02Wn7YkBW1IIKdIztMPzfubINppaRWhLJ7frQhhMZa1HB9k?=
 =?iso-8859-1?Q?apKhTm+ZggqrHVgtGTY9mwips94BzJtZvfnq4vRXDLff3Jf4njT0u4HjOZ?=
 =?iso-8859-1?Q?Z6Ma5Pnx8p0NFgP3QnXvsJnlo89ZG7YvQiPi8XN9ZZdQ7eTKS9RVnUzzvn?=
 =?iso-8859-1?Q?p28juQA6yfW5hrDWC1GgdUyDLEgAXpNbYx1pigZ1bIz/IbWIwM8yxdgyyo?=
 =?iso-8859-1?Q?eg+L9SuKd6baRWFiEUmE9V8129dXKZaSJpSU9ltgCMKZNQwqN8ryMoQmBY?=
 =?iso-8859-1?Q?Y730V/Gc7KapY43PZu39VWzaUdNLQlxQiyHCQYYXz6CGBmkAViPMRZXkYt?=
 =?iso-8859-1?Q?j1/NnCYIhYhQy95MU5ZnaVAOIo/lha0aTKxaFYbl/qOd6XBFue0WvgZMYY?=
 =?iso-8859-1?Q?wADbBy16gJPsm2/pAroHCv+GXrhyjUyLLdPCCGhqJ46LSf5AbYJiAN+H6L?=
 =?iso-8859-1?Q?rznf1hCXV2euLtu3LJRE1g2net+oLjM7metchLX+56dilsSH5wcshhDdcw?=
 =?iso-8859-1?Q?QXkuLmyZaiy6yHFu44hNS6DcYiy4dbswmu/eXiW3A35DoLLLn8ITM6N1vw?=
 =?iso-8859-1?Q?b0bVQvLNitX/nVmpHAgplNbyfoHQiyqweg3bY3rqHAjvmil68Fpk2sk+2c?=
 =?iso-8859-1?Q?gsBPZeNGEEsYKgZnK+2yFy23Nl4ZbKr7VeDx5BH/NvvYIvViMOQARDwAyi?=
 =?iso-8859-1?Q?8Fs4hp+vBK3C6ANRHbbtg1I/pPEVmWjNw8EOnVf9AIU3OI4AwYlf4SwLYW?=
 =?iso-8859-1?Q?ZQGKAXaeasIabewV0u6oxPIX0m53YmFHMEG0EMsKE6Ay9C2PaqtLN4K0pv?=
 =?iso-8859-1?Q?6sEPgotXXm9WtumcmduNgJ/cJj/wpERz8dAdRXr2BoHzyMnuka4mlDUJt3?=
 =?iso-8859-1?Q?zKBckBr4O5gW1v0zthGRJz0+s3i5mK8S+SnoRoQU989Dxk4Bpqe1rd7S2i?=
 =?iso-8859-1?Q?7x3ttD08WhiO8o3i1iu5rgJHE9AkdPilpa4/O7Zx50HjZRAvlW6ogSGgm0?=
 =?iso-8859-1?Q?3ZVpChcweMmZX0QEIaRRmy8WRRBzN7v0FfCI8c7jpMCGwGrx7ft6Sy+S25?=
 =?iso-8859-1?Q?+lxAttUw8QGdIr/2tuicpgi+I1i7ChI/pNgbXNRxaKykX9sPo5qaJHFFjp?=
 =?iso-8859-1?Q?f/Tv5ttIl0yUomsgEzJ4t7dCwXiHNXqguTcLFgwKJb7rTib5rsa62uZU1D?=
 =?iso-8859-1?Q?dsNqw/vgUju23JLL39TpqXUi6WID7HAkc8jindyeJWUO2zLkilH511GlOq?=
 =?iso-8859-1?Q?Mp8wBYZfz/UG7xum4CW+z78B3to8pRBXis57dVX8GFmX7yS6/HraeilrkI?=
 =?iso-8859-1?Q?jOUd6Ig/8CP3A1cYpJA3AJTt4MgzL5dViz3Wx/WScXewlwpoBTLq2Fd6Do?=
 =?iso-8859-1?Q?TNEahMO9swfh2MOXL4q4Qj24GL4xXj1WHdBA7F9NeKQesycpMsgFbogE2h?=
 =?iso-8859-1?Q?LEYod5s4RPmTwAn+ynQcIodTD0sUNodsKmD3mwFFfBEA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?x6xjrNWCSD0iNdfyShweDTe9Nvvcvqr+UzLU8ZoGM0bus1XXwTwllXxLag?=
 =?iso-8859-1?Q?C1ii9t8VULPpFegitXpzGKhIyfcgeN2GTy5RrFkxPQ4/n41FYRLVrwvMa8?=
 =?iso-8859-1?Q?zOxA1ttuSpQKLm6QpDUTZx8EbB9RdND3ZREaBH6wC9BkyJZgvmiEmg474O?=
 =?iso-8859-1?Q?6GHm9ZqVXBWqVTclqp4lKmgbbNu91NVvLvbNXYYjQnJkh1YGho341KvSXA?=
 =?iso-8859-1?Q?P8ogCmMxhdPmTZFonQv9zUb9ZKH+BpadQ7+ofjVrAninIL3+AqHe8OVMdG?=
 =?iso-8859-1?Q?Ti4A1EViAcK1FxNfLa4Ae5QYJGT4wOlZctaT8V5gesK6rkUvmr1o93ysUn?=
 =?iso-8859-1?Q?S0bhxTZXzy6NimkfwwY1FCLc4Ggx+gG8v6P7OBgUce8IOxP69h7gESSoCX?=
 =?iso-8859-1?Q?QFbthwHL7ucThMMys91KhSL9rGrtr51b8vYSuMWJxvwi5LHMG5BGbxC5UG?=
 =?iso-8859-1?Q?aY+rEE7LtmBExx3swZDhbNQc4IEEhqVhERBM5N1HJeLVQMUHYOdlCu8uJ/?=
 =?iso-8859-1?Q?fm4hHgN7lUM1CrscYbuWIDq5PormrI9C/Ovry8o85h/k0a2L07nFSDvVQx?=
 =?iso-8859-1?Q?wEhGXojLRaq5ID7JEVywdlgFBmr7i8uXfjLjDdGSUer/zXLhBUpEOpuXrw?=
 =?iso-8859-1?Q?o485QpD7vEhJbFhYmL7wwO27AM48xFmu1lRuhcF9mEUvp+lvxjk5QXATEJ?=
 =?iso-8859-1?Q?g/9dSgV6KFJgZJOUAZ8vu2na9RiIPoOyxVCQR5wqi7jifOWhAyLc2noX/O?=
 =?iso-8859-1?Q?bxetASRF3f6KYsuzcfzE0rVrFK7ZcwwidQJ6toQgSN9KqiW6FcPmYWqBJi?=
 =?iso-8859-1?Q?1hAPRdlDRQDvUckss20DayMFkGqatIsvQYdd70OkVfTa3Jf0HovyEXrqlF?=
 =?iso-8859-1?Q?wZPRdsKaINHAD5ZDktKTmfY96tm7WQRLUEVWpKld3DpGnYg7U3dg5GnBE/?=
 =?iso-8859-1?Q?BUmj2cYxpvHePFIn37+W9ysKXocCplxI+IXSAf6NEhb0+wk/Jc1YpyWyXv?=
 =?iso-8859-1?Q?JJncydKGXXMM+dv5FJLHSOHIYjWl0lEjCByE1GLiHDh7qXJN8IdnHiE9Ay?=
 =?iso-8859-1?Q?vpZl8rGrEzk9oUlFkdfbHl4Z4pCQpr8lI1/06hpXlv3T1kgmNa0osdUOj9?=
 =?iso-8859-1?Q?/KA7igqYQbBCu3SSG9j3jlC8BQR/xr24O3mFxQtHekMT5KZ3QpuR/pLjUA?=
 =?iso-8859-1?Q?PH1ABgka1ZoRVJ3J4UbeN4C18RW/VGmUulEzi274dpWKB8OmntNpdHUB0W?=
 =?iso-8859-1?Q?dibF0tR/xANSw/UEOfPQuZjMS9VXofqryk/UyAdB199Z3ohO5efeaPhSXK?=
 =?iso-8859-1?Q?KVFw/2sDmPVZUXNfUttbtgZ1Npf/Dgu9LGX5/rDVPIjK8TffBTDWA1dQPP?=
 =?iso-8859-1?Q?pa+kz1iakqVYo/wGUhjs3YjquJmrRqlBwYp5WD0Y3dP5Zqwo1iDfx0Rmg8?=
 =?iso-8859-1?Q?N1Shq+/K4xa7l5C7sS1V0EbEzjWUkOZ/fzaYX6r/qDdyZ27S8jqirpHXwn?=
 =?iso-8859-1?Q?OIH5S7IPY1S+ZLSGCbSKkfW4gHDVc8gJAwiOM6OkTnMqTaV6uKUZXq4up1?=
 =?iso-8859-1?Q?AeOdG2SeD2D3Su8RyeUBg+AXTpmyRO7GmNCcN7Zv1wUkSVSEvX34O4Nlps?=
 =?iso-8859-1?Q?sjuhtZkTm0gs9R/6hlBaUskoKUFA4D28Dm?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc2d4a4c-15a2-4a6e-a21f-08de01b46137
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 13:05:37.5095 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5W76YBjxMQKD2oErORKd7MnfR+w41oOHZiKw9WN2/+rCozzDZ4Vl1LyCOUxCeFuNuYUxpd8YVj7XSE/xUyQkRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8691
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

On Mon, Aug 25, 2025 at 11:31:49AM -0600, Zack McKevitt wrote:
> 
> 
> On 8/21/2025 3:45 AM, Aravind Iddamsetty wrote:
> > Glad to know the interest,  at present the code does create drm netlink
> > family for accel device as well, but it is tries to register with the
> > drm primary node name which might not be present for dev->accel,
> > checking for the "DRIVER_COMPUTE_ACCEL" and registering with the name
> > will fix that.
> 
> This is correct, trying to access dev->primary->kdev->kobj.name through an
> accel device will cause a fault. I believe your solution will work, and the
> node name can instead be retrieved via dev->accel->kdev->kobj.name.
> > But also to bring to your attention the current series focuses on
> > reporting RAS errors and hence the commands are as well oriented towards
> > errors, anything specific to telemetry needs to be added. Do you have
> > any thought as to what kind of data and what kind of command support you
> > might need.
> 
> Understood. We will likely be interested in RAS functionality in the future
> but thought this would be a good avenue for telemetry as well since our
> device currently has a functional RAS implementation.
> 
> An early prototype for this might add a new command for telemetry and a new
> policy with 4 new attributes: the type of telemetry to read/write (e.g., SoC
> temp), whether the request is a read or write from/to the device, the status
> of the request, and the telemetry value read or written. As actual telemetry
> fields are likely device specific, these can be defined in the driver's uapi
> header and passed opaquely through the netlink interface.
> 
> The above description was sufficient for an initial prototype on top of our
> driver. Mostly, however, we want to reiterate our interest in these changes
> and will keep an eye out for a future patchset that incorporates generated
> boilerplate from a YAML description.
> 
> Thanks again,

Hi Zack,

thanks for your interest,

could you please take a look in the new version and help with reviews and
feedback there to see if that is flexible enough to be later expanded to your needs:

https://lore.kernel.org/dri-devel/20250929214415.326414-5-rodrigo.vivi@intel.com/

Thanks,
Rodrigo.

> 
> Zack
> 
> > Thanks,
> > Aravind.
