Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C02ABB322E6
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 21:33:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64ABC10EB8C;
	Fri, 22 Aug 2025 19:33:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G+XlR797";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8633910EB8C;
 Fri, 22 Aug 2025 19:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755891206; x=1787427206;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ds+oy5DYQib3+GdjCUn5ovl+dV7DUa4wlFMM5qpdyS8=;
 b=G+XlR79741Os3Om3w2tRhpFawQ0bGyb4wMBx+WgZBI/gG3CiInAauabo
 5IL45wshTOpDgELC2tVKFp46hnraGZqLmRhu812Xqoe0AukO1CnkMlMSX
 RkPhKP0WHEp4MyAlDd5QrlRTQ8kELxcOpQtZtbXGGRTx9daXWplMsWJ1+
 zH9bLGOQWhnc9cf4+YJomCCxqCfhFees4px8RpuK57R+2W+MhdF1Uz7wr
 kaIQko5LwouI9Tl88ZVa6VT7xnKBuMe59bFyMwVBTxsUTLFCYRNqTkmV9
 N3Bdp1+s07sNf2lRxS0P1XKIiVgpaLR3Vj6sPS7tmp5iH2ylt0PkYLGUl g==;
X-CSE-ConnectionGUID: ykN2FQ0KSJ2KD01cLW7Bug==
X-CSE-MsgGUID: f90Qm4URQpywQbvCVBaOkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="60832044"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60832044"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 12:33:26 -0700
X-CSE-ConnectionGUID: g+sHOxGbRg6YMU46XYS/KA==
X-CSE-MsgGUID: SKzA+vufQFSl8vuwSBykiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="169598174"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 12:33:26 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 12:33:25 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 22 Aug 2025 12:33:25 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.62)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 12:33:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HxCUWNuhKk5Ym24CgD9gpLbx6W78fXOj7lXzFrV6JgSa1unWSTc4Tl0Ufjz4pMBAuV/nGkzEWzGUX67dOfBj6dFodx5vzcUbY5U/X+A//pcIu/K0VjcDeyF4ccY0ClA6FH7SsS8XC1DWUebAoobWmug9snGPrJvml2Sn/icGLKbvTcqfDpm84auAQvH8YhKjKtEcc6cKF88IHEIjfGGN8v8zd/Y2n1vrH3t7M+Qhs+aTfXxu2mMPcRp3yZtwDU4ngLBYNT+yUn3M9GFpQkcsdUl7lAkAtiR3oxM5xWdPUbOQhxKBxrxSF33eAIBiTs4Hlnvs/N9HZDlWlMDc8cGyqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2gurVOrZDGZXSG6jgmFJ20WnJuJz49eUC2zKmtnFiV8=;
 b=bCvIQ4ErO8/+PCYszuVGutInp93TB+lgbzcV307vnym51uCnJiP8yak8UN8Skw2dJSOSzKfLAKkj0WxTF9wXiqN7yoFsX8xAlXGHHIBgmZ3lTpcDP9DpOvS+sF2qDR/P3txd4em3kuUFReQUeIpeKrb2laqb6gBj+MBxPDqV6C1qwFx7EnKtH3xGhZELf4oiS5bbNpzR2wNCvSQ4ELm3YiHm9Wx3lswDfwuGbvxUaUPC6TKC00lhCOkWAzYj8ozHVr5m+pee7oZDo0b4IeBDHx80gdVuUBlncI0107ychXy+xyWM6cbqnpdfCojp46Hio0d1wOl+1iJ8mIw+UM+a+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH7PR11MB6521.namprd11.prod.outlook.com (2603:10b6:510:213::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Fri, 22 Aug
 2025 19:33:22 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9052.013; Fri, 22 Aug 2025
 19:33:22 +0000
Date: Fri, 22 Aug 2025 15:33:17 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <alexander.usyskin@intel.com>, <gregkh@linuxfoundation.org>,
 <daniele.ceraolospurio@intel.com>
Subject: Re: [RFC 9/9] {fwctl,drm}/xe/pcode: Introduce xe_pcode_fwctl
Message-ID: <aKjF_ZvP5-1W1tei@intel.com>
References: <20250429160956.1014376-1-badal.nilawar@intel.com>
 <20250429160956.1014376-10-badal.nilawar@intel.com>
 <20250506181353.GA89958@nvidia.com> <aBu5O5odAKaxhhym@intel.com>
 <20250507220444.GA232705@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250507220444.GA232705@nvidia.com>
X-ClientProxiedBy: BY3PR05CA0046.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::21) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH7PR11MB6521:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f2a6d69-9d25-46e1-e7dd-08dde1b2c11d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Hf3C59FTxrVl0yBF7SYFzdbKxtJ8/8+0INC4Z7RGs7mcY5XLD6NqbvQGoT66?=
 =?us-ascii?Q?gNSjIycq9pzorF6NXeydITHCO+MoE9yJz6fcZiMz+S7fw+wq4vibO0KMiJLe?=
 =?us-ascii?Q?vB7aSLBJkxlgWauM4qK3IAtBEvu4t6NOmfIOz6nlM495aFx6+n3alFnCAJlZ?=
 =?us-ascii?Q?e3CSO5CSOqCdXwUCOT+qM15c/gGmYKGuGJxoXpHWjdkj3rzNOOf+204HVBuz?=
 =?us-ascii?Q?7Jf0gKeDrBJZL82yiIbJOMI/M4Fk6Nv+7Bne0aoXdmtg6CjLG1mvHvi61V6K?=
 =?us-ascii?Q?0D6kmwkxySoo3CJtvuGpNHWqBGPJMLzKiLj6GAmiMVRIG2rag91LzAIwAc8s?=
 =?us-ascii?Q?JAI3BQUJY3V2DGyq9snTMQjTZQdlWFt6lGVsew4i4ScjCCaML6S5c4dlYQEi?=
 =?us-ascii?Q?wJU7Aqvte3fgKf4Vty8U9oHNMx9TrgHFVhe9FAhexNzf9Rvrh8h2J+8hLH3x?=
 =?us-ascii?Q?vQRd5+HiSTPz5UYAD8Vdn+s8XaQ6KJoTxhwjSQedfb0ocIQQ4peJUwBSP3R3?=
 =?us-ascii?Q?dyC1ADxzlA7GogYhNdTfdwL9kBSe+pwdENCCMrhhCh0JEX4MMlnKRVtuC60k?=
 =?us-ascii?Q?T3if2HdpPSytQjent/iXnAyMfdzdTyx8YCoFx6OgehKeyrOataJ70G35adZJ?=
 =?us-ascii?Q?anooPM0xsEKAvyExk+j4P39xBRhSR5RJD6it3Pjj3ppeoPm72eVYshYDj1te?=
 =?us-ascii?Q?rs6usGZxEK3Jt/Ayo+IAiA9ikRnJaRM6EWVlna35ppP1pXakUTh3g4g4z+lZ?=
 =?us-ascii?Q?uxiXsjMkaWB4Y2DWJ0hGqU6xLwFNcKW2Kx2QA1r/lbcLAaZufZge9L/AsGE5?=
 =?us-ascii?Q?EXsvZoDAngf4HmKJccduH8KLijH0MQVVVxYLfStDj4zVUUqyy5JjldpxQT4k?=
 =?us-ascii?Q?3mHcYlELVnlOzmLBIkQvereb/Ho3OwumWIKgNME5/Sv+cHzpl127NG/mMIm9?=
 =?us-ascii?Q?uYej2OQVEU7C2bq7a2lh5K1vtpepG2U/0vnlL5uelq1dGFrdKE8wXyxOIsJ2?=
 =?us-ascii?Q?LXH4c96F4nim0i/OTxyyqkIxDpNHkZpfM+fGc3Gvoo6BPknQYJ5ku83eRXFw?=
 =?us-ascii?Q?CHYXypFWontmVOcn6e2KvN4x1npq8mrCZTdkxe/2vTJe4PqHIMFNUZCjL4IR?=
 =?us-ascii?Q?FOpHB9Lo124KWmw8JvSy6JnW7hZqhY10qMI2P3tGAFtHtsMHMvI6X3q50sk6?=
 =?us-ascii?Q?lvDpkL41kdovvXY0ACo5gnmnHrVdPCa0ZJ5+3ptsjAcOHBciyMlpBnfc9cJ0?=
 =?us-ascii?Q?2nPnY2B0Vl7bep53ewdEB2AhgGI5uOzAu+p8JfGrGGCpIOWuAiFpM+4iJg7H?=
 =?us-ascii?Q?RO6y3uJ+lI5/NJYzTZ+cyoLj8HBKHBK6AA44sJFFTIBoWdXZcJZdp+rSoFJn?=
 =?us-ascii?Q?VyXHfca91ZI+AU8ExffvaqUT1zMD/5CuJJK9xglqhwp7Vj73mkYX33XcSwbA?=
 =?us-ascii?Q?dlMtSKt+1H4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PJmcn6my8p3TzP3DhcxjYs0nozAkUlJB8n4YovgcrUcdJ5rny+7sGGdJttz1?=
 =?us-ascii?Q?hmY7vZ4We5LNbRwlm0m0TvT0BOxerFtIdpS3utSKfWB1fMxs04p2OvehUx5e?=
 =?us-ascii?Q?RvAhvEy6TC2pZUKsO2AErsmTUWR6OPJc69G5q0u5W+FZMCGVrR2g+2gXdduA?=
 =?us-ascii?Q?gZ/BrPgsC+V+o+Eh6hLP4/UInuLB8kMr4TJvzY6JD7mPC5wxP4n1HbjuUVrw?=
 =?us-ascii?Q?03mUuBVX05dlHnqtEK9fgDJIrvptUtG+mZQBi03W1+3BsH32VSGS/i7Ghcpw?=
 =?us-ascii?Q?eDg/n4ttXoFZfcNDjtvFczumR0mnbf62EpGRaiyzLJ4/QYxDnTA1Vl2gmnYr?=
 =?us-ascii?Q?5rKp3NND5x4b9o4k9w22u+ectS8H/V3Tm+lGsC4Kv5XOLmlfC5AfgwBcv8nz?=
 =?us-ascii?Q?Oud+O+VOSzcvSfEQhdJgsl8JweEMntWkbJ54qizjAMh4twaHRCYNHhK5VgdG?=
 =?us-ascii?Q?PHe/U8oFU3dcE0Hg+Wp3yOpzu8g2HHKmkmIfRht2CLJyi4PK5a23sMYxbifW?=
 =?us-ascii?Q?slQ4EHmm0NvzRelJzDgsOC7Z9SQMH5g1hJ/RqfMsTHdfz23gByPF15wMalip?=
 =?us-ascii?Q?PmG9M+VsSbYr79Au1B30WsnjS2n3Hb1x04/XDqYw57wukZpO6o/1H72Ftm7E?=
 =?us-ascii?Q?VdlctRBjqvVu8CzLvtjTqrKgBJ8XAa8N9YEIvyaFv1x5Jb7jyqvFK6/rYq02?=
 =?us-ascii?Q?CGwzISgln3Y8tjJpvwVlyhRMfk7qbatA/00mn6vib/BK19L2N4hoNUhyP7FN?=
 =?us-ascii?Q?4p43Y0h1cKQDN0qmEGWw2R02OF453gw5G3r5CE1eZAk8Tz9/cbrP7TkCfbZm?=
 =?us-ascii?Q?GaBII5VK4HfAN4sZbTCc8Cyxu7yefN6c187nkPgs7BpRi6e4msPcBskxWS2b?=
 =?us-ascii?Q?cUi+22uemLCD1Yqrf0CpgNWa+scP3HGJDaF4qq+QyvHkDLpokEvNuaY+0krA?=
 =?us-ascii?Q?xUx6NP7lITcCUj0IrLGUnzIbroQQCv+gJebNKEzZ1TzhN+UcFsF0kWoI7rX2?=
 =?us-ascii?Q?ZfatOZwhaiSvNHnshZxGp/mx1ice3E9c3gE1FrI3Ue5xhO+w77GxDapazLD3?=
 =?us-ascii?Q?nWkxHPnKkdhYB5L1va4BGhTBDCS/ZpBPGvEjutY0TQqoTF2VqTUOzfBzIqUr?=
 =?us-ascii?Q?PWGVAeG7yp/58d4y+A7BKodQOCa94UUiXzr/mw8ynI/2w2uFuBgt8UEScPGf?=
 =?us-ascii?Q?N8mA1NaYN+8aVrlYsjAlFHU2llpa4FYQFtukePeusVLnt7uZlHFXfV+I/Jhl?=
 =?us-ascii?Q?gpSmApyH+fCn0hXzTIAWH94nBbm6nPc1cFbDDSz7zhKiZ/hyZhXVqbqZq3cf?=
 =?us-ascii?Q?9tCT9JdoKWM1XL6nNBOBihBzFyb6I2hjM6yS2o1jvXHJmkSK7IT0MBJbbyKl?=
 =?us-ascii?Q?hiZYIuybjDH/eHrBeTtKHCP7QubD5VU26lV8aAYDfSX8/ddt4QSJyu3OS8mc?=
 =?us-ascii?Q?VSjIYoUorSOHQxyuVhqNSPHkTJfWJHcKaCOUAJdOjNN795kKNi82WNzwwTqU?=
 =?us-ascii?Q?40xmXuwY8jakcsQWTw92scHhgeBcM5nj6fxHuXCq0weV48T/WhvZzW4itDtU?=
 =?us-ascii?Q?2FtoFo7feQxH/yj4A1yQJ7OeuDbh0/cDawXj3Ru8?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f2a6d69-9d25-46e1-e7dd-08dde1b2c11d
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 19:33:22.0369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Usi3EvTQSZb8Bij+m/5lqJLdTbJTHbJ+VvG8hq6cmZK25oIgFfLv+U74iaJgkg7p1Iq3Op4T1cwatyyZzOq9rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6521
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

On Wed, May 07, 2025 at 07:04:44PM -0300, Jason Gunthorpe wrote:
> On Wed, May 07, 2025 at 03:49:15PM -0400, Rodrigo Vivi wrote:
> 
> > One last thing since I have your attention here. Was any time in the previous
> > fwctl discussions talked about the possibility of some extra usages for like
> > FW flashing or in-field-repair/tests where big data needs to filled bypassing
> > lockdown mode?
> 
> For FW flash I do suggest you try to use devlink's firmware flashing
> interface. I think it would be really great if that could become a
> cross-subsystem standard in Linux.

I took a look there and I do believe devlink works very well for fw flashing and
it is also already prepared for basically any pci device without any change.
Thanks for the suggestion.

But now I have to ask you about 2 other use cases that are not under the
umbrella of: configuration and provisioning, but perhaps at least partially
under the umbrella of debug:

- In-field-test-and-repair
- Error injection

Can fwctl be used for these use cases, supposing that it FW mailboxes
commands and responses directly with no modification to the fwctl
infra itself?

in-field-test I'd say it is debug, the 'repair' portion is the most
questionable one. But error-injection I believe it is entirely
debug.

What's your thoughts and guidance here?

Thanks,
Rodrigo.

> 
> If that isn't going to work out then yes I would say fwctl should be
> considered for flashing.
> 
> Saeed's original version had a "big data" memory pinned DMA capable
> interface as well. With justification it could come into the fwctl
> version. I'm not against it, but mindful that it widens what is
> possible by quite a bit.
> 
> But you might not need something like that just for flash. Some
> internal improvement kernel side to allow streaming from large
> user-space RPC buffers instead of a single alloc and copy would be
> sufficient..
> 
> Jason
