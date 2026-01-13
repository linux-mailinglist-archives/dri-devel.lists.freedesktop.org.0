Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5FED1839D
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 11:53:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F86410E4DC;
	Tue, 13 Jan 2026 10:53:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ULCKjyIG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4935B10E4DC;
 Tue, 13 Jan 2026 10:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768301604; x=1799837604;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wkz+pHxlSw6OCC840TH9xzSMOl4QQZk7Pgar3q7xAtE=;
 b=ULCKjyIG3dwXelD8rfqoHSaPGev0Tqn6YQx32H0GGKh4L0PxzvO/iWLn
 ySNhHp22bVnsIml+Lqj8T/ytpvji5U8ghqPgae4CzCytNVzzA80f3HWIS
 pBggpKN3Ml8LsYLVlOZwhLSS+tLs4l87jkRpaj+tTtpF+MoL3+cnvvDsc
 5R0SO7PGx00LyLUuKmJvlIl0y+57yJmDBWy22BxBccFhHJEygm9XY2xxG
 cb7n10Vj/W4+xgmZyl4hZvMDxHrfkpn35NvtbZD9Ox6Gqga8YPpQVgn0T
 WMBmIRyqf2ayT01KYCwv+CaxpxYsE0/jB5W/urOzveIuM+nRYn6eLUxuj g==;
X-CSE-ConnectionGUID: iyHXpXZ5Swq6hIF42u+GqQ==
X-CSE-MsgGUID: fEAYTeLWRym1BzIiUK5BsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="95057467"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="95057467"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 02:53:24 -0800
X-CSE-ConnectionGUID: w2Drx+1lR4K95zeJUdieSA==
X-CSE-MsgGUID: xlzFMw7HRZ+9CeJNMxcbTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="204162805"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 02:53:24 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 02:53:23 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 02:53:23 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.11) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 02:53:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f3n3YF6rGZB9yM07k8S6KMg5K6M+sE9iXZtOYdLULZH6ZyxXaMGSkrDPbl2Lx9dNfoNhwzmj2C/o4IRnwr0YvM6cV0Y698vhPPAGdeVVpkrdDDcgFILvPhAFdizPh4sy7GgZ6+GNi/I3xtIAnqy6y05F+OlWwEiWGV59KhMGYS4Qs47GSGbpoqahbrs6ED+PNwv+FZp5/kjt75wMFZhOVWyViyZ0KRxUylD1NZwOqU8xmj2JMGvhrT4uLDsqlqNHbOyJhkgo1WY13OCW5cPSEAqW2N9vffXnqMXH4p9qB1lX/EwRKloYxpnf4RGtp1HiRGFf6Agxfgj7HyycfoJsIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CwIjK+fiBpeKq/cYR8vOBAHkAET/A9JErXKexkuxPn8=;
 b=qHX1Tt7h4SR1nvcy5MsMWnzMj5xAvwGKK9JQskeBNFovSU/iCNLmqSPTSJugH6cDL0g3UwQoROVSFCQhT4JzORhyZcWA6ZNKLX8BO0SdUw/pornhtPLxJZpyoZhI8tQF+s7XMdhJh9cswCgLd13nIBxAvu/s7SaiFd/U5f6fvoZ8fdD4814AjthD2Uu0WbCcc4D0PLb3PKyISrm6bwyMhMX5QNGhMif49A9aNwd9PJgwZN2jkjvHb3mbPjzEFme84YyZy1PdnrzVyKNHImQVBkG9j6Yge5OUd8DzkF31T5CXBiXDZ98C/I6Y3Yw++EqDJStsWVHcjVo2g0/vZnnowg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by PH0PR11MB7586.namprd11.prod.outlook.com (2603:10b6:510:26e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 10:53:20 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b%3]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 10:53:20 +0000
Message-ID: <76400db2-4bbc-4b5f-a1b2-497dabc9ee73@intel.com>
Date: Tue, 13 Jan 2026 16:23:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/13] drm/colorop: Add destroy helper for colorop
 objects
Content-Language: en-GB
To: Jani Nikula <jani.nikula@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <harry.wentland@amd.com>, <louis.chauvet@bootlin.com>, <mwen@igalia.com>, 
 <contact@emersion.fr>, <alex.hung@amd.com>, <daniels@collabora.com>,
 <uma.shankar@intel.com>, <suraj.kandpal@intel.com>,
 <nfraprado@collabora.com>, <ville.syrjala@linux.intel.com>,
 <matthew.d.roper@intel.com>
References: <20260109081728.478844-1-chaitanya.kumar.borah@intel.com>
 <20260109081728.478844-6-chaitanya.kumar.borah@intel.com>
 <bd769e61d261899ada538818b5a3923070ba2b72@intel.com>
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <bd769e61d261899ada538818b5a3923070ba2b72@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0020.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::32) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|PH0PR11MB7586:EE_
X-MS-Office365-Filtering-Correlation-Id: c548a4b9-61b8-4843-6d5f-08de5291f6b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y3JWWkhyRUN0UGtXS1U5UWNWS0VkbGpRZDhaTnprQW9Xa3ppUUUxeXBISlN0?=
 =?utf-8?B?T2JVYXhyZUxRRWtHaWxKMDhDNWt4SENrUGc5ZGhGODdyYkd6ZFVxcGc0cHFJ?=
 =?utf-8?B?M3M3Vm1VYVA1OVh1NEdMWXRBUmNmNVdXVFg4Yjc1WDcrYml3MXlSQi9RSXVN?=
 =?utf-8?B?eGdBMXVlOHZPQUhKaGRIVjFmc2dFYmsxd2Y3ZENrK2VzZFQyQk1vUnNwMzFR?=
 =?utf-8?B?OU5hb2V0WFhUaUkvT080cElqNWtjRENyYnhnUnMrRWMwV2JDMWVnWUc3Y1Bn?=
 =?utf-8?B?dmRmeWRwV2hIYUcvRlhQdFJYWjY2eVhtMXFOQURKMStnb0Q4Q3NrWk4rcWcr?=
 =?utf-8?B?Qi9RUjNrMjVGeHFtMGhzM3BEUU5XbU8rdHNzRGVraUxPQjR1TVZ6LzJTN2Rw?=
 =?utf-8?B?azdmcG0vMExxa3dnMFNFSzhGalp6d2xJWkw4L3d3RC84cVMzZjErU2tLQk1J?=
 =?utf-8?B?c1Fvby9NVlUwUFVEUjc5MnZXVUVDWTJ2UStmRkJtbXpWR0FDdW1JVEFYc1dN?=
 =?utf-8?B?SVc2MExGSVNGZHFsT0s4TytaV3pMeUFQaWlSYXNlcW00TWE1dzVNaVlkeWpG?=
 =?utf-8?B?ZlVhRFRISzlXR1hJOTZrVHRhZW9vUERwd1YzYkxGRDVRZHFCQTRQUTg5QkUy?=
 =?utf-8?B?NElqVklqNTNMRnZRd29TWGZxVFV4QWZPL2c2aTRkSjIwU0Qrb0lxNVlxYkxF?=
 =?utf-8?B?cndqakpScytnL3hudGQ1NmZXWnM3KzdCOVQ0QlF5T0FpdzRrVXFsdkwybnhQ?=
 =?utf-8?B?YjRMejZYOVBTMEhLemR3RTlSTWROYlcyN1Zvci82cEQ1UmZHSVBybmVFWUgy?=
 =?utf-8?B?SWU1clN2bmNCS002a1Q0U204cXRkd0V6dEF5L0lsb1Q1MGJ6VDc4TnFSc1Uw?=
 =?utf-8?B?VmJrSm5UeHlNZ2RoQU5mM3U3UVRiSGxId1E2aHVrdmI3aDNBQXAwWmpRb00r?=
 =?utf-8?B?K2RsMnpvSEV5eTNrNURoTGQ2MTg1QkQ3M3hPK0Z1SHJPTHFrTlF6amtCREll?=
 =?utf-8?B?bVJ6WjJja2RtYjN1OVM2cjF4cXA4ZkFycXVvanFiWDd6djE0WG4zL2NiMU9s?=
 =?utf-8?B?UzVSRkNJMENzbW9rZUt4eHBXa05LeFJ6K3lyRWxqTFdDVEZTa21lWHgvR0xN?=
 =?utf-8?B?UE1Da094S2t2MmtONVRMTm5XenNVUmd6YVErUEIweVk1ZWhwYWpTL1lsbWVH?=
 =?utf-8?B?Q1N1cERtSzhBOFBoZlowUHBYV2ltQ2xiWW1Tc291R2dyL2g1WE9XR1o3TFlM?=
 =?utf-8?B?N1hvYjZoVTNtUDdVQzl1KzRHMEVvRXdpTVF2eGlkeWk3WmRtWnJiUHl3NzQv?=
 =?utf-8?B?TTA0Mysyakh4K3ZEWUhjaUt5YVVDbmhERnJwQzByZTR4Ry9sczFwUlBoMlhi?=
 =?utf-8?B?ZktDaXUrdFRnVG02RksrUGdVVkNwRk1GK0VXdFFjRDN4cWRQTTZneWZ0M1Bo?=
 =?utf-8?B?bWgvaksxNDNGTmcyZW5uSXdpT1RhbG9xeVlXMXlOMFFtSC9TcHN6SXFud0FC?=
 =?utf-8?B?ajBGRmN1WnBCc3ozZlZUQXdLVlR1YWJaOUpKRm83blBwOERJUldNRE9PQmgr?=
 =?utf-8?B?aHFobkp3OUN2dWZqdnRuU0U4dFFEaVgwckoybVJKQlFBaTc0ZkdxaHI1SWJC?=
 =?utf-8?B?aDhKRFVTSGlVVWNESUQ3RjZoU1IzM2lQTklTWGE0NGZXUitMZS95bHk5OVg3?=
 =?utf-8?B?V0RYY3ZxUStKeXhrL0dnN0xwVFZxRU9VZW05bG4wK2JpSmxBeWRYYUQ0Y0pv?=
 =?utf-8?B?TEhvYzkvcHU3UmNsM2hLa0loN3ZDeEwxbDBDRTdxL2NDcjd5bnJzTHhSK1BG?=
 =?utf-8?B?Qm5SSlRyYWE3Q1BBUEgwUTR1amdSWHBvQ1R0OFVHTE0zUERhaUlMSzh3UXlB?=
 =?utf-8?B?MnVoNit4ck9xRWxab0ZidjZOS0pPcEZTdk9td1p4dFMrRzhGekVzekRNMmVW?=
 =?utf-8?Q?zwRWcLZno9IQzfsPWe4y8KwDxFotNUa9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K09MRDZWYXU4Sm9XQmdDNVNNdVIwZ3Zjc0hEcHcvczZVTmZUZ05LY2NLOU5a?=
 =?utf-8?B?Y2c2eTNnS0xUK2kyUnlxcUhwM1NVWjRoQXZtWGJOUUtXSElBOElvSkpzNUdW?=
 =?utf-8?B?VFlqZS8zL0tPYUdkbTg2UFZObWVta0xpVlZUSXhoYnlhVSthSkdMR2FWb0Iz?=
 =?utf-8?B?cGt1RGZNQkRpTWpxQWREN3cwdk91OXoybzA1ZTJFckRoVHNiVjFPS3l2MUNt?=
 =?utf-8?B?ZjVYUU1yU3M0dmkwSnJjRVBxZTdudG4vWUJ0NDRSMHp3Y1l5emVFekdJMVVa?=
 =?utf-8?B?cXRCb1VLaFBaVXFEc2dnU0tOV2hIVDZYNHp1RWJ5K1YxUE15TmhKUHhYakVs?=
 =?utf-8?B?NUNiMzYwL09sQ0hhTEhXVmJySDl3a3NRZzdPTVFyVE9IR0l0TEVkRXpCK2hU?=
 =?utf-8?B?TUpQam92RlVwZ0hhcC9sQzNsOWVWZlpQQ21SQ25xUDg2WVRzZUFMdHZlU1lS?=
 =?utf-8?B?WUhlSGI1alhsRmw4S1NNbVZnQzBlS3N2eW15c08vZUpHYTgwMVB0a25BTXNh?=
 =?utf-8?B?TTIvNytuQVJwRDhaU2R4d1BXVXlSM0wvV04vMmdKSWo0WWVEQjJRUnFId2ds?=
 =?utf-8?B?VEJVNmdVdUF2Mm93OUxwODlZcGE4VnlmMHViVDFvMlRkNW03ejlLYzZRNjEr?=
 =?utf-8?B?M2R6SHZxNGRjUFBrVEsxZHpVZ29CL3U5aVMwNWtjTXVNQURYS2RoMEZ1cHla?=
 =?utf-8?B?Z1ZaMXQvSWhLN2g3MXJVTThDTE5aaEtyUVZCZmlsSzN5MzRnTEw1MHIzV01Z?=
 =?utf-8?B?UU52azRYNERwTmpRSlpBT2NISkZ1SUI4NElVUlFzTmlMN3JxKytlTHFQZ1VI?=
 =?utf-8?B?MDFEbTltVnZ4blU5SnEvM2ZjR0N1WnlKdU80ZEM3Wnc3OURnVUhTOU1GdnRa?=
 =?utf-8?B?cFJadk4zTVcvVEszNER5enM5dHdXd09qWmRSQjY4cXcvb2VhRlBUZm5rcWYz?=
 =?utf-8?B?SlJWUTRUOVplajVmbFoxdnF2b1ViVlpFUGpXRlBldEdZZEYzRGFSYVVnVkVO?=
 =?utf-8?B?UGRhYlVZMkJxY1ZuZkoxcnpPVWRuT2w1L2lzYUFZOGNVTVpqYmtodXRyakF2?=
 =?utf-8?B?QXhSOENpc1crclZ5ajY4ZHNKNzFZRm8rUEVwRlVJZ0xtb0F5MlZVbnhiQjdh?=
 =?utf-8?B?aFJJMFBlYmRTZlJIOFVTMUI1Q291bmtYMjlFRnZnQ2RyNWJDd3c2emJlbW5K?=
 =?utf-8?B?OTY3VE9keXZRNEFWSUxrRWFZM3pXbkVaQ3ZuWnQzVHRtS2k4MGVLNnhQL2lB?=
 =?utf-8?B?RFFsK3FRcGJDZml4bXVCdkZjV0RXeGFCSkRNTGVDbmtHRENFUThzQ1kwMFpW?=
 =?utf-8?B?UC9xZFJxdWtLTHU5Si9lY3hoNzd0aW9MVFhQUzlXTnlwQ2I2T1UxZzNMMU1D?=
 =?utf-8?B?Q0VsUFhXRG1QVE9CMFZMdHV6TW5mbDVnY3JiN3VFNXVLWVVjdko4aDBQRy9O?=
 =?utf-8?B?dmc1K0pDbnQ3UGJ1UnlBVU9BTzd0eG0zUnk1U1d6RkRTem5BTlFEZlZVMWVv?=
 =?utf-8?B?NVd5N2xNYWdDWFZMN1k5RHBXMXVVdllUWXVSaFdHcDBMelNqWVdUTUZZUS9t?=
 =?utf-8?B?c2tRTUgwU3p3ZTYrRVJCTnlPUkF2UmZpZUdBR3Y4enMyeDFlOVQ1elBMa3Ju?=
 =?utf-8?B?blQ3ZjhJT2ZtY2srNjBBM0hnY2d0NDR2U0daV2l6L2RFYngyUkZKbThSN3Fw?=
 =?utf-8?B?L3VPWkRuekNBV3BZTXQwM0libUdDemh6NHFvQlhoZmNCK3cyY2FUNWNzYVVD?=
 =?utf-8?B?dk9vU0pnQmhBVHdTaUFXMG1zNDV3NG9UazJsWlc4Ynh0Z2NTN3VCVXdWYTRP?=
 =?utf-8?B?TkcwaEtkeThYdU5QVS9uWHowVUhEck1nRGVTN3diamJGS0VEZ0lMQlZZcC9z?=
 =?utf-8?B?bndMMTlJMWM1MXlrcWNnVlAyOHJoVFdmZ2R4cXdaUzhydjdsU1JCVkFIanZt?=
 =?utf-8?B?MDlDaTBJY1RaQ2JsdjdvTko3dzZJclI0RlhwVGVoTUU1cmsrNVB6ZURSV3pt?=
 =?utf-8?B?MkZMUG1qRTl1ZFAyZ1lYeXdqQi94QWs1QzA3OXhFU1gxRUpyNzVITjBqYjNt?=
 =?utf-8?B?cEo5dWlJTGpuUDJKdERZSUQ0bU1VSC96WTlPM2Y1MDhHRjUzd1NlZEN6V1R1?=
 =?utf-8?B?VUx0eWZJZllaSkVidTVMeHZZTUptYnBOdzdZa0VKak5LUWlXNlBoYVdPQUpt?=
 =?utf-8?B?a05zVHJmZk04MDBTb2VNWmlWQzdFT1k3UVZYRm5ta0hBQzd4WUd1Qk1rZGhB?=
 =?utf-8?B?Z0VSc3RMRlRIU212WUxGeWNsMXlMMmtOQ01mNmtuSjZ2RmJSSWhwQmNKbDBB?=
 =?utf-8?B?NldCd1NXSHFlM2ZjU0JjMEZReW9maDRtVkxaTG1xcEFGYjN1MW45K3pJajF6?=
 =?utf-8?Q?vHYyRmx5wBOt8KoY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c548a4b9-61b8-4843-6d5f-08de5291f6b7
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 10:53:19.9160 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NEyVeAp+RhGRwUePDpHkc+XGflHbRoYJirza/Dog8a6KilB7GhBpP8CwV8OqlR1lmdtqHk/8stGs3Cz2mH2VurAZNlKWD+3sCzazZWfetL8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7586
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



On 1/12/2026 4:53 PM, Jani Nikula wrote:
> On Fri, 09 Jan 2026, Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com> wrote:
>> Add a helper that performs common cleanup and frees the
>> associated object. This can be used by drivers if they do not
>> require any driver-specific teardown.
>>
>> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
>> Reviewed-by: Uma Shankar <uma.shankar@intel.com>
>> Reviewed-by: Alex Hung <alex.hung@amd.com>
>> ---
>>   drivers/gpu/drm/drm_colorop.c | 12 ++++++++++++
>>   include/drm/drm_colorop.h     | 10 ++++++++++
>>   2 files changed, 22 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
>> index 44eb823585d2..ba19a3ab23cb 100644
>> --- a/drivers/gpu/drm/drm_colorop.c
>> +++ b/drivers/gpu/drm/drm_colorop.c
>> @@ -178,6 +178,18 @@ void drm_colorop_cleanup(struct drm_colorop *colorop)
>>   }
>>   EXPORT_SYMBOL(drm_colorop_cleanup);
>>   
>> +/**
>> + * drm_colorop_destroy() - Helper for colorop destruction
>> + *
>> + * @colorop: colorop to destroy
>> + */
>> +void drm_colorop_destroy(struct drm_colorop *colorop)
>> +{
>> +	drm_colorop_cleanup(colorop);
>> +	kfree(colorop);
>> +}
>> +EXPORT_SYMBOL(drm_colorop_destroy);
>> +
>>   /**
>>    * drm_colorop_pipeline_destroy - Helper for color pipeline destruction
>>    *
>> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
>> index a3a32f9f918c..0f5ba72c1704 100644
>> --- a/include/drm/drm_colorop.h
>> +++ b/include/drm/drm_colorop.h
>> @@ -420,6 +420,16 @@ void drm_colorop_atomic_destroy_state(struct drm_colorop *colorop,
>>    */
>>   void drm_colorop_reset(struct drm_colorop *colorop);
>>   
>> +/**
>> + * drm_colorop_destroy - destroy colorop
>> + * @colorop: drm colorop
>> + *
>> + * Destroys @colorop by performing common DRM cleanup and freeing the
>> + * colorop object. This can be used by drivers if they do not
>> + * require any driver-specific teardown.
>> + */
> 
> The kernel-doc should be with the function definition, not at the
> declaration, and certainly not both.
> 

Thank you, Jani, for pointing it out. I have removed it in v3.

Regards
Chaitanya

> BR,
> Jani.
> 
>> +void drm_colorop_destroy(struct drm_colorop *colorop);
>> +
>>   /**
>>    * drm_colorop_index - find the index of a registered colorop
>>    * @colorop: colorop to find index for
> 

