Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF31A3E8CC
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 00:49:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D880910E9F7;
	Thu, 20 Feb 2025 23:48:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a4DCXGZB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 772FA10E9F7
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 23:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740095340; x=1771631340;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Wmqy81QoFF5o3azd+/5rMUccoaqOYbZon+Nmpwit6vc=;
 b=a4DCXGZBEhVaVfxEnC6y489xa5g/NEPwsIZMbtIAkSSTXEk39lraaelD
 B+e5Mft0yBDZR8nuvLam4ZKmjrjfDZfLNsmnXtbtfdhFHTV+HycsCimFU
 FvhTUftkTpC5HHgCkyeqzm9I+3m3F1fczUCmrr5RJXPFNs+w+r/Ij0JoD
 N9gGihaQqsl8pao4605sITkmXR/g+UNuPbv3mK9fKPwz7TLyttleYLQRm
 9/t/bC5B1/4ZDI9vzXUzIMS9z7OWSRQu94FKsOUJkHHUda7DjJMjAJcm4
 XBt9kaoJfVkavTnPcmM3LUGLdt8Mgmp7ZaI+4nDVWZ6RWeePN9EvjmfKO w==;
X-CSE-ConnectionGUID: Q77hp2elSWOyq7LbH/8flA==
X-CSE-MsgGUID: p6dTZaHfQGmCM9EBrLWloQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="52331119"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="52331119"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 15:48:59 -0800
X-CSE-ConnectionGUID: 6XDZFY2zSdCxprSDIs0J4A==
X-CSE-MsgGUID: YPZsx+aqQHqY1nI8sfUFPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; d="scan'208";a="115403604"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Feb 2025 15:48:58 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 20 Feb 2025 15:48:57 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Feb 2025 15:48:57 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Feb 2025 15:48:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qM2+qJzOkHSPEv/AcUBAYODFiF2rj5HCzkrSLZBhYr7OWS6/+UFYRCt4N3IATfB/ZBxf1WoFSU48EsMxz1s5C6cKyiBWJRyOn7cjudwghuP/aqEyy44+ptU8NjxxsnivBQAA6Rw2SOnBjOD7uEPChrOFN2zgJJJVRIyM5UURozpbh5Qv5H2zYezj+/TRCw46c/8Ue5Rc51l1i0hxK8CjkLqLVTWAtjscphpPLgVIO7zYAI9C3UCtGduq0ml+Ub04t6pSvYhYq0BxbZBR58Z6/Z0mPQ6q/Zj8yQ8jQHS6GDfsk0DIDMKjXEeN2InANjTHHcv3B5xEeVi5jpExmo4PaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ieBF26I4Z4Gm9Ahs15MtYRcLeyGHM3QVAdAdCuo5+24=;
 b=nbOyDGP2zn7bQAU/hRCb91Vx4YwVFh1rYEhGlh/aMmoMkAj3VBdDXV3fXs5/nG6amzuFNk8to6tyn4UYISu6K1frL2tElICjyuOD/HVKpMczz8hvY3PeJlh80T+BExv3fW77Ed+GNKGnyHX9KFFq7ttRnbtINEpgCcHXee1pmHNsleY8w6UeKeMYiQN9VSusNKz6NEy6wzW+mp+0f/G9OwvnHQh9M6Uga0nA3J05Esok0zzepBcjXNxSi8cQdhGiFNutAGhVsW421cqbrtb8rB/on7/Dh8veHxqIzogcVIsLP8srwxLfgBnoZ0MfJsuNMAm57EGtyyn+nGQ/Sz3VoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB6703.namprd11.prod.outlook.com (2603:10b6:806:268::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.15; Thu, 20 Feb
 2025 23:48:15 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8466.013; Thu, 20 Feb 2025
 23:48:13 +0000
Date: Thu, 20 Feb 2025 17:48:10 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 <dri-devel@lists.freedesktop.org>, Danilo Krummrich <dakr@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH 1/6] drivers: base: devres: Allow to release group on
 device release
Message-ID: <ky3kd4rwuwm6lehmb3n7bplnaoxiwuje67q6m7tvuz6vt7bnnb@lool6xnskx32>
References: <20250212200542.515493-1-lucas.demarchi@intel.com>
 <20250212200542.515493-2-lucas.demarchi@intel.com>
 <2025022007-judiciary-broadly-a1f8@gregkh>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <2025022007-judiciary-broadly-a1f8@gregkh>
X-ClientProxiedBy: MW4PR03CA0168.namprd03.prod.outlook.com
 (2603:10b6:303:8d::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB6703:EE_
X-MS-Office365-Filtering-Correlation-Id: 8459aeff-aa4a-45b7-2d0e-08dd52090a1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?K9Ee5/ckCRfrffBAfJAfk9oXDaCjMNr8nYjvK3/GWAFb8htTV2vOu2MjBc2t?=
 =?us-ascii?Q?ZfjTYkCuhv4UvfxA2B7ldjF7ZCzUDvUrz9EFYzut77f0D6w+aengH6D0M9Y3?=
 =?us-ascii?Q?sNqoqfMtwJ5lcXNXgnCPw0GpYPo46Ylr6QasP8pP8eZAWyRj/OczT2nydIFt?=
 =?us-ascii?Q?4tcS5hR56IRjvkc/6zNzgMvYLG1W0l9Jsg5jFyOtgemTsWO29643schd9J3f?=
 =?us-ascii?Q?wns4VckkYo7ErHBq9WsS+a3fMlp/pc3NqOwax0nAoUqakH8i2i1StCWH4Awd?=
 =?us-ascii?Q?JPw1If9/nJ0PhiGG4ZrnWp/d1a3j0b2n63fGNBc4VSJnzLMqmkR56rYfJ+aO?=
 =?us-ascii?Q?mjL/6tyi/YoVJfthLoIdAAI9KsUQFHHWC0cvSlgR1DK+PCmyRp+b6WNO1dHx?=
 =?us-ascii?Q?FojctmI89N6w1FebdzSzThbhiTabIokFakWNtrc64uRTIgP/yqKs+NfHlzIe?=
 =?us-ascii?Q?TlVxpYMFRyJETO4GKZJRLDpZu9djNIz9n7nWl/K+okLhP93xqMaXqAPt95A4?=
 =?us-ascii?Q?DvQpAMsqXTEjCiykJmL/jQBfKyx5XU1e9PJzqKZLOfieWvmlbds0c4NgvqRa?=
 =?us-ascii?Q?QOs2eAUR/cUzWx1JKpW8KfgsWmHt2xiB5SH9vsJFrNEpEOQAPr+5xcoz4Eo5?=
 =?us-ascii?Q?8zsu5WOB/bUxR6bhzEt0mE0qHc4uE07l49rYAGBCw2L1bJMd2nRLvtNzFAAa?=
 =?us-ascii?Q?Jua4uTImguAKw6PYvZfYXcdi3FYrlyjversNj6d/El+Bwlm3JHahobd6m8uv?=
 =?us-ascii?Q?M8pDQ+ZcZoThwVdQtQMnvMZbgr0Y8fnLofrgHrWow2g3mAlJA05KXjAzrSnP?=
 =?us-ascii?Q?WLUJZ8Q1O6p2WfUcja6OGxpd1I/US9cxPZF2x3tiaUOqLEvX8fRn5BNWpIcI?=
 =?us-ascii?Q?D1AJhjC/KwyRL8TgogVlvKEk5tCAgFSWye0njwREyJgA3QioAQz/FtrgGFF0?=
 =?us-ascii?Q?j167TjJvCq4d9ahjRQtuvDITn8PdUtlhv0eSMtXV9K016vcASvfKFLRND8x5?=
 =?us-ascii?Q?wZN9aPxKtNcFXBzpdiuayYQegVy0elRc76tgQ7wHLNi+vxnme//mX2w8wwNT?=
 =?us-ascii?Q?45IgMAaZstsRdml3TiXKMupwYl+rHBkyUFiRN2mKFQvuHSJIJ6pebLm6eQN+?=
 =?us-ascii?Q?x/a8cKho2h7G6uNTDQ08eglJpnGtwusEv/A+5tPRbFrPVLhVKIrq8jnle1hL?=
 =?us-ascii?Q?rgYKfpTZdIe92ANzen8MvAP4uLvwebRhMWjpFHt2kJw8P3rn+lu6hIqHyiWU?=
 =?us-ascii?Q?U0sqR4bPA1K9Ny1HGALaWIgb3suNk2MgwkWHZxrpobNCXIGBW51Cpy/l9DYV?=
 =?us-ascii?Q?k3XQGEbq2XaCuHADt9A10VmPmeZ7j5x7CtdenvZ6D9R51Jq/Zulb4exRNm16?=
 =?us-ascii?Q?/BvSbv7IaK54G2ns/GHNbjO0b2N+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OW6tszX4amWGEKRBFeFqowSnE7HT2L/LloHjn62smJJoNtdPgiM/jnysf+z1?=
 =?us-ascii?Q?qlRAs4B3ab+HVpAblyEnV6Sfww8mSOgsIJsViBUQrDvrSBm3qEeYXc/IYVX5?=
 =?us-ascii?Q?Va/OvKepYw1O59nihuU53qRwkYesI2MHO369zwTbMkGUYWT4l9pykfjZKbXg?=
 =?us-ascii?Q?RQNHQNX/9wLiSvq4d/bl1kZvkaAmJEuLqdJD1+eb1VROrghRE4BPdPAd96/5?=
 =?us-ascii?Q?pcJ98YuRtyj9raUgABli9w8MnL7sl9ksgo8oAww1AijCz/w/xgIB8y/k/K+0?=
 =?us-ascii?Q?j7ldM1byZlsOqsEuvtOZbSYXV+AnC2PSrYW/tp+TadV2JyLXkHWBzgeYIiNI?=
 =?us-ascii?Q?k4PtVIZ/yuLe1i9TvzCxet/duxUu/QSrZdoYzp4JK5LSf8uDNiQ5U4NlLm8b?=
 =?us-ascii?Q?rUcl9ROdKIEbxpxMpfoB6diUigw9TwNZYtAgd96DkCREQUp4v5NAFwDOlH0P?=
 =?us-ascii?Q?GwGU8Hbie0VSCTSWEjqHnuknqwlWVetSFgpC/SpsnEHAg+jEQi0TvnywtA01?=
 =?us-ascii?Q?df92/S1dPPvfC3cbV/8wBgrhxNrriWEnv9Yl4zTMYadalQ5xQnJrtjmaPPjJ?=
 =?us-ascii?Q?Oimf9PcwPVEjUNUizlmCHjyqimE1DpQN8jmk3wFU7FAE5S9VyztRMjRkoul+?=
 =?us-ascii?Q?JcFJ5EEIa8QMa2Oi+4C84+Ii3puPxrh52RKuSOW1hP/YVNSL3uly/8PvZDNm?=
 =?us-ascii?Q?86qd7WKrfH0xhiQQS9CgbqJ/MtTM4Z/So3YxopPdY5vdRxWpjyXLQpWDFoQz?=
 =?us-ascii?Q?DQO6Uzr+TaVJj/znD73nfBVlBNTMWPB5o7HuENQqFUWcXVN/PLUOcpG19CTj?=
 =?us-ascii?Q?KpXrcJHZLFy7MPXCrJ759hybQShJBGhephb4NpHjoxs7dMNtUxuEX2+T7O9W?=
 =?us-ascii?Q?JyJiEGIM7jegMkFsIhe6SiOWI7POQ023iYZ+BWT7qLVIehvWBbVEEed35nJ+?=
 =?us-ascii?Q?SA6hw2CCf3fE6CfzWwCghKr7KLCw5LzM7G0QWqQMGsYP7ZAfYC/U1GRU1tF3?=
 =?us-ascii?Q?4VDErGk9QyJ5eJ54ViyPl+EH7z9MuKwv6HR3ZwEU9GZxhfxgXNeEEBs/5RF7?=
 =?us-ascii?Q?mJjSN62HgeLjWrYBhMJRU5F3UE4mE++F5UxgkGYtzkN3osmaNGUnbGrSbnkq?=
 =?us-ascii?Q?bOBMOThxCt2+KP8nckp3j12IBAMqZS3saOqRx/8zJ7KQ1ir0+uoK2nptGRFG?=
 =?us-ascii?Q?PSBcpxvvNnhd1H5IlITY1JAJlaBxz7hwRlkwr0HAZQrWj42iXn0vAidqPb/4?=
 =?us-ascii?Q?Wra3liSYejicbykRAeVYDVUr5w101ohNh+O0skextLL+mzmzgwnkqV5ZLPmf?=
 =?us-ascii?Q?c282ZvehUbO/lC4CeD7DzA7sa/1/o/YvOPSFKBlOPK1CVru7lxUiYfFLS5H7?=
 =?us-ascii?Q?I6FjtfSY3+i3IFkLsiLW+ESOFyOc6WaeSTgF/4YT7oJvvrP9FTqdJfWtqiQx?=
 =?us-ascii?Q?DITmSRAjha/pfnpyl942vYeolPKTKS5MpGxSGrGBQhP0rS3iFUVbZldsCYxg?=
 =?us-ascii?Q?3jtUvTwmeqCc9uzXHOsu2DzfkvhtiyF/rwIVrWuRZiexL1Y6hc8PxMWmmKhy?=
 =?us-ascii?Q?174n1FS/cEMZGa5FUSTt5A/bImZCVc/GfQjO2D8zwmqfM6qOK5zovJs4Rp1o?=
 =?us-ascii?Q?iQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8459aeff-aa4a-45b7-2d0e-08dd52090a1b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 23:48:13.6326 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YY7awOd4xgeCf7VhR4K+neENruQT1TDZQVImElHzdynkmoXH0S81sRYypfpRv4XPNlbXYGMLpTztTxVmObLDZlCBdmjN/Oy7z53YZogpFmM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6703
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

On Thu, Feb 20, 2025 at 01:24:20PM +0100, Greg Kroah-Hartman wrote:
>On Wed, Feb 12, 2025 at 12:05:37PM -0800, Lucas De Marchi wrote:
>> When releasing a device, if the release action causes a group to be
>> released, a warning is emitted because it can't find the group. This
>> happens because devres_release_all() moves the entire list to a todo
>> list and also move the group markers. Considering r* normal resource
>> nodes and g1 a group resource node:
>>
>> 		    g1 -----------.
>> 		    v		  v
>> 	r1 -> r2 -> g1[0] -> r3-> g[1] -> r4
>>
>> After devres_release_all(), dev->devres_head becomes empty and the todo
>> list it iterates on becomes:
>>
>> 			       g1
>> 			       v
>> 	r1 -> r2 -> r3-> r4 -> g1[0]
>>
>> When a call to component_del() is made and takes down the aggregate
>> device, a warning like this happen:
>>
>> 	RIP: 0010:devres_release_group+0x362/0x530
>> 	...
>> 	Call Trace:
>> 	 <TASK>
>> 	 component_unbind+0x156/0x380
>> 	 component_unbind_all+0x1d0/0x270
>> 	 mei_component_master_unbind+0x28/0x80 [mei_hdcp]
>> 	 take_down_aggregate_device+0xc1/0x160
>> 	 component_del+0x1c6/0x3e0
>> 	 intel_hdcp_component_fini+0xf1/0x170 [xe]
>> 	 xe_display_fini+0x1e/0x40 [xe]
>>
>> Because the devres group corresponding to the hdcp component cannot be
>> found. Just ignore this corner case: if the dev->devres_head is empty
>> and the caller is trying to remove a group, it's likely in the process
>> of device cleanup so just ignore it instead of warning.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>
>Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Thanks. Is it ok to take these 3 through the drm tree or are you taking
it through yours?

Lucas De Marchi
