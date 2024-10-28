Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E84A99B2E9A
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 12:20:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EABB410E27C;
	Mon, 28 Oct 2024 11:20:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UCV1K2GJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC78F10E27C;
 Mon, 28 Oct 2024 11:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730114430; x=1761650430;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=s/ys3wWK78AnU5snqjY5U49igKiPcYpTg+CVPb45NB4=;
 b=UCV1K2GJjz02u3c6LkMN859lz3uWW6P2pD0FP8OhK20Gql+Kxt3WrakT
 jPJVevLGVP/l2EgNE0xdDqvvF8nhijcO8qqijiUzpFN0dMQcMxfENRMhP
 2xO6GF78O3SJcLiWMvtNRm8cC5QEb3Yo58xJ4uc2Gvqt4xM37HnO9xvPU
 CipXMbm9xva3wGSQGrxYEq18znRgXdQoVRWokPppcrDiIsinoHaUHtuxR
 Tin9bMW8rJl6tkYlO4fiQeF9Ncw/py9lWuD6rkT4Q3SIxWqSsm+frcpUy
 myoLFB+a76ihTOqjD8pZXjGDPI+HBqvl5u8HZmbnJ950ImynACfpecuyR g==;
X-CSE-ConnectionGUID: FN+OICxESXOg9fEg/6LSNw==
X-CSE-MsgGUID: 66hrMfHnTdmpnaAfdzfIFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29479328"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29479328"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 04:20:29 -0700
X-CSE-ConnectionGUID: QDWYcAfKQFKu+spb3vCEpw==
X-CSE-MsgGUID: PsUmy5YFQ+64vUoNSUPiIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; d="scan'208";a="81908597"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Oct 2024 04:20:29 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 28 Oct 2024 04:20:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 28 Oct 2024 04:20:27 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 28 Oct 2024 04:20:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KVQ3ERDmxL4d2eP9GUj0NYeZrxkPJvg0ZsNRKAiWKUQAjKQjlsHvwnGgj5C6nS5ocwXJg0U/tlzSOHoHbHRl3xZzA/nYSmctUl9DhdcRDVFdjmPRn62NgyPn2XFVddvwf2sRYfcG8X/Ni78M8uvVV8/UT6/p35mhDh/c4gVwm15fykzIok1V0+GtG+Yp0G2yVfK76YMh5j6Wl3jDDaODcR+vcWWPq9YMHtPntwj9KkZF4USGzOoTVn/pu2ckidKPPKu8D/DyDDlp2hE4q2jXeMty6qSNXxmQ8ofYT0AtU2gqO0PZjM2jpAc521uvnm1/7i9XuRq9/h+fh68NwPaIWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EcYdBNjXg8GwBXGlLpkI0RGATDARN1CkPvzZK6DEupI=;
 b=foVTj6r/ghvKr3uCeKPlVG630z2JfEOLFuCKQDLAN5FGUcple9DAnem0fKe//elwpIjf5EBmeYHpU9fPTWpLmQTZV2S0+t1HOcRg3TnrU98L+f743mw2D48/3FDlArDOmGCiLHRoqGhJagZwe9ip8eTElvcMN4j/XbDRZgznzlt/SnxbM8Zc5ur8LSp5WWpRmvzByOpuhQV69ewcp9G0zraNAdtOmzmqhjGrFBsoaqrm7LJm6pBDmqKDG1gw2esbdlZS/2AcrRdN/pSPZSlqfGvjZGLiRmKsYIEgN50AQ+26MY2yAVUq9ZgByxNx4CzZmWzp+y2WYIVSPmbr6kZ28Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5365.namprd11.prod.outlook.com (2603:10b6:208:308::18)
 by DS0PR11MB8207.namprd11.prod.outlook.com (2603:10b6:8:164::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Mon, 28 Oct
 2024 11:20:24 +0000
Received: from BL1PR11MB5365.namprd11.prod.outlook.com
 ([fe80::8637:9cfc:1235:8987]) by BL1PR11MB5365.namprd11.prod.outlook.com
 ([fe80::8637:9cfc:1235:8987%4]) with mapi id 15.20.8093.023; Mon, 28 Oct 2024
 11:20:24 +0000
Date: Mon, 28 Oct 2024 12:20:21 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: <linux-pci@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, Christian =?utf-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=
 <kw@linux.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matt Roper
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v4 5/7] PCI/IOV: Check that VF BAR fits within the
 reservation
Message-ID: <2i4733f7fc7qa3qrseq4pb2u32k4ckh3ns4cmsj4czbucpd7mw@i7e674csuedb>
References: <20241025215038.3125626-1-michal.winiarski@intel.com>
 <20241025215038.3125626-6-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241025215038.3125626-6-michal.winiarski@intel.com>
X-ClientProxiedBy: WA0P291CA0011.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::23) To BL1PR11MB5365.namprd11.prod.outlook.com
 (2603:10b6:208:308::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5365:EE_|DS0PR11MB8207:EE_
X-MS-Office365-Filtering-Correlation-Id: e9ea5cfd-aeb9-4f88-abae-08dcf7428482
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V0hDRnI4aTRLQjhVbnVNdTRrVDdrTm1ER280TythQ1lxd25rS2ZIOGNGS3BM?=
 =?utf-8?B?SWh6RkdIK1lVQm1DRlBJTERhTUFQYVRHV0xCMkd3MnpSN3dQcVVaN3NtcUxn?=
 =?utf-8?B?cHB1OStTWmkvTWJFelFJSnRlc21yWUVTUHlJVWVzWWZlZ0h6RExxNVJ6Yk5z?=
 =?utf-8?B?aDVNSnFiYzRDWmM5L1BBVzhQZXpVcm1uMTF4S1N1dE9IMU4yMy81VkwxQXJy?=
 =?utf-8?B?a0dqbTFUR2c0N3pkQ0txZ2dyMHhuNXg3Zm8wVmF3ZTlDZlNZTjQ5NHJFMzk4?=
 =?utf-8?B?Z2dLK1c3SEJONnlKQWcveFFSeFlLRS9OQldUUks2L2UxRUJRcjU4Ri9RZ0dy?=
 =?utf-8?B?eDVVYTRBcS8zSWVoZzJYOHdPV2VocWROUVJQS09tOURQUGJKbjIzV0VrWklz?=
 =?utf-8?B?SEVYcXBkWFdUWTlVSTNhS0FFdDMrQjdLRnZNbE5QenBaMHJRYWI2L2JGRWxI?=
 =?utf-8?B?TW10R1ZmQTJsYTIyZ2RMU3kvd2cxcDMwbTBBM3BzMU9kUGdVSmx5YXo5SXA0?=
 =?utf-8?B?MkRVWEtyUjF3MDZySUY1bjdsZjlHOHp1c1RKcW5IdEcvNjJtZUE2UDNjZm4r?=
 =?utf-8?B?MFJLLzdpdkh6Nm8xejg4aU5Jbm5EM0ZzeGw4M3ozUGFKeTBhcVdUYW5pb0Fz?=
 =?utf-8?B?RG1QbXk4NllabDBrK09lUXpZc21xVGxFV2ZmYkxHdmEyMUw3RVBCbFc1enJp?=
 =?utf-8?B?MGtoTjlYU0J2ekgyNzFOdmdrMHpMZkdpNC91d3VSS1NGdzBYMXRteHA1Yi9L?=
 =?utf-8?B?UEg5bHI4WVNzRWhZSWRzZGJrVjlURk1DRlpXRnpxaDFiUDhVY2IvNzJxTDVW?=
 =?utf-8?B?T1lOQWpYeGsrOUNuakZ4TS9BTVhsbVIwRkFZdy9SdGd6bkdUN0pES1ZhaG1w?=
 =?utf-8?B?akpJdHhOSGNhRFYvdHp6cDlYUkFYSFlJbkVsQ1RYUDJmdlJUc1FMeUg4V3d1?=
 =?utf-8?B?c25VdFhNSjlHV3pqUDBwTnF2UEV3SGxGMFVrbG5jLzg5VEJsTm4xY0krWm9I?=
 =?utf-8?B?MnZyZDJJMlJSbkprSGNYbzI5MnJQd0VqSVRFbGU1aHlsaG4wVSt0ZlM4cG50?=
 =?utf-8?B?NksvUzN4MHhJMUhsNm1zRitRSEk2U1VlMGhacVQ5RjlPanArbDUvamRuczBs?=
 =?utf-8?B?OU1sTTVxREppTXgram9rcEdBdWI5ZmZianBFRXdsMENsVGJwbXdjS0lMMHJ3?=
 =?utf-8?B?U1Q0VTlUUVFWVXNRRElHRTczbmhyRlhTaTM1andUN2RtM0h3d0FyWllwWmZU?=
 =?utf-8?B?YmZvdElxeE1jT3BZcitXUnlQREN2NStYZjl4K1gxaERaeXlzWjlQMU5iNFp6?=
 =?utf-8?B?aFFxVlIzaHJhZ1FtOVNPSDIydDlGd1l3dm8vNEFseFdmREIzTU4zTHNPZG9q?=
 =?utf-8?B?MEJaUm9XbVVqMENvSzBSNWNYOTBZdVQ1RGYrTjRGWDVjeEtoOHFaa2hMdTFw?=
 =?utf-8?B?SHJOUWdUWkJBZm5ySjdldGVBWmRXTVNiTStEQjBuNFFmMmxXYm93Tk9MQVY1?=
 =?utf-8?B?UmxGWCtMUXhJZlZFdU1BdzB0MldvNjJGZkZnKy9hRDhCNFlBdTJ6dnV1VWFy?=
 =?utf-8?B?NkNvc3Q2ak4wcE41V3ZsVVo4WjNhVWo2QnhUalQ2Zk5kUU1HNE9jelJqc0pk?=
 =?utf-8?B?WmFqZ1kyTXBieFc3TGEyK3hWR2kyYjFkOUptNjRQbkZqWXNaWml0a3ZhYXNT?=
 =?utf-8?B?a3dTU3VQWVV6eXdjTjduMjJXWFdjZWFTMTFuRXlvMXUrdGlGYnJ0M016M2Zt?=
 =?utf-8?Q?nOt1fwBdgzj2oHZ2NBGeJYDfg9un2XUT8yy706E?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5365.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sndub3huQzJzV0R6VFlGWW5aRXpnMWpNWGxjcVF5RUs0MGtnZ01EK2xwNGxx?=
 =?utf-8?B?M1ljZUNBY3R2bnI3K3NQQS9Ud0hKZlc4Y29zNlBpdHA2REE0bkVQeStiUzda?=
 =?utf-8?B?Y0sxUFg0aVpEWENORGZ3L0Nodk1RYVhZOHdWbUE3QTUvOWZsdE15WDVJRzM1?=
 =?utf-8?B?VERlOVhEWnIwaENydmFMRFVlZlZMRkptOFIzdkpibElPQ0xNeE1Xa3psVnJY?=
 =?utf-8?B?aDJVZ1BFNGVvSkZTemJJQW5pQ2IyVlI1ZkU4RWJaYzBpSjNNVmhzQWVSOFpm?=
 =?utf-8?B?SE02ZUczblF4eG01WWs5Y21HSEFXN2tLUWJnQllnanlaYjlkRHd5N0lmYk5K?=
 =?utf-8?B?YXRzZFQ0YlZjc1NwMHphWnZZcEoxNk0rTGZkYTViK3Bnb0QxK09NUnQ4VlpG?=
 =?utf-8?B?Z09JdkpCMWlFRXY5K1ErZzRJYXRMRWdSZVNBbjQwMmpqTHIrSDA5VDBYaGhV?=
 =?utf-8?B?REI4UFhkdDFZZW5saWl5aHFiaHhNU2cyVEN3V0ZNTVFCL0NsN3hiTG55Q0NI?=
 =?utf-8?B?TjJKLzJLODJhaXBWVWlKd3VyY0ovQ1R2bjJCczZCWUVlSmZwOUN5d3ZZWnVN?=
 =?utf-8?B?ODZ5T1J4NnZnTG5kVkVJNnhpQmc3cGcvb3h1Mkc4UThyZERJcTZRanlTWC9w?=
 =?utf-8?B?c3BvTE5PaTNlK1BJVnZVd3VVVTA3dHU1NjdURzlhZk9FU2k0dDJaeE82THg2?=
 =?utf-8?B?Q3QzcGNaZ1NoWTdEc0d6VkVFRXN0eEhic2UxbTVSOWRFVWlnV01NTU50Mk50?=
 =?utf-8?B?bU4rbEZWK1EvOTBoZ0Y0K3pMUWR3OThtSXlhSHhDcUF1QzdxZ091NlJ4VHM5?=
 =?utf-8?B?REJBeDZEWXIySWpmNDVlSloxQkFzQTRsOTN3S0orcGlJLzIxNkRNOVVKenJt?=
 =?utf-8?B?ZW1vdDB5Vi9YaFRXMzFvR3Y1b1Y3RUtUOHZ4NUs4VzFWbXgxQTllQ2JqVjMv?=
 =?utf-8?B?NGsySGh3ZkVtby85OXk2VHNhaXFmL2FQalpzYmdYVTEzdGdUbEJ2VVRBVksv?=
 =?utf-8?B?UjZtaHpNelYzZndRQy9HNjIvTUZieUJGbFZLUUxUcVZFY1p0dkJpTVkvT2Yz?=
 =?utf-8?B?Q0hRNStVcDdqTEtPblpJMmRlOHVXR0ZiZEV5UThuUzNUN0FiYjhyVmZWUWFv?=
 =?utf-8?B?a0hocXp2QUpDblR2S2ZxVHBISTVxejA3YVNxNDFuWWVSckVuMXRQMXIyVnRk?=
 =?utf-8?B?bDBTSDAvT2kzcVBRWUdFSTdTVVgvVGNoQ0t5UzdPWS9sM0FmRnRRbFY1S0l5?=
 =?utf-8?B?SlFONjBPcjdBMmJRSktEY2Ftbkp4YnZ4MXhiVWpmWFlXaEJDRVorTGU5a0lX?=
 =?utf-8?B?S0xoWkMzMFJkRXNMaHo2YmY1M3Boci9kNEhoenIzcjFSa1kxbjNCRGlxQnpR?=
 =?utf-8?B?TmpuK2NMd09oU1NMQ0NEZ1lkNDJ5LzRVdERqRS96Z0NsZWliYzFVTy9BRWRy?=
 =?utf-8?B?MWRIUm8yWmkrcmlENUtDbHhIVVphRDNNUUNrK0RZL2FST2RaVU9KbStBV2NN?=
 =?utf-8?B?NVM1V0RSMmM4UGpXR3I0RmQ1RkZiT0x4U1pLQ0JOVVJ4VnAySHN2cFl6Zktq?=
 =?utf-8?B?OTYrTmErMGhIOGViOG5BcStSNUZZdVBqY2JobGp1bHZJUzVWRjZsTllIQ0pS?=
 =?utf-8?B?NzBJTTc3RTBsd0Jad2ZnRnEyMFFIMzB5WmdQWVppSC96bTBWMTVWQjFYRFdJ?=
 =?utf-8?B?Z0NkeDd1S01BdHJ2ekwyUXZTU3BocS9PcjlVT0FlMzNHUlJ0NHJqM3l1Ynds?=
 =?utf-8?B?Tm16aVM2QmtPeVdkNCs1L3k5a0wzUkp2a3hPK1Z1QXZ1VWh1dVc0M2VjTkFU?=
 =?utf-8?B?VGgxakcxNkdBT2pZVmJ5aEZHelFmaFM4QnhWU2tpSW1OUXd2OXFlWExsVHp0?=
 =?utf-8?B?QzI3OTY2NUVWTkFKMmJsZ1hsU2kxamNaN0xhTWtEekJEV1VKVWdLeWpxWlJq?=
 =?utf-8?B?U3ZHQmMxc05LNEs2YmwzOGFESnpNYWdvNnM5Q3hCQngrMjNDaU5hYXlLbTgr?=
 =?utf-8?B?VHVJc1o2ZWlsU0MxeGNaNmJ5ajg1K0NqZ0V0eFBjS0hCbXQ1NENvYnNHdGhu?=
 =?utf-8?B?dkVwYjRTb2QvYXY3QkE5dVhjMGN5SVJYSkc3TU1scWQyWllINGNNQ1ZXbC9a?=
 =?utf-8?B?aEpCbXA4dGNJV3VRdjdGWmZCdXEwd056cEpES0VIVUZOZENrK1pkMUtyNElE?=
 =?utf-8?B?ZWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9ea5cfd-aeb9-4f88-abae-08dcf7428482
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5365.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 11:20:24.5665 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KjuwXbrt7OnyXkns0yhfq+5Uh7iVH6WLp2Ie/y4zUWB7WibkW4rMWZmDSsz/FcCiwDHYEVsTm2japYC5M+agSQCFqqicJUbK9LNYgmmAcgc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8207
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

On Fri, Oct 25, 2024 at 11:50:36PM +0200, Michał Winiarski wrote:
> VF MMIO resource reservation, either created by system firmware and
> inherited by Linux PCI subsystem or created by the subsystem itself,
> should contain enough space to fit the BAR of all SR-IOV Virtual
> Functions that can potentially be created (total VFs supported by the
> device).
> 
> However, that assumption only holds in an environment where VF BAR size
> can't be modified.
> 
> Add an additional check that verifies that VF BAR for all enabled VFs
> fits within the underlying reservation resource.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/pci/iov.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
> index 79143c1bc7bb4..5de828e5a26ea 100644
> --- a/drivers/pci/iov.c
> +++ b/drivers/pci/iov.c
> @@ -645,10 +645,14 @@ static int sriov_enable(struct pci_dev *dev, int nr_virtfn)
>  
>  	nres = 0;
>  	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
> +		int vf_bar_sz = pci_iov_resource_size(dev,
> +						      pci_resource_to_iov(i));

And that should be resource_size_t.

Fortunately, CI caught it:
https://lore.kernel.org/intel-xe/172990062085.1334319.8298861567163770193@2413ebb6fbb6/

I'll address that in the next rev.

-Michał

>  		bars |= (1 << pci_resource_to_iov(i));
>  		res = &dev->resource[pci_resource_to_iov(i)];
> -		if (res->parent)
> -			nres++;
> +		if (!res->parent || vf_bar_sz * nr_virtfn > resource_size(res))
> +			continue;
> +
> +		nres++;
>  	}
>  	if (nres != iov->nres) {
>  		pci_err(dev, "not enough MMIO resources for SR-IOV\n");
> -- 
> 2.47.0
> 
