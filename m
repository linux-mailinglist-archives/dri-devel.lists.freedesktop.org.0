Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99ED9A5E7DC
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 00:00:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B365E10E2BD;
	Wed, 12 Mar 2025 23:00:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QFHHlpJ/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 416F810E1C3;
 Wed, 12 Mar 2025 23:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741820439; x=1773356439;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=qtnCioYzMCkom9EPC/STqqRZo/KsY0KgZyXS6FSiysc=;
 b=QFHHlpJ/7nG1ROuRfIq+dRhICIeHtPJ2DYTS5pgVbjiHYrIBtdM+B/jQ
 iKUmisG7XXQitY2oyCZKOG3lOPfhWTsJU3sX5/gMbvu0FgdmHo7CTASBe
 PvT1tbJfDx3oP4JGgv0uaR4Z5abuhDDodc8PZPG6upsrEeb5Bdq3JySxe
 gQqH5TW/pIVE3UxpKLF/y8nQekXXC0kIvsnQn6707XOpECEJbDO3jFyYO
 wSAdCTz8xDI4HsTGNEtXl4DzUKQ/goEHQCYEhkK2jKZrVqmhOJfiEKgKQ
 Mllf0M4RIZ+60KPw33UgQBJCpQe6N3rz3pO+n9s9WhujOpD7QpM4sKTP0 g==;
X-CSE-ConnectionGUID: S+CcJABOTUCveDLPAXlupg==
X-CSE-MsgGUID: 5EISD6vwTtOOOJ3t978CXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="43103750"
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; d="scan'208";a="43103750"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 16:00:35 -0700
X-CSE-ConnectionGUID: nHQvRjleRk+71qeDcOZhZQ==
X-CSE-MsgGUID: 0q1+Px1KSBSL4uTmvz7yjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; d="scan'208";a="151604445"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 16:00:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 12 Mar 2025 16:00:34 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Mar 2025 16:00:34 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Mar 2025 16:00:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CQgYaLqw3HCUjAngPkghZcXCOozcIwnW32pXmSnGxJuU4bHlxfJs+JdO1jXMkBCvEIOcSzHmbHLICgTy8iUQE9DrAhoSojKhgvIdSdpHFLvAKUAgjYGiJVyvnJMiHcCYdm2/1otBjHwUs/ZNFBrMw5WpoG3w/DwynqKish/HLGDQoWsOqrZA7lS3+TdwJuSvU0ASKnEvOvCkz+FTMKPr4jr1U7ZTvfYSwI/0vKIbzlGoY6qTV3Vk9baifUc8l/6wAIDZes2zeBeVMSTq8TsYH2/FRJtnTk6pTd52mzbEWka2QtulxMK+N3qQMYkCu2tJmWaxneqFNHJ/PXodfh73Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zU4+soR73AbeVtWJ9o1ctMXYyUuJ1z7e0Y6XZTGEFWw=;
 b=jeiKn2D+pSTfXvG5eV8JbC5DxfOsHYJ7tg5c6k7y7UJpCSaxqWjAv2qFH8fhXeN2nMXbIvPkfvjzIux7I/kjY6NncZyD6FDqiZnWzhKyXAWNy/802tOLpfziG0/QzsbsQVGaQMHtlW54OYfC/WsYDEkCYrYdQrbtJ4GCloYcGyVtMYSX5IBwOdumLwE4XFHf2f6mIiGxvHPtV6grj5NSa21c0m4KFphZVZEcVSHUtW/G+oZ/iLMWlZm4NL2Ro0H/nrheZmkcrW/pDf5R6lG5tKiwFUnNn3pgqsWzNI+EuyZbaYirxzcNb0hQnnuB6dPuJXGW/DAONbIM/7GpzP8haw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SA1PR11MB6735.namprd11.prod.outlook.com (2603:10b6:806:25e::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.27; Wed, 12 Mar 2025 23:00:32 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%6]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 23:00:32 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <linux-pci@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?=
 <kw@linux.com>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matt Roper
 <matthew.d.roper@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH v5 1/6] PCI/IOV: Restore VF resizable BAR state after reset
Date: Wed, 12 Mar 2025 23:59:44 +0100
Message-ID: <20250312225949.969716-2-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250312225949.969716-1-michal.winiarski@intel.com>
References: <20250312225949.969716-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI0P293CA0012.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::20) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SA1PR11MB6735:EE_
X-MS-Office365-Filtering-Correlation-Id: cdcdc688-0f49-4352-ec3b-08dd61b9b0e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OC9GS1BaNm9JbmRMQSsvSU5oZWRsd2t2RTNoeGpVNUpCYXd1UHpLVDJlK2Fn?=
 =?utf-8?B?SGRoM3JHdHFDcUQ4NnBlRXVHdG05RW83Y2lXS3drdVBUeGpBMGJhMkIreHcr?=
 =?utf-8?B?a1VGR3hYZTVGNUdnMXdXc05sWkhYZy9PWXJva1ZHSVpoSWlkRU9WUjBlWWw3?=
 =?utf-8?B?dW5ocWRIVVJVa202OFEwUTJXMkVPdUhHUmJGUmZSczc5c3hxQ0trZUExNDdQ?=
 =?utf-8?B?c0l2bUgzTTNQWXM1S0RpVG42LzFwb0hpQ1JzbWs5YTFIZE90Sml1M1hVU2Z1?=
 =?utf-8?B?OWF4di9kS21JSGdTdE8wa2N3WkY3MUwwS0FtbnlMYmhPRXIrcTVCOEdYRXBG?=
 =?utf-8?B?eHExOEV2dnJoWmRUekpPbmZtZ05DN1VFK2NOU2cyc2o1cGdJZytDWTRKSVVF?=
 =?utf-8?B?eTBYaXZQWUhrTVdYVEN1M09HbitoREFjcHRSUGVMb1N6R3JRTkx1aUZZZHZO?=
 =?utf-8?B?ZlhhM1RaWXpOdXI2RWswSnRKSk5BTk5hbWxVOVpvTmsrcy9rUmFRdXExOUpT?=
 =?utf-8?B?SVZwbmlKcitMMWM1VFdqYjU2ZTF1SHBDODNIV0FVamw4SWRCUUxjTkozMFpl?=
 =?utf-8?B?c0NpYUwxNlVlMHB0TXpVVjNEdVpPR1RtT0FGV0JXOEFZRlFMUEk5bW1mM1R3?=
 =?utf-8?B?dk1yeHlubzloMU54cGxiZ0FPclU4KzE0dDRrVHpOMlNPdzVRRlVPWDF5eFlK?=
 =?utf-8?B?T05ZNDc2NU53cUtOd2thWmVEejEra2NLUVNqQUJ6dk9nc1QvcXJxQThVaWtt?=
 =?utf-8?B?QmF5K2tJcEt0OW1QS28zazNac0J2ODRHWjFFdzM0dTd5bjNDekw0UmNUUEJ5?=
 =?utf-8?B?Mk1MdGh3VS9wdU5za2RZU2pjSHpvbXk2c1NTbjNKd3BSd0JpU3krcWxLZGlQ?=
 =?utf-8?B?TzB6S0d0MVlXblBiN3llR2phci9kV2xlcTJCcElZUHJsNDBFbHdXa1ZqSm04?=
 =?utf-8?B?eDVLZm4yK0hqenY4YVZUUlJkS0laa2l2MXdKa2EyQWR4VFNDYW1IbUs1RjhT?=
 =?utf-8?B?dVJnNUVWUzVJWmw0TlBXeS80Zmx0OVNnRTdNa3lYclRxdUF5Nk55WndPajJ4?=
 =?utf-8?B?Q21NZVlOUmZqdHVMMHpvOGNpeDZXTDZXVnpDUVhvc2k2WXQrbXY4cURpaGhF?=
 =?utf-8?B?dDFpOTJ0M3htRnVhRFd2VU5iaEFkRHEzb2xoTDBVaVhyTjdGVGJlUnYwNEE4?=
 =?utf-8?B?TE8rbkZHV2NHeXpiT0lJNUtrTzVROThjTW8yN1hMb0pKbTNQZmdMN05XR294?=
 =?utf-8?B?TURBWkN2a1puY0VVaUQ0TzVGYm9zTmJwVUhETkVPOEVMT0lxTTlEdGpoKzFY?=
 =?utf-8?B?cER5KytvLzJRQ1NsMFUybGdHbllvNzZ3K2RidE1OTlRnRWI1T1RTY0s1dHRZ?=
 =?utf-8?B?bWVjVFZ0MCtFcTd2YWtkazBWOXAzblJ6YzZvbG45dUJ5TGcxc3VOL3hNN05u?=
 =?utf-8?B?ejBIT3UyZHVoSTl5dldMZVZVTzJES2F2R2JveDhWODNEbDRqN0tjMVBOMEM2?=
 =?utf-8?B?YzBCTGtsNXZXK3RDbGxiQ1FXZ3BUT3pCMGlPa0tWdmdFczJoUU84ekZ5akEw?=
 =?utf-8?B?cUhxZHRNV1QvdU1BS2s2MUxndnVqQmJXMWdxSG9YdlBzemF4Z0M0VStnL1Mv?=
 =?utf-8?B?WEh4Ti9GYmRRalJNdkFtb0F6Z0tYYitlV1BUZUF1NHozbVdsN1VkeUtOZkgx?=
 =?utf-8?B?RFlYek9pQjlicHBLOUkzVGVjNCtKczJKU2ZiM2QyYVBzQTNrd1p4SURlcGtI?=
 =?utf-8?B?ekpwWm5vSWVONXFRMlN2ZU1BdExjQ3NLZzFzZldzeVZOc1JKcGN5NEcxOFds?=
 =?utf-8?B?MmhZd1VVT2Y4TTRtWWJHc3BueWVhZnlRTzJYc0lMWjZqcjZBMTNUa0dteFVS?=
 =?utf-8?Q?Wiiaw4ix1kW49?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emZMbUQvNEtGY3l5KzN3RUZ4YUJFTExpOE5BZ09GalJvdTFwOGlkcGVBZ1p5?=
 =?utf-8?B?YjUrd1d0amtBaG1Kek93Y2xZbTJEeE5icERpcnBMb3RWZlpmZDFhS0ZLZ3RP?=
 =?utf-8?B?NEhlekhCV2hFZ1NNS0FxV3FNOC9hcSs5SWFneXlCdFl4T3RpMTREcHhCazBU?=
 =?utf-8?B?RldsRDFQVnAvTTZvYmFWNHpqQWFaeHdUaHZHWWVMb1MvSm1kb0RrNy84N3lq?=
 =?utf-8?B?U0NLQTdQeG9kZlVORHFGVjF3WDVIdEN6STJ1TWxVcTIvdDI2MmVVQnNvMHJo?=
 =?utf-8?B?NC9mZ29HWGZCZVhHS1UwSytoWVp3ZTUydzcvWEtMQlpUczZrQy9PZzkycDdz?=
 =?utf-8?B?OVdOMFVkSnNtZUJseU5mSnBZUU14RkgxWTh4MkluYkxmUVRGcnBTbG04bldU?=
 =?utf-8?B?bzhzSmlkZC9GMExyRk5iZW81OEV4T1kxaVhZYnFQazV0L25VK3RRdVptYjNv?=
 =?utf-8?B?bTFwTlhlZDQzd1VCY09BMm5RV2dITzVmYzdpTnhBWCtzK3ZKREZjdzdaOGQ5?=
 =?utf-8?B?SDlSeHNkdk5KdFdTN2VQeER0ellrQ1FucWlWSE9SUjJoOVZKc29CRFFIWEF3?=
 =?utf-8?B?amFTS2hRVlpzc3YwU0d1bTBiMk9Qejl3ZlRCZU5jb0xHWk9QRXZTTEo4UTFk?=
 =?utf-8?B?MFcxd3BsaDJRUEhJcUtyZDU0NkFjWDRSS1lrTTdYL1VWQXY1TXorS3Y2SVFV?=
 =?utf-8?B?ZEVST3F4YnpuZWZHUTFjeWNSQUtoOElyRWc2WDhjQjRzUVk4VjJyWDhWbGsy?=
 =?utf-8?B?QWFDL1QzNk5GRGlOYzFEYWo2dGkrN1VXQVcrZHU2R0lWZ29oM0hSVGR4MEpC?=
 =?utf-8?B?VGxjam14TnZpK0cycVpiUXROcGVBVC9FTEJOVFpXWW9NaUNVbEhsNC85UmVZ?=
 =?utf-8?B?ZFEraXVvZVFRZDN3UlNDK1M4TWtjbFJEYzV2NnVOYXNGSWk0UUw1ZlBxMmhY?=
 =?utf-8?B?WUVZWE1rbE9qc1lNK3E2THQrQUFoNi9PdGlMWFNXL2Vod0dUZ0RkbHRCRWRi?=
 =?utf-8?B?OHp4WUhyc0hUMWJWbVp2SWMwOWtGemFSS3NERVVpRjdCMUVxbkJPK29PL0JD?=
 =?utf-8?B?NlpjUnpCaFhnUVlwTGRkRU1XbHJYQW0wY25TaktmNnJnVi9ORVJ4RTlmdjdJ?=
 =?utf-8?B?U1FPQ29FbFlyME9aOTRyejRycmliSnA1bUdpSGlORzdsdm9URGd0VDRSeXJH?=
 =?utf-8?B?aTVQT3FYZ0NnM09XSlBieTFRRTdhZVpiUkt3VXhHUVc3R08xelhUeFFkR0ox?=
 =?utf-8?B?ek9NakMxNHkyT2l4dlJKVDFXNGFoa0FzcERBdUd3ZXVBOGdYMTErcmx5YnpM?=
 =?utf-8?B?aG1OSFRoZ3g4ZTZrdWVaQTg0THpWcEdHSWpnWDZlTll4SUF3L3J1UjltYzJl?=
 =?utf-8?B?bVBMN3pYNVhjcnhSR1l1eWpqamZIN3JnNTlSQlNKYmdyZThNVGFaMWNzWEQ5?=
 =?utf-8?B?Q1VzTXdCV2VHWk4rbnFOaWN0cjVlN3lLdUZEdkxuMVIxVnhPRXVuN1VpSG5U?=
 =?utf-8?B?czJCdndoVFM5RlE0OTVYcno5TkRVV3c2My9YVkdsQ2pORFIvbnRqbGlhRGo1?=
 =?utf-8?B?SDY4UDdTd2lmNHFBU3lHcEtHV1pEQnBjOEl0VWxXVjFWQm9RK29LVzd6TWY5?=
 =?utf-8?B?Y1Z5d2FrWTJ3NStVZUVwQTljY1NDR2NwVktrdC9xRzVYTGNlTU4vS1hIaVEv?=
 =?utf-8?B?cGVDSU9mSDBSUmdNVGVLM25iandWZ1JLOW1pbmhraStkcE1rMk1GOWdrMFdJ?=
 =?utf-8?B?dGtsRnZmMHZoVyt4ZW9ObFdha2RUUGRRd0F4TnFwZGY5OEs4d1V4TEd1aHJT?=
 =?utf-8?B?aFpHWUhMeXpBdFloMWlpTzk0ekZUUG5pcS9YbmRNdE5IZENtUGErNDJMK281?=
 =?utf-8?B?RCt5OWF0M2V5WGc1Y3hwaW1uZjZocXMvdFUrVGlqZGJwUTFUSjRqQzlRS25k?=
 =?utf-8?B?bUgrTFYvc1g0dmxXVUNYSnF4SExSTGc1MDEvUnFucm5NOG90US9QdG96Tzk0?=
 =?utf-8?B?SVFEZHEzOWhiQkxZOEIwcnBYTXVFcFNFcW92SUJxTkp5YkpUMzRJWXRjanRE?=
 =?utf-8?B?WDZ1L1k1V1N2NUd3UnVYTzdXZzNCV3R2MEZuUjJpY0Fld1NPbk1XVXZzUnFD?=
 =?utf-8?B?L1dVSzVLeUNob3BELzFXR1BuVkhTb2V3c0hLN1Y4NlJZakRwbEtpbUZUSHFS?=
 =?utf-8?B?L1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cdcdc688-0f49-4352-ec3b-08dd61b9b0e3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 23:00:32.2175 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3xQMAcNwVmqicNT0lNKLDh7hq0s7EgJIOwgdhhlbpjTVWuwsB5ly5/bvC/i70ueGkhmaLKFalQTAUl6XynCC0PsazadpJ0QK34897ctYYfo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6735
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

Similar to regular resizable BAR, VF BAR can also be resized, e.g. by
the system firmware or the PCI subsystem itself.

Add the capability ID and restore it as a part of IOV state.

See PCIe r4.0, sec 9.3.7.4.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/pci/iov.c             | 29 ++++++++++++++++++++++++++++-
 include/uapi/linux/pci_regs.h |  1 +
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index 121540f57d4bf..eb4d33eacacb8 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -7,6 +7,7 @@
  * Copyright (C) 2009 Intel Corporation, Yu Zhao <yu.zhao@intel.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/pci.h>
 #include <linux/slab.h>
 #include <linux/export.h>
@@ -868,6 +869,30 @@ static void sriov_release(struct pci_dev *dev)
 	dev->sriov = NULL;
 }
 
+static void sriov_restore_vf_rebar_state(struct pci_dev *dev)
+{
+	unsigned int pos, nbars, i;
+	u32 ctrl;
+
+	pos = pci_find_ext_capability(dev, PCI_EXT_CAP_ID_VF_REBAR);
+	if (!pos)
+		return;
+
+	pci_read_config_dword(dev, pos + PCI_REBAR_CTRL, &ctrl);
+	nbars = FIELD_GET(PCI_REBAR_CTRL_NBAR_MASK, ctrl);
+
+	for (i = 0; i < nbars; i++, pos += 8) {
+		int bar_idx, size;
+
+		pci_read_config_dword(dev, pos + PCI_REBAR_CTRL, &ctrl);
+		bar_idx = FIELD_GET(PCI_REBAR_CTRL_BAR_IDX, ctrl);
+		size = pci_rebar_bytes_to_size(dev->sriov->barsz[bar_idx]);
+		ctrl &= ~PCI_REBAR_CTRL_BAR_SIZE;
+		ctrl |= FIELD_PREP(PCI_REBAR_CTRL_BAR_SIZE, size);
+		pci_write_config_dword(dev, pos + PCI_REBAR_CTRL, ctrl);
+	}
+}
+
 static void sriov_restore_state(struct pci_dev *dev)
 {
 	int i;
@@ -1027,8 +1052,10 @@ resource_size_t pci_sriov_resource_alignment(struct pci_dev *dev, int resno)
  */
 void pci_restore_iov_state(struct pci_dev *dev)
 {
-	if (dev->is_physfn)
+	if (dev->is_physfn) {
+		sriov_restore_vf_rebar_state(dev);
 		sriov_restore_state(dev);
+	}
 }
 
 /**
diff --git a/include/uapi/linux/pci_regs.h b/include/uapi/linux/pci_regs.h
index 3c2558b98d225..aadd483c47d6f 100644
--- a/include/uapi/linux/pci_regs.h
+++ b/include/uapi/linux/pci_regs.h
@@ -744,6 +744,7 @@
 #define PCI_EXT_CAP_ID_L1SS	0x1E	/* L1 PM Substates */
 #define PCI_EXT_CAP_ID_PTM	0x1F	/* Precision Time Measurement */
 #define PCI_EXT_CAP_ID_DVSEC	0x23	/* Designated Vendor-Specific */
+#define PCI_EXT_CAP_ID_VF_REBAR 0x24	/* VF Resizable BAR */
 #define PCI_EXT_CAP_ID_DLF	0x25	/* Data Link Feature */
 #define PCI_EXT_CAP_ID_PL_16GT	0x26	/* Physical Layer 16.0 GT/s */
 #define PCI_EXT_CAP_ID_NPEM	0x29	/* Native PCIe Enclosure Management */
-- 
2.48.1

