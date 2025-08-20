Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 413D8B2E495
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 20:01:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7709810E7B2;
	Wed, 20 Aug 2025 18:01:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J0o0v5yG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4899B10E7AF;
 Wed, 20 Aug 2025 18:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755712861; x=1787248861;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GG3ebyzPsa2IUjAiERprhB6+EDzQg5B2rZ+b1VUKLyI=;
 b=J0o0v5yGrVveh4XBIyfAj8BlxZL/i/Otx4DxcnWMwXC+Bfrhdima7Idd
 caRRm5YBdaNQAPZoymEb2t/QxK4bnEuepd+Alc0NxDfvGOhzrDLS081/p
 GuwtNjfc5vSbKv7gl2YjsHM079bjb6Hrx1MnOo1SrYrklgWjUg1DdSjOw
 +VJWtuT5PGtn9Uo0H55WeA45AWOgW1xXADBjG5KAhZ+fchLEEV8RKJ3yT
 +UjrZfk6/ejj4MGCYpZY0DVFzZl0ZmwDYxU/xPBXiK8NwCwdpVRLE52Hl
 SstWgeOmTw+uUmkpiDlVfq3agS3VnAaAIB+2Ps6kOMvq1qKnFwJEv8FpN g==;
X-CSE-ConnectionGUID: hK6zavdSQNGrDyq6sXM7tw==
X-CSE-MsgGUID: inBvsJSFQz2M5ZzJ0q8iwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="45564026"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="45564026"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 11:01:01 -0700
X-CSE-ConnectionGUID: uOeBjZUrRYOQ3D3zB3FB+g==
X-CSE-MsgGUID: c+oDKTGJS4yVpwFRMiUuHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="167401454"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 11:00:58 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 20 Aug 2025 11:00:58 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 20 Aug 2025 11:00:58 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.64)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 20 Aug 2025 11:00:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k63jecvrjXaU8eXJw5v+yUmc/Ukt/q4227cd60srGS+zTFcrZmxW0LjhY+7aFXc0OB2n9k8OlMXCGvN3AFbA/jUQcHc2qUIF3K+mR27Ei54USL9r63guUpZ4agHao5QUpCNxSOOB+K0hDxRWybtft0SjXd3NEPRgeRZDdD9aPlrfbWnRBDwg0z3MPlWW9FG1VTMNA7Kig64Krx+8FQvFx9dJGsyE6nPy4Ba+S0sG9uaBeWLhte4xaVgMiO9cIlAu6KVDfoZ9b8EjxivC4u9PA6ecTlecZblcC0Y7mrFUTHIjAYYCVeQLeVvYCbgxtxvnI4FpFxfACNiUCq5XPmrkyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DYAO2iIewO+j7lVqir/osKTl1Y+gKNCbnd2ebDq9Kfc=;
 b=WR8pLXwylIW49nod3MozIKf2fi0OQek24UrnfZ3Q6l9mWJUElbhKGWIHOYiRXl7iCb0NdG60laaun/D4mYogZv3ND5o+QPWpsXHbbFAuGZxPHnOkS020o6Lmg6FyV0I8w9b4avl9UcoeUvXKeebbE7PUHq6lxB+tcgfoBrQLCSxDGbwBz7mS2f/HpUjzoN8SszD2blBP2C5pz7hO1GZiy3UBcS9brDkl9fYNPKG2M8H+oV4Zwm2t1naFDAnubvmlwX0fKrqewbk8cdnP9xYwi/xWrq62lWqonL/1QBxzDKOaVV/kpzhs/Elk+MhuAWs1pikoaA1cNL3PSeUKEe4CJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by PH8PR11MB8257.namprd11.prod.outlook.com (2603:10b6:510:1c0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Wed, 20 Aug
 2025 18:00:55 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.9052.013; Wed, 20 Aug 2025
 18:00:55 +0000
Message-ID: <da31eaac-6f84-4e4f-8f18-f2268824f3f8@intel.com>
Date: Wed, 20 Aug 2025 14:00:51 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/guc: Add synchronization on interrupt enable flag
To: Andi Shyti <andi.shyti@kernel.org>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
References: <20250819160010.3386940-1-zhanjun.dong@intel.com>
 <lbmfdys7nox2zaookqtr5abqtd6octniabd63whf6orvhgvgi5@gm6pbo26nzfz>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <lbmfdys7nox2zaookqtr5abqtd6octniabd63whf6orvhgvgi5@gm6pbo26nzfz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0173.namprd04.prod.outlook.com
 (2603:10b6:303:85::28) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|PH8PR11MB8257:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d129165-9452-458a-e371-08dde0138223
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Yno4VDhPRWNrTWxlNTZKa1ZEcVBkdXBRTW1LUWI5bVFuRnpKakE5TnNoV1lk?=
 =?utf-8?B?TktnSlNOQmVUVmZVTUFkZitZWDZ4WS9POCtESk5lNVVPMW13LzdEYXhxZ0o1?=
 =?utf-8?B?V3JXbTE4ZnpWYi9Td1Z6cm1hcSs3dGYzZnovQk5XbFVKcHFNT0NqNVFLY3lE?=
 =?utf-8?B?cjI1NFAwRVNyazVpdUVBQkhSZzNxNEJ6WmlaRkRlVjg3eEVSRmM1QVh0QWRS?=
 =?utf-8?B?Q2JVUVFZWUw4NEgrVWh3L2RKbXNxN0RiQktaZklMZllLbkcwVEY4V0Z3eWRm?=
 =?utf-8?B?T1gwaUdNMmx4aWo1YlQvTmQwak9kaUVySFYrdXJ2Q0lxK096VUpzQ2FWRlZC?=
 =?utf-8?B?bWtWNTFOdG1LQlFZSEhNSTdZZ1gwSHZPV3NEYWlyaHBTTXR3dGJPSkVCYUps?=
 =?utf-8?B?Nk9iZ1dVczA0dkdBSER2ekJmSHBiTGZNNFhFRStyM0t6NkUreW5OT0RzZkhO?=
 =?utf-8?B?RmpJL1Z0bjh1MWVpN2l3Qm96cEV0SHhsajFJU2poWlNjYU9nWkRUZ3RsVUV2?=
 =?utf-8?B?c2dJakp6ako3UXZNK2V0OEdHOHV6Yldsc2VtVnBtOEhqMW5DK0IxU3ZlaWMy?=
 =?utf-8?B?ZU9VSVdWWTVYeEZ5MkRXWjlYeTdkOFZzMGRMaHZFbGhDcm16UnNxQ1R4aHFW?=
 =?utf-8?B?bzQ5Q0gwZ3FRUnM5QWRaeFE3Nlc2Q01tUjhBVC9yNEtZNmZhY1NSTFdMN1dz?=
 =?utf-8?B?ZlVWV1c1RDhFbEMyaFhyQmtIOVVpNEhEYXE0VHAzQko0YTlGTnRpVnNqNUVV?=
 =?utf-8?B?NkxrT1FIQjhpUStrWjByNUJMOHpHb3NmU0ZzVnlzdmZkczRFSHoxQkxvSGFD?=
 =?utf-8?B?TGhrWUliZ1k0dldsQ0k3eU5tWDZLaXgyMUw5TDFVZ3dmanU4M3lQV2dQMU5j?=
 =?utf-8?B?ekJuUUNkWFRhTEFSVHhWZEJNUmlVVi82U1JHQzdHc002UklYQlBibzJTRUdR?=
 =?utf-8?B?SHgrNGZyK25BUFVzVWdzc3RCSzVSOCtxOC9TTkZDUURIbzVGSlNxc3JlQjRK?=
 =?utf-8?B?bEJtQ2hvbmNjSFRnbXBjU0dwb3JYVmtuVVEzd1ZpdG9RT1NFNzVydDhyMkVj?=
 =?utf-8?B?YnhHQ0kxMStZYUZXQVpQNDBYUWRGSkc4QUZ3Q0lOYkdILzlRS0FUTkY2MXVV?=
 =?utf-8?B?WGk3NSsrTkxvOWpVU3VpTG5pV2lnWjRCbEg4VlJhVWhhNHpLK0RFTkVWc2RI?=
 =?utf-8?B?WXg2U0FJcHhWWTN2bUhOYkt2U1dueVRmVGMvdWVid1h2cU02dVhBb3NCN3NY?=
 =?utf-8?B?VnNqanB6eVErZmdxRFRicTV5dXRoQXl6ckx4dVRIbm5ITDY5cmlTcTBoYTls?=
 =?utf-8?B?RVFNY3hvbERBOGZMbXh5OXp4Nk9zdmF5ckl0K0NFeDcwVFBjOVF0WmVaak9a?=
 =?utf-8?B?dVRScU0wVFY4THpOZTV1VjBRVGpIR3g5UVpZM1l0c2NNV1VXRDZBb2hEZk5O?=
 =?utf-8?B?dGg2QzEzODM5Q3BNdGkwU05lR3ArN21QR3Z1Skh5QnM1QUUvQnorQ1VOSEsw?=
 =?utf-8?B?eXpvV2kwa2dZejFxUnUzOVlGbGc1NFE0YUs0b3NZYWR0MzFFcXhsdzJMNFNE?=
 =?utf-8?B?a0VHVGVhODZMT2JvcHcvU0lUR1Baa25OcHpLMUR2NTBwUG43dGVIRzRhaUhV?=
 =?utf-8?B?UWRhKzRkTjlmZXQreDNOQ3B3MGFLbGJEMzdybGVjZGF2NU9DcFBJR1B3SGJz?=
 =?utf-8?B?RHM2WGZpRStIRlJWZUN2MjZNZWtEQmNyMUNuS0J3NzlmQ1I1bmE4UURYM1BF?=
 =?utf-8?B?NGVMR1p4cHNpNmU0eFFrbGVUUkNhWjZzL05FUVVmOG1xOHJJRWZhVGdrSUpZ?=
 =?utf-8?Q?pxONkIE8/uPSznBJgPSYTsln2Vh6fL0pH9jKw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2JRVkNsd1RjOFI5TUE5WkJON0RXY3ZOTEtYalpYbFd5MmpjMmZZZWhKUzFx?=
 =?utf-8?B?UURYblpxZlhlSHkvUkpJWW4xaFhReDJHUmxYMDVqOFZnUlNOUTVoQ1NPS0hH?=
 =?utf-8?B?UnMzVE9QUXVYWG1IaTNUVC8vNFU1eVY2WFQycU9EWFZaNHgyemV2RVB6SkhR?=
 =?utf-8?B?Z29YazI4clNlM1ZYL1dqcUZERndzTjFLTXF0OHBJaGZyS1pmZThyUWxrb0hU?=
 =?utf-8?B?OURVb3ZoYmFza3R6bDNvMzlnaEttRkZxeEhaZ1A5WFVpSVNsdDZTb1dnUUN6?=
 =?utf-8?B?Nk5Md0xBQmF0azlSNm9tQ1cyMFd5emZHVkJocXBYQ09xK0VkbFNETmtTSFRj?=
 =?utf-8?B?U08rTk1oWkFsdng1OTNmM1hWTm4vMm9iRVBjMUl1MnhVWVNHWGJodUh2bzVz?=
 =?utf-8?B?UXNBeUhjdy9zVHBGNDdJTElETkdzaFhGbzFzTm5jZ0hOczdWUkJNOWdON2pF?=
 =?utf-8?B?L0FMRzI0S2NtTW1WaGRJRTMxM1JKdXpMOTJpZHRtdXZacUlYSjl5MGJPK3JH?=
 =?utf-8?B?NU5TcTB3enJoK0o1d2tTa3pIbHc0RXl2c2JpNmtoRnhZa012MEdtM3Z1eVZN?=
 =?utf-8?B?Ry9VNWN3a25uSHZPL1VOc0FOTTBNV3VnUzgwbWU0MGtBUXYrVll5TlgxUmZ6?=
 =?utf-8?B?TWRRYUprL1lSMDJhMUVUaUdYOUFlVld0QnFuUTkyd1NQQWx3Z0M0em4yanor?=
 =?utf-8?B?WFRnT05TTEdIUFEwb0gycWZQY1NMVmpIS1hSU0JScStyZTlUeXZaOWFpSnI1?=
 =?utf-8?B?L3BwWW44N2JrWUtBK0VKamZBbTVrQVhtTFRKR2VmVUROdFBTTXpPOXVQVUNl?=
 =?utf-8?B?R0x5ckMrd0xtSWROL3ZKLzlHM3N1VGtxN2M4ei9WVkpSL0NvUjdtSjBpbWRj?=
 =?utf-8?B?ZkZZWEdOenFTUWlmc0NZeUI5YWdEQlhwby9LU0VuWDFuUmN5aUQwbk1FRHlW?=
 =?utf-8?B?N3RyNStxY3Jhb3FNVHdhWTJ4bkYzWUI2TStpYWZOVFNtODRkWW9QRDl3RHMy?=
 =?utf-8?B?K29jTm1CNjJxTDlGaVNGRGFseDBZT2FXT1dXL1V3azM2RmVQeklVRDNob01h?=
 =?utf-8?B?b1lLUzVqWWdWQWo0aTBrMFA1TTBwaGhnbTZmVnNCcUorUnZ3RVFiL1RvL1dI?=
 =?utf-8?B?NXo0ZlY3d2hGSnlWRU5vZ2s5WTVwUloyOUtWaWRiOUhOU3RheFFvVFQyWFFz?=
 =?utf-8?B?U05LY2V1ZTh6Y1p5OFk1RlA3STkwS2JwS3htL0VvZGdwRTVMZ1Njb3F5dmlG?=
 =?utf-8?B?cjNyZmpNMnEvQ0lpUXRuV0drTVVpOTAxckZ1K2dyb3hYc1k4VmVwYnhXVmhw?=
 =?utf-8?B?S3FBY3VEVlpUeVRLTUVuTHJVazZUWVNzVzl2dDRqUXdFbVN0UmdxUjVaMWZQ?=
 =?utf-8?B?VUJMSjhSdTRTUWp5ME1mYm84OVpvRFRPZXZSRm9vNmgzYzg5eURMODNSTHFl?=
 =?utf-8?B?UWdqV2Y4WGxWVzJ0c3kyUVUyb3RWdm1QZ2E1L0syMEFhSERBa3hmbituT2cw?=
 =?utf-8?B?NGJpQjBSYWNLWjhGL1NtT0xPc1VBSmhCQzhPeFN4N2RoUEVOY3ZwOVhHNDdz?=
 =?utf-8?B?azdORVZ4KzUxZ2h5clZCM3JiNWh4RUtnUDRXaEcvdGh4RDNpeDA2bm42NC9X?=
 =?utf-8?B?aFc2OU05akhIc0dpU21sYVFFc1hld0ZYVzFReW5IcVpXOWs0M3ZOR1M0OFZu?=
 =?utf-8?B?S25md29uSXR2aHRuQURnY05XUTZEOVhzeEJ1TE54UWpFMklGL2ZUZkgzU2dz?=
 =?utf-8?B?RGpxYWtEMk9yWTMzUU5TSkZIV2dSS0hUSzh0UmV2cFpCQ2dOLzZRTXBsWUpP?=
 =?utf-8?B?YUlHdmdOZ2F5NkJjTjVqVnJsTThFUTdlMktYYytMV0dyNUM5M3FkNUp3eDB0?=
 =?utf-8?B?ekc0U3dqZGREU2wzZzlvM2FFY1o4NVhQd3NaNklOUURwWFA3U1hCMmE2V1lZ?=
 =?utf-8?B?SlhHMzJrT1AzV29rVzV3dDhqb0tGVExMS25wVnhYUFRKWEpYMUpaSG1kVFlY?=
 =?utf-8?B?M2FtSkF2UW0wbitTaEhWcmFOcjJtNlE5bUV0TjZkVkttQVZsejJCK3NjblJi?=
 =?utf-8?B?bmlxZTV1eEczYUJJbC9vdUlOYU9BQjF3eCtiU1FMTHFIUEtqaUNEWkpsN01E?=
 =?utf-8?B?cEtIMHp5b004bFhSc3p4RHRwVkJ2NTNxLzU2Kzh0bHZhTmVzQ3YzVFRFYjBp?=
 =?utf-8?B?RUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d129165-9452-458a-e371-08dde0138223
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 18:00:55.0623 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lGO6WqubXdLeCpOZ/CSzw6Wu2nubqMmFVa86tInQk0aTbejw5PGozJravFe2xmPh3bXnnB9KmdO/85o38+2oGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8257
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

See my comments inline below.

Regards,
Zhanjun Dong

On 2025-08-20 6:17 a.m., Andi Shyti wrote:
> Hi Zhanjun,
> 
> On Tue, Aug 19, 2025 at 12:00:10PM -0400, Zhanjun Dong wrote:
>> Boolean flag access from interrupt context might have synchronous issue on
> 
> /synchronous/synchronization/
> /issue/issues/
> 
>> multiple processor platform, flage modified by one core might be read as an
> 
> /flage/flags/
> 
>> old value by another core. This issue on interrupt enable flag might causes
>> interrupt missing or leakage.
> 
> /missing/misses/
> 
>> Fixed by change the data type as automic to add memory synchronization.
> 
> This can be re-written: "Change the interrupts.enable type to
> atomic to ensure memory synchronization."
Will follow all above comments

> 
>>
>> Fixes: a187f13d51fa0 ("drm/i915/guc: handle interrupts from media GuC")
> 
> What issue are you exactly trying to fix? And have you tested
Will add:
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14834

> that this patch is this really fixing it? Where is the flag's
CI report this issue about every 1 or 2 months and close it because no 
reproduce.
I can reproduce it in about 1000 rounds(about 9 hours) of IGT test but 
not at 100% rate, so it is hard to say really fixed because of hard to 
reproduce.
My latest test runs 2200 rounds in total has no reproduce.

> misalignment happening?
> 
> Please remember that when in interrupt context you are already
> running in atomic, so that probably you don't need to have an
> additional atomic access to variables.
Interrupt context only read it. When the flag was changed and interrupt 
was triggered in very short time, the flag read at interrupt context 
might read out old value, if other core(non interrupt context) set the 
flag and ISR read out 0, ISR will do simple return and misses interrupt 
handling, making it appear as lost interrupt; if other core clear the 
flag and ISR read out 1, ISR will continue to run and not stop as 
expected, making it appear as an interrupt leak. >
> Andi
> 
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

