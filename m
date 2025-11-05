Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C81C363E4
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 16:11:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0823D10E78C;
	Wed,  5 Nov 2025 15:11:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yb8vjU+K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3A3A10E78C;
 Wed,  5 Nov 2025 15:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762355500; x=1793891500;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=PPQAx4DeEJiFg2ORqs8oWjlULiyKgbS0+qQGGLDmU4U=;
 b=Yb8vjU+KxsZyT8wmDNSda6hXKMmXnbBFmJx9gdlDK+y17Z5KHpG+z0Tg
 WhxGg5JhDG4GvdKEw/BKlIApCeHYQcNZLtGfQqn2jHwOOVWS9fYeEgwFC
 G94OlaMK5+sw5rBJYARrtIZ/Nvpvpf13iy3l+MBza2Whhv/WL0GBDM9xR
 62HO6ZtPi+gRGM8mjLJy8M5CoEFM1RI29uggrFms28/z2yd10o+yp6Fru
 78OW2HrFycpg+3GG6YBZD06s/nYa+Zt3O5i465QFw62bezLLiqsjU8NXh
 +6JbcMJ8lqV7/ik18/gy4cKTuDUoxbF68ay+5J90PcmYmVUXyxmUKPsDy w==;
X-CSE-ConnectionGUID: KqXHFswrQdu+LENymT9IGA==
X-CSE-MsgGUID: skquceQKTUaMTraHTtx86Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="52041802"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="52041802"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 07:11:40 -0800
X-CSE-ConnectionGUID: CAGB2WqvTUWw8cEaNaY4oQ==
X-CSE-MsgGUID: zbYSSYPQSTqSOBbASowCVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="187426628"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 07:11:40 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 07:11:39 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 5 Nov 2025 07:11:39 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.17)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 07:11:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yh12YDKO0CgJSOFDJLpPzXnCKCl+WkaXTAdQtX/B+IuuJpW1/tvPTbRfQSA5HTgxrFPruC063aMArFgZq9Ww086YSX+Hd6IgL7otPTP9uf0IyOTZwS5j+xQ6EnqO9knIA4N7LygXdLdsYr5aETR42VVadzC7HJMAKBjcOPJZH+8Vr+Kwq/I+yAiNEC4/xp7XUwLREtpkcaMusCKI05tIZ0nyp0cO4CAIMHWfbyFqypS5dDPzyw02zlXpV6+uuYmP5V4wKEcsbUoN9VwPceJyQioohVgSXVEOen802ov5dg9EP1CWjAYBiCd/Xss2DtzPaSuZf63t6CLVGxL2d9qhng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1aDp9rQ7TgdszQJc0aFTs7fQW8DNiLThtbjj9Xt1hyY=;
 b=HV1OQoVSwl8BSadGaPe2zo+7c7tNz/lFLUJKX05NjeL3jbUj8MNNtFFlibVULjEmZu5VRu8VGymmsJYmUssJyxIAKEJpZvQWuy2Jsl8oGm9Uux57eobmTZIddpAjkl7PG+LlIfPo/oRrnuY428oUieIyqITtbEyRhURAsoQhIcUZ8ydqZdcLIXdOB7tkXfbBRZZmZ0aacnKZmnCf5Fr1rGjMbtC5Lsik7F3A9Hf0x45fHFodav/fpwAQzRpbGCxfQLaA+cxX6zZ5t5wsPBSX7GqicrRfy22YAo/f/Nyf+FBAaVYoFSus/v8Q19NT6rcmpTRKdCrJITwuQQnOqz+k+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH7PR11MB8123.namprd11.prod.outlook.com (2603:10b6:510:236::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.8; Wed, 5 Nov 2025 15:11:37 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9298.007; Wed, 5 Nov 2025
 15:11:37 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex@shazbot.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH v4 10/28] drm/xe: Add sa/guc_buf_cache sync interface
Date: Wed, 5 Nov 2025 16:10:08 +0100
Message-ID: <20251105151027.540712-11-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251105151027.540712-1-michal.winiarski@intel.com>
References: <20251105151027.540712-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:23::14) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH7PR11MB8123:EE_
X-MS-Office365-Filtering-Correlation-Id: c4ff0d73-8d00-4055-4e21-08de1c7d9d7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?djRTZkJOck9FYm45VG9MeUdQNStNSnRDNDVmMEd0KzNlSHdXcUtSUWRlckxs?=
 =?utf-8?B?TWdwKzIzdlYvbGViMHIwUnMwSmp2NkMxaXNHTXVqbzYvelIveUR3UG56dzVo?=
 =?utf-8?B?Vk9DVGZHL0E3eHpNekcrSWNRczEzeHljdHNGL1hDcHZkdi80aDB1c05TcjNY?=
 =?utf-8?B?K2hXZVlubWo1NVoyU1c0aDZVb2dEWGlHclJTeWo4R0VnTkFUZjFqd0ZIbFhB?=
 =?utf-8?B?SlkrM0hsYjQvREhlWjVEVkh3bDQ5azdjUlhEQnJ1dEN2bjYxMElXaGJocmh3?=
 =?utf-8?B?VlVVRTN0WmpwUHdkMmNHVnB2bUZqWi9ZQUc5MnpwZnN2T3JEWjJKT2YzMEMx?=
 =?utf-8?B?L1pDU2FVakNpVS9qcE9jcHhUaDVEVHovUXA5dk5JWUtTc0pSMmhlcDZiaHhI?=
 =?utf-8?B?Uk9QL1paVUF1bWIvVVFNbys0dG5ITkRLN3hBS0IxbXVyeDhzMHRMLzJySzFY?=
 =?utf-8?B?UE5JUVJkM2dEbjVmYzNiNG5uOUVycCtESm9TeHYwSXJzaFpPVkRjMWJXS3k2?=
 =?utf-8?B?Wnl3SWwyRGxYZlZyM2FHU2dnYTRTNWRnd2wydVRCNGF4cjRyMVFSVXhTa2Ri?=
 =?utf-8?B?VWFVOFZmR1B6QkRFS3RJYTk4M1lqb1FRcnVGTkFmOGNETzkxaGdGYVVHbFIx?=
 =?utf-8?B?QjJjRGpNY0FVRFpPZDlxa0ttUEpERWNRMmhLR0RkYWdwVTZ0M1NVZ3ZGb0ZF?=
 =?utf-8?B?bTZURHhTMWh6U3lDNjA5ZDhsc2pnb0QwU3F5NUMzYy8zaDdIMXhndDVzUlBE?=
 =?utf-8?B?Yk5xNUtzY2VsaTVGb05wUlVQU1JaQVNkYnhUQ2xKbXhHQVNGVjdLVGYrNW9a?=
 =?utf-8?B?QlNJRDZJdUJxUHcvbkhpdlZ4RFBGenVSWUFNMDkvTitnQVpsL3FoRSt0d3Nu?=
 =?utf-8?B?SkVmRVlYalJrSXdRWStIdnpFRWZHcFVJdjBWQ1JhRVorajVha1d2QzEyb09R?=
 =?utf-8?B?WHlHTEdNODB0dUdPNjA1WVdIdlJHckdkeS9IOHdyak1xV0ZIK1dKQzgyVnVz?=
 =?utf-8?B?TEZad04wT05SRVZZd1VLMlhvK1dxYkJtV09MVlM3Tm93cUdpU2trenBLZDRp?=
 =?utf-8?B?eGhybXVMNW5nalJvSE1USVVCTEJnQ3RTYzdHUHYwM2R4ajJrUVAvZk5qS3NI?=
 =?utf-8?B?UjdmUnlCbHlsMGdaci9UUEd5Q21JQTdSSlJnK3VYWkljN2NnWVZMWVUvMlFF?=
 =?utf-8?B?TTJOZzB0NWhoM1BWQjVacFJYdUNvUzBOa00xL0UwU1ovamVFVzVjeC8zdG5Z?=
 =?utf-8?B?Z1JPVDNDeVhyTWV4Zk9GaFkzRmExNEdkSzV2R0NtbndlR24rTk5vclVJWmdo?=
 =?utf-8?B?Tm1LbXRvaFZPNkxUQ1gzb0Zya2orbTZWanBlTWI4RzlpUU5lbm15dEQ1MER6?=
 =?utf-8?B?aDY1OWFOUGxGaGpDTFlFby80NFoyRFBYU1I1dzVGOXVSejY1azhaVThRd3lt?=
 =?utf-8?B?ZGVNYmN5Wkc0ck5lVEZqM1J1RERXbHZiWnR5TThES3hNZ1BlWm40K3BtQnpC?=
 =?utf-8?B?U0U0d21ZRmVXSmZMY1pJcFEzTDR6UVNaUjIzbkYwRGpZN3hEMzFQZmU3b1hY?=
 =?utf-8?B?L2I3QUNrNHJBSjJXbDkxS0ZGUU55Yk5meWFwdjFRWXQ3RkZSa0R6YzQ2T1dq?=
 =?utf-8?B?Y0hVMnljQ1NicjBKbEdRdm9BbEYwRVFvcWgxd3YwMmlPRHp2U2h5QWNrbHVI?=
 =?utf-8?B?K2Rob1RYVWZkbnh3WUJiOVhCUDRrczFhS2ZKdklVanRIRVFTbWMySHVGNVhj?=
 =?utf-8?B?ZjU2N09QaDR4YXBncmZ3UVZjME8xRnNxNzlFR3hXN2tJc1VYZ2liZkUxZXZX?=
 =?utf-8?B?eHY2OHhMMmY2RDVIVVNLdCtHWkl1RDNQcTJVaURnTlYyZ2hXUUNiRWJEMjBR?=
 =?utf-8?B?MHlKWjlROGJjbURQRmNzZW5SS0MxRGxiMmJ2Um5ReTVtckczMVc2MFJzQkYy?=
 =?utf-8?B?UEYzU2JjVHNlRzh6STJCOGhrRzY0Q25hK2tQMDBzeVAzdWNXajNKVE9QTGRu?=
 =?utf-8?Q?jha3fyeORXoH0Fi/wuZPrTB2+sKQEY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1VJQ1hVck9DdTBHZHJkcVpXWnY4VVIvcHR5L1VIUjR2VE56aU5PT21GdzNE?=
 =?utf-8?B?aDZBZjAzVzlENHJoTVFWanZwTUREaXBNOVlqRGgzcnVIRFBLWlp0Y0ZMNTkx?=
 =?utf-8?B?U3ZJd3BrWlowUDVUdmQxMVJjVDhWZW9zRVlFeU91WmZOa0JadnU5ZnNQSG5k?=
 =?utf-8?B?VTZWdzRCaTFKajJkdVFnUFVyR0NjUVg2b0lEdElxNzZDSGQ1WXhqQ0hmZ2ZH?=
 =?utf-8?B?b3habzQwUDhSZ21mOXoxS3ppRnI5SmtBRlhlZFBNYUFINzBLVGhEUm5QT2c4?=
 =?utf-8?B?eFFvSGxLaElSclQ5UlpWMUR5T1h4dmU2a0JrbUYwakthS2hwSVF1TFNuL243?=
 =?utf-8?B?YTJuRVpWd0VvNEd2RVBqb3hldk4xOWFIakR2bDFYdTVSYU5kWEJsbTB6ZlRq?=
 =?utf-8?B?YnVubmFMREIvVldoaTJwWkdJckwyRUlnc1pLWHZiRXF6TllFN2kyUWU3VWpW?=
 =?utf-8?B?V1NlTDAxenBFZ0U2ZkNIbGpPSVN2cGJkV043RmdZUUJkUng2alpsWWNsa3dG?=
 =?utf-8?B?R3NydTduTFA4ZzJObE0rVGtEeWV5em16Y1YrMHB6VHllcy96ZHNZSW84WHB5?=
 =?utf-8?B?ODIwamVFRnAwZk5KYjNQQklNZ2trL0txSG5CS0RWZXRZLzEwYm5May9HK2tE?=
 =?utf-8?B?R3dIejMvWFBmRzlaU1pzbWw5Rk5UYWNXQ2JBQ1lmK0RBWWgrUnp5bHZLTG9Y?=
 =?utf-8?B?cmJ6RTNBV3V5c0g5c0lJZ2pvbXRadEtQYUdmbGxUSTMxZUlnNnQxVjJoeC8v?=
 =?utf-8?B?Z2JIWExoZmZzODlBQmNoS0R1U0dnSVcwYXIrVElQdGVkNktaOEI5USsxeTVN?=
 =?utf-8?B?T2tmejNHOGxZMmV2bHM4amhCTkxtTHp1djB5S3dlVHQ0ekdJRS9XazRtQjNU?=
 =?utf-8?B?Z0tOZ0dRZ1lJblFYSUdvQ1AreDRjaE0yU3hXUS93bURBck9YenMvTTJPRFB1?=
 =?utf-8?B?U2JiOTk1UFVQZm03KzMyMXA1QU5janZ3TmlGeUFSRDYrUzZwMUtER2s3dTly?=
 =?utf-8?B?NUI5VTZXbkpUTVdITFdSeTQ2SFlVUmEyWWpYZnF1UGQ1dlNiOE1kS0wxbkNL?=
 =?utf-8?B?dk9FVk1MOW9NdjJrQnpGSVZBcDVUME56S3YxTmRucDBOamx1WVRJSnV5Nk5G?=
 =?utf-8?B?OEVGVERCeUxKOWNYc0ovdlRZUzVJUVByejlPdzBFNFdjRzFkQU5IaUxrekdn?=
 =?utf-8?B?U1RUclNKeDg5Sk1ML053TDNuc3NJbGk0MG1BZXZvQlpQVmF2aUVpVHFIM0pR?=
 =?utf-8?B?RVdIUjJaaU1nKzcxN0JaamNkbEZOL2xZSkpwc1RUQm1ZMzhWRTR5OWsrcnpp?=
 =?utf-8?B?ZVppQ2cxdEZUOEFRTGozZUxIbUhQNjBITUNFK1RPM1hTeVFpaUhUQ2hXRUNO?=
 =?utf-8?B?N01NTEYzRlQ3alRTamJlL0Q5b1FER1lPZjdPM0dzTmJPU3liM3FxTFRHZkVx?=
 =?utf-8?B?eEp6S29FMnVpcCtBSkZ1R21NTDFXaGVDTU1ZMWc0Y2pZeTUwWEhvMnJ0K002?=
 =?utf-8?B?ZVhLWWpNMUN6QVpKMDVqK1NpdGh4c1RCR2thNzZSRng5clIyNzdiODVkYWRW?=
 =?utf-8?B?V2ZldnJieXhEQ3FIOW5rQlJxTFRrT2RkWlBTUW5JQm5zOXJSZ1FwZ2g3K01o?=
 =?utf-8?B?cXZBWjM1VEo1RTIzaUdhcEpVd0pGYTArYjN6WXduSzlGRVVPYVN1NWRjZHZD?=
 =?utf-8?B?R0V5WHJhSzBlMTJvRjZYajdHVW0yc3VXYmFwWVpSODI0MjJ3TGRUdjJqaENn?=
 =?utf-8?B?WVF3SE9CclJpdDBlRXg0WnVtc0FTZTFack5QRWZkK1F2bnExY3FqSmdIVTdN?=
 =?utf-8?B?S3dGVHlFQnhEazgzU2pIMkNFWW5mSkhaWUs2Z1pZa0lrTGo3K3I5SEovOUpN?=
 =?utf-8?B?eTd0NFZiaXk2eGdwOTY4SWhpY3FGWWY3TXVBQTh5YzhURmM1OHdpUnppYXV1?=
 =?utf-8?B?UkFXREltcWVHcE11ZzdGYndTcnAxSWhLMnptS1dYVnM3alhPcmI3NXNYdEov?=
 =?utf-8?B?Zk9vNWg5UzRRdE50anBHQllsTlNhL3BBK2k3U2Evc2xaT1lLSVF2cm9zQ3d6?=
 =?utf-8?B?azhlVGZhU29sQjdKQ3hqUGsrV2xBQ05BWklFaEZPR0s3elpmVkt3M3RCZEgy?=
 =?utf-8?B?WEcxZm8wUVNYdXR1aHlxUHR1QWNNMFErWUtnWjdvakhoZGFuSHZiWVRBOGFZ?=
 =?utf-8?B?YlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4ff0d73-8d00-4055-4e21-08de1c7d9d7e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 15:11:37.5287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dgrgcHrS6pL86HXLvL9vtt+NmRtWwovrLlbV0GikuGiw+At7bqksVBoJWd4SgMRKg1jXOOMeKLK5KTkvuh5zEDWAUYVDQo7202T8+FHCwQg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8123
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

In upcoming changes the cached buffers are going to be used to read data
produced by the GuC. Add a counterpart to flush, which synchronizes the
CPU-side of suballocation with the GPU data and propagate the interface
to GuC Buffer Cache.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_buf.c | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_guc_buf.h |  1 +
 drivers/gpu/drm/xe/xe_sa.c      | 21 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sa.h      |  1 +
 4 files changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_buf.c b/drivers/gpu/drm/xe/xe_guc_buf.c
index 502ca3a4ee606..4d8a4712309f4 100644
--- a/drivers/gpu/drm/xe/xe_guc_buf.c
+++ b/drivers/gpu/drm/xe/xe_guc_buf.c
@@ -115,6 +115,19 @@ void xe_guc_buf_release(const struct xe_guc_buf buf)
 		xe_sa_bo_free(buf.sa, NULL);
 }
 
+/**
+ * xe_guc_buf_sync_read() - Copy the data from the GPU memory to the sub-allocation.
+ * @buf: the &xe_guc_buf to sync
+ *
+ * Return: a CPU pointer of the sub-allocation.
+ */
+void *xe_guc_buf_sync_read(const struct xe_guc_buf buf)
+{
+	xe_sa_bo_sync_read(buf.sa);
+
+	return xe_sa_bo_cpu_addr(buf.sa);
+}
+
 /**
  * xe_guc_buf_flush() - Copy the data from the sub-allocation to the GPU memory.
  * @buf: the &xe_guc_buf to flush
diff --git a/drivers/gpu/drm/xe/xe_guc_buf.h b/drivers/gpu/drm/xe/xe_guc_buf.h
index 0d67604d96bdd..c5e0f1fd24d74 100644
--- a/drivers/gpu/drm/xe/xe_guc_buf.h
+++ b/drivers/gpu/drm/xe/xe_guc_buf.h
@@ -30,6 +30,7 @@ static inline bool xe_guc_buf_is_valid(const struct xe_guc_buf buf)
 }
 
 void *xe_guc_buf_cpu_ptr(const struct xe_guc_buf buf);
+void *xe_guc_buf_sync_read(const struct xe_guc_buf buf);
 u64 xe_guc_buf_flush(const struct xe_guc_buf buf);
 u64 xe_guc_buf_gpu_addr(const struct xe_guc_buf buf);
 u64 xe_guc_cache_gpu_addr_from_ptr(struct xe_guc_buf_cache *cache, const void *ptr, u32 size);
diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
index fedd017d6dd36..63a5263dcf1b1 100644
--- a/drivers/gpu/drm/xe/xe_sa.c
+++ b/drivers/gpu/drm/xe/xe_sa.c
@@ -110,6 +110,10 @@ struct drm_suballoc *__xe_sa_bo_new(struct xe_sa_manager *sa_manager, u32 size,
 	return drm_suballoc_new(&sa_manager->base, size, gfp, true, 0);
 }
 
+/**
+ * xe_sa_bo_flush_write() - Copy the data from the sub-allocation to the GPU memory.
+ * @sa_bo: the &drm_suballoc to flush
+ */
 void xe_sa_bo_flush_write(struct drm_suballoc *sa_bo)
 {
 	struct xe_sa_manager *sa_manager = to_xe_sa_manager(sa_bo->manager);
@@ -123,6 +127,23 @@ void xe_sa_bo_flush_write(struct drm_suballoc *sa_bo)
 			 drm_suballoc_size(sa_bo));
 }
 
+/**
+ * xe_sa_bo_sync_read() - Copy the data from GPU memory to the sub-allocation.
+ * @sa_bo: the &drm_suballoc to sync
+ */
+void xe_sa_bo_sync_read(struct drm_suballoc *sa_bo)
+{
+	struct xe_sa_manager *sa_manager = to_xe_sa_manager(sa_bo->manager);
+	struct xe_device *xe = tile_to_xe(sa_manager->bo->tile);
+
+	if (!sa_manager->bo->vmap.is_iomem)
+		return;
+
+	xe_map_memcpy_from(xe, xe_sa_bo_cpu_addr(sa_bo), &sa_manager->bo->vmap,
+			   drm_suballoc_soffset(sa_bo),
+			   drm_suballoc_size(sa_bo));
+}
+
 void xe_sa_bo_free(struct drm_suballoc *sa_bo,
 		   struct dma_fence *fence)
 {
diff --git a/drivers/gpu/drm/xe/xe_sa.h b/drivers/gpu/drm/xe/xe_sa.h
index 99dbf0eea5402..1be7443508361 100644
--- a/drivers/gpu/drm/xe/xe_sa.h
+++ b/drivers/gpu/drm/xe/xe_sa.h
@@ -37,6 +37,7 @@ static inline struct drm_suballoc *xe_sa_bo_new(struct xe_sa_manager *sa_manager
 }
 
 void xe_sa_bo_flush_write(struct drm_suballoc *sa_bo);
+void xe_sa_bo_sync_read(struct drm_suballoc *sa_bo);
 void xe_sa_bo_free(struct drm_suballoc *sa_bo, struct dma_fence *fence);
 
 static inline struct xe_sa_manager *
-- 
2.51.2

