Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD29BF918D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 00:44:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A819010E671;
	Tue, 21 Oct 2025 22:44:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KN+binjK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3699E10E66E;
 Tue, 21 Oct 2025 22:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761086657; x=1792622657;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=2e2nIcEUOWNb2SWPvXXdfP9AFbHn+pSFABNNeY/rcOI=;
 b=KN+binjKzL/lkktCs3fZ1I6htO2TJRwQGwgKd4zw4XIzsusw1QkjsIMn
 qbS5LOru8uJrBd+hp2CuEP+v7+vpgwFGNevEJbUb0yY0a1PLqPaZpFhvt
 nzpSIiPHImMWvx3lE18DQSTNb6GWHGfIjwkm66XFcPGQFZOfENgpdvsCe
 d+Smiy+QjQ0q6szeI4mlOtuwJdq+n15+Zo9ynwvfIlT7jmxTyWoY02NCA
 da6/B+H34sf7Rqj/N5/oXjqG8rlS2QFOZDe0okhZHzaUVk/E4rggj+Tgu
 ENYR3QFHmA673yCekANW+psF6I0tZTcNoCLgTEZySEC9J/zFpJ+lxuaT5 Q==;
X-CSE-ConnectionGUID: I45Cc1o8Qu6ECWlgUSWs2w==
X-CSE-MsgGUID: pzD2PpCKQ46bvOwE5y34iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80848966"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="80848966"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:44:17 -0700
X-CSE-ConnectionGUID: 6zhKNlcHRCOsKan9sPS6xg==
X-CSE-MsgGUID: ZBZFqYISSLGnM5oWwPJapA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="214345821"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:44:16 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 15:44:16 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 15:44:16 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.67) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 15:44:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gV5BtupyMmoo4SaF9kRxpFiamfYA2D3bpWRn4jOkzABUgumE0fS7QSQXq+s8EHhyCoA/GDCaxX8KNXETHhK8sNJqAi+Lel6Oi6hgwNoOsZ/xyi3ihO27dvs8JMnPAVNseWODA68+2fO0J+JRlBeHp3BAbYM9XuYROVCBMPDMGNSgfk8PUu1kifjDh0FD9uFiNoLUBWJB5q5zTQdoLdd5fDHIMuH1lQG6LUYyyQ3qYg8LvkdAI15TccnXTcSMHh141PPbAC1fnwDcE1EmvU5MkDtLa/xKr9VniyZLZ4ov4/TcbhDU7PVg1LqXfhYWdIKd78RxvV9XKCFPl+XBy1T7zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8F8hpDlliVaQXzLun9jozxyv7S9ZzMioHIw58J2dFi8=;
 b=SGfBcK3aNu4wuRxlZDksMoC5pH8HTpgQKB2V6ME+4IBwhVTQOxavfdO1dhGt+5Ar0Dt0LF1UtEDLXmZkwHzt4/yFeYkebtEqJkIYYGeqmn/Xce4tiCrOWgBd823WQQV4oL4ySp6JCjJA+bIFcnOfmFij9IKC8uaqZgrqql02P1Nrtg2opbDF+lB4g6X17cRgifS0tP4xpqTb65rRZDJeaPp3yuKhc7LShNL/sD0vJf5TjtgOdXGOBK9h/Y2Wd5GtAjQtda+iZ4xIqFpg/SBE5eHgbe6qDwG8O+7kgvOTexQr3gGvFyLw/23knvaxXLnOu188rbTIjGUWDJ2bZ94Zjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM3PPFF28037229.namprd11.prod.outlook.com (2603:10b6:f:fc00::f5f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Tue, 21 Oct
 2025 22:44:13 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9253.011; Tue, 21 Oct 2025
 22:44:13 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH v2 20/26] drm/xe/pf: Add helper to retrieve VF's LMEM object
Date: Wed, 22 Oct 2025 00:41:27 +0200
Message-ID: <20251021224133.577765-21-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251021224133.577765-1-michal.winiarski@intel.com>
References: <20251021224133.577765-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR06CA0220.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::41) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM3PPFF28037229:EE_
X-MS-Office365-Filtering-Correlation-Id: ce2d67c2-201e-4906-b4dd-08de10f35b7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cnZNc0dFYTNvNVNid2dvdTllcWo2T1NGZUgxMFl0MEVmVjVLU0lHNlhNeFJo?=
 =?utf-8?B?UlNFNmRXVm02UmY4WXBxbXFHY0ExbmtPU3ozYVhuYVNtRUwxbW42OC9BOWZy?=
 =?utf-8?B?RlVZY0kzc1lVZlpZc0FEV016Z3FremVNaE9Eajg0bkF4TytNZWRXK3FtUVJW?=
 =?utf-8?B?OGs1RFhTekFKY2FVRnduRFMzZm5SL0VOdGYzcGQ4OVgzWGJxTUVZSE42bFRu?=
 =?utf-8?B?TExmYy9iOENpNnRIbXpCdmxPSmpVWXJyUTg0RnlBN1NGbzcyckpVN1hZWXpP?=
 =?utf-8?B?dzRSWVZsbkJFbXR3cHVsdHBwZUNGOTNXQmpMVzhWaFdQVzdqazRRRy9PTDg0?=
 =?utf-8?B?WS9LRTRUU2ExM0RMK0VhKzArbHRiS1RNd3hKc3ZValB0Q3FQMVIvNWtuY2Fa?=
 =?utf-8?B?ZjhYa3BVNlplZ0lIUHBTcE1YWTJRMlhwY3BBcUpTYXpGcEQrWFRFd0d6YkxU?=
 =?utf-8?B?ZUM1Rzc3aWR5VEtXWFc0aTZsbzg1U0d5cThQNFlZaTdCblloUk13d0IrTjl4?=
 =?utf-8?B?clpDVXRDSkJYOGZCcGJFUDhRMlFUdjhKS0VnNDRvb05VaUdmSDNSZy82cDE1?=
 =?utf-8?B?MnhWOCtZZkhTU2FFQTBvYzRpRnMwd0JSUG0xamJuR1NKanlva0hsRGhmeUN2?=
 =?utf-8?B?SWtoRDVHSElkakp6QWdxWTZncXV3QUgvQjMyL2F3UEYxbUVXS2RqMFZIUHdh?=
 =?utf-8?B?bThaN3dJaklCMVhUdWZROWhOUFhSQjVuWlVEeGZPZ0hudUlyYkxaTlN5MVUy?=
 =?utf-8?B?MmxNQWJ6bGs0cXFPN0pUZStCSVhxYmlMU2hPeEg5ZjFkVmZLck14dFFJMTJo?=
 =?utf-8?B?R0ZDWm5lV2w0U3BKVVp1eWV4S0hHQXdwbXNIdGdjK0diSVY3Z0lKL3RubHdN?=
 =?utf-8?B?MzJQMng1b3JpM0tpNnVPTUlocFUxaVhkcXNmakE5bmJJNkFmUUNaUlJRcTVl?=
 =?utf-8?B?NG5HL1RScnVzZWJDUzUwQWRQc295VzNYWmR6K1F6MmVIOXFnRzA4MVFMVzhx?=
 =?utf-8?B?ZGtFSXdENjduMTVWbWhmTlFoTENZTmlBSVl5M0txeHlpdlJHdlFqQ21zSHM3?=
 =?utf-8?B?Qzh0bFFrYnhBZDBXVGxwVUVHVmZMYkthV3AyQm14SUJBOHhwRzhsdUdJeVJh?=
 =?utf-8?B?emwzUWNuWHkyS2NSUGtnWWZqMlVKTVVac0RiSCs3LzlmdXI5N1pJckZQUUc4?=
 =?utf-8?B?WFZPVzBNSGNGRGJpVUZ5LzdXVlNBSDZYRktsUUFZMFFkNkszSDdFWU5zZzc2?=
 =?utf-8?B?anQyMnFLamhQUytMYWExUjlNaGgzNDN6dGwzTlZSMG44OUhlT3RCZEIxTyty?=
 =?utf-8?B?dDBOeE4zblpzRlhBSUVJVDN3RXFZYnNVVm1KUVJaaEJQbC95UUR5Y2lUcTJP?=
 =?utf-8?B?VEZldEE1WnZxaHlqS3BFU1BsT2VvV2dzLy9jNE1KQXgzVzQzOU96MzRKclFR?=
 =?utf-8?B?cGg1eEpBUUtTUFZ3VWljampyU2NwZGNjTkd5RmVPQVZyMGJtYnJ3TDE2RXNB?=
 =?utf-8?B?cjRyMWc1OWNaMjFvRE1WcVBSUUtkano2d2swbjFwU2I5dFlBVGw2RGxNTjNT?=
 =?utf-8?B?STVERjFuc3FlcFlxa0pRUW9IenRxb2E2SytCMHZRM3ZhWjNCMWZjcHRhS1dx?=
 =?utf-8?B?ZkM2YXNLZzdzZ2lCSnp3dTh3dGlUTkUxWXNDSnRGZmxCTzl4OHdBb2JGbnpZ?=
 =?utf-8?B?TkQzd0JVQ05OUWduKzc3WHFHcEh2OUQ2ZkxsVmoyMVZrdGs4ZkQxclIzOFJP?=
 =?utf-8?B?Y21FY3NJUEp4U2VTOWhITnZSTUZKWjA2ckhkcVNNd0d4Tk5Bd1hid0FsYXdO?=
 =?utf-8?B?Rjk2MklySU9MSzdXZDAxZjNTN2lvejdSMzBVdDhyWmN1djVKcUY4bzhEaEdM?=
 =?utf-8?B?VG81MmhDTlh3TDk0WktmcFlaSytzZDVyS2xjcVFmZHRvVEY3OXlKMWlGR2Vk?=
 =?utf-8?B?ck5SNHFDNnY1RWp0Q24zM0VzN245Q0tsRjFFMmpITjR0dk1RNVgxb2FvdHNl?=
 =?utf-8?Q?EBkTbxdnMgia7xnQuZFYImFeToVaxI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkVqdTNXZ09sTkJHQXZKVUhQQlVoSzB2M0RlakRiRE1IZkYxZHNOY1ppd2l6?=
 =?utf-8?B?OHNUR2E2Yi91all4Q1pQQWF5QkFkWnNaZXlOSGRBbmpLQTZmVnVScXJkMWtB?=
 =?utf-8?B?Z1R0dkVEdVJ1NG82Ym5ibUt4cmd1QUhOOVpDaGRGNzVFSlNrdndtRXZod20z?=
 =?utf-8?B?dG1WREljS3o3MFV5bU56V3BQNmc3MUtQZzcvSzYyZEdYS0U0SFVCQVRMTVlE?=
 =?utf-8?B?SUlLdHVrUDVWWlZiY3E3S3hkanNBcWU5emZ2VkZXeE1vT054NkllY1VQa0Nt?=
 =?utf-8?B?citZOFNzamc0NWJiVEFFTm15NHRpWlNrZE1PTU9wZFoxcHBxZGVybVVtV2Yw?=
 =?utf-8?B?Z216dE9PeXZ6SjhGZkZzd2xQeFBhaFNGUmRiZTlWZUcyWUFZTERSdG9Helgv?=
 =?utf-8?B?YVRMZWp2K2ZWRE4yY0E0SjJrQVI2V1JkTWpDQjJ0WUlsV0VhMzhwOEhGQ3B3?=
 =?utf-8?B?YWMyOWp3TTMyTDhFT29FN214ZEx2YUlGc0Vzdk1TSlM2MWEya2NBZDlMQ0NV?=
 =?utf-8?B?b3VidE5ad1Z4NzRmL2pzVmFoYk40Qkp3VXFwcFhBMGkzV3gzMlhBRjJNTlZr?=
 =?utf-8?B?czEwc0lYRUVQN2Npc1piWDdhR0wzaC95djdsYTUxSGZFSzA5WW9qQVNnS0p2?=
 =?utf-8?B?R3QvcU9nLzlLQ2ErZUNCR0RVbldBVk14dnR2aXplWHl3VGVDYWdYbFl6ZFZI?=
 =?utf-8?B?MGhJK08yV29iNERQSUhLYjRzVFErblBkTGthdTBMNkc1dlA1RkZnelE0Yko3?=
 =?utf-8?B?dFQwTlBXMW9aM2xmTTNhcU9rUTRHYXQ1UHM0N0NSYi9xZ3VNTGI0RnBtQStG?=
 =?utf-8?B?SW1HNVFKZEtiTVVlNXdrdUx1ajBiZXRLbyt0UmM0RmRuRFZtbytKc0xaK3p1?=
 =?utf-8?B?WWcvU0N3alJOYWVQMVE3TWlvUFEyYVI0b05DZjQ4UVJiWmJMTVUxTm1MVG5n?=
 =?utf-8?B?UG5tTGpTUW5JYjVjbVpGOFNVOUpXOHFjakxua0hVcVVEWVBzYm1SZnI1cXpC?=
 =?utf-8?B?NlVRR3hSRjRzUmVxSHBVTzlCQnNXa0ora0xlKys1NUY4M3ZpT0hIRnVtN09h?=
 =?utf-8?B?ZHkrZWN6dGRLMHdoOGlRZ2U5MzNTRy9BU1NZK2FGaCtBR2YycWZWY0prWXhU?=
 =?utf-8?B?RDVDVzVIVjRNU2RodTZUdllReUxEQWZOemRGLzU0TzVzZ3E5NG9hZlN3NjdL?=
 =?utf-8?B?WTNlSFJVSHphbXc2SDZZMVhaUG1XeXJIcWNZeTYrbzdsUzl4cUhZcnlMWk9u?=
 =?utf-8?B?ejNwbStCY1lYOHNicUpnMXlxMmhJYklZbDBXMGl0MVlUSWdXa1FZS3JxSExz?=
 =?utf-8?B?eE9TWXRpVzFySmQvMlV6K2MzRXhWaEdqL3V2L0YyYkI1eld5VWJLbTJ4cGJt?=
 =?utf-8?B?eGxDWlN5M1dWbG9YRHFudTdZd0xOZlF2VXo5T1hSN0xoNkNhaGtMQzdLQ3Y0?=
 =?utf-8?B?bUYxY1dwRytHc0hKQ05NOXJlRjNFOGF3d2Y0TElZWklqVUZGNE03aW1Oc01w?=
 =?utf-8?B?K05sYVJ5OGRoTjd6bzgwSkZMTEJhTWdZcHdocnE2RW9SYTBUTkg3Rk8wWnhz?=
 =?utf-8?B?emxpTElSRXducUNTbEdNQzhmQjJCTGtpdDdIK1RxUTNvQ001bGNWMXdyaTgv?=
 =?utf-8?B?a2I1MG9jb1UwWFNkbVpwMEwwS2p5L3Z4UHBZZ2xYeGhSQzJOeXlzbGtsNFda?=
 =?utf-8?B?YnVrSjBJcWdFKzFPZkpLdjZIdG0xVURFNURscmdsMUF5dDdMSXVZS1hDZDFj?=
 =?utf-8?B?Wkd0Z215SkVsa2pzQlZsbXF2Mllnd0cxMTZWL1U4QnJQZzMrdjJzYWtXS2FQ?=
 =?utf-8?B?V3lHMlZNVGFuYlg2c2w3QlZpU0FjNUtXZDVVa1JNTm5LZ1RFK09RWWZzZ3Jq?=
 =?utf-8?B?MGdXT2xsNzY5eTZHUWp5dTVxNy9kTGRSWGFsWDVCZ2lpQUFTOTJRbUVVbmIz?=
 =?utf-8?B?WGdzdjFhZlp6WllNeGYyVmxWbDBUWmpqbXAySzNHcEcxdkpjeXh0VHhVRmJF?=
 =?utf-8?B?Y2ZNWGt5c0cvQ01nTmtXbENzenF1eWluT1NhMXlJQUdtVlArb1lYYU1OVmVB?=
 =?utf-8?B?NWp4RnFIeUhRTmZEVnlVbmtSeTB0eE1EMlM4RU9wZi9xRTA3c3YxdVY5c25T?=
 =?utf-8?B?cG1XZHVYeEwybVJxYVlEcVRVOEpqSmVSUHhpMmI0anFndEFTZ09qOS9nZmQ2?=
 =?utf-8?B?K3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce2d67c2-201e-4906-b4dd-08de10f35b7e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 22:44:13.2801 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bO0FNDgmEx6m7LdoV/QuGf0zb8a99odrzLapi4QVfB07XmDoRujaMiN9JrvnHlZYhBEM3NJ9r7tsOnqEfkhf/3HkD9S/bRQxt3wG+z5tB74=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFF28037229
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

From: Lukasz Laguna <lukasz.laguna@intel.com>

Instead of accessing VF's lmem_obj directly, introduce a helper function
to make the access more convenient.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 31 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  1 +
 2 files changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index c857879e28fe5..28d648c386487 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1643,6 +1643,37 @@ int xe_gt_sriov_pf_config_bulk_set_lmem(struct xe_gt *gt, unsigned int vfid,
 					   "LMEM", n, err);
 }
 
+static struct xe_bo *pf_get_vf_config_lmem_obj(struct xe_gt *gt, unsigned int vfid)
+{
+	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
+
+	return config->lmem_obj;
+}
+
+/**
+ * xe_gt_sriov_pf_config_get_lmem_obj - Take a reference to the struct &xe_bo backing VF LMEM.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function can only be called on PF.
+ * The caller is responsible for calling xe_bo_put() on the returned object.
+ *
+ * Return: pointer to struct &xe_bo backing VF LMEM (if any).
+ */
+struct xe_bo *xe_gt_sriov_pf_config_get_lmem_obj(struct xe_gt *gt, unsigned int vfid)
+{
+	struct xe_bo *lmem_obj;
+
+	xe_gt_assert(gt, vfid);
+
+	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
+	lmem_obj = pf_get_vf_config_lmem_obj(gt, vfid);
+	xe_bo_get(lmem_obj);
+	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
+
+	return lmem_obj;
+}
+
 static u64 pf_query_free_lmem(struct xe_gt *gt)
 {
 	struct xe_tile *tile = gt->tile;
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
index 6916b8f58ebf2..03c5dc0cd5fef 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
@@ -36,6 +36,7 @@ int xe_gt_sriov_pf_config_set_lmem(struct xe_gt *gt, unsigned int vfid, u64 size
 int xe_gt_sriov_pf_config_set_fair_lmem(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs);
 int xe_gt_sriov_pf_config_bulk_set_lmem(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs,
 					u64 size);
+struct xe_bo *xe_gt_sriov_pf_config_get_lmem_obj(struct xe_gt *gt, unsigned int vfid);
 
 u32 xe_gt_sriov_pf_config_get_exec_quantum(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_config_set_exec_quantum(struct xe_gt *gt, unsigned int vfid, u32 exec_quantum);
-- 
2.50.1

