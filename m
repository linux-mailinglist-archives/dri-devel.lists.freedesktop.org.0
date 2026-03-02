Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wL1bA9s4pWnt5wUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 08:14:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7271D3B90
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 08:14:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9485D10E443;
	Mon,  2 Mar 2026 07:14:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xzn183x9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CAD4891CC;
 Mon,  2 Mar 2026 07:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772435672; x=1803971672;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Kpyc4kGB1XxfHJk6mAI0cRqE20rZymuyhhTpofeakR0=;
 b=Xzn183x9oG03iftHeCWWvOL4/VyS1aiQnjL819dNWSOBNFkeae8br93t
 eOwxxutFAOJK7vswo4mRp5MLGzNXCQwh51f2K5GsxD3RxdqPd6XTWJuq0
 pCFmMo70ex8YJmZbKzHKq1G0UuTlb57gHPPJ06SOdi0CGLmATB/pGOKAY
 uDi3ZL9tSe2RYzxTJNPpXg64aWmg4IUt28EneqnVa+j5V3T+OlRs+HCF5
 svw5vlpcFYhnjFzXzHE0oF5rR8BrneCLqvqc7KdBvWWUSmxgdGPbVIEDS
 R9kksXfLxB2Zspm1Rb4tp/3ju+rWh6xgn4B9em+2C4mgjCXfQUuRhA1zI Q==;
X-CSE-ConnectionGUID: UyDoUjgGTDKmcdVV1OgACg==
X-CSE-MsgGUID: tSraTF7LSUG1n1F1ivBXOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="84901876"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="84901876"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2026 23:14:31 -0800
X-CSE-ConnectionGUID: l7vEbd4xQEe+x8/rd+sQYQ==
X-CSE-MsgGUID: TTXh2BemQMeT2RLd6eNq4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="217466232"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2026 23:14:31 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 1 Mar 2026 23:14:29 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 1 Mar 2026 23:14:29 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.62) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 1 Mar 2026 23:14:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zVkAiz3FRu2b8EtUo4Som5f2Ueb1SfTp81Od8O96uRd3KvE4+cO2DufFdKk/eycjdIEa7Oh0QmhPYAYpzXBl06uDpgwufR1kQWFx6AEQ5NjbC6P4INBJio+RxmU3TmpZ3Mi4rsYBeBy0m9V5ZibhEpbtJTvTyi5dCcLJ9KsPAKGp7xA8WkaBJh61GSGZkXyG4kWYfs/FZwpg2oDLmu7NBR/WgCcqurx5F0tRvxj/x/eFDUh5LyHCEiDXUN3vEG30qX4vz+WURx8/zRNhMbxmVWqajzhSwtlkDcLHVUHtS+XwSmwpTT3WkFFOiA1K5Dc/aijgHPEnn+JgQ+aa2hrBZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VJB1G/oJQUS8Mun8gFrttZ9ZyV+RaccLeZDLA6q01V4=;
 b=pdMZfKuxmzNp7zW5aoaMrXkeWNRzRJRb4gH2bcX/GzO7GPv89NQAYfWpiT4W9n+G896v9cumgjMejguxBXni7TcakKVdDX9KnGotKmPrftuma4PvE6lhZNf5VQQgBM2MTzLGBGUgfA7Tf4qqv8VWUKuxivgP68YklFoybmCm5Yg3fTzfobZLnxWc6gUgMAqtGKtuD2KFh8TjFU+tASQkouviiWucyXFe6imekUxPhTQAzydbZxgGR75gLwqlUftNX+Nz4Fp9bApz1bySlgIeHPOAvKzu45hdYh69GKen5eCNGG+kMEQU1W/GPku8pkt4Z8uSC+YuRUn60HJToqg3iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB8986.namprd11.prod.outlook.com (2603:10b6:208:577::21)
 by LV3PR11MB8532.namprd11.prod.outlook.com (2603:10b6:408:1ae::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 07:14:27 +0000
Received: from IA3PR11MB8986.namprd11.prod.outlook.com
 ([fe80::e6f0:6afb:6ef9:ab5c]) by IA3PR11MB8986.namprd11.prod.outlook.com
 ([fe80::e6f0:6afb:6ef9:ab5c%5]) with mapi id 15.20.9632.010; Mon, 2 Mar 2026
 07:14:27 +0000
From: "Loktionov, Aleksandr" <aleksandr.loktionov@intel.com>
To: Yury Norov <ynorov@nvidia.com>, "Nguyen, Anthony L"
 <anthony.l.nguyen@intel.com>, "David S. Miller" <davem@davemloft.net>,
 =?iso-8859-1?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Andrew Morton
 <akpm@linux-foundation.org>, David Airlie <airlied@gmail.com>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, "Brost, Matthew"
 <matthew.brost@intel.com>, Paolo Abeni <pabeni@redhat.com>, "Kitszel,
 Przemyslaw" <przemyslaw.kitszel@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>, Yury Norov
 <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>
CC: Simon Horman <horms@kernel.org>, David Laight
 <david.laight.linux@gmail.com>
Subject: RE: [Intel-wired-lan] [PATCH v2 4/4] drm/xe: switch
 xe_pagefault_queue_init() to using bitmap_weighted_or()
Thread-Topic: [Intel-wired-lan] [PATCH v2 4/4] drm/xe: switch
 xe_pagefault_queue_init() to using bitmap_weighted_or()
Thread-Index: AQHcqeGoK6SipKfvIUWCl7guSt/W67Wa1J7w
Date: Mon, 2 Mar 2026 07:14:27 +0000
Message-ID: <IA3PR11MB8986015E455933582F922281E57EA@IA3PR11MB8986.namprd11.prod.outlook.com>
References: <20260302011159.61778-1-ynorov@nvidia.com>
 <20260302011159.61778-5-ynorov@nvidia.com>
In-Reply-To: <20260302011159.61778-5-ynorov@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB8986:EE_|LV3PR11MB8532:EE_
x-ms-office365-filtering-correlation-id: f2de65f0-a218-470e-c1b1-08de782b5729
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7416014|38070700021|921020; 
x-microsoft-antispam-message-info: 4qiKgtSk5o1DrtjRBpEg+V3OVZuMwvIe12QsXzLnO5JiMr+Cbj0Sytrnv6ZVKdBt1TMtVbYMxQfObnLA5BrzVZDbuEDRIBU5mURLx714WrhyWmsSL+/yaAD+gVHoMf7gl0Z23X7Gq9UzTKdnfIN1zXR1NmlCfb606EB1hFunJE1on78dP6421Z2Tvbbse2es+gzUtvZglng3J/0rJw4D4jgJT1QTRsqPbeqE3qRECbWbyYDNyRQWUZK8ziCD0kOowpGJqcSejBtBvMVN1qlFwMZikvFUI0ZY3Z3lZb+sJftGb6Ki9Xn6pCiR8L/l8xGDO05JynyJ7GPEoEWtGEyogB7iYZWcP1UEdkGg5mIem0l+WqYMcB0Qb350yMgotDcyWR3xWss5ogKfPm5YCuAj5zSJnZwzVvfaQqr1CLN2RVZinpEj0fDlPNScUjXU76aad0B2Z4xUOCgui+uylHGr3FJBk1A2e2iISNX84d3SXr14X7z8+KtfnvcPdAJVbsovKF3RCeCOHmR0Ut+R2F1bZO5jGD6bKzXb3y8WpL2QdqqNqT8BjOgrBacDbncyjP5oxZG69GgGMseQFyJv0wWaR86EcnDDNMEmdwXYfpFOB3WmGv3rqvXz2VnCfJhtZvn/2YgiwexCgmP74NEoI/ZbukJLoH+PMqmC4r4WKVAUAFaz5Qxm+9tDnOmrXhzRP1LnTQO28yTAVkfvItOM93OWjf9rrG9r6xTmTY5cNCqcNk1L4AvfMu4cYcaVVm5ZRIzMNnEVLwY71a/E8KyiE3a0KBETYZgCwgZyueQApaZNwI5ofspTXb1ebjSrOvbV5hQk
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB8986.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700021)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Ujv2D70J1UQOTNQj65wGhW+kkVx2W5qev7PxzET7OoReCZcuLaVvyZRNyb?=
 =?iso-8859-1?Q?8s+kr+aDStjqI8sVvYE938jRm2Kh0tmAD3qtSouKmXJOKEe9PB2X7GMy28?=
 =?iso-8859-1?Q?ubRPwUlT3yS5GflJvFSGM1wyBHz9tF62lGtmHVt1mtVnYOzLp3IBgnYOqF?=
 =?iso-8859-1?Q?ALksvAK9Nw4gP5QZjfsxkoSRTBKJBi1lP8uJz8Osbs2Czcz5suq8kdDNl4?=
 =?iso-8859-1?Q?0kMnzdaXiSWVkosi+Y21Evnn95yLDnqtXjKOppjlzvuvUREtRXYzPbqaUM?=
 =?iso-8859-1?Q?4k35uroZd+Brv+m11osE14rU6vZL9EMVXXf6JbQiEdV1jut1EMJXjs5OS4?=
 =?iso-8859-1?Q?RxTrNAzgH7B0rJmZs24RGiX1xY0k2dPxIZu9MHB62x210ii20vdYdPK2Qg?=
 =?iso-8859-1?Q?6VuzQtepW6Amn+G8CYvnk1KxY5El+uWlhjnLWgxAsveqmutdkGvk+IWbXq?=
 =?iso-8859-1?Q?KFk+jMd9F6IgEKUipwqSkU0nniXHaFIrXM9vtkRjS3FBElMvjoM3JaKN9+?=
 =?iso-8859-1?Q?zTnczFcQcOlVikbUq4BEw1IAIrYQlXjhAUWH+ctie0ImPxjUC/JhDYkDaL?=
 =?iso-8859-1?Q?+kRSfy1VRoKerMNQr6jHIHwbAO7ZvTcH4oiq8aKY30cwqfAzXnNhS+umLX?=
 =?iso-8859-1?Q?eICZiz9nIeXDkwoe28FXhMatTkJc4+qRc2rX0oL6RRtg+0Yc/Kej6xP3uA?=
 =?iso-8859-1?Q?Mlh1Yz8rBb2eJ6BHjcrIXQTxk1GvqhY9TslL9QmpcfXsVlVU6MyXa8wSqr?=
 =?iso-8859-1?Q?7eGVZvg81NjW316fyjxledNIET4EAx00Elys7zHbfx4YEmd+MSTIvegsj3?=
 =?iso-8859-1?Q?UZeMoDzoszUkidExIrFE72ML0rP+sKpz1/dQzXUmCgLar/INenq6jpwx46?=
 =?iso-8859-1?Q?UtAzgYZxUTg9BKbVQGc+q7UaBlUWB5Ne9/MDvl3eSF4MLkYjShtVUZU8YC?=
 =?iso-8859-1?Q?AOmsOsmcpccihnhaVhLQQp7x95QRb83qF1ci2T59bRZSm2wRaNwb820TD6?=
 =?iso-8859-1?Q?4pvWNUMbwEHDa8OM8+5EOeeg2pl5T25XkNnTNlan3taY228/9k4lSdhc96?=
 =?iso-8859-1?Q?8GqGu3r+oNaVw6id+2FftjBmb6KLTZLP1GoEqI4cTZil6S54oahZ1XFxMT?=
 =?iso-8859-1?Q?88qw/kgZizyDonB44nlcwoD9B3tQAUBUbyWkOckw3j7xTbdyINmVgtfls3?=
 =?iso-8859-1?Q?2YMLLhtOCpH02IMBW5ZZS2hN5J6otAeNsm8mSuJEsMOM+72XnKayO0Uj2+?=
 =?iso-8859-1?Q?/UtLRm9crrIoH5l8d9Ab60zRMMoFv0EUIkxN0qYpGWjGC7B3vlhiU6/AAu?=
 =?iso-8859-1?Q?yYMJ43EgHtb6KgRpUiUWpmeuFfGZsmj1ojjBbFx7TVR/ujGtueavyh8aEX?=
 =?iso-8859-1?Q?S5lpvFlIedYeVxhngJI6SxL6TXEGUBnYE32Ybtd4T/jsoOMmTBHGP9a0Wa?=
 =?iso-8859-1?Q?16Q7v6n8+wqfbkhdQTkygfXj3cAPzayxvXl6EvtYOYSQSZiKqDPuZxFKUv?=
 =?iso-8859-1?Q?1c108Tgk6HnY98m5+0q0TpXxi/aydPVimStNSfR1MISyOBFWYILBqa0NO6?=
 =?iso-8859-1?Q?zY0Wk+nFF1zwVcA18REB4Aw0iamG1abuUEG+8ABT3q0bWbrjjCFbh7eGCu?=
 =?iso-8859-1?Q?2ckE3AnH4wu7b5R3HJ0ofWm1jqGJlkJ76wMMSXK7dcCje/7XGPEuYlZe0+?=
 =?iso-8859-1?Q?z3290Prakk1KPj4tBMEpTqxuMD1PrEiptzr8doeOfmbayS/8eBD/owEfd5?=
 =?iso-8859-1?Q?v/5RX9QeTqHUwzcJWt9tIxc4kIfCE/DTy3sW7wokHvtSs5HbO39XZLzjCc?=
 =?iso-8859-1?Q?14H9jnZlBRc3EY6odaOwxtihqAryjJY=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB8986.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2de65f0-a218-470e-c1b1-08de782b5729
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2026 07:14:27.4097 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBYA1k7NJIvg6QQuY+SQDFe5srZZiGErv7vm7ccbCMevEWQiNvOZHUhTJ4BKBJDkDZOlyspP7NLUgA+HMh9k91+8+FkylXQn2nhNuPPQJhM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8532
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[nvidia.com,intel.com,davemloft.net,linux.intel.com,lunn.ch,linux-foundation.org,gmail.com,google.com,kernel.org,redhat.com,ffwll.ch,rasmusvillemoes.dk,lists.freedesktop.org,vger.kernel.org,lists.osuosl.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aleksandr.loktionov@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.994];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,netdev];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 7E7271D3B90
X-Rspamd-Action: no action



> -----Original Message-----
> From: Intel-wired-lan <intel-wired-lan-bounces@osuosl.org> On Behalf
> Of Yury Norov via Intel-wired-lan
> Sent: Monday, March 2, 2026 2:12 AM
> To: Nguyen, Anthony L <anthony.l.nguyen@intel.com>; David S. Miller
> <davem@davemloft.net>; Thomas Hellstr=F6m
> <thomas.hellstrom@linux.intel.com>; Andrew Lunn
> <andrew+netdev@lunn.ch>; Andrew Morton <akpm@linux-foundation.org>;
> David Airlie <airlied@gmail.com>; Eric Dumazet <edumazet@google.com>;
> Jakub Kicinski <kuba@kernel.org>; Brost, Matthew
> <matthew.brost@intel.com>; Paolo Abeni <pabeni@redhat.com>; Kitszel,
> Przemyslaw <przemyslaw.kitszel@intel.com>; Vivi, Rodrigo
> <rodrigo.vivi@intel.com>; Simona Vetter <simona@ffwll.ch>; Yury Norov
> <yury.norov@gmail.com>; Rasmus Villemoes <linux@rasmusvillemoes.dk>;
> dri-devel@lists.freedesktop.org; intel-xe@lists.freedesktop.org;
> linux-kernel@vger.kernel.org; netdev@vger.kernel.org; intel-wired-
> lan@lists.osuosl.org
> Cc: Yury Norov <ynorov@nvidia.com>; Simon Horman <horms@kernel.org>;
> David Laight <david.laight.linux@gmail.com>
> Subject: [Intel-wired-lan] [PATCH v2 4/4] drm/xe: switch
> xe_pagefault_queue_init() to using bitmap_weighted_or()
>=20
> The function calls bitmap_or() immediately followed by
> bitmap_weight().
> Switch to using the dedicated bitmap_weighted_or() and save one bitmap
> traverse.
>=20
> Signed-off-by: Yury Norov <ynorov@nvidia.com>
> ---
>  drivers/gpu/drm/xe/xe_pagefault.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c
> b/drivers/gpu/drm/xe/xe_pagefault.c
> index 6bee53d6ffc3..c4ce3cfe2164 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -285,10 +285,9 @@ static int xe_pagefault_queue_init(struct
> xe_device *xe,
>  		xe_dss_mask_t all_dss;
>  		int num_dss, num_eus;
>=20
> -		bitmap_or(all_dss, gt->fuse_topo.g_dss_mask,
> +		num_dss =3D bitmap_weighted_or(all_dss, gt-
> >fuse_topo.g_dss_mask,
>  			  gt->fuse_topo.c_dss_mask,
> XE_MAX_DSS_FUSE_BITS);
>=20
> -		num_dss =3D bitmap_weight(all_dss, XE_MAX_DSS_FUSE_BITS);
>  		num_eus =3D bitmap_weight(gt->fuse_topo.eu_mask_per_dss,
>  					XE_MAX_EU_FUSE_BITS) * num_dss;
>=20
> --
> 2.43.0

Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
