Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B048A2FBCB
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 22:17:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 162A310E3D8;
	Mon, 10 Feb 2025 21:17:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HiAd9Not";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E63110E3C7;
 Mon, 10 Feb 2025 21:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739222228; x=1770758228;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=2jcz70MCboCzbQB7/bW1bBgS5Xo2LNzGEgx/RlZ1bOM=;
 b=HiAd9NotCbM0EzHZeFxlnW6KgQlrKSpl2JBLY0OT1ysLCupaHJyvvd2C
 vJwifhgQeJlgFsM4j8Egu3py6YL/aXu3Dq4YWjZ6w4osvY9D5o9kZYFkg
 EYFASWEvcWSFJecsb1NVpzpAB75lQeVp7x2IfnRds3ZHmGbgA8huPUg1+
 vrR2oPdiZ7JE+WSkWPkvQp2iCLU72LJzdFUhCB6p7SwMu/ZjgenOEmzB/
 nZ/amVwCfLc0mqMziSRgEnrQ6Z7clJiY6euDrxo6pFltJKqP+OP0RVYrE
 PB8JJ+NDden5bhhemrJCkyjHQkj5d0MYXqCwEz1aIzGeG5nJBBHFk8s/t Q==;
X-CSE-ConnectionGUID: YvveCPYIQSS/LoANOqQHdw==
X-CSE-MsgGUID: NpnkVUy3RO61KI+2blvtTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39843453"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="39843453"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 13:17:08 -0800
X-CSE-ConnectionGUID: o7p5kF6WSNqvBghQxbFN/A==
X-CSE-MsgGUID: gE2ib6/MRWSVnqYzNnk0bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112761761"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Feb 2025 13:17:08 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 13:17:07 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 13:17:07 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 13:17:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hc8Gzx9SieQFm6qn8109GgW5TQYzBQFuht7w2yYr9u3te3MYqVlb8j3aDJxNYzer5fNH/8nFvNgyMX0bKzkje6Yibt78nG0ZKoll7P5xYB4OkCOw5VqhihRJlGg+jLC4hbR3vw4d12kRQTwD4dOq/NSLN1ZeyvvhqAW34kuT0dTJcivqf4tcaW/oJdDEvD16RinuOFaKXXVeIWvTI3mg8UTd7nFjcxdW3d65Lh4ScNtWxmERQj/Im128ygUF8ubVUkacnS+j2BHE9eqHs1zl+dRQ1IQdL8niK2UE4vbCi3go0QdhBvct3O248oBJbs9/HBsNrufmzdfRWzf/VYQEog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bqoUxNLpA8OMizbiS1xT//i31cZ1YsNYWmyHt+RaYBE=;
 b=eJdA8Q7UwNc9HJxYGnW8OuLsVIOgs/C/LUbD6rkSubBGBOuOhYqmLPvaDE+FoA8MseCWJ5RvfPww0M2HHmWhWJyXdUwj5m901hfoUxdg6UVv9HvEdYnydkqlKxbCpcVX+U3eM1EnCJ3MvZp2hbPF1FSRaaPVm4F2oAS8yEup3s8AI/4bf25xAzsvE1hsXrONwXuEGLv8FYz6p6WSdtYtDbSJwqySfVzBwBGI/j+iCPKEPsyft5A7bH3slftj52T77krc+bD86vELIX28mNxrgfK3xrQ/QYb9SEzsG8A1iMt0imUDcuPPB64sE97QyazD6Xu0wIWXVinMCJPkRLfvbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB5201.namprd11.prod.outlook.com (2603:10b6:303:95::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Mon, 10 Feb
 2025 21:16:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 21:16:22 +0000
Date: Mon, 10 Feb 2025 13:17:21 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v4 16/33] drm/xe: Add unbind to SVM garbage collector
Message-ID: <Z6ps4Z9pYnKn4DoW@lstrano-desk.jf.intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
 <20250129195212.745731-17-matthew.brost@intel.com>
 <912b7cd94d00d84525d58bb3cebc7b82ad0129b2.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <912b7cd94d00d84525d58bb3cebc7b82ad0129b2.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0092.namprd03.prod.outlook.com
 (2603:10b6:303:b7::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB5201:EE_
X-MS-Office365-Filtering-Correlation-Id: 906cd34c-e349-48fb-b03b-08dd4a182b6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?p/vaqdld+cHnUrtAhITBYQRk+IGwYdzrwB2r+NOzxOrAdsmNV9IA6tN7b4?=
 =?iso-8859-1?Q?vRH5j1Byl0kB02hyi0ZVf4FSLvHBoWcYCfyAidooafCDxD0ofcRwLgxBOU?=
 =?iso-8859-1?Q?M7ByzaSVQYwrxKl34NRk2ywOg19TWmERkn6WrazDgLUUQIv22sU6E45O3O?=
 =?iso-8859-1?Q?chb1jf5BP5OFWhnoiwBBIpXb68brKrtB2S7BiBKugU6m494o0H9y0Defd7?=
 =?iso-8859-1?Q?RcarQ9TEb9GpwMD5fiYE7T8gLF6g4R47Tbl3UnBXzyIY9LptAMgcVyW2yO?=
 =?iso-8859-1?Q?iSCdXf8eyfOxK/pLP9OR9+EUWWQHieFHGBtzAOsq2GCbSbIj3VxfOzuJ5Y?=
 =?iso-8859-1?Q?PrMHrcO6URMK69DCSjOWMqJL0U2X6b4pyv0qoofZ/aOvIKodi8/lazE7nq?=
 =?iso-8859-1?Q?mS6JAr93FT4newxYrLxOABPApTgAxP73wH6nrr9L/doPNufYXcq9km4eBB?=
 =?iso-8859-1?Q?eNR94grm9kTfEJ4tkDLwM2/eggAW6OKT5FU3I2VhvrV0m3QKHv2duRAH1P?=
 =?iso-8859-1?Q?Lv4qYg4+dIj/EtCawq4snU4ZIkWXXNWibM2Aa2ANCWKeI3TwB2RE8tQ4Mg?=
 =?iso-8859-1?Q?gt78UZOf8mUIaBLJwCEuSh7Jf+9DRcXZWvOhN8zpeto4rQc4Zd2FBL6v1w?=
 =?iso-8859-1?Q?uuOrJIJilJkQPLcxOkOAV4Qx6JHfUXlW2kG7RMRn/TKEbFf3Xg7XEB8ACv?=
 =?iso-8859-1?Q?BMZgNp7FUdDyTQIrUBcT1VfeWdWFUQLIm0zYwEh8PLCfDLbpXnIql2BbJD?=
 =?iso-8859-1?Q?wsYT4bcnwOwYXa4PkPa3/daW6mS94GXWwd32XqWj++viXWCJBE36EdlxNk?=
 =?iso-8859-1?Q?j6X+0OCDTrY5GNrtRFc/ArB8aB5KJOV6uyeNIgrzp/RzVKVrfvOQN4Tz4C?=
 =?iso-8859-1?Q?IXfUeBWCnJZEULvDTPSvrZz+Dpu5eMf3PG5FqeqFmVEZ3uqladejfqpL95?=
 =?iso-8859-1?Q?ubA/y+mL8ViWat3jDZ9Nl+iBLRxqQrJJOY0fTrqWyxbipPRUzZARV5JDph?=
 =?iso-8859-1?Q?zEVzs86Lj1t0mqJ9KkkGpTohKoDfxHS1oR5IcPXNT9avndCccMFnrDYuCd?=
 =?iso-8859-1?Q?q3qwMVoHtFgjVCCPJrMHzlvb/6Abhuzk4KbKiJvlyR3yQ3UA81rmjAhVU3?=
 =?iso-8859-1?Q?PdYfnDSQolxfDyyVCLupg1xBxl76jxaa+sLPYKP62wQEnb5X4hu13pDYkz?=
 =?iso-8859-1?Q?LcY6pmaKYGwG3/MX6mOgZCWML3udHSfYeUZKEA4glPgt1jEJJXb0EY1jx3?=
 =?iso-8859-1?Q?AcT4Ra73lul+3WJoUeisRdfwJekh9uazLSkdkPmGzB2H3IiYQ0UcEuqd2H?=
 =?iso-8859-1?Q?wkQ52ITi+abbkBsdkHpvMeyKHB9vS6HDWPlJMdsJZixb2J8VQJVEV4jyP2?=
 =?iso-8859-1?Q?wL1mePk0LPUfD1axb00DaJ9SPYltpjIHfGaTxKdgnm7rNPKZMaxG06AIot?=
 =?iso-8859-1?Q?KO9D1pSIcszj+UUe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?p45tL9LeZbGO/cPFnCETDypEGwiQo2Ipg4zrRGgXsY2T9pfzQ68R+NPCaC?=
 =?iso-8859-1?Q?kxSe/bjYc2AypnZJ0boGHBnLCLtj11B/vcuE3vdXiDTvrPmxwb14bkmG/3?=
 =?iso-8859-1?Q?nmKX3NQVbcrftVL27VuoHKYvZI4OJPImW4AWyijiHLcJL6G8OWugXd7mkQ?=
 =?iso-8859-1?Q?TV6R9JkAH3P/88l2VeH/ISeLqWyHYK43ST4rt9MSauXZ4aDxGccfuLViqC?=
 =?iso-8859-1?Q?8xWzdatSjEZZdhKzgUs4XUiiw59jYoOoxHNGSgHzKd6OFBFoJUQYTCDOBz?=
 =?iso-8859-1?Q?wV7FS2f3JkKUpIeV772O15ocslg8DYP4gcT4/8/2wqFW/5WlGlFkT1vIaq?=
 =?iso-8859-1?Q?JI6UMSwCy5jz0JXQgl7pLugdBpHkwN0PbrLFbxoVczUANUlditIjeNrRq9?=
 =?iso-8859-1?Q?4d4sA0sGT4BUExxX62eMlFtw2/aYGT/1nc2f/RCaivQWBKGAPktNDGJj2f?=
 =?iso-8859-1?Q?R4fGfeoBsiv/VTYGpHK6hMK4D+5Z4aScASbFc48YQZzpEhVBBaS71uCihL?=
 =?iso-8859-1?Q?NXM04/nRKA9+x6o+d3l1GyN4DDr/QQniteiHP5gOZ+2DABIUOcqmc4kmvS?=
 =?iso-8859-1?Q?cUvtehmMmgp8i2Mn0ORVAnxY7knsey/tqQqng9xqWpUODBcyF45oRyCPiJ?=
 =?iso-8859-1?Q?Spu6kxbPJUHjGEuzSgVzQKls8rIxqa1kZBkkg3XmdoKBeNFpxmV3Lnv70D?=
 =?iso-8859-1?Q?n7IcdtxogdtuQwTSUATs0PlSRLp8LQTM/+lB4ilA+lqgoCUXvwq11zVlqD?=
 =?iso-8859-1?Q?hjWN9J+xWMtUmaJpExEpxwNr7oVGqdR6UyMFyC2b3LNGlLOR1TjKyq4NJS?=
 =?iso-8859-1?Q?qHUUDijicsjmpRMdhmmuUDD9zEDkn4OqqZ5rKBuzuiYKrKZAM2uor4xcqn?=
 =?iso-8859-1?Q?KUZN/4pluOki8jT/ieLEIU1XZAAi2vOGCWMbv4HyqA7sgOvaqbIUnDQdNQ?=
 =?iso-8859-1?Q?fmi5/MPAbyIGFUoCf9yHm4khy5yRHkBxzEEpwmnV4eCgFxwwjF1Sn5ELJ2?=
 =?iso-8859-1?Q?EckV1CZakLg1ds5WCxq8E2HX8Mg3eANI3r89thjLjxtauISM/1C30gzyc+?=
 =?iso-8859-1?Q?qQkcEIQH+AeLf+vHXJbm/IwXyg4ZQJ7ojdZyb4ZSzKbH9+0I9JFyODJyzV?=
 =?iso-8859-1?Q?r7Dujf8CRNHh2ortUS/JfoqJpXCxefwlcU82FiYAnJU5AEl2TewybNgucK?=
 =?iso-8859-1?Q?GfzTkkYW2TWqBpBjBRar6Kv5deX6dzefIsQykVfusayijv8skbstTEOOZz?=
 =?iso-8859-1?Q?vj/LdZjeTL2yD4XcSMQN/cv53Ylpg1d06Bb3UOIgK6LCnlIqkQXkQXrDbA?=
 =?iso-8859-1?Q?I9LdDnUfB4cLZ/fMf6znCiBjdhn5hgnaVuOL6IqWGHmlPjvhie+tAFsF6/?=
 =?iso-8859-1?Q?J3lkg1szwpbhcm96ceFXIdWHY4pherdjSfz2XDGA8qdh5pB3kcHnRzjhTu?=
 =?iso-8859-1?Q?zu1+bpK34LYXBWJrTjZ6As2xqwtQ5I+TUhY+ulpQTrjn/ugKoz8I4WjSMC?=
 =?iso-8859-1?Q?6r7jftbxdSsLe4Gu/o84/Oxub+p6utUvvoZaOmZJt1b0FCmdQeLumQU237?=
 =?iso-8859-1?Q?Loh5xmw8BES7WLrfUk3modpMg+gXtGc5YW59KJMHcWFScylAOnoilEoeJX?=
 =?iso-8859-1?Q?wWV1JVvjx7F96hrAdw014SycZhb3DZUJVRAycrdJTNz5g7WFeOrldlpQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 906cd34c-e349-48fb-b03b-08dd4a182b6b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 21:16:22.6372 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g7SabO3sO9G4aC4tyUk0WZj7YUuQFtuWicymxPt5CGOs/4AFJszYYatxb2hUAV7TiTlVo8+yCDYnZz8g7vPoPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5201
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

On Fri, Feb 07, 2025 at 01:55:58PM +0100, Thomas Hellström wrote:
> On Wed, 2025-01-29 at 11:51 -0800, Matthew Brost wrote:
> > Add unbind to SVM garbage collector. To facilitate add unbind support
> > function to VM layer which unbinds a SVM range. Also teach PY layer
> 
> Should it be
> s/PY layer/the PT layer/ ?
> 

Yes. Will fix.

> Also see below regarding accessors,
> 
> Thanks,
> Thomas
> 
> 
> > to
> > understand unbinds of SVM ranges.
> > 
> > v3:
> >  - s/INVALID_VMA/XE_INVALID_VMA (Thomas)
> >  - Kernel doc (Thomas)
> >  - New GPU SVM range structure (Thomas)
> >  - s/DRM_GPUVA_OP_USER/DRM_GPUVA_OP_DRIVER (Thomas)
> > v4:
> >  - Use xe_vma_op_unmap_range (Himal)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pt.c       | 84 ++++++++++++++++++++++++++----
> > --
> >  drivers/gpu/drm/xe/xe_svm.c      |  9 +++-
> >  drivers/gpu/drm/xe/xe_vm.c       | 83
> > +++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_vm.h       |  2 +
> >  drivers/gpu/drm/xe/xe_vm_types.h | 12 ++++-
> >  5 files changed, 172 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index cb63596dbfbf..f8d06c70f77d 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -957,10 +957,16 @@ static void xe_pt_cancel_bind(struct xe_vma
> > *vma,
> >  	}
> >  }
> >  
> > +#define XE_INVALID_VMA	((struct xe_vma *)(0xdeaddeadull))
> > +
> >  static void xe_pt_commit_locks_assert(struct xe_vma *vma)
> >  {
> > -	struct xe_vm *vm = xe_vma_vm(vma);
> > +	struct xe_vm *vm;
> >  
> > +	if (vma == XE_INVALID_VMA)
> > +		return;
> > +
> > +	vm = xe_vma_vm(vma);
> >  	lockdep_assert_held(&vm->lock);
> >  
> >  	if (!xe_vma_has_no_bo(vma))
> > @@ -986,7 +992,8 @@ static void xe_pt_commit(struct xe_vma *vma,
> >  		for (j = 0; j < entries[i].qwords; j++) {
> >  			struct xe_pt *oldpte =
> > entries[i].pt_entries[j].pt;
> >  
> > -			xe_pt_destroy(oldpte, xe_vma_vm(vma)->flags,
> > deferred);
> > +			xe_pt_destroy(oldpte, (vma ==
> > XE_INVALID_VMA) ? 0 :
> > +				      xe_vma_vm(vma)->flags,
> > deferred);
> >  		}
> >  	}
> >  }
> > @@ -1419,6 +1426,9 @@ static int xe_pt_svm_pre_commit(struct
> > xe_migrate_pt_update *pt_update)
> >  	list_for_each_entry(op, &vops->list, link) {
> >  		struct xe_svm_range *range = op->map_range.range;
> >  
> > +		if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE)
> > +			continue;
> > +
> >  		xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(op-
> > >map_range.vma));
> >  		xe_assert(vm->xe, op->subop ==
> > XE_VMA_SUBOP_MAP_RANGE);
> >  
> > @@ -1616,7 +1626,9 @@ static const struct xe_pt_walk_ops
> > xe_pt_stage_unbind_ops = {
> >   * xe_pt_stage_unbind() - Build page-table update structures for an
> > unbind
> >   * operation
> >   * @tile: The tile we're unbinding for.
> > + * @vm: The vm
> >   * @vma: The vma we're unbinding.
> > + * @range: The range we're unbinding.
> >   * @entries: Caller-provided storage for the update structures.
> >   *
> >   * Builds page-table update structures for an unbind operation. The
> > function
> > @@ -1626,9 +1638,14 @@ static const struct xe_pt_walk_ops
> > xe_pt_stage_unbind_ops = {
> >   *
> >   * Return: The number of entries used.
> >   */
> > -static unsigned int xe_pt_stage_unbind(struct xe_tile *tile, struct
> > xe_vma *vma,
> > +static unsigned int xe_pt_stage_unbind(struct xe_tile *tile,
> > +				       struct xe_vm *vm,
> > +				       struct xe_vma *vma,
> > +				       struct xe_svm_range *range,
> >  				       struct xe_vm_pgtable_update
> > *entries)
> >  {
> > +	u64 start = range ? range->base.itree.start :
> > xe_vma_start(vma);
> > +	u64 end = range ? range->base.itree.last + 1 :
> > xe_vma_end(vma);
> 
> Perhaps a code-wide comment is in place here, To use accessors
> 
> static inline unsigned long xe_svm_range_start(struct xe_svm_range);
> static inline unsigned long xe_svm_range_end(struct xe_svm_range);
> 
> to avoid open-coding range->base.itree.xxxx. It's pretty frequent in
> the code.
> 

Good suggestion. Will fixup this in the entire series.

Matt

> 
> >  	struct xe_pt_stage_unbind_walk xe_walk = {
> >  		.base = {
> >  			.ops = &xe_pt_stage_unbind_ops,
> > @@ -1636,14 +1653,14 @@ static unsigned int xe_pt_stage_unbind(struct
> > xe_tile *tile, struct xe_vma *vma,
> >  			.max_level = XE_PT_HIGHEST_LEVEL,
> >  		},
> >  		.tile = tile,
> > -		.modified_start = xe_vma_start(vma),
> > -		.modified_end = xe_vma_end(vma),
> > +		.modified_start = start,
> > +		.modified_end = end,
> >  		.wupd.entries = entries,
> >  	};
> > -	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
> > +	struct xe_pt *pt = vm->pt_root[tile->id];
> >  
> > -	(void)xe_pt_walk_shared(&pt->base, pt->level,
> > xe_vma_start(vma),
> > -				xe_vma_end(vma), &xe_walk.base);
> > +	(void)xe_pt_walk_shared(&pt->base, pt->level, start, end,
> > +				&xe_walk.base);
> >  
> >  	return xe_walk.wupd.num_used_entries;
> >  }
> > @@ -1885,13 +1902,6 @@ static int unbind_op_prepare(struct xe_tile
> > *tile,
> >  	       "Preparing unbind, with range [%llx...%llx)\n",
> >  	       xe_vma_start(vma), xe_vma_end(vma) - 1);
> >  
> > -	/*
> > -	 * Wait for invalidation to complete. Can corrupt internal
> > page table
> > -	 * state if an invalidation is running while preparing an
> > unbind.
> > -	 */
> > -	if (xe_vma_is_userptr(vma) &&
> > xe_vm_in_fault_mode(xe_vma_vm(vma)))
> > -		mmu_interval_read_begin(&to_userptr_vma(vma)-
> > >userptr.notifier);
> > -
> >  	pt_op->vma = vma;
> >  	pt_op->bind = false;
> >  	pt_op->rebind = false;
> > @@ -1900,7 +1910,8 @@ static int unbind_op_prepare(struct xe_tile
> > *tile,
> >  	if (err)
> >  		return err;
> >  
> > -	pt_op->num_entries = xe_pt_stage_unbind(tile, vma, pt_op-
> > >entries);
> > +	pt_op->num_entries = xe_pt_stage_unbind(tile,
> > xe_vma_vm(vma),
> > +						vma, NULL, pt_op-
> > >entries);
> >  
> >  	xe_vm_dbg_print_entries(tile_to_xe(tile), pt_op->entries,
> >  				pt_op->num_entries, false);
> > @@ -1915,6 +1926,42 @@ static int unbind_op_prepare(struct xe_tile
> > *tile,
> >  	return 0;
> >  }
> >  
> > +static int unbind_range_prepare(struct xe_vm *vm,
> > +				struct xe_tile *tile,
> > +				struct xe_vm_pgtable_update_ops
> > *pt_update_ops,
> > +				struct xe_svm_range *range)
> > +{
> > +	u32 current_op = pt_update_ops->current_op;
> > +	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops-
> > >ops[current_op];
> > +
> > +	if (!(range->tile_present & BIT(tile->id)))
> > +		return 0;
> > +
> > +	vm_dbg(&vm->xe->drm,
> > +	       "Preparing unbind, with range [%lx...%lx)\n",
> > +	       range->base.itree.start, range->base.itree.last);
> > +
> > +	pt_op->vma = XE_INVALID_VMA;
> > +	pt_op->bind = false;
> > +	pt_op->rebind = false;
> > +
> > +	pt_op->num_entries = xe_pt_stage_unbind(tile, vm, NULL,
> > range,
> > +						pt_op->entries);
> > +
> > +	xe_vm_dbg_print_entries(tile_to_xe(tile), pt_op->entries,
> > +				pt_op->num_entries, false);
> > +	xe_pt_update_ops_rfence_interval(pt_update_ops, range-
> > >base.itree.start,
> > +					 range->base.itree.last +
> > 1);
> > +	++pt_update_ops->current_op;
> > +	pt_update_ops->needs_svm_lock = true;
> > +	pt_update_ops->needs_invalidation = true;
> > +
> > +	xe_pt_commit_prepare_unbind(XE_INVALID_VMA, pt_op->entries,
> > +				    pt_op->num_entries);
> > +
> > +	return 0;
> > +}
> > +
> >  static int op_prepare(struct xe_vm *vm,
> >  		      struct xe_tile *tile,
> >  		      struct xe_vm_pgtable_update_ops
> > *pt_update_ops,
> > @@ -1982,6 +2029,9 @@ static int op_prepare(struct xe_vm *vm,
> >  			err = bind_range_prepare(vm, tile,
> > pt_update_ops,
> >  						 op->map_range.vma,
> >  						 op-
> > >map_range.range);
> > +		} else if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE) {
> > +			err = unbind_range_prepare(vm, tile,
> > pt_update_ops,
> > +						   op-
> > >unmap_range.range);
> >  		}
> >  		break;
> >  	default:
> > @@ -2171,6 +2221,8 @@ static void op_commit(struct xe_vm *vm,
> >  		if (op->subop == XE_VMA_SUBOP_MAP_RANGE) {
> >  			op->map_range.range->tile_present |=
> > BIT(tile->id);
> >  			op->map_range.range->tile_invalidated &=
> > ~BIT(tile->id);
> > +		} else if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE) {
> > +			op->unmap_range.range->tile_present &=
> > ~BIT(tile->id);
> >  		}
> >  		break;
> >  	}
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > b/drivers/gpu/drm/xe/xe_svm.c
> > index 3788196b2925..03c5cbcacb0e 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -216,7 +216,14 @@ static void xe_svm_invalidate(struct drm_gpusvm
> > *gpusvm,
> >  static int __xe_svm_garbage_collector(struct xe_vm *vm,
> >  				      struct xe_svm_range *range)
> >  {
> > -	/* TODO: Do unbind */
> > +	struct dma_fence *fence;
> > +
> > +	xe_vm_lock(vm, false);
> > +	fence = xe_vm_range_unbind(vm, range);
> > +	xe_vm_unlock(vm);
> > +	if (IS_ERR(fence))
> > +		return PTR_ERR(fence);
> > +	dma_fence_put(fence);
> >  
> >  	drm_gpusvm_range_remove(&vm->svm.gpusvm, &range->base);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index bdc9b75e0aee..6fa446884955 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -984,6 +984,89 @@ struct dma_fence *xe_vm_range_rebind(struct
> > xe_vm *vm,
> >  	return fence;
> >  }
> >  
> > +static void xe_vm_populate_range_unbind(struct xe_vma_op *op,
> > +					struct xe_svm_range *range)
> > +{
> > +	INIT_LIST_HEAD(&op->link);
> > +	op->tile_mask = range->tile_present;
> > +	op->base.op = DRM_GPUVA_OP_DRIVER;
> > +	op->subop = XE_VMA_SUBOP_UNMAP_RANGE;
> > +	op->unmap_range.range = range;
> > +}
> > +
> > +static int
> > +xe_vm_ops_add_range_unbind(struct xe_vma_ops *vops,
> > +			   struct xe_svm_range *range)
> > +{
> > +	struct xe_vma_op *op;
> > +
> > +	op = kzalloc(sizeof(*op), GFP_KERNEL);
> > +	if (!op)
> > +		return -ENOMEM;
> > +
> > +	xe_vm_populate_range_unbind(op, range);
> > +	list_add_tail(&op->link, &vops->list);
> > +	xe_vma_ops_incr_pt_update_ops(vops, range->tile_present);
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * xe_vm_range_unbind() - VM range unbind
> > + * @vm: The VM which the range belongs to.
> > + * @range: SVM range to rebind.
> > + *
> > + * Unbind SVM range removing the GPU page tables for the range.
> > + *
> > + * Return: dma fence for unbind to signal completion on succees,
> > ERR_PTR on
> > + * failure
> > + */
> > +struct dma_fence *xe_vm_range_unbind(struct xe_vm *vm,
> > +				     struct xe_svm_range *range)
> > +{
> > +	struct dma_fence *fence = NULL;
> > +	struct xe_vma_ops vops;
> > +	struct xe_vma_op *op, *next_op;
> > +	struct xe_tile *tile;
> > +	u8 id;
> > +	int err;
> > +
> > +	lockdep_assert_held(&vm->lock);
> > +	xe_vm_assert_held(vm);
> > +	xe_assert(vm->xe, xe_vm_in_fault_mode(vm));
> > +
> > +	if (!range->tile_present)
> > +		return dma_fence_get_stub();
> > +
> > +	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
> > +	for_each_tile(tile, vm->xe, id) {
> > +		vops.pt_update_ops[id].wait_vm_bookkeep = true;
> > +		vops.pt_update_ops[tile->id].q =
> > +			xe_tile_migrate_exec_queue(tile);
> > +	}
> > +
> > +	err = xe_vm_ops_add_range_unbind(&vops, range);
> > +	if (err)
> > +		return ERR_PTR(err);
> > +
> > +	err = xe_vma_ops_alloc(&vops, false);
> > +	if (err) {
> > +		fence = ERR_PTR(err);
> > +		goto free_ops;
> > +	}
> > +
> > +	fence = ops_execute(vm, &vops);
> > +
> > +free_ops:
> > +	list_for_each_entry_safe(op, next_op, &vops.list, link) {
> > +		list_del(&op->link);
> > +		kfree(op);
> > +	}
> > +	xe_vma_ops_fini(&vops);
> > +
> > +	return fence;
> > +}
> > +
> >  static void xe_vma_free(struct xe_vma *vma)
> >  {
> >  	if (xe_vma_is_userptr(vma))
> > diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> > index a82fe743bbe0..3b6316dd9fd6 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.h
> > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > @@ -221,6 +221,8 @@ struct dma_fence *xe_vm_range_rebind(struct xe_vm
> > *vm,
> >  				     struct xe_vma *vma,
> >  				     struct xe_svm_range *range,
> >  				     u8 tile_mask);
> > +struct dma_fence *xe_vm_range_unbind(struct xe_vm *vm,
> > +				     struct xe_svm_range *range);
> >  
> >  int xe_vm_invalidate_vma(struct xe_vma *vma);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > b/drivers/gpu/drm/xe/xe_vm_types.h
> > index 576316729249..aaba9e5acfb7 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -361,6 +361,12 @@ struct xe_vma_op_map_range {
> >  	struct xe_svm_range *range;
> >  };
> >  
> > +/** struct xe_vma_op_unmap_range - VMA unmap range operation */
> > +struct xe_vma_op_unmap_range {
> > +	/** @range: SVM range to unmap */
> > +	struct xe_svm_range *range;
> > +};
> > +
> >  /** enum xe_vma_op_flags - flags for VMA operation */
> >  enum xe_vma_op_flags {
> >  	/** @XE_VMA_OP_COMMITTED: VMA operation committed */
> > @@ -375,6 +381,8 @@ enum xe_vma_op_flags {
> >  enum xe_vma_subop {
> >  	/** @XE_VMA_SUBOP_MAP_RANGE: Map range */
> >  	XE_VMA_SUBOP_MAP_RANGE,
> > +	/** @XE_VMA_SUBOP_UNMAP_RANGE: Unmap range */
> > +	XE_VMA_SUBOP_UNMAP_RANGE,
> >  };
> >  
> >  /** struct xe_vma_op - VMA operation */
> > @@ -397,8 +405,10 @@ struct xe_vma_op {
> >  		struct xe_vma_op_remap remap;
> >  		/** @prefetch: VMA prefetch operation specific data
> > */
> >  		struct xe_vma_op_prefetch prefetch;
> > -		/** @map: VMA map range operation specific data */
> > +		/** @map_range: VMA map range operation specific
> > data */
> >  		struct xe_vma_op_map_range map_range;
> > +		/** @unmap_range: VMA unmap range operation specific
> > data */
> > +		struct xe_vma_op_unmap_range unmap_range;
> >  	};
> >  };
> >  
> 
