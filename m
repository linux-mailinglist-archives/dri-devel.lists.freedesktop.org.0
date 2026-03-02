Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0ASkBPoRpmnmJwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 23:40:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 770C81E5CDF
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 23:40:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F7F210E5E2;
	Mon,  2 Mar 2026 22:40:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WS7eh0WS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F65710E5E1;
 Mon,  2 Mar 2026 22:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772491252; x=1804027252;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=q95RLC18ShYl9ACcGGYlSAa22sBurHH337PES3m+9Us=;
 b=WS7eh0WScdypbHgha6TH8tQ/C+nAjZxszggRMiAfcem1b2E365l5FJ73
 tW8kTMZAI/A0u+Jt90VTPpXJ34vURNtsck3ENpgL1q0HbgkADFndHDrSH
 9Sy9EA7b5i2l/SHQCUWcf42DFBN4werscnUz93ephWT6rSntVGOQpHnj6
 NtP5g82e4pNQh8e+o2ev23HMbmVtzZM36PkNHGXEsU8kukaSYC3F4lY8X
 wm6zrbhH88SkEX+hkrHlGbmiQFt8AQ07rGKfPzOwePsuSplweYgVoL6hG
 IkFGoE5K/tkLHul3Ohx/TfSWtlH4XumgLC5c1o14J+O+UqKm1sMsh5N7X A==;
X-CSE-ConnectionGUID: DzNRYwvQS2O9Mvze7OxYow==
X-CSE-MsgGUID: 0yOqQFP0RsynzkGCKPRQOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73555506"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="73555506"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 14:40:42 -0800
X-CSE-ConnectionGUID: pCHSjfdNTeOEnrmR23Xnpw==
X-CSE-MsgGUID: 6nNgkyfnRwyAgJvgESi3uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="240807964"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 14:40:41 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 14:40:41 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 2 Mar 2026 14:40:41 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.45) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 14:40:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FCNggzqNYv28Z0B7iUb5GQ/PIz+iUvka0CCfmEVwC7UJlDQoxPH2ZgsN2xznhCihwYukraU4lZnh9fbry9jbO4QbwPXcTHkorbxQUoTNIqzQ1NEiSBme3iTnNVTFw7TYVdutw8dXJ56ulGrfA6Be08zxL0ULykqtmLS0CW8JIKwY8BYk8C5XYUecBRvjvbr0y+pJKt7cNySlLmGwFMJ/xlqQ8fCd370vj4hPkaYTGFPqpbvUWVpFILqs/yx5pMAQQMQHFidYng0wrpyfkoEIjXRoLSw4TgBAAtMkmGuozp+3yEbCQG1jFkJTxp0olLMdyqudFJR9g3RRgZhERmCKZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3F91yc12FK9QNJjgFrTa+mSWUJw5rH4lvc7RTtiPGlg=;
 b=ppG9AEWmAaSlp+bsAWQtRXsFov9OQ0Vv1p+iSxJzpRcDBn672qy3uxTDfmcPw3Y1LkEZlGjY5R5NPI3zevMDtYfcP72Ye4IYSLjVskdjJHpk9FHC7yVxJtL66kuiFMiLPPathh613/hMK/xa3PMsOX+ar2FlPcwqXavsbiVWpW5b7erXs6Fb1B+35W2wJwBE+99aHdnZJuHOF5Jdm9FhAg07/5PSKyQMprbIX7LVi9pztGZm7QhPmoxESMYJ+RRTlJYoFN/cWUO2+cBrsHr/kg6zQ2mEWOdkfDMoenpu3apZ379I/HFjGPQvUyDWBtMf5/+GVigB0O+Q/cBg7U/v3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ5PPF9FBA0498D.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::848) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 22:40:39 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 22:40:39 +0000
Date: Mon, 2 Mar 2026 14:40:36 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, "Oded
 Gabbay" <ogabbay@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-xe-next
Message-ID: <aaYR5G2MHjOEMXPW@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0334.namprd04.prod.outlook.com
 (2603:10b6:303:8a::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ5PPF9FBA0498D:EE_
X-MS-Office365-Filtering-Correlation-Id: 3681283b-6061-4a70-697c-08de78acba5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7142099003|18082099003; 
X-Microsoft-Antispam-Message-Info: KgZL63QjXtVzQyBNJSAPegWRy9jeIWiVwMvo1fesLMeVHqktTepTYk4fYgXGeC82q/DDY7z3Iwh1gpBnYmuNC3Ao5qjkcfiolK3wHJaOnCYMPQrr7wDUn75oR64LjGFJ2wdRU5YUE3JL+ON4iydbz/4f0755wC8YMa0iYn3w/rK8ctxzVFetA2Ycwn4v4u/PSQCz3Th5hOiI4PRitm6VB5xLS9CDnm3JIv+05rqfEibHud+qoJOVHfRYveidVuSbqBB6cp3LLGB/YrYSmWc/RradiegcVyKWonclG/fuclWJpchJral/YkOPV0lDE7+Fd8ObLjBefl9yi4JZqS64guWq8iBq/DxYIm17RIOZ75+IhNM0E0gFm+2zO1FPSYD+ngkUxoCFgC3kjQYVEm1n3RY9tx9h07VxOb+Uq8ezLR0EBhqfU8OAE8CzDSNfQwn5SQhjywuXnXV1z6XyUCD0Oy+sfMrO3HcWJzatS1hJUgwLEOE5H1CAUcnXYvDVlp+ifGQPxz19PHepaQzugYtDN7PFeMhfqet5Xe0za4OV6oXGrBs5nNoJf9yJcCS5/rfPgyUO9vVj6MK92FhizxIeffwRYXswA6ez+RIwfohL2Cv1jExIZq7cnVoNgyWctleUZU5wDeRdJ5MtBjdY3ycwJo4LZIWMotBSg4L55Q6u3H5paIVGUwv31ilXwFHW3RVt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7142099003)(18082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDk3MDB4T2lmajhSZDk2a25ub2NvUVMybEpjb3dSTUdwbjh4dENxR0lGOFN5?=
 =?utf-8?B?L2I5TkpoaGVqSG5sTERNNkgvMlpWS3MyMHBmdk9mK2o1YkR2cjRPRmI0Q095?=
 =?utf-8?B?SW1aemREaXZidjQwMW1wcENmbmsvNkpLT3ZZYXVGdEc3K0YvR1BqaklwMy8v?=
 =?utf-8?B?SENPNUszL1Z6TkExVGErZU9qdHh5ZnZIemp3aDQrVXloY1J1SVVGNHU2MGsx?=
 =?utf-8?B?S3dYRjhiU1JCanlockViMk9SSkdYWm1VSTZBTkV0anRnZklKSzdxRmExRXVl?=
 =?utf-8?B?OGtEZVRTdTM4amllWDRIT2todTZNd0Q1N3RmSGtTWlFvQlE3ZUUyc1hPeGxr?=
 =?utf-8?B?WGUwWHJnQ2pjd1hjNzdYZmRDUmRQQkljYkNQazJ5Q1RpSDR1dUU0eXprS0Rr?=
 =?utf-8?B?cVVBdXBCeG5QRENlVUQ1dXdjb0hQZzFQQ1ZKbzhzazBHaThwUW4rSk9FTkMv?=
 =?utf-8?B?YUpnSElnQ3RSQTBDLzZJemhBZzRkNWhQc3l0Zm1admNZN0NXWFA1TlF0T2wz?=
 =?utf-8?B?WEhJN3ZpRmNHTjExTzNqSmxNWTJYTXNjaE1KdnBjMTVPRXpaVG5BRDA0T1Ex?=
 =?utf-8?B?N3kyZjgxcVU0MlBiUStobjlMb2RzNlk4N3c0WHBYcllYbndWbnJjaVhzYVpw?=
 =?utf-8?B?eDJVV2lvY3FMMzNqeEhIRi9VTjFvelkwdktIaDh2Y3NCOGFvTXgzUXV3OFFx?=
 =?utf-8?B?S21JSG04U3NHcVdYUDBjSFNXbzFzWUl4VEJvTHVxeHhXNDl0Y0YwU1RNRW56?=
 =?utf-8?B?SHVTNk1TY1c3TFBiNjhIeXhjL2FudWtVQ1FWQThZUXZablhmT0xma2ZYUGc4?=
 =?utf-8?B?NGtqSnlVbHBtNFlDVUlUN01Ca3Boa1hURkpTdjZha0ZNQUtNeERBSU9zeTk3?=
 =?utf-8?B?OW1zN2ZMcDdsek5WRE1kNkttM1ZVQ2xtRnNGRWNMWnp0bnFrMVVKSVl5TzJz?=
 =?utf-8?B?NlBQdWwwaHVUV2FNQlg1bjB3RlRySmZJMzIydXc0bnJ6V0dVbE1QbHdFcGJZ?=
 =?utf-8?B?bGkra1BqMUlyZFJxZW1MMG5qSVNIRHl3ZTNPY01uTTlJTHZqRnQ0MTF5TjFi?=
 =?utf-8?B?bllwSEo1QUo4dkpJSnpZUWFSNGMwcUhvQnEwK1cxMWdFODFxaWN0Wjd2Z1N4?=
 =?utf-8?B?RkZtREdsdUlLMmtjR3llZ1dtWDh4M0dpcmxpZTBReG1BQ2NDVGNLdGZabHZC?=
 =?utf-8?B?TzBxNXZpeXd5dWZFaUhUeVpDcXR3MElJWXUrRFA1Qmk3OEc4elV3VzlGV2xa?=
 =?utf-8?B?SDdZOFdoSUZzWFJ2dlJwSEtHUjc3OU5EQ0Nyd2dlVm15L1k4M2xYNXhaYnJ0?=
 =?utf-8?B?VWRGMmJIUGJSWmRvcXQzVmdWQ2Z2dXRGenBLZFJ4bEVRK2FackNMS2UxamV1?=
 =?utf-8?B?R3V4Z2k5ZGxIV2lrWVRUOC9PMXdlQnFPQUVMTnVraHpIL3BnTGMzSTZuUExX?=
 =?utf-8?B?V1ZkSklKbVhOQ1B6eDdNa2FsdkExUFpVVENOMTN4TThIeDc4UjIrU1FoWmRt?=
 =?utf-8?B?aEkzbGFjc1ZtK2Y4NXZKYjE0OHhBSE1MRDVoRGhpdTB1WGgxYVlDKzFSdlJE?=
 =?utf-8?B?TWp5SGxobElrTWdFTWpYbzh4SHJVRk1PQmdVcSt4cnNyQ3hQa2U0RWJoNWRU?=
 =?utf-8?B?bmdBZkFScW1wa0M0dGxhcHNmOEEzVmphUjcxWWNVMmhKZHc0cldzOWpwemFX?=
 =?utf-8?B?NWpLMkxwZjhidmhIMXowRmhDYUhjVXMyaVI5ZndiTnVxUWtRdmRiNW5VOGlY?=
 =?utf-8?B?UGVkSDJ1M0dyU2tnQUJ3eVBrbVVORmlnaVVEVzA5NGIvS1RqbkkvSDRkbTZ0?=
 =?utf-8?B?bVduQkVBbWRFeXo5SnFGWFVFRFRwWlVvdnd3MEx0WHNEaUppbzN4OFAwUjRL?=
 =?utf-8?B?OUs5eTIvSkNxYTI1Q1ZnRjlJSDAvcUpTRm9KaDBJOU0rS0l1WmFmZ1hybWNP?=
 =?utf-8?B?WHY4VGNKdnF0aE1ZWm5oTWVWeFRGMlY0dGhSRXV3S1k3d3NERWlXVDR2YkhH?=
 =?utf-8?B?c1lXMTkxQ2JDN1BMZTI2YWp1VnM0MHdLWDVkcGtaeXFyQ3oxRmt5S2ZqUlc4?=
 =?utf-8?B?b0dCTldxc1B6WUJOZ0ptUk52VXBuQWJMeUdQaWtQQnEzMmd4cmNFU2h6N1JM?=
 =?utf-8?B?UWxYUC85ckJVM2diNnVVb0ZRSmQwL2ZodmZXWGlkd3kyNFZqaW5jRHFsWG0w?=
 =?utf-8?B?bW1EYnp6TXhDU1poQ0hVeDZQUzdLY1llYWhRclBwS29DeWhDY1pIL1g2NUxi?=
 =?utf-8?B?UE9wSGtndW4rS2hMUTdhWFFvTUVEa0F4a0dxMHRhdmNhSUxQeXFOM0JRVlRS?=
 =?utf-8?B?SVVpcGNmMTI1WktMMVBCT3FQdUdsNmx6bDBkZjAvQkxwR2hUZjhwOGVEMEVT?=
 =?utf-8?Q?ht+Om6V42BhwDEuY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3681283b-6061-4a70-697c-08de78acba5c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 22:40:39.1077 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xdJi4mX5kV2EfnfqcRi6DQAn9+cYDgPjf6/qhcYO2EhFKrfTzisKAGkFUsoGaCd3h6WYO2yRXbKszIiChfBKhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF9FBA0498D
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
X-Rspamd-Queue-Id: 770C81E5CDF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[16];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,lstrano-desk.jf.intel.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

Hi Dave and Sima,

Here goes our first drm-xe-next PR towards 7.1.

In the big things we have:
- Lots of work around workarounds
- SRIOV changes / fixes, in particular PF admin mode
- Lots of work Xe3 support
- Context based TLB invalidations
- and many more changes, fixes and improvements...

Thanks,
Matt

drm-xe-next-2026-03-02:
UAPI Changes:
- restrict multi-lrc to VCS/VECS engines (Xin Wang)
- Introduce a flag to disallow vm overcommit in fault mode (Thomas)
- update used tracking kernel-doc (Auld, Fixes)
- Some bind queue fixes (Auld, Fixes)

Cross-subsystem Changes:
- Split drm_suballoc_new() into SA alloc and init helpers (Satya, Fixes)
- pass pagemap_addr by reference (Arnd, Fixes)
- Revert "drm/pagemap: Disable device-to-device migration" (Thomas)
- Fix unbalanced unlock in drm_gpusvm_scan_mm (Maciej, Fixes)
- Small GPUSVM fixes (Brost, Fixes)
- Fix xe SVM configs (Thomas, Fixes)

Core Changes:
- Fix a hmm_range_fault() livelock / starvation problem (Thomas, Fixes)

Driver Changes:
- Fix leak on xa_store failure (Shuicheng, Fixes)
- Correct implementation of Wa_16025250150 (Roper, Fixes)
- Refactor context init into xe_lrc_ctx_init (Raag)
- Fix GSC proxy cleanup on early initialization failure (Zhanjun)
- Fix exec queue creation during post-migration recovery (Tomasz, Fixes)
- Apply windower hardware filtering setting on Xe3 and Xe3p (Roper)
- Free ctx_restore_mid_bb in release (Shuicheng, Fixes)
- Drop stale MCR steering TODO comment (Roper)
- dGPU memory optimizations (Brost)
- Do not preempt fence signaling CS instructions (Brost, Fixes)
- Revert "drm/xe/compat: Remove unused i915_reg.h from compat header" (Uma)
- Don't expose display modparam if no display support (Wajdeczko)
- Some VRAM flag improvements (Wajdeczko)
- Misc fix for xe_guc_ct.c (Shuicheng, Fixes)
- Remove unused i915_reg.h from compat header (Uma)
- Workaround cleanup & simplification (Roper)
- Add prefetch pagefault support for Xe3p (Varun)
- Fix fs_reclaim deadlock caused by CCS save/restore (Satya, Fixes)
- Cleanup partially initialized sync on parse failure (Shuicheng, Fixes)
- Allow to change VFs VRAM quota using sysfs (Michal)
- Increase GuC log sizes in debug builds (Tomasz)
- Wa_18041344222 changes (Harish)
- Add Wa_14026781792 (Niton)
- Add debugfs facility to catch RTP mistakes (Roper)
- Convert GT stats to per-cpu counters (Brost)
- Prevent unintended VRAM channel creation (Karthik)
- Privatize struct xe_ggtt (Maarten)
- remove unnecessary struct dram_info forward declaration (Jani)
- pagefault refactors (Brost)
- Apply Wa_14024997852 (Arvind)
- Redirect faults to dummy page for wedged device (Raag, Fixes)
- Force EXEC_QUEUE_FLAG_KERNEL for kernel internal VMs (Piotr)
- Stop applying Wa_16018737384 from Xe3 onward (Roper)
- Add new XeCore fuse registers to VF runtime regs (Roper)
- Update xe_device_declare_wedged() error log (Raag)
- Make xe_modparam.force_vram_bar_size signed (Shuicheng, Fixes)
- Avoid reading media version when media GT is disabled (Piotr, Fixes)
- Fix handling of Wa_14019988906 & Wa_14019877138 (Roper, Fixes)
- Basic enabling patches for Xe3p_LPG and NVL-P (Gustavo, Roper, Shekhar)
- Avoid double-adjust in 64-bit reads (Shuicheng, Fixes)
- Allow VF to initialize MCR tables (Wajdeczko)
- Add Wa_14025883347 for GuC DMA failure on reset (Anirban)
- Add bounds check on pat_index to prevent OOB kernel read in madvise (Jia, Fixes)
- Fix the address range assert in ggtt_get_pte helper (Winiarski)
- XeCore fuse register changes (Roper)
- Add more info to powergate_info debugfs (Vinay)
- Separate out GuC RC code (Vinay)
- Fix g2g_test_array indexing (Pallavi)
- Mutual exclusivity between CCS-mode and PF (Nareshkumar, Fixes)
- Some more _types.h cleanups (Wajdeczko)
- Fix sysfs initialization (Wajdeczko, Fixes)
- Drop unnecessary goto in xe_device_create (Roper)
- Disable D3Cold for BMG only on specific platforms (Karthik, Fixes)
- Add sriov.admin_only_pf attribute (Wajdeczko)
- replace old wq(s), add WQ_PERCPU to alloc_workqueue (Marco)
- Make MMIO communication more robust (Wajdeczko)
- Fix warning of kerneldoc (Shuicheng, Fixes)
- Fix topology query pointer advance (Shuicheng, Fixes)
- use entry_dump callbacks for xe2+ PAT dumps (Xin Wang)
- Fix kernel-doc warning in GuC scheduler ABI header (Chaitanya, Fixes)
- Fix CFI violation in debugfs access (Daniele, Fixes)
- Apply WA_16028005424 to Media (Balasubramani)
- Fix typo in function kernel-doc (Wajdeczko)
- Protect priority against concurrent access (Niranjana)
- Fix nvm aux resource cleanup (Shuicheng, Fixes)
- Fix is_bound() pci_dev lifetime (Shuicheng, Fixes)
- Use CLASS() for forcewake in xe_gt_enable_comp_1wcoh (Shuicheng)
- Reset VF GuC state on fini (Wajdeczko)
- Move _THIS_IP_ usage from xe_vm_create() to dedicated function (Nathan Chancellor, Fixes)
- Unregister drm device on probe error (Shuicheng, Fixes)
- Disable DCC on PTL (Vinay, Fixes)
- Fix Wa_18022495364 (Tvrtko, Fixes)
- Skip address copy for sync-only execs (Shuicheng, Fixes)
- derive mem copy capability from graphics version (Nitin, Fixes)
- Use DRM_BUDDY_CONTIGUOUS_ALLOCATION for contiguous allocations (Sanjay)
- Context based TLB invalidations (Brost)
- Enable multi_queue on xe3p_xpc (Brost, Niranjana)
- Remove check for gt in xe_query (Nakshtra)
- Reduce LRC timestamp stuck message on VFs to notice (Brost, Fixes)
The following changes since commit 83675851547e835c15252c601f41acf269c351d9:

  drm/xe: Cleanup unused header includes (2026-01-15 07:05:04 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-2026-03-02

for you to fetch changes up to 6bc6fec71ac45f52db609af4e62bdb96b9f5fadb:

  drm/xe/reg_sr: Fix leak on xa_store failure (2026-03-02 14:29:29 -0800)

----------------------------------------------------------------
UAPI Changes:
- restrict multi-lrc to VCS/VECS engines (Xin Wang)
- Introduce a flag to disallow vm overcommit in fault mode (Thomas)
- update used tracking kernel-doc (Auld, Fixes)
- Some bind queue fixes (Auld, Fixes)

Cross-subsystem Changes:
- Split drm_suballoc_new() into SA alloc and init helpers (Satya, Fixes)
- pass pagemap_addr by reference (Arnd, Fixes)
- Revert "drm/pagemap: Disable device-to-device migration" (Thomas)
- Fix unbalanced unlock in drm_gpusvm_scan_mm (Maciej, Fixes)
- Small GPUSVM fixes (Brost, Fixes)
- Fix xe SVM configs (Thomas, Fixes)

Core Changes:
- Fix a hmm_range_fault() livelock / starvation problem (Thomas, Fixes)

Driver Changes:
- Fix leak on xa_store failure (Shuicheng, Fixes)
- Correct implementation of Wa_16025250150 (Roper, Fixes)
- Refactor context init into xe_lrc_ctx_init (Raag)
- Fix GSC proxy cleanup on early initialization failure (Zhanjun)
- Fix exec queue creation during post-migration recovery (Tomasz, Fixes)
- Apply windower hardware filtering setting on Xe3 and Xe3p (Roper)
- Free ctx_restore_mid_bb in release (Shuicheng, Fixes)
- Drop stale MCR steering TODO comment (Roper)
- dGPU memory optimizations (Brost)
- Do not preempt fence signaling CS instructions (Brost, Fixes)
- Revert "drm/xe/compat: Remove unused i915_reg.h from compat header" (Uma)
- Don't expose display modparam if no display support (Wajdeczko)
- Some VRAM flag improvements (Wajdeczko)
- Misc fix for xe_guc_ct.c (Shuicheng, Fixes)
- Remove unused i915_reg.h from compat header (Uma)
- Workaround cleanup & simplification (Roper)
- Add prefetch pagefault support for Xe3p (Varun)
- Fix fs_reclaim deadlock caused by CCS save/restore (Satya, Fixes)
- Cleanup partially initialized sync on parse failure (Shuicheng, Fixes)
- Allow to change VFs VRAM quota using sysfs (Michal)
- Increase GuC log sizes in debug builds (Tomasz)
- Wa_18041344222 changes (Harish)
- Add Wa_14026781792 (Niton)
- Add debugfs facility to catch RTP mistakes (Roper)
- Convert GT stats to per-cpu counters (Brost)
- Prevent unintended VRAM channel creation (Karthik)
- Privatize struct xe_ggtt (Maarten)
- remove unnecessary struct dram_info forward declaration (Jani)
- pagefault refactors (Brost)
- Apply Wa_14024997852 (Arvind)
- Redirect faults to dummy page for wedged device (Raag, Fixes)
- Force EXEC_QUEUE_FLAG_KERNEL for kernel internal VMs (Piotr)
- Stop applying Wa_16018737384 from Xe3 onward (Roper)
- Add new XeCore fuse registers to VF runtime regs (Roper)
- Update xe_device_declare_wedged() error log (Raag)
- Make xe_modparam.force_vram_bar_size signed (Shuicheng, Fixes)
- Avoid reading media version when media GT is disabled (Piotr, Fixes)
- Fix handling of Wa_14019988906 & Wa_14019877138 (Roper, Fixes)
- Basic enabling patches for Xe3p_LPG and NVL-P (Gustavo, Roper, Shekhar)
- Avoid double-adjust in 64-bit reads (Shuicheng, Fixes)
- Allow VF to initialize MCR tables (Wajdeczko)
- Add Wa_14025883347 for GuC DMA failure on reset (Anirban)
- Add bounds check on pat_index to prevent OOB kernel read in madvise (Jia, Fixes)
- Fix the address range assert in ggtt_get_pte helper (Winiarski)
- XeCore fuse register changes (Roper)
- Add more info to powergate_info debugfs (Vinay)
- Separate out GuC RC code (Vinay)
- Fix g2g_test_array indexing (Pallavi)
- Mutual exclusivity between CCS-mode and PF (Nareshkumar, Fixes)
- Some more _types.h cleanups (Wajdeczko)
- Fix sysfs initialization (Wajdeczko, Fixes)
- Drop unnecessary goto in xe_device_create (Roper)
- Disable D3Cold for BMG only on specific platforms (Karthik, Fixes)
- Add sriov.admin_only_pf attribute (Wajdeczko)
- replace old wq(s), add WQ_PERCPU to alloc_workqueue (Marco)
- Make MMIO communication more robust (Wajdeczko)
- Fix warning of kerneldoc (Shuicheng, Fixes)
- Fix topology query pointer advance (Shuicheng, Fixes)
- use entry_dump callbacks for xe2+ PAT dumps (Xin Wang)
- Fix kernel-doc warning in GuC scheduler ABI header (Chaitanya, Fixes)
- Fix CFI violation in debugfs access (Daniele, Fixes)
- Apply WA_16028005424 to Media (Balasubramani)
- Fix typo in function kernel-doc (Wajdeczko)
- Protect priority against concurrent access (Niranjana)
- Fix nvm aux resource cleanup (Shuicheng, Fixes)
- Fix is_bound() pci_dev lifetime (Shuicheng, Fixes)
- Use CLASS() for forcewake in xe_gt_enable_comp_1wcoh (Shuicheng)
- Reset VF GuC state on fini (Wajdeczko)
- Move _THIS_IP_ usage from xe_vm_create() to dedicated function (Nathan Chancellor, Fixes)
- Unregister drm device on probe error (Shuicheng, Fixes)
- Disable DCC on PTL (Vinay, Fixes)
- Fix Wa_18022495364 (Tvrtko, Fixes)
- Skip address copy for sync-only execs (Shuicheng, Fixes)
- derive mem copy capability from graphics version (Nitin, Fixes)
- Use DRM_BUDDY_CONTIGUOUS_ALLOCATION for contiguous allocations (Sanjay)
- Context based TLB invalidations (Brost)
- Enable multi_queue on xe3p_xpc (Brost, Niranjana)
- Remove check for gt in xe_query (Nakshtra)
- Reduce LRC timestamp stuck message on VFs to notice (Brost, Fixes)

----------------------------------------------------------------
Aradhya Bhatia (1):
      drm/xe/xe3p_lpg: Set STLB bank hash mode to 4KB

Arnd Bergmann (1):
      drm/pagemap: pass pagemap_addr by reference

Arvind Yadav (1):
      drm/xe/xe2: Apply Wa_14024997852

Balasubramani Vivekanandan (1):
      drm/xe: Apply WA_16028005424 to Media

Chaitanya Kumar Borah (1):
      drm/xe/guc: Fix kernel-doc warning in GuC scheduler ABI header

Daniele Ceraolo Spurio (1):
      drm/xe/guc: Fix CFI violation in debugfs access.

Dnyaneshwar Bhadane (1):
      drm/xe/nvlp: Attach MOCS table for nvlp

Gustavo Sousa (3):
      drm/xe/pat: Differentiate between primary and media for PTA
      drm/xe/xe3p_lpg: Update LRC sizes
      drm/xe/nvlp: Bump maximum WOPCM size

Harish Chegondi (3):
      drm/xe/xe2hpg: Remove SRIOV VF check for Wa_18041344222
      drm/xe/xe3: Remove SRIOV VF check for Wa_18041344222
      drm/xe/xe2lpg: Extend Wa_18041344222 to graphics IP 20.04

Jani Nikula (1):
      drm/xe: remove unnecessary struct dram_info forward declaration

Jia Yao (1):
      drm/xe: Add bounds check on pat_index to prevent OOB kernel read in madvise

Karthik Poosa (2):
      drm/xe/pm: Disable D3Cold for BMG only on specific platforms
      drm/xe/hwmon: Prevent unintended VRAM channel creation

Maarten Lankhorst (5):
      drm/xe: Make xe_ggtt_node offset relative to starting offset
      drm/xe: Rewrite GGTT VF initialization
      drm/xe: Move struct xe_ggtt to xe_ggtt.c
      drm/xe: Make xe_ggtt_node_insert return a node
      drm/xe: Remove xe_ggtt_node_allocated

Maciej Patelczyk (1):
      drm/gpusvm: Fix unbalanced unlock in drm_gpusvm_scan_mm()

Marco Crivellari (2):
      drm/xe: replace use of system_unbound_wq with system_dfl_wq
      drm/xe: add WQ_PERCPU to alloc_workqueue users

Matt Roper (44):
      drm/xe: Drop unnecessary goto in xe_device_create
      drm/xe: Move number of XeCore fuse registers to graphics descriptor
      drm/xe/xe3p_xpc: XeCore mask spans four registers
      drm/xe/xe3p_lpg: Add new PAT table
      drm/xe/xe3p_lpg: Add MCR steering
      drm/xe/xe3p_lpg: Add LRC parsing for additional RCS engine state
      drm/xe/xe3p_lpg: Disable reporting of context switch status to GHWSP
      drm/xe/xe3p_lpg: Drop unnecessary tuning settings
      drm/xe/xe3p_lpg: Extend 'group ID' mask size
      drm/i915/nvlp: Hook up display support
      drm/xe/xe2_hpg: Fix handling of Wa_14019988906 & Wa_14019877138
      drm/xe/xe3p_xpc: Add new XeCore fuse registers to VF runtime regs
      drm/xe: Stop applying Wa_16018737384 from Xe3 onward
      drm/xe/wa: Steer RMW of MCR registers while building default LRC
      drm/xe/reg_sr: Don't process gt/hwe lists in VF
      drm/xe/reg_sr: Add debugfs to verify status of reg_sr programming
      drm/xe: Add facility to lookup the value of a register in a default LRC
      drm/xe/reg_sr: Allow register_save_restore_check debugfs to verify LRC values
      drm/xe/mtl: Drop pre-prod workarounds Wa_14015795083 & Wa_14014475959
      drm/xe/pvc: Drop pre-prod workarounds
      drm/xe/wa: Document new policy regarding workaround IP ranges
      drm/xe: Consolidate workaround entries for Wa_16021867713
      drm/xe: Consolidate workaround entries for Wa_14019449301
      drm/xe: Consolidate workaround entries for Wa_16028005424
      drm/xe: Consolidate workaround entries for Wa_16021865536
      drm/xe: Consolidate workaround entries for Wa_18032247524
      drm/xe: Consolidate workaround entries for Wa_16018712365
      drm/xe: Consolidate workaround entries for Wa_14020338487
      drm/xe: Consolidate workaround entries for Wa_14018471104
      drm/xe: Consolidate workaround entries for Wa_16021639441
      drm/xe: Consolidate workaround entries for Wa_14021402888
      drm/xe: Consolidate workaround entries for Wa_13012615864
      drm/xe: Consolidate workaround entries for Wa_14019877138
      drm/xe: Consolidate workaround entries for Wa_14019386621
      drm/xe: Consolidate workaround entries for Wa_14019988906
      drm/xe: Consolidate workaround entries for Wa_18033852989
      drm/xe: Consolidate workaround entries for Wa_15016589081
      drm/xe/wa_oob: Consolidate some OOB rules
      drm/xe: Consolidate workaround entries for Wa_14023061436
      drm/xe: Consolidate workaround entries for Wa_18041344222
      drm/xe/xe2_hpg: Drop invalid workaround Wa_15010599737
      drm/xe/xe3p_xpc: Drop stale MCR steering TODO comment
      drm/xe/tuning: Apply windower hardware filtering setting on Xe3 and Xe3p
      drm/xe/xe2_hpg: Correct implementation of Wa_16025250150

Matthew Auld (3):
      drm/xe/uapi: disallow bind queue sharing
      drm/xe/migrate: fix job lock assert
      drm/xe/uapi: update used tracking kernel-doc

Matthew Brost (22):
      drm/xe: Reduce LRC timestamp stuck message on VFs to notice
      drm/xe: Ban entire multi-queue group on any job timeout
      drm/xe: Add normalize_invalidation_range
      drm/xe: Make usm.asid_to_vm allocation use GFP_NOWAIT
      drm/xe: Add has_ctx_tlb_inval to device info
      drm/xe: Add xe_device_asid_to_vm helper
      drm/xe: Add vm to exec queues association
      drm/xe: Taint TLB invalidation seqno lock with GFP_KERNEL
      drm/xe: Rename send_tlb_inval_ppgtt to send_tlb_inval_asid_ppgtt
      drm/xe: Add send_tlb_inval_ppgtt helper
      drm/xe: Add xe_tlb_inval_idle helper
      drm/xe: Add exec queue active vfunc
      drm/xe: Add context-based invalidation to GuC TLB invalidation backend
      drm/gpusvm: Force unmapping on error in drm_gpusvm_get_pages
      drm/gpusvm: Allow device pages to be mapped in mixed mappings after system pages
      drm/xe: Pack fault type and level into a u8
      drm/xe: Avoid touching consumer fields in GuC pagefault ack
      drm/xe: Convert GT stats to per-cpu counters
      drm/xe: Do not preempt fence signaling CS instructions
      drm/xe: Split H2G and G2H into separate buffer objects
      drm/xe: Avoid unconditional VRAM reads in H2G path
      drm/xe: Move LRC seqno to system memory to avoid slow dGPU reads

Michal Wajdeczko (35):
      drm/xe/vf: Reset VF GuC state on fini
      drm/xe/pf: Fix typo in function kernel-doc
      drm/xe/pf: Simplify IS_SRIOV_PF macro
      drm/xe: Promote relaxed_ms_sleep
      drm/xe: Move exponential sleep logic to helper
      drm/xe/guc: Limit sleep while waiting for H2G credits
      drm/xe/guc: Drop redundant register read
      drm/xe/guc: Wait before retrying sending H2G
      drm/xe/guc: Allow second H2G retry on FLR
      drm/xe: Keep all defaults in single header
      drm/xe/configfs: Use proper notation for local include
      drm/xe/configfs: Always return consistent max_vfs value
      drm/xe/pf: Define admin_only as real flag
      drm/xe/configfs: Add sriov.admin_only_pf attribute
      drm/xe/pf: Fix sysfs initialization
      drm/xe: Move xe_root_tile_mmio() to xe_device.h
      drm/xe: Promote struct xe_mmio definition to own file
      drm/xe: Promote struct xe_tile definition to own file
      drm/xe: Drop unnecessary include from xe_tile.h
      drm/xe/configfs: Fix 'parameter name omitted' errors
      drm/xe/vf: Allow VF to initialize MCR tables
      drm/xe/pf: Expose LMTT page size
      drm/xe/pf: Add locked variants of VRAM configuration functions
      drm/xe/pf: Add functions for VRAM provisioning
      drm/xe/pf: Allow to change VFs VRAM quota using sysfs
      drm/xe/pf: Use migration-friendly VRAM auto-provisioning
      drm/xe/tests: Add KUnit tests for new VRAM fair provisioning
      drm/xe/pf: Don't check for empty config
      drm/xe/pf: Prefer guard(mutex) when doing fair LMEM provisioning
      drm/xe/pf: Skip VRAM auto-provisioning if already provisioned
      drm/xe/pf: Add documentation for vram_quota
      drm/xe/pf: Use explicit VRAM BO flag for VRAM provisioning
      drm/xe/pf: Don't force 2MB VRAM alignment
      drm/xe/pf: Don't use LMTT page size if no LMTT
      drm/xe: Don't expose display modparam if no display support

Michał Winiarski (1):
      drm/xe/pf: Fix the address range assert in ggtt_get_pte helper

Nakshtra Goyal (1):
      drm/xe/xe_query: Remove check for gt

Nareshkumar Gollakoti (2):
      drm/xe: Prevent VFs from exposing the CCS mode sysfs file
      drm/xe: Mutual exclusivity between CCS-mode and PF

Nathan Chancellor (1):
      drm/xe: Move _THIS_IP_ usage from xe_vm_create() to dedicated function

Niranjana Vishwanathapura (2):
      drm/xe/multi_queue: Enable multi_queue on xe3p_xpc
      drm/xe/multi_queue: Protect priority against concurrent access

Nitin Gote (2):
      drm/xe: derive mem copy capability from graphics version
      drm/xe/xe3p_lpg: Add Wa_14026781792

Pallavi Mishra (1):
      drm/xe/tests: Fix g2g_test_array indexing

Piotr Piórkowski (2):
      drm/xe/vf: Avoid reading media version when media GT is disabled
      drm/xe: Force EXEC_QUEUE_FLAG_KERNEL for kernel internal VMs

Raag Jadav (3):
      drm/xe: Update xe_device_declare_wedged() error log
      drm/xe/bo: Redirect faults to dummy page for wedged device
      drm/xe/lrc: Refactor context init into xe_lrc_ctx_init()

Sanjay Yadav (1):
      drm/xe: Use DRM_BUDDY_CONTIGUOUS_ALLOCATION for contiguous allocations

Satyanarayana K V P (3):
      drm/sa: Split drm_suballoc_new() into SA alloc and init helpers
      drm/xe/vf: Fix fs_reclaim warning with CCS save/restore BB allocation
      drm/xe/sa: Add lockdep annotations for SA manager swap_guard

Shekhar Chauhan (3):
      drm/xe/xe3p_lpg: Add support for graphics IP 35.10
      drm/xe/xe3p_lpg: Add initial workarounds for graphics version 35.10
      drm/xe/nvlp: Add NVL-P platform definition

Shuicheng Lin (19):
      drm/xe: Skip address copy for sync-only execs
      drm/xe: Unregister drm device on probe error
      drm/xe/gt: Use CLASS() for forcewake in xe_gt_enable_comp_1wcoh
      drm/xe/configfs: Fix is_bound() pci_dev lifetime
      drm/xe/nvm: Manage nvm aux cleanup with devres
      drm/xe/nvm: Fix double-free on aux add failure
      drm/xe/nvm: Defer xe->nvm assignment until init succeeds
      drm/xe/query: Fix topology query pointer advance
      drm/xe: Fix kerneldoc for xe_migrate_exec_queue
      drm/xe: Fix kerneldoc for xe_gt_tlb_inval_init_early
      drm/xe: Fix kerneldoc for xe_tlb_inval_job_alloc_dep
      drm/xe/mmio: Avoid double-adjust in 64-bit reads
      drm/xe: Make xe_modparam.force_vram_bar_size signed
      drm/xe/sync: Cleanup partially initialized sync on parse failure
      drm/xe/sync: Fix user fence leak on alloc failure
      drm/xe/guc: Accumulate CT H2G retry sleep budget
      drm/xe/guc: Refine CT queue checks and log formatting
      drm/xe/configfs: Free ctx_restore_mid_bb in release
      drm/xe/reg_sr: Fix leak on xa_store failure

Sk Anirban (1):
      drm/xe/guc: Add Wa_14025883347 for GuC DMA failure on reset

Thomas Hellström (5):
      drm, drm/xe: Fix xe userptr in the absence of CONFIG_DEVICE_PRIVATE
      drm/xe: Select CONFIG_DEVICE_PRIVATE when DRM_XE_GPUSVM is selected
      mm: Fix a hmm_range_fault() livelock / starvation problem
      Revert "drm/pagemap: Disable device-to-device migration"
      drm/xe/uapi: Introduce a flag to disallow vm overcommit in fault mode

Tomasz Lis (5):
      drm/xe/guc: Increase GuC log sizes in debug builds
      drm/xe/queue: Call fini on exec queue creation fail
      drm/xe: Wrappers for setting and getting LRC references
      drm/xe/vf: Wait for all fixups before using default LRCs
      drm/xe/vf: Redo LRC creation while in VF fixups

Tvrtko Ursulin (1):
      drm/xe/xelp: Fix Wa_18022495364

Uma Shankar (2):
      drm/xe/compat: Remove unused i915_reg.h from compat header
      Revert "drm/xe/compat: Remove unused i915_reg.h from compat header"

Varun Gupta (2):
      drm/xe: Add counter for invalid prefetch pagefaults
      drm/xe: Add prefetch fault support for Xe3p

Vinay Belgaumkar (6):
      drm/xe/ptl: Disable DCC on PTL
      drm/xe: Decouple GuC RC code from xe_guc_pc
      drm/xe: Use FORCEWAKE_GT in xe_guc_pc_fini_hw()
      drm/xe: Add a wrapper for SLPC set/unset params
      drm/xe: Add GSC to powergate_info
      drm/xe: Add forcewake status to powergate_info

Xin Wang (2):
      drm/xe: use entry_dump callbacks for xe2+ PAT dumps
      drm/xe: restrict multi-lrc to VCS/VECS engines

Zhanjun Dong (1):
      drm/xe/gsc: Fix GSC proxy cleanup on early initialization failure

 .../ABI/testing/sysfs-driver-intel-xe-sriov        |  31 ++
 Documentation/gpu/xe/xe_firmware.rst               |   3 +
 drivers/gpu/drm/Kconfig                            |   2 +-
 drivers/gpu/drm/Makefile                           |   4 +-
 drivers/gpu/drm/drm_gpusvm.c                       |   9 +-
 drivers/gpu/drm/drm_pagemap.c                      |  16 +-
 drivers/gpu/drm/drm_suballoc.c                     | 106 +++++-
 .../gpu/drm/i915/display/intel_display_device.c    |   1 +
 drivers/gpu/drm/xe/Kconfig                         |   5 +-
 drivers/gpu/drm/xe/Makefile                        |   1 +
 drivers/gpu/drm/xe/abi/guc_scheduler_abi.h         |   2 +-
 drivers/gpu/drm/xe/display/xe_fb_pin.c             |   5 +-
 .../gpu/drm/xe/instructions/xe_gfxpipe_commands.h  |  10 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h           |   6 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h               |  25 +-
 drivers/gpu/drm/xe/regs/xe_guc_regs.h              |   8 +
 .../gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c |  98 ++++-
 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c        |   6 +-
 drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c         |  61 ++-
 drivers/gpu/drm/xe/tests/xe_pci_test.c             |   8 +
 drivers/gpu/drm/xe/tests/xe_rtp_test.c             |   3 +-
 drivers/gpu/drm/xe/xe_bb.c                         |  59 ++-
 drivers/gpu/drm/xe/xe_bb.h                         |   6 +-
 drivers/gpu/drm/xe/xe_bo.c                         |   6 +-
 drivers/gpu/drm/xe/xe_configfs.c                   |  68 +++-
 drivers/gpu/drm/xe/xe_configfs.h                   |  28 +-
 drivers/gpu/drm/xe/xe_defaults.h                   |  26 ++
 drivers/gpu/drm/xe/xe_devcoredump.c                |   2 +-
 drivers/gpu/drm/xe/xe_device.c                     |  58 ++-
 drivers/gpu/drm/xe/xe_device.h                     |  16 +-
 drivers/gpu/drm/xe/xe_device_types.h               | 190 +---------
 drivers/gpu/drm/xe/xe_exec.c                       |   6 +-
 drivers/gpu/drm/xe/xe_exec_queue.c                 | 168 +++++++--
 drivers/gpu/drm/xe/xe_exec_queue.h                 |   2 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h           |  25 +-
 drivers/gpu/drm/xe/xe_execlist.c                   |   9 +-
 drivers/gpu/drm/xe/xe_force_wake.c                 |  46 ++-
 drivers/gpu/drm/xe/xe_force_wake.h                 |  11 +
 drivers/gpu/drm/xe/xe_ggtt.c                       | 375 ++++++++-----------
 drivers/gpu/drm/xe/xe_ggtt.h                       |  14 +-
 drivers/gpu/drm/xe/xe_ggtt_types.h                 |  60 +--
 drivers/gpu/drm/xe/xe_gsc_proxy.c                  |  43 ++-
 drivers/gpu/drm/xe/xe_gsc_types.h                  |   2 +
 drivers/gpu/drm/xe/xe_gt.c                         |  79 +++-
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c                |  44 ++-
 drivers/gpu/drm/xe/xe_gt_debugfs.c                 |  26 ++
 drivers/gpu/drm/xe/xe_gt_idle.c                    |  25 ++
 drivers/gpu/drm/xe/xe_gt_mcr.c                     |  30 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c         | 237 +++++++++---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h         |   4 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c        |   2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c        |   2 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c                |  89 +++--
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h                |   3 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h          |   4 +-
 drivers/gpu/drm/xe/xe_gt_stats.c                   |  64 +++-
 drivers/gpu/drm/xe/xe_gt_stats.h                   |   6 +
 drivers/gpu/drm/xe/xe_gt_stats_types.h             |  20 +
 drivers/gpu/drm/xe/xe_gt_topology.c                |  39 +-
 drivers/gpu/drm/xe/xe_gt_types.h                   |  22 +-
 drivers/gpu/drm/xe/xe_guc.c                        |  89 ++++-
 drivers/gpu/drm/xe/xe_guc.h                        |   2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c                     | 119 +++---
 drivers/gpu/drm/xe/xe_guc_ct_types.h               |   4 +-
 drivers/gpu/drm/xe/xe_guc_fwif.h                   |   5 +-
 drivers/gpu/drm/xe/xe_guc_log.h                    |   6 +-
 drivers/gpu/drm/xe/xe_guc_pagefault.c              |  18 +-
 drivers/gpu/drm/xe/xe_guc_pc.c                     | 152 ++++----
 drivers/gpu/drm/xe/xe_guc_pc.h                     |   6 +-
 drivers/gpu/drm/xe/xe_guc_rc.c                     | 131 +++++++
 drivers/gpu/drm/xe/xe_guc_rc.h                     |  16 +
 drivers/gpu/drm/xe/xe_guc_submit.c                 | 187 +++++++---
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c              | 242 +++++++++---
 drivers/gpu/drm/xe/xe_hw_engine.c                  |   6 +-
 drivers/gpu/drm/xe/xe_hw_engine_group.c            |   3 +-
 drivers/gpu/drm/xe/xe_hwmon.c                      |   6 +-
 drivers/gpu/drm/xe/xe_i2c.c                        |   2 +-
 drivers/gpu/drm/xe/xe_lmtt.c                       |  17 +
 drivers/gpu/drm/xe/xe_lmtt.h                       |   1 +
 drivers/gpu/drm/xe/xe_lrc.c                        | 291 +++++++++++----
 drivers/gpu/drm/xe/xe_lrc.h                        |   7 +-
 drivers/gpu/drm/xe/xe_lrc_types.h                  |   6 +
 drivers/gpu/drm/xe/xe_migrate.c                    | 125 ++++---
 drivers/gpu/drm/xe/xe_mmio.c                       |  10 +-
 drivers/gpu/drm/xe/xe_mmio.h                       |   7 +-
 drivers/gpu/drm/xe/xe_mmio_types.h                 |  64 ++++
 drivers/gpu/drm/xe/xe_mocs.c                       |   1 +
 drivers/gpu/drm/xe/xe_module.c                     |  44 +--
 drivers/gpu/drm/xe/xe_module.h                     |   2 +-
 drivers/gpu/drm/xe/xe_nvm.c                        |  61 ++-
 drivers/gpu/drm/xe/xe_nvm.h                        |   2 -
 drivers/gpu/drm/xe/xe_oa.c                         |  24 +-
 drivers/gpu/drm/xe/xe_oa_types.h                   |   3 -
 drivers/gpu/drm/xe/xe_pagefault.c                  |  31 +-
 drivers/gpu/drm/xe/xe_pagefault_types.h            |  20 +-
 drivers/gpu/drm/xe/xe_pat.c                        | 149 +++++---
 drivers/gpu/drm/xe/xe_pci.c                        |  71 +++-
 drivers/gpu/drm/xe/xe_pci_types.h                  |   5 +-
 drivers/gpu/drm/xe/xe_platform_types.h             |   1 +
 drivers/gpu/drm/xe/xe_pm.c                         |  13 +-
 drivers/gpu/drm/xe/xe_query.c                      |   5 +-
 drivers/gpu/drm/xe/xe_reg_sr.c                     |  76 +++-
 drivers/gpu/drm/xe/xe_reg_sr.h                     |   7 +
 drivers/gpu/drm/xe/xe_reg_whitelist.c              |  12 +-
 drivers/gpu/drm/xe/xe_ring_ops.c                   |   9 +
 drivers/gpu/drm/xe/xe_rtp.c                        |   8 +-
 drivers/gpu/drm/xe/xe_rtp.h                        |   3 +-
 drivers/gpu/drm/xe/xe_sa.c                         |  36 ++
 drivers/gpu/drm/xe/xe_sa.h                         |   2 +
 drivers/gpu/drm/xe/xe_sleep.h                      |  57 +++
 drivers/gpu/drm/xe/xe_soc_remapper.c               |   1 +
 drivers/gpu/drm/xe/xe_sriov.c                      |   2 +-
 drivers/gpu/drm/xe/xe_sriov.h                      |   7 +-
 drivers/gpu/drm/xe/xe_sriov_pf.c                   |  10 +-
 drivers/gpu/drm/xe/xe_sriov_pf_helpers.h           |   3 +-
 drivers/gpu/drm/xe/xe_sriov_pf_provision.c         | 119 +++++-
 drivers/gpu/drm/xe/xe_sriov_pf_provision.h         |   4 +
 drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c             |  85 +++--
 drivers/gpu/drm/xe/xe_sriov_pf_types.h             |   3 +
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c               |   2 +-
 drivers/gpu/drm/xe/xe_survivability_mode.c         |   4 -
 drivers/gpu/drm/xe/xe_svm.c                        |   8 +-
 drivers/gpu/drm/xe/xe_sync.c                       |  30 +-
 drivers/gpu/drm/xe/xe_tile.h                       |   4 +-
 drivers/gpu/drm/xe/xe_tile_sriov_vf.c              | 198 +---------
 drivers/gpu/drm/xe/xe_tile_sriov_vf.h              |   3 -
 drivers/gpu/drm/xe/xe_tile_sysfs.c                 |   2 +-
 drivers/gpu/drm/xe/xe_tile_types.h                 | 141 +++++++
 drivers/gpu/drm/xe/xe_tlb_inval.c                  |  35 +-
 drivers/gpu/drm/xe/xe_tlb_inval.h                  |   2 +
 drivers/gpu/drm/xe/xe_tlb_inval_job.c              |   2 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c               |  16 +-
 drivers/gpu/drm/xe/xe_tuning.c                     |  36 +-
 drivers/gpu/drm/xe/xe_uc.c                         |  10 +-
 drivers/gpu/drm/xe/xe_uc.h                         |   1 -
 drivers/gpu/drm/xe/xe_vm.c                         |  95 ++++-
 drivers/gpu/drm/xe/xe_vm.h                         |  10 +
 drivers/gpu/drm/xe/xe_vm_madvise.c                 |   7 +-
 drivers/gpu/drm/xe/xe_vm_types.h                   |  17 +
 drivers/gpu/drm/xe/xe_vram_freq.c                  |   2 +-
 drivers/gpu/drm/xe/xe_wa.c                         | 413 ++++++++-------------
 drivers/gpu/drm/xe/xe_wa_oob.rules                 |  39 +-
 drivers/gpu/drm/xe/xe_wopcm.c                      |  15 +-
 include/drm/drm_pagemap.h                          |  20 +-
 include/drm/drm_suballoc.h                         |   6 +
 include/drm/intel/pciids.h                         |  12 +
 include/linux/migrate.h                            |  10 +-
 include/uapi/drm/xe_drm.h                          |  14 +-
 mm/filemap.c                                       |  15 +-
 mm/memory.c                                        |   3 +-
 mm/migrate.c                                       |   8 +-
 mm/migrate_device.c                                |   2 +-
 152 files changed, 3890 insertions(+), 2016 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_defaults.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_rc.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_rc.h
 create mode 100644 drivers/gpu/drm/xe/xe_mmio_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_sleep.h
 create mode 100644 drivers/gpu/drm/xe/xe_tile_types.h
