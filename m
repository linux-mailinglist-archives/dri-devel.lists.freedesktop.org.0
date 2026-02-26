Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gA5fMOAWoGlifgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 10:48:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AE71A3B74
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 10:48:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D7DD10E8A6;
	Thu, 26 Feb 2026 09:48:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kCoMe+X2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45BEA10E004;
 Thu, 26 Feb 2026 09:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772099291; x=1803635291;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9jWEXFZH3VShaevRCWx8n4R7xD9t/4PwmxRT9KhPcOI=;
 b=kCoMe+X2m+wrpVXpLdPv8Ifl2HHYfP+9SMtW3k9K88XIdDIxdQmPFRyV
 WHqmcCuqd0YT+xyESutBm0Pm1iBJX6fZvRUoPa4E5sTKob+0cck2UoVh0
 SIG+HuCmcS5CeGe/DRS/p/Xo7UXMGGUpqU1ThxzWPZC+3GzB8HdyIJIyN
 TXF+Y4ti/qikgDbozo6ml+RRzLFYiRJ/L0spG8r91iZmWp5Y9vJF06AGM
 7IWq8DoG5kDow52FcgqTQzCCbOVWdTtPG6QseoYYBUvuUxi8MkFdTzx2w
 Bv3t6RSiz2HSFQ0Yy5yD984HRIq2jQjxlC4phOp0WB/Sa3hz6ER211bib g==;
X-CSE-ConnectionGUID: N0WBkaVESzSHniTH60CToA==
X-CSE-MsgGUID: tJhG9sP4ReKfgaVluNZMbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="72189403"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="72189403"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 01:48:10 -0800
X-CSE-ConnectionGUID: T8lqVzx3QSKyxlNPJrAN+g==
X-CSE-MsgGUID: 8nwPZT7iRQStDAfpc4W6VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="216529352"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 01:48:10 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 01:48:10 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Feb 2026 01:48:10 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.5) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 01:48:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GzuX94KdSYeHdJzr8ul7owo+/pgJCyZNTEmDPLfyY+ib1SokHdu1CoDjZhRiG2eObX0fsi2q1Sd2PXHj36CADwpsTZcr0MgQtIU5CTY9r3brezKnBj/W9SClGSC20x/ILHVmMbacUeUB3FUWEWqRwf4Z36VJLfiSIgXY6w8XlD5+Es+2d9KBYe7eUCtl2OlVnPQbLVBv214IB0qSPKK2RRokYF8f37gSYSwJUZtJAoj3Ct7zXak+Rc/LSvKJSlTf4uECdPEdXrBkO6fXgxbL+WEwHDLQYdzB9bj6B+fQ5hKYW82wByZqe1LXD9HTTrScUPK30L83NjjNkcAOuuFRXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=35DU632e4MP8iM4lbe7O5LALyzSL9/Isgu/1hqguqVk=;
 b=EZW6+JCWI3xaVzvxpKo7BdR4ORshoxKKD+t519CXcf0MnEBlBVOdFoPWzkL1s1ReJrjVANdJj9ITWtQ4b9/PBSbBBjwqZepSthg2Q4nQMYldmpIspqRym7g12BI4kfKWfAbkxrQyECHp21XZuK9jpUZ1RKZ1X4JMjgeutNnuqdYjBPiiA6226ESRw4QQ7wMGp41Xbo8nQEK57nLsPAf/9s5rnQ5dFrgaurZ2G20EiTTscswp2ukLKqFxzH6/e65BU2PnKiVQEZK8mMynu/6DKUaxp2MkU8nhIQPRB0g9EL/sA8Lg6bLfsdKzq07wUehRR52TBR+gJiU8hv5JIzGurQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CY8PR11MB7922.namprd11.prod.outlook.com (2603:10b6:930:7b::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.13; Thu, 26 Feb 2026 09:48:07 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 09:48:07 +0000
Message-ID: <53fc3f6f-b5b6-4ec6-9468-3cd668efb070@intel.com>
Date: Thu, 26 Feb 2026 15:17:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/5] drm/ras: Introduce the DRM RAS infrastructure over
 generic netlink
To: Jakub Kicinski <kuba@kernel.org>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <aravind.iddamsetty@linux.intel.com>,
 <anshuman.gupta@intel.com>, <joonas.lahtinen@linux.intel.com>,
 <simona.vetter@ffwll.ch>, <airlied@gmail.com>, <pratik.bari@intel.com>,
 <joshua.santosh.ranjan@intel.com>, <ashwin.kumar.kulkarni@intel.com>,
 <shubham.kumar@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <raag.jadav@intel.com>, <anvesh.bakwad@intel.com>, Zack McKevitt
 <zachary.mckevitt@oss.qualcomm.com>, Lijo Lazar <lijo.lazar@amd.com>,
 "Hawking Zhang" <Hawking.Zhang@amd.com>, "David S. Miller"
 <davem@davemloft.net>, "Paolo Abeni" <pabeni@redhat.com>, Eric Dumazet
 <edumazet@google.com>, <netdev@vger.kernel.org>
References: <20260223060541.526397-7-riana.tauro@intel.com>
 <20260223060541.526397-8-riana.tauro@intel.com>
 <20260224162203.279f7b74@kernel.org>
 <686b63cc-2dfb-467b-a472-b6766b2c8dd2@intel.com>
 <20260225161857.55fd4ba4@kernel.org>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20260225161857.55fd4ba4@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0203.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b0::7) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CY8PR11MB7922:EE_
X-MS-Office365-Filtering-Correlation-Id: 417d0af3-0efe-4e06-6adb-08de751c24c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 5qA1SdG+m934cK0W4uUl7loZm4NciHOEjJlpagpIDJN6QGNcKJoyF6pIWlQ6oE+7cWqf5ZBn17sOPQCTvWTqaljxtuh2+2lon1YcI/9sN3F7lJZGBcsTqBCxaI0MEikkfrDyJa723egyzwrgRVY3Aey2jk895lL7C2jGTsbwGDUQCnbRoVW01rkoJWQcZzXUzs09w0UIe2Jdz3omqp82LxdF/gw32vaJF08R36mzCUXOl+OO02XQHYRYDJcWN6RMuzO0GGTEjN6s/YZSbx8m9x/jt4JfssYQq58JMNNLR0QgCpfbeCEjgCOs3UYbwYPAuQqwtV2Xq6W+PxuGHGzCRAwnIMOfbQ5cgtA0PsSbrS0Nm8S0nQlCgSuEJrxUACmFLPanVqgsiFeoKFc9NwkrB31ZGMibkbr2QdS3MkyJhULpT00JhPChymD7/qdxcJ4F/oW4P3sHxWO5ebzBzmxVVF408MfMWC+Zp8YIwnt/JGQhZzLLweupyz9M7Az/so/INzbxNiu2q3quA+IBG1XiNb3MVy/yEQ/TFVo3Rs24862nN20b0EW70wkjD8LRxyBkJiIsSBE11JNILQw+GKFvsJ7S3JFkYEMnwFe0bORdaAdyFXG5wAFVXwm6ZAiBtaxQgc9ZhFP7IkKX+rKAyuLq9xSGP6+N/gQSaCXTQkujEN8HP/asWopeXibaIOr8arnnhS/pYjXZjvK0GZ/tb48DUIBJKjVozj0OB8SFXJ3SReA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODlHUE1GaDE4Rm0vM1lCN3BIU3E5OVVyVDMrckU4dnZOdXQvQlppV2pwVW1L?=
 =?utf-8?B?MVhaOWV3UWxFK2JjQzd3R2hnL2xPRUxSWXhiNXZISmJCQ1hDc2JVWVI3UmtM?=
 =?utf-8?B?OHdjdXBoK3FhZjdkUW9WTmIrMmg1ODk2Wko2RzMwUHIvNVRLZ0ltSGU5VE1v?=
 =?utf-8?B?d1hpUGZoV1pzUzUwemRYdm1GNXJKL3lkcTRwbkVURmhvbjZjbkZtOFcvdVk2?=
 =?utf-8?B?YW9vSkt4VVBDRTFOamloZnhTcGlaWU0rSGpqS0ZIck9NK3lTTms5RU84RG1G?=
 =?utf-8?B?MVR2S1Z6Mm4rOURmZFp1YkNjcC93MDdLYnE0L0dXZHRuMGczbHpnZ3VBU2xs?=
 =?utf-8?B?clczOS9YTGluV01BUVR4S3ZxRmorQWZ5Q1pyTDFEeXh4L3A4YjN1b010T3J2?=
 =?utf-8?B?SkVCQ21RZ05sdHoveTdMemV0QnFiRVc0ZHc0NnZGQVN1RUUxbkp3WE9iaU9P?=
 =?utf-8?B?dnoyWW9sNnNmZE41cmFPS20yU2RRRDk3aHZxS3JvM0hBc3lONFFrMGxpdHhM?=
 =?utf-8?B?OEI2SEdldktjL2VNakJzTk1nanh1Ym9YWWRxWDlZekRkcnNkNWtha1owM25o?=
 =?utf-8?B?K1hRNW9ZdEVwT3UrRkdLK1o3S1BDN1FVQy9FTElOYjNOTXFROVFmZjR5cXQ1?=
 =?utf-8?B?VWZhd2V2UTdVYllyWFhnTUZmTHZOMmt4RWF3YlAxbU9oOFpGZldqcmVMQ1No?=
 =?utf-8?B?cktPSDdFeU94alUwMDNSa09odVpVRy91aWpRKzJ1S3U3d1ZYUHdZTUY4UVhX?=
 =?utf-8?B?R3o3ZW04UzEvdkNzcFRnK2w2eTFYaDYxM0NMdXBWWkxsU2xIKy9KYnA4Vlk3?=
 =?utf-8?B?RURxMllXZFI0TVRhVC9kUzdtWkFHM011QmRhR1RSWkk1TWN5dVhTdHNDNUNr?=
 =?utf-8?B?UlI2bGlQSHVwbXFQc2pjV3B4UzBkeStXYWhaTmJhSXZsaUVZVFdoSlMrYnhm?=
 =?utf-8?B?ZHpjWEZyK0xkUTBJQWV4NWxUZzlGNWhtenFTeGRqSExLTmZzM1BKbFFXTmUw?=
 =?utf-8?B?S2wvR1ZUVnJ6cmEwc0E5UHpVcTFpbW43cXZLbEJjWHRxcU93VFhPTzRvQjdU?=
 =?utf-8?B?dmhiMC8vYlVNU1loaldTUnUrM05samR4THFoQ3ZBK2N3dUdML1JsQnl5Mkd5?=
 =?utf-8?B?UEtmUXpycVkwMFVSTms1TWRDNXh5TnlKUjU3Vm1Wdk9BUDFiT0FxTitUeG9y?=
 =?utf-8?B?YjVGWGdDZThDVUtrZFRnc3hMalFxVG5nTGRvbnYrUGtid3RsUFJocmdJNUFw?=
 =?utf-8?B?R3Q3dUExM3pKUUdYU0dpQ3JoTXRxdERqNi94QlpSTE81aThZZXVmNk1NY2Ir?=
 =?utf-8?B?RVlBTkhteXYrejJCaGdadGVkRzhQcERJS0NTQWp2MVQ0Y2c4NjVSa1JlQjla?=
 =?utf-8?B?YU56R1orUkZLVzh1VmtxRCtFK3J5U2xLVTJHNTc1amJXK3FXeUpJcENON2tH?=
 =?utf-8?B?V0tSZnp6cVJwdWp4dnRwZ3Z6Ry90a1kvYzVIc3NmYXJNY0ZaUEtBdzhCUHJS?=
 =?utf-8?B?bDlaOVNDMTkzTGw2Ym1GZUZwMkovT1R0NVZvbUdpN2FGNFY0VTV6clJaTGxp?=
 =?utf-8?B?Y3krNUQzTU52MWxyUDBITjdjUnY3cnlnanB5Y21FMENUa29VY0JWV2VWV1ZL?=
 =?utf-8?B?cmUxNFUyK2tsQ0hhK280bjNuZUFjTEZ0Nklib3NRRHp1bmsrMWxTTU43UXJY?=
 =?utf-8?B?c2IrTEo1OU1JT1dNSTByOXZXMk8zRU1TbTRHUTg0SEhLTkxBVkJ4d3gzdXBL?=
 =?utf-8?B?c0duNllzR3YvV0VmcFdlai9CMnRVQ0puQ0RhZ2tNR0lXSVZyQlZldjBOVThP?=
 =?utf-8?B?VUZLRlZXZmU2K2MwY1NISlZmVVd2VUNrVnB6K1NOSGhCajJjcG9XZXNhU1NR?=
 =?utf-8?B?aUJPd0d3M0RSSzU4TGxHTzVsSzFuZ2M4aDZQMEh2SWFKYzREdTZ1dDRnWjEx?=
 =?utf-8?B?YXBpQ0gzUWY0alZwaDN4S1NxYjZLUTVTbE83UlQ4WHFXMUlqeHJJd1VvSUR4?=
 =?utf-8?B?dll3ODZvVWFUT3VpMGhGQWZaR0llbTRUTDZ4VmU3SFE2RWt1OUtpZG1iTWFa?=
 =?utf-8?B?UUpVcWp2ckZ3eTVyaTRQb0M5MTJvRzVpMWRRbkpSemJXV29WUW5pcDBhYXRI?=
 =?utf-8?B?MTRWd2dQVFYzdmdZN1RBeGxVRzRIaW5EU2tEMjNhUWFyZ1RiSVBzQ0wyUEh6?=
 =?utf-8?B?Wkp6c1o3ZEEyamdFMTZDRXVjazFnd0QxU0pSdVdJcDVkbnFjQko2dVl5RUlP?=
 =?utf-8?B?dzI4OXlhemFPVGZZbjJrUHI5RGc0cXJnckVBaVpsZ1VFbHV3K3FiT1pyVFFU?=
 =?utf-8?B?Y0lhM1hlbEZHcVhWdERqMjdVNjNjb1N6c1JkT1ltQTNvd2hFemYvQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 417d0af3-0efe-4e06-6adb-08de751c24c7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 09:48:07.1063 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RX5ukn+ePxGlcF5BvgRU+gveIkcv6Dm6oMiKINiAXfxu7Oir+yxzFd1YIB1Jy2ragF6oQXcnu6opVe16LgT6Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7922
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[intel.com,lists.freedesktop.org,linux.intel.com,ffwll.ch,gmail.com,oss.qualcomm.com,amd.com,davemloft.net,redhat.com,google.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,ynl-regen.sh:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[riana.tauro@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 16AE71A3B74
X-Rspamd-Action: no action



On 2/26/2026 5:48 AM, Jakub Kicinski wrote:
> On Wed, 25 Feb 2026 11:38:53 +0530 Riana Tauro wrote:
>> $ tools/net/ynl/pyynl/ynl_gen_c.py --spec \
>>    Documentation/netlink/specs/drm_ras.yaml --mode uapi --header \
>>    > include/uapi/drm/drm_ras.h
>>
>> $ tools/net/ynl/pyynl/ynl_gen_c.py --spec \
>>    Documentation/netlink/specs/drm_ras.yaml --mode kernel --header \
>>    > drivers/gpu/drm/drm_ras_nl.h
>>
>> $ tools/net/ynl/pyynl/ynl_gen_c.py --spec \
>>    Documentation/netlink/specs/drm_ras.yaml --mode kernel --source \
>>    > drivers/gpu/drm/drm_ras_nl.c
> 
> Oh interesting.. that's technically supported but the regen script
> uses "-o $file --cmp-out" instead of "> $file". If we were to use
> a shell redirect we override the file each time which makes incremental
> kernel builds much larger.

If i am using this for the first time (not every time). Shouldn't it 
include the header file (#include "drm_ras_nl.h) too?

tools/net/ynl/pyynl/ynl_gen_c.py --spec 
Documentation/netlink/specs/drm_ras.yaml --mode kernel --source

But i am seeing this include only when i regenerate using ynl-regen.sh.
Is it mandatory to regenerate after the initial use of the above command.

> 
>> I used above commands to generate the initial files moving the
>> drm_ras_nl.h from include/ to drm layer.
>>
>> Even after that if i regen using tools/net/ynl/ynl-regen.sh -f
>> I see the above diff.
>>
>> Am i using the commands wrong or missing something?
> 
> If you use the redirect the script doesn't know what the file name is
> so it gives up on adding the local header. If you really want to have
> the header under include we can just add an option for "--no-auto-hdr"

No its not necessary to be in the include directory as it is used 
internally by drm code.  @Rodrigo I will move this since this is used 
only by drm_ras.c

But even after i move it to drivers/gpu/drm/. The initial generation 
using ynl_gen_c.py doesn't include this header even if the header was 
generated first.

The header is included only when i use ynl-regen. Is that expected?

Thanks
Riana

> But again, just double checking that its what we really need, as the
> auto-generated header is usually quite internal to the Netlink code.
> The users of the netlink family within the kernel include the uAPI
> and some human-written header.

