Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BAFA14BC6
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 10:05:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7ACC10EAB2;
	Fri, 17 Jan 2025 09:05:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MGFSsDnr";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B584310E2FA;
 Fri, 17 Jan 2025 09:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737104705; x=1768640705;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0/YUvXZEI/p/PPztmUzEgeUyJHQwfMXLUZ8uDAX+8dk=;
 b=MGFSsDnrRx/dXZU3dEr6Rd/fUBk2S2sx+2Uo++zuThg2fzheOMVtVa+s
 0JQoMxLA7Wk8EUBPkNBNH+IfKfajoIp4L6Nw82BUoyGclDFvIc/a8DiVd
 Cqkx0fczFCsA3bnj3GRNLTvy18OgueMZ2U+YvzrNyVsKm+2ZGW8VBNVLo
 lBamEE2CLlObBNA+GV5nLv+lTWHGJ8iIe8x7NbcWJDwfT8T+fQ7tqH9TG
 PzYai+N7EQLmFqBZMUz38QCe7Ji1MgNeFiezkq3vPDK32bCFxaKwHEtAn
 KcMd6U7OrsHfcRlXVMtwy5ZfskU5jR5at/aYx3RqUvz29hdsa3bqaWR+A A==;
X-CSE-ConnectionGUID: BNy0dDm0QY2yESWvpIK0iA==
X-CSE-MsgGUID: rJ0zlvx/RlKrkBmq2PqlQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="62904876"
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; d="scan'208";a="62904876"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 01:05:04 -0800
X-CSE-ConnectionGUID: xOFjof5RRgSfUVN7V5hdcA==
X-CSE-MsgGUID: tx0HrKkwRWStaqWcrSLTIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="129011443"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jan 2025 01:05:04 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 17 Jan 2025 01:05:03 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 17 Jan 2025 01:05:03 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 17 Jan 2025 01:05:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kOPfh3WIUT8Z/MSbQBYp/t2JSw7R0yfKONOAHUeEFB/U+JxSwKaLOI5qrQ4VsRKbtgMyzkFCWgxhXVZNcHc8Eus2/dNG1PXRnk2prIwR1OiJ7HdgLtf1kWY9A76QE6FW+7XpBsc/Gcdy3Y6ELVq4wVh5lgzclOaMtsRrMxGTqj2gb+yvnWpHPyVztlhkM5pRCNFYAVLqf3boo1NPio4yW3rqc/tlETOU7jusF2VRSWX2eend6o/OmLlfoRSs8amp1wiftyXXi7jY+xC9t4CSEHrLcRQujyPRUwiTbrBpWcSfjfS4o7vVRyR1R//EIFYTBbOwdcA4a8g6k7RuWFiRDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uOcRsvQASN3mEU7YHy0daJwgtmAgB2IDwrivYVSVr80=;
 b=ndVnYepWz/pLenEcM0GkEmGbEr70uPjmH3QMCBzdEl6RLcUT1vXad+rv5n4xO0vtIbPJCR4IEl+qIP8mKMBQUY/ZTAm4ZWqM3WU8NzBBfGYuy4ucB6mlhxUCouuIOKDBEpSzXUcyR/Efhs0B4bbdEfzeiudBh12q9iwnfNace4gzKKzr5mIatjkI5v+YLfajXcs7tXZ4mV/kclQiF30A5liXEJ3+CcTEiDHqd1zQjA+gls3RxDG1pW5CwTzIMcLTRkdOJPapI5fl/awMsAa2Z5s51OqWjTNcfkawp4ARuafwanDiqiUaieiw1+gZV/6ZXa4p0WgTcv916tfwS3frjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by PH7PR11MB6929.namprd11.prod.outlook.com (2603:10b6:510:204::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.14; Fri, 17 Jan
 2025 09:04:34 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548%4]) with mapi id 15.20.8356.014; Fri, 17 Jan 2025
 09:04:34 +0000
Date: Fri, 17 Jan 2025 09:04:26 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: <Intel-GFX@lists.freedesktop.org>, <DRI-Devel@lists.freedesktop.org>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH] drm/i915/uc: Include requested frequency in slow
 firmware load messages
Message-ID: <hcldj72jlzwmxkr5xv56dkb62ulrqfy5y63yxpqcyihwdth4su@x3h2wmjicner>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20241221014329.4048408-1-John.C.Harrison@Intel.com>
 <2qmdebuh4r5lkrq2ygbmbyjqtxcbinjocnb75acyjtt3jfgzkx@o3vbgzyi2kyf>
 <e583d7e1-d643-48b5-845c-5666131e481b@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <e583d7e1-d643-48b5-845c-5666131e481b@intel.com>
X-ClientProxiedBy: DU2PR04CA0073.eurprd04.prod.outlook.com
 (2603:10a6:10:232::18) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|PH7PR11MB6929:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a0acc32-7112-4e47-c21b-08dd36d5f60a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cUNKcjlNTFAxd3ZHNTIwYmNRU0NJYTc5anlwZ0ZnWlJpSjkzd2E4dVBNUzZV?=
 =?utf-8?B?N3MzUmhBcFhIditQS0phZGhVVEFCYTBxSll3NFpqRzVNU04rQlQ1WXRIVGtY?=
 =?utf-8?B?VnM1QWZpNm5MMnpYeXJpRVR5ZkRMY1MzWUlYMUVmWktoM3F3Rkt4N2tPQ1hi?=
 =?utf-8?B?SFJkSU16YUI0bnRjeWNjVHlSZzcrZmRoYytUTG44am8vY0EwSlVqS204czlu?=
 =?utf-8?B?K2RNY1Z3eGpzNEgvMEJtL2lBZTIwSnlQM2lQWUJIdlR1YzR0ZlFMaU4zOU52?=
 =?utf-8?B?NXEzaU5RYTFwajFGWW5JV0I5TXZvS0Z0cFZpZTJGKzMveW5pQlloSUFyRFlD?=
 =?utf-8?B?N25adzhoU3UrUHdxQ1I0RTdGWU5zTGp6MS9relB5Q3JQNTJQanZ1UnlYSU8v?=
 =?utf-8?B?dkU1aXVNb3VJWmMwdHcyWmJtcXBJZmRjZjlrU1hFcWpocUJ1Sk9DR1BwL1lj?=
 =?utf-8?B?MXZmVklucVJMRS9pd2FMM0Fqd2VqMzZIVnE0cWRUUjI2Rm5jZ0R6U2JUQ3Q5?=
 =?utf-8?B?WmdlbGJTUDVCaGp3dFNZR3FjZkNsQmh6OS83anBDemUvQ3c1NW5qN0FORFd6?=
 =?utf-8?B?bzBIVnlXakFmdUwrRXNpcW82VmFFMk94MDBCZFo4SmI4SUFBdWdFMFZKcTdj?=
 =?utf-8?B?b2k3MFVBWEJDK3Z6MEF0cHZRdVNJc3VMbW1nSDZNN1Ziamw1RDFFZ2czNzJL?=
 =?utf-8?B?bU9HbHlwa1hoejAycDU5Q3ZiUzFZSHozTndZd2VmZjF1bjdpa3BRRnpnM3Rk?=
 =?utf-8?B?c08zR0RONUl2SXVyZ0NETXZZUFhNa3FTbStReHAyS1BOdkhaVUg2TnhoSVda?=
 =?utf-8?B?OGRrMjFKamlGS1ZnYlhFUjdBLzU3akFGY0NKS0dlS04zNGV0N29GUGdobnY2?=
 =?utf-8?B?MTZWN01sU05Cc21PajNKVi80anlST2h6bS81SS9Od0ErK2RuUEJWTGFZaFdy?=
 =?utf-8?B?Qm5kREVXekR4b0dhRmFFdjlER0pxS0EwYmtoWUhocWx6WVc3WDhCR2tWcnF4?=
 =?utf-8?B?ckFQZTA2NVBndTVWWVcrbzV4OEY2d01GaEFDanh2ZkdvMEhsdlhpaE5TdnJ3?=
 =?utf-8?B?d2drUmppcEVnczUrU2dnQytodzI4SUNvZTJrZUVCRE1ROG5TWkQrSEVHT1pJ?=
 =?utf-8?B?MGVobzJxdHlvU0xlTGNaZmx2TWovNFJmbGMrMEVuME1rR1ovNmMvNVZUQm13?=
 =?utf-8?B?OHdoTGFkWit2NmNFSTZLbDUzTzZ3VlUvQzNsSG13T0MvVGF3c29GRExCQWg3?=
 =?utf-8?B?Z1FwbHE2MEgrdmNEa0RmcXhIdlBaU3hMd25VWTNsVGI0eTNNUFdDWWErSTFs?=
 =?utf-8?B?T1pSWlhVOFJ6MFl1cDdXQzJzU3hLTWpPR1hzcS8wQ2tvMUV4NE1LK2R5elZT?=
 =?utf-8?B?MEhnSm95MWIrak03ZFpjdWlsV0dnd044cDZNUnkrWUFZaEZBcmtDUmFZT3ZX?=
 =?utf-8?B?UkJKeDltRFhNeXZQTjIrblNORjNkVit5SnlzaEdRNEZCZjdZWHJLY2RsOWd1?=
 =?utf-8?B?eWJtbkJuM2JPc1hvSWN3ZGUzckswOGlJOGtsVnBMTllxWjlqZ040UUdmWmQv?=
 =?utf-8?B?dzZkRzg4ZjJGaG9vUWhhT1JNRVVmVG1pZDRYVlFEd25aQTRlMmtvYkUwaDlW?=
 =?utf-8?B?bUJ6d3E2NWxLSGMwalhYY2MzdkJnaFBLbDhTK0c1eVlyQjlhWXBqVzJ3VmJF?=
 =?utf-8?B?dnpKZ0VBMnJCeVNhcGNDVm9yZGhZSVN6WVJQMnFGZnNCR1NuUDl1RVVFQkdL?=
 =?utf-8?B?YzdpOXdtdEYzWU8zOXBsYjl1L0lwVGVjSlphd3FsRE0vNTRDbGdwYWlMMTd6?=
 =?utf-8?B?S1NDNysvaXl6dVlnVGdhU1hXZTRrT3BpcEtDVUo0cStUVHN1bFJkMEc5Qy9u?=
 =?utf-8?Q?tMAboAoy9nVzi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3dGbkI0V1dVR3Vib2pOaUxOb3NvQWREV0c0ZW9MTDY1cFE3TmhHV0RyUTkr?=
 =?utf-8?B?VlBsdDdSdURTRzc5TXAxR05BS3hYVVFkaldHVWcyUzJBaHZxVnFnT3ZUSVQ3?=
 =?utf-8?B?cWNZVktvK0pncUVibXFiY0x1UmR3RjVabElzNmd6R2wyNk5HNUJqZ0ZzT3F5?=
 =?utf-8?B?NG5Bdm0xVWZtanEvb0pFTDFqZXFZM0lpWXVMaGZhaWRHdWV5TkwyWkp2SXZN?=
 =?utf-8?B?RjZqTlpzRGc0aE81MVFIZUNvSnljQXBUSml5b2Z1aXp1ajQwZG10YTdNazd6?=
 =?utf-8?B?Y2puOU1ISXBwUGd1N0NDOGV3aEFyQnRhNDlOcU9EU2V2VzNEUFVqVDBZdDNl?=
 =?utf-8?B?ZUVsZDJia0Q5bGpUc0RuUEdZTzJwUGZsS0owa3J6ZUh5NWhKd2tqQXNIZ0Fm?=
 =?utf-8?B?UXBhRXNTOW5XMVVhb1h1M0tVcVRTbGdsWnZvczV1S0dtYndoZHlacUx6ZFND?=
 =?utf-8?B?VytNbE1yNGRpakFiWTAvcFJHci8ybkZFWGFtK25oMEwxVGRCVnA2eW1MZ09m?=
 =?utf-8?B?OEc1UWdTakNJUlVFSzVpTG5rV1ExMWJ3KzNIa0xIU0Z0N2JJRnZJcVFoUlpa?=
 =?utf-8?B?dE9SNDl0Y1pMSEkwb3loOEFLNHRpUHBQckcvU0V4TzBWR0tLOHRPYkJuTTFq?=
 =?utf-8?B?OElydUM2Z0lCUzRoQmNhY09KM2ZHWUtBTVA2akFHeVJadmdPZytIcUxBSjRK?=
 =?utf-8?B?c1pQa1RIS0NqaE5zbjdMQ0Z6ZnRpbmVLK045YVN2NFhVYmg5akFMRFNib3F3?=
 =?utf-8?B?SUwrditBOXZZM0h4bFNOUDYxV1BIVzBLRTZza1R3MjJ5VWd4WUtOY1VodUts?=
 =?utf-8?B?dXhDYXdNSUhsd2pMbzcvbzZmOEQ0TXVWVXQxTml3Z2ZRMjNvSWczQmtoV29S?=
 =?utf-8?B?S3lONHUzL29CNTY4M3ljc0F5SHBwVHhlWXNuQ2pTSEprMnB1ekV1MjMzd0Vx?=
 =?utf-8?B?Z1pCcElEYmRaSFY2dE95akoxeDZYK0hwcUFYYSt3Q0cremFLTHJTdXFoWHoz?=
 =?utf-8?B?MEJwbHc1YWVCWEpndVNZcHdEM2JwM3NSRGJpRlRGVVFwL0N5UGpFNWdhZmZo?=
 =?utf-8?B?NlpBbWtSVTJ1OExSYTdGSzUzejIwdHFOMWEwQTluTXR2c01SdkdNc0Q0ZGhm?=
 =?utf-8?B?ek5OT29OVyt6ZDJHNGIraTBoUlR0VUQzbFp0K3FOTFEvcCtndkdZSzY5YXZO?=
 =?utf-8?B?eTBJNk5tRVBhZUZIU2RpL2VSdytMeEFBZ1FLVUl1OCtDZWNrYzVVNlZMQUN5?=
 =?utf-8?B?dGpPcW5kcDVNaHh4TGVoSk9SNEFZWlM5bHVxVmtrT1JmTlJZTENxaklEaFpz?=
 =?utf-8?B?Uy9vbmI1ZjBqME1OKzhHNGRWdCtVUWNid0d2bk9FMnZhSHkyM013dmV3c2RV?=
 =?utf-8?B?bWpjRkt6NE56WC83Vi9Ed21NOGlLOURsR3VEQXlldG5wQjhMZUcwTEJnQjFv?=
 =?utf-8?B?R09iN2FTT1RLZHlUT2Y4a0h4a2tBaG4zV0dRc3k1cXVUY25SWlJWU0wvemNV?=
 =?utf-8?B?VXpXeVJKVFBPS3dDb1NQK2ZMM3JyY0NiU3hxb2JYL0xMcjRtUHYvamlmOFcv?=
 =?utf-8?B?Y0wrbmFvUkg3eXhvcEpWZ0Q5Yk5sL3FmQ0ZqK00rblJERlkyMnQ1MGNjQm1J?=
 =?utf-8?B?VUNoNERRN3FyNjVZbjlCRVVDMUg1YXo4N21XandpVElZR0JKWVpWSFVweCtZ?=
 =?utf-8?B?UUFaRjdxbG51cWJPK0FNZFhNdjNreFJxSS9UQzE3RGtpbTlpd3h5amN6V0hs?=
 =?utf-8?B?V2IrVTJOYzdqaWZlNGFHL2w3c3NJRXBOZ1VscUlxazJWRm90OWh2dm5LN1N1?=
 =?utf-8?B?RHNPWVVjRFlOVVJvblFzdlFrOWhqb3QvR0dGbVlqVWpTcHVzcEVZMnVyN0Ra?=
 =?utf-8?B?QldYamVtdHdnNkRkako5aUNDR053aUY2dEhZbkVVTGpoUGxTd0wwRUtFdlV3?=
 =?utf-8?B?SG1TdVVLSWRkVEJwczVhYmZtVnhMaUJoM1JQcXNNcXNOMEdDT2JMellMS0Vm?=
 =?utf-8?B?WnhxZXZWY1ZEV29jRW5lV01NSEJxSDFDRnlLRFhWblhxNG9RM3IzUmpLWXlM?=
 =?utf-8?B?Z0dpZ0FGNFdpY3FHMVVXOVhlclcyQ1A1TGgvTG5ybEo2YTFvNWp0d0VhZkFO?=
 =?utf-8?B?VjhuZjlFUWZsbjVhT2JhYkl3eExzeDcrOVNKWUNiSFlXMlZKVzlpd0JiZ2dX?=
 =?utf-8?B?dGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a0acc32-7112-4e47-c21b-08dd36d5f60a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 09:04:34.1818 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XeFydKpOBGF5N33E8XzW7ILi3TOhTTifZGB5P+aS4afPupGFlVqwHfo5MiGUeRhEr3UcF9pWA2fpyUGvQLFSoeaww8HTHIJIlyVqvCzR9HQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6929
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

Hi,

> > > +		guc_warn(guc, "excessive init time: [freq = %dMHz -> %dMHz vs %dMHz, perf_limit_reasons = 0x%08X]\n",
> > > +			 before_freq, intel_rps_read_actual_frequency(&gt->rps),
> > > +			 intel_rps_get_requested_frequency(&gt->rps),
> > While, <value> -> <value> is clear to me if I were to encounter
> > this type of log, I wonder if it would be apparent what "vs"
> > means here without having to look into the code. Maybe it would
> > be worth to add "vs actual:" or ", actual:" instead?
> Are you meaning to swap the actual and requested values around? Changing it
> to "<before> -> <requested>, actual <actual>" would make it more confusing,
> IMHO.
> 
> The print is '<before> -> <actual> vs <requested>', i.e. "it started <here>
> and went <there> compared to what we asked for which was <this>". That seems
> like the logical order and description to me. The line is already fairly
> long so the idea was not to make it any longer than necessary while still
> giving all the useful information in a sensible manner.
Fair enough. If the line length is a concern, then there is not
much that can be done. A good addition overall.

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

Krzysztof
