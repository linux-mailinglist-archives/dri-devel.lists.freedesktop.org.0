Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C68098F129
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 16:15:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89E2A10E85B;
	Thu,  3 Oct 2024 14:15:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UDL2rkkz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F238110E235;
 Thu,  3 Oct 2024 14:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727964941; x=1759500941;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=UedGxOrdfqAQ8i+DMJbL5dMgeHGs2Ud5aSnUC2UCkoQ=;
 b=UDL2rkkzHy1XIecDySLfXg55K8UGu7F2+ftOFkaWgwPjmX0ho+jH3CFr
 7mIBGDYjjRIFUJpbyJHx1Rg5/Yisp8CtrvnjbN4ZRQ6lJBeUYgeabKmgR
 6odBzSWoMyyZNw7e4AL8lmAbv1c2vHsHO52dqSJC55CRy4Ws3yULuCjI/
 9Thil8trPBPMK8M8sjFBLV+c9K6z6yor7sxVz02csEjyZocB5oBpgopyY
 Byj96WWjvLDcDtyVlTsrrAnwROMSFoD78JeGEwJOSgq8IZSP+HrihJN9w
 xbKi++KNoqBKsfyaT/ENRqh7qKpFvN/f93a17WK4GBLl32whEiFAmrUDq A==;
X-CSE-ConnectionGUID: wvd+mUniQKKYStJenovJJQ==
X-CSE-MsgGUID: 9LPS3NwJQH2/IDTkAw4PHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="14776296"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="14776296"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 07:15:41 -0700
X-CSE-ConnectionGUID: ms6/hj4ARTKg040bej6HFA==
X-CSE-MsgGUID: XH8ayv87SKyPXJw/w/9YIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="97692808"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Oct 2024 07:15:40 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 3 Oct 2024 07:15:40 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 3 Oct 2024 07:15:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 3 Oct 2024 07:15:39 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 3 Oct 2024 07:15:39 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 3 Oct 2024 07:15:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vRbgLedXCzNhCLdq3S2l9IUiw65bfzLDOLRG0voQMTW9f5Tg2ePMysqXAfXX3ptHdNi0C886w0n7VVcRpe7Q17APOaXD3sT4zX07CXleJgOWHxWoeHlNbxs+jIsHgDb+AxEXNP0ht9eVkTzQZ1tyKwvwuAAeM22vAv4jztaRI7hNAuGKbfmAoYPHAKsTZwFBJn6jwVRsegLpSI8ZXqlHcFGUINn1zN9hgPo2GRw6pc+BpRLASK0ofax1lWUdeXE2Ou5+Mu1P0L73J7pdKoN9MW5bxYAo6eGwck8OpBGmpI+G3XT3E5EFwhqfYYaPSSlPQboejlRp1G1N6bzffEP1ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7u3Y5G1ekVimYwx4pevngBspTmvOh+eZvqBOGFTZ7iY=;
 b=PdE1dFmYzvWuNsB0tbmsbR/rmV08GzenkC0fdZqXFbzB3tb9DPG5Pa2RMrkIOc8C199EN+rGeMKBa56D4la58m+BfdRHc1YigeL5qCGpxP4HGWdEEtZsdktxqx+hZk4Pyr/An1Yjyuv3thog5eu3EE37uTVUFsJ3qiFL6uNdos7KMBcWklh+j/+Idbj5sw+VSDjjekalj870Tu4CLZ0oTvhhXC/ctodmjDmLQyflNM6Y1aRd4tsRs5UUgqw2b/jpK4wSzz/USm3HJsojRaP0U9vuSZ+vYvCPgbjSz/9AGSGmsS23BSevSZcLYBhYLzqvbnWVXMX3jV9FTQ88+49IVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6605.namprd11.prod.outlook.com (2603:10b6:510:1b0::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Thu, 3 Oct
 2024 14:15:36 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8026.016; Thu, 3 Oct 2024
 14:15:36 +0000
Date: Thu, 3 Oct 2024 09:15:32 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-xe-fixes
Message-ID: <2fiv63yanlal5mpw3mxtotte6yvkvtex74c7mkjxca4bazlyja@o4iejcfragxy>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW3PR06CA0008.namprd06.prod.outlook.com
 (2603:10b6:303:2a::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6605:EE_
X-MS-Office365-Filtering-Correlation-Id: 00d30c51-6350-46df-d695-08dce3b5d9a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?iyefU0VOl1Se3HBzDIGoOMPAkWhoYy8SbCMgPK2vK2jGktEbGnwxRdV/nT?=
 =?iso-8859-1?Q?eCq6GhHSu9Wp7nn+1T3sr+49zXT31wGGNJOWTjzDZnmHSB3f+I2TWfcoJG?=
 =?iso-8859-1?Q?Xb+iHdT1ad6Hat59oS16Q97KerxRshzt1oaadIXWGzV3ZCeBJw7qjVZZii?=
 =?iso-8859-1?Q?YgmlRuRVGbfa5wbA55tebyP8wS365P7PIgLQJe2uozbI8Wz1J3fJtNWGQo?=
 =?iso-8859-1?Q?lL55uPCXBY3d8A10MsOC5DOjP8CoHD5Juaj/7o4q2SIVPqrCXqq+YmBPEX?=
 =?iso-8859-1?Q?M85oA4oKnMyqyOYsLXfseKQCBGpqnihR22sxQgQbn6YXsbwf2lxLvFTXDw?=
 =?iso-8859-1?Q?BuanwAImjc0GRZAKiAbotfbV+nX/MLKbWBbPaJ+GNCFnmNuh8euE80uZCX?=
 =?iso-8859-1?Q?PxRd/lvwB+tr64nhMIVuPerEIwM3d2LPa/iidc3/EmOysIu+Nv7l0R1SdT?=
 =?iso-8859-1?Q?i8gb7MkX6gnD2cdzOMgAMbRkjR8VvhRINhM3DpwuQlo9GoYhBGtqNdxVEI?=
 =?iso-8859-1?Q?3w87cJpDtoXkLa4o5yTFISBv+T5o7nkpbNsNsLCA/3y8P7ADUeXLZidM/e?=
 =?iso-8859-1?Q?wnr/pEHJbQdSiJ0x/ZsdTfVwxvJbS1G+uxCGeR4gqL3O45KJ4F4ezY85VP?=
 =?iso-8859-1?Q?l1vKS3ZO1EyZqS98Kw5UmhsG0UGXKSPFSgeIUJCYjyRUeezlzpmPP3ZUAq?=
 =?iso-8859-1?Q?ZCRZ5sQUzg99+O9YgbHN+2hd9g+jjY/Uqirth1M05fuZUPnzOg/d3mm2II?=
 =?iso-8859-1?Q?u6XLsIlq6STwe1JUoGOMvrpZ7yBJAW/gizmeY7nnSrlhLa+wycdBrWo5LA?=
 =?iso-8859-1?Q?WSbGTh6quz9X8lNIt4JgqNRAeI08vkbAi7HuhRZsq+WsbVImcjWNvsD2sk?=
 =?iso-8859-1?Q?GZ4vkBbWDar7ebS6asAAE9tv1mCKNofCXqIoPPirQWv2z3TlUFInBG+dZi?=
 =?iso-8859-1?Q?KtHfGdkMCWlpqCk8IFJme0E9ig7R5+xN1pfhhPQ0K2Lp8fk38JO7no0k/7?=
 =?iso-8859-1?Q?gUIFyHXpFlLPtKrwnL8fsFMk4rpTOFSb74UpcMYdnBCiXgOCo9AFb7gKsg?=
 =?iso-8859-1?Q?xk7UXtPO6851qB5jZGcjDQ3a8zXJS7riU+urUwl73W+UHGdozY6C2mg4lr?=
 =?iso-8859-1?Q?iLrQYdoQwos+M24j+lLrm2qhUWMa9BVYk+aHwqxRBOUlbXhR7FWIQIk4BI?=
 =?iso-8859-1?Q?fPMVdiES3xDLZxeZo+rnps9cPindKXyymZSo9KCulRGEOm9er+IOFW+JzA?=
 =?iso-8859-1?Q?+hdhfAKfLfbx7pmkpnL0ScB2H3f/4U6HADv5+pKAQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?XN85l3Aozh6THzQe6DWX5K+kRdEVau7tZoYH9d4Q/cCgIsvXAs+KwJIvNT?=
 =?iso-8859-1?Q?Mjop8EIpmGCCWVmFerTPExQc0fxgqtbuA9dhLXTvGcFESk4oD6dDFj5hxc?=
 =?iso-8859-1?Q?S52GmVLxgL1yJSSFfzbUTT1hSTVDZ3ZiF/5tY20gP0J3TmYcDyzwfgl7yb?=
 =?iso-8859-1?Q?odhaZniOG0xomX4wnozBmJDPVmoia6tmZUV+sq/hELFdrbrlcOhGTs1HhA?=
 =?iso-8859-1?Q?nqYZyQbXO1PZSikzoQGmS2arJczKHaIPvBDKlZ8mC6iXvVhy/chAQ0wnxN?=
 =?iso-8859-1?Q?+ELU6GZBqMOjr3+ZSkUYyfEaB1dOd+CA4XHRwgxvm0eWg1DolBqJI4BYfM?=
 =?iso-8859-1?Q?3Br+tHyELTnu4eukUDGw2pxX23O2eBTp1fB7zmAqfuA1kaeqkmYIaOkK4o?=
 =?iso-8859-1?Q?imdTNkRoK4MxosjHfTklOatgC2bdhckbWlYlAfeg43r4yVx3KaLrkUW6Zx?=
 =?iso-8859-1?Q?SCwDij3cQLfNYQTMfIIgFhubpsKKMktObSrNN7Xw1vu12G/4FhbMj1monx?=
 =?iso-8859-1?Q?WygSsWG/+5gKQniaViW/t3pRjVLP6Pu8vKazfkdJX35cGU1DS/AqHsGMRH?=
 =?iso-8859-1?Q?sHOeovCngQb/4W2kksQVU9Y09a8JldgWAwm46lf44/q7WM76ot6VZJXuAr?=
 =?iso-8859-1?Q?6sBGU3Qx8OoN+9iEnqDgXhOwEf+1NJXlQuIMwQMnxPxuj7QxhGgdu312V6?=
 =?iso-8859-1?Q?EK7oBSPG/ZhYahCGbsTgKk1iciiUKpgZ/ozvgbTDNm7Rwsz5tgcV3cRx9d?=
 =?iso-8859-1?Q?Gaw44F9rq46aGgVi3puiOVt/dG8eQQOBdwDN8ExCNWh/W0pz+Ow2MCd3/v?=
 =?iso-8859-1?Q?tmK6oCTm7tXdFzJaysrun3IryMc1PS+7Dewfjkt5ircUfC7wWhFCjT7ilz?=
 =?iso-8859-1?Q?oyBfvWBkF9our4nkAjJBZSW6McDl5ub3se0rNas/UexrpjFxXHN2N5s8Ql?=
 =?iso-8859-1?Q?93E6uhvi0pavMQgj7GkXa/V8L19BnPa+w3Z5lZnc/pxsFPBIOywdQS4hwo?=
 =?iso-8859-1?Q?Fyc3T/pWkhsbdql6zkttEBhDEBQ/5jzkbtM1/fHOKBEczP9eKPCuyHcuYV?=
 =?iso-8859-1?Q?XVVvT/voLv3VZWWu7TUMusM4Xxs0dneVDwcYCX8G54JkZKIjTc03lof6gd?=
 =?iso-8859-1?Q?iOB5EepkV4lmwFz6uXoXiuPHUhx+O7xNvWMGGA94NtvkXGA73V5GYuS9t4?=
 =?iso-8859-1?Q?g7NJxFjwgD+sPuTfhP6TjOHjGUoz23KHglrCQLJdK4UNAspLAbKbu1QvXy?=
 =?iso-8859-1?Q?HLbi2IwIlMypz3oxfSJsTzVJUJlFPUK+PR/DLUrpxWvueuohaNJWFmZhfy?=
 =?iso-8859-1?Q?2c1iCfn6OUP6hgOc5su9Xel9n0G8H+kmTu1J/JuzAaXnHD8kluSrpN2xKN?=
 =?iso-8859-1?Q?lzfeHm+8QUtBmR5AnGZBdqBkYuKqL0OZbTjlMk0UIw9vnghVDmlQm82iVm?=
 =?iso-8859-1?Q?ClSit0tLlLE5GdUN9KayAC7JPHvyBzwq8oe2k4J9CyQe4Uf/0yZRtuLtiS?=
 =?iso-8859-1?Q?yEdZQIv4GdBr3HIhr+1qVrbLXsTe9P7GYuBItQS6FTL0XjsIVWAzpoKD3h?=
 =?iso-8859-1?Q?hP+h+PlgSbj+9c09YhI9Thki+dOqsxfUl+GVddVXGNY1IhEFYmsy7PcFWL?=
 =?iso-8859-1?Q?L+6Avy39R3DAaUVjL7aih/JRNSLMQrtdbZA+rma46O2OQjXk3RY0wudA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 00d30c51-6350-46df-d695-08dce3b5d9a9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 14:15:36.1656 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o1+1U/KDn/lMK1+JRcWw12K6U29H4TDgaqkHz4qaPeDpELitu6Dk3Gl2Wnp8PIS838E6GvHqQiGTLnA4d8ahux5wx1pYM3ZGzTrWYLt91t8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6605
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

Hi Dave and Simona,

drm-xe-fixes for 6.12-rc2. A few fixes, particularly on error paths and
corner cases. We have more than usual as I decided to skip last week
pull request. Some tuning for Xe2 were missing and also got updated to
match the spec.

Thanks
Lucas De Marchi

drm-xe-fixes-2024-10-03:
Driver Changes:
- Restore pci state on resume (Rodrigo Vivi)
- Fix locking on submission, queue and vm (Matthew Auld, Matthew Brost)
- Fix UAF on queue destruction (Matthew Auld)
- Fix resource release on freq init error path (He Lugang)
- Use rw_semaphore to reduce contention on ASID->VM lookup (Matthew Brost)
- Fix steering for media on Xe2_HPM (Gustavo Sousa)
- Tuning updates to Xe2 (Gustavo Sousa)
- Resume TDR after GT reset to prevent jobs running forever (Matthew Brost)
- Move id allocation to avoid userspace using a guessed number
   to trigger UAF (Matthew Auld, Matthew Brost)
- Fix OA stream close preventing pbatch buffers to complete (José)
- Fix NPD when migrating memory on LNL (Zhanjun Dong)
- Fix memory leak when aborting binds (Matthew Brost)
The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2024-10-03

for you to fetch changes up to a6f3b2527375c786f2eff77d3ee8b805bcfe026d:

   drm/xe: Fix memory leak when aborting binds (2024-10-03 01:24:54 -0500)

----------------------------------------------------------------
Driver Changes:
- Restore pci state on resume (Rodrigo Vivi)
- Fix locking on submission, queue and vm (Matthew Auld, Matthew Brost)
- Fix UAF on queue destruction (Matthew Auld)
- Fix resource release on freq init error path (He Lugang)
- Use rw_semaphore to reduce contention on ASID->VM lookup (Matthew Brost)
- Fix steering for media on Xe2_HPM (Gustavo Sousa)
- Tuning updates to Xe2 (Gustavo Sousa)
- Resume TDR after GT reset to prevent jobs running forever (Matthew Brost)
- Move id allocation to avoid userspace using a guessed number
   to trigger UAF (Matthew Auld, Matthew Brost)
- Fix OA stream close preventing pbatch buffers to complete (José)
- Fix NPD when migrating memory on LNL (Zhanjun Dong)
- Fix memory leak when aborting binds (Matthew Brost)

----------------------------------------------------------------
Gustavo Sousa (3):
       drm/xe/mcr: Use Xe2_LPM steering tables for Xe2_HPM
       drm/xe/xe2: Extend performance tuning to media GT
       drm/xe/xe2: Add performance tuning for L3 cache flushing

He Lugang (1):
       drm/xe: use devm_add_action_or_reset() helper

José Roberto de Souza (1):
       drm/xe/oa: Don't reset OAC_CONTEXT_ENABLE on OA stream close

Matthew Auld (4):
       drm/xe/guc_submit: add missing locking in wedged_fini
       drm/xe: fix UAF around queue destruction
       drm/xe/vm: move xa_alloc to prevent UAF
       drm/xe/queue: move xa_alloc to prevent UAF

Matthew Brost (5):
       drm/xe: Convert to USM lock to rwsem
       drm/xe: Use helper for ASID -> VM in GPU faults and access counters
       drm/xe: Resume TDR after GT reset
       drm/xe: Clean up VM / exec queue file lock usage.
       drm/xe: Fix memory leak when aborting binds

Rodrigo Vivi (1):
       drm/xe: Restore pci state upon resume

Zhanjun Dong (1):
       drm/xe: Prevent null pointer access in xe_migrate_copy

  drivers/gpu/drm/xe/regs/xe_gt_regs.h  | 11 ++++++++++
  drivers/gpu/drm/xe/xe_bo.c            |  4 ++--
  drivers/gpu/drm/xe/xe_device.c        | 12 +++++------
  drivers/gpu/drm/xe/xe_device_types.h  | 19 +++++++++++++----
  drivers/gpu/drm/xe/xe_drm_client.c    |  9 +++++++-
  drivers/gpu/drm/xe/xe_exec_queue.c    |  6 +++---
  drivers/gpu/drm/xe/xe_gpu_scheduler.c |  5 +++++
  drivers/gpu/drm/xe/xe_gpu_scheduler.h |  2 ++
  drivers/gpu/drm/xe/xe_gt_freq.c       |  4 ++--
  drivers/gpu/drm/xe/xe_gt_mcr.c        |  2 +-
  drivers/gpu/drm/xe/xe_gt_pagefault.c  | 39 +++++++++++++++++++----------------
  drivers/gpu/drm/xe/xe_gt_sysfs.c      |  2 +-
  drivers/gpu/drm/xe/xe_guc_submit.c    | 37 ++++++++++++++++++++++++++++++---
  drivers/gpu/drm/xe/xe_guc_types.h     |  2 ++
  drivers/gpu/drm/xe/xe_oa.c            |  9 +++-----
  drivers/gpu/drm/xe/xe_pci.c           |  2 ++
  drivers/gpu/drm/xe/xe_pt.c            |  2 +-
  drivers/gpu/drm/xe/xe_tuning.c        | 28 +++++++++++++++++++++++++
  drivers/gpu/drm/xe/xe_vm.c            | 28 +++++++++++--------------
  19 files changed, 159 insertions(+), 64 deletions(-)
