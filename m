Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oM1vBNHdoGklnwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 00:57:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 612951B112F
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 00:57:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBFD010E0CF;
	Thu, 26 Feb 2026 23:57:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BU3Kh7x/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BCE010E0CF
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 23:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772150220; x=1803686220;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=hrqkZaVDj0TY4zpJJGQRLKOda5JLBFvk1TY0Arw/fQw=;
 b=BU3Kh7x/I1KfniWGJTg8zes7ScDZZwAo/R8GL+2u/uWvSSo9JTeroyIF
 /+qICktMyKx6qvNQrnNO9ad25t9CngaFf/sV6aJKZajMyQ3y/qyQAuXgH
 N6FTc/6Qh0IcyslD6xxj9MSbBJGmNBoB/3FnxoDj9g9OfFQPvpK93AbVd
 pH8o1tGzNolPf8OEs+ldKL8x9hhL6VLIEeQwX24UgrsVqgvFrJZnOHo3u
 6zbDjiFvFXVoeKxcvgsetzLgsKx15tY1JBKfl100MIWwpTJtrntYChNwB
 V0O48LGX0Wc6OtxZ4L7aRk3Rxj+kkFDOfgmiglOTeT2FpLsun+qbFLHdU Q==;
X-CSE-ConnectionGUID: uP0W4PcGST2e1/yrsfU7ZA==
X-CSE-MsgGUID: pIJdMrUoTTGjSKzfBF07Vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73101466"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="73101466"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 15:56:59 -0800
X-CSE-ConnectionGUID: +Q1pGZ7QRJu1r0HS+iJ3QQ==
X-CSE-MsgGUID: Oc0RY/PMQIip4e+1wFDmcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="214937207"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 15:56:58 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 15:56:58 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Feb 2026 15:56:58 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.51)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 15:56:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U83u9ipuikUz4BuHajvcwHzOGwUYoiuQ+ijsA4hhTaEBZsJeo+m2nIkQC0bCnmZd8VRfOchkjJ2gwuHdVYDPonc1cQB59TirQrZc18a5enf2bm4704ykGpg8jNaXpe5XAiQ64SEvINCQhH88DoW12gc0CIIBKz2ayl+948KNVoZHWQLdROZ3cvzrv42HfkRCyYchUc+auv2Bnq8fHF0UJmrFTZ5zM66SeKwBzvGFFBTii1sx85l+F27VD3cpbg8GHOJg8riJl/YN1ShEbCunUhCTOKwyALmqMzJNyJPaXICMsPeMLPV0DvzbH3mIxzjHT1Sqf3LXa6JQcB0KBv6oOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+zT2sz5V7BLIFU/kdG9sPYwMR2vAUeYaNkCndhcc/Oo=;
 b=EQRtmmYbLgiye0AiSlhM27K/eOYSI8QGq8TAlW2+Oa4VJyTyzmxb0VAmh+dZHDHRHbbnOc/xN9jp8l+bU/MIYcIv48mty45vgOSbCvhaxuzVDyeo7auo5CXYE7B4xeLxASeHoD7rKPgr5M+fuNJRkprRiQB4BF+LUksW25xp6t2w6ScuIXA0eg4rIG5jJ+G6X9k+/x2WZrcn/bQSckhO9Ve1qWkXOYw7M06CWwUSuRro4cYdkitI8kQvZ0SajMErqgayoSQfOF4JeyZPxH0nyap1KUcyYXjyUoekh2ScrEnLyOFW7FA7KjchR7kkrSSBsay9B1kXCvF8yAe19mC/5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB8224.namprd11.prod.outlook.com (2603:10b6:208:44f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.19; Thu, 26 Feb
 2026 23:56:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9654.013; Thu, 26 Feb 2026
 23:56:53 +0000
Date: Thu, 26 Feb 2026 15:56:51 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Yicong Hui <yiconghui@gmail.com>
CC: <christian.koenig@amd.com>, <michel.daenzer@mailbox.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <skhan@linuxfoundation.org>, <david.hunter.linux@gmail.com>
Subject: Re: [RFC PATCH v3 0/3] Querying errors from drm_syncobj
Message-ID: <aaDdw7Squ1z/kCuU@lstrano-desk.jf.intel.com>
References: <20260225124609.968505-1-yiconghui@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260225124609.968505-1-yiconghui@gmail.com>
X-ClientProxiedBy: SJ0PR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB8224:EE_
X-MS-Office365-Filtering-Correlation-Id: 47f87516-6ad5-4b1b-86cb-08de7592b73c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: nGlVNuaTRrDogRrA8pZYqzVnwSIt45SldAchriWc8tfOLS7JNv3YqrJA6Ps0xOicAn43qNYBNok0KY4I7Q8znHznOsyigytK/BMQRNBa4PL9xWJUARuYnFP4jjRiJAe2D2X7DlA+EtMVi+Bc/mOYdZzoBrKUuFsy5fjfqYtTsBBppt8n0uKBCVba7nhKZS5RiOvMELD4VcrmvKOLGO7j9VzKGFUWzM69q0cdSYLwU8r/44MU81Q2EpZvFss30KG2vH2jXwv4lUi7deOzqh2Du8LfFExc+s8G9pDPzp6FAKaU5pMidrS0m1eC/9JTiC9MCUdRY0wwy0TvSryMKbS6bhcqD3hB6yCULqXbH7XrA+fO0EvJjgF8FwShq+huriFsWoyPrIN6Fb6eG/Gwl+wf3/RI/tlekk8nU7MLRADtoQc1oInqsNfk52MvDc4W43K9OgQyTwssVuTnIn+gxqNB2UThEzyDS4FbHxq6QUTeHWUPCR5BYqgVS1FIEAZQ/WKTCwVdAhs7M/JBZ3FrdRAja9eE0/o1Ve6ktnUCch/fH/cgjM/rK78WhR8T7ZfEEhg04/mfLz07HnEU2c4qyc10B1YqSLpHP+06tE/znWu1AmbQF3ekpEQpWHfUUVOJbIht6+wTE6F61XQUNVQs4my5paif771gQPQmnnQvtsZATmUupqI0d4cly7YBabWWtpLM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d01udlVHSHU3VEV5K2dQNWhsMzBYdnJZYlBJVUgvUnhEOW9Sb1puZjEra0Mx?=
 =?utf-8?B?bmszajlNdFFFL1hkeWtESCtWWDJqT0tzb2hmZ2VvNzlHSHV3YXFMY0NZd2U2?=
 =?utf-8?B?Tkg0c1JuWUwrVEsrd2plcFQrZE0rOEcvZ1FyWE4xNit0US9nMCtUTVN3dEhT?=
 =?utf-8?B?Ni83Wnl1TEh0MjdJbEZxVUE0MWcwUGZGM3IySkNvRkF5VXlQN01DOXJjeUJa?=
 =?utf-8?B?VjhlQkYwTGx5NGFKcmcxeWVkSXlTLy9OVVdNckNMRUw4WkJKVk9UQXNuRzMr?=
 =?utf-8?B?dVVGZkpHNDNYYlNLcyswY3lPQnh1Nnl2a1VXS3ZucHJYNTY2ZlpzUjFlY1pE?=
 =?utf-8?B?OU1WbE42QmxMY1hMQjNqZEp0enBmZkRrK0xTZmdUSTFUQ2M0U0pwS3UzMUxU?=
 =?utf-8?B?Vy9vOUlZTGtCdGJ5WDRKTTJkdXJKQlRuTXZ5NEVESXhDeEhDZXNFMmM4V3Rx?=
 =?utf-8?B?U3M4TlF6ejkwMFZiZkRQek1STE1WeHR1S1BIam1iT2hTN3UybldXd3ZuWU9i?=
 =?utf-8?B?SEIxQ05TczFaUGo2SGFGdlhuUVNiWlpMc2t3aDE1ZzhPbktDclY3VS84OVE2?=
 =?utf-8?B?UGhaR1V1elYzUTk5d0NNemVaN1JodmhzZ2JwOXJkQ0NOWGEzTkFhYnhNRTho?=
 =?utf-8?B?VDlCaVB6NlNNalhaNTRZTjhvREt5ZVVML0NRMm1wbUMrTmRYc2hHRmhsdnkz?=
 =?utf-8?B?ZHZJWmgrSnh6ZmF1dlBFNnFKcksxYXVTam9HSnRadjdwM2FtNHQzVnlKckpI?=
 =?utf-8?B?RURSdWpiOWdVYk9nQTFNRThsNnVFMEpHV0hZVXJiUTZEc0NzSlVSai91ZGN3?=
 =?utf-8?B?UW12UXNlQkhoOEJMclFHcE82dDV1WU1uYUNVKzR1TkdIY2dFWGYraXRVblRs?=
 =?utf-8?B?VVZhOU12SHowcGQrV1NjdDJVSndnWnNKZHl5VkdFZDVkeThoS212eWFmYWdZ?=
 =?utf-8?B?QkhYNUY5bmN4Wk9sYkFLcjgreEpOYmpWNktERFJGVUltMzc0bHd3U3pNWHkx?=
 =?utf-8?B?c1F0RnRNL3k4cWlIc01tb1dub0t4N1EwdGZlYmJFVXJibW9qaVVOU2hoQndP?=
 =?utf-8?B?dzdBYTk4VVdqRGUxc1lLa1NlTEdsVC8zZ1JlcFIxZjhkbkY4MVJ3U2JJNEFG?=
 =?utf-8?B?a1dtRzRiZDBWYUMwV2JKQzY3QlMrcDl4NmticEVvZGozdTNSeU5NZy96RTJR?=
 =?utf-8?B?ZVI1eURSbUFrQkhpQlRkTHdSU05NVUNBWlFjQzZ6L2xBNGplOXYwckhiUWxn?=
 =?utf-8?B?emhiaDd1NUs5d1lCYi9JNFZqZ1ZjanRidThRdnNpZGJCQ2oxNFA3ZHVlKytv?=
 =?utf-8?B?SzdxbkI0R2N5Qk9jaXI1Ymh4a1dXbDB0ZGE1ZzVkaXdvWE9DRHdFR1U2OXB1?=
 =?utf-8?B?S2Z5QnJsQ1ZqdVZoRW16eGxQV3VtNlV0dStPNUZMUjM3Z3NPWHM3bGFZM2pE?=
 =?utf-8?B?OGRMSkM4VWlwK0hwdHdTYkhCQVJDanJjRHlOVE9kTHhMTnc3dTJtS2lleDhH?=
 =?utf-8?B?VU5tVUs4ejVVckN6dVdLUWUyTVp0RGNlZkVXK1VhRUdaZTdvOTF6eDVzdlpu?=
 =?utf-8?B?YXdqK0NkOEhUSFpxZkMvOWp4aktLdDdKSkF2ZkJXY2xUT0ZOZGYvZ3F1SWhQ?=
 =?utf-8?B?YjhZNWZkNkNBSUl0eEN3WEI4Vm94NW9MNFJyT3FYNThpRmdEMWp6Vlk2YjFZ?=
 =?utf-8?B?RFJVazRkc1pYTXZVU2lEZ1ZXNC91SStHZFF0RzlDMHFIR3dNL2VaTmdmTmp1?=
 =?utf-8?B?MTBqRGtqUHFUV0VNQVl5SkZSTitDTVM4THE4NWRtQmFadXhaT293VXdWcEF2?=
 =?utf-8?B?YVd0RmZWWDNpYnVwdms2c2lFYjZtTkRNVjRvOHJ3c2tjSkgwQjF2ZFcxVWli?=
 =?utf-8?B?VFdQeFlTQUxnWE9LV0UxTVM4VmlkZlZxL0w0K1NlOHhGMnVwd1VhK3BRTTlq?=
 =?utf-8?B?QmhQWG5DWmZKeExseHA3b0xSZmlmU29vdi8zRnBKOFJyMGpkWmdVblZnTmY3?=
 =?utf-8?B?VDMzWFAzVXZQVFhlbjgrQVd6T3dBeG9aT3o3djBlaHZQNzZQeld2T2pqUUlO?=
 =?utf-8?B?ckcvdnQ4SmF6YzAva1FnWGdjYVVyOHJkRWVlNnBWTjVpWEtDdVdMaHJpUHZo?=
 =?utf-8?B?eVVIUGRRd3FUd0FHQUs1QmJ5V1djM21rVXN4R3YwOFpPbGRWdkV6Rm5Iakdx?=
 =?utf-8?B?YTJVbHptenZGcVRZKzVGWmdqQ1RlNGZIdGZuK1RCczNDS1VnRlRYeDNVdlZu?=
 =?utf-8?B?SkhnL1ZDeGJCQVBLQnpRdGkvekFxa2R5dTlCNnRNbnZuMTI0cXZNTFJOZHBB?=
 =?utf-8?B?UFVUT3BKZWFVS0hIeHhmMDRHcjVUYi9TckZIbWhTWUtYbkkrM056YnpYeUV4?=
 =?utf-8?Q?1Qmiqrb3n6ZuSA6o=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 47f87516-6ad5-4b1b-86cb-08de7592b73c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 23:56:53.4624 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YiGqHGefFQP4eVLV2+RhsWuUOpG7362OwtUWAYD+Rvg9xA4V+5/MToAjaYfAY1wnNQJ3b2vgcaLESUYd/s7KCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8224
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
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:yiconghui@gmail.com,m:christian.koenig@amd.com,m:michel.daenzer@mailbox.org,m:linux-kernel@vger.kernel.org,m:skhan@linuxfoundation.org,m:david.hunter.linux@gmail.com,m:davidhunterlinux@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[amd.com,mailbox.org,lists.freedesktop.org,vger.kernel.org,linuxfoundation.org,gmail.com];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lstrano-desk.jf.intel.com:mid,gnome.org:url,intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.995];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 612951B112F
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 12:46:06PM +0000, Yicong Hui wrote:

I thought it was a very intentional choice that fences are a completion
mechanism only—they are not a mechanism to report or propagate errors.

This series seems to change that way of thinking—why?

Also consider these cases:

- An input dependency to a job has an error in its fence, and the output
of the job is installed in a syncobj. The job successfully runs but
produces garbage because of the bad input. The job’s fence will not
indicate an error because we don’t propagate input dependency errors to
the job. This makes DRM_SYNCOBJ_QUERY_FLAGS_ERROR seem a bit pointless
now.

- A driver, for whatever reason, sets fence->error, and this fence is
installed in a syncobj. Now user space starts using this new uAPI on
syncobjs and everything breaks. This is odd behavior from the driver,
but it was completely valid because fence->error never propagated to
user space.

I could probably come up with more examples of potential issues, but
let’s start with the above.

Matt

> This patch series adds 2 new flags, DRM_SYNCOBJ_QUERY_FLAGS_ERROR and
> DRM_SYNCOBJ_WAIT_FLAGS_ABORT_ON_ERROR for 3 ioctl operations
> DRM_IOCTL_SYNCOBJ_QUERY, DRM_IOCTL_SYNCOBJ_WAIT and
> DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT to allow them to batch-request error
> codes from multiple syncobjs and abort early upon error of any of them.
> 
> Based on discussions from Michel Dänzer and Christian König, and a
> starter task from the DRM todo documentation.
> 
> See https://gitlab.gnome.org/GNOME/mutter/-/issues/4624 for discussions
> on userspace implementation.
> 
> I have looked into adding sub test cases into syncobj_wait.c and
> syncobj_timeline.c, igt-tests for this and I think I understand the 
> process for writing tests and submitting them, however, these ioctls 
> only trigger in the case that there is an error, but I am not sure what
> is the best way to artifically trigger an error from userspace in order
> to test that these ioctl flags work. What's the recommended way to 
> approach this?
> 
> ---
> Changes:
> v3:
> * Fixed inline comments by converting to multi-line comments in
> accordance to kernel style guidelines.
> * No longer using a separate superfluous function to walk the fence
> chain, and instead queries the last signaled fence in in the chain for
> its error code
> * Fixed types for error and handles array.
> * Used dma_fence_get_status to query error instead of getting it
> directly.
> 
> v2:
> https://lore.kernel.org/dri-devel/20260220022631.2205037-1-yiconghui@gmail.com/T/#m6ab4f94a19c769193895d7728383f84e452cbbfa
> * Went from adding a new ioctl to implementing flags for existing
> ones.
> 
> v1:
> * https://lore.kernel.org/all/20260213120836.81283-1-yiconghui@gmail.com/T/#mfdbc7f97e91ca5731b51b69c8cf8173cb0b2fb3e
> 
> Yicong Hui (3):
>   drm/syncobj: Add flag DRM_SYNCOBJ_QUERY_FLAGS_ERROR to query errors
>   drm/syncobj: Add DRM_SYNCOBJ_WAIT_FLAGS_ABORT_ON_ERROR ioctl flag
>   drm/syncobj/doc: Remove starter task from todo list
> 
>  Documentation/gpu/todo.rst    | 16 ------------
>  drivers/gpu/drm/drm_syncobj.c | 49 ++++++++++++++++++++++++++++++-----
>  include/uapi/drm/drm.h        | 11 ++++++++
>  3 files changed, 54 insertions(+), 22 deletions(-)
> 
> -- 
> 2.53.0
> 
