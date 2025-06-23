Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FA5AE492E
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 17:49:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89C2410E3EC;
	Mon, 23 Jun 2025 15:49:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JLttc6Fj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D47B810E02D;
 Mon, 23 Jun 2025 15:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750693786; x=1782229786;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=JD6sR7T/5NVQsVmJhSD79kY/ZKboY4GMu/3FXPVESUA=;
 b=JLttc6FjBPZDUkvrxmgf+i/+wFikntmO7npFr1pyvrTKUHkmvtfJdVTn
 w8aoYa0gUUBfHVFgv+B1m5RFE43IwTv90o1fBWEEHzfhFfx1d2CoNIKIg
 QLZ2AIyRgDUOUOmaKqr+CQ36wWJmIztxdULiLYR6CFm2HkfMuw7Beblmm
 GAN/dkwURcbQgozZ424cE2M22YYlZeyTJnwsl4rOT4brpzanNKbPEtxCt
 /7EtJ5t2Q0jShUPHBmH9TotaYYSZLHI+48GefJ9hFLK0GftJpb/F4+lTS
 ZMzkpR7pYsRgFazRee8sU26vfg7XrK970vR001fJCMBafKqxQJUKv4EHm g==;
X-CSE-ConnectionGUID: kUJLyT9EQGmMKCMH0ZRUWQ==
X-CSE-MsgGUID: aJdYIIN8QkeQNCG8jC1wyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52877298"
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="52877298"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 08:49:41 -0700
X-CSE-ConnectionGUID: b8z2wv24TvuMXo6Jt3FkBQ==
X-CSE-MsgGUID: rj2theB5Rx67puwxzaZm4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="182680650"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 08:49:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 08:49:41 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 08:49:41 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.60) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 08:49:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HS105ffsiZ6IO+Tk+mCvnp2iZyW+uTGlr0pciy3W3Han88b5XE+iercRfHLIXirMXPnLEo1QRV5gQT4zN5jf2A1VgoTDgyQtJH2dnCXI2gOBxrqj/t/vbE8BWDsBlHQieKZejDaoULULN/ECt7x0Q3OdZyinkTHSyfDa17w2lNPhMuZU2vdCmGxHgxqxrDPwk4F7SZ582q4P0FVeUyh46VHNkD1pntCCvuKhNfxly3i1Qez5y0JxG2SyIoLMcHn0xugwSRkiLN4kS5GKmn3EbF3CAGR8orjEmYkfTJ8++/nYLfOzYXV3GmIXlWMR0HubQYqkP6cQgsBhzyMI+9aBSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QlDiW649U0fefGDO7BeAzxe9JzKh5yQomSgIDT43NhI=;
 b=NngIgFyUtz8cDmC/wg9W+FMjWAJLO2XcXb4o7owL7npe3ZkmGtPmgyS5GH/p5mKSLKNrHbo9k6gzdYVUX+hDVvekFh9SY3q5i0TA5Bq6R0IP6RMLD3WJf3fjJX3mFyvMqZe0xXTuOx8kvn9R+nb8q7TAObYVNo+BaqxeuYq/YYQs1ZPgro88PN+TZPgMEvPWrYzAyG6yQYcONfRc8XMNxRXaC+u4pCSnhy7maCcN/efgB8JjE4b7/P9b6xAH98otg67J8IeYkna3XJ6JudrFF3mGImnMyOziAclt6+Xl4iNx0Z2GLFvEaFu0sy2EIy4iTBT46NrF7IJV/FJONm4i3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB6928.namprd11.prod.outlook.com (2603:10b6:510:224::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Mon, 23 Jun
 2025 15:49:38 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.016; Mon, 23 Jun 2025
 15:49:38 +0000
Date: Mon, 23 Jun 2025 08:51:17 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <christian.koenig@amd.com>, <alexander.deucher@amd.com>,
 <stable@vger.kernel.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/amdgpu: Reset the clear flag in buddy during
 resume
Message-ID: <aFl39emiGSrk2G+/@lstrano-desk.jf.intel.com>
References: <20250623055253.56630-1-Arunpravin.PaneerSelvam@amd.com>
 <20250623055253.56630-2-Arunpravin.PaneerSelvam@amd.com>
 <2250a163-76ee-4da0-8804-9157d269c84b@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2250a163-76ee-4da0-8804-9157d269c84b@intel.com>
X-ClientProxiedBy: MW4PR03CA0341.namprd03.prod.outlook.com
 (2603:10b6:303:dc::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB6928:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dd50640-b760-4113-f676-08ddb26d8f99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?60i8NPnGFRct6LbCavtdsv4QteOY5XvDHXVIzrn0/BU0Y8nmJMbz78+ICt?=
 =?iso-8859-1?Q?4C1V1TEu0Aa1p03PtTT+f/3ULUHPTJ0H3ChBmWDyCx8FINZiacrl4eIqCA?=
 =?iso-8859-1?Q?Ra72xqSfU5Ng5i6VcDkp9xZ3/EQqC+g8hTHyqRIp7MS0borU7Urit284Zn?=
 =?iso-8859-1?Q?Wm9pWDkkHcKiijrywBbEp80JK6SRhsYCgZ0ugzTjXvSNPonalMIpJjAGeM?=
 =?iso-8859-1?Q?ndrB2YCVefGxySZayA3LvYC6Z1BivgJye/n6POb4PQ3kBQj9hifs3F1PvM?=
 =?iso-8859-1?Q?RdJZVEPKYhp5YyfZLFicx9Wrn+tp6UAfJwqdIOIWle7DlyYhJrD1WcOJWh?=
 =?iso-8859-1?Q?pc9StXYlk2IHjnotfLDs6yItN8FJnzqZw8rHaJVhjz1NAEY4hUK3xzXDO6?=
 =?iso-8859-1?Q?QnZ95+yaoG3TIC2UKLlsHhVF6EZ8EzVaWcAxTF5qeB7teeXOFG+bz6qSke?=
 =?iso-8859-1?Q?KRebp+dyR5G25npbKa5M6BKBqgaQ1zo4fLH28Q9dLYeCMBFojxBXXR/qtn?=
 =?iso-8859-1?Q?SQprU038ibEnok1e5wJGElNpCuvkpSsJqLlD4zUWUyVVXK2BoBmi6bpHdz?=
 =?iso-8859-1?Q?a9CAA6WLOdyMlVdEziBcuiz30pVVru2/+LUIfCyKFU99/7/HP8JUz9buef?=
 =?iso-8859-1?Q?1+qrEy43CIiXBc928OTGH7jCLTxVI7zuurStiASrA5gz2Gd+HbbhD0MLEA?=
 =?iso-8859-1?Q?coTVdjFsZyvmGVbXyCj0sf/KpKKnvUhCM92MW9tZjiSdY5/tRmMXGk4N92?=
 =?iso-8859-1?Q?PJdPr5qmgOlF+/9IpN3LEsfTglsoQM88xckLLDyp60AVm+9jW7yN+G9cBs?=
 =?iso-8859-1?Q?tYNN489KHoFHreTht2vLwSOiVwUOqMjxwaK1TQfwG7dTyLYu8+7tK+I7vb?=
 =?iso-8859-1?Q?vj9WBpKQHo6wIy6cRbD15w2ah4UWKUMQ9mNVDeFwrWZk+W329TYxxcb+Lt?=
 =?iso-8859-1?Q?St3bHif1wmY7TpPjlje0b63KwA/q05YVgrtqA7EF/MblpaW1TtwGIeoCA5?=
 =?iso-8859-1?Q?qTRJ0k0poQbER7PD27URAdrU9lylvmLuKTkeyvcz8WKjl3xXtsSDb2HJzc?=
 =?iso-8859-1?Q?vthJwG401j3UBYtjdQ8HoRRl94Mn70sqLv8S3AUIJoEpinhAJ1qbaGfJoi?=
 =?iso-8859-1?Q?zS7wt6mnVDuoQ8k9d2XHg1hpbkzS652Ys/mfyPOaRuFvjfU/W5hBUVo8yx?=
 =?iso-8859-1?Q?A/4cJFPH6cCFSuLeSJ0dMI/hmaFElbPQ+bQ6aq/nCFHLBcHyHHfnUJBJX2?=
 =?iso-8859-1?Q?FB36Z63Ia3xNRmveKTAnzGYANbsjl8egAs1SZbF4pBblzNhHsg/0WrxGJ8?=
 =?iso-8859-1?Q?sleEctDOe8vLS+36vMk5Au/ppoitylJTcNP9Qm25EAoUO0J9ubVQbpXC/Y?=
 =?iso-8859-1?Q?5b+GeFSsHMh+Ml9orbkmsVVDXLpW166QnMp/OTRbgd12wA4nxaF3M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?F2L8V8Ey/OBqjMNeNP5hachx+D74BM8tKGO494T184efRe4vRlfmDvcn0y?=
 =?iso-8859-1?Q?/i+lW7kvZmZrjjjKL6sgZbO2sEmzILZMQYssOIHTgAtunAonj122hc7KxL?=
 =?iso-8859-1?Q?bdWEnKwtNYBbOOXON+JJYG1OZuigaPSaYoAhxPEfalOQ1vp5IUCxt692pa?=
 =?iso-8859-1?Q?FjnoWaFPlY6DrzKZNIcpMJzRRS9Qw/K1GC72QuTHl/SvNoStv13wFrklnC?=
 =?iso-8859-1?Q?VuFolr7BO3oPUzBKrILm5AYIus65e8ijMPSpfyCzFXKZj1DdrJybvOBSat?=
 =?iso-8859-1?Q?vNmwTwut3zDX4kKa6pBzGe7XkTW50dfnNcJsLomFFrjG//snXBS4xdX6mg?=
 =?iso-8859-1?Q?vXVrWuNc1i+7tCQ99z5ZDsR1SsxOdK4i1rrOEsoPv6e830WFnrv5OVU8yQ?=
 =?iso-8859-1?Q?U8IjTzCYtEwRpmyoiHBGKHGjLyQLLCpQIzbqsWaluhKRwGjAkD/tfuzTfP?=
 =?iso-8859-1?Q?V7Nzuyvzu/RS7r2INOhoSe2ENXhHv+zI7h9D46Lk0IOIqWxAIXg6SyF/DR?=
 =?iso-8859-1?Q?2oc0Wxdbsp8aTSXpJs26u/r8amoGj/zufIaxDguUzVGdJyqyEsGrY1aZ0F?=
 =?iso-8859-1?Q?+lXhmO+JcBxvqPTxwfpa4e1DES2hyd+5tj4xpPXIHwYekCt1/nmFdZR4AT?=
 =?iso-8859-1?Q?HOiuRDpHN7iIOEKXI+85/oaOhIuwvBtkuUkmVoJE8/ZQEoPgYy1ujIw9py?=
 =?iso-8859-1?Q?J/MVWRsKEc7lpOfE7A/OLmd3VR/fme7oMlmXNNPb0JLqju35uIskjwIjzD?=
 =?iso-8859-1?Q?vDH865SrXNuXJamq/+TF3wJcm8DbmzEYUq+Bq2pbqD5Md9r8pJphr8Z+G4?=
 =?iso-8859-1?Q?C0ig1muL262EsGzCudZCbETFtQWWOcD5BIwwVYLrBEq+vTrN62DI+Z9ptt?=
 =?iso-8859-1?Q?2WGtFNKVGfzCAeEy52mwrkwlFjRO54tr0khJSblkrb475vfEsH+jE7Grxf?=
 =?iso-8859-1?Q?1t8AZBfUFq6jvdMzHo/pciNTjcfsglxf8UIpSE/n/20uG9NlgCWjV0Nfdc?=
 =?iso-8859-1?Q?tPIZmZoHrksBBuVADqWgtNJteGeZtT6E6oV+P0+6C+FQjKkD27gKxrPfc2?=
 =?iso-8859-1?Q?VideSbdU2yx7mfgXL7Vo7Ln1c09mxutSuFeo/bsgr+KP61p0fzr/ifmi5r?=
 =?iso-8859-1?Q?I/GdtamuDLdrPrh6tYP/8b6xcfNbQ5wrnicf2SAF3W4Yd/oDo34XCceLYo?=
 =?iso-8859-1?Q?1nRPkI4jn1PPdIFLgmHYYCorCd5uZPFWWp1bOq4e+/+1bLr+rCvn6LyQFC?=
 =?iso-8859-1?Q?29Rjtn3x5rH8abN/ZKNKdFPkdC7F4qkJS5WB0+w3AEbi1/yO+5gihDCili?=
 =?iso-8859-1?Q?ZAn6V1Qm+BGnjnxf0ZSaUtQtomV9P3OA3ZY5qTA/ru6tAWsKurExIWnO5k?=
 =?iso-8859-1?Q?OLTstJd+96lA/x8oS167quO83U97DGBQBBfS78KzLocJ5YaufDyUdBMSWU?=
 =?iso-8859-1?Q?C7GkbrIbMKQI1m0b1vys+HSXkmHWWSvp/atUSY54rE9ibnscC4WHjmPubb?=
 =?iso-8859-1?Q?N8CMBIiRSK8Z6Efg9zg68ModlACgKOUrpUJhuEa34+P9/OwEngyt3+TilA?=
 =?iso-8859-1?Q?2CxhP0QB4yaRBtb0kYKv08N5WRzGTkiMhp0Ov38P3+g2JBYVgTzV1Obc2f?=
 =?iso-8859-1?Q?wcKXqAA1PM1Vf6NEuFg+CvAnXXQJ9EndikVd1jhrzD2IqXUGLAhpkMvw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dd50640-b760-4113-f676-08ddb26d8f99
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 15:49:38.8762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tDS3eAbtKPeHs5GtTOHCs7kPGTRHmpHD5no75JkJGf8xPqJoIxDScWUj+FFMNgH89w9Qh6xVgJcGt2aOElKapg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6928
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

On Mon, Jun 23, 2025 at 01:37:35PM +0100, Matthew Auld wrote:
> +Matt B who is adding clear-on-free support in xe. I'm not sure if we might
> also see something like this.
> 

Thanks for the heads up.

> On 23/06/2025 06:52, Arunpravin Paneer Selvam wrote:
> > - Added a handler in DRM buddy manager to reset the cleared
> >    flag for the blocks in the freelist.
> > 
> > - This is necessary because, upon resuming, the VRAM becomes
> >    cluttered with BIOS data, yet the VRAM backend manager
> >    believes that everything has been cleared.
> > 
> > Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> > Suggested-by: Christian König <christian.koenig@amd.com>
> > Cc: stable@vger.kernel.org
> > Fixes: a68c7eaa7a8f ("drm/amdgpu: Enable clear page functionality")
> > Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3812
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c   |  2 ++
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h |  5 ++++
> >   drivers/gpu/drm/drm_buddy.c                  | 24 ++++++++++++++++++++
> >   include/drm/drm_buddy.h                      |  2 ++
> >   4 files changed, 33 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > index a59f194e3360..eb67d6c97392 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > @@ -5193,6 +5193,8 @@ int amdgpu_device_resume(struct drm_device *dev, bool notify_clients)
> >   		dev->dev->power.disable_depth--;
> >   #endif
> >   	}
> > +
> > +	amdgpu_vram_mgr_clear_reset_blocks(&adev->mman.vram_mgr.mm);
> >   	adev->in_suspend = false;
> >   	if (amdgpu_acpi_smart_shift_update(dev, AMDGPU_SS_DEV_D0))
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
> > index 1019c5806ec7..e9e2928fa4d1 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
> > @@ -58,6 +58,11 @@ static inline bool amdgpu_vram_mgr_is_cleared(struct drm_buddy_block *block)
> >   	return drm_buddy_block_is_clear(block);
> >   }
> > +static inline void amdgpu_vram_mgr_clear_reset_blocks(struct drm_buddy *mm)
> > +{
> > +	drm_buddy_clear_reset_blocks(mm);
> 
> No lock needed?
> 
> > +}
> > +
> >   static inline struct amdgpu_vram_mgr_resource *
> >   to_amdgpu_vram_mgr_resource(struct ttm_resource *res)
> >   {
> > diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> > index a1e652b7631d..b5e44867adf2 100644
> > --- a/drivers/gpu/drm/drm_buddy.c
> > +++ b/drivers/gpu/drm/drm_buddy.c
> > @@ -405,6 +405,30 @@ drm_get_buddy(struct drm_buddy_block *block)
> >   }
> >   EXPORT_SYMBOL(drm_get_buddy);
> > +/**
> > + * drm_buddy_clear_reset_blocks - reset cleared blocks
> > + *
> > + * @mm: DRM buddy manager
> > + *
> > + * Reset all the cleared blocks in the freelist.
> > + */
> > +void drm_buddy_clear_reset_blocks(struct drm_buddy *mm)
> > +{
> > +	unsigned int i;
> > +
> 
> This might be a good spot to also force merge freed blocks back together,
> for the ones that have the clear vs dirty mismatch. Otherwise with the below
> loop we can have two buddies that are now dirty but don't get merged back
> together? Fairly sure fini() can chuck a warning otherwise. Also a simple
> kunit test for this would be good.
> 
> > +	for (i = 0; i <= mm->max_order; ++i) {
> > +		struct drm_buddy_block *block;
> > +
> > +		list_for_each_entry_reverse(block, &mm->free_list[i], link) {
> > +			if (drm_buddy_block_is_clear(block)) {
> > +				clear_reset(block);
> > +				mm->clear_avail -= drm_buddy_block_size(mm, block);
> > +			}
> > +		}
> > +	}
> > +}
> > +EXPORT_SYMBOL(drm_buddy_clear_reset_blocks);
> > +
> >   /**
> >    * drm_buddy_free_block - free a block
> >    *
> > diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
> > index 9689a7c5dd36..da569dea16b7 100644
> > --- a/include/drm/drm_buddy.h
> > +++ b/include/drm/drm_buddy.h
> > @@ -160,6 +160,8 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
> >   			 u64 new_size,
> >   			 struct list_head *blocks);
> > +void drm_buddy_clear_reset_blocks(struct drm_buddy *mm);
> > +

I think a polarity argument here would be good. Following up if on Intel
GPUs the inverse is true - our VRAM is entirely cleared. Either way
having this function being able to flip the state either way would be
good.

Matt

> >   void drm_buddy_free_block(struct drm_buddy *mm, struct drm_buddy_block *block);
> >   void drm_buddy_free_list(struct drm_buddy *mm,
> 
