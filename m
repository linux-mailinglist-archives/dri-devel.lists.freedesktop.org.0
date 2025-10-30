Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 061CFC22439
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 21:33:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0465A10EA5C;
	Thu, 30 Oct 2025 20:33:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CZlgCybJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74B2510EA59;
 Thu, 30 Oct 2025 20:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761856391; x=1793392391;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=4FR5hdkf8mLI+JfOHm/AJ6RHShH6+nIJ3ePjD977uig=;
 b=CZlgCybJN2GYoHxFY+Gf6NsjUBZHzWN36mK/jdENJqBuZYNfJGEcGb2A
 IRZlFDJlxHr5bFi6SvqGNZvh4ngOglk4N77wDSz8xTypca+gfxG+lCXrT
 /Lu4KqLuTBqLi7/s2dXEZGIBgS8MsaU3b830+NbA+RvtJG5XC5IcRdoqz
 zNVSwasy/D673KRJCjWN2LmptB92mLxCUlW44a5zCP20Ke3p1dZ7s9Op3
 JgIwDelsUNmxo2fxKFnr4H+WYWDkHU/Dmll5kAqZjdA/DcNu5p2CNqPiD
 yVOABil5OC7QNwdAqELhBLoicx7NBgs6Sf+Rlq0bzSdcJb04fQ+ySpdvr g==;
X-CSE-ConnectionGUID: zClTBDo2T1i+AqnXNdBLWw==
X-CSE-MsgGUID: Bvc05JXqTmWboXigdALH7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="51583817"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="51583817"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:33:11 -0700
X-CSE-ConnectionGUID: sVPMs4RySMCQCZawRH6+AQ==
X-CSE-MsgGUID: SMvuLpUBQAOgcxHOSpXHUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="223284394"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:33:11 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:33:09 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 13:33:09 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.47)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:33:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jQmqLcjN0V7+uOaP7YkDgRP0NBwC7MK5pXJ/LFDZYzJVkCaZ/F+9Vh1ZB9Pz/dZu2fvSo66SErTmcmognyspHEM28rielInjzZ3NxWZuq4tCos47FP+4YKQ+bkO9pAEA8XnxneA1W8AbSn3CZCPli7wfi51CultcQl1qhOQrnaFoCFj6U5Ryj7bIOvx0f16ZuKTh03hR5QEVYMwVDMNVj+cqHaaO5F/vgAN+jHgs4KWfk36r4dwheMxlvb7z/z07yd1rKI+3GMgkWn7RB1lt+7/lQtb/lyHQFkTWWuisj8xvXgj+zlGYF4kQJ9NyUR9hJalCnZkZx/wsAQbfURFtYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gPIDXNHrvH0gQwsHq1u7nwWuceVbCx/rcMs3HdGxpC8=;
 b=fl2cBP0gMWO7+OwJqkwVnDQWygGkxTrriwDJfMRGbgbMOCfUlo5iI8cM/BcqchP1+tyuSOT6ARfc6XZEMv90HvOxpWwnZiZFlvRGVqwK958k5LVJGf9aP3G+VjY5r+4/L919eW7VswBugQe1DI9VwCxuTBlhEwGbTxCaGQBTf20vanlq6i4cR8VyBxkOv+sEUAeQCkM0j7uYnytmbbQIFuNydXyS9/bvgmd+/Q0Jl+x0Y57Clnw0qfYI09xP9/5XYjG1gzWV4RvzM+23XndsDQDk5Cw09cWj4oyEYbpnahjhA8b7H6YiFGev9/4czt1yN7ysT4+vdyZOQzFPevPD6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CO1PR11MB4817.namprd11.prod.outlook.com (2603:10b6:303:98::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.14; Thu, 30 Oct 2025 20:33:02 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9275.011; Thu, 30 Oct 2025
 20:33:02 +0000
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
Subject: [PATCH v3 13/28] drm/xe/pf: Remove GuC migration data save/restore
 from GT debugfs
Date: Thu, 30 Oct 2025 21:31:20 +0100
Message-ID: <20251030203135.337696-14-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251030203135.337696-1-michal.winiarski@intel.com>
References: <20251030203135.337696-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0288.eurprd07.prod.outlook.com
 (2603:10a6:800:130::16) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CO1PR11MB4817:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e6e71d1-c072-42da-8ed7-08de17f385d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eUNWVHJVTnV4L0FtajM5cTYyYzl6Y242YWRMc1UvOW1GK25Bb3VrbDUydmx2?=
 =?utf-8?B?YW96RFE5WnU1RncvSjRrLytOS1IycngyTTFVakpaZkJEOXRhUTRiaDhWVTIv?=
 =?utf-8?B?MXhNby9xYStrcTliZCtGQkljUHJCZHd2MEN6dDVSZUE1MXErQjJ4WWlycWJ4?=
 =?utf-8?B?QlVlTmIwc1RJUEN4eSs2YXpoL21hRW5DYnhnTUpxbE9nSlgreVdQaHR3Qjhy?=
 =?utf-8?B?bStvOG92OVM0WU9mVUpMS3VJT1Y5TVRmdzc0MEIzN0xXZXFnd1R5eVFwZThS?=
 =?utf-8?B?QTZyZSsvSHUxdWZjYThjVWJCbzYwZjkvRGIyT0VaZnVXVzk5bzd2dTEzcXBa?=
 =?utf-8?B?UDhWV25QZER4bDZTYUt6L1lTWWdkcG1JT0tVMUtvSGtYUkk0SmlLSjk2cGZF?=
 =?utf-8?B?WmdERk80M3ZuNkZVUFFLb0ZqZ3E5UXMxR25LZlViS1VUQ1BiaVJMK0dtR0dO?=
 =?utf-8?B?Tm1tL2JxeWpaZ3pkVFUwc0FCOU93blpaeDFwMEdkK3VlOXRlcC8zT3YvT3hH?=
 =?utf-8?B?K3dRY29JRUlFbklveVM2MElaMDc2emZMSXV4WmNuNU9uUGdMSkxsenAxeWNM?=
 =?utf-8?B?elRCTnhZY2EveUphb1FlakxYWS9lZVZCVVIybHhUcUdKQjZGekk0R05PMGp3?=
 =?utf-8?B?WkJ3K3pKQTdYQm5WWERqQW1iVDU2UUd2eGRaR0psVi9iQVdqRU9RZFBvM3Br?=
 =?utf-8?B?N01qVTgzYUJlTGQ0bnFpbXMyWmZIcFk4S3YrWVlvLy9DVjc5V2wxak9iUlR6?=
 =?utf-8?B?M2l3cmZjZmU3UVFxeVg5TTdYUy8xa0Qya21uWi9SYzRCdzduVDNlMVVKelBR?=
 =?utf-8?B?K0g4WGp2VFhGYW5reWFiT3ZYZFBrRnlzTXArU05vY3lMSjhRL3Y5c0Q3VzBP?=
 =?utf-8?B?OUdqUXZ4L21kZWxwZ1EyUVlNLzgvM2Y5TldpSFppUEJjTXBQT3dLcG5oMlMr?=
 =?utf-8?B?WElMckNKeFZYMXpGNXVPOGZGdXJVaTlEalVBYjU5am0yTXlHVWV0ZUVxTDQ2?=
 =?utf-8?B?eUtnQVh0VGxEOVRPSERSV2gwNWRIYmpkeHJ0V1kxRlFSNlVrdGJ3ZFUwL1Bu?=
 =?utf-8?B?dFNwSEpMeE5VTTRNTHhKNjNkTDc1NW9LZUp6UUdkcG5MTzVObkFMaGRWMnNG?=
 =?utf-8?B?YlZ0MEgxUVduUyt1RW9MdURIZjJZSDVGMU1XUnJYd2EzelR3cVd5Y1RYVlpl?=
 =?utf-8?B?UkhRNTE4cnVXUkxBZUVUU01xTU0xSjQ4WXp0UlErVjQwandHazFZUXVTdlZs?=
 =?utf-8?B?d2JrZzdZU3I1NlcrOU8vVlNEMWRGTkorQXRDM0czeGh0Z0s0S1JWSGJZVWhO?=
 =?utf-8?B?Mk4xS1BTdmpFb2RqNi9URjdBK2xjNWNhOEs3SzI4Z3ZlUklnekh2Tkh4bUY3?=
 =?utf-8?B?TlU0VTh2czh3bC9vaGdxUlBSbjhjM0FUeVFTZ1Qzd0VOZTZhcXBCbW1XN3BW?=
 =?utf-8?B?dWpEc0hwaVRjQmlyVjdQUDVHRkF6bUpTdmo2dG5QRkZTclVOMHM0dlZLaVp0?=
 =?utf-8?B?cFRScXVZOHI3TTJyeHZzYU9PTG1JTThFOXNkRmtHVE11bm1VdmJIZXRLeENr?=
 =?utf-8?B?OW9Nellvb0tab2xXU2xNS0Z5RTZJajNlVU1NcmFTOU01UTNlN1A0Sy9TaGJ2?=
 =?utf-8?B?VVJFVGpxcjhpYVJoRHg4VVhrN2lhWnJydFBNa2J2V0I1T3pLTWhPVXhjMktp?=
 =?utf-8?B?anhSQmtXQVJvR2srRjFzTnpXYU1WMmlvMlNUSnUxWER0MExUcXJUY0RYR1lm?=
 =?utf-8?B?V3V1akhiVVBDMU5aQkJkUS80TmhiL2gyaE1Tb3hMaW5ZaFRocUdaT1lmRHhF?=
 =?utf-8?B?QytCcE9McHBuajhaUUJVSWxvMER4Qm5NU1k3MUdlYXdPUEY5c2dPelU5TDB6?=
 =?utf-8?B?L1RJTjZxa1BQTjU4UjIxRDlHT0IzQVBCYjg3TWJrdmRXZkpHVDlnS08wOGZp?=
 =?utf-8?B?OE04YnhwUHZCREp2dVpoSU4zWDkzTllrcjRHcFgyZThkb0c2UFRscHpTb0Ix?=
 =?utf-8?Q?agTGreQns19qb6KlgSTicnOLdat02w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SURYazFVbnFIVjBDRHdZQkpGMDFoNTJIajVseENOU2V3MVo2bTlZZnhLNk1F?=
 =?utf-8?B?bG1yaitnSFJ5WnMzUWRBT1VCKytPWnNsUzhldWQ1SDh5aUpBRDlhU21GUXdj?=
 =?utf-8?B?Mm1ZYWpiK0dlMHBrQWdVbGxGeW9zbzVjek0xb2NtV3FsdG8zQ3FmeU4rWS9D?=
 =?utf-8?B?YmZMNGJNYkNNbnhNSU1GV0kxcjA5alZuUzI2NjBYSDZmMVpGWEsyV0JGWVhG?=
 =?utf-8?B?WHQ5U0lLeXpCbW8yRlRIVEE4bUhiTWNhaUFSbnZ1RTFsRGE4M1pnZTdMZzl1?=
 =?utf-8?B?VFdtRDExbjJUUTJsdUFGV1AxM2IwNkFSTFEzSzVDeHJqQTZ4ZjZ5UXdkM0F1?=
 =?utf-8?B?M1lRQ0FEcDJ5eS9zRFRwOXB3WDZsTlZkdGxCc2NBck9EZWJlUXRtbi9sKzFM?=
 =?utf-8?B?ZGgveVNSeTMwbEFSWkNvb3JRTm5RTEV3MWhuL2pPVHVUQmtyNWtWenhtVjRa?=
 =?utf-8?B?MHAwaHlWcU5sc1BtK3ZwMTFaZzcyczR6c1hxdmNObmhKcEpxbWYrMEh3ZW5L?=
 =?utf-8?B?YkJqTHlxeFRKbnRZS2hrNG5MVkV2eHVzYWhiY3lJVG5DVFRJNUNkK3FqY3NL?=
 =?utf-8?B?K1ozTzRWQk1JNXRaSTJMYVpaY1p6dFUxSHhMaTFHVFZmQXJ5RzA0L0pKRzZ3?=
 =?utf-8?B?UFhGUWVNVGJNdWFLUVBaeDFXMlhiQjdQVm5vbkxpOXhXMjY3VlY1S0kxWWFB?=
 =?utf-8?B?WnJLcVkzZ3F3bHk4bzYrQlNUdUxmRVVWWUdxRnA0KzVVbDNPQlQweDl5NUlH?=
 =?utf-8?B?angzRVV3TXVFSHMxU1pRaFZIaDl0bUJweEdyY01oK2JYcC9ZOFYycjBBNUR2?=
 =?utf-8?B?Vmx5RStCYmF5UE5LMkJCeFk5eFhKVXZWd1Fkdk81WXMxSWVBaDFveVlaNDQ4?=
 =?utf-8?B?OUpiWjJwTWExWUFuSEp6YkRCM2RBWGczSnJ4bWdyUkh2Ty9UY0JPVUd1b0No?=
 =?utf-8?B?TmF2S1VIYzQ3ZzhTdTA3WUQybDFCRnhwNEh6dVRBYTFWZ3FEOHhIYzNzelFr?=
 =?utf-8?B?MVI1RzBVelg3am8zOGxHUEYwampoeUZQVkwxK0dHSWFOcThmSDBNcGJ2bEZn?=
 =?utf-8?B?OXBBcDNYQlNQZTZPRUtrWHFkNVo2cUtLQ0draXVxUzdqUE51MVFxZW1oNWJ2?=
 =?utf-8?B?UmlaRDFsK2c5ZWlvYWdVUUVqZndiM2Z3czZJVktleC91WTYxSitsYy9IcVRp?=
 =?utf-8?B?RmNZR2puQm5TeFRoRkZTeTRBNkU0Mi9kREtKM21RVEhPaW94ZmloVzY0RE50?=
 =?utf-8?B?bG53bm42eEptVjU3KzNwSUFPaUIvY29EZHhoazQ4TG1ZZllsSW9sOHJOcE0y?=
 =?utf-8?B?SHZHN09hNG9pL1ZSZzlrSllHYlBXdzQ2SG9iUUE2WWtIcmFGTjRNMVhBMk1t?=
 =?utf-8?B?V05JQUVLdk9abUF5WmRMU0FhSjE4SysydTlYZFNKZ0JGV2Fwc1FqN3hrTy9I?=
 =?utf-8?B?ek9RUmNQMXQrZDgxOFdFa0JTZGJDOGt6U1F3d3dySVk3cTJURlNIRXRaNzBD?=
 =?utf-8?B?UUpIYUoybktkS1ErWmVzYTRRRUNPRmpGOEFyQ1NFL3BxZVI5YzRJbGxoUzY3?=
 =?utf-8?B?d0hBYzFPSDJlT1VST3Q5R0RjSGRZK25uUlQrZDFEUW5NMDhFUTVJUExOb0dZ?=
 =?utf-8?B?UHI2YmVLbVRVNzNRdWMrSSt0MTM5ZW5yKytFeU1XeWZlK1JhK2lGZGZ1RXZj?=
 =?utf-8?B?VHRFc24xRUdZanYrS05SaFNRV1VLYWdCM3Q2cWFabVhMOFppQzRIUGxMVjNo?=
 =?utf-8?B?NTJyVzJ6dWJWQmppY1pZRU0ydlpmOTBXS1d4S0d6TzNsVStYYkZTUFlyVlB0?=
 =?utf-8?B?T0krZFc2cnlIalI1ay94RVQ5NFFJTy8weDVuQXVtWVZCUTJENE9jU2RIZHRC?=
 =?utf-8?B?Z1F2dzBVRUFsVzdoVTJad2tsekU0TkduWElURDUzSms2U3VOWDhWTUIvVTF0?=
 =?utf-8?B?NEVhdjRlRWVWc1hBVjkydi9FdTBoemhGZFJ5angrOGJjTXZ4cnVSaGp4Z2NC?=
 =?utf-8?B?a0hKK1FHa01BbXZ0a1R0cDRtR2drZFAzbE43Y0wyNmxKdVpSTXB0TGxHNExo?=
 =?utf-8?B?VEhiY2lOODhiU0V4UUhGVnRLQXJtSks1N0RQeExEMHdaOXJEWVMxZi9ZSGdI?=
 =?utf-8?B?ZHNrU1pPVGp3czFzNmdiVFp0QlZ6anZkbE1rNzQrSTZJK0Q2NEhKcC96Y2FC?=
 =?utf-8?B?U2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e6e71d1-c072-42da-8ed7-08de17f385d7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 20:33:02.4439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eInWd2cIDPKEuM4s1D1gKkARHx5XZ9xjt/rALQwNVSlEt6RD+mF/l1HYl8jDP/ZCXVLbIy/atyDQiKP2OIhjYzAPOFt1UlitR8XJLYn2mU0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4817
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

In upcoming changes, SR-IOV VF migration data will be extended beyond
GuC data and exported to userspace using VFIO interface (with a
vendor-specific variant driver) and a device-level debugfs interface.
Remove the GT-level debugfs.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 47 ---------------------
 1 file changed, 47 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
index 838beb7f6327f..5278ea4fd6552 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
@@ -327,9 +327,6 @@ static const struct {
 	{ "stop", xe_gt_sriov_pf_control_stop_vf },
 	{ "pause", xe_gt_sriov_pf_control_pause_vf },
 	{ "resume", xe_gt_sriov_pf_control_resume_vf },
-#ifdef CONFIG_DRM_XE_DEBUG_SRIOV
-	{ "restore!", xe_gt_sriov_pf_migration_restore_guc_state },
-#endif
 };
 
 static ssize_t control_write(struct file *file, const char __user *buf, size_t count, loff_t *pos)
@@ -393,47 +390,6 @@ static const struct file_operations control_ops = {
 	.llseek		= default_llseek,
 };
 
-/*
- *      /sys/kernel/debug/dri/BDF/
- *      ├── sriov
- *      :   ├── vf1
- *          :   ├── tile0
- *              :   ├── gt0
- *                  :   ├── guc_state
- */
-
-static ssize_t guc_state_read(struct file *file, char __user *buf,
-			      size_t count, loff_t *pos)
-{
-	struct dentry *dent = file_dentry(file);
-	struct dentry *parent = dent->d_parent;
-	struct xe_gt *gt = extract_gt(parent);
-	unsigned int vfid = extract_vfid(parent);
-
-	return xe_gt_sriov_pf_migration_read_guc_state(gt, vfid, buf, count, pos);
-}
-
-static ssize_t guc_state_write(struct file *file, const char __user *buf,
-			       size_t count, loff_t *pos)
-{
-	struct dentry *dent = file_dentry(file);
-	struct dentry *parent = dent->d_parent;
-	struct xe_gt *gt = extract_gt(parent);
-	unsigned int vfid = extract_vfid(parent);
-
-	if (*pos)
-		return -EINVAL;
-
-	return xe_gt_sriov_pf_migration_write_guc_state(gt, vfid, buf, count);
-}
-
-static const struct file_operations guc_state_ops = {
-	.owner		= THIS_MODULE,
-	.read		= guc_state_read,
-	.write		= guc_state_write,
-	.llseek		= default_llseek,
-};
-
 /*
  *      /sys/kernel/debug/dri/BDF/
  *      ├── sriov
@@ -568,9 +524,6 @@ static void pf_populate_gt(struct xe_gt *gt, struct dentry *dent, unsigned int v
 
 		/* for testing/debugging purposes only! */
 		if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
-			debugfs_create_file("guc_state",
-					    IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV) ? 0600 : 0400,
-					    dent, NULL, &guc_state_ops);
 			debugfs_create_file("config_blob",
 					    IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV) ? 0600 : 0400,
 					    dent, NULL, &config_blob_ops);
-- 
2.50.1

