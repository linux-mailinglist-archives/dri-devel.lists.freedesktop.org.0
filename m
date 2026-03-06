Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPEFNTpYqmk/PwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 05:29:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8985D21B7E9
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 05:29:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 309ED10E364;
	Fri,  6 Mar 2026 04:29:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SMjnqImW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F1A510E346;
 Fri,  6 Mar 2026 04:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772771381; x=1804307381;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xePVh5xVIz3L7YxOK2F19fJQaCHTMOeirNNhivsVLBk=;
 b=SMjnqImWoYkyf6TWWNa5zyFnzx9sUMX1Jt7JBAgPU2WyCRqH1Z4QCCO+
 9TRoQ4tfbzJ679F0Yh04QdACpolOT6KHzzrJCtFXoETm2vfVTA0a8wn1M
 B7oqSqBSAV1/7OrFYOgI7j2CFfcgBeKPG8GoQJKXAVTa8PME5PyxEmNWX
 epBZoa/+/yXn9TsbO52sMjWW344aU/hme9hQV4v/gW2VsRmKq3JmEtuFh
 RGA0dn4yzk0nDwYIUKi1BLAYnnH+NAQedG4PWvIMpgFWgY8r5rMUkb3LX
 XEOJqXgXIImB4DXD0acXrTidCo01BSthSFmQ3CBSSX5PfJJtyQg0mfRQf w==;
X-CSE-ConnectionGUID: gD5R6AMqTTewKbtbqu9PEw==
X-CSE-MsgGUID: quV5b7VqR66rVhE8ixpzCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="84586678"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="84586678"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 20:29:40 -0800
X-CSE-ConnectionGUID: s/oCF6m7Q2W5W6v8pcanJQ==
X-CSE-MsgGUID: TcNz54WaTHehyhkQTXBM4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="217109731"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 20:29:40 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 20:29:39 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 5 Mar 2026 20:29:39 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.17) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 20:29:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mawaHpFTb/Aji7Q45oXSbDAWkVK0HrDpOK9p2qI1KCEr01wmzlR5ffF4u2u3EHhzWNOsqyFeW8mG5yGND/zl9KSL+Nw61ytSObBSqAMDB60cVjJePWiSvV9aAKKkKmVnWLoutmVWoYOzvWe4/3pQdGxqPvdDZQ/9BRQOEc6SxDAYenFQQp+QH4bjWwPg6/vUkiTnX3tphpF8WoaHAUUKlBnZIFW29OFgSAE/vJ5A10bwRgXAVKfZ5Dn+RX7UKgb085z0Nba9lNzaJRoro+3pU3QY43uIfLaaTL9kkBfAUAVxFqJ81PUoGhvhzdDbhYq2rj20WO5cdGuxnDNsp8NvmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2mwE7U4LxmynJnKg2DKNcLlVSpZo+6W+UL6ew+GqxHo=;
 b=E9d9mcZ5jI7IOwucukScPXVYQ2DK6RUWXambuh9ZWuqbVM+WY6VAQLLXdQ77ZqBlB+5D4ysjuJZErX4yJ66Z77+9d14IPCiqAwtK9/vmEJ195Si3DcyH90FStOkborF9kLB0o41BbBCdXRp/p/0QGtqvmcSn40ZsAaTxMsjvkN6uTfLRFCycB8Z+/A2l/VasEkncGlM8WdaEcAlKkW8b5OerPcOO96LQr8Sy4IkSVutmvYlbupcu2oK0QiD/GnXJUKzoopOhvwFPkdqWRNNgfxf+nZtSRvLCY8090tr1TF9a3/synWSrXUW1IyZQtZcZA7fVogiGTNkGifQtJ70F5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by BL4PR11MB8821.namprd11.prod.outlook.com (2603:10b6:208:5a6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Fri, 6 Mar
 2026 04:29:32 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7%6]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 04:29:32 +0000
Message-ID: <51779f46-e806-4a82-84a7-82b2a166402c@intel.com>
Date: Fri, 6 Mar 2026 09:59:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/4] DP: Read LTTPR caps followed by DPRX caps
To: <imre.deak@intel.com>
CC: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
References: <20260305-dp_aux-v1-0-54ee0b5f5158@intel.com>
 <aamrRxXwBxzt6s4F@ideak-desk.lan>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <aamrRxXwBxzt6s4F@ideak-desk.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0002.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::8) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|BL4PR11MB8821:EE_
X-MS-Office365-Filtering-Correlation-Id: c94ec6cb-56e9-458a-a4e9-08de7b38f6bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: xsUxwd3TetknhOWg0lADf/gcdepNZ4Ny5t8pVrY9rbQHqK6EOu7Pe8eh5r/O4B1PUkKLNzU2AOb0Wgm6WtU7vIKIHhJ2MYMbuVDJHk5LR+LxjES0uJhJLBBIYfckXD2tcqkg842qw5xqU8EGohiaMtdS7y9oXZqXqZXtSasLpG6hkb3+3Lls8w2XJcis0QV6LRvz7DpxBTdOwk7vT50ngh8M4rDp8HMqUSkDTbacE49XmZjUK3uNFv9f5+A7V5k59dEFytrByHoHBFLQFl/ayGR0LMMAIQKT9QuKVyLDLP3UgLCq77+6oi0ZhpHxJAA382ZOmwrSMIozWEqTtellrqGgzjk6fKBC8ooyMEO8CutZwj9qmi2WXo0jAiu2uTq7rVRd57CuRGi4YDFPoHgFdkHgKUgkquMWzbFMC0jfhfalE7kxvhtIU0nvvUKAJ8AGGGPgLDMjVTwTzc/CmxFFK7YkW0ha2XMytv+CBAs4drLzK7dMQweQWlHzFSYySBBoejtBYb2ONMV1nSfLqGe0bW8weJ4uZcIroP6EI7O0e28ZBVPftUL5gI29sOyCPSTjYd/bKgkXLy6z2ZnwXt6QWsFOu3SZKcqzfLWSCGQhL8x31qjrRFbm2CJJqJmirrFKVxyra8VW6lge9aJemJc8MVT2/4L9JjFokmgscVswq210jF49jSw144LGAMCuRRgB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zmt2NnpscWI0Z0JDRm1kS05Vem9lN2Nld21Gb2hyQmdSZTlmKzlqTzdlbUxU?=
 =?utf-8?B?Rm9iL254NkUzWEtBRm5UNUo5bUdES0d2ellnRnVsaEVQUWZxSS9rdkZZRFlQ?=
 =?utf-8?B?akM4NGV2WEgrUkVkYjJuSEk3QkpJZUtvdEVQN0l1WkE5WFA5VnhGVFVsVDkr?=
 =?utf-8?B?TlQyOW9RUUphQTN2SFlGT0thVkloeDU2Z2tHdGtVSWVXTUNPYXJpL05KK0RP?=
 =?utf-8?B?cDlvdUozNTZwT3g5bjB5R2JZUnNCRHVtOS9mKzVjYXVweTZTZURoQS9JU1FY?=
 =?utf-8?B?dUcxRXlvRURjdGovazQ0S1lQVDB5VUY2RkFScUpJS2JTaEd6NWxqeW5FOHhP?=
 =?utf-8?B?MWN1YlZEQlkwUmdhbTRaZHg0NzNsQXFWVC8zV2ZBMTU5bEVqUm9zQmZFcXFZ?=
 =?utf-8?B?QlhjWlhuZkMyQ1g5SFl1bE5ob3VIZTJ0NUNJMkdKR2hTb2ZBSWdGcXBaN2ZW?=
 =?utf-8?B?WWlubERMcHdJMTk0UWxFR3pTOGxMRjFsTU1uRnp2azlzSE9iY3lvN2lRMlZx?=
 =?utf-8?B?cjFNUDlxaXlOSFEyYVlHR3BscGxISXl5UXZEZlBhRTNpcHlwZzRyMkV2a1hl?=
 =?utf-8?B?YmYvbHVNcDA3NWwxTkxnZjFaSTBQSDZRS1pxWnN6TUJ6N1BkZEFoMGxOZ3Z4?=
 =?utf-8?B?ek1GUldUa0wvdHdPeWYrRFk5U3pzaTl6M3hSaDJsVWU1UjZxb3Vrb0dBUDMr?=
 =?utf-8?B?TDhNVGxqaysrZW81QTdlUmNtdzk2cjRmeG1vdjB6OTlBUUpXcW5UaVpoV2U3?=
 =?utf-8?B?a1YwTmR6b2k2MFFkWlNjTVdmWC9GcXpZQm1JNkVrL1RqcWNIOWc3V2JJT3pH?=
 =?utf-8?B?QUczcXRVZExyRWM2d3FxS2RwbkJKaFI0SWRZN2hjZFg5dFZRMmZ1NmxjK2pn?=
 =?utf-8?B?QlBsa3ZyQ1lIT1ZEMGVBcjluZUowaHFaazdxWHBIRGRmM1R3dENkVHZMRkdo?=
 =?utf-8?B?Y0RMK1cxNytDdFlUc2drRGpJTEdEQmlNclF4amIzdTlTeis1NVFlcVpXRmI1?=
 =?utf-8?B?bTk4TFFMK2ErZzE5N1JMTWVTbDR0WHlHUDBCWE1RdHJkRGd0T0E3aFZ5dXhm?=
 =?utf-8?B?bHlOa2lDZmNSYWFQRlorMVE3Z045MkJ6dDdwUEpRNWE0L2VqSVgzWldhenpV?=
 =?utf-8?B?NVFTZitnaXYyM1dDOXAyaWdkV3NsSHA0S1djRi9MYWlidnBBUmFYeFRuSi9l?=
 =?utf-8?B?NjhWNEtUYWY2SEhBY3IrQm9MR0ZFZUxXcTBRWEhZVVlrMk9VZ21nSFpXdStt?=
 =?utf-8?B?NlhTOE1TL3FCUkxGQnNVMlZyWk5JMFhra2RFdWU4YzZTYTRaQmZOT202M1hi?=
 =?utf-8?B?VEg0eExIbWZ2Z1RxZzNreEU3ZkpKZUhZb3Nhc1BnZE1CNkpvL3cyNi85eEto?=
 =?utf-8?B?b1NxUmp1TU1XSWRwcXQvYmd1MFZMQzQ0SlMrVjZZL0pYMEtQRlVYcEtUeGR6?=
 =?utf-8?B?dVhoZDYxUGU3ZUxJQU8yTzJ5K1kwNWdiL1NXT1ZHQ29UelRXMnlEUXhDZzBm?=
 =?utf-8?B?ZEc0ZGdNcXZqaFZYcWQ5SVVlM203WVQ3MDNXNmgxdklXcWVncUl2QVh6QzBX?=
 =?utf-8?B?NVVUY21BZHFDYVNUb3l1Y0VBUGczYkpwQ2dNcnRYL1E4aERpY0Zna0lMVnJK?=
 =?utf-8?B?S0tQZDA0ekhBaTVxTnlFNWF3cXBFZmp0SnNZMWpDYnY2TnVyY3ZqWjM3QmNu?=
 =?utf-8?B?STBudGJKV2p4RWx4VCtPU3VzRE0zMVFWYXhLMFcyY0QwTlY0M2FzTGloNjFJ?=
 =?utf-8?B?VUxSdHJpeThrQy9FNDFmckJxQ1pvWkpwK29IV1Jsb0xlbWhaNC9jWGhhVW1t?=
 =?utf-8?B?MmwxNENKNkovdVhhMUthcjNmalhMWWhlQ0Ezakppc1pqaGc1UEZDUGZXYzdS?=
 =?utf-8?B?MnpsMi8xM3VBNkJHdnV3d1RsKy9HeHZsWVd4dUhYNk9Sc3BYNkxrUVA1Mm5V?=
 =?utf-8?B?Y1pvckhTa0p6N3ZDY1NveFJuK3F2Tk8wVWw1SkVUZ3c1d1V4S3VXWEVwQW41?=
 =?utf-8?B?OWJscllacTBpZEN2dDNjSlVPdVpwWGZPZUdWTFhNR3NvVlZFNXJmM050NnJu?=
 =?utf-8?B?eXdMVnVscy94cGpwZ1FpU3VXMko2K1lnZjFxREdrczk0emViK2crbmVnZkVF?=
 =?utf-8?B?MHhQeVdLUVpSbG9XM0ozb0RPVmI1QUFkdy9ZcHJVT0lGZjNQb2pVUklCK1l1?=
 =?utf-8?B?REgrRGZSOU1FSGowSjlTUDFyMmk2MXg0V2trUm5KaEE1UWFPbEtQQy9sQyt2?=
 =?utf-8?B?TUdDZlJWNFUxaCtwcUpQT21MRGNjVCttSjArTWRYZ0VrNWs2RU1ULzBtS1Fz?=
 =?utf-8?B?LzY5VFlZOUJubE4rL1RabFQ0c3ppMzRZUnRVRWtURzFqbzhSZm1adz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c94ec6cb-56e9-458a-a4e9-08de7b38f6bf
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 04:29:32.4325 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZQt0h2jRcncdsT5/MIzk5rIu054ABr0sKK17/VvX1lT/WNpcbyz8pTmwzmI0UjwCVL1Ms0/rqHLXdQshwexV7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8821
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
X-Rspamd-Queue-Id: 8985D21B7E9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,intel.com:dkim,intel.com:email,intel.com:mid];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arun.r.murthy@intel.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Action: no action


On 05-03-2026 21:41, Imre Deak wrote:
> On Thu, Mar 05, 2026 at 01:48:10PM +0530, Arun R Murthy wrote:
>> As per the spec  DP2.1 section 3.6.8.6.1, section 2.12.1,
>> section 2.12.3 (Link Policy) the LTTPR caps is to be read first
>> followed by the DPRX capability.
> Not exactly. The Standard requires reading the DPRX capabilities after
> the LTTPR caps are read.
I also mean the same, sorry if my wordings were complex.
> The driver does read the DPRX caps after
> reading the LTTPR caps.

In intel_dp_link_training.c function intel_dp_init_lttpr_and_dprx_caps()

int err = intel_dp_read_dprx_caps()
if (err != 0)
     return err;
lttpr_count = intel_dp_init_lttpr()

Here we are reading dprx caps and then passing this dprx caps to the the 
func intel_dp_init_lttpr(). I think this will be a deviation of the spec.

> The DP Standard does not mandate that the first
> read after a sink is connected (i.e. after the HPD signal of the sink is
> asserted) must be an LTTPR capability read and cannot be any other DPCD
> register read. In fact this would be impossible to guarantee, a DPRX
> capability read - or any DPCD register read for that matter - could
> happen at any point and so it could happen right after the HPD signal
> got asserted.
Spec DP2.1 Section 3.6.8.6.1 LTTPR Recognition
After HPD is propagated from the DPRX to the DPTX, a DP Source device 
with a DPTX shall
read specific registers within the DPCD LTTPR Capability and ID Field 
(DPCD F0000h through
F0009h; see Section 3.6.5)
After LTTPR recognition, a DP Source device with a DPTX shall read the 
DP Sink device with
a DPRX’s capability by reading the DisplayID or legacy EDID and the 
DPRX’s Receiver
Capability field (DPCD 00000h through 000FFh; see Table 2-232).
>> Git log shows that initially drm dp helper exposed function to read
>> lttpr caps. Driver reads the lttpr caps and then the dprx caps.
>> For a particular issue
>> https://gitlab.freedesktop.org/drm/intel/-/issues/3415
>> as a workaround reading dprx caps was done first to know if the panel is
>> < DP1.4 and then read 1 block at a time for lttpr caps.
>>
>> This can be handled in a better way and two such ways is what I see.
>> 1. Read LTTPR caps followed by DPRX caps as per the spec. Then on
>> reading dprx caps if revision < 1.4 then re-read the lttpr caps one
>> block at a time.
>>
>> 2. Read LTTPR caps and if 8b/10b check for correctness of the link rate
>> supported(lttpr caps 0xf0001), if some corrupted value is read then read
>> one block at a time.
> The driver does read the DPRX capabilities after reading the LTTPR
> capabilities. This is what the standard mandates.
Yes but before reading the LTTPR capabilities also DPRX capabilities is 
read. Have added ref to the code snipped above.
Please let me know if my understanding is wrong.
>
> The workaround for issues/3415 depends on the DPCD_REV value, so this is
> read separately before reading the LTTPR caps. I don't see a better way
> to implement the workaround and such read is not prohibited by the DP
> Standard either. So I don't see the point of the changes in this
> patchset.

As Jani commented this can be added as a quirk for that particular panel 
instead of mandating this kind of reading dprx caps first and then 
reading the lttpr caps for all the monitors.

Thanks and Regards,
Arun R Murthy
-------------------

>
>> I am open for either of the two or you have any other options as well I
>> am open.
>>
>> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
>> ---
>> Arun R Murthy (4):
>>        drm/display/dp: Read LTTPR caps without DPRX caps
>>        drm/i915/dp: Read LTTPR caps followed by DPRX caps
>>        drm/i915/dp: On HPD read LTTPR caps followed by DPRX caps
>>        drm/i915/dp: DPRX/LTTPR caps for DP should be read once
>>
>>   drivers/gpu/drm/display/drm_dp_helper.c            | 63 ++++++++++++++++++++++
>>   drivers/gpu/drm/i915/display/intel_dp.c            |  3 +-
>>   .../gpu/drm/i915/display/intel_dp_link_training.c  | 40 +++++++-------
>>   .../gpu/drm/i915/display/intel_dp_link_training.h  |  1 -
>>   drivers/gpu/drm/i915/display/intel_dp_tunnel.c     |  3 +-
>>   include/drm/display/drm_dp_helper.h                |  2 +
>>   6 files changed, 86 insertions(+), 26 deletions(-)
>> ---
>> base-commit: cfc20c776480fda8c1b0517b187bb71ec0781cd4
>> change-id: 20260305-dp_aux-1e27599e06c8
>>
>> Best regards,
>> -- 
>> Arun R Murthy <arun.r.murthy@intel.com>
>>
