Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFFNDby4n2mKdQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 04:06:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CB91A0537
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 04:06:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1612C10E871;
	Thu, 26 Feb 2026 03:06:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HHj6f5O5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AF8F10E86D;
 Thu, 26 Feb 2026 03:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772075192; x=1803611192;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kzEj3QauW4DmouLTk1duaJbxpl/JObhk0JxLSPZC4wA=;
 b=HHj6f5O5xXE4mXHpC5egxzof6SRx0KEkGM/4stDATFbMbi38qSt7D/U/
 eUMBlQGxQ+HxAdnWulQ6+dVdO9gcWDK9ts1WUBsY5e9/gkn6a0B/tv+6Y
 IgZjcxtH1e9woHw8C09MeR4nQVIcLmfyykqrNsG7Uue6aCTcUNr6xmKFb
 aPWstO70JMgGtd7tLIkf45Bm+6XXbJpJewY+IISSdepym3g034Oevk41t
 8LevxBEH3sHCrn2WOkAiUc0FG5oLcj61Mcr5tVjZGsWMgzOYbuw7hgyw2
 3oGurGqYBG6jm6nPcwFTKf3kEdRkCNehUL/KZ7yLzxM48u05xxPVsgP+0 g==;
X-CSE-ConnectionGUID: pTCUAUD9S6+V+5zf86OZmQ==
X-CSE-MsgGUID: c1afogY8QvOdVCWMWChDAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="73197868"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="73197868"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 19:06:32 -0800
X-CSE-ConnectionGUID: r4GsRsCATkCIP0uMqSTBTg==
X-CSE-MsgGUID: yvFue4DVSZ6glMUoo6K+2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="221406498"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 19:06:32 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 19:06:31 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 25 Feb 2026 19:06:31 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.46) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 19:06:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wxjOFDHZcwthZo2Jh0im7mHe/56ErHrdOIBgXJVqGQHUCtXFYsi/63Qm8S5imjlFTAgGu8JpRdvRobh8bFIykaHDhvtxIhGfwU5b5aAPhVyQ5PMIxMrvcOz/s21bTW/P8GpUtpCmtOjqEJ5tRKucCZlXJO/DxONNgMlnQSOkRWuHrFBbZ/xxE8w8jmd3clWygL4GHuaAAY5AaSBvC0Sef7X0km6ZOUSNYam6aSgynCTIP3ARmximzvgBaqgkYRHRP7COomfgZWMDdosppGTagnFL+NcD2qeZNZRGokoGlb12REKzrzfieLsKysRkP3Gc3harHZrGvMTa2IauX4LVBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/KUPAcDqGTzgKRhZlobT/kkA8mfkt3FOnflp2m61fL0=;
 b=jO+0f3/X49dOCvROndBFhRcPJaQ9jgqr7vWQgNC7Y+oQywT6GRT9X0pWA8ZZ/jXdg/ShO/F0oZsxO93+NFl5D+qKSs9Kl33+w15eTJqebH3DBTHTX6IjNZcCAn23qJrbmw7gn+cyUV1/15v4Iih+AEXg0BbgPYNu+8TdIgsKJ+CNgFMAtvIINYdIyi6ocJMMsvPUXtbupzENgKOxZNxrjHLJLPqAIgPiUTaf9k0ycKL19TPs2EpUE+I/eIkj0pjZsfy3iC2C/tIcCvlY9zv6y4VLG9ciVGv9OHgTOuKJ8HP0n+nnyqW8SRhiq8+rrkNkqsFK5aF/scw/0I0j9VbqcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7378.namprd11.prod.outlook.com (2603:10b6:208:432::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Thu, 26 Feb
 2026 03:06:29 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 03:06:29 +0000
Date: Wed, 25 Feb 2026 19:06:25 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Yujie Liu <yujie.liu@intel.com>
CC: Alex Deucher <alexander.deucher@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Kenneth Feng
 <kenneth.feng@amd.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Patrik Jakobsson
 <patrik.r.jakobsson@gmail.com>, Danilo Krummrich <dakr@kernel.org>, "Philipp
 Stanner" <phasta@kernel.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Srinivasan
 Shanmugam" <srinivasan.shanmugam@amd.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, Sunil Khatri <sunil.khatri@amd.com>, Lijo Lazar
 <lijo.lazar@amd.com>, Asad Kamal <asad.kamal@amd.com>, Yang Wang
 <kevinyang.wang@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>, Tao Zhou
 <tao.zhou1@amd.com>, Gangliang Xie <ganglxie@amd.com>, Candice Li
 <candice.li@amd.com>, YiPeng Chai <YiPeng.Chai@amd.com>, Matthew Auld
 <matthew.auld@intel.com>, Luben Tuikov <luben.tuikov@amd.com>, Ville
 =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/7] drm/gpusvm: fix kernel-doc warning for
 drm_gpusvm_pages_valid_unlocked()
Message-ID: <aZ+4sZoTzX4C/P2T@lstrano-desk.jf.intel.com>
References: <20260226030038.1182961-1-yujie.liu@intel.com>
 <20260226030038.1182961-2-yujie.liu@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260226030038.1182961-2-yujie.liu@intel.com>
X-ClientProxiedBy: BY5PR13CA0017.namprd13.prod.outlook.com
 (2603:10b6:a03:180::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7378:EE_
X-MS-Office365-Filtering-Correlation-Id: a2ab73d0-60a1-4f6d-fe49-08de74e40943
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: oWqUAdtRbyfcGmnKBdEpD/VSLUqU5hER5OcBhuYu2GJU30rI2OAXSCyH24kVBeN53hXldqOU6zRtURQGHbSYQIHqaj56XLJMPMheBywNSVct7RogafDY3HmrxowhvcsN1OBrSB1i2PcxGOM6Tx4a6cf9rV9Q8oRzug4r4NVTYzLBB/nSzd3pUppYLCeZg6Uo4i0UEnrdx6WsWSAE9IU4A9l1flEqgustuTa+Eulehzl2maTEKLzZPUoisELHcOnddzgMPiVWufcikcScF8hVV8Y/b/3V0YrOBWk/xsy1H7p8IPV82hG0P6swNSGQFV3ReO6VhHCEjyKXSf+eD2PaNj65SChsTNeNgdBSfxyrzB/FDDgm1CagRoMXLIFbgBgnv2iOpjUAPl6aq2Ht8RUWisl9JG2NufRMgb+44vy56krjgqXrrd0/7+f/IwHXtIkPu7VBjyAZaV7DRNxuk7W9AS4HkdS9qihGEsDdL0kZXIzHeqy2+oPIgVmCmYq/hvtOKUkPOlVfeSZ+co7EN+feIh3Q/3OvB+B3WTaE4e3SFdCHATyIgW52gU1fniRw1EPI8id4EDlxCE4Q6Lk1HqeI0CWzX3XP2/k0hRS9Eq2BcbtebvE+PXcnOMFByARehBEF41RhRifJFlVvH+63T1LY+6VJvQLywHxTdeQQzk3cxGaZeCsFUUfah74KP5zI40E8fnoQX7bSUK/wabW2sc7y6MO1R0JfZcIicHU5UgdBaB4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BXSk8Z78Gx/vS3tMkFEbo3etZE87YJfJagH2kO+JRkBRpkZy1eUI66VOW3ol?=
 =?us-ascii?Q?QzeL2JPBZrTHJOX0JENipbcIrd3XwPh4LcQJBmsd0ujJo0qZ6LIqkgKcpwYS?=
 =?us-ascii?Q?o4hafQ3U6CplwK+SmmgCWC/sISjME0WzFaQVC0NjPa0P08A40LVzQMqqD1bl?=
 =?us-ascii?Q?2EanntdfxQxXSBV0krzjY11bnIYavUGeqzUxHK0s5CbqJBOs93BsPdQEaSsS?=
 =?us-ascii?Q?UYi62is3reqv7RqA92H0Ndnxn1NOFU3QDHDo9LArr1D2bYxK/UmWkdMq0qps?=
 =?us-ascii?Q?gKn6Gy6IL7Otk67Rt4QoSvCJSCKGWmJbXAmDoWr2evEa4FdR1/8kdfPQBIj+?=
 =?us-ascii?Q?scYUf+zOKG2OErJZI3tSXzeTnqrijwF6eGPiVszLVRXqCleKNzp1PXqMCMuz?=
 =?us-ascii?Q?rmCLn3oQflULqHBjEHFpYAMgRK7MGY5WlPEu/i7Rffg0RFoV1RpUfRMH2T1O?=
 =?us-ascii?Q?jFNQoN5xkMzTJUsOoPyy8Zf5Uwlij3VBdYAKj9OhCMTYeSxKv3tNSF+9y5bN?=
 =?us-ascii?Q?ffizMWH/dibqTZk1WLN7qBD1ubm5cwEwJ2MFbLhVOxnIFc9410fA1RexsOp5?=
 =?us-ascii?Q?TZdr+rWZKognqEAYp/71LJdrj4HEE0eKDmuecCCDZ+MOENH7sZKyiuDPuQKx?=
 =?us-ascii?Q?QIQYjPUHs93++iq0RBY/dZsU/D14D8lXwjZBstm/5OFcYFGxGxmqRi2ShsfV?=
 =?us-ascii?Q?D2f6664ZfbglcB1DdSQcFA/NWJun8HgwCOqnMH8zRE44nAhFOFk7zay+g368?=
 =?us-ascii?Q?YD4OOhJHpXde1OGvsK2wx8yWoZniujmQpZ1mXKHhAGb074p8rtKjiJ2qFdwH?=
 =?us-ascii?Q?LMiCSKKQ7OGdo+lap3LAuknocnrCNaCo33j7JWwfBaLMDxpF3jsNjqi08KZ3?=
 =?us-ascii?Q?dEI+4DutuIpdFt/khXpX/qBZmv0J09dZN2TeARi1Rg3J9v75VwyPoxfUokBL?=
 =?us-ascii?Q?x1AE+ColoVJbVgVMVJAuWJ7BVDm+PeglUirp5KaLNA2KFcXaUrEmaSW7yL5X?=
 =?us-ascii?Q?KXFJW5TCdYhaFeMc258BRS+0LfmUp0s8HlrdhqvdF57VBZKNq6u/cFJZVQ8N?=
 =?us-ascii?Q?Ff9w11q5XOnmy+4PuQ9yIrqi6XQ0DOctk3JX1WtKZ/l/U6RulF/WU/HW7wS4?=
 =?us-ascii?Q?kJFt5+uosCjaxszwgRq56FeEyJGpZNXl/VRBLECCPg9Yp/S9nJKq9lO5/kE0?=
 =?us-ascii?Q?inPytY8nVe6zvHGRnblm+IfzjR6oAnbAGgte67BewTVKuoN2BfOk/pv7W06V?=
 =?us-ascii?Q?Jm3Tg/GhVa623u1oadIh6BWUd6yIBUmUbXI49TshoqmCinlIJ6vWwIPsnOL7?=
 =?us-ascii?Q?esjyjxhDVIEinjqd1pDO55ZDhf6e/uWAemQeTeV0/Kztef1XJNalZW/1lb4Y?=
 =?us-ascii?Q?hqzLit/yMwfLxIugag/Y3YO+JeKQhzRgOwyC0eQwdNbzhtNAZMSlMC4kDF9f?=
 =?us-ascii?Q?FE4qU9rmaC/RK/vOCWepgpKShJvrGSuF+6SHXgmi6DUw1uln7aheDC0eN9l8?=
 =?us-ascii?Q?xDzwIr8lohaP/vu4FqaJ4xSF+2VkmM/RvvxraKvOX8Q2R6WTzsJPl9op0iE0?=
 =?us-ascii?Q?V4M1NeuWFdf0hwrXa6GCukOh/FekwazQr9wx9N1JeC14LughHLmZTzbBJswF?=
 =?us-ascii?Q?I9TnZ//HV2zdlyXdXBvFn4ONi/lsirzwzjY4UbGpnCv/rgbKz9+TZLFP4W0T?=
 =?us-ascii?Q?dcz+iI6yeGlYgTeWEAJER5hGlLC8WUlb0qoD4rArul9BRpuLeUSN8zpS1jI2?=
 =?us-ascii?Q?kCrHhQltTtB5aoqLrqF93b2ZVfuEuow=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a2ab73d0-60a1-4f6d-fe49-08de74e40943
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 03:06:29.2028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jRKdcIGZQ5ciaMpitihmxbMTZtr7QkOtvMlznCohLIdiA8978jEGrR4djyS3IDkLDwkNqVVcB8wiIJMxRBeIoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7378
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,intel.com,igalia.com,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,intel.com:dkim,lstrano-desk.jf.intel.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 91CB91A0537
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 11:00:32AM +0800, Yujie Liu wrote:
> Warning: drivers/gpu/drm/drm_gpusvm.c:1351 function parameter 'svm_pages' not described in 'drm_gpusvm_pages_valid_unlocked'
> Warning: drivers/gpu/drm/drm_gpusvm.c:1351 expecting prototype for drm_gpusvm_range_pages_valid_unlocked(). Prototype was for drm_gpusvm_pages_valid_unlocked() instead
> 
> Fixes: 6364afd532bc ("drm/gpusvm: refactor core API to use pages struct")

I fix this one already. Believe it merged yesterday.

74b6e83942dc drm/gpusvm: Fix drm_gpusvm_pages_valid_unlocked() kernel-doc

Matt

> Signed-off-by: Yujie Liu <yujie.liu@intel.com>
> ---
>  drivers/gpu/drm/drm_gpusvm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> index 24180bfdf5a2..93f7e594256d 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -1338,9 +1338,9 @@ bool drm_gpusvm_range_pages_valid(struct drm_gpusvm *gpusvm,
>  EXPORT_SYMBOL_GPL(drm_gpusvm_range_pages_valid);
>  
>  /**
> - * drm_gpusvm_range_pages_valid_unlocked() - GPU SVM range pages valid unlocked
> + * drm_gpusvm_pages_valid_unlocked() - GPU SVM range pages valid unlocked
>   * @gpusvm: Pointer to the GPU SVM structure
> - * @range: Pointer to the GPU SVM range structure
> + * @svm_pages: Pointer to the GPU SVM pages structure
>   *
>   * This function determines if a GPU SVM range pages are valid. Expected be
>   * called without holding gpusvm->notifier_lock.
> -- 
> 2.43.0
> 
