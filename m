Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E76BF9178
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 00:43:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 046A010E661;
	Tue, 21 Oct 2025 22:43:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Acc0QfSo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C7710E666;
 Tue, 21 Oct 2025 22:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761086613; x=1792622613;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Tgbejy08OphQtC8W7zcbHBPINxjYHXBxlW6Jgh+9LeI=;
 b=Acc0QfSo8x7dxDGCl1AgP1odJj/Ng1q8CZ9YBMla+ol1vgttZLHMiaIm
 r2CqgKSZn+Vfnb5GYDgiZQKCDwAprpsyKbOMi17stkILUENR7cMO01s9c
 PCHR5dQqjjvcVTh/67t/6DZKZt/uhk0Zjrq7ZmWecybCNHp+u1XxNIk1t
 8Paa56t5X9QVtDlC+rwmCurNKsKR44v66+yBXXybMv6rL9CsxJ5ta8Y1c
 oPAtNZ2UEKXbaBU1eNnywNzoVPcS0RHOyittVFc2o0WGCOnn9vb1Fe1IN
 +3V+xfTOi0rcd8P8YDZ5rNbGPmUCMcwWQagEkWiZDTz+Xxp2LCqoK3NDv w==;
X-CSE-ConnectionGUID: 9HEE2zYdSDWCo1oTiNcdZA==
X-CSE-MsgGUID: IB+TCEQyRcmxAHGbjrD3VQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62255838"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="62255838"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:43:33 -0700
X-CSE-ConnectionGUID: K5JQTEM/S6+VhZRthbYaQg==
X-CSE-MsgGUID: sPaT4PEcQ9W5e5hHR5HtLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="183410247"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:43:32 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 15:43:32 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 15:43:32 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.56) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 15:43:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ccbDY9Dt2H2+N7Zdl+7Xr5bs5cE8Xq1+69l3UPmAlgI3CbXYDMnmhNp22oSfy6RH1JUghFoFQWElxWbulmXyMbsNSx8uByL6WxvJRwPRozSsxaBCcjrSFoAkXmHbeqDtJ8ZUfEFRoH9IYXBD4AXW5aEnpa46sv0bBAJCCWmzGO7BdHbKjKcUOhzewOMxLFgVEWHD+CCVuIT8lXdX96dNaFdrgsDtFYwm4sVQfi5c85s+rrnr/JunsUHE1ZwRnfTcQhaN33qOXf9xERTg9zeUGLvV6qKyMohCuiy2zrwPDs5uJ/YlDP7XCvn+QqRRPJgaxe21KY0RYdSEd7mw8eHdvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Qa5w5T8djEhnbwB5LFCx05Nhtl7hSkFyuR5+0S92bI=;
 b=F0iVw5c8RMKF2i7Ypk7LtpqiiP+9e6t7FoMV9g5u7jb+bQ2CVvwM76WO08fDeUJbgJyOTFfY7tObPxGq19yiRo0VPCWJRSBewgMsxofxXxkF15BQrd0zG8LhJbCEce7AYRQ3prVEZTTnwbVNlytJmCVE5mRmgrHDvo6MpNQcAGYO8FuUyb//gbJld3f5/nKVRLC+ts6I9mCrBnISF/z1vBv1rKO76mKsourw/WgOIPfi+nm3PCdOJrjvAKXh0pTzTxc0B2fhwRkEOAkiYTq1Yh9VDvPhmXml0ghNzl+0KXCTYs/1meoKVvyELHRrwwrISD4TtvogJrc+l2BYUnaMiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM3PPFF28037229.namprd11.prod.outlook.com (2603:10b6:f:fc00::f5f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Tue, 21 Oct
 2025 22:43:30 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9253.011; Tue, 21 Oct 2025
 22:43:30 +0000
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
Subject: [PATCH v2 17/26] drm/xe/pf: Handle GGTT migration data as part of PF
 control
Date: Wed, 22 Oct 2025 00:41:24 +0200
Message-ID: <20251021224133.577765-18-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251021224133.577765-1-michal.winiarski@intel.com>
References: <20251021224133.577765-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0102CA0092.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::33) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM3PPFF28037229:EE_
X-MS-Office365-Filtering-Correlation-Id: da23adb0-a4ce-4133-f124-08de10f3419f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OTNhUVpiWHlhQjU4QkZVTERWZUdwVGlYWis4aU9tSk5rckV2amRWb3pVTGs3?=
 =?utf-8?B?dTlKM3M3Z05uNCtxYTFJWVpkQWtwem45bS80VGpZcVRFb1RMTFdVd0xETy9n?=
 =?utf-8?B?SUd5RWRkNCtDY044aTlURi9nZS9oKzV3K1VENXhPSDV5OTY0cEhrNEsyS2FY?=
 =?utf-8?B?eThRZWJwakNoNktmWXc0ck8yaVJZS3EvSmpvdDVNdWt2eDN4YWlKWTlRd01X?=
 =?utf-8?B?TDJibHVTVFBPdjN0UDlUVk9BanR0VHFPNjdEdlZtK3Q1cm10MnV6MlBleS9q?=
 =?utf-8?B?b0lyVmJjdVRFWEJuVTJQZDRnUmtwcllHZTdxSUJDcXliUnRvZEluQVkrRE1R?=
 =?utf-8?B?bTN6OGhIMGFmL3ZLWS9wTzlWNG5KWmFyVGphdXMzcG95K3pQeEJJTTZnZFVO?=
 =?utf-8?B?VE9jdyt5TkwyN0JnYURLa0lGRWh5SFZFaktobkMwajdBWisxcUdKSzhhT2or?=
 =?utf-8?B?djBQY0FSN0hDTmhUUFBUaGRwNk5yVUdMK2wzTTN2ZDVWdmdQWmJkd1FsRnh6?=
 =?utf-8?B?U1dTU1lMQWdVTW9CMHpTSDZHWThWR29CTUo0NTlsSUxQV2ZJQSs3bDhMblds?=
 =?utf-8?B?TzlUQ0c3L2FmakRWNmRqWStrUk9KWVpZUTYzYUZtR2pkakNOUEUxZ05CaVBq?=
 =?utf-8?B?WUZoOHk0TWlrR1NsVWJuWDFnTEsvL0g1TGxuZ25pa3Rpb3dwL293NU5NOFA3?=
 =?utf-8?B?VkVCcFdwbEpFMitVQjZvVmxVOEI3Nk1BNkNQczFUK0htZ1dFQ2thSmx4dXZh?=
 =?utf-8?B?d2Rza0Ixd2pjU3hKM0JTRnIwL0hPUCtwMnFKT1duODdnTUlEUjEwSUZoZmJH?=
 =?utf-8?B?bFdQZGZkWHQrL2tHbFJmZmcyRjM2SEdvOEZ1RU9NWUxmRWpxVEhUWmlBbzJP?=
 =?utf-8?B?eFdnRnphWDBka2g4MHRWQk5wL2FPbzZtRjVWYmIvN0RZVVYwN0FSRUlLdExp?=
 =?utf-8?B?UUhmbXR2a2JJdWkwMWVOL3hWbDhKY0p6V0srUHJWc0dpV2ZBN0pTbzRrem9o?=
 =?utf-8?B?ckpEZEZvSFBhR3VqWjdpODJoTWtXTG1uTndjQjZ0WnYwTGZnN0lJZWJpbkV4?=
 =?utf-8?B?NjBUL0xBR1BkV3BxblpkZXJKTEZWcXRtNENXTlJUTkcwaktLMXJBektnT3R3?=
 =?utf-8?B?Zkw2SStFYXVxNFhYZzRLUDFoYkRnU0doUXFYUWsxaFVXZFIvb0VIY2owbCs1?=
 =?utf-8?B?RWN3aXNSbzRBTWc2YnlCeFJucWxwUmY2dSt1NFJtOUR6OGlINlptNlV2cXQr?=
 =?utf-8?B?NDd4ZkpaTU9tR1JDUDZHSkxacEpuQTkyOW5yK1lLRndrMEpxTWphQ0R3NHN6?=
 =?utf-8?B?ZXRyeVkyZ3RFWDE3dXRQZ2szSnZOWFVXbC9DUEwwTk93ditZUTlpSUVNb3hr?=
 =?utf-8?B?aEVkNWpqQ1Bod0pHR3VDK0p3bG9oZTZUNWw5bkhPQ3Z6TUp5K2IrbW40ZU1m?=
 =?utf-8?B?cjNkdHlLVHFlWU13N2NKeXdmUnU1Sk8xd1JqbXIwaGlFYmxTQ1Jlc2J2Y3RW?=
 =?utf-8?B?QlFScjhlcWU0T1JqN0JvSWFhZkN2YTZjUnJqSnEwM3pObjNxR2U0TFBmZHJa?=
 =?utf-8?B?eDUxSUJwZkJHNnNzZExGSXZxWW00bTFCbGF6WkJWLzdQV3REUkE5alc5WjBC?=
 =?utf-8?B?bXUyclJlaC9HZnpZRWZDVWFOeDZnLzdiNGtGc0FVOVV3OHNPYkFyYU5nNnkz?=
 =?utf-8?B?Z3YzQ2hWVmNaSFR2bkNqUzZBSk12eDE5WFUrNmYxcnplbkZqNmJyNDQzQ3A4?=
 =?utf-8?B?UXJBdjJrUjdkVmZDRUovdHoyVHRXYmhTN0RndmljZlR2WnhmU09zQVRhd2xD?=
 =?utf-8?B?MEVERUw3M21BV3hRQlpLaXR6TkhxU3dYT242Q1ZaUTVoZUZXODIza05CZ0xV?=
 =?utf-8?B?U2N3SkYzYzd3cDFkdFRkbW5rZiswaUtGUDFqbTlTY3p2MFZWZncrcmxHZExM?=
 =?utf-8?B?dkkxWDJNNHhpYnVPMXJIR0QxZTRlVFNFSVpqZWVxa0dkeHRrL254VVZoUDVX?=
 =?utf-8?Q?7niW9LUtWeMPB8VHI1XGUgkRa+lRnU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUJDL2dtVGxtTFB1TFR6ZGZ6N0o1NCthMXVyMGJjb0pHb1lwL0hHOVVMbEsv?=
 =?utf-8?B?M3NMMzMxcEd1L1gyMHdRN1pnWkRmdEJKQmUyZmx1MG4xc3pmWDdnZkNUeEc4?=
 =?utf-8?B?Q3FGTkt1QmViS3RGQk93UEswSjFGRFMzd3NIcFM2MXVOTzFkMmhPemVRQ1cy?=
 =?utf-8?B?cVRLUEQ1WkNtdmZyUEtjcm90UFRlMHNRUi9NRjV5cVg2eENFK3U4SGFNWnFp?=
 =?utf-8?B?OHJ6alNFNzVXSngxMlAwdkNJS0NoRlNTeDg1TGtFbTFLRmU0T1JjdjE5Vnpu?=
 =?utf-8?B?Y2JTb3BweXdNbmhPUWp2QzU4NEc5TkhzYk54KzBWZUQ4Z3JObnlFdnJUUjFz?=
 =?utf-8?B?aWl1UDhnNjFGSGk5VnkrbTRlbjM0WnczRU1NeWc1aXJ6VHBBekJTL0ZQcFpa?=
 =?utf-8?B?TTdyWHgya1RZZ0NKVVJML2dUMUtqcE9mUFc1aGp2VkE0ZEJUNS9qVm9vbDRG?=
 =?utf-8?B?Skk2OXlqdnplT3BMbGRHclQyNGdlYXgzQVVSQStwUXptelpsY1gxY0k4c3Jr?=
 =?utf-8?B?WHYyKzBJS0Z6OUdVaXJBdU1KNEVHRU9tYy9mdk5qNEdob2JYSkdqMHNUeG5k?=
 =?utf-8?B?djhmOXlrMFZrZldVQy9rWEgvbHZCM0FPNDRMR3dSaElJWlRGNlVQN3pvbjNh?=
 =?utf-8?B?L2VzbXdWWHpXd2hFZVd2bzAwTzZKYk1sNmNUL2ZHTXk5M0sxME90Z21KeGhk?=
 =?utf-8?B?SEREVFpBVzBUMjZVM0w4YWx5TTE0eFZ0S0RXN1h6UmxDUTVRZStjUlVMRWY5?=
 =?utf-8?B?SFFYKzl4NzRtblVDRjZnZE15WW1YWm1aS0NzSk5VVjRMVzZ5VU10a3NTUFhT?=
 =?utf-8?B?RU8zQnBFUU54TlkxV0VkLzFuM290eXpNQ05YczlKRWFLQlFMZ2c4Ny9mVzJv?=
 =?utf-8?B?YlJtUklqQXBFbDZvTW56ZWh4WnNXb09IQnhIcGFJd1NCdkt4NTFpMWM0c3Jj?=
 =?utf-8?B?cTRhZWNNbkJuWFdvVjhENFR0eGpZZXJ6cks0OUhaWGYvSzBtdzNlL3dSZTJ5?=
 =?utf-8?B?Z2NjYTVFK1FKaGt6UzVWQVJIWmNpZ1RxT2Y4bnp2U1I4ZXUraFFGbVEyVlpO?=
 =?utf-8?B?RnMzK2JzU1BLSkU4dU92YWZXTFZzWS8ycy9SQlBzazdpUGFkaUVVaGFXbE1D?=
 =?utf-8?B?TU1hdGxyeGxMMStTeEVoRmtySm9WenNqMlVwd2ZuTUJsY29TbDhrbmtwOUtw?=
 =?utf-8?B?TnI5d3RDdWRYckpzTDNaRzJSQXhVOGNDMlo3QXd5aFhFd2w3SUNMckFpd0lJ?=
 =?utf-8?B?U0Y4R05KMklYTmt2TFM1amhxdS9RT1UxZGRteXE1dXBsSlRTak9OcjB4Lysz?=
 =?utf-8?B?SDNWZng0cEJvTTVhYVZhaXBscmdLcW5XMHNDaXlQTXg1ekN2WHgxbGdDZm5H?=
 =?utf-8?B?Q2swajRKcmNwTTdlY1dicDZFMW5HSzBwSWVBK0dvcXJDMjJPZ2YrenpwemRS?=
 =?utf-8?B?VXFEUDcvMGQweUg5SzZMZExjWXlYTGkzR0N3RFRzalZ4Wlg5cVFpdENSZTc1?=
 =?utf-8?B?ekVpcHJDMXM5Smkvak16b1pXSlROTjhJWURXYlM2QmlFYTlCanh4Wk5wQjNz?=
 =?utf-8?B?Rk0zM054a1ZTRnNxTG5HR2hRYzQ3Zkp4ZHc0QURqTlJuNzRtODRwNGZFalYw?=
 =?utf-8?B?bjNxNmxJckI4T2JZeU9DSnpoOFNGWXNtUytyUUVPTSs2SklobnBZQVVJRktC?=
 =?utf-8?B?a0RIRFBpM3diRGtxN3FMVm9rUjV3S0huMmxLdW5SRENZcnRlR1phYmhHRFln?=
 =?utf-8?B?dVFlWG1LckpKWHEvYkRpa3ArT21xcFNINzBERUxNRFg4SFI3OHhpTHppL1p3?=
 =?utf-8?B?VC95V0JJcGwzUEUrWjVOblUrbTFnUGhYalpTSWdFQ0F4bTRPbldFMzFCRE5q?=
 =?utf-8?B?eFVZMHNldzlZUzYyOE8zNWhWTWNnN1E1SDVZN3R3V3lyNlJmNElRQU11VUZB?=
 =?utf-8?B?WVZWc21aUmtlZ0dPYlE1YmsvT1pSNmlQYVB5M0pudzZ3UHJmSnpNMFR1aW5Z?=
 =?utf-8?B?Mkkxc3I4Q0tsTk5KM3N6WlZUcEg1eUlIaUJyNVlQcmNKOHhMeGtBRk1RS1I4?=
 =?utf-8?B?cGpKdDdXZVJvT1lLMm1janhML0M1MTRnaG8vdENCMUpIYUF4OXp3L1duNTFK?=
 =?utf-8?B?bVJ1c3MrNUNhNVlQeWFKT3pDalMrNVdKVWJvSVlKZllrSkJ0ZzdqalNTMTdN?=
 =?utf-8?B?SHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da23adb0-a4ce-4133-f124-08de10f3419f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 22:43:29.8969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QPlVhjTaCtQbj/qOA2Tv66DyDfLFxcMIo8i0bg9KOZMtutGxjZ1vtdCDQ3HPhm2ZBv1INl+BeTS3bHP/bW+c1LsoO0rmU4vSh66iWUAQPrI=
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

Connect the helpers to allow save and restore of GGTT migration data in
stop_copy / resume device state.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |  16 +++
 .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |   2 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 118 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |   4 +
 4 files changed, 140 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index 18f6e3028d4f0..f5c215fb93c5a 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -189,6 +189,7 @@ static const char *control_bit_to_string(enum xe_gt_sriov_control_bits bit)
 	CASE2STR(SAVE_PROCESS_DATA);
 	CASE2STR(SAVE_WAIT_DATA);
 	CASE2STR(SAVE_DATA_GUC);
+	CASE2STR(SAVE_DATA_GGTT);
 	CASE2STR(SAVE_DATA_DONE);
 	CASE2STR(SAVE_FAILED);
 	CASE2STR(SAVED);
@@ -827,6 +828,7 @@ static void pf_exit_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA);
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_GUC);
+		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_GGTT);
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE);
 	}
 }
@@ -859,6 +861,17 @@ static int pf_handle_vf_save_data(struct xe_gt *gt, unsigned int vfid)
 		ret = xe_gt_sriov_pf_migration_guc_save(gt, vfid);
 		if (ret)
 			return ret;
+
+		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_GGTT);
+		return -EAGAIN;
+	}
+
+	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_GGTT)) {
+		if (xe_gt_sriov_pf_migration_ggtt_size(gt, vfid) > 0) {
+			ret = xe_gt_sriov_pf_migration_ggtt_save(gt, vfid);
+			if (ret)
+				return ret;
+		}
 	}
 
 	return 0;
@@ -1065,6 +1078,9 @@ pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid)
 	xe_gt_assert(gt, data);
 
 	switch (data->type) {
+	case XE_SRIOV_MIGRATION_DATA_TYPE_GGTT:
+		ret = xe_gt_sriov_pf_migration_ggtt_restore(gt, vfid, data);
+		break;
 	case XE_SRIOV_MIGRATION_DATA_TYPE_GUC:
 		ret = xe_gt_sriov_pf_migration_guc_restore(gt, vfid, data);
 		break;
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
index 8b951ee8a24fe..1e8fa3f8f9be8 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
@@ -34,6 +34,7 @@
  * @XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA: indicates that VF migration data is being produced.
  * @XE_GT_SRIOV_STATE_SAVE_WAIT_DATA: indicates that PF awaits for space in migration data ring.
  * @XE_GT_SRIOV_STATE_SAVE_DATA_GUC: indicates PF needs to save VF GuC migration data.
+ * @XE_GT_SRIOV_STATE_SAVE_DATA_GGTT: indicates PF needs to save VF GGTT migration data.
  * @XE_GT_SRIOV_STATE_SAVE_DATA_DONE: indicates that all migration data was produced by Xe.
  * @XE_GT_SRIOV_STATE_SAVE_FAILED: indicates that VF save operation has failed.
  * @XE_GT_SRIOV_STATE_SAVED: indicates that VF data is saved.
@@ -78,6 +79,7 @@ enum xe_gt_sriov_control_bits {
 	XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA,
 	XE_GT_SRIOV_STATE_SAVE_WAIT_DATA,
 	XE_GT_SRIOV_STATE_SAVE_DATA_GUC,
+	XE_GT_SRIOV_STATE_SAVE_DATA_GGTT,
 	XE_GT_SRIOV_STATE_SAVE_DATA_DONE,
 	XE_GT_SRIOV_STATE_SAVE_FAILED,
 	XE_GT_SRIOV_STATE_SAVED,
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index 594178fbe36d0..75e965f75f6a7 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -7,6 +7,9 @@
 
 #include "abi/guc_actions_sriov_abi.h"
 #include "xe_bo.h"
+#include "xe_ggtt.h"
+#include "xe_gt.h"
+#include "xe_gt_sriov_pf_config.h"
 #include "xe_gt_sriov_pf_control.h"
 #include "xe_gt_sriov_pf_helpers.h"
 #include "xe_gt_sriov_pf_migration.h"
@@ -37,6 +40,114 @@ static void pf_dump_mig_data(struct xe_gt *gt, unsigned int vfid,
 	}
 }
 
+/**
+ * xe_gt_sriov_pf_migration_ggtt_size() - Get the size of VF GGTT migration data.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: size in bytes or a negative error code on failure.
+ */
+ssize_t xe_gt_sriov_pf_migration_ggtt_size(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!xe_gt_is_main_type(gt))
+		return 0;
+
+	return xe_ggtt_pte_size(gt->tile->mem.ggtt, xe_gt_sriov_pf_config_get_ggtt(gt, vfid));
+}
+
+static int pf_save_vf_ggtt_mig_data(struct xe_gt *gt, unsigned int vfid)
+{
+	struct xe_sriov_migration_data *data;
+	size_t size;
+	int ret;
+
+	size = xe_gt_sriov_pf_migration_ggtt_size(gt, vfid);
+	if (size == 0)
+		return 0;
+
+	data = xe_sriov_migration_data_alloc(gt_to_xe(gt));
+	if (!data)
+		return -ENOMEM;
+
+	ret = xe_sriov_migration_data_init(data, gt->tile->id, gt->info.id,
+					   XE_SRIOV_MIGRATION_DATA_TYPE_GGTT, 0, size);
+	if (ret)
+		goto fail;
+
+	ret = xe_gt_sriov_pf_config_ggtt_save(gt, vfid, data->vaddr, size);
+	if (ret)
+		goto fail;
+
+	pf_dump_mig_data(gt, vfid, data);
+
+	ret = xe_gt_sriov_pf_migration_save_produce(gt, vfid, data);
+	if (ret)
+		goto fail;
+
+	return 0;
+
+fail:
+	xe_sriov_migration_data_free(data);
+	xe_gt_sriov_err(gt, "Failed to save VF%u GGTT data (%pe)\n", vfid, ERR_PTR(ret));
+	return ret;
+}
+
+static int pf_restore_vf_ggtt_mig_data(struct xe_gt *gt, unsigned int vfid,
+				       struct xe_sriov_migration_data *data)
+{
+	int ret;
+
+	pf_dump_mig_data(gt, vfid, data);
+
+	ret = xe_gt_sriov_pf_config_ggtt_restore(gt, vfid, data->vaddr, data->size);
+	if (ret) {
+		xe_gt_sriov_err(gt, "Failed to restore VF%u GGTT data (%pe)\n",
+				vfid, ERR_PTR(ret));
+		return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * xe_gt_sriov_pf_migration_ggtt_save() - Save VF GGTT migration data.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_migration_ggtt_save(struct xe_gt *gt, unsigned int vfid)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid != PFID);
+	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
+
+	return pf_save_vf_ggtt_mig_data(gt, vfid);
+}
+
+/**
+ * xe_gt_sriov_pf_migration_ggtt_restore() - Restore VF GGTT migration data.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_migration_ggtt_restore(struct xe_gt *gt, unsigned int vfid,
+					  struct xe_sriov_migration_data *data)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid != PFID);
+	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
+
+	return pf_restore_vf_ggtt_mig_data(gt, vfid, data);
+}
+
 /* Return: number of dwords saved/restored/required or a negative error code on failure */
 static int guc_action_vf_save_restore(struct xe_guc *guc, u32 vfid, u32 opcode,
 				      u64 addr, u32 ndwords)
@@ -290,6 +401,13 @@ ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid)
 		size += sizeof(struct xe_sriov_pf_migration_hdr);
 	total += size;
 
+	size = xe_gt_sriov_pf_migration_ggtt_size(gt, vfid);
+	if (size < 0)
+		return size;
+	else if (size > 0)
+		size += sizeof(struct xe_sriov_pf_migration_hdr);
+	total += size;
+
 	return total;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
index b3c18e369df79..09abdd9e82e10 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
@@ -19,6 +19,10 @@ ssize_t xe_gt_sriov_pf_migration_guc_size(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_migration_guc_save(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_migration_guc_restore(struct xe_gt *gt, unsigned int vfid,
 					 struct xe_sriov_migration_data *data);
+ssize_t xe_gt_sriov_pf_migration_ggtt_size(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_migration_ggtt_save(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_migration_ggtt_restore(struct xe_gt *gt, unsigned int vfid,
+					  struct xe_sriov_migration_data *data);
 
 ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid);
 
-- 
2.50.1

