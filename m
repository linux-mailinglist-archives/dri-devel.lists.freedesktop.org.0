Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sI0WLjykoWlxvQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 15:03:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3851B84A2
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 15:03:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0992310EB8F;
	Fri, 27 Feb 2026 14:03:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xg+S5ZZe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14D8910EB8E;
 Fri, 27 Feb 2026 14:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772201016; x=1803737016;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nIMhu/VNqg5YnjFud4di6f7V0g1AHgZFnIUyX7IGsc0=;
 b=Xg+S5ZZei1yNLuHVs6kt66gkSWPsgJTZlYxv8xM/UGKmd0tAHXt3ZPMk
 CyAOMm1Rk/2e419v187wyL5OpFqJ8C/r6fnVf7URVg+RVaPYS7oG4ijQn
 odrGv6qy1t75buaz4cDT5RhpuRYcNpKnK0MJnFBv1yAFkS3wNfJ+Xj4/u
 noZlnTTkU+/P7dALYe5QYdOXEPEvuEdX3cX7xRWw2IX1hK718u3x5I3un
 mVnneP2Jem5dAbVsMwDg7WrXkOnCZ+0vAaJPeYtLFCs5ky67WbBjeECZs
 wW1J4w0IFFJ1KXbV7Ax9Uu102+QssX/59IeCiZypWyfCV1XfAZXidipk2 Q==;
X-CSE-ConnectionGUID: as0Ls/ioR+6HMLr369goQg==
X-CSE-MsgGUID: AN4x+pMZQoGmDWhLcqBt8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="60856400"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="60856400"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 06:03:36 -0800
X-CSE-ConnectionGUID: jhDp1+t/R06q6BZWGnnVjg==
X-CSE-MsgGUID: MxUXJa0aRAioEPJblBzktg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="214325355"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 06:03:35 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 06:03:35 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Feb 2026 06:03:35 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.35) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 06:03:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l3IFiiOg8kXoIxwcABuL9Bx/f5iUEBYnfPHeGyO73Yy+o85fbxukuGpYG6X08VvFvkS/765dHQP3ZUGV51BKA/FEC2e/uckVSjOYXxaEuWm46cuzFWthEQZPRMHySFX+6ZZv1FPw1hYSMzlm2+pnhX96Na6q/UVvWHwPfPqwWfIihmlvk+zQ5alanoKCiqVUnwPSfAgTdCzvVOPVKhEkMtxAYtB8FQWFUiWAi2YipkRGK0npH1RsfPdpaTlFqqmaGEKYxcvGHIrQnjAyYU0WQvaQTd8uYE+bn6yvgjrWKB3EStQJNFBwjlwa/YmUIaVQ+MmZY7BHw1jhhoSzz2XJUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ce7vZpNAsMbfnxppM/ek6kJYcArD+o7RO24DfeW3snQ=;
 b=gFMBTdVyr1IvURUJeS8Taplvpnn/nbR6P0GuDPzfxHKsUH5ePUa4+6KJFbKY2GW9LxWO5KDlZmzT2vPKToL7n0YMRMasjaBOMp+4qCEzlWizmsdJEalmGA5QYhvog/ejbEbMmc44OK91nTZOPArxyY6pO5aT8nxvVQwYnpbtQQWJGblQry3V2+f+R20j2yJfxBGYn/GRU/bRWTCxbrbiCq1EI6Qn4JTmP0dNpwtHrCug6thX0wHfotPoEWb5FuYB1D6q3kj60/UA1vCeWmJ7ZemFxik3eYxLCudPZssiVm2lv3q0s7GzRAiljQ9W3BC3AppZcZqGgRQOsIyrCvYUUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by IA1PR11MB6323.namprd11.prod.outlook.com (2603:10b6:208:389::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Fri, 27 Feb
 2026 14:03:32 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::68b9:ea3c:8166:3cc4]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::68b9:ea3c:8166:3cc4%4]) with mapi id 15.20.9632.017; Fri, 27 Feb 2026
 14:03:32 +0000
Message-ID: <b3fd7596-7d0c-4e03-b8d7-4303616a6374@intel.com>
Date: Fri, 27 Feb 2026 19:33:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND] drm/i915/hdmi: Poll for 200 msec for
 TMDS_Scrambler_Status
To: Jerome Tollet <jerome.tollet@gmail.com>, <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, <ville.syrjala@linux.intel.com>
References: <20260113143107.1446909-1-ankit.k.nautiyal@intel.com>
 <Z1MfXyv5_ORAVj3z@intel.com> <73e0de50-b7e3-4315-ab81-0a3ecebc2363@intel.com>
 <20260227131638.33167-1-jerome.tollet@gmail.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20260227131638.33167-1-jerome.tollet@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0052.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::13) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|IA1PR11MB6323:EE_
X-MS-Office365-Filtering-Correlation-Id: 634f2a73-c786-4d72-c330-08de7608fd7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: TtzsXoalkz54uyfxtz4ZQWcBYxzfAyq66KW1ahejbfIYRp9XgJN8wBI6Xtt6zJphl5kQeCouf/Bd+YoWE+l1MoIJLCWrJ4aeznsusjodLHbPZ8sufTAb00KX80lkHmv8gk4HaCnN94ePPmsmducETJWSb8tgX91Ez50sFBt7eJSyjXQUp/YeD6laPCfCzF3pv2xb8C8FlH+xEUua+eV+kXAKS2gqGFp5SQAPzUPS4bFZ+phz5gqL1XG36+NaR6Mawg+wBNgcdXEq3wjB1g6oz3Y1jfDPbqyJJ3Mc8iZBZYeSAGe0WU1q6MbzgHCa3WVa2t6pcrq9qkqVnrjGiCff6Qr+FSttk2zhB+2NJ2QBLjArkQHp4YUaLnPG19n7jJ3TdQqJrgfzejMADnGlpsYPph41OU0RKMLBvA38sC7IAN63B3nwcmCu0AtpkicQJ1WCsza3jd31RcnFWfA3BRc1V38YKXZL8YhI0pHVABzAhC8/yovsu2odZKsqmp2rXAs8nkZNoo6/9a4fmLS4LEwHdZuLr2rBxe6l4Y8R7YBvWzizcwaofQnwH9+Mygpm+l/261aziDbjHB3Z75TxSITgde1H6DkCdcBn4zvTAPyexB8m4ABrtkbThovNWsIvqImppSlC8Vpy6m4+3Gln7Q2P3Hju++UqBn+4SX1ahxDa/Ob2LJfOB0VECoKbZYuCocgm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzZodkUwQldJTFY4aERkak1oVTYrZTlQMVMraFF1R0FTNHZmMGJFQWp0RHlk?=
 =?utf-8?B?RFovZi9WUmQyVGJja0RFTnJMOHJsNytGcGp1V1RnclBTUXFUcUpjcWpDQWt4?=
 =?utf-8?B?WHhRNjBPYVRDOGttNjc4VnZRWmhCVFRGZ0xLYmdOVkJZTnpQQWVkZjE0R0E3?=
 =?utf-8?B?c29wU3diV0Y1bGJVOVEzRTJ6MVU5akFyRUNQYmNsL1R4dzAwNEU1eFE3Titu?=
 =?utf-8?B?d0I0a3JsQXVCb3gvSFZ4UFU2Q3JiSHF0RzdpNXBQTTdjL083cjNrbkRJSTVW?=
 =?utf-8?B?R3hwa0ppeTdlelNxOFFLOXE2TDl5VnlFNW9RMmVHcHRNbnhjN0NFUElLNTBK?=
 =?utf-8?B?VDg2a2FvdWhiQjAxWHdtb2RhckJRS1VRc21oOU9idFNlUjZyalZkSDBIZzJw?=
 =?utf-8?B?VzFtTkh4UDdpNmMrSTNQbFJTYlBQK29JblBIMVZWRHVsbG1sWmZ5L3laNzlm?=
 =?utf-8?B?aWJma0YyRGRzR1VWaCtWSldTOHpYVWhPNjd6Y05Tekd4dDIyb2o1QjFMOTBp?=
 =?utf-8?B?c3pjbUVYVVVRakplT3Zpemg1NVVtTVJlUUQycUI3RFJLZS9rUTNBRXlMdEwy?=
 =?utf-8?B?U0tTRmtXVUxub1lkdWY0aEtwaUZWbnNyU2RtQXFSMWJ6OFVaelRCVFBYcEkx?=
 =?utf-8?B?dmNrU3R2anZ4RGRZSXhJcVFGZlRza3NkMDkycVFSclZNL3JteEkzem9UTWox?=
 =?utf-8?B?aUM2QzNMMjZoS1JvQjkxNHcxeThDZUNxdUlUOWFxRW1NWUVVVjkvV0pveHpJ?=
 =?utf-8?B?ZncrSnRaS2I0cHlUTGs5dE1yMHVWUlJmVWUvUE93QTJSTkw5UXhJUGEwVWFM?=
 =?utf-8?B?RWFMdDBwS01BbHNkV3FOcGRndGgyQnNOVzQrSDJDWURuU01PcTdMVEYvRjND?=
 =?utf-8?B?QjlKNTlmRUl5UXM0VUpVSzJrT3p4MlhNbVBTeXl3S1QvNTdSb0NBejJPYzRR?=
 =?utf-8?B?b1NTQytZQlFBbit0U2RoNndSTUFQMHlYYk9LQ3VpWjR6dnZOdDZ2UHgxMHM1?=
 =?utf-8?B?UWFZanovclYyUEJJdVVKNzlNWkhub3lhTmdSVS9idFZiSXhwcysrZkRtWCts?=
 =?utf-8?B?ZW9XSGJ3S0V6Ykx0NE51T245UWljQnNUMlRDZGw0RVR3QmtIM3RSc0VkckVK?=
 =?utf-8?B?bWZXdldFejJOaERDd3FlWXk0eHRKSjUyV2l1dTJlWDMyVG0xZTNlODlyT0ZO?=
 =?utf-8?B?eG5oZENFM1pSdjA3NzQ2YlkwVUZUdTFjTG5zVkFTMm0valU4ckJna2N1OWpn?=
 =?utf-8?B?YWlkdk5JdXM0WUlGMUVlditJTXBrODZ3K2lZOTZ0aGFQSEZGZWQzTUpYaWV0?=
 =?utf-8?B?VWFUOFVZZlJuZ2htREw2R09VWWNGdFd6OGlLZ1pob2RSYStSdUJCTTN6Y2Fn?=
 =?utf-8?B?SnBFbStra3RKZ0tOWW9QeFdyS3FESCsrbDIzb2lPTlk2bjYyS0w4R3ZhV2k1?=
 =?utf-8?B?Z1M2WFQyQzJOa0FHUnBCU1RqUkdDK2hsWk1nbFR2ZWNkRFY3L2Z0b1NFUzBJ?=
 =?utf-8?B?S0gyd1NnQjdLb3N1dU9uQW10azFnWWVxcXJoQUlJZk90U1Y2V2pOL2pKVVA3?=
 =?utf-8?B?TGdveU5pRjViRDUvNFZMRGlsVDNDaWZCZlZwT0Y1dzVGRXVXZ3BRbFdVcFVh?=
 =?utf-8?B?VFBRS25aeHowN28zZFk0M3VVMjJXQUsvTkx1d25sdXVLZ0V3aTFSSlpjOVlR?=
 =?utf-8?B?UXBPMVB3QmZqekx5SFpkSWRHZ1ZDYUlQdlR1SDREVVdrRS9nZGowUkxuSU1q?=
 =?utf-8?B?QkxQclp1Y1hpRGdOYzFZbCtKQ05IcjdaOWk2Rnd1SGpUTlN4U0kwMGFZTkxa?=
 =?utf-8?B?TzN1UkVOMzF5ZUQ1TkFORXowUXIyMG0wYjVWQU03dVhQL3Z5eUZnVnN3SjU2?=
 =?utf-8?B?MmkzR2k3VC9JYXA4N1JpMml6OEF1U0FpNlNmb0FVNk9nNldqaXpZbHRmSXJl?=
 =?utf-8?B?RExZdFNpcFg1TDhQYVFaeGQ5Vm5oZWd1M0x1TDFUTEE0eXNlK0JWTk5vbU53?=
 =?utf-8?B?anBqd2gzcDZCUDNXSk5xNFF1YkRYb3p0UEhQQ0hlM1Q3QlhZNjdqbWVRMzg3?=
 =?utf-8?B?enJlcm5DdGpzVkdzMHFSSWNRemcxS2RSWDZhVE1zSVA0SU1KT2hSOWRtdEpD?=
 =?utf-8?B?aCtqTUxKbDRsZXUwcHBvZTBFaTlDcXlDZGpUN012ejRqT1JKS2NHQS9GK3FG?=
 =?utf-8?B?ZHJZa3FlQ2ZoUThmaEVRVFdlR0c5VmFPNGswM1N2cTNDWGx6ZnlzNWZMclNM?=
 =?utf-8?B?Zy9iRGRMcFpCdDZ1NHFrOGs4T1JIMVRXenJXdlFwRjlLcnlIOExSMEdKVjRv?=
 =?utf-8?B?NUNRNVVNNTdSNWgwNHVWdjBxRXBEWGtnb3Y4V3BsMGdLM05ZdHNXZlNDeHdG?=
 =?utf-8?Q?lPO4U0aQyHiaw6Yk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 634f2a73-c786-4d72-c330-08de7608fd7d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 14:03:32.1330 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6v63XJ9QSIUigm1Q+LYNPACGLUcU4VZAc9/4gdKdYWqS3naTeglvkBpIyWDOwIZquYfzhM9Tf1VhooLHYTpOiMELT+ZEnHtt+Y+WV0jDTnw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6323
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
	FREEMAIL_TO(0.00)[gmail.com,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,60hz:email,intel.com:mid,intel.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ankit.k.nautiyal@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 1C3851B84A2
X-Rspamd-Action: no action


On 2/27/2026 6:46 PM, Jerome Tollet wrote:
> Hi Ankit, Ville,
>
> Gentle ping on this patch series. As confirmed in my previous testing
> (Feb 21), the SCDC polling patch works perfectly on kernel 6.19.2 with
> my Alder Lake-N (N100) + Cisco Desk Pro (CS-DESKPRO-2) setup.

As mentioned in [1], to me polling for TMDS scramble status makes sense.

Perhaps the best way would have been to work with `SCDC Read Request` 
implemented, where in the sink notifies the source to check the SCDC 
status flags, where we have bit for Scrambling_Status.

However we do not have that support. Also not all panels support this.


Since I have also contributed to the patch, I cannot review the change here.


Ville, do you think this change makes sense?


PS: I was trying my hands on SCDC RR sometime back but didnt go through. [2]


[1] 
https://lore.kernel.org/intel-xe/73e0de50-b7e3-4315-ab81-0a3ecebc2363@intel.com/

[2] https://patchwork.freedesktop.org/series/101191/


Regards,

Ankit




>
> The isolated testing showed that the SCDC polling approach alone
> resolves the 4K@60Hz HDMI issue, which aligns with both the HDMI 2.0
> spec requirements and Windows driver behavior.
>
> Is there anything else needed from my side to help move this forward?
>
> Thanks,
> Jerome
