Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 378BE896839
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 10:17:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4FC5112582;
	Wed,  3 Apr 2024 08:17:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cKsPc90I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2CC1112575
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 08:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712132258; x=1743668258;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pNN3uRjZkU+SarYG1K6m7LiBlfk6m4G+IpBRJ02AEpw=;
 b=cKsPc90IwrkmyRNkX0aStAAJv3w/0Iy59QVWlKNDweV3NOTPGTvCKCn8
 dBBB3NZvXzRvP8WGcLMQX6FnSH47hXFn95Wb0/+z2Y3KJB2k0QnuL+tTl
 iVtKiDgpsCp9AKrf/TPszgnV0vyvjo1nv04HBrtvKlTZ1rIVWtSMI2Nqu
 tOsVHbVrTKCmoM14cqx2Zw9uAgiMwijggpU6riUeFiACTmDHj827tnp4B
 9NuYPnQJVTMIvJ7zaRxbJ/4rv7XV7Jb5DUGe6iY22Tf95DSzhVDiFGXkn
 mveuW5RM80TzWiU1/r1eVwYmP2zzRIjz2aldit2b0l0IQ4iFdKZ3+OoCk Q==;
X-CSE-ConnectionGUID: fcMdrhUQRMOmQ0zmG/WEVA==
X-CSE-MsgGUID: vpXx8qR/R7OVmh/QabheUA==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="29826015"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; d="scan'208";a="29826015"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 01:17:38 -0700
X-CSE-ConnectionGUID: EiC4OSLER6+E3Deu8vP7jQ==
X-CSE-MsgGUID: 80LYRmsETE2DgFdX6C2uCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; d="scan'208";a="55794240"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2024 01:17:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 01:17:36 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Apr 2024 01:17:36 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 01:17:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mFFKDUosaBK1+OwMmnLkIpSdd/vMlPuhXiyQyewkmwnXv5MA+FhPRdMl0h7QMKeoYYy1uEIDz5gRzmVxnILyjMc8tYSr2SIR2UZLqEI0IOZ3w/bTx5HNWpCFNxJYUe3jkb31JKZigAYRgUpbmWk2RycyI7OXATw7UIHCIhn0aTBSUbiJDh2bGW0Vcc04LBqT8NBfuq0EoETMvyp4b6jQ5ehxnPo4SY9cExQ+bDWvTGP9i81kQbdoqu5Jsk4FZ0SSg0CWl7M6aWicnMCG6eNYjpJ+XiBdXF6mOBX1EG16E+ZrvTN2U36pp1gW5faeWoZIv3JhMKDoPwp+tFt2HQSjuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7h6lkwuaBTqhIrOVig1w1UB0kiFGbS6rMRighRAHupg=;
 b=P0YGMzr+DegFnYockPeijtyCtoVzEvnhkdrv/z+JvhsFCMdC8HcCIKDwEdZA15oh+CjOAxv0tAfi5HZKTMPVgOEHh1U94lWecf4ZH/Wu7JrAD1T+WYmSg1G/xAyzDiWZbYhPYkeOD8WSY9Ty5BuTaOgQzzo9BHmM4ffsUJHaRwQfica/1Jwkxq7Y8D4crd76oCKW7tk69gpQzyRGC8tNGdQtiHx0lWfI7AAsYLumlGqg5BEvAxZWqWes65ovPNJjSV642JclGc8IUaN4JXLEkSye2udhFT1DJwQTE9adVGM4n8SOJKDofo4KT3VwM1fM6vp+4jWxJjJEP9ciV3X+/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB7388.namprd11.prod.outlook.com (2603:10b6:208:420::8)
 by SA1PR11MB5946.namprd11.prod.outlook.com (2603:10b6:806:23a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.24; Wed, 3 Apr
 2024 08:17:35 +0000
Received: from IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::12e2:8615:27f6:95f5]) by IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::12e2:8615:27f6:95f5%5]) with mapi id 15.20.7452.019; Wed, 3 Apr 2024
 08:17:34 +0000
Message-ID: <5afd352e-0f42-4969-89bc-5256ccf05bd5@intel.com>
Date: Wed, 3 Apr 2024 10:17:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/9] Improve test coverage of TTM
To: "Somalapuram, Amaranath" <asomalap@amd.com>,
 <dri-devel@lists.freedesktop.org>
CC: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Amaranath
 Somalapuram" <Amaranath.Somalapuram@amd.com>, Andi Shyti
 <andi.shyti@linux.intel.com>
References: <cover.1711117249.git.karolina.stolarek@intel.com>
 <ebbf7cca-f3e3-66b5-9e35-62b839c08949@amd.com>
Content-Language: en-US
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <ebbf7cca-f3e3-66b5-9e35-62b839c08949@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU6P191CA0033.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53f::8) To IA1PR11MB7388.namprd11.prod.outlook.com
 (2603:10b6:208:420::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7388:EE_|SA1PR11MB5946:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iODTKIzI3UltomcDrh08tfdtxeNURXYw8HcSB7DQFPh4Shmh3i6kjuDnGAywFlH69rBRbqpxiPfQ8vqOqftT1HTPyJPjSB7zmd8OrHcuMljhTnt6PcHSk1nWfBCVIoAdzz2SJBgO8E/YI0RxNryXSb0Plb/W4Mj4CoipQBDPVUBlB7h7gdG9CTUraiIuFDhoJoYqfAwRwHWJCsglVl7FQ5LlKTZazabGRT0tiV4Qwd+LqFBmEcEdon8hmJgYrosQJyXVPeP3Dfb8hJO616UJuccfarJBD8jveZzKAGpbeOMFQ0spr1vLSomDVpje791J2Uiup4aHdP11FhR6zZZzHXxVUuYFXannArLR01zjNsUnIBN/KQ1H5Z1hYrzyBn4lQ2fxfo3IxlRWCZithXbG5VUlcNODtmmhkiC1NxUXUBAuDlzPTPWrnJES0sRDpyViKFAqHvO2lGWbGlJzrZxeNEoW89VgcVbBK5dzZmlfxAl+KgDUpLIerf90LgE07c6G4sjNvwiV3pVnd+x4OLfgO7LNQqQVfFc3xXid1spSb7wLRl3D78qjfVurIaMSDBiT0Z+lUBCRUi+A1mstZX7VshN+tqbWJjFlIiTGoZtAmW4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7388.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eCsyU09NSkpwa2hGeWJIWitmZXgvNzFSUFlxTXdCeHJta0hZL244cm1LbHN3?=
 =?utf-8?B?dlBsa1BIbGRZU3Y0RStrZXYxRDdtZXBNVHNacThoYmRRbWprV1NFMEZjRUpJ?=
 =?utf-8?B?Q1E0NEdCclNMa05PY3RSVWJRbVhGUk9CenVMUFJJbFlUOWszblRtdytHTWgz?=
 =?utf-8?B?MTdoWGovQUdUVldleE4rQm9ZRjd6ZGhEM1U2TnB2emtya0FsZy8yYjg4K2o5?=
 =?utf-8?B?R0x2Ry9SQi8zc2pyOG50MnRqM0lzdVUzUHQrNDZmSlBPU24yVEhZMk1kL0xN?=
 =?utf-8?B?Y0pHZStueTJ4Z0FwRUF1eWgvWmJHdjY3WStZZkhTblV0WHZ2bjJWRDFJRisy?=
 =?utf-8?B?cmF0ZU42bUFFeVB3ZkVKLzk1UjVtQjF5cUs3ZnVvcDN6VEZHQXU1K013NkJ4?=
 =?utf-8?B?bEplSmxEMW9naHg2YXNqcE5FZFh5a3h2d1luTHRmU24zTFF4dExvY1dBOXlL?=
 =?utf-8?B?Y1lENE9Wc0lFeEx3Wmc4MjlTRGFZWTRHVDhjKy9NRzRwZE8wWmRERVNOMGRI?=
 =?utf-8?B?SkVCUDMzOExlTVlrL3drNVNrSUs2aHZjSXRWcHQ5VWh5WUlHc3NvNVVtVXhs?=
 =?utf-8?B?N0xTUncxZTV6OHdWc2p3OUhDbm5LK2pqSExGWWZTT3dLM2J4ZUlMK0R5Nk1k?=
 =?utf-8?B?T3F6K2RQQ2gxdytSOENOcjBiTmo3YWJ0YVZ4MFN0alFYMlhDaHB4Vm9TRzhx?=
 =?utf-8?B?SzJUY2o5VUdiT1RxN1EzRG5WNlNlV1R6UUNabzMydUM1TnU0YWdvNHhYckRw?=
 =?utf-8?B?YzkybTc0V2FjRFlHdzlOd3VObU5LVlJqU3U2TkprK0FsVUNwQmU4QmxrR1hJ?=
 =?utf-8?B?UkdIUlZRWlNxS3p3dXI2QldOU1pHRzlqTk9kcG5zR0hEZG9hQzIrMER3aFJH?=
 =?utf-8?B?TStLS0VKUDN1alQvejJJejNkZEp6RWNpU3hPVzJobHM0WVN2NE52Zi9BMWVr?=
 =?utf-8?B?OHhBWFptSXNYeVJwMXhyQm8wek5iN3RwTWwrMVJuYUxtWjdPbE9BYmRKOEVs?=
 =?utf-8?B?blVtb3AzS2N6V2IvamdrU2c0VjZaVllkbmk3by9xMDY4K0IwVlp0WEZwdHFL?=
 =?utf-8?B?bXRqRWs1ZDk1SlRlVDZGMlpJUkxhM3hwMkErUDFsdFcrQ0JENkZmajhNZ2VY?=
 =?utf-8?B?RXh0ZmpNU2cvU2ZXUXhFU3FjbnQ0NFg2ekxxMStwNGVIaFBBL0NtTS9tamhl?=
 =?utf-8?B?Qk1zK0EzRnoxTHR3aCtQQTU3czFERUxVK1JVVVBKM2pJZmM4N3c2SDJSeWlm?=
 =?utf-8?B?M0h5Y0dvY0VCN0sxMU9UUDRYUjY1WityZjVRM2pTOTROY012VVlrc3ZqaGM1?=
 =?utf-8?B?VzJmRXVISzllTHY2Q1dwZTNPa3Y3ckpuM0pBdFNBUmd3NUNjWDA3c09LaDZJ?=
 =?utf-8?B?aVZZTmYxNlYvdFBWLzZPdEZMY09YeUY4Q1ZlektCYXlWQ1Jqd05HejFYRXZX?=
 =?utf-8?B?YjZNdEt6a2dyYStZTk9RZlZzTU42dUJMdEI4Q3Z1Lzc2YnpVSVNWRTNzS3Nz?=
 =?utf-8?B?eDNaTEhONGpZQjVIS3pDMVhYV2dLalIvZW5yQi9wcTFoMTA4dFhRUXRpRWRV?=
 =?utf-8?B?NGpvcE41a0QwYlJzMVVlNlB5aVVrWWI0OFVIOUNLRDJWcDY4c3o5NEplbFhw?=
 =?utf-8?B?V0xEWUtMK1QybWtkUHpYSXZoMDBXcHhYYlhTOVY4WDJXUVQxRXF0VE13R0k3?=
 =?utf-8?B?QWkvVWYxYytIUWs3VmVtdFdMSFI4ZzZrb0lKdUVCTnZFaXB2YTlMbUdnQVFQ?=
 =?utf-8?B?N3dRSXZ3N0xiZEJRQjk0a1NOYUg5cmxqcEVxdWRka0pEYy81VUFOOHRCdzht?=
 =?utf-8?B?RmdnM2VVNzd5blV4ZWtlclNydFJtWUhuSitOSnBQWC90WDFnZ3dNQkpnbzNZ?=
 =?utf-8?B?eHZObFZTWmtkUHpOZ1FMdTN4UjVrM2JxMWxTZDczS0w2Vk1GSXd2TzdMc3Jo?=
 =?utf-8?B?WXNYUTZsYzR0VlBOQkl0UzhVOTYrVEl3RllPQmpob0ZlemxlNjBQZFdSM3pE?=
 =?utf-8?B?QUVqT1hFdVU1ZUJVbVhPdTlOcEJiKzk4LzZHODVYZzJwSHlMMXBtaVRGK29y?=
 =?utf-8?B?elpoZWlKcEI3bU55UXdSYzM0N0xPWUx6QVlwcGNsKzBqQWE1VFplUy9LL0VR?=
 =?utf-8?B?VXZSNFZqcGFPdWQ5SUpZQUovS1NMRktuZFdUbXU1bm83ZGgvcG80dGt2bHlS?=
 =?utf-8?B?WFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 17bcf624-89b1-4d41-57aa-08dc53b6842b
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7388.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 08:17:34.8269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E18V08ALi2668cCc+onMTWkSuAr0AjAoTRJwdX1Ni2+Uu5eoPVG55euPpgX6Ywl3GaPoZ9QaxxJ5D5jiLkr5xIEwztnUMnRss2EAvVKGQgo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5946
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


Hi Amaranath,

Thanks for checking this.

On 2.04.2024 15:35, Somalapuram, Amaranath wrote:

> /usr/bin/ld: drivers/gpu/drm/tests/drm_kunit_helpers.o:(.rodata+0xa0): 
> undefined reference to `drm_atomic_helper_crtc_reset'
> /usr/bin/ld: drivers/gpu/drm/tests/drm_kunit_helpers.o:(.rodata+0xf0): 
> undefined reference to `drm_atomic_helper_crtc_duplicate_state'
> /usr/bin/ld: drivers/gpu/drm/tests/drm_kunit_helpers.o:(.rodata+0xf8): 
> undefined reference to `drm_atomic_helper_crtc_destroy_state'
> /usr/bin/ld: drivers/gpu/drm/tests/drm_kunit_helpers.o:(.rodata+0x1f8): 
> undefined reference to `drm_atomic_helper_plane_reset'
> /usr/bin/ld: drivers/gpu/drm/tests/drm_kunit_helpers.o:(.rodata+0x208): 
> undefined reference to `drm_atomic_helper_plane_duplicate_state'
> /usr/bin/ld: drivers/gpu/drm/tests/drm_kunit_helpers.o:(.rodata+0x210): 
> undefined reference to `drm_atomic_helper_plane_destroy_state'
> /usr/bin/ld: drivers/gpu/drm/tests/drm_kunit_helpers.o:(.rodata+0x300): 
> undefined reference to `drm_atomic_helper_check'
> /usr/bin/ld: drivers/gpu/drm/tests/drm_kunit_helpers.o:(.rodata+0x308): 
> undefined reference to `drm_atomic_helper_commit'
> /usr/bin/ld: drivers/gpu/drm/display/drm_dp_mst_topology.o: in function 
> `drm_dp_mst_duplicate_state':
> drm_dp_mst_topology.c:(.text+0x3164): undefined reference to 
> `__drm_atomic_helper_private_obj_duplicate_state'
> /usr/bin/ld: drivers/gpu/drm/display/drm_dp_mst_topology.o: in function 
> `drm_dp_delayed_destroy_work':
> drm_dp_mst_topology.c:(.text+0x39d6): undefined reference to 
> `drm_kms_helper_hotplug_event'
> /usr/bin/ld: drivers/gpu/drm/display/drm_dp_mst_topology.o: in function 
> `drm_dp_mst_up_req_work':
> drm_dp_mst_topology.c:(.text+0x930d): undefined reference to 
> `drm_kms_helper_hotplug_event'
> /usr/bin/ld: drivers/gpu/drm/display/drm_dp_mst_topology.o: in function 
> `drm_dp_mst_link_probe_work':
> drm_dp_mst_topology.c:(.text+0xacda): undefined reference to 
> `drm_kms_helper_hotplug_event'
> collect2: error: ld returned 1 exit status
> make[3]: *** [../scripts/Makefile.vmlinux:37: vmlinux] Error 1
> make[2]: *** [/home/rtg/amar/git/drm-misc/Makefile:1162: vmlinux] Error 2
> make[1]: *** [/home/rtg/amar/git/drm-misc/Makefile:240: __sub-make] Error 2
> make: *** [Makefile:240: __sub-make] Error 2
> 
> rtg@rtg-prash-navi22:~/amar/git/drm-misc$
These linker errors were fixed in a patch[1] merged to
drm-misc-next-fixes and it took some time to propagate it back back to
drm-misc-next. It looks like it went back in on March 31st, which is
after commit 4c4f33be7e4d (dated March 25th, if I'm not mistaken). I
checked the series on the drm-misc-next with head commit 45c734fdd43d
and it passes (omitted UML warnings in the listing to improve readability):

$ [drm-misc-next] ./tools/testing/kunit/kunit.py run 
--kunitconfig=drivers/gpu/drm/ttm/tests
[10:11:06] Configuring KUnit Kernel ...
[10:11:06] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=8
[10:11:55] Starting KUnit Kernel (1/1)...
[10:11:55] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[10:11:55] ================= ttm_device (5 subtests) ==================
[10:11:55] [PASSED] ttm_device_init_basic
[10:11:55] [PASSED] ttm_device_init_multiple
[10:11:55] [PASSED] ttm_device_fini_basic
[10:11:55] [PASSED] ttm_device_init_no_vma_man
[10:11:55] ================== ttm_device_init_pools  ==================
[10:11:55] [PASSED] No DMA allocations, no DMA32 required
[10:11:55] [PASSED] DMA allocations, DMA32 required
[10:11:55] [PASSED] No DMA allocations, DMA32 required
[10:11:55] [PASSED] DMA allocations, no DMA32 required
[10:11:55] ============== [PASSED] ttm_device_init_pools ==============
[10:11:55] =================== [PASSED] ttm_device ====================
[10:11:55] ================== ttm_pool (8 subtests) ===================
[10:11:55] ================== ttm_pool_alloc_basic  ===================
[10:11:55] [PASSED] One page
[10:11:55] [PASSED] More than one page
[10:11:55] [PASSED] Above the allocation limit
[10:11:55] [PASSED] One page, with coherent DMA mappings enabled
[10:11:55] [PASSED] Above the allocation limit, with coherent DMA 
mappings enabled
[10:11:55] ============== [PASSED] ttm_pool_alloc_basic ===============
[10:11:55] ============== ttm_pool_alloc_basic_dma_addr  ==============
[10:11:55] [PASSED] One page
[10:11:55] [PASSED] More than one page
[10:11:55] [PASSED] Above the allocation limit
[10:11:55] [PASSED] One page, with coherent DMA mappings enabled
[10:11:55] [PASSED] Above the allocation limit, with coherent DMA 
mappings enabled
[10:11:55] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[10:11:55] [PASSED] ttm_pool_alloc_order_caching_match
[10:11:55] [PASSED] ttm_pool_alloc_caching_mismatch
[10:11:55] [PASSED] ttm_pool_alloc_order_mismatch
[10:11:55] [PASSED] ttm_pool_free_dma_alloc
[10:11:55] [PASSED] ttm_pool_free_no_dma_alloc
[10:11:55] [PASSED] ttm_pool_fini_basic
[10:11:55] ==================== [PASSED] ttm_pool =====================
[10:11:55] ================ ttm_resource (8 subtests) =================
[10:11:55] ================= ttm_resource_init_basic  =================
[10:11:55] [PASSED] Init resource in TTM_PL_SYSTEM
[10:11:55] [PASSED] Init resource in TTM_PL_VRAM
[10:11:55] [PASSED] Init resource in a private placement
[10:11:55] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[10:11:55] ============= [PASSED] ttm_resource_init_basic =============
[10:11:55] [PASSED] ttm_resource_init_pinned
[10:11:55] [PASSED] ttm_resource_fini_basic
[10:11:55] [PASSED] ttm_resource_manager_init_basic
[10:11:55] [PASSED] ttm_resource_manager_usage_basic
[10:11:55] [PASSED] ttm_resource_manager_set_used_basic
[10:11:55] [PASSED] ttm_sys_man_alloc_basic
[10:11:55] [PASSED] ttm_sys_man_free_basic
[10:11:55] ================== [PASSED] ttm_resource ===================
[10:11:55] =================== ttm_tt (15 subtests) ===================
[10:11:55] ==================== ttm_tt_init_basic  ====================
[10:11:55] [PASSED] Page-aligned size
[10:11:55] [PASSED] Extra pages requested
[10:11:55] ================ [PASSED] ttm_tt_init_basic ================
[10:11:55] [PASSED] ttm_tt_init_misaligned
[10:11:55] [PASSED] ttm_tt_fini_basic
[10:11:55] [PASSED] ttm_tt_fini_sg
[10:11:55] [PASSED] ttm_tt_fini_shmem
[10:11:55] [PASSED] ttm_tt_create_basic
[10:11:55] [PASSED] ttm_tt_create_invalid_bo_type
[10:11:55] [PASSED] ttm_tt_create_ttm_exists
[10:11:55] [PASSED] ttm_tt_create_failed
[10:11:55] [PASSED] ttm_tt_destroy_basic
[10:11:55] [PASSED] ttm_tt_populate_null_ttm
[10:11:55] [PASSED] ttm_tt_populate_populated_ttm
[10:11:55] [PASSED] ttm_tt_unpopulate_basic
[10:11:55] [PASSED] ttm_tt_unpopulate_empty_ttm
[10:11:55] [PASSED] ttm_tt_swapin_basic
[10:11:55] ===================== [PASSED] ttm_tt ======================
[10:11:55] =================== ttm_bo (14 subtests) ===================
[10:11:55] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[10:11:55] [PASSED] Cannot be interrupted and sleeps
[10:11:55] [PASSED] Cannot be interrupted, locks straight away
[10:11:55] [PASSED] Can be interrupted, sleeps
[10:11:55] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[10:11:55] [PASSED] ttm_bo_reserve_locked_no_sleep
[10:11:55] [PASSED] ttm_bo_reserve_no_wait_ticket
[10:11:55] [PASSED] ttm_bo_reserve_double_resv
[10:11:55] [PASSED] ttm_bo_reserve_interrupted
[10:11:55] [PASSED] ttm_bo_reserve_deadlock
[10:11:55] [PASSED] ttm_bo_unreserve_basic
[10:11:55] [PASSED] ttm_bo_unreserve_pinned
[10:11:55] [PASSED] ttm_bo_unreserve_bulk
[10:11:55] [PASSED] ttm_bo_put_basic
[10:11:55] [PASSED] ttm_bo_put_shared_resv
[10:11:55] [PASSED] ttm_bo_pin_basic
[10:11:55] [PASSED] ttm_bo_pin_unpin_resource
[10:11:55] [PASSED] ttm_bo_multiple_pin_one_unpin
[10:11:55] ===================== [PASSED] ttm_bo ======================
[10:11:55] ============== ttm_bo_validate (22 subtests) ===============
[10:11:55] ============== ttm_bo_init_reserved_sys_man  ===============
[10:11:55] [PASSED] Buffer object for userspace
[10:11:55] [PASSED] Kernel buffer object
[10:11:55] [PASSED] Shared buffer object
[10:11:55] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[10:11:55] ============== ttm_bo_init_reserved_mock_man  ==============
[10:11:55] [PASSED] Buffer object for userspace
[10:11:55] [PASSED] Kernel buffer object
[10:11:55] [PASSED] Shared buffer object
[10:11:55] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[10:11:55] [PASSED] ttm_bo_init_reserved_resv
[10:11:55] ================== ttm_bo_validate_basic  ==================
[10:11:55] [PASSED] Buffer object for userspace
[10:11:55] [PASSED] Kernel buffer object
[10:11:55] [PASSED] Shared buffer object
[10:11:55] ============== [PASSED] ttm_bo_validate_basic ==============
[10:11:55] [PASSED] ttm_bo_validate_invalid_placement
[10:11:55] ============= ttm_bo_validate_same_placement  ==============
[10:11:55] [PASSED] System manager
[10:11:55] [PASSED] VRAM manager
[10:11:55] ========= [PASSED] ttm_bo_validate_same_placement ==========
[10:11:55] [PASSED] ttm_bo_validate_failed_alloc
[10:11:55] [PASSED] ttm_bo_validate_pinned
[10:11:55] [PASSED] ttm_bo_validate_busy_placement
[10:11:55] ================ ttm_bo_validate_multihop  =================
[10:11:55] [PASSED] Buffer object for userspace
[10:11:55] [PASSED] Kernel buffer object
[10:11:55] [PASSED] Shared buffer object
[10:11:55] ============ [PASSED] ttm_bo_validate_multihop =============
[10:11:55] ========== ttm_bo_validate_no_placement_signaled  ==========
[10:11:55] [PASSED] Buffer object in system domain, no page vector
[10:11:55] [PASSED] Buffer object in system domain with an existing page 
vector
[10:11:55] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[10:11:55] ======== ttm_bo_validate_no_placement_not_signaled  ========
[10:11:55] [PASSED] Buffer object for userspace
[10:11:55] [PASSED] Kernel buffer object
[10:11:55] [PASSED] Shared buffer object
[10:11:55] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[10:11:55] [PASSED] ttm_bo_validate_move_fence_signaled
[10:11:55] ========= ttm_bo_validate_move_fence_not_signaled  =========
[10:11:55] [PASSED] Waits for GPU
[10:11:55] [PASSED] Tries to lock straight away
[10:11:55] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[10:11:55] [PASSED] ttm_bo_validate_swapout
[10:11:55] [PASSED] ttm_bo_validate_happy_evict
[10:11:55] [PASSED] ttm_bo_validate_all_pinned_evict
[10:11:55] [PASSED] ttm_bo_validate_allowed_only_evict
[10:11:55] [PASSED] ttm_bo_validate_deleted_evict
[10:11:55] [PASSED] ttm_bo_validate_busy_domain_evict
[10:11:55] [PASSED] ttm_bo_validate_evict_gutting
[10:11:55] [PASSED] ttm_bo_validate_recrusive_evict
[10:11:55] ================= [PASSED] ttm_bo_validate =================
[10:11:55] ============================================================
[10:11:55] Testing complete. Ran 102 tests: passed: 102
[10:11:55] Elapsed time: 49.333s total, 0.002s configuring, 48.814s 
building, 0.417s running

All the best,
Karolina

--------------
[1] - https://patchwork.freedesktop.org/series/131077/
