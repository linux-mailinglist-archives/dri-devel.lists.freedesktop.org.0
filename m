Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10788C9476F
	for <lists+dri-devel@lfdr.de>; Sat, 29 Nov 2025 20:56:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6A4D10E184;
	Sat, 29 Nov 2025 19:56:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XrxkOPdZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E64A210E184
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Nov 2025 19:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764446215; x=1795982215;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qDdjKx/kVx/YLt3pPa+lKYOwsq8Lvrfu/vx+QQvG2WY=;
 b=XrxkOPdZwRTf0bunZ0OUi+KdxlwYGr3JfoeVQpkOkW0YSoGf+5nobbPV
 WAJ9k48Y8pzC4a0+vx7eyj/CvcbjIbZWgS3GFPvLUAITSXCVB+bt/3e0u
 B1oF3n+xJL+0/IUldnj1XtqYqve9N9L77ZM5KXDkTHcI6rhbFTWOGw7PW
 XUD8Pr06K9g8Ix6jNIvZ9EB/ayXWcKdIAb2CImZbRKWHLMIVQ7ipmaDIz
 sOex2wAcMzCVjjD6VghT6yaOGr6761s5qb493OarnDyFGGEhGVHErc4Mg
 My/NB5VRnyOwbYDl6Uo/9EZ3gp5I/cSAowcbU2WwPyZz2JP3p6iqqapwc Q==;
X-CSE-ConnectionGUID: vBR99t40SQSPvFv4Njcpxg==
X-CSE-MsgGUID: LHj9mt1xRCqxk0NdvRB1MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11628"; a="70286187"
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; d="scan'208";a="70286187"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2025 11:56:55 -0800
X-CSE-ConnectionGUID: IH3Sc5nIRNa/wtZMWwOqmw==
X-CSE-MsgGUID: ZKSMHhQLRgOM7m9x8Y6rXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; d="scan'208";a="197906736"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2025 11:56:55 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 29 Nov 2025 11:56:53 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sat, 29 Nov 2025 11:56:53 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.62) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 29 Nov 2025 11:56:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qFCziw5Y/Ze+lxJtwomwmoquGYdGU/cK3H9D10beRb/HPLWEfEISnG5zzn3L/JuQ7ibXUhOnQAsQFVhEuCBWg3Yr6o9kVxl0bKrU42YeL0Nvs9/zV4BbOwv8AkL/rLNJXeP9XiJ+aHQMLYU5Xfedn9L9tXFoMpBWY1lodZoBz5zqGdWFwmyhNHfzKKGvXp25wKCaUntyI5/2NBfsDArSpZZ1uUjzJHMabQ1Agf59ibTVSR0NQPe7Y4qpoPCIyc6nOr7QqQxVsIUfzcrLtPFA2Ahp/uJDSa37Qtb/5TffmBHc+ZIQB1TnJoZTV2Y14fse4Xxo5S1YwWtJl53LsJzJ/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7n9EAyviZR+fsZpRYWPiYTmTiExKJ09r1Yb1cL60lEA=;
 b=WOWS6NwPuxd+gfTR5vHySWLr5OcOtoTltJmPBC9dQX/f0KUVChnmhqKPJu8o7D9gzHf6Z2uArtLDmSQNftC+Dvet+rN3a5ja28AT012NSpYi3trIaIr93xLuawB1BItozvm0ysrziycE4Ri14GXZOO7Lg470L+Rm6pEe9585/YlTkQrAaxEMZSInzeNGqVWAgqbNnN1/GZQpV2xKoMeVJGUMPIvpIt6dNRHvq8IXlXXK2D5GmtEBBJeOfCDlca8CiHE4tDKKkLDgwxmNCftB9K4Cur05WglhDykZ4SRgPh7+hIHZnW4Pk6YYKQ1rJSLNwHaYZEVwLlvWPqYxtz/p6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM3PR11MB8683.namprd11.prod.outlook.com (2603:10b6:8:1ac::21)
 by DM4PR11MB7303.namprd11.prod.outlook.com (2603:10b6:8:108::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Sat, 29 Nov
 2025 19:56:52 +0000
Received: from DM3PR11MB8683.namprd11.prod.outlook.com
 ([fe80::2946:4b79:e608:58d3]) by DM3PR11MB8683.namprd11.prod.outlook.com
 ([fe80::2946:4b79:e608:58d3%5]) with mapi id 15.20.9366.012; Sat, 29 Nov 2025
 19:56:52 +0000
Message-ID: <6e3535b4-42f7-4a1c-aafb-2888b9377512@intel.com>
Date: Sat, 29 Nov 2025 21:56:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] accel/habanalabs: fix typo in comment
To: chuguangqing <chuguangqing@inspur.com>, Koby Elbaz <koby.elbaz@intel.com>, 
 Oded Gabbay <ogabbay@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250901084742.1935-1-chuguangqing@inspur.com>
 <20250901084742.1935-2-chuguangqing@inspur.com>
Content-Language: en-US
From: "Sinyuk, Konstantin" <konstantin.sinyuk@intel.com>
In-Reply-To: <20250901084742.1935-2-chuguangqing@inspur.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TL2P290CA0001.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::19) To DM3PR11MB8683.namprd11.prod.outlook.com
 (2603:10b6:8:1ac::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR11MB8683:EE_|DM4PR11MB7303:EE_
X-MS-Office365-Filtering-Correlation-Id: d311aa14-8ae9-4b19-4c9b-08de2f8170a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T2ZKcHcxSnFDVStLQkV6Q3Y4WWs4K253YWZSRWNlNVAvb0Nhbk8wVDhQRHoz?=
 =?utf-8?B?VUt5dGFJWW02Q1F2UzhuUDBtd0pnQXdCWVE1blFSZjNYYko3NmhXNWYwNVFN?=
 =?utf-8?B?V3pJamIrWGd5bWlJeTNqdVp4VE5JVzhoYTBGNCs2bHgyeXl2WE9WMkhIOXFu?=
 =?utf-8?B?Nk5uZm1Hd2FTTExGNFkrMVZSVkZwMVBkM0hUUXp3dDIyOEs4cXBmanh5UnU1?=
 =?utf-8?B?OW83RjEyN1AwT29NQ1hYN0xvOTdhaEJ1MFJ6dTdtTTg2ek0yOGFjejI2WStI?=
 =?utf-8?B?TFo3VjhXYU5odFN3VzRXTHlsd2tNSXNsMVFNY2p1N2NjRzhzQVVlM3QvSC9X?=
 =?utf-8?B?SlZSSWJqTmN4bXJFbmpUVllCTXd6Wk10d3kwMVAwZ0VwRUxKRGwvZzd1T2sr?=
 =?utf-8?B?TnNhb0JuTHJDVzRVY25mTzZDZHFSZ2F4ZFZpN2h0WHRIaGhPQy9mc0NXZTRC?=
 =?utf-8?B?SXhSZEFSWG9lV0g4bmF4aVA4RDQyWWlTSjZEODluUlJSSHhCOElsOHVaYytq?=
 =?utf-8?B?SEFrQnhEVGhCZ2JvRGFGM25ranh2NE84UDJ2QUJjRnF3bW9ualRCNEw5akF2?=
 =?utf-8?B?RCtqOEF2Z0l6OEpLU0ttZ2dYWkdSUmVaZjBLQi9aTlkzQVJySW9NSHVXWVdJ?=
 =?utf-8?B?TXZhcmFNZGFHeHNXS2hyY2R1YnZIZXN3dFZxaDh1QnEzd3U5Z0tBRzNweEh2?=
 =?utf-8?B?QlZFUG9LU1FSRjVLQUg2OEtyV0liS2o2aFZBY2tJT1c3SDJBSEE1K1gwd3Vx?=
 =?utf-8?B?dXJMVi9ZMHZnZmdPSHJocjY3aUs4eUppdy84TjRZaXpONWd5V0pVMmRvT21S?=
 =?utf-8?B?ZDRuek5rTnlBUEx3Z2dqaFRJamhmQU45OEJjU1BZeWFnTzM3dnZJZWMyUnhE?=
 =?utf-8?B?cEhJTEh2N0tScEV3a3NnTFd4TVRGWlQrVjVQM2JqRlJWUm1XTHRISzYyWFRp?=
 =?utf-8?B?bjFJK2lqYlNnVm5ZV1grZHRFYloyTXZBd2o1aDZlNkM5UWFaa3ptcFJ5OFh1?=
 =?utf-8?B?b25RQUFHZVIrMUxRaFE5OUo3TmdDSmYyWXQ2cHQzRnhMelEvUCttenpPdSt4?=
 =?utf-8?B?OE0xUGtDQ2NmNlRTUWJOMmhaSzlNWU8vSXRhTGVRamZqb1hQbHJSTjJaTWdC?=
 =?utf-8?B?cGpiZ05RNjFXRHhyWUVNMTN2dmtrd2hjNTlSNWNONzM2Yk4zQ2hRelV2Kzlh?=
 =?utf-8?B?ZndsQlRudTduVHJWREVXYi9hNTVTSkFQcGJzRkRWN2tKcjJPL1d4SnVQSE5Y?=
 =?utf-8?B?aU1BY1VtU3FaQWc5UEFlOUw5RlI2NVJQZURjSjFxZytQZWwzcDIxYmNlS3lj?=
 =?utf-8?B?VjhXVTlDSnJIQnIxU0kyWU0xdFltVEU4Q3BKRFlVVDFqWGFsTThLb044M1h6?=
 =?utf-8?B?QnZ2NG0vMEhtRVI4alpqeTd5WGZ6VHRUMlZFY1BoM1YyRnc4ZnMxMG95ZlFu?=
 =?utf-8?B?N0hSL0xqZjQvZjN4Nk9GNFZZTldWK0Y1RFUvY2tnRXZaUzBoYktEZXhVOElE?=
 =?utf-8?B?N0xoOHArOExzV3VUd0lub292TnNxL0Rlc1BwNjhsYy96OWhqd2w4K2ozRkNQ?=
 =?utf-8?B?ZklUY1FyT3dYRmMvU2tRdXlXWlBIT2hXZWdLaGRZSlhGaWJOZjhPd011R29k?=
 =?utf-8?B?bVlCVk9rdU96SG4yVFNpeHFDay83aGx3MllTY0krL1hqbDFPdW5uOWJRMWVp?=
 =?utf-8?B?UVdVazZ6aGI4WXQ2Y2NCMTdLZVJSRHZaNHF6YURmYkFDR0U2ZHJ0UGtrVHB1?=
 =?utf-8?B?czg2V1MwRzNmdEFIOEJQTlI1SVRZUHF6eW9LSjRCMzVhQXZVRTFmbjlCU2NJ?=
 =?utf-8?B?ajZYQ1htck9DTXpVaHpHU1VzTnB6UDFmMjhnNVZNQmZCVFdaczdVTVFFK0Va?=
 =?utf-8?B?LzZFelpnQWZuVUZKVVUzT2UrNkdDQWxzc003VzljeFV2NXplN2FYaHZMTzJj?=
 =?utf-8?Q?CykSs04OrPNjhH42YsnR3KAcMCn9Aqzt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR11MB8683.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZU9JeCtZQkY4b0NXeXRkQnhReHdsamhiUTBtT3VnY21QVlhVRSt1VitNWnd1?=
 =?utf-8?B?Z1VsUFZBR2pPY2M2ODdoeUxmTzdIcXRjN05LOVJBbk9XZ0Nobk9FTStjSDBh?=
 =?utf-8?B?TFROTlFHUW5EU3IvcVBXYW5uUC9BL0VUN0ZqeFB0U2FOUkFSTmJvVUR0VkNK?=
 =?utf-8?B?YnhOTndhSnRVZ1owTFJGV3NoWHovUWJicGFqUDMrZVpmTkt6VHh3cHBxMXd2?=
 =?utf-8?B?Q2tKN2VZQjJsSU1XZFpUQ1FMek9kcHNtTEx4YS9XQ3NsSEk4Tnl2bFgydWtT?=
 =?utf-8?B?ZDh6ZzRFRTh2VUlZU215N294SDhtTjhaaXVBdUFzLzFlS1hPVWZra3BOSUhT?=
 =?utf-8?B?WjFmZTAvdWpFbzVNcE1jZ1hNT1JDVFBmQ1ZxQWtyejIxazNlSU9FQktmYXFs?=
 =?utf-8?B?dkRIVUUrT1hrSVVxbWFWMWNsbmUyc3RJVmJ3UWFIZGxPL2xiMU5sRW9qbzZw?=
 =?utf-8?B?SEQvZDIzanNvOURkNnp5YTltekJ1OU1GbGlvdmxpcVFxY0FOalVDMncwbVNN?=
 =?utf-8?B?dXUwRlI4VWZ5Nko1TG83ZVV5c2NjVWdrM0RqUjhrWlNlTDdEVHBXZStWTTZq?=
 =?utf-8?B?dTBERnZTMWhUcEhqWUNRTGRCV3FnWk1TV284cGpYUDIwNm1jOWdDTTNtUWhE?=
 =?utf-8?B?ODhuOS9YRHUrT1I2RTFheUxIZko5ZXFySWFSSExjZTJ0NXY1ZEpXeklFSG5z?=
 =?utf-8?B?SUxyWDFzR2ljQlpoNXIxVlV2MmRiM2FXREZMQnFDMzhEMGx6VlNXeGU5Rnl2?=
 =?utf-8?B?VENOK1R2ZHJtRWpMejJBOWlSd1l1THl2S2dBUW96WUdOWHhsMTl2T25ZWGhp?=
 =?utf-8?B?QzZ4OEVta09uNTRVdDJQeEZlZFkrTENCR3VXbERWcU85bW82Uy9IaXlVY3hm?=
 =?utf-8?B?VE9kcm1SVmlJRUF0UG5kcEZnZXFHM24zVUthdUhJYk5BbkExSTdvVmJqMUlQ?=
 =?utf-8?B?cFZ6a3ROamNZMmt5Q1BrQzQ3UkR1aTEydmd0TVRQTzFJVmVCNnpCSEZzUVZ6?=
 =?utf-8?B?cXV1bDFLTDIyWHFFVlRWSnpHQ0xqZ3MybnFLRHYzWGl4NDlKVE5HcXppUVFC?=
 =?utf-8?B?Z2NSYTVjT1VpMzZ6TWZzR3RSZHNqWlBkbitjc0tBdzlGYVFBU2R0d29qUXpw?=
 =?utf-8?B?emZnRnYwMEdtdEhiODNJelNGNzlQN0NNQnV4R0RhbFhMcnpSR3RTdU5sZWli?=
 =?utf-8?B?T0JJcWpWWW1ZWXZBSjNmQ0Y2SnRhaDh0aFdINWhtL0pjeG5VZHF3MU91Sm82?=
 =?utf-8?B?OSszR3dqNDNIeUNTRFZqWTh4eG9zTGNvUUNzUlJqMzM0TDJaaSsweTdzK3Fo?=
 =?utf-8?B?b3B0TGpIM1UxdWVXV00va3ZjdlpRZFJPRzIrRUU5VmQzN01lK1BEODBjUUtL?=
 =?utf-8?B?UWhocE9ndFNLTHJqcTJRaThDTmlyeXB0Mm1VVkwwNk1TS1RON0lGY0gvNzNo?=
 =?utf-8?B?S0Z0N2FhR05JRXE1SEYvcVdya2dGNXR2Vk1sM24zMG9BZ1lpRCtEUnZjSUFW?=
 =?utf-8?B?Nk5yanpNRE9odjkwZkZIZVJJN01ySUVYVjlwQ3ZQby9QdmtmR053RmIzWTYx?=
 =?utf-8?B?clhTTEs4WmVRYkpyZFhUQlgvWEdxN3lsRlIySUdlYlVUSUJhcTg4QUVCSWNM?=
 =?utf-8?B?VjQ5SWpiMUc3K1hsMlk1aXRvc0c2dnF0K1hPTlVKcVpWdXFhNitRd1JMajBD?=
 =?utf-8?B?ZWROUjlXN0Z4b1pEMGRXeWtKWnc4TjFOdS9LOFVlSGYzYmRDVXRTQnFFSmYr?=
 =?utf-8?B?VHpqUkxPa09BQTVlYzFYUTRvcEFtVklhbjExeE5aaHdhWVd4L0EwclNiZHVP?=
 =?utf-8?B?OWs1UGFZYk5FQ21nZDAvd052dmpHWW9KYXJURi9zZml5TWlpWUxoUHpoTWw5?=
 =?utf-8?B?REN3cTZUYmp5OFFodGJoam9zT0R0OWo3WTV5cGozV1ZXQkR4b2JFV1ZyQzJ2?=
 =?utf-8?B?UzhCRVIxYzlway9OeENFMWJmS0JCenRpRnE4MlhpdWRJZ0VvWVI2TDI1ajNQ?=
 =?utf-8?B?YmpxRU1EN2FiS0s3WVBPYmRxRVZVWlhHakpXRGxDNjkvcmJBUk9WbzRLbzhD?=
 =?utf-8?B?QW5aa0dkb2RCVUx3aUNhTjYxMVdiOEpyLzZVbXp5ckNjbUh3aktQVk1ic2hL?=
 =?utf-8?B?c1BHQ3FxT3ZiRjY4MDU0Y01wcTdGSVdiUGtsUXdVZUNlWnQyS01SQVVTTFds?=
 =?utf-8?B?MlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d311aa14-8ae9-4b19-4c9b-08de2f8170a0
X-MS-Exchange-CrossTenant-AuthSource: DM3PR11MB8683.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2025 19:56:52.3202 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PIozn7fpCBNi6lpFCvL4J1DD8AAy3nW4//8O3CngJVLAeWhVBPZp2wqrH//cRCzMTN25tIcHKxWomaGD5BkbuyLqdPy7IG1gvy+fyzJlKBk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7303
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

On 9/1/2025 11:47 AM, chuguangqing wrote:
> The word "properties" was misspelled as "properites".
> 
> Signed-off-by: chuguangqing <chuguangqing@inspur.com>

Applied to accel/habanalabs-next, thanks.
