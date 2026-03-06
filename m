Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DeMKIWiqml6UwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 10:46:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F038521E2DA
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 10:46:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6F6010ECC1;
	Fri,  6 Mar 2026 09:46:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GzFdjNOk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1DC310ECBD;
 Fri,  6 Mar 2026 09:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772790398; x=1804326398;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=S9ilzai+1nUVh6XmPytMlAndMcPB8qU2Ybh5+dR+UI8=;
 b=GzFdjNOkSVAuo1nRRVF6JVyXbDRQXJqzRIO/QItPyW5N7Z8EVozO4IbU
 oTJCGzVThn+skIEbR3b8Y3TPiSxKvmHcht0nr06fn1TpCaeWHjUjBJ1BT
 KXig8Yzckg3fn0UDpodzOow/BICcS655WZZr9u9Izt1es4izHRVryJDwU
 JeKFFqU5hPrt0GaSr08F88Y3/GcOO24xYe3+JS3VfpGNcTz2MKPpRPQdS
 gqMkPmKgQocVc6DJYEreQMkvpQxWLdLczeXXFTLGwc3fmUkRr1RCeh5w/
 aCK4odvIRcqYMWfGbI8Z3ru1LaZxvcnL+vMIHPYdWGtmBnDmIPtMIvAWB Q==;
X-CSE-ConnectionGUID: KjcGvzgOSIaMft0SQLrrLQ==
X-CSE-MsgGUID: PG7SlUxDQKeZKnKbuBP1Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73596807"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="73596807"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 01:46:36 -0800
X-CSE-ConnectionGUID: /u9ZmWZ4SaKkV0PEtcK14A==
X-CSE-MsgGUID: Jb9P712AQYKoAkstC8tAeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="218955056"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 01:46:35 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 6 Mar 2026 01:46:34 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 6 Mar 2026 01:46:34 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.18) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 6 Mar 2026 01:46:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S0MduhyGvLVQrftZVH0woa2DpUZ43nFfhJZs4o+ax6CSWFIxClBYZ7J0Pf4Fi8wO5GPGrP0Db8zsqSkl5r9THl6HUOaUKPZe/WdoP2rHEvb30vF/lq2Hmp5s4raS6SLW7L/jTVdTelkdVIS3pe+4vSQ/OV6eyk/q8uC9OhZjXP0YkBv5k99JMNBttxdSzBua8vbl+1FodRzOOm7XbIfcOBY5Hk/PhC7s9AHRSytLMLw2A4OQ+mtA5KAUzEp/G5+OdyBhE1xPNSMuBHb5Oqfsm0O4bJdo3GFAnLhAiOEua+Fkwx+7SXI2t4336q8Nk3bdPYDjOGmfBJxwF6M7qDDIug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5D0SmLwn1KtkAT1xzYnhjEWomPjvo8E+rMi3isuhiYk=;
 b=APqeCUUYiNsbt+0ZDOTTdnbmoOhaLigpG09OLkN8rbgZELqL4bDLYko7Wt9EqfFnZlPBnznURfskGqSg39AAjN/NbUeKw+vKBHrO7+J3FKVXWkPN4q1n6fQkeBRrGrrLQrrgbv6/jBTyihs/VRNZtXl0rtdrOU27N0nKoRGLN3SdJa/028hIYc+IvOFEsn5MAB9h9LT1u/+hYNnyOPOepkJx6f5bbFR7WgGP4t5w/J7IRN/dhDqznfmt2O1t9MIiX6v6fA8S0BbewUcVC0o/sUBDmStWYrz7FHxpN/XY0qtx93/pREUqsUypv5DQv0PU+MBqMoe21et5WT0iCfK5QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by BL1PR11MB5954.namprd11.prod.outlook.com (2603:10b6:208:385::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 09:46:31 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::9ca5:4d1d:db45:f523]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::9ca5:4d1d:db45:f523%5]) with mapi id 15.20.9654.015; Fri, 6 Mar 2026
 09:46:31 +0000
Date: Fri, 6 Mar 2026 11:46:23 +0200
From: Imre Deak <imre.deak@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>
CC: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, <dri-devel@lists.freedesktop.org>, 
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH RFC 0/4] DP: Read LTTPR caps followed by DPRX caps
Message-ID: <aaqibzXw-QK4mrHR@ideak-desk.lan>
References: <20260305-dp_aux-v1-0-54ee0b5f5158@intel.com>
 <aamrRxXwBxzt6s4F@ideak-desk.lan>
 <8e862ee8-34e2-4330-a9ae-e5b97ef3beae@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8e862ee8-34e2-4330-a9ae-e5b97ef3beae@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
X-ClientProxiedBy: GVX0EPF0005F732.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::2cb) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|BL1PR11MB5954:EE_
X-MS-Office365-Filtering-Correlation-Id: efb36688-8a75-4b4d-3f95-08de7b653f01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: RjzLmf6SIz9U9Ki1TFlKwFAkHzwYAz69u1Ufup0c8j6HjzIlYLsui2c6EpTaUL4mRCrkDMj9cPE0+uWXXkg7P6Hv6G5xUzBdjwHue31Ng6del4+NktRfHV2fW3wE3rJmvYu0kU7jP8yWLfCMgZVeh+3y5O3x2AOy2hBiK+6nPriJveIHqeLcFhNvwXdBZ0b69qJ8LCRRXLul2L3cmcuLliegGnHMTsE42WjAKIBSCBf3XftcVxlxdlJyJ3ePwsarAOBG/AeRIlsTOTZAW4ubuMGu44L23LgZLoAOubWsF5yK29SXmh4LY6lrYkTy0njA+xgMWh0gEnD9az6VjoljFTfcfUMI4siNzkEStBFWL2MARR0FWRgLRVafmCkHfJo9ugxf4aTKu+v0bN8HiZFAp89ZV2gXUV5vi4bdmU0gsCMwd6FiJrldEDxThkAsGArLXOt5uJhqHOyh2fkHL4GdOHanVNZSScoMdar2xqx50Q2MtQrIRf5s2G43vDCntO0U62ViNtN4Kj9vaiJKR+609iNFVKJiYTPiAAswppN72FJduIpSZDMJ8RVLiOx/2D4WcZDIjRGr0OLw2oXtRdfvpQdVotpiu8uRXPgqDLrBrBa6dP+q5lf9iw0D/MxcTeCsIEafsV4VB6tpEy2HDk9D0qyjsX5C5ce0NNk6BW6wAM4mWz2qThtnNHhH7g0AjaKR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qjlid1BwVFoycHpudlVMK0FseDBFNnJsdVF0WE5nVUwxN2Z6aHJ5Q3VYdFcy?=
 =?utf-8?B?MFQ3UFJ6Zi84Y0hNeUFabnNIaFg3QjE1QUNrcFJHQkRDTDcyQWlmMC9tZTBP?=
 =?utf-8?B?VmFWZy9nMlhORmE4bmJrKzRqWnFSby9mTlhnVUVhc0NnOUZaWWQ3dnlMSnls?=
 =?utf-8?B?ZE8rcUM0OEQ1cUd1OGNCY3hBanZ6QzNxUTVNQXlqS213VlcvdEFubWhCN2dO?=
 =?utf-8?B?Yjg5d0V1WUlNYkhYOHVoNnhSekF5M1VRSk93RHZEYk5hWnB4ZWFSNlNMKzRt?=
 =?utf-8?B?RFdxbXlyQWhkWjNzbGQ1a3l0VWVSaUw2Y2ZuK1NqSEROVDEzM2ptbzUyZ3pE?=
 =?utf-8?B?R3pqWGFKOWp1ajk5USt6YU5sSlhZQlNRRW5YTytNYWZ5RHNWOWljaEhSa3hQ?=
 =?utf-8?B?MmJ1V2M4dEY3Rnp3c0cvUldSRDVMWk5iSEdma2UyQ3orSWszcEZSSHlmZkNP?=
 =?utf-8?B?eWpZc3phai9BY1JlWjVaSkc4a3ViVEFPbWRXMDN4RU8wVkFKb2tJY2RsVGJ0?=
 =?utf-8?B?SFlKcGdzRy8wa0p5OHFjQkQ5MDREbllRTFdPbUdZTlB5aXh2OFZQU3lybUxk?=
 =?utf-8?B?MDE5czJxQXcxaTRWWGpXS2lHdEpyL2lzVElrWmdsUTA3bWV0c0ZVU1R6VGZD?=
 =?utf-8?B?Y0dYMy9pYWVuVmRuSnNNQ3NnQmRaQU9hYkpWeVhhUGV5NWtHTi9HTC8yOTFB?=
 =?utf-8?B?TnZubkxkeXZVZ0lsOUdCalM1K2pjM2V2R2MwR1ZMNUZJTDBEckVla1gyVng1?=
 =?utf-8?B?bVEyekdSUWZ1YTY3c2dZVEZtV3RkOXlwdFlXaEFYOTAxUENJRGQxSVhRV0Q1?=
 =?utf-8?B?MkNtSktYQWpQbjJJOTkzVFhrRjNiSTZ4RUVGUENjbmcrUEdwTlpidnQ5aFhj?=
 =?utf-8?B?SndNYnJMeEZNQURuNzVhM1lCcnpHQ1ExdG9TWHBQaWFtUFZhWmFWVkxoNDVX?=
 =?utf-8?B?QUcvMm1vWCsrYk80cWhRU3kvMG9uOEg5RVgxeEN3UTZ3TCtqaFNBU3NpWGZx?=
 =?utf-8?B?KzVLT2o3RWpyRnBZdytWUHcrQjcyVnYvUEFreG9MMmpoVStURU50cGlpUE05?=
 =?utf-8?B?cjFiUlpiL2N2OFFCcTkzb0tyRFVReDlLLzIyT2R6RUdyek44Mm9KSnpsZEpV?=
 =?utf-8?B?ZjBQc0t2bW9JZkJmTVRMczRIWklIMW1pZjRTamlkZjNkclY1R2FPbWJ5TmpY?=
 =?utf-8?B?WnhmMDRBZEl1SHJsWkVDM1hRMTd3Y25Vclo3OVhLU1hmYWxESXFSSjJzL3lx?=
 =?utf-8?B?NmIwVUJBUHNLZVNlSm14Z2pmai9GdkpUdUtoM0JBRkZ2dTZGb21GNkdEYzcz?=
 =?utf-8?B?VE1GUEsyb1RYU1dvVndoS1YyZEhGUU1CQ3AwZU53VUdyQ25OaG1WREpUS0xm?=
 =?utf-8?B?TjU4Yy8xY2JoWkVFNmVzY0NaYzJmSmpNVWl5aEZ3V3V6RHJ6V2M3TmJIdm4z?=
 =?utf-8?B?NWJSRDZISWsrL09UTjZNQXNUL2I4Mkpra1UxRzdRN1YyS2JvL0lsSklqNjNh?=
 =?utf-8?B?MXdHNjJVblY2c2E3L3lsaklMMkw3Y2FGNk84UDhTdjJXVitET2VuMFZNZnlo?=
 =?utf-8?B?T3BSNjhiRHJpbDNRMFVNNnppYVl5WHVlSjlmN0wzWnlXUVg2T1JFU3dlVGFD?=
 =?utf-8?B?WHVXd0xLRnBCbjVwQVNRTVVDMmR2YTFoVFN6SE41cUpEUnVvcWFyaURLQWR1?=
 =?utf-8?B?UGhBSU9LM1pDVG9VSzNlZUgxYnVOYUQxYVRkMjR5QjZrY0ZkY0lzR1V6Y21x?=
 =?utf-8?B?VWpQL3hyRVZnaWNXWTZaSTJmbENjRm9ZNVJxZWpKbmxQY1lyRHA4c0hDTDZk?=
 =?utf-8?B?R3FrNzZHV3orUDMvYmZSdDArcnR1TEJyem5tbmVveHFOaEtwZW5DU3BBZzcv?=
 =?utf-8?B?TDFYUjNZTUJuWVlablFNS0sxdWhWTkZacVJyak5jaGJlZG0zQ0RyUWdBMWZ0?=
 =?utf-8?B?VGkwWnlONUtRL1NnUnlFYnN6a3RoMHcvWmJmY1ZXMUFMcHhMVWVkRmdqQ3I5?=
 =?utf-8?B?U0xIbDZBK2dhZzM5SXBhY2Z4VXU1TCtMUTRXbkFXZEZXcGJuU21GdC9SSXFW?=
 =?utf-8?B?TU5DUWhqVTF2cmxTUDFSWi9HanFHbW5DYVdBaFV4bTdzM29xajJMTHdNamFn?=
 =?utf-8?B?bHp3cEh2WXBRT3pLTmRhUjZMZTQzQVNVV1B6cDV0dmpoWjRuQmF4dWtvU1dm?=
 =?utf-8?B?azFidGNvaFZlMTFoQks1ai9mM3RaR094VStGc1BnOEc5OFN3YncxSkpWUEsy?=
 =?utf-8?B?Sk9uaXFNa25VRDVQdHR6aVRwK0gzamZmSWpseWp4ZzB5cTFPK1pUMlRlVjY2?=
 =?utf-8?B?ZkhVZ2IvVTRpaE9xeVdSdTdQbkRhdCsvTG1mYVVRVVY2Tkl1QTdhUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: efb36688-8a75-4b4d-3f95-08de7b653f01
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 09:46:31.4248 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iQ7uh4eM5X5yDKuHy7et654+8cuu2Tq31/IrQWLY3fUdsL/RDRwhEMtxqHb02oIcPxLXPPijQQ3y5agsW9yRAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5954
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: F038521E2DA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.49 / 15.00];
	R_DKIM_REJECT(1.00)[intel.com:s=Intel];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[intel.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	HAS_REPLYTO(0.00)[imre.deak@intel.com];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imre.deak@intel.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:-];
	NEURAL_HAM(-0.00)[-0.013];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 09:59:10AM +0530, Murthy, Arun R wrote:
> 
> On 05-03-2026 21:41, Imre Deak wrote:
> > On Thu, Mar 05, 2026 at 01:48:10PM +0530, Arun R Murthy wrote:
> > > As per the spec  DP2.1 section 3.6.8.6.1, section 2.12.1,
> > > section 2.12.3 (Link Policy) the LTTPR caps is to be read first
> > > followed by the DPRX capability.
> > Not exactly. The Standard requires reading the DPRX capabilities after
> > the LTTPR caps are read.
>
> I also mean the same, sorry if my wordings were complex.
>
> > The driver does read the DPRX caps after
> > reading the LTTPR caps.
> 
> In intel_dp_link_training.c function intel_dp_init_lttpr_and_dprx_caps()
> 
> int err = intel_dp_read_dprx_caps()
> if (err != 0)
>     return err;
> lttpr_count = intel_dp_init_lttpr()
> 
> Here we are reading dprx caps and then passing this dprx caps to the the
> func intel_dp_init_lttpr(). I think this will be a deviation of the spec.

No, it's not a deviation of the spec, because the spec does not forbid
reading the DPCD_REV or other DPCD registers before reading the LTTPR
capability registers and it cannot really forbid this as I explained.

What the spec requires is reading the DPRX capabilities after the LTTPR
capabilities were read out, which the driver does: after the above lines
there is also:

        /*
         * The DPTX shall read the DPRX caps after LTTPR detection, so re-read
         * it here.
         */
        if (drm_dp_read_dpcd_caps(&intel_dp->aux, intel_dp->dpcd)) ...

> > The DP Standard does not mandate that the first read after a sink is
> > connected (i.e. after the HPD signal of the sink is asserted) must
> > be an LTTPR capability read and cannot be any other DPCD register
> > read. In fact this would be impossible to guarantee, a DPRX
> > capability read - or any DPCD register read for that matter - could
> > happen at any point and so it could happen right after the HPD
> > signal got asserted.
>
> Spec DP2.1 Section 3.6.8.6.1 LTTPR Recognition After HPD is propagated
> from the DPRX to the DPTX, a DP Source device with a DPTX shall read
> specific registers within the DPCD LTTPR Capability and ID Field (DPCD
> F0000h through F0009h; see Section 3.6.5) After LTTPR recognition, a
> DP Source device with a DPTX shall read the DP Sink device with a
> DPRX’s capability by reading the DisplayID or legacy EDID and the
> DPRX’s Receiver Capability field (DPCD 00000h through 000FFh; see
> Table 2-232).

The above does not prohibit reading non-LTTPR DPCD registers before
reading F0000h - F0009h, and it cannot forbid this as explained above.

> > > Git log shows that initially drm dp helper exposed function to read
> > > lttpr caps. Driver reads the lttpr caps and then the dprx caps.
> > > For a particular issue
> > > https://gitlab.freedesktop.org/drm/intel/-/issues/3415
> > > as a workaround reading dprx caps was done first to know if the panel is
> > > < DP1.4 and then read 1 block at a time for lttpr caps.
> > > 
> > > This can be handled in a better way and two such ways is what I see.
> > > 1. Read LTTPR caps followed by DPRX caps as per the spec. Then on
> > > reading dprx caps if revision < 1.4 then re-read the lttpr caps one
> > > block at a time.
> > > 
> > > 2. Read LTTPR caps and if 8b/10b check for correctness of the link rate
> > > supported(lttpr caps 0xf0001), if some corrupted value is read then read
> > > one block at a time.
>
> > The driver does read the DPRX capabilities after reading the LTTPR
> > capabilities. This is what the standard mandates.
>
> Yes but before reading the LTTPR capabilities also DPRX capabilities is
> read. Have added ref to the code snipped above.

This is not forbidden by the specification.

> Please let me know if my understanding is wrong.
>
> > The workaround for issues/3415 depends on the DPCD_REV value, so this is
> > read separately before reading the LTTPR caps. I don't see a better way
> > to implement the workaround and such read is not prohibited by the DP
> > Standard either. So I don't see the point of the changes in this
> > patchset.
> 
> As Jani pointed this can be added as a quirk for that particular panel
> instead of mandating this kind of reading dprx caps first and then reading
> the lttpr caps for all the monitors.

There is already a quirk in the driver - to read out the LTTPR
capabilities 1 byte at a time - and the quirk is applied based on the
DPCD_REV register value of the monitor.

> Thanks and Regards,
> Arun R Murthy
> -------------------
> 
> > 
> > > I am open for either of the two or you have any other options as well I
> > > am open.
> > > 
> > > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > > ---
> > > Arun R Murthy (4):
> > >        drm/display/dp: Read LTTPR caps without DPRX caps
> > >        drm/i915/dp: Read LTTPR caps followed by DPRX caps
> > >        drm/i915/dp: On HPD read LTTPR caps followed by DPRX caps
> > >        drm/i915/dp: DPRX/LTTPR caps for DP should be read once
> > > 
> > >   drivers/gpu/drm/display/drm_dp_helper.c            | 63 ++++++++++++++++++++++
> > >   drivers/gpu/drm/i915/display/intel_dp.c            |  3 +-
> > >   .../gpu/drm/i915/display/intel_dp_link_training.c  | 40 +++++++-------
> > >   .../gpu/drm/i915/display/intel_dp_link_training.h  |  1 -
> > >   drivers/gpu/drm/i915/display/intel_dp_tunnel.c     |  3 +-
> > >   include/drm/display/drm_dp_helper.h                |  2 +
> > >   6 files changed, 86 insertions(+), 26 deletions(-)
> > > ---
> > > base-commit: cfc20c776480fda8c1b0517b187bb71ec0781cd4
> > > change-id: 20260305-dp_aux-1e27599e06c8
> > > 
> > > Best regards,
> > > -- 
> > > Arun R Murthy <arun.r.murthy@intel.com>
> > > 
